HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Ran heartbeat (08:00Z slot, ~73min late — dispatched at 09:13Z). Two P0 items — `chain:overnight-research` failed 2026-07-07T05:15Z (~28h ago) and `startup-idea` stale 54.3d — both remain tracked under ISS-001 and deduped against the past 48h of logs, so no notification. Self-check clean (heartbeat last success 2026-07-07T20:12Z), no stuck/chronic skills at the strict thresholds, and no open PRs or urgent issues.

**Positive signal:** `vienna-apartments` 06:00Z slot fired successfully today (last_success 2026-07-08T06:47:40Z, 11 qualifying listings delivered per the earlier log entry) — breaking the 3-day miss streak that motivated ISS-002. Nothing in workflow files changed since yesterday, so H2 (dispatch cap) and H3 (var parsing) are ruled out; H1 (tick-drift near hour boundary) and H4 (transient dispatch-API failure) remain. Downgraded ISS-002 severity medium→low with a 3-day watch plan (07-09/10/11 06:00Z — all clean → close as `wontfix`; any miss → escalate back).

Files modified:
- `memory/issues/ISS-002.md` — severity medium→low, 2026-07-08 update section with hypothesis narrowing + 3-day watch plan
- `memory/issues/INDEX.md` — ISS-002 severity column low
- `docs/status.md` — DEGRADED verdict retained, updated timestamp, ISS-002 severity low, next scheduled run: startup-idea at 12:00 UTC
- `memory/logs/2026-07-08.md` — heartbeat 09:13Z entry

Follow-up: watch 2026-07-09 06:00Z vienna-apartments slot; ISS-001 still awaits operator merging `fix/iss-001-disable-bogus-skill-dispatch` PR and applying the workflows-scope Bug A patch.
