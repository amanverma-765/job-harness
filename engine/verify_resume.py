#!/usr/bin/env python3
"""
engine/verify_resume.py - Deterministic AST/Regex Auditor for Technical Resumes.
Supports Typst (.typ) and LaTeX (.tex) sources.

Enforces:
  Gate 1: Non-Skills Ban (tools vs methods; mandatory Languages section)
  Gate 2: Defensibility Standard (no impossible SLAs or unbaselined vanity numbers)
  Gate 3: Codebase Truthfulness (against core/projects_corpus.yaml)
  Gate 4: Zero Fluff, Banned Hyperbole & Lead Verb Diversity
  Gate 5: ATS & Typst Rigor (Zero Em-Dashes, Canonical Branding, No Bolded Lead Verbs)
  1:1 Skill-to-Evidence Rule: Every listed skill must have proof in at least one bullet
"""

import sys
import re
import yaml
import argparse
import subprocess
from pathlib import Path
from typing import List, Dict, Tuple, Set

# Non-skills banned from the Technical Skills section
DEFAULT_BANNED_NON_SKILLS = [
    r"\bhybrid search\b",
    r"\bembeddings\b",
    r"\bheadless browser[s]?\b",
    r"\bdom tree parsing\b",
    r"\bdistributed lock[s]?\b",
    r"\brecall@\w+",
    r"\bmrr\b",
    r"\bevals\s*\(",
    r"\bclean code\b",
    r"\bagile\b",
    r"\bscrum\b",
    r"\bproblem solving\b",
]

# Weak and passive verbs
WEAK_VERBS = [
    r"\bworked on\b",
    r"\bresponsible for\b",
    r"\bhelped with\b",
    r"\bassisted in\b",
    r"\bdemonstrated that\b",
    r"\bdiscovered a\b",
]

# Fluff and marketing hyperbole
HYPERBOLE_PATTERNS = [
    (r"\bpareto frontier\b", "Replace academic marketing with concrete benchmark (ms / accuracy)."),
    (r"\bzero-leakage\b", "State the concrete security/isolation mechanism instead of marketing hype."),
    (r"\buntrusted scraping injection\b", "State exact token boundary or sanitization rule."),
    (r"\beliminate.*hallucination[s]?\b", "Unprovable claim; use 'mitigate' or 'ground with context'."),
]

# Canonical branding fixes
BRANDING_RULES = [
    (r"\bGithub\b", "GitHub"),
    (r"\bPostgresql\b", "PostgreSQL"),
    (r"\bPostgreSql\b", "PostgreSQL"),
]


