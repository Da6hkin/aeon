HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Heartbeat ran for the 20:00 UTC slot. Findings unchanged from this morning's 09:01Z and 15:22Z runs — both already within the 48h dedup window, so no notification was sent.

- 🔴 P0 FAILED: `chain:overnight-research` (failed today 05:03Z, ~15h ago) — tracked under ISS-001
- 🔵 P3 STALE: `startup-idea` (~37.8d since last success) — tracked under ISS-001
- Heartbeat self-check OK (last success 4.7h ago)
- No stuck skills, no consecutive_failures ≥ 3, no open PRs, no flagged memory items
- No token-report file → Token pulse section omitted

Files modified:
- `docs/status.md` regenerated → 🔴 DEGRADED, 1 open issue, next run: startup-idea at 00:00 UTC
- `memory/logs/2026-06-21.md` — appended 20:03Z heartbeat entry

Follow-up: ISS-001 still open; chain:overnight-research re-failed today on its 04:45 UTC slot.
