# Cold Outreach & 1-Weekend MVP Package

- **Target Company:** Amazon Development Center India (ADCI - Karnataka)
- **Target Role:** Software Development Engineer Intern
- **Target Recipient:** Software Development Manager / Engineering Leader, ADCI Bengaluru
- **Addressed Hiring Gap:** Idempotent asynchronous task processing and distributed lock safety under high retry volumes

---

## 1. Peer-to-Peer Outreach Draft

**Subject:** Safe retries and idempotency in worker queues  
**Word Count:** 96 words (strictly <= 120 words)

Hi Team,

Saw the Amazon Builders' Library focus on idempotent APIs for safe retries under network partitions. In distributed worker pools, high-frequency client retries often cause worker race conditions and duplicate downstream writes.

At LexoLegal, I designed an idempotent asynchronous event sweep using Redis distributed locks and Celery countdown requeues (90-retry ceiling), eliminating duplicate execution across 1,024 test suites. I also published an empirical retrieval benchmark (ncert-rag-evals) cutting CPU latency by 99.8% to 8.9ms.

The pipeline architecture and test benches are public on GitHub: https://github.com/amanverma-765

Worth 15 minutes to chat through distributed reliability trade-offs?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608

---

## 2. Day 5 Follow-Up Draft

Hi Team,

Following up with a quick note: I packaged a minimal distributed idempotency middleware in FastAPI, Redis, and Celery simulating network retries with atomic distributed locks. Happy to share the repository and benchmarks if relevant to your team's queue architectures.

Best,  
Aman

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build an idempotent asynchronous event worker pipeline demonstrating the Amazon Builders' Library pattern for safe retries under network delays.
- **Scope:** Receives incoming asynchronous event payloads, verifies unique client idempotency tokens, acquires atomic distributed locks in Redis with automated TTL expiration, and routes idempotent processing to Celery workers. Automatically deduplicates late-arriving requests and surfaces retry metrics via structured health endpoints.
- **Stack:** Python 3.12, FastAPI, Celery, Redis, PostgreSQL, Docker Compose, Pytest.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Implement FastAPI event ingestion endpoints with client idempotency token parsing and RFC 9457 error contracts.
  2. *Hours 3-4:* Build atomic Redis distributed locking middleware with 10s non-blocking requeue countdowns and exponential backoff retry ceilings.
  3. *Hours 5-6:* Structure Celery background worker pipelines with PostgreSQL state tracking and idempotent diffing to eliminate duplicate side effects.
  4. *Hours 7-8:* Containerize the full service mesh via Docker Compose and write an automated concurrent burst test suite in Pytest simulating 100 duplicate requests.
- **Deliverables:** Public GitHub repository with 100% test pass rate, one-command Docker Compose local testbed, and a 60-second Loom video demonstrating zero duplicate transactions under simulated network retries.