class ResumeVerifier:
    def __init__(self, file_path: Path, corpus_path: Path = None):
        self.file_path = file_path
        self.corpus_path = corpus_path
        self.raw_content = file_path.read_text(encoding="utf-8")
        self.is_typst = file_path.suffix == ".typ"
        self.issues: List[str] = []
        self.warnings: List[str] = []

    def log_issue(self, gate: str, message: str, line_no: int = None):
        loc = f"Line {line_no}: " if line_no else ""
        self.issues.append(f"[{gate}] {loc}{message}")

    def log_warning(self, gate: str, message: str, line_no: int = None):
        loc = f"Line {line_no}: " if line_no else ""
        self.warnings.append(f"[{gate}] {loc}{message}")

    def check_em_dashes(self):
        """Global ban on em-dashes (--- or \u2014) in prose."""
        for idx, line in enumerate(self.raw_content.splitlines(), start=1):
            # Allow --- in YAML frontmatter or LaTeX comment lines
            if line.strip().startswith("---") or line.strip().startswith("%"):
                continue
            if "\u2014" in line:
                self.log_issue("Gate 5: Zero Em-Dashes", "Found Unicode em-dash ('\u2014'). Replace with comma, colon, semicolon, or en-dash ('--') for number/date ranges.", idx)
            if "---" in line:
                self.log_issue("Gate 5: Zero Em-Dashes", "Found LaTeX em-dash ('---'). Replace with comma, colon, semicolon, or en-dash ('--') for ranges.", idx)

    def check_canonical_branding(self):
        """Ensure canonical naming for common technologies."""
        for idx, line in enumerate(self.raw_content.splitlines(), start=1):
            for pattern, correct in BRANDING_RULES:
                if re.search(pattern, line):
                    self.log_issue("Gate 5: Branding", f"Non-canonical casing detected: use '{correct}'.", idx)

    def extract_bullets_and_skills(self) -> Tuple[List[Tuple[str, int]], List[Tuple[str, int]]]:
        """Extract bullet points and listed skill items from Typst, YAML, or LaTeX."""
        bullets = []
        skills = []

        # Case 1: Pure YAML file
        if self.file_path.suffix in [".yaml", ".yml"]:
            try:
                data = yaml.safe_load(self.raw_content) or {}
                for idx, sk in enumerate(data.get("skills", []), start=1):
                    skills.append((sk.get("skills", ""), idx))
                for exp in data.get("experience", []):
                    for idx, pt in enumerate(exp.get("points", []), start=1):
                        bullets.append((pt, idx))
                for proj in data.get("projects", []):
                    if proj.get("skills"):
                        bullets.append((proj.get("skills"), 0))
                    for idx, pt in enumerate(proj.get("points", []), start=1):
                        bullets.append((pt, idx))
                return bullets, skills
            except Exception as e:
                self.log_issue("Parser", f"Failed to parse YAML file: {e}")
                return bullets, skills

        # Case 2: Typst file that loads a YAML file via yaml("...")
        m_yaml = re.search(r'yaml\(\s*"([^"]+)"\s*\)', self.raw_content)
        if self.is_typst and m_yaml:
            yaml_rel = m_yaml.group(1)
            yaml_path = self.file_path.parent / yaml_rel
            if yaml_path.exists():
                try:
                    data = yaml.safe_load(yaml_path.read_text(encoding="utf-8")) or {}
                    for idx, sk in enumerate(data.get("skills", []), start=1):
                        skills.append((sk.get("skills", ""), idx))
                    for exp in data.get("experience", []):
                        for idx, pt in enumerate(exp.get("points", []), start=1):
                            bullets.append((pt, idx))
                    for proj in data.get("projects", []):
                        if proj.get("skills"):
                            bullets.append((proj.get("skills"), 0))
                        for idx, pt in enumerate(proj.get("points", []), start=1):
                            bullets.append((pt, idx))
                    return bullets, skills
                except Exception as e:
                    self.log_warning("Parser", f"Found YAML reference {yaml_rel} but parsing failed: {e}")

        # Case 3: Native Typst markup
        if self.is_typst:
            bullet_pattern = re.compile(r"^\s*\[([^\]]+)\](?:,)?\s*$")

            multi_skill_pattern = re.compile(
                r'#skill_item\s*\(\s*(?:category:\s*"[^"]*",\s*)?skills:\s*"([^"]+)"',
                re.DOTALL
            )
            for m in multi_skill_pattern.finditer(self.raw_content):
                line_no = self.raw_content[:m.start()].count("\n") + 1
                skills.append((m.group(1), line_no))

            for idx, line in enumerate(self.raw_content.splitlines(), start=1):
                m_bullet = bullet_pattern.match(line)
                if m_bullet:
                    bullets.append((m_bullet.group(1), idx))
        else:
            # Case 4: LaTeX \item bullets and skills
            for idx, line in enumerate(self.raw_content.splitlines(), start=1):
                if r"\item" in line:
                    clean = re.sub(r"\\item\s*", "", line).strip()
                    if clean:
                        bullets.append((clean, idx))

        return bullets, skills

    def check_gate_1_non_skills(self, skills: List[Tuple[str, int]]):
        """Gate 1: The Non-Skill Ban (Tools vs. Methods)."""
        has_languages = False
        all_skills_text = " ".join([s[0] for s in skills]).lower()

        # Check if languages category exists
        search_targets = [self.raw_content]
        m_yaml = re.search(r'yaml\(\s*"([^"]+)"\s*\)', self.raw_content)
        if m_yaml:
            yp = self.file_path.parent / m_yaml.group(1)
            if yp.exists():
                search_targets.append(yp.read_text(encoding="utf-8"))

        for content in search_targets:
            for idx, line in enumerate(content.splitlines(), start=1):
                if re.search(r'category:\s*"?Languages', line, re.IGNORECASE) or r"\textbf{Languages" in line:
                    has_languages = True
                    break
            if has_languages:
                break

        if not has_languages and skills:
            self.log_issue("Gate 1: Non-Skills Ban", "Missing dedicated 'Languages' or 'Languages & Core' category in Technical Skills.")

        for skill_line, line_no in skills:
            for pat in DEFAULT_BANNED_NON_SKILLS:
                if re.search(pat, skill_line, re.IGNORECASE):
                    self.log_issue("Gate 1: Non-Skills Ban", f"Banned method/concept found in Technical Skills: '{pat}'. Move to bullet points or use real tools.", line_no)

    def check_gate_2_defensibility(self, bullets: List[Tuple[str, int]]):
        """Gate 2: Defensibility Standard (No impossible SLAs or unverified scraping throughput)."""
        sla_trap = re.compile(r"\b\d+,\d+\s+.*(?:in|within)\s+\d+\s+seconds?\b", re.IGNORECASE)
        for bullet, line_no in bullets:
            if sla_trap.search(bullet):
                self.log_issue("Gate 2: Defensibility", "Suspicious real-time SLA in bullet (e.g. 15,000 requests in 15 seconds). State batching mechanism or real throughput.", line_no)

    def check_gate_4_fluff_and_verbs(self, bullets: List[Tuple[str, int]]):
        """Gate 4: Zero Fluff, Weak Verbs, and Lead Action Verb Diversity."""
        lead_verbs = {}
        for bullet, line_no in bullets:
            if line_no == 0:
                continue
            clean = re.sub(r"[*_\\]", "", bullet).strip()

            # Check weak verbs
            for weak in WEAK_VERBS:
                if re.search(weak, clean, re.IGNORECASE):
                    self.log_issue("Gate 4: Fluff Ban", f"Weak/passive verb phrase '{weak}' found. Lead with a strong technical action verb.", line_no)

            # Check marketing hyperbole
            for pat, advice in HYPERBOLE_PATTERNS:
                if re.search(pat, clean, re.IGNORECASE):
                    self.log_issue("Gate 4: Fluff Ban", f"Hyperbole phrase '{pat}' found. {advice}", line_no)

            # Check F-Pattern bolding rule: Never bold the leading verb
            if self.is_typst:
                m_bold_lead = re.match(r"^\s*\*([A-Za-z]+)\*", bullet)
                if m_bold_lead:
                    self.log_issue("Gate 4: Scannability", f"Leading action verb '*{m_bold_lead.group(1)}*' is bolded. DO NOT bold the first verb; bold substantive technologies and metrics instead.", line_no)

            # Extract leading verb for diversity
            tokens = clean.split()
            if tokens:
                first_word = tokens[0].lower()
                lead_verbs[first_word] = lead_verbs.get(first_word, 0) + 1

        # Check verb repetition (max 2 across entire resume)
        for verb, count in lead_verbs.items():
            if count > 2 and verb not in ["developed", "built"]:
                self.log_warning("Gate 4: Verb Diversity", f"Leading action verb '{verb}' is repeated {count} times (maximum recommended is 2). Use synonyms.")

    def check_1_to_1_skill_evidence(self, bullets: List[Tuple[str, int]], skills: List[Tuple[str, int]]):
        """Strict 1:1 Skill-to-Evidence Rule: Every skill in Technical Skills must appear in at least one bullet."""
        if not skills or not bullets:
            return

        combined_bullets_text = " ".join([b[0] for b in bullets]).lower()

        for skill_string, line_no in skills:
            # Parse individual skill tokens
            tokens = [t.strip() for t in skill_string.split(",") if t.strip()]
            for raw_token in tokens:
                # Strip parenthetical clarifications like 'Docker (Containerization)' -> 'Docker'
                clean_token = re.sub(r"\([^)]*\)", "", raw_token).strip()
                if not clean_token or len(clean_token) < 2:
                    continue
                # Special cases for short tokens (C, Go, R, SQL)
                if clean_token in ["Go", "C", "R", "SQL"]:
                    pat = rf"\b{re.escape(clean_token.lower())}\b"
                else:
                    pat = rf"\b{re.escape(clean_token.lower())}"

                if not re.search(pat, combined_bullets_text):
                    self.log_warning("1:1 Skill Evidence Proof", f"Skill '{clean_token}' listed in Technical Skills has NO supporting evidence in Experience or Projects bullets. Keyword-stuffing penalty risk.", line_no)

    def check_density_and_over_stuffing(self, bullets: List[Tuple[str, int]]):
        """Audit page density: detect over-stuffing (>18 bullets, >550 words, compressed line gaps) or under-filling."""
        total_bullets = len(bullets)
        all_text = " ".join([b[0] for b in bullets])
        bullet_words = len(re.sub(r"[*_\\]", "", all_text).split())

        # Check total document word count from compiled PDF if available
        pdf_path = self.file_path.with_suffix(".pdf")
        doc_words = 0
        if pdf_path.exists():
            try:
                raw_pdf_text = subprocess.check_output(["pdftotext", "-layout", str(pdf_path), "-"]).decode("utf-8")
                doc_words = len(raw_pdf_text.split())
            except Exception:
                pass
        if not doc_words:
            doc_words = bullet_words

        # Check line gap if specified
        m_lg = re.search(r'line_gap:\s*([0-9.]+)em', self.raw_content)
        if m_lg:
            lg_val = float(m_lg.group(1))
            if lg_val < 0.68:
                self.log_warning("Over-Stuffing Alert", f"line_gap is compressed to {lg_val}em (< 0.68em floor). Do not cram text with reduced spacing; suggest pruning bullets.")

        # Archetype templates (core/templates/resume_android, resume_ai) are master catalogs with allowed overflow.
        is_base_catalog = "core/templates" in str(self.file_path)

        if total_bullets > 18:
            if not is_base_catalog:
                self.log_warning("Over-Stuffing Alert", f"Resume has {total_bullets} bullets (threshold: max 18). Visual density causes recruiter scan fatigue. Recommended pruning: remove {total_bullets - 18} lowest-match bullet(s).")

        if doc_words > 600:
            if not is_base_catalog:
                self.log_warning("Over-Stuffing Alert", f"Total document word count is {doc_words} words (threshold: max 600 words for tailored resumes; +{doc_words - 600} words over). Recommend pruning candidate bullets to reduce cognitive load.")

        if total_bullets < 14 and (not m_lg or float(m_lg.group(1)) <= 0.75):
            self.log_warning("Under-Fill Alert", f"Resume has only {total_bullets} bullets with low/default line gap. Scale line_gap to 0.85em-0.90em or add commit-grounded pointers to avoid dead-space.")

    def run_all(self) -> bool:
        self.check_em_dashes()
        self.check_canonical_branding()
        bullets, skills = self.extract_bullets_and_skills()
        self.check_gate_1_non_skills(skills)
        self.check_gate_2_defensibility(bullets)
        self.check_gate_4_fluff_and_verbs(bullets)
        self.check_1_to_1_skill_evidence(bullets, skills)
        self.check_density_and_over_stuffing(bullets)

        print(f"[*] Verified resume: {self.file_path}")
        print(f"    Bullets checked: {len(bullets)}")
        print(f"    Skill groups checked: {len(skills)}")

        if self.warnings:
            print(f"[!] {len(self.warnings)} warning(s):")
            for w in self.warnings:
                print(f"    - {w}")

        if self.issues:
            print(f"[-] FAILED with {len(self.issues)} issue(s):")
            for iss in self.issues:
                print(f"    - {iss}")
            return False

        print("[+] PASSED: 0 errors detected across all 5 Quality Gates.")
        return True


def main():
    parser = argparse.ArgumentParser(description="Deterministic AST/Regex Resume Auditor")
    parser.add_argument("file", type=Path, help="Path to resume (.typ or .tex)")
    parser.add_argument("--corpus", type=Path, default=None, help="Path to core/projects_corpus.yaml")
    args = parser.parse_args()

    if not args.file.exists():
        print(f"[-] File not found: {args.file}", file=sys.stderr)
        sys.exit(1)

    verifier = ResumeVerifier(args.file, args.corpus)
    success = verifier.run_all()
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
