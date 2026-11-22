#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 22, 2026",
  recipient_name: "Abhinav Dhiman",
  recipient_title: "Head of Business Intelligence",
  company_name: "iion",
  company_address: "Sydney, Australia (remote, India)",
)

Dear Abhinav Dhiman,

Gaming delivers five to twenty times the attention of other digital formats while still absorbing under five percent of ad spend, and iion's Attention Advantage benchmark makes that gap hard to ignore. Closing it depends less on media buying than on whether the operational layer behind each campaign can reason through unstructured requests at the speed of a client email. That is exactly the shift your team is making from rules-based automation to agentic workflows.

At *LexoLegal* I shipped that kind of workflow into production rather than a notebook. *Munshi*, a WhatsApp legal assistant built on *Pydantic AI* and *FastAPI*, orchestrates *Model Context Protocol* clients across Google Drive and Calendar to find briefs and schedule hearings at *sub-2s latency*, with verified user identity bound inside AgentDeps so one tenant can never reach another tenant's tools. Around it I implemented 38 asynchronous *REST APIs* over *PostgreSQL* and a *Celery* refresh pipeline whose distributed locks and diffing checks keep retries idempotent.

Evaluation discipline is what I would bring to shadow mode. In *ncert-rag-evals* I benchmarked eight retrieval strategies from scratch and proved a Reciprocal Rank Fusion design reached *86.9% Recall\@5 in 8.9ms on CPU*, validated by paired *McNemar* tests (*p = 0.0021*) instead of eyeballed wins. In *doubtless* I instrumented every agent run with *OpenTelemetry* and *Logfire* and held the service to 107 *pytest* tests, which is the trace-first habit that makes reasoning-log analysis and hallucination triage tractable.

My B.Tech in Computer Science at Veer Bahadur Singh Purvanchal University finishes in 2027, and I am available to start the full six-month internship immediately, working remotely from Jaunpur with overlap for APAC and Europe hours. A short conversation about which operational workflow you would want an agent observing in shadow mode first would be time well spent.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
