#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# -------------------------
# Config base
# -------------------------
# FIX 1: ruta real del INI según tu repo (config/acls.ini)
INI_FILE="${INI_FILE:-${REPO_DIR}/config/acls.ini}"

LOG_DIR="${REPO_DIR}/logs"
LOG_FILE="${LOG_DIR}/apply_acls.log"
mkdir -p "${LOG_DIR}"

DRY_RUN="${DRY_RUN:-0}"
CONSOLE_MODE="${CONSOLE_MODE:-compact}"     # compact | verbose
DEFAULT_ON_NONRECURSIVE_DIRS="${DEFAULT_ON_NONRECURSIVE_DIRS:-1}"

# Si quieres velocidad en árboles enormes, pon SIMPLE_RECURSIVE=1 para usar setfacl -R
# (por defecto hacemos find para separar dir/file y no meter 'x' en archivos)
SIMPLE_RECURSIVE="${SIMPLE_RECURSIVE:-0}"

# -------------------------
# Logging (sin pipes/tee)
# -------------------------
ts() { date -Is; }

_log_line() {
  local level="$1"; shift
  local msg="$*"
  local line="[$level] $(ts) $msg"
  printf "%s\n" "$line" >> "${LOG_FILE}"
  printf "%s\n" "$line"
}

log_info() { _log_line "INFO"  "ℹ️  $*"; }
log_warn() { _log_line "WARN"  "⚠️  $*"; }
log_err()  { _log_line "ERROR" "❌ $*"; }
log_ok()   { _log_line "OK"    "✅ $*"; }

die() { log_err "$*"; exit 1; }

trap 'rc=$?; log_err "💥 Abortado (exit=$rc) en línea ${LINENO}: ${BASH_COMMAND}"; exit $rc' ERR

# -------------------------
# Helpers
# -------------------------
trim() {
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  printf "%s" "$s"
}

run_cmd() {
  log_info "🧾 [CMD] $*"
  [[ "${DRY_RUN}" == "1" ]] && return 0
  "$@"
}

resolve_acl_subject() {
  local raw="$1"
  local kind="u"

  # Si viene prefijado (u:IND_A o g:IND_A), se respeta
  if [[ "$raw" =~ ^[ug]: ]]; then
    printf "%s" "$raw"
    return 0
  fi

  # Si existe como grupo, preferimos grupo
  if getent group "$raw" >/dev/null 2>&1; then
    kind="g"
  elif getent passwd "$raw" >/dev/null 2>&1; then
    kind="u"
  else
    kind="u"  # fallback (Samba/LDAP/AD podrían resolverlo)
  fi

  printf "%s:%s" "$kind" "$raw"
}

warn_if_unknown_subject() {
  local raw="$1"
  local subj="$2"
  local name="${subj#*:}"
  if ! getent passwd "${name}" >/dev/null 2>&1 && ! getent group "${name}" >/dev/null 2>&1; then
    log_warn "👤 '${raw}' no existe en getent (se intentará igual: Samba/LDAP/AD podrían resolverlo)."
  fi
}

apply_acl_nonrec() {
  local subject="$1" perms="$2" path="$3"
  local kind="${subject%%:*}" name="${subject#*:}"

  run_cmd setfacl -m "${kind}:${name}:${perms}" "${path}"
  if [[ -d "${path}" && "${DEFAULT_ON_NONRECURSIVE_DIRS}" == "1" ]]; then
    run_cmd setfacl -d -m "${kind}:${name}:${perms}" "${path}"
  fi
}

# Aplica ACL recursivo separando dirs y files (mejor control)
apply_acl_tree_split() {
  local subject="$1" dir_perms="$2" file_perms="$3" def_dir="$4" def_file="$5" path="$6"
  local kind="${subject%%:*}" name="${subject#*:}"

  if [[ "${DRY_RUN}" == "1" ]]; then
    log_info "🧾 [CMD] find '${path}' -type d -exec setfacl -m ${kind}:${name}:${dir_perms} {} +"
    log_info "🧾 [CMD] find '${path}' -type d -exec setfacl -d -m ${kind}:${name}:${def_dir} {} +"
    log_info "🧾 [CMD] find '${path}' -type f -exec setfacl -m ${kind}:${name}:${file_perms} {} +"
    log_info "🧾 [CMD] find '${path}' -type f -exec setfacl -d -m ${kind}:${name}:${def_file} {} +"
    return 0
  fi

  # -xdev evita cruzar otros mounts; -P evita seguir symlinks
  find -P "${path}" -xdev -type d -exec setfacl -m "${kind}:${name}:${dir_perms}" {} +
  find -P "${path}" -xdev -type d -exec setfacl -d -m "${kind}:${name}:${def_dir}" {} +

  find -P "${path}" -xdev -type f -exec setfacl -m "${kind}:${name}:${file_perms}" {} +
  find -P "${path}" -xdev -type f -exec setfacl -d -m "${kind}:${name}:${def_file}" {} +
}

