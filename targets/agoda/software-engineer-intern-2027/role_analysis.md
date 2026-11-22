# Role Analysis: Agoda — Software Engineer Internship 2027 (6 months)

## Requisition Title (10.6x Multiplier)

- **Raw posting title:** `Software Engineer Internship 2027 (6 months) - India-based, Gurgaon office`
- **Sanitized title:** `Software Engineer Intern`
- Stripped: cohort year (`2027`), duration marker (`6 months`), geography/office tag (`India-based, Gurgaon office`).
- Employment-type noun retained: posting is an internship, so `Software Engineer` -> `Software Engineer Intern`.

## Role Snapshot

| Field | Value |
| --- | --- |
| Company | Agoda (Booking Holdings, NASDAQ: BKNG) |
| Team | Not specified; generalist engineering placement (full stack, backend, or domain specialist) |
| Location | Gurgaon, India; office-based at least 2 days/week |
| Period | 11 January - 30 June 2027 (24 weeks, full-time) |
| Interview path | Online coding test (28-29 Nov 2026), shortlist (2 Dec), on-site day (11 or 17 Dec 2026) |
| Registration closes | 22 November 2026 |

## 4-Quadrant JD Extraction Matrix

### Quadrant I: Languages & Runtimes
- **Must:** Object-oriented and/or functional programming fundamentals.
- **Named in posting:** Scala, Kotlin, ReactJS, C#, Java, JavaScript.
- **Data/ML:** Python implied via AI/ML frameworks (TensorFlow, PyTorch, scikit-learn, PySpark).

### Quadrant II: Infrastructure, Databases & Cloud
- Relational: MSSQL, PostgreSQL.
- Non-relational / distributed data: Cassandra, Hadoop, Kafka, Spark.
- Delivery: CI/CD (TeamCity), Puppet deployment, Git source control, Docker-style container workflows implied by CI/CD ownership.

### Quadrant III: Architecture
- Scalable, fault-tolerant systems and APIs serving millions of requests.
- Back-end application and service development with system-scaling fundamentals.
- Test-driven development, clean software architecture, SOLID principles.
- ML/LLM feature prototyping and productionization (AI tooling exposure).
- Agile development, full product lifecycle ownership (requirements -> coding standards -> testing -> deployment -> monitoring).

### Quadrant IV: Scale & SLAs
- Millions of requests on public APIs.
- Zero-downtime delivery expectations via CI/CD and testing.
- No published latency or QPS numbers in the posting (intern-level framing).

## Hard Qualification Gate

Match score counts only the stated "What You'll Need to Succeed" essentials; the bonus list is not gated.

| # | Essential requirement | Candidate evidence (`core/profile.yaml`, `core/projects_corpus.yaml`) | Status |
| --- | --- | --- | --- |
| 1 | Pursuing Bachelor's/Master's in CS or related | B.Tech Computer Science & Engineering, Veer Bahadur Singh Purvanchal University, 2023 - 2027 | MATCHED |
| 2 | OOP and/or functional programming fundamentals | `OOP` in skills taxonomy; Kotlin (`data class`, sealed hierarchies, `Flow`), Clean Architecture domain layers, Python (`Pydantic AI` typed agents) | MATCHED |
| 3 | Relational and/or non-relational databases | PostgreSQL (12 relational tables, Alembic), SQLite (WAL, FTS5), Redis, ChromaDB, Room/SQLite on mobile | MATCHED |
| 4 | Proficient English communication | 3 technical talks to 150+ students, upstream OSS collaboration with maintainers, English-medium engineering deliverables. No external test score on file; user confirmation pending. | EVIDENCED (confirm) |
| 5 | Readiness to learn quickly and adapt | New stacks shipped per project (KMP, Pydantic AI, FastAPI, Spring Boot, React 19) | MATCHED |
| 6 | Available for a 6-month full-time internship | Period is 11 Jan - 30 Jun 2027; candidate's LexoLegal tenure ends Jul 2026, so no overlap. Final-year spring semester may require a university NOC | PENDING CONFIRMATION |

- **Technical essential match:** 5 / 5 = **100%**
- **Gate result:** **PASSED** (>= 50%). Availability is a logistics confirmation, not a technical disqualifier.

### Bonus-List Coverage (not gated)

