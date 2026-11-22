# Cold Outreach & 1-Weekend MVP Package

- **Target Company:** Infilect Technologies Pvt. Ltd.
- **Target Role:** Software Development Engineer Intern (Backend)
- **Target Recipient:** Backend Engineering Lead / Platform Engineering, InfiViz
- **Addressed Hiring Gap:** Django + DRF service depth (the one named requirement with no production evidence), framed against the data-quality and idempotency problems InfiViz ingestion actually has

---

## 1. Peer-to-Peer Outreach Draft

**Subject:** Django ports and idempotent writes
**Word Count:** 113 words (strictly <= 120 words)

Hello,

Your backend JD names Django, and my production work is FastAPI, Celery, and PostgreSQL. The honest version of that gap: I would port my legal-case ingestion service to Django REST Framework and measure what actually changes, especially around idempotent writes.

That is where I would probe first. At LexoLegal a 12-hour Celery sweep writes into 12 PostgreSQL tables, and a retried job must never double-alert, so deduplication lives in Redis locks and countdown requeues rather than the ORM. DRF moves where that boundary sits, and InfiViz ingestion volume makes it a real question rather than a stylistic one.

Happy to send the port and its diff notes. Worth 15 minutes?

Best,
Aman Verma
akverma4aman@gmail.com | +91 6386617608
github.com/amanverma-765

---

## 2. Day 5 Follow-Up Draft

Hello,

Quick follow-up: the DRF port is up, with a Pytest suite replaying 100 duplicate sweep payloads against Redis locks to prove no double-alert under retries. Sending the repository and the diff notes if the ingestion team finds it useful.

Best,
Aman

---

## 3. 1-Weekend MVP Demo Specification

- **Objective:** Port the LexoLegal case-refresh ingestion path to Django + DRF and instrument it with the data-quality alerting InfiViz relies on, proving the FastAPI depth transfers to the JD's named framework.
- **Scope:** A DRF service exposing ingestion and status endpoints, a Celery worker executing an idempotent 12-hour refresh sweep, Redis distributed locks with countdown requeues, PostgreSQL persistence with Alembic-equivalent Django migrations, and a data-quality monitor that flags stale or duplicated case records with structured alert payloads. Includes a management command that replays 100 duplicate payloads to prove zero double-writes.
- **Stack:** Python 3.12, Django 5, Django REST Framework, Celery, Redis, PostgreSQL, Docker Compose, Pytest.
- **Build Steps (Total: 8 hours):**
  1. *Hours 1-2:* Model the 12-table case schema as Django models with migrations, and expose DRF serializers plus ingestion and status endpoints.
  2. *Hours 3-4:* Rebuild the refresh sweep as a Celery task with atomic Redis locks, 10s countdown requeues, and a 90-retry ceiling.
  3. *Hours 5-6:* Add an idempotent diffing layer keyed on record hash so replays update instead of duplicating, and surface counts through DRF.
  4. *Hours 7-8:* Instrument a data-quality monitor (staleness age, duplicate rate, failed-task ratio) with structured alert payloads, containerize with Docker Compose, and write the 100-replay Pytest proof.
- **Deliverables:** Public GitHub repository with a green Pytest suite, one-command Docker Compose testbed, a written FastAPI-to-DRF diff note listing what moved and what did not, and a 60-second Loom showing zero duplicate records under replayed retries.
