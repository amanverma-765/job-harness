---
name: tech-resume-optimizer
description: Formulate Google XYZ bullet points, enforce F-pattern keyword bolding, maintain action verb diversity, and ensure 1:1 skill evidence proof.
---

# Tech Resume Optimizer

## When to Use This Skill
- Whenever authoring, revising, or tailoring achievement bullet points and technical skills sections.

---

## Core Optimization Rules

### 1. The Google XYZ Bullet Formula
Every single bullet point must obey:
**`Accomplished [X] as measured by [Y] by doing [Z]`**
Expanded engineering formulation:
**`[Strong Action Verb] + [Technical What] + [Technology Stack] + [Scale / Measurable Operational Impact]`**

Examples:
- ✅ *"Architected multi-tenant legal search engine in Python using SQLite FTS5 and FastAPI, reducing p95 query latency from 850ms to 110ms across 40,000 regulatory documents."*
- ✅ *"Engineered asynchronous worker queue with Redis distributed caching and Celery, processing 15,000 document transformations daily with sub-200ms latency."*

### 2. F-Pattern Keyword Bolding (Scannability Standard)
Recruiters scan in an F-pattern during their 6–15 second visual review:
- **Bold substantive tokens:** Core languages (`*Python*`), databases (`*PostgreSQL*`), frameworks (`*FastAPI*`), protocols (`*gRPC*`, `*MCP*`), and key quantitative metrics (`*sub-110ms latency*`, *86.9% Recall@5*).
- **NEVER bold the leading action verb:** Leaving `Architected`, `Engineered`, `Developed` unbolded keeps the recruiter's eye focused on technical firepower and impact numbers rather than repetitive verbs.

### 3. Action Verb Diversity
- No lead action verb may be repeated more than **two times** across the entire resume.
- Rotate synonyms: *Architected, Engineered, Developed, Deployed, Benchmarked, Optimized, Accelerated, Streamlined, Instrumented*.

### 4. 1:1 Skill-to-Evidence Rule
- Every tool, language, database, or framework listed in the `Technical Skills` section **must have corresponding proof in at least one experience or project bullet point**.
- Prevents ATS keyword-stuffing penalties and ensures technical defensibility during hiring manager interviews.

### 5. Full-Page Vertical Calibration & Density Thresholds (Under-fill vs Over-stuffing)
- **Full-Page Fill Rule (Under-filled Resumes):**
  - Calibrate `line_gap` upward (and proportionally `section_gap` and `header_gap`) up to `0.85em–0.92em` so that content cleanly covers the vertical page budget without leaving trailing dead-space.
  - If spacing expansion alone is insufficient, pull in defensible extra bullet pointers from `core/projects_corpus.yaml` or user-suggested facts to fill out under-indexed items.
- **Over-stuffing Thresholds & Pruning Protocol:**
  - **Thresholds:** Total bullets must not exceed **18**, total word count must not exceed **600 words**, and `line_gap` must not be compressed below `0.68em`.
  - **Warning & Pruning Suggestions:** If any threshold is breached, the agent must alert the user to recruiter scan fatigue and suggest specific ranked candidate bullets for removal (e.g. secondary leadership points, redundant tech bullets, or lowest-priority project details).
