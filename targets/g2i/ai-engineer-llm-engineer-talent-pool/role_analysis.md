# Role Analysis: AI Engineer / LLM Engineer - Talent Pool (G2i)

**Target Requisition Title:** AI Engineer / LLM Engineer - Talent Pool  
**Company:** G2i Inc.  
**Location:** Remote  
**Match Score:** 95% (Exceptional Fit)  
**10.6x Multiplier Title:** `AI Engineer / LLM Engineer - Talent Pool`

---

## 4-Quadrant Extraction Matrix

### Quadrant I: Core Languages & Runtimes
- **Required:** Python, SQL, modern backend/data runtimes (experienced or fresh graduates welcome)
- **Candidate Ground Truth:** Python, Kotlin, SQL, Bash (Verified)

### Quadrant II: Infrastructure, Databases & Cloud
- **Required:** Docker, Redis, PostgreSQL, SQLite, vector stores, API integrations, Linux
- **Candidate Ground Truth:** Docker, Redis, PostgreSQL, SQLite FTS5, ChromaDB, Nginx, Linux, Git/GitHub (Verified)

### Quadrant III: Architectural Patterns
- **Required:** AI evals, RL environments, training data for frontier models, agentic workflows, LLM tool-calling, benchmarking
- **Candidate Ground Truth:** Empirical RAG evaluation benchmarks (`ncert-rag-evals`), generative LLM page indexing vs vector search (`vectorless-rag`), agentic tool loops and MCP integrations in Pydantic AI (`LexoLegal`, `doubtless`) (Verified)

### Quadrant IV: Operational Scale & SLAs
- **Required:** Reproducible benchmarks, statistical significance testing, sub-second latency, deterministic test harnesses
- **Candidate Ground Truth:** 86.9% Recall@5 in 8.9ms on CPU (99.8% latency reduction), paired McNemar tests (p = 0.0021) across 92 unit tests in Pytest, 151 tests in doubtless (Verified)

---

## Ranked Hiring Gaps & Alignment Areas

| Rank | Gap / Project Focus | Fit | Impact | Effort | Priority Score `(Fit × Impact) / Effort` |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **Rigorous AI Evaluation Harnesses (Evals):** Creating deterministic, reproducible benchmark testbeds with paired statistical significance testing (McNemar tests, p = 0.0021) and Recall@K metrics on CPU. | 10 | 10 | 3 | **33.3** |
| 2 | **Agentic Tool Calling & Sandboxed Execution:** Generating clean, multi-turn tool calling trajectories with Pydantic AI and MCP, isolating dependencies to prevent prompt injection and state leakage. | 10 | 9 | 3 | **30.0** |
| 3 | **Frontier Model Training Data & Synthetic Datasets:** Building high-precision document extraction and chunking pipelines (PyMuPDF, ChromaDB) with 100% retrieval hit rate and 0.85 citation precision. | 9 | 9 | 3 | **27.0** |
| 4 | **Distributed Ingestion & Real-Time Streaming:** Transcoding and processing multi-stage media streams (Celery, Redis, Whisper) with distributed tracing (OpenTelemetry, Logfire). | 9 | 8 | 3 | **24.0** |

---

## Qualification Gate Sign-off
- **Essential Skills Required:** Python, AI/ML concepts, LLM/evaluation workflows, test automation, Git/GitHub
- **Candidate Ground Truth Verification:**
  - Python & Kotlin: Core programming languages across production backend services and data pipelines (Verified)
  - AI Evals & Benchmarks: `ncert-rag-evals` (92 Pytest test cases, McNemar tests, 8 retrieval strategies) and `vectorless-rag` (retrieval hit rate, citation precision, token cost) (Verified)
  - Agentic AI & Tool-Use: `LexoLegal` (FastAPI, Pydantic AI, MCP clients, Celery/Redis locks) and `doubtless` (FastAPI SSE, Groq Whisper, OpenTelemetry) (Verified)
  - Backend & Databases: PostgreSQL, SQLite WAL, ChromaDB, Redis, Docker (Verified)
- **Essential Skills Match:** 100% (No missing non-negotiables)
- **Hard Qualification Gate:** PASSED (Proceed with tailoring)
