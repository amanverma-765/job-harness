#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 3, 2026",
  recipient_name: "Backend Engineering Hiring Team",
  recipient_title: "Centers of Excellence & Core Platform Infrastructure",
  company_name: "Juspay Technologies",
  company_address: "Bangalore, Karnataka, India"
)

Dear Backend Engineering Hiring Team at Juspay,

Juspay's architectural choice to engineer high-throughput payment switches in Rust handling 300 million daily transactions with strict sub-second SLAs redefines global payment reliability. Operating large-scale payment orchestration with zero data loss requires backend engineers obsessed with low-level concurrency and deterministic execution. Having built concurrent backend systems across *Python*, *FastAPI*, *Kotlin*, *Spring Boot*, and *Redis*, I have tackled the exact latency and distributed locking bottlenecks that mission-critical payment switches face at scale.

At *LexoLegal*, I architected asynchronous REST APIs in *FastAPI* and *PostgreSQL* behind an *Nginx* proxy, containerizing services via *Docker* with *GitHub Actions* CI/CD. To eliminate race conditions during rapid message bursts, I engineered *Celery* workers with atomic *Redis* distributed locks and non-blocking countdown requeues (90-retry ceiling). Furthermore, at *Webxela*, I implemented Square POS *OAuth 2.0* authentication and webhook ingestion in *Spring Boot*, establishing idempotent transaction verification and replay protection to onboard merchants in under two minutes.

Mission-critical backend systems demand empirical profiling and zero tolerance for latency regression. In my open-source project *doubtless*, I built an asynchronous 4-stage media ingestion pipeline in *Celery* and *Redis*, designing a thread-safe *SQLite* WAL async repository layer with *OpenTelemetry* and *Logfire* distributed tracing (151 tests). In *ncert-rag-evals*, I implemented custom hybrid retrieval in *SQLite FTS5* and *ChromaDB*, optimizing raw CPU execution to achieve *86.9% Recall\@5 in 8.9ms* (cutting query latency by *99.8%*) and verifying statistical significance across 92 *Pytest* suites (p = 0.0021).

I am eager to contribute directly to Juspay's Centers of Excellence and Hyperswitch platform infrastructure as a Software Development Engineer Backend Intern. Based in India and graduating in 2027, I am available for immediate internship engagement in Bangalore and welcome the opportunity to discuss technical solutions with your engineering team.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