# Recursivo simple (rápido, menos fino)
apply_acl_tree_simple() {
  local subject="$1" perms="$2" path="$3"
  local kind="${subject%%:*}" name="${subject#*:}"

  run_cmd setfacl -R -m "${kind}:${name}:${perms}" "${path}"
  run_cmd setfacl -R -d -m "${kind}:${name}:${perms}" "${path}"
}

# Deny explícito recursivo (para invisibilidad vía Samba)
apply_deny_tree() {
  local subject="$1" path="$2"

  if [[ "${SIMPLE_RECURSIVE}" == "1" ]]; then
    apply_acl_tree_simple "${subject}" "---" "${path}"
  else
    apply_acl_tree_split "${subject}" "---" "---" "---" "---" "${path}"
  fi
}

# -------------------------
# Parse INI
# -------------------------
declare -A GLOBAL
declare -a SPECIALTIES

declare -A PROFILE_base_project
declare -A PROFILE_base_wip
declare -A PROFILE_wip_full_control
declare -A PROFILE_write

parse_ini() {
  [[ -f "${INI_FILE}" ]] || die "INI no existe: ${INI_FILE}"

  local section=""
  while IFS= read -r raw || [[ -n "$raw" ]]; do
    local line
    line="$(trim "$raw")"

    [[ -z "$line" ]] && continue
    [[ "$line" =~ ^\; ]] && continue
    [[ "$line" =~ ^# ]] && continue

    if [[ "$line" =~ ^\[(.+)\]$ ]]; then
      section="${BASH_REMATCH[1]}"
      continue
    fi

    if [[ "$section" == "SPECIALTIES" ]]; then
      line="${line%%;*}"
      line="$(trim "$line")"
      [[ -z "$line" ]] && continue
      SPECIALTIES+=("$line")
      continue
    fi

    if [[ "$line" == *"="* ]]; then
      local key="${line%%=*}"
      local val="${line#*=}"
      key="$(trim "$key")"
      val="$(trim "$val")"

      if [[ "$section" == "GLOBAL" ]]; then
        GLOBAL["$key"]="$val"
      else
        case "$key" in
          base_project)     PROFILE_base_project["$section"]="$val" ;;
          base_wip)         PROFILE_base_wip["$section"]="$val" ;;
          wip_full_control) PROFILE_wip_full_control["$section"]="$val" ;;
          write)            PROFILE_write["$section"]="$val" ;;
          *) : ;;
        esac
      fi
    fi
  done < "${INI_FILE}"
}

split_csv() {
  local csv="$1"
  local -n out="$2"
  out=()
  IFS=',' read -r -a out <<< "$csv"
  for i in "${!out[@]}"; do
    out[$i]="$(trim "${out[$i]}")"
  done
}

# -------------------------
# MAIN
# -------------------------
log_info "🚀 Iniciando apply_acls (DRY_RUN=${DRY_RUN}) INI=${INI_FILE} CONSOLE_MODE=${CONSOLE_MODE} SIMPLE_RECURSIVE=${SIMPLE_RECURSIVE}"

command -v setfacl >/dev/null 2>&1 || die "setfacl no está instalado o no está en PATH"
command -v getent  >/dev/null 2>&1 || die "getent no está disponible (paquete libc-bin / glibc tools)"
command -v find    >/dev/null 2>&1 || die "find no está disponible"

parse_ini

ROOT="${GLOBAL[root]:-}"
PROJECT_GLOB="${GLOBAL[project_glob]:-*}"
WIP_FOLDER="${GLOBAL[wip_folder]:-01_WIP}"

BASE_ROOT_DEFAULT="${GLOBAL[base_root]:-rx}"
BASE_PROJECT_DEFAULT="${GLOBAL[base_project]:-rx}"
BASE_WIP_DEFAULT="${GLOBAL[base_wip]:-rx}"

WRITE_DIR="${GLOBAL[write_dir]:-rwx}"
WRITE_FILE="${GLOBAL[write_file]:-rw-}"
DEF_DIR="${GLOBAL[default_dir]:-${WRITE_DIR}}"
DEF_FILE="${GLOBAL[default_file]:-${WRITE_FILE}}"

HIDE_NON_WRITE="${GLOBAL[hide_non_write]:-1}"

[[ -n "${ROOT}" ]] || die "GLOBAL.root no definido en INI"
[[ -d "${ROOT}" ]] || die "ROOT no existe o no es directorio: ${ROOT}"
[[ "${#SPECIALTIES[@]}" -gt 0 ]] || die "No hay SPECIALTIES en el INI"

# Safety rail (hard)
EXPECTED_ROOT="/srv/samba/02_Proyectos"
[[ "${ROOT}" == "${EXPECTED_ROOT}" ]] || die "ROOT='${ROOT}' no coincide con EXPECTED_ROOT='${EXPECTED_ROOT}'. Abortando."

# Perfiles (secciones encontradas)
declare -a PROFILES
for p in \
  "${!PROFILE_base_project[@]}" \
  "${!PROFILE_base_wip[@]}" \
  "${!PROFILE_wip_full_control[@]}" \
  "${!PROFILE_write[@]}"
do
  PROFILES+=("$p")
