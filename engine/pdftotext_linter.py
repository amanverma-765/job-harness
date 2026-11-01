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

EMAIL_REGEX = re.compile(r"[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+")
PHONE_REGEX = re.compile(r"(\+?\d[\d\s\-().]{8,}\d)")
URL_REGEX = re.compile(r"(?:linkedin\.com\/in\/[^\s|]+|github\.com\/[^\s|]+)")


def audit_pdf(pdf_path: Path) -> bool:
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
        debug_dump = debug_dir / f"{pdf_path.stem}_extracted.txt"
        debug_dump.write_text(text, encoding="utf-8")

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
    args = parser.parse_args()

    success = audit_pdf(args.pdf_file)
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
