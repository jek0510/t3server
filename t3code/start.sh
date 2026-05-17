#!/bin/bash
set -e

cd /home/runner/workspace/t3code

# Install dependencies on first run (or when node_modules is missing)
if [ ! -d node_modules ]; then
  echo "Installing server dependencies..."
  bun install --ignore-scripts
  echo "Dependencies installed."
fi

# Persistent data directory for sessions and SQLite DB
export T3CODE_HOME="/home/runner/workspace/t3code/.data"
export T3CODE_PORT="${PORT:-3000}"
export T3CODE_NO_BROWSER=true
export T3CODE_MODE=web

echo "Starting T3 Code server on port $T3CODE_PORT..."
exec bun run apps/server/src/bin.ts
