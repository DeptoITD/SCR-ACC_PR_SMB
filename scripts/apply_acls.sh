#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Config base
INI_FILE="${INI_FILE:-${REPO_DIR}/config/rules.d/acls.ini}"
LOG_DIR="${REPO_DIR}/logs"
LOG_FILE="${LOG_DIR}/apply_acls.log"
mkdir -p "${LOG_DIR}"

DRY_RUN="${DRY_RUN:-0}"
DEFAULT_ON_NONRECURSIVE_DIRS="${DEFAULT_ON_NONRECURSIVE_DIRS:-1}"
CONSOLE_MODE="${CONSOLE_MODE:-compact}"  # compact | verbose

# -------------------------
# Logging (SIN pipes/tee)
# -------------------------
ts() { date -Is; }

_log_line() {
  # $1=LEVEL, $2=MSG
  local level="$1"
  local msg="$2"
  local line="[$level] $(ts) $msg"

  # siempre al archivo
  printf "%s\n" "$line" >> "${LOG_FILE}"

  # a consola (según modo)
  # - compact: INFO resumido, WARN/ERROR siempre
  # - verbose: todo
  case "${CONSOLE_MODE}" in
    verbose)
      printf "%s\n" "$line"
      ;;
    compact)
      if [[ "$level" == "ERROR" || "$level" == "WARN" || "$level" == "OK" ]]; then
        printf "%s\n" "$line"
      else
        # INFO en compact solo si trae icono o es resumen útil
        # (tú puedes ajustar esto si quieres aún menos)
        printf "%s\n" "$line"
      fi
      ;;
    *)
      printf "%s\n" "$line"
      ;;
  esac
}

log_info() { _log_line "INFO"  "ℹ️  $*"; }
log_warn() { _log_line "WARN"  "⚠️  $*"; }
log_err()  { _log_line "ERROR" "❌ $*"; }
log_ok()   { _log_line "OK"    "✅ $*"; }

die() { log_err "$*"; exit 1; }

# Trap para saber EXACTAMENTE dónde revienta
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
  # Loguea el comando. En DRY_RUN no ejecuta.
  log_info "🧾 [CMD] $*"
  if [[ "${DRY_RUN}" == "1" ]]; then
    return 0
  fi
  "$@"
}

# --- u: vs g: ---
resolve_acl_subject() {
  local raw="$1"
  local kind="u"
  local name="$raw"

  # Si viene prefijado (u:IND_A o g:IND_A), se respeta
  if [[ "$raw" =~ ^[ug]: ]]; then
    kind="${raw%%:*}"
    name="${raw#*:}"
    printf "%s:%s" "$kind" "$name"
    return 0
  fi

  # Si existe como grupo, preferimos grupo
  if getent group "$raw" >/dev/null 2>&1; then
    kind="g"
  elif getent passwd "$raw" >/dev/null 2>&1; then
    kind="u"
  else
    # fallback: usuario
    kind="u"
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

apply_acl_one() {
  local subject="$1"    # u:NAME o g:NAME
  local perms="$2"      # rwx, r-x, rx, etc.
  local abs_path="$3"
  local recursive="$4"  # true/false

  local kind="${subject%%:*}"
  local name="${subject#*:}"

  if [[ "${recursive}" == "true" ]]; then
    run_cmd setfacl -R -m "${kind}:${name}:${perms}" "${abs_path}"
    run_cmd setfacl -R -d -m "${kind}:${name}:${perms}" "${abs_path}"
  else
    run_cmd setfacl -m "${kind}:${name}:${perms}" "${abs_path}"
    if [[ -d "${abs_path}" && "${DEFAULT_ON_NONRECURSIVE_DIRS}" == "1" ]]; then
      run_cmd setfacl -d -m "${kind}:${name}:${perms}" "${abs_path}"
    fi
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
declare -A PROFILE_read

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
          base_project) PROFILE_base_project["$section"]="$val" ;;
          base_wip) PROFILE_base_wip["$section"]="$val" ;;
          wip_full_control) PROFILE_wip_full_control["$section"]="$val" ;;
          write) PROFILE_write["$section"]="$val" ;;
          read) PROFILE_read["$section"]="$val" ;;
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
log_info "🚀 Iniciando apply_acls (DRY_RUN=${DRY_RUN}) INI=${INI_FILE} CONSOLE_MODE=${CONSOLE_MODE}"

# Validaciones básicas
command -v setfacl >/dev/null 2>&1 || die "setfacl no está instalado o no está en PATH"
command -v getent  >/dev/null 2>&1 || die "getent no está disponible (paquete libc-bin / glibc tools)"

parse_ini

ROOT="${GLOBAL[root]:-}"
PROJECT_GLOB="${GLOBAL[project_glob]:-*}"
WIP_FOLDER="${GLOBAL[wip_folder]:-01_WIP}"

