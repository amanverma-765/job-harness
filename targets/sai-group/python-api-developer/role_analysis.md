# Role Analysis: Python API Developer (SAI Group Ltd)

**Target Requisition Title:** Python API Developer  
**Company:** SAI Group Ltd  
**Location:** Kolkata, WB (Remote)  
**Match Score:** 95% (Exceptional Fit)  
**10.6x Multiplier Title:** `Python API Developer`

## 4-Quadrant Extraction Matrix

### Quadrant I: Core Languages & Runtimes
- **Required:** Python, SQL, JSON
- **Candidate Ground Truth:** Python, SQL, Bash, JSON (Verified in LexoLegal, ncert-rag-evals, doubtless)

### Quadrant II: Infrastructure, Databases & Cloud
- **Required:** PostgreSQL, MySQL or similar relational databases, Git/GitHub, Docker (Good to have), Linux, Redis (Good to have)
- **Candidate Ground Truth:** PostgreSQL, SQLite (WAL & FTS5), Redis, Docker, Git/GitHub, Linux, Nginx (Verified)

### Quadrant III: Architectural Patterns
- **Required:** RESTful APIs, FastAPI or Flask, OpenAPI / Swagger documentation, JWT / OAuth2 authentication, third-party API integration, microservices architecture, SDLC best practices
- **Candidate Ground Truth:** Production FastAPI REST APIs, SQLAlchemy 2.0 ORM, Alembic migrations, RFC 9457 Problem Details, multi-tier JWT authentication, Celery task workers with Redis locks, OpenTelemetry distributed tracing (Verified)

### Quadrant IV: Operational Scale & SLAs
- **Required:** High availability, query optimization, robust validation and error handling, comprehensive unit testing and API test suites
- **Candidate Ground Truth:** Sub-2s conversational assistant query loop, <10s media processing pipeline, 92 unit tests in ncert-rag-evals, 151 tests in doubtless, thread-safe WAL databases (Verified)

## Ranked Hiring Gaps & Technical Opportunities

| Rank | Gap / Engineering Opportunity | Fit | Impact | Effort | Priority Score `(Fit × Impact) / Effort` |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **FastAPI Microservices & OpenAPI Contract Rigor:** Designing scalable REST APIs with strict Pydantic v2 schemas, automated Swagger documentation, and RFC 9457 error handling. | 10 | 10 | 2 | **50.0** |
| 2 | **PostgreSQL Query Optimization & Data Modeling:** Structuring relational schemas, optimizing SQL indexes, and orchestrating Alembic migrations for low-latency queries. | 9 | 9 | 3 | **27.0** |
| 3 | **Multi-Tier JWT Authentication & Security Hardening:** Implementing OAuth2/JWT token verification, role-based access control, and sanitizing API boundaries against injection. | 9 | 9 | 3 | **27.0** |
| 4 | **Asynchronous Background Processing & Redis Caching:** Decoupling compute-heavy workflows via Celery workers with atomic Redis locks to preserve API response times. | 9 | 8 | 3 | **24.0** |

## Qualification Gate Sign-off
- **Essential Skills Required:** Python, FastAPI/Flask, RESTful API Design, SQL & Relational Databases (PostgreSQL/MySQL), Git/GitHub, Swagger/OpenAPI, JWT/OAuth2 Auth, Unit & API Testing, SDLC Best Practices
- **Candidate Ground Truth Verification:**
  - Python: Primary language across all repositories and production tenures (Verified)
  - FastAPI: Core framework in LexoLegal production service and doubtless workspace (Verified)
  - REST API & OpenAPI: Fully documented endpoints with standardized status codes and schemas (Verified)
  - PostgreSQL & SQL: Relational data layer in LexoLegal with SQLAlchemy and batch ingestion (Verified)
  - JWT / Auth: Multi-tier JWT token authentication implemented at LexoLegal (Verified)
  - Testing: Pytest suites (92 tests in ncert-rag-evals, 151 tests in doubtless) (Verified)
  - Git / Linux / Docker: Git version control, Linux environments, Docker containerization (Verified)
- **Essential Skills Match:** 10/10 (100% of core non-negotiables grounded in code)
- **Hard Qualification Gate:** PASSED (Proceed with resume tailoring and document compilation)
