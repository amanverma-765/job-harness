# Audit Report: Carousell Group, Android Engineer Intern (6 months)

Audit date: 2026-11-22
Artifacts audited: `resume.typ` / `resume.yaml` / `resume.pdf`, `cover_letter.typ` / `cover_letter.pdf`, `outreach.md`
Company research reused from `../company_research.md` (verified 2026-11-22).

## 1. Deterministic Engine Results

| Gate | Command | Result |
|---|---|---|
| 1-page PDF budget (resume) | `bash engine/compile.sh targets/carousell/android-engineer-intern/resume.typ ...` | PASS, exactly 1 page |
| 5-Gate AST / regex linter + 1:1 skill proof | `python3 engine/verify_resume.py ... --corpus core/projects_corpus.yaml` | PASS, 0 errors, 0 warnings, 17 bullets checked, 4 skill groups |
| Linear text stream, CMap purity | `python3 engine/pdftotext_linter.py .../resume.pdf` | PASS, 55 lines, 5157 chars |
| End-to-end research compliance | `python3 engine/verify_research_compliance.py targets/carousell/android-engineer-intern` | PASS, 38 / 38 checks |
| 1-page PDF budget (cover letter) | `bash engine/compile.sh .../cover_letter.typ ...` | PASS, 1 page, 316 words by pdftotext |

## 2. Title Sanitization

- Raw portal string: `Android Engineer Intern - 6 months`
- Stripped: duration marker, city/office metadata, department tag (`Engineering - Core Marketplace`).
- Injected as `target_title: "Android Engineer Intern"`, which the header renders upper-cased as `ANDROID ENGINEER INTERN`.
- No synthesized domain suffix (no "Core Marketplace", no "Marketplace Platform") anywhere in the title field.
- Work experience titles left untouched: `Software Development Engineer Intern` (LexoLegal) and `Freelance Developer` (Webxela) are both verbatim in `core/profile.yaml`.
- Immutable location preserved: `Jaunpur, UP, India`.

## 3. Hard Qualification Gate

Match score 94% (8.5 / 9 essentials, one partial for marketplace-scale stakeholder management), well above the 50% stop threshold. Full table in `role_analysis.md`.

## 4. Bullet Inventory & Density

- Total experience plus project bullets: 14 (hard ceiling 18, under-fill floor 14).
- Split: LexoLegal 3, Webxela 2, WatchTower 3, Cypher-X 3, modflix 3.
- Leadership: 2 items. No bullet from the corpus was paraphrased into an unverifiable claim.
- Page fill: last ink row sits 0.10in inside the 0.5in bottom margin, so there is no dead space and no overflow.

Spacing calibration (`resume.yaml` → `core/templates/template.typ`):
- `line_gap: 0.85em`, `section_gap: 0.92em`, `header_gap: 1.30em`. Both gaps were raised together proportionally per the unified-gap rule; neither approaches the 0.68em floor.

Pruning log (spacing-first, then content):
1. First compile at `line_gap 0.85em` with 15 bullets spilled to 2 pages (education block alone on page 2).
2. Compression to `0.72em / 0.80em` still spilled.
3. Removed the Webxela trademark-search bullet and the Smart India Hackathon leadership line, then re-expanded to `0.82em / 0.88em`, which fit but left 0.42in inside the margin and one orphaned word.
4. Restored the LexoLegal Celery/Redis reliability bullet, tightened one modflix clause, and returned to `0.85em / 0.92em`: 1 page, 0.10in clearance inside the margin.

## 5. Keyword & Skill Integrity

