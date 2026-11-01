---
name: job-description-analyzer
description: Analyze job postings, extract the 4-Quadrant Matrix, standardize the 10.6x Requisition Title, and enforce the Hard Qualification Gate (<50% match stops pipeline).
---

# Job Description Analyzer

## When to Use This Skill
- Whenever the candidate provides a job description URL, pasted text, or file.
- Before tailoring any resume or conducting deep company research.

---

## Analysis Framework

### 1. The 10.6x Requisition Title Multiplier
- Extract the exact, literal job requisition title from the posting (e.g. `Senior Distributed Systems Engineer`, `Machine Learning Infrastructure Engineer`).
- Save this exact string: it will be injected into the resume header and recent role subtitle to guarantee top placement in ATS substring queries.

### 2. The 4-Quadrant JD Extraction Matrix
Classify all requirements into four distinct quadrants:
- **Quadrant I: Core Languages & Runtimes** (e.g., Python, Go, Rust, TypeScript, C++, SQL).
- **Quadrant II: Infrastructure, Databases & Cloud** (e.g., Kubernetes, AWS, PostgreSQL, Redis, Docker, Terraform).
- **Quadrant III: Architectural Patterns** (e.g., Event-Driven, RAG, Distributed Consensus, Microservices, gRPC).
- **Quadrant IV: Operational Scale & SLAs** (e.g., 45k req/sec peak, 3.2TB daily ingest, 99.99% uptime, sub-25ms latency).

### 3. Hard Qualification Gate (< 50% Match Stop Rule)
Calculate the match percentage between the JD's must-have requirements and the candidate's verified ground truth (`core/profile.yaml` and `core/projects_corpus.yaml`):
```
Match Score = (Matched_Essential_Skills / Total_Essential_Skills) * 100
```
- **If Match Score < 50% (or missing fundamental prerequisite domains):**
  - **STOP PIPELINE IMMEDIATELY.**
  - Do NOT generate a tailored resume.
  - Emit a clear report:
    ```
    🛑 HARD QUALIFICATION GATE TRIGGERED (Match Score: XX%)
    Missing Essential Prerequisites: [List missing non-negotiables]
    Recommendation: Skip application or pivot to a matching role.
    ```
- **If Match Score >= 50%:**
  - Proceed to `/job:research` and `/job:tailor`.
  - Identify missing secondary skills for interactive clarification with the user.
