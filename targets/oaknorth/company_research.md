# OakNorth - Company Research

**Slug:** `oaknorth`
**Researched:** 2026-11-22
**Roles applied:** `generative-ai-intern` (Intern - Gen AI, Management Support, Gurugram)
**Reuse window:** valid until 2026-12-22 (30 days)

---

## 1. Fundamentals

| Item | Detail |
|---|---|
| What it is | UK digital bank for lower middle-market businesses, plus a SaaS lending platform (ONCI / ONAI, "OakNorth Analytical Intelligence") licensed to other banks |
| Founded | 2015, London. India operations since inception |
| Lending | Over $21bn lent across the UK and US since 2015; 58,000+ homes and 36,000+ jobs created (JD, 2026) |
| FY2025 results | GBP 223M profit, 33% origination growth, efficiency ratio improved 29% to 26%, AI initiatives contributed roughly 10% improvement in operating leverage |
| India footprint | 500+ colleagues across Gurugram, Bengaluru and Hyderabad; India centres described as a core engine for product, credit intelligence and enterprise innovation |
| Hiring surfaces | Ashby (`jobs.ashbyhq.com/oaknorth`), 33 open roles at time of research, most Gurugram hybrid |

## 2. AI Programme (the reason this role exists)

- **OpenAI partnership, May 2025.** Announced collaboration to embed generative AI across the business, targeting a step change in firmwide productivity.
- **FY2025 annual report language.** "We announced a strategic partnership with OpenAI in May 2025, and today, use ChatGPT, Claude and Gemini across the business. All teams within the business are users." Also: "through leveraging Claude Projects and Custom GPTs, we've been able to materially speed up analytical processes, driving even faster credit decisions; and despite a 33% increase in gross loan originations in 2025, our headcount across our credit analytics team which manages new credits was flat."
- **"Knowledge Gateway", October 2026.** CPTO Tom Harris reports shipping 3.1x more per person than January, incidents down more than 60%, and "agents in production across lending, financial crime, security". The stated enabler for internal teams is the Knowledge Gateway, "so AI starts from the bank's own context".
- **Operating model.** External analysis of UK bank annual reports (Perigon Partners, Oct 2026) characterises OakNorth as moving "processes from people to AI agents, with a person checking the output", which is the human-in-the-loop pattern the Management Support role would follow.

## 3. Engineering & Stack Signals

- AWS since inception, infrastructure-as-code across both the bank and the SaaS platform; first cloud-based UK bank (2017).
- ONCI is the proprietary credit analysis and monitoring platform; ONCI's AI disruption framework was built in Q4 2024 to score how AI reshapes borrower industries.
- Salesforce / nCino for lending operations in Gurugram (Staff Engineer role), so the front office runs on a conventional enterprise stack while the intelligence layer is custom.
- The Management Support team is the exception inside the company: its tooling still runs on Excel, which is precisely the gap the JD asks an intern to close.

## 4. Hiring Gaps, Ranked by (Fit x Impact) / Effort

Gap 1 is the one packaged for outreach.

**Gap 1. No measurement of what internal AI tooling actually saves.**
Evidence: the FY2025 report credits Claude Projects and Custom GPTs with faster analytics and a flat credit-analytics headcount, but reports the outcome at firm level. The JD itself asks the intern to "document tools, monitor their usage, and track the time and effort they save". The CPTO's public messaging claims 3.1x shipping velocity, again with no per-workflow attribution.
Fit: high (measured evals, benchmark notebooks, instrumentation with OpenTelemetry/Logfire).
Impact: high (turns a firmwide productivity claim into per-workflow evidence, which is what a CFO/CPTO needs to decide what to scale).
Effort: one weekend for a single workflow.
Score: 9/10.

**Gap 2. Excel workbooks as system of record in a leadership support function.**
Evidence: JD states "much of the team's current tooling runs on Excel" for financial tracking and expense management.
Fit: high (Python automation, pipeline engineering).
Impact: medium-high (recurring manual effort, audit risk on expense data).
Effort: medium (schema, migration, reconciliation).
Score: 7/10.

