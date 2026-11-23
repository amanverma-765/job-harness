# Outreach: OakNorth - Intern - Gen AI

**Role:** `targets/oaknorth/generative-ai-intern/`
**Gap packaged:** Gap 1, no per-workflow measurement of what internal AI tooling saves (`company_research.md` section 4)
**Recipient:** Management Support team lead at OakNorth Gurugram. No name is published on the posting, so identify the lead on LinkedIn before sending. Fallback: Tom Harris (CPTO), who publishes the 3.1x shipping and Knowledge Gateway claims.

---

## Email 1

**Subject:** Measuring what internal AI tooling saves

Your FY2025 report credits Claude Projects and Custom GPTs with faster analytics while credit-analytics headcount stayed flat against 33% origination growth. I could not find per-workflow figures behind that, so I suspect the next useful question is measurement: which workflows return 40 minutes and which return four.

I built *ncert-rag-evals* to answer a version of that question for retrieval, with eight strategies, hand-rolled *SQL* over *SQLite FTS5*, and *86.9% Recall\@5 at 8.9ms on CPU*, verified with McNemar tests.

A two-day build would wrap one Excel workflow in a timing harness and emit a per-run savings ledger.

github.com/amanverma-765/ncert-rag-evals

Worth 15 minutes to talk through the trade-offs?

**Body word count:** 99 (limit 120)
**Attachments:** none

---

## Follow-up (Day 5)

Same thread, no new ask: "The harness also flags runs where the AI step costs more than the manual one, which is the part most teams skip. *vectorless-rag* measured that case at 2.7x token cost for 2x latency, so the ledger is not free to ignore."
Plus: "Happy to send the 60-second demo instead if that is easier."

---

## 1-Weekend MVP Specification

**Working title:** Savings Ledger for one Excel-bound workflow.

**Scope.** Take a single Management Support workflow that currently lives in a spreadsheet, for example the monthly expense tracker, and wrap it in a Python runner that ingests the workbook, executes the analysis twice (manual steps scripted as-is, then the AI-assisted path), and writes one row per run into a ledger with wall-clock duration, token spend, human correction count, and dollar cost. It skips multi-workflow rollout, UI polish, and any write-back into the source workbook, and it never mutates the original file: the runner works on a copy under version control.

**Stack.** Python, `openpyxl` for workbook reads, Pydantic for the run record, SQLite for the ledger, the Anthropic and OpenAI APIs behind one provider interface, `pytest` for the diff tests, and a Streamlit page that renders the ledger as a before/after table per workflow.

**Deliverable.** Public repo with a README stating the measurement protocol and its limits, a seeded synthetic workbook so the demo runs without internal data, a 60-second walkthrough video, and the ledger captured from three consecutive runs showing the variance rather than a single flattering number.

**Why it fits the role.** The work is exactly the posting's last duty, documenting tools, monitoring usage and tracking the time they save, reduced to something one person can finish and the team can extend.
