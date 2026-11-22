# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Coy (Fiquity Technology Private Limited)  
**Target Role:** Software Engineer Intern  
**Target Recipient:** Sourabh Girdhar, Co-Founder & CTO / Core Technology Team  
**Corporate Email Format:** `sourabh@fiquity.com` / `contact@getcoy.com`  
**Addressed Hiring Gap:** Privacy-preserving double-blind contact matching, anti-enumeration defenses, and idempotent WhatsApp/SMS notification pipelines  

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Hardening double-blind contact matching against enumeration  
**Word Count:** 97 words (strictly <= 120 words; subject strictly <= 7 words)  

Hi Sourabh,

I was looking at Coy's double-blind matching architecture at getcoy.com, where unrequited interest must remain strictly anonymous while preventing phone number enumeration and duplicate WhatsApp alerts under worker retries.

At LexoLegal and Webxela, I built an automated Celery and Redis pipeline with atomic distributed locks and a two-stage notification ledger guaranteeing zero duplicate dispatches, alongside an autonomous WhatsApp assistant with sub-2s response latency.

The asynchronous worker and deduplication patterns are open-source here: https://github.com/amanverma-765/doubtless

Worth 15 minutes to chat through the trade-offs or the Software Engineer Internship at Coy?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608  

---

## 2. Day 5 Follow-Up Draft

Hi Sourabh,

Following up on double-blind matching: I put together a minimal benchmark simulating keyed HMAC-SHA256 phone matching with constant-time lookup and rate limiting. Happy to share the repository if helpful.

Best,  
Aman  

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build a privacy-preserving double-blind contact matching and WhatsApp alert engine with keyed HMAC-SHA256 hashing, anti-enumeration rate limiting, and an idempotent multi-channel notification ledger.
- **Scope:** Ingests hashed contact tokens (phone/email), executes constant-time reciprocal match checks, records mutual matches in PostgreSQL, and dispatches simulated WhatsApp alerts via Celery task queues with atomic Redis distributed locks (max 3 alerts with opt-out state). Skips full payment UI in favor of mock Razorpay webhook events.
- **Stack:** Python 3.12, FastAPI, Celery, Redis, PostgreSQL, Docker Compose, Pytest.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Configure Docker Compose environment with Redis, PostgreSQL, and FastAPI; define contact hashing schema and anti-enumeration rate limit middleware.
  2. *Hours 3-5:* Implement Celery worker tasks with atomic Redis distributed locks and a two-stage notification ledger (dispatch deduplication + delivery channel record) to ensure zero duplicate alerts.
  3. *Hours 6-7:* Build mock Razorpay webhook handler with cryptographic signature verification and idempotent slot crediting.
  4. *Hour 8:* Package automated Pytest test suite, record 60-second Loom walkthrough, and deploy demo on Render/Railway.
