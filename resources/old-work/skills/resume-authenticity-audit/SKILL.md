---
name: resume-authenticity-audit
description: Audit technical resumes for truthfulness, defensibility, and clarity — eliminates inflated vanity metrics, purges non-skills and buzzwords from technical skills, detects framework misattributions, and converts academic fluff into clean, concrete engineering statements.
---

# Resume Authenticity, Clarity & Defensibility Audit

## When to Use This Skill

Use this skill whenever:
- Generating, updating, or reviewing a technical software engineering, AI, or systems resume.
- Auditing the **Technical Skills** section to remove non-skills (methods, model weights, implementation details) disguised as tools.
- Catching and eliminating **exaggerated vanity metrics** (e.g. "15,000 requests in 15 seconds", "50,000+ records with 60% lower latency").
- Eliminating **academic fluff and marketing hyperbole** (e.g. "sub-10ms Pareto frontier", "zero-leakage", "eliminate hallucinations").
- Verifying that experience bullets match the **actual codebase implementation** rather than misattributed frameworks.
- Checking ATS parseability and enforcing strict **1-page PDF constraints**.

---

## The 5 Core Quality Gates

### Gate 1: The Non-Skill Ban (Tools vs. Methods)
The Technical Skills section must contain **ONLY real, searchable languages, frameworks, libraries, databases, and developer tools** that a recruiter or ATS actively queries.

| ❌ NEVER Put in Technical Skills | Why It's Wrong | ✅ What It Should Be |
| :--- | :--- | :--- |
| `Hybrid Search (BM25 + Dense RRF)` | An architectural method/pattern | `ChromaDB`, `PostgreSQL`, `SQLite (FTS5)` |
| `BGE & Qwen Embeddings` | Specific open-source model weights | `Hugging Face`, `OpenAI API`, `Sentence-Transformers` |
| `Headless Browsers` | A generic noun phrase | `Playwright`, `Puppeteer`, `Selenium` |
| `DOM Tree Parsing` | An activity | `Selectolax`, `BeautifulSoup4`, `httpx` |
| `Redis Distributed Locks` | An internal implementation pattern | `Redis`, `PostgreSQL` |
| `Empirical RAG Evals (Recall@k, MRR)` | An experimental benchmark | `LangSmith`, `Langfuse`, `Logfire`, `Pytest` |
| Missing Languages category | Python buried as `Python (Asyncio)` | Dedicated category: `Languages: Python, SQL, Bash` |

**Rule of Thumb:** If it’s not something you can `pip install`, `apt install`, run as a service, or query as a language, **it does not belong in Technical Skills**. Put the technique in the project bullet where you actually used it.

---

### Gate 2: The Defensibility Standard (No Vanity Numbers)
Every metric on a resume must be **defensible under technical interrogation by a senior engineer**.

- **Red Flag 1: Unrealistic Real-Time SLAs Across Scraping Pipelines:**
  - ❌ *"Executing scheduled sweeps across 15,000+ daily court listings to dispatch alerts within 15 seconds."*
  - Why: Scraping external portals with captchas, rate limits, and network latency cannot sustain a 15-second real-time SLA.
  - ✅ *"Automated daily cause-list ingestion across 25 High Courts and District Court portals using Celery and Selectolax, batch-inserting records into PostgreSQL via asyncpg."*
- **Red Flag 2: Freelance Vanity Volumes:**
  - ❌ *"Verifying 5,000+ daily checkout transactions"* (for a freelance POS loyalty tool).
  - ✅ *"Automating merchant onboarding in under 2 minutes with idempotent transaction verification and replay protection."*
- **Red Flag 3: Unbaselined Latency Deltas:**
  - ❌ *"Ingest and normalize 50,000+ weekly trademark records with 60% lower query latency."*
  - ✅ *"Developed a concurrent trademark search and scraping engine in Kotlin, Spring Boot, and PostgreSQL, leveraging Coroutines with custom thread pools and indexed trigram search queries."*

---

