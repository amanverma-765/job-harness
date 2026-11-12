# Role Analysis: Junior Software Engineer (Cin7)

## 1. Role Identification & Sanitization (10.6x Requisition Multiplier)
- **Target Company:** Cin7
- **Raw Posting String:** `Junior Software Engineer Ahmedabad, INEngineering /Full-Time /Hybrid`
- **Sanitization Log:**
  - Stripped location tag: `Ahmedabad, IN`
  - Stripped division/type tags: `Engineering /Full-Time /Hybrid`
  - Normalized functional engineering title: **`Junior Software Engineer`**
- **Target Title for Resume Header:** `Junior Software Engineer`
- **Company Domain:** Cloud-based SaaS Inventory Management Software
- **Compensation Range:** ₹22,00,000 - ₹29,00,000 a year

---

## 2. The 4-Quadrant JD Extraction Matrix

### Quadrant I: Core Languages & Runtimes
- **Required:** C#, .NET (.NET Framework, modern .NET, ASP.NET MVC), SQL (SQL Server), JavaScript, HTML, CSS
- **Candidate Ground Truth:** Python 3.12+, Kotlin (JVM), Java (Spring Boot), SQL (PostgreSQL, SQLite), Bash (Linux). (Zero C# or .NET in verified corpus)

### Quadrant II: Infrastructure, Databases & Cloud
- **Required:** Relational databases (SQL Server), Cloud SaaS (Microsoft Azure preferred), Git version control, CI/CD pipelines
- **Candidate Ground Truth:** PostgreSQL, SQLite (WAL & FTS5), Redis, Docker, Git, GitHub Actions, Nginx (No Azure or SQL Server in verified corpus)

### Quadrant III: Architectural Patterns
- **Required:** Full-stack feature delivery across application, database, and frontend layers; REST API-driven architecture; client-server communication; unit and integration testing; code reviews; AI tool assisted workflows (code generation, debugging, testing, review)
- **Candidate Ground Truth:** Production REST APIs in FastAPI & Spring Boot, asynchronous Celery worker pipelines, Clean Architecture, Pydantic AI agent workflows with Model Context Protocol (MCP), Pytest & JUnit 5 test suites (Verified)

### Quadrant IV: Operational Scale & SLAs
- **Required:** Cloud SaaS inventory tracking at global scale, multi-channel product synchronization across 500+ systems, robust testing, code quality, and maintainability
- **Candidate Ground Truth:** Sub-2s conversational agent latency, 86.9% Recall@5 in 8.9ms on CPU, automated case synchronization across 25 High Courts and 743 District Courts, 151 automated tests in `doubtless`, 92 unit tests in `ncert-rag-evals` (Verified)

---

## 3. Hard Qualification Gate Evaluation

| Evaluation Dimension | Job Requirement | Candidate Ground Truth (`core/profile.yaml` & `core/projects_corpus.yaml`) | Status |
|---|---|---|---|
| **Core Language & Framework** | Hands-on experience with C# and .NET (ASP.NET MVC, .NET Framework) | Python (FastAPI, Pydantic AI), Kotlin (Spring Boot, Ktor), Java | **CRITICAL GAP (0%)** |
| **Relational Databases & SQL** | SQL queries and relational databases (SQL Server) | PostgreSQL, SQLite WAL, SQLAlchemy 2.0, Spring Data JPA, Alembic | **MATCH (100%)** |
| **Frontend & UI** | JavaScript, HTML, CSS, DOM manipulation, forms & page layouts | WebView DOM diffing (WatchTower), scraping DOM parsers (Selectolax/BS4) | **PARTIAL (50%)** |
| **Web Fundamentals & APIs** | HTTP, REST APIs, client-server communication | Production REST APIs (FastAPI, Spring Boot, Ktor), WebSockets, SSE | **MATCH (100%)** |
| **AI Tooling & LLM Features** | AI development tools, LLM APIs, retrieval-based workflows | Pydantic AI, MCP, Groq Whisper, Ollama, LangChain, RAG evals | **STRONG MATCH (EXCEEDS)** |
| **Testing & Version Control** | Unit & integration testing, Git version control | Git, GitHub Actions, Pytest (151 tests in doubtless), JUnit 5, Kotest | **MATCH (100%)** |
| **Education & Degree** | Bachelor's degree in CS, Engineering, or related field | B.Tech in Computer Science & Engineering (2023 - 2027) | **MATCH (100%)** |
| **Software Dev Experience** | Practical software development (internships, projects) | Software Engineer Intern (LexoLegal), Freelance Developer (Webxela) | **MATCH (100%)** |
| **Geographic Location** | Reside in Ahmedabad or Pune, India (Hybrid mandatory) | Immutable Candidate Location: Jaunpur, UP, India (VBS Purvanchal Univ) | **CRITICAL BARRIER (0%)** |

### Evaluation Summary
- **Total Dimensions Evaluated:** 9
- **Matched Dimensions:** 6 / 9 (66.7%)
- **Non-Negotiable Core Domain Gaps:**
  1. **Primary Runtime Mismatch:** The JD specifies: *"This role focuses on .NET development across .NET Framework, .NET, and ASP.NET MVC applications"* and requires *"Hands-on experience with C# and .NET"*. Candidate ground truth has 0 C# or .NET repositories, projects, or verified experience.
  2. **Mandatory Hybrid Location Constraint:** The JD explicitly mandates: *"This position requires that you reside in Ahmedabad or Pune, India."* Candidate's ground truth location is strictly immutable (`Jaunpur, UP, India`).

### Gate Determination
🛑 **HARD QUALIFICATION GATE TRIGGERED (APPLICATION HALTED)**
- **Trigger Rule:** Missing core prerequisite domain (C# / .NET / ASP.NET MVC) + non-negotiable hybrid location constraint (Ahmedabad / Pune residency).
- **Candidate Decision:** Halted by candidate. No application documents generated.
- **Pipeline Action:** Aborted at Phase 1 per `CLAUDE.md` section 2.4 to avoid low-probability submission.
