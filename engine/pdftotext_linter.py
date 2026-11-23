#!/usr/bin/env python3
"""
engine/pdftotext_linter.py - Stream Extraction, CMap & Single-Column Reading Order Linter.
Uses pdftotext (from poppler-utils) to verify that ATS parsers extract linear, uncorrupted text.
"""

import sys
import re
import subprocess
import argparse
from pathlib import Path

import yaml

EMAIL_REGEX = re.compile(r"[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+")
PHONE_REGEX = re.compile(r"(\+?\d[\d\s\-().]{8,}\d)")
URL_REGEX = re.compile(r"(?:linkedin\.com\/in\/[^\s|]+|github\.com\/[^\s|]+)")

# Full, resolvable repository URLs in the extracted text (host + owner + repo).
# Visible link labels must stay resolvable when annotations are stripped, so a bare
# "owner/repo" label with no host is a defect, not a style choice.
REPO_URL_REGEX = re.compile(r"github\.com/[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+[A-Za-z0-9_.\-]*")


def visible_label(link_url: str) -> str:
    """The text a reader must see for a link to stay resolvable once annotations are stripped."""
    return (
        link_url.replace("https://", "")
        .replace("http://", "")
        .replace("www.", "")
        .rstrip("/")
    )


def project_links(pdf_path: Path) -> list[tuple[str, str]]:
    """Project links declared in the sibling resume YAML, if there is one."""
    yaml_path = pdf_path.with_suffix(".yaml")
    if not yaml_path.exists():
        return []
    try:
        data = yaml.safe_load(yaml_path.read_text(encoding="utf-8")) or {}
    except Exception as e:
        print(f"[!] Could not parse {yaml_path} for project links: {e}", file=sys.stderr)
        return []
    return [
        (str(p.get("name", "?")), str(p.get("link_url")))
        for p in (data.get("projects") or [])
        if str(p.get("link_url", "") or "").strip()
    ]


def check_resolves(links: list[tuple[str, str]]) -> list[str]:
    """Opt-in liveness probe: every declared URL must answer below 400.

    Uses http.client with a fixed https scheme so no other URL scheme can be reached.
    """
    import http.client
    import ssl
    from urllib.parse import urlsplit

    problems = []
    for name, link in links:
        parts = urlsplit(link)
        if parts.scheme != "https" or not parts.hostname:
            problems.append(f"Project '{name}' link is not an https URL, skipping probe: {link}")
            continue
        path = parts.path or "/"
        if parts.query:
            path += "?" + parts.query
        status = None
        for method in ("HEAD", "GET"):
            try:
                conn = http.client.HTTPSConnection(parts.hostname, timeout=10, context=ssl.create_default_context())
                conn.request(method, path, headers={"User-Agent": "resume-linter"})
                status = conn.getresponse().status
                conn.close()
            except Exception as e:
                status = str(e)
            if isinstance(status, int) and status in (403, 405, 501) and method == "HEAD":
                continue
            break
        if not isinstance(status, int) or status >= 400:
            problems.append(f"Project '{name}' link did not resolve ({status}): {link}")
    return problems


def audit_pdf(pdf_path: Path, resolve: bool = False) -> bool:
    if not pdf_path.exists():
        print(f"[-] PDF file not found: {pdf_path}", file=sys.stderr)
        return False

    cmd = ["pdftotext", "-layout", str(pdf_path), "-"]
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True, check=True)
    except FileNotFoundError:
        print("[-] 'pdftotext' utility not found. Please install poppler-utils.", file=sys.stderr)
        return False
    except subprocess.CalledProcessError as e:
        print(f"[-] pdftotext failed with error: {e.stderr}", file=sys.stderr)
        return False

    text = proc.stdout
    lines = text.splitlines()
    issues = []

    # If .scratch/debug exists, save raw extracted text stream for developer inspection
    debug_dir = Path(".scratch/debug")
    if debug_dir.exists():
        try:
            debug_dump = debug_dir / f"{pdf_path.stem}_extracted.txt"
            debug_dump.write_text(text, encoding="utf-8")
        except OSError:
            pass

    # 1. Unicode Purity & CMap Integrity
    pua_chars = []
    control_chars = []
    for idx, ch in enumerate(text):
        cp = ord(ch)
        # Unicode Private Use Area (often unmapped glyphs)
        if 0xE000 <= cp <= 0xF8FF:
            pua_chars.append((ch, hex(cp)))
        # Unprinted control characters (allow \n, \r, \t, and \f/\x0c for page breaks)
        elif cp < 32 and ch not in ("\n", "\r", "\t", "\f", "\x0c"):
            control_chars.append((ch, hex(cp)))

    if pua_chars:
        issues.append(f"Found {len(pua_chars)} unmapped Unicode Private Use Area glyph(s) (e.g. {pua_chars[0][1]}). Use text labels instead of icon fonts.")

    if control_chars:
        issues.append(f"Found {len(control_chars)} unprintable control character(s). Potential PDF stream corruption.")

    # 2. Contact Header Parsing
    header_text = "\n".join(lines[:8])
    if not EMAIL_REGEX.search(header_text):
        issues.append("Could not extract a valid email address in the first 8 lines of the PDF stream.")

    if not PHONE_REGEX.search(header_text):
        issues.append("Could not extract a valid phone number in the first 8 lines of the PDF stream.")

    if not URL_REGEX.search(header_text):
        issues.append("Could not extract LinkedIn or GitHub profile URLs in the header stream.")

    links = project_links(pdf_path)
    for name, link in links:
        if visible_label(link) not in text:
            issues.append(f"Project '{name}' link is not present as resolvable text; expected '{visible_label(link)}' in the stream.")

    if resolve:
        issues.extend(check_resolves(links))

    repo_urls = REPO_URL_REGEX.findall(text)
    if not repo_urls:
        issues.append("No resolvable repository URL (github.com/<owner>/<repo>) in the extracted text. Link labels must keep the host and path; a bare 'owner/repo' annotation label is unresolvable once PDF annotations are stripped.")

    # 3. Reading Order & Multi-Column Detection
    # Look for signs of column interleaving (e.g. widely separated horizontal blocks on single lines)
    for line_no, line in enumerate(lines[:30], start=1):
        # A single line with multiple distinct wide whitespace gaps (>25 spaces) between text segments
        segments = [s.strip() for s in re.split(r"\s{25,}", line) if s.strip()]
        if len(segments) > 2:
            issues.append(f"Line {line_no} appears to interleave multiple columns ({len(segments)} segments): '{line[:60]}...'")

    print(f"[*] Stream Extraction Audit: {pdf_path}")
    print(f"    Extracted lines: {len(lines)}")
    print(f"    Character count: {len(text)}")

    if issues:
        print(f"[-] FAILED with {len(issues)} issue(s):")
        for iss in issues:
            print(f"    - {iss}")
        return False

    print("[+] PASSED: 100% linear text extraction and CMap integrity confirmed.")
    return True


def main():
    parser = argparse.ArgumentParser(description="PDF Stream Extraction and CMap Linter")
    parser.add_argument("pdf_file", type=Path, help="Path to compiled PDF")
    parser.add_argument("--resolve", action="store_true", help="Also probe each project URL over the network (needs internet)")
    args = parser.parse_args()

    success = audit_pdf(args.pdf_file, resolve=args.resolve)
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
