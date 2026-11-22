#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 22, 2026",
  recipient_name: "Gaurav Luhariwala",
  recipient_title: "Founder & CEO",
  company_name: "Elip AI (tryelip.ai)",
  company_address: "San Francisco, USA | Hiring for Gurugram, India",
)

Dear Gaurav,
Every morning Elip re-reads millions of live postings and sends a handful that fit, each with a reason written in plain words. That promise hides two hard problems: ranking over an index that changes daily without re-embedding all of it, and writing a reason a person can audit rather than one the model happens to like. The second is where career agents lose trust, and I have spent a year measuring it instead of guessing.

At *LexoLegal* I built *Munshi*, a WhatsApp legal assistant in *Pydantic AI* and *FastAPI* that orchestrates *Model Context Protocol* servers for Google Drive brief discovery and Calendar scheduling at *sub-2s latency*. Legal briefs and job postings pose the same trust problem: third-party text flowing into an agent that holds user identity and tool access. I isolated authenticated identity inside typed *Pydantic AI* AgentDeps, not model-supplied parameters, so untrusted document text cannot redirect a tool call. The same instinct shapes retrieval: *doubtless* fuses lecture video frames with 45s dialogue windows over an SSE stream, with *Celery* and *Redis* handling ingestion.

Last year I built *ncert-rag-evals* to answer whether hybrid retrieval is worth it. Indexing 4,429 section-aware chunks into *SQLite* FTS5 and *ChromaDB*, Reciprocal Rank Fusion of BM25 and dense vectors reached *86.9% Recall\@5 in 8.9ms on CPU*, matching LLM query expansion at *99.8% lower latency*. Paired *McNemar* tests (*p = 0.0021*) across 92 tests proved the gain, the same eval discipline Elip expects by day 30. *vectorless-rag* priced the alternative: *100% vs 93%* hit rate and *0.85 vs 0.69* citation precision at *2.7x token cost*.

Four people shipping to real users is where I work best. I am available for the full six months and open to relocating to *Gurugram* for on-site work. I would welcome a conversation about how your morning read of the index is ranked, and where a candidate's constraints belong in that pipeline.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
