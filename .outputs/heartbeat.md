HEARTBEAT_OK · STATUS_PAGE=DEGRADED

Ran heartbeat 14:00Z slot. Same two items as the prior two heartbeats:
- 🔴 `chain:overnight-research` failed at 05:57Z
- 🔵 `startup-idea` 6 days stale

Both within 48h dedup window → no notification sent. Regenerated `docs/status.md` (verdict 🔴 DEGRADED, next run startup-idea @ 18:00 UTC) and logged the run. Pattern is stable across 3 consecutive heartbeats now — recommend filing a tracked issue or dispatching `skill-repair` against `startup-idea` to break the silent re-flag cycle.
