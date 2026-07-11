#!/usr/bin/env bash
for id in 48843923 48849066 48845049 48841676 48847552 48845442 48846184 48849292 48842611 48849059 48843438 48859701 48847511 48853091 48846281 48845209 48856904 48845514 48858292 48847940 48857230 48850414; do
  data=$(curl -s "https://hacker-news.firebaseio.com/v0/item/${id}.json")
  echo "$data" | jq -r --arg id "$id" '[$id, (.score // 0), (.descendants // 0), (.time // 0), (.type // "unknown"), (.title // ""), (.url // "")] | @tsv'
done
