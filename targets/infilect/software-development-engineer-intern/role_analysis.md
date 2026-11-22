# Role Analysis: Software Development Engineer Intern (Infilect)

**Target Requisition Title:** Software Development Engineer Intern
**Company:** Infilect Technologies Pvt. Ltd. (now part of Andavi Solutions)
**Location:** Bengaluru, Karnataka (on-site, 5 days/week)
**Duration:** 6 months, extendable to full-time
**Match Score:** 87.5% (7 / 8 essential dimensions)
**10.6x Multiplier Title:** `Software Development Engineer Intern`

## 1. Title Sanitization Log
- Raw posting string: `SDE internship ( Backend )` with tags `Bangalore` / `Full-Time`
- Stripped parenthetical track qualifier: `( Backend )`
- Expanded shorthand: `SDE` -> `Software Development Engineer`
- Normalized noun form: `internship` -> `Intern`
- Stripped location and employment-type tags from the title field
- **Final header title:** `Software Development Engineer Intern`
- No domain, team, or product qualifier appended; the posting labels the type `Full-Time` while the body specifies a 6-month internship, so the employment-type noun is `Intern`.

---

## 2. The 4-Quadrant JD Extraction Matrix

### Quadrant I: Core Languages & Runtimes
- **Required:** Python (primary), Django, SQL, REST/JSON
- **Candidate Ground Truth:** Python (FastAPI, SQLAlchemy 2.0, Celery, Pytest), SQL (PostgreSQL, SQLite FTS5), Bash, Kotlin (Spring Boot). Django: **zero evidence** in `core/profile.yaml`, `core/projects_corpus.yaml`, or any indexed repository.

### Quadrant II: Infrastructure, Databases & Cloud
- **Required:** Relational databases (PostgreSQL implied), non-relational databases, Nginx/API deployment, Git
- **Candidate Ground Truth:** PostgreSQL (12 tables, Alembic migrations), Redis (locks, caching, queues), SQLite WAL, ChromaDB, Nginx, Docker, Git, GitHub Actions, Linux

### Quadrant III: Architectural Patterns
- **Required:** RESTful API design, background/async work, monitoring and data-quality instrumentation, testing protocols, cross-team collaboration
- **Candidate Ground Truth:** 38 async FastAPI endpoints with OpenAPI contracts and RFC 9457 problem details, Celery + Redis idempotent pipelines, OpenTelemetry + Logfire tracing, Pytest (1,024 at LexoLegal; 151 in `doubtless`; 92 in `ncert-rag-evals`), Clean Architecture

### Quadrant IV: Operational Scale & SLAs
- **Required:** Minimizing latency, maximizing throughput, hardware efficiency, system stability, data quality
- **Candidate Ground Truth:** Sub-2s agent response latency, 86.9% Recall@5 in 8.9ms on CPU, 99.8% latency cut, 4,429 indexed chunks, 16kHz mono audio at <15MB/hr, <10s transcription, 25-coroutine ingestion for 5,000-record chunks, 25 High Courts / 743 District Courts ingestion

---

## 3. Hard Qualification Gate Evaluation

| Dimension | Job Requirement | Candidate Ground Truth | Status |
| :--- | :--- | :--- | :--- |
| **Primary language** | Python | Production FastAPI, SQLAlchemy, Celery, Pytest | **MATCH (100%)** |
| **Web framework** | Django | FastAPI + Spring Boot; no Django anywhere | **GAP (0%)** |
| **REST API design** | Create and enhance RESTful APIs | 38 endpoints, OpenAPI schemas, JWT, RFC 9457 | **MATCH (100%)** |
| **Relational databases** | Data storage and retrieval | PostgreSQL, SQLAlchemy 2.0, Alembic, SQLite FTS5 | **MATCH (100%)** |
| **Non-relational databases** | Non-relational handling | Redis (queues, locks, cache), ChromaDB | **MATCH (100%)** |
| **Monitoring & stability** | Design and implement monitoring systems | OpenTelemetry, Logfire, distributed tracing | **MATCH (100%)** |
| **Testing & QA** | Devise and implement testing protocols | Pytest suites: 1,024 / 151 / 92 tests | **MATCH (100%)** |
| **Performance optimization** | Latency, throughput, hardware efficiency | 99.8% latency cut, 8.9ms CPU retrieval, <15MB/hr audio | **MATCH (100%)** |
| **Collaboration** | Work across engineering teams | Cross-platform client + backend + maintainer upstream fixes | **MATCH (100%)** |
| **Education** | Engineering degree | B.Tech CSE, 2023 - 2027 | **MATCH (100%)** |

- **Matched Essential Dimensions:** 7 / 8 functional dimensions (Django excluded from the denominator-neutral score of 7/8)
- **Match Score:** 87.5%
- **Gate Determination:** **PASSED**. Python backend depth is production-grade; Django is the only missing framework and the posting frames it as "curiosity to learn and adapt to".

### Candidate Decision Log
- **Django (user decision):** omit from the resume and Skills section, prove FastAPI/SQLAlchemy depth instead. Django appears only in the cover letter as a learning ramp. Never claimed as experience.
- **On-site Bangalore, 5 days/week (user decision):** cover letter states availability to relocate to Bengaluru for the full 6-month stint. Header home location stays `Jaunpur, UP, India` (immutable).
- **Start date (user decision):** immediate / earliest available.

---

## 4. Ranked Gaps (Role-Specific)
1. **Django + DRF service depth.** Highest weight; mitigated by FastAPI/SQLAlchemy ORM-equivalent proof and the Django port in the 1-weekend MVP spec.
2. **Non-relational data modeling beyond Redis.** ChromaDB is a vector store, not a document store; framed as adaptable.
3. **Production monitoring ownership.** Candidate has instrumentation (OpenTelemetry/Logfire) but not an escalation/alerting platform; highlighted in outreach.
