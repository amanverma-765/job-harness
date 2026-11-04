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
  recipient_title: "IT & Systems Division",
  company_name: "Jio Platforms Limited",
  company_address: "Mumbai, Maharashtra, India"
)

Dear Engineering Hiring Team and Jio Leadership,

Scaling mission-critical enterprise applications across Jio's digital platforms ecosystem demands robust software development lifecycles, rigorous automated testing, and high-performance database architectures. Engineering reliable systems at this volume requires writing clean, maintainable code, implementing disciplined version control in *Git*, and optimizing relational queries under high operational loads. Having developed production asynchronous services and verified open-source systems in *Python*, *SQL*, and *FastAPI*, I focus on building resilient software foundations that eliminate defects before deployment.

During my engineering tenure at *LexoLegal*, I architected asynchronous *REST APIs* in *FastAPI*, *SQLAlchemy 2.0*, and *PostgreSQL* behind an *Nginx* proxy on *Linux*, implementing multi-tier *JWT* authentication, standardized OpenAPI schemas, and *Alembic* database migrations with *Docker* and *Git* CI/CD pipelines. To handle rapid concurrent requests reliably, I engineered background *Celery* sweep workers with atomic *Redis* distributed locks, preventing race conditions and message drops. Furthermore, I automated daily judicial record ingestion across 25 High Courts and 743 District Courts using *Selectolax* DOM extractors and structured *JSON* payloads for batch relational updates.

Writing clean and dependable software requires systematic debugging, defensive data modeling, and exhaustive unit test suites. In my open-source project *doubtless*, I built an asynchronous data ingestion pipeline and thread-safe *SQLite WAL* repositories in *FastAPI* and *Redis*, instrumenting distributed tracing across execution runs via *OpenTelemetry* and *Logfire* across 151 unit tests. In *ncert-rag-evals*, I constructed an empirical retrieval benchmark in *SQLite FTS5* and *ChromaDB*, proving *86.9% Recall\@5 in 8.9ms on CPU* across 92 unit tests in *Pytest* with paired McNemar statistical significance testing (*p = 0.0021*).

Jio's commitment to advancing India's digital platforms through high-standards IT engineering aligns with my focus on clean code, testing rigor, and scalable database systems. Based in India and fully available for Mumbai on-site or hybrid requirements, I am eager to contribute to Jio's engineering teams and look forward to discussing how my technical background supports your software roadmap.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
