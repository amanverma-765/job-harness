# Role Analysis: Software Development Engineer Intern (Backend)

## 1. Role Identification & Title Sanitization (10.6x Requisition Multiplier)

- **Target Company:** Apna Mart (Fleet Labs Technologies Pvt Ltd)
- **Role Slug:** `sde-intern-backend`
- **Location:** Gurugram, Haryana, India (in office, relocation allowed, no visa sponsorship)
- **Compensation:** Rs 4 LPA (annualised)
- **Employment Type:** Internship, no prior experience required
- **Raw Posting String:** `SDE Intern - Backend (Gurgaon)`
- **Sanitization Log:**
  - Expanded internal shorthand: `SDE` -> `Software Development Engineer`
  - Stripped location tag in parentheses: `(Gurgaon)`
  - Stripped domain qualifier from the title: `- Backend`
  - Zero synthesized suffixes appended
- **Target Title for Resume Header (`target_title`):** `Software Development Engineer Intern`
- **Immutability Guard:** Work experience titles remain exactly as recorded in `core/profile.yaml` (`Software Development Engineer Intern` at LexoLegal, `Freelance Developer` at Webxela). The sanitized title above is the posting's own functional title and coincidentally matches the LexoLegal role string, which is verified compliant by `engine/verify_research_compliance.py`.

## 2. The 4-Quadrant JD Extraction Matrix

### Quadrant I: Languages & Runtimes
- Python (primary backend language across the team's Django, Flask, and FastAPI services)
- One backend stack at working depth: Python (Django / Flask / FastAPI) OR Node.js
- SQL: joins, filtering, and simple schema design
- Data structures and problem-solving fundamentals (explicit must-have)
- AI coding agents (Claude Code, Cursor) as a first-class daily development tool

### Quadrant II: Infrastructure, Databases & Cloud
- PostgreSQL or MySQL (relational modelling and query writing)
- Redis (listed in the posted stack and in the good-to-have list)
- Git-based version control and code review
- Deployed internal tools with occasional frontend changes

### Quadrant III: Architecture
- REST API design and consumption (client, API, and database interaction model)
- Webhook and third-party integration literacy (from the broader Apna Mart backend postings)
- Operational data pipelines reconciling store, order, and catalogue state
- Debugging and investigating production issues with the operations team
- Small feature ownership end to end, from requirement to rollout

### Quadrant IV: Scale & SLAs
- Franchise network of 200+ stores and 60,000+ products across 4 states and 15+ cities (Frappe case study)
- 10-minute hyper-local delivery promise on the online ordering channel
- Tier-2 and tier-3 city operations where store-level stock accuracy drives fulfilment
- Ops workflows named in the JD: investigating a stock discrepancy, tracking a delayed order

## 3. Hard Qualification Gate Evaluation

Requirement-level scoring, one row per must-have in the posting. Alternative-stack rows are counted as satisfied when any listed alternative is genuinely held.

| Evaluation Dimension | Job Requirement | Candidate Ground Truth (`core/profile.yaml` & `core/projects_corpus.yaml`) | Status |
|---|---|---|---|
| Backend stack depth | Python (Django, Flask, or FastAPI) or Node.js | Python with FastAPI (38 REST endpoints), Spring Boot (Kotlin) | **MATCH** |
| SQL fundamentals | PostgreSQL or MySQL, joins, simple schema design | PostgreSQL across 12 relational tables, SQLAlchemy 2.0, Alembic, SQLite FTS5 | **MATCH** |
| API / DB / client model | Understand how APIs, databases and clients fit together; connect a client to an API | REST surface published as OpenAPI schemas; Android, iOS, JVM clients consuming Ktor and FastAPI services | **MATCH** |
| AI coding agents | Hands-on Claude Code or Cursor use, able to explain generated code | User-confirmed daily hands-on use (2026-11-22); AI agent systems built with Pydantic AI and MCP | **MATCH (user-confirmed)** |
| DSA fundamentals | Good data structures and problem-solving fundamentals | DSA in `core/profile.yaml` skills core; Myers diff, RRF ranking, semaphore concurrency control | **MATCH** |
| Self-built project depth | At least one project built independently and explainable in depth | 7 commit-pinned repositories (doubtless 151 tests, ncert-rag-evals 92 tests, WatchTower, oak, cypher-x, modflix, vectorless-rag) | **MATCH** |
| Communication & ownership | Ask specific questions, explain reasoning, flag blockers | 3 technical sessions to 150+ students; upstream OSS fixes on a 4,000+ star repo; security disclosure across 500+ colleges | **MATCH** |

- **Total Essential Requirements Evaluated:** 7
- **Total Matched Requirements:** 7
- **Requirement-Level Match Score:** **100%**
- **Token-Level Skill Overlap (informational):** 4 of 8 posted skill tokens held directly (Python, FastAPI, PostgreSQL, Redis). The remaining four (Django, Flask, Node.js, MySQL) are mutually exclusive alternatives to a stack the candidate already holds, not independent gaps.
- **Pipeline Decision:** **PASSED.** Proceed to Phase 3 (`/job:tailor`).

### Honest Gap Register (not fabricated, not claimed)
- **MySQL:** candidate holds PostgreSQL only. MySQL is never claimed on the resume.
- **Django and Flask:** not in candidate truth. FastAPI satisfies the "one backend stack" clause.
- **Node.js:** not in candidate truth. Not claimed.
- **React or Nuxt (good to have):** not in candidate truth. The "occasional frontend changes to internal tools" line is left unaddressed rather than overstated.

## 4. Role-Specific Hiring Gap Analysis & MVP Recommendations

Cross-referencing Apna Mart's retail operations surface (store stock, order lifecycle, catalogue sync) against commit-pinned candidate repositories:

| Rank | Gap & System Challenge | Candidate Proof Repo | Fit (1-5) | Impact (1-5) | Effort (1-5) | Score `(Fit x Impact) / Effort` |
|:---:|---|---|:---:|:---:|:---:|:---:|
| 1 | **Store-level stock discrepancy reconciliation**<br>Detecting the delta between expected and observed SKU quantity per store without flooding operations with duplicate tickets from repeated sweeps. | `WatchTower` (MD5 hashing + Myers diff on snapshots) and `LexoLegal` (idempotent diffing engine) | 5 | 5 | 2 | **12.5** |
| 2 | **Delayed order tracking with deduplicated alerting**<br>Sweeping open orders on a schedule and alerting ops only when an order breaches its delivery SLA, exactly once per breach. | `LexoLegal` (12-hour Celery sweep, two-stage notification ledger, zero duplicate alerts) and `doubtless` (4-stage async pipeline) | 5 | 5 | 2 | **12.5** |
| 3 | **Multi-source catalogue and POS ingestion into one relational model**<br>Pulling store and product records from heterogeneous upstream APIs into PostgreSQL with retry-safe writes and migrations. | `LexoLegal` (eCourts ingestion across 25 High Courts and 743 District Courts, Alembic, 12 tables) | 4 | 5 | 3 | **6.7** |

### Top Recommended MVP
- **Inventory Reconciliation & SLA Alert Service:** a FastAPI, PostgreSQL, Celery, and Redis service that ingests two stock snapshots per store SKU, computes a Myers-style diff, writes a single reconciliation ticket per real discrepancy (atomic Redis locks plus a two-stage dispatch ledger to guarantee no duplicates), and sweeps open orders to raise one Slack or WhatsApp alert per SLA breach. Shipped with a Pytest suite and a Docker Compose file, sized for one weekend.
