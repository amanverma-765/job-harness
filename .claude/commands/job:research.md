# Command: /job:research

Conduct 3-phase company intelligence and hiring-gap discovery with two-tier caching.

## Arguments
`<company-slug> [role-slug]`

## Execution Instructions

1. **Check Existing Company Intelligence (Two-Tier Reuse):**
   - Check if `targets/<company-slug>/company_research.md` exists and was modified in the last 30 days.
   - If it exists and is fresh:
     - Log: "Reusing existing company-wide intelligence from `targets/<company-slug>/company_research.md`."
     - Skip redundant web scraping for company fundamentals.
   - If missing or stale:
     - Consult `.claude/skills/company-research/SKILL.md`.
     - Execute 10–15 targeted web searches covering:
       1. Fundamentals & business model.
       2. Recent engineering blog posts (last 12 months) and open GitHub repos/issues.
       3. Public roadmaps, tech talks, and expansion signals.
       4. Real tech stack, infra, and interview process reviews.
       5. Pain points, community complaints, unassigned issues with 👍.
       6. Key people: Engineering leaders, hiring managers, verified email patterns.
     - Save comprehensive report to `targets/<company-slug>/company_research.md`.

2. **Role-Specific Gap Analysis:**
   - If `<role-slug>` is provided:
     - Read `targets/<company-slug>/<role-slug>/role_analysis.md`.
     - Cross-reference company pain points against candidate's verified repositories in `core/projects_corpus.yaml`.
     - Score gaps using: `(Fit × Impact) / Effort` (top 5 maximum, linked evidence required).
     - Save the ranked gap table and MVP recommendations to `targets/<company-slug>/<role-slug>/role_analysis.md`.
