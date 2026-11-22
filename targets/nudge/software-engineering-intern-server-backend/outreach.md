# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Nudge (iSocial Sports Private Limited)  
**Target Role:** Software Engineering Intern - Server (Backend)  
**Target Recipient:** Core Platform Engineering Leadership & Hiring Team  
**Recipient Email:** `support@justnudge.com`  
**Addressed Hiring Gap:** Asynchronous bill upload ingestion pipelines, Redis distributed locking, and idempotent coin ledger transactions  

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Scaling receipt ingestion and reward concurrency  
**Word Count:** 106 words (strictly <= 120 words; subject strictly <= 7 words)  

Hi Team,

I have been following Nudge's commerce rewards platform, particularly how your Core Platform team handles high-volume receipt uploads and real-time reward allocation.

At LexoLegal, I architected 38 asynchronous REST endpoints in FastAPI and PostgreSQL, and engineered a Celery and Redis sweep with an idempotent diffing engine guaranteeing zero duplicate alerts. At Webxela, I built Coupit, a scalable loyalty backend with Square POS webhook ingestion and server-side random reward allocation to eliminate double-crediting.

My open-source Celery/Redis async pipeline repository is public here: https://github.com/amanverma-765/doubtless

Worth 15 minutes to chat through concurrency trade-offs or the Server Intern role in Bangalore?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608  

---

## 2. Day 5 Follow-Up Draft

Hi Team,

Following up on backend microservices: I benchmarked an idempotent receipt ingestion pipeline using FastAPI, Celery, and Redis locks that processes concurrent uploads with zero double-crediting. Happy to share the repository and load tests if helpful.

Best,  
Aman  

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build an asynchronous bill ingestion and idempotent coin reward allocation microservice in FastAPI, Celery, Redis, and PostgreSQL with zero duplicate credits under concurrent load.
- **Scope:** Implements a multipart receipt image upload endpoint that returns an immediate HTTP 202 Accepted status with a tracking job ID, enqueues processing into Celery worker queues, acquires an atomic Redis distributed lock on the user ID and receipt hash to prevent double-submissions, and commits an idempotent ledger entry to PostgreSQL within an ACID transaction.
- **Stack:** Python 3.12, FastAPI, Celery, Redis, PostgreSQL (SQLAlchemy 2.0 + Alembic), Docker Compose, and Pytest.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Scaffold containerized FastAPI microservice with Docker Compose (PostgreSQL 16, Redis 7); configure SQLAlchemy 2.0 schemas for `users`, `receipt_uploads`, and `reward_ledger`.
  2. *Hours 3-4:* Implement asynchronous upload endpoint with file validation, SHA-256 receipt hashing, and Celery background task dispatch.
  3. *Hours 5-6:* Structure Celery worker task acquiring atomic Redis distributed lock (`SETNX` with 10s TTL); simulate OCR processing with mock vendor latency; persist idempotent transaction record in PostgreSQL.
  4. *Hours 7-8:* Write concurrent load tests in Pytest simulating 100 simultaneous double-tap upload requests to verify exactly-once credit delivery; record 60-second Loom demonstration; push to GitHub.
