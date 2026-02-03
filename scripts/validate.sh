#!/usr/bin/env bash
set -Eeuo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INI_FILE="${INI_FILE:-${REPO_DIR}/config/rules.d/acls.ini}"

fail=0

trap 'rc=$?; echo "[ERROR] ❌ Abortado (exit=$rc) en línea ${LINENO}: ${BASH_COMMAND}"; exit $rc' ERR

die_soft() { echo "[ERROR] ❌ $*"; fail=1; }
warn()     { echo "[WARN] ⚠️  $*"; }
ok()       { echo "[OK] ✅ $*"; }

echo "[VALIDATE] 🧪 Iniciando validación del entorno (INI=${INI_FILE})"

# 1) INI existe
if [[ ! -f "${INI_FILE}" ]]; then
  echo "[ERROR] ❌ INI no existe: ${INI_FILE}"
  exit 1
fi
ok "INI existe"

# 2) binarios mínimos
command -v setfacl >/dev/null 2>&1 || die_soft "setfacl no está instalado (paquete: acl)"
command -v getent  >/dev/null 2>&1 || die_soft "getent no está disponible"
command -v awk     >/dev/null 2>&1 || die_soft "awk no está disponible"
command -v bash    >/dev/null 2>&1 || die_soft "bash no está disponible (sí, pasa en contenedores raros)"
ok "binarios mínimos OK"

# Si ya falló por binarios, corta bonito
if [[ "$fail" -ne 0 ]]; then
  echo "[FAIL] ❌ Validación falló por dependencias."
  exit 2
fi

# 3) Parse mínimo del INI (GLOBAL.root + SPECIALTIES + perfiles)
ROOT=""
WIP_FOLDER="01_WIP"
PROJECT_GLOB="*"
specialties_count=0
profiles_count=0
section=""

# Nota: el %$'\r' elimina CRLF si viene de Windows
while IFS= read -r raw || [[ -n "$raw" ]]; do
  raw="${raw%$'\r'}"

  # trim simple (sin comandos externos)
  line="${raw#"${raw%%[![:space:]]*}"}"
  line="${line%"${line##*[![:space:]]}"}"

  [[ -z "$line" ]] && continue
  [[ "$line" == \;* ]] && continue
  [[ "$line" == \#* ]] && continue

  # sección
  if [[ "$line" =~ ^\[(.+)\]$ ]]; then
    section="${BASH_REMATCH[1]}"
    if [[ "$section" != "GLOBAL" && "$section" != "SPECIALTIES" ]]; then
      ((profiles_count+=1))
    fi
    continue
  fi

  # GLOBAL key=value
  if [[ "$section" == "GLOBAL" && "$line" == *"="* ]]; then
    key="${line%%=*}"
    val="${line#*=}"

    key="${key#"${key%%[![:space:]]*}"}"
    key="${key%"${key##*[![:space:]]}"}"
    val="${val#"${val%%[![:space:]]*}"}"
    val="${val%"${val##*[![:space:]]}"}"

    case "$key" in
      root) ROOT="$val" ;;
      wip_folder) WIP_FOLDER="$val" ;;
      project_glob) PROJECT_GLOB="$val" ;;
    esac
  fi

  # SPECIALTIES: una por línea
  if [[ "$section" == "SPECIALTIES" ]]; then
    # corta comentarios inline ";"
    item="${line%%;*}"
    item="${item#"${item%%[![:space:]]*}"}"
    item="${item%"${item##*[![:space:]]}"}"
    [[ -n "$item" ]] && ((specialties_count+=1))
  fi
done < "$INI_FILE"

# 4) Validaciones del contenido del INI
if [[ -z "$ROOT" ]]; then
  die_soft "GLOBAL.root no está definido en el INI"
else
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

# 5) Check de expansión de proyectos (solo si ROOT es válido)
if [[ -n "$ROOT" && -d "$ROOT" ]]; then
  shopt -s nullglob
  # shellcheck disable=SC2206
  PROJECT_PATHS=( ${ROOT}/${PROJECT_GLOB} )
  shopt -u nullglob

  if [[ "${#PROJECT_PATHS[@]}" -gt 0 ]]; then
    ok "Proyectos matcheados por glob (${PROJECT_GLOB}): ${#PROJECT_PATHS[@]}"
  else
    warn "No hay proyectos que matcheen ${ROOT}/${PROJECT_GLOB} (puede ser normal si es otro server)"
  fi

  ok "WIP folder configurado: ${WIP_FOLDER}"
fi

# Resultado final
if [[ "$fail" -ne 0 ]]; then
  echo "[FAIL] ❌ Validación falló. Corrige antes de aplicar ACLs."
  exit 2
fi

echo "[OK] ✅ Validación completada correctamente"
