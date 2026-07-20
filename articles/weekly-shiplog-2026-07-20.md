# Week in Review: grok2api Gateway Rebuilt; DeFi Adapter Wave Across Chains

*2026-07-20 — Weekly shipping update*

> grok2api's backend was substantially rearchitected this week — multi-provider routing unified and prompt caching shipped — while the dimension-adapters fork absorbed a 72-hour burst of 25+ new protocol integrations spanning Hyperliquid, Monad, and Robinhood Chain.

## What Shipped

### grok2api: Gateway Routing Unified and Prompt Caching Added

The week's largest change was a 6,489-line rework of grok2api's backend that consolidated multi-provider routing and tightened runtime concurrency management (d2eecc4). The restructuring removed two now-redundant documentation files (`PROVIDER_ARCHITECTURE.md` and `RESPONSES_COMPATIBILITY.md`) and rebuilt how the gateway dispatches across providers — the service layer, quota refresh logic, and account management now share a cleaner interface. The commit touches over 30 files across `backend/internal/application/`, `backend/internal/infra/`, and `backend/internal/transport/`, making it the most cross-cutting change in this repo this year.

Prompt caching landed in the same window. A new `backend/internal/application/gateway/prompt_cache.go` module was added (dc9b157), and a follow-up commit (3c30472) wires `prompt_cache_key` injection directly into Build API request bodies. Both commits arrive with unit tests in `prompt_cache_test.go` and updated adapter coverage in `cli/adapter_test.go` — 352 lines total across the gateway and provider layers.

Image generation got explicit error handling improvements in `gateway/image.go` (8004840), and two auth-path fixes hardened token lifecycle: accounts are no longer marked as requiring re-authentication while the access token is still valid (5700827), and permanently invalid refresh tokens are now safely retired rather than retried until they succeed (d6cc305). The net effect is that auth failures degrade gracefully instead of trapping the account in a broken state.

### dimension-adapters: 25+ Protocol Integrations in 72 Hours

Between July 15–16, a concentrated wave of protocol additions landed in the dimension-adapters fork. The breadth is notable — new DEXs, new chains, new prediction-market trackers, and several precision fixes to existing fee attribution.

New DEX and vault adapters: Flowr (3075201), DropSwap (7370aae), and Angstrom switched to dynamic pool discovery from `Initialize` logs rather than a static list (e043265). Felix Vaults gained missing Frontier vault entries (bdc5c12). Temple got fees tracking added (9880104). StableJack Perps Hyperliquid builder was wired up (fb826a2).

Chain expansion: Lunarbase on Monad (6c58a86), IMF launchpad fees on Robinhood Chain (f50238c), and Based Alpha fees/volume — also on Robinhood Chain (ba6e108). LiFi/Jumper cross-chain routing gained Taiko, Flare, and XDC via the analytics API (0ed54ca) and a separate PR added missing bridge-aggregator chain support (ae2d95d).

Prediction market coverage widened: smartx Polymarket builder volume tracking was added (9334452), Polymarket combo volume landed (3903191), Jupiter gacha volume was tracked (a93bdca), and Meridian OI and notional volume joined the feed (f2c1794).

Revenue and fee precision: QuickSwap now correctly reflects its November 2025 distribution change — 30% to foundation, 70% to token holders (8e25af5). EasyA Kickstart received exact per-swap DAMM v2 fee attribution that correctly excludes third-party LP fees from the Revenue figure (bc360c2). Sperax USD got fees and revenue tracking (90542ae).

Virtual Protocol gained a bonding-curve volume adapter and its platform-fee wallet address was corrected (3c62781).

## Fixes & Polish

- grok2api `afb169e`: chat stream halts cleanly on first error — downstream events after an error were continuing to be processed, producing confusing partial state
- grok2api `792410b`: fhttp response headers are now cloned before modification — the mutation could corrupt headers silently under concurrent requests
- grok2api `3b8feb2`: Console provider egress switched to `ScopeConsole` — was using the wrong scope for feedback routing
- dimension-adapters `30819b7`: Aqua user fees corrected
- dimension-adapters `303797f`: Based Alpha fee syntax fixed; daily volume now includes the fee contribution it was missing
- dimension-adapters `04c32fd`: Lunar aggregator and bridge aggregator fixed
- miroshark-aeon #114 + #115: `memory/tweet-digest-notify.md` leaked into the tree by the tweet-digest cron run was failing OKF validation on every push to main; the file was removed and `.gitignore` widened to block the class of artifacts that triggered it

## Momentum Check

Last week (2026-07-13) shipped 96+ commits across 18 merged PRs — Docker self-hosting for Minitor, a new integration test suite, and MiroShark's French translation pass. This week has comparable commit volume (~127) but far fewer formal PRs (3 merged); the bulk of the work landed as direct pushes to forks. The grok2api gateway rework is the largest single change in two weeks by line count.

---

**Stats:** ~127 commits · 3 PRs merged · 0 issues closed · est. +7k / −5k lines · contributors: aaronjmars, aeonframework, Chenyme, bheluga, Dani, tree, g1nt0ki, FelixBruguera, FlowrRH, octavionotpunk, Eren Tokmak, SimJach, edmundbased, Anshuman Yadav, and 10+ more
**Sources:** [aaronjmars/grok2api](https://github.com/aaronjmars/grok2api) · [aaronjmars/dimension-adapters](https://github.com/aaronjmars/dimension-adapters) · [aaronjmars/miroshark-aeon](https://github.com/aaronjmars/miroshark-aeon) · [aaronjmars/aeon-agent](https://github.com/aaronjmars/aeon-agent) · commits=ok · prs=ok · releases=ok · issues=ok · open_prs=ok
