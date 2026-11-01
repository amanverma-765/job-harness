#import "template.typ": resume, header, resume_heading, edu_item, exp_item, project_item, skill_item

#show: resume

#header(
  name: "Aman Verma",
  target_title: "Senior Backend Engineer",
  location: "Jaunpur, UP, India",
  phone: "+91 98765 43210",
  email: "aman@example.com",
  linkedin: "linkedin.com/in/amanverma",
  site: "github.com/amanverma-765"
)

#resume_heading("Technical Skills")
#skill_item(
  category: "Languages & Core",
  skills: "Python, Go (Golang), Rust, TypeScript, C++, SQL (PostgreSQL), Bash"
)
#skill_item(
  category: "Cloud & Infrastructure",
  skills: "Docker (Containerization), Kubernetes (K8s), AWS, Terraform (IaC), Git"
)
#skill_item(
  category: "Databases & Storage",
  skills: "PostgreSQL, Redis (In-Memory Cache), SQLite (FTS5), ChromaDB"
)
#skill_item(
  category: "Frameworks & Developer Tools",
  skills: "FastAPI, Pydantic AI, PyTorch, Celery, Hugging Face, pytest"
)

#resume_heading("Work Experience")
#exp_item(
  role: "Software Engineering Intern",
  name: "LexoLegal",
  location: "Remote",
  date: "June 2024 -- Aug. 2024",
  [Architected multi-tenant legal search engine in *Python* using *SQLite FTS5* and *FastAPI*, reducing query latency from *850ms to 110ms* across *40,000 regulatory documents*.],
  [Engineered asynchronous worker queue with *Redis* distributed caching and *Celery*, processing *15,000 document transformations daily* with *sub-200ms latency*.]
)

#resume_heading("Projects & Open Source")
#project_item(
  name: "ncert-rag-evals",
  skills: "Python, PyTorch, ChromaDB, Hugging Face, Docker, pytest",
  date: "Sept. 2024 -- Present",
  link_url: "https://github.com/amanverma-765/ncert-rag-evals",
  [Architected automated evaluation framework across *84 unit and integration test suites* using *pytest*, achieving *350 evals/sec* throughput (*p < 0.01*).],
  [Engineered semantic chunking pipeline in *ChromaDB* with *Hugging Face* embeddings, reducing vector search latency by *42%* across *12,000 document chunks*.]
)
#project_item(
  name: "doubtless",
  skills: "Python, Pydantic AI, PostgreSQL, SQLite, Docker",
  date: "Jan. 2024 -- May 2024",
  link_url: "https://github.com/amanverma-765/doubtless",
  [Developed local-first hybrid retrieval engine fusing BM25 with dense embeddings via Reciprocal Rank Fusion, achieving *86.9% Recall\@5 in 8.9ms on CPU*.],
  [Secured multi-tenant runtime isolation by binding tenant context inside *Pydantic AI* dependencies, preventing prompt-injection state leakage across sessions.]
)

#resume_heading("Education")
#edu_item(
  name: "Indian Institute of Information Technology",
  degree: "Bachelor of Technology in Computer Science and Engineering",
  location: "India",
  date: "2021 -- 2025",
  gpa: "8.6 / 10.0"
)
