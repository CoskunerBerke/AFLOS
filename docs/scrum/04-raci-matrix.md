# SENG 321 — Sprint 1 Deliverable 04: RACI Responsibility Matrix

**Project Title:** AFLOS — Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) — Software Engineering Project  
**Sprint:** Sprint 1 — Project Foundation & Team Operating Model  
**Role / Document Owner:** Scrum Master & Agile Process Coach — **Mustafa Çebin (230201024)** (`@Noct-0`)  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  

---

## 1. Team Composition & Role Assignments

| # | Team Member | Student Number | Primary Role | GitHub Username / Handle |
|---|---|---|---|---|
| 1 | **Kaan Kılınç** | 230204047 | Product Owner & Requirements Engineer | [`@kaanklnc`](https://github.com/kaanklnc) |
| 2 | **Mustafa Çebin** | 230201024 | Scrum Master & Agile Process Coach | [`@Noct-0`](https://github.com/Noct-0) |
| 3 | **Onur Şahin** | 230201030 | QA Engineer & Test Automation Engineer | [`@clickOMorphism`](https://github.com/clickOMorphism) |
| 4 | **Hüseyin Zor** | 230204042 | Lead Software Architect & Technical Lead | [`@kurdoglu25`](https://github.com/kurdoglu25) |
| 5 | **Berke Coşkuner** | 230201062 | DevOps & CI/CD Infrastructure Engineer | [`@CoskunerBerke`](https://github.com/CoskunerBerke) |
| 6 | **Mirza Akgöz** | 230201005 | Lead Software Architect & Technical Lead | [`@akgozmirza`](https://github.com/akgozmirza) |
| 7 | **Ulaş Balcı** | 260201301 | Implementation & Integration Engineer | [`@ulasbalci0653`](https://github.com/ulasbalci0653) |

---

## 2. RACI Definitions

* **R (Responsible):** The person who executes and authors the deliverable.
* **A (Accountable):** The single individual with ultimate decision power and sign-off responsibility. *(Strictly one 'A' per row).*
* **C (Consulted):** Domain experts whose input and review are actively gathered.
* **I (Informed):** Team members kept informed on milestone progress and completed deliverables.
* **R/A:** Designated owner who both directly authors and holds ultimate accountability.

---

## 3. Sprint 1 Deliverables & Activities RACI Matrix

> **Sprint 1 Focus:** Foundation, Requirements Engineering, API-First Specification Draft, Agile Governance, and Git-Flow Setup. *(Code delivery, automated test execution, and container deployment begin in subsequent sprints).*

### Deliverable 01: Project Proposal & Problem Statement
| ID | Activity / Task | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **ACT-01** | Define disaster logistics problem statement, baseline harms, and field evidence | **R/A** | C | C | C | I | C | I |
| **ACT-02** | Identify stakeholder roles, influence-dependence matrix, and user personas | **R/A** | C | I | C | I | C | I |
| **ACT-03** | Formulate proposed solution, operational feasibility, and initial project scope | **R/A** | C | C | C | I | C | I |
| **ACT-04** | Assess system risks, mitigation strategies, and Apache 2.0 open-source license selection | **A** | C | C | C | C | C | R |

### Deliverable 02: System Vision, Boundary & Context Specification
| ID | Activity / Task | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **ACT-05** | Formulate project vision statement, target users, and RBAC operational roles | **R/A** | C | I | C | I | C | I |
| **ACT-06** | Define in-scope and out-of-scope system boundaries for Release 1 (MVP) | **R/A** | C | C | C | I | C | I |
| **ACT-07** | Model external system interactions, context boundaries, and telecommunication blackout assumptions | **A** | C | I | R | I | R | C |

### Deliverable 03: OpenAPI 3.1.0 Contract Draft
| ID | Activity / Task | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **ACT-08** | Conduct domain modeling spike and identify emergency aid REST resources & paths | C | I | C | R | I | **A** | R |
| **ACT-09** | Author OpenAPI 3.1.0 YAML specification (`api/openapi.yaml`) with request/response schemas | C | I | C | R | I | **R/A** | C |
| **ACT-10** | Validate OpenAPI contract syntax against Spectral/Swagger CLI tooling with zero errors | I | I | R | C | I | **A** | C |

### Deliverable 04: Team Operating Model, Roles & Agile Ceremonies
| ID | Activity / Task | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **ACT-11** | Author and balance team RACI responsibility matrix aligned with course rubric | C | **R/A** | C | C | C | C | C |
| **ACT-12** | Facilitate Sprint 1 kickoff meeting, author meeting minutes, and track decisions | C | **R/A** | C | C | C | C | C |
| **ACT-13** | Coordinate mid-sprint stand-up syncs, monitor impediment log, and lead Sprint 1 Retrospective | C | **R/A** | C | C | C | C | C |
| **ACT-14** | Administer GitHub Projects board, configure kanban columns, and manage issue progression | C | **R/A** | C | C | C | C | C |

### Deliverable 05: GitHub Repository Setup & Git-Flow Workflow
| ID | Activity / Task | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **ACT-15** | Initialize GitHub shared repository (`CoskunerBerke/AFLOS`) and configure collaborators | I | C | I | I | **R/A** | I | I |
| **ACT-16** | Create standard Git-Flow branches (`main`, `develop`, and initial `role/*` branches) | **R** | C | I | I | **A** | I | I |
| **ACT-17** | Document Git-Flow branching rules, peer review policies, and PR conventions (`docs/git_flow_rules.md`) | I | C | I | I | **R/A** | I | C |
| **ACT-18** | Configure GitHub Actions CI workflow for pull request linting and validation checks | I | I | C | I | **R/A** | I | I |
| **ACT-19** | Enforce branch protection rulesets and peer approval requirements before merge | I | **A** | I | I | R | I | I |

### Deliverable 06: Initial Product Backlog & Story Sizing
| ID | Activity / Task | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **ACT-20** | Structure initial Epics and decompose functional scope into prioritized User Stories (US-01 to US-10) | **R/A** | C | C | C | I | C | I |
| **ACT-21** | Define testable Gherkin Acceptance Criteria (`GIVEN-WHEN-THEN`) and Definition of Ready (DoR) | **A** | C | R | C | I | C | C |
| **ACT-22** | Estimate backlog effort using story points and establish Definition of Done (DoD) | **A** | R | C | C | C | C | C |
| **ACT-23** | Cross-verify Sprint 1 deliverable completeness and traceability against BM 321 Assessment Rubric | C | **R** | **A** | R | R | R | R |
