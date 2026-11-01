# Command: /job:sync-kb

Incrementally update candidate repository knowledge base with latest git commits and repomix facts.

## Arguments
`[repo-name]` (optional; if omitted, checks all repositories in `core/projects_corpus.yaml`)

## Execution Instructions

1. **Read Ground Truth Corpus:**
   - Load `core/projects_corpus.yaml`.
   - Identify targeted repositories.

2. **Check for Pinned Commit Bumps:**
   - For each repository, query the current remote HEAD commit SHA:
     ```bash
     gh api repos/<owner>/<repo>/commits/HEAD --jq .sha
     ```
   - Compare remote commit SHA with `commit_sha` recorded in `core/projects_corpus.yaml`.

3. **Re-index Updated Repositories:**
   - If a new commit is detected (or forced by user):
     ```bash
     python3 engine/repomix_indexer.py <owner>/<repo>
     ```
   - Inspect recent commit messages and diffs to update `architecture_patterns`, `verified_stack`, and `empirical_metrics`.

4. **Report Summary:**
   - Display a summary of updated repositories, previous vs new commit SHAs, and refreshed benchmarks.
