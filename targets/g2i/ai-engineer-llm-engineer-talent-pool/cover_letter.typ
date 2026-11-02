#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 2, 2026",
  recipient_name: "Engineering Talent & Community Team",
  recipient_title: "AI & Frontier Models Community",
  company_name: "G2i Inc.",
  company_address: "Miami, FL, USA (Remote)"
)

Dear G2i Talent and Engineering Team,

G2i's platform plays a pivotal role in equipping top AI labs with vetted engineers capable of building verifiable evaluation harnesses, RL environments, and high-fidelity post-training datasets for frontier models. As frontier model capabilities evolve toward complex multi-turn reasoning and tool use, the bottleneck has shifted from raw data volume to rigorous post-training environments with deterministic evaluation harnesses. Having engineered open-source retrieval evaluation benchmarks and autonomous agent systems, I have directly addressed the technical challenges of paired statistical validation, tool-use execution sandboxing, and latency profiling that frontier labs require.

In my open-source benchmark *ncert-rag-evals*, I constructed an empirical evaluation testbed across 17 STEM textbooks in *Python* and *Jupyter Notebooks*, implementing custom hybrid search in *SQLite FTS5* and *ChromaDB* to evaluate 8 retrieval strategies on raw CPU hardware. By fusing BM25 lexical search with dense embeddings via Reciprocal Rank Fusion (RRF), I proved an empirical *86.9% Recall\@5 in 8.9ms on CPU*, matching LLM query expansion while cutting latency by *99.8%*. Additionally, in *vectorless-rag*, I benchmarked dense vector search against LLM-based page indexing using *Pydantic AI* and *Ollama*, mapping the *2.7x token cost* and *2x latency* trade-offs across benchmark queries while streaming page windows via *PyMuPDF* with bounded memory (*under 200MB*).

Frontier training and evaluation workflows demand deterministic verification over ungrounded vanity metrics. To ensure empirical defensibility in *ncert-rag-evals*, I validated retrieval significance using paired McNemar statistical hypothesis tests (*p = 0.0021*) supported by 92 unit tests in *Pytest*. Furthermore, during my software engineering internship at *LexoLegal*, I built autonomous multi-turn assistants using *Pydantic AI* and *FastAPI*, isolating verified user identities inside AgentDeps to eliminate prompt injection risks and orchestrating *Model Context Protocol (MCP)* clients alongside *Celery* and *Redis* distributed locks to handle burst traffic with *sub-2s latency*.

I am excited to bring this evaluation rigor, agentic architecture background, and benchmark discipline to the G2i Talent Pool for client projects across top AI labs. As an engineer based in India, I operate smoothly across asynchronous remote workflows, and I look forward to completing the technical assessment and contributing to frontier AI evaluation and training initiatives.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
