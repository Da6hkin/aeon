HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Heartbeat run at 14:44 UTC.

**Findings:**
- 🔴 P0: `chain:overnight-research` failed ~33h ago (tracked in ISS-001).
- P0 chronic: heartbeat 51% / overnight-research 50% — at threshold, not strict <0.5.
- 🔵 P3 stale: `startup-idea` no success in ~23.5d; `chain:overnight-research` has no recorded success.
- No open PRs, no urgent issues, no token-report file (Token pulse section omitted).

**Dedup:** All findings logged today at 09:31Z and across 2026-06-06 runs. **No notification sent.**

**Actions:**
- Regenerated `docs/status.md` → 🔴 DEGRADED, 1 open issue, next run startup-idea 18:00 UTC.
- Appended 14:44Z entry to `memory/logs/2026-06-07.md`.
