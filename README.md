# Sistema Declarativo de Gestión de ACLs para Proyectos Samba

## 1. Propósito

Este repositorio implementa un sistema declarativo, idempotente y auditable para la gestión de permisos ACL POSIX sobre un entorno de proyectos alojados en un servidor Linux (Ubuntu) con almacenamiento compartido vía Samba.

El objetivo principal es estandarizar y automatizar la asignación de permisos por perfil (disciplinas) y proyecto, evitando configuraciones manuales repetitivas, inconsistencias entre servidores y errores humanos en producción.

El sistema está diseñado para operar correctamente incluso cuando:
- Algunos proyectos no existen en el servidor actual.
- Algunas especialidades no están presentes aún o existen en otras máquinas.
- Los usuarios o grupos provienen de Samba, AD o LDAP.

## 2. Alcance funcional

El sistema permite:
- Aplicar permisos ACL POSIX (setfacl) de forma declarativa.
- Ejecutar múltiples veces sin efectos acumulativos (idempotencia).
- Simular cambios mediante modo DRY-RUN antes de aplicar en producción.
- Respaldar y restaurar ACLs completas del árbol de proyectos.
- Registrar todas las acciones en logs estructurados.

No crea carpetas ni usuarios. Solo actúa sobre recursos existentes.

## 3. Estructura del repositorio

```text
├── config/
│   ├── projects.conf          # Lista declarativa de proyectos válidos
│   ├── users.conf             # Usuarios y grupos a los que se aplican ACL
│   └── rules.d/
│       └── *.rules            # Reglas declarativas de permisos (input principal)
├── scripts/
│   ├── apply_acls.sh          # Motor de aplicación de ACLs
│   ├── validate.sh            # Validaciones previas (usuarios, rutas, base)
│   └── backup_restore_acl.sh  # Backup y restauración completa de ACLs
├── logs/
│   └── apply_acls.log         # Registro de ejecuciones y resultados
└── README.md                  # Documentación del sistema
```

### Descripción general

- **config/**  
  Contiene toda la configuración declarativa. Ningún permiso se define en los scripts.

- **rules.d/*.rules**  
  Fuente de verdad del sistema. Cada línea representa una regla ACL auditable.

- **scripts/**  
  Implementan validación, simulación, aplicación real y rollback.

- **logs/**  
  Garantizan trazabilidad completa.



## 4. Flujo de ejecución

Entrada:
- Archivos de configuración declarativa.
- Estado actual del filesystem.

Proceso:
1. Validación básica del entorno.
2. Lectura de reglas.
3. Resolución de rutas.
4. Verificación de existencia.
5. Aplicación de ACLs.
6. Registro en logs.

Salida:
- ACLs aplicadas.
- Logs detallados.


## 5. Uso (flujo operativo controlado)

### 5.1 Backup previo (OBLIGATORIO)

```bash
sudo ./scripts/backup_restore_acl.sh backup \
  /srv/samba/02_Proyectos \
  /root/acl_before_$(date +%Y%m%d_%H%M).facl
```

### 5.2 Simulación (DRY-RUN)

```bash
sudo DRY_RUN=1 ./scripts/apply_acls.sh
```

### 5.3 Ejecución real

```bash
sudo ./scripts/apply_acls.sh
```

### 5.4 Rollback (restauración)

```bash
sudo ./scripts/backup_restore_acl.sh restore \
  / \
  /root/acl_before_YYYYMMDD_HHMM.facl
```

### Reglas operativas

- Nunca ejecutar sin backup.
- Siempre ejecutar DRY-RUN antes.
- No aplicar ACLs manualmente fuera del sistema.

## 6. Requisitos técnicos

- Ubuntu Linux
- Filesystem con soporte ACL (ext4)
- Paquete acl instalado
- Ejecución con privilegios sudo


