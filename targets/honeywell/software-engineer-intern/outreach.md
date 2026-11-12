# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Honeywell Aerospace  
**Target Role:** Software Engineer Intern  
**Target Recipient:** Software Engineering Manager / Core Avionics & Telemetry Hiring Team, Honeywell Aerospace Technologies (RMZ Ecoworld, Bangalore)  
**Corporate Email Format:** `first.last@honeywell.com`  
**Addressed Hiring Gap:** Asynchronous telemetry stream ingestion, worker backpressure, and idempotent queue processing  

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Resolving telemetry ingestion bottlenecks on worker nodes  
**Word Count:** 88 words (strictly <= 120 words; subject strictly <= 7 words)  

Hi Team,

I was reviewing systems challenges in connected aircraft telemetry ingestion where bursty sensor streams can saturate asynchronous worker queues and cause backpressure spikes.

At LexoLegal and in my project doubtless, I engineered an asynchronous 4-stage ingestion pipeline using Celery, Redis, and thread-safe SQLite WAL storage, using atomic distributed locks with non-blocking requeues to eliminate duplicate dispatches across 151 unit tests.

The async pipeline and telemetry patterns are open-source here: https://github.com/amanverma-765/doubtless

Worth 15 minutes to chat through the trade-offs or the Software Engineer Internship at Honeywell?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608  

---

## 2. Day 5 Follow-Up Draft

Hi Team,

Following up on asynchronous telemetry queuing: I put together a minimal Celery and Redis deduplication benchmark demonstrating zero message drops under bursty simulated sensor loads. Happy to share the repository or benchmark numbers if helpful.

Best,  
Aman  

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build a resilient, backpressure-tolerant telemetry stream ingestion pipeline in Python, Celery, and Redis with an idempotent deduplication ledger and automated Pytest verification.
- **Scope:** Ingests simulated aircraft sensor and flight state telemetry packets over an asynchronous HTTP API, enqueues packets into Redis task queues with atomic distributed locks, and diffs payload changes against a thread-safe SQLite WAL store with zero duplicate alerts. Skips proprietary aerospace protocols in favor of standardized JSON telemetry payloads.
- **Stack:** Python 3.12, FastAPI, Celery, Redis, SQLite WAL, OpenTelemetry, Pytest, Docker Compose.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Setup Docker environment with Redis and FastAPI service; define telemetry schema and ingestion API endpoints.
  2. *Hours 3-5:* Implement Celery worker tasks with atomic Redis distributed locks and 10s countdown requeues to guarantee idempotent state diffing.
  3. *Hours 6-7:* Instrument distributed tracing via OpenTelemetry; author 15+ Pytest unit tests asserting zero message loss under burst concurrency.
  4. *Hour 8:* Record 60-second Loom architectural walkthrough and document GitHub README.
- **Deliverables:** Public GitHub repository + automated concurrency test script + 60-second video walkthrough.
