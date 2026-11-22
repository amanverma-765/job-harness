# Audit Report - Elip AI, Software Engineer Intern (AI Agents & Search)

**Audit date:** November 22, 2026
**Target:** `targets/elip/software-engineer-intern-ai-agents/`
**Verdict:** PASS. 33 / 33 deterministic checks passed.

---

## 1. Deterministic Engine Results

| Gate | Command | Result |
|---|---|---|
| Compile + 1-page budget | `bash engine/compile.sh resume.typ resume.pdf` | PASS, exactly 1 page |
| AST/Regex 5-gate + 1:1 skill proof | `python3 engine/verify_resume.py resume.typ --corpus core/projects_corpus.yaml` | PASS, 0 errors |
| Text stream + CMap purity | `python3 engine/pdftotext_linter.py resume.pdf` | PASS, 100% linear extraction |
| Full research compliance | `python3 engine/verify_research_compliance.py targets/elip/software-engineer-intern-ai-agents` | PASS, 33/33 |
| Visual render | `engine/visual_verify.py` | PASS, 1275x1650 single page |

Density: **567 words**, **18 bullet entries** (15 content bullets plus 3 project skill lines), `line_gap 0.82em`, `section_gap 0.98em`, `header_gap 1.28em`. Inside the 600-word / 18-bullet ceiling with the spacing floor respected.

---

## 2. Commit-Tree Verification

Every claim on the resume traces to a pinned commit in `core/projects_corpus.yaml`.

| Project | Pinned SHA | Claims carried into this resume |
|---|---|---|
| `ncert-rag-evals` | `a7d1e24c0a861d7a9c3e1d9de648b8805abae264` | 4,429 section-aware chunks, SQLite FTS5 + ChromaDB, RRF, 86.9% Recall@5 at 8.9ms CPU, 99.8% latency cut, 92-test substantiality gate, McNemar p = 0.0021 |
| `doubtless` | `9f82d1c7429be19001153a81f3e7289f6d7ab431` | Pydantic AI + MCP, SSE token streaming, Celery/Redis four-stage pipeline, 151 passing tests |
| `vectorless-rag` | `c3b1741a5e44aa403de276dbd70a92be1b271135` | 100% vs 93% hit rate, 0.85 vs 0.69 citation precision, 2.7x token cost, 2x latency |
| `LexoLegal` (profile ground truth) | `core/profile.yaml` | Munshi WhatsApp assistant, 38 FastAPI endpoints, 12 PostgreSQL tables, sub-2s latency, 1,024 pytest tests |

Not a single metric appears that is absent from the corpus. No invented companies, no invented test counts, no synthesized frameworks.

---

## 3. Title and Sanitization Record

| Field | Value |
|---|---|
| Raw posting string | "Software Engineer" with recruiter noise: "(6 months, PPO opportunity)", "Rs 75k a month", location and modality tags |
| Sanitized target title | **Software Engineer Intern** (header reads `SOFTWARE ENGINEER INTERN`) |
| Where injected | Resume header subtitle only (`target_title`) |
| Work experience titles | Untouched: "Software Development Engineer Intern" (LexoLegal), "Freelance Developer" (independent consulting) |

The 10.6x multiplier was not applied to any employment title.

---

## 4. Honesty Flags Carried Forward

1. **No recommender or personalisation claim anywhere.** Elip screens for "built a recommender or search system end to end". The candidate has search (`ncert-rag-evals`), retrieval fusion (`vectorless-rag`), and agent orchestration (`Munshi`), but no learned ranking model, so the resume claims none. The "Good to have" line is answered by retrieval plus evals plus a live repo, not by manufacturing a recommender story.
2. **LLM evals depth is real but single-corpus.** The 92-test McNemar gate is one ablation over one academic corpus. The resume presents the method and the number without claiming a multi-domain eval suite.
3. **Internship framing is accurate.** Three-month LexoLegal tenure, 0.8-month freelance consulting, and a 2026 B.Tech graduation date all read as early-career. No seniority inflation.
4. **Gurugram relocation is a stated intent, not an established fact.** Home location on the letterhead remains Jaunpur, UP, India. Relocation willingness appears only in the cover letter and outreach.

---

## 5. Risk Register

| Risk | Severity | Mitigation already in place |
|---|---|---|
| Company is a 4-person seed startup; hiring may be founder-discretionary with high variance | High | Outreach targets the founder directly with a measured repo link, not a generic application |
| Interview is a "built-something" conversation, not a LeetCode round | Medium | `ncert-rag-evals` and `doubtless` are both walkable end to end, with benchmarks the candidate can defend |
| JD asks for personalisation and ranking; candidate resume shows retrieval and evals | Medium | Gaps are declared in `role_analysis.md` Section 6 rather than papered over |
| Applied position is internship with conversion, below a full-time SWE bar | Low | Correctly titled as internship; no mismatch between role and resume claims |

---

## 6. Artifact Inventory

| Artifact | Status |
|---|---|
| `job_description.md` | Present, verbatim plus YC role context |
| `role_analysis.md` | Present, 4-quadrant matrix, gate at 88%, gaps ranked |
| `resume.typ` / `resume.pdf` | Present, 1 page, all gates passed |
| `cover_letter.typ` / `cover_letter.pdf` | Present, 350 words, 4 paragraphs, 1 page |
| `outreach.md` | Present, 100-word body, 6-word subject, Day 5 follow-up, MVP spec |
| `audit_report.md` | This document |
| `targets/elip/company_research.md` | Present, shared across Elip openings |

Nothing in this package was generated without a source: every bullet traces to a commit or a candidate-confirmed fact, and every outbound claim traces to a file in this workspace.
