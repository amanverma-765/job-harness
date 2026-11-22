#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 22, 2026",
  recipient_name: "Engineering Team",
  recipient_title: "Backend Engineering, Gurugram",
  company_name: "Apna Mart",
  company_address: "Gurugram, Haryana, India",
  font_size: 11pt,
  leading: 0.88em,
)

Dear Apna Mart Engineering Team,

A ten-minute grocery promise in tier-2 India rests on a franchise model where physical stock sits in 200+ neighbourhood stores while the order book sits in the platform, so every missed count becomes a late delivery rather than a bad record. Reconciling store-level truth against a shared catalogue, and surfacing only the discrepancies an operations team can act on, is the backend problem underneath that promise. It is the shape of the systems I have shipped this past year.

At *LexoLegal*, I architected 38 asynchronous REST APIs in *FastAPI* and *SQLAlchemy 2.0* across 12 *PostgreSQL* tables, with *Alembic* migrations, multi-tier *JWT* authentication, and *1,024 Pytest tests* behind an *Nginx* proxy on *Linux*. The reconciliation work is the closest analogue to store stock: I automated a 12-hour refresh sweep in *Celery* and *Redis* backed by an idempotent diffing engine, so repeated runs produced exactly one notification per genuine change and zero duplicates. In *doubtless*, I designed a four-stage asynchronous ingestion pipeline with thread-safe *SQLite* WAL repositories and *Redis* caching across 151 tests, and in *ncert-rag-evals* I wrote custom hybrid search directly in *SQLite FTS5* to profile eight retrieval strategies on raw CPU latency.

Operational correctness is where I work most carefully. Race conditions in the refresh sweep were removed with atomic *Redis* distributed locks and 10-second countdown requeues at a 90-retry ceiling, and I verified the retrieval benchmark with paired McNemar tests rather than trusting a single run (*p = 0.0021*, with a *99.8%* latency cut at 86.9% Recall\@5 on CPU).

I build daily with *Claude Code* and *Cursor* and review every generated diff against the test suite before merge, matching how your team works. I am enrolled in a B.Tech in Computer Science through 2027 and can relocate to Gurugram immediately for this on-site internship. I would welcome a conversation about stock reconciliation and order tracking.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
