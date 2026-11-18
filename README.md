# AFLOS – Disaster Logistics & Aid Coordination System
**Afet Lojistik ve Koordinasyon Sistemi**  
**Course:** SENG 321 (BM 321) – Software Engineering Project  
**Release:** `v0.1.0-sprint1` (Sprint 1 – Project Foundation & Team Operating Model)

---

## 1. Project Overview
**AFLOS** is a map-centric, API-first disaster logistics and aid coordination platform designed to eliminate post-disaster supply mismatches, road gridlock at relief drop-off zones, and shipment traceability gaps. By combining categorized regional need deficits with quota-enforced vehicle arrival **Time Slots** and two-factor on-site handover verification (plus a radio/satellite Coordinator Fallback workflow during telecommunication blackouts), AFLOS enables civilian carriers, field volunteers, and institutional disaster coordinators to coordinate relief deliveries reliably.

---

## 2. Sprint 1 Deliverable Index

All six required SENG 321 Sprint 1 deliverables and individual contribution records are organized in this repository as follows:

| Deliverable | Title | Primary File Path(s) | Responsible Role / Owner | Tracked Issue & PR |
|---|---|---|---|---|
| **Deliverable 01** | Project Proposal & Problem Statement | [`docs/requirements/01-project-proposal.md`](docs/requirements/01-project-proposal.md) | Product Owner (`@kaanklnc`) | [Issue #1](https://github.com/CoskunerBerke/AFLOS/issues/1), [PR #17](https://github.com/CoskunerBerke/AFLOS/pull/17) |
| **Deliverable 02** | System Vision, Boundary & Context Diagram | [`docs/requirements/02-system-vision-and-boundary.md`](docs/requirements/02-system-vision-and-boundary.md) | Product Owner (`@kaanklnc`) | [Issue #2](https://github.com/CoskunerBerke/AFLOS/issues/2), [PR #17](https://github.com/CoskunerBerke/AFLOS/pull/17) |
| **Deliverable 03** | OpenAPI 3.1.0 Contract Draft & Architecture Guide | [`api/openapi.yaml`](api/openapi.yaml)<br>[`docs/architecture/03-openapi-draft-guide.md`](docs/architecture/03-openapi-draft-guide.md)<br>[`tools/validate_openapi.py`](tools/validate_openapi.py) | Lead Architects (`@akgozmirza`, `@kurdoglu25`) | [Issue #21](https://github.com/CoskunerBerke/AFLOS/issues/21), [PR #20](https://github.com/CoskunerBerke/AFLOS/pull/20) |
| **Deliverable 04** | Team Roles, RACI Matrix & Meeting Minutes | [`docs/scrum/04-raci-matrix.md`](docs/scrum/04-raci-matrix.md)<br>[`docs/scrum/04-meeting-minutes.md`](docs/scrum/04-meeting-minutes.md) | Scrum Master (`@Noct-0`) | [Issue #14](https://github.com/CoskunerBerke/AFLOS/issues/14), [PR #16](https://github.com/CoskunerBerke/AFLOS/pull/16) |
| **Deliverable 05** | Repository Workflow, Git-Flow & CI Pipeline | [`docs/git_flow_rules.md`](docs/git_flow_rules.md)<br>[`.github/workflows/ci.yml`](.github/workflows/ci.yml) | DevOps (`@CoskunerBerke`) & SM (`@Noct-0`) | [Issue #7](https://github.com/CoskunerBerke/AFLOS/issues/7), [Issue #22](https://github.com/CoskunerBerke/AFLOS/issues/22), [PR #10](https://github.com/CoskunerBerke/AFLOS/pull/10) |
| **Deliverable 06** | Initial Product Backlog & Prioritized User Stories | [`docs/requirements/06-initial-product-backlog.md`](docs/requirements/06-initial-product-backlog.md) | Product Owner (`@kaanklnc`) | [Issue #6](https://github.com/CoskunerBerke/AFLOS/issues/6), [PR #17](https://github.com/CoskunerBerke/AFLOS/pull/17) |
| **Contributions** | Individual Member Contributions & GitHub Evidence | [`CONTRIBUTIONS.md`](CONTRIBUTIONS.md) | All 7 Team Members | Verified across Issues, PRs & Commits |

---

## 3. Team Members & Role Distribution

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

## 4. Repository Structure

```text
AFLOS/
├── .github/
│   └── workflows/
│       └── ci.yml                                    # Automated Deliverable & OpenAPI 3.1.0 CI check
├── api/
│   └── openapi.yaml                                  # Deliverable 03: OpenAPI 3.1.0 Contract (3,032 lines)
├── docs/
│   ├── architecture/
│   │   ├── 03-openapi-draft-guide.md                 # Deliverable 03: API Architecture & Traceability Guide
│   │   └── openapi-validation-report.json            # Automated OpenAPI validation output
│   ├── requirements/
│   │   ├── 01-project-proposal.md                    # Deliverable 01: Project Proposal & Problem Statement
│   │   ├── 02-system-vision-and-boundary.md          # Deliverable 02: System Vision, Boundary & Context Diagram
│   │   └── 06-initial-product-backlog.md             # Deliverable 06: Prioritized Backlog & Gherkin Criteria
│   ├── scrum/
│   │   ├── 04-meeting-minutes.md                     # Deliverable 04: Kickoff, Stand-up & Retrospective Logs
│   │   └── 04-raci-matrix.md                         # Deliverable 04: Team Roles & RACI Matrix (ACT-01..23)
│   └── git_flow_rules.md                             # Deliverable 05: Git-Flow & Branch Protection Rules
├── tools/
│   ├── requirements-openapi.txt                      # Python dependencies for OpenAPI schema validation
│   └── validate_openapi.py                           # Automated OpenAPI 3.1.0 contract validator
├── CONTRIBUTIONS.md                                  # Individual member contributions & GitHub links
└── README.md                                         # Project overview and deliverable index
```

---

## 5. Validating the OpenAPI 3.1.0 Specification Locally

```bash
pip install -r tools/requirements-openapi.txt
python tools/validate_openapi.py
```

---

## 6. License
Licensed under the **Apache License, Version 2.0** (see rationale in [`docs/requirements/01-project-proposal.md`](docs/requirements/01-project-proposal.md)).
