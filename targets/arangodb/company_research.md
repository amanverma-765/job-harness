# Company Research: ArangoDB

**Company:** ArangoDB Inc. (Arango)  
**Domain:** Unified Multimodel Contextual Data Platform (Graph, Vector, Document, Key-Value, Search)  
**Headcount:** 51-200 employees  
**Headquarters:** San Francisco, CA (USA) and Cologne (Germany)  
**Key Deployments:** NVIDIA (NVBugs 50x faster triage), HPE, London Stock Exchange, PSI CRO, Siemens, U.S. Air Force, NIH  
**Alliances:** NVIDIA Inception Program, AWS ISV Accelerate Program  
**Engineering Culture:** Open-source core, distributed systems rigor, Python ecosystem integration, developer enablement via cookbooks and tutorials, unified multi-model database engine querying via AQL (ArangoDB Query Language).

## Core Tech Stack
- **Database Engine:** C++, Go, ArangoDB Multi-Model Core (RocksDB storage engine)
- **Languages & Drivers:** Python (`python-arango`, `python-arango-async`), JavaScript (Foxx microservices), TypeScript, C++, Go, SQL/AQL
- **AI & RAG Ecosystem:** AutoGraph Studio, RAG Strategizer, Instant Search vs Deep Search, GraphRAG, LangChain, LlamaIndex, Model Context Protocol (MCP)
- **Data & Storage:** Graph collections, Document stores, Inverted indexes, Vector indexes, Key-Value stores, PostgreSQL connectors
- **DevOps & Infrastructure:** Docker, Kubernetes, Linux, GitHub Actions, Jupyter Notebooks

## Key Engineering Challenges & Hiring Gaps
1. **Cookbook & Recipe Developer Enablement:** Enterprise developers need turn-key, reproducible Python and Jupyter notebook recipes demonstrating end-to-end GraphRAG, hybrid search, and multi-model document retrieval without brittle glue code.
2. **GraphRAG vs Traditional Vector RAG Benchmarking:** Enterprise AI teams face high entity-extraction costs and context fragmentation with vector-only stacks. ArangoDB needs concrete recipes illustrating when and how GraphRAG outperforms standard chunk retrieval in accuracy and cost.
3. **Agent Integration & Context Serving:** Connecting unified graph/vector context to modern agentic frameworks (Pydantic AI, MCP, LangChain) via production-grade async Python clients.

## Key People & Contact Patterns
- **Hiring Manager:** Director of Product Management (ArangoDB Inc.)
- **Executive Leadership:** Ravi Marwaha (Chief Operating Officer & Chief Technology & Product Officer)
- **Engineering Leadership:** Joerg Schad (VP Engineering / Former Head of Engineering & ML)
- **Email Patterns:** `<first>.<last>@arangodb.com` or `<first>@arangodb.com`
