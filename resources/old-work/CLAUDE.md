# Job Search

## Autonomous Job Application Pipeline (Triggered on Any JD)

Whenever a user provides a Job Description (URL, pasted text, or file) or asks to apply for a role, Claude **MUST automatically execute the following 5-phase end-to-end pipeline**:

### Phase 1: Ingestion & Workspace Setup
1. **Identify Identifiers:** Extract company name and role title from the job posting.
2. **Dedicated Workspace:** Create a clean, kebab-case directory for the company: `<company-name>/` (e.g., `tower-research-capital/`, `amazon/`).
3. **Download / Ingest JD:**
   - For web links, fetch the full job post content using `mcp__tinyfish__fetch_content` (or web tools).
   - Save the clean, structured markdown to `<company-name>/<role-slug>.md` (e.g., `intern-ai-ml-2027.md` or `job-description.md`).
   - Include metadata: Target Company, Role Title, Location, Job ID/Token, Application URL, Internship/Employment Duration, Responsibilities, and Qualifications.

### Phase 2: Company & Role Deep Intelligence
1. **Targeted Web Research:** Conduct deep web research (using web tools) covering:
   - Company business model, engineering culture, and tech stack.
   - Recent engineering blog posts, open-source work, and core platform challenges.
   - Specific requirements, tech stack, and evaluation criteria for the target role.
2. **Intelligence Report:** Save the structured findings to `<company-name>/research.md` (covering company overview, engineering focus, role breakdown, and technical requirements).

### Phase 3: Candidate Grounding & GitHub Project Selection via `gh` CLI & `repomix`
1. **Candidate Identity:** Candidate is **Aman Verma** (`github.com/amanverma-765`). Candidate contact header and location (`Jaunpur, UP, India`) are **immutable**: never alter the candidate's home location to match the job post's city/location.
2. **Query GitHub via `gh` CLI & Deep Inspection via `repomix`:**
   - Enumerate repositories: `gh repo list amanverma-765 --limit 30`
   - Inspect top candidate repos: `gh repo view amanverma-765/<repo>` (reading `README.md`, dependencies, architectures, and commit history).
   - Use `repomix` (`npx repomix` or `repomix`) to extract, pack, or summarize any repository for deep architecture grounding and codebase truthfulness.
3. **Select Best-Fitting Projects:**
   - Select 3–4 repositories whose tech stack, domain, and architecture best align with the JD requirements (e.g., Agentic AI/MCP, RAG evals, systems/concurrency, Android/KMP, or backend).
4. **Strict Grounding:** Ground every resume project bullet, metric, and tool in verifiable GitHub code and commits. Zero fabrication.

### Phase 4: Resume Tailoring & Compilation via `.claude/skills/`
1. **Base Resume Selection Policy (STRICT):**
   - **ALWAYS and ONLY** select the base resume from the `resume/` directory:
     - For AI / ML / Agentic roles: Use `resume/resume_agentic_ai.tex` as the base.
     - For Android / Mobile roles: Use `resume/resume_android.tex` as the base.
   - **NEVER** take previous company folders (e.g., `zomato/`, `altera/`, `amazon/`, `tower-research-capital/`, etc.) as the base.
2. **Role Relevance & Anti-Kitchen-Sink Policy (DO NOT ADD EVERYTHING):**
   - If the role is about **AI / ML / Generative AI / Agentic Systems**, keep **ONLY AI/ML and directly related backend/data infrastructure** in the resume.
   - **Zero irrelevant kitchen-sink filler:** Do NOT include unrelated desktop wrappers (e.g., WhatsWine), generic frontend apps, or unrelated automation unless directly relevant to the AI problem space.
   - Every single bullet and project must directly reinforce the candidate's domain authority in the target discipline.
3. **Apply Resume Skills in `.claude/skills/`:**
   - `job-description-analyzer`: Extract must-have vs. nice-to-have keywords.
   - `resume-tailor` & `resume-ats-optimizer`: Map exact JD terminology into skills and bullets (strictly anchored in verifiable code; avoid unsubstantiated summary claims).
   - `tech-resume-optimizer` & `resume-bullet-writer`: Formulate bullets as:  
     **`[Power Verb] + [Technical What] + [Tech Stack] + [Scale/Impact]`**
   - **High-Impact Keyword Highlighting (F-Pattern Scannability):**
     - Highlight and bold (`\textbf{...}`) substantive, high-impact keywords: core technologies, frameworks, architectures, and quantitative impact metrics.
     - **DO NOT bold the leading action verb** (e.g., keep `Architected`, `Engineered`, `Developed` unbolded). Bolding the first word creates visual fatigue and disrupts F-pattern scanning. The recruiter's eye must land directly on technical competencies and measurable outcomes.
   - `resume-authenticity-audit`: Satisfy all 5 quality gates.
