# Cold Outreach & 1-Weekend MVP Package

- **Target Company:** Bornwest (Born West Inc.)
- **Target Role:** Software Developer
- **Target Recipient:** Engineering Team / Technical Leadership (`careers@bornwest.com`)
- **Addressed Hiring Gap:** Resilient background task processing and webhook ingestion for enterprise client platforms
- **Policy Compliance Notice:** Per Bornwest's official hiring policy, direct outreach to employees for referrals bypasses the official process and causes disqualification. This communication package is strictly intended for post-application technical dialogue and architectural follow-up, never for referral solicitation.

---

## 1. Peer-to-Peer Outreach Draft

**Subject:** Scaling background task queues with Redis  
**Word Count:** 113 words (strictly <= 120 words)

Hi Team,

I noticed Bornwest's work engineering client platforms like Social Imprints' NetSuite sync and L'Oreal's connected device APIs, where bursty webhooks and asynchronous background jobs are mission-critical.

During my software engineering internship at LexoLegal, I designed background worker pipelines in Celery and Redis with atomic distributed locks and 10s countdown requeues, eliminating race conditions and dropped tasks from rapid webhook events. In doubtless, I built an asynchronous 4-stage ingestion pipeline transcoding streams and transcribing audio in under 10 seconds across 151 automated tests.

The pipeline architecture and test suites are public here: https://github.com/amanverma-765/doubtless

Open to exchanging notes on background queue resilience and webhook ingestion architectures?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608

---

## 2. Day 5 Follow-Up Draft

Hi Team,

Following up with a quick note: I packaged a minimal asynchronous webhook processor in FastAPI, Redis, and Celery featuring idempotent task deduplication and exponential backoff retry ceilings. Happy to share the code if helpful for client integration pipelines.

Best,  
Aman

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build an idempotent asynchronous webhook ingestion gateway and background worker queue for enterprise SaaS event synchronization.
- **Scope:** Receives incoming e-commerce and ERP webhooks (e.g., NetSuite/Shopify/Stripe formats), verifies HMAC-SHA256 signatures, deduplicates payloads via Redis idempotency keys, and dispatches processing jobs to worker queues with automatic exponential backoff retry logic (up to 5 attempts). Exposes health and queue latency metrics via Prometheus-compatible endpoints.
- **Stack:** Python 3.12, FastAPI, Celery, Redis, PostgreSQL, Docker, Pytest.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Implement FastAPI webhook ingestion receiver with HMAC signature verification and RFC 9457 structured error responses.
  2. *Hours 3-4:* Build atomic Redis deduplication middleware caching event IDs for 24 hours to prevent duplicate transaction execution.
  3. *Hours 5-6:* Configure Celery worker pool with dead-letter queue routing, exponential retry ceilings, and PostgreSQL batch state persistence.
  4. *Hours 7-8:* Containerize via Docker Compose and write automated end-to-end integration test suite in Pytest simulating webhook burst floods.
- **Deliverables:** Public GitHub repository + Containerized local demo + 60s Loom walkthrough demonstrating zero dropped tasks under simulated 100 concurrent webhook bursts.
