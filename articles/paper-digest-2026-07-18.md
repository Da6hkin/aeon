# Paper Digest — 2026-07-18
> **Verdict:** Two agentic-search reliability results exposing retrieval gaps, one memory-security red flag naming Claude Code and Codex directly, one cost-aware evaluation reframe for security agents; no AI-agent + crypto work this cycle.
> Pool: HF 44 + arXiv 30 → 50 deduped → 46 skip-gated → 4 shipped

## Agentic Search & Retrieval

1. **GRASP: GRanularity-Aware Search Policy for Agentic RAG** — Gandhi et al. (2026) · ↑4
   **What's new:** RL-trained policy that selects retrieval granularity (sentence, chunk, or full-document) at each agentic RAG step, trained on HotpotQA and MuSiQue with a four-objective reward covering accuracy, grounded reading, complementary coverage, and turn efficiency.
   **So what:** Any agent pipeline that hardcodes a single retrieval granularity leaves multi-hop questions underserved; GRASP replaces a static infra hyperparameter with a learned controller that adapts per query step, which is the kind of drop-in improvement that matters for production agentic search stacks.
   [abs](https://arxiv.org/abs/2607.10463) | [pdf](https://arxiv.org/pdf/2607.10463)

2. **Bridge Evidence: Static Retrieval Utility Does Not Predict Causal Utility in Multi-Step Agentic Search** — Mukhopadhyay et al. (2026) · ↑—
   **What's new:** Over 1,000 HotpotQA questions and 23,322 document observations, the Spearman correlation between a document's static BM25 rank and its causal contribution to the correct final answer is −0.026; "bridge" documents — causally necessary for multi-hop reasoning chains but low-scoring in isolation — appear in 27.2% of evaluated cases.
   **So what:** Agentic search pipelines that pre-filter context by static relevance scores before reasoning are systematically discarding the documents most likely to close multi-hop gaps — directly motivates causal-aware retrieval as a first-class concern in agent infrastructure, not a post-hoc optimization.
   [abs](https://arxiv.org/abs/2607.15253) | [pdf](https://arxiv.org/pdf/2607.15253)

## Agent Security & Evaluation

3. **Bad Memory: Evaluating Prompt Injection Risks from Memory in Agentic Systems** — Gadgil, Alexander, Sunku, Roesner (2026) · ↑—
   **What's new:** Tested prompt injection via persistent memory files on Claude Code and OpenAI Codex across four models; malicious instructions pre-planted in stored files successfully hijack current and future sessions on both platforms, with attack difficulty varying by platform and model.
   **So what:** First published cross-platform eval that names production agent runtimes by name — any agent infrastructure accumulating project-level memory across sessions has a documented, testable attack surface, not a theoretical one; the paper is a direct call to add memory sanitization to agent infra tooling.
   [abs](https://arxiv.org/abs/2607.14611) | [pdf](https://arxiv.org/pdf/2607.14611)

4. **Beyond Success Rate: Cost-Aware Evaluation of Offensive and Defensive Security Agents** — Kassianik, Nelson, Singer et al. (2026) · ↑—
   **What's new:** Cost-success Pareto frontier scoring on Cybench (offensive exploits) and Splunk BOTS v1 (defensive SOC tasks); offensive agent performance scales predictably with reasoning compute budget, while defensive performance plateaus early and is gated on structured tool-call sequences, not raw token budget.
   **So what:** Security agent infrastructure built on "more reasoning = better" assumptions works for offensive tasks but breaks down for defensive SOC workflows — the compute-scaling regime mismatch is now benchmarked, which reframes how agentic security pipelines should be architected.
   [abs](https://arxiv.org/abs/2607.15263) | [pdf](https://arxiv.org/pdf/2607.15263)
