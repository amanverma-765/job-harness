# Cold Outreach & 1-Weekend MVP Package

**Target Company:** G2i Inc.  
**Target Role:** AI Engineer / LLM Engineer - Talent Pool  
**Target Recipient:** Gabe Greenberg (Founder & CEO, `gabe@g2i.ai`) / Engineering Talent Team  
**Addressed Hiring Gap:** Building reproducible, statistically validated AI evaluation harnesses and sandboxed tool-calling environments for frontier AI labs

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Verifiable evaluation harness for frontier models  
**Word Count:** 98 words (strictly <= 120 words)

Hi Gabe,

I noticed G2i's expanding engineering cohorts building RL environments and evaluation harnesses for frontier AI labs. The primary bottleneck is shifting from raw data curation to verifiable evaluation testbeds with deterministic scoring.

In my open-source project *ncert-rag-evals*, I built an empirical retrieval evaluation harness benchmarking hybrid lexical and dense search, achieving 86.9% Recall@5 in 8.9ms on CPU with paired McNemar statistical significance testing (p = 0.0021) across 92 unit tests in Pytest.

The code, statistical benchmarks, and Jupyter testbed are public at https://github.com/amanverma-765/ncert-rag-evals

Would love to take your technical assessment and contribute evaluation harnesses to client projects.

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608

---

## 2. Day 5 Follow-Up Draft

Hi Gabe,

Following up on the evaluation harness: I recently published a testbed benchmarking LLM page indexing against dense vector retrieval with paired cost-latency curves and 100% hit rate verification. Happy to share the benchmark repo if relevant to your lab teams.

Best,  
Aman

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build a sandboxed AI evaluation harness that deterministically scores multi-turn LLM tool execution trajectories against unit test assertions with paired McNemar significance testing.
- **Scope:** Runs local or API-based LLMs through a mock environment of 10 tool-calling challenges (e.g. SQLite queries, API schema formatting), captures JSON trajectory execution logs, validates state mutations in a sandboxed Docker container, and computes p-value statistical significance against a baseline model.
- **Stack:** Python 3.12, Pytest, Pydantic AI, Docker, SQLite, Matplotlib, uv.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Define tool schemas and 10 deterministic test challenge fixtures with target state assertions.
  2. *Hours 3-5:* Implement execution runner evaluating agent tool-calling loops inside ephemeral Docker containers.
  3. *Hours 6-7:* Build evaluation reporter calculating execution accuracy, latency percentiles, and paired McNemar test p-values with Matplotlib summary plots.
  4. *Hour 8:* Package self-contained test suite, write reproducible README, and push to GitHub.
- **Deliverables:** Public GitHub repository + automated evaluation script (`pytest tests/`) + reproducible sample trajectory report.
