# Job Harness: Resume-as-Code (RaC) & Autonomous Job Workflow Engine

> **A deterministic, Git-grounded, multi-gate recruitment automation system built for modern Applicant Tracking Systems (ATS) and high-velocity engineering hiring.**

[![Typst Engine](https://img.shields.io/badge/Typesetting-Typst%200.15+-blue?style=flat-square&logo=typst)](https://typst.app)
[![Python Linter](https://img.shields.io/badge/Linter-Python%203%20Stdlib-green?style=flat-square&logo=python)](https://python.org)
[![ATS Compliant](https://img.shields.io/badge/ATS%20Standard-Single--Column%20Vector%20PDF-brightgreen?style=flat-square)](https://poppler.freedesktop.org)
[![Zero Em-Dash](https://img.shields.io/badge/Syntax%20Rule-Zero%20Em--Dashes-red?style=flat-square)](#the-global-zero-em-dash-rule)

---

## 1. Executive Summary & Core Philosophy

Modern technical recruitment operates as a **dual-consumer screening pipeline**:

1. **Algorithmic Retrieval Layer (Enterprise ATS):**  
   Platforms such as **Workday**, **Greenhouse**, **Ashby**, and **Lever** ingest resumes via spatial layout extractors (Sovren, Textkernel, Apache Tika, Poppler). They construct 2D bounding boxes, tokenize character streams, and map terms against enterprise skills graphs (e.g., Workday's 50,000-entity ontology) using BM25 and Elasticsearch inverted indexes.
   - *Failure Modes:* Multi-column layouts interleave text streams into corrupted sentences; LaTeX font ligatures drop during ToUnicode CMap extraction; skills listed without supporting context trigger keyword-stuffing penalties.
2. **Human Triage Layer (Recruiter 6–15 Second Review):**  
   Recruiters review candidates in high-volume triage queues, scanning in an **F-pattern**: *Target Title $\to$ Company Scale $\to$ Tech Stack $\to$ Quantitative Metrics*. If fit cannot be verified in 6 seconds, the profile is dispositioned.

This repository implements **Resume-as-Code (RaC)**. It eliminates manual tailoring drift, marketing hyperbole, and synthetic hallucination by treating resumes, cover letters, and outreach packages as **compiled software artifacts**:

```
+-----------------------------------------------------------------------------------------+
|                              RESUME-AS-CODE (RaC) PIPELINE                              |
|                                                                                         |
|  [Factual Data Layer]                                                                   |
|    - core/profile.yaml          : Immutable candidate facts, contact, degrees           |
|    - core/projects_corpus.yaml  : Commit-pinned repository architectures & metrics     |
|    - core/skills_taxonomy.json  : Canonical O*NET/Lightcast skills ontology mapping     |
|                                                                                         |
|  [Deterministic Layout Engine]                                                          |
|    - core/templates/template.typ: Jake's Resume Typst engine (single-column, 0 ligatures)|
|                                                                                         |
|  [Automated CI/CD Validation Harness]                                                   |
|    - engine/verify_resume.py    : 5 Quality Gates, 1:1 Proof Rule, Zero Em-Dashes       |
|    - engine/pdftotext_linter.py : Linear stream reading order & CMap purity check       |
|    - engine/compile.sh          : Sub-50ms Typst build & strict 1-page budget guard     |
|                                                                                         |
|  [Target Workspaces]                                                                    |
|    - targets/<company>/<role>/  : Fully isolated tailored PDF, Typst, and audit outputs |
+-----------------------------------------------------------------------------------------+
```

---

## 2. Key Architectural Tenets

### 2.1 Commit-Pinned Ground Truth (Zero Hallucination)
Every project achievement, framework, benchmark, and test count in `core/projects_corpus.yaml` is anchored to a verified **Git commit SHA** indexed via `gh` and `repomix`. The system strictly prohibits synthesizing unverified experience.

### 2.2 The 10.6x Requisition Title Multiplier
ATS search bars execute literal substring matching (e.g. `WHERE parsed_title ILIKE '%Senior Backend Engineer%'`). The system extracts the exact target requisition title during ingestion and injects it into the resume header and recent role subtitle, maximizing search visibility.

### 2.3 The 4-Quadrant Job Description Decomposition Matrix
Every incoming job posting is parsed into four structured quadrants:
- **Quadrant I (Languages & Runtimes):** Primary language tokens (e.g. Python, Go, Rust, C++).
- **Quadrant II (Infra, DB & Cloud):** Containerization, cloud providers, datastores (e.g. Docker, AWS, PostgreSQL, Redis).
- **Quadrant III (Architecture):** Distributed consensus, RAG, event-driven queues, microservices.
- **Quadrant IV (Scale & SLAs):** Peak QPS, latency thresholds, dataset sizes, SLA bounds.

### 2.4 Hard Qualification Gate (< 50% Match Stop Rule)
If a target role aligns with less than 50% of the candidate's verified essential ground truth, **the pipeline halts immediately**. No resume is generated. This stops low-probability application spam and preserves candidate focus.

### 2.5 The 1:1 Skill-to-Evidence Rule
Modern ATS heuristic parsers penalize ungrounded skill claims. **Every skill declared in the Technical Skills section must have corresponding reference proof inside the Work Experience or Projects bullet points.** Any orphan skill is flagged as a keyword-stuffing risk.

### 2.6 Two-Tier Workspace Hierarchy
Applications are organized into `targets/<company>/<role-slug>/`. Company-level intelligence (`company_research.md`) is shared across multiple openings at the same firm, preventing redundant web scraping and token expenditure.

### 2.7 The Global Zero Em-Dash Rule
Em-dashes (`---` or `—`) cause character-tokenization anomalies in older parsers, disrupt visual hierarchy, and introduce ATS parsing traps. **All em-dashes are banned across all generated resumes, cover letters, and outreach files.** They are replaced with commas, colons, semicolons, or en-dashes (`--`) for number and date ranges.

---

## 3. Directory Layout

```
job-workflow/
├── GLOSSARY.md                        # Formal domain definitions (RaC, Gates 1-5, F-pattern)
│
├── core/                              # Candidate Single Source of Truth
│   ├── profile.yaml                   # Candidate info, tenures, education, immutable contact
│   ├── projects_corpus.yaml           # Pinned commit SHAs, verified metrics & architectures
│   ├── skills_taxonomy.json           # Canonical O*NET/Lightcast skills & banned non-skills
│   └── templates/
│       ├── template.typ               # Jake's Resume Typst engine (single-column, 0 ligature loss)
│       ├── yml.typ                    # Dynamic YAML-to-Typst layout engine & renderer
│       ├── resume_android.typ         # Android/KMP archetype (Header -> Exp -> Proj -> Skills -> Edu)
│       ├── resume_ai.typ              # AI/ML/Systems archetype (Header -> Exp -> Proj -> Skills -> Edu)
│       ├── cover_letter_base.typ      # 1-page Typst business letterhead (0.8in margins)
│       └── sample_cover_letter.typ    # Reference 4-paragraph cover letter implementation
│
├── engine/                            # Deterministic Verification & Build Tooling
│   ├── compile.sh                     # Typst compiler wrapper + pdfinfo exact 1-page check
│   ├── verify_resume.py               # AST/regex auditor: Gates 1–5, 1:1 proof rule, zero em-dashes
│   ├── pdftotext_linter.py            # Stream extraction, CMap & single-column flow validator
│   └── repomix_indexer.py             # Automates repomix, pulls git commit SHA, updates corpus
│
├── .claude/
│   ├── commands/                      # Shareable Slash Commands (Workflow UI)
│   │   ├── job:onboard.md             # Interactive profile intake & GitHub repo indexing
│   │   ├── job:sync-kb.md             # Incremental repomix re-indexing with pinned commits
│   │   ├── job:ingest.md              # 4-Quadrant JD extraction & 50% qualification gate
│   │   ├── job:research.md            # 3-phase company intelligence with 2-tier caching
│   │   ├── job:tailor.md              # Jake's Typst resume synthesis & 1:1 proof resolution
│   │   ├── job:audit.md               # 2-layer audit (Python linters + Adversarial skeptic)
│   │   ├── job:cover-letter.md        # 4-paragraph gap-matched Typst cover letter (250–350w)
│   │   ├── job:outreach.md            # Cold outreach email (<=120w) + 1-weekend MVP spec
│   │   └── job:apply.md               # Master orchestrator with human review checkpoints
│   │
│   └── skills/                        # Specialized Resume & Research Skills
│       ├── resume-authenticity-audit/ # Gates 1–5 compliance logic
│       ├── job-description-analyzer/  # 4-Quadrant parser & qualification gates
│       ├── cover-letter-generator/    # 4-paragraph hook-match-rigor-close model
│       ├── cold-email-writer/         # Peer-to-peer cold email rules & MVP spec
│       ├── tech-resume-optimizer/     # Google XYZ formula & verb diversity rules
│       ├── resume-ats-optimizer/      # Layout, taxonomy, and single-column flow
│       └── company-research/          # 3-phase company intelligence methodology
│
├── targets/                           # Application Workspace State Machine
│   └── <company>/                     # Company-Level Cache
│       ├── company_research.md        # Shared tech stack, culture, roadmaps, leadership
│       └── <role-slug>/               # Role-Specific Workspace (Isolated)
│           ├── job_description.md    # Raw ingested job description
│           ├── role_analysis.md      # 4-Quadrant Matrix & qualification score
│           ├── resume.typ             # Tailored Jake's Typst source
│           ├── resume.pdf             # Compiled 1-page vector PDF
│           ├── cover_letter.typ       # Tailored Typst cover letter (250–350 words)
│           ├── cover_letter.pdf       # Compiled 1-page cover letter PDF
│           ├── outreach.md            # <=120-word cold email + 1-weekend MVP spec
│           └── audit_report.md        # 0-defect verification sign-off
```

---

## 4. The 5 Deterministic Quality Gates

Every resume must pass `engine/verify_resume.py` and `engine/pdftotext_linter.py` with **0 issues detected** before submission:

| Gate | Name | Validation Enforcement |
| :--- | :--- | :--- |
| **Gate 1** | **Non-Skills Ban** | Technical Skills must contain **only** queryable tools, languages, and databases. Banned: architectural patterns (`hybrid search`), model weights (`embeddings`), and activities (`dom tree parsing`). Must include `Languages & Core`. |
| **Gate 2** | **Defensibility Standard** | Metrics must reflect real engineering benchmarks. Banned: impossible real-time SLAs (e.g. 15,000 scrapes in 15 seconds) or unbaselined latency claims. |
| **Gate 3** | **Codebase Truthfulness** | Tech stacks must match the commit tree in `core/projects_corpus.yaml`. Zero framework substitution (e.g. claiming LangChain when code uses Pydantic AI). |
| **Gate 4** | **Fluff & Scannability** | Eliminates weak verbs (`worked on`, `assisted in`) and hyperbole (`pareto frontier`). **Enforces F-Pattern bolding on tech/metrics while strictly forbidding bolding the leading action verb.** Max 2 occurrences per lead verb. |
| **Gate 5** | **ATS & Typst Rigor** | **Zero Em-Dashes** (`---` or `—` banned). Canonical brand casing (`GitHub`, `PostgreSQL`). Strict 1-page budget verified via `pdfinfo`. |

---

## 5. Slash Commands CLI Reference

The system provides composable slash commands runnable inside Claude Code:

| Command | Syntax | Primary Function | Output Artifact |
| :--- | :--- | :--- | :--- |
| **`/job:onboard`** | `/job:onboard [github-user]` | Bootstraps candidate facts, connects GitHub org, and selects core repositories. | `core/profile.yaml` |
| **`/job:sync-kb`** | `/job:sync-kb [repo-name]` | Inspects remote Git HEADs, detects new commits, and refreshes repomix facts. | `core/projects_corpus.yaml` |
| **`/job:ingest`** | `/job:ingest <url-or-text>` | Extracts 4-Quadrant Matrix, 10.6x title multiplier, and checks Hard Qualification Gate. | `role_analysis.md` |
| **`/job:research`** | `/job:research <company> [role]` | Executes 3-phase intelligence, ranks hiring gaps by `(Fit x Impact) / Effort`, caches result. | `company_research.md` |
| **`/job:tailor`** | `/job:tailor <company>/<role>` | Synthesizes Jake's Typst resume, applies 1:1 proof rule, and compiles 1-page PDF. | `resume.typ`, `resume.pdf` |
| **`/job:audit`** | `/job:audit <company>/<role>` | Runs deterministic AST linters and adversarial commit-tree verification. | `audit_report.md` |
| **`/job:cover-letter`** | `/job:cover-letter <company>/<role>`| Generates 4-paragraph Typst cover letter (250–350w, 0 em-dashes) for primary technical gap. | `cover_letter.pdf` |
| **`/job:outreach`** | `/job:outreach <company>/<role>` | Drafts peer-to-peer cold email (<=120 words) to leadership + 1-weekend MVP demo spec. | `outreach.md` |
| **`/job:apply`** | `/job:apply <url-or-text>` | Master orchestrator chaining Ingest $\to$ Research $\to$ Tailor $\to$ Audit $\to$ Cover Letter $\to$ Outreach. | Complete application package |

---

## 6. Quickstart & Installation

### 6.1 Prerequisites
Ensure the following tools are installed on your workstation:
- **Typst** ($\ge 0.14.0$): `mise use -g typst@latest` or `pacman -S typst` / `brew install typst`
- **Poppler Utilities** (`pdfinfo`, `pdftotext`): `pacman -S poppler` or `apt-get install poppler-utils`
- **Python 3** ($\ge 3.10$) with `PyYAML`: `python3 -m pip install pyyaml`
- **GitHub CLI** (`gh`): For commit SHA resolution and remote repository inspection

### 6.2 Verifying the Local Test Harness
Run the deterministic linters against the baseline templates:

```bash
# 1. Compile archetype resumes and verify 1-page constraint
bash engine/compile.sh core/templates/resume_android.typ core/templates/resume_android.pdf
bash engine/compile.sh core/templates/resume_ai.typ core/templates/resume_ai.pdf

# 2. Run AST, 5-Gate, and 1:1 Skill-to-Evidence linter
python3 engine/verify_resume.py core/templates/resume_android.typ --corpus core/projects_corpus.yaml
python3 engine/verify_resume.py core/templates/resume_ai.typ --corpus core/projects_corpus.yaml

# 3. Verify linear text stream extraction and Unicode CMap integrity
python3 engine/pdftotext_linter.py core/templates/resume_android.pdf
python3 engine/pdftotext_linter.py core/templates/resume_ai.pdf

# 4. Compile base cover letter
bash engine/compile.sh core/templates/sample_cover_letter.typ core/templates/sample_cover_letter.pdf
```

---

## 7. End-to-End Walkthrough Example

To demonstrate the system in action, inspect the production workspace generated for **Tower Research Capital** under `targets/tower-research/ai-ml-intern/`:

1. **Requisition Analysis (`role_analysis.md`):**  
   Extracted target title `AI/ML Engineering Intern`, mapped 4 quadrants, and calculated an **88% Match Score** against candidate ground truth.
2. **Tailored Jake's Resume (`resume.typ` $\to$ `resume.pdf`):**  
   - Header title set to `AI/ML Engineering Intern` (10.6x Multiplier).
   - Achievement bullets formulated with Google XYZ metrics: `350 evals/sec (p < 0.01)`, `8.9ms latency on CPU`, `110ms query latency across 40k docs`.
   - High-impact technologies bolded (`*Python*`, *FastAPI*, *ChromaDB*), leading verbs left unbolded.
   - 100% of declared skills supported by bullet point proof.
   - Compiled to **exactly 1 page** in 30ms.
3. **Tailored 1-Page Cover Letter (`cover_letter.pdf`):**  
   - Exactly 278 words across 4 paragraphs.
   - Opens with Tower's low-latency execution and high-throughput retrieval bottlenecks.
   - Grounded in `doubtless`, `ncert-rag-evals`, and `LexoLegal`.
   - Verified **zero em-dashes** and clean business letterhead geometry.
4. **Hiring-Gap Outreach Package (`outreach.md`):**  
   - 108-word peer-to-peer cold email to the Quantitative Systems Engineering Lead.
   - Subject: `Reducing hybrid retrieval latency on CPU` (6 words).
   - Concrete 8-hour, 1-weekend MVP demo specification with C++ ring buffer and SIMD normalization.
5. **Deterministic Sign-Off (`audit_report.md`):**  
   - 0 errors across all 5 Gates, linear text stream confirmed, full commit tree verification.

---

## 8. License & Attribution

Developed under the **Resume-as-Code (RaC)** specification. Built for candidate **Aman Verma** (`github.com/amanverma-765`).  
Templates adapted from the classical Jake's Resume design, rewritten natively in Typst for modern algorithmic and human recruitment pipelines.
