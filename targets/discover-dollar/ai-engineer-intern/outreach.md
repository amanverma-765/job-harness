# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Discover Dollar Technologies
**Target Role:** AI Engineer Intern (Agentic AI)
**Target Recipient:** Dheemanth R, Chief Technology Officer
**Channel:** LinkedIn DM (`linkedin.com/in/dheemanthr`). No verified personal engineering address is published, so do not guess an email. Application itself goes through `discoverdollar.keka.com` or the Techstars listing.
**Addressed Hiring Gap:** Gap 2 (per-step tracing so agent decisions are auditable) and Gap 1 (eval harness for extraction and claim accuracy) in `role_analysis.md`

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Audit trails need per-step agent traces
**Word Count:** 104 words in body (limit: 120); subject is 6 words (limit: 7)

Hi Dheemanth,

Shield promises auditable claims, yet a multi-step agent decision is a black box unless every tool call and model response is its own span. Retries and human approvals make that worse, because a requeued worker can double-flag the same claim.

I instrumented an agent and its four-stage ingestion pipeline with OpenTelemetry and Logfire in doubtless, capturing tool calls, model responses and latency across 151 tests. Separately, ncert-rag-evals proves retrieval gains with paired McNemar tests (p = 0.0021) so a prompt change cannot ship on vibes.

Repo: github.com/amanverma-765/doubtless

Worth 15 minutes on where claim decisions should stay deterministic?

Aman Verma
akverma4aman@gmail.com | +91 6386617608

---

## 2. Day 5 Follow-Up Draft

Hi Dheemanth,

Following up with the companion problem. Trace data is only useful if a claim's quality is measurable, so I would pair those spans with a scoring suite: 200 synthetic invoice, PO and contract triples across your 40+ leakage scenarios, precision and recall per scenario, McNemar between the current prompt and the candidate one.

Happy to send the harness design if eval coverage is on the roadmap.

Aman

---

## 3. 1-Weekend MVP Demo Specification

### Scope
A claims-confidence harness over synthetic AP documents: ingest invoice, PO and contract triples, run a deterministic extractor plus one LLM decision step, emit a typed `Claim` object with span-level trace, and score the run against labeled leakage scenarios. It does not build a claims UI, does not integrate an ERP, and does not touch client data. Those are deliberately out of scope so the weekend produces a measurable reliability demo instead of a half-finished product.

### Stack
Python 3.12, FastAPI, Pydantic for the `Claim` schema, SQLite for claim and label storage, Pydantic AI for the single decision step, OpenTelemetry spans exported to a local collector, pytest and Matplotlib for the eval tables, Docker Compose for local runs.

### Deliverables
- Public GitHub repository with the eval notebook and the generated synthetic corpus committed
- One command that runs ingest, decide, score, and prints a per-scenario precision and recall table
- 60-second Loom: a single claim's trace waterfall beside the score table it contributes to

### Build Steps (Total: 8 hours)
1. **Hours 1-2:** Generate 200 synthetic triples (invoice, PO, contract clause) covering 6 leakage scenarios such as duplicate payment, missed rebate, price above contract, and unit-of-measure mismatch. Label each with the expected claim or no-claim.
2. **Hours 3-4:** Build the decision step: deterministic field extraction, then a Pydantic AI call that returns a validated `Claim(scenario, amount, evidence_spans, confidence)` or an explicit no-claim.
3. **Hours 5-6:** Instrument every step with OpenTelemetry spans (document parse, retrieval of the matching clause, model call with token counts, validation, decision). Export to a local OTLP collector and render the waterfall.
4. **Hours 7-8:** Score the run: per-scenario precision and recall, false-positive count weighted by claimed amount, and a paired McNemar test between two prompt variants. Commit the notebook and record the Loom.

### Why This Closes the Gap
It answers the two questions the role actually turns on: can a flagged claim be traced back to the exact clause and model call that produced it, and does a change to the prompt measurably improve or degrade claim quality. Both numbers come out of a committed notebook, so the result is reproducible rather than asserted.
