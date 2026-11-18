# SENG 321 — Sprint 1 Deliverable 04: Meeting Minutes & Agile Ceremonies

**Project Title:** AFLOS — Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) — Software Engineering Project  
**Sprint:** Sprint 1 — Project Foundation & Team Operating Model  
**Role / Document Owner:** Scrum Master & Agile Process Coach — **Mustafa Çebin** (`@Noct-0`)  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  

---

## 1. Meeting 1: Sprint 1 Kickoff & Task Distribution

* **Date & Time:** October 28, 2026 | 22:38 – 23:13 (35 minutes)
* **Platform:** Microsoft Teams
* **Moderator (Scrum Master):** Mustafa Çebin (`@Noct-0`)
* **Attendees:** Mustafa Çebin, Kaan Kılınç, Onur Şahin, Hüseyin Zor, Berke Coşkuner, Mirza Akgöz, Ulaş Balcı (All 7 members present)

### 1.1 Agenda
1. Project foundation and task distribution for SENG 321 Sprint 1.
2. Clarification, role assignments, and review of the project RACI matrix.
3. Setting up the shared GitHub repository, branching conventions, and project board.

### 1.2 Decisions Made
* **D-01 (Project Name):** The system name is officially finalized as **AFLOS (Disaster Logistics & Aid Coordination System)**.
* **D-02 (Scope & Concept):** The team unanimously agreed to adopt Kaan Kılınç's proposal on disaster logistics, time-slot truck reservations, and two-factor delivery verification.
* **D-03 (Repository Setup):** The repository is established under `CoskunerBerke/AFLOS` with Git-Flow branch rules.

### 1.3 Action Items
| Action Item ID | Description | Assigned Owner | Target Delivery |
|---|---|---|---|
| **AI-01** | Create the GitHub repository, add all team members as collaborators, initialize Git-Flow branches (`main`, `develop`). | Berke Coşkuner | Sprint 1 Week 1 |
| **AI-02** | Author Deliverable 01 (Project Proposal) and Deliverable 02 (System Vision & Boundary). | Kaan Kılınç | Sprint 1 Week 1 |
| **AI-03** | Conduct technical spike, draft OpenAPI 3.1.0 YAML schema, and validate response contracts. | Mirza Akgöz & Hüseyin Zor & Ulaş Balcı | Sprint 1 Week 2 |
| **AI-04** | Formulate Initial Product Backlog with Epics, User Stories, and Acceptance Criteria. | Kaan Kılınç | Sprint 1 Week 2 |
| **AI-05** | Finalize team RACI matrix, author kickoff minutes, stand-up logs, and retrospective. | Mustafa Çebin | Sprint 1 Week 2 |

---

## 2. Meeting 2: Mid-Sprint Sync & Stand-up Log

* **Date & Time:** October 29, 2026 | 21:00 – 21:20 (20 minutes)
* **Platform:** Microsoft Teams
* **Moderator (Scrum Master):** Mustafa Çebin (`@Noct-0`)
* **Attendees:** Mustafa Çebin, Kaan Kılınç, Onur Şahin, Hüseyin Zor, Berke Coşkuner, Mirza Akgöz, Ulaş Balcı

| Team Member | Completed Since Last Sync | In Progress / Planned Next | Blockers / Impediments |
|---|---|---|---|
| **Mustafa Çebin (SM)** | Prepared draft RACI matrix categories and ceremony structure. | Finalizing `04-raci-matrix.md` and setting up project tracking board. | None. |
| **Kaan Kılınç (PO)** | Finished draft problem statement and stakeholder identification. | Drafting System Boundaries and Initial Product Backlog stories. | None. |
| **Berke Coşkuner (DevOps)** | Configured initial repo structure and CI status checks. | Preparing Git-Flow documentation and protection rules. | None. |
| **Mirza Akgöz (Arch)** | Analyzed API endpoints for emergency zones and carrier applications. | Writing `openapi.yaml` contract and request/response models. | None. |
| **Hüseyin Zor (Arch)** | Reviewed data models and transaction isolation constraints. | Aligning OpenAPI schema with C4 structural decisions. | None. |
| **Onur Şahin (QA)** | Reviewed Definition of Ready and Acceptance Criteria format. | Defining test coverage metrics baseline (≥50% requirement). | None. |
| **Ulaş Balcı (Impl)** | Researched Leaflet map integration parameters and schema types. | Supporting API data dictionary definitions. | None. |

---

## 3. Sprint 1 Impediment Tracking Log

| Log ID | Date | Reported By | Description | Impact | Resolution / Mitigation | Status |
|---|---|---|---|---|---|---|
| **IMP-01** | Oct 27, 2026 | Mirza Akgöz | Schema draft formatting discrepancies between OpenAPI 3.0 and 3.1 tooling. | Low | Adopted OpenAPI 3.1.0 standard validated via automated CLI validator. | **Resolved** |
| **IMP-02** | Oct 31, 2026 | Mustafa Çebin | Need to eliminate duplicate board items created during early repo initialization. | Low | Enforced explicit issue filtering (`is:open`) on the GitHub Projects board. | **Resolved** |

---

## 4. Sprint 1 Retrospective

* **Session Date:** November 03, 2026 | 21:30 – 22:00
* **Facilitator:** Mustafa Çebin (Scrum Master - `@Noct-0`)

### 4.1 What Went Well (Keep Doing)
* Complete 100% attendance across all scheduled team ceremonies and syncs.
* High quality and thoroughness of requirements engineering led by Product Owner.
* Early establishment of automated CI pipeline verification and OpenAPI linting.

### 4.2 What Could Be Improved (Action Items for Sprint 2)
* **Earlier Branch Synchronization:** Feature branches should be integrated into `develop` incrementally rather than right before the sprint boundary.
* **Refined Board Automation:** Configure automated GitHub Actions to transition issue status cards on PR open/merge events.

### 4.3 Next Ceremony
* **Ceremony:** Sprint 2 Planning & Architecture Alignment
* **Date & Time:** November 16, 2026 | 21:00 (Microsoft Teams)
