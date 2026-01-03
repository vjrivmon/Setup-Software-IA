# Contributing to Setup Software IA

Gracias por tu interés en contribuir a este proyecto. Aquí encontrarás las guías
para hacerlo de forma efectiva.

## Tabla de Contenidos

- [Código de Conducta](#código-de-conducta)
- [Cómo Contribuir](#cómo-contribuir)
- [Reportar Bugs](#reportar-bugs)
- [Proponer Features](#proponer-features)
- [Pull Requests](#pull-requests)
- [Estándares de Código](#estándares-de-código)
- [Añadir Agentes o Skills](#añadir-agentes-o-skills)

## Código de Conducta

Este proyecto y todos sus participantes están gobernados por nuestro
[Código de Conducta](CODE_OF_CONDUCT.md). Al participar, se espera que respetes
este código.

## Cómo Contribuir

### Reportar Bugs

Si encuentras un bug, por favor abre un issue con:

1. **Título descriptivo**: Resume el problema en una línea
2. **Descripción detallada**: Explica qué esperabas vs qué ocurrió
3. **Pasos para reproducir**: Lista numerada de acciones
4. **Entorno**: OS, versión de Claude Code, etc.
5. **Logs relevantes**: Si aplica, incluye mensajes de error

### Proponer Features

Para proponer nuevas funcionalidades:

1. Abre un issue con el tag `enhancement`
2. Describe el problema que resuelve
3. Proporciona ejemplos de uso
4. Indica si estás dispuesto a implementarlo

### Pull Requests

1. **Fork** el repositorio
2. **Crea una rama** desde `main`:
   ```bash
   git checkout -b feature/mi-feature
   ```
3. **Haz tus cambios** siguiendo los estándares de código
4. **Escribe tests** si aplica
5. **Commit** usando Conventional Commits:
   ```bash
   git commit -m "feat: añadir nuevo agente de seguridad"
   ```
6. **Push** a tu fork:
   ```bash
   git push origin feature/mi-feature
   ```
7. **Abre un PR** describiendo tus cambios

## Estándares de Código

### General

- Código en **inglés**, documentación en **español**
- Nombres descriptivos, sin abreviaciones
- Funciones de máximo 50 líneas
- Comentar el **por qué**, no el **qué**

### Markdown (Agentes, Skills, Commands)

- Usar headers jerárquicos (`#`, `##`, `###`)
- Incluir ejemplos de código cuando sea útil
- Tablas para información estructurada
- Frontmatter YAML cuando sea necesario

### Scripts (Hooks)

- Shebang: `#!/bin/bash`
- `set -e` para fallar en errores
- Comentarios explicando lógica compleja
- Variables en MAYÚSCULAS

## Añadir Agentes o Skills

### Nuevo Agente

1. Crear directorio en `.claude/agents/<nn>-<nombre>/`
2. Crear `AGENT.md` con la siguiente estructura:

```markdown
# Nombre del Agente

## Identidad

[Descripción del rol y responsabilidades]

## Herramientas Permitidas

- Tool1
- Tool2

## Proceso

1. Paso 1
2. Paso 2

## Checklist de Salida

- [ ] Verificación 1
- [ ] Verificación 2

## Ejemplos

[Código de ejemplo]
```

### Nuevo Skill

1. Crear directorio en `.claude/skills/<nombre>/`
2. Crear `SKILL.md` con frontmatter:

```yaml
---
name: mi-skill
description: Descripción corta del skill
allowed-tools: Tool1, Tool2, Tool3
---
# Instrucciones del Skill

[Contenido del skill]
```

### Nuevo Comando

1. Crear archivo en `.claude/commands/<nombre>.md`
2. Incluir frontmatter y descripción:

```yaml
---
name: mi-comando
description: Descripción del comando
---
# Instrucciones

[Lo que hace el comando]
```

## Preguntas

Si tienes dudas, abre un issue con el tag `question` o contacta al mantenedor.

---

Gracias por contribuir a mejorar este proyecto.
