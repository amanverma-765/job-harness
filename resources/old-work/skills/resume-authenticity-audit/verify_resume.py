#!/usr/bin/env python3
"""Resume Authenticity, Clarity, and Defensibility Auditor.

Audits LaTeX resumes for:
1. Non-skills in Technical Skills (architectural methods, model checkpoints, implementation details).
2. Fluff, passive verbs, and marketing hyperbole.
3. Unverified vanity metrics and indefensible claims.
4. ATS & LaTeX formatting hazards (branding capitalization, math mode artifacts, bullet consistency).
5. Compilation and strict 1-page budget check via tectonic and pdfinfo.
"""

from __future__ import annotations

import re
import shutil
import subprocess
import sys
from pathlib import Path

# Banned / Flagged terms in Technical Skills (concepts, methods, or details that are not searchable skills)
NON_SKILL_PATTERNS = [
    (r"\bhybrid search\b", "Concept/pattern, not a skill/tool (use ChromaDB, SQLite FTS5, etc.)"),
    (r"\bembeddings\b", "Model weights/concept, not a skill (use Sentence-Transformers, Hugging Face, OpenAI API)"),
    (r"\bheadless browser[s]?\b", "Implementation concept, not a tool (use Playwright, Puppeteer, Selenium)"),
    (r"\bdom tree parsing\b", "Activity, not a tool (use Selectolax, BeautifulSoup4, etc.)"),
    (r"\bdistributed lock[s]?\b", "Feature/pattern of Redis, not a standalone skill"),
    (r"\brecall@\w+", "Benchmark metric, not a tool or skill"),
    (r"\bmrr\b", "Evaluation metric, not a tool or skill"),
    (r"\bevals\s*\(", "Methodology/activity, not a tool name"),
]

# Weak or passive phrases in achievement bullets
WEAK_VERB_PATTERNS = [
    (r"\bworked on\b", "Passive duty description — replace with active engineering verb"),
    (r"\bresponsible for\b", "Passive job duty — replace with concrete achievement"),
    (r"\bhelped with\b", "Weak phrasing — state your specific individual contribution"),
    (r"\bassisted in\b", "Weak phrasing — state your specific individual contribution"),
    (r"\bdemonstrated that\b", "Passive observation — start with active power verb"),
    (r"\bdiscovered a\b", "Passive academic phrasing — use 'Architected', 'Engineered', etc."),
    (r"\bboosted\b(?!\s+by\s+\d+)", "Vague comparative claim — quantify baseline or replace with concrete scope"),
]

# Pretentious jargon and marketing hyperbole
FLUFF_PATTERNS = [
    (r"pareto frontier", "Academic posturing — state concrete latency/accuracy numbers directly"),
    (r"zero-leakage", "Marketing jargon — use 'isolated multi-tenant context' or state security mechanism"),
    (r"untrusted scraping injection", "Convoluted jargon — state exact boundary protection or token limit"),
    (r"eliminate.*hallucination[s]?", "Hyperbolic claim — models cannot guarantee zero hallucinations; use 'mitigate' or 'ground'"),
]

# ATS / LaTeX formatting traps
FORMAT_PATTERNS = [
    (r"\\href{[^}]+}{Github}", "Inconsistent branding — use 'GitHub' with capital H"),
    (r"\$p\s*=\s*[\d.]+\$", "Raw math mode in bullet — can cause ATS parsing errors; use plain text (p = X)"),
]