### Gate 3: Truthfulness to the Codebase
Never reframe or swap technologies in a way that directly contradicts the code or open-source repositories:
1. **Framework Fidelity:** If a backend is built with `Pydantic AI` (`pydantic-ai-slim`, `RunContext`, `AgentDeps`), do not claim "LangChain LCEL chains" in the experience bullets. State the true architecture, and put known frameworks in the Skills section.
2. **Testing Integrity:** Do not confuse static analysis with test runners (e.g. never claim "151 strict Mypy tests" when Mypy is a type checker and tests run under `pytest`).
3. **Open-Source Truth:** If a repository README says *"no LangChain, no LlamaIndex, hand-written in Pydantic AI"*, the resume must say `Pydantic AI`, not `LangChain`.

---

### Gate 4: Zero Academic Fluff & Marketing Hyperbole
Engineers build software; they don't publish promotional brochures. Replace pretentious jargon with plain, direct engineering:

| ❌ Fluffy / Academic Phrasing | ✅ Clean Software Engineering Phrasing |
| :--- | :--- |
| *"Identified and engineered a sub-10ms Pareto frontier where Hybrid RRF..."* | *"Proved that fusing BM25 with dense embeddings via Reciprocal Rank Fusion (RRF) achieved 86.9% Recall@5 in 8.9ms on CPU..."* |
| *"Enforced zero-leakage multi-tenant security by binding verified user identities to Pydantic AI RunContext dependencies outside tool argument schemas..."* | *"Secured multi-tenant access by isolating user context inside Pydantic AI dependencies rather than tool parameters, preventing prompt-injection leaks across user sessions."* |
| *"Built an agent tool to eliminate LLM API hallucinations across 60+ AI coding agents..."* | *"Built an open-source CLI and agent tool in Python that extracts component signatures to provide accurate API context to AI coding assistants (Claude Code, Cursor)."* |
| *"Mitigated untrusted scraping injection and infinite execution loops..."* | *"Capped LLM token and API spend by enforcing Pydantic AI execution limits (8 requests and 20,000 tokens per turn) to prevent runaway costs and infinite agent loops."* |

---

### Gate 5: ATS Compatibility & LaTeX Rigor

1. **Ligature Keyword Corruption:**
   Standard LaTeX T1 fonts merge letters like `fi`, `fl`, `ff` into single composite glyphs (`ﬂ`, `ﬁ`), breaking keyword searches in ATS.
   - For `pdftex`: Add `\input{glyphtounicode}` and `\pdfgentounicode=1`.
   - For `tectonic` / `xetex`: Tectonic handles Unicode natively, but avoid raw pdfTeX control sequences that cause compilation aborts.
2. **Uniform Bullet Glyphs:**
   Ensure nested list environments (e.g. `achievements` inside `itemize`) don't default to level-2 en-dashes (`–`). Explicitly pass `[label=\textbullet]` in the `achievements` definition.
3. **Canonical Branding:**
   Always use canonical capitalization: `GitHub` (never `Github`), `PostgreSQL` (never `Postgresql`), `FastAPI` (never `FastApi`), `LaTeX` (never `Latex`).
4. **Strict 1-Page Budget:**
   Every resume must compile cleanly to **Pages: 1**. Use `pdfinfo <pdf_path> | grep Pages` to verify.

---

## Automated Verification Driver

This skill includes an automated Python verification script located at:
```bash
.agents/skills/resume-authenticity-audit/verify_resume.py
```

### Running the Verifier
To audit all project resumes:
```bash
python3 .agents/skills/resume-authenticity-audit/verify_resume.py
```

To audit a specific resume file:
```bash
python3 .agents/skills/resume-authenticity-audit/verify_resume.py resume/resume_agentic_ai.tex
```

The tool automatically tests:
- ✅ Technical Skills for non-skill buzzwords and missing language categories.
- ✅ Bullets for weak verbs, passive voice, and marketing hyperbole.
- ✅ LaTeX and ATS formatting traps (branding, degree date qualifiers).
- ✅ Tectonic compilation and strict 1-page budget check via `pdfinfo`.
