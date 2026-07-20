# AI Framework Watch — 2026-07-20

**Verdict:** RELEASE WEEK: 3 frameworks shipped — crewai, mastra, pydantic-ai

**Tracked:** 9 of 9 frameworks  ·  **Unreachable:** 0  ·  **Anchor:** aaronjmars/aeon

---

## Ranked table

Sorted by 7d star delta descending. Anchor pinned to top. First run with computable 7d deltas — 30d column renders `—` for all rows until week-5 baseline is available.

| Framework | Stars | 7d Δ | 30d Δ | Releases (7d) | Breaking? | Headline |
|-----------|-------|------|-------|---------------|-----------|----------|
| aaronjmars/aeon | 577 | +3 | — | 0 | — | No release this week; v0.1.0 shipped 2026-07-09 |
| langchain-ai/langgraph | 37,669 | +502 | — | 0 | — | Latest 1.2.9 landed 2026-07-10, just outside window |
| crewAIInc/crewAI | 55,834 | +403 | — | 4 | — | Skills Repository promoted out of experimental; execution-hooks rework; tool-result caching flipped to opt-in |
| mastra-ai/mastra | 26,356 | +233 | — | 1 | — | Durable-agent crash recovery + scoped AgentController sessions (parallel sessions per resource, e.g. one-per-worktree) |
| pydantic/pydantic-ai | 18,668 | +194 | — | 5 | — | Daily v2.x cadence Jul 14–18; adds Moonshot kimi-k3 support, cache_hit_ratio, background-mode + pause_turn handling |
| stanfordnlp/dspy | 36,244 | +158 | — | 0 | — | Release-silent since 3.3.0b1 (2026-05-28); 3.2.1 stable since 2026-05-05 |
| run-llama/llama_index | 50,956 | +142 | — | 0 | — | Latest v0.14.23 landed 2026-06-24 (~4 weeks ago) |
| microsoft/autogen | 59,840 | +137 | — | 0 | — | Release-silent 9.7 months (last release 2025-09-30); push-silent 3.1 months |
| huggingface/smolagents | 28,446 | +128 | — | 0 | — | Latest v1.26.0 landed 2026-05-29 (~7 weeks ago) |

---

## Releases (7-day window)

Sorted by `published_at` desc, grouped by framework. All bodies read as user-content per project security rules; summaries are paraphrased, not quoted.

### pydantic/pydantic-ai

- **v2.13.0** (2026-07-18) — Adds `include_model_request_parameters` OTel setting, `RaiseContentFilterError` capability, `cache_hit_ratio` on `RequestUsage`/`RunUsage`, and `get_model`/`resolve_model_id`/`for_agent` capability hooks. Fixes Mistral streaming settings, OTel context-detach spurious errors, and temporal workflow sandbox `pydantic_monty` passthrough.
- **v2.12.0** (2026-07-17) — Adds **Moonshot AI `kimi-k3` model support**, `EnqueuedMessagesEvent`, and `DeferredToolCallEvent`/`DeferredToolResultEvent` on `AgentStreamEvent`. Fixes tool binding for `POSITIONAL_OR_KEYWORD` params with `*args`; `ToolReturnPart` serialization aligned to `return_schema` field aliases; Mistral stream deferral fix for mid-integer tokens.
- **v2.11.0** (2026-07-16) — Exports `HistoryProcessor`; adds actionable hints to usage-limit and tool-retry errors. Fixes Anthropic + Bedrock `default_structured_output_mode='native'` sending untransformed schema; Mistral streaming number/integer validation edge cases.
- **v2.10.0** (2026-07-15) — `message_history` now provider-valid out of the box (repairs tool-call/result pairing). Adds OpenAI background mode + Anthropic `stop_reason=pause_turn` handling. Fixes `has_values()` false-positive on all-zero usage, `RenamedToolset` name-collision silent drop, `run_stream_sync` event-loop affinity. **Bumps `transformers` floor to ≥5.5.0 for CVE-2026-5241.**
- **v2.9.1** (2026-07-14) — Bug-fix bump. `JsonSchemaTransformer` typed-composition recursion, Mistral int-timeout handling, `KnownModelName` retired-model cleanup + Gateway-supported model restore. **Bumps `soupsieve` to 2.8.4 for CVE-2026-49477 (ReDoS).**

### crewAIInc/crewAI

