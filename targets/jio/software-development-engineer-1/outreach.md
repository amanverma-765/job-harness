# Outreach Package: Software Development Engineer I (Jio - IT & Systems)

## 1. Peer-to-Peer Cold Outreach

**To:** Engineering Hiring Team / Technology Lead (IT & Systems, Jio Platforms Limited)  
**Subject:** Optimizing backend services and SQL queries  

Hi Team,

Noticed Jio's IT & Systems team is expanding core software engineering for high-throughput enterprise platforms.

At LexoLegal, I architected async REST APIs in FastAPI, SQLAlchemy, and PostgreSQL behind Nginx, containerized with Docker and Git CI/CD. To prevent race conditions during rapid message bursts, I deployed Celery workers with atomic Redis distributed locks and 10s countdown requeues (github.com/amanverma-765/doubtless).

I also benchmarked hybrid retrieval in SQLite FTS5, cutting CPU query latency by 99.8% across 92 unit tests in Pytest (github.com/amanverma-765/ncert-rag-evals).

Worth 15 minutes to discuss backend architecture and query optimization tradeoffs?

Best,  
Aman Verma  
github.com/amanverma-765  
linkedin.com/in/amanverma765  

---

## 2. Day 5 Follow-Up Email

**Subject:** Re: Optimizing backend services and SQL queries  

Hi Team,

Following up on my note below; I recently benchmarked document parsing and memory-bounded extraction (<200MB) against local testbeds, cutting retrieval latency by 40%.

Glad to share the benchmark repo or discuss how this approach translates to your internal IT platforms.

Best,  
Aman Verma  

---

## 3. 1-Weekend MVP Demo Specification

**Title:** High-Concurrency Task Execution Service with PostgreSQL and Redis Locks  
**Primary Gap Addressed:** Resilient REST API backend service executing relational queries and asynchronous task offloading with strict schema validation and thread-safe distributed locks.

### Scope
Build a containerized Python backend service in FastAPI and SQLAlchemy 2.0 exposing secure, rate-limited RESTful endpoints for concurrent data operations. The service validates incoming payloads with Pydantic schemas, manages relational transactions in PostgreSQL, returns structured error responses, and offloads heavy background processing to Celery workers governed by atomic Redis distributed locks. Front-end UI is skipped in favor of automated OpenAPI documentation and comprehensive Pytest test suites.

### Tech Stack
- **Languages & Frameworks:** Python 3.12, FastAPI, Pydantic, SQLAlchemy 2.0, Alembic
- **Databases & Cache:** PostgreSQL, Redis (atomic locks & caching), SQLite
- **Asynchronous Queue:** Celery with Redis broker
- **Testing & Tooling:** Docker Compose, Linux, Git, Pytest, OpenTelemetry

### Deliverables
1. Public GitHub repository with reproducible `docker-compose.yml` and automated Alembic database migrations.
2. Fully interactive OpenAPI documentation at `/docs` with standardized error schemas.
3. Automated test suite with >= 20 unit and integration tests passing in Pytest.
4. 60-second video walkthrough demonstrating concurrent query handling and atomic lock execution.
