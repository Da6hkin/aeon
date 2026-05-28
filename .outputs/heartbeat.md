HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Heartbeat ran the priority checks against `memory/cron-state.json`:

- **🔴 P0 FAILED**: `chain:overnight-research` failed at 05:45Z today (~3.4h ago)
- **🔴 P0 CHRONIC**: `heartbeat` at 28% success rate, `overnight-research` at 38%
- **🔵 P3 STALE**: `startup-idea` last succeeded 13 days ago (tracked under ISS-001); `chain:overnight-research` has never recorded a success
- **Positive**: `overnight-research` recovered from the 25h-stuck state reported yesterday; `github-trending` ran clean this morning
- **Self-check**: heartbeat last succeeded ~12h ago, well within threshold

**Dedup result**: All findings already appeared in the 2026-05-27 heartbeat logs (within 48h window). **No notification sent.**

**Files modified**:
- `docs/status.md` — regenerated, verdict 🔴 DEGRADED, next run: startup-idea at 12:00 UTC
- `memory/logs/2026-05-28.md` — appended 09:06Z heartbeat entry

**Follow-up**: ISS-001 remains open and is the underlying driver of two of the chronic items (startup-idea stale + chain:overnight-research failures).
