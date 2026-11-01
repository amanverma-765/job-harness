---
name: resume-authenticity-audit
description: Deterministically audit technical resumes for truthfulness, defensibility, and ATS compliance. Eliminates inflated vanity metrics, purges non-skills from technical skills, enforces the 1:1 skill proof rule, and bans all em-dashes.
---

# Resume Authenticity, Clarity & Defensibility Audit

## When to Use This Skill
- Whenever generating, updating, or reviewing a technical software engineering, AI, or systems resume.
- Auditing the **Technical Skills** section to remove non-skills (methods, model weights, activities) disguised as tools.
- Catching and eliminating **exaggerated vanity metrics** (e.g. "15,000 requests in 15 seconds", "50,000+ records with 60% lower latency").
- Eliminating **academic fluff and marketing hyperbole** (e.g. "sub-10ms Pareto frontier", "zero-leakage", "eliminate hallucinations").
- Enforcing the **1:1 Skill-to-Evidence Rule**: ensuring every skill listed under Technical Skills is referenced in at least one bullet point.
- Enforcing the **Zero Em-Dash Rule** (`---` or `—` banned across all prose).
- Checking ATS parseability and enforcing strict **1-page PDF constraints**.

---

## The 5 Core Quality Gates

### Gate 1: Non-Skill Ban (Tools vs. Methods)
The Technical Skills section must contain **ONLY real, searchable languages, frameworks, libraries, databases, and developer tools** that a recruiter or ATS actively queries.
- Banned from Skills: `Hybrid Search`, `Embeddings`, `Headless Browsers`, `DOM Tree Parsing`, `Distributed Locks`, `Recall@k`, `MRR`.
- Must contain an explicit `Languages & Core` or `Languages` category.

### Gate 2: Defensibility Standard (No Vanity Numbers)
Every metric on a resume must be **defensible under technical interrogation by a senior engineer**.
- No impossible real-time scraping SLAs across public portals.
- All metrics must be anchored in verifiable git commit history from `core/projects_corpus.yaml`.

### Gate 3: Truthfulness to the Codebase
- Exact tech stacks must match git commit history in `core/projects_corpus.yaml`.
- Never substitute frameworks (e.g. never claim `LangChain` when the codebase uses `Pydantic AI`).

### Gate 4: Zero Fluff, Verb Diversity & Scannability
- Eliminate weak verbs: `worked on`, `responsible for`, `helped with`, `assisted in`.
- Maximize action verb diversity (no leading verb repeated more than twice across the resume).
- **F-Pattern Keyword Highlighting:** Bold substantive keywords (`*Python*`, `*PostgreSQL*`, `*sub-25ms latency*`). **Never bold the leading action verb** (e.g. leave `Architected`, `Engineered`, `Developed` unbolded).

### Gate 5: ATS Rigor & Zero Em-Dashes
- **Strict Zero Em-Dash Ban:** Never use em-dashes (`---` or `—`) in any resume prose. Use commas, colons, semicolons, or en-dashes (`--`) for number/date ranges.
- Canonical branding: `GitHub`, `PostgreSQL`.
- Strict 1-page visual budget (`pdfinfo <file>.pdf | grep "Pages: 1"`).

---

## Mandatory Automated Auditor Command
Always run the engine verifier before approving any resume:
```bash
python3 engine/verify_resume.py <path/to/resume.typ> --corpus core/projects_corpus.yaml
```
Must pass with **0 issues detected**.
