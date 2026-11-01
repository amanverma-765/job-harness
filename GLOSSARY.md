# Glossary: Resume-as-Code (RaC) Job Workflow

### Resume-as-Code (RaC)
A methodology treating professional resumes as compiled software artifacts: structured data (YAML/JSON) compiled deterministically into presentation layers (Typst/PDF) with continuous integration validation (linters, ATS stream audits).

### Jake's Resume Typst Engine
The single-column typographical typesetting system based on the classical Jake's Resume design, implemented natively in Typst to guarantee zero ligature loss and clean linear stream extraction for ATS parsers.

### 4-Quadrant JD Matrix
A structured decomposition of a job description into four categorical requirements:
- **Quadrant I:** Core Programming Languages & Runtimes (e.g. Python, Go, Rust, C++)
- **Quadrant II:** Infrastructure, Databases & Cloud (e.g. AWS, Docker, PostgreSQL, Redis)
- **Quadrant III:** Architectural Patterns (e.g. Distributed Consensus, RAG, Event-Driven)
- **Quadrant IV:** Operational Scale & SLAs (e.g. 45k req/sec peak, sub-25ms latency, 99.99% uptime)

### 10.6x Requisition Title Multiplier
The empirical ATS phenomenon where aligning the resume header title and current job subtitle with the exact literal requisition title from the job posting yields an order-of-magnitude increase in algorithmic search recall and recruiter callbacks.

### 1:1 Skill-to-Evidence Rule
The mandatory constraint that every technical skill listed in the Technical Skills section must have at least one explicit, verifiable reference proof inside the Work Experience or Projects bullet points, preventing ATS keyword-stuffing penalties.

### Hard Qualification Gate
The automated pre-flight decision rule that aborts resume generation if candidate verified skills match less than 50% of the job description's essential requirements, preventing spam applications.

### Two-Tier Target Hierarchy
The directory layout organizing applications into `targets/<company>/<role-slug>/`, where company-level intelligence (`company_research.md`) is cached and shared across multiple openings at the same firm, while role-specific artifacts are completely isolated.

### Commit-Pinned Fact Grounding
The practice of attaching git commit SHAs (retrieved via `gh` and `repomix`) to candidate project descriptions, ensuring every metric, framework, and architecture claim is strictly verifiable against real codebase history.

### Five Core Quality Gates
The deterministic linting rules enforced on resume content:
- **Gate 1:** Non-Skills Ban (no methods/metrics in technical skills line).
- **Gate 2:** Metric Defensibility (physical and engineering bounds).
- **Gate 3:** Codebase Truthfulness (alignment with git commit history).
- **Gate 4:** Zero Fluff & Lead Verb Diversity (no marketing hype or repetitive verbs).
- **Gate 5:** ATS & Typographical Rigor (exact 1-page budget, canonical branding, zero em-dashes).
