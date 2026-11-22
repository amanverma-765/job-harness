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
  recipient_title: "Product Development Division",
  company_name: "Shure India",
  company_address: "Hyderabad, Telangana, India",
  font_size: 10.5pt,
  leading: 0.74em
)

Dear Engineering Hiring Team,

Shure's 2026 releases moved AI from research demos into shipped audio hardware: the MXA925 ceiling array and the IntelliMix Bar Pro both generate transcripts and summaries for enterprise meeting rooms. Shipping those features while publishing commitments to on-device processing, data minimization, and opt-in cloud inference turns responsible AI into an engineering constraint rather than a marketing claim. That constraint is where I want to build software.

As a Software Development Engineer Intern at *LexoLegal*, I implemented 38 asynchronous *REST APIs* in *FastAPI* and *PostgreSQL* behind Nginx, then built "Munshi", an autonomous assistant orchestrating *Model Context Protocol* clients across Google Drive and Calendar to schedule hearings at *sub-2s latency*. Because it served multiple law firms, I bound verified user identity inside Pydantic AI AgentDeps instead of LLM tool parameters, eliminating cross-tenant prompt injection and limiting each sandboxed workspace to its own tools. At *Webxela*, I shipped Square POS OAuth onboarding in *Java* and *Spring Boot* alongside a *Kotlin* monitoring service sweeping 5,000-record chunks across 25 parallel workers.

Testing and measurement anchor that work. In *doubtless*, I instrumented distributed tracing through *OpenTelemetry* and validated a four-stage *Celery* and *Redis* ingestion pipeline across *151 tests*. In *ncert-rag-evals*, I implemented hybrid retrieval from scratch in *SQLite FTS5* and *ChromaDB* and proved Reciprocal Rank Fusion reached *86.9% Recall\@5 in 8.9ms on CPU*, a *99.8% latency cut* confirmed by paired McNemar tests (*p = 0.0021*). I also shipped a *Kotlin Multiplatform* legal client across Android and iOS with *85% shared code* and *168 tests*.

I am available full-time for this on-site internship in Hyderabad and ready to relocate for its duration. I would welcome a short conversation about how agentic tooling with review gates and contract-first *REST* services can support Shure's software engineering team. My repositories are public at github.com/amanverma-765.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
