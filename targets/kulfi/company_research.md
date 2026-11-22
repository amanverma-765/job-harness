# Company Research: Kulfi (WooshAuto Internet Private Limited)

## Phase 1: Company Fundamentals & Architecture

### Business Model & Scale
- **Corporate Entity:** WooshAuto Internet Private Limited.
- **Operating Brand:** Kulfi (`kulfi.club`, `com.kulfi.app`).
- **Founders:**
  - **Aadhar Chandiwala:** Co-Founder, Tech & Product (ex-Engineering Lead Backend at GenWise, ex-Software Engineer at BharatPe, ex-SDE at FarEye; B.Tech in Engineering from Dayananda Sagar College of Engineering, Bengaluru).
  - **Garvit Agarwal:** Co-Founder, Business & Marketing (ex-Analyst at Deutsche Bank in New York, South Park Commons Fellow).
  - *(Early Founding Team: Arsalan, Product & Engineering)*.
- **Headquarters & Location:** Jayanagar, Bengaluru, Karnataka, India (In-office engineering team).
- **Core Product & Concept:**
  - Kulfi is a dedicated digital experiences and relationship platform designed exclusively for existing couples (not a dating or matchmaking app; requires partner link/code to activate).
  - Solves the intimacy and connection gap for over 100 million unmarried Indian couples living apart, in different cities or family homes where physical time together is constrained.
  - Core mechanism: Synchronized two-player mini-games (e.g. *Pirate Escape*, *Snatch the Fries*, *Basketball Rivalry*), daily interactive relationship questions (*Pillow Talk*, *Never Have I Ever*), and shared interactive spaces played concurrently across two synced mobile devices.
- **Traction & Operational Scale:**
  - Close to 1,000,000 registered users.
  - 4x daily active user (DAU) surge in 30 days during summer 2024.
  - Added 100,000 users in the first 20 days of August without paid performance marketing.
  - **Severe Traffic Skew:** 80% of daily gameplay activity concentrates into a 3-hour window between 9:00 PM and midnight ("bedtime peak").
  - Backed by **South Park Commons (SPC)**, along with angel founders and CEOs from Swiggy, Mosaic Wellness, Snitch, and Moonshot.
- **Future Product Roadmap:**
  - AI personalization engine for games: Every couple receives a personalized mini-game daily, generated dynamically based on mutual preferences and relationship history.
  - High-velocity shipping rhythm: Shipping new game mechanics and interactive features every two days.

### Core Engineering Culture & Tech Stack
- **Engineering Philosophy:** Lean, high-intensity product-engineering team. High velocity, end-to-end ownership from problem statement to production release, zero tolerance for superficial layer-skipping, and deep root-cause debugging across client, network, API, and database.
- **Client & Mobile Surfaces:** Flutter (Dart) cross-platform mobile application, responsive web surfaces, state management (BLoC / Riverpod).
- **Backend & APIs:** Python (FastAPI / Flask) and Go (Golang) microservices, Node.js, asynchronous REST APIs, WebSockets / real-time event streaming.
- **Datastores & Caching:** PostgreSQL (relational relational user models, pairing states), Redis (distributed caching, pub/sub, in-memory game room states, atomic locks).
- **Asynchronous Task Queues:** Celery / Redis queues for background processing, notifications, and analytics batching.
- **AI & Personalization Layer:** LLM orchestration, structured output generation, dynamic game prompt synthesis, and retrieval-augmented personalization pipelines.
- **DevOps & Infrastructure:** Docker containerization, cloud infrastructure (AWS / GCP), CI/CD pipelines with automated test suites, distributed tracing, and real-time monitoring.

---

## Phase 2: Live Engineering Pain Points & Systems Challenges

1. **Bedtime Traffic Spike (9 PM - 12 AM) & Real-Time Synchronized State Management:**
   - *Problem:* With 80% of gameplay concentrated in a tight 3-hour late-night window, backend connection pools and real-time state synchronization face massive concurrent load. Partners play collaborative or competitive mini-games simultaneously while often on concurrent phone or video calls over mobile networks with fluctuating latency.
   - *Systems Impact:* Requires low-overhead WebSocket / SSE communication, Redis Pub/Sub room clustering, lightweight binary/delta state payloads, and graceful recovery when either partner experiences intermittent packet loss.

2. **Autonomous AI Personalization Engine & Low-Latency Game Synthesis:**
   - *Problem:* Kulfi is engineering a system to generate a unique personalized game for every couple every single day, while shipping new mechanics every 48 hours. Real-time LLM inference during active gameplay can introduce unpredictable latency spikes.
   - *Systems Impact:* Requires pre-computed asynchronous personalization pipelines running during off-peak hours (e.g. afternoon batches), structured schema validation (Pydantic / JSON schema), and fallback to deterministic game templates if generation fails or times out.

3. **Resilient Partner Pairing & OTP Verification Pipeline:**
   - *Problem:* Onboarding couples requires reliable SMS OTP delivery and atomic invite-code redemption. Telco SMS routing issues or concurrent code redemptions can lead to drop-offs.
   - *Systems Impact:* Demands idempotent registration endpoints, distributed locks in Redis to prevent race conditions during dual partner sign-ups, and fallback notification channels.

---

## Phase 3: Action Package (Candidate Alignment)

- **Targeted Role:** Software Engineer I - Backend (`targets/kulfi/software-engineer-i-backend`)
- **Primary Technical Problem:** High-concurrency real-time WebSocket state management during the 9 PM - 12 AM bedtime traffic surge, asynchronous task queues in Celery/Redis, and structured AI personalization pipelines.
- **Candidate Ground Truth Alignment:**
  - **LexoLegal:** Architected 38 asynchronous REST API endpoints in FastAPI, SQLAlchemy 2.0, and PostgreSQL; built an automated 12-hour background sweep in Celery and Redis with atomic distributed locks; integrated Pydantic AI with MCP clients with sub-2s query latency across 1,024 test suites.
  - **doubtless:** Engineered real-time SSE streaming workspaces in FastAPI and Pydantic AI; designed an asynchronous 4-stage media ingestion pipeline in Celery and Redis; built thread-safe SQLite WAL repositories and Redis caching validated across 151 tests.
  - **Webxela (Coupit):** Built real-time screen activation using Firebase Cloud Messaging (FCM) triggered instantly upon verified checkout webhooks; engineered Spring Boot backend services with PostgreSQL and multithreaded concurrency.
  - **ncert-rag-evals:** Evaluated hybrid retrieval and reciprocal rank fusion benchmarks on CPU with statistical rigor (p = 0.0021, 92 tests); built custom document parsers indexing 4,429 chunks.
- **Key Leadership & Verified Contacts:**
  - **Aadhar Chandiwala:** Co-Founder, Tech & Product (`aadhar@kulfi.club`, `linkedin.com/in/aadhar-chandiwala`, `github.com/chandiwalaaadhar`).
  - **Garvit Agarwal:** Co-Founder, Business & Marketing (`garvit@kulfi.club`, `linkedin.com/in/garvit-agarwal`).
  - **General Inquiries:** `support@kulfi.club` / `founders@kulfi.club`.
  - *Strict Communication Policy:* Contact via verified email and standard application channels only. Zero phone calls or WhatsApp messages.