def audit_file(tex_path: Path) -> int:
    print(f"\n==================================================")
    print(f" AUDITING: {tex_path.name}")
    print(f"==================================================")

    if not tex_path.exists():
        print(f"❌ Error: File not found: {tex_path}")
        return 1

    content = tex_path.read_text(encoding="utf-8")
    issues = 0

    # 1. Technical Skills Check
    skills_match = re.search(r"\\header{Technical Skills}(.*?)(?=\\header|\Z)", content, re.DOTALL)
    if skills_match:
        skills_text = skills_match.group(1)
        print("\n🔍 Checking Technical Skills section...")
        for pattern, explanation in NON_SKILL_PATTERNS:
            for match in re.finditer(pattern, skills_text, re.IGNORECASE):
                print(f"  ⚠️  Non-skill detected: '{match.group(0)}'")
                print(f"      Reason: {explanation}")
                issues += 1

        # Check for Languages line
        if not re.search(r"\\item\s*\\textbf{Languages(?:\s*\\?&[^}]*)?:}", skills_text, re.IGNORECASE):
            print("  ⚠️  Missing dedicated 'Languages:' category in Technical Skills (critical for ATS filtering)")
            issues += 1
    else:
        print("  ⚠️  Could not locate '\\header{Technical Skills}' section")
        issues += 1

    # 2. Weak Verbs & Phrasing in Bullets
    print("\n🔍 Checking bullet phrasing & power verbs...")
    for lineno, line in enumerate(content.splitlines(), start=1):
        if "\\item" in line and not line.strip().startswith("%"):
            for pattern, reason in WEAK_VERB_PATTERNS:
                if re.search(pattern, line, re.IGNORECASE):
                    print(f"  ⚠️  Line {lineno}: Weak verb match '{re.search(pattern, line, re.IGNORECASE).group(0)}'")
                    print(f"      Recommendation: {reason}")
                    issues += 1
            for pattern, reason in FLUFF_PATTERNS:
                if re.search(pattern, line, re.IGNORECASE):
                    print(f"  ⚠️  Line {lineno}: Jargon/Hyperbole match '{re.search(pattern, line, re.IGNORECASE).group(0)}'")
                    print(f"      Recommendation: {reason}")
                    issues += 1

    # 3. Formatting & ATS Checks
    print("\n🔍 Checking ATS & LaTeX formatting hazards...")
    for lineno, line in enumerate(content.splitlines(), start=1):
        for pattern, fix in FORMAT_PATTERNS:
            if re.search(pattern, line):
                print(f"  ⚠️  Line {lineno}: Formatting trap '{re.search(pattern, line).group(0)}'")
                print(f"      Fix: {fix}")
                issues += 1

    # 4. Compilation & Page Count
    print("\n🔍 Checking compilation and page budget...")
    tectonic_bin = shutil.which("tectonic")
    pdfinfo_bin = shutil.which("pdfinfo")

    if tectonic_bin:
        out_dir = tex_path.parent
        res = subprocess.run([tectonic_bin, "-o", str(out_dir), str(tex_path)], capture_output=True, text=True)
        if res.returncode != 0:
            print(f"  ❌ Compilation failed with tectonic:\n{res.stderr or res.stdout}")
            issues += 1
        else:
            print("  ✅ Tectonic compilation succeeded with 0 errors.")
            pdf_path = out_dir / (tex_path.stem + ".pdf")
            if pdfinfo_bin and pdf_path.exists():
                p_res = subprocess.run([pdfinfo_bin, str(pdf_path)], capture_output=True, text=True)
                pages_match = re.search(r"Pages:\s+(\d+)", p_res.stdout)
                if pages_match:
                    pages = int(pages_match.group(1))
                    if pages == 1:
                        print(f"  ✅ Page count: Exactly {pages} page.")
                    else:
                        print(f"  ❌ Page budget violation: Generated PDF has {pages} pages (must be exactly 1 page).")
                        issues += 1
    else:
        print("  ℹ️  Tectonic not found; skipping compilation check.")

    print(f"\n--- Result: {issues} issue(s) detected in {tex_path.name} ---")
    return issues


def main() -> None:
    if len(sys.argv) > 1:
        targets = [Path(p) for p in sys.argv[1:]]
    else:
        # Default to repo resumes
        targets = [
            Path("/home/ark/Work/job-search/resume/resume_agentic_ai.tex"),
            Path("/home/ark/Work/job-search/resume/resume_android.tex"),
        ]

    total_issues = 0
    for target in targets:
        total_issues += audit_file(target)

    sys.exit(0 if total_issues == 0 else 1)


if __name__ == "__main__":
    main()
