# SENG 321 — Sprint 2: RACI Responsibility Matrix

**Project Title:** AFLOS — Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) — Software Engineering Project  
**Sprint:** Sprint 2 — Detailed Requirements (SRS), Architecture (C4/UML) & UI/UX Prototyping  
**Role / Document Owner:** Scrum Master & Agile Process Coach — **Mustafa Çebin** (`@Noct-0`)  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  
**Tracking Issue:** [Issue #35](https://github.com/CoskunerBerke/AFLOS/issues/35)

---

## 1. Team Composition & Role Distribution (7-Member Engineering Team)

In strict accordance with the **BM 321 7-Person Team Specification Guidelines**, the roles and ownership boundaries for Sprint 2 are balanced across all official team members:

| # | Team Member | Official Course Role & Sub-Domain Focus | GitHub Username / Handle |
|---|---|---|---|
| 1 | **Kaan Kılınç** | Product Owner and Requirements Engineer | `@kaanklnc` |
| 2 | **Mustafa Çebin** | Scrum Master and Agile Process Coach | `@Noct-0` |
| 3 | **Onur Şahin** | Quality Assurance and Test Automation Engineer | `@clickOMorphism` |
| 4 | **Hüseyin Zor** | Lead Software Architect and Technical Lead *(C4 Architecture Focus)* | `@kurdoglu25` |
| 5 | **Berke Coşkuner** | DevOps and CI/CD Infrastructure Engineer | `@CoskunerBerke` |
| 6 | **Mirza Akgöz** | Lead Software Architect and Technical Lead *(UML & API Architecture Focus)* | `@akgozmirza` |
| 7 | **Ulaş Balcı** | Implementation and Integration Engineer | `@ulasbalci0653` |

*(Note on Submission Oversight: The official course submission is jointly validated and signed off by a 3-member Steering & Delivery Committee consisting of Product Owner Kaan Kılınç, Scrum Master Mustafa Çebin, and DevOps Engineer Berke Coşkuner).*

---

## 2. RACI Definitions & Governance Rules

* **R (Responsible):** The specialist who actively authors, models, executes, or submits the deliverable.
* **A (Accountable):** The **single** role with ultimate decision authority, veto power, and final sign-off accountability.  
  *(Governance Rule: Exactly **ONE** 'A' per row — zero dual-accountability ambiguity).*
* **C (Consulted):** Subject-matter experts providing domain inputs, architectural validation, or review feedback.
* **I (Informed):** Team members notified of progress, baseline changes, and integration readiness.
* **R/A:** Designated owner who both directly executes the task and holds ultimate accountability for its completion.

---

## 3. Sprint 2 RACI Responsibility Matrix

> **Sprint 2 Scope:** Detailed Software Requirements Specification (SRS), Refined Backlog, Non-Functional Requirements (NFR) & Quality Measures, Figma UI/UX Prototypes with User-Flows, C4 Architectural Modeling, UML Structural/Behavioral Diagrams, Infrastructure Automation, Submission Manifest Compilation, and MS Teams Course Delivery.

### Category 1: Requirements Engineering & Backlog Refinement (SRS)
| Task ID | Deliverable / Engineering Activity | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **S2-ACT-01** | Author Detailed Software Requirements Specification (SRS) following ISO/IEC/IEEE 29148 standards | **R/A** | C | C | C | I | C | I |
| **S2-ACT-02** | Refine and decompose Product Backlog (Epics, detailed User Stories, Acceptance Criteria) | **R/A** | C | R | C | I | C | I |
| **S2-ACT-03** | Specify Non-Functional Requirements (NFRs) for Disaster Resilience, KVKK Data Masking & Security *(PO Accountable for business scope; QA Responsible for drafting testable criteria)* | **A** | C | **R** | C | I | C | I |
| **S2-ACT-04** | Define quantifiable Quality-Measure Specifications (API response times, concurrency limits) | C | C | **R/A** | C | I | C | I |

### Category 2: UI/UX Prototyping & User-Flow Modeling (Figma)
| Task ID | Deliverable / Engineering Activity | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **S2-ACT-05** | Design interactive high-fidelity Figma UI prototypes for Public Map View & Emergency Aid Zones | C | I | I | C | I | C | **R/A** |
| **S2-ACT-06** | Design Carrier Dispatch Portal, Time-Slot Reservation UI, and Standby Fleet Pool screens | C | I | I | C | I | C | **R/A** |
| **S2-ACT-07** | Design Field Staff 2FA Handover Scanner (License Plate & QR Code verification interface) | C | I | I | C | I | C | **R/A** |
| **S2-ACT-08** | Author end-to-end User-Flow Diagrams capturing primary user journeys and exception paths | **A** | I | C | C | I | C | R |

### Category 3: System Architecture — C4 Model
| Task ID | Deliverable / Engineering Activity | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **S2-ACT-09** | Design C4 Level 1: System Context Diagram (AFLOS boundaries, external actors, blackout fallbacks) | C | I | I | **R/A** | I | R | C |
| **S2-ACT-10** | Design C4 Level 2: Container Diagram (Web Frontend, REST API, Database, NGINX Reverse Proxy) | C | I | I | **R/A** | C | R | C |
| **S2-ACT-11** | Design C4 Level 3: Component Diagram for Core Logistics Service & Handover Engine | C | I | I | **R/A** | I | R | C |

### Category 4: System Architecture — Unified Modeling Language (UML)
| Task ID | Deliverable / Engineering Activity | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **S2-ACT-12** | Author Domain Class Diagram (Entities, Value Objects, Cardinalities, Enumerations) | C | I | I | R | I | **R/A** | C |
| **S2-ACT-13** | Model UML Sequence Diagrams (Carrier Slot Booking, 2FA Handover Verification, Fallback Handover) | C | I | C | R | I | **R/A** | C |
| **S2-ACT-14** | Author UML State Machine Diagram for Shipment Lifecycle (`CONFIRMED` to `DELIVERED`/`CANCELLED`) | C | I | C | R | I | **R/A** | C |

### Category 5: DevOps, Infrastructure & Quality Assurance Standards
| Task ID | Deliverable / Engineering Activity | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **S2-ACT-15** | Formulate Sprint 2 Quality Assurance Plan & Definition of Done (DoD) verification baseline | I | C | **R/A** | C | I | C | I |
| **S2-ACT-16** | Maintain GitHub Actions CI validation for Markdown linting, Mermaid diagram checks & OpenAPI audit | I | I | C | I | **R/A** | I | I |
| **S2-ACT-17** | Configure branch protection policies, Git-Flow release preparation (`release/sprint-2`) & version tagging | I | C | I | I | **R/A** | I | I |
| **S2-ACT-18** | Review architecture models and OpenAPI 3.1 contract compliance (API-first consistency check) | C | I | C | R | I | **A** | R |

### Category 6: Agile Process Management, Governance & Formal Course Submission
| Task ID | Deliverable / Engineering Activity | Kaan (PO) | Mustafa (SM) | Onur (QA) | Hüseyin (Arch) | Berke (DevOps) | Mirza (Arch) | Ulaş (Impl) |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **S2-ACT-19** | Facilitate Sprint 2 ceremonies (Kickoff, Weekly/Async Stand-ups, Architecture Review Sync) | C | **R/A** | C | C | C | C | C |
| **S2-ACT-20** | Maintain Impediment Tracking Register (`docs/agile/impediment_log.md`) and resolve blockers | C | **R/A** | C | C | C | C | C |
| **S2-ACT-21** | Administer GitHub Projects board, issue assignment, column movement, and PR review cycle SLAs | C | **R/A** | C | C | C | C | C |
| **S2-ACT-22** | Balance and author Sprint 2 RACI Matrix (`docs/agile/raci_matrix_sprint2.md`) aligned with rubric | C | **R/A** | C | C | C | C | C |
| **S2-ACT-23** | Compile BM 321 Sprint 2 Submission Manifest, Cover Sheet & Verifiable Evidence Dossier | C | **R/A** | C | C | C | C | C |
| **S2-ACT-24** | Perform official BM 321 Sprint 2 submission via Microsoft Teams and share upload confirmation | **R** | **R** | I | I | **R/A** | I | I |

---

## 4. Role Ownership & Execution Summary

* **Product Owner (`@kaanklnc`):** Single point of accountability (`A`) for functional requirements, SRS structure, backlog refinement, and end-to-end user flows.
* **Lead Architect 1 (`@kurdoglu25`):** Single point of accountability (`A`) for all C4 Model tiers (Context, Container, Component).
* **Lead Architect 2 (`@akgozmirza`):** Single point of accountability (`A`) for structural and behavioral UML models (Class, Sequence, State Machine) and API-first architectural compliance.
* **Implementation Engineer (`@ulasbalci0653`):** Single point of accountability (`A`) for the visual and interactive Figma UI/UX prototype suite.
* **QA Engineer (`@clickOMorphism`):** Single point of accountability (`A`) for Quality Assurance Strategy, testable NFR thresholds, and DoD verification.
* **DevOps Engineer (`@CoskunerBerke`):** Single point of accountability (`A`) for CI/CD automation, diagram/OpenAPI linting, release branch coordination, version tagging (`v0.2.0-sprint2`), and the official Microsoft Teams portal submission.
* **Scrum Master (`@Noct-0`):** Single point of accountability (`A`) for Agile governance, ceremonies, impediment tracking, project board flow, RACI matrix, and compiling the submission manifest dossier.

---
*Document Maintained by: Mustafa Çebin — Scrum Master & Agile Process Coach (`@Noct-0`)*  
*AFLOS Team 2 | BM 321 / SENG 321 Software Engineering Project*
