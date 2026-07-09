# System Health

*Last updated: 2026-07-09*

## Current status: DEGRADED → pending recovery

Branch `claude/aeon-max-improvements-ix8xy5` was pushed 2026-07-09 and fixes both open issues. Status page should return to **OK** after this branch is merged and the next scheduled cycles confirm.

**Operator action required:** merge `claude/aeon-max-improvements-ix8xy5`.

---

## Resolved issues

### ISS-001 — chain:overnight-research always failing (resolved 2026-07-09)

**Root cause (two bugs):**
- **Bug A** — `chain-runner.yml` had a broken jq regex `test("skill: ${skill}("; "i")` with an unmatched `(`. jq errored, run-id lookup returned empty, chain aborted at Step 1/4.
- **Bug B** — `messages.yml` skill parser scanned the whole `aeon.yml`, so chain entries like `overnight-research:` and `jsonrender:` were registered as phantom skills. The chain's 04:45Z schedule caused a daily ghost `skill: overnight-research` dispatch (no SKILL.md → wasted Opus tokens).

**Downstream damage:** `startup-idea`, `idea-capture`, `morning-brief` (chain Steps 2–4) silently starved since 2026-05-15.

**Fix:** Bug A → exact match in chain-runner.yml; Bug B → `IN_SKILLS` section guard in messages.yml. Also found and fixed a third parser bug: block-format attributes (6-space indent) were invisible to the parser (needed at 4-space) — this was why `ai-framework-watch` never fired standalone.

### ISS-002 — vienna-apartments 06:00Z slot silently dropped (resolved 2026-07-09)

**Root cause (confirmed H1 — tick drift):** `messages.yml` catch-up path only looked back one hour (`PREV_HOUR`). GitHub Actions frequently drops consecutive */5 ticks during busy periods (the 08:00Z tick regularly fires 40-70 min late). When every tick from 06:00–07:59 is dropped, the first surviving tick has `PREV_HOUR=7` and the 06:00 slot is lost for the day.

**Fix:** Widened catch-up to scan all of today's earlier hours (same UTC day only), with `last_dispatch < slot-epoch` guard to prevent double-fire.

**Status:** skill is now also disabled (operator found apartment; skill no longer needed).

---

## Operational patterns observed

- **Tick drift is normal:** GHA cron ticks regularly land 10–70 min late. The 08:00Z heartbeat slot is the worst offender (~40–70 min late most days).
- **`./notify` sandbox issue:** direct `./notify` invocation fails in Actions sandbox when using shell command substitution (heredoc/backtick). Established fallback: write to `.pending-notify/<id>.md` — the post-run workflow step delivers it.
- **skill-health not yet populated:** `memory/skill-health/*.json` directory is empty; skill-health was just enabled 2026-07-09 and hasn't run yet.
- **heartbeat success rate:** 77% (108/140 as of 2026-07-09) — slightly below the 80% ideal but above the critical 50% threshold. Chronicle of clock-drift miss-logs rather than real failures.
