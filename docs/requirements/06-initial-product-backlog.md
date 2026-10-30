# SENG 321 – Sprint 1 Deliverable 6: Initial Product Backlog

**Project Title:** AFLOS – Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) – Software Engineering Project  
**Sprint:** Sprint 1 – Project Foundation & Team Operating Model  
**Role / Document Owner:** Product Owner and Requirements Engineer – **Kaan Kılınç (230204047)** (`@kaanklnc`)  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  
**Traceability Base:** Linked to [`01-project-proposal.md`](file:///Users/kaankilinc/Documents/AFLOS/docs/requirements/01-project-proposal.md) and [`02-system-vision-and-boundary.md`](file:///Users/kaankilinc/Documents/AFLOS/docs/requirements/02-system-vision-and-boundary.md)

---

## 1. Product Backlog Overview & Architecture Alignment

The AFLOS Product Backlog translates the System Vision and System Boundary specifications into prioritized, testable **User Stories** for Sprint 2 and Sprint 3 implementation. Every story adheres strictly to the **API-First contract principles** established in Sprint 1, explicitly naming target API operations, domain validation rules (such as `409 Conflict` on concurrent capacity booking), and role-based security scopes (`403 Forbidden`).

### 1.1 Backlog Structure Hierarchy
```
Epic (High-Level Operational Capability)
  └── Feature (Functional Subsystem)
        └── User Story (Testable Unit with Gherkin Acceptance Criteria)
              └── Technical Tasks (DevOps, Schema Migrations, API Endpoints, QA Automation)
```

---

## 2. Definition of Ready (DoR) and Definition of Done (DoD)

### 2.1 Definition of Ready (DoR)
A backlog item is declared **Ready** for sprint commitment when:
1. **Clear Actor & Business Value:** The user story follows the strict *"As a... I want to... So that..."* format.
2. **Explicit Acceptance Criteria:** Contains at least 2 testable acceptance criteria written in Gherkin (`GIVEN - WHEN - THEN`) syntax covering both happy paths and domain exception paths.
3. **API & Data Mapping:** The associated OpenAPI endpoint path, HTTP method, and payload schemas are referenced.
4. **Feasibility & Size:** The story is estimated using Fibonacci Story Points and sized to complete within a single sprint.
5. **No Blockers:** Technical dependencies and external service assumptions (e.g., Leaflet mapping, JWT auth) are resolved.

### 2.2 Definition of Done (DoD)
A backlog item is declared **Done** when:
1. **Automated Unit & Integration Tests:** Implemented code passes automated tests with $\ge 50\%$ branch/statement coverage.
2. **OpenAPI Conformance:** Request/response payloads validate against `api/openapi.yaml` without deviations.
3. **Peer Review:** Pull request is approved by at least one teammate other than the author.
4. **CI Pipeline Pass:** GitHub Actions build, linting, and tests execute with green status.
5. **Traceability:** The PR explicitly references the closing issue (e.g., `Closes #US-03`).

---

## 3. Prioritized Product Backlog Summary Table

| Priority | Story ID | Epic | User Story Title | Target Role | Estimate (SP) | Target API Endpoint |
|:---:|:---:|---|---|:---:|:---:|---|
| **1** | **US-01** | `EPIC-PUB` | Submit Regional Need Request with Line-Items | `REPORTER` | **5** | `POST /api/v1/need-requests` |
| **2** | **US-02** | `EPIC-PUB` | View Real-Time Interactive Turkey Map & Live KPIs | `PUBLIC` | **3** | `GET /api/v1/dashboard/summary` |
| **3** | **US-03** | `EPIC-COORD` | Create Aid Zone with Scheduled Time Slots & Quotas | `COORDINATOR` | **8** | `POST /api/v1/aid-zones` |
| **4** | **US-04** | `EPIC-COORD` | Configure Categorized Aid Item Deficits & Units | `COORDINATOR` | **5** | `POST /api/v1/aid-zones/{id}/needs` |
| **5** | **US-05** | `EPIC-CARR` | Register License Plate & Book Reserved Time Slot | `CARRIER` | **8** | `POST /api/v1/carrier-applications` |
| **6** | **US-06** | `EPIC-CARR` | Transition Shipment to In-Transit with Verification Code | `CARRIER` | **3** | `PATCH /api/v1/shipments/{id}/status` |
| **7** | **US-07** | `EPIC-FIELD` | Execute Two-Factor Handover Verification on Drop-Off | `FIELD_STAFF` | **8** | `POST /api/v1/handover/verify` |
| **8** | **US-08** | `EPIC-COORD` | Coordinator Central Offline Fallback Handover | `COORDINATOR` | **5** | `POST /api/v1/handover/fallback` |
| **9** | **US-09** | `EPIC-CARR` | Register Standby Vehicle into Regional Fleet Pool | `CARRIER` | **3** | `POST /api/v1/standby-fleet` |
| **10** | **US-10** | `EPIC-ADMIN` | Query Immutable System Audit Log & Governance Audit | `ADMIN` | **3** | `GET /api/v1/admin/audit-logs` |

**Total Initial Story Points:** 51 SP  
**Sprint 2 Target Velocity:** ~26 SP (Top 5 Priority Stories)  
**Sprint 3 Target Velocity:** ~25 SP (Stories 6 to 10 + Hardening)

---

## 4. Granular User Story Specifications & Acceptance Criteria

### US-01: Submit Regional Need Request with Line-Items
- **Story Statement:**  
  *As an* affected citizen or local representative (`REPORTER`),  
  *I want to* submit a regional aid need request with geo-coordinates, disaster type, and categorized line items,  
  *so that* disaster coordinators can verify our urgent shortages without manual spreadsheet duplication.
- **Priority:** 1 (High) | **Estimate:** 5 Story Points
- **API Reference:** `POST /api/v1/need-requests`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Valid Submission Quarantined):**  
    `GIVEN` a public user opens the need reporting web interface,  
    `WHEN` they input valid coordinates (Turkey bounds: lat `35.9-42.1`, lng `25.6-44.8`), disaster type (`EARTHQUAKE`), at least one item line (`WATER_BEVERAGE`, `CASE`, quantity `100`), and a contact phone number,  
    `THEN` the system records the request with status `PENDING_VERIFICATION`, returns `HTTP 201 Created`, and masks reporter personal data (KVKK compliance) from all public dashboard endpoints.
  - **Scenario 2 (Invalid Coordinates or Missing Category):**  
    `GIVEN` a user submits a need request outside Turkish geographic borders or without a mandatory Master Aid Category,  
    `WHEN` the payload is validated,  
    `THEN` the system rejects the submission with `HTTP 400 Bad Request` specifying the failed field constraints.

