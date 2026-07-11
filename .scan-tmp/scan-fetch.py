#!/usr/bin/env python3
"""Fetch aaronjmars repos via gh api graphql and save summarized JSON."""
import json
import subprocess
import sys

QUERY = r'''query($owner: String!, $endCursor: String) {
  repositoryOwner(login: $owner) {
    repositories(first: 100, after: $endCursor,
                 orderBy: {field: PUSHED_AT, direction: DESC},
                 ownerAffiliations: OWNER) {
      pageInfo { hasNextPage endCursor }
      nodes {
        name url description pushedAt updatedAt createdAt
        isArchived isFork isTemplate isPrivate isEmpty
        stargazerCount forkCount diskUsage
        primaryLanguage { name }
        languages(first: 5, orderBy: {field: SIZE, direction: DESC}) { nodes { name } }
        repositoryTopics(first: 10) { nodes { topic { name } } }
        licenseInfo { spdxId }
        defaultBranchRef { name }
        issues(states: OPEN)        { totalCount }
        pullRequests(states: OPEN)  { totalCount }
        readme:        object(expression: "HEAD:README.md")         { ... on Blob { byteSize text } }
        claudemd:      object(expression: "HEAD:CLAUDE.md")         { ... on Blob { byteSize } }
        license_file:  object(expression: "HEAD:LICENSE")           { ... on Blob { byteSize } }
        dependabot:    object(expression: "HEAD:.github/dependabot.yml") { ... on Blob { byteSize } }
        contributing:  object(expression: "HEAD:CONTRIBUTING.md")   { ... on Blob { byteSize } }
        workflows:     object(expression: "HEAD:.github/workflows") { ... on Tree { entries { name } } }
        packagejson:   object(expression: "HEAD:package.json")      { ... on Blob { text } }
        cargotoml:     object(expression: "HEAD:Cargo.toml")        { ... on Blob { byteSize } }
        gomod:         object(expression: "HEAD:go.mod")            { ... on Blob { byteSize } }
        pyproject:     object(expression: "HEAD:pyproject.toml")    { ... on Blob { byteSize } }
        requirements:  object(expression: "HEAD:requirements.txt")  { ... on Blob { byteSize } }
        foundry:       object(expression: "HEAD:foundry.toml")      { ... on Blob { byteSize } }
        hardhat:       object(expression: "HEAD:hardhat.config.js") { ... on Blob { byteSize } }
      }
    }
  }
}'''

OWNER = sys.argv[1] if len(sys.argv) > 1 else "aaronjmars"

result = subprocess.run(
    ["gh", "api", "graphql", "--paginate",
     "-F", f"owner={OWNER}",
     "-f", f"query={QUERY}"],
    capture_output=True, text=True
)
if result.returncode != 0:
    print("gh api failed:", result.stderr, file=sys.stderr)
    sys.exit(1)

# `--paginate` concatenates JSON objects. Split manually.
raw = result.stdout
docs = []
decoder = json.JSONDecoder()
idx = 0
raw = raw.strip()
while idx < len(raw):
    obj, end = decoder.raw_decode(raw[idx:])
    docs.append(obj)
    idx += end
    while idx < len(raw) and raw[idx] in " \n\r\t":
        idx += 1

nodes = []
for d in docs:
    nodes.extend(d["data"]["repositoryOwner"]["repositories"]["nodes"])

# Trim readme text to first 800 chars
for n in nodes:
    r = n.get("readme")
    if r and isinstance(r.get("text"), str):
        r["text"] = r["text"][:800]
    p = n.get("packagejson")
    if p and isinstance(p.get("text"), str):
        p["text"] = p["text"][:4000]

out = {"nodes": nodes, "count": len(nodes)}
with open(".scan-tmp/repos.json", "w") as f:
    json.dump(out, f, indent=2)
print(f"Fetched {len(nodes)} repos")
