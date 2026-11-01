---
name: company-research
description: Conduct 3-phase deep company intelligence and hiring-gap discovery. Output shared research at targets/<company>/company_research.md to avoid redundant scraping.
---

# Company Deep-Research & Hiring-Gap Intelligence

## When to Use This Skill
- Whenever researching a target company or institution for application strategy.
- Automatically invoked by `/job:research`.

---

## 3-Phase Intelligence Methodology

### Phase 1: Deep Web Research (10–15 distinct queries)
1. **Company Fundamentals:** Business model, revenue streams, headcount, funding stage, office locations, remote policies.
2. **Current Engineering (Right Now):** Product changelogs, release notes, engineering blog posts from the last 12 months, active public GitHub repos/commits/issues.
3. **Future Roadmaps:** Public roadmaps, founder/exec tech talks, recent expansion signals.
4. **Tech Stack & Culture:** StackShare, BuiltWith, open-source sponsorship, interview process reviews.
5. **Pain Points & Weaknesses:** Negative product reviews (G2, Capterra, Reddit, HN), open GitHub issues with 👍 and no assignee, performance complaints.
6. **Key People:** Engineering leaders, hiring managers, verified email patterns.

### Phase 2: Gap Analysis (Core Deliverable)
Cross-reference company pain points and roadmap against candidate profile (`core/profile.yaml` & `core/projects_corpus.yaml`):
- Score each valid gap using: **`(Fit × Impact) / Effort`** (Rank top 5 maximum).
- A gap is ONLY valid if it has **linked evidence** (GitHub issue, customer review, tweet, changelog). Zero speculation without sources.

### Phase 3: Action Package
For the #1 ranked gap:
- **1-Weekend MVP Spec:** Scope (what it builds, what it skips), stack, numbered milestones, demo format.
- **Cold Email Pitch:** <= 120 words to the specific hiring manager + 2-line Day 5 follow-up.

---

## Two-Tier Storage Rule
- Write company-wide intelligence to `targets/<company>/company_research.md`.
- Subsequent roles applied to at the same company re-use this file if < 30 days old, avoiding redundant web scraping.
