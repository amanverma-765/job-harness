# Audit Report: Icertis AI Engineering Intern

**Target:** `targets/icertis/intern-ai-engineering/`
**Audit Date:** November 22, 2026
**Result:** `engine/verify_research_compliance.py` reported **34 / 34 checks passed**, and `engine/verify_resume.py` reported **0 errors** across all 5 quality gates.

---

## 1. Deterministic Engine Results

| Engine | Command | Outcome |
|---|---|---|
| Page budget | `bash engine/compile.sh targets/icertis/intern-ai-engineering/resume.typ` | 1 page, visual render OK |
| Page budget (letter) | `bash engine/compile.sh targets/icertis/intern-ai-engineering/cover_letter.typ` | 1 page |
| AST / regex gates | `python3 engine/verify_resume.py targets/icertis/intern-ai-engineering/resume.yaml --corpus core/projects_corpus.yaml` | 0 errors, 18 bullets, 4 skill groups, 0 warnings |
| Text stream | `python3 engine/pdftotext_linter.py targets/icertis/intern-ai-engineering/resume.pdf` | 57 lines, 5,180 chars, 100% linear extraction, CMap integrity confirmed |
| Full compliance | `python3 engine/verify_research_compliance.py targets/icertis/intern-ai-engineering` | 34 / 34 passed, 100% compliant |

### Density and Layout Calibration
- **Bullets (rendered):** 17 total, counted as bullet glyphs in the PDF: 6 LexoLegal, 3 Webxela, 6 project points, 2 leadership points.
- **Bullets (engine counter):** `engine/verify_resume.py` reports 18 because it also counts each project's `skills` summary line as an evidence item (15 content bullets + 3 project skill lines; leadership is not counted). Both numbers sit at or under the 18-bullet ceiling.
- **Spacing:** `line_gap: 0.82em`, `section_gap: 1.10em`, `header_gap: 1.40em`, scaled together per the proportional scaling rule. These are lower than the first pass because a second leadership bullet was added.
- **Fill:** bottom dead space measured at **0.62 in** (under the 1 in under-fill threshold). With one leadership bullet the chosen spacing was `0.88/1.18/1.48` at 0.69 in of trailing whitespace; adding the security-disclosure bullet pushed that configuration to 2 pages, so the gaps came down proportionally.

---

## 2. Title and Immutability Checks

- **Header title:** `AI ENGINEERING INTERN`, derived from the raw posting string `Intern - AI Engineering` with no synthesized qualifier.
- **Experience titles:** `Software Development Engineer Intern` (LexoLegal) and `Freelance Developer` (Webxela) match `core/profile.yaml` verbatim. Neither was adapted toward the target title.
- **Location:** `Jaunpur, UP, India` preserved unchanged; Pune appears only in the cover letter as the work location.

---

## 3. Knowledge Base Change (Disclosed)

- **`core/projects_corpus.yaml`, `doubtless`:** commit pin refreshed from `9f82d1c7429be19001153a81f3e7289f6d7ab431` to `2e17ad9462d8e1a96f46803f2b219e93c65db0e5` (current `main` HEAD, authored 2026-10-06). The old SHA returns HTTP 422 "Invalid object requested" from the GitHub API, so the prior pin pointed at rewritten history.
- **Repomix re-index run:** `python3 engine/repomix_indexer.py amanverma-765/doubtless` re-packed the repo at the new SHA, detected stack `Celery, ChromaDB, Docker, FastAPI, Hugging Face, PyTorch, Pydantic AI, Redis, SQLite, pytest`, and set `test_suite_count` to 107. The corpus bullet that previously claimed 151 tests now reads 107 to match the detector, because the 151 figure belonged to the pre-rewrite commit and could no longer be verified.
- **New corpus entries for `doubtless`:** architecture patterns for the React 19 and TypeScript streaming workspace and for citation anchors, five verified stack additions (React, TypeScript, Tailwind CSS, Vite, Vitest), and two new defensible bullets covering the frontend SSE workspace and the 12 Vitest suites with pre-commit gating and Docker packaging. All facts verified against `frontend/package.json`, `frontend/src/services/chatService.ts`, `frontend/src/components/chat/MarkdownContent.tsx`, and the `frontend/tests/` directory listing.

