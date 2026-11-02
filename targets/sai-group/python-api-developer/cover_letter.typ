#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 2, 2026",
  recipient_name: "Engineering Hiring Team",
  recipient_title: "Technology Department",
  company_name: "SAI Group Ltd",
  company_address: "Kolkata, WB, India (Remote)"
)

Dear Engineering Hiring Team and SAI Group Leadership,

Building responsive conversational data platforms demands resilient, high-throughput backend services connecting enterprise databases with natural language query loops. Scaling these systems requires robust RESTful API architectures, strict OpenAPI schemas, and predictable query latencies across relational and asynchronous data pipelines. Having engineered production async microservices in *Python*, *FastAPI*, and *PostgreSQL*, I focus on solving the exact concurrency bottlenecks and data ingestion challenges that enterprise API developers face daily.

During my engineering tenure at *LexoLegal*, I architected asynchronous REST APIs in *FastAPI*, *SQLAlchemy 2.0*, and *PostgreSQL* behind an *Nginx* reverse proxy on *Linux*, implementing multi-tier *JWT* authentication, standardized RFC 9457 problem details, and *Alembic* database migrations. To support real-time conversational assistance with *sub-2s latency*, I integrated *Pydantic AI* agent execution loops and protected worker queues against concurrent turn drops by deploying *Celery* tasks with atomic *Redis* distributed locks. Additionally, I automated high-volume judicial data ingestion across 25 High Courts using *Selectolax* DOM extractors and *JSON* payloads for batch relational updates.

Engineering scalable backend services requires defensive data modeling, automated testing, and comprehensive observability rather than unverified prototype scripts. In my open-source project *doubtless*, I designed an asynchronous 4-stage media ingestion pipeline using *Celery* and *Redis* to slice audio and transcribe audio in *under 10s*, instrumenting distributed tracing across all agent execution runs via *OpenTelemetry* and *Logfire* across 151 automated tests. In *ncert-rag-evals*, I constructed an empirical hybrid search benchmark in *SQLite FTS5* and *ChromaDB*, proving *86.9% Recall\@5 in 8.9ms on CPU* across 92 unit tests in *Pytest* with paired McNemar statistical significance testing (*p = 0.0021*).

SAI Group Ltd's mission to connect conversational AI to enterprise databases aligns with my hands-on backend systems background. Based in India with full remote availability, I am prepared to contribute immediately to your API roadmap and look forward to discussing how my experience supports your engineering objectives.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
