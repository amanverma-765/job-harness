# CLAUDE.md: Job Harness (Resume-as-Code & Autonomous Workflow Engine)

This repository implements a deterministic, Git-grounded **Resume-as-Code (RaC)** system. Resumes, cover letters, and outreach packages are treated as **compiled software artifacts**: factual state lives in structured YAML (`core/*.yaml`), styling is handled by a native Rust-based Typst engine (`core/templates/template.typ`), and continuous validation is enforced via automated Python linters (`engine/*`).

---

## 1. Candidate Identity & Immutable Ground Truth

- **Candidate Name:** Aman Verma
- **GitHub Profile:** `github.com/amanverma-765`
- **Candidate Location (STRICTLY IMMUTABLE):** `Jaunpur, UP, India`. Never alter or synthesize the candidate's home location to match a job posting's geography.
- **Single Source of Truth:**
  - `core/profile.yaml`: Contact info, degrees, academic records, and verified work tenures.
  - `core/projects_corpus.yaml`: Verified open-source and systems repositories, commit-pinned to exact Git SHAs with empirical metrics and test suite counts.
  - `core/skills_taxonomy.json`: Canonical O*NET/Lightcast skill ontology and explicit list of banned non-skills.
- **Zero Hallucination & Zero Exaggeration:** Never invent projects, frameworks, test suites, or performance metrics. Every metric and technology claim must be anchored in verified Git commit trees or candidate-confirmed facts.

---

## 2. Core Architectural Protocols & Quality Policies

