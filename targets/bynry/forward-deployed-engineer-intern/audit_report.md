# Audit Report: Bynry - Forward Deployed Engineer Intern

- Audit date: 2026-11-22
- Target: `targets/bynry/forward-deployed-engineer-intern/`
- Verifier runs:
  - `bash engine/compile.sh ... resume.typ` -> 1 page, PASSED
  - `python3 engine/verify_resume.py ... resume.typ --corpus core/projects_corpus.yaml` -> 0 errors, 5 Gates PASSED
  - `python3 engine/pdftotext_linter.py ... resume.pdf` -> linear extraction and CMap integrity PASSED
  - `python3 engine/verify_research_compliance.py targets/bynry/forward-deployed-engineer-intern` -> 34 / 34 CHECKS PASSED
  - Visual render inspected: `.scratch/debug/resume_visual-1.png`, no overlap, single column, bottom margin respected

## Vertical Calibration

- `line_gap: 0.85em` produced a second page holding only the Education block, so content
  budget, not spacing, was the binding constraint.
- Removed the fifth `doubtless` bullet (SQLite WAL data layer) and folded its verified
  OpenTelemetry/Logfire tracing claim into the ingestion-pipeline bullet. This dropped one
  bullet and three lines without losing a single grounded fact.
- Final spacing: `line_gap: 0.70em`, `section_gap: 0.80em`, `header_gap: 1.10em`.
  `line_gap` sits above the `0.68em` floor. The rendered page fills to the bottom margin
  with no dead space, so no further expansion was possible without spilling.
- Total bullets: 14 (limit 18). Experience 4, `doubtless` 4, `ncert-rag-evals` 3,
  `vectorless-rag` 3.

## Adversarial Commit-Tree Verification

| Claim in document | Corpus source | Verdict |
|---|---|---|
| 38 REST APIs, 12 PostgreSQL tables, 1,024 pytest tests | `core/profile.yaml` LexoLegal highlight 4 | VERIFIED |
| 12-hour refresh sweep in Celery and Redis, idempotent diffing, zero duplicate alerts | LexoLegal highlight 2 and 6 | VERIFIED |
| Munshi agent in Pydantic AI and FastAPI with MCP clients, sub-2s latency | LexoLegal highlight 3 | VERIFIED |
| eCourts protocol reverse engineering, AES-128-CBC, 25 High Courts, 743 District Courts | LexoLegal highlight 7 | VERIFIED |
| `doubtless`: SSE, React 19 and TypeScript UI, 4-stage Celery pipeline, Groq Whisper, 12 Vitest suites, Docker | `core/projects_corpus.yaml` id `doubtless`, SHA `2e17ad9462d8e1a96f46803f2b219e93c65db0e5` | VERIFIED |
| `ncert-rag-evals`: 17 textbooks, 4,429 chunks, 86.9% Recall@5 at 8.9ms, McNemar p = 0.0021, 92 tests | id `ncert-rag-evals`, SHA `a7d1e24c0a861d7a9c3e1d9de648b8805abae264` | VERIFIED |
| `vectorless-rag`: 18 queries, 100% hit rate, 0.85 citation precision, 2.7x token cost, 2x latency, under 200MB | id `vectorless-rag`, SHA `c3b1741a5e44aa403de276dbd70a92be1b271135` | VERIFIED |
| 1,024 pytest tests (LexoLegal) | profile highlight 4 | VERIFIED |

No metric, framework, or customer claim in the document lacks a `core/` source.

## Deliberate Exclusions (Zero Hallucination)

- **AWS / Google Cloud:** preferred only, zero verified evidence. Not claimed anywhere.
- **Django / Node.js:** not in `core/`. Not claimed.
- **Playwright:** user confirmed real unindexed experience, but no commit-pinned bullet
  supports it, and the 1:1 skill-to-evidence rule forbids listing an unproven skill.
  Excluded from the document. To include it later, add a Playwright-backed test suite to a
  public repo and re-sync the corpus.
- **Postman, Bash, Linux, uv, Ruff:** present in `core/profile.yaml` tooling lists but with
  no bullet proof, so omitted from Technical Skills.
- **Customer workshops, UAT ownership, production on-call, utility domain knowledge:** not
  claimed. The cover letter speaks to the posting's own 20-24 week go-live model rather
  than to experience the candidate does not have.
- **Android / KMP / Compose work:** real but off-target for this requisition and excluded to
  protect bullet budget.

## Immutability Checks

- `target_title`: `Forward Deployed Engineer Intern` (bare, no domain or team suffix, no
  job ID, no modality tag).
- Experience title unchanged: `Software Development Engineer Intern` at LexoLegal, verbatim
  from `core/profile.yaml`.
- Location unchanged: `Jaunpur, UP, India`.

## Residual Risks

1. **Domain gap.** No utility billing, meter-to-cash, or account-hierarchy exposure. This is
   the honest weakness and it is visible to any reviewer who knows the domain.
2. **Relocation dependency.** Pune hybrid requires moving from Jaunpur. The cover letter
   states readiness to relocate, per user confirmation, so this must remain true at
   interview time.
3. **Stipend.** INR 10,000/month for 6 to 9 months is below market for the technical scope.
4. **Cover-letter claim scope.** The letter states immediate availability and readiness to
   relocate to Pune, both user-confirmed. It deliberately makes no tenure-duration claim
   (Nov 2025 - Jul 2026 is the recorded window, not a completed seven months) and no
   notice-period claim.
4. **YAML editor noise.** The repo's YAML language server applies a generic JSON Resume
   schema to `resume.yaml` and flags `personal`, `spacing`, `experience`, `leadership` as
   unknown properties. `core/templates/resume_ai.yaml` uses the identical shape, so these
   are schema false positives, not data defects. Line-length warnings are also editor
   defaults and are not enforced by any engine script.
