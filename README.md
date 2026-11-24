# AFLOS – Disaster Logistics & Aid Coordination System
**Afet Lojistik ve Koordinasyon Sistemi**  
**Course:** SENG 321 (BM 321) – Software Engineering Project (Team 2)  
**Current Release:** [`v0.2.0-sprint2`](https://github.com/CoskunerBerke/AFLOS/releases/tag/v0.2.0-sprint2) (*Sprint 2 – Detailed Requirements (SRS), Architecture (C4/UML) & UI/UX Prototyping*)  
**Previous Release:** [`v0.1.0-sprint1`](https://github.com/CoskunerBerke/AFLOS/releases/tag/v0.1.0-sprint1) (*Sprint 1 – Project Foundation & Team Operating Model*)

---

## 1. Project Overview
**AFLOS** is a map-centric, API-first disaster logistics and aid coordination platform designed to eliminate post-disaster supply mismatches, road gridlock at relief drop-off zones, and shipment traceability gaps. By combining categorized regional need deficits with quota-enforced vehicle arrival **Time Slots** and two-factor on-site handover verification (plus a radio/satellite Coordinator Fallback workflow during telecommunication blackouts), AFLOS enables civilian carriers, field volunteers, and institutional disaster coordinators to coordinate relief deliveries reliably.

---

## 2. Sprint 2 Deliverable Index (`v0.2.0-sprint2`)

All required SENG 321 (BM 321) Sprint 2 deliverables, architectural diagrams, UI/UX prototypes, and governance records are organized below:

| Sprint 2 Deliverable | Primary Artifact Path(s) | Responsible Role / Owner | Tracked Issues & Pull Requests |
|---|---|---|---|
| **1. Detailed SRS & Refined Product Backlog** | • [`docs/requirements/07-software-requirements-specification.md`](docs/requirements/07-software-requirements-specification.md)<br>• [`docs/requirements/06-refined-product-backlog.md`](docs/requirements/06-refined-product-backlog.md) | Product Owner (`@kaanklnc`) | [Issue #25](https://github.com/CoskunerBerke/AFLOS/issues/25), [Issue #28](https://github.com/CoskunerBerke/AFLOS/issues/28), [PR #29](https://github.com/CoskunerBerke/AFLOS/pull/29) |
| **2. Non-Functional Requirements (NFR) & Quality Measures** | • [`docs/requirements/08-non-functional-requirements.md`](docs/requirements/08-non-functional-requirements.md)<br>• [`docs/quality/nfr_quality_measures.md`](docs/quality/nfr_quality_measures.md) | QA (`@clickOMorphism`) & PO (`@kaanklnc`) | [Issue #26](https://github.com/CoskunerBerke/AFLOS/issues/26), [Issue #33](https://github.com/CoskunerBerke/AFLOS/issues/33), [PR #29](https://github.com/CoskunerBerke/AFLOS/pull/29), [PR #38](https://github.com/CoskunerBerke/AFLOS/pull/38), [PR #43](https://github.com/CoskunerBerke/AFLOS/pull/43) |
| **3. Figma UI/UX Prototypes & User-Flow Diagrams** | • [`docs/ui_ux/figma_prototype.md`](docs/ui_ux/figma_prototype.md)<br>• [`docs/requirements/09-user-flows-and-ui-spec.md`](docs/requirements/09-user-flows-and-ui-spec.md)<br>• [`docs/ui_ux/screenshots/`](docs/ui_ux/screenshots/) | Implementation (`@ulasbalci0653`) & PO (`@kaanklnc`) | [Issue #27](https://github.com/CoskunerBerke/AFLOS/issues/27), [Issue #32](https://github.com/CoskunerBerke/AFLOS/issues/32), [PR #29](https://github.com/CoskunerBerke/AFLOS/pull/29), [PR #42](https://github.com/CoskunerBerke/AFLOS/pull/42) |
| **4A. Software Architecture: C4 Model & ADRs** | • [`docs/architecture/c4_model.md`](docs/architecture/c4_model.md)<br>• [`docs/architecture/diagrams/aflos_c4_workspace.dsl`](docs/architecture/diagrams/aflos_c4_workspace.dsl)<br>• [`docs/architecture/diagrams/c4_level1_context.svg`](docs/architecture/diagrams/c4_level1_context.svg)<br>• [`docs/architecture/diagrams/c4_level2_containers.svg`](docs/architecture/diagrams/c4_level2_containers.svg)<br>• [`docs/architecture/diagrams/c4_level3_components.svg`](docs/architecture/diagrams/c4_level3_components.svg) | Lead Architects (`@kurdoglu25`, `@akgozmirza`) | [Issue #30](https://github.com/CoskunerBerke/AFLOS/issues/30), [PR #40](https://github.com/CoskunerBerke/AFLOS/pull/40) |
| **4B. Software Architecture: UML Diagrams, ERD & SQL Schema** | • [`docs/architecture/uml_diagrams.md`](docs/architecture/uml_diagrams.md)<br>• [`docs/architecture/uml_schema_proposal.sql`](docs/architecture/uml_schema_proposal.sql)<br>• [`docs/architecture/diagrams/uml_class.svg`](docs/architecture/diagrams/uml_class.svg)<br>• [`docs/architecture/diagrams/uml_erd.svg`](docs/architecture/diagrams/uml_erd.svg)<br>• [`docs/architecture/diagrams/uml_aid_request_state.svg`](docs/architecture/diagrams/uml_aid_request_state.svg)<br>• [`docs/architecture/diagrams/uml_sequence_citizen_request.svg`](docs/architecture/diagrams/uml_sequence_citizen_request.svg)<br>• [`docs/architecture/diagrams/uml_sequence_alloc_dispatch.svg`](docs/architecture/diagrams/uml_sequence_alloc_dispatch.svg)<br>• [`docs/architecture/diagrams/uml_sequence_offline_sync.svg`](docs/architecture/diagrams/uml_sequence_offline_sync.svg) | Lead Architects (`@akgozmirza`, `@kurdoglu25`) | [Issue #31](https://github.com/CoskunerBerke/AFLOS/issues/31), [PR #41](https://github.com/CoskunerBerke/AFLOS/pull/41) |
| **5. Sprint 2 Agile Governance, RACI & Ceremonies** | • [`docs/agile/raci_matrix_sprint2.md`](docs/agile/raci_matrix_sprint2.md)<br>• [`docs/agile/sprint2_ceremonies.md`](docs/agile/sprint2_ceremonies.md)<br>• [`docs/agile/impediment_log.md`](docs/agile/impediment_log.md) | Scrum Master (`@Noct-0`) | [Issue #34](https://github.com/CoskunerBerke/AFLOS/issues/34), [Issue #35](https://github.com/CoskunerBerke/AFLOS/issues/35), [PR #39](https://github.com/CoskunerBerke/AFLOS/pull/39), [PR #44](https://github.com/CoskunerBerke/AFLOS/pull/44) |
| **6. Sprint 2 Submission Manifest, CI & Release Governance** | • [`docs/submissions/sprint2_submission_manifest.md`](docs/submissions/sprint2_submission_manifest.md)<br>• [`CONTRIBUTIONS.md`](CONTRIBUTIONS.md)<br>• [`.github/workflows/ci.yml`](.github/workflows/ci.yml) | DevOps (`@CoskunerBerke`) | [Issue #36](https://github.com/CoskunerBerke/AFLOS/issues/36), [Issue #37](https://github.com/CoskunerBerke/AFLOS/issues/37), [PR #45](https://github.com/CoskunerBerke/AFLOS/pull/45) |

---

## 3. Sprint 1 Deliverable Index (`v0.1.0-sprint1`)

| Deliverable | Title | Primary File Path(s) | Responsible Role / Owner | Tracked Issue & PR |
|---|---|---|---|---|
| **Deliverable 01** | Project Proposal & Problem Statement | [`docs/requirements/01-project-proposal.md`](docs/requirements/01-project-proposal.md) | Product Owner (`@kaanklnc`) | [Issue #1](https://github.com/CoskunerBerke/AFLOS/issues/1), [PR #17](https://github.com/CoskunerBerke/AFLOS/pull/17) |
| **Deliverable 02** | System Vision, Boundary & Context Diagram | [`docs/requirements/02-system-vision-and-boundary.md`](docs/requirements/02-system-vision-and-boundary.md) | Product Owner (`@kaanklnc`) | [Issue #2](https://github.com/CoskunerBerke/AFLOS/issues/2), [PR #17](https://github.com/CoskunerBerke/AFLOS/pull/17) |
| **Deliverable 03** | OpenAPI 3.1.0 Contract Draft & Architecture Guide | [`api/openapi.yaml`](api/openapi.yaml)<br>[`docs/architecture/03-openapi-draft-guide.md`](docs/architecture/03-openapi-draft-guide.md)<br>[`tools/validate_openapi.py`](tools/validate_openapi.py) | Lead Architects (`@akgozmirza`, `@kurdoglu25`) | [Issue #21](https://github.com/CoskunerBerke/AFLOS/issues/21), [PR #20](https://github.com/CoskunerBerke/AFLOS/pull/20) |
| **Deliverable 04** | Team Roles, RACI Matrix & Meeting Minutes | [`docs/scrum/04-raci-matrix.md`](docs/scrum/04-raci-matrix.md)<br>[`docs/scrum/04-meeting-minutes.md`](docs/scrum/04-meeting-minutes.md) | Scrum Master (`@Noct-0`) | [Issue #14](https://github.com/CoskunerBerke/AFLOS/issues/14), [PR #16](https://github.com/CoskunerBerke/AFLOS/pull/16) |
| **Deliverable 05** | Repository Workflow, Git-Flow & CI Pipeline | [`docs/git_flow_rules.md`](docs/git_flow_rules.md)<br>[`.github/workflows/ci.yml`](.github/workflows/ci.yml) | DevOps (`@CoskunerBerke`) & SM (`@Noct-0`) | [Issue #7](https://github.com/CoskunerBerke/AFLOS/issues/7), [Issue #22](https://github.com/CoskunerBerke/AFLOS/issues/22), [PR #10](https://github.com/CoskunerBerke/AFLOS/pull/10), [PR #23](https://github.com/CoskunerBerke/AFLOS/pull/23) |
| **Deliverable 06** | Initial Product Backlog & Prioritized User Stories | [`docs/requirements/06-initial-product-backlog.md`](docs/requirements/06-initial-product-backlog.md) | Product Owner (`@kaanklnc`) | [Issue #6](https://github.com/CoskunerBerke/AFLOS/issues/6), [PR #17](https://github.com/CoskunerBerke/AFLOS/pull/17) |
| **Contributions** | Individual Member Contributions & GitHub Evidence | [`CONTRIBUTIONS.md`](CONTRIBUTIONS.md) | All 7 Team Members | Verified across Issues, PRs & Commits |

---

## 4. Team Members & Role Distribution

| Name | Student Number | Role Title | GitHub Profile | Dedicated Branch |
|---|---|---|---|---|
| **Kaan Kılınç** | 230204047 | Product Owner and Requirements Engineer | [`@kaanklnc`](https://github.com/kaanklnc) | `role/product-owner` |
| **Mustafa Çebin** | 230201024 | Scrum Master and Agile Process Coach | [`@Noct-0`](https://github.com/Noct-0) | `role/scrum-master` |
| **Mirza Akgöz** | 230201005 | Lead Software Architect and Technical Lead | [`@akgozmirza`](https://github.com/akgozmirza) | `role/architect-mirza` |
| **Hüseyin Zor** | 230204042 | Lead Software Architect and Technical Lead | [`@kurdoglu25`](https://github.com/kurdoglu25) | `role/architect-huseyin` |
| **Berke Coşkuner** | 230201062 | DevOps and CI/CD Infrastructure Engineer | [`@CoskunerBerke`](https://github.com/CoskunerBerke) | `role/devops` |
| **Onur Şahin** | 230201030 | Quality Assurance and Test Automation Engineer | [`@clickOMorphism`](https://github.com/clickOMorphism) | `role/qa` |
| **Ulaş Balcı** | 260201301 | Implementation and Integration Engineer | [`@ulasbalci0653`](https://github.com/ulasbalci0653) | `role/implementation` |

---

## 5. Repository Structure

```text
AFLOS/
├── .github/
│   └── workflows/
│       └── ci.yml                                        # Automated Sprint 1 & 2 Deliverable & OpenAPI CI check
├── api/
│   └── openapi.yaml                                      # Deliverable 03: OpenAPI 3.1.0 Contract (3,032 lines)
├── docs/
│   ├── agile/
│   │   ├── impediment_log.md                             # Sprint 2 Impediment Tracking Register
│   │   ├── raci_matrix_sprint2.md                        # Sprint 2 RACI Responsibility Matrix (S2-ACT-01..24)
│   │   └── sprint2_ceremonies.md                         # Sprint 2 Kickoff, Stand-up & Pre-Submission Logs
│   ├── architecture/
│   │   ├── diagrams/                                     # C4 (DSL, DOT, MMD, SVG) & UML (PUML, DOT, SVG) diagrams
│   │   ├── 03-openapi-draft-guide.md                     # OpenAPI 3.1.0 Architecture & Traceability Guide
│   │   ├── c4_model.md                                   # Sprint 2 C4 Model (Context, Container, Component & ADRs)
│   │   ├── openapi-validation-report.json                # Automated OpenAPI validation output
│   │   ├── uml_diagrams.md                               # Sprint 2 UML Class, Sequence, State & ER Diagrams
│   │   ├── uml_schema_proposal.sql                       # PostgreSQL / PostGIS DDL Schema Proposal
│   │   └── uml_validation_report.json                    # Automated UML diagram validation report
│   ├── quality/
│   │   └── nfr_quality_measures.md                       # Sprint 2 QA NFR Verification Benchmarks & Thresholds
│   ├── requirements/
│   │   ├── 01-project-proposal.md                        # Sprint 1 Project Proposal & Problem Statement
│   │   ├── 02-system-vision-and-boundary.md              # Sprint 1 System Vision, Boundary & Context Diagram
│   │   ├── 06-initial-product-backlog.md                 # Sprint 1 Initial Product Backlog
│   │   ├── 06-refined-product-backlog.md                 # Sprint 2 Refined Product Backlog (64 SP, Gherkin ACs)
│   │   ├── 07-software-requirements-specification.md     # Sprint 2 Detailed IEEE 830 / ISO 29148 SRS
│   │   ├── 08-non-functional-requirements.md             # Sprint 2 ISO/IEC 25010 Non-Functional Requirements
│   │   └── 09-user-flows-and-ui-spec.md                  # Sprint 2 End-to-End User Flows & UI Specification
│   ├── scrum/
│   │   ├── 04-meeting-minutes.md                         # Sprint 1 Ceremony Logs
│   │   └── 04-raci-matrix.md                             # Sprint 1 RACI Matrix
│   ├── submissions/
│   │   └── sprint2_submission_manifest.md                # Official Sprint 2 Submission Manifest & Cover Sheet
│   ├── ui_ux/
│   │   ├── screenshots/                                  # High-Fidelity 1440x900 Desktop Web SVG Prototypes
│   │   └── figma_prototype.md                            # Interactive Figma Prototype Links & Screen Walkthrough
│   └── git_flow_rules.md                                 # Git-Flow & Branch Protection Rules
├── tools/
│   ├── requirements-openapi.txt                          # Python dependencies for OpenAPI schema validation
│   └── validate_openapi.py                               # Automated OpenAPI 3.1.0 contract validator
├── CONTRIBUTIONS.md                                      # Sprint 1 & Sprint 2 Individual Contributions & Evidence
└── README.md                                             # Project overview and deliverable index
```

---

## 6. Validating the OpenAPI 3.1.0 Specification Locally

```bash
pip install -r tools/requirements-openapi.txt
python tools/validate_openapi.py
```

---

## 7. License
Licensed under the **Apache License, Version 2.0** (see rationale in [`docs/requirements/01-project-proposal.md`](docs/requirements/01-project-proposal.md)).
