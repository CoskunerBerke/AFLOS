# SENG 321 — Sprint 2 Deliverable 01-B: Refined Product Backlog & Release Plan

**Project Title:** AFLOS — Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) — Software Engineering Project, Fall 2026  
**Sprint:** Sprint 2 — Requirements Engineering, UI/UX Prototyping & Software Architecture  
**Role / Primary Author:** Product Owner & Requirements Engineer — **Kaan Kılınç (230204047)** ([`@kaanklnc`](https://github.com/kaanklnc))  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  
**Document Version:** 2.0.0 (Refined Sprint 2 Baseline)  
**Traceability Links:** 
- SRS Requirements: [`07-software-requirements-specification.md`](./07-software-requirements-specification.md)
- NFR Quality Measures: [`08-non-functional-requirements.md`](./08-non-functional-requirements.md)
- OpenAPI Specification: [`api/openapi.yaml`](../../api/openapi.yaml)
- UI/UX Specifications: [`09-user-flows-and-ui-spec.md`](./09-user-flows-and-ui-spec.md)

---

## 1. Executive Summary & Backlog Refinement Objectives

During the Sprint 2 backlog refinement process, the Product Owner (Kaan Kılınç), in consultation with the Lead Software Architects (Mirza Akgöz, Hüseyin Zor) and QA Engineer (Onur Şahin), refined the initial Sprint 1 backlog to establish:
1. **Mathematical Story Sizing (Fibonacci Scale):** Normalized relative effort estimation across domain complexity, backend database persistence, UI component rendering, and test automation.
2. **MoSCoW Release Prioritization:** Strict classification of stories into Must-Have (MVP), Should-Have (High Value), Could-Have (Nice to Have), and Won't-Have (Deferred to Post-MVP).
3. **Rigorous Gherkin Acceptance Criteria:** Every user story now incorporates positive (`200/201`), negative validation (`400`), unauthorized (`401/403`), and race-condition conflict (`409`) test scenarios.
4. **End-to-End Traceability Matrix:** Direct mapping connecting each User Story to its formal IEEE SRS requirement, ISO 25010 NFR metric, and OpenAPI 3.1.0 route.

---

## 2. Sprint Velocity and Release Burndown Target

* **Total Product Backlog Sized Effort:** **64 Story Points (SP)**
* **Sprint 1 (Completed):** 0 SP implementation (Foundation, Governance, Architecture Spikes)
* **Sprint 2 (Current Sprint - Planning & Specs):** Architecture baseline, OpenAPI 3.1.0 contract freeze, UI/UX Figma prototypes, and DB schema definition.
* **Sprint 3 Target Velocity (Core MVP Implementation):** **36 SP** (All 5 Must-Have stories)
* **Sprint 4 Target Velocity (Hardening, Telemetry & Integration):** **28 SP** (Should-Have stories, SMS fallback, chaos testing, and final release)

---

## 3. Refined Master Product Backlog Table

| Story ID | Epic | User Story Title | Target Persona | MoSCoW Priority | Estimate (SP) | SRS Requirement Mapping | OpenAPI 3.1.0 Path | Sprint Target |
|:---:|:---:|---|:---:|:---:|:---:|:---:|---|:---:|
| **US-01** | `EPIC-NEED` | Rapid Anonymous Need Reporting with Geospatial Coordinates | `PER-01` (Citizen) | **MUST** | **5 SP** | `REQ-FR-101`, `REQ-FR-102` | `POST /api/v1/need-requests` | **Sprint 3** |
| **US-02** | `EPIC-NEED` | Algorithmic Need Triage & Spatial Duplicate Clustering | `PER-04` (Coordinator) | **MUST** | **8 SP** | `REQ-FR-103`, `REQ-FR-104` | `GET /api/v1/need-requests` | **Sprint 3** |
| **US-03** | `EPIC-DASH` | Public Situational Map & Aggregated Aid KPI Dashboard | `PER-01` (Public) | **MUST** | **5 SP** | `REQ-FR-401` | `GET /api/v1/dashboard/summary` | **Sprint 3** |
| **US-04** | `EPIC-ZONE` | Aid Zone Creation with Time-Slots & Vehicle Quota Caps | `PER-04` (Coordinator) | **MUST** | **8 SP** | `REQ-FR-201`, `REQ-FR-204` | `POST /api/v1/aid-zones` | **Sprint 3** |
| **US-05** | `EPIC-CARR` | Carrier Self-Service Time-Slot Booking & Inventory Lock | `PER-02` (Carrier) | **MUST** | **8 SP** | `REQ-FR-301`, `REQ-FR-302` | `POST /api/v1/carrier-applications` | **Sprint 3** |
| **US-06** | `EPIC-WHSE` | Field Warehouse Mobile Barcode/QR Inventory Intake | `PER-03` (Warehouse) | **SHOULD** | **5 SP** | `REQ-FR-202`, `REQ-FR-203` | `POST /api/v1/inventory/items` | **Sprint 4** |
| **US-07** | `EPIC-CARR` | In-Transit Dispatch Transition & Live Telemetry Ingestion | `PER-02` (Carrier) | **SHOULD** | **5 SP** | `REQ-FR-303`, `REQ-FR-305` | `PATCH /api/v1/shipments/{id}/status` | **Sprint 4** |
| **US-08** | `EPIC-HAND` | Cryptographic Offline QR Delivery Handover Verification | `PER-02` / `PER-03` | **SHOULD** | **8 SP** | `REQ-FR-304`, `REQ-FR-405` | `POST /api/v1/handover/verify` | **Sprint 4** |
| **US-09** | `EPIC-RELAY`| Cellular Blackout SMS Gateway Fallback Ingestion | `PER-01` (Citizen) | **SHOULD** | **5 SP** | `REQ-FR-105` | `POST /api/v1/integrations/sms-webhook` | **Sprint 4** |
| **US-10** | `EPIC-AUDIT`| Immutable Governance Decision Logging & Audit Query | `PER-05` (Admin) | **MUST** | **3 SP** | `REQ-FR-403`, `REQ-FR-404` | `GET /api/v1/admin/audit-logs` | **Sprint 3** |
| **US-11** | `EPIC-ALERT`| Automated 20% Critical Inventory Deficit Warning Engine | `PER-04` (Coordinator) | **COULD** | **4 SP** | `REQ-FR-205`, `REQ-FR-402` | `GET /api/v1/inventory/alerts` | **Sprint 4** |

---

## 4. Refined User Stories with Full Acceptance Criteria

### US-01: Rapid Anonymous Need Reporting with Geospatial Coordinates
* **User Story:** As a disaster-affected citizen (`PER-01`), I want to submit an emergency aid request with my GPS coordinates and required item categories in under three clicks, so that emergency relief teams know our exact location without account creation delays.
* **Estimate:** 5 SP | **MoSCoW:** MUST | **Target Sprint:** Sprint 3
* **Acceptance Criteria (Gherkin):**
  * `Scenario 1 (Valid Submission with GPS):`
    * **Given** an unauthenticated citizen accesses the AFLOS mobile web client,
    * **When** device GPS provides coordinates (`lat: 36.2048`, `lng: 36.1582`) within Turkey borders, the citizen selects "Potable Water" and enters count `4`,
    * **Then** the system creates the need record with status `PENDING`, returns `HTTP 201 Created`, issues an 8-character token (e.g., `TRK-8492X`), and obfuscates the GPS coordinates by $\pm 500\text{ meters}$ on public APIs for KVKK privacy.
  * `Scenario 2 (Invalid Coordinate Bounds):`
    * **Given** a client submits coordinates outside Turkey (`lat: 48.8566`, `lng: 2.3522`),
    * **When** request validation middleware checks payload bounds,
    * **Then** the system rejects the submission with `HTTP 400 Bad Request` and error code `ERR_GEO_OUT_OF_BOUNDS`.

---

### US-02: Algorithmic Need Triage & Spatial Duplicate Clustering
* **User Story:** As an incident coordinator (`PER-04`), I want incoming aid requests to be automatically scored for urgency and clustered for duplicates within 50 meters, so that our team focuses on life-threatening needs without sorting duplicate entries.
* **Estimate:** 8 SP | **MoSCoW:** MUST | **Target Sprint:** Sprint 3
* **Acceptance Criteria (Gherkin):**
  * `Scenario 1 (Urgency Calculation with Vulnerable Demographics):`
    * **Given** a new need submission includes flags `infant_present=true` and `sub_zero_weather=true`,
    * **When** the triage scoring engine executes,
    * **Then** the urgency score is calculated as $\ge 8.5 / 10.0$ in $\le 50\text{ ms}$ and placed at the top of the coordinator triage queue.
  * `Scenario 2 (Spatial Duplicate Clustering):`
    * **Given** an existing need exists at coordinate point $P_1$,
    * **When** a second need is submitted within 50 meters of $P_1$ for the same category within 6 hours,
    * **Then** the system clusters the second need under the primary cluster ID, increments beneficiary head count, and marks `is_duplicate_cluster=true`.

---

### US-04: Aid Zone Creation with Time-Slots & Vehicle Quota Caps
* **User Story:** As an authorized disaster coordinator (`PER-04`), I want to establish an active Aid Zone with ISO 8601 scheduled arrival time slots and vehicle limits, so that incoming truck traffic is physically regulated and relief bottlenecks are averted.
* **Estimate:** 8 SP | **MoSCoW:** MUST | **Target Sprint:** Sprint 3
* **Acceptance Criteria (Gherkin):**
  * `Scenario 1 (Successful Zone and Slot Setup):`
    * **Given** an authenticated user with `COORDINATOR` role credentials,
    * **When** they post a valid aid zone with time slots (`startsAt: "2026-11-25T08:00:00+03:00"`, `endsAt: "2026-11-25T12:00:00+03:00"`, `maxVehicles: 5`),
    * **Then** the system persists the aid zone with status `ACTIVE` and returns `HTTP 201 Created`.
  * `Scenario 2 (Role Authorization Enforcement):`
    * **Given** an unauthenticated or `CARRIER` role user attempts to create a zone,
    * **When** RBAC security middleware validates permissions,
    * **Then** the request is blocked with `HTTP 403 Forbidden` and logged in the security audit trail.

---

### US-05: Carrier Self-Service Time-Slot Booking & Inventory Lock
* **User Story:** As a volunteer or commercial carrier (`PER-02`), I want to view open time-slots for an aid zone and book my arrival with one click, so that I have a guaranteed unloading window and my vehicle does not wait hours in gridlock.
* **Estimate:** 8 SP | **MoSCoW:** MUST | **Target Sprint:** Sprint 3
* **Acceptance Criteria (Gherkin):**
  * `Scenario 1 (Slot Booking and Quota Decrement):`
    * **Given** an active time slot has `availableQuota: 3`,
    * **When** an authenticated carrier books the slot with vehicle plate `31-K-4920`,
    * **Then** the available quota decrements to `2`, shipment status transitions to `CONFIRMED`, and a 6-character verification code is generated.
  * `Scenario 2 (Slot Quota Exhaustion Conflict):`
    * **Given** an active time slot has `availableQuota: 0`,
    * **When** a carrier attempts to book the exhausted slot,
    * **Then** the transaction is rejected with `HTTP 409 Conflict` and error code `ERR_SLOT_CAPACITY_EXCEEDED`.

---

### US-08: Cryptographic Offline QR Delivery Handover Verification
* **User Story:** As a carrier (`PER-02`) and receiving field supervisor (`PER-03`), we want to verify delivery handover by scanning a dynamic QR code without requiring live internet access, so that proof of delivery is mathematically non-repudiable even during total GSM blackouts.
* **Estimate:** 8 SP | **MoSCoW:** SHOULD | **Target Sprint:** Sprint 4
* **Acceptance Criteria (Gherkin):**
  * `Scenario 1 (Valid Offline Handover Verification):`
    * **Given** the carrier device has no active internet connection (GSM offline),
    * **When** the carrier scans the receiver's dynamic QR code containing an ECDSA signature of `[ShipmentId, Timestamp, ReceiverPubKey]`,
    * **Then** the mobile app validates the signature locally, records a cryptographically signed handover receipt in local IndexedDB/SQLite, transitions local status to `DELIVERED`, and queues an automated server sync event.
  * `Scenario 2 (Tampered or Expired QR Token):`
    * **Given** a QR code token whose timestamp is older than 30 minutes or whose cryptographic signature does not match the receiver public key,
    * **When** the carrier camera scans the code,
    * **Then** the application triggers an audio warning chime, displays a red error dialog `INVALID_HANDOVER_TOKEN`, and refuses delivery sign-off.

---

## 5. Definition of Ready (DoR) & Definition of Done (DoD)

### 5.1 Definition of Ready (DoR)
A backlog item is declared **Ready for Sprint Commitment** when:
1. **Persona Alignment:** User Story clearly identifies the target persona and operational humanitarian value.
2. **Gherkin Acceptance Scenarios:** Contains at least one positive scenario and one error/conflict boundary scenario (`400/403/409`).
3. **OpenAPI Path Mapped:** Associated endpoint and request/response schema are documented in `api/openapi.yaml`.
4. **Estimated & Sized:** Story points assigned using team consensus on the Fibonacci scale ($\le 8\text{ SP}$ per individual story).
5. **Architectural Traceability:** Mapped to an IEEE SRS requirement ID and ISO 25010 NFR metric.

### 5.2 Definition of Done (DoD)
A backlog item is declared **Done (Accepted into Increment)** when:
1. **Code Implementation:** Clean, linted code merged via Pull Request into `develop` following Git-Flow conventions.
2. **Test Automation:** Automated unit and integration tests passing with $\ge 80\%$ statement/branch coverage.
3. **OpenAPI Schema Strictness:** Request and response payloads validate with zero warnings against `api/openapi.yaml`.
4. **Peer Review:** Pull request reviewed and approved by at least one other team member.
5. **Documentation & Changelog:** API and user documentation updated; closing issue tagged (e.g., `Closes #US-01`).

---

## 6. Backlog Ownership and Approval Authority

* **Primary Author & Product Owner:** Kaan Kılınç ([`@kaanklnc`](https://github.com/kaanklnc))
* **Scrum Master:** Mustafa Çebin ([`@Noct-0`](https://github.com/Noct-0))
* **Lead Architects:** Mirza Akgöz ([`@akgozmirza`](https://github.com/akgozmirza)), Hüseyin Zor ([`@kurdoglu25`](https://github.com/kurdoglu25))
* **QA Test Automation Lead:** Onur Şahin ([`@clickOMorphism`](https://github.com/clickOMorphism))
