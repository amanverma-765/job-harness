# Issue Tracker & Target Workspace Conventions

Job applications and candidate profile milestones are tracked through GitHub issues and the local `targets/` workspace state machine.

## Conventions

- **Create a role tracking issue**: `gh issue create --title "[<Company>] <Role Title>" --body "..."`
- **Link Target Workspaces**: Keep a 1:1 mapping between active application issues and `targets/<company-slug>/<role-slug>/`.
- **Close on Decision**: When an application process reaches an outcome (interview, offer, or disposition), update the issue and workspace audit report.
