# CLAUDE.md - Sistema de Desarrollo Orquestado de Vicente Rivas Monferrer

## Identidad del Sistema

Este es el entorno de desarrollo de **Vicente Rivas Monferrer**, desarrollador Full Stack especializado en IA/ML, IoT y aplicaciones web modernas. Ganador del primer puesto nacional en Líderes Digitales Universitarios 2025 (Telefónica) y vinculado a la Cátedra ENIA-UPV.

El sistema está diseñado para transformar ideas en MVPs funcionales mediante:
1. **Entrevista profunda** (patrón SPEC.md de Thariq)
2. **Orquestación de agentes especializados**
3. **Automatización de tareas repetitivas**

---

## Comandos Slash Disponibles

| Comando | Descripción |
|---------|-------------|
| `/project:interview <nombre>` | Inicia entrevista profunda para generar SPEC.md |
| `/project:mvp <nombre>` | Genera MVP completo desde SPEC existente |
| `/project:stack` | Recomienda stack tecnológico para el proyecto |
| `/project:status` | Muestra estado actual del proyecto |
| `/ux-expert` | Consulta experto UX/UI para decisiones de diseño |

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

| Agente | Responsabilidad |
|--------|-----------------|
| `01-project-setup` | Inicializa estructura del proyecto |
| `02-git-cicd` | Configura Git y CI/CD |
| `03-architecture` | Diseña arquitectura del sistema |
| `04-ui-ux` | Implementa interfaces (invoca /ux-expert) |
| `05-testing` | Escribe tests (TDD) |
| `06-documentation` | Genera documentación |
| `07-deployment` | Configura despliegue |

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
