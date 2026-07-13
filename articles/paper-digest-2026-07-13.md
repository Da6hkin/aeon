# Paper Digest — 2026-07-13
> **Verdict:** 1 benchmark exposing agents still stuck at 15.2% on long-horizon tasks, 1 strong memory result (97× token reduction + 17pp task completion lift), 1 production reliability predictor catching "false prosperity," 1 failure anatomy study pointing builders to early-step detection
> Pool: HF 60 + arXiv 38 + HF_daily 15 → 76 deduped → 4 shipped

## Autonomous AI Agents

1. **Long-Horizon-Terminal-Bench: Testing the Limits of Agents on Long-Horizon Terminal Tasks with Dense Reward-Based Grading** — Zongxia Li et al. (2026) · ↑28
   **What's new:** 46 terminal tasks across 9 domains (software dev, experiment reproduction, scientific computing) graded with dense intermediate rewards; the strongest tested model reaches only 15.2% pass@1 at a 0.95 partial-reward threshold, burning an average of 9.9M tokens and 85 minutes per task across 231 episodes.
   **So what:** Sets a concrete empirical ceiling for autonomous terminal agents this week — the 15.2% bar is the number anyone building or evaluating Claude Code-style long-horizon products should benchmark against before claiming production-readiness.
   [abs](https://arxiv.org/abs/2607.08964) | [pdf](https://arxiv.org/pdf/2607.08964)

2. **Failure as a Process: An Anatomy of CLI Coding Agent Trajectories** — Xiangxin Zhao et al. (2026) · ↑0
   **What's new:** Empirical analysis of 1,794 validated CLI coding agent trajectories (63,000+ steps) across 7 state-of-the-art models and 3 agent scaffolds reveals "epistemic errors" as the dominant failure mode — they emerge in early execution steps but go undetected until the trajectory is past the point of recoverable correction.
   **So what:** For builders adding reliability layers to coding agents (Regression Sentinel, agent CI/CD hooks), this supersedes "add more retries at the end" — intervening at step 2–5 is the empirically correct design target, not outcome-based recovery.
   [abs](https://arxiv.org/abs/2607.09510) | [pdf](https://arxiv.org/pdf/2607.09510)

## Agent Infrastructure

3. **Shared Selective Persistent Memory for Agentic LLM Systems** — Sanjana Pedada et al. (2026) · ↑0
   **What's new:** A session-persistent memory architecture that retains only four reusable context types (task specifications, data schemas, tool configurations, output constraints) across multi-turn agent sessions, lifting task completion from 79% to 96% (+17pp) and cutting token cost 97× through summary-driven generation in a collaborative workspace deployment.
   **So what:** Directly solves the "start from zero" cost problem that makes agentic SaaS at scale expensive — the 97× token reduction is the clearest published path to making session continuity affordable in any multi-session agent product.
   [abs](https://arxiv.org/abs/2607.09493) | [pdf](https://arxiv.org/pdf/2607.09493)

4. **Agent Delivery Engineering Predictive Reliability Framework** — Dexing Liu (2026) · ↑0
   **What's new:** Trust Margin metric (39.2-point dynamic range) aggregating 20 heterogeneous signals across 5 monitoring layers enables 8-hour reliability forecasts for production LLM multi-agent systems, with 76.8% directional accuracy and MAE=1.228, validated across 380,227 predictions over 15 continuous days; key finding is "false prosperity" — surface infrastructure metrics reporting healthy while actual agent reliability decays.
   **So what:** First production-scale quantitative reliability predictor for multi-agent deployments; the false-prosperity failure mode is precisely what any operator running scheduled agentic loops (including Aeon itself) should instrument against before it shows up as silent output degradation.
   [abs](https://arxiv.org/abs/2607.07689) | [pdf](https://arxiv.org/pdf/2607.07689)
