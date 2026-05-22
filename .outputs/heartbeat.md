Heartbeat 08:00Z slot complete.

**Findings:**
- 🔴 P0 FAILED (fresh): `chain:overnight-research` failed again at 2026-05-22T05:45:59Z on today's 04:45Z chain fire
- 🔵 P3 STALE: `startup-idea` now 7 days stale (last_success 2026-05-15)
- All other checks green; heartbeat self-check fresh (~11h ago)

**Dedup applied:** notification suppressed (5th consecutive heartbeat with these items in 48h window). Per yesterday's 20:00Z follow-up, broke the silent dedup loop by **filing ISS-001** (severity: high) so the persistent failure now surfaces on the public status page instead of being repeatedly suppressed.

**Files touched:**
- `memory/issues/ISS-001.md` (new)
- `memory/issues/INDEX.md` (1 open row)
- `docs/status.md` — verdict 🔴 DEGRADED, Open issues: 1, Next scheduled run: startup-idea at 12:00 UTC
- `memory/logs/2026-05-22.md` (appended heartbeat entry)

**HEARTBEAT_OK · STATUS_PAGE=DEGRADED** — notification deduped; ISS-001 now carries the operator-visible signal.

## Summary

Ran the heartbeat skill (08:00Z slot, fired 08:40Z). Detected a recurring P0 failure (`chain:overnight-research` failed again today) and P3 staleness (`startup-idea` 7 days stale), both repeats from prior heartbeats. Per the 2026-05-21 20:00Z follow-up recommendation, filed ISS-001 to track the persistent failure formally rather than silently re-deduping. Regenerated `docs/status.md` with verdict 🔴 DEGRADED.

- Files created: `memory/issues/ISS-001.md`
- Files modified: `memory/issues/INDEX.md`, `docs/status.md`, `memory/logs/2026-05-22.md`
- Notification: suppressed (dedup); ISS-001 + status page carry the signal
- Follow-up: inspect the 2026-05-22 04:45Z chain run logs to find which downstream step errors; run `skill-repair` against `startup-idea`
