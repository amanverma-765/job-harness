# Company Research: Infilect Technologies

- **Researched:** November 22, 2026
- **Reuse window:** valid until December 22, 2026
- **HQ:** Bengaluru, Karnataka, India (US operations)
- **Stage:** Growth-stage enterprise B2B SaaS, acquired by Andavi Solutions (Nov 4, 2026)

---

## 1. Business & Product

- **Model:** Enterprise SaaS for CPG manufacturers and retailers. Customers buy shelf-level visibility, not seats.
- **Flagship:** **InfiViz**, an image-recognition retail-execution platform. Field agents photograph shelves, and the system extracts SKUs, facings, pricing, share of shelf, out-of-stock, and competitor activity.
- **Scale claims (company site):** deployed across **18+ countries**, **400K+ stores**, **100+ categories**, field-force remediation actions delivered **within 60 seconds**.
- **Programs:** Intel India Maker Lab, NVIDIA Inception, Nasscom Deep Tech Club, IITB-SINE Plugin Accelerator.
- **Funding/M&A:** Andavi Solutions (US sales-force-automation vendor for beverage and consumer goods) acquired Infilect on **November 4, 2026**, to fuse visual intelligence with agentic AI.

## 2. Engineering Reality

- **Stack (LinkedIn tech list + job postings):** Python, **Django**, Celery, PostgreSQL, Redis, Nginx, Docker, Kubernetes, ELK, Grafana, Prometheus, Datadog, microservices, AWS/GCP.
- **Backend team signal:** current Senior Software Engineer profile states "Python Backend Developer - **Django, FastAPI**". Intern and full-stack postings all list **Python, Django/DRF, PostgreSQL**.
- **Recent internal build (Senior SWE, Oct 2025 - Jul 2026):** a centralized alerting and monitoring platform across APIs, data pipelines, and infrastructure, with L1/L2/L3 escalation, cutting incident detection time by **~80%**. This maps directly to the JD's "System Monitoring and Stability" responsibility.
- **Scale phase:** another posting states the platform is moving "from single-digit million ARR to double-digit million ARR", which is why the JD emphasizes latency, throughput, and hardware efficiency.
- **Public open source:** minimal. `InfilectAI` org has one repo (Nectar, a macOS meeting notepad with local MCP server).

## 3. Hiring Process Signal

- Glassdoor: 3.6/5, 50 reviews, 82% of interviews come from online applications.
- Reported Backend Engineer Intern loop (Mar 2026): online application, then technical screens centered on Python fundamentals, REST API design, and SQL.
- Posting behavior: this SDE internship was posted, closed, and reopened, which means the pipeline is actively refilling rather than pipelined far ahead.

## 4. Ranked Hiring Gaps `(Fit x Impact) / Effort`

| Rank | Gap | Fit | Impact | Effort | Score |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **Django + DRF service depth** on top of existing FastAPI/SQLAlchemy experience: ORM query optimization, migrations, admin, DRF serializers. The whole backend is Django and the candidate has zero Django evidence. | 9 | 10 | 4 | **22.5** |
| 2 | **Monitoring and data-quality dashboards** for the photo-ingestion pipeline (ELK/Grafana/Prometheus). JD explicitly asks for monitoring to protect "system stability and data quality". | 9 | 8 | 3 | **24.0** |
| 3 | **Non-relational store strategy** at shelf-scale: Redis caching plus document store for detection payloads. JD asks for relational and non-relational handling. | 8 | 7 | 3 | **18.7** |
| 4 | **Throughput and hardware efficiency** on CPU-bound image pipelines: batching, worker concurrency, per-image latency budgets. | 8 | 8 | 4 | **16.0** |

## 5. Action Package for the #1 Gap

- **1-Weekend MVP:** port the idempotent Celery/Redis ingestion core of `doubtless` onto Django + DRF, with DRF serializers, Django ORM migrations, a `/health` and `/metrics` endpoint, and a Prometheus counter for duplicate detection. Deliver a public repo, Docker Compose, and a 60-second walkthrough.
- **Cold email angle:** the reopening of this internship plus the Andavi integration means Django-side throughput work, not greenfield architecture.

## Sources

1. https://www.infilect.com/ (product scale claims)
2. https://www.infilect.com/products/infiviz (InfiViz capabilities)
3. https://infilect.com/library/infilect-joins-andavi (acquisition, Nov 2026)
4. https://andavisolutions.com/news/andavi-solutions-acquires-infilect-to-expand-ai-powered-retail-execution-and-agentic-ai-capabilities/
5. https://linkedin.com/company/infilect (tech stack list)
6. https://www.glassdoor.com/Interview/Infilect-Interview-Questions-E3429096.htm (intern loop)
7. https://builtin.com/job/sde-internship-backend/11520593 (posting mirror)
8. https://getmereferred.com/job-listing/back-end-developer-intern-infilect-bengaluru-2-to-5-years-experience-77a7d792-fe56-409b-acec-a3676fc04103 (scale phase language)
