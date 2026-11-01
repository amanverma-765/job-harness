# Command: /job:outreach

Generate targeted cold outreach to engineering leadership and a 1-weekend MVP demo specification.

## Arguments
`<company-slug>/<role-slug>`

## Execution Instructions

1. **Load Skills & Context:**
   - Consult `.claude/skills/cold-email-writer/SKILL.md`.
   - Read `targets/<company-slug>/company_research.md` (hiring managers, engineering leaders, verified email patterns).
   - Read `targets/<company-slug>/<role-slug>/role_analysis.md` (top-ranked hiring gap).

2. **Draft Peer-to-Peer Cold Email:**
   - **Recipient:** Target specific engineering manager, VP, or team lead.
   - **Subject Line:** Strictly <= 7 words referencing the exact technical gap (e.g. `Fixing API rate limits on worker nodes`).
   - **Body (Strictly <= 120 words total):**
     1. One line citing specific research evidence from their engineering blog or open GitHub issues.
     2. One line explaining what candidate built/tested to solve this problem and the measurable outcome.
     3. Direct link to a public repo or deployed demo.
     4. Soft ask: *"Worth 15 minutes to chat through the trade-offs?"*
   - Tone: Peer-to-peer engineer discussing an interesting systems challenge; zero generic flattery; zero resume attachments on email 1.

3. **Draft Day 5 Follow-Up Email:**
   - Strictly 2 lines bumping the thread with a new benchmark or alternative tradeoff.

4. **1-Weekend MVP Specification:**
   - Outline a concrete 1-weekend demo demonstrating solution to the #1 hiring gap:
     - Scope: One-paragraph description (what it builds, what it skips).
     - Stack: Matched to target company's stack.
     - Deliverable: Deployed URL + public GitHub repository + 60s Loom walkthrough.

5. **Save Outreach Package:**
   - Write to `targets/<company-slug>/<role-slug>/outreach.md`.
