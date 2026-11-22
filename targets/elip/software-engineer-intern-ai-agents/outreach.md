# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Elip AI (YC W25)
**Target Role:** Software Engineer Intern - AI Agents & Search
**Target Recipient:** Gaurav Luhariwala, Founder & CEO
**Channel:** LinkedIn (`linkedin.com/in/gauravluhariwala`) or founder booking link (`cal.com/gl-elip/x`)
**Note:** No verified individual engineering email is published, so this draft is written for LinkedIn or the call link, not a guessed address.
**Addressed Hiring Gap:** Hybrid retrieval cost and freshness over a daily-changing jobs index (Gap 1 in `role_analysis.md`)

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Re-embedding millions of postings every morning
**Word Count:** 104 words in body (limit: 120); subject is 6 words (limit: 7)

Hi Gaurav,

Elip re-reads millions of postings each morning and has to explain every match in plain words. The unglamorous half is the index: re-embedding all of it daily is unaffordable, and lexical-only search misses "SDE II" for "Software Engineer II".

I built ncert-rag-evals to measure exactly that. Fusing BM25 with dense vectors through Reciprocal Rank Fusion held 86.9% Recall@5 at 8.9ms on CPU, a 99.8% latency cut, proven with paired McNemar tests (p = 0.0021) across 92 tests.

Repo: https://github.com/amanverma-765/ncert-rag-evals

Worth 15 minutes to walk through the fusion and cost trade-offs, and the intern role?

Aman Verma
akverma4aman@gmail.com | +91 6386617608

---

## 2. Day 5 Follow-Up Draft

Hi Gaurav,

One follow-up detail: I also priced the alternative. LLM page indexing hit 100% vs 93% retrieval hit rate and 0.85 vs 0.69 citation precision in vectorless-rag, but costs 2.7x tokens at 2x latency, which is why I would fuse and rerank instead of paying that on every morning refresh.

Happy to share the benchmark notebook if the ranking trade-off is on your roadmap.

Aman

---

## 3. 1-Weekend MVP Demo Specification

### Scope
A hybrid job-matching service over a 50,000-posting synthetic index that increments only on changed postings, fuses lexical and dense candidates, and returns a typed match object with a one-line reason. It does not build a candidate conversation flow, does not scrape live job boards, and does not train a ranker. Those are deliberately out of scope so the weekend produces a measurable retrieval and eval demo rather than a half-finished product.

### Stack
Python 3.12, FastAPI, PostgreSQL with `tsvector` full-text search, ChromaDB for dense vectors, Reciprocal Rank Fusion in pure Python, Pydantic AI for the structured match object plus reason, pytest for the eval suite, Docker Compose for local runs.

### Deliverables
- Deployed URL on Fly.io or Render (free tier is enough for 50k postings)
- Public GitHub repository with the eval notebook committed
- 60-second Loom demo showing a query, the fused ranking, and the eval table

### Build Steps (Total: 8 hours)
1. **Hours 1-2:** Containerize FastAPI plus PostgreSQL and ChromaDB in Docker Compose; load 50,000 synthetic postings with `updated_at` timestamps and generate embeddings for the initial set only.
2. **Hours 3-4:** Implement incremental indexing: hash each posting body, re-embed only rows whose hash changed, and delete embeddings for closed postings so stale results cannot surface.
3. **Hours 5-6:** Add lexical retrieval over `tsvector`, dense retrieval over ChromaDB, Reciprocal Rank Fusion of both candidate lists, and a Pydantic AI call that emits a validated `Match(job_id, score, reason)` object.
4. **Hours 7-8:** Write the eval suite: 30 labeled queries, Recall@5 and nDCG per strategy (lexical, dense, fused), a paired McNemar test between fused and best single strategy, then record the Loom and deploy.

### Why This Closes the Gap
The demo answers the exact question Elip's day-60 vertical asks: does fusion beat a single retriever on this index, at what latency, and does a significance test support the claim. Every number in it is reproducible from the committed notebook.
