#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 2, 2026",
  recipient_name: "Quantitative Infrastructure Hiring Team",
  recipient_title: "AI/ML Engineering Group",
  company_name: "Tower Research Capital LLC",
  company_address: "Gurugram, Haryana, India"
)

Dear Quantitative Infrastructure Hiring Team,

Tower Research Capital's leadership in high-frequency algorithmic trading and low-latency infrastructure requires data pipelines that process massive event streams with predictable, microsecond-level performance. Engineering high-throughput feature retrieval under strict latency SLAs demands eliminating memory overhead and asynchronous queue contention rather than relying on brute-force hardware scaling. Having built and benchmarked local-first search and evaluation pipelines in *Python*, *C++*, and *Linux*, I have tackled the exact latency and concurrency bottlenecks that emerge when merging high-dimensional distributions under load.

In my open-source systems project *doubtless*, I developed an asynchronous hybrid retrieval engine fusing lexical BM25 algorithms with dense vector embeddings via Reciprocal Rank Fusion (RRF). By optimizing CPU instruction pipelines and binding custom *C++* routines to SQLite indexes, I achieved an empirical *86.9% Recall\@5* at *8.9ms latency* on commodity CPU cores. Additionally, during my software development engineer internship at *LexoLegal*, I architected legal search APIs across *40,000 regulatory documents*, cutting query latency from *850ms to 110ms* through *Redis* distributed caching and indexed table partitioning.

My engineering philosophy prioritizes statistical rigor and empirical verification over speculative claims. In *ncert-rag-evals*, I built an automated evaluation framework encompassing *84 unit and integration test suites* using *pytest*, benchmarking context retrieval across *12,000 document chunks* to achieve *350 evaluations per second* with confirmed statistical significance (*p < 0.01*). I ensure every architectural tradeoff is verified against repeatable, deterministic test harnesses.

I am eager to apply this systems focus to the AI/ML Engineering Intern role at Tower Research Capital. I am available for immediate engagement, fully prepared to contribute in your Gurugram office, and welcome the opportunity to discuss how my systems and evaluation background can support your infrastructure initiatives.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
