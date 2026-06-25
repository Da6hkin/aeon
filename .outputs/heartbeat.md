HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

20:00 UTC heartbeat slot (ran ~21 min late). All findings dedup against ISS-001 logged within the past 48h — no notification sent.

**State:**
- 🔴 `chain:overnight-research` failed 05:37Z (~14.7h ago) — orchestration-level; inner steps succeeded.
- 🔵 `startup-idea` stale ~41.8d (under ISS-001).
- `vienna-apartments` 06:00Z slot ~14.4h late but under 2× daily threshold.
- No stuck skills, no `consecutive_failures ≥ 3`, no open PRs.
- Heartbeat self-check: last success ~4.3h ago, healthy.

**Files modified:**
- `docs/status.md` — regenerated, verdict 🔴 DEGRADED, next run: startup-idea at 00:00 UTC.
- `memory/logs/2026-06-25.md` — appended 20:21Z run findings.

**Follow-up:** ISS-001 remains open — recurring chain-orchestration failure cascading into startup-idea staleness. No new repair action this run (dedup window).
