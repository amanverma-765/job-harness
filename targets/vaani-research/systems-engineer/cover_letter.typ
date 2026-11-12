#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 10, 2026",
  recipient_name: "Nitesh Tripathi & The Engineering Team",
  recipient_title: "Co-Founder & Systems Engineering Lead",
  company_name: "Vaani Research Labs",
  company_address: "Bengaluru, Karnataka, India"
)

Dear Nitesh and the Vaani Engineering Team,

Vaani Research Labs' mission of pioneering sovereign speech foundation models and real-time voice infrastructure from India establishes an inspiring frontier for systems engineering. Scaling distributed speech systems from multi-station audio recording to sub-second streaming requires solving critical systems bottlenecks, particularly bounded ring buffers, backpressure handling, and fault-tolerant local persistence under bursty network writes. Having engineered asynchronous streaming pipelines and high-throughput background queues in *Python*, *Celery*, and *Redis*, my systems focus aligns directly with Vaani's engineering culture.

During my software engineering internship at *LexoLegal*, I built asynchronous REST APIs in *FastAPI* and *PostgreSQL* behind an *Nginx* proxy, structuring RFC 9457 error contracts containerized via *Docker*. To eliminate race conditions from rapid webhook spikes, I engineered worker queues in *Celery* with atomic *Redis* distributed locks, while automating daily ingestion across 25 High Courts and 743 District Courts via batch *PostgreSQL* updates. Additionally, I deployed 'Munshi', an autonomous assistant in *Pydantic AI* and *FastAPI*, orchestrating *Model Context Protocol (MCP)* clients to execute brief retrieval with *sub-2s latency*.

Production voice infrastructure demands deterministic testing and benchmarks to guarantee zero data loss. Across my open-source projects, every system is anchored in empirical metrics: *doubtless* features 151 automated tests validating an asynchronous 4-stage media pipeline (PipelineRunner) in *Celery* and *Redis* that slices 16kHz audio (under 15MB/hr) and transcribes in under 10s, backed by thread-safe *SQLite* WAL persistence and tracing via *OpenTelemetry* and *Logfire*. In *ncert-rag-evals*, I engineered hybrid retrieval on raw CPU, proving that fusing BM25 and dense embeddings with Reciprocal Rank Fusion (RRF) achieves *86.9% Recall at 5 in 8.9ms* across 92 unit tests in *Pytest* (*p = 0.0021*).

Available immediately for the 6-month on-site Vaani Voice Fellowship or full-time Systems Engineering in Bengaluru, I welcome an introductory discussion regarding your distributed audio ingestion pipeline and take-home systems challenge.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
