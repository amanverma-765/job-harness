# Audit Report: OakNorth - Intern - Gen AI

**Target:** `targets/oaknorth/generative-ai-intern/`
**Audited:** 2026-11-22
**Auditor:** harness agent, adversarial pass against `core/` sources only

---

## 1. Deterministic Gate Results

| Gate | Command | Result |
|---|---|---|
| Typst compile and 1-page budget | `bash engine/compile.sh targets/oaknorth/generative-ai-intern/resume.typ` | PASSED, 1 page |
| AST/Regex 5 Quality Gates + 1:1 skill proof | `python3 engine/verify_resume.py ... --corpus core/projects_corpus.yaml` | PASSED, 0 errors, 18 bullets checked, 5 skill groups |
| Linear text stream and CMap purity | `python3 engine/pdftotext_linter.py .../resume.pdf` | PASSED, 100% linear extraction, 5,727 chars |
| Full research compliance (all checkpoints) | `python3 engine/verify_research_compliance.py targets/oaknorth/generative-ai-intern` | PASSED, 38 / 38 checks |
| Cover letter budget | `bash engine/compile.sh .../cover_letter.typ` + word count | PASSED, 1 page, 278 body words (limit 250-350) |
| Outreach subject and body | manual count | PASSED, 6-word subject, 105-word body (limit 120) |

## 2. Claim-by-Claim Verification

Every quantified claim in the resume maps to a commit-pinned corpus entry or `core/profile.yaml`.

| Resume claim | Source | Commit | Disposition |
|---|---|---|---|
| ncert-rag-evals: 17 textbooks, 8 strategies, hand-rolled SQL over SQLite FTS5 and ChromaDB | `core/projects_corpus.yaml:145-186` | `a7d1e24c0a861d7a9c3e1d9de648b8805abae264` | VERIFIED, defensible bullet 1 |
| ncert-rag-evals: 86.9% Recall@5 in 8.9ms on CPU, 99.8% latency cut | same | same | VERIFIED, `empirical_metrics.benchmarks` |
| ncert-rag-evals: 4,429 chunks, McNemar p = 0.0021, 92 pytest tests | same | same | VERIFIED, `test_suite_count: 92` |
| doubtless: Pydantic AI, FastAPI, 45s dialogue windows, SSE | `core/projects_corpus.yaml:187-243` | `2e17ad9462d8e1a96f46803f2b219e93c65db0e5` | VERIFIED |
| doubtless: 4-stage Celery/Redis pipeline, 16kHz mono, <15MB/hr, <10s Groq Whisper-Large-V3 | same | same | VERIFIED, `empirical_metrics.benchmarks` |
| doubtless: SQLite WAL, Redis, Docker, OpenTelemetry, Logfire, 107 tests | same | same | VERIFIED, `test_suite_count: 107` |
| vectorless-rag: 18 queries, Ollama testbed, Pydantic AI | `core/projects_corpus.yaml:244-278` | `c3b1741a5e44aa403de276dbd70a92be1b271135` | VERIFIED |
| vectorless-rag: 2.7x token cost, 2x latency, 100% hit rate, 0.85 citation precision | same | same | VERIFIED, note the corpus also records vector RAG at 100% vs 93%: the resume omits the 93% baseline, which is a compression not a distortion, since "100% hit rate" is stated as the measured result |
| vectorless-rag: <200MB bounded memory, 40% extraction latency cut | same | same | VERIFIED |
| LexoLegal: Munshi, Pydantic AI, FastAPI, MCP servers, sub-2s latency | `core/profile.yaml` experience entry | n/a (employment record) | VERIFIED as candidate-confirmed tenure fact |
| LexoLegal: 12-hour Celery/Redis refresh sweep, zero duplicate alerts, zero message loss | `core/profile.yaml` | n/a | VERIFIED |
| LexoLegal: 38 async REST APIs, SQLAlchemy 2.0, 12 PostgreSQL tables, JWT, RFC 9457, Alembic, 1,024 pytest tests | `core/profile.yaml` | n/a | VERIFIED |
| LexoLegal: AES-128-CBC eCourts ingestion, 25 High Courts, 743 District Courts | `core/profile.yaml` | n/a | VERIFIED |
| Webxela: Kotlin/Spring Boot/PostgreSQL, 25 workers, semaphore limits, 5,000-record chunks | `core/profile.yaml` | n/a | VERIFIED |
| Webxela: Ktor/Jsoup, CAPTCHA resolution, 50-step backoff, Flyway, trigram search | `core/profile.yaml` | n/a | VERIFIED |
| Leadership: 3 sessions, 150+ students on LLM fundamentals | `core/profile.yaml:90` | n/a | VERIFIED |
| Leadership: upstream fixes to a 4,000+ star open-source repository | `core/profile.yaml:92` | n/a | UNPINNED, recorded in the KB but no repo, PR, or merge commit is named. Acceptable on the resume, weak under interview scrutiny: supply `owner/repo#PR` to pin it. The Smart India Hackathon entry (`core/profile.yaml:91`) was traded out for this line |

