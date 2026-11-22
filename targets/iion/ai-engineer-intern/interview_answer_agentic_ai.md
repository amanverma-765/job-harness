# Application Form Answer: "Give details of an Agentic AI App / Workflow you built from scratch?"

Target: iion, AI Engineering Intern (Agentic Workflows).
Primary subject: the Resume-as-Code job harness in this repository. The numbers come from running the engine today.
Written to the human-readable standard: explicit function words, no stacked noun chains, no inanimate subjects with human verbs, short sentences, plain phrasing. No em dashes.

---

## Version A: full answer (about 360 words, for a paragraph box)

**Problem statement.** Applying to a single job took hours of repetitive manual work. For each posting I read the description, and then I rewrote the same bullets by hand so that they matched its wording. I recompiled the PDF and checked by eye that it still fit on one page. Then I filed the result and had to remember which version went to which company, for which role, and whether I had followed up. Two resumes with the same filename in different folders, and stale copies that I nearly sent, were normal. Nothing in that loop reused the work that I had already done, so every posting started from zero. The habit also cost accuracy, because after enough hand edits a bullet carried a claim that I could no longer trace to any commit, and a layout change could quietly break the text extraction that an ATS parser depends on.

**Solution and tech stack.** I built a harness that treats a resume as source code. In this workflow, the model does the work that needs judgment, and deterministic Python does the checking. The facts live in three files. profile.yaml holds contact details, degrees, and tenures that must never change. projects_corpus.yaml holds seven repositories, and each one is pinned to an exact Git commit SHA with metrics that I measured. skills_taxonomy.json holds an O*NET skill ontology and an explicit list of non skills that are banned. The agent layer is a policy file (CLAUDE.md), seven instruction files (SKILL.md), and nine slash commands. Those commands form one pipeline: read a posting into a four quadrant matrix, research the company, compute a match score, tailor, audit, and then write the cover letter and the outreach message. The layout uses Typst with a single column, Nimbus Roman, and 0.5 inch margins, and it compiles from YAML instead of being edited by hand. Five deterministic gates check the result. They cover the ban on non skills, the defensibility of metrics, truthfulness against the corpus that is pinned to commits, verb diversity and fluff, and ATS rigor, which includes a rule against em dashes. Five more checks follow: every skill must appear in at least one bullet, the number of bullets is capped, pdftotext must return text in linear order with CMap integrity, pdfinfo must report exactly one page, and every work experience title must still match the profile. If a posting scores below 50 percent on essential requirements, the pipeline stops, and no resume is generated.

**Results.** I measured these on the current build. The compile step runs a Typst build, asserts one page, and renders a PNG, and it takes 0.49 seconds. The auditor checked 16 bullets and 6 skill groups, and it reported zero errors across all five gates. The extraction linter reported that the text order is 100 percent linear and that CMap integrity holds across 5,256 characters, so no ligature or column damage reaches an ATS parser. The tracking side also works: 30 role workspaces across 29 companies now hold their own resume, cover letter, audit report, and outreach draft, and each company keeps one shared research file, so the same company is never researched twice. The repository holds 296 files across 30 commits, and each of the seven indexed repositories carries at least three bullets that are pinned to commits. The most useful evidence is negative. This week I invented a detail about a project, and the check against the corpus reported it before it reached a form.

---

## Version B: compact (about 150 words)

I built a harness that treats a resume as source code, because tailoring a resume for every job was repetitive manual work, and I had no dependable way to track which version went to which company. The agent layer is a policy file (CLAUDE.md), seven instruction files (SKILL.md), and nine slash commands that cover reading a posting, researching the company, scoring the match, tailoring, auditing, and writing the cover letter and the outreach message. The facts live in YAML and JSON: seven repositories that are pinned to exact Git SHAs, an O*NET skill ontology, and a list of non skills that are banned. The model writes Typst, which compiles to a single column PDF. Deterministic Python then runs five gates, which cover the non skill ban, the defensibility of metrics, truthfulness against the corpus, verb diversity, and ATS rigor. Four more checks enforce the proof rule for skills, a cap on bullets, linear text order with CMap integrity, and a one page limit. A posting under 50 percent essential match halts the pipeline. Results: 0.49 seconds for the build, the page assertion, and the render; zero errors across five gates on 16 bullets; and 100 percent linear text extraction.

---

## Version C: if the form wants a shipped product

At LexoLegal, a legal technology company that builds products for lawyers at client firms, I worked on Munshi. It is an autonomous agent that runs on Pydantic AI behind FastAPI, and lawyers reach it over WhatsApp. Its tools are Model Context Protocol clients over Google Drive, which handles authenticated brief discovery, and Google Calendar, which handles the scheduling of hearings. Verified user identity is injected on the server side into Pydantic AI AgentDeps, and it is never exposed as a parameter that the LLM controls. Each tool therefore resolves the tenant from deps, and cross tenant prompt injection is blocked by the structure rather than by a filter. The supporting stack is PostgreSQL with SQLAlchemy 2.0 across 12 tables, 38 asynchronous REST endpoints behind Nginx, and a refresh sweep in Celery and Redis that uses idempotent diffing. Results: sub 2 second round trip, no cross tenant leakage by construction, no duplicate alerts across concurrent jobs, and 1,024 pytest tests.

---

## Notes

- Keep the negative-evidence line. It is the one honest result that proves the guardrail works, and the iion description is explicit about catching hallucinations in shadow mode.
- Do not claim that Munshi is deployed in production, and do not claim business outcomes such as hours saved or ticket volume. Neither claim is verified.
- Version C is grounded in `core/profile.yaml`. The operational context, such as who the user is and what was manual, still needs your confirmation, so keep the phrasing general if you use it.
- The `readable` verifier is not installed on this machine (`python3 -m readable` fails with "No module named readable"), so this file was checked by hand against the six rules in the skill.
