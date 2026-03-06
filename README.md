# Aeon

Autonomous agent running on GitHub Actions, powered by Claude Code. Writes daily articles, builds features from GitHub issues, generates digests, and notifies you on Telegram.

## Setup

### 1. Fork / clone this repo

### 2. Add GitHub secrets

Go to **Settings > Secrets and variables > Actions** and add:

| Secret | Required | Description |
|--------|----------|-------------|
| `CLAUDE_CODE_OAUTH_TOKEN` | Yes | OAuth token for Claude (see below) |
| `TELEGRAM_BOT_TOKEN` | Optional | From @BotFather on Telegram |
| `TELEGRAM_CHAT_ID` | Optional | Your Telegram chat ID from @userinfobot |
| `XAI_API_KEY` | Optional | X.AI API key for searching X/Twitter |

#### Getting your auth token

**Option A: Claude Code OAuth token (recommended)** — uses your existing Claude Pro/Max subscription, no separate API billing.

1. Install [Claude Code](https://docs.anthropic.com/en/docs/claude-code) and run:
   ```bash
   claude setup-token
   ```
2. It opens a browser for OAuth login, then prints a long-lived token (`sk-ant-oat01-...`, valid for 1 year).
3. Add it as the `CLAUDE_CODE_OAUTH_TOKEN` secret in your repo.

**Option B: Standard API key** — usage-based billing through console.anthropic.com.

1. Go to [console.anthropic.com/settings/keys](https://console.anthropic.com/settings/keys) and create a key.
2. Add it as `CLAUDE_CODE_OAUTH_TOKEN` in your repo secrets (it works in the same field).

### 3. Customize the agent

- **`CLAUDE.md`** — agent identity, rules, and instructions (auto-loaded by Claude Code)
- **`skills/*.md`** — skill prompts and config
- **`memory/MEMORY.md`** — seed with context about your project

### 4. Run manually to test

Go to **Actions > Run Skill > Run workflow** and enter a skill name (e.g. `digest`).

## Adding a new skill

1. Create `skills/your-skill.md` with frontmatter and a prompt:

```markdown
---
name: My Skill
description: What this skill does
schedule: "0 12 * * *"
commits:
  - output-dir/
  - memory/
permissions:
  - contents:write
---

Today is ${today}. Your task is to...
```

2. If it needs a cron schedule, add the cron to `.github/workflows/run-skill.yml` under `schedule:` and map it in the "Determine skill name" step.

**Template variables:** `${today}` (2026-03-06), `${now}` (full ISO timestamp), `${repo}` (repo name).

## Trigger feature builds from issues

Add the label `ai-build` to any GitHub issue. The workflow fires automatically and Claude will read the issue, implement it, and open a PR.

## Local development

```bash
# Run any skill locally (requires Claude Code CLI)
node scripts/load-skill.js --prompt article | claude -p --dangerously-skip-permissions

# List available skills
node scripts/load-skill.js --list
```

## Project structure

```
CLAUDE.md           <- agent identity (auto-loaded by Claude Code)
scripts/
  load-skill.js     <- skill loader (parses frontmatter, interpolates vars)
skills/
  article.md        <- daily article skill
  digest.md         <- daily digest skill
  feature.md        <- feature builder skill
  reflect.md        <- weekly reflection skill
  build-tool.md     <- skill builder skill
  fetch-tweets.md   <- tweet fetcher skill
memory/
  MEMORY.md         <- long-term persistent memory
  logs/             <- daily run logs (auto-created)
articles/           <- generated articles (auto-created)
.github/
  workflows/
    run-skill.yml   <- single workflow dispatches all skills via Claude Code
```
