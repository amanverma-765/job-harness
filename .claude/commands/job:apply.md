# Command: /job:apply

Master end-to-end orchestrator for the Resume-as-Code job application pipeline.

## Arguments
`<job-url-or-pasted-text>`

## Execution Flow

```
[Job URL / JD Text]
         │
         ▼
 1. /job:ingest ───────► Check Hard Qualification Gate (<50% match stops pipeline)
         │
         ▼
 2. /job:research ─────► Company intelligence (cached) & hiring gap discovery
         │
         ▼
 3. /job:tailor ───────► Jake's Typst resume + interactive missing-skill check
         │
         ▼
 4. /job:audit ────────► Deterministic linters (5 Gates) + Adversarial audit
         │
         ▼
 5. /job:cover-letter ─► 1-Page Typst business cover letter (250-350w)
         │
         ▼
 6. /job:outreach ─────► Cold email (<120w) + 1-weekend MVP demo spec
```

## Step-by-Step Instructions

1. **Phase 1: Ingestion & Qualification Gate:**
   - Execute `/job:ingest <argument>`.
   - If the Hard Qualification Gate triggers (match < 50% or fundamental mismatch):
     - **HALT PIPELINE.** Display the missing non-negotiables report. Do not proceed.
   - If qualified, extract `<company-slug>` and `<role-slug>`.

2. **Phase 2: Company Deep Intelligence:**
   - Execute `/job:research <company-slug> <role-slug>`.
   - Checks if `targets/<company-slug>/company_research.md` is cached (< 30 days old) to avoid redundant web scraping.
   - Extracts role-specific hiring gaps into `targets/<company-slug>/<role-slug>/role_analysis.md`.

3. **Phase 3: Resume Synthesis (Jake's Typst Standard):**
   - Execute `/job:tailor <company-slug>/<role-slug>`.
   - Anchors to commit-pinned projects in `core/projects_corpus.yaml`.
   - Injects the 10.6x title multiplier into header and current role.
   - Formulates Google XYZ bullets with F-pattern keyword bolding (never leading verbs).
   - If a high-priority skill is missing from candidate truth: asks the user before deciding whether to omit or verify.
   - Compiles via `engine/compile.sh` and verifies exact 1-page budget.

4. **Phase 4: Two-Layer Audit & Sign-off:**
   - Execute `/job:audit <company-slug>/<role-slug>`.
   - Runs `engine/verify_resume.py` and `engine/pdftotext_linter.py`.
   - Cross-checks all metrics against git commit trees in `core/projects_corpus.yaml`.
   - Asserts 0 issues detected across all 5 Gates and 1:1 skill proof rule.

5. **Phase 5: Cover Letter & Cold Outreach Package:**
   - Execute `/job:cover-letter <company-slug>/<role-slug>` (4 paragraphs, zero em-dashes, 1-page Typst letterhead).
   - Execute `/job:outreach <company-slug>/<role-slug>` (<= 120 words cold email + 1-weekend MVP spec).

6. **Phase 6: Final Review & Deliverables Presentation:**
   - Present a clean markdown dashboard to the user summarizing:
     - Target: `<Company>` | `<Role>`
     - Match Score & Verified Focus: `XX%`
     - Generated Artifacts:
       - Resume Typst: `targets/<company-slug>/<role-slug>/resume.typ`
       - Resume PDF: `targets/<company-slug>/<role-slug>/resume.pdf`
       - Cover Letter PDF: `targets/<company-slug>/<role-slug>/cover_letter.pdf`
       - Cold Outreach: `targets/<company-slug>/<role-slug>/outreach.md`
       - Audit Report: `targets/<company-slug>/<role-slug>/audit_report.md`