### 2.1 The Jake's Resume Typst Standard
- **Presentation Engine:** `core/templates/template.typ` (adapted from Jake's Resume for Typst).
- **Single-Column Constraint:** Strict single-column layout only. Multi-column layouts interleave text streams during ATS extraction and are strictly prohibited.
- **Font & Margins:** Clean `Liberation Sans` (0 ligature drops, native UTF-8 CMap tables) with 0.4in–0.5in margins and US-Letter paper geometry.
- **Section Hierarchy (MANDATORY ORDER):**
  1. Header (Centered pure-text contact stream, zero icon glyphs)
  2. Technical Skills
  3. Work Experience
  4. Projects & Open Source
  5. Education (Strictly placed at the very bottom so recruiters evaluate engineering firepower and repositories first)

### 2.2 The 10.6x Requisition Title Multiplier
- ATS platforms run literal substring queries against applicant title fields.
- Extract the exact, literal job requisition title from the posting (e.g. `Senior Distributed Systems Engineer`, `AI/ML Engineering Intern`).
- Inject this exact title into:
  - The resume header subtitle (`target_title: "..."`).
  - The most recent role subtitle if functionally aligned.

### 2.3 The 4-Quadrant JD Extraction Matrix
Every ingested job description must be decomposed into four quadrants (`role_analysis.md`):
- **Quadrant I (Languages & Runtimes):** Core language tokens (Python, Go, Rust, C++, SQL).
- **Quadrant II (Infra, DB & Cloud):** Containerization, cloud providers, datastores (Docker, Kubernetes, AWS, PostgreSQL, Redis).
- **Quadrant III (Architecture):** Architectural patterns (Distributed Consensus, RAG, Event-Driven, Microservices).
- **Quadrant IV (Scale & SLAs):** Peak QPS, latency thresholds, dataset sizes, SLA bounds.

### 2.4 Hard Qualification Gate (< 50% Match Stop Rule)
- Before tailoring, compute match score: `(Matched_Essential_Skills / Total_Essential_Skills) * 100`.
- **If Match Score < 50% (or missing core prerequisite domains):**
  - **HALT PIPELINE IMMEDIATELY.** Do NOT generate a resume.
  - Report the gap clearly to prevent low-probability application spam.

### 2.5 The 1:1 Skill-to-Evidence Rule (Anti-Keyword Stuffing)
- Modern ATS parsers penalize ungrounded skills listed in summaries without proof in bullets.
- **Rule:** Every skill declared under `#skill_item(...)` MUST have at least one explicit reference proof inside an experience or project bullet point.

### 2.6 F-Pattern Keyword Bolding & Verb Diversity
- **F-Pattern Bolding:** Bold substantive technologies, frameworks, and impact metrics (`*Python*`, `*PostgreSQL*`, `*sub-25ms latency*`).
- **Banned Practice:** **NEVER bold the leading action verb** (`Architected`, `Engineered`, `Developed`). Bolding verbs causes visual fatigue and disrupts recruiter F-pattern scanning.
- **Verb Diversity:** No lead action verb may be repeated more than **two times** across the entire resume.
- **Google XYZ Formula:** Every bullet must follow `[Strong Action Verb] + [Technical What] + [Stack] + [Scale/Impact (Google XYZ)]`.

### 2.7 Global Zero Em-Dash Rule (STRICT)
- **Zero em-dashes (`---` or `—`) are permitted anywhere in any document** (resumes, cover letters, markdown reports, outreach).
- Replace with commas, colons, semicolons, or parentheses. In Typst/LaTeX, use standard en-dashes (`--`) solely for number and date ranges (`2021 -- 2025`).

### 2.8 Strict 1-Page PDF Budget
- Resumes and cover letters must fit on **exactly 1 page** (`pdfinfo <file>.pdf | grep "Pages: 1"`).

### 2.9 Two-Tier Target Hierarchy
- Structure all application workspaces as: `targets/<company>/<role-slug>/`.
- `targets/<company>/company_research.md` is shared across multiple role openings at the same firm to prevent redundant web scraping.
- Role-specific artifacts (`job_description.md`, `role_analysis.md`, `resume.typ`, `resume.pdf`, `cover_letter.pdf`, `outreach.md`, `audit_report.md`) remain completely isolated.

---

## 3. Outbound Documents Standards

### 3.1 Cover Letters (`core/templates/cover_letter_base.typ`)
- **Word Count:** Strictly between **250 and 350 words**.
- **Structure:** Exactly **4 concise paragraphs**:
  1. *Opening Hook (2–3 sentences):* Specific company engineering insight or recent architectural shift. Never start with *"I am writing to apply"* and never start the first sentence with *"I"*.
  2. *Direct Technical Match (3–4 sentences):* Links candidate's commit-pinned repos (`doubtless`, `ncert-rag-evals`, `LexoLegal`) directly to the company's primary requirement.
  3. *Systems Rigor & Benchmarks (3–4 sentences):* Statistical testing, latency benchmarks, or MLOps depth.
  4. *Confident Close & Logistics (2–3 sentences):* Explicit availability, remote/in-office status, confident call to action.
- **Formatting:** 0.8in margins, F-pattern keyword bolding, zero em-dashes, strictly 1 page.

### 3.2 Peer-to-Peer Cold Outreach (`outreach.md`)
- **Tone:** Engineer speaking to engineer about an interesting systems bottleneck or unassigned bug. Zero generic flattery.
- **Body Budget:** Strictly **<= 120 words**.
- **Subject Line:** Strictly **<= 7 words** referencing the specific technical gap.
- **Attachments:** Zero attachments on Email 1.
- **Deliverables:** Includes a 2-line Day 5 follow-up draft and a 1-weekend MVP demo specification.

---

## 4. Deterministic Engine & Linters

Always verify generated documents using the native engine scripts:

```bash
# 1. Compile Typst document and assert exact 1-page budget
bash engine/compile.sh <path/to/doc.typ> [output.pdf]

# 2. Run AST/Regex 5-Gate & 1:1 Skill Proof linter
python3 engine/verify_resume.py <path/to/resume.typ> --corpus core/projects_corpus.yaml

# 3. Verify linear text stream extraction, CMap purity, and contact fields
python3 engine/pdftotext_linter.py <path/to/resume.pdf>

# 4. Re-index candidate repository with latest Git commit SHA via repomix
python3 engine/repomix_indexer.py <owner/repo> [--domain <domain>]
```

---

## 5. Slash Commands Suite (`.claude/commands/`)

When executing user commands, follow the explicit workflows defined in `.claude/commands/`:

- **`/job:onboard [github-user]`**: Bootstraps candidate facts, connects GitHub org, indexes repositories.
- **`/job:sync-kb [repo-name]`**: Inspects remote Git HEADs, updates commit SHAs, refreshes repomix facts.
- **`/job:ingest <url-or-text>`**: Builds 4-Quadrant Matrix, extracts 10.6x title, checks Hard Qualification Gate.
- **`/job:research <company> [role]`**: Gathers 3-phase intelligence, ranks hiring gaps by `(Fit x Impact) / Effort`, caches result.
- **`/job:tailor <company>/<role>`**: Synthesizes Jake's Typst resume, applies 1:1 proof rule, and compiles 1-page PDF.
- **`/job:audit <company>/<role>`**: Runs deterministic AST linters and adversarial commit-tree verification.
- **`/job:cover-letter <company>/<role>`**: Generates 4-paragraph Typst cover letter (250–350w, 0 em-dashes).
- **`/job:outreach <company>/<role>`**: Drafts <=120-word cold email + 1-weekend MVP demo spec.
- **`/job:apply <url-or-text>`**: Master pipeline coordinating the full application lifecycle with human review gates.

---

## 6. Agent Skills & Issue Tracker Configuration

### Issue tracker
GitHub issues accessed via the `gh` CLI. See `docs/agents/issue-tracker.md`.

### Triage labels
Canonical 5-role triage label vocabulary (`needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`). See `docs/agents/triage-labels.md`.

### Domain docs
Single-context layout (`GLOSSARY.md` + `docs/adr/` at the repo root). See `docs/agents/domain.md`.
