# Audit Report: Software Developer - Bornwest

- **Date:** November 3, 2026
- **Auditor Engine:** `engine/verify_resume.py` (v2026.1), `engine/pdftotext_linter.py`, & `engine/verify_research_compliance.py`
- **Candidate Ground Truth:** `core/profile.yaml` & `core/projects_corpus.yaml`
- **Target Workspace:** `targets/bornwest/software-developer/`

---

## 1. Deterministic Linter Sign-off

| Gate | Check | Status | Evidence / Notes |
| :--- | :--- | :--- | :--- |
| **Gate 1** | Non-Skills Ban | **PASSED** | Technical skills section contains only queryable tools, languages, and frameworks; zero architectural methods; includes dedicated `Languages & Core`. |
| **Gate 2** | Defensibility Standard | **PASSED** | All metrics reflect empirical benchmarks (sub-2s latency, 86.9% Recall@5 at 8.9ms on CPU, 99.8% cut, p = 0.0021, 60 FPS UI, 151 tests in doubtless, 92 tests in ncert-rag-evals); zero unverified vanity numbers. |
| **Gate 3** | Codebase Truthfulness | **PASSED** | Tech stacks and architectures match commit-pinned history in `core/projects_corpus.yaml`. |
| **Gate 4** | Fluff Ban & Scannability | **PASSED** | Zero academic hyperbole; lead action verbs unbolded; verb diversity verified (each lead action verb used at most once across entire resume). |
| **Gate 5** | ATS Rigor & Zero Em-Dashes | **PASSED** | Zero em-dashes found; canonical branding verified (`GitHub`, `PostgreSQL`). |
| **1:1 Proof** | Skill-to-Evidence Rule | **PASSED** | 100% of skills declared in Technical Skills have supporting evidence in experience or project bullets (25/25 verified). |
| **Budget** | Strict 1-Page Constraint | **PASSED** | `resume.pdf` verified at exactly 1 page via `engine/compile.sh` with 15 total bullets across experience, 3 projects, and leadership. |
| **Page Fill** | Full-Page Vertical Calibration | **PASSED** | Calibrated `line_gap = 0.74em`, `section_gap = 0.94em`, `header_gap = 1.35em`; content covers full vertical page height with balanced margins. |
| **Density** | Density Thresholds | **PASSED** | 15 total bullets (<= 18 threshold), 576 words (<= 600 word limit), line_gap 0.74em (>= 0.68em floor). |
| **Stream** | PDF Stream Extraction | **PASSED** | Verified via `pdftotext -layout`: clean single-column flow, zero glyph drops, valid contact fields (57 lines, 5322 chars). |
| **Cover Letter**| Outbound Rigor & Word Count | **PASSED** | Exactly 1 page, 0 em-dashes, 345 words (strictly within 250-350 window), exactly 4 paragraphs. |
| **Outreach** | Outreach Word Count & Subject | **PASSED** | Subject: 6 words (<= 7 words), body: 113 words (<= 120 words), includes Day 5 follow-up and 1-weekend MVP spec. |
| **Compliance** | 33-Point ATS Research Suite | **PASSED** | 33 / 33 checks passed in `engine/verify_research_compliance.py`. |

---

## 2. Adversarial Skeptic Audit

- **Verification against Git Commit Trees:**
  - `doubtless`: Verified against commit `9f82d1c7429be19001153a81f3e7289f6d7ab431` (FastAPI real-time assistant, Celery/Redis 4-stage media ingestion pipeline, Groq Whisper transcription <10s, 151 unit tests).
  - `watchtower`: Verified against commit `da2c112b0798279baab4c2f8188b7af36703f3af` (Local-first web monitoring, Myers diff algorithm, WorkManager background crawls with 60 FPS UI, Room database, OkHttp).
  - `ncert-rag-evals`: Verified against commit `a7d1e24c0a861d7a9c3e1d9de648b8805abae264` (Python empirical retrieval benchmark, 86.9% Recall@5 in 8.9ms on CPU, 99.8% latency reduction, 4,429 chunks, paired McNemar test p = 0.0021, 92 unit tests in Pytest).
  - `LexoLegal`: Verified against candidate profile (FastAPI, SQLAlchemy 2.0, PostgreSQL, Celery, Redis locks, Selectolax DOM extractors).
  - `Webxela`: Verified against candidate profile (Spring Boot, Spring Data JPA, PostgreSQL, Square POS OAuth 2.0, Kotlin coroutines).
- **Final Verdict:** **APPROVED FOR APPLICATION (0 Defects Detected across all 33 checks)**
