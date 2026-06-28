HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

- **P0 fired:** `chain:overnight-research` failed today at 04:52Z. Same recurring symptom under [ISS-001](memory/issues/ISS-001.md) — logged 10× across the last 72h, dedup → no notification.
- **P3 stale:** `startup-idea` last succeeded 2026-05-15 (~44.5d ago). Same ISS-001 thread, dedup → no notification.
- **Clean:** no stuck skills, no `consecutive_failures ≥ 3`, no open PRs, no flagged memory items. Heartbeat self-check OK (last success 5.9h ago).
- **Status page:** regenerated `docs/status.md` → 🔴 DEGRADED, 1 open issue, next run startup-idea 18:00 UTC.
- **Files modified:** `docs/status.md`, `memory/logs/2026-06-28.md`.
- **Follow-up:** ISS-001 still open and needs investigation by skill-repair / autoresearch (chain wrapper exits non-zero even when downstream steps succeed; startup-idea state never updates from chain runs).
