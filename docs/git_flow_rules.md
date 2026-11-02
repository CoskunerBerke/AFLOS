# AFLOS Git-Flow Workflow and Rules

## Branching Strategy
* **`main`**: The production-ready branch. Direct commits are strictly prohibited.
* **`develop`**: The main integration and testing branch. All feature branches merge here first.
* **`feature/*`**: Used for developing new features or fixing issues (e.g., `feature/openapi-draft`). Must branch off from `develop`.

## Pull Request (PR) and Branch Protection Rules
1. **No Direct Commits**: Direct commits to `main` and `develop` branches are blocked via GitHub Branch Protection Rules.
2. **Peer Review**: Every Pull Request must have at least one approving review (Peer Review) from a team member before merging.
3. **Issue Linking**: Every PR must be linked to a relevant GitHub Issue on the project board.
4. **CI Checks**: All GitHub Actions (CI) tests must pass successfully before a PR can be merged.
