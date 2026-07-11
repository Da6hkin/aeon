---
name: Vibecoding Digest
description: Decision-ready pulse of r/vibecoding — ranked by signal score, narrative-clustered, with a one-line verdict and tools leaderboard
var: ""
tags: [content]
---
<!-- autoresearch: variation B — sharper output via signal scoring + verdict + narrative clusters + tools pulse + insight discipline -->

> **${var}** — Time window: `day` (default), `week`, or `month`. Controls Reddit's `?t=` sort period. Anything else → treat as `day`.

Read `memory/MEMORY.md` for context.
Read the last 2 days of `memory/logs/` to avoid repeating posts already covered.
Load `memory/seen-vibecoding.txt` if present (one post ID per line, last 200) — dedup against it.

## Data source

Reddit domain-bans the Anthropic crawler (WebFetch) **and** the sandbox blocks in-run curl, so this skill CANNOT fetch Reddit at runtime (ISS-003). Instead, `scripts/prefetch-reddit.sh` runs on the GitHub runner **before** Claude starts and caches the listings to `.reddit-cache/`. This skill reads those cache files — it does not fetch Reddit directly.

Cache files (populated by the prefetch step for r/vibecoding):
- `.reddit-cache/vibecoding-top.json` — top by score in the window
- `.reddit-cache/vibecoding-hot.json` — currently hot
- `.reddit-cache/vibecoding-rising.json` — rising (catches momentum before top)

Each file is the raw Reddit listing JSON (`.data.children[].data`). A file is **absent** if that endpoint failed in prefetch — treat absent/empty as that source = `fail`.

Fields to keep per post: `id`, `title`, `selftext`, `score`, `num_comments`, `upvote_ratio`, `author`, `created_utc`, `permalink`, `link_flair_text`, `is_self`, `domain`, `url`, `stickied`.

Comment threads (step 4) are **not** available at runtime (same crawler block). Work from post-level fields; if a post's `selftext` is thin, lean on title + flair + score signals rather than fetching comments. Skip the per-post comment fetch and note it in the source footer.

## Steps

### 1. Read the three cached sorts

Read the prefetched cache files (do NOT curl or WebFetch Reddit — both are blocked, see Data source):

```bash
STATUS_TOP=fail STATUS_HOT=fail STATUS_RISING=fail
[ -s .reddit-cache/vibecoding-top.json ]    && jq -e '.data.children[0]' .reddit-cache/vibecoding-top.json    >/dev/null 2>&1 && STATUS_TOP=ok
[ -s .reddit-cache/vibecoding-hot.json ]    && jq -e '.data.children[0]' .reddit-cache/vibecoding-hot.json    >/dev/null 2>&1 && STATUS_HOT=ok
[ -s .reddit-cache/vibecoding-rising.json ] && jq -e '.data.children[0]' .reddit-cache/vibecoding-rising.json >/dev/null 2>&1 && STATUS_RISING=ok
```

