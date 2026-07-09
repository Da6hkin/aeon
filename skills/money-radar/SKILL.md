---
name: Money Radar
description: Cross-stream synthesis engine — reads every signal Aeon collects and generates ranked, money-first, deliberately non-obvious ideas optimized for shortest time-to-revenue
var: ""
tags: [creative, research]
---

> **${var}** — Optional lens or constraint (e.g. "under $1k to start", "no code", "B2B only", "this week"). If empty, ranges freely across every domain and optimizes purely for time-to-first-dollar.

Money Radar is the layer on top of every other skill. Where `startup-idea` generates memos from one theme, Money Radar **synthesizes across all of Aeon's collected data at once** — trending repos, papers, funding rounds, token unlocks, DeFi shifts, prediction markets, dev chatter, and the operator's own history — to find opportunities that only appear when you look at several streams together. Domain-agnostic by design: crypto is allowed but never required. The only hard constraint is **money, fast**.

Read `memory/MEMORY.md` for the operator profile and goals.
Read the last 14 days of `memory/logs/` for recent signals and to dedup against ideas already proposed.
Read prior briefs in `memory/money-radar/` — never re-pitch a live idea from the last 21 days unless there is a material new signal (say what changed).
If soul files exist (`soul/SOUL.md`, `soul/STYLE.md`), read them for identity and voice.

## Steps

### 1. Ingest every signal stream

This is the "collect all the data" step. Read the freshest output of every skill from `.outputs/*.md` (each file is the latest run of that skill), plus recent memory. Pull concrete, dated facts — not vibes. Aim to touch as many of these as exist:

- `.outputs/github-trending.md`, `.outputs/hacker-news-digest.md`, `.outputs/vibecoding-digest.md` — what's being built and talked about
- `.outputs/deep-research.md`, `.outputs/paper-digest.md` — capability / research frontier
- `.outputs/deal-flow.md` — where capital is moving this week
- `.outputs/unlock-monitor.md`, `.outputs/defi-overview.md`, `.outputs/monitor-kalshi.md` — market/liquidity/probability signals
- `.outputs/startup-idea.md` — ideas already on the table (build on or avoid)
- `memory/logs/` (last 14 days), `memory/topics/*` — accumulated context and the operator's own thinking

For any file that is missing or stale, note it and move on — never block on a single stream. Then run **fresh web validation**: use WebSearch + WebFetch to confirm the 2–3 strongest signals are real and current (a claimed trend with no corroboration gets dropped, not pitched).

Sandbox fallback: if curl/WebFetch fail for a source, note `[source unreachable]` and proceed with the files you already have. Never fabricate a signal or a quote.

### 2. Build the operator profile

From memory + soul + logs, extract what makes *this* person able to capture an opportunity fast:
- **Proven ability** — what have they actually shipped and gotten paid for? (weight this heavily — the fastest path to money reuses a proven muscle)
- **Speed** — how fast do they ship? What's their realistic build budget (time + cash)?
- **Distribution they already have** — audience, reputation, communities, prior customers
- **Constraints** — solo? code vs no-code? capital available?

If memory is thin, infer conservatively and state the assumption.

### 3. Cross-stream synthesis (the actual edge)

Do not just summarize each stream. Look for **intersections** — the non-obvious opportunities that only exist because two or more signals line up. Explicitly hunt for:

- **Capability × demand gaps** — a new capability (from papers/repos) meets an unmet, complaining audience (from Reddit/HN/vibecoding)
- **Money-is-moving signals** — a funding round or DeFi/liquidity shift implies a downstream tool/service that suddenly has budget behind it
- **Arbitrage of attention** — something spiking in one community that an adjacent, higher-paying audience hasn't noticed yet
- **Picks-and-shovels** — when everyone chases X, the boring tool that serves all the X-chasers
- **Time-boxed windows** — an unlock date, a launch, a regulatory deadline, a prediction-market mispricing that creates a short, dateable opportunity

Write 3–5 one-line "connections spotted" before generating ideas. This section is the point of the skill — it is what no single digest produces.

### 4. Generate ranked ideas — money first

Produce **3–5 ideas**, each optimized for **time-to-first-dollar**, ranked fastest-payback first. Reject anything that fails the tarpit filter (generic AI wrappers, "community app", me-too SaaS, anything where "why hasn't this been built" answers itself). Every idea must fill every field with a concrete answer or be dropped:

```
### Idea N — [Name]  ·  first $ in ~[days/weeks]  ·  build effort: [S/M/L for a fast solo shipper]

**The move** (1 sentence): what you build/do and why it prints money
**Who pays, and why now**: named buyer type + the trigger that makes them pay this month
**Signals behind it**: which streams from Step 1/3 point here (cite the file or source)
**Fastest path to first dollar**: the single cheapest test that produces revenue, not just interest
**Price & math**: price point × realistic first-month volume = rough first revenue
**Distribution**: the specific channel to reach the first 10 buyers (name it; no "content marketing")
**Why it's non-obvious**: what most people are missing here
**Kill criteria**: the numeric signal (e.g. "<3 paid within 2 weeks") that says stop
```

### 5. Wildcard

End with **one "Wildcard"** — a genuinely non-obvious, slightly contrarian idea that most people would dismiss, drawn from the strangest signal intersection you found. It does not need to be safe. Label its risk honestly. This is where "something no one thought about" lives.

### 6. Save + notify

- Write the full brief to `memory/money-radar/YYYY-MM-DD.md` (create the dir if needed). Include the "connections spotted" section and all ideas.
- Send a **concise** notification via `./notify`: the single top-ranked idea (one line: the move + who pays + time-to-first-dollar) and the wildcard title. Keep it under ~500 chars — the full brief lives in the file. Do not dump all ideas into the notification.
- Append a one-paragraph log entry to `memory/logs/YYYY-MM-DD.md` summarizing what was synthesized and the top pick.

## Guardrails

- **Money, not interest.** A "fastest path to first dollar" must produce revenue, not signups or waitlist emails. If the fastest test only yields interest, say so and rank it lower.
- **No hype, no guarantees.** Rank by expected value and speed, and always state the risk and kill criteria. Never imply certainty. If a domain is a gamble (memecoins, presales, prediction markets), label it as variance, not a plan, and never make it the top pick unless the operator explicitly asked for a variance play via `${var}`.
- **Reuse proven muscle first.** The single best predictor of fast money is repeating something the operator has already been paid to do. Weight ideas that reuse their proven ability above novel ones, and make at least one idea a direct "do your last win again, but for [new signal]" play.
- **Dedup honestly.** If today's signals produce nothing materially new versus the last brief, say so and produce a short "no strong new edge today — here's the one incremental change" note rather than padding with filler ideas.

## Sandbox note

This skill reads local files (`.outputs/`, `memory/`) and does light web validation. If `./notify` is blocked by the sandbox (command-substitution restriction), write the notification body to `.pending-notify/money-radar-$(date -u +%Y%m%d-%H%M).md` — the workflow's post-run step delivers it. This is the established fallback (see vienna-apartments / github-trending logs).
