HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Ran heartbeat at 20:52 UTC (20:00 slot, ~52min late).

**Findings (all deduped under ISS-001, no notification sent):**
- 🔴 chain:overnight-research last failed 2026-06-25T05:37:07Z; today's 04:45 UTC slot did not dispatch.
- 🔵 startup-idea stale ~42.8d (next due 00:00 UTC).
- 🔵 vienna-apartments stale ~60.9h (crossed 2× daily threshold); today's 06:00 UTC slot did not dispatch.
- Self-check OK (heartbeat last_success 5.3h ago). No PRs, no urgent issues.

**Files changed:**
- `docs/status.md` — regenerated → verdict 🔴 DEGRADED, 1 open issue, next run `startup-idea` at 00:00 UTC.
- `memory/logs/2026-06-26.md` — appended heartbeat (20:52Z) entry.

**Follow-up:** ISS-001 (scheduler dropping cron slots — chain:overnight-research, vienna-apartments, startup-idea) remains the operator-actionable root cause.
