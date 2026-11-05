# Domain Docs: Job Harness (Resume-as-Code)

How engineering agents and skills must consume this repository's domain documentation.

## Before exploring or modifying code, read:

1. **`GLOSSARY.md`** at the repo root: Formal definitions of Resume-as-Code (RaC), Quality Gates 1–5, the 10.6x Requisition Multiplier, and the 1:1 Skill Evidence Rule.
2. **`CLAUDE.md`** at the repo root: Immutable candidate ground truth, typography standards, spacing rules, and section ordering.
3. **`resources/research/`**: Empirical findings on ATS parsers (Sovren, Workday, Greenhouse, Poppler) and systemic failure modes.

## File Structure

```
/
├── GLOSSARY.md                        ← Canonical RaC vocabulary
├── CLAUDE.md                          ← Agent policies, candidate ground truth, and typography standards
├── README.md                          ← Executive summary and CI/CD validation commands
├── core/                              ← Single Source of Truth (profile, corpus, taxonomy, templates)
├── engine/                            ← Verification linters, AST checks, and compilers
└── targets/                           ← Isolated company & role application packages
```

## Use the Domain Vocabulary

When analyzing roles or synthesizing materials, strictly adhere to the terms defined in `GLOSSARY.md`:
- **Resume-as-Code (RaC)**: Treat documents as compiled software artifacts.
- **Dual Archetypes**: `core/templates/resume_android.typ` (Android/KMP/Systems) and `core/templates/resume_ai.typ` (AI/ML/Systems).
- **1:1 Skill-to-Evidence Rule**: Every listed skill must have explicit proof in bullet points.
- **Zero Em-Dash Rule**: Strictly no Unicode (`\u2014`) or LaTeX (`---`) em-dashes.
