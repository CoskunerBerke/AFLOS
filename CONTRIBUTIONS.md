# SENG 321 – Sprint 1 Individual Contributions (`CONTRIBUTIONS.md`)

**Project Title:** AFLOS – Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) – Software Engineering Project  
**Sprint:** Sprint 1 – Project Foundation & Team Operating Model  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  

This document records the individual roles, responsibilities, completed Sprint 1 deliverables, and verifiable GitHub evidence (Issues, Pull Requests, Peer Reviews, and Commits) for all 7 members of the AFLOS project team.

---

## 1. Summary of Team Members

| # | Full Name | Student Number | GitHub Username | Role Title | Primary Sprint 1 Deliverables & RACI Scope |
|---|---|---|---|---|---|
| 1 | **Kaan Kılınç** | 230204047 | [`@kaanklnc`](https://github.com/kaanklnc) | Product Owner and Requirements Engineer | Deliverables 01, 02, 06 (`ACT-01`..`ACT-07`, `ACT-16`, `ACT-20`..`ACT-22`) |
| 2 | **Mustafa Çebin** | 230201024 | [`@Noct-0`](https://github.com/Noct-0) | Scrum Master and Agile Process Coach | Deliverables 04, 05 (`ACT-11`..`ACT-14`, `ACT-19`, `ACT-22`, `ACT-23`) |
| 3 | **Mirza Akgöz** | 230201005 | [`@akgozmirza`](https://github.com/akgozmirza) | Lead Software Architect and Technical Lead | Deliverable 03 (`ACT-07`..`ACT-10`, `ACT-23`) |
| 4 | **Hüseyin Zor** | 230204042 | [`@kurdoglu25`](https://github.com/kurdoglu25) | Lead Software Architect and Technical Lead | Deliverable 03 (`ACT-07`..`ACT-09`, `ACT-23`) |
| 5 | **Berke Coşkuner** | 230201062 | [`@CoskunerBerke`](https://github.com/CoskunerBerke) | DevOps and CI/CD Infrastructure Engineer | Deliverable 05 (`ACT-15`..`ACT-19`, `ACT-23`) |
| 6 | **Onur Şahin** | 230201030 | [`@clickOMorphism`](https://github.com/clickOMorphism) | Quality Assurance and Test Automation Engineer | QA Verification & DoR/Rubric Validation (`ACT-10`, `ACT-21`, `ACT-23`) |
| 7 | **Ulaş Balcı** | 260201301 | [`@ulasbalci0653`](https://github.com/ulasbalci0653) | Implementation and Integration Engineer | Technical Risk/License & API Resource Spike (`ACT-04`, `ACT-08`, `ACT-23`) |

---

## 2. Detailed Individual Contributions & GitHub Evidence

### 2.1. Kaan Kılınç (230204047)
- **GitHub Account:** [`@kaanklnc`](https://github.com/kaanklnc)
- **Role:** Product Owner and Requirements Engineer
- **Responsibilities (RACI):**
  - `ACT-01`, `ACT-02`, `ACT-03`, `ACT-04` (`R/A`, `A`): Authoring the Project Proposal, problem statement, 5 post-disaster coordination failure baselines, stakeholder influence-dependence matrix, 8-risk register, and Apache 2.0 open-source license selection.
  - `ACT-05`, `ACT-06`, `ACT-07` (`R/A`, `A`): Formulating the System Vision, RBAC operational roles, MVP scope boundaries, Mermaid System Context Diagram, and 15 external context interaction contracts (`CTX-01` to `CTX-15`).
  - `ACT-16` (`R`): Initializing standard Git-Flow working branches (`main`, `develop`, and `role/*`).
  - `ACT-20`, `ACT-21`, `ACT-22` (`R/A`, `A`): Authoring the Initial Product Backlog across Epics and prioritized User Stories (`US-01` to `US-10`) with Fibonacci story point estimates, Definition of Ready (DoR), Definition of Done (DoD), and Gherkin (`GIVEN-WHEN-THEN`) acceptance criteria.
- **Completed Artifacts:**
  - [`docs/requirements/01-project-proposal.md`](docs/requirements/01-project-proposal.md)
  - [`docs/requirements/02-system-vision-and-boundary.md`](docs/requirements/02-system-vision-and-boundary.md)
  - [`docs/requirements/06-initial-product-backlog.md`](docs/requirements/06-initial-product-backlog.md)
- **GitHub Traceability Links:**
  - **Issues:**
    - [Issue #1 – [PO] Deliverable 01: Project Proposal & Problem Statement](https://github.com/CoskunerBerke/AFLOS/issues/1)
    - [Issue #2 – [PO] Deliverable 02: System Vision, Boundary Specification & Context Diagram](https://github.com/CoskunerBerke/AFLOS/issues/2)
    - [Issue #6 – [PO] Deliverable 06: Initial Product Backlog & Prioritized User Stories](https://github.com/CoskunerBerke/AFLOS/issues/6)
  - **Pull Requests:**
    - [PR #17 – [PO] Sprint 1 Deliverables: Proposal, System Vision & Initial Backlog (Deliverables 01, 02, 06)](https://github.com/CoskunerBerke/AFLOS/pull/17)
  - **Commits:**
    - [`4999a2b`](https://github.com/CoskunerBerke/AFLOS/commit/4999a2b) – `[PO] Add Sprint 1 Deliverable 1: Detailed Project Proposal`
    - [`a8d17d6`](https://github.com/CoskunerBerke/AFLOS/commit/a8d17d6) – `[PO] Add 4-step anti-false-report verification and refine scope in Project Proposal`
    - [`c9307eb`](https://github.com/CoskunerBerke/AFLOS/commit/c9307eb) – `[PO] Add no-show rollback, partial delivery, road vehicle compatibility, and KVKK encryption requirements`
    - [`389866b`](https://github.com/CoskunerBerke/AFLOS/commit/389866b) – `[PO] Add DDoS protection, zero-cost 2FA handover verification, and multi-drop out-of-scope rule`
    - [`86c6979`](https://github.com/CoskunerBerke/AFLOS/commit/86c6979) – `[PO] Add over-pledging cap, zone-scoped RBAC, cancellation grace period, and single-command docker-compose feasibility`
    - [`4938d38`](https://github.com/CoskunerBerke/AFLOS/commit/4938d38) – `[PO] Add emergency zone evacuation rerouting and driver device failure fallback to Proposal`
    - [`b4da702`](https://github.com/CoskunerBerke/AFLOS/commit/b4da702) – `[PO] Add Sprint 1 Deliverable 2: System Vision, Boundary Specification, and Mermaid Context Diagram`
    - [`5be634f`](https://github.com/CoskunerBerke/AFLOS/commit/5be634f) – `[PO] Add Sprint 1 Deliverable 6: Initial Product Backlog & Prioritized User Stories (Closes #6)`
    - [`e642d36`](https://github.com/CoskunerBerke/AFLOS/commit/e642d36) – `[PO] Align requirements & backlog with Lead Architect review decisions`

---

### 2.2. Mustafa Çebin (230201024)
- **GitHub Account:** [`@Noct-0`](https://github.com/Noct-0)
- **Role:** Scrum Master and Agile Process Coach
- **Responsibilities (RACI):**
  - `ACT-11`, `ACT-12`, `ACT-13`, `ACT-14` (`R/A`): Authoring the Sprint 1 RACI Responsibility Matrix (`ACT-01` to `ACT-23`), facilitating the Sprint 1 Kickoff, Mid-Sprint Stand-up, and Sprint 1 Retrospective ceremonies, maintaining the Impediment Tracking Log (`IMP-01`, `IMP-02`), and administering the GitHub Projects board.
  - `ACT-19`, `ACT-22`, `ACT-23` (`A`, `R`): Enforcing Git-Flow governance, assisting with initial Git-Flow rules and CI workflow bootstrapping, and cross-verifying Sprint 1 deliverable completeness.
- **Completed Artifacts:**
  - [`docs/scrum/04-raci-matrix.md`](docs/scrum/04-raci-matrix.md)
  - [`docs/scrum/04-meeting-minutes.md`](docs/scrum/04-meeting-minutes.md)
  - [`docs/git_flow_rules.md`](docs/git_flow_rules.md) (Initial draft)
- **GitHub Traceability Links:**
  - **Issues:**
    - [Issue #14 – Deliverable 04: Scrum Master (Meeting Minutes & RACI Matrix)](https://github.com/CoskunerBerke/AFLOS/issues/14)
    - [Issue #7 – [DevOps] Deliverable 05: GitHub Repository and Git-Flow Workflow](https://github.com/CoskunerBerke/AFLOS/issues/7)
  - **Pull Requests:**
    - [PR #16 – [SM] Deliverable 04: Meeting Minutes & RACI Matrix](https://github.com/CoskunerBerke/AFLOS/pull/16)
    - [PR #10 – [DevOps] Deliverable 05: GitHub Repository and Git-Flow Workflow](https://github.com/CoskunerBerke/AFLOS/pull/10)
  - **Commits:**
    - [`00c718a`](https://github.com/CoskunerBerke/AFLOS/commit/00c718a) – `[SM] Deliverable 04: Meeting Minutes & RACI Matrix`
    - [`28ed7ac`](https://github.com/CoskunerBerke/AFLOS/commit/28ed7ac) – `Merge pull request #16 from CoskunerBerke/role/scrum-master`
    - [`6ea2746`](https://github.com/CoskunerBerke/AFLOS/commit/6ea2746) – `Add Git-Flow workflow and rules documentation`
    - [`37f34d1`](https://github.com/CoskunerBerke/AFLOS/commit/37f34d1) – `Add CI pipeline configuration for GitHub Actions`
    - [`31528c4`](https://github.com/CoskunerBerke/AFLOS/commit/31528c4) – `Merge pull request #10 from CoskunerBerke/role/devops`

---

### 2.3. Mirza Akgöz (230201005)
- **GitHub Account:** [`@akgozmirza`](https://github.com/akgozmirza)
- **Role:** Lead Software Architect and Technical Lead
- **Responsibilities (RACI):**
  - `ACT-07` (`R`): Modeling external system interactions, context boundaries, and telecommunication blackout fallback flows.
  - `ACT-08`, `ACT-09`, `ACT-10` (`A`, `R/A`): Leading the domain modeling spike, authoring the 3,032-line OpenAPI 3.1.0 specification (`api/openapi.yaml`) and the Architecture Specification Guide (`docs/architecture/03-openapi-draft-guide.md`), and building the automated Python OpenAPI validator (`tools/validate_openapi.py`).
- **Completed Artifacts:**
  - [`api/openapi.yaml`](api/openapi.yaml)
  - [`docs/architecture/03-openapi-draft-guide.md`](docs/architecture/03-openapi-draft-guide.md)
  - [`docs/architecture/openapi-validation-report.json`](docs/architecture/openapi-validation-report.json)
  - [`tools/validate_openapi.py`](tools/validate_openapi.py)
- **GitHub Traceability Links:**
  - **Issues:**
    - [Issue #21 – [ARCH] Deliverable 03: OpenAPI 3.1.0 Contract Draft & Architecture Specification](https://github.com/CoskunerBerke/AFLOS/issues/21)
  - **Pull Requests:**
    - [PR #20 – [ARCH] Deliverable 03: OpenAPI 3.1 Contract Draft & Architecture Specification](https://github.com/CoskunerBerke/AFLOS/pull/20)
  - **Commits:**
    - [`e741277`](https://github.com/CoskunerBerke/AFLOS/commit/e741277) – `[ARCH] Add Sprint 1 Deliverable 3: OpenAPI 3.1 Contract, Architecture Guide, and Validation Tools`
    - [`85efeae`](https://github.com/CoskunerBerke/AFLOS/commit/85efeae) – `[ARCH] Translate OpenAPI architecture guide to English (Deliverable 3)`
    - [`cbda991`](https://github.com/CoskunerBerke/AFLOS/commit/cbda991) – `Merge branch 'develop' into role/architect-mirza`

---

### 2.4. Hüseyin Zor (230204042)
- **GitHub Account:** [`@kurdoglu25`](https://github.com/kurdoglu25)
- **Role:** Lead Software Architect and Technical Lead
- **Responsibilities (RACI):**
  - `ACT-07`, `ACT-08`, `ACT-09` (`R`): Co-designing external context boundaries, emergency aid REST resource modeling, transaction isolation rules for atomic time-slot booking, 5-state shipment lifecycle (`CONFIRMED`, `IN_TRANSIT`, `DELIVERED`, `CANCELLED`, `NO_SHOW`), and 3-tier need deficit formulas in Deliverable 03.
  - `ACT-23` (`R`): Architectural traceability review across Product Backlog (`US-01` to `US-10`) and OpenAPI 3.1.0 endpoints.
- **Completed Artifacts:**
  - Co-author and architectural reviewer of [`api/openapi.yaml`](api/openapi.yaml) and [`docs/architecture/03-openapi-draft-guide.md`](docs/architecture/03-openapi-draft-guide.md)
- **GitHub Traceability Links:**
  - **Issues:**
    - [Issue #21 – [ARCH] Deliverable 03: OpenAPI 3.1.0 Contract Draft & Architecture Specification (Co-Assignee)](https://github.com/CoskunerBerke/AFLOS/issues/21)
  - **Pull Requests:**
    - [PR #20 – [ARCH] Deliverable 03: OpenAPI 3.1 Contract Draft & Architecture Specification](https://github.com/CoskunerBerke/AFLOS/pull/20)

---

### 2.5. Berke Coşkuner (230201062)
- **GitHub Account:** [`@CoskunerBerke`](https://github.com/CoskunerBerke)
- **Role:** DevOps and CI/CD Infrastructure Engineer
- **Responsibilities (RACI):**
  - `ACT-15`, `ACT-16`, `ACT-17`, `ACT-18`, `ACT-19` (`R/A`, `A`, `R`): Creating and administering the shared GitHub repository (`CoskunerBerke/AFLOS`), managing collaborator access for all 7 team members and course evaluators, authoring the comprehensive Git-Flow and branch protection documentation (`docs/git_flow_rules.md`), configuring the automated GitHub Actions CI pipeline (`.github/workflows/ci.yml`) with Python OpenAPI 3.1.0 schema validation, and preparing `README.md`, `CONTRIBUTIONS.md`, and the Sprint 1 release tag (`v0.1.0-sprint1`).
- **Completed Artifacts:**
  - [`.github/workflows/ci.yml`](.github/workflows/ci.yml)
  - [`docs/git_flow_rules.md`](docs/git_flow_rules.md)
  - [`README.md`](README.md)
  - [`CONTRIBUTIONS.md`](CONTRIBUTIONS.md)
- **GitHub Traceability Links:**
  - **Issues:**
    - [Issue #7 – [DevOps] Deliverable 05: GitHub Repository and Git-Flow Workflow](https://github.com/CoskunerBerke/AFLOS/issues/7)
    - [Issue #22 – [DevOps] Deliverable 05: CI Pipeline Validation, Repository Documentation & CONTRIBUTIONS.md](https://github.com/CoskunerBerke/AFLOS/issues/22)
  - **Pull Requests & Peer Reviews:**
    - [PR #20 – Approved & Merged Deliverable 03 OpenAPI 3.1.0 Specification into `develop`](https://github.com/CoskunerBerke/AFLOS/pull/20)
    - [PR #10 – Deliverable 05 Git-Flow & CI Workflow](https://github.com/CoskunerBerke/AFLOS/pull/10)
  - **Commits:**
    - [`84dac75`](https://github.com/CoskunerBerke/AFLOS/commit/84dac75) – `[DevOps] Initial repository structure, role workspaces and system docs`
    - [`f8c34bb`](https://github.com/CoskunerBerke/AFLOS/commit/f8c34bb) – `Merge pull request #8 from CoskunerBerke/role/devops`
    - [`b8befa8`](https://github.com/CoskunerBerke/AFLOS/commit/b8befa8) – `Merge pull request #20 from CoskunerBerke/role/architect-mirza`

---

### 2.6. Onur Şahin (230201030)
- **GitHub Account:** [`@clickOMorphism`](https://github.com/clickOMorphism)
- **Role:** Quality Assurance and Test Automation Engineer
- **Responsibilities (RACI):**
  - `ACT-10` (`R`): Validating the OpenAPI 3.1.0 contract syntax and deterministic HTTP error responses (`400`, `401`, `403`, `404`, `409`, `422`, `429`).
  - `ACT-21` (`R`): Reviewing and verifying testable Gherkin Acceptance Criteria (`GIVEN-WHEN-THEN`) and Definition of Ready (DoR) across all Sprint 1 User Stories (`US-01` to `US-10`).
  - `ACT-23` (`A`): Accountable for cross-verifying Sprint 1 deliverable quality, peer reviewing requirements and backlog Pull Requests, and establishing the Sprint 2 test automation strategy baseline ($\ge 50\%$ coverage requirement).
- **GitHub Traceability Links:**
  - **Issues:**
    - [Issue #19 – [QA] Sprint 2 Test Automation Strategy and Framework Setup](https://github.com/CoskunerBerke/AFLOS/issues/19)
  - **Pull Request Reviews & Merges:**
    - [PR #17 – Peer Reviewed (`APPROVED`) and Merged Sprint 1 Requirements & Backlog (Deliverables 01, 02, 06)](https://github.com/CoskunerBerke/AFLOS/pull/17)
  - **Commits:**
    - [`e64a335`](https://github.com/CoskunerBerke/AFLOS/commit/e64a335) – `Merge pull request #17 from CoskunerBerke/role/product-owner`

---

### 2.7. Ulaş Balcı (260201301)
- **GitHub Account:** [`@ulasbalci0653`](https://github.com/ulasbalci0653)
- **Role:** Implementation and Integration Engineer
- **Responsibilities (RACI):**
  - `ACT-04` (`R`): Evaluating technical implementation risks, single-command `docker-compose` deployment feasibility, and Apache 2.0 open-source license compatibility in Deliverable 01.
  - `ACT-08` (`R`): Conducting the REST resource domain modeling spike and Leaflet interactive map integration feasibility analysis for Deliverable 03.
  - `ACT-23` (`R`): Conducting peer reviews on Sprint 1 deliverables (`PR #16` and `PR #17`) and establishing the application scaffolding baseline for Sprint 2.
- **GitHub Traceability Links:**
  - **Issues:**
    - [Issue #18 – [DEV] Project Scaffolding and Docker Container Baseline](https://github.com/CoskunerBerke/AFLOS/issues/18)
  - **Pull Request Peer Reviews:**
    - [PR #16 – Peer Reviewed (`APPROVED`) Deliverable 04: Meeting Minutes & RACI Matrix](https://github.com/CoskunerBerke/AFLOS/pull/16)
    - [PR #17 – Peer Reviewed (`APPROVED`) Sprint 1 Deliverables: Proposal, System Vision & Initial Backlog](https://github.com/CoskunerBerke/AFLOS/pull/17)

---

## 3. Sprint 2 Individual Contributions & Verifiable GitHub Evidence

Sprint 2 focused on **Detailed Requirements Engineering (IEEE 830 / ISO 29148 SRS & Refined Backlog)**, **ISO/IEC 25010 Quality Measures (NFR)**, **Interactive High-Fidelity UI/UX Prototyping (Figma & Vector HUDs)**, and **Software Architecture (C4 Model & UML Diagrams)**.

### Summary Table for Sprint 2 Deliverables:

| # | Team Member | Student ID | Primary Sprint 2 Deliverables & RACI Scope | Assigned GitHub Issues | Pull Requests & Reviews |
|---|---|---|---|---|---|
| 1 | **Kaan Kılınç** | 230204047 | Deliverables 01, 01-B, 02, 03 (IEEE 830 SRS, Refined Backlog, ISO 25010 NFR, User Flows & Figma UI/UX Suite) | [#25](https://github.com/CoskunerBerke/AFLOS/issues/25), [#26](https://github.com/CoskunerBerke/AFLOS/issues/26), [#27](https://github.com/CoskunerBerke/AFLOS/issues/27), [#28](https://github.com/CoskunerBerke/AFLOS/issues/28), [#32](https://github.com/CoskunerBerke/AFLOS/issues/32) | [PR #29](https://github.com/CoskunerBerke/AFLOS/pull/29) (Author), [PR #42](https://github.com/CoskunerBerke/AFLOS/pull/42) (Author), Reviews: [PR #40](https://github.com/CoskunerBerke/AFLOS/pull/40) (Approved), [PR #41](https://github.com/CoskunerBerke/AFLOS/pull/41) (Approved), [PR #39](https://github.com/CoskunerBerke/AFLOS/pull/39) (Approved) |
| 2 | **Hüseyin Zor** | 230204042 | Deliverable 04 (C4 Model Architecture Level 1-3, ADRs, UML Class, Sequence, State, ERD & SQL Schema) | [#30](https://github.com/CoskunerBerke/AFLOS/issues/30), [#31](https://github.com/CoskunerBerke/AFLOS/issues/31) | [PR #40](https://github.com/CoskunerBerke/AFLOS/pull/40) (Author), [PR #41](https://github.com/CoskunerBerke/AFLOS/pull/41) (Author) |
| 3 | **Mirza Akgöz** | 230201005 | Deliverable 04 (Architectural Spikes, C4 Workspace DSL, Sequence Handover Alignment) | [#30](https://github.com/CoskunerBerke/AFLOS/issues/30), [#31](https://github.com/CoskunerBerke/AFLOS/issues/31) | [PR #40](https://github.com/CoskunerBerke/AFLOS/pull/40) (Co-Author), [PR #41](https://github.com/CoskunerBerke/AFLOS/pull/41) (Co-Author) |
| 4 | **Onur Şahin** | 230201030 | Deliverable 02 (NFR Verification Benchmarks, ISO 25010 Measurement Protocols, Load Test Targets) | [#33](https://github.com/CoskunerBerke/AFLOS/issues/33), [#26](https://github.com/CoskunerBerke/AFLOS/issues/26) | [PR #38](https://github.com/CoskunerBerke/AFLOS/pull/38) (Author), [PR #43](https://github.com/CoskunerBerke/AFLOS/pull/43) (Author), Reviews: [PR #29](https://github.com/CoskunerBerke/AFLOS/pull/29) (Approved) |
| 5 | **Mustafa Çebin** | 230201024 | Sprint 2 RACI Responsibility Matrix & Agile Governance Oversight | [#34](https://github.com/CoskunerBerke/AFLOS/issues/34), [#35](https://github.com/CoskunerBerke/AFLOS/issues/35), [#37](https://github.com/CoskunerBerke/AFLOS/issues/37) | [PR #39](https://github.com/CoskunerBerke/AFLOS/pull/39) (Author) |
| 6 | **Berke Coşkuner** | 230201062 | Sprint 2 Release Governance, CI Workflow Integrity, and Git-Flow Merge Management | [#36](https://github.com/CoskunerBerke/AFLOS/issues/36) | Release Management (`develop` -> `main`), Tagging (`v0.2.0-sprint2`) |
| 7 | **Ulaş Balcı** | 260201301 | UI/UX Prototyping Review, Component Specifications & Sprint 3 Scaffolding Alignment | [#32](https://github.com/CoskunerBerke/AFLOS/issues/32) | [PR #42](https://github.com/CoskunerBerke/AFLOS/pull/42) (Co-Author) |

---

### Detailed Sprint 2 Records by Member:

#### 3.1. Kaan Kılınç (230204047) — Product Owner & Requirements Engineer
* **Role & Governance:** Product Owner & Lead Requirements Engineer (`@kaanklnc`). Single point of accountability (`A`) for official system specifications and product backlog.
* **Sprint 2 Deliverables Produced:**
  * **Deliverable 01 (Detailed SRS):** [`docs/requirements/07-software-requirements-specification.md`](docs/requirements/07-software-requirements-specification.md) — IEEE Std 830-1998 / ISO/IEC/IEEE 29148:2018 specification encompassing 23 formal requirements (`REQ-FR-101` to `REQ-FR-405`), 4 Use Cases, and Requirements Traceability Matrix (RTM).
  * **Deliverable 01-B (Refined Backlog):** [`docs/requirements/06-refined-product-backlog.md`](docs/requirements/06-refined-product-backlog.md) — Master backlog sized at 64 Story Points (Fibonacci), MoSCoW prioritization, and Gherkin (`GIVEN-WHEN-THEN`) acceptance criteria.
  * **Deliverable 02 (NFR Quality Specification):** [`docs/requirements/08-non-functional-requirements.md`](docs/requirements/08-non-functional-requirements.md) — ISO/IEC 25010 quality metrics (<=200ms latency, 10,000 active users, 1,500 TPS, 99.9% uptime SLO, Offline-First PWA sync).
  * **Deliverable 03 (UI/UX & User-Flows):** [`docs/requirements/09-user-flows-and-ui-spec.md`](docs/requirements/09-user-flows-and-ui-spec.md) & [`docs/ui_ux/figma_prototype.md`](docs/ui_ux/figma_prototype.md) — 4 end-to-end Mermaid user flows, design system tokens, public Figma prototype links, and 6 high-fidelity SVG vector frames.
* **GitHub Traceability Links:**
  * **Issues:** [#25](https://github.com/CoskunerBerke/AFLOS/issues/25), [#26](https://github.com/CoskunerBerke/AFLOS/issues/26), [#27](https://github.com/CoskunerBerke/AFLOS/issues/27), [#28](https://github.com/CoskunerBerke/AFLOS/issues/28), [#32](https://github.com/CoskunerBerke/AFLOS/issues/32)
  * **Pull Requests:** 
    * [PR #29 – [PO] Sprint 2 Requirements Engineering: Detailed SRS, ISO 25010 NFRs, User-Flows & Refined Backlog](https://github.com/CoskunerBerke/AFLOS/pull/29) (Merged)
    * [PR #42 – [UX] Deliverable 03: Interactive Figma UI/UX Prototypes & Vector Screens](https://github.com/CoskunerBerke/AFLOS/pull/42) (Merged)
  * **Peer Review Approvals Given:**
    * Approved [PR #40](https://github.com/CoskunerBerke/AFLOS/pull/40) (C4 Architecture Model by Hüseyin)
    * Approved [PR #41](https://github.com/CoskunerBerke/AFLOS/pull/41) (UML Diagrams by Hüseyin)
    * Approved [PR #39](https://github.com/CoskunerBerke/AFLOS/pull/39) (RACI Matrix by Mustafa)

#### 3.2. Hüseyin Zor (230204042) — Lead Software Architect
* **Role & Governance:** Lead Software Architect (`@kurdoglu25`). Single point of accountability (`A`) for structural and behavioral architectural modeling.
* **Sprint 2 Deliverables Produced:**
  * **Deliverable 04 (C4 Architecture Model):** [`docs/architecture/c4_model.md`](docs/architecture/c4_model.md) — C4 Context (Level 1), Containers (Level 2), and Components (Level 3) with Structurizr DSL (`aflos_c4_workspace.dsl`), DOT, MMD, and SVG diagrams.
  * **Deliverable 04 (UML Structural & Behavioral Modeling):** [`docs/architecture/uml_diagrams.md`](docs/architecture/uml_diagrams.md) — UML Class Diagram, Entity Relationship Diagram (ERD), State Machine Diagram (Aid Request Lifecycle), Sequence Diagrams (Citizen Request, Allocation & Dispatch, Offline Sync), and relational SQL schema (`uml_schema_proposal.sql`).
* **GitHub Traceability Links:**
  * **Issues:** [#30](https://github.com/CoskunerBerke/AFLOS/issues/30), [#31](https://github.com/CoskunerBerke/AFLOS/issues/31)
  * **Pull Requests:** [PR #40](https://github.com/CoskunerBerke/AFLOS/pull/40) (Merged), [PR #41](https://github.com/CoskunerBerke/AFLOS/pull/41) (Merged)

#### 3.3. Mirza Akgöz (230201005) — Lead Software Architect
* **Role & Governance:** Lead Software Architect (`@akgozmirza`). Co-architect for system boundaries and data integrity.
* **Sprint 2 Deliverables Produced:**
  * Co-designed C4 Container boundaries and microservice data models in alignment with the OpenAPI 3.1.0 contract.
  * Reviewed and validated UML Sequence diagrams against offline-first telecommunication blackout constraints.
* **GitHub Traceability Links:**
  * **Issues:** [#30](https://github.com/CoskunerBerke/AFLOS/issues/30), [#31](https://github.com/CoskunerBerke/AFLOS/issues/31)
  * **Pull Requests:** [PR #40](https://github.com/CoskunerBerke/AFLOS/pull/40), [PR #41](https://github.com/CoskunerBerke/AFLOS/pull/41)

#### 3.4. Onur Şahin (230201030) — Quality Assurance & Test Automation Lead
* **Role & Governance:** QA & Test Automation Lead (`@clickOMorphism`). Single point of accountability (`A`) for quality measure verification and test benchmarks.
* **Sprint 2 Deliverables Produced:**
  * **Deliverable 02 (QA NFR Benchmarks):** [`docs/quality/nfr_quality_measures.md`](docs/quality/nfr_quality_measures.md) — Load testing benchmarks, Locust/k6 test execution criteria, PostGIS query thresholds, and ISO 25010 verification protocols.
* **GitHub Traceability Links:**
  * **Issues:** [#33](https://github.com/CoskunerBerke/AFLOS/issues/33)
  * **Pull Requests:** [PR #38](https://github.com/CoskunerBerke/AFLOS/pull/38) (Merged to `role/qa`), [PR #43](https://github.com/CoskunerBerke/AFLOS/pull/43) (Merged to `develop`)
  * **Peer Review Approvals Given:** Approved [PR #29](https://github.com/CoskunerBerke/AFLOS/pull/29) (Sprint 2 Requirements Engineering)

#### 3.5. Mustafa Çebin (230201024) — Scrum Master & Agile Coach
* **Role & Governance:** Scrum Master (`@Noct-0`). Responsible for team operating model, Agile ceremony cadence, and RACI governance.
* **Sprint 2 Deliverables Produced:**
  * **Sprint 2 RACI Matrix:** [`docs/agile/raci_matrix_sprint2.md`](docs/agile/raci_matrix_sprint2.md) — Balanced responsibility matrix covering all 24 engineering activities across Sprint 2.
  * Agile ceremony governance and stand-up impediment tracking.
* **GitHub Traceability Links:**
  * **Issues:** [#34](https://github.com/CoskunerBerke/AFLOS/issues/34), [#35](https://github.com/CoskunerBerke/AFLOS/issues/35), [#37](https://github.com/CoskunerBerke/AFLOS/issues/37)
  * **Pull Requests:** [PR #39](https://github.com/CoskunerBerke/AFLOS/pull/39) (Merged)

#### 3.6. Berke Coşkuner (230201062) — DevOps & CI/CD Infrastructure Lead
* **Role & Governance:** DevOps Engineer (`@CoskunerBerke`). Responsible for Git-Flow governance, release tags, and automated CI pipelines.
* **Sprint 2 Deliverables Produced:**
  * Maintenance of GitHub Actions CI validation workflows.
  * Branch merge governance from feature branches into `develop` and final release preparation into `main`.
* **GitHub Traceability Links:**
  * **Issues:** [#36](https://github.com/CoskunerBerke/AFLOS/issues/36)

#### 3.7. Ulaş Balcı (260201301) — Implementation & UI Co-Designer
* **Role & Governance:** Implementation & Integration Engineer (`@ulasbalci0653`). Responsible for UI component specifications and Sprint 3 backend preparation.
* **Sprint 2 Deliverables Produced:**
  * Review and validation of UI/UX design components against the Sphere humanitarian taxonomy and technical database entity constraints.
* **GitHub Traceability Links:**
  * **Issues:** [#32](https://github.com/CoskunerBerke/AFLOS/issues/32)
  * **Pull Requests:** [PR #42](https://github.com/CoskunerBerke/AFLOS/pull/42)

