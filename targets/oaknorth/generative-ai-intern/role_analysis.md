# Role Analysis: OakNorth - Intern - Gen AI

**Target:** `targets/oaknorth/generative-ai-intern/`
**Analysed:** 2026-11-22
**Employee type:** Internship, Hybrid, Gurugram
**Team:** Management Support (leadership support function: financial tracking, expense management, business research)

---

## 1. Title Sanitization (10.6x Requisition Multiplier)

| Stage | Value |
|---|---|
| Raw portal string | `Intern - Gen AI` |
| Recruiter / req metadata | none present |
| Acronym expansion | `Gen AI` -> `Generative AI` |
| Employment type noun | `Intern` already present |
| **Final header title** | **`Generative AI Intern`** |

No domain, team, or track qualifier is appended. `Management Support` stays in the body, never in the header.

## 2. Four-Quadrant JD Extraction Matrix

### Quadrant I: Languages & Runtimes
- Python (explicit)
- VBA (explicit, alternative to Python)
- Excel formula layer (lookup functions, pivot tables implied by tracker/dashboard work)
- GenAI platform usage: Claude, ChatGPT (and Notion as a productivity platform)

### Quadrant II: Infrastructure, Databases & Cloud
- No cloud, container, or datastore requirement stated.
- Tooling layer: Excel workbooks as the incumbent system of record, Notion for documentation, internal dashboards and trackers.
- Presentation surfaces: dashboards, trackers, interfaces built for non-technical colleagues.

### Quadrant III: Architectural Patterns
- Workflow audit: decompose a manual process, find the automation boundary, rebuild it
- Iterative delivery with the end user in the loop (translate pain points into technical requirements)
- Grounded AI usage: judgement about where GenAI adds genuine value versus where it does not
- Instrumentation: document tools, monitor usage, measure time and effort saved
- Human-in-the-loop review of agent output

### Quadrant IV: Scale & SLAs
- No QPS, latency, or dataset-size SLA stated.
- Implicit scale: firmwide expense and financial tracking across UK, US and India entities; leadership-facing reporting cadence; cumulative hours of manual effort removed.

## 3. Hard Qualification Gate

Match Score = (Matched_Essential_Skills / Total_Essential_Skills) * 100

| # | Essential Requirement | Evidence | Verdict |
|---|---|---|---|
| 1 | Strong Excel proficiency, building not just using | Candidate-confirmed 2026-11-22 at formula and pivot-table level. No concrete workbook example was supplied, so "strong" is unproven | PARTIAL |
| 2 | Working knowledge of Python and/or VBA | `core/profile.yaml` (Python), `core/projects_corpus.yaml` (ncert-rag-evals, doubtless, vectorless-rag), LexoLegal Python API work | MATCHED (Python branch) |
| 3 | Hands-on GenAI tools (Claude, ChatGPT or similar) | Candidate-confirmed 2026-11-22: daily Claude and ChatGPT use; Pydantic AI, MCP, Ollama in `core/projects_corpus.yaml` | MATCHED |
| 4 | Written communication and research synthesis | Benchmark notebooks and analysis charts (ncert-rag-evals, vectorless-rag), 3 public technical sessions on LLM fundamentals for 150+ students (`core/profile.yaml` leadership) | MATCHED |
| 5 | Systems mindset, independent follow-through | Idempotent refresh engine and dedup notification pipeline at LexoLegal; 4-stage ingestion pipeline in doubtless | MATCHED |

**Match Score: 80% (4/5 essentials fully matched; requirement 1 counted as partial, not matched, because no workbook example was produced).**

**Hard Qualification Gate: PASSED** at 80% against the 50% floor. No non-negotiable domain is missing, but the Excel requirement is the weakest link and is reported as such.

### Secondary gaps (non-blocking)
- **VBA macros:** not evidenced. Requirement is `Python and/or VBA`, so the Python branch satisfies it. Do not claim VBA.
- **Notion:** listed as nice-to-have only. Not evidenced, therefore not claimed.
- **Excel depth:** candidate-confirmed at formula and pivot-table level, which is below the posting's "building, not just using" bar. No workbook example was supplied. It is stated as a capability, never quantified, and never used to claim financial modelling or VBA.

### Consequence for resume design
The 1:1 skill-to-evidence rule (CLAUDE.md 2.5) allows a skill under `Technical Skills` only when an experience or project bullet proves it. Excel and Notion have no commit-anchored bullet, so they are carried in the cover letter narrative and in the audit report, not the skills block. The resume leads with Python automation, applied LLM engineering, and measured research work, which is the transferable core of this role.

## 4. Tailoring Strategy

1. **Order:** Work Experience first (candidate has production experience), then Projects, Skills, Leadership, Education last.
2. **Reframe emphasis:** every bullet answers one of the five JD duties (audit, build tools, research, iterate with users, instrument usage).
3. **LexoLegal (production automation):** the Munshi agent (GenAI that replaced manual document discovery and scheduling), the scheduled refresh sweep (idempotent diffing, zero duplicate alerts), the API surface, and the eCourts ingestion work (data acquisition across 25 High Courts and 743 District Courts).
4. **Webxela (research automation):** the trademark monitoring engine (25 parallel workers, 5,000-record chunks) maps directly to recurring business and market research, and the resilient ingestion pipelines map to reliability of automated data collection.
5. **Projects:** `ncert-rag-evals` for measurement and statistical rigor, `doubtless` for an end-to-end applied GenAI product, `vectorless-rag` for cost/latency trade-off analysis presented as charts.
6. **Non-negotiable:** no Android, KMP, or mobile positioning in the header or lead bullets. Mobile stack stays only where it is the honest record of the work.
