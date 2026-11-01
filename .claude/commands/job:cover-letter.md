# Command: /job:cover-letter

Generate a high-signal, 1-page Typst cover letter tailored to the target role's primary technical challenge.

## Arguments
`<company-slug>/<role-slug>`

## Execution Instructions

1. **Load Skills & Context:**
   - Consult `.claude/skills/cover-letter-generator/SKILL.md`.
   - Read `targets/<company-slug>/company_research.md` (company insight & recent blog/tech focus).
   - Read `targets/<company-slug>/<role-slug>/role_analysis.md` (primary hiring gaps & requirements).
   - Read candidate ground truth from `core/profile.yaml` and `core/projects_corpus.yaml`.

2. **Draft 4-Paragraph Narrative (250–350 Words):**
   - **Paragraph 1 (Opening Hook, 2–3 sentences):**
     - Cites a specific engineering challenge or architectural transition from `company_research.md`.
     - NEVER start with *"I am writing to apply"* or *"I am excited to submit..."*.
     - The first sentence must NEVER start with the pronoun "I".
   - **Paragraph 2 (Direct Technical Match, 3–4 sentences):**
     - Links candidate's commit-pinned repos (`doubtless`, `ncert-rag-evals`, `LexoLegal`) directly to the company's primary technical problem.
   - **Paragraph 3 (Systems Rigor & Benchmarks, 3–4 sentences):**
     - Cites empirical evals, testing coverage, latency numbers, or concurrency depth.
   - **Paragraph 4 (Confident Close & Logistics, 2–3 sentences):**
     - States explicit availability (start dates, remote/in-office status).
     - Confident call to action (suggesting an introductory discussion).

3. **Format & Compile:**
   - Use `core/templates/cover_letter_base.typ` letterhead.
   - Bold substantive technologies and metrics; **never bold action verbs**.
   - **Enforce Zero Em-Dashes:** Zero `---` or `—` in prose.
   - Write to `targets/<company-slug>/<role-slug>/cover_letter.typ`.
   - Compile via:
     ```bash
     bash engine/compile.sh targets/<company-slug>/<role-slug>/cover_letter.typ targets/<company-slug>/<role-slug>/cover_letter.pdf
     ```
   - Verify exact 1-page budget.
