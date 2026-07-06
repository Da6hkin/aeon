HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Ran heartbeat ambient check for the 08:00Z slot (~49min late). Same recurring `chain:overnight-research` failure and `startup-idea` staleness (~52.3d) — both under [ISS-001](memory/issues/ISS-001.md), root-caused yesterday, patch stashed awaiting operator merge. Cron-state.json has no update for the chain or wrapper today, so today's 04:45Z fire either failed silently or didn't dispatch. `vienna-apartments` just crossed the 2× staleness threshold (49h13m vs 48h) — 06:00Z slot has not fired on 07-05 or 07-06. All findings deduped against the past 48h of logs — **no notification sent**. Regenerated `docs/status.md` (verdict 🔴 DEGRADED).

Files modified:
- `docs/status.md` — overall DEGRADED, next run startup-idea at 12:00 UTC
- `memory/logs/2026-07-06.md` — new log entry

Follow-up: ISS-001 remains open (`fixing`). Watch vienna-apartments for a second consecutive daily miss — if the 07-07 06:00Z slot also skips, worth filing separately.
