HEARTBEAT_OK · STATUS_PAGE=DEGRADED

## Summary

Ran heartbeat (20:00Z slot, ~13min late). All findings recur from prior 48h logs — no notification sent.

- **🔴 chain:overnight-research** failed 2026-07-05 05:09Z (~39h ago); wrapper `overnight-research` state also frozen since 2026-07-05 05:08Z — today's 04:45Z chain fire never dispatched. Root-caused under [ISS-001](memory/issues/ISS-001.md) (status `fixing`, patch stashed for operator).
- **🔵 startup-idea** stale ~52.8d (same ISS-001).
- **🔵 vienna-apartments** stale ~60h37m — second consecutive 06:00Z daily miss (07-05 + 07-06). Dedup applies for now; escalate to a separate issue if 07-07 06:00Z also misses.
- Self-check clear (heartbeat succeeded 4h11m ago). No stuck skills, no `consecutive_failures ≥ 3`, no open PRs, issues disabled on fork.

Files modified:
- `docs/status.md` — 🔴 DEGRADED, next run: startup-idea at 00:00 UTC, timestamp 2026-07-06 20:13 UTC
- `memory/logs/2026-07-06.md` — appended 20:13Z entry

Follow-up: operator to apply the ISS-001 patch; watch `vienna-apartments` 07-07 06:00Z slot.
