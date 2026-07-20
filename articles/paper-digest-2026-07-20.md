# Paper Digest — 2026-07-20
> **Verdict:** 2 agentic infrastructure results (BFT consensus for validator agents, harness self-improvement at 60% lower inference cost), 1 empirical finding that agentic code review speeds decisions but not quality — no crypto-agent or x402 papers of substance this cycle
> Pool: HF 44 + arXiv 30 → 60 deduped → 3 shipped

## Autonomous AI Agents / Agent Infrastructure

1. **From Human-Centric to Agentic Code Review: The Impact of Different Generations of Generative AI Technology on Review Quality** — Suzhen Zhong et al. (2026) · ↑18
   **What's new:** Analysis of 1.02M pull requests across 207 GitHub projects across three eras (human-centric → LLM-assisted → agentic) finds AI-agent-involved reviews cut decision time, but human-AI collaboration patterns — not model capability — become the dominant predictor of efficiency, with no measurable quality improvement detected across any adoption pattern.
   **So what:** For anyone building or evaluating coding-agent pipelines, this is the first large-scale empirical baseline: speed gains are confirmed, quality uplift is not — meaning agent code-review tools need explicit quality instrumentation (not just throughput metrics) to justify displacement of human review, which directly challenges the "agents replace human reviewers" frame in the autonomous-agent infra space.
   [abs](https://arxiv.org/abs/2607.13196) | [pdf](https://arxiv.org/pdf/2607.13196)

2. **Recursive Harness Self-Improvement** — Hyunin Lee, Jinglue Xu, Jeffrey Seely et al. (2026) · ↑6
   **What's new:** RHI treats agent harnesses (prompt-level scaffolds) as iteratively refinable specifications using revision-history feedback; across 30 ML research tasks in quantitative finance, robotics, and pharmacy, minimal RHI iterations cut inference costs 60% while matching or exceeding max-reasoning-configuration baselines through improved task-context management and inter-agent information exchange — not extended reasoning traces.
   **So what:** The 60% inference cost reduction comes entirely from harness-level optimization, not model upgrades — a direct precedent for autonomous agent frameworks (like multi-step skill chains) where scaffolding quality compounds over runs and shapes training data for future iterations.
   [abs](https://arxiv.org/abs/2607.15524) | [pdf](https://arxiv.org/pdf/2607.15524)

3. **The Honest Quorum Problem: Epistemic Byzantine Fault Tolerance for Agentic Infrastructure** — Jun He, Deying Yu (2026) · ↑0
   **What's new:** Defines EBFT, augmenting classical Byzantine fault bounds with two confidence-indexed quantities — e_δ bounding coherent invalid endorsements from LLM reasoning errors (outside the canonical Byzantine fault set) and u_ε bounding unusable validator support degrading liveness — then proves that adding nominally distinct agents improves fault tolerance only when it measurably reduces the upper-tail concentration of invalid endorsements.
   **So what:** For multi-agent payment authorization and agent-to-agent trust layers (x402, ERC-8004, A2A protocols tracked in deep-research), this formalizes the failure mode where a protocol-compliant but semantically wrong LLM endorsement corrupts consensus — validating why agent-to-agent trust stacks still require attestation layers beyond quorum counting, and strengthening the case for the x402 Runtime Firewall's authenticity-attestation wedge.
   [abs](https://arxiv.org/abs/2607.16109) | [pdf](https://arxiv.org/pdf/2607.16109)
