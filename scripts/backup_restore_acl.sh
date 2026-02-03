#!/usr/bin/env bash
set -euo pipefail

# scripts/backup_restore_acl.sh
# Backup/Restore de ACLs POSIX.
#
# Uso:
#   sudo ./scripts/backup_restore_acl.sh backup  /srv/samba/02_Proyectos /root/acl_before.facl
#   sudo ./scripts/backup_restore_acl.sh restore /root/acl_before.facl
#
# Notas:
# - Backup usa getfacl -R --absolute-names para rutas absolutas.
# - Restore usa setfacl --restore (restaura EXACTAMENTE las rutas dentro del .facl).
# - Restore es destructivo: sobrescribe ACLs según el archivo.
#
# Variables:
#   FORCE=1   -> omite confirmación en restore.

cmd="${1:-}"
arg1="${2:-}"
arg2="${3:-}"

FORCE="${FORCE:-0}"

case "${cmd}" in
  backup)
    target="${arg1:-}"
    file="${arg2:-}"

    if [[ -z "${target}" || -z "${file}" ]]; then
      echo "Uso: $0 backup <ruta_objetivo> <archivo_salida.facl>"
      exit 1
    fi

    if [[ ! -d "${target}" ]]; then
      echo "[ERROR] Ruta objetivo no existe: ${target}"
      exit 2
    fi

    # Seguridad básica del archivo resultante
    umask 077

    echo "[BACKUP] Exportando ACLs de: ${target}"
    getfacl -R --absolute-names "${target}" > "${file}"
    echo "[OK] Backup generado: ${file}"
    ;;

  restore)
    file="${arg1:-}"

    if [[ -z "${file}" ]]; then
      echo "Uso: $0 restore <archivo_entrada.facl>"
      exit 1
    fi

    if [[ ! -f "${file}" ]]; then
      echo "[ERROR] Archivo .facl no existe: ${file}"
      exit 2
    fi

    echo "[RESTORE] Restaurando ACLs desde: ${file}"
    echo "[WARN] Esto sobrescribirá ACLs de las rutas contenidas en el archivo."

    if [[ "${FORCE}" != "1" ]]; then
      read -r -p "Escribe 'yes' para continuar: " confirm
      if [[ "${confirm}" != "yes" ]]; then
        echo "[ABORT] Restore cancelado."
        exit 0
      fi
    fi

    setfacl --restore="${file}"
    echo "[OK] Restore completado."
    ;;

  *)
    echo "Uso:"
    echo "  $0 backup  <ruta_objetivo> <archivo_salida.facl>"
    echo "  $0 restore <archivo_entrada.facl>"
    echo ""
    echo "Opcional: FORCE=1 para omitir confirmación en restore."
    exit 1
    ;;
esac