**Gap 3. Research synthesis for market, industry and regulatory questions.**
Evidence: JD duty 3; company operates across three regulatory regimes (UK, US, India).
Fit: high (ncert-rag-evals and vectorless-rag are retrieval-and-citation benchmarks).
Impact: medium.
Effort: low with a grounded retrieval layer, high without.
Score: 6/10.

**Gap 4. Reliability of automated data collection.**
Evidence: ONCI depends on external borrower and market data; the intern role builds tooling the team "can rely on day-to-day".
Fit: high (resilient ingestion with backoff, idempotent pipelines).
Impact: medium.
Effort: low.
Score: 5/10.

**Gap 5. Where GenAI does not help.**
Evidence: JD explicitly asks for intuition about "where they add genuine value versus where they don't".
Fit: high (vectorless-rag measured a 2.7x token cost and 2x latency trade-off against a modest precision gain).
Impact: medium.
Effort: negligible, it is analysis already done.
Score: 4/10.

## 5. Key People

| Person | Role | Relevance |
|---|---|---|
| Tom Harris | Chief Product & Technology Officer | Publicly publishes the 3.1x shipping and Knowledge Gateway claims (LinkedIn, Oct 2026) |
| Rishi Khosla | Co-founder, Group CEO | FY2025 and ten-year annual report messaging on AI-led lending |
| Management Support team | Host team for the internship | No named hiring manager published in the posting |

No verified individual hiring-manager or recruiter name for this requisition. Cover letter therefore uses the neutral salutation `Hiring Team` with an empty `recipient_title`.

## 6. Application Angles

- The internship is not an ML research role. It is a build-and-measure role inside a support function, so evidence of shipping small tools that people actually use outweighs model depth.
- Lead with automation that removed a recurring manual task (scheduled refresh sweep, idempotent diffing) and with measurement (McNemar tests, Recall@5, latency).
- Do not claim Excel metrics, VBA, or Notion. Excel capability is candidate-confirmed at formula and pivot-table level and is stated as such.
- Hybrid in Gurugram is compatible; candidate is based in Jaunpur, UP, and relocation to Gurugram is the honest logistics line.

## Sources

1. OakNorth, `Intern - Gen AI`, Ashby posting, published 2026-11-18. https://jobs.ashbyhq.com/oaknorth/9bb335d1-9f05-4034-aee9-e62a9b3dcf97
2. OakNorth, `TEN YEARS OF EMPOWERING ENTREPRENEURS` (Annual Report 2025, published March 2026). https://oaknorth.co.uk/wp-content/uploads/2026/03/Annual_Report_2025.pdf
3. OakNorth press, `OakNorth collaborates with OpenAI ...`, 2025-05-07. https://oaknorth.co.uk/press/oaknorth-openai-collaboration-generative-ai-banking/
4. OakNorth press, `OakNorth 2025 Results: GBP 223M Profit, 33% Origination Growth`, 2026-03-17. https://oaknorth.co.uk/press/oaknorth-2025-annual-results/
5. Tom Harris (CPTO), LinkedIn post, 2026-10-07: 3.1x shipping, incidents down 60%, Knowledge Gateway, agents in production.
6. Perigon Partners, `AI in UK banking: what 60 annual reports disclose`, 2026-10-23. https://www.perigonpartners.co.uk/articles/ai-in-uk-banking-what-60-annual-reports-disclose/
7. ET Government / GCC, `OakNorth: Pioneering AI Banking Innovation from India`, 2026-02-23. https://gcc.economictimes.indiatimes.com/news/oaknorth-pioneering-ai-banking-innovation-from-india/128709689
8. AWS Startups Blog, `OakNorth Turns Risk into Opportunity with Tech`, 2019. https://aws.amazon.com/blogs/startups/oaknorth-turns-risk-into-opportunity-with-tech/
9. Diginomica, `OakNorth Bank grows from AWS infrastructure-as-code`, 2021. https://diginomica.com/oaknorth-bank-grows-aws-infrastructure-code
