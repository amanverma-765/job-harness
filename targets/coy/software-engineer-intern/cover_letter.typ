#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 12, 2026",
  recipient_name: "Founding & Engineering Team",
  recipient_title: "Core Technology Team",
  company_name: "Coy (Fiquity Technology Private Limited)",
  company_address: "Gurugram, Haryana, India"
)

Dear Founding & Engineering Team at Coy,

Coy's quiet, double-blind approach to contact matching at getcoy.com reimagines consumer internet discovery by eliminating public profiles, swiping fatigue, and social friction. Building a privacy-preserving platform where unrequited interest remains confidential while delivering instant mutual-match notifications demands backend rigor, keyed cryptographic hashing, and resilient message dispatch. Having engineered systems across *Python*, *FastAPI*, *Kotlin*, *Spring Boot*, *Redis*, and *PostgreSQL*, my background directly addresses the full-stack architecture, contact matching, and third-party integration challenges facing Coy's core team.

At *LexoLegal*, I architected asynchronous REST APIs in *FastAPI* and *PostgreSQL* behind an *Nginx* proxy on *Linux*, containerizing services with *Docker* and *GitHub Actions* CI/CD. To deliver reliable alerts without spamming users, I built an automated 12-hour background sweep in *Celery* and *Redis* with a two-stage notification ledger guaranteeing zero duplicate alerts and zero message loss, while engineering an autonomous WhatsApp assistant, 'Munshi', operating with *sub-2s latency*. At *Webxela*, I structured *Clean Architecture* in *Spring Boot*, implementing Square POS *OAuth 2.0* merchant onboarding with idempotent payment verification.

Consumer platforms operating mutual matching require concurrency safety and empirical profiling. In my project *doubtless*, I built an asynchronous 4-stage pipeline in *Celery* and *Redis*, designing a thread-safe *SQLite* WAL repository with *OpenTelemetry* and *Logfire* tracing across 151 unit tests. In *ncert-rag-evals*, I implemented custom hybrid retrieval in *SQLite FTS5* and ChromaDB, optimizing CPU execution to achieve *86.9% Recall\@5 in 8.9ms* (cutting query latency by *99.8%*) and confirming statistical significance across 92 *Pytest* suites (p = 0.0021).

Contributing as a Software Engineer Intern offers the exact environment where my builder mindset, backend foundation, and independent shipping experience can create immediate user impact. Enrolled in a B.Tech in Computer Science (graduating in 2027), I am immediately available for your 6-month hybrid internship in Gurgaon and look forward to discussing technical contributions.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
