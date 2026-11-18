# SENG 321 – Sprint 1 Deliverable 05: Repository Workflow & Git-Flow Rules

**Project Title:** AFLOS – Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) – Software Engineering Project  
**Sprint:** Sprint 1 – Project Foundation & Team Operating Model  
**Role / Document Owner:** DevOps and CI/CD Infrastructure Engineer – **Berke Coşkuner (230201062)** (`@CoskunerBerke`)  
**Co-Coordinator:** Scrum Master and Agile Process Coach – **Mustafa Çebin (230201024)** (`@Noct-0`)  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  

---

## 1. Git-Flow Branching Architecture

The AFLOS repository follows a structured **Git-Flow** branching strategy designed for a 7-member software engineering team across 6 functional roles:

### 1.1 Primary Long-Lived Branches
- **`main`**: Production-ready release branch. Direct pushes are prohibited. Only verified sprint release milestones are merged from `develop` via reviewed Pull Requests.
- **`develop`**: Primary integration branch for ongoing sprint deliverables. All role and feature branches target `develop` via Pull Requests.

### 1.2 Role & Feature Working Branches
Each role develops and updates artifacts in dedicated branches created from `develop`:
- `role/product-owner` – Requirements engineering, proposal, vision & boundary, and product backlog (`@kaanklnc`)
- `role/architect-mirza` & `role/architect-huseyin` – OpenAPI 3.1.0 specification, architecture guides, and contract validation (`@akgozmirza`, `@kurdoglu25`)
- `role/scrum-master` – RACI responsibility matrix, ceremony meeting minutes, and agile governance (`@Noct-0`)
- `role/devops` – CI/CD GitHub Actions pipelines, Git-Flow rules, and repository infrastructure (`@CoskunerBerke`)
- `role/qa` – Test strategy, quality assurance verification, and automated test suites (`@clickOMorphism`)
- `role/implementation` – Application scaffolding, backend/frontend implementation, and service integration (`@ulasbalci0653`)
- `feature/<short-name>` – Task-specific feature branches created during Sprint 2–4 implementation.

---

## 2. Pull Request (PR), Peer Review, and Branch Protection Rules

1. **No Direct Commits to Protected Branches:**
   - Both `main` and `develop` are protected via GitHub Branch Protection rules.
   - All changes must be introduced via a Pull Request from a working branch (`role/*` or `feature/*`) into `develop`.
2. **Mandatory Peer Review:**
   - Every Pull Request requires at least **1 approving review (`APPROVED`)** from another team member before merging.
   - Reviewers verify compliance with the Definition of Done (DoD), OpenAPI 3.1.0 contract rules, and Sprint rubric criteria.
3. **Issue & Task Traceability:**
   - Every work item begins as a tracked GitHub Issue with an assigned owner (`Assignee`), role label (`role:*`), and sprint label (`sprint-1`).
   - Pull Requests explicitly reference the corresponding issue (e.g., `Closes #14`, `Closes #21`) and are tracked on the **AFLOS PROJECT** board.
4. **Automated CI Status Verification (`.github/workflows/ci.yml`):**
   - Every push and Pull Request triggers the **AFLOS CI Pipeline** on GitHub Actions (`ubuntu-latest`).
   - The pipeline verifies that all required Sprint 1 deliverables exist and executes `python tools/validate_openapi.py` to validate the `api/openapi.yaml` OpenAPI 3.1.0 contract with zero schema errors.

---

## 3. Standard Team Git Sync & Delivery Lifecycle

```bash
# 1. Fetch and pull the latest integration state before starting work
git checkout develop
git pull origin develop

# 2. Switch to your assigned role or feature branch and sync with develop
git checkout role/<your-role>
git merge develop

# 3. Stage and commit atomic changes with role prefix
git add .
git commit -m "[ROLE] Concise description of the deliverable or change"

# 4. Push branch to origin and open a Pull Request targeting develop
git push origin role/<your-role>
```

---

## 4. Release Management & Sprint Tagging

At the conclusion of each sprint, once all deliverables have been peer-reviewed, validated by the CI pipeline, and merged into `develop`, the sprint baseline is tagged using semantic versioning:
- **Sprint 1 Release Tag:** `v0.1.0-sprint1` (*Sprint 1 – Project Foundation & Team Operating Model*)
