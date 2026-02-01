# Setup Software IA

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/vjrivmon/Setup-Software-IA.svg)](https://github.com/vjrivmon/Setup-Software-IA/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/vjrivmon/Setup-Software-IA.svg)](https://github.com/vjrivmon/Setup-Software-IA/issues)

Sistema profesional de orquestacion de agentes para Claude Code que transforma
ideas en MVPs funcionales mediante entrevistas profundas, diseno arquitectonico
y agentes especializados.

## Use This Template

1. Haz clic en el boton **"Use this template"** en la parte superior del
   repositorio
2. Nombra tu nuevo repositorio
3. Clona tu repositorio:
   ```bash
   git clone https://github.com/TU_USUARIO/TU_REPO.git
   cd TU_REPO
   ```
4. Personaliza `.claude/CLAUDE.md` con tu informacion
5. Inicia Claude Code y comienza a crear

---

## Tabla de Contenidos

- [Filosofia](#filosofia)
- [Quick Start](#quick-start)
- [Flujo Completo](#flujo-completo)
- [Comandos Disponibles](#comandos-disponibles)
- [Phase 0: Design-First](#phase-0-design-first)
- [Arquitectura del Sistema](#arquitectura-del-sistema)
- [Los 13 Agentes](#los-13-agentes)
- [651 Skills Instaladas](#651-skills-instaladas)
- [Stack por Defecto](#stack-por-defecto)
- [Hooks de Automatizacion](#hooks-de-automatizacion)
- [MCPs Configurados](#mcps-configurados)
- [Proceso de Entrevista](#proceso-de-entrevista)
- [Personalizacion](#personalizacion)
- [Contribuir](#contribuir)
- [Licencia](#licencia)
- [Autor](#autor)

## Filosofia

> "Read this SPEC.md and interview me in detail about literally anything:
> technical implementation, UI & UX, concerns, tradeoffs... but make sure the
> questions are not obvious - be very in-depth and continue interviewing me
> continually until it's complete" -- Thariq Shihipar

**Design-First**: Antes de escribir una linea de codigo, valida la arquitectura,
el dominio y los flujos de usuario. Las decisiones de arquitectura tomadas
despues de empezar a codificar cuestan 5-10x mas de corregir.

## Quick Start

```bash
# 1. Clonar el template (o usar "Use this template" en GitHub)
git clone https://github.com/vjrivmon/Setup-Software-IA.git mi-proyecto
cd mi-proyecto

# 2. Iniciar Claude Code
claude

# 3. Comenzar entrevista para tu proyecto
/project:interview mi-app

# 4. Disenar arquitectura antes de codificar
/design:full mi-app

# 5. Generar MVP completo
/project:mvp mi-app
```

## Flujo Completo

```
Idea
 |
 v
/project:interview <nombre>     --> Entrevista profunda (20-40 preguntas)
 |
 v
SPEC.md                          --> Especificacion completa del proyecto
 |
 v
/design:full <nombre>           --> Phase 0: Diseno (C4, DDD, Flows, ADRs)
 |
 v
DESIGN/                          --> Artefactos de diseno validados
 |
 v
/project:mvp <nombre>           --> Genera MVP con agentes orquestados
 |
 v
MVP funcional                    --> Codigo, tests, docs, deployment
 |
 v
/mvp:harden <nombre>            --> Hardening post-MVP (feedback + fixes)
 |
 v
/scale:assess <nombre>          --> Roadmap MVP --> SaaS (6 semanas)
```

---

## Comandos Disponibles

### Proyecto Base

| Comando | Descripcion | Uso |
|---------|-------------|-----|
| `/project:interview <nombre>` | Entrevista profunda (20-40 preguntas) para generar SPEC.md | `/project:interview mi-app` |
| `/project:mvp <nombre>` | Genera MVP completo desde SPEC existente (requiere design validado) | `/project:mvp mi-app` |
| `/project:stack` | Recomienda stack tecnologico optimo | `/project:stack` |
| `/project:status` | Muestra estado actual del proyecto | `/project:status` |
| `/ux-expert` | Consulta experto UX/UI para decisiones de diseno | `/ux-expert` |

### Phase 0: Design

| Comando | Descripcion | Uso |
|---------|-------------|-----|
| `/design:full <nombre>` | **Flujo completo orquestado** (recomendado). Ejecuta architecture + domain + flows + validate en orden | `/design:full mi-app` |
| `/design:architecture <nombre>` | Genera diagramas C4 (Context, Container, Component) + ADRs | `/design:architecture mi-app` |
| `/design:domain <nombre>` | Modela dominio DDD: bounded contexts, agregados, glosario, class diagram | `/design:domain mi-app` |
| `/design:flows <nombre>` | Disena user flows, diagramas de secuencia, use cases, edge cases | `/design:flows mi-app` |
| `/design:validate <nombre>` | Valida completitud de artefactos contra checklist (no genera nada nuevo) | `/design:validate mi-app` |

### Automatizacion MVP

| Comando | Descripcion | Uso |
|---------|-------------|-----|
| `/mvp:auto-generate <spec>` | SPEC --> Historias --> Tareas --> Skills automatico | `/mvp:auto-generate .claude/specs/mi-app.md` |
| `/skill:generate <task-id>` | Genera skill especializada para una tarea | `/skill:generate T001` |
| `/skill:batch <story-id>` | Skills para todas las tareas de una historia | `/skill:batch H001` |

### Idea Validation

| Comando | Descripcion | Uso |
|---------|-------------|-----|
| `/idea:validate <idea>` | Valida idea con proceso de 6 fases | `/idea:validate "app de fitness con IA"` |

### Historias y Tareas

| Comando | Descripcion | Uso |
|---------|-------------|-----|
| `/stories:generate <spec>` | Genera historias de usuario desde SPEC | `/stories:generate mi-app` |
| `/stories:auto <spec>` | Genera historias con IA (tecnica RaT) | `/stories:auto .claude/specs/mi-app.md` |
| `/tasks:breakdown <story>` | Divide historia en tareas | `/tasks:breakdown H001` |
| `/tasks:parallel <historia>` | Crea tareas paralelas con dependencias | `/tasks:parallel H001` |
| `/tasks:graph` | Visualiza grafo de dependencias | `/tasks:graph` |

### Ejecucion Autonoma

| Comando | Descripcion | Uso |
|---------|-------------|-----|
| `/ralph:start <task>` | Inicia loop autonomo para una tarea | `/ralph:start .claude/tasks/T001.md` |
| `/ralph:stop` | Detiene loop y guarda estado | `/ralph:stop` |

### Desarrollo Paralelo (Swarm)

| Comando | Descripcion | Uso |
|---------|-------------|-----|
| `/swarm:launch <N>` | Lanza N agentes en terminales paralelas | `/swarm:launch 4` |
| `/swarm:status` | Dashboard en tiempo real | `/swarm:status` |
| `/swarm:integrate` | Activa agente integrador (merge automatico) | `/swarm:integrate` |
| `/swarm:stop` | Detiene agentes y guarda estado | `/swarm:stop` |
| `/parallel:status` | Estado de agentes paralelos | `/parallel:status` |

### Hardening (Post-MVP)

| Comando | Descripcion | Uso |
|---------|-------------|-----|
| `/mvp:harden <proyecto>` | Flujo completo: entrevista feedback --> historias --> tareas --> swarm | `/mvp:harden mi-app` |
| `/mvp:feedback <proyecto>` | Solo recopila feedback (genera FEEDBACK.md) | `/mvp:feedback mi-app` |
| `/mvp:fix [proyecto]` | Genera historias/tareas desde FEEDBACK.md existente | `/mvp:fix` |

### Escalado MVP --> SaaS

| Comando | Descripcion | Uso |
|---------|-------------|-----|
| `/scale:assess <proyecto>` | Evalua MVP y genera roadmap de escalado | `/scale:assess mi-app` |
| `/scale:iteration <fase>` | Ejecuta iteracion de mejora por fase | `/scale:iteration auth` |
| `/scale:checklist` | Checklist interactivo de production-readiness | `/scale:checklist` |
| `/scale:architecture` | Analiza y propone mejoras arquitectonicas | `/scale:architecture` |

### Shape Up

| Comando | Descripcion | Uso |
|---------|-------------|-----|
| `/shapeup:pitch <idea>` | Define pitch + apuestas | `/shapeup:pitch "feature X"` |
| `/shapeup:betting` | Sesion de betting: go/no-go | `/shapeup:betting` |
| `/shapeup:cycle <semanas>` | Inicia ciclo (default 6 semanas) | `/shapeup:cycle 6` |

---

## Phase 0: Design-First

El framework Design-First se ejecuta entre la especificacion y la generacion de codigo.
Produce artefactos de diseno validados que informan la implementacion.

### Como usarlo

```bash
# Opcion 1: Flujo completo (recomendado)
/design:full mi-app

# Opcion 2: Paso a paso
/design:architecture mi-app    # C4 diagrams + ADRs
/design:domain mi-app          # DDD model + class diagram
/design:flows mi-app           # User flows + sequences + edge cases
/design:validate mi-app        # Verification checklist
```

### Que genera

Cada proyecto produce la siguiente estructura en `.claude/designs/{proyecto}/`:

```
designs/{proyecto}/
  c4/
    context.mmd              # C4 Level 1 - Sistema en su entorno
    containers.mmd           # C4 Level 2 - Contenedores tecnicos
    components.mmd           # C4 Level 3 - Componentes (si aplica)
  uml/
    use-cases.mmd            # Casos de uso del sistema
    sequence-{flow}.mmd      # Secuencias por flujo critico
    class-diagram.mmd        # Entidades del dominio
  flows/
    user-flow-{name}.mmd     # Flujos de usuario (Mermaid)
    edge-cases.md            # 5 preguntas por flujo
  domain/
    bounded-contexts.md      # Contextos acotados DDD
    aggregates.md            # Agregados, entidades, value objects
    ubiquitous-lang.md       # Glosario del dominio (>= 10 terminos)
  decisions/
    ADR-001-{titulo}.md      # Architecture Decision Records
  DESIGN-SUMMARY.md          # Resumen ejecutivo con links a todo
  VALIDATION-CHECKLIST.md    # Checklist de validacion completado
```

### Tecnica de 5 Preguntas (Edge Cases)

Cada flujo de usuario se analiza con 5 preguntas obligatorias:

| # | Pregunta | Ejemplo |
|---|----------|---------|
| 1 | **Datos vacios?** | Que ve el usuario la primera vez, sin datos? |
| 2 | **Error de red?** | Que pasa con timeout, 500, offline? |
| 3 | **Sin permisos?** | Rol incorrecto, token expirado? |
| 4 | **Datos invalidos?** | Formato erroneo, limites excedidos? |
| 5 | **Interrupcion?** | Cierra pestana, pierde conexion a mitad? |

### Referencia completa

Ver `.claude/DESIGN-FIRST-GUIDE.md` para la guia completa con ejemplos de C4, UML,
DDD, ADRs, Event Storming Light y un ejemplo aplicado.

---

## Arquitectura del Sistema

```
.claude/
├── CLAUDE.md                    # Instrucciones maestras del sistema
├── DESIGN-FIRST-GUIDE.md        # Guia de referencia Design-First (~400 lineas)
├── settings.json                # Configuracion de hooks
├── commands/                    # 32 Slash commands
│   ├── design/                  # Phase 0: Design commands
│   │   ├── architecture.md      #   /design:architecture
│   │   ├── domain.md            #   /design:domain
│   │   ├── flows.md             #   /design:flows
│   │   ├── validate.md          #   /design:validate
│   │   └── full.md              #   /design:full
│   ├── interview-spec.md        # /project:interview
│   ├── generate-mvp.md          # /project:mvp (con design gate)
│   ├── tech-stack.md            # /project:stack
│   ├── status.md                # /project:status
│   ├── idea-validate.md         # /idea:validate
│   ├── stories-generate.md      # /stories:generate
│   ├── stories-auto.md          # /stories:auto
│   ├── tasks-breakdown.md       # /tasks:breakdown
│   ├── tasks-parallel.md        # /tasks:parallel
│   ├── tasks-graph.md           # /tasks:graph
│   ├── ralph-start.md           # /ralph:start
│   ├── ralph-stop.md            # /ralph:stop
│   ├── swarm-launch.md          # /swarm:launch
│   ├── swarm-status.md          # /swarm:status
│   ├── swarm-integrate.md       # /swarm:integrate
│   ├── swarm-stop.md            # /swarm:stop
│   ├── parallel-status.md       # /parallel:status
│   ├── mvp-harden.md            # /mvp:harden
│   ├── mvp-feedback.md          # /mvp:feedback
│   ├── mvp-fix.md               # /mvp:fix
│   ├── scale-assess.md          # /scale:assess
│   ├── scale-iteration.md       # /scale:iteration
│   ├── scale-checklist.md       # /scale:checklist
│   ├── scale-architecture.md    # /scale:architecture
│   ├── shapeup-pitch.md         # /shapeup:pitch
│   ├── shapeup-betting.md       # /shapeup:betting
│   └── shapeup-cycle.md         # /shapeup:cycle
├── agents/                      # 13 Agentes especializados
│   ├── 00-design-architect.md   # C4 diagrams + ADRs
│   ├── 00-domain-modeler.md     # DDD bounded contexts + glosario
│   ├── 00-flow-designer.md      # User flows + sequences + edge cases
│   ├── 01-project-setup/        # Inicializa proyectos
│   ├── 02-git-cicd/             # Git + CI/CD
│   ├── 03-architecture/         # Diseno de arquitectura
│   ├── 04-ui-ux/                # Interfaces + UX
│   ├── 05-testing/              # Tests (TDD)
│   ├── 06-documentation/        # Documentacion
│   ├── 07-deployment/           # Despliegue
│   ├── 08-integrator/           # Merge automatico + conflictos
│   ├── 09-scaler/               # Mejoras de escalado
│   └── 10-qa-final/             # Testing E2E + validacion
├── skills/                      # 651 skills instaladas (symlinks)
├── templates/                   # Templates de documentos
│   ├── design/                  # Templates de diseno
│   │   ├── adr-template.md      # ADR formato Nygard
│   │   ├── c4-template.md       # C4 Mermaid (L1-L3)
│   │   ├── user-flow-template.md # User flow + 5 edge cases
│   │   └── validation-checklist.md # Checklist pre-codigo
│   ├── SPEC-TEMPLATE.md
│   ├── USER-STORY.md
│   ├── TASK.md
│   ├── TASK-PARALLEL.md
│   ├── TASK-SKILL-TEMPLATE.md
│   ├── PR-TEMPLATE.md
│   ├── README-TEMPLATE.md
│   ├── FEEDBACK-TEMPLATE.md
│   ├── INTEGRATION-REPORT.md
│   ├── ITERATION-PLAN.md
│   └── SCALE-ROADMAP.md
├── designs/                     # Artefactos de diseno por proyecto
├── specs/                       # SPECs generados
├── stories/                     # Historias de usuario
├── tasks/                       # Tareas del backlog
├── feedback/                    # Feedback del MVP
├── decisions/                   # ADRs globales
├── hooks/                       # Scripts de automatizacion
├── scripts/                     # Scripts de swarm, worktree, integrador
├── memory/                      # Knowledge graph persistente
├── checkpoints/                 # Estados de sesion
└── logs/                        # Logs de ejecucion
```

---

## Los 13 Agentes

### Phase 0: Design (prefijo 00-)

| # | Agente | Responsabilidad |
|---|--------|----------------|
| 00 | **Design Architect** | Genera diagramas C4 (Context, Container, Component) y ADRs. Pregunta al usuario por decisiones tecnologicas |
| 00 | **Domain Modeler** | Modela dominio DDD: bounded contexts, agregados, entidades, value objects, glosario de lenguaje ubicuo |
| 00 | **Flow Designer** | Disena user flows (flowcharts), diagramas de secuencia UML, use cases, y analiza edge cases con 5 preguntas |

### Phase 1-7: Implementation

| # | Agente | Responsabilidad |
|---|--------|----------------|
| 01 | **Project Setup** | Inicializa estructura, package managers, TypeScript, ESLint, Prettier, archivos base |
| 02 | **Git/CI-CD** | GitHub Actions workflows, PR templates, branch protection, semantic versioning |
| 03 | **Architecture** | Clean Architecture, modelos de dominio, API contracts (OpenAPI), patrones de diseno |
| 04 | **UI/UX** | Componentes (Atomic Design), design system, accesibilidad WCAG 2.1 AA, integra `/ux-expert` |
| 05 | **Testing** | TDD: tests antes de implementacion. Unit, Integration, E2E. Cobertura minima 80% |
| 06 | **Documentation** | README, API docs, ADRs, soporte bilingue (ES/EN) |
| 07 | **Deployment** | Dockerfile multi-stage, Docker Compose, Vercel/Railway, health checks |

### Phase 8-10: Scaling & QA

| # | Agente | Responsabilidad |
|---|--------|----------------|
| 08 | **Integrator** | Merge automatico de worktrees, resolucion de conflictos |
| 09 | **Scaler** | Implementa mejoras de escalado (auth, billing, monitoring) |
| 10 | **QA Final** | Testing E2E, validacion pre-produccion |

---

## 651 Skills Instaladas

Skills de 3 repositorios de la comunidad:

| Repositorio | Skills | Destacadas |
|-------------|--------|-----------|
| [sickn33/antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills) | 609 | `test-driven-development`, `mermaid-expert`, `c4-architecture`, `api-design-principles`, `architecture-patterns`, `clean-code` |
| [softaworks/agent-toolkit](https://github.com/softaworks/agent-toolkit) | 42 | `code-reviewer`, `code-review-checklist`, `commit`, `create-pr`, `find-bugs` |
| [obra/superpowers](https://github.com/obra/superpowers) | 14 | `using-superpowers`, `superpowers-lab`, `executing-plans`, `writing-plans` |

Las skills estan disponibles como symlinks en `.claude/skills/` y son compatibles con
Cursor, Windsurf, Gemini CLI, Codex, OpenCode y GitHub Copilot.

Para listar todas:
```bash
ls .claude/skills/
```

---

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

---

## Hooks de Automatizacion

| Hook | Trigger | Funcion |
|------|---------|---------|
| SessionStart | Al iniciar | Carga env, verifica deps |
| PreToolUse | Antes de Bash | Bloquea comandos peligrosos |
| PostToolUse | Despues de Edit/Write | Formatea codigo |
| Stop | Al terminar | Ejecuta tests |

## MCPs Configurados

- **GitHub**: Gestion de PRs y repos
- **PostgreSQL**: Conexion a bases de datos
- **Filesystem**: Acceso seguro a archivos
- **Memory**: Persistencia de contexto
- **Playwright**: Automatizacion web
- **Git**: Analisis de repositorio

## Proceso de Entrevista

El comando `/project:interview` realiza 4 fases:

1. **Problema** (5-7 preguntas): Entiende el problema real
2. **Usuarios** (5-8 preguntas): Define usuarios objetivo
3. **Features** (8-12 preguntas): Detalla funcionalidades core
4. **Tecnico** (5-8 preguntas): Define restricciones

Al finalizar genera `.claude/specs/<nombre>.md` con la especificacion completa.

## Personalizacion

### Anadir un Agente

1. Crear directorio en `.claude/agents/<nn>-<nombre>/`
2. Crear `AGENT.md` con:
   - Identidad y responsabilidades
   - Herramientas permitidas
   - Checklist de salida
   - Ejemplos de codigo

### Anadir un Skill

```bash
# Desde un repositorio de la comunidad
npx skills add https://github.com/REPO --skill NOMBRE --yes

# O manualmente
mkdir .claude/skills/<nombre>
# Crear SKILL.md con frontmatter name, description, allowed-tools
```

### Anadir un Comando

1. Crear archivo en `.claude/commands/<nombre>.md`
2. Incluir frontmatter con `name` y `description`
3. Usar `$ARGUMENTS` para recibir parametros del usuario

## Contribuir

Las contribuciones son bienvenidas. Por favor, lee
[CONTRIBUTING.md](CONTRIBUTING.md) para conocer el proceso.

- [Reportar Bug](https://github.com/vjrivmon/Setup-Software-IA/issues/new?template=bug_report.md)
- [Proponer Feature](https://github.com/vjrivmon/Setup-Software-IA/issues/new?template=feature_request.md)

## Licencia

Este proyecto esta bajo la licencia MIT. Ver [LICENSE](LICENSE) para mas
detalles.

## Autor

**Vicente Rivas Monferrer**

- GitHub: [@vjrivmon](https://github.com/vjrivmon)
- Ganador Lideres Digitales Universitarios 2025 (Telefonica)
- Catedra ENIA-UPV

---

Built with [Claude Code](https://claude.com/claude-code)
