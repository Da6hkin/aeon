# Week in Review: Minitor Ships Self-Hosting, Integration Tests Land

*2026-07-13 — Weekly shipping update*

> Minitor shipped self-hosting this week — Docker/Railway deploys with a real password gate, a hardened integration layer, and the project's first formal test suite — while MiroShark crossed into French-language territory with an 86.9% translated UI.

## What Shipped

### Deploy Anywhere: Docker, Railway, and a Real Login Page

Minitor can now be deployed with a single `docker compose up` or a Railway one-click button. The `Dockerfile`, `docker-compose.yml`, `docker-entrypoint.sh`, and `railway.json` all ship in the repo; a `GET /health` endpoint tells Railway when the container is ready (`f59170f`, PR #100). A follow-up PR (#101) replaced the browser Basic Auth popup with a proper `/login` page backed by a server-side session — hosted deployments now fail-closed if `MINITOR_PASSWORD` is unset, with no fallback to the unauthenticated path (`913e027`). The two PRs together span `app/login/`, `lib/auth/session.ts`, `lib/hosted.ts`, and the proxy layer — 787 lines added across both.

### Integrations Hardened: Centralized Fetch, SSRF Closed, 700+ Lines of Tests

All 25 upstream integrations now route through a single `lib/integrations/fetch.ts` (`87f4374`) that adds timeout, automatic retry, and 429-backoff — a column can no longer hang the dashboard when an API flakes. An IPv6 SSRF hole in the webhook column validator was closed separately (`a4e0ac0`), and PR #100 landed 7 new test files covering fetch caching, roundtrips, rule matching, keyword matching, plugin contracts, and the webhook harness — 809 additions in the test commit alone. The project had no test suite before this week.

### MiroShark Adds French at 86.9%

External contributor Zarbel974 landed 340 new French translation pairs across 20 Vue components, bringing `tr()` coverage from roughly 70% to 86.9% (1,723 / 1,984 calls) (#239). The build passes at zero i18n scanner errors. This is the first community-contributed language beyond English.

## Fixes & Polish

- aeon-agent `1a77e36` (#153): scorer no longer raises `empty_output` on runs that legitimately produce no output — it was reading the whole log rather than just the final output, firing false positives when a skill logged an empty upstream source mid-run
- aeon-agent `e5c6fd0` (#152): TypeScript 7 bumped by Dependabot broke the Next.js 16.2.x dashboard build with "required package(s) not installed"; pinned back to 6.x until Next.js adds TS7 support
- minitor `62104e2` (#102): Reddit JSON API now returns 403 to unauthenticated clients; columns switched to the keyless Atom RSS feed (`/.rss`). GitHub stars and discussions now surface a clear token-required error instead of silently returning zeros. Bluesky and Bing columns removed.
- MiroShark `3518a80` (#241): social agent tool messages fixed to prevent empty LLM responses with personas — several edge cases were producing empty completions

## What's Nearly Here

PR #6 in this repo (`claude/aeon-max-improvements-ix8xy5`) adds `scripts/prefetch-reddit.sh` and Reddit OAuth to unblock `vibecoding-digest`, which has been blocked since Reddit domain-banned the Anthropic crawler (ISS-003). It has been open since 2026-07-11.

---

**Stats:** 96+ commits · 18 PRs merged · 0 issues closed · +28k / −65k lines (incl. #143 template re-base) · contributors: aaronjmars, aeonframework, Zarbel974, dan-and
**Sources:** [aaronjmars/aeon-agent](https://github.com/aaronjmars/aeon-agent) · [aaronjmars/miroshark-aeon](https://github.com/aaronjmars/miroshark-aeon) · [aaronjmars/minitor](https://github.com/aaronjmars/minitor) · [aaronjmars/MiroShark](https://github.com/aaronjmars/MiroShark) · commits=ok · prs=ok · releases=ok · issues=ok · open_prs=ok
