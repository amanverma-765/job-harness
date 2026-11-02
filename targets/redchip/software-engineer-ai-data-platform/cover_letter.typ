#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 2, 2026",
  recipient_name: "Engineering Leadership",
  recipient_title: "AI & Data Platform Team",
  company_name: "RedChip Companies, Inc.",
  company_address: "Orlando, FL, USA (Remote)"
)

Dear Engineering Leadership and AI Platform Team,

RedChip's strategic expansion of the RedChat platform into a real-time financial intelligence assistant transforms how investors extract insights from complex SEC filings, market data, and small-cap disclosures. Powering this conversational research loop requires resilient, queue-backed data pipelines, high-precision hybrid retrieval across numerical financial statements, and low-latency API infrastructure. Having engineered production-grade data ingestion pipelines and custom retrieval engines in *Python*, *FastAPI*, and *PostgreSQL*, my background directly addresses the challenges of turning massive unstructured regulatory filings into sub-second assistant workflows.

During my software engineering tenure at *LexoLegal*, I architected asynchronous REST APIs in *FastAPI* and *PostgreSQL* behind an *Nginx* proxy, building autonomous assistants with *sub-2s latency* via *Pydantic AI* tool-calling loops. To maintain real-time document synchronization across 25 High Courts and 743 District Courts, I automated daily ingestion pipelines via *Celery* workers and *Selectolax* DOM extractors, executing batch *PostgreSQL* inserts with atomic *Redis* distributed locks to eliminate race conditions. Furthermore, in *ncert-rag-evals* and *vectorless-rag*, I implemented custom hybrid search in *SQLite FTS5* and *ChromaDB* via Reciprocal Rank Fusion (RRF), proving an empirical *86.9% Recall\@5 in 8.9ms on CPU* (a *99.8% latency reduction*), while streaming document windows in *PyMuPDF* under a strict *under-200MB memory ceiling*.

Financial research systems demand absolute numerical precision and high reliability over black-box abstractions. Across my projects, every system is reinforced with empirical evaluation and comprehensive automated test suites, including 92 *Pytest* suites in *ncert-rag-evals* with paired McNemar statistical significance testing (*p = 0.0021*) and 151 tests in *doubtless* with distributed tracing across *OpenTelemetry* and *Logfire*. This disciplined engineering ensures data pipelines process filings without worker starvation or silent data loss.

I am eager to contribute immediately to RedChip's AI and data platform as a Software Engineer. Based in India, I am fully equipped for remote contract work, comfortable collaborating across international timezones, and welcome the opportunity to discuss the technical direction of RedChat.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
