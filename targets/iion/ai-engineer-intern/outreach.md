# Cold Outreach: iion, AI Engineering Intern (Agentic Workflows)

Recipient: Abhinav Dhiman, Head of Business Intelligence, iion (direct manager for this role)
Channel: LinkedIn DM (no verified public email; do not guess addresses)
Attachments on Email 1: none

---

Subject: Shadow-mode evals for agentic BI workflows

Hi Abhinav,

Your post on moving iion from rules-based automation to agentic workflows stuck with me, especially the shadow-mode step where reasoning logs have to become a regression gate instead of a reading exercise.

I built that loop for a production legal agent at LexoLegal: 107 pytest cases, per-run OpenTelemetry traces in Logfire, plus an eval harness that proved an 86.9% Recall\@5 retrieval gain in 8.9ms with McNemar significance (github.com/amanverma-765/ncert-rag-evals).

A wrong campaign action caught in shadow mode costs nothing. The same action caught by a client costs the account. Worth 15 minutes to compare notes on where the guardrails should sit?

Aman

Body: 105 words (limit 120).

---

## Day 5 Follow-Up (2 lines)

Re-ran the harness against a stricter pass threshold and the failure cluster stayed in tool selection, not retrieval: worth building the same split for your BI agents?

Happy to send the diff and the scoring rubric if useful.

---

## 1-Weekend MVP: Shadow-Mode Eval Harness for BI Ops Agents

**Gap addressed:** iion is moving BI and ad-ops workflows from deterministic rules to LLM agents. There is no visible regression gate that proves an agent's reasoning is still correct before it acts on live campaign data (JD: "deploy AI Agents in Shadow Mode, analyze the reasoning logs, and debug instances of hallucinations or logic failures").

**Scope (what it builds):**
A local harness that replays 20 real operational tickets (campaign pacing change, report correction, publisher onboarding) through an agent in shadow mode, records every tool call and reasoning step, scores the final action against an SME-approved expected action, and exits non-zero when the pass rate drops below a threshold. Failure modes are clustered by stage (retrieval, tool selection, argument construction, final answer) so a prompt or connector change can be attributed.

**What it skips:** no production write access, no UI, no multi-tenant auth, no live ad-platform bidding. Read-only fixtures only.

**Stack:** Python, Pydantic AI (agent runtime), Logfire or OpenTelemetry (per-run traces), SQLite (fixture and run store), pytest (assertions and CI gate), uv (env).

**Milestones:**
1. Fixture schema plus 20 recorded tickets with expected actions.
2. Agent runner with a dry-run tool layer that denies writes and logs arguments.
3. Scorer: exact-match on action, field-level diff on arguments, stage attribution for failures.
4. Trace export plus a one-page failure report per run.
5. pytest gate wired to a threshold, with a deliberate regression case proving it fails.

**Deliverable:** public GitHub repo, deployed read-only demo, 60s Loom walking through one failing run and the fix.
