# CLAUDE.md

This file provides architectural, engineering, and coding standards for Claude Code when working in `job-harness`.

---

## Project Overview

`job-harness` is a standalone, local-first desktop application for job seekers built with **Electron, Vite, React, TypeScript**, and **Effect-TS**.

- `research/`: Verified engineering research suite and technical specifications on modern ATS architectures, parsing pipelines, recruiter workflows, and resume engineering standards (Typst Resume-as-Code, 10 Technical Traps, Unicode purity, single-column geometry).
- `src/main/`: Electron main process (Node.js runtime, SQLite, Typst execution, background workers).
- `src/preload/`: Context-isolated preload scripts exposing type-safe IPC APIs.
- `src/renderer/`: React frontend UI (Vite, Tailwind, UI components, PDF preview).
- `src/shared/`: Shared domain models, Effect Schemas, typed domain errors, and IPC contracts.

---

## Architectural Decisions Log & Timeline

All architectural, stack, and design choices are recorded in **`DECISIONS.md`**.

- **Timeline Rule**: `DECISIONS.md` serves as the official, chronological decision log for the project development lifecycle.
- **Continuous Documentation**: As new design decisions are made during development, they must be appended to `DECISIONS.md` with:
  1. A clear timestamp (`[YYYY-MM-DD]`).
  2. The ADR number and title.
  3. The context and problem being solved.
  4. The explicit decision made and the rationale/reasons behind choosing that approach.
- **Project Intelligence**: Use `repomix` for codebase packing and extracting structured context for LLM agents and GitHub project intelligence.

---

## Strict Type Safety Standards

1. **Zero `any` Policy**:
   - The use of `any` is strictly prohibited across the entire codebase.
   - Avoid loose `as` type assertions. If parsing untrusted or external data, always validate through `Schema.decodeUnknown`.
2. **Compiler Flags**:
   - TypeScript must remain in ultra-strict mode (`strict: true`, `noImplicitAny: true`, `noUncheckedIndexedAccess: true`, `strictNullChecks: true`, `noFallthroughCasesInSwitch: true`).
3. **Explicit Function Returns**:
   - All exported functions, service methods, and Effect workflows must have explicit return type annotations.
4. **Branded & Nominal Types**:
   - Use `Brand` or `Schema.brand` for domain identifiers (e.g., `JobId`, `ResumeId`, `CandidateId`) to prevent primitive obsession.

---

## Effect-TS (`effect`) Architecture & Standards

All business logic, side effects, I/O, child processes, database access, and external calls must be modeled using the **Effect-TS** ecosystem (`import { Effect, Schema, Context, Layer, Data } from "effect"`).

### 1. Effect Workflows Over Untyped Promises & Exceptions
- **Never throw raw exceptions**: Functions must never `throw new Error(...)` or leave promises unhandled.
- Model operations as `Effect<Success, Error, Requirements>`:
  - `Success`: The typed value produced on success.
  - `Error`: A union of typed domain errors (see below).
  - `Requirements`: The typed services/context required to run the effect.
- Wrap external async operations cleanly with `Effect.tryPromise` or `Effect.async`.

### 2. Typed Domain Errors (`Data.TaggedError`)
- All failure modes must be explicitly modeled as tagged errors extending `Data.TaggedError`:
  ```typescript
  export class TypstCompilationError extends Data.TaggedError("TypstCompilationError")<{
    readonly message: string
    readonly exitCode?: number
    readonly stderr?: string
  }> {}
  ```
- Use `Effect.fail` to yield errors and `Effect.catchTag` / `Effect.catchTags` to handle specific failures.

### 3. Service & Dependency Injection (`Context.Tag` & `Layer`)
- Define service interfaces as `Context.Tag`:
  ```typescript
  export class TypstService extends Context.Tag("TypstService")<
    TypstService,
    {
      readonly compile: (inputPath: string, outputPath: string) => Effect.Effect<void, TypstCompilationError>
    }
  >() {}
  ```
- Implement capabilities as `Layer`s (`Layer.effect`, `Layer.succeed`, `Layer.scoped`).
- Compose layers declaratively. Never use global mutable singletons.

### 4. Schema Modeling & Validation (`effect/Schema`)
- Define all domain models, database entities, and IPC payloads using `Schema`.
- Derive TypeScript types directly from schemas:
  ```typescript
  export const ProfileSchema = Schema.Struct({ ... })
  export type Profile = typeof ProfileSchema.Type
  ```
- Use `Schema.decodeUnknown` for validating external data (IPC input, files, API responses).

### 5. Resource Management (`Scope`)
- Any resource that requires lifecycle management (file handles, child processes, SQLite connection pools, temp directories) must use `Scope` via `Effect.acquireRelease`.

---

## Electron Architecture & Security Standards

### 1. Process Boundaries & Context Isolation
- **Strict Context Isolation**:
  - `contextIsolation: true`
  - `nodeIntegration: false`
  - `sandbox: true`
- **Zero Node Access in Renderer**: The renderer process (`src/renderer/`) must never import `node:*` modules, `fs`, `child_process`, or electron internals directly.
- **Preload Bridge**: Only expose minimal, typed IPC invokers via `contextBridge.exposeInMainWorld('api', ...)`.

### 2. Type-Safe IPC Contracts
- Define all IPC request and response shapes as Effect Schemas in `src/shared/ipc.ts`.
- In the Main Process:
  - IPC listeners receive requests, validate them using `Schema.decodeUnknown`, execute an `Effect` via `Effect.runPromise`, and return an `Exit`-encoded or normalized result to the renderer.
- In the Renderer:
  - Invoke preload bridges with fully typed inputs and receive typed outcomes without stringly-typed channel names.

### 3. Application Lifecycle & Cleanliness
- Handle single-instance locking (`app.requestSingleInstanceLock()`).
- Ensure child processes (e.g. running Typst or PDF tooling) are cleanly terminated on application exit.
- Prevent unhandled rejections from crashing the Electron main loop by providing top-level Effect error boundaries.

---

## Research Suite & ATS Resume Engineering Rules

All ATS parsing simulation, resume tailoring, and document generation must strictly implement the findings from `research/`:

1. **Typst Resume-as-Code (RaC)**:
   - Resumes must be compiled via Typst using the production parameters from `research/THE_ULTIMATE_TECHNICAL_RESUME_PLAYBOOK.md`.
   - Single-column layout only. Guaranteed linear reading order in Poppler extraction (`pdftotext -layout`).
2. **Unicode & Font CMap Purity**:
   - Zero private-use characters (`0xE000-0xF8FF`).
   - Clean spacing separation between contact strings and icon glyphs.
3. **Deterministic Knockout Auditing**:
   - Identify and surface knockout criteria (work auth, clearance, location, licensing) prior to tailoring.
4. **Truth-in-Resume & Anti-Hallucination**:
   - The tailoring engine must never invent false credentials, dates, or non-existent metrics. Tailoring means strategic emphasis, keyword alignment, and metric framing (Google XYZ format) from the candidate's actual master profile.

---

## Commands & Workflows

- `npm run dev`: Start Electron application in development mode with HMR.
- `npm run typecheck`: Run strict TypeScript typechecks across both Node and Web project configurations.
- `npm run lint`: Lint code with ESLint.
- `npm run format`: Format code with Prettier.
- `npm run build`: Compile TypeScript and bundle with `electron-vite`.
