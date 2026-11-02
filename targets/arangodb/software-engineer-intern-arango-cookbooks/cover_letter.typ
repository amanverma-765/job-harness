#import "../../../core/templates/cover_letter_base.typ": cover_letter

#show: cover_letter.with(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "November 2, 2026",
  recipient_name: "Director of Product Management",
  recipient_title: "Cookbooks & Developer Experience Team",
  company_name: "ArangoDB Inc.",
  company_address: "San Francisco, CA, USA"
)

Dear Director of Product Management and the Arango Engineering Team,

ArangoDB's mission to eliminate fragmented AI stacks by unifying graph, vector, document, and search capabilities on a single contextual data layer transforms how enterprise AI agents access trusted business context. Operationalizing this multi-model architecture requires practical, turn-key recipes in Python and Jupyter Notebooks showcasing clear business value and reproducible engineering patterns. Having built and benchmarked open-source retrieval pipelines in *Python*, *Jupyter Notebooks*, and *ChromaDB*, I have tackled the exact tradeoffs between dense vector search, hybrid ranking, and contextual document ingestion that developers encounter daily.

In my open-source retrieval benchmark *ncert-rag-evals*, I engineered an empirical evaluation suite across 17 textbooks in *Python* and *Jupyter Notebooks*, implementing custom hybrid search from scratch in *SQLite FTS5* and *ChromaDB* to compare retrieval strategies against raw CPU latency. By combining BM25 lexical signals with dense vector embeddings via Reciprocal Rank Fusion (RRF), I proved an empirical *86.9% Recall\@5 in 8.9ms on CPU*, cutting latency by *99.8%* versus LLM query expansion. Furthermore, in *vectorless-rag*, I conducted interactive retrieval analysis in *Jupyter Notebooks* using *Matplotlib* to benchmark generative page indexing against dense vector RAG across 18 queries, plotting cost-latency trade-offs while streaming document windows via *PyMuPDF* under a strict *under-200MB memory ceiling*.

Production recipes must adhere to rigorous software engineering and evaluation discipline rather than functioning as fragile script prototypes. During my engineering internship at *LexoLegal*, I architected asynchronous REST APIs in *FastAPI* and *PostgreSQL* behind an *Nginx* proxy, integrating *Model Context Protocol (MCP)* clients and *Celery* workers with atomic *Redis* distributed locks to handle burst traffic with *sub-2s latency*. Across all my open-source repositories, every workflow is validated with extensive test suites (including 92 *Pytest* suites in *ncert-rag-evals* and 151 tests in *doubtless*), ensuring that recipes published to the Arango Cookbooks repository will run deterministically for every developer.

I am eager to contribute 4 high-impact, reproducible recipes to the Arango Cookbooks repository as a Software Engineer Intern. As a Computer Science undergraduate based in India, I am available for immediate engagement within the India cohort, fully prepared for remote collaboration across distributed timezones, and welcome the opportunity to discuss recipe concepts with your team.

Sincerely, \ \
#text(weight: "bold")[Aman Verma]
