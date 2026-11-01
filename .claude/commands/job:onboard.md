# Command: /job:onboard

Interactively bootstrap candidate ground truth data for the Resume-as-Code pipeline.

## Arguments
`[github-username]` (optional, defaults to asking the user or using `core/profile.yaml`)

## Execution Instructions

1. **Check Existing Profile:**
   - Read `core/profile.yaml`.
   - If profile exists, display current candidate name, immutable location, email, and listed repositories. Ask user if they wish to update any fields.
   - If profile does not exist:
     - Prompt user for:
       - Full Name
       - Immutable Location (e.g. `Jaunpur, UP, India`)
       - Contact Email & Phone
       - LinkedIn URL & GitHub handle

2. **Inspect Candidate GitHub Repositories:**
   - Execute:
     ```bash
     gh repo list <github-username> --limit 20
     ```
   - Present the top public repositories to the user.
   - Ask user to confirm which 3–4 repositories best reflect their core engineering firepower (e.g., AI/ML, systems, backend, mobile).

3. **Index Repositories via `repomix_indexer.py`:**
   - For each selected repository, run:
     ```bash
     python3 engine/repomix_indexer.py <github-username>/<repo-name> --domain "<domain>"
     ```
   - Captures commit SHA, architectures, and empirical test counts into `core/projects_corpus.yaml`.

4. **Confirmation:**
   - Report: "Candidate onboarding complete. Ground truth saved to `core/profile.yaml` and `core/projects_corpus.yaml`."
