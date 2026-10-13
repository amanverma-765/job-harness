# Architecture & Engineering Decisions Log

This document serves as the chronological timeline of architectural, technology, and design decisions made throughout the `job-harness` development lifecycle. Every decision must record a timestamp, the context, the choice made, and the explicit rationale.

---

## [2026-10-13] ADR-001: Foundational Architecture & Tech Stack Selection

### Context
`job-harness` is an agentic desktop harness for job seekers, designed to automate ATS-optimized resume tailoring, validate documents against empirical ATS specifications, and assist with application tracking. We evaluated choices across deployment topology, languages, frameworks, persistence, and document compilation.

### Decisions & Rationale

1. **Topology: Standalone Local-First Desktop App (Electron + Vite + React)**
   - **Decision**: Build as a 100% local-first desktop application using Electron, Vite, and React 19 with TypeScript.
   - **Rationale**: 
     - *Privacy & Compliance*: Sensitive applicant data (employment history, salary expectations, contact details) stays local; zero multi-tenant liability or cloud storage.
     - *Anti-Bot & WAF Avoidance*: Cloud IP ranges (AWS, GCP) get blocked immediately by ATS perimeter firewalls (Cloudflare, DataDome). Local execution uses legitimate residential network connections.
     - *Economics*: Zero recurring hosting or database bills; users provide their own LLM API keys (BYOK) or local models (Ollama).

2. **Core Language & Type Safety: Ultra-Strict TypeScript + Effect-TS**
   - **Decision**: Use TypeScript with ultra-strict compiler flags (`strict`, `noImplicitAny`, `noUncheckedIndexedAccess`), adopting `effect` (Effect-TS) across all business logic, side effects, and domain modeling.
   - **Rationale**:
     - Eliminates untyped exceptions (`throw`) and runtime crashes through typed errors (`Data.TaggedError`) and `Effect<Success, Error, Requirements>`.
     - Provides first-class dependency injection (`Context.Tag`, `Layer`) and schema validation (`effect/Schema`).

3. **Database & Persistence: Pure Effect SQL (`better-sqlite3` + `sqlite-vec`)**
   - **Decision**: Use `@effect/sql` + `@effect/sql-sqlite-node` running over embedded `better-sqlite3` with `sqlite-vec` extension for vector embeddings.
   - **Rationale**:
     - In-process SQLite requires zero background daemon setup.
     - `sqlite-vec` enables local hybrid search (BM25 lexical + dense cosine similarity) for skill matching.
     - Pure Effect SQL avoids the impedance mismatch of third-party ORMs while keeping transactions and queries fully typed.

4. **Native Module Packaging: `electron-builder` with standard `electron-rebuild`**
   - **Decision**: Package native C/C++ bindings using `electron-builder` and `@electron/rebuild`.
   - **Rationale**: `better-sqlite3` is the gold standard for desktop SQLite performance, and `sqlite-vec` provides pre-compiled binaries for x86_64 and arm64. Standard rebuild hooks prevent ABI mismatch issues.

5. **LLM & Structured Output: Vercel AI SDK (`ai`) wrapped in Effect `LlmService`**
   - **Decision**: Use Vercel AI SDK (`ai`) for model provider abstractions (Anthropic, OpenAI, Ollama), wrapped inside an Effect-managed service interface.
   - **Rationale**: Combines Vercel's battle-tested provider coverage, streaming, and structured output parsing with Effect's typed domain error channels.

6. **UI Design System: Tailwind CSS v4 + `shadcn/ui` + `lucide-react`**
   - **Decision**: Build the Electron renderer UI using Tailwind CSS, Radix UI primitives (`shadcn/ui`), and Lucide icons.
   - **Rationale**: Provides accessible, keyboard-navigable desktop components with zero lock-in, clean dark-mode support, and tight layout control.

7. **State Management: `@tanstack/react-query` + Zustand**
   - **Decision**: Use `@tanstack/react-query` for asynchronous IPC queries/mutations and Zustand for local workspace UI state.
   - **Rationale**: IPC invocations behave like asynchronous data fetching; React Query handles caching, deduplication, and loading states cleanly. Zustand provides lightweight global UI state.

8. **Document Engine: Bundled Static Typst CLI Binary**
   - **Decision**: Bundle the standalone `typst` static CLI binary to compile Typst Resume-as-Code (`resume.typ`) to vector PDFs and preview SVGs.
   - **Rationale**: Sub-20ms compilation times, guaranteed single-column reading order, perfect Unicode CMap decomposition (avoiding private-use glyph corruption), and native system font discovery.

9. **Future Browser Automation: Attach to User's Existing Chrome (CDP)**
   - **Decision**: For future job board application submission automation, attach to the user's existing Google Chrome via remote debugging (Chrome DevTools Protocol) rather than shipping generic headless Chromium.
   - **Rationale**: Inherits the candidate's existing logins, cookies, and human browser fingerprints, bypassing Cloudflare/DataDome automated browser detection.

10. **Candidate Project Evidence & Deep Context: Repomix**
    - **Decision**: Integrate `repomix` at runtime to pack and index the candidate's own local and GitHub project repositories.
    - **Rationale**: Enables the resume building and tailoring engine to inspect the candidate's actual project codebases, extracting authentic architectural decisions, libraries used, scale indicators, and verifiable technical achievements directly into tailored resume bullets (grounding bullets in real code and eliminating hallucination).
