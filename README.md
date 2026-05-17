# T3Server

The server-only extraction of [T3Code](https://github.com/pingdotgg/t3code.git), designed to run on Replit and pair with the hosted T3Code web UI at [t3code.web.app](https://t3code.web.app).

**No desktop required.** Works from any browser — including on an Android tablet.

---

## How it works

- **T3Server** runs on Replit — handles Claude Code, file access, and session data
- **[t3code.web.app](https://t3code.web.app)** is the hosted web UI — stable, always up to date, nothing to install
- They connect via a one-time pairing using two URLs printed when the server starts
- Session data and conversation history persist in `t3code/.data/` across restarts

---

## Setup

### 1. Import to Replit from GitHub

Import this repo directly into a **new** Replit project from GitHub.

> Always start fresh — import from GitHub, don't copy into an existing project.

### 2. Set the Replit Secret

In the Replit **Secrets** pane add:

| Key | Value |
|---|---|
| `CLAUDE_CONFIG_DIR` | `/home/runner/workspace/.claude-user` |

This makes your Claude credentials persist across Replit restarts.

### 3. Install Claude Code

Open the **Shell** tab and run:

```bash
npm install -g @anthropic-ai/claude-code
```

### 4. Authorize Claude Code

```bash
claude --dangerously-skip-permissions
```

A login URL will appear in the shell. **Do not click it** — manually select and copy the full URL from the shell, then paste it into your browser to complete authorization.

> Claude Pro or Max plan required, or set `ANTHROPIC_API_KEY` in Replit Secrets to use an API key instead.

### 5. Initialize the credentials folder

Once authorized, run Claude once to create the credentials folder:

```bash
claude
```

Type anything (e.g. "hey"), wait for a response, then stop Claude with `Ctrl+C`. The `.claude-user` folder is now created — T3Server will use it automatically.

### 6. Run the server

Hit **Run** in Replit. On first run, dependencies install automatically via `bun install`. The server starts and prints two values in the console, ready to copy:

```
Go to: https://t3code.web.app/pair

Field 1 — Pairing URL (paste exactly as-is):
http://localhost:3000/pair#token=XXXXXXXXXX

Field 2 — Actual server URL:
https://your-replit-project.pike.replit.dev:3000
```

### 7. Connect to t3code.web.app

1. Open [t3code.web.app/pair](https://t3code.web.app/pair) in your browser
2. **Field 1 — Pairing URL**: paste the `localhost` URL with the token exactly as printed
3. **Field 2 — Actual server URL**: paste the public Replit URL with port
4. Hit **Connect**
5. Done — this is a **one-time step**. The connection is saved in your browser and future visits reconnect automatically

---

## Subsequent runs

Just hit **Run** in Replit. Dependencies are already installed, Claude credentials are already saved, and the web UI reconnects automatically.

---

## How Claude connects automatically

No manual linking needed. T3Server finds Claude by checking the PATH for the `claude` binary, then reads credentials from the `CLAUDE_CONFIG_DIR` folder. T3Server spawns Claude only when needed — nothing has to be running in the shell.

---

## Data persistence

Conversation history and session data live in `t3code/.data/` (SQLite). This persists across Replit restarts so your work is always there when you come back.

---

## Free alternative (no Claude plan needed)

T3Code also supports [OpenCode](https://opencode.ai) which provides many free AI models. Install OpenCode in the Replit shell and T3Server will detect it automatically.

---

## Credits

- [T3Code](https://github.com/pingdotgg/t3code.git) by [Theo](https://github.com/t3dotgg) and the T3 team
- Server extracted and ported to Replit by [@jek0510](https://github.com/jek0510)
