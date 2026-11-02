# Audit Report: AI Engineer / LLM Engineer - Talent Pool (G2i)

**Date:** November 2, 2026  
**Auditor Engine:** `engine/verify_resume.py` (v2026.1) & `engine/pdftotext_linter.py`  
**Candidate Ground Truth:** `core/profile.yaml` & `core/projects_corpus.yaml`  
**Target Workspace:** `targets/g2i/ai-engineer-llm-engineer-talent-pool/`

---

## 1. Deterministic Linter Sign-off

| Gate | Check | Status | Evidence / Notes |
| :--- | :--- | :--- | :--- |
| **Gate 1** | Non-Skills Ban | **PASSED** | Technical skills section contains only queryable tools, languages, and frameworks; zero architectural methods; includes `Languages & Core`. |
| **Gate 2** | Defensibility Standard | **PASSED** | All metrics reflect empirical benchmarks (sub-2s latency, 86.9% Recall@5 at 8.9ms on CPU, 99.8% cut, p = 0.0021, 100% hit rate, 0.85 precision, <200MB memory); zero unverified vanity numbers. |
| **Gate 3** | Codebase Truthfulness | **PASSED** | Tech stacks and architectures match commit-pinned history in `core/projects_corpus.yaml`. |
| **Gate 4** | Fluff Ban & Scannability | **PASSED** | Zero academic hyperbole; lead action verbs unbolded; verb diversity verified (each lead verb used at most once). |
| **Gate 5** | ATS Rigor & Zero Em-Dashes | **PASSED** | Zero em-dashes found; canonical branding verified (`GitHub`, `PostgreSQL`). |
| **1:1 Proof** | Skill-to-Evidence Rule | **PASSED** | 100% of skills listed in Technical Skills have supporting proof in experience or project bullets. |
| **Budget** | Strict 1-Page Constraint | **PASSED** | `resume.pdf` verified at exactly 1 page via `engine/compile.sh` with 17 total bullets across experience and 3 projects (3 pointers each). |
| **Page Fill** | Full-Page Vertical Calibration | **PASSED** | Calibrated `line_gap = 0.82em`, `section_gap = 1.05em`, `header_gap = 1.50em`; content covers full vertical page height with balanced margins. |
| **Stream** | PDF Stream Extraction | **PASSED** | Verified via `pdftotext -layout`: clean single-column flow, zero glyph drops, valid contact fields (57 lines, 4946 chars). |
| **KB Rigor** | 3-Pointer Project Minimum | **PASSED** | All 3 indexed projects (`ncert-rag-evals`, `doubtless`, `vectorless-rag`) maintain >=3 commit-grounded defensible bullets in `core/projects_corpus.yaml`. |

---

## 2. Adversarial Skeptic Audit

- **Verification against Git Commit Trees:**
  - `ncert-rag-evals`: Verified against commit `a7d1e24c0a861d7a9c3e1d9de648b8805abae264` (Python and Jupyter empirical retrieval benchmark, 86.9% Recall@5 in 8.9ms on CPU, 99.8% latency reduction, 4,429 chunks, paired McNemar test p = 0.0021, 92 unit tests in Pytest).
  - `doubtless`: Verified against commit `9f82d1c7429be19001153a81f3e7289f6d7ab431` (16kHz audio <15MB/hr, Groq Whisper transcription <10s, 151 unit tests).
  - `vectorless-rag`: Verified against commit `c3b1741a5e44aa403de276dbd70a92be1b271135` (100% hit rate, 0.85 precision, Jupyter Notebooks eval plotting with Matplotlib, <200MB bounded memory, 40% latency reduction).
  - `LexoLegal`: Verified against candidate profile (FastAPI, SQLAlchemy 2.0, PostgreSQL, Pydantic AI, Celery, Redis locks, Selectolax DOM extractors).
- **Final Verdict:** **APPROVED FOR SUBMISSION (0 Defects Detected)**