- **1.15.4** (2026-07-17) — Promotes **Skills Repository out of experimental status**. Adds "Flows in Studio" documentation.
- **1.15.3** (2026-07-16) — Adds organization-ID param to PlusAPI client; adds step interception points and reworks execution-hooks documentation around `@on`; wires execution-boundary interception points; adds generic interception-hook dispatcher; runs declarative flows on the TUI (headless terminal fallback). **Behavior default flip:** tool-result caching is now **opt-in** instead of on-by-default — review if you rely on implicit caching. Also: token usage exposed under both names on agent/crew results; tool description no longer rewritten at construction; several turn/reply and null-repository-attribute fixes.
- **1.15.3a2** (2026-07-16) [PRE] — Release candidate for 1.15.3.
- **1.15.3a1** (2026-07-16) [PRE] — Alpha for 1.15.3.

### mastra-ai/mastra

- **@mastra/core@1.51.0** (2026-07-15) — Changelog states "Breaking Changes: None noted." Adds **durable-agent crash recovery** (`DurableAgent.listActiveRuns()`, `recover()`, `recoverActiveRuns()`, `Mastra.recoverAllDurableAgents()`, opt-in boot-time `recovery: { durableAgents: 'auto' }`, HTTP `POST /agents/:agentId/recover` + client-js `agent.recover({ runId })`). Adds **scoped `AgentController` sessions**: `scope`/`sessionScope` lets independent sessions run in parallel over the same `resourceId` (e.g. one session per git worktree). New `@mastra/platform-workspace@0.1.0` (Platform sandboxes + bucket-backed filesystems) and `@mastra/code-sdk@0.1.0` (public first-class SDK). `@mastra/mcp` adds `serverlessStreaming` + expanded notifications; MCP tool exec context gains optional `log`/`progress` hooks.

---

## Momentum picks

Top three by 7d star delta. Note: momentum-shift verdict (step 6.2) requires a 30d weekly-average baseline that only becomes available from week-5 onward — no framework in this cohort meets the strict `≥3× 30d avg AND ≥200 stars` bar this week. These picks are ranked movers, not confirmed anomalies.

### langgraph — +502 stars (7d)

Largest 7d star gain in the cohort despite no release in the window (last release 1.2.9 landed 2026-07-10, one day outside). Steady large-repo accumulation at ~72 stars/day. Driver unclear from release cadence alone; ambient LangChain-ecosystem gravity is the most likely explanation — 502 on a 37.7k base is +1.35% wow, roughly in-line with what a top-of-mind orchestration library adds week-to-week when nothing exceptional is happening.

### crewai — +403 stars (7d)

Second-largest gain, matched with the week's most substantive stable release. 1.15.3 promoted Skills Repository out of experimental and reworked execution hooks — the kind of surface-expansion release that pulls in evaluators. 4 releases in 2 days (Jul 16–17 window, including two prereleases) also signals the team is on an aggressive cadence, which tends to correlate with attention.

### mastra — +233 stars (7d)

Only TypeScript framework in the top 3 (aside from anchor). @mastra/core@1.51.0 shipped Jul 15 with two genuinely differentiated features — durable-agent crash recovery and scoped-sessions-per-resource (with a git-worktree example). Also closed **28 issues net** this week (463 → 435 open), the only framework in the cohort with issue-count going down — active triage is a leading indicator worth watching.

---

## Anchor position

aeon sits at 577 stars, +3 this week (+0.5%), ranking 9/9 by both absolute count and 7d delta — expected for the smallest and youngest framework in the cohort. Zero releases in the window (v0.1.0 shipped 2026-07-09, one day outside). The cohort added 1,897 stars total across 8 non-anchor frameworks this week; aeon captured 0.16% of that.

Two ecosystem signals worth calling out for the anchor:

- **Mastra's scoped-session pattern** (one AgentController session per git worktree) directly parallels aeon's GitHub-native runtime shape. If the "one session per repo state" idiom becomes convention in the TS-agent space, it validates the aeon topology — worth reading @mastra/core@1.51.0's `AgentController` docs closely.
- **pydantic-ai adding Moonshot `kimi-k3`** on Jul 16 aligns with the MoonshotAI/kimi-cli momentum tracked in github-trending on Jul 18–19. Model-support races usually favor Python-side frameworks first; the anchor is TypeScript, so this is neutral for aeon but confirms Moonshot is crossing an adoption threshold beyond raw stars.

Star-delta rank against cohort is expected to stay bottom-quintile while the framework is category-of-one (agent-as-platform vs. libraries); the interesting week-over-week metric will be release cadence, not stars.

---

## Source status

`gh_api: ok · reachable: 9/9 · releases_lookup: 9/9 · breaking_signals_fired: 0 · state_baseline_age: 7d (first delta-computable run)`
