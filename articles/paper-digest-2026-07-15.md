# Paper Digest — 2026-07-15
> **Verdict:** 2 fresh execution-efficiency results (E3 91% token cut, PalmClaw 94.9% speedup), 1 agent-coordination infrastructure layer (EpochX ↑47), 1 multi-agent exploration study, 1 Polymarket exploit analysis with $1.49M documented — solid agent-infra week, no new x402 primitives
> Pool: HF 52 + arXiv 20 → 57 deduped → 5 shipped

## Agent Infrastructure & Coordination

1. **EpochX: Building the Infrastructure for an Emergent Agent Civilization** — Huacan Wang et al. (2026) · ↑47
   **What's new:** Credits-native marketplace for human-agent networks where each completed task generates persistent reusable assets (skills, workflows, traces) with dependency-tracked composition, and a native credit system rewards work completion and future artifact reuse — includes explicit verification workflows for decomposed multi-step task delegation.
   **So what:** EpochX defines the coordination and clearing layer that x402 payment rails need before agent-economy scale is viable — the task delegation contracts + persistent asset layer map directly to the missing architecture piece the x402 Runtime Firewall (idea pile #2) must sit above.
   [abs](https://arxiv.org/abs/2603.27304) | [pdf](https://arxiv.org/pdf/2603.27304)

2. **Multi-Agent LLMs Fail to Explore Each Other** — Hyeong Kyu Choi et al. (2026) · ↑5
   **What's new:** Formalizes multi-agent LLM interaction as a partially observable stochastic game (POSG), empirically shows agents default to myopic and polarized partner selection, and introduces MACE — a framework with structured peer-selection exploration and explicit capability probing that substantially improves coordination across both contextual and parametric diversity settings.
   **So what:** LLM agents on ACP/ERC-8004 networks are systematically failing at peer capability discovery because protocol specs assume it is solved — MACE's explicit exploration budget is the missing primitive that must precede meaningful multi-agent payment settlement.
   [abs](https://arxiv.org/abs/2607.11250) | [pdf](https://arxiv.org/pdf/2607.11250)

3. **Do AI Agents Know When a Task Is Simple? Toward Complexity-Aware Reasoning and Execution** — Junjie Yin, Xinyu Feng (2026) · ↑0
   **What's new:** E3 (estimate-execute-expand) policy achieves 100% task success on MSE-Bench (121 real engineering edits) while cutting token consumption by 91%, file inspection by 92%, and total cost by 85% versus maximum-context-first baselines — outperforms adaptive retrieval by 16%, validated on live open-source library edits via pytest execution.
   **So what:** Peer-reviewed grounding for the Underwater outbound thesis — Claude Code's 33k-vs-7k token overhead gap versus leaner agents (HN #1, 560pts, 2026-07-13) is precisely the maximum-context-first pathology E3 measures; MSE-Bench is open-sourced as the first systematic complexity-aware agent evaluation suite.
   [abs](https://arxiv.org/abs/2607.13034) | [pdf](https://arxiv.org/pdf/2607.13034)

4. **PalmClaw: A Native On-Device Agent Framework for Mobile Phones** — Hongru Cai, Yongqi Li et al. (2026) · ↑0
   **What's new:** Exposes mobile device capabilities as typed tool schemas with explicit execution boundaries rather than GUI action sequences, achieving 11.5% higher task success and 94.9% lower completion time over the strongest server-side baseline across mobile agent benchmarks.
   **So what:** Typed execution boundaries — structured schemas with explicit contracts over free-form API surfaces — are the decisive agent-infra design choice; the same enforcement principle behind x402 Runtime Firewall is now empirically validated at 94.9% speedup in a different compute tier.
   [abs](https://arxiv.org/abs/2607.13027) | [pdf](https://arxiv.org/pdf/2607.13027)

## Prediction Market Security

5. **The Ghosts of Polymarket: How Reverting Match Orders Haunt Prediction Markets** — Yiming Shen, Yuhan Jin (2026) · ↑1
   **What's new:** GHOSTHUNTER reconstructed 1,952,440 reverted match-order transactions and attributed $1.49M in documented risk-free profits across 35 attack variants in 4 categories (nonce bump, balance drain, allowance revoke, proxy trap), all exploiting the temporal gap between Polymarket's off-chain CLOB matching and on-chain settlement — reaching 24.3% order-revert rates at peak, with vulnerable code persisting across 167 contracts on 10 chains holding ≥$23M.
   **So what:** The hybrid prediction-market settlement layer that any agent product (HedgeQuote, BasisFile) would route through has a documented, production-exploited consistency attack surface — off-chain/on-chain temporal gaps are not theoretical risk, they're generating $1.49M in confirmed attacker profits with 24.3% peak revert rates.
   [abs](https://arxiv.org/abs/2606.16852) | [pdf](https://arxiv.org/pdf/2606.16852)
