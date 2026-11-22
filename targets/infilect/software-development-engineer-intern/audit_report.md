# Audit Report: Infilect, Software Development Engineer Intern

**Date:** November 22, 2026
**Target:** `targets/infilect/software-development-engineer-intern/`
**Verdict:** 34 / 34 research-compliance checks passed, 0 linter errors, resume and cover letter both exactly 1 page.

---

## 1. Deterministic Engine Results

| Gate | Command | Result |
| :--- | :--- | :--- |
| Compile + page budget | `bash engine/compile.sh .../resume.typ` | PASS, 1 page |
| Visual render | `engine/visual_verify.py` (auto) | PASS, single page, no overflow |
| 5-Gate AST / regex linter | `python3 engine/verify_resume.py .../resume.typ` | PASS, 0 errors, 18 bullets, 4 skill groups |
| Text stream + CMap | `python3 engine/pdftotext_linter.py .../resume.pdf` | PASS, 59 lines, 5,479 chars, 100% linear |
| End-to-end compliance | `python3 engine/verify_research_compliance.py <target dir>` | PASS, 34 / 34 |
| Cover letter compile | `bash engine/compile.sh .../cover_letter.typ` | PASS, 1 page |

- **Text extent:** resume ink ends at y = 753.7pt of 792pt (0.5in bottom margin starts at 756pt), so the page is filled to within 2pt of the margin. No dead space.
- **Spacing variables:** `line_gap: 0.84em`, `section_gap: 1.04em`, `header_gap: 1.45em`. Escalating to `line_gap: 0.85em` / `section_gap: 1.10em` spilled to page 2, confirming 0.84em is the maximum that holds one page.

## 2. Compliance Checkpoints

1. **Stream extraction:** 0 control characters, 0 PUA icon glyphs, contact stream in the primary text flow, no interleaved column segments.
2. **Headings and dates:** WORK EXPERIENCE, TECHNICAL SKILLS, PROJECTS, EDUCATION all canonical; 2 standardized 3-letter month ranges.
3. **Search traps:** no bare `Go`, acronyms grounded, concrete scale metrics present (1,024 tests, 38 endpoints, 86.9% Recall@5, 8.9ms, 99.8%, 743 District Courts).
4. **Knowledge base grounding:** 7 repositories commit-pinned to 40-char SHAs, each with at least 3 defensible bullets.
5. **Title multiplier:** `Software Development Engineer Intern` in the header only. Work experience titles (`Software Development Engineer Intern` at LexoLegal, `Freelance Developer` at Webxela) verified immutable against `core/profile.yaml`.
6. **Keyword and 1:1 proof:** 27 unique skills, 100% grounded, no unproven skill.
7. **Formatting:** 0 bolded lead verbs, max 2 uses per lead verb, 0 weak or passive verbs, 0 hyperbole, 0 em-dashes.
8. **Density:** 15 technical bullets (cap 18), page density threshold passed without pruning.

## 3. Adversarial Verification

- **Django:** claimed nowhere. Not in the header, not in Skills, not in any bullet. It appears only in the cover letter and outreach as a learning ramp, matching the user's explicit instruction.
- **Location:** header shows `Jaunpur, UP, India`, unchanged. Bengaluru relocation appears only as a willingness statement in the cover letter and outreach, per user confirmation.
- **Header title:** posting said `Full-Time`; the body states a 6-month internship, so the employment-type noun is `Intern`. The `( Backend )` track qualifier was stripped from the title per the zero-synthesized-suffix rule.
- **Every metric** in the resume traces to `core/profile.yaml` or a commit-pinned entry in `core/projects_corpus.yaml` (38 endpoints, 12 tables, 1,024 / 151 / 92 tests, 4,429 chunks, 86.9% Recall@5 in 8.9ms, 99.8%, p = 0.0021, <15MB/hr, <10s, 5,000-record chunks, 25 parallel workers, 25 High Courts, 743 District Courts, sub-2s latency).
- **Section order** follows Case A (work experience first), with Education strictly at the bottom.
- **Leadership selection** deviates from the house default pair (`targets/amazon`, `targets/apna-mart`, `targets/bornwest` all use the GenAI teaching sessions plus CTPC coordination). For this backend req the rendered pair is upstream open-source collaboration (#4) and the authorization vulnerability disclosure (#5), because the resume already carries three AI projects and the JD explicitly asks for cross-team collaboration and proactive issue ownership. Both strings trace to `core/profile.yaml` without added facts.

## 4. Known Weakness

Django is the only named requirement with no production evidence, and it is the first thing a backend panel will probe. The package answers it three ways: it is never misrepresented on the resume, the cover letter frames the transfer path explicitly, and the outreach carries a concrete 1-weekend DRF port specification with a 100-replay idempotency proof.

## 5. Reproduce

```bash
bash engine/compile.sh targets/infilect/software-development-engineer-intern/resume.typ
bash engine/compile.sh targets/infilect/software-development-engineer-intern/cover_letter.typ
python3 engine/verify_resume.py targets/infilect/software-development-engineer-intern/resume.typ --corpus core/projects_corpus.yaml
python3 engine/pdftotext_linter.py targets/infilect/software-development-engineer-intern/resume.pdf
python3 engine/verify_research_compliance.py targets/infilect/software-development-engineer-intern
```
