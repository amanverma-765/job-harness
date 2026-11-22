# Company Intelligence: Discover Dollar Technologies Pvt Ltd

_Researched: 2026-11-22 · shared across all Discover Dollar roles · refresh after 2027-01-20_

## 1. Fundamentals

| Field | Value |
|---|---|
| Legal entity | Discover Dollar Technologies Pvt Ltd (Discover Dollar Inc) |
| HQ | Bengaluru, Karnataka (Mahadevapura). Second site: Mangaluru (Data Analysis Intern posting) |
| Founded | 2014 |
| Founder & CEO | Subrahmanya Rao ("Subu R") |
| CTO | Dheemanth R, ~12 years, LinkedIn headline "Building the Future of Enterprise AI · Agentic AI · Enterprise Systems" |
| Size | ~51-200 employees (TheOrg lists 11-50; RocketReach counts ~35 in IT) |
| Funding | Bootstrapped / pre-seed only (USD ~146K, 2018). Profitable services-led model, not VC-scaled |
| Careers | discoverdollar.keka.com (Keka ATS) + Techstars job board mirror |
| Website | discoverdollar.com |

## 2. Business Model & Customers

- Two revenue lines: **Recovery-as-a-Service** (AP recovery audit, contract compliance audit, deduction management, retail merchandise recovery) and **SaaS (Discover Dollar Shield)**.
- Client base: Fortune 500 retail / CPG / healthcare. Named: **Target** ($100M+ P&L impact, 3TB+ data), **AB InBev** ($20M+ in 8 weeks, $20B spend analyzed), La Victoria de México, Beck's, Microsoft (technology partner).
- Marketing claims: $250B+ spend analyzed, $40M contracts & negotiations verified, $504M discovered, $300M+ recovered, >4X ROI, 0.2% error rate on a $500M spend base = ~$1M/yr lost.
- Core wedge: enterprises already own ERPs (SAP, Oracle, NetSuite, JDE), yet leakage persists in the **unstructured** layer: negotiated prices and discounts buried in contracts and email threads, invoice/PO mismatches, missed rebates and credits.

## 3. Product Architecture (Discover Dollar Shield, from the company's own engineering blog)

1. **No ERP integration:** AP data uploaded through a secure portal (invoices, POs, contracts, emails, payments).
2. **Schema-free ingestion:** AI auto-maps arbitrary document formats; explicitly positioned as "not keyword matching or rule-based logic."
3. **Instant anomaly detection:** 40+ leakage scenarios (duplicate payments, pricing errors, missed rebates, vendor overcharges).
4. **Claims management workspace:** humans review, approve, or reject each detected claim. Real-time, auditable, collaborative. This is a **human-in-the-loop** product by design.
5. **Financial exposure dashboard:** recoverable value, claim status, leakage trends per business unit.

Stack signals (LinkedIn tech-stack scrape, partial): Docker, Git, JSON, MLflow, MongoDB, OpenAI, Microsoft/Azure, Oracle, Harness (cloud cost tooling; AWS + DigitalOcean history, ~70% cloud bill cut via Harness).

## 4. Hiring Signals & Process

- Open roles (Nov 2026): 11 live, mostly India. Repeated AI hiring: AI Engineer Intern (Agentic AI), Analytics/AI Engineer Intern, Data Analysis Intern, ML Engineer.
- The Agentic AI JD is unusually specific (DeepAgents, LangGraph, agent harness, MCP, evals, observability) and reads like a spec written by the CTO, not a recruiter template.
- Interview data: Glassdoor 24 ratings, difficulty ~4.7/10 (Dataford aggregation over 23 reports), ~65% applied online / 35% campus, fast loops (~2 days reported for some roles).
- Stipend: Techstars mirror labels the Agentic AI intern posting "unpaid, no fixed duration"; Alion estimates INR 15-30K/month; Naukri says 0-1 years. Treat compensation as **unconfirmed and likely low**: verify in the first recruiter call.

## 5. Pain Points Relevant to an AI Engineer (ranked by evidence)

1. **Hallucinated or unsupported claims destroy trust.** Every flagged claim goes to a client finance team and then to a vendor. A false positive is a real commercial incident, so precision matters more than recall.
2. **No eval harness for document-heavy extraction.** The blog claims "trained on millions of real-life situations" but nothing public shows regression testing of extraction/decision quality across document formats (PDF, email, scanned invoice).
3. **Audit trail vs. agent nondeterminism.** "Automatic audit trails" and "real-time, auditable" are product promises; an LLM agent making multi-step decisions needs per-step tracing to honor them.
4. **Agent identity and tool permissions.** Enterprise data (contracts, pricing) is tenant-sensitive. Tool calls must not be steered by document content or model-supplied parameters.
5. **Cost and latency per document batch.** Recovery audits run over 3TB+ of client data; per-document LLM cost is the binding constraint, which favors deterministic retrieval and small models over maximal context.

## 6. Outreach Targets

- **Dheemanth R**, CTO. Writes the Shield engineering blog; headline is explicitly Agentic AI. Best cold-email target for a systems-level, evals-and-tracing pitch.
- **Subrahmanya Rao**, Founder & CEO (business framing, not the technical entry point).
- **Pawan Kuldip**, Head of HR. Routing only.
- Email pattern: not publicly verified. Use LinkedIn DM / Keka careers form instead of guessing addresses.
