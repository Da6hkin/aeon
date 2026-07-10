# Paper Digest — 2026-07-10
> **Verdict:** 1 new agent benchmark exposing the cross-platform gap, 1 memory sidecar that adds +8 pp to long-horizon tasks, 1 production RL agent managing 267 BTC on the Lightning Network, 1 code agent with procedural retrieval at 41% Pass@1 — solid week for autonomous agent builders
> Pool: HF 60 + arXiv 15 → 69 deduped → 4 shipped (1 dedup drop: 2604.26091 already shipped 2026-07-09)

## Autonomous AI Agents / Agent Infrastructure

1. **UniClawBench: A Universal Benchmark for Proactive Agents on Real-World Tasks** — Zhekai Chen et al. (2026) · ↑19
   **What's new:** 400 bilingual tasks run in live Docker containers, evaluated by a closed-loop triad (executor agent + hidden supervisor agent + user agent), decomposing performance into five axes — Skill Usage, Exploration, Long-Context Reasoning, Multimodal Understanding, and Cross-Platform Coordination.
   **So what:** Existing sandboxed single-turn benchmarks can't disentangle model capability from framework choice; this fills that gap directly and gives agent builders a replayable signal on cross-platform coordination, the hardest failure mode in production multi-tool agents.
   [abs](https://arxiv.org/abs/2607.08768) | [pdf](https://arxiv.org/pdf/2607.08768)

2. **Remember When It Matters: Proactive Memory Agent for Long-Horizon Agents** — Yifan Wu et al. (2026) · ↑0
   **What's new:** Plug-and-play sidecar module that runs a dedicated memory agent alongside the action agent, maintaining a structured memory bank and selectively injecting reminders only when relevant; gains +8.3 pp on Terminal-Bench 2.0 and +6.8 pp on τ²-Bench over the base agent with no architecture changes.
   **So what:** An +8 pp lift from just adding a memory sidecar shows that behavioral state decay — relevant context buried deep in a long trajectory — is the primary bottleneck for long-horizon autonomous agents, not the underlying model; a drop-in infra component for any agent framework builder.
   [abs](https://arxiv.org/abs/2607.08716) | [pdf](https://arxiv.org/pdf/2607.08716)

## AI-Agent + Crypto / Payment Coordination Layers

3. **MPFlow: Learning Budgeted Max-Flow Optimization on the Lightning Network with Deep Graph RL** — Harrison Rush et al. (2026) · ↑0
   **What's new:** Message-passing policy network trained with PPO and action masking via hub-exclusion curriculum learning, deployed on the live Bitcoin Lightning Network making 4,600 channel-allocation decisions managing ~267 BTC, outperforming all heuristic baselines.
   **So what:** First production RL agent for Bitcoin payment-channel routing deployed at real capital scale (267 BTC under management), directly relevant to the on-chain agent + payment/coordination layer thesis — proof that RL agents can handle combinatorial budget optimization on live crypto networks.
   [abs](https://arxiv.org/abs/2607.08703) | [pdf](https://arxiv.org/pdf/2607.08703)

## Autonomous AI Agents / Coding Agents

4. **ProjAgent: Procedural Similarity Retrieval for Repository-Level Code Generation** — QiHong Chen et al. (2026) · ↑0
   **What's new:** Decomposes target functions into procedural reasoning steps, then retrieves repository functions with matching procedural behavior (not semantic similarity) to guide generation; achieves 41.14% Pass@1 on repository-level code generation benchmarks.
   **So what:** Procedural retrieval beats semantic-only retrieval for repo-level code agents — a concrete technique for anyone building autonomous coding agents that need to navigate large production codebases rather than toy repositories.
   [abs](https://arxiv.org/abs/2607.08691) | [pdf](https://arxiv.org/pdf/2607.08691)