4. **Author LaTeX Source:** Write `<company-name>/resume_<company>_<role_slug>.tex`.
5. **Compile to PDF:** Compile using `tectonic`:
   ```bash
   tectonic -o <company-name> <company-name>/resume_<company>_<role_slug>.tex
   ```
6. **Enforce 1-Page Limit:** Confirm exact 1-page budget:
   ```bash
   pdfinfo <company-name>/resume_<company>_<role_slug>.pdf | grep Pages
   ```
7. **Format Policy:** PDF is default. **ONLY** generate `.docx` when explicitly requested.

### Phase 5: Multi-Angle Deep Audit & Tailoring Report (All Skills Scan)
At the conclusion of resume generation, Claude **MUST strictly scan and evaluate the resume from all possible angles using all available resume skills under `.claude/skills/`**:

1. **Authenticity & Defensibility Audit (`resume-authenticity-audit`):**
   - Run the mandatory auditor script:
     ```bash
     python3 .claude/skills/resume-authenticity-audit/verify_resume.py <company-name>/resume_<company>_<role_slug>.tex
     ```
   - Must pass with **0 issues detected** across all 5 gates (Non-skills ban, defensibility against `amanverma-765`, codebase truthfulness, zero fluff/hyperbole, and ATS/LaTeX rigor).
2. **ATS Compliance & Keyword Coverage Scan (`resume-ats-optimizer` & `job-description-analyzer`):**
   - Verify exact JD keywords and technical concepts are naturally covered across skills and achievements.
   - Assert single-column flow, standard ATS section headers, and zero formatting traps.
3. **Bullet Formula & Power Verb Diversity (`tech-resume-optimizer` & `resume-bullet-writer`):**
   - Verify every bullet strictly obeys: `[Power Verb] + [Technical What] + [Tech Stack] + [Scale/Impact]`.
   - Verify verb diversity: zero repetitive leading verbs across bullets (maximum 2 occurrences across the entire document).
4. **Quantification & Rigor Scan (`resume-quantifier`):**
   - Verify all metrics are technically defensible, concrete, and grounded in real benchmarks (e.g., latency, cost, statistical $p$-values, test suite counts).
5. **Section Hierarchy & Page Budget (`resume-formatter` & `resume-section-builder`):**
   - Verify strict section ordering: **Header $\rightarrow$ Technical Skills $\rightarrow$ Experience $\rightarrow$ Projects $\rightarrow$ Leadership & Activities $\rightarrow$ Education (strictly at the very end)**.
   - Compile and verify strict 1-page constraint (`pdfinfo <company-name>/<file>.pdf | grep Pages`).
6. **Generate Tailoring Report:** Save `<company-name>/tailoring-report.md` documenting the multi-angle audit scores, keyword mapping table, and verification sign-off.

---

## Resume Generation & Format Policy

