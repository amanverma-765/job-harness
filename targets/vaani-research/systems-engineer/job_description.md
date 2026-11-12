# Vaani Research Labs: Systems Engineer (Speech Infrastructure & Ingestion)

**Company:** Vaani Research Labs / Vaani AI Research  
**Location:** Bengaluru, Karnataka, India (On-site / Fellowship Track)  
**Target Role:** Systems Engineer / Backend Engineer (Vaani Developer Platform & Audio Infrastructure)  
**Portal URL:** `https://vaaniresearch.com/team.html#careers`  
**Application Form:** `https://forms.gle/QywiywBo2Y1VZYd6A`  
**Founder Contact:** Nitesh Tripathi (`nitesh@vaaniresearch.com`)  

---

## Role Overview & Engineering Mission

Join the engineering team at Vaani Research Labs building intelligent speech systems and voice AI models across the full stack. We are looking for exceptional engineers who want to build foundational speech infrastructure from India, for the world.

Whether applying for the full-time Systems Engineer role or the intensive 6-month Vaani Voice Fellowship in Bengaluru, candidates work directly on the core streaming ingestion, model serving, and distributed storage systems powering real-time multilingual voice AI.

---

## Core Technical Responsibilities

1. **Distributed Streaming Ingestion:**
   - Design and scale distributed data ingestion services collecting live audio packets, streaming chunks, and metadata from thousands of client endpoints and recording stations.
   - Implement rock-solid buffer management, backpressure propagation, and concurrency controls to prevent data loss or server exhaustion during traffic spikes.

2. **Storage & Persistence Architecture:**
   - Build dual-tier storage pipelines combining low-latency write-ahead logging (WAL) on local disks with efficient compressed archiving (e.g. Parquet, SQLite, object storage).
   - Ensure atomic recovery, zero packet loss, and sub-millisecond segment indexing for downstream model training and evaluation.

3. **Concurrency & Real-Time Audio Slicing:**
   - Optimize asynchronous worker pipelines in Python (asyncio, Celery, Redis) and low-level runtimes for audio transcoding, slicing, and feature extraction.
   - Maintain strict latency budgets across ingestion, transcription, and real-time streaming interfaces (SSE, WebSockets).

4. **Production Engineering & Observability:**
   - Package all services in Docker containers with comprehensive automated test suites (unit tests, load benchmarks, integration tests).
   - Instrument end-to-end distributed tracing and metric telemetry across all worker queues and network boundaries.

---

## Take-Home Assignment Challenge Specification

Vaani evaluates candidates through an open-ended, production-grade systems engineering problem rather than abstract LeetCode puzzles.

- **Core Challenge:** Design and build a high-throughput, fault-tolerant data ingestion and archiving system from distributed streaming sources/stations.
- **Evaluation Criteria:**
  1. *Streaming & Ingestion Architecture:* Concurrency, backpressure handling, buffer management, socket polling.
  2. *Storage & Persistence Trade-offs:* Efficient retrieval, indexing, write-ahead logging (WAL), disk persistence under load.
  3. *Production Readiness:* Clean modular code, error boundaries, automated test suite, Docker Compose setup, and clear documentation of architectural decisions.
- **Execution Window:** 48 to 72 hours, followed by an in-depth architecture defense and code review session with engineering leads.
