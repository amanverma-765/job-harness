# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Icertis (Vera Platform, Applied AI Engineering)  
**Target Role:** AI Engineering Intern (Job ID 7861, Pune)  
**Target Recipient:** Applied AI Engineering lead or Architect on Vera Agents, Pune  
**Corporate Email Format:** `careers@icertis.com` (posted contact) or `first.last@icertis.com`  
**Addressed Hiring Gap:** Server-side tool authorization and clause-level grounding for semi-autonomous contract agents  

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Guardrails for clause-level agent actions  
**Word Count:** 101 words (strictly <= 120 words; subject strictly <= 7 words)  

Hi Team,

Vera Agents moved Icertis from answering questions about contracts to changing obligation states inside customer guardrails, which makes tool authorization the load-bearing part of the stack rather than the model.

I hit that same wall building an autonomous legal assistant at LexoLegal. Tenant identity lives in Pydantic AI agent dependencies, never in tool parameters, so a prompt cannot widen its own reach. Answers hold at sub-2s, every webhook is signature checked, and 1,024 Pytest tests sit under the API layer.

Pattern and retrieval benchmarks: github.com/amanverma-765/doubtless

Worth 15 minutes on where Vera draws that boundary?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608  

---

## 2. Day 5 Follow-Up Draft

Hi Team,

Following up on clause-level agent guardrails: I built a small harness where the agent's tool scope is injected from server-side dependencies and each answer cites the clause it read, with Recall@5 measured across three ranking strategies. Happy to send the repo or the numbers if useful.

Best,  
Aman  

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build a cited clause Q&A agent in Python that answers only from retrieved contract clauses, refuses when retrieval returns nothing, and logs every tool call against a server-side permission policy.
- **Scope:** Ingests 20 sample contract clauses into SQLite FTS5 and ChromaDB, fuses both with Reciprocal Rank Fusion, and drives a Pydantic AI agent whose permitted tools are injected through agent dependencies rather than described in the prompt. Exposes a React review panel that streams answers with clause citations. Skips real contract ingestion, auth providers, and multi-tenant deployment.
- **Stack:** Python 3.12, FastAPI, Pydantic AI, SQLite FTS5, ChromaDB, React 19, TypeScript, Vite, Pytest, Docker Compose.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Docker Compose with FastAPI, SQLite FTS5, and ChromaDB; index 20 sample clauses with section identifiers.
  2. *Hours 3-4:* Hybrid retrieval with Reciprocal Rank Fusion plus a Recall@5 harness comparing BM25, dense, and fused ranking.
  3. *Hours 5-6:* Pydantic AI agent with tool scope bound to server-side dependencies, a refusal path on empty retrieval, and per-call policy logging.
  4. *Hour 7:* React 19 panel consuming SSE frames with AbortSignal cancellation and clickable clause citations.
  5. *Hour 8:* 30 Pytest and Vitest checks, a refusal-rate table, and a 60-second walkthrough.
- **Deliverables:** Public GitHub repository, retrieval ablation table, refusal-rate report, and a 60-second architecture walkthrough.
