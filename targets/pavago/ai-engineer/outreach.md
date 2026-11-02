# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Pavago LLC (`pavago.co`)  
**Target Role:** AI Engineer  
**Target Recipient:** Parker Cox (Co-Founder & CEO, `parker@pavago.co`) / Engineering Hiring Team  
**Addressed Hiring Gap:** Multi-Stage Candidate Screening & Low-Latency Profile Retrieval on CPU

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Sub-second candidate screening on CPU  
**Recipient:** Parker Cox (`parker@pavago.co`)  
**Word Count:** 95 words (strictly <= 120 words)

Hi Parker,

I saw Pavago is scaling automated candidate screening to deliver sub-minute vetted matches across 300,000+ profiles, which typically hits latency and token-cost bottlenecks when relying solely on frontier LLMs.

In my open-source project *ncert-rag-evals*, I built an empirical retrieval benchmark combining BM25 lexical search and dense embeddings via Reciprocal Rank Fusion, achieving 86.9% Recall@5 in 8.9ms on CPU (cutting latency by 99.8%) with paired McNemar statistical testing across 92 test suites.

The benchmarks, architecture, and test suites are public here: https://github.com/amanverma-765/ncert-rag-evals

Worth 15 minutes to chat through the trade-offs?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608

---

## 2. Day 5 Follow-Up Draft

Hi Parker,

Following up with a quick benchmark: I recently tested a two-stage screening pipeline filtering 1,000 candidate profiles in under 15 seconds on CPU before invoking Pydantic AI evaluation, reducing frontier LLM token costs by over 85%. Happy to share the benchmark repo if helpful.

Best,  
Aman

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build a high-throughput, low-latency candidate screening microservice demonstrating multi-stage filtering and prompt-injection-hardened LLM evaluation.
- **Scope:** Ingests unstructured candidate profiles into an indexed local database, executes fast hybrid retrieval (BM25 lexical search + dense vector embeddings fused via Reciprocal Rank Fusion) to extract top-k relevant applicants in under 15ms on CPU, and passes candidate dossiers into a sandboxed Pydantic AI evaluation agent with verified identity isolation in AgentDeps. Skips third-party ATS integrations and billing in favor of a local containerized FastAPI service.
- **Stack:** Python 3.12, FastAPI, Pydantic AI, SQLite FTS5, ChromaDB, Celery, Redis, Docker, Pytest.
- **Build Milestones (Total: 8 hours):**
  1. *Hours 1-2:* Setup candidate ingestion schema and build hybrid retrieval pipeline (SQLite FTS5 + ChromaDB) with RRF fusion.
  2. *Hours 3-5:* Implement Pydantic AI rubric evaluation agent with AgentDeps isolation to prevent prompt injection from candidate resumes.
  3. *Hours 6-7:* Build FastAPI endpoint with asynchronous Celery batch evaluation and OpenTelemetry tracing; write unit test suite in Pytest.
  4. *Hour 8:* Package Docker compose setup, record 60-second Loom demonstration, and publish public GitHub repository.
- **Deliverables:** Public GitHub repository + containerized FastAPI demo service + 60-second video walkthrough.
