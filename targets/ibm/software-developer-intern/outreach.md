# Cold Outreach & 1-Weekend MVP Package

**Target Company:** IBM India (IBM Software Labs)  
**Target Role:** Software Developer Intern  
**Target Recipient:** Engineering Manager / Technical Lead, watsonx Orchestrate & Workflow Automation (Bangalore & Kochi Labs)  
**Corporate Email Format:** `first.last@ibm.com`  
**Addressed Hiring Gap:** Securing Model Context Protocol (MCP) client execution and context binding in agentic workflows  

---

## 1. Peer-to-Peer Cold Email Draft

**Subject:** Securing MCP tool execution in agent loops  
**Word Count:** 97 words (strictly <= 120 words; subject strictly <= 7 words)  

Hi Team,

I was following IBM's integration of LangGraph and Model Context Protocol (MCP) clients inside watsonx Orchestrate, where securing tool execution across multi-tenant agent loops without prompt injection is critical.

At LexoLegal and in my project doubtless, I engineered autonomous agent workflows in Pydantic AI and FastAPI, isolating authenticated context inside AgentDeps rather than LLM tool arguments to eliminate injection vectors while orchestrating MCP tool clients with sub-2s query latency.

The architecture and test suites are open-source here: https://github.com/amanverma-765/doubtless

Worth 15 minutes to chat through the trade-offs or the Software Developer Internship at IBM?

Best,  
Aman Verma  
akverma4aman@gmail.com | +91 6386617608  

---

## 2. Day 5 Follow-Up Draft

Hi Team,

Following up on secure MCP agent execution: I assembled an open-source test harness demonstrating context isolation with ChromaDB hybrid retrieval and zero credential leakage. Happy to share the repository or benchmark numbers if helpful.

Best,  
Aman  

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build a sandboxed Model Context Protocol (MCP) tool orchestration gateway in Python, FastAPI, and ChromaDB demonstrating authenticated agent context isolation and cyclic state execution.
- **Scope:** Implements a cyclical agent loop in Pydantic AI and FastAPI connecting to external MCP server tools (document retrieval, calendar scheduling) with user identity strictly bound to server dependencies (AgentDeps) rather than LLM tool parameters. Employs ChromaDB for hybrid semantic search and Pytest for automated test coverage. Skips proprietary enterprise ERP integrations.
- **Stack:** Python 3.12, FastAPI, Model Context Protocol (MCP) SDK, Pydantic AI, ChromaDB, SQLite, Pytest, Docker Compose.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Configure Docker Compose environment with FastAPI service, SQLite, and ChromaDB vector store; scaffold MCP client-server interfaces.
  2. *Hours 3-5:* Implement cyclical agent loop with authenticated AgentDeps context binding, preventing prompt-injected tool parameters from accessing unauthorized tenant records.
  3. *Hours 6-7:* Author 15+ automated Pytest unit tests validating sub-2s query execution and zero privilege leakage across concurrent agent sessions.
  4. *Hour 8:* Record 60-second architectural walkthrough and deploy public GitHub repository.
- **Deliverables:** Public GitHub repository + automated test harness + 60-second Loom architectural walkthrough.
