# SENG 321 — Sprint 2: Agile Ceremonies & Process Governance

**Project Title:** AFLOS — Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) — Software Engineering Project  
**Sprint:** Sprint 2 — Detailed Requirements (SRS), Architecture (C4/UML) & UI/UX Prototyping  
**Role / Document Owner:** Scrum Master & Agile Process Coach — **Mustafa Çebin** (`@Noct-0`)  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  
**Tracking Issue:** [Issue #34](https://github.com/CoskunerBerke/AFLOS/issues/34)

---

## 1. Sprint 1 Retrospective Conclusions & Actionable Process Improvements

During the Sprint 1 Retrospective, the team analyzed velocity, collaboration hurdles, and deliverable quality. The following actionable process improvements have been officially incorporated into the Sprint 2 operating model:

| Area of Improvement | Observed Issue in Sprint 1 | Actionable Process Improvement for Sprint 2 | Owner | Verification Method |
|---|---|---|---|---|
| **Branch Integration & PR Cadence** | Deliverables were merged close to the sprint deadline, creating review bottlenecks. | **Staged PR Windows:** Enforce incremental PR merges. Technical spikes and SRS sections must be submitted by Mid-Sprint. | `@Noct-0` & Whole Team | Weekly PR review cycle audit on GitHub. |
| **Peer Review Governance** | Review turnaround times varied among team members. | **24-Hour Review SLA:** Any opened PR must receive at least 1 formal peer review within 24 hours of opening. | All Technical Roles | PR timestamp tracking on GitHub Projects. |
| **Board Hygiene & Traceability** | Early confusion around duplicate issues on the board. | **Strict Issue Traceability:** Direct commits prohibited; all PRs must explicitly include `Closes #IssueID` linked to Project Board cards. | `@Noct-0` (Scrum Master) | Board filtering (`is:open`) and automated status transitions. |
| **Cross-Functional Alignment** | Architecture models and API contracts were designed asynchronously. | **Pre-Modeling Alignment Spikes:** Lead Architects and Product Owner hold joint reviews before finalizing C4 and UML diagrams. | `@akgozmirza` & `@kaanklnc` | Architecture sync notes in review & PR discussions. |

---

## 2. Sprint 2 Ceremony Records

### 2.1 Ceremony 1: Sprint 2 Kickoff & Task Planning
* **Date & Time:** November 17, 2026 | 23:00 – 23:29 (29 minutes)
* **Platform:** Microsoft Teams
* **Moderator (Scrum Master):** Mustafa Çebin (`@Noct-0`)
* **Attendees:** 
  * Mustafa Çebin (Scrum Master & Agile Process Coach)
  * Kaan Kılınç (Product Owner & Requirements Engineer)
  * Mirza Akgöz (Lead Software Architect & Technical Lead)
  * Hüseyin Zor (Lead Software Architect & Technical Lead)
  * Berke Coşkuner (DevOps & CI/CD Infrastructure Engineer)
  * Onur Şahin (QA Engineer & Test Automation Engineer)
  * Ulaş Balcı (Implementation & Integration Engineer)
  *(All 7 members present)*

#### Agenda & Key Decisions:
1. **Sprint 2 Objective:** Deliver the 4 primary BM 321 Week 5 artifacts (Detailed SRS & Refined Backlog, Non-Functional Requirements, Figma UI/UX Prototypes & User-Flows, C4 & UML Architecture Models).
2. **Issue Distribution on GitHub Projects:** Tasks broken down into scoped issues assigned across all 7 members.
3. **Figma Design Standard:** Ulaş and Kaan will co-design responsive views based on standard component libraries.
4. **Architecture Standard:** C4 model (Context, Container, Component) and UML (Class, Sequence, State Machine for Shipments) will be authored in Markdown via Mermaid.js and PlantUML.

#### Task Distribution & Assigned GitHub Issues:
| Tracking Issue | Deliverable / Task Description | Assigned Role | Primary Owner | Target Delivery |
|---|---|---|---|---|
| **[#25](https://github.com/CoskunerBerke/AFLOS/issues/25)** | Detailed Software Requirements Specification (SRS) with ISO/IEC/IEEE 29148 structure | Product Owner | Kaan Kılınç (`@kaanklnc`) | Mid-Sprint |
| **[#26](https://github.com/CoskunerBerke/AFLOS/issues/26)** | Non-Functional Requirements (NFR) & Quality-Measure Specifications (Performance, Security, KVKK) | Product Owner / QA | Kaan Kılınç & Onur Şahin | Mid-Sprint |
| **[#27](https://github.com/CoskunerBerke/AFLOS/issues/27) / [#30](https://github.com/CoskunerBerke/AFLOS/issues/30)** | Interactive Figma UI/UX Prototypes & Complete User-Flow Diagrams | Implementation / PO | Ulaş Balcı (`@ulasbalci0653`) & Kaan Kılınç | Pre-Submission |
| **[#29](https://github.com/CoskunerBerke/AFLOS/issues/29)** | C4 Architecture Model (Context, Container, Component diagrams & ADRs) | Lead Architect | Hüseyin Zor (`@kurdoglu25`) | Pre-Submission |
| **[#31](https://github.com/CoskunerBerke/AFLOS/issues/31)** | UML Structural & Behavioral Models (Class Diagram, Sequence Diagram, Shipment State Machine) | Lead Architect | Mirza Akgöz (`@akgozmirza`) | Pre-Submission |
| **[#28](https://github.com/CoskunerBerke/AFLOS/issues/28)** | Refine Product Backlog with Story Points & Gherkin Acceptance Criteria | Product Owner | Kaan Kılınç (`@kaanklnc`) | Mid-Sprint |
| **[#34](https://github.com/CoskunerBerke/AFLOS/issues/34)** | Sprint 2 Governance, Ceremonies, Impediment Tracking & Process Monitoring | Scrum Master | Mustafa Çebin (`@Noct-0`) | Continuous |
| **[#35](https://github.com/CoskunerBerke/AFLOS/issues/35)** | Sprint 2 RACI Responsibility Matrix Aligned with Rubric Guidelines | Scrum Master | Mustafa Çebin (`@Noct-0`) | Continuous |

---

### 2.2 Ceremony 2: Pre-Submission Review & Final Sign-Off
* **Date & Time:** November 23, 2026 | 23:00 – 23:25 (25 minutes)
* **Platform:** Microsoft Teams (Moderated by Scrum Master `@Noct-0`)
* **Attendees:** All 7 team members present
* **Outcomes & Final Sign-off:**
  - Audited all 4 core deliverables (Detailed SRS, NFRs, Figma prototype, C4 & UML diagrams) with zero critical gaps.
  - Approved final PR merges into `develop` and authorized DevOps (`@CoskunerBerke`) to cut the official release tag `v0.2.0-sprint2`.
  - Final deliverable package verified against the BM 321 Assessment Rubric for official Microsoft Teams submission.

---

## 3. GitHub Projects Board Flow & Process Metrics

As Scrum Master, the following policies and metrics are monitored for Sprint 2:

### 3.1 Board Progression Workflow
* **`Todo`:** Tasks created and sized during Sprint Planning.
* **`In Progress`:** Assigned owner is actively drafting documents/models. Branch must follow `feature/*` or `role/*`.
* **`In Review`:** PR opened against `develop`. Requires minimum 1 approving peer review and CI pass.
* **`Done`:** PR merged into `develop` and closing issue verified.

### 3.2 PR Review Cycle Time SLA
* **Target:** Maximum **24 hours** from PR opening to first review response.
* **Enforcement:** Scrum Master pings designated reviewers via Teams if a PR sits idle for >18 hours.

---
*Document Recorded by: Mustafa Çebin — Scrum Master & Agile Process Coach (`@Noct-0`)*  
*AFLOS Team 2 | BM 321 / SENG 321 Software Engineering Project*
