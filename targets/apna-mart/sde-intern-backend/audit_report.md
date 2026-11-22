# Audit Report: Apna Mart, SDE Intern (Backend)

**Target:** `targets/apna-mart/sde-intern-backend/`
**Title Sanitization:** `SDE Intern – Backend (Gurgaon)` → `target_title: "Software Development Engineer Intern"`. Stripped: location parenthetical `(Gurgaon)`, portal shorthand `SDE`, and the `- Backend` domain qualifier (body-only, per the zero-synthesized-suffix rule).
**Audit Date:** 2026-11-22
**Verifier:** deterministic engine (`engine/verify_resume.py`, `engine/pdftotext_linter.py`, `engine/verify_research_compliance.py`), plus human visual pass on the rendered PNG.

---

## 1. Deterministic Gate Results

| Gate | Check | Result |
|---|---|---|
| 1 | 1-page PDF budget (`pdfinfo`) | PASS, `Pages: 1` |
| 2 | Single-column layout, zero multi-column interleaving | PASS |
| 3 | Em-dash ban (resume, cover letter, reports, outreach) | PASS, 0 occurrences in all 4 artifacts |
| 4 | Work-experience titles byte-identical to `core/profile.yaml` | PASS, `Software Development Engineer Intern`, `Freelance Developer` |
| 5 | Bullet count ≤ 18 on tailored resume | PASS, 17 bullets |
| 6 | Lead-verb diversity (no verb > 2 uses) | PASS, Architected/Automated/Prevented/Ingested/Orchestrated/Built/Swept/Designed/Streamlined/Hardened/Constructed/Proved/Parsed/Authored/Contributed/Disclosed/Delivered each appears once |
| 7 | No bolded leading action verb | PASS, bolding starts at the first technical noun or metric |
| 8 | 1:1 skill-to-evidence rule | PASS, 5 skill groups, 0 unproven skills |
| 9 | Linear text extraction and CMap integrity | PASS, 59 lines, 5,675 characters, 100% linear |
| 10 | Spacing floor `line_gap >= 0.68em` | PASS, `line_gap: 0.73em` (`section_gap: 0.93em`, `header_gap: 1.33em`) |
| 11 | Cover letter 250 to 350 words | PASS, 344 words extracted |
| 12 | Cover letter exactly 1 page | PASS |
| 13 | Outreach subject ≤ 7 words, body ≤ 120 words | PASS, 6 words, 119 words |
| 14 | `engine/verify_research_compliance.py` | PASS, 34 / 34 checks |

**Engine verdict:** `0 errors detected across all 5 Quality Gates` and `34 / 34 CHECKS PASSED, 100% COMPLIANT WITH ALL ATS RESEARCH SPECIFICATIONS`.

---

## 2. Skill-to-Evidence Matrix

| Declared Skill Group | Declared Tokens | Bullet Proof |
|---|---|---|
| Languages & CS Core | Python, Kotlin, SQL, DSA, OOP, DBMS, Operating Systems | Python, Kotlin and SQL each appear in multiple bullets; the four CS fundamentals ride the explicit coursework exemption |
| Backend & Data | FastAPI, Spring Boot, Spring Data JPA, Celery, Redis, PostgreSQL, SQLite, SQLAlchemy | LexoLegal b1 (FastAPI, SQLAlchemy, PostgreSQL), b2 (Celery, Redis), Webxela b1 (Spring Boot, Spring Data JPA), Webxela b2 (PostgreSQL), doubtless b2 (Celery, Redis), b3 (SQLite, Redis) |
| Architecture & Ops | REST APIs, JWT, OAuth 2.0, Docker, Git, GitHub Actions, Nginx | LexoLegal b1 (REST APIs, JWT, Docker, Git, GitHub Actions, Nginx), Webxela b1 (OAuth 2.0) |
| AI & Agent Tooling | Pydantic AI, Model Context Protocol (MCP), Claude Code, Cursor | LexoLegal b5 (Pydantic AI, MCP), LexoLegal b1 (`Claude Code` and `Cursor` diffs reviewed before every merge) |
| Testing & Observability | Pytest, JUnit 5, OpenTelemetry, Logfire | LexoLegal b1 (Pytest, 1,024 tests), Webxela b1 (JUnit 5), doubtless b3 (OpenTelemetry, Logfire) |