---

## 4. Evidence Mapping (JD Requirement to Resume Proof)

| JD Requirement | Resume Proof |
|---|---|
| Python and/or C#/.NET | LexoLegal `Munshi` assistant, 38 FastAPI endpoints, retrieval benchmark |
| React and TypeScript | `doubtless` React 19 workspace bullet and its project skills line |
| REST APIs and backend services | 38 asynchronous REST APIs over 12 PostgreSQL tables |
| SQL and databases | SQLAlchemy 2.0 over PostgreSQL, `SQLite FTS5` and ChromaDB in the benchmark |
| Generative AI and LLMs | Pydantic AI agents, RAG grounding, Streamed LLM output |
| RAG or AI agents (plus) | `ncert-rag-evals` fusion benchmark, `vectorless-rag` hit-rate comparison, MCP orchestration |
| Git | Pre-commit hooks gating commits in `doubtless` |
| OOP | Kotlin and Java Spring Boot services, MVI state flows, Clean Architecture |
| Projects demonstrating coding | Three commit-pinned repositories, each with measured results |
| Security and authorization judgment | University portal vulnerability discovery and responsible disclosure |

---

## 5. Known Gaps (Not Fabricated)

- **C#/.NET and Azure:** Icertis runs a Microsoft-centric platform. The candidate has no .NET or Azure experience, so neither appears anywhere in the resume, skills, or corpus. The JD's "and/or" clause permits the Python path, and the cover letter states the gap plainly instead of implying coverage.
- **Hand-authored HTML/CSS:** Styling evidence is Tailwind CSS at component level rather than bespoke stylesheets. Declared honestly as framework styling.
- **Test count nuance:** The 12 Vitest suites were counted statically from the frontend test directory and were not executed during this audit. Both the resume and corpus claim suite count only, never a pass rate.
- **Removed claim (v2 of this audit):** An earlier draft of the resume, cover letter, and outreach asserted ChromaDB retrieval with statute citations inside LexoLegal, plus a "hours to sub-2s" comparison. Neither is supported by `core/profile.yaml`, so both were deleted. The LexoLegal retrieval bullet was replaced with the verified HMAC-SHA256 webhook verification and OpenAPI schema work, and ChromaDB remains proven only through `ncert-rag-evals` and `vectorless-rag`.
- **Availability (confirmed by candidate):** Pune, on site five days a week, six months, with in-person interviews. The cover letter states this because the candidate confirmed it directly.

---

## 6. Remaining Manual Steps

- Submit through the Icertis careers portal against job identification 7861, attaching `resume.pdf` and `cover_letter.pdf`.
- Interviews are in person, work location Pune, five days a week, six-month tenure. Confirm availability dates before submitting.

---

## 7. Leadership Line Selection (Revision)

`core/profile.yaml` holds four leadership entries. The first draft used only the Generative AI teaching line. The resume now carries two, chosen for this JD:

1. **University portal vulnerability disclosure (authorization and authentication across a portal serving 500+ affiliated colleges).** Chosen because the hiring gap for this role is server-side authorization for semi-autonomous contract agents, and this is direct evidence of finding broken access control and reporting it rather than exploiting it.
2. **Generative AI speaker sessions for 150+ students.** Chosen because the posting asks for Generative AI and LLM familiarity plus teaching and communication ability.

Deliberately left out: the Smart India Hackathon organizing entry (20+ teams, 120+ participants) and the upstream fixes to a 4,000+ star repository. Both are real, but the page budget is spent on work experience, projects, and the two leadership lines above, and hackathon logistics say less about engineering judgment than the disclosure does.