- Unique declared skills: 22 (range 20-35).
- All declared skills have explicit bullet evidence. `SQL` was listed first and failed the boundary-bounded 1:1 proof against the `SQLite` bullet text, so the row now declares `SQLite` (which still satisfies an ATS substring query for `SQL`) rather than an unproven language token.
- CS fundamentals (DSA, OOP, DBMS, Operating Systems) are exempt from 1:1 proof and stay in `Languages & Core`.
- Banned non-skills (agile, clean code, problem solving, embeddings, distributed lock) are absent.
- Trap 07 (dual-acronym disconnect) is satisfied by `Model Context Protocol (MCP)` in the LexoLegal agent bullet, expanded at first use.
- Trap 06 (bare `Go` stopword) does not apply: the resume is Kotlin-first and contains no bare `Go` token.

## 6. Style Compliance

- F-pattern bolding used for technologies and metrics (`*Kotlin Multiplatform (KMP)*`, `*60 FPS*`, `*85%+ code sharing*`, `*168 unit tests*`, `*sub-2s latency*`). No lead action verb is bolded.
- Lead verbs: Architected, Automated, Built, Shipped, Structured, Constructed, Optimized, Designed, Integrated, Engineered, Modularized. Maximum repetition is 2, and the repeated pair (`Automated`, `Engineered`) appears in different sections.
- Zero em-dashes in every artifact. Date ranges use hyphens (`Nov 2025 - Jul 2026`).
- Every bullet follows Verb + technical what + stack + quantified impact.

## 7. Adversarial Fact Check

| Claim on resume | Source of truth | Verdict |
|---|---|---|
| 85%+ code sharing, 168 unit tests, Navigation 3, Koin, Room KMP, CMP client | `core/profile.yaml` LexoLegal highlights | Verified |
| 12-hour Celery/Redis refresh, 25 High Courts, zero duplicate alerts | `core/profile.yaml` LexoLegal highlights | Verified |
| `Munshi` on Pydantic AI + FastAPI with MCP servers, sub-2s, 38 REST endpoints | `core/profile.yaml` LexoLegal highlights | Verified |
| 60 FPS Canvas spin wheel, MVI state flows, KMP domain models, Koin, Ktor QR vouchers | `core/profile.yaml` Webxela highlights | Verified |
| MD5 + Myers diff DOM monitoring, WorkManager + semaphore crawls at 60 FPS, Room/SQLite with Flow | `core/projects_corpus.yaml` watchtower | Verified |
| AndroidKeyStore AES-256-GCM, BiometricPrompt + MVI, Room, Clean Architecture, Koin, Flow | `core/projects_corpus.yaml` cypher-x | Verified |
| Multi-module Compose app, KSoup + Ktor scraper, 8+ providers, GitHub Actions mirror sync | `core/projects_corpus.yaml` modflix | Verified |
| 150+ students trained, 4,000+ star upstream contributions | `core/profile.yaml` leadership | Verified |

No invented frameworks, metrics, or test counts were introduced. The company claims quoted in the cover letter (Gemini-driven List with AI, 20% more items listed per seller, median listing under two minutes) come from the Google Cloud case study recorded in `../company_research.md`.

## 8. Cover Letter Checks

- 4 paragraphs, 316 words, 1 page, zero em-dashes.
- First sentence does not start with "I" and does not use an application boilerplate opening.
- Letterhead is three lines: `Engineering Hiring Team`, `Carousell Group`, `Bengaluru, Karnataka, India`. `recipient_title` is empty because no hiring manager or team name is evidenced for this role in `job_description.md` or `company_research.md`.
- Closing states availability for the full 6-month term and relocation to Bengaluru (user-confirmed choice).

## 9. Residual Risks

1. The `recipient_title` stays empty; if a Core Marketplace Android hiring manager is identified later, record the source in `company_research.md` first and then set the title.
2. `Navigation 3` reinforces the Jetpack keyword family and is a genuine differentiator, while `Navigation 3` wraps to a second line inside the `Mobile & Multiplatform` row. Cosmetic only.
3. Leadership is down to 2 items to protect the 1-page budget; if a recruiter values hackathon organisation, that line is available in `core/profile.yaml` and can replace the open-source contribution line.

## 10. Verdict

38 / 38 research-compliance checks and 0 / 5 candidate-quality gate errors. Ship it.