Every claim above is anchored either in `core/profile.yaml` (candidate-verified employer facts) or a commit-pinned entry in `core/projects_corpus.yaml` (doubtless, ncert-rag-evals, WatchTower).

---

## 3. Deliberate Non-Claims (Honest Gap Register)

The JD names technologies the candidate has not shipped, so they appear nowhere on the resume, cover letter, or outreach:

- **Django, Flask:** not claimed. FastAPI is the proven Python backend stack, and the JD accepts any one of the three.
- **MySQL:** not claimed. PostgreSQL and SQLite are the proven relational stores.
- **Node.js:** not claimed. The posting allows either Python or Node.js, and Python is the deeper stack.
- **React / Nuxt:** not claimed. No shipped React work exists; the JD lists these as good-to-have only.

Do not "fix" these omissions by adding tokens. Adding an unproven token breaks gate 8 and reintroduces the keyword-stuffing penalty the 1:1 rule exists to prevent.

---

## 4. Page-Budget Calibration Log

The resume carries 17 bullets, so the 1-page budget allows only a narrow gap expansion:

| `line_gap` | `section_gap` | `header_gap` | Pages |
|---|---|---|---|
| **0.73em (shipped)** | **0.93em** | **1.33em** | **1 (fills to the 0.5in bottom margin)** |
| 0.74em | 0.94em | 1.34em | 2 (rejected) |
| 0.72em with 18 bullets | 0.92em | 1.32em | 2 (rejected) |

No over-stuffing threshold is breached: 17 bullets is under the 18-bullet ceiling, and `line_gap: 0.73em` sits above the 0.68em floor. No pruning decision is required from the user.

---

## 5. Visual Pass

- Header: centered pure-text contact stream, zero icon glyphs, name and sanitized title separated cleanly.
- Section order follows Case A (candidate has work experience): Header, Work Experience, Projects, Technical Skills, Leadership, Education last.
- No text overlap, no orphaned section titles, no bullet hyphen wrapping onto its own line, margins even at 0.5in.
- F-pattern bolding lands on technologies and metrics (`FastAPI`, `Redis`, `1,024 Pytest tests`, `86.9% Recall@5`, `sub-2s latency`), never on the leading verb.

## 6. Adversarial Notes

- `Recall\@5` is escaped in Typst to avoid the `@` label-reference parse error; the compiled text reads `Recall@5`.
- LexoLegal bullet 1 is the densest line on the page (four wrapped rows). It carries Docker, Git, GitHub Actions, JWT, REST APIs, Pytest, Claude Code and Cursor, so splitting or shortening it will break gate 8 unless those tokens move to another proven bullet.
- The cover letter runs 344 words, leaving only 6 words of headroom. Any edit to that file needs a re-count before shipping.

---

## 7. Leadership Section Rebuild (2026-11-22)

An earlier draft of this resume carried a leadership bullet about CTPC placement drives and corporate outreach for 100+ candidates. That claim does not exist anywhere in `core/profile.yaml`, so it was fabricated by summarization drift and has been deleted. Any future edit must verify leadership text against `core/profile.yaml` `leadership:` verbatim.

The section now carries three KB-verified achievements: upstream fixes on a 4,000+ star open-source GitHub repository, responsible disclosure of authorization and authentication vulnerabilities across a university portal serving 500+ affiliated colleges, and 3 technical sessions delivered to 150+ students. WatchTower dropped from 2 bullets to 1 (the Android 60 FPS UI bullet) to pay for the third leadership bullet inside the 1-page budget; that project is the least JD-adjacent of the three.