**Adversarial decision during this pass** (claim dropped because it was not anchored):

- Excel, VBA and Notion were excluded from Technical Skills. They are user-confirmed capabilities but have no commit-anchored bullet, so the 1:1 rule would hard-fail. They appear in the cover letter as a plain capability statement (formulas and pivot tables), never with metrics and never as VBA.

## 3. Rule Compliance

| Rule | Status |
|---|---|
| 10.6x title multiplier and sanitization | PASS, header reads `GENERATIVE AI INTERN`, no team, domain, or requisition suffix |
| Work experience title immutability | PASS, `Software Development Engineer Intern` and `Freelance Developer` match `core/profile.yaml` verbatim |
| Section order (candidate has experience) | PASS, Work Experience, Projects, Technical Skills, Leadership, Education |
| Single column, Nimbus Roman, 0.5in margins | PASS |
| Zero em-dashes | PASS, 0 across resume, cover letter, and outreach |
| Bolded lead verbs | PASS, zero; bolding is reserved for stacks and metrics |
| Verb diversity (max 2) | PASS, `Engineered` appears twice, every other lead verb once |
| Bullet count | PASS, 15 of 18 maximum, `line_gap` 0.76em (floor 0.68em) |
| Full-page fill | PASS, last baseline 0.46in from the page edge, no dead space |
| No target inheritance | PASS, every bullet compiled from `core/` in this session, no other `targets/` file read |
| Cover letter recipient integrity | PASS, `Hiring Team` with empty title, `OakNorth`, `Gurugram, Haryana, India` |
| Leadership trade | SIH logistics line dropped, OSS contribution line added, still 15 bullets and 1 page |
| Cover letter shape | PASS, 4 paragraphs, opening sentence does not start with "I" |

## 4. Open Risks

1. **Excel is the weakest factual link in the application.** The posting leads with Excel proficiency and asks for someone who builds rather than uses. The candidate confirmed formula and pivot-table level, which is short of that bar, and no workbook example was produced. Neither document quantifies Excel work, and the cover letter states only formulas and pivot tables. The defensible interview position is the adjacent evidence, meaning the LexoLegal refresh sweep that removed a manual checking routine and the measured benchmark tooling, not a claim of financial modelling or VBA.
2. **VBA and Notion are unaddressed gaps.** VBA is stated in the posting and Notion is a nice-to-have. No claim is made anywhere, which is correct, but an interview answer should exist: Python automation transfers, and markdown or Typst documentation replaces a Notion workflow cheaply.
3. **The gap premise in the outreach email is public-reporting based.** The FY2025 report and the CPTO's LinkedIn post are the evidence that no per-workflow savings figure is published. The email is framed as a question for that reason. If the team already runs a savings ledger, the premise weakens and the MVP spec should be replaced with the ledger's own next problem.
4. **Commit SHAs go stale.** The three project SHAs were last indexed between 2026-11-02 and 2026-11-22. Re-run `python3 engine/repomix_indexer.py <owner/repo>` before reusing this resume after 2026-12-22.
