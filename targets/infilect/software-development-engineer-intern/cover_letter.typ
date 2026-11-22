#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 22, 2026",
  recipient_name: "Software Engineering Leadership",
  recipient_title: "Backend, Platform & Data Teams",
  company_name: "Infilect Technologies Pvt. Ltd.",
  company_address: "Bengaluru, Karnataka, India",
  font_size: 10.5pt,
  leading: 0.75em,
)

Dear Engineering Hiring Team,

InfiViz gives retail manufacturers something rare: verified ground truth at the shelf, across 300,000+ outlets and 18 countries. Equally notable is your operating discipline, since you replaced off-the-shelf monitoring with an in-house alerting platform to cut incident detection time dramatically while holding 60-second field actions. That is a team where a backend engineer owns data quality end to end, and exactly where I want to spend the next six months.

At *LexoLegal*, I architected 38 asynchronous *REST APIs* in *FastAPI* and *SQLAlchemy 2.0* across 12 *PostgreSQL* tables behind *Nginx* on *Linux*, shipping *OpenAPI* contracts, multi-tier *JWT* authentication, and *Alembic* migrations validated by 1,024 *Pytest* tests. When a stale-data problem threatened correctness, I rebuilt the refresh path in *Celery* and *Redis* with atomic distributed locks and an idempotent diffing engine that eliminated duplicate alerts under retry storms. I also reverse-engineered a proprietary mobile protocol in *Python* to ingest case records from 25 High Courts and 743 District Courts, close in spirit to the ingestion reliability InfiViz needs for retail data.

In *ncert-rag-evals* I built the retrieval benchmark rather than guessing: fusing BM25 with dense vectors through Reciprocal Rank Fusion reached *86.9% Recall\@5 in 8.9ms on CPU*, cutting latency by *99.8%*, with paired McNemar tests confirming significance (*p = 0.0021*) across 92 tests. In *doubtless*, I instrumented a four-stage *Celery* pipeline with *OpenTelemetry* and *Logfire* to localize per-stage regressions before they touched query paths, and covered the async data layer with 151 *Pytest* tests.

I can start immediately and will relocate to Bengaluru for the full six-month on-site internship. My Python backend work maps closely onto your stack, and I would learn *Django* the way I learned *Celery*, *Redis*, and *FastAPI*: by shipping reviewed code against real traffic. I would welcome the chance to walk through the idempotent diffing engine and the monitoring instrumentation in an interview.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
