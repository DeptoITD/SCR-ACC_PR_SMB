#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

INI_FILE="${INI_FILE:-${REPO_DIR}/config/rules.d/acls.ini}"

echo "[VALIDATE] 🧪 Iniciando validación del entorno (INI=${INI_FILE})"

fail=0

die_soft() {
  echo "[ERROR] ❌ $*"
  fail=1
}

warn() {
  echo "[WARN] ⚠️  $*"
}

ok() {
  echo "[OK] ✅ $*"
}

# 1) INI existe
if [[ ! -f "${INI_FILE}" ]]; then
  echo "[ERROR] ❌ INI no existe: ${INI_FILE}"
  exit 1
fi
ok "INI existe"

# 2) binarios mínimos
command -v setfacl >/dev/null 2>&1 || die_soft "setfacl no está instalado (paquete acl)"
command -v getfacl >/dev/null 2>&1 || warn "getfacl no está instalado (recomendado para diagnóstico)"
command -v getent  >/dev/null 2>&1 || die_soft "getent no está disponible"
command -v awk     >/dev/null 2>&1 || die_soft "awk no está disponible"
ok "binarios mínimos OK"

# 3) Parse mínimo del INI para GLOBAL.root + SPECIALTIES + perfiles
ROOT=""
WIP_FOLDER="01_WIP"
PROJECT_GLOB="*"
specialties_count=0
profiles_count=0

section=""

while IFS= read -r raw || [[ -n "$raw" ]]; do
  line="${raw#"${raw%%[![:space:]]*}"}"
  line="${line%"${line##*[![:space:]]}"}"

  [[ -z "$line" ]] && continue
  [[ "$line" =~ ^\; ]] && continue
  [[ "$line" =~ ^# ]] && continue

  if [[ "$line" =~ ^\[(.+)\]$ ]]; then
    section="${BASH_REMATCH[1]}"
    if [[ "$section" != "GLOBAL" && "$section" != "SPECIALTIES" ]]; then
      ((profiles_count++))
    fi
    continue
  fi

  if [[ "$section" == "GLOBAL" && "$line" == *"="* ]]; then
    key="${line%%=*}"; val="${line#*=}"
    key="${key// /}"; val="${val#"${val%%[![:space:]]*}"}"
    case "$key" in
      root) ROOT="$val" ;;
      wip_folder) WIP_FOLDER="$val" ;;
      project_glob) PROJECT_GLOB="$val" ;;
    esac
  fi

  if [[ "$section" == "SPECIALTIES" ]]; then
    line="${line%%;*}"
    line="${line#"${line%%[![:space:]]*}"}"
    [[ -n "$line" ]] && ((specialties_count++))
  fi
done < "${INI_FILE}"

[[ -n "$ROOT" ]] || die_soft "GLOBAL.root no está definido en el INI"
if [[ -n "$ROOT" ]]; then
  if [[ -d "$ROOT" ]]; then
    ok "GLOBAL.root existe: $ROOT"
  else
    die_soft "GLOBAL.root no existe o no es directorio: $ROOT"
  fi
fi

if [[ "$specialties_count" -gt 0 ]]; then
  ok "SPECIALTIES encontradas: $specialties_count"
else
  die_soft "No hay SPECIALTIES en el INI"
fi

if [[ "$profiles_count" -gt 0 ]]; then
  ok "Perfiles detectados (secciones): $profiles_count"
else
  die_soft "No hay perfiles (secciones) en el INI"
fi

# 4) Check de expansión de proyectos
shopt -s nullglob
# shellcheck disable=SC2206
PROJECT_PATHS=( ${ROOT}/${PROJECT_GLOB} )
shopt -u nullglob

if [[ "${#PROJECT_PATHS[@]}" -gt 0 ]]; then
  ok "Proyectos matcheados por glob: ${#PROJECT_PATHS[@]}"
else
  warn "No hay proyectos que matcheen ${ROOT}/${PROJECT_GLOB} (puede ser normal si es otro server)"
fi

# Resultado
if [[ "$fail" -ne 0 ]]; then
  echo "[FAIL] ❌ Validación falló. Corrige antes de aplicar ACLs."
  exit 2
fi

echo "[OK] ✅ Validación completada correctamente"
