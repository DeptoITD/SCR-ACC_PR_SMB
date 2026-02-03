#!/usr/bin/env bash
set -euo pipefail

# scripts/validate.sh
# Validación ligera previa a aplicar ACLs.
#
# Diseño intencional:
# - NO falla por proyectos inexistentes (pueden existir en otras máquinas).
# - NO falla por usuarios/grupos no resueltos localmente (pueden venir de AD/LDAP/Samba).
# - Sí falla si BASE no existe, porque ahí no hay nada que hacer.

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# shellcheck source=/dev/null
source "${REPO_DIR}/config/projects.conf"
# shellcheck source=/dev/null
source "${REPO_DIR}/config/users.conf"

echo "[VALIDATE] BASE: ${BASE}"

if [[ -z "${BASE:-}" || ! -d "${BASE}" ]]; then
  echo "[ERROR] BASE no existe o no es directorio: ${BASE}"
  exit 1
fi

# Proyectos: solo advertencia
for p in "${PROJECTS[@]}"; do
  if [[ ! -d "${BASE}/${p}" ]]; then
    echo "[WARN] Proyecto no existe (se omitirá en iteraciones): ${BASE}/${p}"
  fi
done

# Usuarios/Grupos: solo advertencia (pueden venir de AD/LDAP/Samba)
for u in "${ACL_USERS[@]}"; do
  if ! getent passwd "${u}" >/dev/null 2>&1 && ! getent group "${u}" >/dev/null 2>&1; then
    echo "[WARN] Usuario/Grupo no resuelto por getent (puede ser normal en Samba/AD): ${u}"
  fi
done

echo "[OK] Validación completada (warnings no bloquean ejecución)."