| Bonus item | Candidate coverage |
| --- | --- |
| Kotlin | Yes (LexoLegal, KMP library `oak`, WatchTower, modflix, cypher-x) |
| ReactJS / JavaScript | Yes (React 19 + TypeScript workspace in `doubtless`) |
| Java / Scala / C# | No verified experience |
| AI/ML frameworks | Yes (PyTorch, Hugging Face, Pydantic AI, ChromaDB, Whisper) |
| Back-end services + system scaling | Yes (38 FastAPI endpoints, Celery/Redis pipeline, Nginx, Spring Boot) |
| MSSQL / Cassandra / Hadoop | MSSQL no (PostgreSQL yes), Cassandra no, Hadoop no |
| Kafka / Spark | No direct experience (Celery + Redis async pipeline instead) |
| CI/CD + TDD | Yes (GitHub Actions, Docker, pytest 1,024 suites, Vitest, JUnit 5) |
| SOLID / clean architecture | Yes (Clean Architecture across three repos) |
| Git | Yes |

## Application-Form Facts (must be answered by the candidate)

- Internship duration: 11 Jan - 30 Jun 2027.
- Gurgaon office, at least 2 days/week: willingness must be confirmed.
- Relocation from Jaunpur, UP: willingness must be confirmed.
- Full-time for 24 weeks: must be confirmed.
- University "No Objection Certificate": must be confirmed.
- In-person interview on 11 or 17 December 2026 (no remote option).

## Hiring Gaps (ranked by (Fit x Impact) / Effort)

| Rank | Gap | Fit | Impact | Effort | Score | Evidence / action |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | **Kotlin backend services** (Agoda's forward language, replacing Scala) | High | High | Low | 9/10 | LexoLegal KMP client, modflix, Webxela Spring Boot (both now on the resume). Lead the resume with Kotlin + JVM service work. |
| 2 | **Async pipeline correctness** (Kafka as async API, idempotency, no duplicates) | High | High | Low | 8/10 | LexoLegal Celery/Redis 12-hour sweep with atomic locks, two-stage dispatch/deliver ledger. Frame it as event-pipeline reasoning, not a cron job. |
| 3 | **Relational modelling + migrations** (PostgreSQL, MSSQL) | High | High | Low | 8/10 | LexoLegal 12 PostgreSQL tables, Alembic migrations, RFC 9457 errors, 1,024 pytest. |
| 4 | **LLM feature productionization** (explicitly in the intern JD) | High | High | Low | 7/10 | `doubtless` multimodal doubt-solver (Pydantic AI, SSE, React 19) and LexoLegal Munshi agent with MCP clients. |
| 5 | **React 19 + TypeScript client** (ReactJS is a named stack) | High | Medium | Low | 6/10 | `doubtless` React 19 + TypeScript + Vite workspace, 12 Vitest suites, SSE stream reader. |
| 6 | **CI/CD and test discipline** (dozens of releases/day, TeamCity) | High | Medium | Low | 6/10 | GitHub Actions mirror-sync pipeline (modflix), 1,024 pytest, 168 mobile unit tests, 107 + 92 repo test suites. |
| 7 | **Kafka / Spark / Cassandra / MSSQL / Hadoop** | None | Medium | High | 1/10 | No verified experience. Do not claim. Cover the transferable idea (async event delivery, idempotent consumers, SQL) only. |
| 8 | **Scala / C# / Java** | None | Low | High | 1/10 | No verified experience. Kotlin on the JVM is the adjacent credible claim. |

### 1-Weekend MVP Candidate (solves rank 2 on Agoda's own stack)

A Kafka-pattern event consumer in Kotlin: producer writes booking-lifecycle events, consumer applies them
to PostgreSQL idempotently under a dedup key, with a replay endpoint and a poison-message dead-letter queue.
Skips Kafka cluster ops by using Redpanda (Kafka wire protocol) in Docker and keeps the whole demo to one
`docker compose up`. Deliverable: public repo + 60s Loom showing duplicate delivery producing exactly one row.

### Positioning Decision

- Header title: `Software Engineer Intern` (bare canonical function + employment type).
- Emphasize, in order: Kotlin/JVM service work, PostgreSQL modelling, async idempotent pipelines, tested code,
  then the React/TypeScript client and LLM feature work.
- Never claim Scala, C#, Java, Kafka, Spark, Cassandra, MSSQL, Hadoop, TeamCity, or Puppet.
