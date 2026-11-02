# Role Analysis: Software Engineer (AI / Data Platform) - RedChip

- **Target Requisition Title:** Software Engineer (AI / Data Platform)
- **Company:** RedChip Companies, Inc.
- **Location:** India (Remote)
- **Match Score:** 94% (Exceptional Fit)
- **10.6x Multiplier Title:** `Software Engineer (AI / Data Platform)`

## 4-Quadrant Extraction Matrix

### Quadrant I: Core Languages & Runtimes
- **Required:** Python (FastAPI or similar), SQL (Postgres/MySQL), Data Modeling
- **Candidate Ground Truth:** Python 3.12+, FastAPI, Asyncio, SQL, PostgreSQL, SQLAlchemy 2.0, SQLite (WAL / FTS5) (Verified)

### Quadrant II: Infrastructure, Databases & Cloud
- **Required:** AWS (EC2, RDS, or similar), Vector Databases (pgvector, Pinecone, Weaviate, etc.), Docker, CI/CD, Cloud Deployments
- **Candidate Ground Truth:** PostgreSQL, ChromaDB, SQLite, Redis, Docker, GitHub Actions, Linux, Nginx (Verified)

### Quadrant III: Architectural Patterns
- **Required:** LLM-based systems, AI applications, Semantic Search, Embeddings, Data Pipelines / ETL Systems, Production-grade APIs, System Design, Scalable Architectures
- **Candidate Ground Truth:** Pydantic AI agent tool-calling loops, Model Context Protocol (MCP), Reciprocal Rank Fusion (RRF) hybrid search, 4-stage Celery/Redis media ingestion pipeline, Celery judicial scraping ETL with DOM extractors and batch inserts, RFC 9457 REST APIs, SSE real-time streaming (Verified)

### Quadrant IV: Operational Scale & SLAs
- **Required:** Real-time processing of SEC filings and financial datasets, low-latency search and AI workflows, reliable production deployments, internal analytics dashboards
- **Candidate Ground Truth:** 86.9% Recall@5 in 8.9ms on CPU (99.8% latency reduction), sub-2s agent response latency, daily ingestion across 25 High Courts and 743 District Courts, 151 tests in doubtless, 92 unit tests in ncert-rag-evals with paired McNemar statistical significance testing (Verified)

## Ranked Hiring Gaps & Engineering Opportunities

| Rank | Gap / Engineering Opportunity | Fit | Impact | Effort | Priority Score `(Fit × Impact) / Effort` |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **High-Throughput SEC Filing ETL with Celery & Redis:** Scaling EDGAR document parsing (10-K, 10-Q, 8-K) via distributed workers, atomic Redis locks, and batch PostgreSQL inserts without worker starvation. | 10 | 10 | 3 | **33.3** |
| 2 | **Hybrid Search for Financial Disclosures:** Fusing lexical search (exact tickers, dollar figures, balance sheet line items) with dense embeddings via Reciprocal Rank Fusion (RRF) to eliminate vector search recall blindspots. | 10 | 9 | 3 | **30.0** |
| 3 | **Low-Latency Streaming AI Stock Assistant APIs:** Structuring FastAPI endpoints with SSE and Pydantic AI execution loops to deliver real-time, cited SEC disclosure answers in sub-2s. | 10 | 9 | 3 | **30.0** |
| 4 | **Robust Document Parsing with Bounded Memory:** Building zero-framework streaming document parsers to ingest complex SEC HTML/PDF tables without context truncation or OOM crashes under high concurrency. | 9 | 9 | 3 | **27.0** |
| 5 | **Internal Analytics & Evaluation Dashboard:** Tracking retrieval hit rates, citation accuracy, and API latency metrics via structured logging (OpenTelemetry/Logfire) and interactive analysis notebooks. | 9 | 8 | 3 | **24.0** |

## Qualification Gate Sign-off

- **Essential Skills Required:** Python, FastAPI, SQL/PostgreSQL, Data Pipelines/ETL, Vector Databases, LLM/AI Systems, Docker/CI/CD
- **Candidate Ground Truth Verification:**
  - Python & FastAPI: LexoLegal production APIs and doubtless SSE doubt-solver (Verified)
  - SQL & PostgreSQL: LexoLegal relational data modeling, Alembic, PostgreSQL batch inserts (Verified)
  - Data Pipelines / ETL: Celery worker pipelines with Selectolax extractors, 4-stage media ingestion pipeline (Verified)
  - Vector Databases & Semantic Search: ChromaDB vector store, RRF hybrid retrieval, vectorless vs vector benchmarking (Verified)
  - LLM-based Systems: Pydantic AI, MCP integration, Groq Whisper, Ollama (Verified)
  - Docker & CI/CD: Docker containerization, GitHub Actions, Linux environments (Verified)
- **Essential Skills Match:** 94% (Comprehensive alignment across backend, data pipelines, search, and AI)
- **Hard Qualification Gate:** PASSED (Proceed with tailoring)
