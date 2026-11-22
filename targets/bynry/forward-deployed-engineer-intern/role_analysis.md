# Role Analysis: Bynry - Forward Deployed Engineer Intern

- Company slug: `bynry`
- Role slug: `forward-deployed-engineer-intern`
- Source: PyjamaHR posting 430841 (pasted text)
- Location: Pune, Maharashtra, India (Hybrid)
- Duration / Type: 6-month internship, extendable to 9 months
- Compensation: INR 10,000 / month

## 10.6x Requisition Title

- Raw portal string: `Forward Deployed Engineer Intern` (portal also lists `Job ID: 430841`,
  workplace `Hybrid`, location `Pune, Maharashtra, India`)
- Sanitization applied: removed job ID, workplace-type tag, and location metadata. No
  recruiter/talent-team tag, cohort marker, or parenthetical modality present. No
  internal shorthand to expand (`Forward Deployed Engineer` is already the canonical
  functional title).
- Multi-title posting check: the marketplace listing and the portal title are identical.
- Employment-type noun: already present (`Intern`).
- **Final `target_title`: `Forward Deployed Engineer Intern`** (bare functional title,
  zero domain/team/product suffix).

## 4-Quadrant Matrix

### Quadrant I: Languages & Runtimes
- Python (primary, with "a related framework")
- SQL (basic querying, data movement)
- JavaScript or TypeScript (preferred)
- Python web framework: FastAPI, Django or Node.js (preferred); React JS (preferred)
- HTTP/REST as the integration contract

### Quadrant II: Infra, DB & Cloud
- Git and version control (required)
- CI/CD pipelines (deployment support)
- Cloud basics: AWS (preferred; Google Cloud mentioned)
- Docker (preferred)
- SQL databases across SMART360 customer instances (meter-to-cash data)
- Webhooks as an inbound integration surface

### Quadrant III: Architecture
- Forward-deployed integration pattern: customer-specific small APIs and automation
  workflows built against a multi-tenant utility platform
- LLM API prototyping with basic retrieval (RAG) workflows and output accuracy checks
- Reusable component extraction from repeated customer needs
- End-to-end test ownership: functional, integration, regression, UAT
- Root-cause debugging across configuration gaps and client-specific deployments

### Quadrant IV: Scale & SLAs
- Utility account volumes: 3,000 to 100,000 connections per utility (product scope)
- No explicit QPS or latency SLA in the posting; the operative SLA is billing accuracy
  and regression-safe deployments
- Deliverable SLA: one shipped integration/automation/AI workflow within 6 months, backed
  by automated tests that pass regression checks

## Hard Qualification Gate

Essential requirement count: **8**. Matched: **8**. Match Score: **(8 / 8) * 100 = 100%**.

| # | Essential Requirement | Evidence in `core/` | Status |
|---|----------------------|--------------------|--------|
| 1 | CS/IT degree or equivalent practical experience | B.Tech CSE, VBSPU (2023 - 2027), `core/profile.yaml` | MATCHED |
| 2 | Working Python knowledge | LexoLegal Python bullets; `ncert-rag-evals`, `doubtless`, `vectorless-rag` | MATCHED |
| 3 | APIs, HTTP and REST | 38 FastAPI REST endpoints; OpenAPI schemas; webhook HMAC verification | MATCHED |
| 4 | Basic SQL | PostgreSQL schema of 12 tables, Alembic migrations, SQLite FTS5 indexing | MATCHED |
| 5 | Git / version control | Commit-pinned public repositories, pre-commit hooks, GitHub Actions (modflix) | MATCHED |
| 6 | Problem solving and debugging | eCourts protocol reverse engineering; race-condition hardening with Redis locks | MATCHED |
| 7 | Communication and presentation | 3 technical sessions to 150+ students; SIH organizing across 2 editions | MATCHED |
| 8 | LLM APIs and AI-first workflow | Pydantic AI agents (Munshi), RAG benchmarks, multimodal RAG ingestion | MATCHED |

Preferred-skill coverage (not counted toward the gate):

| Preferred | Evidence | Status |
|-----------|----------|--------|
| JavaScript / TypeScript | `doubtless` React 19 + TypeScript client | MATCHED |
| FastAPI / Django / Node.js | FastAPI in LexoLegal and `doubtless` | MATCHED |
| React JS | React 19 workspace in `doubtless` | MATCHED |
| pytest | 1,024 pytest tests (LexoLegal), 92 (ncert), 107 (doubtless) | MATCHED |
| Playwright | In `core/profile.yaml` skills, but **no commit-pinned bullet** | NOT GROUNDED (user-confirmed only) |
| Postman | Listed in profile tooling, no bullet proof | OMITTED from document |
| Docker | Dockerized API and client in `doubtless`; Compose in Webxela | MATCHED |
| AWS / Google Cloud | No verified evidence in `core/` | GAP (preferred only) |
| LLM API project / GitHub profile | `doubtless`, `ncert-rag-evals` public and commit-pinned | MATCHED |
| 6-12 months experience | LexoLegal SDE internship (Nov 2025 - Jul 2026) + Webxela freelance | MATCHED |

**Gate verdict: PASSED** (100% of essentials matched, zero missing non-negotiables).

## Hiring Gaps Ranked by (Fit x Impact) / Effort

1. **Utility-domain data fluency (highest fit).** Candidate has PostgreSQL schema design and
   SQLite FTS5 indexing but zero utility (meter-to-cash, billing cycle, account master)
   exposure. Highest-leverage response: a small meter-read-to-invoice reconciliation
   script over a synthetic SMART360-shaped dataset.
2. **Customer-facing integration surface.** Candidate has REST, webhooks (Square, WhatsApp)
   and OAuth 2.0, but no customer-tenant deployment or UAT ownership. Response: a webhook
   receiver plus replay-protected idempotent handler demo.
3. **Cloud basics (AWS) with CI/CD.** Git and Docker are verified; AWS is not. Response:
   document a container deploy path without claiming production AWS experience.
4. **RAG accuracy checking for customer data.** Very high fit: `ncert-rag-evals` already
   measures Recall@5 and runs McNemar significance tests on retrieval strategies. Response:
   re-point the benchmark harness at a utility document set (tariffs, billing rules).

## Positioning Notes

- Section order is Case A (candidate has work experience): Header, Work Experience,
  Projects, Technical Skills, Leadership, Education.
- Lead with the FastAPI/REST/SQL/testing surface. The Android/KMP work is real but irrelevant
  to this requisition and must not consume bullet budget.
- Do not claim AWS, Django, Node.js, customer workshops, or production on-call. Do not
  claim Playwright in a bullet it did not produce.
- Immutable experience title: `Software Development Engineer Intern` at LexoLegal.