---

### US-02: View Real-Time Interactive Turkey Map & Live KPIs
- **Story Statement:**  
  *As a* public visitor or donor (`PUBLIC`),  
  *I want to* view an interactive Turkey map displaying active aid zones and national KPI summary cards,  
  *so that* I have transparent situational awareness of relief operations and verified supply deficits.
- **Priority:** 2 (High) | **Estimate:** 3 Story Points
- **API Reference:** `GET /api/v1/dashboard/summary`, `GET /api/v1/aid-zones`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Cached Public KPI Aggregation):**  
    `GIVEN` the public dashboard endpoint is queried,  
    `WHEN` the request arrives at the API gateway,  
    `THEN` the system returns `HTTP 200 OK` containing aggregated integers for `activeZonesCount`, `inTransitVehiclesCount`, `deliveredShipmentsCount`, and category-level progress ratios, cached via HTTP cache headers (15-second TTL) to protect against DDoS traffic spikes.
  - **Scenario 2 (Map Pin Filtering by Disaster Type):**  
    `GIVEN` a visitor applies the map filter `disasterType=WILDFIRE`,  
    `WHEN` the Leaflet map updates,  
    `THEN` only active zones mapped to `WILDFIRE` are rendered with color-coded status pins.

---

### US-03: Create Aid Zone with Scheduled Time Slots & Quotas
- **Story Statement:**  
  *As an* authorized Disaster Coordinator (`COORDINATOR`),  
  *I want to* create an active Aid Zone on the map with geographic coordinates, disaster type, and scheduled time-slots with vehicle quotas,  
  *so that* drop-off traffic is mathematically regulated and physical road gridlock is prevented.
