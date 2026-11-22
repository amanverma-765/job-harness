# Company Research: Icertis

## Phase 1: Company Fundamentals & Platform Architecture

### Business Model & Scale
- **Positioning:** Global leader in AI-native contract intelligence; the Icertis Contract Intelligence (ICI) platform manages commercial agreements end to end (authoring, negotiation, obligation tracking, compliance).
- **Customer base:** More than one third of the Fortune 100, operating across 90+ countries (Icertis careers posting, Nov 2026).
- **Engineering hubs:** Pune (Viman Nagar) is the primary India engineering and internship hub, plus Bellevue, WA (US headquarters site used in 2026 press releases) and Boston event presence.
- **Commercial motion:** Enterprise SaaS subscriptions for contract lifecycle management, now bundled with the Vera AI layer.

### The 2025 to 2026 AI Trajectory (most relevant to this role)
- **Sept 2025:** Icertis launches **Vera** as the AI layer for contract intelligence ([press release](https://www.icertis.com/company/news/icertis-launches-vera-to-power-contract-intelligence-with-smarter-ai/)).
- **Nov 2025:** **Vera Agents** ship as semi-autonomous agents that plan and execute contracting workflows inside explicit guardrails, with humans in the loop for exceptions ([Vera Agents blog](https://www.icertis.com/research/blog/vera-agents-trusted-ai-for-contract-workflows/)).
- **May 2026:** Expanded multi-year Microsoft partnership to advance AI-native contract intelligence and agentic automation, deepening Azure and Microsoft AI alignment ([press release](https://www.icertis.com/company/news/icertis-expands-strategic-partnership-with-microsoft-to-advance-ai-native--contract-intelligence/)).
- **June 2026:** **Vera Foundation** introduced to give contracts persistent context (governance history, negotiation decisions, portfolio patterns) across the agreement lifecycle, and a reimagined AI-native contracting experience ([Vera Foundation blog](https://www.icertis.com/research/blog/when-contracts-finally-have-context-everything-changes/), [experience announcement](https://www.icertis.com/company/news/icertis-reimagines-enterprise-contracting-experience-powered-by-vera/)).

### Engineering Stack Signals
- **Core platform:** Microsoft/Azure native. Icertis has run on Azure since inception, including serverless Azure SQL Database (Monish Darda, [Microsoft Source Asia](https://news.microsoft.com/source/asia/features/with-azure-we-had-not-just-scale-but-hyperscale-at-our-fingertips-monish-darda-icertis/)).
- **Backend:** C#/.NET Core, ASP.NET Core Web APIs, Entity Framework, microservices (from Icertis ML Engineering job postings, Oct 2026).
- **Frontend:** React.js with modern JavaScript/TypeScript (same postings).
- **Applied AI team:** Expert Python for production agentic systems, durable multi-agent orchestration on **Temporal**, Azure AI / Azure OpenAI model deployment, LLMOps, RAG, safety, observability and governance ([Architect, Applied AI Engineering posting](https://jobs.fprimecapital.com/companies/icertis/jobs/61136077-architect-applied-ai-engineering)).
- **Intern pipeline:** Icertis runs parallel intern tracks (Development, AI Engineering, MERN) out of Pune, hiring batch 2026/2027 students.

---

## Phase 2: Live Engineering Pain Points & Hiring Gaps

These are the problems the Applied AI intern track lands next to, each tied to a public source.

1. **Guarded autonomy for contract agents.**
   - *Problem:* Vera Agents act semi-autonomously but must stay inside customer-defined guardrails and business rules, with humans retaining judgment calls and exception handling.
   - *Evidence:* Icertis describes agents that "act semi-autonomously but stay within your guardrails" with human-in-the-loop exceptions ([Vera Agents blog](https://www.icertis.com/research/blog/vera-agents-trusted-ai-for-contract-workflows/)).
   - *Systems impact:* Every tool call needs an authorization boundary that is not expressible in a model prompt. Identity and tenant scope must live outside LLM-visible parameters.

2. **Contract context retrieval at portfolio scale.**
   - *Problem:* The Vera Foundation exists precisely because contracts "operate without the context that would make them truly useful": governance history, negotiation decisions, and cross-portfolio patterns were previously invisible to the model.
   - *Evidence:* Vera Foundation announcement, June 2026 ([blog](https://www.icertis.com/research/blog/when-contracts-finally-have-context-everything-changes/)).
   - *Systems impact:* Retrieval quality and citation precision decide whether an agent answer is auditable. Benchmarked retrieval, not prompt tweaking, is the differentiator.

3. **Durable multi-agent orchestration and retry safety.**
   - *Problem:* The Applied AI team builds "durable agentic systems" with Temporal in Python, which implies long-running workflows that must survive restarts, retries, and partial tool failures.
   - *Evidence:* Architect, Applied AI Engineering posting specifies durable orchestration using Temporal plus owned LLMOps and observability ([posting](https://jobs.fprimecapital.com/companies/icertis/jobs/61136077-architect-applied-ai-engineering)).
   - *Systems impact:* Idempotency keys, distributed locks, and replay-safe side effects become mandatory, not optional.

4. **React surfaces for AI output.**
   - *Problem:* The intern posting explicitly asks for React UI components alongside backend services, meaning AI output has to be rendered into reviewable, citation-anchored interfaces.
   - *Evidence:* Posting responsibilities list "Develop UI components, backend services, and REST APIs" (job id 7861).
   - *Systems impact:* Streaming responses and reference links must degrade cleanly and stay cancellable when a user abandons a query.

---

## Phase 3: Action Package

### Top Ranked Gap (Fit x Impact / Effort)
| Rank | Gap | Candidate Proof | Fit | Impact | Effort | Score |
|:---:|---|---|:---:|:---:|:---:|:---:|
| 1 | Scoped tool authorization for agent runs (identity outside LLM parameters) | `LexoLegal` AgentDeps isolation | 5 | 5 | 2 | **12.5** |
| 2 | Retrieval quality and citation precision on long documents | `ncert-rag-evals`, `vectorless-rag` | 5 | 5 | 2 | **12.5** |
| 3 | Streaming AI output into a cancellable React review surface | `doubtless` frontend | 4 | 3 | 2 | **6.0** |
| 4 | Durable retry-safe task execution for agent workflows | `LexoLegal` Celery locks, `doubtless` PipelineRunner | 4 | 4 | 3 | **5.3** |

### 1-Weekend MVP Spec (Gap 1 + 2 combined)
- **Build:** A contract clause Q&A agent that answers only from retrieved clauses, refuses when retrieval is empty, and logs every tool call against a server-side permission policy.
- **Stack:** Python, FastAPI, Pydantic AI, SQLite FTS5 plus ChromaDB hybrid retrieval, React 19 review panel with citation links.
- **Skips:** Real contract ingestion, auth providers, multi-tenant deployment.
- **Milestones:** (1) SQLite FTS5 and Chroma ingest of 20 sample clauses; (2) RRF hybrid retrieval with a Recall@5 harness; (3) Pydantic AI agent whose tool scope comes from server-side deps, never from the model; (4) React panel streaming answers with clause citations; (5) 30-test Pytest and Vitest run with a refusal-rate table.
- **Demo:** Three questions where the agent answers with cited clauses, one where it refuses, plus the retrieval ablation table.

### Outreach Target
- Applied AI Engineering leadership in Pune (Architect / Lead Software Engineer, ML Engineering), reachable through the Icertis careers team (`careers@icertis.com`) and LinkedIn.
