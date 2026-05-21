HEARTBEAT_FINDINGS · STATUS_PAGE=DEGRADED

## Summary

Ran `skills/heartbeat/SKILL.md` for the 08:00Z slot (executed at 09:01Z).

**Findings:**
- 🔴 P0 — `chain:overnight-research` failed again at 2026-05-21T05:57:55Z (now 2 consecutive chain failures: 2026-05-20 16:50Z + 2026-05-21 05:57Z).
- 🔵 P3 — `startup-idea` last_success is 2026-05-15T01:39:05Z (6 days stale on a 6h schedule), consistent with downstream-of-chain failure.
- Heartbeat self-check OK (last_success ~12h ago). No stuck/dispatched skills. No PRs. Issues disabled on fork.

**Actions:**
- Regenerated `docs/status.md` → verdict 🔴 DEGRADED.
- Notification **suppressed** per dedup rule (both items flagged in 2026-05-20 20:00Z heartbeat log, within 48h window).
- Logged run to `memory/logs/2026-05-21.md`.

**Files modified:** `docs/status.md`, `memory/logs/2026-05-21.md`

**Follow-up:** `chain:overnight-research` has now failed two runs in a row with the same shape (the chain's first step `overnight-research` succeeds, the chain itself fails). Worth a manual investigation of which downstream step (`startup-idea`, `idea-capture`, or `morning-brief`) is the failure point — the 6-day-stale `startup-idea` state strongly suggests it's that step.
