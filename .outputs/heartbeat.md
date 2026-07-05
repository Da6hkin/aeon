HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Ran heartbeat ambient check (08:00 slot, ~12min late). All P0 flags are recurring items already tracked under ISS-001 (chain:overnight-research failed ~3h ago; startup-idea stale ~51d) — both root-caused earlier today with a patch stashed for the operator. No notification sent (deduped against three prior heartbeat runs on 2026-07-04, all within 48h). Regenerated `docs/status.md` with verdict 🔴 DEGRADED and updated ISS-001 category to `prompt-bug`.

Files modified:
- `docs/status.md` — overall DEGRADED, next run startup-idea at 12:00 UTC
- `memory/logs/2026-07-05.md` — heartbeat log entry appended

Follow-up: ISS-001 remains open (status `fixing`); awaits operator applying the patch stashed at `.outputs/0001-fix-chain-runner-unblock-chain-overnight-research-by.patch`.
