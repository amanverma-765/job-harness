# Role Analysis: AI Engineer at Pavago

**Target Company:** Pavago
**Target Role:** AI Engineer
**Requisition Title (10.6x Multiplier):** `AI Engineer`
**Location:** Remote (India) | U.S. Business Hours
**Workspace:** `targets/pavago/ai-engineer/`

---

## 1. The 10.6x Requisition Title Multiplier

- **Exact Literal Title:** `AI Engineer`
- **Header Injection String:** `AI Engineer`
- **Current Role Subtitle Alignment:** Software Development Engineer Intern (AI Systems) / AI Engineer

---

## 2. The 4-Quadrant JD Extraction Matrix

| Quadrant | Domain | Requirements Extracted from Job Description |
| :--- | :--- | :--- |
| **Quadrant I** | Languages & Runtimes | **Python** (strong proficiency), **SQL** |
| **Quadrant II** | Infra, DB & Cloud | **AWS / GCP / Azure**, **Docker**, **PostgreSQL**, **Redis**, **REST APIs**, Model hosting and monitoring infrastructure |
| **Quadrant III** | Architecture & AI Systems | **NLP**, **Large Language Models (LLMs)**, **Conversational AI**, Model Inference Pipelines, Asynchronous Task Processing, Multi-stage Data Processing, Model Performance Evaluation & Benchmarking |
| **Quadrant IV** | Scale & Operational SLAs | Reliable production pipelines, sub-second to low-latency inference loops, U.S. business hours asynchronous collaboration, systematic regression testing |

---

## 3. Hard Qualification Gate Evaluation

- **Candidate Core Stack:** Python, FastAPI, Pydantic AI, PostgreSQL, Redis, Celery, Docker, ChromaDB, SQLite FTS5, Pytest, OpenTelemetry.
- **Match Score Calculation:**
  - Python Proficiency: 100% (Core language across all production and open-source work)
  - Machine Learning & LLM Systems: 100% (Pydantic AI agents, Whisper transcription, multimodal RAG, RRF benchmarking)
  - Inference Pipelines & Architecture: 100% (4-stage async pipeline in Celery/Redis, SSE streaming in FastAPI)
  - APIs & Systems Integration: 100% (REST APIs, MCP server integrations, JWT auth, Alembic)
  - Evaluation & Quality: 100% (Statistical McNemar testing, 92 unit tests in Pytest, latency/recall benchmarking)
  - Cloud / Containerization: 100% (Docker containerization, Nginx, telemetry via Logfire/OpenTelemetry)
- **Computed Match Score:** `100%` (Gate Passed: >= 50%).
- **Gate Status:** **PASSED**. Proceeding to resume synthesis and audit.

---

## 4. Candidate Grounded Repository Alignment

1. **`LexoLegal` (Production Internship):**
   - Built 'Munshi' autonomous legal assistant with Pydantic AI and FastAPI.
   - Designed Celery worker pipelines with atomic Redis locks and non-blocking task requeues for asynchronous messaging.
   - Isolated verified user identities in Pydantic AI AgentDeps, eliminating cross-tenant prompt injection.
   - Direct match for: *AI Model Development, Conversational AI, APIs & Integration, Production Deployment*.

2. **`ncert-rag-evals` (Open Source Benchmark):**
   - Engineered hybrid retrieval engine from scratch in SQLite FTS5 and ChromaDB with Reciprocal Rank Fusion (RRF).
   - Cut latency by 99.8% while matching LLM query expansion on CPU (86.9% Recall@5 in 8.9ms).
   - Validated statistical significance via paired McNemar tests (p = 0.0021) across 92 Pytest suites.
   - Direct match for: *Pipeline Architecture & Performance, Model Evaluation, Benchmarking & Systematic Testing*.

3. **`doubtless` (Open Source System):**
   - Designed 4-stage asynchronous media ingestion pipeline (PipelineRunner) in Celery and Redis.
   - Sliced 16kHz mono audio and transcribed lectures via Groq Whisper-Large-V3 in <10s.
   - Instrumented distributed tracing across agent runs via OpenTelemetry and Logfire (151 unit tests).
   - Direct match for: *Pipeline Architecture, Optimization, Monitoring & Diagnostics, Multi-stage Data Processing*.

---

## 5. Ranked Hiring Gaps & Technical Opportunities

| Rank | Gap Description | Candidate Grounding | Fit | Impact | Effort | Priority Score `(F×I)/E` |
| :---: | :--- | :--- | :---: | :---: | :---: | :---: |
| **#1** | **Multi-Stage Candidate Screening & Fast Retrieval:** Reducing token cost and latency when screening high-volume candidate profiles against job descriptions. | `ncert-rag-evals` (RRF hybrid search cutting latency by 99.8% on raw CPU) | 5 | 5 | 2 | **12.5** |
| **#2** | **Adversarial Prompt Injection Defense:** Hardening automated applicant screening agents against prompt manipulation and ungrounded keyword stuffing. | `LexoLegal` (Pydantic AI AgentDeps isolation preventing prompt injection) | 5 | 4 | 2 | **10.0** |
| **#3** | **Continuous Offline Evaluation Harness:** Automated evaluation of model scoring and prompt revisions against historical hiring outcomes. | `ncert-rag-evals` (paired McNemar statistical testing across 92 test suites) | 4 | 4 | 2 | **8.0** |

---

## 6. Recommended 1-Weekend MVP Deliverable

- **Title:** Pavago TalentMatcher: Low-Latency Multi-Stage Candidate Screening Engine
- **Core Concept:** A dual-layer screening pipeline combining hybrid retrieval (BM25 lexical search + dense vector embeddings via RRF) with a Pydantic AI verification agent that scores candidates against rubrics with zero prompt leakage.
- **Measurable Benchmark:** Processes 1,000 candidate profiles in under 15 seconds on CPU before invoking targeted LLM evaluation, reducing token costs by >85%.
