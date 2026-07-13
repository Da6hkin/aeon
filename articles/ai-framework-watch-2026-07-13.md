# AI Framework Watch — 2026-07-13

**Verdict:** RELEASE WEEK: 5 frameworks shipped — aeon, langgraph, crewai, mastra, pydantic-ai (cold start baseline; deltas from next week onward)

**Tracked:** 9 of 9 frameworks  ·  **Unreachable:** 0  ·  **Anchor:** aaronjmars/aeon

---

## Ranked table

Cold start — no prior state, so 7d and 30d star deltas render `—` this week. Sort falls back to current stars desc (anchor pinned).

| Framework | Stars | 7d Δ | 30d Δ | Releases (7d) | Breaking? | Headline |
|-----------|-------|------|-------|---------------|-----------|----------|
| aaronjmars/aeon | 574 | — | — | 1 | — | v0.1.0 — first tagged release of the GitHub-Actions-native agent framework (Jul 9) |
| microsoft/autogen | 59,703 | — | — | 0 | — | — (last release 2025-09-30; last push 2026-04-15 — see notes) |
| crewAIInc/crewAI | 55,431 | — | — | 1 | — | 1.15.2 — patch on the 1.15 line (Jul 8), following two 1.15.2 alphas the week prior |
| run-llama/llama_index | 50,814 | — | — | 0 | — | — (last GH release v0.14.23 on Jun 24; repo pushed Jul 11) |
| langchain-ai/langgraph | 37,167 | — | — | 3 | — | 1.2.9 + cli 0.4.31 (both Jul 10), 1.2.8 (Jul 6) — steady patch cadence |
| stanfordnlp/dspy | 36,086 | — | — | 0 | — | — (last stable 3.2.1 on May 5; 3.3.0b1 pre on May 28) |
| huggingface/smolagents | 28,318 | — | — | 0 | — | — (last release v1.26.0 on May 29) |
| mastra-ai/mastra | 26,123 | — | — | 2 | — | @mastra/core@1.50.0 (Jul 8) + 1.49.0 (Jul 7) — two minor bumps in 8 days |
| pydantic/pydantic-ai | 18,474 | — | — | 5 | — | v2.9.0 + v1.107.1 co-released (Jul 11) — dual-track v1/v2 LTS maintenance |

---

## Releases (7-day window)

Sorted by `published_at` desc, grouped by framework.

### pydantic/pydantic-ai
- **v2.9.0** (2026-07-11) — v2 minor bump; body uses release-yml auto-generation.
- **v1.107.1** (2026-07-11) — v1.x LTS patch co-released alongside v2.9.0. Signals maintainers are actively supporting both major branches.
- **v2.8.0** (2026-07-10) — v2 minor bump.
- **v2.7.0** (2026-07-09) — v2 minor bump.
- **v2.6.0** (2026-07-08) — v2 minor bump.

Note: `per_page=5` caps our lookup at 5, and all 5 fell inside the 7-day window — there may be additional releases at the far edge (see source status: `releases_lookup=5/5` for this repo).

### langchain-ai/langgraph
- **langgraph-cli==0.4.31** (2026-07-10) — CLI patch, "Changes since cli==0.4.30".
- **langgraph==1.2.9** (2026-07-10) — core patch, "Changes since 1.2.8".
- **langgraph==1.2.8** (2026-07-06) — core patch, "Changes since 1.2.7".

### mastra-ai/mastra
- **@mastra/core@1.50.0** (2026-07-08) — minor bump. Release body opens with `## Highlights`.
- **@mastra/core@1.49.0** (2026-07-07) — minor bump. Release body opens with `## Highlights`.

### aaronjmars/aeon
- **v0.1.0** (2026-07-09) — first tagged release. Body opens: "Aeon is an autonomous agent framework that runs on GitHub Actions via Claude Code. Fork it, enable a few skills, schedule them — and it does the work on its own…" Marks the anchor's public v0.

### crewAIInc/crewAI
- **1.15.2** (2026-07-08) — patch release on the 1.15 line. Two 1.15.2 alphas landed the prior week (1.15.2a1 Jun 30, 1.15.2a2 Jul 1), so this is the stabilization drop.

---

## Momentum picks

_No momentum picks this week — cold start, no prior star baseline to compute deltas from. First deltas will render next run (2026-07-20)._

---

## Anchor position

aeon sits 9th of 9 by star count (574) — roughly 32× smaller than the next-smallest peer, pydantic-ai (18.5k). It's a category-of-one anchor here: the eight peers are libraries operators build *with*; aeon is a runtime operators fork and run *as*. On release cadence this week, aeon posted its first tagged version (v0.1.0, Jul 9), while the release-active peers shipped incremental patches or minor bumps: langgraph 3 patches, mastra 2 minors, crewai 1 patch, and pydantic-ai 5 (including a v1/v2 dual-track). No star deltas are computable this run — the next digest (2026-07-20) will be the first with 7d comparability.

Notable non-anchor observations:

- **autogen** looks dormant at the release layer — last GH release 2025-09-30, last push 2026-04-15. Still holds 59.7k stars (largest in cohort) but hasn't shipped a versioned artifact in ~9 months. Worth watching whether Microsoft continues the framework or migrates to `autogen-core` / `semantic-kernel` merger patterns.
- **pydantic-ai** is the only framework here maintaining two simultaneously-active major branches (v1.107.1 + v2.9.0 same day). That's a strong "v2 is a breaking rewrite, v1 is LTS" signal even though no release inside the window carries an explicit `[BREAKING]` marker.
- **smolagents** and **dspy** have both been release-quiet for 6+ weeks. Not evidence of decline (both are mature, low-churn projects by design) but the digest can't distinguish "stable" from "slowing" without more state — next month will clarify.

---

## Source status

`gh_api: ok · reachable: 9/9 · releases_lookup: 5/5 per repo (pydantic-ai lookup saturated the cap — potential undercount) · breaking_signals_fired: 0 · mode: sweep · state: cold_start_baseline_written`
