# Audit Report: Agoda, Software Engineer Internship 2027

**Target:** `targets/agoda/software-engineer-intern-2027/`
**Date:** 22 November 2026
**Verdict:** 34 / 34 deterministic checks passed. 16 prose bullets, 29 declared skills, all grounded.
**Revision 2 (22 Nov, 13:28):** `oak` removed to make room; Webxela gained 2 bullets; Leadership grew to 4 one-line entries; `Gradle (Kotlin DSL)` dropped with its only evidence.

---

## 1. Deterministic Gate Results

| Gate | Command | Result |
| --- | --- | --- |
| 1-page PDF budget (resume) | `bash engine/compile.sh targets/agoda/software-engineer-intern-2027/resume.typ targets/agoda/software-engineer-intern-2027/resume.pdf` | PASS: Pages: 1 |
| AST/Regex 5-gate linter | `python3 engine/verify_resume.py targets/agoda/software-engineer-intern-2027/resume.typ --corpus core/projects_corpus.yaml` | PASS: 0 errors, 1 warning (see 4.1) |
| Text stream + CMap purity | `python3 engine/pdftotext_linter.py targets/agoda/software-engineer-intern-2027/resume.pdf` | PASS: 58 lines, 5,670 chars, 100% linear |
| Full compliance sweep | `python3 engine/verify_research_compliance.py targets/agoda/software-engineer-intern-2027` | PASS: 34 / 34 |
| Re-run after claim corrections (22 Nov 2026, 13:26) | all four commands above | PASS: 1 page, 0 errors, CMap OK, 34 / 34 |
| 1-page PDF budget (cover letter) | `bash engine/compile.sh targets/agoda/software-engineer-intern-2027/cover_letter.typ targets/agoda/software-engineer-intern-2027/cover_letter.pdf` | PASS: Pages: 1, 338 words |

## 2. Title Multiplier

- Raw posting title: `Software Engineer Internship 2027 (6 months) - India-based, Gurgaon office`.
- Sanitized to `Software Engineer Intern`: cohort year, duration, and both location tags stripped; no domain or team suffix appended.
- Rendered in the PDF header as `SOFTWARE ENGINEER INTERN`.
- Work experience titles untouched: `Software Development Engineer Intern` (LexoLegal) and `Freelance Developer` (Webxela) both match `core/profile.yaml` verbatim, and the compliance script verifies that.

## 3. Adversarial Commit Verification

Live `git ls-remote https://github.com/amanverma-765/<repo> HEAD` on 22 November 2026, compared against the pinned SHAs in `core/projects_corpus.yaml`:

| Repo | Pinned SHA | Remote HEAD | Match | Corpus bullets |
| --- | --- | --- | --- | --- |
| doubtless | `2e17ad9462d8e1a96f46803f2b219e93c65db0e5` | `2e17ad9462d8e1a96f46803f2b219e93c65db0e5` | yes | 5 |
| ncert-rag-evals | `a7d1e24c0a861d7a9c3e1d9de648b8805abae264` | `a7d1e24c0a861d7a9c3e1d9de648b8805abae264` | yes | 3 |
| modflix | `97069711f2a9e052158e3a22e7528ca94b378feb` | `97069711f2a9e052158e3a22e7528ca94b378feb` | yes | 3 |

All three still-cited projects are at HEAD, so every metric on the page points at a reviewable tree. `oak` was verified at `1c72f8759cdfe1f6510f7f634ab08ac9bb344d5a` too, then dropped for space, not because anything failed. The 3-pointer minimum holds for every repository in the corpus listing.

## 4. Deviations Worth Reporting

### 4.1 "20 bullets" warning from `verify_resume.py`

The linter counts each project's `skills:` metadata row as a bullet, so it reports 20 against a threshold of 18. Prose bullets are 16 (`verify_research_compliance.py` counts these and passes the <= 18 gate). No pruning needed; the warning is a counting artifact of the compact project header format.

### 4.2 Two verified bullets were cut to buy the page

| Change | What happened | Why |
| --- | --- | --- |
| `oak` project removed | Lost 2 bullets (KMP library, Gradle convention plugins) | It overlapped Kotlin Multiplatform already shown in the LexoLegal client, and Agoda's bonus list is React/Kotlin/CI-CD, not library publishing. `Gradle (Kotlin DSL)` left the skills row with it, since oak was its only proof. |
| Webxela gained 2 bullets | Trademark engine (Kotlin, Spring Boot, PostgreSQL, 25 coroutines, semaphore limits, Flyway, trigram) and Coupit (CMP, 60 FPS, Koin, Ktor, QR vouchers) | Both are JVM backend plus relational work, which is the axis Agoda weights. Spring Boot and concurrency depth now appear twice. |
| Leadership expanded to 4 lines | SIH rounds, upstream OSS fixes, responsible disclosure added | Each fits one line, so the section costs 2 extra lines total and covers teamwork, OSS collaboration, and security judgment. |
| Spacing retuned | `line_gap` 0.76 -> 0.72, `section_gap` 0.86 -> 0.82 | Restored the 1-page budget after the swaps. Still above the 0.68 floor. |

