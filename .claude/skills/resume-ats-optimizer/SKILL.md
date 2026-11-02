---
name: resume-ats-optimizer
description: Ensure single-column parsing fidelity, Unicode CMap integrity, and standardized taxonomy mapping for enterprise ATS parsers (Workday, Greenhouse, Ashby, Lever).
---

# Resume ATS Optimizer

## When to Use This Skill
- Whenever checking or structuring resumes for ATS parsing compliance.

---

## ATS Architectural Standards

1. **Strict Single-Column Flow:**
   - Multi-column layouts cause text streams to interleave horizontally, scrambling name, contact info, and experience lines.
   - Use strict single-column blocks (`core/templates/template.typ`).

2. **Standard Section Headers:**
   - Use canonical headers: `Technical Skills`, `Work Experience`, `Projects & Open Source`, `Education`.
   - Never use colloquial headers like *"My Journey"* or *"Toolkit"*.

3. **Dynamic Section Hierarchy Policy for Candidate:**
   - **If candidate HAS Work Experience:** Header -> Work Experience -> Projects -> Technical Skills -> Leadership -> Education.
   - **If student with ZERO Work Experience:** Header -> Technical Skills -> Projects -> Leadership -> Education.
   - Placing education at the bottom ensures hiring managers and ATS rankers evaluate engineering firepower and open-source contributions first.

4. **Zero Tables & Zero Graphic Text Boxes:**
   - No floating vector frames or graphic boxes that disrupt the PDF DOM extraction stream.
