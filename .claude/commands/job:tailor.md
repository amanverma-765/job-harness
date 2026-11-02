# Command: /job:tailor

Synthesize a tailored Jake's Resume in Typst strictly grounded in commit-pinned candidate truth.

## Arguments
`<company-slug>/<role-slug>`

## Execution Instructions

1. **Load Context & Skills:**
   - Consult `.claude/skills/tech-resume-optimizer/SKILL.md` and `.claude/skills/resume-ats-optimizer/SKILL.md`.
   - Read `targets/<company-slug>/<role-slug>/role_analysis.md`.
   - Read candidate ground truth from `core/profile.yaml` and `core/projects_corpus.yaml`.

2. **Project Selection & 10.6x Title Multiplier:**
   - Select 3–4 repositories from `core/projects_corpus.yaml` whose verified stacks and architectures best align with Quadrants I–IV.
   - Inject the exact requisition title extracted in `role_analysis.md` into:
     - The resume header subtitle (`target_title: "..."`).
     - The current role subtitle if functionally aligned.

3. **Interactive Missing-Skill Resolution:**
   - Identify high-priority skills in the JD that are absent from candidate's verified ground truth.
   - **STOP and prompt the user:**
     *"The job lists [Skill] as a high-priority requirement, but it is not currently recorded in your verified project corpus. Do you have real, unindexed experience with [Skill] we can verify, or should we omit it and emphasize your experience in [Alternative]?"*
   - **STRICTLY NEVER HALLUCINATE OR SYNTHESIZE EXPERIENCE.**

4. **Formulate Bullets & Technical Skills (1:1 Evidence Rule):**
   - Every bullet must follow: `[Strong Action Verb] + [Technical What] + [Technology Stack] + [Scale / Operational Impact]`.
   - Apply **F-Pattern Keyword Highlighting**: Bold substantive tools, architectures, and metrics (`*Python*`, `*PostgreSQL*`, `*sub-25ms latency*`). **NEVER bold the leading action verb.**
   - Verb diversity: No leading verb repeated more than twice across the document.
   - **1:1 Skill-to-Evidence Rule:** Every skill listed under `#skill_item` must appear in at least one experience or project bullet point.

5. **Generate Typst Document:**
   - Import `core/templates/template.typ`.
   - Author `targets/<company-slug>/<role-slug>/resume.typ`.
   - Enforce dynamic section order (`core/templates/yml.typ` handles this automatically):
     - If candidate has experience: Header -> Work Experience -> Projects -> Technical Skills -> Leadership -> Education.
     - If student with zero experience: Header -> Technical Skills -> Projects -> Leadership -> Education.

6. **Compile, Calibrate Line Gaps & Enforce Full-Page 1-Page Budget:**
   - Execute:
     ```bash
     bash engine/compile.sh targets/<company-slug>/<role-slug>/resume.typ targets/<company-slug>/<role-slug>/resume.pdf
     ```
   - Must output: `[+] PASSED: Exact 1-page budget verified.`
   - **Full-Page Fill Calibration (Under-filled Resumes):**
     - Inspect compiled PDF and visual render (`.scratch/debug/resume_visual-1.png`).
     - If the resume leaves empty dead-space at the bottom, make it look filled by increasing `line_gap` (up to `0.85em–0.92em`), proportionally scaling `section_gap` and `header_gap`, or pulling in extra defensible pointers from `core/projects_corpus.yaml` or user suggestions.
   - **Over-stuffing Verification & Pruning Recommendations:**
     - Verify against limits: **Max 18 total bullets**, **max 600 words**, and `line_gap >= 0.68em`.
     - If content exceeds these thresholds (or crushes line gaps below 0.68em to fit), **notify the user immediately**.
     - Warn about recruiter visual scan fatigue, and provide a concrete ranked list of recommended bullets/lines to remove for user confirmation.