### 4.3 Wording tightened against the corpus (not invented)

- `PyTorch` was removed from both the skills row and the doubtless transcription bullet. The corpus lists it in that project's stack, but no corpus bullet proves the specific use, so the claim is out until it has its own pointer.
- `38 asynchronous REST APIs` rephrases the corpus metric `38 asynchronous REST API endpoints`. Same count, plural form kept so the `REST APIs` skill has 1:1 proof.
- `writing hybrid BM25 and dense search from scratch in SQL on SQLite FTS5 and ChromaDB` adds `in SQL` to give the declared `SQL` skill literal evidence. FTS5 queries are SQL, so the claim holds.
- The modflix CI line says the pipeline synchronizes mirror endpoints and no longer says "on a schedule"; the corpus proves GitHub Actions plus Python scrapers, not a cron expression.

### 4.4 Claims deliberately absent

No mention of Scala, C#, Java, Kafka, Spark, Cassandra, MSSQL, Hadoop, TeamCity, or Puppet anywhere in the resume or cover letter. Those are Agoda bonus items with zero verified backing.

### 4.5 Two items awaiting your confirmation

- **English proficiency:** `role_analysis.md` no longer claims the degree was taught in English (that fact is not in `core/profile.yaml`). It now cites the 3 technical talks and upstream OSS collaboration, marked `EVIDENCED (confirm)`. Add an IELTS/TOEFL score or a one-line confirmation if you want it stated outright.
- **Company figures:** `company_research.md` now carries numbered source URLs, and the Rust migration row is corrected to the published numbers (84% cost cut at 5x traffic, CPU at 40% of the Scala peak, memory at 15%). The earlier "CPU at 13% of peak" figure was not corroborated and is gone.

## 5. Metric Traceability (Spot Check)

| Resume claim | Source |
| --- | --- |
| 38 REST APIs, 12 PostgreSQL tables, Nginx, Alembic, 1,024 pytest | `core/profile.yaml`, LexoLegal |
| AgentDeps tenant binding, MCP clients, sub-2s latency | `core/profile.yaml`, LexoLegal (Munshi) |
| 12-hour sweep, atomic Redis locks, two-stage dispatch/deliver, 90-retry ceiling | `core/profile.yaml`, LexoLegal |
| 85% code sharing, 168 unit tests, Navigation 3, Koin, Room | `core/profile.yaml`, LexoLegal mobile |
| 25 High Courts, 743 District Courts, AES-128-CBC | `core/profile.yaml`, LexoLegal eCourts |
| Square POS OAuth 2.0, under 2 minutes onboarding | `core/profile.yaml`, Webxela |
| 5,000-record chunks, 25 coroutines, semaphore limits, Flyway, trigram search | `core/profile.yaml`, Webxela trademark engine |
| 60 FPS spin wheel, shared models, Koin, Ktor QR vouchers | `core/profile.yaml`, Webxela Coupit |
| 4,000+ star upstream repo, 500+ college portal disclosure | `core/profile.yaml`, leadership |
| 45s dialogue windows, 15MB/hr slicing, under 10s transcription, 107 tests, 12 Vitest suites | `core/projects_corpus.yaml`, doubtless |
| 86.9% Recall@5 at 8.9ms, McNemar p = 0.0021, 92 pytest cases, 17 textbooks | `core/projects_corpus.yaml`, ncert-rag-evals |
| 8+ streaming providers, :cassini module, GitHub Actions pipeline | `core/projects_corpus.yaml`, modflix |

## 6. ATS Parsing Notes

- Single column, 0.5in margins, Nimbus Roman, US-Letter. No tables, no icons, no multi-column blocks.
- Section order follows the experience-aware rule: header, work experience, projects, skills, leadership, education.
- Contact stream is pure text on two lines (email and links are real hyperlinks but extract as text).
- Dates use three-letter months and single hyphens (`Nov 2025 - Jul 2026`), so Workday, Greenhouse, Ashby, and Lever date parsers all match.
- Six bolded metric strings per page at most, all on technologies or numbers, never on a leading verb.

## 7. Remaining Risk

- The application form's own fields (education end date, NOC, relocation, 6-month availability) are answered by you, not by these documents. Answers collected: full-time 24 weeks from 11 January 2027, willing to relocate and attend Gurugram twice a week, university issues the NOC, both 11 and 17 December interview dates work.
- Nothing here has been submitted anywhere. Submission is yours to trigger.
