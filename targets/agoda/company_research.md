# Agoda — Company Research (engineering intelligence)

Captured: 22 November 2026. Scope: engineering org, stack, scale, hiring signals for the Gurugram
office and the 2027 internship.

## 1. Fundamentals

- Agoda is a travel booking platform (accommodation, flights, activities) founded in 2005, part of
  Booking Holdings (NASDAQ: BKNG) since 2007. 7,000+ employees across 90 countries.
- Product surface: millions of hotels and holiday properties, flights, experiences. Core business
  systems are inventory and pricing, product information, customer data, communications, partner
  data, booking systems, payments.
- Engineering culture is data-driven, on-premise-first, and release-heavy: dozens of releases per day
  into mission-critical systems.

## 2. Scale (published engineering numbers)

| Signal | Value | Source |
| --- | --- | --- |
| Kafka throughput | ~1.5 trillion events/day (2021), ~1.8 trillion (2023), ~2x growth per year | Agoda Engineering blog, Medium [1][2] |
| Data volume | ~30+ PB stored, ~600 TB written daily | Ask an Agodan tech post, 2024 |
| Spark jobs | ~100,000 jobs/day on YARN, migrating to Kubernetes | Ask an Agodan tech post, 2024 |
| Feature Store serving SLA | P99 10 ms at ~3.5M entities/second | Agoda Engineering, 8 Oct 2025 [3] |
| Compute cost after Rust migration | 84% reduction vs Scala baseline at 5x traffic; CPU at 40% of prior Scala peak, memory at 15% | Agoda Engineering, 8 Oct 2025 [3] |

## 3. Engineering stack (verified from postings and blog posts)

- **Backend languages:** Kotlin (now the primary language, "largely replaced" Scala), Scala (legacy
  systems), C#, Go. Java mentioned in older postings.
- **Data platforms:** Kafka (message broker, async API, cross-DC replication, ML feature pipelines),
  Aerospike, ScyllaDB (feature store), Spark/SparkSQL, Impala -> StarRocks, Vertica, MSSQL,
  PostgreSQL, Hadoop/YARN.
- **Infra / delivery:** on-premise across four data centers, TeamCity CI, Puppet deployment, Docker
  and Kubernetes migration in progress, MLflow, Kubeflow, Graphite/Grafana monitoring, OpenMetadata,
  ElasticSearch.
- **Feature Store Serving:** started as a Feast (Java/Spring Boot) fork, rewritten in Scala in 2022,
  then rewritten in **Rust** in 2025 to escape JVM GC pauses inside a 10 ms P99 budget. This is the
  clearest signal of the engineering culture: SLA-first, measure, rewrite when the runtime is the
  bottleneck.
- **AI/ML:** Feature Store, ML pipelines on Kafka, GenAI/LLM platform teams scaling in Gurugram and
  Bangkok (2026 hiring push for backend + LLM/GenAI).

## 4. Recent engineering themes (last 12-18 months)

1. **Runtime economics over language loyalty.** Scala -> Rust for Feature Store Serving produced 5x
   traffic growth at 40% of the original CPU and an 84% compute cost cut ([3]). Teams are rewarded for
   deleting runtime cost, not for adding framework layers.
2. **Kafka as the backbone.** Kafka is not just analytics plumbing: it is used as an asynchronous API,
   for cross-data-center replication, and to feed ML feature pipelines. Backend engineers are expected
   to reason about producer/consumer contracts, auditability, and exactly-once style guarantees.
3. **Kotlin is the forward backend language.** Postings and blog posts both say Kotlin is replacing
   Scala for new services, with C# and Go in the mix.
4. **Zero-downtime delivery.** Dozens of releases per day with state-of-the-art CI/CD and testing.
5. **GenAI feature work.** ML/LLM feature prototyping and productionization is now in the intern job
   description, not just senior roles.

## 5. Gurugram office signals

- Gurugram is one of Agoda's fastest-growing engineering hubs (2026 hiring push across Backend,
  GenAI, Full Stack, Data).
- Open Gurugram roles in the same hiring wave include Staff Software Engineer (Backend), Staff
  Software Engineer (Full Stack), Staff Software Engineer (Frontend-Heavy Full Stack), Staff Software
  Engineer (GenAI), Lead Software Engineer (Level 5) Backend, and the 2027 internship itself.
- Interview format for the internship: online coding test (28-29 Nov 2026), shortlist, then a single
  in-person interview day in Gurugram (11 or 17 Dec 2026), no remote alternative.
- Agoda also runs 1-day fast-track interview programs for senior roles, which confirms the org's
  preference for compressed, high-signal loops.

## 6. What this means for a candidate

- The intern posting is deliberately generalist: "full stack wizard, back end guru, or domain
  specialist". The differentiators are fundamentals (OOP/functional, databases), evidence of shipping
  to production, and comfort with async/data-heavy backends.
- Kotlin + PostgreSQL + async pipelines + tested code is the highest-leverage combination in the
  candidate's verified corpus.
- LLM feature work is explicitly in scope, so agentic/ML feature evidence is a genuine bonus rather
  than a distraction.
- Gaps to not fake: Scala, C#, Java, Kafka, Spark, Cassandra, MSSQL, Hadoop, TeamCity, Puppet. None
  are essential for the internship; all are bonus.

## 7. Honest positioning

- Strongest match: Kotlin depth, PostgreSQL relational modelling, async job pipelines with idempotency
  and distributed locks, React 19 + TypeScript client work, PyTorch-based multimodal pipeline, and
  test discipline (1,024 pytest suites at LexoLegal, 92 + 107 in personal repos).
- Weaker match: JVM big-data stack (Kafka/Spark/Cassandra/Hadoop) and the Scala/C# codebases the
  company still runs. Do not claim any of these.
- The cover letter should anchor on: async pipeline correctness, database modelling, and Kotlin.

## Sources

1. Shaun Sit, "How Agoda manages 1.5 Trillion Events per day on Kafka", Agoda Engineering, 13 Jul 2021.
   https://medium.com/agoda-engineering/how-agoda-manages-1-5-trillion-events-per-day-on-kafka-f0a27fc32ecb
2. Agoda Engineering, "How Agoda manages 1.8 Trillion Events per day on Kafka", 18 Sep 2023.
   https://medium.com/agoda-engineering/how-agoda-manages-1-8-trillion-events-per-day-on-kafka-1d6c3f4a7ad1
3. Worakarn Isaratham, "Why We Bet on Rust to Supercharge Feature Store at Agoda", Agoda Engineering, 8 Oct 2025.
   https://medium.com/agoda-engineering/why-we-bet-on-rust-to-supercharge-feature-store-at-agoda-ed4a70d2efb7
4. Cynthia Dunlop, "How Agoda Scaled Its Feature Store 50X", ScyllaDB, 3 Mar 2026 (3.5M entities/second,
   DragonflyDB caching layer). https://www.scylladb.com/2026/03/03/agoda-scaled-its-feature-store-50x/
5. Agoda Engineering & Design blog index (feature store, data platform, pipelines).
   https://medium.com/agoda-engineering
