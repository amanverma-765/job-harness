#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 14, 2026",
  recipient_name: "Software Development Engineering Leadership",
  recipient_title: "University Talent Acquisition & Engineering Teams",
  company_name: "Amazon Development Center India (ADCI)",
  company_address: "Karnataka, India",
  font_size: 10pt,
  leading: 0.70em
)

Dear Engineering Hiring Team,

Amazon's commitment to building distributed, fault-tolerant cloud services at global scale, guided by architectural principles on idempotent APIs in the Amazon Builders' Library, represents the engineering gold standard. Operating where development cycles are measured in weeks and systems handle millions of customer interactions requires engineers who own their code across design, deployment, and operations. Having engineered asynchronous microservices, distributed queues, and empirical evaluation testbeds in *Python*, *Java*, and *Kotlin*, my background directly matches Amazon's engineering bar.

During my Software Development Engineer internship at *LexoLegal*, I architected async REST APIs in *FastAPI* and *PostgreSQL* behind an *Nginx* proxy with RFC 9457 error contracts and Alembic migrations. To eliminate race conditions, I engineered background sweeps in *Celery* and *Redis* with atomic distributed locks and idempotent diffing, guaranteeing zero duplicate alerts. At *Webxela*, I built Square POS OAuth 2.0 onboarding in *Spring Boot* (*Java*) and structured high-throughput monitoring in *Kotlin* and *PostgreSQL* with 25 parallel worker threads.

Operational excellence requires rigorous testing and observability. In *doubtless*, I constructed a 4-stage media ingestion pipeline in *Celery* and *Redis* with containerized *Docker* microservices and distributed tracing via *OpenTelemetry* across 151 tests. In *ncert-rag-evals*, I built an empirical retrieval benchmark in *Python*, proving that fusing BM25 with dense embeddings via Reciprocal Rank Fusion (*RRF*) achieved *86.9% Recall\@5 in 8.9ms on CPU*, cutting latency by *99.8%* across 92 tests (*p = 0.0021*). In *oak*, I built an open-source *Kotlin Multiplatform (KMP)* library with *Ktor* to normalize catalog schemas across *5+ major e-commerce platforms*.

Enrolled in Bachelor of Technology in Computer Science & Engineering graduating in 2027, I am excited to commit full-time to the 6-month Software Development Engineer Internship starting January 2027 at ADCI Karnataka. Looking forward to discussing how my experience in distributed task pipelines, backend systems, and operational rigor can contribute to Amazon.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
