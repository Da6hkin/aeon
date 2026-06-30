HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Ran the heartbeat ambient check. Same two recurring items under [ISS-001](memory/issues/ISS-001.md) — `chain:overnight-research` failed at 2026-06-28 04:52Z (~51h ago) and `startup-idea` stale (~46d, schedule every 6h). Self-check, PRs, stuck skills, chronic failures (<0.5), and flagged-memory scans all clear. Both findings were logged within the past 48h, so deduped — **no notification sent**.

Files modified:
- `docs/status.md` — verdict 🔴 DEGRADED, 1 open issue, next run startup-idea at 12:00 UTC
- `memory/logs/2026-06-30.md` — new log entry
