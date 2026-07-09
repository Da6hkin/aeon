# Aeon Configuration

*Last updated: 2026-07-09*

## Active skills (post 2026-07-09 config session)

All standalone scheduled skills use `claude-sonnet-4-6` for cost. The overnight-research chain quality steps stay on opus.

### Chain (04:45 UTC daily)
`overnight-research` chain → steps: github-trending, HN, deep-research, repo-scanner → startup-idea → idea-capture → morning-brief

### Daily standalones
| Skill | Schedule | Model | Notes |
|-------|----------|-------|-------|
| paper-digest | 07:00 daily | sonnet | |
| defi-overview | 12:00 daily | sonnet | TVL/yield shifts |
| monitor-kalshi | 13:00 daily | sonnet | Prediction markets |
| vibecoding-digest | 17:30 daily | sonnet | What devs are shipping |
| money-radar | 19:00 daily | opus | Cross-stream synthesis, idea ranking |
| skill-health | 18:00 daily | sonnet | |
| reflect | 18:00 daily | sonnet | |
| heartbeat | 08:00, 14:00, 20:00 UTC | sonnet | 3× per day |

### Weekly standalones
| Skill | Schedule | Model |
|-------|----------|-------|
| ai-framework-watch | Mon 08:30 | sonnet |
| weekly-shiplog | Mon 09:00 | sonnet |
| unlock-monitor | Mon 10:00 | sonnet |
| deal-flow | Mon 14:00 | sonnet |

### Disabled skills
- `vienna-apartments` — disabled 2026-07-09 (operator found apartment)
- `startup-idea` standalone — disabled as standalone; runs chain-only via overnight-research chain

## Skills held back (awaiting keys)
- `monitor-polymarket` — needs `CLOB_TOKEN`
- `reg-monitor` — needs `CONGRESS_GOV_API_KEY`
- `token-report`, `market-context-refresh` — need XAI / CoinGecko
- `narrative-tracker`, `agent-buzz` — need `XAI_API_KEY`
- `github-releases`, `repo-pulse` — functional but need repos in `memory/watched-repos.md`

## Key secrets confirmed working
GitHub, Telegram, Claude, WebFetch/WebSearch

## To unlock more
- `GH_GLOBAL` PAT with `workflows` scope → enables Aeon to push workflow fixes without operator intervention (self-heal + ship code)
- Free CoinGecko / Alchemy → token/DeFi/on-chain skills
- XAI_API_KEY (paid) → X/Twitter skills, narrative-tracker, agent-buzz

## Cost model
- Overnight chain quality steps (deep-research, startup-idea, idea-capture, morning-brief) + money-radar: opus
- Everything else: sonnet
- Estimated daily token spend: moderate (heartbeat 3×/day most expensive recurring line item before the switch)
