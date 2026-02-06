#!/usr/bin/env bash
# Post-Commit Checkpoint
# Guarda un checkpoint JSON despues de cada git commit exitoso.
# Reemplaza el one-liner inline que estaba en settings.json PostToolUse.

INPUT=$(cat)

# Solo actuar en comandos git commit
COMMAND=$(echo "$INPUT" | grep -o '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"command"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')

if ! echo "$COMMAND" | grep -qE 'git\s+commit'; then
    exit 0
fi

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-.}"
CHECKPOINT_DIR="$PROJECT_DIR/.claude/checkpoints"
mkdir -p "$CHECKPOINT_DIR"

TIMESTAMP=$(date -Iseconds)
COMMIT=$(git -C "$PROJECT_DIR" rev-parse --short HEAD 2>/dev/null || echo "none")
BRANCH=$(git -C "$PROJECT_DIR" branch --show-current 2>/dev/null || echo "unknown")
FILENAME="$CHECKPOINT_DIR/$(date +%Y%m%d-%H%M%S).json"

cat > "$FILENAME" << EOF
{
  "timestamp": "$TIMESTAMP",
  "commit": "$COMMIT",
  "branch": "$BRANCH"
}
EOF

exit 0
