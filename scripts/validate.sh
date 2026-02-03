#!/usr/bin/env bash
set -euo pipefail

# scripts/validate.sh
# Valida que existan rutas y usuarios antes de aplicar ACLs.

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# shellcheck source=/dev/null
source "${REPO_DIR}/config/projects.conf"
# shellcheck source=/dev/null
source "${REPO_DIR}/config/users.conf"

fail=0

# Validar BASE antes de usarla (porque con set -u revienta si no existe)
if [[ -z "${BASE:-}" ]]; then
  echo "[ERROR] BASE no está definida en config/projects.conf (ej: BASE=\"/srv/samba/02_Proyectos\")"
  exit 1
fi

echo "[VALIDATE] BASE: ${BASE}"

if [[ ! -d "${BASE}" ]]; then
  echo "[ERROR] BASE no existe: ${BASE}"
  exit 1
fi

for p in "${PROJECTS[@]}"; do
  if [[ ! -d "${BASE}/${p}" ]]; then
    echo "[WARN] Proyecto no existe en este servidor (se ignora): ${BASE}/${p}"
  fi
done

for u in "${ACL_USERS[@]}"; do
  if ! id "${u}" &>/dev/null; then
    echo "[ERROR] Usuario no existe en el sistema: ${u}"
    fail=1
  fi
done

if [[ "${fail}" -ne 0 ]]; then
  echo "[FAIL] Validación falló. No se aplican permisos."
  exit 2
fi

echo "[OK] Validación completada."
