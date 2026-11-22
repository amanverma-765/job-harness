# Cold Outreach: Agoda (Gurugram), Backend and Platform

**Target:** Backend or Platform engineering manager, Gurugram office (Agoda Technology).
**Channel:** LinkedIn or email, one message, no attachments.

---

## Email 1

**To:** Backend / Platform hiring manager, Agoda Gurugram
**Subject:** Kotlin idempotency on booking events

Agoda moving core services from Scala to Kotlin is the part of your engineering story I keep rereading, because the hard part is rarely the rewrite itself, it is the event contract that has to stay exactly-once while the language underneath it changes.

I hit a smaller version of that at LexoLegal: a 12-hour refresh sweep in Celery and Redis with atomic distributed locks and a dispatch and deliver ledger, where retries never duplicated a row.

This weekend I am rebuilding that idea in Kotlin against Redpanda with PostgreSQL dedup and a dead-letter queue. Repo: github.com/amanverma-765

Worth 15 minutes to compare notes on how your teams test idempotency under replay?

**Body word count:** 108
**Attachments:** none

---

## Day 5 Follow-Up (2 lines)

The repo is public now, and the replay test asserts a duplicate event produces exactly one row: github.com/amanverma-765.
If a dedup ledger is the wrong shape for your pipelines, that is the piece I would most want to hear about.

---

## 1-Weekend MVP Specification

**Scope:** A Kafka-pattern booking-event pipeline that proves exactly-once effects on a relational store. A producer emits booking lifecycle events (`created`, `cancelled`, `amended`) with at-least-once delivery; a Kotlin consumer applies each event to PostgreSQL inside one transaction using a dedup table keyed on `(booking_id, event_id)`, so redelivery is a no-op rather than a double charge. Poison messages route to a dead-letter topic with the failure reason, and an admin endpoint replays the dead-letter topic after a fix. Skipped deliberately: authentication, a UI, multi-region, schema registry, and any Agoda branding or data.

**Stack (matches Agoda's own):** Kotlin with Ktor for the replay endpoint, Kafka wire protocol via Redpanda in Docker (no cluster operations), PostgreSQL with Flyway migrations, JUnit 5 plus Testcontainers for the replay and duplicate-delivery tests, GitHub Actions for CI, Docker Compose for one-command startup.

**Deliverable:**
1. Public repo with a README that states the invariant ("a duplicate delivery must produce exactly one row") and the test that enforces it.
2. A 60-second screen recording: send the same event twice, show one row and one dead-letter entry.
3. A one-page write-up of the three failure modes found while building it (partial commit, replay ordering, DLQ retry storms).
