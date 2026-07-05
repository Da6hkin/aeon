# overnight-research (2026-07-05) — root cause found

This run diagnosed **ISS-001** ("chain:overnight-research keeps failing"). Root cause identified across **two independent bugs**.

## Why `skill: overnight-research` even exists

`overnight-research` is a **chain**, not a skill. But the scheduler in `.github/workflows/messages.yml` (skill parser, lines 108–138) reads `aeon.yml` line-by-line and matches any two-space-indented `name:` line as a skill. Inside `chains:`, the entry `  overnight-research:` (two-space indent, colon-EOL) matches this regex, and the following `    schedule: "45 4 * * *"` matches the four-space schedule regex. So the chain gets registered *twice*:

- as a skill → dispatched via `aeon.yml -f skill=overnight-research` (this run — bogus, no `SKILL.md` exists)
- as a chain → dispatched via `chain-runner.yml -f chain=overnight-research` (proper — but see next bug)

Result: two runs fire in parallel every day at 04:45 UTC; the wrapper "skill" run is a no-op that spins up Claude just to ask why the file doesn't exist.

## Why `chain: overnight-research` fails

`chain-runner.yml` line 63 builds a jq filter to discover the run_id of a skill it just dispatched:

```
-q "[.[] | select(.displayTitle | test(\"skill: ${skill}(\"; \"i\")) | ..."
```

Expanded: `test("skill: github-trending("; "i")`. The regex `skill: github-trending(` has an **unmatched `(`**. Reproduced:

```
$ echo '[{...}]' | jq 'test("skill: github-trending("; "i")'
jq: error: Regex failure: end pattern with unmatched parenthesis
```

`stderr` is redirected to `/dev/null` and the pipe has `|| true`, so the caller sees empty output. The polling loop runs its full 60s, `dispatch_skill` returns 1, `set -e` aborts the chain. Every chain run has died at Step 1/4 since 2026-05-15 — no dispatched skill has ever been awaited or had its output collected.

Confirmed against today's run (`chain: overnight-research` #28730288934): exited exit-1 at 05:09:32Z (~67s after start), matches the 60s poll + fallout timing exactly.

## Downstream signal (why `startup-idea` is 51 days stale)

`startup-idea` is Step 2 of the chain. Since Step 1 dies before dispatching Step 2, `startup-idea` has not been dispatched via the chain path since 2026-05-15. Its standalone dispatch (if any) is separate. Same for `idea-capture` and `morning-brief` — all three downstream steps are silently starved.

## Fixes proposed

Patch prepared at `.outputs/0001-fix-chain-runner-unblock-chain-overnight-research-by.patch`. **Could not open a PR from this run** — the default `GITHUB_TOKEN` in the aeon.yml workflow lacks the `workflows` scope, so pushing edits to `.github/workflows/*.yml` was rejected with:

> refusing to allow a GitHub App to create or update workflow `.github/workflows/chain-runner.yml` without `workflows` permission

**Operator action required:**

```bash
# From a workstation with a PAT that has `workflow` scope:
git checkout -b fix/overnight-research-chain main
git am < .outputs/0001-fix-chain-runner-unblock-chain-overnight-research-by.patch
git push -u origin fix/overnight-research-chain
gh pr create --fill
```

Or store a PAT with `workflow` scope in the `GH_GLOBAL` repository secret so future automated fixes can push workflow edits directly.

The two patches applied by that patch file:

1. **`.github/workflows/chain-runner.yml`** — replace the broken regex with an exact-or-startswith filter so run_id lookup actually works.
2. **`.github/workflows/messages.yml`** — teach the skill parser to skip the `chains:` block so chain names are no longer double-dispatched as skills.

## Verification plan (post-merge)

- Next scheduled 04:45 UTC fire should produce exactly ONE run (`chain: overnight-research`), not two.
- Chain-runner should reach Step 4/4 or fail on a genuine step failure (not on the polling bug).
- `startup-idea` state should update within one cycle.
