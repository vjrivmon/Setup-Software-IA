#!/usr/bin/env bash
# Session Init Hook
# Se ejecuta al iniciar cada sesión de Claude Code
# Autor: Vicente Rivas Monferrer

set -e

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-.}"

echo "Inicializando sesión de desarrollo..."

# 1. Cargar variables de entorno si existen (safe parsing, sin export $())
load_env_file() {
    local env_file="$1"
    while IFS= read -r line || [ -n "$line" ]; do
        # Saltar comentarios y lineas vacias
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line// }" ]] && continue
        # Solo exportar lineas con formato KEY=VALUE valido
        if [[ "$line" =~ ^[a-zA-Z_][a-zA-Z0-9_]*= ]]; then
            export "$line"
        fi
    done < "$env_file"
}

if [ -f "$PROJECT_DIR/.env" ]; then
    echo "Cargando variables de entorno desde .env..."
    load_env_file "$PROJECT_DIR/.env"
fi

if [ -f "$PROJECT_DIR/.env.local" ]; then
    echo "Cargando variables locales desde .env.local..."
    load_env_file "$PROJECT_DIR/.env.local"
fi

# 2. Verificar Node.js y dependencias
if [ -f "$PROJECT_DIR/package.json" ]; then
    if [ ! -d "$PROJECT_DIR/node_modules" ]; then
        echo "Instalando dependencias de Node.js..."
        cd "$PROJECT_DIR"
        npm install --prefer-offline --no-audit > /dev/null 2>&1 || echo "npm install falló (no crítico)"
        cd - > /dev/null
    fi
fi

# 3. Verificar Python y dependencias
if [ -f "$PROJECT_DIR/requirements.txt" ]; then
    if [ ! -d "$PROJECT_DIR/.venv" ]; then
        echo "Creando entorno virtual Python..."
        cd "$PROJECT_DIR"
        python3 -m venv .venv 2>/dev/null || true
        if [ -f ".venv/bin/activate" ]; then
            source .venv/bin/activate
            pip install -q -r requirements.txt 2>/dev/null || true
        fi
        cd - > /dev/null
    fi
fi

# 4. Persistir variables de entorno para Claude
if [ -n "$CLAUDE_ENV_FILE" ]; then
    echo "Persistiendo variables de entorno..."

    # Variables comunes a persistir
    if [ -n "$DATABASE_URL" ]; then
        echo "export DATABASE_URL=\"$DATABASE_URL\"" >> "$CLAUDE_ENV_FILE"
    fi

    if [ -n "$SUPABASE_URL" ]; then
        echo "export SUPABASE_URL=\"$SUPABASE_URL\"" >> "$CLAUDE_ENV_FILE"
    fi
fi

# 5. Verificar Git
if [ -d "$PROJECT_DIR/.git" ]; then
    BRANCH=$(git -C "$PROJECT_DIR" branch --show-current 2>/dev/null || echo "desconocido")
    STATUS=$(git -C "$PROJECT_DIR" status --porcelain 2>/dev/null | wc -l)
    echo "Git: rama '$BRANCH', $STATUS archivos modificados"
fi

# 6. Mostrar información del proyecto
if [ -f "$PROJECT_DIR/package.json" ]; then
    NAME=$(grep -o '"name": *"[^"]*"' "$PROJECT_DIR/package.json" 2>/dev/null | head -1 | cut -d'"' -f4)
    VERSION=$(grep -o '"version": *"[^"]*"' "$PROJECT_DIR/package.json" 2>/dev/null | head -1 | cut -d'"' -f4)
    if [ -n "$NAME" ]; then
        echo "Proyecto: $NAME v$VERSION"
    fi
fi

echo "Sesión inicializada correctamente"
