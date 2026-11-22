#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 12, 2026",
  recipient_name: "Core Platform Engineering Leadership & Hiring Team",
  recipient_title: "Core Platform / Server Engineering Team",
  company_name: "Nudge (iSocial Sports Private Limited)",
  company_address: "Bangalore Corporate Office, Bengaluru, Karnataka, India"
)

Dear Nudge Engineering Team,

Building India's ultimate commerce rewards platform requires a backend platform capable of ingesting high-frequency shopping bills, synchronizing quick-commerce invoices, and maintaining financial data consistency across gamified reward reveals. Decoupling compute-heavy receipt extraction from user-facing APIs while enforcing distributed concurrency controls in *PostgreSQL* and *Redis* is essential for uninterrupted platform throughput. Having engineered production backend microservices across *Python*, *FastAPI*, *Kotlin*, *Spring Boot*, and *Docker*, my technical background directly aligns with Nudge's Core Platform Engineering team.

At *LexoLegal*, I architected 38 asynchronous *REST APIs* endpoints in *FastAPI* and *SQLAlchemy 2.0* across 12 *PostgreSQL* tables, implementing *Alembic* migrations and RFC 9457 problem details validated across 1,024 pytest suites. To eliminate double-submission risks, I engineered a 12-hour automated refresh sweep using *Celery* and *Redis* with an idempotent diffing engine that guaranteed zero duplicate alerts across 25 High Courts. At *Webxela*, I shipped Coupit, a scalable loyalty backend integrating Square POS *OAuth 2.0* webhooks to automate merchant onboarding in under 2 minutes with idempotent payment verification and server-side random reward allocation.

Production server engineering demands defensive concurrency handling, distributed caching, and zero tolerance for data drift. In *Doubtless*, I designed an asynchronous 4-stage ingestion pipeline in *Celery* and *Redis* with thread-safe database repositories, containerizing services in *Docker* and instrumenting distributed tracing via *OpenTelemetry* and *Logfire*. In *Safe-Trade-Approval*, I orchestrated a resilient monitoring backend in *Spring Boot* and *PostgreSQL*, utilizing *Coroutines* with 25 parallel worker threads, semaphore rate limiting, and 50-step exponential backoff retries. Furthermore, daily use of modern AI tools like *Claude Code* and *Cursor* enables me to rapidly explore codebases, draft integration test suites, and debug latency bottlenecks while taking full ownership over every merged change.

Joining Nudge as a Software Engineering Intern on the Server team provides the high-ownership startup environment where my microservices fundamentals and systems rigor can ship immediate features to production. I am ready to join your Bangalore Corporate Office onsite and welcome the opportunity to discuss your backend architecture.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
