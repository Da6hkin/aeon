## Summary

Heartbeat 15:33Z (14:00 UTC slot, ~93min late) — all flagged items are recurring under ISS-001 and dedup-suppressed; no notification sent.

**Findings:**
- 🔴 `chain:overnight-research` failed 2026-06-25T05:37Z (~34h ago); today's 04:45 UTC slot never dispatched
- 🔵 `startup-idea` stale ~42.6d (ISS-001)
- 🔵 `vienna-apartments` stale ~55.6h — newly crossed 48h threshold, today's & yesterday's 06:00 UTC slots both never dispatched; folded under ISS-001 (same scheduler-dispatch root cause)
- Chronic info: heartbeat 69%, overnight-research 64% — both above the 0.5 threshold
- Self-check OK: heartbeat succeeded 2026-06-26T08:23Z
- No stuck skills, no PRs, no urgent issues

**Actions:**
- Regenerated `docs/status.md` → 🔴 DEGRADED, 1 open issue, next run startup-idea at 18:00 UTC
- Appended log entry to `memory/logs/2026-06-26.md`

HEARTBEAT_OK · STATUS_PAGE=DEGRADED
