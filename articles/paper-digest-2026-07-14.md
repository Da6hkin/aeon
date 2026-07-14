# Paper Digest — 2026-07-14
> **Verdict:** 1 agent OS proving typed-graph memory beats unstructured context for long-horizon tasks, 1 formal proof that per-hop monitoring can't catch distributed attacks (validates x402 firewall architecture), 1 academic framing of "bounded autonomy" as the on-chain agent design principle, 1 static analysis finding 68 confirmed loop bugs in 47 production repos
> Pool: HF search 0 (API unavailable) + HF daily 15 + arXiv via WebSearch ~15 → ~25 deduped → 4 shipped
> (partial: HF search API unavailable — used HF daily trending + arXiv via WebSearch fallback)

## Agent Infrastructure

1. **ABot-AgentOS: A General Robotic Agent OS with Lifelong Multi-modal Memory** — et al. (2026) · ↑59
   **What's new:** Universal Multi-modal Graph Memory encodes dialogue, visual observations, spatial context, temporal relations, and task traces into typed nodes/edges; failure-driven self-evolution gates evo-assets to later evaluation splits only, reaching 88.7 on LoCoMo and 60.4 on OpenEQA EM-EQA (vs 87.5 and 59.9 static).
   **So what:** First agent OS structured for auditable self-improvement from production failures without leaking evaluation ground truth — directly addresses the auditable, cross-session persistent memory gap that anyone building long-horizon agent infrastructure needs to close.
   [abs](https://arxiv.org/abs/2607.10350) | [pdf](https://arxiv.org/pdf/2607.10350)

2. **When Agents Do Not Stop: Uncovering Infinite Agentic Loops in LLM Agents** — et al. (2026) · ↑0
   **What's new:** IAL-Scan builds framework-independent Agent IR and an Agentic Loop Dependence Graph from 6,549 real GitHub agent repos, confirming 68 Infinite Agentic Loop failures across 47 projects with 91.9% precision — loops triggered by tool-call chains and agent handoffs without effective termination bounds, causing token cost exhaustion, context growth, and repeated external side effects.
   **So what:** Infinite loops in production LLM agents are a widespread, measurable failure mode confirmed across 47 open-source repos — a production reliability problem for anyone deploying multi-step agent infrastructure, not a theoretical edge case.
   [abs](https://arxiv.org/abs/2607.01641) | [pdf](https://arxiv.org/pdf/2607.01641)

## Multi-Agent Security

3. **When Local Monitors Miss Compositional Harm: Diagnosing Distributed Backdoors in Multi-Agent Systems** — et al. (2026) · ↑0
   **What's new:** Formal proof that local step-level monitoring in multi-agent LLM systems faces an observability boundary — distributed backdoors split payloads so every per-hop check passes; global-context detection achieves 0.874 mean AUROC only when the monitor sees the assembled object, not per-step views.
   **So what:** Provides theoretical and empirical backing for the x402 Runtime Firewall architecture — per-hop monitoring (the current default in agent frameworks) is provably insufficient, and the assembled-payload view is the correct enforcement point, directly corroborating the Zscaler 4/26 finding that per-step detection misses sophisticated injection attacks.
   [abs](https://arxiv.org/abs/2607.11751) | [pdf](https://arxiv.org/pdf/2607.11751)

## On-chain AI Agents

4. **Agent-to-Agent Finance: Blockchain Payments and Trust Infrastructure for Autonomous AI Agents** — et al. (2026) · ↑0
   **What's new:** Synthesizes the A2A finance infrastructure stack — ERC-8004 registries, provenance-based wallets, DeFi intent mining, and verifiable computation — into a "bounded autonomy" design thesis: letting agents transact without making markets more opaque or fragile is the decisive design question, not trustlessness.
   **So what:** Academic framing of the on-chain agent payment stack the operator is building against (x402 Runtime Firewall, Wallet-Graph Reputation) — "bounded autonomy" as the core design constraint directly shapes what the firewall needs to enforce and positions the Wallet-Graph Reputation idea as a bounded-autonomy primitive rather than an identity play.
   [abs](https://arxiv.org/abs/2607.00245) | [pdf](https://arxiv.org/pdf/2607.00245)
