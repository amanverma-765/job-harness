#import "/core/templates/cover_letter_base.typ": cover_letter

#cover_letter(
  name: "Aman Verma",
  location: "Jaunpur, UP, India",
  phone: "+91 6386617608",
  email: "akverma4aman@gmail.com",
  linkedin: "linkedin.com/in/amanverma765",
  site: "github.com/amanverma-765",
  date_str: "22 November 2026",
  recipient_name: "Hiring Team",
  recipient_title: "",
  company_name: "OakNorth",
  company_address: "Gurugram, Haryana, India",
)[
  #par(justify: true)[
    OakNorth's FY2025 report credits Claude Projects and Custom GPTs with faster analytical work and faster credit decisions, with credit-analytics headcount flat against a 33% increase in originations. That result moves the interesting question one step forward: which spreadsheet-bound workflows actually repay the switch to an AI-assisted tool, and by how much saved effort. Finding those workflows in the Management Support team, then building and measuring them, is the work I want to do in Gurugram.
  ]

  #par(justify: true)[
    My public work is built to answer exactly that kind of question. In *ncert-rag-evals* I wrote the retrieval benchmark myself, hand-rolled *SQL* over *SQLite FTS5* instead of leaning on a framework, and measured eight strategies on raw CPU latency: *86.9% Recall\@5 in 8.9ms*, significance confirmed with paired McNemar tests at *p = 0.0021* across 92 *pytest* tests. *doubtless* applies the same discipline to a tool students use live, streaming grounded answers from blackboard frames through a four-stage *Celery* and *Redis* pipeline. At *LexoLegal* I shipped *Pydantic AI* agents behind *38* asynchronous *FastAPI* endpoints and built an automated 12-hour case refresh sweep in *Celery* that guarantees zero duplicate alerts.
  ]

  #par(justify: true)[
    Knowing when GenAI does not pay is part of the job, and *vectorless-rag* quantifies a case where it does not: LLM-based page indexing bought a modest precision gain for *2.7x* token cost and *2x* latency against dense retrieval. I also build the ordinary tooling a support function runs on, with *Python* automation, *PostgreSQL* modelling, and *Excel* formulas and pivot tables for tracking and reporting.
  ]

  #par(justify: true)[
    I would welcome a short conversation about which manual processes in Management Support you would want instrumented first, and I can share the benchmark repository and its raw notebook outputs today.
  ]
]
