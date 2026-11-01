#!/usr/bin/env python3
"""
engine/visual_verify.py - Visual Layout & Render Auditor for Technical Resumes.
Renders compiled PDFs to high-resolution PNGs via pdftoppm, detects page overflows,
and verifies visual layout integrity.
"""

import sys
import shutil
import argparse
import subprocess
from pathlib import Path


def visually_verify(pdf_path: Path, output_dir: Path = None) -> bool:
    if not pdf_path.exists():
        print(f"[-] PDF not found: {pdf_path}", file=sys.stderr)
        return False

    if not shutil.which("pdftoppm"):
        print("[-] 'pdftoppm' utility not found. Please install poppler-utils.", file=sys.stderr)
        return False

    if output_dir is None:
        output_dir = Path(".scratch/debug")
        output_dir.mkdir(parents=True, exist_ok=True)

    stem = pdf_path.stem
    prefix = output_dir / f"{stem}_visual"

    print(f"[*] Rendering PDF to PNG: {pdf_path} -> {prefix}-*.png")
    cmd = ["pdftoppm", "-png", "-r", "150", str(pdf_path), str(prefix)]
    res = subprocess.run(cmd, capture_output=True, text=True)
    if res.returncode != 0:
        print(f"[-] pdftoppm failed: {res.stderr}", file=sys.stderr)
        return False

    pngs = sorted(list(output_dir.glob(f"{stem}_visual-*.png")))
    if not pngs:
        print("[-] No PNG images generated.", file=sys.stderr)
        return False

    # Check 1: Strict Single-Page Budget
    if len(pngs) > 1:
        print(f"[-] VISUAL AUDIT FAILED: PDF produced {len(pngs)} pages (single-page budget violated!).", file=sys.stderr)
        for p in pngs:
            print(f"    - Generated: {p}")
        return False

    print(f"[+] Visual Render OK: 1 single page rendered at {pngs[0]}")
    print(f"[+] Image size: {pngs[0].stat().st_size} bytes")
    print(f"[+] Visual inspection ready: Inspect {pngs[0]} for text overlap, F-pattern bolding, and margin balance.")
    return True


def main():
    parser = argparse.ArgumentParser(description="Visual Layout & Render Auditor for Resumes")
    parser.add_argument("pdf_path", type=Path, help="Path to compiled PDF")
    parser.add_argument("--out-dir", type=Path, default=None, help="Directory to save visual PNG previews")
    args = parser.parse_args()

    success = visually_verify(args.pdf_path, args.out_dir)
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
