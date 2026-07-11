#!/usr/bin/env bash
# Pre-fetch Reddit listings OUTSIDE the Claude sandbox / crawler (ISS-003).
#
# Reddit domain-bans the Anthropic crawler, so WebFetch returns nothing, and the
# in-run sandbox blocks curl — so reddit-dependent skills get zero data at
# runtime. This script runs on the GitHub runner BEFORE Claude starts (the
# workflow invokes every scripts/prefetch-*.sh), using the runner's own IP + a
# Reddit-preferred User-Agent (and Reddit OAuth if app creds are configured,
# which is far more reliable from datacenter IPs). Results are cached to
# .reddit-cache/ for the skill to read.
#
# Optional secrets for reliability (create a free "script" app at
# https://www.reddit.com/prefs/apps): REDDIT_CLIENT_ID, REDDIT_CLIENT_SECRET.
# Without them it falls back to anonymous old.reddit.com (works but rate-limited).
set -uo pipefail

SKILL="${1:-}"
VAR="${2:-}"

# Only act for reddit-dependent skills.
case "$SKILL" in
  vibecoding-digest|reddit-digest) ;;
  *) echo "reddit-prefetch: no prefetch for '$SKILL'"; exit 0 ;;
esac

mkdir -p .reddit-cache

# Reddit's preferred UA format (generic UAs get 429'd fast).
UA="${REDDIT_USER_AGENT:-web:aeon-vibecoding-digest:1.0 (by /u/aeonbot)}"

# --- Optional OAuth (app-only / client_credentials) ---
TOKEN=""
if [ -n "${REDDIT_CLIENT_ID:-}" ] && [ -n "${REDDIT_CLIENT_SECRET:-}" ]; then
  TOKEN=$(curl -s --max-time 20 -A "$UA" \
    -u "${REDDIT_CLIENT_ID}:${REDDIT_CLIENT_SECRET}" \
    -d "grant_type=client_credentials" \
    "https://www.reddit.com/api/v1/access_token" 2>/dev/null \
    | jq -r '.access_token // empty' 2>/dev/null)
  if [ -n "$TOKEN" ]; then
    echo "reddit-prefetch: authenticated via OAuth"
  else
    echo "reddit-prefetch: OAuth creds present but token fetch failed — falling back to anonymous"
  fi
fi

# reddit_fetch <outfile> <path-with-query>
reddit_fetch() {
  local outfile="$1" path="$2" code items
  if [ -n "$TOKEN" ]; then
    code=$(curl -s -A "$UA" -H "Authorization: bearer $TOKEN" --max-time 25 \
      -o ".reddit-cache/$outfile" -w "%{http_code}" \
      "https://oauth.reddit.com${path}" 2>/dev/null || echo "000")
  else
    code=$(curl -s -A "$UA" --max-time 25 \
      -o ".reddit-cache/$outfile" -w "%{http_code}" \
      "https://old.reddit.com${path}" 2>/dev/null || echo "000")
  fi
  items=$(jq '[.data.children[]?] | length' ".reddit-cache/$outfile" 2>/dev/null || echo 0)
  if [ "$code" = "200" ] && [ "${items:-0}" -gt 0 ]; then
    echo "reddit-prefetch: OK $outfile (HTTP $code, $items items)"
    return 0
  fi
  echo "::warning::reddit-prefetch: FAILED $outfile (HTTP $code, items=${items:-0})"
  rm -f ".reddit-cache/$outfile"
  return 1
}

# Resolve subreddit + window.
SUB="" WINDOW="day"
case "$SKILL" in
  vibecoding-digest)
    SUB="vibecoding"
    case "$VAR" in day|week|month) WINDOW="$VAR" ;; *) WINDOW="day" ;; esac
    ;;
  reddit-digest)
    # reddit-digest may pass a single subreddit via var; multi-sub configs are
    # resolved by the skill itself, so only prefetch when a single sub is given.
    SUB="${VAR#r/}"
    ;;
esac

if [ -z "$SUB" ]; then
  echo "reddit-prefetch: no subreddit resolved for '$SKILL' (var='$VAR'), skipping"
  exit 0
fi

reddit_fetch "${SUB}-top.json"    "/r/${SUB}/top.json?t=${WINDOW}&limit=30" || true
reddit_fetch "${SUB}-hot.json"    "/r/${SUB}/hot.json?limit=30"             || true
reddit_fetch "${SUB}-rising.json" "/r/${SUB}/rising.json?limit=15"          || true

echo "reddit-prefetch: done for $SKILL (sub=$SUB, window=$WINDOW)"
ls -la .reddit-cache/ 2>/dev/null || true
exit 0
