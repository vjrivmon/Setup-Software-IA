# Setup Software IA

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/vjrivmon/Setup-Software-IA.svg)](https://github.com/vjrivmon/Setup-Software-IA/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/vjrivmon/Setup-Software-IA.svg)](https://github.com/vjrivmon/Setup-Software-IA/issues)

Sistema profesional de orquestación de agentes para Claude Code que transforma
ideas en MVPs funcionales mediante entrevistas profundas y agentes
especializados.

## Use This Template

1. Haz clic en el botón **"Use this template"** en la parte superior del
   repositorio
2. Nombra tu nuevo repositorio
3. Clona tu repositorio:
   ```bash
   git clone https://github.com/TU_USUARIO/TU_REPO.git
   cd TU_REPO
   ```
4. Personaliza `.claude/CLAUDE.md` con tu información
5. Inicia Claude Code y comienza a crear

---

## Tabla de Contenidos

- [Filosofía](#filosofía)
- [Quick Start](#quick-start)
- [Comandos Disponibles](#comandos-disponibles)
- [Arquitectura del Sistema](#arquitectura-del-sistema)
- [Los 7 Agentes](#los-7-agentes)
- [Stack por Defecto](#stack-por-defecto)
- [Hooks de Automatización](#hooks-de-automatización)
- [MCPs Configurados](#mcps-configurados)
- [Proceso de Entrevista](#proceso-de-entrevista)
- [Personalización](#personalización)
- [Contribuir](#contribuir)
- [Licencia](#licencia)
- [Autor](#autor)

## Filosofía

> "Read this SPEC.md and interview me in detail about literally anything:
> technical implementation, UI & UX, concerns, tradeoffs... but make sure the
> questions are not obvious - be very in-depth and continue interviewing me
> continually until it's complete" — Thariq Shihipar

## Quick Start

```bash
# 1. Clonar el template (o usar "Use this template" en GitHub)
git clone https://github.com/vjrivmon/Setup-Software-IA.git mi-proyecto
cd mi-proyecto

# 2. Iniciar Claude Code
claude

# 3. Comenzar entrevista para tu proyecto
/project:interview mi-app

# 4. Generar MVP completo
/project:mvp mi-app
```

## Comandos Disponibles

| Comando                       | Descripción                                                       |
| ----------------------------- | ----------------------------------------------------------------- |
| `/project:interview <nombre>` | Inicia entrevista profunda (20-40 preguntas) para generar SPEC.md |
| `/project:mvp <nombre>`       | Genera MVP completo desde SPEC existente                          |
| `/project:stack`              | Recomienda stack tecnológico óptimo                               |
| `/project:status`             | Muestra estado actual del proyecto                                |
| `/ux-expert`                  | Consulta experto UX/UI para decisiones de diseño                  |

## Arquitectura del Sistema

```
.claude/
├── CLAUDE.md                 # Instrucciones maestras
├── settings.json             # Configuración de hooks
├── commands/                 # Slash commands
│   ├── interview-spec.md     # /project:interview
│   ├── generate-mvp.md       # /project:mvp
│   ├── tech-stack.md         # /project:stack
│   └── status.md             # /project:status
├── agents/                   # 7 Agentes especializados
│   ├── 01-project-setup/     # Inicializa proyectos
│   ├── 02-git-cicd/          # Git + CI/CD
│   ├── 03-architecture/      # Diseño de arquitectura
│   ├── 04-ui-ux/             # Interfaces + UX
│   ├── 05-testing/           # Tests (TDD)
│   ├── 06-documentation/     # Documentación
│   └── 07-deployment/        # Despliegue
├── skills/                   # Skills reutilizables
│   ├── mvp-generator/        # Orquesta agentes
│   ├── tech-advisor/         # Recomienda stack
│   ├── code-reviewer/        # Review de código
│   └── spec-interviewer/     # Entrevista profunda
├── hooks/                    # Automatización
│   └── scripts/
│       ├── session-init.sh   # Inicio de sesión
│       ├── pre-tool-validate.sh  # Validación
│       ├── post-tool-format.sh   # Formateo
│       └── test-runner.sh    # Tests automáticos
├── specs/                    # SPECs generados
└── templates/                # Templates
    ├── SPEC-TEMPLATE.md
    ├── README-TEMPLATE.md
    └── PR-TEMPLATE.md
```

## Los 7 Agentes

### 1. Project Setup Specialist

- Inicializa estructura del proyecto
- Configura package managers, TypeScript, ESLint, Prettier
- Crea archivos base (.env.example, .gitignore)

### 2. Git/CI-CD Engineer

- Crea GitHub Actions workflows
- Configura PR templates
- Setup de branch protection
- Semantic versioning

### 3. Architecture Designer

- Diseña arquitectura Clean Architecture
- Define modelos de dominio
- Crea API contracts (OpenAPI)
- Implementa patrones de diseño

### 4. UI/UX Designer

- Implementa componentes (Atomic Design)
- Configura design system
- Asegura accesibilidad WCAG 2.1 AA
- Integra con `/ux-expert`

### 5. Test Automator

- TDD: Tests antes de implementación
- Unit, Integration, E2E tests
- Cobertura mínima 80%
- Factory functions y mocks

### 6. Documentation Writer

- README con instrucciones
- API documentation
- Architecture Decision Records
- Soporte bilingüe (ES/EN)

### 7. Deployment Engineer

- Dockerfile multi-stage
- Docker Compose para desarrollo
- Configuración Vercel/Railway
- Health checks y graceful shutdown

## Stack por Defecto

### Web Full Stack

```
Frontend:  Next.js 14+ (App Router), TypeScript, Tailwind CSS
Backend:   Next.js API Routes o tRPC
Database:  Supabase (PostgreSQL + Auth + Realtime)
Hosting:   Vercel
Testing:   Jest + Testing Library + Playwright
```

### AI/ML Application

```
Backend:   Python 3.11+, FastAPI
ML:        PyTorch o TensorFlow
Vector DB: Pinecone o Chroma
Hosting:   Modal o Replicate
```

### IoT Project

```
MCU:       ESP32 con MicroPython
Backend:   FastAPI + MQTT
Database:  TimescaleDB
Dashboard: Grafana
```

## Hooks de Automatización

| Hook         | Trigger               | Función                     |
| ------------ | --------------------- | --------------------------- |
| SessionStart | Al iniciar            | Carga env, verifica deps    |
| PreToolUse   | Antes de Bash         | Bloquea comandos peligrosos |
| PostToolUse  | Después de Edit/Write | Formatea código             |
| Stop         | Al terminar           | Ejecuta tests               |

## MCPs Configurados

- **GitHub**: Gestión de PRs y repos
- **PostgreSQL**: Conexión a bases de datos
- **Filesystem**: Acceso seguro a archivos
- **Memory**: Persistencia de contexto
- **Playwright**: Automatización web
- **Git**: Análisis de repositorio

## Proceso de Entrevista

El comando `/project:interview` realiza 4 fases:

1. **Problema** (5-7 preguntas): Entiende el problema real
2. **Usuarios** (5-8 preguntas): Define usuarios objetivo
3. **Features** (8-12 preguntas): Detalla funcionalidades core
4. **Técnico** (5-8 preguntas): Define restricciones

Al finalizar genera `.claude/specs/<nombre>.md` con la especificación completa.

## Personalización

### Añadir un Agente

1. Crear directorio en `.claude/agents/<nn>-<nombre>/`
2. Crear `AGENT.md` con:
   - Identidad y responsabilidades
   - Herramientas permitidas
   - Checklist de salida
   - Ejemplos de código

### Añadir un Skill

1. Crear directorio en `.claude/skills/<nombre>/`
2. Crear `SKILL.md` con frontmatter:
   ```yaml
   ---
   name: mi-skill
   description: Descripción del skill
   allowed-tools: Tool1, Tool2
   ---
   ```

### Añadir un Comando

1. Crear archivo en `.claude/commands/<nombre>.md`
2. Incluir frontmatter con `name` y `description`

## Contribuir

Las contribuciones son bienvenidas. Por favor, lee
[CONTRIBUTING.md](CONTRIBUTING.md) para conocer el proceso.

- [Reportar Bug](https://github.com/vjrivmon/Setup-Software-IA/issues/new?template=bug_report.md)
- [Proponer Feature](https://github.com/vjrivmon/Setup-Software-IA/issues/new?template=feature_request.md)

## Licencia

Este proyecto está bajo la licencia MIT. Ver [LICENSE](LICENSE) para más
detalles.

## Autor

**Vicente Rivas Monferrer**

- GitHub: [@vjrivmon](https://github.com/vjrivmon)
- Ganador Líderes Digitales Universitarios 2025 (Telefónica)
- Cátedra ENIA-UPV

---

Built with [Claude Code](https://claude.com/claude-code)
