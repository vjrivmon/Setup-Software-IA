# CLAUDE.md - Sistema de Desarrollo Orquestado de Vicente Rivas Monferrer

## Identidad del Sistema

Este es el entorno de desarrollo de **Vicente Rivas Monferrer**, desarrollador
Full Stack especializado en IA/ML, IoT y aplicaciones web modernas. Ganador del
primer puesto nacional en Líderes Digitales Universitarios 2025 (Telefónica) y
vinculado a la Cátedra ENIA-UPV.

El sistema está diseñado para transformar ideas en MVPs funcionales mediante:

1. **Entrevista profunda** (patrón SPEC.md de Thariq)
2. **Orquestación de agentes especializados**
3. **Automatización de tareas repetitivas**

---

## Comandos Slash Disponibles

| Comando                       | Descripción                                      |
| ----------------------------- | ------------------------------------------------ |
| `/project:interview <nombre>` | Inicia entrevista profunda para generar SPEC.md  |
| `/project:mvp <nombre>`       | Genera MVP completo desde SPEC existente         |
| `/project:stack`              | Recomienda stack tecnológico para el proyecto    |
| `/project:status`             | Muestra estado actual del proyecto               |
| `/ux-expert`                  | Consulta experto UX/UI para decisiones de diseño |

---

## Stack Tecnológico por Defecto

### Web Full Stack

- **Frontend**: Next.js 14+ (App Router), TypeScript, Tailwind CSS
- **Backend**: Next.js API Routes o tRPC
- **Database**: Supabase (PostgreSQL + Auth + Realtime)
- **Hosting**: Vercel (auto-deploy desde GitHub)
- **Testing**: Jest + Testing Library + Playwright

### AI/ML Application

- **Backend**: Python 3.11+, FastAPI
- **ML**: PyTorch o TensorFlow
- **Vector DB**: Pinecone o Chroma
- **Hosting**: Modal o Replicate

### IoT Project

- **Microcontroller**: ESP32 con MicroPython
- **Backend**: Python FastAPI + MQTT
- **Database**: TimescaleDB
- **Dashboard**: Grafana

---

## Comandos Bash Frecuentes

```bash
# Desarrollo
npm run dev          # Inicia servidor de desarrollo
npm run build        # Build de producción
npm run test         # Ejecuta tests
npm run lint         # Verifica código
npm run typecheck    # Verifica tipos TypeScript

# Git
git status           # Estado del repositorio
git add .            # Stage todos los cambios
git commit -m "..."  # Commit con mensaje
git push             # Push a remote

# Docker
docker compose up -d    # Inicia servicios
docker compose down     # Detiene servicios
docker compose logs -f  # Ver logs
```

---

## Estilo de Código

### TypeScript/JavaScript

- **TypeScript strict mode** siempre habilitado
- **ESLint + Prettier** para formateo consistente
- Nombres descriptivos sin abreviaciones
- Funciones de máximo 50 líneas
- Componentes funcionales con hooks
- Preferir composición sobre herencia

### Python

- **Black** para formateo
- **Ruff** para linting
- Type hints obligatorios
- Docstrings en funciones públicas

### Comentarios

- Comentar el **POR QUÉ**, no el **QUÉ**
- Solo agregar comentarios donde la lógica no es evidente
- NO agregar comentarios a código que no se modifica

---

## Workflow de Git

### Conventional Commits

```
feat: nueva funcionalidad
fix: corrección de bug
docs: documentación
refactor: refactorización
test: tests
chore: mantenimiento
```

### Branches

```
feature/*   - Nuevas funcionalidades
bugfix/*    - Correcciones de bugs
hotfix/*    - Correcciones urgentes en producción
```

### Reglas

- PR requerido para merge a main
- Squash merge preferido
- Tests deben pasar antes de merge
- Al menos 1 review antes de merge

---

## Testing

### Principios

- **TDD**: Escribir tests antes del código
- Cobertura mínima: **80%** para código nuevo
- Nombres descriptivos para tests
- Mock servicios externos, no lógica interna

### Estructura

```
__tests__/
├── unit/           # Tests unitarios
├── integration/    # Tests de integración
└── e2e/            # Tests end-to-end
```

---

## Arquitectura

### Clean Architecture

```
src/
├── domain/         # Entidades, reglas de negocio
├── application/    # Casos de uso, DTOs
├── infrastructure/ # Repositorios, servicios externos
└── presentation/   # Controllers, componentes UI
```

### Principios

- Dependency Injection para testabilidad
- Repository pattern para acceso a datos
- DTOs en boundaries de API
- Separación clara entre capas

---

## Agentes Disponibles

