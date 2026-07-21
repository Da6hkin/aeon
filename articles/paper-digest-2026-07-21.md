# Paper Digest — 2026-07-21

> **Verdict:** 1 self-improving search agent result, 2 coding-agent efficiency papers, 1 long-horizon multi-agent state mechanism; no on-chain or payment-layer work this week
> Pool: HF 60 + arXiv 30 → 25 deduped (14-day window) → 4 shipped

## Autonomous Agents

1. **DeepSearch-World: Self-Distillation for Deep Search Agents in a Verifiable Environment** — Geng et al. (2026) · ↑40
   **What's new:** Web search agents iteratively refine their own policy using a self-distillation loop inside a deterministic, verifiable environment — no external teacher model required — and match or exceed benchmark performance across multiple standard search evals.
   **So what:** Self-improvement without human labels or a stronger distillation source has been the missing piece for deploying autonomous search agents at scale; this closes that loop specifically for web retrieval tasks.
   [abs](https://arxiv.org/abs/2607.07820) | [pdf](https://arxiv.org/pdf/2607.07820)

## Agent Infrastructure

2. **SWE-Pruner Pro: The Coder LLM Already Knows What to Prune** — (2026) · ↑49
   **What's new:** Coding agents prune their own tool-call outputs by reading internal model representations to score code relevance in-context, cutting up to 39% of prompt+completion tokens while improving SWE-Bench resolve rates over the unpruned baseline.
   **So what:** Context length is the dominant cost driver for coding agents in production; an in-agent pruning approach that improves task performance rather than trading it off is directly deployable in any LLM-based coding scaffold today.
   [abs](https://arxiv.org/abs/2607.18213) | [pdf](https://arxiv.org/pdf/2607.18213)

3. **TRIM: Reducing AI-Generated CodeSlop via Agent Trajectory Minimization** — (2026) · ↑–
   **What's new:** TRIM formalizes "CodeSlop" — speculative edits and abandoned hypotheses accumulated during agentic coding iterations — and minimizes agent trajectories post-hoc, achieving a 17.9–32.9% CodeSlop reduction across multiple agentic scaffolds with negligible performance regression on coding benchmarks.
   **So what:** As coding agent sessions grow longer, speculative drift compounds and degrades output quality; TRIM's trajectory compression is scaffold-agnostic and complements in-context pruning methods like SWE-Pruner Pro.
   [abs](https://arxiv.org/abs/2607.18161) | [pdf](https://arxiv.org/pdf/2607.18161)

## Multi-Agent Systems

4. **EvolvingWorld: An Open-Schema Framework for Co-Evolving Role-Play Agents and World Model in Interactive Literary World** — Zong et al. (2026) · ↑51
   **What's new:** Character agents and an LLM-based world model are coupled in a bidirectional update loop with an open schema, enabling persistent state evolution across long-horizon interactive simulations without manual world-state resets between sessions.
   **So what:** Coherent, mutable shared state across long-running agent sessions is an open problem in multi-agent infrastructure; this demonstrates a concrete mechanism for world-state co-evolution that is not tied to a specific task domain.
   [abs](https://arxiv.org/abs/2607.17250) | [pdf](https://arxiv.org/pdf/2607.17250)