[[ -n "${ROOT}" ]] || die "GLOBAL.root no definido en INI"
[[ -d "${ROOT}" ]] || die "ROOT no existe o no es directorio: ${ROOT}"
[[ "${#SPECIALTIES[@]}" -gt 0 ]] || die "No hay SPECIALTIES en el INI"

# Detectar perfiles
declare -a PROFILES
for p in \
  "${!PROFILE_base_project[@]}" \
  "${!PROFILE_base_wip[@]}" \
  "${!PROFILE_wip_full_control[@]}" \
  "${!PROFILE_write[@]}" \
  "${!PROFILE_read[@]}"
do
  PROFILES+=("$p")
done
mapfile -t PROFILES < <(printf "%s\n" "${PROFILES[@]}" | awk '!seen[$0]++' | sort)
[[ "${#PROFILES[@]}" -gt 0 ]] || die "No hay perfiles en el INI (secciones tipo [IND_*])"

# Expandir proyectos existentes
shopt -s nullglob
# shellcheck disable=SC2206
PROJECT_PATHS=( ${ROOT}/${PROJECT_GLOB} )
shopt -u nullglob
[[ "${#PROJECT_PATHS[@]}" -gt 0 ]] || die "No hay proyectos que matcheen: ${ROOT}/${PROJECT_GLOB}"

log_info "📁 Proyectos encontrados: ${#PROJECT_PATHS[@]}"
log_info "👥 Perfiles encontrados: ${#PROFILES[@]}"

# Contadores para resumen (para que no “adivines” si funcionó)
APPLIED=0
SKIPPED_NO_WIP=0
SKIPPED_NO_SP=0

for profile in "${PROFILES[@]}"; do
  local_base_project="${PROFILE_base_project[$profile]:-${GLOBAL[base_project]:-rx}}"
  local_base_wip="${PROFILE_base_wip[$profile]:-${GLOBAL[base_wip]:-rx}}"
  local_wip_full="${PROFILE_wip_full_control[$profile]:-}"
  local_write="${PROFILE_write[$profile]:-}"
  local_read="${PROFILE_read[$profile]:-}"

  subject="$(resolve_acl_subject "$profile")"
  warn_if_unknown_subject "$profile" "$subject"

  log_info "🧩 Perfil=${profile} subject=${subject} base_project=${local_base_project} base_wip=${local_base_wip} wip_full=${local_wip_full:-N/A}"

  unset is_write || true
  declare -A is_write
  if [[ -n "$local_write" ]]; then
    declare -a write_list
    split_csv "$local_write" write_list
    for sp in "${write_list[@]}"; do
      [[ -n "$sp" ]] && is_write["$sp"]=1
    done
  fi

  for proj_path in "${PROJECT_PATHS[@]}"; do
    [[ -d "$proj_path" ]] || continue
    proj_name="$(basename "$proj_path")"

    log_info "📌 Proyecto=${proj_name} (base + WIP)"

    # base_project
    apply_acl_one "$subject" "$local_base_project" "$proj_path" "false"
    ((APPLIED++))
    log_ok "📍 base_project: ${profile} ${local_base_project} ${proj_path}"

    wip_path="${proj_path}/${WIP_FOLDER}"
    if [[ ! -d "$wip_path" ]]; then
      ((SKIPPED_NO_WIP++))
      log_warn "📁 WIP no existe (se omite): ${wip_path}"
      continue
    fi

    # base_wip
    apply_acl_one "$subject" "$local_base_wip" "$wip_path" "false"
    ((APPLIED++))
    log_ok "🧷 base_wip: ${profile} ${local_base_wip} ${wip_path}"

    if [[ -n "$local_wip_full" ]]; then
      apply_acl_one "$subject" "$local_wip_full" "$wip_path" "true"
      ((APPLIED++))
      log_ok "🔓 wip_full_control: ${profile} ${local_wip_full} ${wip_path} (recursivo)"
      continue
    fi

    for sp in "${SPECIALTIES[@]}"; do
      sp_path="${wip_path}/${sp}"
      if [[ ! -e "$sp_path" ]]; then
        ((SKIPPED_NO_SP++))
        continue
      fi

      if [[ "${is_write[$sp]+x}" ]]; then
        apply_acl_one "$subject" "rwx" "$sp_path" "true"
        ((APPLIED++))
        log_ok "✍️ WRITE: ${profile} rwx ${sp_path}"
      else
        if [[ "$local_read" == "ALL_EXCEPT_WRITE" ]]; then
          apply_acl_one "$subject" "r-x" "$sp_path" "true"
          ((APPLIED++))
          log_ok "👀 READ: ${profile} r-x ${sp_path}"
        fi
      fi
    done
  done
done

log_ok "📊 Resumen: APPLIED=${APPLIED} SKIPPED_NO_WIP=${SKIPPED_NO_WIP} SKIPPED_NO_SPECIALTY_PATH=${SKIPPED_NO_SP}"
log_info "🏁 apply_acls finalizado"
