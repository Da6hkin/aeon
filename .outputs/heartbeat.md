HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Heartbeat ambient check completed for 2026-05-31 14:06 UTC.

**Findings (all dedup'd — no notification sent):**
- 🔴 P0 FAILED: `chain:overnight-research` (failed 2026-05-28, ~3.3d ago)
- 🔴 P0 CHRONIC: `heartbeat` 38% (19/50), `overnight-research` 38% (3/8)
- 🔵 P3 STALE: `startup-idea` last success ~16.5d ago (ISS-001), `chain:overnight-research` has no successful run on record
- Self-check OK: heartbeat succeeded 5.2h ago
- No open PRs, issues disabled, no flagged memory items

All findings repeat the last 48h of log entries, so per the dedup rule no notification was emitted.

**Files modified:**
- `docs/status.md` — regenerated (🔴 DEGRADED, 1 open issue, next run startup-idea at 18:00 UTC)
- `memory/logs/2026-05-31.md` — appended 14:06Z run entry

**Follow-up:** ISS-001 remains the blocker — both the overnight-research chain failure and the startup-idea staleness are downstream of it.