done
mapfile -t PROFILES < <(printf "%s\n" "${PROFILES[@]}" | awk '!seen[$0]++' | sort)
[[ "${#PROFILES[@]}" -gt 0 ]] || die "No hay perfiles en el INI"

# Proyectos existentes
shopt -s nullglob
# shellcheck disable=SC2206
PROJECT_PATHS=( ${ROOT}/${PROJECT_GLOB} )
shopt -u nullglob
[[ "${#PROJECT_PATHS[@]}" -gt 0 ]] || die "No hay proyectos que matcheen: ${ROOT}/${PROJECT_GLOB}"

log_info "📁 Proyectos encontrados: ${#PROJECT_PATHS[@]}"
log_info "👥 Perfiles encontrados: ${#PROFILES[@]}"

APPLIED=0
SKIPPED_NO_WIP=0
SKIPPED_NO_SP=0

for profile in "${PROFILES[@]}"; do
  base_project="${PROFILE_base_project[$profile]:-${BASE_PROJECT_DEFAULT}}"
  base_wip="${PROFILE_base_wip[$profile]:-${BASE_WIP_DEFAULT}}"
  wip_full="${PROFILE_wip_full_control[$profile]:-}"
  write_csv="${PROFILE_write[$profile]:-}"

  subject="$(resolve_acl_subject "$profile")"
  warn_if_unknown_subject "$profile" "$subject"

  log_info "🧩 Perfil=${profile} subject=${subject} base_root=${BASE_ROOT_DEFAULT} base_project=${base_project} base_wip=${base_wip} wip_full=${wip_full:-N/A}"

  # FIX 2: dar permisos en el ROOT del share para listar proyectos
  apply_acl_nonrec "$subject" "${BASE_ROOT_DEFAULT}" "$ROOT"
  ((++APPLIED))
  log_ok "📍 base_root: ${profile} ${BASE_ROOT_DEFAULT} ${ROOT}"

  # build write set
  unset -v is_write 2>/dev/null || true
  declare -A is_write
  if [[ -n "${write_csv}" ]]; then
    declare -a write_list
    split_csv "${write_csv}" write_list
    for sp in "${write_list[@]}"; do
      [[ -n "$sp" ]] && is_write["$sp"]=1
    done
  fi

  for proj_path in "${PROJECT_PATHS[@]}"; do
    [[ -d "$proj_path" ]] || continue
    proj_name="$(basename "$proj_path")"
    wip_path="${proj_path}/${WIP_FOLDER}"

    log_info "📌 Proyecto=${proj_name} (base + WIP)"

    # base_project: listar y entrar al proyecto
    apply_acl_nonrec "$subject" "$base_project" "$proj_path"
    ((++APPLIED))
    log_ok "📍 base_project: ${profile} ${base_project} ${proj_path}"

    # WIP existe?
    if [[ ! -d "$wip_path" ]]; then
      ((++SKIPPED_NO_WIP))
      log_warn "📁 WIP no existe (se omite): ${wip_path}"
      continue
    fi

    # base_wip: que todos "vean WIP" (listar y entrar)
    apply_acl_nonrec "$subject" "$base_wip" "$wip_path"
    ((++APPLIED))
    log_ok "🧷 base_wip: ${profile} ${base_wip} ${wip_path}"

    # BIM: control total recursivo
    if [[ -n "$wip_full" ]]; then
      if [[ "${SIMPLE_RECURSIVE}" == "1" ]]; then
        apply_acl_tree_simple "$subject" "$wip_full" "$wip_path"
      else
        apply_acl_tree_split "$subject" "rwx" "rw-" "rwx" "rw-" "$wip_path"
      fi
      ((++APPLIED))
      log_ok "🔓 wip_full_control: ${profile} ${wip_full} ${wip_path} (recursivo)"
      continue
    fi

    # Perfiles restringidos: aplicar write y deny-by-default por especialidad
    for sp in "${SPECIALTIES[@]}"; do
      sp_path="${wip_path}/${sp}"
      [[ -e "$sp_path" ]] || { ((++SKIPPED_NO_SP)); continue; }

      if [[ "${is_write[$sp]+x}" ]]; then
        if [[ "${SIMPLE_RECURSIVE}" == "1" ]]; then
          apply_acl_tree_simple "$subject" "rwx" "$sp_path"
        else
          apply_acl_tree_split "$subject" "${WRITE_DIR}" "${WRITE_FILE}" "${DEF_DIR}" "${DEF_FILE}" "$sp_path"
        fi
        ((++APPLIED))
        log_ok "✍️ WRITE: ${profile} ${WRITE_DIR}/${WRITE_FILE} ${sp_path}"
      else
        if [[ "${HIDE_NON_WRITE}" == "1" ]]; then
          apply_deny_tree "$subject" "$sp_path"
          ((++APPLIED))
          log_ok "🙈 HIDDEN: ${profile} --- ${sp_path}"
        fi
      fi
    done
  done
done

log_ok "📊 Resumen: APPLIED=${APPLIED} SKIPPED_NO_WIP=${SKIPPED_NO_WIP} SKIPPED_NO_SPECIALTY_PATH=${SKIPPED_NO_SP}"
log_info "🏁 apply_acls finalizado"
