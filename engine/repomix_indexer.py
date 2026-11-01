#!/usr/bin/env python3
"""
engine/repomix_indexer.py - Automates commit-pinned repo indexing via repomix and gh CLI.
Updates core/projects_corpus.yaml with verified commit SHAs, architectures, and empirical facts.
Uses Python tempfile for intermediate packs to keep the repository 100% clean.
"""

import sys
import re
import json
import yaml
import shutil
import tempfile
import argparse
import subprocess
from pathlib import Path
from datetime import datetime, timezone


def get_latest_commit_sha(repo_target: str) -> str:
    """Fetch the latest commit SHA using gh CLI or local git."""
    p = Path(repo_target)
    if p.is_dir() and (p / ".git").exists():
        res = subprocess.run(["git", "-C", str(p), "rev-parse", "HEAD"], capture_output=True, text=True, check=True)
        return res.stdout.strip()

    owner_repo = repo_target.replace("https://github.com/", "").replace("github.com/", "").strip("/")
    try:
        cmd = ["gh", "api", f"repos/{owner_repo}/commits/HEAD", "--jq", ".sha"]
        res = subprocess.run(cmd, capture_output=True, text=True, check=True)
        return res.stdout.strip()
    except Exception as e:
        print(f"[!] Warning: Could not fetch commit SHA for '{repo_target}' via gh: {e}", file=sys.stderr)
        return "unpinned-local-dev"


def run_repomix_pack(repo_target: str, keep_pack: bool = False) -> dict:
    """Run repomix packing to a temporary file, inspect facts, and automatically clean up."""
    facts = {
        "verified_stack": [],
        "test_suite_count": 0,
        "architecture_hints": []
    }

    if not shutil.which("npx") and not shutil.which("repomix"):
        print("[!] Note: Neither 'repomix' nor 'npx' found in PATH. Skipping deep pack inspection.")
        return facts

    owner_repo = repo_target.replace("https://github.com/", "").replace("github.com/", "").strip("/")
    is_local = Path(repo_target).is_dir()

    scratch_dir = Path(".scratch/repomix")
    if scratch_dir.exists():
        tmp_output_path = scratch_dir / f"{owner_repo.replace('/', '_')}_pack.xml"
    else:
        with tempfile.NamedTemporaryFile(suffix=".xml", delete=False) as tmp:
            tmp_output_path = Path(tmp.name)

    try:
        print(f"[*] Running repomix pack into: {tmp_output_path}")
        cmd = ["npx", "repomix"]
        if not is_local:
            cmd.extend(["--remote", owner_repo])
        else:
            cmd.extend([repo_target])
        cmd.extend(["--output", str(tmp_output_path), "--style", "xml"])

        res = subprocess.run(cmd, capture_output=True, text=True)
        if res.returncode == 0 and tmp_output_path.exists():
            content = tmp_output_path.read_text(encoding="utf-8", errors="ignore")

            # Detect frameworks
            detected_stack = set()
            if "fastapi" in content.lower(): detected_stack.add("FastAPI")
            if "pydantic" in content.lower(): detected_stack.add("Pydantic AI")
            if "torch" in content.lower() or "pytorch" in content.lower(): detected_stack.add("PyTorch")
            if "chromadb" in content.lower(): detected_stack.add("ChromaDB")
            if "sqlite" in content.lower(): detected_stack.add("SQLite")
            if "redis" in content.lower(): detected_stack.add("Redis")
            if "celery" in content.lower(): detected_stack.add("Celery")
            if "docker" in content.lower(): detected_stack.add("Docker")
            if "pytest" in content.lower(): detected_stack.add("pytest")
            if "transformers" in content.lower(): detected_stack.add("Hugging Face")

            facts["verified_stack"] = sorted(list(detected_stack))

            # Count test suites/functions
            test_funcs = len(re.findall(r"def\s+test_\w+\(", content))
            if test_funcs > 0:
                facts["test_suite_count"] = test_funcs
            print(f"[+] Repomix extraction: Detected stack={facts['verified_stack']}, tests={facts['test_suite_count']}")
    except Exception as e:
        print(f"[!] Warning: Repomix execution failed: {e}", file=sys.stderr)
    finally:
        # Guarantee no temporary files are left behind
        if tmp_output_path.exists():
            tmp_output_path.unlink()

    return facts


def index_repository(repo_target: str, corpus_file: Path, domain: str = "") -> dict:
    commit_sha = get_latest_commit_sha(repo_target)
    owner_repo = repo_target.replace("https://github.com/", "").replace("github.com/", "").strip("/")
    repo_name = owner_repo.split("/")[-1] if "/" in owner_repo else owner_repo
    owner = owner_repo.split("/")[0] if "/" in owner_repo else "amanverma-765"

    now_iso = datetime.now(timezone.utc).isoformat()

    print(f"[*] Indexing repository: {owner}/{repo_name}")
    print(f"    Commit SHA: {commit_sha}")

    # Inspect repository facts via repomix
    extracted = run_repomix_pack(repo_target)

    # Load existing corpus
    if corpus_file.exists():
        with open(corpus_file, "r", encoding="utf-8") as f:
            data = yaml.safe_load(f) or {}
    else:
        data = {"schema_version": "1.0.0", "repositories": []}

    repos = data.get("repositories", [])
    existing_entry = None
    for r in repos:
        if r.get("id") == repo_name or r.get("name") == repo_name:
            existing_entry = r
            break

    if existing_entry:
        print(f"[*] Updating existing corpus entry for '{repo_name}'")
        existing_entry["commit_sha"] = commit_sha
        existing_entry["last_indexed"] = now_iso
        if domain:
            existing_entry["domain"] = domain
        if extracted.get("verified_stack"):
            # Merge stacks
            combined = set(existing_entry.get("verified_stack", [])) | set(extracted["verified_stack"])
            existing_entry["verified_stack"] = sorted(list(combined))
        if extracted.get("test_suite_count"):
            existing_entry.setdefault("empirical_metrics", {})["test_suite_count"] = extracted["test_suite_count"]
    else:
        print(f"[*] Creating new corpus entry for '{repo_name}'")
        new_entry = {
            "id": repo_name,
            "name": repo_name,
            "owner": owner,
            "repo_url": f"https://github.com/{owner}/{repo_name}",
            "commit_sha": commit_sha,
            "last_indexed": now_iso,
            "domain": domain or "Software Engineering",
            "architecture_patterns": [],
            "empirical_metrics": {"test_suite_count": extracted.get("test_suite_count", 0)},
            "verified_stack": extracted.get("verified_stack", ["Python"]),
            "defensible_bullets": []
        }
        repos.append(new_entry)

    data["repositories"] = repos

    with open(corpus_file, "w", encoding="utf-8") as f:
        yaml.dump(data, f, sort_keys=False, default_flow_style=False)

    print(f"[+] Corpus successfully updated at {corpus_file}")
    return existing_entry or new_entry


def main():
    parser = argparse.ArgumentParser(description="Repomix & Commit SHA Indexer for Candidate Corpus")
    parser.add_argument("repo", help="GitHub repo (e.g. amanverma-765/doubtless) or local path")
    parser.add_argument("--corpus", type=Path, default=Path("core/projects_corpus.yaml"), help="Path to corpus YAML")
    parser.add_argument("--domain", default="", help="Domain focus (e.g. Agentic AI, Backend)")
    args = parser.parse_args()

    index_repository(args.repo, args.corpus, args.domain)


if __name__ == "__main__":
    main()
