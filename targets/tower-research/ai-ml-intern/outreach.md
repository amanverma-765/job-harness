# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Tower Research Capital LLC  
**Target Role:** AI/ML Engineering Intern  
**Target Recipient:** Quantitative Systems Engineering Lead (`quant-lead@tower-research.com`)  
**Addressed Hiring Gap:** Reducing CPU latency variance in high-throughput feature & retrieval pipelines

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Reducing hybrid retrieval latency on CPU  
**Word Count:** 108 words (strictly <= 120 words)

Hi [First Name],

I noticed your engineering team's focus on eliminating latency jitter across high-throughput data pipelines. When scaling retrieval across concurrent workers, CPU memory overhead and inverted index lock contention frequently cause tail latency spikes.

In my open-source project *doubtless*, I built a local-first hybrid retrieval engine fusing BM25 with dense embeddings via Reciprocal Rank Fusion, achieving 86.9% Recall@5 at 8.9ms latency on commodity CPU cores using custom C++ bindings and SQLite FTS5.

The benchmarks and test harness are public here: https://github.com/amanverma-765/doubtless

Worth 15 minutes to chat through the concurrency and latency trade-offs?

Best,  
Aman Verma  
amanverma.dev@gmail.com | +91 98765 43210

---

## 2. Day 5 Follow-Up Draft

Hi [First Name],

Following up with a quick benchmark: I recently tested this retrieval pipeline under 500 concurrent worker threads and sustained sub-15ms p95 latency on Linux. Happy to share the test scripts if helpful.

Best,  
Aman

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build a sub-10ms feature retrieval demo running locally against simulated financial market ticks.
- **Architecture:** C++ core retrieval engine with Python FastAPI bindings and SQLite memory-mapped inverted index.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1–3:* Implement concurrent C++ ring buffer for streaming 50,000 tick updates per second.
  2. *Hours 4–6:* Implement reciprocal rank fusion scorer with SIMD vector normalization.
  3. *Hours 7–8:* Create pytest benchmark suite demonstrating sub-10ms p95 latency under concurrent load.
- **Deliverables:** Public GitHub repo + clean README with benchmark graphs + 60-second video demo.
