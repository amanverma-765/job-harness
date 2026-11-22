#import "/core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 22, 2026",
  recipient_name: "Engineering Hiring Team",
  recipient_title: "",
  company_name: "Agoda",
  company_address: "Gurugram, Haryana, India",
)

#show par: set par(spacing: 0.85em)

Dear Engineering Hiring Team,

Agoda's booking platform runs on a *Kafka* backbone carrying trillions of events a day, and how that stack has evolved says a lot: core services moving from Scala to *Kotlin*, Feature Store Serving rewritten in Rust for an 84 percent cut in compute cost. That instinct to rebuild rather than decorate infrastructure, at a company serving millions of requests daily, is where a Kotlin-first backend engineer wants to spend six months.

#v(0.62em)


At *LexoLegal* I wrote the backend of a legal document platform: *38 asynchronous REST APIs* in *FastAPI* and *SQLAlchemy 2.0* across *12 PostgreSQL tables* behind *Nginx*, with Alembic migrations and *1,024 pytest tests* guarding each change. The lasting lesson was idempotency, built into a 12-hour case-refresh sweep in *Celery* and *Redis* with atomic distributed locks and a two-stage dispatch and deliver ledger, so retried jobs never duplicate a record. Shipping the *Kotlin Multiplatform* client for the same product showed what shared models buy you.

#v(0.62em)


Rigor matters as much in measurement as in code. In *ncert-rag-evals* I benchmarked eight retrieval strategies over 17 textbooks, wrote hybrid BM25 and dense search from scratch in *SQL* on *SQLite FTS5* and *ChromaDB*, and measured *86.9 percent Recall\@5 at 8.9ms* on CPU, validated with paired McNemar tests at *p = 0.0021*. In *doubtless* I built a *Pydantic AI* doubt-solver with a four-stage *Celery* pipeline that transcribes lectures in under ten seconds, then instrumented it with *OpenTelemetry* traces. I defend numbers, not adjectives.

#v(0.62em)


The January 2027 start fits my final year at Veer Bahadur Singh Purvanchal University: I can commit full-time from 11 January to 30 June 2027, work from the Gurugram office twice a week, and relocate without conditions; my university issues the No Objection Certificate the program requires. A short conversation about where Kotlin services or an event pipeline could use another pair of hands would be welcome.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
