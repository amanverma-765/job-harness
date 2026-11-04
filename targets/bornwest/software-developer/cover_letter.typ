#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 3, 2026",
  recipient_name: "Engineering Hiring Team",
  recipient_title: "Software Development Squad",
  company_name: "Bornwest (Born West Inc.)",
  company_address: "Remote (India / Global)"
)

Dear Engineering Hiring Team,

Bornwest's commitment to high craftsmanship and shipping real products from Day 1, demonstrated across enterprise platforms like Social Imprints' ThinCloud order management system and L'Oreal's connected device APIs, sets an admirable standard for digital engineering studios. Delivering production features in 6 to 8 weeks demands engineers who tackle the hardest technical bottlenecks first, especially resilient background task processing, clean API architectures, and bulletproof database integrity. Having architected asynchronous task pipelines and production REST services in *Python*, *FastAPI*, and *PostgreSQL*, my engineering approach directly matches Bornwest's high-ownership, full-stack culture.

During my software engineering internship at *LexoLegal*, I built asynchronous REST APIs in *FastAPI* and *PostgreSQL* behind an *Nginx* proxy, designing RFC 9457 standardized error handling and Alembic schema migrations. To eliminate race conditions across rapid webhook events, I engineered background worker pipelines in *Celery* and *Redis* with atomic distributed locks and non-blocking 10s countdown task requeues, while automating daily judicial ingestion across 25 High Courts and 743 District Courts with *PostgreSQL* batch inserts. Additionally, at *Webxela*, I implemented Square POS *OAuth 2.0* authentication and webhook ingestion pipelines in *Spring Boot* and *PostgreSQL*, ensuring idempotent transaction verification and replay defense for merchant onboarding.

Agency velocity requires strict test discipline to avoid regressions and technical debt. Across my open-source projects, every system is anchored in deterministic automated testing and empirical benchmarks: *doubtless* features 151 automated tests covering a 4-stage *Celery* and *Redis* media ingestion pipeline with distributed tracing in *OpenTelemetry* and *Logfire*, while *ncert-rag-evals* validates retrieval pipelines across 92 unit tests in *Pytest* with paired McNemar statistical significance testing (*p = 0.0021*). In *WatchTower*, I maintained a *60 FPS* UI while running concurrent background network crawlers via *WorkManager*.

Available immediately for full-time remote engineering from India, I am excited to contribute to Bornwest's India team, collaborate across international time zones, and build delightful features for global clients.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
