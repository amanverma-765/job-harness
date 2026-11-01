# Audit Report: AI/ML Engineering Intern (Tower Research Capital)

**Date:** November 1, 2026  
**Auditor Engine:** `engine/verify_resume.py` (v2026.1) & `engine/pdftotext_linter.py`  
**Candidate Ground Truth:** `core/profile.yaml` & `core/projects_corpus.yaml`  
**Target Workspace:** `targets/tower-research/ai-ml-intern/`

---

## 1. Deterministic Linter Sign-off

| Gate | Check | Status | Evidence / Notes |
| :--- | :--- | :--- | :--- |
| **Gate 1** | Non-Skills Ban | **PASSED** | Technical skills section contains only queryable tools and frameworks; zero architectural methods; includes `Languages & Core`. |
| **Gate 2** | Defensibility Standard | **PASSED** | All numbers reflect empirical benchmarks (`350 evals/sec`, `8.9ms latency`, `110ms p95`); zero unverified scraping SLAs. |
| **Gate 3** | Codebase Truthfulness | **PASSED** | Tech stacks and architectures match commit-pinned history in `core/projects_corpus.yaml`. |
| **Gate 4** | Fluff Ban & Scannability | **PASSED** | Zero academic hyperbole; lead action verbs unbolded; verb diversity verified (no lead verb repeated > 2 times). |
| **Gate 5** | ATS Rigor & Zero Em-Dashes | **PASSED** | 0 em-dashes (`---` or `—`) found; canonical branding verified (`GitHub`, `PostgreSQL`). |
| **1:1 Proof** | Skill-to-Evidence Rule | **PASSED** | 100% of skills listed under `#skill_item` have supporting proof in experience/project bullets. |
| **Budget** | Strict 1-Page Constraint | **PASSED** | `resume.pdf` verified at exactly 1 page via `pdfinfo`. |
| **Stream** | PDF Stream Extraction | **PASSED** | Verified via `pdftotext -layout`: clean single-column flow, zero glyph drops, valid contact fields. |

---

## 2. Adversarial Skeptic Audit

- **Verification against Git Commit Trees:**
  - `ncert-rag-evals`: Verified against commit `a7c2b4d9...` (84 test suites, 350 evals/sec, p < 0.01 confirmed).
  - `doubtless`: Verified against commit `9f82d1c7...` (86.9% Recall@5 at 8.9ms on CPU confirmed).
  - `LexoLegal`: Verified against candidate profile (SQLite FTS5, FastAPI, Redis queue, 40,000 regulatory documents).
- **Final Verdict:** **APPROVED FOR SUBMISSION (0 Defects Detected)**
