# Command: /job:audit

Execute two-layer deterministic and adversarial validation audit on generated application materials.

## Arguments
`<company-slug>/<role-slug>`

## Execution Instructions

1. **Load Audit Rules:**
   - Consult `.claude/skills/resume-authenticity-audit/SKILL.md`.
   - Workspace target: `targets/<company-slug>/<role-slug>/`.

2. **Layer 1: Deterministic Engine Verification:**
   - Run the 5-Gate AST/Regex verifier:
     ```bash
     python3 engine/verify_resume.py targets/<company-slug>/<role-slug>/resume.typ --corpus core/projects_corpus.yaml
     ```
     - Validates Gate 1 (non-skills ban).
     - Validates Gate 2 (defensibility standard).
     - Validates Gate 3 (codebase truthfulness).
     - Validates Gate 4 (fluff ban, verb diversity, unbolded lead verbs).
     - Validates Gate 5 (canonical branding, zero em-dashes).
     - Validates 1:1 Skill-to-Evidence proof.
   - Run the Stream Extraction & CMap Linter:
     ```bash
     python3 engine/pdftotext_linter.py targets/<company-slug>/<role-slug>/resume.pdf
     ```
     - Validates linear text stream and contact parsing.

3. **Layer 2: Visual Layout & Render Inspection:**
   - Execute the visual render verification tool:
     ```bash
     python3 engine/visual_verify.py targets/<company-slug>/<role-slug>/resume.pdf
     ```
   - Visually inspect the generated image (`.scratch/debug/<role>_visual-1.png`):
     - Assert zero vertical text collisions between job titles/companies and dates/locations.
     - Assert zero vertical text collisions in Education between university and degree.
     - Assert clean right alignment of dates without single-word line wrapping.
     - Assert balanced vertical whitespace fitting strictly on 1 page.

4. **Layer 3: Adversarial Skeptic Audit:**
   - Cross-examine every single numeric claim and architecture bullet against git commit trees in `core/projects_corpus.yaml`.
   - Actively refute any unproven assertions or inflated metrics.

5. **Emit Audit Report:**
   - Save sign-off report to `targets/<company-slug>/<role-slug>/audit_report.md`.
   - Report must confirm **0 issues detected** across AST, text stream, visual layout, and adversarial checks before the application package is approved.
