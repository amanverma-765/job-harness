# Company Research: Coy (Fiquity Technology Private Limited)

## Phase 1: Company Fundamentals & Architecture

### Business Model & Scale
- **Corporate Entity:** Fiquity Technology Private Limited.
- **Operating Brand:** Coy (`getcoy.com`).
- **Founders:**
  - **Pranav Aggarwal:** Founder & CEO (previously founded 1Fi, mutual-fund-backed fintech lending under Fiquity Technology).
  - **Sourabh Girdhar:** Co-Founder & CTO (Engineering leader, ex-Care.fi CTO, leading architecture across Fiquity platforms).
- **Headquarters & Location:** Gurugram (Gurgaon), Haryana, India (Hybrid engineering team).
- **Core Product & Concept:**
  - Coy is a consumer internet double-blind crush-matching web platform for adults (18+).
  - Eliminates the friction, awkwardness, and superficiality of traditional dating apps (zero public profiles, zero swipe decks, zero open chat rooms).
  - Simple core mechanism: Users add people they secretly like via phone number or email (up to 5 free crush slots).
  - If a mutual match occurs, contact details are revealed to both parties. If unrequited, identity remains completely confidential and untraceable.
  - Anonymous heads-up: Unmatched recipients receive a subtle, non-revealing notification (via WhatsApp, SMS, or email) indicating that someone has added them, with strict frequency bounds (maximum 3 alerts total, up to once a week).
- **Monetization & Unit Economics:**
  - Freemium model: First 5 crush slots are free; additional slots are purchased as one-time digital micro-transactions processed via Razorpay or earned through viral referral links.
- **Target Audience:** Consumer internet users in their early twenties (Gen Z / college / young professionals) seeking private, low-stakes romantic discovery.

### Core Engineering Culture & Tech Stack
- **Engineering Philosophy:** Product-first builder mindset, shipping rapidly from rough to live, obsession with user interaction feel, high security, and bulletproof user privacy.
- **Frontend & Web Client:** React.js and Next.js (SSR / SSG, responsive mobile-first web application, clean touch micro-interactions).
- **Backend & APIs:** Node.js and Express.js (RESTful APIs, routing, session tokens, webhook handlers).
- **Datastores & In-Memory:** SQL (PostgreSQL) and NoSQL (MongoDB / Redis) for user records, keyed lookup hashes, and session management.
- **Integrations & Third-Party Gateways:**
  - Notification Channels: WhatsApp Business Cloud API, transactional SMS gateways, SendGrid / transactional email.
  - Payments: Razorpay payment gateway integration for slot purchases and webhook signature verification.
- **Security & Privacy Architecture:**
  - Phone numbers and emails stored as keyed cryptographic hashes (HMAC-SHA256) for double-blind lookup.
  - AES encryption for custom contact aliases and stored metadata.
  - Rate limiting and anti-enumeration defenses to prevent automated phone number probing.

---

## Phase 2: Live Engineering Pain Points & Systems Challenges

1. **Privacy-Preserving Double-Blind Contact Matching & Anti-Enumeration:**
   - *Problem:* In a closed-loop crush platform, bad actors could cycle phone numbers or exploit timing discrepancies in API responses to deduce whether a target user is on the platform or has added them.
   - *Systems Impact:* Requires constant-time lookup routines, keyed cryptographic hashing of contact identifiers, strict IP/device rate limiting, and zero identity leakage on unmatched queries.

2. **Asynchronous Multi-Channel Notification Dispatch with Idempotent Deduplication:**
   - *Problem:* Sending anonymous alerts across WhatsApp, SMS, and email must strictly respect Coy's privacy commitment: maximum 3 alerts total, at most once per week, and immediate cessation if a recipient triggers opt-out (`STOP` on WhatsApp or `getcoy.com/stop`).
   - *Systems Impact:* Distributed worker retries or webhook redeliveries can cause duplicate messaging spam without a two-stage delivery ledger and atomic deduplication locks.

3. **Idempotent Payment Webhook Ingestion & Slot Allocation:**
   - *Problem:* Razorpay payment webhooks can deliver out-of-order or duplicate payloads during network transient errors.
   - *Systems Impact:* Potential slot over-crediting or race conditions during concurrent user checkout requests without replay-protected webhook ledgers.

---

## Phase 3: Action Package (Candidate Alignment)

- **Targeted Role:** Software Engineer Intern (`targets/coy/software-engineer-intern`)
- **Primary Technical Problem:** Privacy-preserving contact matching, resilient WhatsApp/SMS asynchronous notification pipelines, and idempotent payment webhook handling.
- **Candidate Ground Truth Alignment:**
  - **LexoLegal:** Engineered 'Munshi', an autonomous WhatsApp assistant in Pydantic AI and FastAPI; built an automated background sweep with Celery and Redis with an idempotent diffing engine and two-stage notification pipeline guaranteeing zero duplicate alerts and zero message loss.
  - **Webxela / Coupit:** Implemented Square POS OAuth 2.0 merchant onboarding in under 2 minutes with idempotent payment transaction verification and webhook replay protection; real-time screen triggers via Firebase Cloud Messaging.
  - **doubtless:** Built an asynchronous 4-stage ingestion pipeline in Celery and Redis with thread-safe SQLite WAL repositories, maintaining sub-2s query latency across 151 unit tests.
  - **WatchTower & cypher-x:** Implemented MD5 checksum hashing and Myers diff algorithms; hardware-backed AES encryption and cryptographic key management.
- **Key Leadership & Contacts:**
  - Sourabh Girdhar, Co-Founder & CTO (`sourabh@fiquity.com`, `linkedin.com/in/girdharsourabh`, `github.com/girdharsourabh`)
  - Pranav Aggarwal, Founder & CEO (`pranav@fiquity.com`, `linkedin.com/in/pranav-aggarwal`)
  - General Support & Inquiries: `contact@getcoy.com`
