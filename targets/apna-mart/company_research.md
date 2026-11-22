# Company Research: Apna Mart

- **Research date:** 2026-11-22
- **Shared across roles:** this file is reused by every `targets/apna-mart/<role>/` workspace.
- **Sources consulted:** Frappe customer story, Peak XV portfolio page, Entrackr and StartupFox funding reports, VCCircle funding report, Crunchbase, apnamart.in, Wellfound postings, LinkedIn engineering profiles.

## Phase 1: Company Fundamentals & Architecture

### Business Model & Scale
- **Legal entity:** Fleet Labs Technologies Pvt Ltd (trades as Apna Mart).
- **Founders:** Abhishek Singh (Co-Founder & CEO, IIT Kanpur, previously led product expansion to China at Aspiring Minds); Chetan Garg (Co-Founder & COO, IITK).
- **Founded:** 2021-2022. Headquartered in Bengaluru with the engineering hiring concentrated in Gurugram.
- **Positioning:** asset-light, franchise-led omnichannel grocery chain for tier-2 and tier-3 India, often described as a "DMart for smaller cities". A neighbourhood store plus online ordering with hyper-local delivery, marketed on a 10-minute delivery promise.
- **Measured footprint (Frappe case study):** 200+ stores, 60,000+ products, 4 states, 15+ cities.
- **Funding:** Series C of Rs 120 crore (about USD 12.7 million) closed July 2026, co-led by Accel India and Fundamentum with Peak XV Partners participating. Prior Series B was about USD 25 million in March 2025 (equity plus debt). Series A 2023, seed 2023.

### Operating Model and Where Engineering Hurts
- The franchise network means inventory truth is distributed: each store holds physical stock while the platform holds the catalogue and order book. Reconciliation between the two is the recurring operational pain.
- Online orders add a delivery promise on top of store stock, so a stock error becomes a missed SLA rather than just a bad record.
- Tier-2 and tier-3 stores run with thin staffing, so any alert or ticket the platform raises lands on a small operations team. False positives are expensive.

### Engineering & Technology Signals
- **Posted backend stack (Wellfound, Nov 2026):** Python, Django, Flask, FastAPI, Node.js, MySQL, PostgreSQL, Redis.
- **Backend engineering profile signals:** GCP, Google Pub/Sub, MySQL, MongoDB, React Native in the SDE 2 backend profile that publicised the current hiring round.
- **Enterprise resource planning: ERPNext (Frappe).** The published case study states Apna Mart runs accounts, assets, and e-commerce modules on ERPNext across the 200+ store network, which means retail master data already lives in a Frappe/MariaDB-shaped system that backend services must integrate with.
- **AI-assisted development is stated policy, not a perk:** the internship posting says the team uses AI coding agents daily and expects engineers to review, test, and own what those agents produce.

## Phase 2: Live Engineering Pain Points

1. **Stock discrepancy reconciliation across franchises.**
   - *Problem:* physical counts, POS movements, and catalogue records diverge per store and per SKU. Operations needs the delta, not a queue of repeated alerts for the same shelf.
   - *Systems impact:* snapshot diffing at SKU granularity, idempotent ticket creation, and deduplication across repeated sweeps. This is a diff and ledger problem before it is a UI problem.

2. **Delayed order tracking under a 10-minute promise.**
   - *Problem:* order state changes arrive from store systems and delivery partners; an order that breaches its promise must surface once, to the right person, without paging on every sweep.
   - *Systems impact:* scheduled sweeps, state machines over order lifecycle, and a notification pipeline that is safe under worker retries.

3. **Multi-source catalogue ingestion into a single relational model.**
   - *Problem:* 60,000+ products arrive from vendor and store feeds with inconsistent naming and pricing, into a schema that ERPNext and the storefront both depend on.
   - *Systems impact:* retry-safe ingestion, schema migrations, and normalization that survives partial upstream failure.

4. **Internal tooling velocity with a small engineering team.**
   - *Problem:* the internship posting explicitly includes "occasional frontend changes to internal tools", which signals that ops-facing tooling is built by backend engineers rather than a dedicated frontend team.
   - *Systems impact:* server-rendered or lightweight internal UIs, fast iteration, low maintenance surface.

## Phase 3: Action Package (Candidate Alignment)

- **Strongest direct fit:** Python and FastAPI REST services on PostgreSQL with Redis-backed Celery workers. LexoLegal covers 38 endpoints, 12 tables, Alembic migrations, JWT auth, and 1,024 Pytest tests; that is the exact shape of the work described in the posting.
- **Second fit:** idempotent diffing and deduplicated notification pipelines (`LexoLegal` 12-hour sweep with a two-stage ledger; `WatchTower` MD5 plus Myers diff) map onto stock discrepancy detection and delayed order alerting.
- **Third fit:** heterogeneous upstream ingestion (`LexoLegal` eCourts protocol work across 25 High Courts and 743 District Courts) maps onto catalogue and POS feed ingestion.
- **Deliberately not claimed:** MySQL, Django, Flask, Node.js, React, Nuxt, GCP, Pub/Sub, ERPNext. Candidate truth does not contain them and the corpus contains no commit-pinned evidence for them.
- **Application channels:** Wellfound posting `5127102`; Apna Mart careers page; the backend hiring round was publicised by Gaurav Singh (SDE 2, Backend, Python/Django/GCP) on LinkedIn, which is the most credible peer-to-peer outreach target.
