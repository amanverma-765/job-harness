---
name: cover-letter-generator
description: Generate high-signal, 1-page Typst cover letters strictly adhering to the 4-paragraph model (250-350 words), zero em-dashes, and verified project grounding.
---

# Cover Letter Generator

## When to Use This Skill
- Whenever a cover letter is requested or required for a job application.
- Uses `core/templates/cover_letter_base.typ` as the starting base template.

---

## Strict Rules & Constraints

1. **Word & Length Budget:**
   - Total word count: strictly between **250 and 350 words**.
   - Exactly **4 concise paragraphs**.
   - Must fit on **exactly 1 page** when compiled to PDF.

2. **Strict Zero Em-Dash Ban:**
   - **Zero em-dashes (`---` or `—`) permitted anywhere in the document.**
   - Replace with commas, colons, semicolons, or parentheses. Use en-dashes (`--`) only for date/number ranges.

3. **Banned Openings & Closings:**
   - NEVER start with *"I am writing to apply for..."* or *"I am excited to submit my application..."*.
   - The very first sentence of Paragraph 1 must **never start with the pronoun "I"**.
   - NEVER close with passive phrases like *"Please find my resume attached"* or *"I look forward to hearing from you"*.

4. **F-Pattern Keyword Highlighting:**
   - Bold substantive keywords (`*Python*`, `*PostgreSQL*`, `*sub-50ms latency*`, `*Model Context Protocol (MCP)*`).
   - **Never bold leading action verbs.**

---

## The 4-Paragraph Narrative Structure

1. **Paragraph 1: Opening Hook (2–3 sentences)**
   - Cites a specific engineering challenge, recent product release, or architectural transition identified in `targets/<company>/company_research.md`.
   - Bridges company need directly to candidate background.

2. **Paragraph 2: Direct Technical Match (3–4 sentences)**
   - Formula: `[Company Specific Need] + [Candidate's Exact Repo / Experience] + [Measurable Benchmark]`.
   - Directly links candidate's commit-pinned repos (`doubtless`, `ncert-rag-evals`, or `LexoLegal`) to the role's primary technical requirement.

3. **Paragraph 3: Statistical Rigor & Systems Depth (3–4 sentences)**
   - Highlights testing coverage, empirical evals, latency metrics, or concurrency depth.
   - Proactively addresses qualification gaps with transferable engineering evidence.

4. **Paragraph 4: Confident Close & Logistics (2–3 sentences)**
   - Mentions cultural resonance and explicit availability (start dates, remote/in-office readiness).
   - Confident call to action (suggesting an introductory discussion).