Read posts via `Read`/`jq` from whichever cache files are `ok`. If **all three** are `fail` (cache absent/empty — prefetch couldn't reach Reddit), notify `VIBECODING_DIGEST_ERROR: all Reddit endpoints blocked (ISS-003)` with the stale tools-pulse from the last successful run in `memory/logs/` for context, log to today's log, and exit. Do not fabricate posts.

### 2. Merge, dedupe, filter

- Union posts from top + hot + rising, dedupe by `id`.
- Drop `stickied: true`.
- Drop IDs present in `memory/seen-vibecoding.txt` or mentioned in the last 2 days of `memory/logs/`.
- If ≥3 endpoints succeeded and <5 posts survive dedup: it's a quiet day. Go straight to step 7 with a minimal "quiet day" digest (1-line vibe + tools pulse + source footer). Do not skip the notify.

### 3. Score and classify

For each surviving post, compute:

```
age_hours = (now - created_utc) / 3600
controversy_bonus = (num_comments * 2) if upvote_ratio < 0.70 else 0
signal_score = score + (2 * num_comments) + controversy_bonus - (age_hours * 0.3)
```

Classify each post into exactly one bucket (check in order, first match wins):

1. **Ship** — title or selftext contains any of: "I built", "I shipped", "I made", "launched", "my app", "my project", "we built", "we shipped", "MVP", "v1", "release", "now live". Note stack, user count, revenue if cited.
2. **Debate** — `upvote_ratio < 0.70` AND `num_comments ≥ 20`, OR title is a question/opinion ("is", "are", "should", "why", "vs", "the problem with", "hot take", "unpopular opinion").
3. **Tutorial** — contains: "how to", "guide", "workflow", "setup", "prompt", "tip", "tutorial", "lesson", "what I learned".
4. **Meme** — `is_self: false` AND (domain is image host: i.redd.it, imgur, i.imgur, v.redd.it) AND (score/num_comments ratio > 20 = people upvote and move on).
5. **Other** — everything else.

### 4. Pick winners

Rank all posts by `signal_score` desc. Select:

- **Top 5 posts** for the main list — cap 2 per bucket (so no bucket dominates unless signal demands it).
- **Top 2 spicy threads** — highest `controversy_bonus` among Debate bucket (ratio < 0.70). If fewer than 2 exist, show what you have; don't invent drama.

For those 7 posts (5 + 2), fetch the comment thread via the comments endpoint. Skip if fetch fails (log which ones).

### 5. Extract signals

**Verdict (one-line):** Based on bucket distribution across the top 5 posts:
- `SHIPPING` — ≥3 Ship posts
- `DEBATING` — ≥3 Debate posts OR ≥1 in top-2 signal
- `LEARNING` — ≥3 Tutorial posts
- `HYPE` — ≥3 Meme posts
- `MIXED` — no bucket dominates

**Tools pulse:** Scan all fetched posts (titles + selftext) AND all fetched comments for tool mentions. Count case-insensitive occurrences of: `Claude Code`, `Claude`, `Cursor`, `Windsurf`, `Bolt.new`, `Bolt`, `Replit`, `v0`, `Lovable`, `Codex`, `Copilot`, `ChatGPT`, `Gemini`, `Aider`, `Cline`. Output the top 6 by count — this is the community's live tool leaderboard.

**Narrative clusters:** Group the top 5 posts into 1-3 themes. A theme = ≥2 posts sharing ≥2 content keywords (not stopwords). Name each theme in 2-4 words (e.g., "Claude Code vs Cursor", "revenue from vibe apps", "context-window frustration").

**Insight-per-post:** For each of the 5 main posts, write a 1-line **insight** that goes beyond restating the title. What does this post reveal about the community, the tools, or the practice? If you can't exceed the title, cut the post and promote the next in rank.

### 6. Build the digest

```
## Vibecoding Digest — ${today}

**Verdict:** {SHIPPING|DEBATING|LEARNING|HYPE|MIXED} — {≤12-word rationale: what drove the verdict}

**Tools pulse:** 1. {tool} ({N}) · 2. {tool} ({N}) · 3. {tool} ({N}) · 4. {tool} ({N}) · 5. {tool} ({N}) · 6. {tool} ({N})

**Narratives:** {theme 1} · {theme 2} · {theme 3}

### Top 5

1. **[title]** — {bucket} · {score}pts · {num_comments}c · {ratio as %}%
   *Insight:* {what this post reveals — not a paraphrase}
   https://reddit.com{permalink}

2. ... (repeat for 5)

### Spicy threads

**"[post title]"** — {num_comments}c · {ratio}% upvoted
- u/{commenter}: "{sharpest-take comment excerpt, ≤40 words}"
- u/{commenter}: "{second best excerpt}"

**"[post title]"** — {num_comments}c · {ratio}% upvoted
- u/{commenter}: "{excerpt}"

---
_sources: top={ok|fail} hot={ok|fail} rising={ok|fail} · scanned={N} · new={N} · dedup={N}_
```

**Hard constraints:**
- Every `Insight:` line must state a claim, implication, or pattern — not restate the title. Use verbs: "reveals", "suggests", "signals", "confirms", "contradicts".
- No "lots of people are excited about X" — name the tool, cite the count.
- Exactly 5 top posts (not 4, not 8) unless dedup left fewer — in which case cite the count in the source footer.
- `ratio as %` = `round(upvote_ratio * 100)`.

### 7. Notify

Send via `./notify`:

```
r/vibecoding — ${today}

verdict: {VERDICT} — {≤12-word rationale}
tools: {tool1} {N} · {tool2} {N} · {tool3} {N}

top:
1. "{title}" — {score}pts, {comments}c
2. "{title}" — {score}pts, {comments}c
3. "{title}" — {score}pts, {comments}c

spicy: "{controversial title}" ({ratio}%, {comments}c)
  "{sharpest comment excerpt, ≤25 words}" — u/{author}

src: top={ok|fail} hot={ok|fail} rising={ok|fail}
```

Quiet-day fallback (<5 posts after dedup):
```
r/vibecoding — ${today}
quiet day — {N} posts after dedup
tools pulse: {tool1} {N} · {tool2} {N} · {tool3} {N}
src: top={ok|fail} hot={ok|fail} rising={ok|fail}
```

### 8. Log and persist

Append to `memory/logs/${today}.md`:
```
## Vibecoding Digest
- **Window:** {day|week|month}
- **Verdict:** {VERDICT} ({rationale})
- **Top post:** "{title}" — {score}pts, {comments}c (signal {score})
- **Most controversial:** "{title}" — {ratio}% upvoted, {comments}c
- **Tools pulse (top 3):** {tool1}={N}, {tool2}={N}, {tool3}={N}
- **Narratives:** {theme1}, {theme2}, {theme3}
- **Sources:** top={ok|fail} hot={ok|fail} rising={ok|fail}
- **Scanned / new / dedup:** {S} / {N} / {D}
- **Notification sent:** yes
```

Append the post IDs of everything in the top 5 + spicy threads to `memory/seen-vibecoding.txt` (create if missing). Keep only the last 200 lines.

If any post surfaces a take or insight relevant to topics tracked in `MEMORY.md` (e.g., specific tool regressions, new workflows worth reading), note it there under the appropriate topic.

## Sandbox note

Reddit **cannot** be fetched at runtime: the Anthropic crawler (WebFetch) is domain-banned and the sandbox blocks in-run curl (ISS-003). This skill therefore uses the **pre-fetch pattern** — `scripts/prefetch-reddit.sh` runs on the runner before Claude and writes `.reddit-cache/vibecoding-{top,hot,rising}.json`; this skill only reads those files. Never curl or WebFetch Reddit from inside the skill — it will fail.

For reliability from GitHub's datacenter IPs, set `REDDIT_CLIENT_ID` + `REDDIT_CLIENT_SECRET` secrets (free "script" app at reddit.com/prefs/apps) — the prefetch uses Reddit OAuth when present, and falls back to anonymous `old.reddit.com` otherwise. If the cache is empty, emit `VIBECODING_DIGEST_ERROR` and exit — do not attempt a runtime fetch.

## Output codes

- `VIBECODING_DIGEST_OK` — normal run, ≥5 posts after dedup.
- `VIBECODING_DIGEST_QUIET` — <5 posts after dedup but ≥1 source succeeded.
- `VIBECODING_DIGEST_ERROR` — all sources failed or 0 posts total.