- **Priority:** 3 (High) | **Estimate:** 8 Story Points
- **API Reference:** `POST /api/v1/aid-zones`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Successful Zone and Slot Initialization):**  
    `GIVEN` an authenticated user with `COORDINATOR` role credentials,  
    `WHEN` they submit a payload with `zoneName="Hatay Antakya Spor Salonu"`, `lat=36.20`, `lng=36.16`, `disasterType="EARTHQUAKE"`, and time slots (e.g. `startsAt="08:00"`, `endsAt="12:00"`, `maxVehicles=5`, `allowedVehicleTypes=["TRUCK_TIR", "LORRY"]`),  
    `THEN` the system creates the zone in `ACTIVE` state, stores the time slots, and returns `HTTP 201 Created`.
  - **Scenario 2 (Unauthorized Non-Coordinator Attempt):**  
    `GIVEN` an unauthenticated visitor or `CARRIER` token attempting to call `POST /api/v1/aid-zones`,  
    `WHEN` the request is intercepted by the RBAC middleware,  
    `THEN` the system rejects the operation with `HTTP 403 Forbidden`.

---

### US-04: Configure Categorized Aid Item Deficits & Units
- **Story Statement:**  
  *As an* authorized Disaster Coordinator (`COORDINATOR`),  
  *I want to* enter specific required line items under standardized categories and units for an aid zone,  
  *so that* incoming shipments address real shortages rather than surplus goods.
- **Priority:** 4 (High) | **Estimate:** 5 Story Points
- **API Reference:** `POST /api/v1/aid-zones/{zoneId}/needs`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Valid Line-Item Need Addition):**  
    `GIVEN` an existing active Aid Zone,  
    `WHEN` a Coordinator appends line items specifying `category="FOOD_NUTRITION"`, `itemName="Baby Food / Bebek Maması"`, `requiredQuantity=500`, and `unit="BOX"`,  
    `THEN` the system stores the item record with `remainingQuantity=500` and recalculates the zone fulfillment progress.
  - **Scenario 2 (Invalid Unit or Non-Standard Category):**  
    `GIVEN` a request containing an unlisted category string or free-text unit outside the master list (`CASE`, `PIECE`, `BOX`, `PALLET`, `KG`),  
    `WHEN` schema validation runs,  
    `THEN` the system returns `HTTP 422 Unprocessable Entity` with explicit enum validation errors.

---

### US-05: Register License Plate & Book Reserved Time Slot
- **Story Statement:**  
  *As a* volunteer vehicle owner or logistics carrier (`CARRIER`),  
  *I want to* register my vehicle license plate and book an available time slot at an aid zone,  
  *so that* my cargo delivery is officially scheduled and guaranteed an unloading window.
- **Priority:** 5 (High) | **Estimate:** 8 Story Points
- **API Reference:** `POST /api/v1/carrier-applications`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Successful Reservation & Quota Decrement):**  
    `GIVEN` a time slot with `maxVehicles=5` and `assignedVehicles=2`,  
    `WHEN` an authenticated Carrier submits plate `34 ABC 123`, vehicle type `TRUCK_TIR`, and pledged goods within remaining deficit limits,  
    `THEN` the system increments `assignedVehicles` to `3`, creates the shipment in `CONFIRMED` status, generates a unique cryptographic verification token (`AFL-XXXX`), and returns `HTTP 201 Created`.
  - **Scenario 2 (Atomic Conflict on Overcapacity - Race Condition):**  
    `GIVEN` a time slot with only 1 vehicle capacity remaining,  
    `WHEN` two carriers simultaneously submit reservations for the same slot,  
    `THEN` the database row-level lock ensures the first succeeds with `201 Created` and the second fails deterministically with `HTTP 409 Conflict` (`SLOT_FULL`).
  - **Scenario 3 (Duplicate Plate Overlap):**  
    `GIVEN` license plate `34 ABC 123` already has an active, non-delivered booking for that date,  
    `WHEN` another application is submitted with the identical plate,  
    `THEN` the system blocks the booking with `HTTP 409 Conflict` (`VEHICLE_ALREADY_ASSIGNED`).

---

### US-06: Transition Shipment to In-Transit with Verification Code
- **Story Statement:**  
  *As a* scheduled Carrier (`CARRIER`),  
  *I want to* mark my vehicle as departed (`IN_TRANSIT`) and access my handover verification code,  
  *so that* coordinators track incoming transit volumes and on-site staff can verify my arrival.
