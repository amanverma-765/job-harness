#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 22, 2026",
  recipient_name: "Dheemanth R",
  recipient_title: "Chief Technology Officer",
  company_name: "Discover Dollar Technologies",
  company_address: "Bengaluru, Karnataka, India",
  font_size: 11.2pt,
  leading: 0.80em,
)

Dear Dheemanth,
Shield's claims workspace is a human-in-the-loop system wearing the costume of a dashboard. Every anomaly your models flag becomes a claim that a client finance team forwards to a vendor, so a false positive costs commercial trust while a missed one only costs a number. That asymmetry, more than model choice, decides whether agentic recovery holds up across multi-terabyte AP batches of invoices, POs, contracts, and email threads.

At *LexoLegal* I built *Munshi*, a WhatsApp legal assistant in *Pydantic AI* and *FastAPI* that orchestrates *Model Context Protocol* clients over Google Drive and Calendar to find briefs and schedule hearings at *sub-2s latency*. Legal briefs and supplier contracts raise the same trust problem: untrusted third-party text flowing into an agent that holds user identity and tool access. I isolated verified identity inside typed *Pydantic AI* AgentDeps instead of model-supplied tool parameters, so hostile document content cannot redirect a tool call, and I kept retried work exactly-once with *Celery* and *Redis* under a *90-retry ceiling*.

Auditability is the harder half. In *doubtless* I instrumented an agent and a four-stage ingestion pipeline with *OpenTelemetry* and *Logfire*, capturing tool calls, model responses, and latency across *151 tests*, which is the trace granularity an audit trail needs. *ncert-rag-evals* is where I learned to defend quality numbers: *86.9% Recall\@5 in 8.9ms on CPU* from Reciprocal Rank Fusion of BM25 and dense vectors in *SQLite* FTS5 and *ChromaDB*, with paired *McNemar* tests (*p = 0.0021*) proving the gain across 92 tests. Extraction decisions deserve the same regression gate before a prompt or model change ships.

I am available for the internship and ready to relocate to *Bengaluru* for on-site work. A short conversation about where claim decisions should stay deterministic, and where an LLM earns its cost, would be time well spent.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
