# Audit Report: iion, AI Engineering Intern

Date: 2026-11-22
Artifacts audited: `targets/iion/ai-engineer-intern/resume.typ`, `resume.yaml`, `resume.pdf`, `cover_letter.typ`, `cover_letter.pdf`, `outreach.md`

## Layer 1: Deterministic Engine Verification

### `engine/verify_resume.py` (5 Gates + 1:1 skill proof)

```
Bullets checked: 16
Skill groups checked: 6
[+] PASSED: 0 errors detected across all 5 Quality Gates.
```

- Gate 1 (non-skills ban): 6 categories, dedicated `Languages & Core` present.
- Gate 2 (defensibility): no unbatched real-time SLA claims; every latency tied to a measured artifact.
- Gate 4 (fluff, verbs, bolding): 0 weak verbs, 0 hyperbole, 0 bolded lead verbs, no lead verb above 2 uses.
- Gate 5 (branding, em-dashes): 0 em-dashes, canonical `GitHub` / `PostgreSQL`.
- 1:1 skill proof: 25 unique skills declared, 0 unproven.

### `engine/pdftotext_linter.py`

```
Extracted lines: 54
Character count: 5242
[+] PASSED: 100% linear text extraction and CMap integrity confirmed.
```

### `engine/verify_research_compliance.py`

```
AUDIT RESULT: 34 / 34 CHECKS PASSED
STATUS: 100% COMPLIANT WITH ALL ATS RESEARCH SPECIFICATIONS
```

Includes: contact in primary stream, single-column order, canonical headings, 3-letter month dates, title multiplier in header, immutable experience titles, 4-Quadrant role_analysis, Hard Qualification Gate sign-off, keyword density 25, cover letter 1 page / 328 words / 0 em-dashes, outreach subject 6 words.

### `engine/compile.sh`

- Resume: `[+] PASSED: Exact 1-page budget verified.` (spacing `line_gap 0.84em`, `section_gap 0.98em`, `header_gap 1.28em`, scaled together per §2.10).
- Cover letter: `[+] PASSED: Exact 1-page budget verified.`

## Layer 2: Visual Layout Inspection

Rendered `.scratch/debug/resume_visual-1.png` (single page) and inspected:

- Zero text collisions between role/company lines and date/location right column.
- Education block: university and degree on separate lines, dates right-aligned, no wrap.
- Project headers: name and stack on the left, GitHub link right-aligned, no overlap.
- Vertical fill: content ends inside the bottom margin with roughly half an inch of trailing whitespace, no dead band, no overflow to page 2.
- F-pattern bolding lands on technologies and metrics (`sub-2s latency`, `99.8%`, `86.9% Recall@5 in 8.9ms on CPU`, `p = 0.0021`), never on leading verbs.

## Layer 3: Adversarial Claim Audit

Every numeric and architectural claim was traced to `core/profile.yaml` or `core/projects_corpus.yaml` (commit-pinned).

| Claim in resume | Source | Verdict |
|---|---|---|
| `Munshi` WhatsApp legal assistant, Pydantic AI + FastAPI, MCP over Drive/Calendar, sub-2s latency | `core/profile.yaml` LexoLegal highlights 3 | Supported |
| Identity inside `AgentDeps` rather than LLM tool parameters, cross-tenant prompt injection blocked, bounded sandboxed tools | `core/profile.yaml` LexoLegal highlight 5 | Supported |
| 38 async REST APIs, SQLAlchemy 2.0, 12 PostgreSQL tables, JWT, RFC 9457, Alembic, 1,024 pytest tests | `core/profile.yaml` LexoLegal highlight 4 | Supported |
| 12-hour refresh sweep, Celery + Redis, diffing, atomic locks, 10s countdown, 90-retry ceiling, zero duplicate alerts | `core/profile.yaml` LexoLegal highlights 2 and 6 (merged, no new facts) | Supported |
| doubtless: 45s playback windows, SSE streaming, 4-stage PipelineRunner, 16kHz mono `<15MB/hr`, `<10s` Groq Whisper-Large-V3 | `core/projects_corpus.yaml` `doubtless` bullets 1 and 3 | Supported |
| doubtless: SQLite WAL repositories, Docker images, OpenTelemetry/Logfire tracing, 107 pytest tests, Git pre-commit hooks | `core/projects_corpus.yaml` `doubtless` bullets 2 and 4 (`test_suite_count: 107`) | Supported |
| ncert-rag-evals: 17 textbooks, 8 strategies, SQLite FTS5 + ChromaDB, RRF, 86.9% Recall@5 in 8.9ms, 99.8% cut, 4,429 chunks, McNemar p = 0.0021, 92 tests | `core/projects_corpus.yaml` `ncert-rag-evals` bullets 1-3 and benchmarks | Supported |
| vectorless-rag: 18 queries, Ollama local testbed, 2.7x token cost, 2x latency, 100% hit rate, 0.85 citation precision, `<200MB`, 40% latency cut, PyMuPDF | `core/projects_corpus.yaml` `vectorless-rag` bullets 1-3 | Supported |
| Leadership: 3 sessions, 150+ students; 4,000+ star repo; SIH 2 editions, 20+ teams, 120+ participants | `core/profile.yaml` leadership | Supported |

Adversarial findings: none. No invented framework, test count, or benchmark. The one merge (Redis locks + 12-hour sweep) combines two verified profile highlights without adding a metric. `LlamaIndex` appears only as the abstraction deliberately not used in nbench-rag-evals, matching the corpus wording.

## Residual Risks and Deliberate Omissions

1. **Preferred-but-unproven skills omitted:** LangSmith, Langfuse deployment, LangChain, LangGraph, CrewAI. User confirmed omission (2026-11-22) rather than synthesis. Submission covers these areas with Pydantic AI, MCP, Logfire and OpenTelemetry, which are commit-verified.
2. **No adtech (OpenRTB/Prebid) exposure:** first-party knowledge only, not claimed anywhere in the documents.
3. **YAML schema lint noise:** the editor applies the generic JSON Resume schema to `resume.yaml`, so `personal`, `spacing`, `experience`, `leadership` are reported as "not allowed" and long bullet strings trip an 80-column rule. The repo's own `core/templates/resume_ai.yaml` uses the identical shape and line style, so this is a mis-scoped schema, not a defect. Deterministic gates accept the file.

## Sign-Off

0 issues detected across deterministic gates, text-stream extraction, visual layout, and adversarial claim verification. Package approved.
