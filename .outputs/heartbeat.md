HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Heartbeat ran at 08:12Z on 2026-06-06.

**Findings (all deduped against last 48h of logs — no notification sent):**
- 🔴 P0 FAILED: `chain:overnight-research` failed today at 05:43Z (tracked under ISS-001)
- 🔴 P0 CHRONIC: `heartbeat` at 47% success rate (28/59)
- 🔵 P3 STALE: `startup-idea` last succeeded 22.3 days ago; chain has never recorded a success
- No open PRs, issues disabled, no flagged memory items

**Files modified:**
- `docs/status.md` → regenerated, verdict 🔴 DEGRADED, next run startup-idea at 12:00 UTC
- `memory/logs/2026-06-06.md` → appended heartbeat entry

**Follow-up:** ISS-001 remains open; root cause of the chain failure still unknown after 15 days. Worth investigating the workflow logs for the failing step.