- **Mandatory Base Template:** **Always and exclusively use templates from `resume/` (`resume/resume_agentic_ai.tex` or `resume/resume_android.tex`) as the starting base.** Never use ad-hoc company folders as base templates.
- **Typography Standard:** Always use `\usepackage{mathptmx}` (Times Roman serif font, matching Kshitiz's base resume) across all base resumes and tailored versions.
- **Domain Focus & Anti-Kitchen-Sink Rule:** Resumes must be tightly focused on the target domain. For an AI/ML role, include **only AI, ML, agentic systems, and directly related data/backend infrastructure**. Do not mix unrelated domains, legacy desktop wrappers, or unrelated app projects into an AI/ML resume.
- **High-Impact Keyword Highlighting (F-Pattern Scannability):** Highlight and bold (`\textbf{...}`) substantive, high-impact keywords, technologies, frameworks, core concepts, and key quantitative metrics within achievement bullets to optimize visual hierarchy and human scannability during 6-second recruiter reviews. **Never bold the starting action verb** (e.g., leave `Architected`, `Deployed`, `Engineered` unbolded); recruiters scanning in an F-pattern need their eyes drawn to technical tools, domain architecture, and impact numbers, not repetitive verbs.
- **Keyword Stuffing Penalty:** If keywords appear in a summary without evidence in experience or projects, modern heuristic parsers discount them as unsubstantiated claims.
- **Default Format (PDF):** Resumes are authored in LaTeX and compiled to **PDF** using `tectonic`. PDF is the primary and default format.
- **Word (.docx) Policy:** **ONLY generate Microsoft Word (.docx) when the user explicitly asks for it.** Never generate `.docx` files by default or unprompted. When requested, use:
  ```bash
  uv run --with python-docx python resume/tex_to_docx.py <path/to/resume.tex>
  ```
- **Strict 1-Page Constraint:** Every resume must fit on **exactly 1 page** (verified via `pdfinfo <file>.pdf | grep Pages`).

---

## Cover Letter Generation Policy & Mandatory Template

Whenever a cover letter is requested or required by an application, Claude **MUST strictly adhere to the following standard**:

- **Mandatory Base Template:** **Always and exclusively use `resume/cover_letter_template.tex` as the starting base.** Never author cover letters from scratch or use arbitrary styles.
- **Mandatory Skill:** Strictly load and follow the instructions in `.claude/skills/cover-letter-generator/`.
- **Length & Narrative Budget:** 250 to 350 words total, structured into **4 concise, high-impact paragraphs**:
  1. *Opening Hook (2–3 sentences):* Specific company insight, key engineering challenge, or core architecture requirement. Never start with *"I am writing to apply"* and never start the first sentence with *"I"*.
  2. *Direct Technical Match (3–4 sentences):* Direct connection of candidate's strongest open-source repo (`material3-skills`, `ncert-rag-evals`, `doubtless`) or production internship (`LexoLegal`) to the company's primary requirement.
  3. *Statistical Rigor, Evals & Systems Depth (3–4 sentences):* Empirical evaluation, performance latency numbers, test suite coverage, and MLOps/concurrency depth.
  4. *Enthusiastic, Confident Close & Logistics (2–3 sentences):* Cultural resonance, explicit availability (start date, duration, in-office status), and confident call to action. Never use passive closings like *"Please find my resume attached"* or *"I look forward to hearing from you"*.
- **F-Pattern Keyword Highlighting:** Bold (`\textbf{...}`) substantive, high-impact keywords (technologies, protocols like `Model Context Protocol (MCP)`, frameworks, quantitative metrics, and availability) so a recruiter scanning in an F-pattern immediately identifies core fit. **Never bold action verbs**.
- **Typography & Clean Geometry:** Use `\usepackage{mathptmx}` (Times Roman), standard letterhead with immutable candidate details (`Jaunpur, UP, India`), `0.8in` margins, and balanced whitespace.
- **Strict 1-Page Constraint:** Must compile cleanly via `tectonic` and fit on **exactly 1 page** (`pdfinfo <company-name>/<file>.pdf | grep Pages`).

---

## Strict Global Ban on Em-Dashes (Zero Em-Dashes Rule)

**STRICTLY DO NOT USE EM-DASHES (`---` in LaTeX prose or `—` in Unicode) ANYWHERE IN ANY DOCUMENT.** This applies across all generated resumes, cover letters, markdown research reports, tailoring reports, and documentation.
- **Why:** Em-dashes create parsing anomalies in ATS parsers, look unpolished in professional business letters, and disrupt scannability.
- **Enforcement:** Replace all em-dashes with commas, semicolons, colons, or parentheses. In LaTeX, use standard hyphens (`-`) solely for compound adjectives (`sub-2s latency`, `low-latency`) or en-dashes (`--`) for date/number ranges (`2023 -- 2027`). Zero em-dashes are permitted in prose.

---

## Mandatory Resume Skills & Quality Auditing

For **ANY** resume-related task (creating, tailoring, auditing, formatting, or optimizing resumes), you **MUST strictly use and follow the instructions in `.claude/skills/`**:

1. **`resume-authenticity-audit` (Enforced via `verify_resume.py`):**
   - **Gate 1 (Non-Skills Ban):** Zero implementation details, activities, or benchmark metrics in Technical Skills (no `hybrid search`, `embeddings`, `headless browsers`, `dom tree parsing`, `distributed locks`, `recall@k`, `mrr`). Must contain a dedicated `\item \textbf{Languages & Core:}` line.
   - **Gate 2 (Defensibility Standard):** Every metric must be technically defensible and directly grounded in the candidate's real GitHub repositories (`amanverma-765`). Zero vanity metrics.
   - **Gate 3 (Codebase Truthfulness):** Exact tech stacks must match git commit history. No framework misattributions or synthetic tools.
   - **Gate 4 (Zero Fluff & Weak Verbs):** Zero weak/passive verbs (`worked on`, `responsible for`, `helped with`, `assisted in`, `demonstrated that`, `discovered a`). Zero marketing hyperbole (`pareto frontier`, `zero-leakage`, `eliminate hallucinations`).
   - **Gate 5 (ATS & LaTeX Rigor):** Canonical branding (`GitHub`, `PostgreSQL`), plain-text math `(p = X)` (no raw LaTeX math mode `$p=X$`), and clean single-page budget.
   - **Mandatory Audit Command:**
     ```bash
     python3 .claude/skills/resume-authenticity-audit/verify_resume.py <path/to/resume.tex>
     ```
     Must pass with **0 issues detected**.

2. **`tech-resume-optimizer` & `resume-bullet-writer`:**
   - Every bullet must follow the formula:  
     **`[Strong Action Verb] + [Technical What] + [Technology Stack] + [Scale / Operational Impact]`**
   - Maximize lead action verb diversity (no verb repeated more than 2–3 times across the resume).

3. **`job-description-analyzer` & `resume-ats-optimizer`:**
   - Extract and categorize job requirements (Must-Have vs. Nice-to-Have).
   - Match exact JD keyword tokens naturally across skills and bullets.
   - **Keyword Stuffing Penalty:** If keywords appear in a summary without evidence in experience or projects, modern heuristic parsers discount them as unsubstantiated claims.
   - Enforce single-column layout, standard ATS section headers, zero tables, and zero text boxes.

4. **`resume-tailor` & `resume-version-manager`:**
   - Highlight the most relevant experience and projects for the specific target role.
   - Never fabricate experience; select and elevate the most applicable real-world code.
   - Maintain clean naming conventions: `<company-name>/resume_<company>_<role_slug>.tex`.

5. **`resume-quantifier` (Metric Rigor & Defensibility):**
   - Audit every numeric metric for physical and engineering credibility (e.g., latency, cost reductions, statistical significance $p$-values, test counts).
   - Ensure numbers reflect measurable benchmarks rather than unsupported estimates.

6. **`resume-formatter` & `resume-section-builder` (Hierarchy & Layout):**
   - **Strict Section Ordering Policy:** For candidate Aman Verma, the resume sections MUST strictly follow:  
     **Header $\rightarrow$ Technical Skills $\rightarrow$ Experience $\rightarrow$ Projects $\rightarrow$ Leadership & Activities $\rightarrow$ Education (Strictly Last)**.
   - Education is placed at the very bottom so hiring managers evaluate engineering firepower and open-source projects first, verifying degree and graduation year at the end.
   - Strict 1-page visual budget: zero awkward line wraps, balanced vertical whitespace, and clean margins.

---

## Build & Audit Commands

### Inspect GitHub Projects via `gh` & `repomix`
```bash
# List public repositories for the candidate
gh repo list amanverma-765 --limit 30

# Inspect a specific project's README and stack
gh repo view amanverma-765/<repo-name>

# Pack and summarize a repository context using repomix
npx repomix --remote <owner/repo>
```

### Compile Resume to PDF
```bash
tectonic -o <output_dir> <file>.tex
```
Examples:
```bash
tectonic -o amazon amazon/resume_amazon_pa.tex
tectonic -o tower-research-capital tower-research-capital/resume_tower_research_ai_ml.tex
tectonic -o resume resume/resume_agentic_ai.tex
```

### Audit Resume Quality
```bash
python3 .claude/skills/resume-authenticity-audit/verify_resume.py <path/to/resume.tex>
```

### Generate Word (.docx): ONLY WHEN EXPLICITLY REQUESTED
```bash
# Convert a single resume
uv run --with python-docx python resume/tex_to_docx.py <path/to/resume.tex>

# Convert all resumes in the repository
uv run --with python-docx python resume/tex_to_docx.py --all
```

---

## Company Deep-Research & Hiring-Gap Instructions

Whenever asked to **"research a company"**, **"company research"**, **"analyze company X"**, or evaluate hiring opportunities at a target institution, execute the following 3-phase intelligence workflow (from `company-research-agent.md`):

### Inputs
- `COMPANY`: Name of target company or institution.
- `MY PROFILE`: Candidate's skills, stack, and experience level (use resumes in `resume/`, `amazon/`, or `tower-research-capital/` as context; ask if ambiguous).
- `TARGET ROLE`: (Optional) Desired position (e.g., Programmer Analyst, Backend Engineer, AI/ML Intern).

### Phase 1: Deep Web Research (10-15 distinct searches/fetches)
Do not rely on memory; company information goes stale quickly. Search comprehensively using web tools:
1. **Company Fundamentals:** Business model, revenue streams, pricing, headcount, funding stage/investors, office locations, remote policy.
2. **Current Work (Right Now):** Product changelogs, release notes, engineering blog posts from the last 12 months, active public GitHub repos/commits/issues, recent tech talks/podcasts, and open job postings.
3. **Future Plans:** Public roadmaps, founder/executive interviews and tweets (last 6 months), earnings calls/investor letters, and expansion signals.
4. **Tech Stack & Engineering Culture:** StackShare, BuiltWith, job requirements, open-source sponsorship, and interview process reviews on Glassdoor/Blind/levels.fyi.
5. **Pain Points & Weaknesses (Where Opportunities Live):** Negative product reviews (G2, Capterra, Reddit, HN), open GitHub issues with 👍 and no assignee, community complaints regarding docs/onboarding/integrations/performance, and competitor advantages.
6. **Key People:** Engineering leaders, hiring managers for the target role, verified email patterns (e.g., `first@company.com`), LinkedIn/X handles, and recent public posts.

### Phase 2: Gap Analysis (Core Deliverable)
Cross-reference the company's pain points and roadmap against **MY PROFILE**. For each gap found, produce a ranked table:

| Field | Description |
|---|---|
| **Gap** | Specific problem or missing capability at the company |
| **Evidence** | Link(s) proving this gap exists (GitHub issue, customer review, job post, tweet) |
| **Fit score (1–10)** | How closely candidate skills match solving it |
| **Effort** | Estimated hours to build a credible MVP/demo (e.g., "6–10 hrs") |
| **Impact visibility** | Will the hiring manager immediately see the value? |
| **Strategy** | `MVP + cold email` / `cold email only` / `apply to open posting + referral hunt` |

- Rank gaps by formula: **`(Fit × Impact) / Effort`** (Top 5 maximum).
- A gap is only valid if it has **linked evidence**. Zero speculation without sources.
- Prefer gaps where an MVP is demoable in a link (deployed site, video, repo).

### Phase 3: Action Package (For the #1 Ranked Gap)
1. **MVP Spec:** One-paragraph scope (what it does, what it skips), stack (matching company stack), numbered build steps (total ≤ 1 weekend), and demo format (deployed URL + 60s Loom + public GitHub repo with clean README).
2. **Cold Email Draft:**
   - **To:** Specific person (name, title, email/LinkedIn).
   - **Subject:** ≤ 7 words referencing the gap (not "job inquiry").
   - **Body:** ≤ 120 words. Structure:
     1. One line citing specific research evidence.
     2. One line explaining what was built/fixed and the outcome for them.
     3. Direct link to demo.
     4. Soft ask: *"Worth 15 minutes?"*
   - No generic flattery, no "I'm passionate about", no attached resume in first email.
   - Include a 2-line follow-up draft for day 5.
3. **Backup Channels:** Matching open job posting links + 2–3 employees to engage on LinkedIn/X.

### Hard Rules for Company Research
- **Every claim must have a source link.** If there is no source, cut the claim.
- **Recency:** Discard operational info older than 18 months.
- **Zero fabrication:** Never invent emails or roadmap items. Mark guessed emails as `(pattern guess: verify)`.
- **Definition of Done:** The report is complete when the candidate can immediately build the MVP and send the cold email without further research.
