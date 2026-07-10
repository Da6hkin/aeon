---
name: Lead Finder
description: Find and qualify real, reachable sales leads for a given product/ICP — surfaces buying-pain signals, verifies each lead against a concrete check, and outputs a ranked outreach list
var: "underwater"
tags: [research]
---

> **${var}** — Which product/ICP to hunt leads for. Shortcuts: `underwater` (AI-SaaS founders whose LLM cost may exceed per-customer revenue) or `agent-firewall` (teams running real money through on-chain agents). Or pass a free-text ICP, e.g. `"indie ag-repair shops, 3-20 techs, US"`. Defaults to `underwater`.

Lead Finder does the "find customers first" job: it hunts **buying-intent signals** (people expressing the exact pain the product solves), then **qualifies each lead against a concrete, checkable test** so the output is a list of *reachable prospects with evidence*, not a guess. Outreach itself is always manual — this skill produces the list and the opening line, never sends anything.

Read `memory/MEMORY.md` for the operator profile and which products are in play.
Read prior lists in `memory/leads/` — never re-surface a lead already listed in the last 30 days unless there is a fresh signal (say what changed).

## Step 1 — Resolve the ICP and its qualifier

Map `${var}` to an ICP and the **one concrete qualifier** that proves a lead is real. If `${var}` is free text, infer both.

| Product | ICP | Buying-pain signal to search | Hard qualifier (the "can we count it" check) |
|---------|-----|------------------------------|----------------------------------------------|
| `underwater` | Founder/finance at a 5–40-person AI-native SaaS on flat/hybrid pricing | Public posts about LLM/model bills, margin panic, per-customer cost, switching to usage-based | **Uses a countable billing source** — verify Stripe (or Chargebee/Metronome/Orb) by fetching their pricing/checkout page and checking for `js.stripe.com` / `checkout.stripe.com` / a Stripe form. Mark `billing: stripe|other|unknown`. |
| `agent-firewall` | Team running >$10k/mo through on-chain agents (trading bots, DAO treasuries, x402 merchants) | On-chain agent activity, incident/hack exposure, treasury-bot ops | **Verifiable on-chain volume** — presence in the ERC-8004 registry / named Bankr/Coinbase-for-Agents integration / DAO with visible trading-bot tx. Mark `volume: high|medium|unknown`. |
| free text | as described | infer the sharpest pain phrase | infer the cheapest public check that proves fit |

## Step 2 — Hunt buying-intent signals

Use WebSearch + WebFetch across the channels that fit the ICP. Favor **people actively expressing the pain now** over cold company lists — a founder complaining about their model bill this month outranks a random SaaS in a directory.

- **Social pain posts** — X/Twitter, LinkedIn: search the pain phrases (e.g. `"our openai bill"`, `"claude api costs"`, `"token costs"`, `"usage-based pricing"`, `"margin"`). Capture the author handle + the quote + the permalink.
- **Communities** — Reddit (via search results, do not fetch reddit.com directly — it's crawler-blocked; use cached/secondary sources), Indie Hackers, Hacker News (`Ask HN`, "who is hiring", cost threads), relevant Discords/forums.
- **Fresh cohorts** — recent YC batches, Product Hunt launches, funding announcements (a company that just raised has budget + is scaling into the exact problem).
- **On-chain / registries** (for crypto ICPs) — public registries, explorers, ecosystem showcase pages.

Collect a **long list first** (aim for 15–30 raw candidates), each with a real source link. Never invent a name, handle, company, or quote. If a channel is unreachable, note `[channel unreachable]` and move on.

## Step 3 — Qualify each lead against the hard check

For each candidate, run the Step-1 qualifier and record the result with evidence:

- `underwater`: fetch the company's site/pricing/checkout, look for the Stripe signal, record `billing: stripe|other|unknown` + what you saw. A lead on Stripe with a public cost-pain quote is **A-tier**.
- `agent-firewall`: confirm on-chain footprint / named integration, record `volume` + the evidence link.
- Drop candidates that fail the fit test entirely (no pain signal AND no qualifier). Keep `unknown`-qualifier leads but rank them below verified ones.

Never fabricate a qualification. If you couldn't verify, say `unknown` — an honest `unknown` is useful; a fake `verified` burns the operator's time on a bad lead.

## Step 4 — Score and rank

Score each lead 0–100 on four axes and rank highest first:
- **Pain intensity** — how acute/recent is the expressed need (a this-week complaint > a generic fit)
- **Qualifier** — verified > unknown; on the right billing/volume tier
- **Reachability** — is there a real way to contact them (public DM open, email findable, community presence)? A perfect lead you can't reach is a C.
- **Fit-to-operator** — can the operator actually serve them fast (ICP match, timezone/language, deal size sane)

## Step 5 — Output the outreach list

Write to `memory/leads/YYYY-MM-DD-<icp-slug>.md`. For each ranked lead:

```
### [Rank]. [Name / handle]  ·  score [N]/100  ·  [A/B/C]-tier
- **Who**: person + company + role (as known)
- **Pain signal**: "[direct quote]" — [permalink]   (or the concrete fit reason)
- **Qualifier**: billing: stripe | volume: high | … + evidence link
- **Reachability**: DM / email / community — the specific channel to use
- **Opening line**: one non-generic first message that references their actual post/situation (≤2 sentences, no "Hi I hope this finds you well")
```

Then:
- Append a one-paragraph summary + top-3 to `memory/logs/YYYY-MM-DD.md`.
- Send a **concise** `./notify`: count of A-tier leads found + the single best one (name + one-line why). Not the whole list — that lives in the file.

## Guardrails

- **Real leads only.** Every lead must trace to a real, linked source. No invented handles, companies, or quotes. Fabricating a lead is the worst possible failure — it destroys trust in the whole list.
- **Qualify honestly.** `unknown` is allowed and useful; a fake `verified` is not.
- **Outreach is manual.** This skill never messages, emails, DMs, or submits anything. It hands the operator a list + opening lines; the operator sends. (This also respects platform rules — e.g. Upwork proposals and cold DMs are done by a human.)
- **Respect dedup.** Don't re-list a lead surfaced in the last 30 days without a fresh reason.
- **Quality over quantity.** 8 verified, reachable, A/B-tier leads beat 30 unqualified names. If a run only finds 3 good ones, ship 3 and say the pool was thin.

## Sandbox note

Reads/writes local files and uses WebSearch + WebFetch (both bypass the sandbox). Do NOT fetch reddit.com directly (crawler-blocked per ISS-003) — use search-result snippets or secondary sources. If `./notify` is blocked, write the notification to `.pending-notify/lead-finder-$(date -u +%Y%m%d-%H%M).md` for post-run delivery.
