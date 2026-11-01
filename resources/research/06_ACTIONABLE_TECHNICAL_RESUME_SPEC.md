# The Actionable Technical Resume Specification (ATS-Engineered Standard)

**Document Reference:** `research/06_ACTIONABLE_TECHNICAL_RESUME_SPEC.md`  
**Purpose:** Concrete, Engineering-Grade Standard for Authoring Resumes Optimized for Modern ATS Architectures  
**Verification Level:** High (Synthesized from reverse-engineering audits, parsing engine teardowns, and empirical NLP research)

---

## 1. Architectural Design Principles

To maximize discovery, search visibility, and parsing fidelity across modern ATS platforms (Workday, Greenhouse, Ashby, Lever, iCIMS), an engineering resume must be treated as **structured data compiled into a deterministic presentation layer**:

```
+-----------------------------------------------------------------------------------+
|                        RESUME-AS-CODE (RaC) WORKFLOW                              |
|                                                                                   |
|  [Source Data Layer: YAML / JSON]                                                 |
|    - Single Source of Truth for experience, projects, skills, metrics             |
|                                                                                   |
|  [Typesetting Engine: Typst (Rust)]                                               |
|    - Native Unicode CMap generation (zero ligature corruption)                    |
|    - Deterministic single-column spatial layout compilation                       |
|                                                                                   |
|  [CI/CD Automated Validation]                                                     |
|    - pdftotext extraction check (confirm linear reading order)                    |
|    - Regex validation (confirm email, phone, LinkedIn extract cleanly)            |
|    - Taxonomy audit (confirm canonical skill entities match target job desc)      |
|                                                                                   |
|  [Target Output: 1-Page Vector PDF]                                               |
+-----------------------------------------------------------------------------------+
```

---

## 2. Layout, Typography & Structural Rules

| Element | The Rule | The Architectural "Why" |
| :--- | :--- | :--- |
| **Column Structure** | **Strict Single Column Only** | Multi-column layouts risk spatial text stream interleaving, where adjacent columns are extracted horizontally into scrambled text strings, corrupting NER sequence labeling. |
| **File Format** | **Vector PDF (with Selectable Text)** | Text-based PDFs preserve intended visual typography for the human recruiter's 6–15 second scan while allowing native PDF text stream extraction. (Scanned image PDFs and graphic PDFs fail completely without OCR). |
| **Document Margins** | **0.5 in to 0.75 in** | Avoids placing critical contact information in outer margin coordinates where parsers frequently crop or ignore text. |
| **Headers & Footers** | **Do NOT use Word / PDF margin headers** | Parsers (including Apache Tika and text extractors) routinely omit or discard XML header/footer nodes, stripping contact info. Place name and contact info in the main body stream. |
| **Tables & Text Boxes** | **Zero Tables, Zero Text Boxes** | Tables frequently break reading order; text boxes render as floating out-of-order vector objects in the PDF DOM. |
| **Icons & Glyphs** | **Text Labels Only (No FontAwesome)** | Replacing the words `"Email:"` or `"GitHub:"` with vector font icons frequently causes character mapping failures (`?` or unmapped glyphs), stripping contact URLs. |
| **Section Headings** | **Standard Lexical Headings Only** | Use canonical headings: `Work Experience`, `Education`, `Technical Skills`, `Projects`. Non-standard titles (`"My Journey"`, `"Toolkit"`) result in unmapped database fields in systems like Lever and Sovren. |

---

## 3. Typographic Engine Choice: Typst vs. LaTeX vs. Word

```
+-----------------------------------------------------------------------------------+
| Engine          | ATS Safety | Visual Quality | Code Driven | Ligature Safety     |
+-----------------------------------------------------------------------------------+
| Typst           | ★★★★★      | ★★★★★          | Yes (Rust)  | Native Clean Unicode|
| LaTeX (pdfTeX)  | ★★☆☆☆      | ★★★★★          | Yes (TeX)   | Breaks without CMap |
| Microsoft Word  | ★★★★☆      | ★★☆☆☆          | No (GUI)    | Safe if plain       |
| Canva / Figma   | ★☆☆☆☆      | ★★★★☆          | No (Design) | Severe OCR failures |
+-----------------------------------------------------------------------------------+
```

### Why Typst Is the Modern Engineering Standard
Unlike legacy LaTeX (which defaults to pdfTeX and requires arcane packages like `glyphtounicode` to avoid breaking `fi`, `fl`, and `ff` ligatures into non-searchable glyphs), **Typst (`typst/typst`)** is built in modern Rust. It emits clean, compliant PDF DOM objects with native Unicode `ToUnicode` character mappings out of the box, compiling in ~30 milliseconds.

