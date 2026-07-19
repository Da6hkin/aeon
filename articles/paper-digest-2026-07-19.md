# Paper Digest — 2026-07-19
> **Verdict:** Strong agent-infra and agentic-security week — fresh eval harness, multi-agent RL stability fix, one HFT specialist system, and two security papers that map directly to the JADEPUFFER attack surface.
> Pool: HF 44 + arXiv 32 → 62 deduped → 5 shipped

## Agent Infrastructure

1. **AgentCompass: A Unified Evaluation Infrastructure for Agent Capabilities** — Ding et al. (2026) · ↑38
   **What's new:** Open-source harness running LLM agents across multiple benchmarks with fault-tolerant execution and per-step trajectory analysis — moves evaluation from pass/fail rates to diagnosing the specific failure mode (tool misuse, hallucination, task drift) that caused each rollout to fail.
   **So what:** The ecosystem has no standard eval harness; AgentCompass is the first comprehensive open-source attempt, directly useful for anyone comparing agent frameworks or debugging production agents under the autonomous-agent-infrastructure tracked interest.
   [abs](https://arxiv.org/abs/2607.13705) | [pdf](https://arxiv.org/pdf/2607.13705)

2. **Dr. MAS: Stable Reinforcement Learning for Multi-Agent LLM Systems** — Feng et al. (2026) · ↑29
   **What's new:** Agent-wise advantage normalization prevents reward collapse when individual agents diverge during joint RL training — outperforms MALT's shared-reward baseline on math reasoning and web search benchmarks without requiring separate training phases.
   **So what:** Training instability has been the main blocker for multi-agent RL at scale; this is the kind of infrastructure primitive that makes the multi-agent systems in tracked interests actually trainable in practice.
   [abs](https://arxiv.org/abs/2602.08847) | [pdf](https://arxiv.org/pdf/2602.08847)

## Trading Tooling

3. **QuantAgent: Price-Driven Multi-Agent LLMs for High-Frequency Trading** — Xiong et al. (2025) · ↑16
   **What's new:** Five-specialist multi-agent pipeline for HFT — dedicated LLM agents for technical indicators, price patterns, trend analysis, news sentiment, and risk management — improves Sharpe ratio vs. single-model baselines on simulated crypto and equity data.
   **So what:** First multi-agent LLM architecture built specifically for high-frequency trading; the specialist-agent decomposition pattern is directly portable to Polymarket edge (separate signal agents, one risk/sizing agent).
   [abs](https://arxiv.org/abs/2509.09995) | [pdf](https://arxiv.org/pdf/2509.09995)

## Agentic Security

4. **Securing the AI Agent: A Unified Framework for Multi-Layer Agent Red Teaming** — Yang et al. (2026) · ↑14
   **What's new:** Open-source red teaming framework treats agent attack surfaces as a three-layer stack — infrastructure (sandbox escapes), protocol (prompt injection), and model (jailbreak) — with distinct detection tooling per layer rather than a single undifferentiated scanner.
   **So what:** JADEPUFFER showed agentic ransomware exploits all three layers simultaneously; this is the first open-source framework designed for that combined attack surface, and its three-layer taxonomy is a ready-made reference architecture for the Regression Sentinel pitch.
   [abs](https://arxiv.org/abs/2606.31227) | [pdf](https://arxiv.org/pdf/2606.31227)

5. **The Balkanization of Execution-Security Research for AI Coding Agents** — Rashidi et al. (2026) · ↑0
   **What's new:** Systematization of 39 AI coding-agent security papers across sandbox isolation, access control, and TOCTOU vulnerabilities identifies five cross-cutting gaps — TOCTOU exploits, cross-agent privilege escalation, monitoring blindspots, policy drift, and sandbox escape chains — that no existing isolated defense addresses end-to-end.
   **So what:** These five gaps map directly to the Regression Sentinel attack surface (#4 in idea pile) and make a compelling enumerated case for why a pre-trade MCP guardrail is commercially defensible against a specific, named, unaddressed threat class.
   [abs](https://arxiv.org/abs/2607.05743) | [pdf](https://arxiv.org/pdf/2607.05743)
