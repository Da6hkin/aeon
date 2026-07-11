# Paper Digest — 2026-07-11
> **Verdict:** 1 production-trace serving scheduler (+10–34% TPS for agentic workloads), 1 recursive multi-agent search architecture, 1 216k-skill open library with traceability guarantees — no fresh crypto/on-chain signal this cycle
> Pool: HF 43 + arXiv 15 + HF_daily 15 → 58 deduped → 9 prior-shipped → 3 shipped

## Autonomous AI Agents / Agent Infrastructure

1. **SMetric: Rethink LLM Scheduling for Serving Agents with Balanced Session-centric Scheduling** — Jiahao Wang et al. (2026) · ↑0
   **What's new:** Agentic workloads from a BAILIAN production trace show 80% KV-cache reuse (vs 54–62% in chat), and session-centric scheduling that routes only the first request per agent session for load balancing — while keeping subsequent same-session requests on locally cached instances — improves cluster TPS 10–16% under prefill-decode colocation and 2–34% under disaggregation vs state-of-the-art schedulers.
   **So what:** Agent platform teams running chat-tuned LLM schedulers are capping throughput by optimizing for per-token latency instead of TPS; the 30pp KV-cache reuse gap (80% vs 54–62%) means agentic workloads are fundamentally different, and session-aware batch scheduling is now the empirical baseline to beat for anyone building agent serving infra.
   [abs](https://arxiv.org/abs/2607.08565) | [pdf](https://arxiv.org/pdf/2607.08565)

2. **WebSwarm: Recursive Multi-Agent Orchestration for Deep-and-Wide Web Search** — Xiaoshuai Song et al. (2026) · ↑0
   **What's new:** Introduces progressive recursive delegation where each search node independently solves its sub-objective or spawns child nodes, with evidence and results propagating upward so parent nodes can revise, expand, or aggregate — consistently outperforming single-agent and parallel multi-agent baselines on BrowseComp-Plus, WideSearch, and DeepWideSearch.
   **So what:** The depth-vs-breadth wall that limits ReAct-style search agents (one long trajectory, limited context) is empirically broken by recursive upward evidence propagation; directly relevant to deep-research pipelines and any agent-to-agent verification system where a coordinator needs to synthesize evidence from multiple specialized sub-agents.
   [abs](https://arxiv.org/abs/2607.08662) | [pdf](https://arxiv.org/pdf/2607.08662)

3. **SkillCenter: A Large-Scale Source-Grounded Skill Library for Autonomous AI Agents** — Tianming Sha et al. (2026) · ↑0
   **What's new:** Ships 216,938 structured skills across 24 domain bundles — the largest open agent skill library by count — with 114,565 source-grounded to exact quotations from peer-reviewed journals, arXiv, and 24,000+ technical sources via the SkillGate quality filter, delivered as offline-searchable SQLite FTS5 bundles.
   **So what:** Source-grounding (each claim maps to an exact quotation) is the missing quality bar separating correct, auditable agent skills from raw prompt collections; for anyone building agents that must act correctly in regulated or high-stakes settings — the Agent Firewall / compliance angle in this week's money-radar — this is now the reference corpus for grounded operational knowledge.
   [abs](https://arxiv.org/abs/2607.07676) | [pdf](https://arxiv.org/pdf/2607.07676)
