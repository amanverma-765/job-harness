# Cold Outreach: Bynry (Forward Deployed Engineer Intern)

## Email 1 (Day 0)

Subject: Meter reads that retry twice

Hi Bynry engineering team,

Your SMART360 Next page lists 26 runbooks and up to 11 services per account, which is a lot of per-customer variance for a 20-week go-live.

I built an idempotent refresh sweep in *Celery* and *Redis* at LexoLegal that survives retry storms with zero duplicate notifications, and a RAG benchmark that measures retrieval accuracy instead of assuming it (*86.9% Recall\@5*).

Code: github.com/amanverma-765/ncert-rag-evals

Worth 15 minutes on where utility data reconciles badly?

Aman Verma

---

Body word count: 79

## Follow-up (Day 5)

Same question in one line: if a meter vendor posts the same reading twice, does SMART360 dedupe on the payload hash or on the account-period key?

Happy to show the Celery diffing approach either way.

---

## 1-Weekend MVP: Meter Read Reconciliation Ledger

**Scope.** A small Python service that ingests synthetic meter-read webhooks shaped like a
utility vendor payload, deduplicates on account plus billing period, and writes an
append-only reconciliation ledger so replayed or corrected reads never double-bill. It
skips authentication, a UI, and real utility formats; a CSV import stands in for the
vendor feed.

**Stack.** *Python*, *FastAPI* (webhook receiver with signature check), *SQLAlchemy* and
*PostgreSQL* (composite unique key on account plus period), *Redis* (idempotency keys),
*Celery* (retry queue), *pytest* (duplicate, out-of-order, and correction cases), *Docker*
Compose for one-command startup.

**Deliverable.** Public repo with a README covering the payload contract and failure
modes, a deployed demo URL, and a 60-second walkthrough showing a duplicate read rejected
and a corrected read applied, each with a passing regression test.

**Why this gap.** Bynry's SLA is billing accuracy, and the JD names webhooks, SQL, and
root-cause debugging as the daily surface. Duplicate reads are the cheapest failure to
demonstrate and the most expensive one to ship.
