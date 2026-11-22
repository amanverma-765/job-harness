# Cold Outreach & 1-Weekend MVP Package

**Target Company:** Apna Mart (Fleet Labs Technologies Pvt Ltd)
**Target Role:** SDE Intern, Backend (Gurugram, on site)
**Target Recipient:** Gaurav Singh, SDE 2 Backend (publicised Apna Mart's backend hiring round on LinkedIn, 2026-11-20). No verified direct email was found, so send through LinkedIn, or use the Wellfound posting `5127102` / careers page as the primary channel.
**Addressed Hiring Gap:** Store-level stock discrepancy reconciliation and deduplicated order SLA alerting across a 200+ store franchise network.

## 1. Peer-to-Peer Cold Email Draft

**Subject:** One ticket per real stock discrepancy
**Word Count:** 119 words in body (limit 120); subject is 6 words (limit 7). Zero attachments.

Hi Gaurav,

Apna Mart reconciles physical stock across 200+ franchise stores against one catalogue. The real work is raising one actionable ticket per genuine discrepancy when sweeps re-run and workers retry.

At LexoLegal I built a 12-hour Celery and Redis sweep with an idempotent diffing engine and a two-stage dispatch ledger, so reruns produced zero duplicate alerts. Same pattern in doubtless: https://github.com/amanverma-765/doubtless

Worth 15 minutes on how your team catches shelf-versus-system drift, or on the SDE Intern role in Gurugram?

Best,
Aman Verma
akverma4aman@gmail.com | +91 6386617608

## 2. Day 5 Follow-Up Draft

Hi Gaurav,

Following up on stock drift: I built a small snapshot-diff harness that takes two store SKU snapshots, emits only genuine deltas, and writes one ticket per delta under repeated sweeps. Happy to share the repo if useful.

Best,
Aman

## 3. 1-Weekend MVP Demo Specification

- **Objective:** A store stock reconciliation service that turns two SKU snapshots into exactly one actionable discrepancy ticket per genuine change, and sweeps open orders to raise one alert per delivery SLA breach.
- **Scope:** Ingests per-store SKU snapshots (CSV or JSON), hashes and diffs them, writes deltas to PostgreSQL behind an Alembic migration, and dispatches tickets through a two-stage ledger (claim, then delivery) so replayed or retried sweeps cannot double-alert. Includes FastAPI endpoints for snapshot upload, open discrepancy list, and ticket acknowledgement. Mock order feed for SLA sweeps. Skips auth UI and real WhatsApp delivery, logging the outbound payload instead.
- **Stack:** Python 3.12, FastAPI, Celery, Redis, PostgreSQL, SQLAlchemy, Alembic, Docker Compose, Pytest.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1 to 2:* Docker Compose with PostgreSQL and Redis; SQLAlchemy models plus Alembic migration for `store_sku_snapshot`, `stock_discrepancy`, and `alert_dispatch` with a unique constraint on `(store_id, sku, snapshot_pair, channel)`.
  2. *Hours 3 to 5:* Diff engine computing per-SKU deltas between consecutive snapshots, plus a Celery task that acquires an atomic Redis lock per store and writes one discrepancy row per delta inside a transaction.
  3. *Hours 6 to 7:* Two-stage dispatch ledger with a claim step and a delivery step, so a replayed task cannot send a second alert; add the SLA sweep over a mock order feed with 10-minute promise deadlines.
  4. *Hour 8:* Pytest suite covering repeated sweeps, concurrent store locks, and replay of the same snapshot pair (asserting exactly one alert), then a 60-second Loom walkthrough over Docker Compose.
