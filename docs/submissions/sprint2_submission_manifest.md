# SENG 321 (BM 321) – Sprint 2 Submission Manifest & Cover Sheet

**Project Title:** AFLOS – Disaster Logistics & Aid Coordination System  
**Team Number:** Team 2  
**Course:** SENG 321 (BM 321) – Software Engineering Project  
**Sprint:** Sprint 2 – Requirements & Architecture (Weight: 20%)  
**Submission Date:** November 24, 2026  
**GitHub Repository URL:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  
**Official Sprint 2 Release Tag:** [`v0.2.0-sprint2`](https://github.com/CoskunerBerke/AFLOS/releases/tag/v0.2.0-sprint2)  
**Tracking Issues:** [Issue #36](https://github.com/CoskunerBerke/AFLOS/issues/36), [Issue #37](https://github.com/CoskunerBerke/AFLOS/issues/37)  

---

## 1. Team Composition & Sprint 2 Role Responsibilities

| # | Full Name | Student ID | Official Role Title | GitHub Profile | Primary Sprint 2 Ownership (`R/A`) |
|---|---|---|---|---|---|
| 1 | **Kaan Kılınç** | 230204047 | Product Owner and Requirements Engineer | [`@kaanklnc`](https://github.com/kaanklnc) | Detailed IEEE 830 / ISO 29148 SRS, Refined Product Backlog (64 SP), ISO 25010 NFR Specification & End-to-End User Flows (`S2-ACT-01`..`03`, `08`) |
| 2 | **Mustafa Çebin** | 230201024 | Scrum Master and Agile Process Coach | [`@Noct-0`](https://github.com/Noct-0) | Sprint 2 RACI Matrix (`S2-ACT-01`..`24`), Ceremony Minutes, Impediment Log & Project Board Governance (`S2-ACT-19`..`23`) |
| 3 | **Mirza Akgöz** | 230201005 | Lead Software Architect and Technical Lead | [`@akgozmirza`](https://github.com/akgozmirza) | UML Structural & Behavioral Diagrams (Class, Sequence, State Machine), OpenAPI 3.1.0 Alignment (`S2-ACT-12`..`14`, `18`) |
| 4 | **Hüseyin Zor** | 230204042 | Lead Software Architect and Technical Lead | [`@kurdoglu25`](https://github.com/kurdoglu25) | C4 Architectural Model (Level 1 Context, Level 2 Container, Level 3 Component), ADRs, ERD & PostgreSQL Schema (`S2-ACT-09`..`11`) |
| 5 | **Berke Coşkuner** | 230201062 | DevOps and CI/CD Infrastructure Engineer | [`@CoskunerBerke`](https://github.com/CoskunerBerke) | GitHub Actions CI Deliverable & OpenAPI Validation, Git-Flow Merge Governance, Release Tagging (`v0.2.0-sprint2`) & MS Teams Submission (`S2-ACT-16`, `17`, `24`) |
| 6 | **Onur Şahin** | 230201030 | Quality Assurance and Test Automation Engineer | [`@clickOMorphism`](https://github.com/clickOMorphism) | Testable NFR Verification Benchmarks, Load/Performance Acceptance Thresholds & QA Strategy (`S2-ACT-03`, `04`, `15`) |
| 7 | **Ulaş Balcı** | 260201301 | Implementation and Integration Engineer | [`@ulasbalci0653`](https://github.com/ulasbalci0653) | Interactive High-Fidelity Figma UI/UX Prototypes, Design System & Screen Vector Suite (`S2-ACT-05`..`07`) |

---

## 2. Sprint 2 Required Deliverables & Artifact Traceability Matrix

| Required Sprint 2 Deliverable | Repository Artifact Path(s) | Responsible / Accountable Owners | Linked GitHub Issues | Linked Pull Requests |
|---|---|---|---|---|
| **1. Detailed Software Requirements Specification (SRS) & Refined Product Backlog** | • [`docs/requirements/07-software-requirements-specification.md`](../requirements/07-software-requirements-specification.md)<br>• [`docs/requirements/06-refined-product-backlog.md`](../requirements/06-refined-product-backlog.md) | `@kaanklnc` (PO)<br>`@clickOMorphism` (QA) | [Issue #25](https://github.com/CoskunerBerke/AFLOS/issues/25)<br>[Issue #28](https://github.com/CoskunerBerke/AFLOS/issues/28) | [PR #29](https://github.com/CoskunerBerke/AFLOS/pull/29) |
| **2. Non-Functional Requirements (NFR) & Quality-Measure Specifications** | • [`docs/requirements/08-non-functional-requirements.md`](../requirements/08-non-functional-requirements.md)<br>• [`docs/quality/nfr_quality_measures.md`](../quality/nfr_quality_measures.md) | `@clickOMorphism` (QA)<br>`@kaanklnc` (PO) | [Issue #26](https://github.com/CoskunerBerke/AFLOS/issues/26)<br>[Issue #33](https://github.com/CoskunerBerke/AFLOS/issues/33) | [PR #29](https://github.com/CoskunerBerke/AFLOS/pull/29)<br>[PR #38](https://github.com/CoskunerBerke/AFLOS/pull/38)<br>[PR #43](https://github.com/CoskunerBerke/AFLOS/pull/43) |
| **3. UI/UX Prototypes (Figma) & User-Flow Diagrams** | • [`docs/ui_ux/figma_prototype.md`](../ui_ux/figma_prototype.md)<br>• [`docs/requirements/09-user-flows-and-ui-spec.md`](../requirements/09-user-flows-and-ui-spec.md)<br>• [`docs/ui_ux/screenshots/`](../ui_ux/screenshots/) *(10 Desktop Web SVG Frames)* | `@ulasbalci0653` (Impl)<br>`@kaanklnc` (PO) | [Issue #27](https://github.com/CoskunerBerke/AFLOS/issues/27)<br>[Issue #32](https://github.com/CoskunerBerke/AFLOS/issues/32) | [PR #29](https://github.com/CoskunerBerke/AFLOS/pull/29)<br>[PR #42](https://github.com/CoskunerBerke/AFLOS/pull/42) |
| **4A. Software Architecture: C4 Model & ADRs** | • [`docs/architecture/c4_model.md`](../architecture/c4_model.md)<br>• [`docs/architecture/diagrams/aflos_c4_workspace.dsl`](../architecture/diagrams/aflos_c4_workspace.dsl)<br>• [`docs/architecture/diagrams/c4_level1_context.svg`](../architecture/diagrams/c4_level1_context.svg)<br>• [`docs/architecture/diagrams/c4_level2_containers.svg`](../architecture/diagrams/c4_level2_containers.svg)<br>• [`docs/architecture/diagrams/c4_level3_components.svg`](../architecture/diagrams/c4_level3_components.svg) | `@kurdoglu25` (Arch)<br>`@akgozmirza` (Arch) | [Issue #30](https://github.com/CoskunerBerke/AFLOS/issues/30) | [PR #40](https://github.com/CoskunerBerke/AFLOS/pull/40) |
| **4B. Software Architecture: UML Diagrams, ERD & SQL Schema** | • [`docs/architecture/uml_diagrams.md`](../architecture/uml_diagrams.md)<br>• [`docs/architecture/uml_schema_proposal.sql`](../architecture/uml_schema_proposal.sql)<br>• [`docs/architecture/diagrams/uml_class.svg`](../architecture/diagrams/uml_class.svg)<br>• [`docs/architecture/diagrams/uml_erd.svg`](../architecture/diagrams/uml_erd.svg)<br>• [`docs/architecture/diagrams/uml_aid_request_state.svg`](../architecture/diagrams/uml_aid_request_state.svg)<br>• [`docs/architecture/diagrams/uml_sequence_citizen_request.svg`](../architecture/diagrams/uml_sequence_citizen_request.svg)<br>• [`docs/architecture/diagrams/uml_sequence_alloc_dispatch.svg`](../architecture/diagrams/uml_sequence_alloc_dispatch.svg)<br>• [`docs/architecture/diagrams/uml_sequence_offline_sync.svg`](../architecture/diagrams/uml_sequence_offline_sync.svg) | `@akgozmirza` (Arch)<br>`@kurdoglu25` (Arch) | [Issue #31](https://github.com/CoskunerBerke/AFLOS/issues/31) | [PR #41](https://github.com/CoskunerBerke/AFLOS/pull/41) |
| **5. Agile Governance, RACI Matrix & Ceremonies** | • [`docs/agile/raci_matrix_sprint2.md`](../agile/raci_matrix_sprint2.md)<br>• [`docs/agile/sprint2_ceremonies.md`](../agile/sprint2_ceremonies.md)<br>• [`docs/agile/impediment_log.md`](../agile/impediment_log.md) | `@Noct-0` (SM) | [Issue #34](https://github.com/CoskunerBerke/AFLOS/issues/34)<br>[Issue #35](https://github.com/CoskunerBerke/AFLOS/issues/35) | [PR #39](https://github.com/CoskunerBerke/AFLOS/pull/39)<br>[PR #44](https://github.com/CoskunerBerke/AFLOS/pull/44) |
| **6. DevOps CI Validation, Release Tagging & Contribution Evidence** | • [`.github/workflows/ci.yml`](../../.github/workflows/ci.yml)<br>• [`CONTRIBUTIONS.md`](../../CONTRIBUTIONS.md)<br>• [`README.md`](../../README.md)<br>• [`docs/submissions/sprint2_submission_manifest.md`](sprint2_submission_manifest.md) | `@CoskunerBerke` (DevOps) | [Issue #36](https://github.com/CoskunerBerke/AFLOS/issues/36)<br>[Issue #37](https://github.com/CoskunerBerke/AFLOS/issues/37) | [PR #45](https://github.com/CoskunerBerke/AFLOS/pull/45)<br>[Release `v0.2.0-sprint2`](https://github.com/CoskunerBerke/AFLOS/releases/tag/v0.2.0-sprint2) |

---

## 3. Verification & Rubric Compliance Checklist

- [x] **Detailed SRS & Refined Backlog:** IEEE 830 / ISO 29148 compliant functional requirements (`REQ-FR-101` to `REQ-FR-405`), use cases, RTM, and 64 Story Points of Fibonacci-estimated User Stories with Gherkin (`GIVEN-WHEN-THEN`) acceptance criteria.
- [x] **NFR & Quality-Measure Specifications:** Quantifiable ISO/IEC 25010 performance, scalability, security (KVKK), availability, and offline resilience thresholds paired with objective k6/Locust/PostGIS verification protocols.
- [x] **Figma UI/UX Prototypes & User Flows:** Publicly accessible interactive Figma prototype links, 4 Mermaid user-flow diagrams, and 10 high-resolution `1440x900` web vector frames committed under `docs/ui_ux/screenshots/`.
- [x] **C4 Models & UML Diagrams:** Complete C4 Level 1–3 models (Structurizr DSL, Mermaid, Graphviz DOT, SVG), 5 Architectural Decision Records (ADRs), and OMG UML 2.5 Class, ERD, State Machine, and 3 Sequence diagrams backed by executable PostgreSQL DDL (`uml_schema_proposal.sql`).
- [x] **GitHub Traceability & Release Governance:** Intact commit history, peer-reviewed Pull Requests (`PR #29`, `#38`–`#45`), automated GitHub Actions CI verification, updated `CONTRIBUTIONS.md`, and official GitHub Release tag `v0.2.0-sprint2`.
