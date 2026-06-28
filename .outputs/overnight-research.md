There's no `skills/overnight-research/SKILL.md` file — `overnight-research` is defined as a **chain** in `aeon.yml`, not a skill. The chain orchestrates 4 existing skills:

```yaml
overnight-research:
  schedule: "45 4 * * *"
  steps:
    - parallel: [github-trending, hacker-news-digest, deep-research, repo-scanner]
    - skill: startup-idea       (consumes the 4 parallel outputs)
    - skill: idea-capture       (consumes startup-idea)
    - skill: morning-brief      (consumes startup-idea, idea-capture, deep-research, github-trending)
```

On GitHub Actions this runs as separate steps via `chain-runner.yml`, with outputs passed between them through `.outputs/{skill}.md`. There's no single SKILL.md to read and execute.

How would you like to proceed?

1. **Run the chain inline now** — I execute all 4 skills sequentially in this session (slow, but produces the morning-brief output)
2. **Run a single skill from the chain** — e.g. just `deep-research` or `morning-brief`
3. **Create `skills/overnight-research/SKILL.md`** — a wrapper skill that documents/runs the chain (if you want this to be invokable as a skill)
4. **Something else** — let me know

Which one?
