#!/usr/bin/env bash
set -euo pipefail

# scripts/apply_acls.sh
#
# Aplica ACLs desde reglas declarativas ubicadas en: config/rules.d/*.rules
#
# Formato por línea (separador ';'):
#   <usuario>;<permisos>;<ruta_relativa>;<recursivo>
#
# Ejemplos:
#   IND_A;rx;1288_UDQ;false
#   IND_A;rx;1288_UDQ/01_WIP;false
#   IND_A;rwx;1288_UDQ/01_WIP/A_ARQ;true
#
# Ideas clave del flujo:
#  1) Cargar config (BASE, usuarios, etc.)
#  2) Validar configuración (validate.sh)
#  3) Leer cada archivo *.rules
#  4) Por cada regla:
#      - validar campos
#      - construir ruta absoluta BASE + rel_path
#      - si NO existe -> omitir (esto soporta especialidades "futuras" u "otras máquinas")
#      - aplicar setfacl (normal o recursivo + default)
#  5) Log detallado y consistente.
#
# Notas de diseño:
# - Idempotente: puedes correrlo muchas veces sin que “acumule basura”
# - No crea carpetas: si no existe, no inventa nada
# - Default ACL solo cuando corresponde (en recursivo, o explícitamente si existe)

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# shellcheck source=/dev/null
source "${REPO_DIR}/config/projects.conf"
# shellcheck source=/dev/null
source "${REPO_DIR}/config/users.conf"

RULES_DIR="${REPO_DIR}/config/rules.d"
LOG_DIR="${REPO_DIR}/logs"
LOG_FILE="${LOG_DIR}/apply_acls.log"
mkdir -p "${LOG_DIR}"

# Ejecutar de verdad (producción)
 DRY_RUN="${DRY_RUN:-0}"

# -------------------------
# Helpers de logging
# -------------------------
ts() { date -Is; }

log_info() { echo "[INFO] $(ts) $*" | tee -a "${LOG_FILE}"; }
log_warn() { echo "[WARN] $(ts) $*" | tee -a "${LOG_FILE}"; }
log_err()  { echo "[ERROR] $(ts) $*" | tee -a "${LOG_FILE}"; }
log_ok()   { echo "[OK] $(ts) $*" | tee -a "${LOG_FILE}"; }

die() { log_err "$*"; exit 1; }

run_cmd() {
  # Ejecuta comando o lo imprime si DRY_RUN=1
  if [[ "${DRY_RUN}" == "1" ]]; then
    log_info "[DRY-RUN] $*"
  else
    "$@"
  fi
}

# -------------------------
# Validaciones pequeñas pero útiles
# -------------------------
is_bool() {
  [[ "$1" == "true" || "$1" == "false" ]]
}

is_perms() {
  # aceptamos combinaciones típicas: r, w, x, -, y en estilo setfacl (rx, rwx, r-x, etc.)
  [[ "$1" =~ ^[r-][w-][x-]$ || "$1" =~ ^(r|w|x|rw|rx|wx|rwx|r-x|rw-|r--|---|rx-|r-x)$ ]]
}

trim() {
  # trim espacios al inicio/fin
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  printf "%s" "$s"
}

# -------------------------
# Aplicación de ACL
# -------------------------
apply_acl() {
  local user="$1"
  local perms="$2"
  local abs_path="$3"
  local recursive="$4"

  # Si el usuario no está en tu catálogo, esto es un error de reglas/config, no del FS.
  # Si prefieres "warn y seguir", cámbialo.
  if ! getent passwd "${user}" >/dev/null 2>&1 && ! getent group "${user}" >/dev/null 2>&1; then
    log_warn "Usuario/Grupo '${user}' no existe en el sistema (getent). Regla se aplica igual si Samba lo resuelve, pero ojo."
  fi

  if [[ "${recursive}" == "true" ]]; then
    # Recursivo: ACL + Default ACL para herencia en todo lo creado dentro
    run_cmd setfacl -R -m "u:${user}:${perms}" "${abs_path}"
    run_cmd setfacl -R -d -m "u:${user}:${perms}" "${abs_path}"
  else
    # No recursivo: solo ACL del directorio/archivo existente.
    # Default ACL aquí es opcional: solo tiene sentido en directorios.
    run_cmd setfacl -m "u:${user}:${perms}" "${abs_path}"

    if [[ -d "${abs_path}" ]]; then
      # Si es directorio, ponemos default ACL para que lo nuevo herede.
      # Si por política NO quieres default aquí, borra este bloque.
      run_cmd setfacl -d -m "u:${user}:${perms}" "${abs_path}"
    fi
  fi
}

