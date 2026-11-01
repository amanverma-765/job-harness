#import "cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 98765 43210",
  email: "aman@example.com",
  linkedin: "linkedin.com/in/amanverma",
  site: "github.com/amanverma-765",
  date_str: "November 1, 2026",
  recipient_name: "Engineering Hiring Team",
  recipient_title: "Distributed Systems Group",
  company_name: "Target Technologies Inc.",
  company_address: "San Francisco, CA"
)

Dear Engineering Hiring Team,

Your recent engineering update on scaling hybrid retrieval across distributed cluster nodes caught my attention, specifically the operational challenge of keeping p95 latency under 50ms while document corpus size quadrupled. Having built and benchmarked local-first retrieval engines that fuse lexical BM25 search with dense neural embeddings, I have encountered and resolved the exact latency bottlenecks that emerge when fusing disparate score distributions under concurrent load.

In my recent open-source systems work on *doubtless*, I engineered an asynchronous retrieval pipeline in *Python* and *SQLite FTS5* utilizing Reciprocal Rank Fusion (RRF). By benchmarking CPU vector operations and optimizing inverted index traversals, I achieved an empirical *86.9% Recall\@5* at *8.9ms latency* on commodity hardware. Additionally, during my backend internship at *LexoLegal*, I architected legal document search APIs that scaled to *40,000 regulatory filings*, reducing query latency from *850ms to 110ms* through indexed database partitioning and *Redis* caching.

My engineering discipline focuses heavily on rigorous evaluation over marketing claims. In my project *ncert-rag-evals*, I authored *84 deterministic test suites* using *pytest*, benchmarking context retrieval across *12,000 document chunks* to verify statistical significance (*p < 0.01*). I ensure every architectural tradeoff is verified against repeatable test harnesses rather than assumptions.

I am enthusiastic about the opportunity to contribute to your core infrastructure challenges. I am available for immediate engagement, open to full-time remote collaboration, and prepared to discuss how my systems background aligns with your engineering goals.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
