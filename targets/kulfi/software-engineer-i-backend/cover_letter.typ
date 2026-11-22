#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 12, 2026",
  recipient_name: "Aadhar Chandiwala & Garvit Agarwal",
  recipient_title: "Founders & Engineering Leadership",
  company_name: "Kulfi (WooshAuto Internet Private Limited)",
  company_address: "Jayanagar, Bengaluru, Karnataka, India"
)

Dear Aadhar, Garvit, and the Kulfi Engineering Team,

Kulfi's trajectory to one million users and a 4x surge in thirty days proves the demand for dedicated digital spaces among couples across India. Handling eighty percent of daily gameplay within a three-hour bedtime window while deploying new mechanics every two days requires robust backend infrastructure and sub-second WebSocket synchronization. Having built high-concurrency systems across *Python*, *FastAPI*, *PostgreSQL*, *Redis*, and *Celery*, my experience aligns directly with Kulfi's mission to engineer real-time gaming sessions and AI personalization.

At *LexoLegal*, I architected thirty-eight asynchronous REST API endpoints in *FastAPI* and *PostgreSQL* behind an *Nginx* proxy on *Linux*, containerized via *Docker* with *GitHub Actions* CI/CD. To manage high-throughput asynchronous execution, I engineered an automated background sweep using *Celery* and *Redis* with an idempotent diffing engine and atomic distributed locks with 10s countdown requeues, eliminating worker race conditions. At *Webxela*, I engineered merchant onboarding and payment ingestion pipelines in *Spring Boot* and *PostgreSQL*, integrating Square POS *OAuth 2.0* with idempotent webhook verification while managing concurrent workers across twenty-five parallel threads.

Synchronizing two-player mobile experiences over erratic cellular networks demands concurrency safety and zero unhandled failure states. In my project *doubtless*, I designed an asynchronous 4-stage pipeline in *Celery* and *Redis*, constructing a thread-safe *SQLite* WAL repository with distributed tracing in *OpenTelemetry* and *Logfire* across 151 unit tests. In *ncert-rag-evals*, I implemented custom retrieval benchmarks in *SQLite FTS5* and ChromaDB, achieving *86.9% Recall\@5 in 8.9ms on CPU* (a *99.8% latency cut*) validated via paired McNemar tests (p = 0.0021) across 92 *Pytest* suites.

Joining Kulfi as a Software Engineer I (Backend) offers the high-intensity culture where my obsession with product details, self-reviewed diffs, and backend ownership can immediately relieve bedtime traffic bottlenecks. I am available to work on-site full-time at your Jayanagar, Bengaluru office and look forward to diving into the practical product-engineering interview.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
