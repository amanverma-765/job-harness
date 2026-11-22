# Cold Outreach & 1-Weekend MVP Package

- **Target Company:** Shure India (Hyderabad Product Development Center)
- **Target Role:** Software Development Intern
- **Target Recipient:** Software Engineering Manager, Product Development Division, Shure Hyderabad
- **Addressed Hiring Gap:** AI-assisted engineering workflows whose generated patches are validated before review (responsible AI with human-in-the-loop gates)

## 1. Peer-to-Peer Outreach Draft

**Subject:** Review gates for AI-generated audio code
**Word Count:** 99 words (strictly <= 120 words)

Hi Team,

The IntelliMix Bar Pro now ships AI transcripts and summaries, and Shure's responsible-AI position requires that AI output never reaches a customer without human review. The same gate is harder for AI-written code: a generated patch can compile, pass lint, and still cross a tenant boundary.

At LexoLegal I built tool-calling agents in Pydantic AI and FastAPI, then removed identity from LLM tool parameters to kill cross-tenant prompt injection. I would like to bring that boundary discipline to a review-gated coding agent for your client repositories.

Worth 15 minutes to compare notes on approval gate design?

Best,
Aman Verma
akverma4aman@gmail.com | +91 6386617608

## 2. Day 5 Follow-Up Draft

Hi Team,

Following up with something concrete: I packaged a review-gated coding agent that runs a patch through build, lint, and test workers in Docker before emitting a diff for approval, with every tool call logged.
Happy to share the repository and the failure-case report if it fits your team's workflows.

Best,
Aman

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Build a review-gated coding agent that proposes a patch, validates it against deterministic checks, and refuses to surface output that fails any gate.
- **Scope:** Accepts a repository path and an issue description, plans tool calls with *Model Context Protocol* clients for file reads and test execution, runs the generated patch inside a sandboxed *Docker* workspace through build, lint, and *Pytest* gates, and returns a diff only when all gates pass. Rejected patches return a structured failure report naming the failing gate, so a human reviewer sees evidence instead of assertion.
- **Stack:** Python 3.12, Pydantic AI, Model Context Protocol, FastAPI, Docker, Pytest, SQLite.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Wrap file read, file write, and test execution as *MCP* tool clients with per-run workspace sandboxing and path allow-lists.
  2. *Hours 3-4:* Build the agent loop in *Pydantic AI* with typed tool-call dependencies and a hard budget on iterations and tokens.
  3. *Hours 5-6:* Add the deterministic gate chain (format, lint, build, unit tests) that runs each candidate patch in an ephemeral *Docker* container and records pass or fail per gate.
  4. *Hours 7-8:* Emit structured diffs plus failure reports into *SQLite*, then write *Pytest* cases covering a passing patch, a failing test, and a patch that touches a forbidden path.
- **Deliverables:** Public GitHub repository with passing test suite, one-command local demo, and a 60-second recording showing three patches where the failing test and the forbidden-path patch are both blocked before reaching the reviewer.
