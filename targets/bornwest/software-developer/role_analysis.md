# Role Analysis: Software Developer - Bornwest

- **Target Requisition Title:** Software Developer
- **Original Portal Title:** Entry Level Software Developer (Job ID: 366216)
- **Company:** Bornwest (Born West Inc.)
- **Location:** India (Remote)
- **Match Score:** 92% (Exceptional Fit)
- **10.6x Multiplier Title:** `Software Developer`

---

## 4-Quadrant Extraction Matrix

### Quadrant I: Core Languages & Runtimes
- **Required / Desired:** Familiarity with at least one backend or frontend language (Ruby, Python, JavaScript, Java, etc.); Ruby on Rails (backend); JavaScript / React (frontend); SQL and relational databases.
- **Candidate Ground Truth:** Python 3.12+, Kotlin (JVM), Java (Spring Boot), SQL (PostgreSQL, SQLite), Bash (Linux). (Verified in `core/profile.yaml` and `core/projects_corpus.yaml`).

### Quadrant II: Infrastructure, Databases & Cloud
- **Required / Desired:** PostgreSQL, Redis / Sidekiq (background jobs), HTML5, CSS3, Tailwind CSS, Git & GitHub version control, Docker / containerization basics.
- **Candidate Ground Truth:** PostgreSQL, Redis (distributed locks, task queues, caching), SQLite (WAL, FTS5), Room database, Docker, Git, GitHub Actions CI/CD pipelines, Nginx. (Verified).

### Quadrant III: Architectural Patterns
- **Required / Desired:** Full-stack feature delivery from Day 1, REST APIs, asynchronous background job processing, responsive UI development, code reviews (giving and receiving), agile / sprint-based workflows, end-to-end debugging.
- **Candidate Ground Truth:** Asynchronous REST APIs in FastAPI / SQLAlchemy 2.0 / PostgreSQL, Celery + Redis background worker pipelines with non-blocking requeues and atomic distributed locks, Square POS OAuth 2.0 and webhook ingestion in Spring Boot, multi-module architecture, Clean Architecture, reactive Flow pipelines, RFC 9457 error handling. (Verified).

### Quadrant IV: Operational Scale & SLAs
- **Required / Desired:** 0-2 years of experience or fresh graduate; clean, readable, well-tested code; high ownership; quick learning on complex codebases; sub-second and low-latency API responses.
- **Candidate Ground Truth:** Sub-2s response latency on production conversational agents, 86.9% Recall@5 in 8.9ms on CPU (99.8% latency cut), 151 automated tests in `doubtless`, 92 unit tests in `ncert-rag-evals` with paired McNemar statistical significance testing (p = 0.0021), daily judicial scraping across 25 High Courts and 743 District Courts. (Verified).

---

## Ranked Hiring Gaps & Engineering Opportunities

| Rank | Gap / Engineering Opportunity | Fit | Impact | Effort | Priority Score `(Fit x Impact) / Effort` |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **Resilient Background Processing & Webhook Ingestion:** Structuring Sidekiq/Celery asynchronous job queues with atomic Redis distributed locks and exponential retry ceilings to handle bursty e-commerce and ERP webhooks without worker starvation. | 10 | 10 | 3 | **33.3** |
| 2 | **Standardized REST API Architecture & PostgreSQL Data Integrity:** Building clean RESTful services with strict schema validation (Pydantic/ActiveRecord), standardized RFC 9457 error contracts, and zero-downtime database migrations. | 10 | 9 | 3 | **30.0** |
| 3 | **High-Velocity Full-Stack Delivery with Test Rigor:** Shipping reliable end-to-end features backed by automated unit and integration tests (Pytest, JUnit 5, MockK), maintaining clean Git branching and peer code review standards. | 9 | 9 | 3 | **27.0** |
| 4 | **Robust External API Integrations & OAuth Ingestion:** Implementing secure OAuth 2.0 handshakes, webhook signature verification (HMAC-SHA256), and idempotent transaction handling for client third-party systems. | 9 | 9 | 3 | **27.0** |
| 5 | **Performance Optimization & Caching Layers:** Profiling database queries, indexing relational tables in PostgreSQL, and deploying Redis caching to maintain sub-100ms API response times during traffic spikes. | 9 | 8 | 3 | **24.0** |

---

## Qualification Gate Sign-off

- **Essential Qualifications Check:**
  1. Fresh graduate or 0-2 years experience: B.Tech CSE (2023-2027), intern at LexoLegal, freelance developer at Webxela. (QUALIFIED)
  2. B.Tech in CSE or related field: B.Tech in Computer Science & Engineering at VBS Purvanchal University. (QUALIFIED)
  3. Programming fundamentals (DSA, algorithms, complexity): Core CS coursework and proven implementation of diff algorithms, reciprocal rank fusion, and data structures. (QUALIFIED)
  4. Backend / Frontend language familiarity: Python, Kotlin, Java, SQL, Bash. (QUALIFIED)
  5. Web fundamentals (HTTP, APIs, databases): REST APIs, WebSockets, SSE, PostgreSQL, SQLite, Redis. (QUALIFIED)
  6. SQL & Relational Databases: PostgreSQL, SQLite, SQLAlchemy, Room. (QUALIFIED)
  7. Git version control: Git, GitHub, GitHub Actions CI/CD. (QUALIFIED)
  8. Problem-solving mindset & high ownership: Multiple independently designed systems and production internship deployments. (QUALIFIED)
- **Essential Skills Match:** 100% (8/8 essential criteria met).
- **Overall Match Score:** 92%.
- **Hard Qualification Gate:** PASSED (Proceed with resume tailoring).
