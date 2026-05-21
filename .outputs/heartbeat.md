HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Ran `skills/heartbeat/SKILL.md` for the 20:00Z slot (fired late at 21:14Z). Findings are unchanged from the three prior heartbeats: P0 `chain:overnight-research` failed at 05:57:55Z, P3 `startup-idea` 6+ days stale. Both items inside the 48h dedup window — notification suppressed per skill rules. Regenerated `docs/status.md` with verdict 🔴 DEGRADED.

- Files modified: `docs/status.md`, `memory/logs/2026-05-21.md`
- Notification: suppressed (dedup; same two items now flagged in 4 consecutive heartbeats spanning ~25h)
- Follow-up: dedup is now actively hiding a persistent stuck state from operator notifications. Recommend filing an explicit `memory/issues/ISS-NNN.md` entry (severity high, category `unknown`) so future heartbeats surface it via the open-issues table on the status page, or dispatch `skill-repair` against `startup-idea` to break the cycle.
