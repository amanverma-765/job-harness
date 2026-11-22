# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Thales Group (Thales India Pvt. Ltd.)  
**Target Role:** Software Intern  
**Target Recipient:** Software Engineering Manager / Core Software & Systems Team, Thales Engineering Competence Centre (ECC), Bengaluru  
**Corporate Email Format:** `{first}.{last}@thalesgroup.com`  
**Addressed Hiring Gap:** Deterministic end-to-end test automation, distributed tracing, and fault-tolerant asynchronous data pipelines  

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Deterministic test automation and async pipelines  
**Word Count:** 95 words (strictly <= 120 words; subject strictly <= 7 words)  

Hi Team,

I was following engineering priorities at Thales's Bengaluru ECC, where scaling mission-critical avionics and civil systems requires deterministic test automation, fault-tolerant concurrency, and distributed observability.

In my project doubtless and during my internship at LexoLegal, I architected an asynchronous ingestion pipeline in Python, Celery, and Redis with atomic distributed locks, structuring thread-safe SQLite WAL repositories with OpenTelemetry tracing validated across 151 unit tests.

The asynchronous data pipeline and automated test harness are open-source here: https://github.com/amanverma-765/doubtless

Worth 15 minutes to chat through the trade-offs or the Software Internship at Thales?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608  

---

## 2. Day 5 Follow-Up Draft

Hi Team,

Following up on asynchronous worker reliability: I drafted an automated benchmark evaluating thread-safe SQLite WAL concurrent read-write throughput under burst loads, confirming zero lock contention across simulated worker nodes. Happy to send over the test report or repository if helpful.

Best,  
Aman  

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Construct a fault-tolerant asynchronous telemetry simulator and verification harness in Python, FastAPI, Celery, and Redis, demonstrating automated integration testing, distributed tracing, and zero message duplication.
- **Scope:** Ingests simulated system state and sensor events via an asynchronous REST API, enqueues tasks into Redis with atomic distributed locks, and diffs payload updates against a thread-safe SQLite WAL database. Includes an automated Pytest test suite asserting zero duplicate execution under simulated network packet bursts.
- **Stack:** Python 3.12, FastAPI, Celery, Redis, SQLite (WAL mode), OpenTelemetry, Pytest, Docker Compose.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Containerize FastAPI service and Redis queue; structure standardized event schemas with Pydantic validation.
  2. *Hours 3-5:* Implement Celery background worker tasks with atomic Redis distributed locks and 10s countdown requeues to guarantee idempotent state diffing.
  3. *Hours 6-7:* Instrument distributed tracing via OpenTelemetry; author 15+ automated Pytest suites verifying concurrency and zero duplicate alerts.
  4. *Hour 8:* Record 60-second architecture video walkthrough and document GitHub README.
- **Deliverables:** Public GitHub repository + automated concurrency test suite + 60-second video walkthrough.
