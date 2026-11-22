#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 22, 2026",
  recipient_name: "Engineering Hiring Team",
  recipient_title: "Forward Deployed Engineering",
  company_name: "Bynry Inc.",
  company_address: "Serene Tower, Pakharbaug, Pune, Maharashtra 411021",
)

Dear Engineering Hiring Team,

SMART360 Next promises utilities a production go-live in 20 to 24 weeks rather than the 12 to 18 months legacy CIS vendors quote, and on a platform shipping 11 services per account across 11 languages, that timeline puts the real delivery risk into per-customer integration and configuration drift. Forward deployed engineering is the function that absorbs that risk, which is why the role reads less like an internship and more like small-scale product engineering with a customer attached.

That shape of work is what I have already been doing at *LexoLegal*. There I implemented 38 asynchronous REST APIs in *FastAPI* and *SQLAlchemy 2.0* across 12 *PostgreSQL* tables, wrote *Alembic* SQL migrations, and held the surface to 1,024 *pytest* tests while partners integrated against published *OpenAPI* contracts. Alongside that I automated a recurring case refresh sweep in *Celery* and *Redis* with idempotent diffing, which is the same discipline a webhook handler needs when a utility's meter or payment vendor retries a payload.

Accuracy checking is the part I find most interesting, because retrieval features fail quietly. My *ncert-rag-evals* repository indexes 4,429 section-aware chunks and measures retrieval quality rather than assuming it: *86.9% Recall\@5* at *8.9ms* on CPU, with paired McNemar testing (*p = 0.0021*) across 92 tests to separate real gains from noise. Those same harnesses would let me verify that an LLM workflow answers a utility billing question from the tariff document and not from a plausible guess.

I can start immediately and I am ready to relocate to Pune for the hybrid schedule, for the full internship term. A short conversation about where SMART360 integrations break first would be a useful place to begin.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
