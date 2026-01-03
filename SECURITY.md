# Security Policy

## Versiones Soportadas

| Versión | Soportada          |
| ------- | ------------------ |
| 1.x     | :white_check_mark: |

## Reportar una Vulnerabilidad

Si descubres una vulnerabilidad de seguridad, por favor **NO** abras un issue
público.

### Proceso de Reporte

1. **Envía un email** a [vicente@tudominio.com] con:
   - Descripción detallada de la vulnerabilidad
   - Pasos para reproducirla
   - Impacto potencial
   - Sugerencias de mitigación (si las tienes)

2. **Tiempo de respuesta**: Recibirás confirmación en 48 horas

3. **Proceso de resolución**:
   - Confirmaremos la vulnerabilidad
   - Trabajaremos en un fix
   - Te notificaremos cuando esté resuelto
   - Te daremos crédito en el CHANGELOG (si lo deseas)

## Medidas de Seguridad Incluidas

Este template incluye varias medidas de seguridad por defecto:

### Hooks de Validación

El hook `pre-tool-validate.sh` bloquea comandos peligrosos:

```bash
# Comandos bloqueados
rm -rf /
sudo rm -rf
chmod 777
```

### Protección de Secretos

- `.gitignore` configurado para ignorar:
  - Archivos `.env`
  - `credentials.json`
  - Claves privadas (`*.pem`, `*.key`)

- Variables de entorno con valores por defecto seguros en `.mcp.json`

### Principios de Seguridad

1. **Mínimo privilegio**: Los agentes solo tienen acceso a las herramientas
   necesarias
2. **Validación de entrada**: Hooks validan comandos antes de ejecutar
3. **No secretos en código**: Usar siempre variables de entorno

## Buenas Prácticas

Al usar este template, sigue estas recomendaciones:

1. **Nunca** commitear archivos `.env` con secretos reales
2. **Siempre** usar `.env.example` para documentar variables necesarias
3. **Revisar** los hooks antes de ejecutar comandos desconocidos
4. **Actualizar** dependencias regularmente
5. **Usar** HTTPS para todas las conexiones externas

## Alcance

Esta política aplica a:

- El repositorio template
- Los agentes incluidos
- Los hooks de automatización
- Los skills y comandos

## Agradecimientos

Agradecemos a todos los investigadores de seguridad que ayudan a mantener este
proyecto seguro.
