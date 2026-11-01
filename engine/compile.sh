#!/usr/bin/env bash
# engine/compile.sh - Compiles Typst source and strictly verifies 1-page budget
set -euo pipefail

INPUT="${1:-}"
OUTPUT="${2:-}"

if [ -z "${INPUT}" ]; then
  echo "[-] Usage: engine/compile.sh <input.typ> [output.pdf]" >&2
  exit 1
fi

if [ -z "${OUTPUT}" ]; then
  OUTPUT="${INPUT%.typ}.pdf"
fi

if ! command -v typst >/dev/null 2>&1; then
  echo "[-] Error: 'typst' binary not found in PATH." >&2
  exit 1
fi

echo "[*] Compiling Typst document: ${INPUT} -> ${OUTPUT}"
# Use project root as root to allow imports from core/templates/
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
typst compile --root "${REPO_ROOT}" "${INPUT}" "${OUTPUT}"

if command -v pdfinfo >/dev/null 2>&1; then
  PAGES=$(pdfinfo "${OUTPUT}" | awk '/^Pages:/ {print $2}')
  echo "[*] Compiled PDF page count: ${PAGES}"
  if [ "${PAGES}" -ne 1 ]; then
    echo "[-] FAILED: Page budget exceeded (${PAGES} pages). Every resume/letter must be exactly 1 page." >&2
    exit 2
  fi
  echo "[+] PASSED: Exact 1-page budget verified."
else
  echo "[!] Warning: 'pdfinfo' utility not installed. Page budget check skipped."
fi
