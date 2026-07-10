# Long-term Memory
*Last consolidated: 2026-07-09*

## Operator profile
- **Solo technical builder.** Ships real products fast and independently.
- **Proven win:** shipped a product solo that made **~$20k in ~2 months**. Fastest path to money reuses this muscle.
- **Other income seen:** ~$8k from an early presale/whitelist allocation, ~$13k from memecoin trading (variance, not a plan).
- **Realistic build budget:** weeks, not months; low cash. Prefers shortest time-to-first-dollar.
- **Distribution today:** thin/early — building audience/reputation is an open lever.

## Primary goal
- **Make money, fast, domain-agnostic.** Optimize for shortest realistic time-to-revenue and opportunities most people haven't spotted.
- Strategy of record: **ship products in public** (proven, compounding) as the core; treat allocations/airdrops as visibility-driven bonuses; keep gambling money separate.

## Interests / signal areas
- Autonomous AI agents, agent infrastructure, AI-agent + crypto intersection
- Crypto: Liquid Protocol / DIEM ecosystem, on-chain agents, payment/coordination layers, Polymarket, trading tooling
- Broadly: any fast, buildable SaaS/tool with a clear first paying customer

## About This Repo
- github: aaronjmars
- [Repo catalog](topics/repos.md) — GitHub fleet with prioritized opportunities (32 repos, last scanned 2026-07-10)

## Active setup (Aeon)
See `memory/topics/aeon-config.md` for the full skill manifest and cost model.

- **Chain (04:45 daily):** github-trending, HN, deep-research, repo-scanner → startup-idea → idea-capture → morning-brief
- **Standalones:** paper-digest, defi-overview, monitor-kalshi, vibecoding-digest, money-radar, skill-health, reflect, heartbeat (3×/day), ai-framework-watch, weekly-shiplog, unlock-monitor, deal-flow
- **Disabled:** vienna-apartments (apartment found), startup-idea standalone (chain-only)
- **Notifications:** Telegram. Models: standalone skills on sonnet; chain quality steps + money-radar on opus.
- **Pending merge:** branch `claude/aeon-max-improvements-ix8xy5` — fixes ISS-001 (chain-runner jq bug + messages.yml parser) and ISS-002 (catch-up window). Operator must merge before the fixes go live.

## System health
See `memory/topics/system-health.md` for issue history and operational patterns.

- ISS-001 and ISS-002 both **resolved** in the branch above. No open issues.
- `./notify` sandbox workaround: write to `.pending-notify/<id>.md` — post-run workflow step delivers.

## Next priorities
- **Merge the branch** (`claude/aeon-max-improvements-ix8xy5`) to restore the overnight-research chain and fix tick-drift.
- Ship the next product faster than the last (~2 months → target: weeks). Let money-radar + the research chain feed the "what to build" decision.
- Add free keys to widen signal: `GH_GLOBAL` with workflows scope (self-heal + ship code), CoinGecko/Alchemy (crypto data). XAI (paid) unlocks X/Twitter audience-building.
- Build audience/distribution in public (weekly-shiplog drafts the posts).

## Kalshi signals
- **2026-07-09:** KXCPI-26JUN pricing US deflation for June (CPI modal outcome −0.2% to −0.3%, data July 14). KXFED-26JUL T3.75 at 16% → 84% cut probability at July 29 FOMC.

## Lessons learned
- Digest format: Markdown, clickable links, under ~4000 chars.
- Always save files AND commit before logging.
- Fastest money reuses a proven muscle; novelty is second.
- GHA cron ticks regularly land 10–70 min late; design for drift, not punctuality.
