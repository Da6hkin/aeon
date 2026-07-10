# System Health

*Last updated: 2026-07-10*

## Current status: OK (1 open issue)

Chain ran end-to-end on 2026-07-10 for the first time in ~30 days. ISS-001 and ISS-002 are resolved and merged to main. One open issue: ISS-003 (vibecoding-digest Reddit block).

---

## Open issues

### ISS-003 — vibecoding-digest permanently blocked (Reddit domain-ban)

**Severity:** medium  
**Category:** permanent-limitation  
**Detected:** 2026-07-09 (first run of skill), confirmed 2026-07-10  
**Affected skill:** vibecoding-digest

All Reddit endpoints return 403/block for the Anthropic crawler: curl (403), WebFetch on old.reddit.com / www.reddit.com / api.reddit.com (all blocked), teddit.net (blocked), libreddit.kavin.rocks (403), WebSearch reddit.com (domain-blocked by crawler policy). This is a permanent structural limitation, not a transient failure.

**Fix:** Add `scripts/prefetch-reddit.sh` that runs before Claude starts (full env + network access). Pre-fetch the three Reddit JSON endpoints for r/vibecoding (top/hot/rising) and cache to `.reddit-cache/vibecoding.json`.

---

## Resolved issues

### ISS-001 — chain:overnight-research always failing (resolved 2026-07-09)

**Root cause (two bugs):**
- **Bug A** — `chain-runner.yml` had a broken jq regex `test("skill: ${skill}("; "i")` with an unmatched `(`. jq errored, run-id lookup returned empty, chain aborted at Step 1/4.
- **Bug B** — `messages.yml` skill parser scanned the whole `aeon.yml`, so chain entries like `overnight-research:` and `jsonrender:` were registered as phantom skills. The chain's 04:45Z schedule caused a daily ghost `skill: overnight-research` dispatch (no SKILL.md → wasted Opus tokens).

**Downstream damage:** `startup-idea`, `idea-capture`, `morning-brief` (chain Steps 2–4) silently starved since 2026-05-15.

**Fix:** Bug A → exact match in chain-runner.yml; Bug B → `IN_SKILLS` section guard in messages.yml. Also found and fixed a third parser bug: block-format attributes (6-space indent) were invisible to the parser — this was why `ai-framework-watch` never fired standalone.

**Confirmed:** Chain ran clean 2026-07-10 (all 4 parallel steps + startup-idea + idea-capture + morning-brief succeeded).

### ISS-002 — vienna-apartments 06:00Z slot silently dropped (resolved 2026-07-09)

**Root cause (confirmed H1 — tick drift):** `messages.yml` catch-up path only looked back one hour (`PREV_HOUR`). GitHub Actions frequently drops consecutive */5 ticks during busy periods (the 08:00Z tick regularly fires 40-70 min late). When every tick from 06:00–07:59 is dropped, the first surviving tick has `PREV_HOUR=7` and the 06:00 slot is lost for the day.

**Fix:** Widened catch-up to scan all of today's earlier hours (same UTC day only), with `last_dispatch < slot-epoch` guard to prevent double-fire.

**Status:** skill is now also disabled (operator found apartment; skill no longer needed).

---

## Operational patterns

- **Tick drift is normal:** GHA cron ticks regularly land 10–70 min late. The 08:00Z heartbeat slot is the worst offender (~40–70 min late most days).
- **`./notify` sandbox issue:** direct `./notify` invocation fails in Actions sandbox when using shell command substitution (heredoc/backtick). Established fallback: write to `.pending-notify/<id>.md` — the post-run workflow step delivers it.
- **skill-health `last-report.json` stale:** Generated 2026-07-09 at 18:30Z (before chain recovery). Shows chain:overnight-research as CRITICAL — now incorrect. Next skill-health run will refresh.
- **heartbeat success rate:** ~77% (as of 2026-07-10) — slightly below 80% ideal but above the critical 50% threshold. Reflects tick-drift miss-logs rather than real failures.
- **Reddit permanently blocked:** reddit.com is domain-blocked by both sandbox curl layer and WebFetch (Anthropic crawler ban). All Reddit-dependent skills need a `scripts/prefetch-*.sh` pre-fetch workaround.
