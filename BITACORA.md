# Bitácora del Sistema de Gestión de ACLs

## Contexto inicial

La gestión de permisos se realizaba manualmente mediante comandos setfacl repetitivos, con alto riesgo de error, baja trazabilidad e inconsistencias entre proyectos y servidores.

## Decisión 1: Modelo declarativo

Se adoptó un modelo basado en reglas declarativas versionadas en Git, permitiendo auditoría, control de cambios y repetibilidad.

## Decisión 2: Tolerancia a inexistencias

Se definió que proyectos y especialidades pueden no existir en un servidor específico. El sistema no debe fallar por ello.

## Decisión 3: DRY-RUN obligatorio

Se incorporó un modo de simulación para validar impacto antes de producción, reduciendo riesgos operativos.

## Decisión 4: Separación de responsabilidades

Cada script cumple una función específica:
- apply_acls.sh: lógica principal.
- validate.sh: validación ligera.
- backup_restore_acl.sh: seguridad operativa.

## Decisión 5: Backup como estándar

El backup previo se definió como paso obligatorio antes de cualquier ejecución real.

## Estado actual

Sistema funcional, ACLs verificadas, scripts listos para producción y documentación alineada con la implementación.

## Próximos pasos
- Automatizar generación de reglas desde matrices.
- Integrar en pipelines controlados.
- Generar reportes de ejecución.
