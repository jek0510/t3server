# T3 Code Server

T3 Code is an AI coding assistant. This Replit project runs only the server component — the web UI is deployed separately (e.g. Firebase).

## Run & Operate

- **Start the server**: Click the Run button (or use the "T3 Code" workflow)
- **First run**: Dependencies are installed automatically via `bun install`
- **Server port**: 3000
- **Pairing**: Copy the full pairing URL from the workflow console logs (format: `http://localhost:3000/pair#token=<TOKEN>`) and paste it into the hosted web UI
- **Sessions**: Persist across restarts via SQLite in `t3code/.data/`

### Useful commands (run from `t3code/` directory)
- `bun install --ignore-scripts` — reinstall dependencies

## Where things live

- `t3code/` — the server source
- `t3code/apps/server/` — the Node.js WebSocket + HTTP server
- `t3code/packages/` — shared internal packages (contracts, shared, tailscale, effect-acp, effect-codex-app-server)
- `t3code/.data/` — persistent SQLite DB and session data (T3CODE_HOME)
- `t3code/start.sh` — setup + startup script used by the workflow

## Architecture

- Server-only deployment: the web UI is hosted externally on Firebase (`t3code.firebaseapp.com`)
- Server runs in "web" mode, binds on all interfaces, exposes a WebSocket RPC API
- SQLite persistence via `T3CODE_HOME=/home/runner/workspace/t3code/.data`
- Pairing: server prints a URL with a one-time token; user pastes it into the web UI which connects and caches the session in localStorage

## User preferences

- Server only — no web app built or served here
- Web UI is hosted on Firebase (separate deployment)
- Sessions persist across restarts (SQLite)
- Pairing URL is copied from server logs and pasted into the web UI
