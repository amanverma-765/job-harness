# Company Research: Bynry Inc.

- Researched: 2026-11-22
- Cache window: valid 30 days (re-scrape after 2026-12-22)
- Sources: bynry.com (home, SMART360 Next, About, Careers, Contact), LinkedIn company
  page, Callapina portfolio page, Upekkha/UP FUNDS announcement, PitchBook profile,
  LeadIQ tech-stack snapshot

## Snapshot

- Legal entities: Bynry Inc. (US, 8 The Green STE R, Dover, Kent, Delaware 19901) with an
  India operations center at Serene Tower, Pakharbaug, Pune, Maharashtra 411021.
- Positioning: vertical B2B cloud-native SaaS for small and mid-sized utilities (water,
  electric, gas, storm water, trash). Flagship product: **SMART360** / **SMART360 Next**.
- Founded: 2022 per LinkedIn (PitchBook lists 2016 for an earlier entity). Headcount
  roughly 40-47, distributed across India, US, Australia, UK.
- Stage and capital: pre-seed/early, bootstrapped then backed by Upekkha Value SaaS and
  UP FUNDS; not a large venture-funded scale-up.
- Founder and CEO: **Nilesh Gudhe** (Stanford Seed). Publicly frames the company around
  reliability: bills must be right and systems must stay resilient.
- Reference customers: Samoa Water Authority (35,000+ consumers) is the public flagship;
  the product page cites 50,000+ meters live across deployments and 99% billing accuracy.
- Sales motion: 20-24 week production go-live versus 12-18 months for legacy CIS vendors.
  That compressed timeline is why forward-deployed engineering exists here.
- Recognition: Google for Startups AI Showcase 2025, one of six companies featured.

## Product Surface (relevant to Forward Deployed Engineering)

- Modules: billing, metering and meter data, field service/work orders, customer
  management and self-service, assets, reporting, revenue recovery.
- Stated scale envelope: utilities from 3,000 to 100,000 connections; the SMART360 Next
  page cites up to 40,000 accounts, 11 services on one account, 11 languages, 26 runbooks.
- Integration reality: utilities arrive with their own payment gateways, GIS, meter
  vendors and ERP systems, so per-customer REST/webhook integration work is a structural
  need, not an exception.
- Public tech signals: AWS hosting, PostgreSQL and Microsoft SQL Server, Mixpanel, Zapier.
  (LeadIQ snapshot, treat as indicative only.)

## Engineering Culture Signals

- The job posting states an "AI-first organization" where engineers use intelligent tools
  to build, test and ship faster, and where every submitted line must be explainable and
  verifiable. That is an unusually explicit anti-vibe-coding stance for an intern posting.
- Careers page values: integrity and impact, ownership, transparent communication.
- The role explicitly excludes sales demos, support tickets and QA-only work, and pairs the
  intern with a named mentor plus QA/DevOps/Customer Success exposure.
- Compensation is INR 10,000/month for a 6-month Pune hybrid internship, extended to 9
  months before full-time conversion is evaluated. This is a learning-weighted offer, not a
  market-rate engineering salary.

## Why This Candidate Fits

- The posting's build surface (Python APIs, REST, webhooks, SQL, LLM prototyping with
  retrieval, end-to-end testing, Git/CI/CD) maps almost 1:1 onto LexoLegal work: 38 FastAPI
  endpoints, PostgreSQL schema, Celery/Redis automation, Pydantic AI agent, 1,024 pytest
  tests, and a public RAG evaluation harness.
- Utility data is messy and document-heavy (tariffs, billing rules, meter reads). The
  candidate's retrieval work is measurement-first (Recall@5, McNemar significance, token
  cost per query), which is exactly the accuracy-checking posture the JD asks for.

## Honest Gaps

- No utility domain knowledge (meter-to-cash, billing determinants, account hierarchy).
- No customer workshop or UAT ownership experience.
- No AWS deployment evidence and no Django/Node.js.
- Internship compensation and Pune hybrid relocation are the practical decision points,
  not the technical fit.

## Outreach Hooks (verified)

- Samoa Water Authority: 35,000+ consumers, 99% billing accuracy cited on the portfolio page.
- Go-live compression claim: 20-24 weeks versus 12-18 months for legacy CIS.
- Product page claims 11 languages and 26 runbooks per deployment, which implies heavy
  per-customer configuration drift, the exact source of forward-deployed integration work.
