# Company Research: Nudge (justnudge.com)

**Researched Date:** 2026-11-12  
**Target Entity:** Nudge / iSocial Sports Private Limited  
**HQ / Corporate Offices:** Bangalore Corporate Office (Tech, Core Platform & Mobile Engineering), Bangalore, Karnataka; Registered Office in Ahmedabad, Gujarat  
**Domain & Apps:** [justnudge.com](https://www.justnudge.com/) | Android: Google Play ("Nudge: Cashback & Vouchers") | iOS: Apple App Store ("Nudge: Cashback & Vouchers")  
**Primary Contact Channels:** `support@justnudge.com`  

---

## 1. Fundamentals & Business Model

### Value Proposition & Commerce Rewards Engine
Nudge is building India's ultimate consumer commerce rewards platform. The core value proposition bridges physical retail shopping and digital quick commerce:
- **Receipt & Bill Scanning:** Users take photos of paper receipts from daily shopping (supermarkets, dining, fuel stations, pharmacies, retail stores). Verified receipts earn Nudge Coins and Gems.
- **Automated Digital Account Linking:** Users securely connect their Gmail account to automatically extract digital e-commerce and quick-commerce invoices (Swiggy, Zepto, Blinkit, Amazon, Flipkart) without manual uploads.
- **In-App Gamification:** Users engage in daily interactive mini-games, streak mechanics, and coin multipliers to accelerate earnings.
- **Voucher Marketplace:** Accumulated coins and gems are redeemed for instant digital gift cards and brand vouchers across India's top consumer brands (Amazon, Flipkart, Myntra, Swiggy, Zepto, Uber).

### Growth Trajectory & Strategic Focus
Operating in the high-frequency consumer fintech and commerce rewards space, Nudge targets everyday shopping interactions. Retaining young urban shoppers requires seamless mobile experiences, frictionless receipt capture, instant reward feedback, and high-throughput, fault-tolerant backend platform services.

---

## 2. Engineering Architecture & Technical Stack

### 2.1 Mobile Client Architecture (KMP & CMP)
- **Shared Business Logic:** Domain models, validation algorithms, REST API network clients, local SQLite/Room caching, and state machines are unified in a single Kotlin Multiplatform repository.
- **Unified Declarative UI:** Screen flows, composables, custom UI animations, and theme systems are authored in Compose Multiplatform, rendering natively on Android and iOS runtimes.
- **Platform-Specific Interop (`expect`/`actual`):** Camera feeds, secure keychain/keystore storage, push notification listeners (FCM / APNs), and deep-link intent parsers.

### 2.2 Server & Core Platform Engineering Stack
- **Microservices & API Layer:** RESTful APIs for mobile client interactions, bill image upload pipelines, third-party app integrations (Swiggy, Zepto, Blinkit invoice parsing, Gmail OAuth), and real-time in-app gamification.
- **Persistence & Data Integrity:** PostgreSQL as the relational single source of truth for user profiles, ledger balances, receipt extraction metadata, and voucher redemption histories. ACID transactions and idempotent processing ensure zero balance discrepancies.
- **High-Performance Caching & Locking:** Redis for distributed caching, sub-millisecond session state, rate limiting, and distributed locking to prevent concurrency race conditions during reward allocation.
- **Asynchronous Task Processing & Queues:** Background workers for bill OCR ingestion, invoice parsing, duplicate receipt fraud detection, and transactional notifications.
- **Containerization & Observability:** Dockerized services, automated CI/CD pipelines, structured logging, health checks, and metrics monitoring for fast debugging in production.

### 2.3 AI-First Engineering Culture
The engineering organization actively integrates modern AI coding tools (Claude Code, Cursor, GitHub Copilot) into daily feature delivery. Engineers use AI for rapid API prototyping, unit test suite generation, exploratory debugging, and refactoring, while exercising rigorous code review standards to ensure maintainability, architectural cleanliness, and defensive edge-case handling.

---

## 3. Top System Bottlenecks & Hiring Gaps (Server / Core Platform)

### Gap 1: High-Throughput Bill Upload & Asynchronous Ingestion Pipeline
- **Problem:** Spikes in receipt uploads during peak shopping hours (evenings and weekends) can overload synchronous API gateways if image processing and OCR parsing run in the request path.
- **Impact:** Request timeouts, dropped receipt uploads, and poor user satisfaction.
- **Solution:** Decouple multipart image uploads from parsing via asynchronous task queues (e.g. Celery/Redis or message brokers) with persistent progress state, bounded worker concurrency, and exponential backoff retries.

### Gap 2: Concurrency Control & Idempotent Reward Ledger
- **Problem:** Concurrent user actions (e.g. simultaneous mini-game reward claims, rapid double-taps on voucher redemptions, or retried webhook callbacks) can trigger race conditions and double-credit coins.
- **Impact:** Financial risk, coin ledger discrepancies, and voucher over-redemption.
- **Solution:** Implement distributed locking in Redis alongside database-level unique constraints and idempotent ledger transactions in PostgreSQL, guaranteeing exactly-once credit delivery.

### Gap 3: Third-Party Account & Webhook Ingestion Engine (Swiggy, Zepto, Gmail)
- **Problem:** Periodic invoice synchronization from connected accounts (Gmail invoice parsers, e-commerce webhook notifications) faces rate limits, unpredictable schema changes, and intermittent network failures.
- **Impact:** Delayed or dropped rewards for quick-commerce orders, creating customer support friction.
- **Solution:** Resilient ingestion pipelines with semaphore rate limiting, schema validation, and exponential backoff retry policies, ensuring reliable data extraction and deduplication.

---

## 4. Key People & Outreach Strategy

- **Hiring Focus:** Core Platform Engineering (Server / Backend Team, Bangalore Corporate Office).
- **Primary Audience:** Backend Tech Lead / Engineering Manager and Founders.
- **Tone & Positioning:** Pragmatic backend engineer with production experience in FastAPI, Spring Boot, PostgreSQL, Redis distributed locks, Celery queues, Docker, and high-concurrency systems.
- **Direct Hook:** Demonstrating hands-on backend architecture at LexoLegal (38 REST endpoints, Celery/Redis idempotent sweep, Redis distributed locks, 1,024 pytest suites) and Coupit (Square POS OAuth 2.0 webhook ingestion, server-side tamper-proof reward allocation in Spring Boot and PostgreSQL).
