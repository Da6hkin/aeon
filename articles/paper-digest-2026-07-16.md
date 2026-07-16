# Paper Digest — 2026-07-16
> **Verdict:** First population-scale x402 authenticity audit (21% fictitious, 64% internal-cluster), 3 agent-infra results on credit assignment / skill security / optimizer compounding, 1 agentic PR adoption study — strongest signal is the x402 paper landing the day after LF Foundation launch (HF unavailable — arXiv-only fallback)
> Pool: HF 0 (API 504 on all endpoints) + arXiv ~35 → 35 deduped → 30 skip-gated → 5 shipped

## x402 / On-chain Agents

1. **How Agentic Is Agentic Commerce? A Population-Scale Measurement of x402 Adoption and Authenticity** — Ling, Zhou & Wu (2026) · ↑N/A
   **What's new:** Population-scale audit of 137M x402 settlements on Base over 280 days finds 21.20% fictitious and 63.78% internal-cluster, leaving only $187k–$20M of $44M nominal volume in genuinely arms-length settlements — quantified via chain-analytic clustering, not survey.
   **So what:** For the x402 Runtime Firewall sprint (MEMORY.md #2), this paper is the empirical mandate and the sharpest cold-DM line available for the 40 LF Foundation members launched one day before submission — "settlement count measures manufacturability, not adoption" supersedes every growth-metric counterargument a Premier member could raise.
   [abs](https://arxiv.org/abs/2607.12575) | [pdf](https://arxiv.org/pdf/2607.12575)

## Autonomous AI Agents / Agent Infrastructure

2. **TRACE: Turn-level Reward Assignment via Credit Estimation for Long-Horizon Agents** — Tao & Peng (2026) · ↑N/A
   **What's new:** Temporal-difference state values replace sparse end-reward for multi-turn tool-use agents, lifting Qwen3-4B from 7.2 to 35.6 on BrowseComp (5×) without any supervised fine-tuning data.
   **So what:** For builders running long-horizon agentic loops (x402/AgentCore payment chains, multi-step research pipelines), TRACE is a training-signal upgrade that bypasses the SFT labeling bottleneck — the 5× gain on BrowseComp directly relates to the web-navigation and API-call sequences these agents run.
   [abs](https://arxiv.org/abs/2607.13988) | [pdf](https://arxiv.org/pdf/2607.13988)

3. **Agent Skill Security: Threat Models, Attacks, Defenses** — Badhe & Tiwari (2026) · ↑N/A
   **What's new:** Lifecycle-aware evaluation of 327 real-world LLM agent skills finds exploitable vulnerabilities at every stage — repository admission, runtime execution, and version updates — via prompt injection, privilege escalation, and silent capability drift, with no existing skill registry catching cross-stage attack chains.
   **So what:** With reusable skill libraries now the default pattern (addyosmani/agent-skills-type repos trending all week, CLAUDE.md skill directories in production), this is the first empirical audit proving skills are not sandboxed at version boundaries — a directly citable risk for any x402 Firewall outbound targeting agent platform builders on the LF Foundation member list.
   [abs](https://arxiv.org/abs/2607.13987) | [pdf](https://arxiv.org/pdf/2607.13987)

4. **Do Agent Optimizers Compound? A Continual-Learning Evaluation on Terminal-Bench 2.0** — Wang & Kattakinda (2026) · ↑N/A
   **What's new:** Only RELAI-VCL (regression-control-based optimization) achieves positive transfer as tasks accumulate, reaching 76.4% lifelong pass rate on Terminal-Bench 2.0; all other tested optimizer families plateau or regress, failing the "new task, old skill retained" requirement.
   **So what:** For multi-protocol agent builders (x402 → AP2 → AgentCore in sequence), this is the first benchmark confirming which optimization paradigm compounds rather than erases prior skills — RELAI-VCL is the only current baseline worth citing for any agent that must learn new payment protocols without forgetting earlier ones.
   [abs](https://arxiv.org/abs/2607.14004) | [pdf](https://arxiv.org/pdf/2607.14004)

5. **Early Adoption of Agentic Coding Tools by GitHub Projects** — Raida & Hou (2026) · ↑N/A
   **What's new:** Empirical analysis of 25,264 agentic pull requests across 2,361 GitHub repositories finds adoption concentrated in small projects, with human oversight dominated by a single-developer model rather than distributed code-review pipelines — enterprise multi-reviewer workflows are not the agentic-PR reality yet.
   **So what:** For agent-infrastructure builders targeting Underwater's ICP (solo founders + small teams with LLM cost exposure) and destructive_command_guard-style guardrails, this is the empirical confirmation that the current buying unit is the individual solo builder — not the enterprise DevOps team — sharpening outbound ICP targeting for the sprint.
   [abs](https://arxiv.org/abs/2607.14037) | [pdf](https://arxiv.org/pdf/2607.14037)
