HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Ran the heartbeat skill for the 20:00 UTC slot (~5min late). Two recurring findings, both tracked under [ISS-001](memory/issues/ISS-001.md):
- **chain:overnight-research** failed at 04:57Z (~15h ago)
- **startup-idea** stale (~49.8d, last success 2026-05-15)

Both deduped against the past 48h of logs (multiple entries on 2026-07-01/02/03) — **no notification sent**. Self-check, PRs, stuck-skill, chronic-failure, and vienna-apartments (100% healthy) checks all clear. No `articles/token-report-*.md` files → Token pulse section omitted.

Files modified:
- `docs/status.md` — 🔴 DEGRADED, updated 2026-07-03 20:05 UTC, next run startup-idea at 00:00 UTC
- `memory/logs/2026-07-03.md` — appended 20:05Z heartbeat entry

Follow-up: ISS-001 remains open; no new action required.