- **Priority:** 6 (Medium) | **Estimate:** 3 Story Points
- **API Reference:** `PATCH /api/v1/shipments/{id}/status`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Valid Departure Transition):**  
    `GIVEN` a Carrier with a `CONFIRMED` shipment,  
    `WHEN` the carrier triggers the departure action,  
    `THEN` the shipment status updates to `IN_TRANSIT`, national KPI `inTransitQuantity` increments, and the driver mobile view displays the alphanumeric verification code (`AFL-7492`) and dynamic QR.
  - **Scenario 2 (Unauthorized Carrier Transition):**  
    `GIVEN` a Carrier attempting to update another carrier's shipment,  
    `WHEN` authorization check validates JWT token subject,  
    `THEN` the system returns `HTTP 403 Forbidden`.

---

### US-07: Execute Two-Factor Handover Verification on Drop-Off
- **Story Statement:**  
  *As an* on-site Field Staff member (`FIELD_STAFF`),  
  *I want to* verify an arriving vehicle by matching its license plate and cryptographic verification code,  
  *so that* delivery is authenticated and actual received quantities are audited.
- **Priority:** 7 (High) | **Estimate:** 8 Story Points
- **API Reference:** `POST /api/v1/handover/verify`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Successful 2FA Handover with Partial Quantity):**  
    `GIVEN` an approved Field Staff assigned to `zoneId="Z-101"`,  
    `WHEN` an arriving truck with plate `34 ABC 123` provides verification code `AFL-7492`, and field staff inputs `actualDeliveredQuantity=90` (pledged was 100),  
    `THEN` the system validates both plate and code, records shipment status `DELIVERED`, deducts 90 units from remaining zone deficits, frees the time-slot vehicle capacity, logs an audit entry, and returns `HTTP 200 OK`.
  - **Scenario 2 (Zone Boundary Violation):**  
    `GIVEN` a Field Staff assigned to zone `Z-101` attempting to verify a delivery at zone `Z-202`,  
    `WHEN` the handover endpoint evaluates user scope,  
    `THEN` the system blocks the action with `HTTP 403 Forbidden` (`ZONE_OUT_OF_SCOPE`).

---

### US-08: Coordinator Central Offline Fallback Handover
- **Story Statement:**  
  *As a* Disaster Coordinator (`COORDINATOR`),  
  *I want to* execute a central fallback delivery confirmation on behalf of field staff when disaster-zone telecommunications fail,  
  *so that* system records remain accurate even during total local network outages.
- **Priority:** 8 (Medium) | **Estimate:** 5 Story Points
- **API Reference:** `POST /api/v1/handover/fallback`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Offline Radio Liaison Fallback Confirmation):**  
    `GIVEN` an `IN_TRANSIT` shipment whose destination drop-off point has zero cellular/internet coverage,  
    `WHEN` the central Coordinator receives radio/satellite confirmation and triggers fallback handover with mandatory `fallbackReason="Field telecom blackout confirmed via AFAD VHF radio"`,  
    `THEN` the system updates status to `DELIVERED`, records the Coordinator's ID and timestamp in the audit log, and returns `HTTP 200 OK`.

---

### US-09: Register Standby Vehicle into Regional Fleet Pool
- **Story Statement:**  
  *As an* empty vehicle owner (`CARRIER`),  
  *I want to* register my vehicle into a regional standby pool without pre-booking a specific zone,  
  *so that* coordinators can assign my vehicle to sudden emergency evacuation or priority supply routes.
- **Priority:** 9 (Low) | **Estimate:** 3 Story Points
- **API Reference:** `POST /api/v1/standby-fleet`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Standby Pool Enrollment):**  
    `GIVEN` a carrier with an empty vehicle,  
    `WHEN` they submit plate, capacity, current city, and standby availability dates,  
    `THEN` the system marks vehicle state as `STANDBY_AVAILABLE` for direct coordinator dispatch.

---

### US-10: Query Immutable System Audit Log & Governance Audit
- **Story Statement:**  
  *As a* System Administrator (`ADMIN`),  
  *I want to* filter and inspect immutable system audit logs of all status transitions, approvals, and fallback actions,  
  *so that* relief distribution operations maintain full legal and organizational accountability.
- **Priority:** 10 (Low) | **Estimate:** 3 Story Points
- **API Reference:** `GET /api/v1/admin/audit-logs`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Admin Audit Trail Query):**  
    `GIVEN` an authenticated user with `ADMIN` role,  
    `WHEN` querying `/api/v1/admin/audit-logs?action=HANDOVER_FALLBACK`,  
    `THEN` the system returns an ordered chronological list of audit records including actor ID, entity ID, before/after states, timestamp, and IP address.