| Agente             | Responsabilidad                           |
| ------------------ | ----------------------------------------- |
| `01-project-setup` | Inicializa estructura del proyecto        |
| `02-git-cicd`      | Configura Git y CI/CD                     |
| `03-architecture`  | Diseña arquitectura del sistema           |
| `04-ui-ux`         | Implementa interfaces (invoca /ux-expert) |
| `05-testing`       | Escribe tests (TDD)                       |
| `06-documentation` | Genera documentación                      |
| `07-deployment`    | Configura despliegue                      |

---

## Referencias Importantes

- **Specs**: `.claude/specs/` - Especificaciones de proyectos
- **Agentes**: `.claude/agents/` - Agentes especializados
- **Skills**: `.claude/skills/` - Skills reutilizables
- **Commands**: `.claude/commands/` - Comandos personalizados
- **Templates**: `.claude/templates/` - Templates de documentos

---

## Preferencias de Comunicación

- Ser directo y técnico
- Sugerir alternativas al rechazar propuestas
- Preguntar antes de cambios grandes
- Usar ejemplos de código sobre explicaciones verbosas
- Documentación principalmente en **español** (código en inglés)

---

## Seguridad

### Nunca hacer

- Commitear archivos `.env` con secretos
- Force push a main/master
- Ejecutar `rm -rf /` o comandos destructivos
- Exponer API keys en código

### Siempre hacer

- Usar variables de entorno para secretos
- Validar inputs de usuario
- Sanitizar outputs
- Implementar rate limiting en APIs públicas

---

## Sistema de Desarrollo Autónomo

### Comandos de Autonomía

| Comando                    | Descripción                          |
| -------------------------- | ------------------------------------ |
| `/ralph:start <task>`      | Iniciar loop autónomo para una tarea |
| `/ralph:stop`              | Detener loop y guardar estado        |
| `/idea:validate <idea>`    | Validar idea con proceso de 6 fases  |
| `/stories:generate <spec>` | Generar historias desde SPEC.md      |
| `/tasks:breakdown <story>` | Dividir historia en tareas           |
| `/parallel:status`         | Estado de agentes paralelos          |

### Flujo Idea → MVP

```
1. /idea:validate <nombre>     → Genera SPEC o REJECTED
2. /project:interview <nombre> → Refina especificación
3. Crear historias             → template USER-STORY.md
4. Dividir en tareas           → template TASK.md
5. bash .claude/scripts/swarm-launch.sh 4 → Lanza agentes paralelos
6. bash .claude/scripts/worktree-manager.sh status → Monitorear
```

### Estructura de Directorios Extendida

```
.claude/
├── stories/      # Historias de usuario (H001.md, H002.md...)
├── tasks/        # Tareas del backlog (T001.md, T002.md...)
├── checkpoints/  # Estados de sesión (JSON)
├── memory/       # Knowledge graph persistente
├── logs/         # Logs de ejecución
├── research/     # Investigación de ideas
└── decisions/    # Architecture Decision Records

trees/            # Git worktrees para desarrollo paralelo
├── T001/         # Worktree para tarea T001
├── T002/         # Worktree para tarea T002
└── ...
```

### Ralph Loop (Ejecución Autónoma)

El Ralph Loop permite ejecutar tareas de forma iterativa y autónoma:

1. **Iniciar**: `/ralph:start .claude/tasks/T001.md`
   - Crea `.claude/PROMPT.md` con la tarea
   - Activa flag `.claude/ralph-active`
   - Inicia ejecución autónoma

2. **Loop automático**:
   - Ejecuta paso → Verifica criterios
   - Stop hook reinyecta prompt si incompleto
   - Continúa hasta completar o límite

3. **Finalización**:
   - Crear `.claude/COMPLETE` para indicar completitud
   - O `/ralph:stop` para pausa manual

### Desarrollo Paralelo (Worktrees)

```bash
# Crear worktree para una tarea
wt create T001-auth-feature

# Ver estado de todos los worktrees
wt status

# Merge worktree completado a main
wt merge T001-auth-feature

# Lanzar múltiples agentes
bash .claude/scripts/swarm-launch.sh 4
```

### Safety Limits

- **Máximo 30 iteraciones** por Ralph loop
- Si **mismo error 3+ veces**: PAUSAR automáticamente
- **Comandos bloqueados**: `rm -rf /`, `sudo rm`, `chmod 777`
- **Checkpoints automáticos** después de cada commit

### Aliases Recomendados (añadir a ~/.bashrc)

```bash
# Claude básico
alias cc="claude"
alias ccp="claude --dangerously-skip-permissions"
alias ccr="claude --resume"

# Worktree management
alias wt="bash .claude/scripts/worktree-manager.sh"
alias wtc="wt create"
alias wts="wt status"
alias wtm="wt merge"

# Swarm
alias swarm="bash .claude/scripts/swarm-launch.sh"

# Quick commits (atomic workflow)
alias gcq='git add -A && git commit -m'
```
