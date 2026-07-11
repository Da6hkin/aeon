# Long-term Memory
*Last consolidated: 2026-07-11*

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
- [Repo catalog](topics/repos.md) — GitHub fleet with prioritized opportunities (32 repos, last scanned 2026-07-11)

## Active setup (Aeon)
See `memory/topics/aeon-config.md` for the full skill manifest and cost model.

- **Chain (04:45 daily):** github-trending, HN, deep-research, repo-scanner → startup-idea → idea-capture → morning-brief
- **Standalones:** paper-digest, defi-overview, monitor-kalshi, vibecoding-digest, money-radar, skill-health, reflect, heartbeat (3×/day), ai-framework-watch, weekly-shiplog, unlock-monitor, deal-flow
- **Disabled:** vienna-apartments (apartment found), startup-idea standalone (chain-only)
- **Notifications:** Telegram. Models: standalone skills on sonnet; chain quality steps + money-radar on opus.

## System health
See `memory/topics/system-health.md` for issue history and operational patterns.

- ISS-001 and ISS-002 both **resolved** and merged to main. Chain ran end-to-end 2026-07-10+11.
- **ISS-003 open** (medium): `vibecoding-digest` permanently blocked — Reddit domain-bans Anthropic crawler. Fix: `scripts/prefetch-reddit.sh` pre-fetch step.
- `./notify` sandbox workaround: write to `.pending-notify/<id>.md` — post-run workflow step delivers.
- skill-health `last-report.json` refreshed 2026-07-10 (post-chain-recovery): chain=HEALTHY, heartbeat=WARNING 78%.
- **defi-overview degradations**: `/v2/chains change_1d` absent 3+ consecutive days; yields endpoint >10MB 2+ days. Consider `scripts/prefetch-defi.sh`.
- **monitor-kalshi**: empty watchlist → daily discovery overhead. Add KXCPI-26JUN + KXFED-26JUL to watchlist before July 14 CPI print.

## Next priorities
- **Cut 6-idea pile to 1 pick** — ranked 2026-07-11: #1 Underwater (10–14d, 30-day GPT-5.6 window, proven muscle), #2 Regression Sentinel (2–3w, AI-PR regression checker), #3 Sybil-Resistant Rep Aggregator (3–4w, sharpened Agent Firewall via Xiong ERC-8004 empirical break), #4 FieldWrench (4–6w, FTC-Deere mandate Dec 31 2026 but 50%-dealer trigger may push to Q1–Q2 2027). Attestly **retracted** — AWS AgentCore Evaluations bundled the wedge.
- **2026-07-14:** CPI print (June) + first fire for ai-framework-watch, weekly-shiplog, unlock-monitor, deal-flow. Run monitor-kalshi that day to capture settlement.
- Ship the next product faster than the last (~2 months → target: weeks). money-radar + the research chain feed the "what to build" decision.
- Add free keys to widen signal: `GH_GLOBAL` with workflows scope (self-heal + ship code), CoinGecko/Alchemy (crypto data). XAI (paid) unlocks X/Twitter audience-building.
- Build audience/distribution in public (weekly-shiplog drafts the posts).
- Fix vibecoding-digest: add `scripts/prefetch-reddit.sh` (ISS-003).

## Kalshi signals
- **2026-07-11:** KXFED-26JUL T3.75 surged 14%→20% (+6pp, tight book) — cut prob fell from 86% to 80%. KXCPI-26JUN T-0.2 at 43% (+4pp, intraday hit 48%); modal −0.3%–−0.2% band compressed 51%→43%; milder-deflation bands gaining. CPI print July 14 (3 days).
- **2026-07-10:** KXCPI-26JUN — T-0.2 spiked to 65% intraday (28pp range on tight book) before reverting to 37%; modal −0.3% to −0.2% (51% prob); book tightened 6pp→2pp. KXFED-26JUL T3.75 at 14%, cut prob 86%. CPI print July 14.
- **2026-07-09:** KXCPI-26JUN pricing US deflation for June (CPI modal outcome −0.2% to −0.3%, data July 14). KXFED-26JUL T3.75 at 16% → 84% cut probability at July 29 FOMC.

## Lessons learned
- Digest format: Markdown, clickable links, under ~4000 chars.
- Always save files AND commit before logging.
- Fastest money reuses a proven muscle; novelty is second.
- GHA cron ticks regularly land 10–70 min late; design for drift, not punctuality.
- Reddit is permanently domain-blocked (crawler policy). Use prefetch scripts for any Reddit-dependent skill.
- DeFi endpoint drift: `/v2/chains change_1d` and the yields dataset go stale/oversize without warning. Never assume endpoint availability; always design a graceful fallback.
- Prediction market skills with empty watchlists burn discovery overhead every run. Seed the watchlist with known event IDs as soon as they're confirmed relevant.
