# Role Analysis: AI Engineering Intern (Icertis)

## 1. Role Identification & Title Sanitization (10.6x Requisition Multiplier)
- **Target Company:** Icertis (Icertis Solutions Private Limited)
- **Location:** Pune, Maharashtra, India (work from office, 5 days a week, 6-month paid internship)
- **Employment Type:** Internship
- **Raw Posting Strings:** `Intern - AI Engineering` (careers portal, job id 7861) and `Intern - AI Engineering` (Built In mirror)
- **Sanitization Log:**
  - No recruiter tags, requisition IDs, cohort markers, or modality suffixes were present in the functional string.
  - Normalized leading employment noun: `Intern - AI Engineering` reads as a function-first posting, so the employment noun moves to the trailing position used by every ATS title field.
  - `AI Engineering` is retained because it is the posting's own functional discipline, not domain text lifted from the JD body.
  - **No synthesized qualifier** was appended (no `Generative AI`, no `Applied AI`, no `Contract Intelligence`).
- **Target Title for Resume Header:** `AI Engineering Intern`

---

## 2. The 4-Quadrant JD Extraction Matrix

### Quadrant I: Core Languages & Runtimes
- Python (primary Applied AI language at Icertis: services, agent workflows, LLM orchestration)
- C# / .NET (platform language; JD accepts "Python and/or C#/.NET")
- JavaScript / TypeScript (React component development)
- SQL (relational querying against the contract data model)
- HTML / CSS (component styling)
- Core CS fundamentals (OOP, data structures, algorithms, debugging)

### Quadrant II: Infrastructure, Databases & Cloud
- SQL databases (relational schema, querying, integration work)
- Azure (platform home; Azure SQL Database, Azure OpenAI per public engineering statements)
- REST APIs and third-party API integrations
- Git (version control, review workflow)
- Containerized local and deployment environments

### Quadrant III: Architectural Patterns
- Applied Generative AI (LLM-backed features moving from prototype to enterprise-ready)
- Prompt engineering and prompt iteration
- Retrieval-Augmented Generation (RAG) as a stated plus
- AI agents as a stated plus (Vera Agents are semi-autonomous, guardrailed, human-in-the-loop)
- REST API contract design and backend service layering
- Object-oriented design and component decomposition
- Durable orchestration and retry-safe execution (team-level context from Icertis Applied AI postings)

### Quadrant IV: Scale & SLAs
- Intern-level bar: 0 years of experience, projects and fundamentals over production scale
- Implicit reliability bar: enterprise contracts, so outputs must be auditable and grounded
- Latency bar: interactive UI, streaming AI responses expected to stay responsive
- Correctness bar: contract answers require cited sources, not free-form generation

---

## 3. Hard Qualification Gate Evaluation

| Evaluation Dimension | Job Requirement | Candidate Ground Truth (`core/profile.yaml`, `core/projects_corpus.yaml`, `doubtless` commit `2e17ad9`) | Status |
|---|---|---|---|
| Degree | Pursuing BE/BTech/BCA/MCA in CS, IT, AI or related | B.Tech in Computer Science & Engineering, VBS Purvanchal University (2023 - 2027) | **MATCH** |
| Backend language | Hands-on Python and/or C#/.NET | Python across LexoLegal (FastAPI, Pydantic AI, Celery), doubtless, ncert-rag-evals, vectorless-rag. No C#/.NET, which the "and/or" clause permits | **MATCH** (Python path) |
| React | Basic React knowledge, build UI components | `doubtless/frontend`: React 19, TypeScript, React Router 7, Tailwind CSS 4, VIDstack player, 12 Vitest suites | **MATCH** |
| JavaScript/TypeScript | Basic JS/TS | TypeScript throughout `doubtless/frontend` (`tsconfig.json`, typed service and hook layers) | **MATCH** |
| HTML/CSS | Basic HTML and CSS | `frontend/index.html`, `index.css`, Tailwind CSS 4 utility styling across components | **PARTIAL** (framework-level styling, no hand-authored CSS system) |
| APIs and SQL | Familiarity with APIs, SQL, databases | 38 REST endpoints in FastAPI and SQLAlchemy 2.0 over 12 PostgreSQL tables; SQLite FTS5 and ChromaDB retrieval work | **MATCH** |
| Git | Familiarity with Git | `doubtless` commits gated through `.pre-commit-config.yaml` Git hooks (Ruff, mypy); GitHub-hosted repositories | **MATCH** |
| Object-oriented programming | Familiarity with OOP | Java and Kotlin Spring Boot services, Kotlin domain layers, Python typed service layers | **MATCH** |
| Generative AI / LLMs | Basic understanding | Pydantic AI agents at LexoLegal and in doubtless; LLM page indexing in vectorless-rag | **MATCH** |
| RAG or AI agents (plus) | Exposure is a plus | RAG benchmarking in ncert-rag-evals (8 strategies, RRF, 86.9% Recall@5), MCP agent orchestration at LexoLegal | **MATCH** |
| Projects | Academic, personal, or hackathon projects | Commit-pinned repositories: doubtless, ncert-rag-evals, vectorless-rag, WatchTower, oak, modflix | **MATCH** |

- **Total Essential Requirements Evaluated:** 11
- **Fully Matched:** 10
- **Partial:** 1 (HTML/CSS at framework level)
- **Missing Non-Negotiables:** None (C#/.NET absent but explicitly optional in the JD)
- **Match Score:** **95%** (10 full + 1 partial)
- **Pipeline Decision:** **Hard Qualification Gate PASSED.** Proceed to tailoring, audit, cover letter, and outreach.

### Acknowledged Gap
- **C#/.NET and Azure:** Icertis runs on a Microsoft stack. The candidate has no .NET exposure and no fabricated line was added. The resume leans on Python, FastAPI, React, TypeScript, and RAG, which map to the Applied AI track rather than the platform track. This is the single gap the cover letter addresses head-on.

---

## 4. Role-Specific Hiring Gap Analysis

| Rank | Gap & System Challenge | Candidate Proof Repo | Fit (1-5) | Impact (1-5) | Effort (1-5) | Score `(Fit x Impact) / Effort` |
|:---:|---|---|:---:|:---:|:---:|:---:|
| 1 | **Scoped tool authorization for guarded agents**<br>Vera Agents act semi-autonomously inside customer guardrails; identity and tenant scope cannot live in LLM-visible tool parameters. | `LexoLegal` (AgentDeps isolation) | 5 | 5 | 2 | **12.5** |
| 2 | **Contract retrieval precision and citation auditability**<br>Vera Foundation supplies contract context; answers must cite the clause they came from. | `ncert-rag-evals`, `vectorless-rag` | 5 | 5 | 2 | **12.5** |
| 3 | **Streaming AI output into a cancellable React surface**<br>Users abandon queries; SSE streams need frame buffering, abort handling, and citation linking. | `doubtless` frontend | 4 | 3 | 2 | **6.0** |
| 4 | **Durable, retry-safe agent task execution**<br>Long-running workflows must survive worker restarts without duplicate side effects. | `LexoLegal` Celery locks, `doubtless` PipelineRunner | 4 | 4 | 3 | **5.3** |

### Top Recommended MVP
- **Cited Clause Agent:** a Python and FastAPI service with SQLite FTS5 plus ChromaDB hybrid retrieval over sample contract clauses, a Pydantic AI agent whose tool scope is injected from server-side dependencies, and a React 19 review panel that streams answers with clause citations. Ships with a retrieval ablation table and a refusal path when nothing is retrieved.
