# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Kulfi (WooshAuto Internet Private Limited)  
**Target Role:** Software Engineer I - Backend  
**Target Recipient:** Aadhar Chandiwala, Co-Founder & CTO  
**Recipient Email:** `aadhar@kulfi.club` / `founders@kulfi.club`  
**Addressed Hiring Gap:** Peak bedtime (9 PM - 12 AM) real-time WebSocket state synchronization, Redis Pub/Sub session clustering, and asynchronous game state pipelines  
**Strict Communication Policy Note:** Compliance guaranteed. This outreach package is prepared strictly for professional email communication and official application channels. Zero phone calls or WhatsApp messages are initiated, adhering strictly to Kulfi's hiring policy.  

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Scaling bedtime WebSocket sync for paired games  
**Word Count:** 107 words (strictly <= 120 words; subject strictly <= 7 words)  

Hi Aadhar,

I have been following Kulfi's growth across nearly one million couples, particularly how eighty percent of gameplay compresses into the 9 PM to midnight bedtime window across concurrent paired mobile sessions.

At LexoLegal and in doubtless, I built asynchronous task pipelines in Celery and Redis with atomic distributed locks to prevent worker race conditions, alongside real-time SSE streaming architectures and thread-safe WAL data layers handling concurrent queries with sub-second latency across 151 unit tests.

The asynchronous concurrency and streaming patterns are open-source here: https://github.com/amanverma-765/doubtless

Worth 15 minutes to chat through the trade-offs or the Backend role at Kulfi?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608  

---

## 2. Day 5 Follow-Up Draft

Hi Aadhar,

Following up on real-time state synchronization: I put together a minimal benchmark simulating paired-session WebSocket broadcasts under packet drops with Redis Pub/Sub state recovery. Happy to share the repository if helpful.

Best,  
Aman  

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build a high-throughput real-time game state synchronizer and paired session arbiter that maintains sub-second state reconciliation and prevents desyncs during peak bedtime traffic bursts.
- **Scope:** Manages paired-room WebSocket connections, broadcasts state deltas using Redis Pub/Sub across worker nodes, handles optimistic state reconciliation when one partner experiences packet loss, and persists completed game session analytics to PostgreSQL. Skips mobile UI rendering in favor of a dual-terminal mock client simulating concurrent player inputs.
- **Stack:** Python 3.12, FastAPI, WebSockets, Redis (Pub/Sub & in-memory state), PostgreSQL, Docker Compose, Pytest.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Configure Docker Compose environment with FastAPI, Redis, and PostgreSQL; establish paired room state data contracts and WebSocket connection lifecycles with heartbeat ping/pong.
  2. *Hours 3-5:* Implement Redis Pub/Sub room clustering and sequence-numbered delta state broadcasts; build optimistic client reconciliation logic with server-authoritative state resolution.
  3. *Hours 6-7:* Engineer automatic reconnection catch-up buffers in Redis so partners reconnecting after network drops replay missed game actions without room reset.
  4. *Hour 8:* Package automated Pytest test suite simulating 100 concurrent paired rooms under simulated 200ms network jitter, record 60-second walkthrough, and push repository to GitHub.
