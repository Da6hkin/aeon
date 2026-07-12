# Paper Digest — 2026-07-12
> **Verdict:** 1 agent delegation trust primitive (10 upvotes, directly names the missing layer in ERC-8004), 1 first empirical DeFi-agent deployment study ($3B+, 925k holders, ElizaOS vs Virtuals architecture) — thin cycle with no July 10-12 papers yet indexed on arXiv; cycle draws on topically-relevant 2026 work with community signal
> Pool: HF 54 + arXiv 34 + hf_daily 10 → 65 deduped → 63 skip-gated → 2 shipped

## Agent Identity & Infrastructure

1. **HDP: Human Delegation Provenance in Agentic AI Systems** — Dalugoda et al. (2026) · ↑10
   **What's new:** Proposes a lightweight token-based cryptographic scheme that captures and verifies human authorization context through every link of a multi-agent delegation chain, specifically targeting the accountability gap where no existing standard (MCP, A2A) can prove a terminal agent action traces back to a genuine human principal.
   **So what:** This is the human-authorization primitive that ERC-8004 explicitly leaves open — Xiong et al. (arXiv 2606.26028, rev July 8) showed 73–91% Sybil behavior across ETH/BSC/Base because feedback records aren't grounded in verifiable interactions; HDP's delegation-chain verification spec is the trust anchor any Sybil-Resistant Rep Aggregator would need to integrate.
   [abs](https://arxiv.org/abs/2604.04522) | [pdf](https://arxiv.org/pdf/2604.04522)

## On-Chain Agents & Crypto

2. **Paper Agents, Paper Gains: An Empirical Analysis of DeFi Investment Agents** — Yu et al. (2026) · ↑0
   **What's new:** Provides the first quantitative on-chain performance analysis of 11 Solana DeFi investment agent treasuries covering 925,323 token holders and $3B+ combined token valuations, alongside architectural decompositions of both ElizaOS and Virtuals Protocol drawn from a 1,900+ AI-tagged crypto project survey.
   **So what:** The Virtuals Protocol architecture breakdown is the deployment map that grounds this week's ACP signal — Virtuals launched ACP v2 July 3 and is auto-registering all graduated agents into ERC-8004 at scale; this paper shows the execution layer the Sybil-Resistant Rep Aggregator wedge would sit above.
   [abs](https://arxiv.org/abs/2605.29174) | [pdf](https://arxiv.org/pdf/2605.29174)
