# Command: /job:ingest

Ingest a job posting, extract the 4-Quadrant Matrix, standardize the 10.6x Requisition Title, and enforce the Hard Qualification Gate (<50%).

## Arguments
`<url-or-pasted-text>`

## Execution Instructions

1. **Load Skills & Extract Identifiers:**
   - Consult `.claude/skills/job-description-analyzer/SKILL.md`.
   - Identify: `Company Name` and `Role Title`.
   - Normalize slugs: `<company-slug>` (e.g. `tower-research`, `google`) and `<role-slug>` (e.g. `distributed-systems-engineer`, `ml-infra-engineer`).

2. **Setup Two-Tier Workspace:**
   - Create workspace directory: `targets/<company-slug>/<role-slug>/`.
   - Save the raw job description to `targets/<company-slug>/<role-slug>/job_description.md`.

3. **Extract 4-Quadrant Matrix & Title:**
   - Extract the exact **10.6x Requisition Title**: store exact title for header injection.
   - Deconstruct JD into:
     - **Quadrant I (Languages & Runtimes):** Primary language tokens.
     - **Quadrant II (Infra, DB & Cloud):** Containerization, cloud, databases.
     - **Quadrant III (Architecture):** Distributed systems, RAG, concurrency, caching.
     - **Quadrant IV (Scale & SLAs):** Concurrency, QPS, latency, data scale.

4. **Hard Qualification Gate Evaluation (<50% Stop Rule):**
   - Read candidate verified ground truth from `core/profile.yaml` and `core/projects_corpus.yaml`.
   - Compute match score: `(Matched_Essential_Skills / Total_Essential_Skills) * 100`.
   - **If Match Score < 50% (or missing non-negotiable core domains):**
     - **ABORT PIPELINE IMMEDIATELY.**
     - Write findings to `targets/<company-slug>/<role-slug>/role_analysis.md`.
     - Output:
       ```
       🛑 HARD QUALIFICATION GATE TRIGGERED (Match Score: XX%)
       Job requires: [List essential requirements]
       Candidate profile: [List verified candidate stack]
       Missing Non-Negotiables: [List critical gaps]
       Action: Resume generation halted to prevent low-probability submission.
       ```
     - Stop execution here. Do not proceed to research or tailoring.

5. **If Match Score >= 50%:**
   - Save structured matrix and match score to `targets/<company-slug>/<role-slug>/role_analysis.md`.
   - Report: "Job ingested successfully. Match score: XX%. Ready for `/job:research` and `/job:tailor`."
