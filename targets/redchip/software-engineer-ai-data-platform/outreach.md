# Cold Outreach & 1-Weekend MVP Package

- **Target Company:** RedChip Companies, Inc.
- **Target Role:** Software Engineer (AI / Data Platform)
- **Target Recipient:** Engineering Leadership / Dave Gentry (`dave@redchip.com`)
- **Addressed Hiring Gap:** High-throughput SEC filing ingestion and hybrid retrieval for RedChat AI

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Scaling SEC filing ETL for RedChat  
**Word Count:** 106 words (strictly <= 120 words)

Hi Dave,

I noticed RedChip's expansion of RedChat to deliver real-time AI stock analysis across SEC EDGAR filings and financial disclosures.

During my software engineering tenure at LexoLegal, I automated daily ingestion pipelines across 768 judicial bodies via Celery workers with Selectolax extractors and batch PostgreSQL inserts, using atomic Redis locks to eliminate race conditions under burst traffic. In ncert-rag-evals, I benchmarked hybrid search using Reciprocal Rank Fusion, achieving 86.9% Recall@5 in 8.9ms on CPU (cutting latency by 99.8%) across 92 tests.

The benchmark code and evaluation harness are public here: https://github.com/amanverma-765/ncert-rag-evals

Worth 15 minutes to chat through data pipeline and retrieval trade-offs for RedChat?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608

## 2. Day 5 Follow-Up Draft

Hi Dave,

Following up with a quick note: I prototyped an EDGAR 10-Q parser streaming section-aware HTML tables into SQLite FTS5 and ChromaDB with an under-150MB memory footprint. Happy to share the repo if this would be useful for the RedChat data platform.

Best,  
Aman

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build an end-to-end SEC EDGAR 10-Q streaming ingestion and hybrid search API prototype for small-cap stock research.
- **Scope:** Ingests live 10-Q filing feeds directly from the SEC EDGAR system, extracts narrative disclosures and financial tables using Selectolax with bounded memory (<150MB), indexes chunks into SQLite FTS5 (lexical) and ChromaDB (vector), and exposes a FastAPI endpoint running Reciprocal Rank Fusion (RRF) to answer financial queries with source citations. Skips historical multi-year backfilling in favor of current-quarter live filing feeds.
- **Stack:** Python 3.12, FastAPI, Celery, Redis, SQLite FTS5, ChromaDB, Selectolax, Docker, Pytest.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Configure asynchronous SEC EDGAR RSS polling client with rate-limiting compliance (10 req/sec header limits).
  2. *Hours 3-4:* Build streaming document parser in Selectolax extracting Item 1A (Risk Factors) and Item 2 (MD&A) tables under 150MB RAM.
  3. *Hours 5-6:* Implement hybrid search index in SQLite FTS5 and ChromaDB with Reciprocal Rank Fusion ranking.
  4. *Hours 7-8:* Expose FastAPI streaming endpoint with SSE and package Docker container with automated Pytest verification.
- **Deliverables:** Public GitHub repository + Deployed API demo + 60s Loom walkthrough demonstrating sub-second filing queries.
