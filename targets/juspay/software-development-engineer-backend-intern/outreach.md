# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Juspay Technologies  
**Target Role:** Software Development Engineer Backend Intern  
**Target Recipient:** Mohan P. (Engineering Lead Global, Juspay) / Core Platform Hiring Team  
**Addressed Hiring Gap:** Redis per-command latency observability and connection lease metrics (Hyperswitch GitHub Issue #13090)  

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** hyperswitch redis command latency telemetry draft  
**Word Count:** 100 words (strictly <= 120 words)  

Hi Mohan,

I noticed issue #13090 in Hyperswitch tracking per-command Redis call latency and error observability across GET, SET, and XADD pipelines.

In my open-source project *doubtless*, I built an asynchronous 4-stage ingestion pipeline in Celery and Redis with SQLite WAL repositories, wrapping client commands in OpenTelemetry spans to capture discrete execution latency and distributed connection pool lease wait times across 151 unit tests.

The telemetry integration and async repository patterns are public here: https://github.com/amanverma-765/doubtless

Would you be open to a 15-minute chat about Redis command-level tracing or the SDE Backend Internship at Juspay?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608  

---

## 2. Day 5 Follow-Up Draft

Hi Mohan,

Following up on Redis observability in Hyperswitch: I prototyped a lightweight middleware wrapper that tracks per-command Redis duration and connection checkout delays without adding overhead to OLTP request paths. Happy to send over the test script or gist if useful.

Best,  
Aman  

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build a self-contained Redis telemetry middleware that instruments per-command latency and connection pool lease wait times with OpenTelemetry span exports.
- **Scope:** Wraps Redis client commands (`GET`, `SET`, `HSET`, `XADD`), calculates exact pool acquisition latency versus execution time, and emits structured OpenTelemetry spans and Prometheus metrics. Skips multi-region cluster topologies in favor of a local containerized Redis instance with configurable connection pool saturation.
- **Stack:** Python 3.12, `redis-py`, OpenTelemetry SDK, Logfire, Pytest, Docker Compose.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Configure local Docker environment with Redis and OpenTelemetry Collector; establish connection pool benchmark harness.
  2. *Hours 3-5:* Implement middleware wrapper intercepting Redis client pipeline calls, measuring checkout latency and command execution duration.
  3. *Hours 6-7:* Instrument OpenTelemetry trace spans with error tagging on connection timeouts; write 10+ Pytest verification tests.
  4. *Hour 8:* Record 60-second Loom architecture walkthrough and publish documented GitHub repo.
- **Deliverables:** Public GitHub repository + automated latency benchmark script + 60-second video demo.
