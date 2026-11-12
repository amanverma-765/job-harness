# Vaani Research Labs: Application Portal & Form Submission Copy

**Target Portal:** [Vaani Research Labs Application Form](https://forms.gle/QywiywBo2Y1VZYd6A)  
**Target Role / Area of Work:** Systems Engineer / Backend Engineer (Vaani Developer Platform) / Vaani Voice Fellowship  
**Candidate Name:** Aman Verma  
**Candidate Email:** `akverma4aman@gmail.com`  
**Candidate Phone:** `+91 6386617608`  
**GitHub Profile:** `github.com/amanverma-765`  
**LinkedIn:** `linkedin.com/in/amanverma765`  

---

## Form Prompt: "Tell us who you are, what you're great at, and what excites you (Provide the meat)"

### 1. Who You Are (Brief Bio & Core Philosophy)
I am a Systems and Backend Engineer based in India (B.Tech CSE, 2027) focused on high-throughput asynchronous pipelines, low-latency data layers, and clean software craftsmanship in Python. I believe systems software should be empirically benchmarked, mathematically defensible, and built with zero tolerance for silent data loss or uncontrolled backpressure.

---

### 2. What You're Great At (The Meat: Verified Systems Engineering Ground Truth)

Here are three concrete engineering systems I have designed, benchmarked, and commit-pinned in Python:

#### A. Asynchronous Streaming Audio Ingestion & Slicing (`doubtless`)
- **Architecture:** Designed an asynchronous 4-stage media ingestion pipeline (PipelineRunner) in Celery and Redis that handles continuous live media streams.
- **Audio Processing:** Transcodes HLS streams, slices 16kHz mono audio (<15MB/hr), and feeds transcription workers in <10s via Groq Whisper-Large-V3.
- **Persistence & Telemetry:** Built thread-safe SQLite Write-Ahead Logging (WAL) repositories to maintain sub-millisecond query latencies under concurrent writes; instrumented distributed tracing via OpenTelemetry and Logfire across 151 unit and integration tests.
- **Repository:** `https://github.com/amanverma-765/doubtless` (commit `9f82d1c7429be19001153a81f3e7289f6d7ab431`)

#### B. Sub-10ms CPU Retrieval & Hybrid Indexing (`ncert-rag-evals`)
- **Zero-Framework Hybrid Indexing:** Built custom hybrid search from scratch combining SQLite FTS5 and ChromaDB embeddings on 4,429 section-aware chunks instead of relying on heavy framework wrappers.
- **Empirical Optimization:** Benchmarked Reciprocal Rank Fusion (RRF) on raw CPU, proving an 86.9% Recall at 5 in 8.9ms on CPU (matching LLM query expansion while cutting latency by 99.8%).
- **Statistical Significance:** Validated across 92 Pytest suites using paired McNemar statistical hypothesis testing (p = 0.0021).
- **Repository:** `https://github.com/amanverma-765/ncert-rag-evals` (commit `a7d1e24c0a861d7a9c3e1d9de648b8805abae264`)

#### C. Production Async Systems & Distributed Ingestion (LexoLegal)
- **Production Asynchronous APIs:** Architected 38 asynchronous REST endpoints in FastAPI and SQLAlchemy 2.0 across 12 PostgreSQL tables behind Nginx, containerized via Docker on Linux.
- **Atomic Concurrency Control:** Prevented worker race conditions across rapid webhook bursts using Celery workers with atomic Redis distributed locks and 10s countdown requeues.
- **High-Throughput Ingestion & Protocol Reverse-Engineering:** Reverse-engineered proprietary mobile APIs in Python with AES-128-CBC cryptography; built daily Celery and Selectolax ingestion sweeping case records across 25 High Courts and 743 District Courts into PostgreSQL.

---

### 3. What Excites You About Vaani AI Research

1. **Building Sovereign Speech Models from India:** Building foundational, multilingual speech-to-text and voice generation models from India for Indian linguistic diversity is one of the most critical technology missions of this decade.
2. **Solving the Hard Systems Latency Problem:** Real-time speech systems live and die by sub-second latency budgets. The engineering challenge of collecting audio from distributed recording stations, buffering against backpressure, writing to WAL without blocking ingestion, and streaming audio chunks into models is where real systems craftsmanship happens.
3. **High Ownership & Fast Iteration:** Vaani's engineering culture prioritizes production readiness, clear error boundaries, and systems pragmatism over theoretical prototypes. I want to build systems that scale reliably in production from day one.

---

### 4. Preferred Area of Work
- **Primary:** Systems Engineer / Backend Engineer (Vaani Developer Platform & Audio Infrastructure)
- **Program:** Vaani Voice Fellowship (6-month on-site in Bengaluru) / Full-Time Engineering
