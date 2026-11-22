# Audit Report: Software Development Intern - Shure

- **Date:** November 22, 2026
- **Auditor Engine:** `engine/verify_resume.py`, `engine/pdftotext_linter.py`, & `engine/verify_research_compliance.py`
- **Candidate Ground Truth:** `core/profile.yaml` & `core/projects_corpus.yaml`
- **Target Workspace:** `targets/shure/software-development-intern/`

---

## 1. Deterministic Linter Sign-off

| Gate | Check | Status | Evidence / Notes |
| :--- | :--- | :--- | :--- |
| **Gate 1** | Non-Skills Ban | **PASSED** | Five skill categories hold only queryable tools, languages, and frameworks; `DSA`, `OOP`, `DBMS`, `Operating Systems` sit inside `Languages & Core` under the CS-fundamentals exemption. |
| **Gate 2** | Defensibility Standard | **PASSED** | All metrics are commit-grounded: `sub-2s latency`, `1,024 pytest tests`, `85%+ code sharing`, `168 unit tests`, `86.9% Recall@5 in 8.9ms on CPU`, `99.8%` latency cut, `p = 0.0021`, `151 tests`, `5,000-record chunks`, `25 parallel workers`. |
| **Gate 3** | Codebase Truthfulness | **PASSED** | Every stack claim matches a commit-pinned entry in `core/projects_corpus.yaml` or a verified tenure in `core/profile.yaml`. No invented project or framework. |
| **Gate 4** | Fluff Ban & Scannability | **PASSED** | Zero hyperbole; no bolded lead action verb; lead-verb diversity holds (max 2 uses per verb: Implemented, Engineered, Designed, Instrumented, Constructed, Proved, Validated, Automated, Hardened, Architected, Structured, Delivered). |
| **Gate 5** | ATS Rigor & Zero Em-Dashes | **PASSED** | Zero em-dashes in resume, cover letter, and outreach. Canonical branding: `GitHub`, `PostgreSQL`, `FastAPI`, `Pydantic AI`. |
| **1:1 Proof** | Skill-to-Evidence Rule | **PASSED** | 31 of 31 declared skills have explicit bullet evidence (`Redis` now also proven by the LexoLegal Celery sweep bullet); CS fundamentals exempt. |
| **Budget** | Strict 1-Page Constraint | **PASSED** | `resume.pdf` verified at exactly 1 page via `engine/compile.sh`. |
| **Page Fill** | Full-Page Vertical Calibration | **PASSED** | Calibrated `line_gap = 0.84em`, `section_gap = 1.10em`, `header_gap = 1.40em`; measured bottom whitespace `0.53in`, which equals the `0.5in` margin, so no dead space remains. Gaps beyond `0.88em / 1.18em / 1.46em` were tested and spill to page 2. |
| **Density** | Density Thresholds | **PASSED** | 15 counted technical bullets (<= 18 threshold), `line_gap = 0.84em` (>= 0.68em floor), 609 words. |
| **Stream** | PDF Stream Extraction | **PASSED** | `pdftotext_linter.py`: 59 lines, 5,364 chars, 100% linear extraction, CMap integrity confirmed, contact fields intact. |
| **Cover Letter** | Outbound Rigor & Word Count | **PASSED** | Exactly 1 page, 0 em-dashes, 329 words (within 250-350), exactly 4 paragraphs, first sentence does not start with "I". |
| **Outreach** | Outreach Word Count & Subject | **PASSED** | Subject: 6 words (<= 7), body: 96 words (<= 120), Day 5 follow-up and 1-weekend MVP spec included. |
| **Compliance** | 34-Point ATS Research Suite | **PASSED** | 34 / 34 checks passed in `engine/verify_research_compliance.py`. |

---

## 2. Adversarial Skeptic Audit

- **Verification against Git Commit Trees:**
  - `doubtless`: commit `9f82d1c` (Pydantic AI SSE doubt solver, Celery/Redis 4-stage ingestion, Groq Whisper-Large-V3 under 10s, SQLite WAL, OpenTelemetry/Logfire, 151 Pytest tests).
  - `ncert-rag-evals`: commit `a7d1e24` (hybrid retrieval benchmark over 17 STEM textbooks, SQLite FTS5 + ChromaDB, RRF at 86.9% Recall@5 in 8.9ms CPU, 99.8% latency reduction, 4,429 chunks, paired McNemar `p = 0.0021`, 92 Pytest cases in GitHub Actions).
  - `oak`: commit `1c72f87` (Kotlin Multiplatform catalog normalization across 5+ e-commerce platforms, Clean Architecture, Ktor multi-engine clients, Gradle convention plugins, Maven Central publication).
  - `LexoLegal`: verified against `core/profile.yaml` (38 async REST endpoints, 12 PostgreSQL tables, RFC 9457 contracts, Alembic, 1,024 pytest cases, Munshi MCP clients, AgentDeps identity isolation, KMP client with 168 tests).
  - `Webxela`: verified against `core/profile.yaml` (Square POS OAuth 2.0 onboarding under 2 minutes, Kotlin/Spring Boot/PostgreSQL monitoring with 25 parallel workers, JUnit 5 suites).
- **Immutable Fields Check:** Candidate location remains `Jaunpur, UP, India`; work-experience titles remain `Software Development Engineer Intern` and `Freelance Developer`. The `Software Development Intern` title is confined to the header subtitle only.
- **Title Sanitization Check:** Raw portal string `Software Development Intern / Job ID2026-5037 / IN-Telangana-Hyderabad` reduced to the canonical functional title `Software Development Intern`, with the requisition ID, location tag, and workplace marker stripped.
- **Honesty Bound:** No AWS, Azure, Kubernetes, React, or Angular claim appears anywhere, matching the candidate-confirmed scope (Docker only, no frontend).
- **Final Verdict:** **APPROVED FOR APPLICATION (0 Defects Detected across all 34 checks)**