---

## 4. Entity & Taxonomy Alignment Strategy

Modern ATS search operates via **Hybrid Retrieval (BM25 + Dense Vectors + Knowledge Graphs)**. To satisfy all three layers simultaneously, apply the following drafting pattern:

### 1. The Exact Job Title Multiplier
- Controlled reverse-engineering audits demonstrated a **10.6x callback multiplier** for resumes that match the exact job requisition title.
- *Action:* If your target role is `"Senior Backend Engineer"`, ensure your current or most recent title is formatted as `"Senior Backend Engineer"` (or `"Senior Software Engineer - Backend"`), rather than an ambiguous internal company title like `"Member of Technical Staff II"`.

### 2. Dual-Layer Skill Specification (Tool + Parent Ontology)
Workday Skills Cloud and Lightcast ontologies map specific tools to broader parent capabilities. Structure your technical bullet points to include both the specific implementation tool and the architectural category:

```markdown
<!-- SUB-OPTIMAL (Fails Lexical Search for "Cloud Infrastructure" or "Container Orchestration") -->
- Managed Kubernetes and Terraform on AWS.

<!-- OPTIMAL (Satisfies Exact Tokens, Dense Vectors, and Graph Ontologies) -->
- Architected cloud infrastructure on Amazon Web Services (AWS) using Terraform (Infrastructure as Code) and managed multi-region Kubernetes clusters (Container Orchestration).
```

### 3. Concrete Metrics as NER Anchors
Sequence-labeling NER models and modern LLM-as-a-judge screeners search for quantifiable impact statements to validate seniority:
- Structure bullets with the **Google XYZ Formula**: *"Accomplished [X], as measured by [Y], by doing [Z]."*
- *Example:* *"Reduced p99 API latency from 450ms to 85ms (81% improvement) across 12 Go microservices by implementing Redis distributed caching and connection pooling."*

---

## 5. Automated Local Terminal Verification Pipeline

Before submitting a resume to any ATS, run the following automated terminal verification checks to guarantee extraction fidelity:

### Test 1: Selectable Text & Ligature Extraction (`pdftotext`)
Verify that poppler utilities extract clean text without character substitution or ligature breakage:

```bash
# Extract raw text layout
pdftotext -layout resume.pdf extracted_resume.txt

# Check for corrupted ligatures (should return nothing)
grep -P "[\x00-\x1F\x7F-\x9F]" extracted_resume.txt

# Verify key technical terms extract intact
grep -i "Python" extracted_resume.txt
grep -i "Kubernetes" extracted_resume.txt
grep -i "PostgreSQL" extracted_resume.txt
```

### Test 2: Contact Information Regex Verification
Run a Python one-liner to verify that standard ATS regular expressions can extract your contact details:

```bash
python3 -c '
import re, subprocess

text = subprocess.check_output(["pdftotext", "resume.pdf", "-"]).decode("utf-8")

email = re.search(r"[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+", text)
phone = re.search(r"(\+?\d{1,3}[-.\s]?)?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}", text)
linkedin = re.search(r"linkedin\.com/in/[a-zA-Z0-9_-]+", text)
github = re.search(r"github\.com/[a-zA-Z0-9_-]+", text)

print(f"Email:    {email.group(0) if email else \"MISSING / UNPARSED\"}")
print(f"Phone:    {phone.group(0) if phone else \"MISSING / UNPARSED\"}")
print(f"LinkedIn: {linkedin.group(0) if linkedin else \"MISSING / UNPARSED\"}")
print(f"GitHub:   {github.group(0) if github else \"MISSING / UNPARSED\"}")
'
```

### Test 3: Reading Order & Interleaving Audit
Verify that your experience bullets and section headers do not scramble:

```bash
python3 -c '
import subprocess

text = subprocess.check_output(["pdftotext", "-layout", "resume.pdf", "-"]).decode("utf-8")
lines = [l.strip() for l in text.split("\n") if l.strip()]

print(f"Total parsed lines: {len(lines)}")
print("First 15 extracted lines (verify chronological reading order):")
for i, line in enumerate(lines[:15]):
    print(f"  [{i+1:02d}] {line}")
'
```

If the first 15 lines show dates appearing in the middle of sentences, or skills interleaved with company names, your layout has failed the coordinate extraction test and must be flattened to a strict single-column structure.
