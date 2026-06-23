HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Ran the 14:00 UTC heartbeat slot. Two recurring P0/P3 conditions persist (chain:overnight-research failed at 05:50Z; startup-idea stale since 2026-05-15) — both tracked under ISS-001 and within the 48h dedup window (today's 08:50Z run already logged them), so no notification fired. Regenerated `docs/status.md` with verdict 🔴 DEGRADED and next run `startup-idea at 18:00 UTC`, and appended the 14:09Z entry to `memory/logs/2026-06-23.md`. Files modified: `docs/status.md`, `memory/logs/2026-06-23.md`. Follow-up: ISS-001 still needs root-cause investigation of the chain runner / startup-idea step.
