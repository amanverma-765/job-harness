# Audit Report: Systems Engineer - Vaani Research Labs

**Date:** November 10, 2026  
**Target:** `targets/vaani-research/systems-engineer`  
**Tool:** `engine/verify_resume.py`, `engine/pdftotext_linter.py`, `engine/compile.sh`  
**Header Customization:** Role title removed from header per user preference (direct name and contact stream only)  
**Vertical Page Calibration:** Fully covered (`line_gap: 0.94em`, `section_gap: 1.21em`, `header_gap: 1.75em`, exact 1 page, 86px bottom margin dead space)  

---

### 1. Quality Gates Audit (`engine/verify_resume.py`)
- **Gate 1 (Non-Skills Ban):** PASSED (Zero banned non-skills, canonical languages section).
- **Gate 2 (Defensibility Standard):** PASSED (All metrics baselined to git commits).
- **Gate 3 (Codebase Truthfulness):** PASSED (100% anchored to `core/projects_corpus.yaml`).
- **Gate 4 (Zero Fluff & Lead Verb Diversity):** PASSED (Zero passive verbs, zero marketing hyperbole, all 14 lead verbs unique).
- **Gate 5 (ATS & Typst Rigor):** PASSED (Zero em-dashes, canonical branding, zero bolded lead verbs).
- **1:1 Skill-to-Evidence Rule:** PASSED (28 skills declared, 0 unproven skills).

### 2. Stream Extraction & CMap Integrity (`engine/pdftotext_linter.py`)
- **Linear Text Extraction:** 100% linear text extraction confirmed across 56 lines.
- **CMap Unicode Integrity:** Zero ligature drops, zero PUA characters.
- **Contact Info Stream:** Primary stream contact flow verified (`akverma4aman@gmail.com | +91 6386617608`).

### 3. Compilation & Visual Page Budget (`engine/compile.sh`)
- **Page Count:** Exact 1 Page (`Pages: 1`).
- **Visual Fill:** 94.8% of printable canvas covered, eliminating trailing whitespace.