# -------------------------
# MAIN FLOW
# -------------------------
log_info "Iniciando apply_acls (DRY_RUN=${DRY_RUN})"

# Validación general del repo/config (si tu validate.sh hace más cosas, bien)
if [[ -x "${REPO_DIR}/scripts/validate.sh" ]]; then
  "${REPO_DIR}/scripts/validate.sh" | tee -a "${LOG_FILE}"
else
  log_warn "No existe validate.sh ejecutable, se omite validación previa."
fi

# Verificar BASE
if [[ -z "${BASE:-}" ]]; then
  die "BASE no está definido en config/projects.conf"
fi
if [[ ! -d "${BASE}" ]]; then
  die "BASE no existe o no es directorio: ${BASE}"
fi

# Cargar archivos de reglas
shopt -s nullglob
rule_files=("${RULES_DIR}"/*.rules)

if [[ "${#rule_files[@]}" -eq 0 ]]; then
  die "No hay archivos de reglas en ${RULES_DIR}"
fi

# Procesar cada archivo .rules
for rf in "${rule_files[@]}"; do
  log_info "Procesando reglas: ${rf}"

  # Leer línea a línea
  while IFS= read -r raw_line || [[ -n "${raw_line}" ]]; do
    # Quitar espacios finales, y trim completo
    line="$(trim "${raw_line}")"

    # Saltar vacías / comentarios
    [[ -z "${line}" ]] && continue
    [[ "${line}" =~ ^# ]] && continue

    # Parseo estricto por ';'
    IFS=';' read -r user perms rel_path recursive extra <<< "${line}"

    user="$(trim "${user:-}")"
    perms="$(trim "${perms:-}")"
    rel_path="$(trim "${rel_path:-}")"
    recursive="$(trim "${recursive:-}")"

    # Si vino "extra" significa que hay más de 4 campos (regla malformada)
    if [[ -n "${extra:-}" ]]; then
      log_warn "Regla inválida (demasiados campos): ${line}"
      continue
    fi

    # Validación campos mínimos
    if [[ -z "${user}" || -z "${perms}" || -z "${rel_path}" || -z "${recursive}" ]]; then
      log_warn "Regla inválida (faltan campos): ${line}"
      continue
    fi

    # Validación booleana
    if ! is_bool "${recursive}"; then
      log_warn "Regla inválida (recursive debe ser true/false): ${line}"
      continue
    fi

    # Validación permisos (ligera, para atrapar typos típicos)
    # Si quieres permitir 'rx' también, ya está cubierto por regex.
    if ! is_perms "${perms}"; then
      log_warn "Permisos sospechosos '${perms}' (revísalo). Regla: ${line}"
      # no abortamos, solo avisamos
    fi

    # Construir ruta absoluta
    abs_path="${BASE}/${rel_path}"

    # Requisito clave: si NO existe, se omite sin drama.
    if [[ ! -e "${abs_path}" ]]; then
      log_warn "Ruta no existe (se omite): ${abs_path}"
      continue
    fi

    # Aplicar ACL
    apply_acl "${user}" "${perms}" "${abs_path}" "${recursive}"

    log_ok "Aplicado: user=${user} perms=${perms} path=${abs_path} recursive=${recursive}"
  done < "${rf}"
done

log_info "apply_acls finalizado"
