# Company Research: iion

Last updated: 2026-11-22 (fresh cache, valid through 2026-12-22)
Scope: shared company-wide intelligence for all iion roles.

## 1. Fundamentals

- **What they do:** advertising and monetization platform for gaming environments. Full-stack SSP (supply-side), DSP (demand-side) and DMP (data management) in one stack, sold as "Gaming Advertising Platform (GAP)".
- **Founded:** 2019, Sydney, Australia. Co-founders: Sanjaya Molligoda, Wout van Damme, Giuseppe Martoriello.
- **Size:** 60+ people (was 45+ in 2023), 12 remote locations, 14+ nationalities, teams across APAC and Europe. Primarily remote with Sydney HQ.
- **Products:**
  - `immersiion`: self-serve advertiser platform (in-game display, in-game video, CTV), launched Nov 2022.
  - `fusiion`: publisher monetization marketplace / SSP, revamped March 2025, now led by Vince Banks (VP, Marketplace).
  - Attention measurement: "Attention Advantage" benchmark report (Nov 2025), 50+ Australian campaigns, claims 5-20x more attention than other digital, 98% viewability.
- **Reach claims:** 1.3B to 3B players reachable, 41% unique gaming reach.
- **Demand path:** direct publisher partnerships via Amazon TAM, Prebid, SDK integrations; agency access through The Trade Desk, DV360, Xandr Invest. Named publishers: Voodoo, Gamurs, Amanotes, Blitz. Named brands: Samsung, IKEA, Coca-Cola, Dentsu, Publicis.
- **Commercial position:** gaming captures ~5% of ad spend despite attention performance, so the growth story is budget reallocation into gaming plus CTV adjacency (blog, Nov 2025).

## 2. Engineering Signals

- **AI/Data leadership:** Prashant Kumar Jha, VP of Technology & AI (since Jul 2025, Bengaluru). Previously Head of AI & Data Science at iion, Data Science Manager at ReBid, Senior Data Scientist at KeepTruckin. Publicly writes about ReACT agent architecture and prompt optimization.
- **Hiring pattern (strongest signal):** repeated AI hiring waves, Jul 2025 (Junior-Mid AI Engineer, remote India), Aug 2025 ("multiple AI Engineers", team "growing fast" under Prashant), Feb 2026 (Data Scientist, AI/ML & Programmatic Optimisation; Lead PM for SSP/DSP), May 2026 and Nov 2026 (this AI Engineering Intern role, posted by the Head of BI). The intern JD frames the work as replacing rules-based ops automation with agentic workflows.
- **Stack evidence:** Python-centric AI/ML, programmatic advertising infrastructure (Prebid, OpenRTB, SSP/DSP bidders), BI/reporting layer, no public GitHub org found, no public engineering blog with architecture deep-dives (marketing blog only). Stack depth must be inferred from role descriptions and people profiles, not published code.
- **Hiring manager for this role:** Abhinav Dhiman, Head of Business Intelligence (India). Publicly focuses on "evolving robust, scalable data platforms" and "enterprise-grade data governance that upholds accuracy, consistency, and quality". The intern reports directly into him.
- **AI Task Force:** the JD references a core cross-functional team of engineering and business leaders, implying the agents are built centrally and deployed into BI, ad-ops, and reporting workflows.

## 3. Culture and Interview Signals

- Small, remote-first, APAC/Europe distributed. Internship is 6 months, INR 30-40K/month, converting to full-time. India preference: Delhi, Gurgaon, Mumbai, Hyderabad, Bangalore (candidate is in Jaunpur, UP; Delhi NCR is the nearest preferred hub and fully remote is offered).
- Role is explicitly "hands-on, high impact", with mentorship from senior engineering and business leaders. No LeetCode-style filter advertised; the JD reads like a portfolio-plus-logic screen.

## 4. Pain Points and Gaps (evidence-linked)

1. **Rules-based ops are hitting a ceiling.** The JD states the company is "transitioning from traditional rules-based automation to intelligent, Agentic Workflows". Rules-based BI ops break on unstructured inputs (client emails, campaign anomalies, publisher requests). Evidence: JD role framing plus Head of BI public posts.
2. **Trust gap for autonomous actions.** JD asks for "guardrails, tracing and Human-In-The-Loop architecture" and "safely scale AI in a live production environment", implying the org has not yet standardized agent safety. Evidence: JD "What you'll Gain".
3. **Evaluation is undefined.** "Shadow Mode", "analyze the reasoning logs", "debug instances of hallucinations or logic failures" describe work that does not yet have a harness. Evidence: JD responsibilities.
4. **Context and instruction discipline.** "create SKILL.MD instruction files" and "context-window optimization" show ad-hoc prompt management rather than a versioned instruction layer. Evidence: JD responsibilities.
5. **Data access is the integration bottleneck.** "API Connectors that will allow agents to interact securely with other databases" implies warehouse/CRM/ad-platform connectors with access control are the current blocker. Evidence: JD responsibilities; BI governance focus of hiring manager.
6. **Talent funnel is thin at the intern level.** Role reposted across May 2026 and Nov 2026 cycles with broad India location preference, suggesting difficulty finding candidates who have actually shipped agents rather than tutorial projects. Evidence: repeated postings, multiple current interns in title on LinkedIn.

## 5. Candidate Angle

The candidate is not a tutorial-level applicant: they shipped an MCP-driven agent in production (LexoLegal "Munshi"), isolated identity inside `AgentDeps` to kill cross-tenant prompt injection, and instrumented tracing plus test suites (107, 92, 1,024). Mapping to iion:

- Shadow-mode analytics maps to `ncert-rag-evals` (deterministic eval, McNemar significance) and `doubtless` (OpenTelemetry/Logfire traces).
- Connector security maps to the `AgentDeps` isolation and bounded sandboxed tool access.
- Context engineering maps to the streaming 45s dialogue-window design in `doubtless`.
- Adtech domain is the only real gap, and it is learnable in weeks (OpenRTB, Prebid, yield optimization).

## 6. Outreach Targets

- **Primary:** Abhinav Dhiman, Head of Business Intelligence (direct manager for the intern role).
- **Secondary:** Prashant Kumar Jha, VP of Technology & AI (owns the agentic AI platform).
- **Tertiary:** Sanjaya Molligoda, Co-Founder (publicly posts AI hiring updates).
- Verified email patterns: not publicly verifiable. Use LinkedIn DM or the application portal; do not guess addresses.

## 7. Sources

- iion site: https://www.iion.io/, https://iion.io/about, https://www.iion.io/immersiion-advertising-platform, https://iion.io/fusiion-monetization-platform
- fusiion revamp (Mar 2025): https://www.iion.io/blog/iion-revamps-fusiion-a-revolutionary-gaming-marketplace-for-publishers
- Attention Advantage / CTV blog (Nov 2025): https://iion.io/blog/big-screen-gamer-audience-how-to-turn-high-attention-into-premium-ctv-revenue
- IAB Australia member Q&A (Apr 2023): https://www.iabaustralia.com.au/members-and-councils/new-member-qa-iion/
- AdNews launch coverage (Nov 2022): https://www.adnews.com.au/news/australian-adtech-iion-launches-self-serve-advertising-platform-for-gaming
- Job listing: https://builtin.com/job/ai-engineering-intern-agentic-workflows/12116203
- People: https://www.linkedin.com/in/abhidhiman (Head of BI), https://linkedin.com/in/prashantkrjha (VP Tech & AI), https://www.linkedin.com/posts/sanjayamolligoda_ai-hiring-machinelearning-activity-7362980732656381955-ZYMv (co-founder hiring post)
