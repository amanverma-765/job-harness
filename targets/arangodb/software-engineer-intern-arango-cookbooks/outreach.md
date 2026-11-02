# Cold Outreach & 1-Weekend MVP Package

**Target Company:** ArangoDB Inc.  
**Target Role:** Software Engineer Intern - Arango Cookbooks  
**Target Recipient:** Director of Product Management / Cookbooks Lead (`cookbooks-lead@arangodb.com`)  
**Addressed Hiring Gap:** Building reproducible Python and Jupyter Notebook recipes combining Graph traversals with Vector RAG retrieval

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Arango Cookbooks hybrid retrieval recipe draft  
**Word Count:** 100 words (strictly <= 120 words)

Hi [First Name],

I saw Arango's initiative to build out practical recipes for the Cookbooks repo, especially showing developers how multi-model context eliminates glue code between graph traversals and vector search.

In my open-source project *ncert-rag-evals*, I built an empirical retrieval evaluation harness benchmarking hybrid lexical and dense vector search via Reciprocal Rank Fusion, achieving 86.9% Recall@5 in 8.9ms on CPU with paired McNemar statistical significance testing across 92 unit tests.

The benchmarks, Jupyter Notebook workflows, and test suites are public here: https://github.com/amanverma-765/ncert-rag-evals

Worth 15 minutes to chat through recipe concepts for Arango Cookbooks?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608

---

## 2. Day 5 Follow-Up Draft

Hi [First Name],

Following up with a quick benchmark: I recently drafted a prototype recipe pairing python-arango graph traversals with vector similarity in a single Jupyter Notebook, maintaining under-20ms multi-hop retrieval. Happy to send over the notebook link if helpful.

Best,  
Aman

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build a self-contained Jupyter Notebook recipe demonstrating multi-model hybrid retrieval in `python-arango` over a connected knowledge graph.
- **Scope:** Ingests structured document entities into ArangoDB document and edge collections, runs AQL hybrid queries combining vector cosine similarity with 2-hop graph neighborhood expansion, and formats grounded context for an LLM agent without external vector store glue code. Skips distributed cluster deployments in favor of a local ArangoDB Docker container.
- **Stack:** Python 3.12, `python-arango`, Jupyter Notebooks, Matplotlib, Pytest, Docker, ChromaDB/Sentence-Transformers.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Set up local ArangoDB Docker instance and define graph schema (documents: Articles, edges: References).
  2. *Hours 3-5:* Implement hybrid AQL query joining vector similarity search with 2-hop edge traversal in `python-arango`.
  3. *Hours 6-7:* Package reproducible Jupyter Notebook with business value framing, markdown explanations, and assertion checks.
  4. *Hour 8:* Record 60-second walkthrough and push documented GitHub repo.
- **Deliverables:** Public GitHub repository + executable Jupyter Notebook + 60-second video demo.
