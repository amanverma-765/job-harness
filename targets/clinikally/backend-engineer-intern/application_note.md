# Clinikally · Backend Engineer Intern (Work at a Startup / YC portal)

Paste-ready paragraph, no resume required on this portal.

## Primary (≈140 words)

Backend work is where I want to compound. At LexoLegal I shipped 38 async REST endpoints in FastAPI and SQLAlchemy 2.0 over 12 PostgreSQL tables behind Nginx, with multi-tier JWT auth, RFC 9457 error contracts, and Alembic migrations validated by 1,024 pytest tests. The async layer around those APIs was the harder half: Celery and Redis sweeps with idempotent diffing so a requeued job never fires a duplicate notification, atomic Redis locks to kill worker race conditions, and HMAC-SHA256 verification on inbound webhooks. That data was case-sensitive legal records, so correctness under retry and multi-tenant isolation were not optional, which is the same bar teleconsult and pharmacy order flows carry. I am in my fourth year of B.Tech CSE and have not shipped NestJS or EKS; the FastAPI, Postgres, Redis, and Docker work is real.

## Short variant (if the field is tight)

I shipped 38 async FastAPI endpoints over 12 PostgreSQL tables at LexoLegal, with JWT auth and 1,024 pytest tests, plus the Celery and Redis layer behind them: idempotent diffs so retries never double-notify, atomic Redis locks for worker races, HMAC-SHA256 webhook verification. Same correctness bar a teleconsult or pharmacy order flow needs. Fourth-year B.Tech CSE; NestJS and EKS I have not shipped yet.

## Notes

- Every claim traces to `core/profile.yaml` (LexoLegal highlights) and is commit-defensible. No TypeScript, RabbitMQ, SQS, or AWS services claimed; the JD lists them and they are not in the verified corpus.
- JD match on essentials: Python, FastAPI, REST, PostgreSQL, Redis, async/queues, Git, Docker, DSA/OOP. Missing: TypeScript, NestJS depth, AWS ECS/EKS/RDS, RabbitMQ/SQS. Well above the 50% gate.
- Posting metadata says "Visa sponsorship: US citizen/visa only" while the role is Gurugram, HR. Portal artifact; worth confirming with the recruiter before spending time on the full package.
