Heartbeat complete.

`HEARTBEAT_OK · STATUS_PAGE=DEGRADED`

## Summary

Ran the heartbeat ambient check (08:00 slot, ~32min late). Two P0/P3 items surfaced, both recurring under [ISS-001](../memory/issues/ISS-001.md):

- **🔴 chain:overnight-research** failed today at 05:40 UTC — the chain re-dispatched after a multi-day gap, downstream `overnight-research` succeeded (11/16, 69%) but the wrapper still marked failed. Same pattern as prior runs.
- **🔵 startup-idea** stale ~48.3d (last success 2026-05-15).

Self-check, PRs, stuck-skill, and chronic-failure scans all clear. Both findings logged in the past 48h → **dedup applied, no notification sent**. Regenerated `docs/status.md` (verdict 🔴 DEGRADED, next run `startup-idea` @ 12:00 UTC).

Files modified:
- `docs/status.md`
- `memory/logs/2026-07-02.md`
