# Audit Report: Discover Dollar Technologies, AI Engineer Intern (Agentic AI)

**Audit date:** November 22, 2026
**Target:** `targets/discover-dollar/ai-engineer-intern/`
**Verdict:** PASS. 34 / 34 deterministic checks passed.

---

## 1. Deterministic Engine Results

| Gate | Command | Result |
|---|---|---|
| Compile + 1-page budget | `bash engine/compile.sh resume.typ resume.pdf` | PASS, exactly 1 page |
| AST/Regex 5-gate + 1:1 skill proof | `python3 engine/verify_resume.py resume.typ --corpus core/projects_corpus.yaml` | PASS, 0 errors, 0 warnings |
| Text stream + CMap purity | `python3 engine/pdftotext_linter.py resume.pdf` | PASS, 100% linear extraction |
| Full research compliance | `python3 engine/verify_research_compliance.py targets/discover-dollar/ai-engineer-intern` | PASS, 34/34 |
| Visual render | `engine/visual_verify.py` | PASS, single page, no overlap |

Density: **658 words**, **16 content bullets** plus 3 project skill lines, `line_gap 0.72em`, `section_gap 0.86em`, `header_gap 1.30em`. Inside the 18-bullet ceiling with the 0.68em spacing floor respected. Full-page calibration was iterative: 0.84em, 0.80em and 0.78em each spilled Education onto page 2 once the Smart India Hackathon bullet was added, so 0.72em is the highest gap that holds one page at 16 bullets.

---

## 2. Commit-Tree Verification

Every claim on the resume traces to a pinned commit in `core/projects_corpus.yaml` or to `core/profile.yaml`.

| Project | Pinned SHA | Claims carried into this resume |
|---|---|---|
| `ncert-rag-evals` | `a7d1e24c0a861d7a9c3e1d9de648b8805abae264` | 17 textbooks, 8 strategies, 4,429 section-aware chunks, SQLite FTS5 + ChromaDB, RRF, 86.9% Recall@5 at 8.9ms CPU, 99.8% latency cut, McNemar p = 0.0021, 92 tests |
| `doubtless` | `2e17ad9462d8e1a96f46803f2b219e93c65db0e5` | Pydantic AI + FastAPI SSE agent, 45s dialogue windows, AbortSignal cancellation, 4-stage Celery/Redis ingestion, 16kHz audio under 15MB/hr, <10s Groq Whisper, SQLite WAL, Docker, OpenTelemetry and Logfire, 151 tests |
| `vectorless-rag` | `c3b1741a5e44aa403de276dbd70a92be1b271135` | 100% vs 93% hit rate, 0.85 vs 0.69 citation precision, 18 queries, 2.7x token cost, 2x latency, 40% extraction latency cut, bounded memory <200MB |
| `LexoLegal` (profile ground truth) | `core/profile.yaml` | Munshi over MCP clients, AgentDeps identity isolation, sub-2s latency, 12-hour refresh sweep, 90-retry ceiling, atomic Redis locks, zero duplicate alerts, 38 FastAPI endpoints, SQLAlchemy 2.0, 12 PostgreSQL tables, Alembic, RFC 9457, 1,024 pytest tests |
| `Webxela` (profile ground truth) | `core/profile.yaml` | Trademark engine in Kotlin/Spring Boot/PostgreSQL, 25 parallel coroutines, 5,000-record chunks, Ktor ingestion, 50-step backoff, Flyway |
| Leadership (profile ground truth) | `core/profile.yaml` | 3 GenAI sessions, 150+ students; Smart India Hackathon 2 editions, 20+ teams, 120+ participants; 4,000+ star upstream repo; auth flaws disclosed across 500+ affiliated colleges |

No metric appears that is absent from the corpus. No invented company, test count, or framework.

---

## 3. Title and Sanitization Record

| Field | Value |
|---|---|
| Raw posting strings | `AI Engineer Intern – Agentic AI & LLM Engineering`, `AI Engineer Intern (Agentic AI)` |
| Stripped | Department tag, domain qualifiers, `Location: Bengaluru`, `Employment Type: Internship`, portal boilerplate |
| Header title rendered | `AI Engineer Intern` |
| Experience titles | Immutable: `Software Development Engineer Intern` (LexoLegal), `Freelance Developer` (Webxela), both verbatim from `core/profile.yaml` |

---

## 4. Adversarial Claims Review

| Claim on artifact | Challenge | Outcome |
|---|---|---|
| "orchestrating Model Context Protocol clients" | Is this MCP servers or just REST calls? | Defensible. Profile records MCP clients across Google Drive and Calendar servers. Phrased as clients, which matches what was built. |
| "eliminating cross-tenant prompt injection" | Absolute claim. | Defensible in scope: identity moved from model-supplied parameters into typed AgentDeps, so untrusted text cannot set it. The mechanism, not a guarantee, is what the bullet states. |
| "zero duplicate alerts, zero message loss at a 90-retry ceiling" | Sounds too clean. | Defensible. Idempotent diffing plus atomic Redis locks plus bounded requeues is exactly the design that yields this, and it is recorded in the profile verbatim. |
| "matching LLM query expansion while cutting retrieval latency 99.8%" | Two numbers, one claim. | Defensible. Corpus records the 99.8% cut against LLM query expansion as the comparison basis. |
| "instrumented OpenTelemetry and Logfire tracing" | Vendors not on the JD list. | Intentional. User chose OpenTelemetry plus Logfire only; MLflow, LangSmith and Langfuse are absent from every artifact. |
| LangGraph, LangChain, DeepAgents | The JD names all three. | Intentionally absent. They sit in `core/profile.yaml` skills with zero bullet evidence and no repository, and the user elected to omit rather than claim them. The resume answers the framework requirement with verified Pydantic AI orchestration. Acknowledge the gap verbally in the interview, do not paper over it. |

---

## 5. ATS Parse Simulation

- Single column, zero tables, zero icon glyphs, zero text boxes.
- Contact stream is plain text on one line: phone, email, LinkedIn, GitHub.
- Section headings are the standard six, in experience-aware order: Work Experience, Projects, Technical Skills, Leadership, Education.
- Bold spans are technologies and metrics only; no leading action verb is bolded.
- Skill rows map to a canonical taxonomy: Languages & Core, AI/Agents/Evals, Backend/Data/Infra. No banned non-skills (`embeddings`, `hybrid search`, `recall@k`, `evals()`), which the banned-pattern gate confirms.
- 1:1 proof holds for all 22 listed skill tokens, with DSA, OOP, DBMS and Operating Systems exempt as CS fundamentals.

---

## 6. Known Risks Before Submitting

1. **Compensation is unconfirmed and probably low.** The Techstars mirror labels this posting "unpaid, no fixed duration", Alion estimates INR 15 to 30K per month, and Naukri lists 0 to 1 years. Confirm stipend and duration in the first recruiter call before investing more.
2. **Named-framework gap is real.** If the team screens on LangGraph or DeepAgents keywords, a resume cannot fix that. The cold email and cover letter deliberately lead with MCP, tracing, and evals, which a screening script will not catch but a CTO will.
3. **No verified email for the CTO.** Outreach is written for a LinkedIn DM. Do not guess an address pattern.
4. **Location.** The role is Bengaluru on-site and the candidate's immutable home location stays `Jaunpur, UP, India` per profile rules. Relocation willingness is stated in the cover letter close, not faked in the header.
