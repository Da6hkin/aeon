# Paper Digest — 2026-07-17
> **Verdict:** 3 solid agent infra results (SEED hindsight-skill distillation ↑51, SearchOS-V1 state-managed multi-agent search ↑42, LAMaS >50% orchestration latency cut) + 1 adversarial finding (BadWAM world-action drift attacks ↑27, 96.5%→43.1% success collapse); no new x402/crypto-agent papers this cycle
> Pool: HF ~60 (daily=19 + search) + arXiv ~27 (cs.AI/cs.MA list pages; API 406) → ~60 deduped → 4 shipped

## AI Agents & Infrastructure

1. **SEED: Self-Evolving On-Policy Distillation for Agentic Reinforcement Learning** — Wu et al. (2026) · ↑51
   **What's new:** Converts completed on-policy trajectories into natural-language "hindsight skills" capturing reusable workflow patterns and failure-avoidance strategies, then rescores actions under different contexts to generate dense token-level distillation signals — outperforming vanilla RL on text and vision-based agentic benchmarks while generalizing to unseen task scenarios.
   **So what:** The first practical mechanism for agents to accumulate reusable skill memory from their own deployment history without human annotation; supersedes static SFT for any production agent stack where continual improvement from rollouts is needed, directly applicable to the autonomous agent infra the operator is tracking.
   [abs](https://arxiv.org/abs/2607.14777) | [pdf](https://arxiv.org/pdf/2607.14777)

2. **SearchOS-V1: Towards Robust Open-Domain Information-Seeking Agent Collaboration** — Zhang et al. (2026) · ↑42
   **What's new:** Models open-domain search as relational schema completion with grounded citations, maintaining explicit evidence graphs, coverage maps, and failure memory shared across a pipeline-parallel multi-agent team — hitting SOTA on WideSearch and GISA benchmarks while cutting repetitive search patterns via a middleware harness.
   **So what:** The explicit failure-memory + shared evidence-graph architecture is the cleanest published solution to the "agents repeat searches or lose task progress" failure mode that plagues any long-horizon agentic pipeline; the architectural pattern translates directly to MCP-based multi-agent systems or agentic-commerce research workflows.
   [abs](https://arxiv.org/abs/2607.15257) | [pdf](https://arxiv.org/pdf/2607.15257)

3. **BadWAM: When World-Action Models Dream Right but Act Wrong** — Li et al. (2026) · ↑27
   **What's new:** Introduces World-Action Drift Attacks — visual perturbations that misalign a world-action model's predicted future from its executed actions, collapsing task success from 96.5% to 43.1% in embodied control benchmarks while maintaining plausible-looking predictions that evade naive monitoring.
   **So what:** World-action models are entering agent control pipelines as planners (computer-use agents, web-browsing agents); the attack surface BadWAM maps — plausible prediction, wrong action — is the class of failure mode that agent safety layers like ShieldAgent or AgentWall need to red-team, and it will appear in production before formal defenses ship.
   [abs](https://arxiv.org/abs/2607.15207) | [pdf](https://arxiv.org/pdf/2607.15207)

4. **Learning Latency-Aware Orchestration for Multi-Agent Systems** — Shi, Zheng & Lou (2026)
   **What's new:** LAMaS achieves >50% latency reduction across four multi-agent benchmarks via critical-path-aware credit assignment during training and adaptive runtime pruning of redundant agent interactions — with competitive or better accuracy than unoptimized orchestration and successful transfer across different multi-agent architectures.
   **So what:** Multi-agent orchestration latency is a direct cost multiplier for production agentic products — a 2× speedup at constant quality halves LLM API spend per task, making otherwise unprofitable agent workflows economically viable; directly relevant to the orchestration infrastructure choices in agent-infra builds.
   [abs](https://arxiv.org/abs/2607.13359) | [pdf](https://arxiv.org/pdf/2607.13359)
