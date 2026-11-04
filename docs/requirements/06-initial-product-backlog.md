# SENG 321 – Sprint 1 Deliverable 6: Initial Product Backlog

**Project Title:** AFLOS – Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) – Software Engineering Project  
**Sprint:** Sprint 1 – Project Foundation & Team Operating Model  
**Role / Document Owner:** Product Owner and Requirements Engineer – **Kaan Kılınç (230204047)** (`@kaanklnc`)  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  
**Traceability Base:** Linked to [`01-project-proposal.md`](./01-project-proposal.md) and [`02-system-vision-and-boundary.md`](./02-system-vision-and-boundary.md)

---

## 1. Product Backlog Overview & Architectural Decision Alignment

Following collaborative architecture review with the Lead Architects, the AFLOS backlog adopts six core domain decisions to guarantee deterministic API contracts and eliminate ambiguous state behaviors:

1. **Direct Appointment Booking with Immediate Quota Locking:** Carrier slot booking operates on a self-service appointment model (similar to vehicle inspection or vaccination booking). An authenticated carrier booking an open slot immediately locks the quota and pledges goods, transitioning the shipment directly to `CONFIRMED` and generating the 6-character verification code (`AFL-XXXX`). Coordinators do not manually approve individual scheduled trucks; they manage exceptions (cancellations/rerouting) and directly dispatch empty vehicles from the Standby Fleet Pool.
2. **Unified 5-State Shipment Lifecycle:** The system enforces a strict finite state machine:
   $$\text{CONFIRMED} \longrightarrow \text{IN\_TRANSIT} \longrightarrow \text{DELIVERED}$$
   $$\text{CONFIRMED} \longrightarrow \text{CANCELLED} \quad \text{or} \quad \text{NO\_SHOW}$$
   *(Note: Emergency rerouting updates the destination `targetZoneId` without creating an ambiguous status).*
3. **Full ISO 8601 Timestamps & Overlapping Booking Rule:** Time slots define discrete intervals with explicit date and timezone (e.g., `2026-11-05T08:00:00+03:00` to `2026-11-05T12:00:00+03:00`). A vehicle license plate cannot hold multiple active bookings with overlapping time windows. However, once a shipment is `DELIVERED` or for a non-overlapping window, the vehicle may book a subsequent slot.
4. **Slot Capacity as Total Appointment Ceiling:** A time slot's vehicle quota (`maxVehicles`, e.g., 5 trucks) represents the **maximum total arrivals permitted** within that 4-hour window to protect road infrastructure. Physical delivery does **not** recycle or reopen the slot quota for new bookings. Quota is restored only upon `CANCELLED` or `NO_SHOW`.
5. **3-Tier Need Accounting & Multi-Item Partial Handover:** Each need line-item tracks:
   - $\text{requiredQuantity}$: Total coordinator need.
   - $\text{reservedQuantity}$: Pledged in `CONFIRMED` or `IN_TRANSIT` shipments.
   - $\text{deliveredQuantity}$: Physically handed over at the zone.
   - $\text{openDeficit} = \max(0, \text{requiredQuantity} - (\text{reservedQuantity} + \text{deliveredQuantity}))$.
   Deliveries accept an array of line items (`items: [{itemId, actualDeliveredQuantity}]`). Any undelivered pledged surplus automatically reverts to open deficit.
6. **Line-Item Progress Visibility & MVP Scope Trimming:** Progress is displayed per individual item rather than summing incompatible units (e.g., cases vs. kg). Advanced features (dynamic QR codes, automated ML trust scoring, native IoT GPS tracking) are deferred beyond MVP to ensure team delivery within 1 sprint cycles.

---

## 2. Definition of Ready (DoR) and Definition of Done (DoD)

### 2.1 Definition of Ready (DoR)
A backlog item is declared **Ready** for sprint commitment when:
1. **Explicit Role & Value:** Follows *"As a [Role], I want to [Capability], so that [Value]"*.
2. **Testable Gherkin Acceptance Criteria:** Contains at least 2 scenarios (`GIVEN - WHEN - THEN`) specifying normal path and domain errors (`400`, `401`, `403`, `409`).
3. **API & Data Mapping:** Associated OpenAPI endpoint, method, and schema references are identified.
4. **Sized & Estimated:** Sized using Fibonacci story points and verified to fit within one sprint.
5. **Clear Dependencies & Ownership:** Upstream story dependencies and assigned role owners are documented.

### 2.2 Definition of Done (DoD)
A backlog item is declared **Done** when:
1. **Automated Test Coverage:** Unit and integration tests pass with $\ge 50\%$ statement/branch coverage.
2. **OpenAPI Conformance:** Payloads strictly adhere to `api/openapi.yaml`.
3. **Peer Review:** Code approved by at least one teammate other than the author.
4. **CI Pipeline Pass:** GitHub Actions build, lint, and test pass with zero errors.
5. **Traceability:** Pull request references the closing issue (e.g., `Closes #US-03`).

---

## 3. Prioritized Product Backlog Summary Table

| Priority | Story ID | Epic | User Story Title | Target Role | Estimate (SP) | Target API Endpoint | Sprint Target |
|:---:|:---:|---|---|:---:|:---:|---|:---:|
| **1** | **US-01** | `EPIC-PUB` | Submit Regional Need Request with Line-Items | `REPORTER` | **5** | `POST /api/v1/need-requests` | **Sprint 2** |
| **2** | **US-02** | `EPIC-PUB` | View Real-Time Interactive Turkey Map & Line-Item KPIs | `PUBLIC` | **3** | `GET /api/v1/dashboard/summary` | **Sprint 2** |
| **3** | **US-03** | `EPIC-COORD` | Create Aid Zone with ISO 8601 Time Slots & Quotas | `COORDINATOR` | **8** | `POST /api/v1/aid-zones` | **Sprint 2** |
| **4** | **US-04** | `EPIC-COORD` | Configure Categorized Aid Item Deficits & Units | `COORDINATOR` | **5** | `POST /api/v1/aid-zones/{id}/needs` | **Sprint 2** |
| **5** | **US-05** | `EPIC-CARR` | Direct Appointment Slot Booking & Quota Lock | `CARRIER` | **8** | `POST /api/v1/carrier-applications` | **Sprint 2** |
| **6** | **US-06** | `EPIC-CARR` | Transition Shipment to In-Transit with Verification Code | `CARRIER` | **3** | `PATCH /api/v1/shipments/{id}/status` | **Sprint 3** |
| **7** | **US-07** | `EPIC-FIELD` | Execute Two-Factor Handover Verification on Drop-Off | `FIELD_STAFF` | **8** | `POST /api/v1/handover/verify` | **Sprint 3** |
| **8** | **US-08** | `EPIC-COORD` | Coordinator Central Offline Fallback Handover | `COORDINATOR` | **5** | `POST /api/v1/handover/fallback` | **Sprint 3** |
| **9** | **US-09** | `EPIC-CARR` | Register Standby Vehicle into Regional Fleet Pool | `CARRIER` | **3** | `POST /api/v1/standby-fleet` | **Sprint 3** |
| **10** | **US-10** | `EPIC-ADMIN` | Query Immutable System Audit Log & Governance Audit | `ADMIN` | **3** | `GET /api/v1/admin/audit-logs` | **Sprint 3** |

- **Total Backlog Story Points:** **51 SP**
- **Sprint 2 Target Velocity (Top 5 Priority Stories):** **29 SP**
- **Sprint 3 Target Velocity (Remaining 5 Stories + Hardening):** **22 SP**

---

## 4. Granular User Story Specifications & Acceptance Criteria

### US-01: Submit Regional Need Request with Line-Items
- **Story Statement:**  
  *As an* affected citizen or local representative (`REPORTER`),  
  *I want to* submit a regional aid need request with geo-coordinates, disaster type, and categorized line items,  
  *so that* disaster coordinators can verify our urgent shortages without manual spreadsheet duplication.
- **Priority:** 1 (High) | **Estimate:** 5 Story Points | **Assigned Role:** Implementation Engineer
- **Dependencies:** None
- **API Reference:** `POST /api/v1/need-requests`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Valid Submission Quarantined):**  
    `GIVEN` a public user opens the need reporting web interface,  
    `WHEN` they input valid coordinates (Turkey bounds: lat `35.9-42.1`, lng `25.6-44.8`), disaster type (`EARTHQUAKE`), at least one item line (`category="WATER_BEVERAGE"`, `unit="CASE"`, `quantity=100`), and a valid contact phone number,  
    `THEN` the system records the request with status `PENDING_VERIFICATION`, returns `HTTP 201 Created`, and masks reporter personal data (KVKK compliance) from all public dashboard endpoints.
  - **Scenario 2 (Invalid Geographic Coordinates):**  
    `GIVEN` a user submits a need request outside Turkish geographic borders (e.g., lat `52.5`, lng `13.4`),  
    `WHEN` schema validation runs,  
    `THEN` the system rejects the submission with `HTTP 400 Bad Request` specifying coordinate boundary validation failure.

---

### US-02: View Real-Time Interactive Turkey Map & Line-Item KPIs
- **Story Statement:**  
  *As a* public visitor or donor (`PUBLIC`),  
  *I want to* view an interactive Turkey map displaying active aid zones and line-item fulfillment progress,  
  *so that* I have transparent situational awareness of relief operations and verified supply deficits.
- **Priority:** 2 (High) | **Estimate:** 3 Story Points | **Assigned Role:** Implementation Engineer
- **Dependencies:** US-01, US-03
- **API Reference:** `GET /api/v1/dashboard/summary`, `GET /api/v1/aid-zones`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Cached Public KPI Aggregation):**  
    `GIVEN` the public dashboard endpoint is queried,  
    `WHEN` the request arrives at the API gateway,  
    `THEN` the system returns `HTTP 200 OK` containing aggregated integers for `activeZonesCount`, `inTransitVehiclesCount`, `deliveredShipmentsCount`, and per-item fulfillment percentages, cached via HTTP cache headers (15-second TTL) to protect against DDoS traffic spikes.
  - **Scenario 2 (Map Pin Filtering by Disaster Type):**  
    `GIVEN` a visitor applies the map filter `disasterType=WILDFIRE`,  
    `WHEN` the Leaflet map updates,  
    `THEN` only active zones mapped to `WILDFIRE` are rendered with color-coded status pins.

---

### US-03: Create Aid Zone with ISO 8601 Time Slots & Quotas
- **Story Statement:**  
  *As an* authorized Disaster Coordinator (`COORDINATOR`),  
  *I want to* create an active Aid Zone on the map with geographic coordinates, disaster type, and ISO 8601 scheduled time-slots with vehicle quotas,  
  *so that* drop-off traffic is mathematically regulated and physical road gridlock is prevented.
- **Priority:** 3 (High) | **Estimate:** 8 Story Points | **Assigned Role:** Implementation Engineer
- **Dependencies:** None
- **API Reference:** `POST /api/v1/aid-zones`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Successful Zone and Slot Initialization):**  
    `GIVEN` an authenticated user with `COORDINATOR` role credentials,  
    `WHEN` they submit a payload with `zoneName="Hatay Antakya Spor Salonu"`, `lat=36.20`, `lng=36.16`, `disasterType="EARTHQUAKE"`, and time slots containing full ISO 8601 strings (e.g. `startsAt="2026-11-05T08:00:00+03:00"`, `endsAt="2026-11-05T12:00:00+03:00"`, `maxVehicles=5`, `allowedVehicleTypes=["TRUCK_TIR", "LORRY"]`),  
    `THEN` the system creates the zone in `ACTIVE` state, stores the time slots, and returns `HTTP 201 Created`.
  - **Scenario 2 (Missing or Invalid Authentication):**  
    `GIVEN` an unauthenticated visitor calling `POST /api/v1/aid-zones` without a Bearer token,  
    `WHEN` authentication middleware validates the request,  
    `THEN` the system returns `HTTP 401 Unauthorized`.
  - **Scenario 3 (Insufficient Role Privileges):**  
    `GIVEN` an authenticated user with `CARRIER` role attempting to create an aid zone,  
    `WHEN` authorization check validates role permissions,  
    `THEN` the system rejects the operation with `HTTP 403 Forbidden`.

---

### US-04: Configure Categorized Aid Item Deficits & Units
- **Story Statement:**  
  *As an* authorized Disaster Coordinator (`COORDINATOR`),  
  *I want to* enter specific required line items under standardized categories and units for an aid zone,  
  *so that* incoming shipments address real shortages rather than surplus goods.
- **Priority:** 4 (High) | **Estimate:** 5 Story Points | **Assigned Role:** Implementation Engineer
- **Dependencies:** US-03
- **API Reference:** `POST /api/v1/aid-zones/{zoneId}/needs`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Valid Line-Item Need Addition):**  
    `GIVEN` an existing active Aid Zone,  
    `WHEN` a Coordinator appends line items specifying `category="FOOD_NUTRITION"`, `itemName="Baby Food / Bebek Maması"`, `requiredQuantity=500`, and `unit="BOX"`,  
    `THEN` the system stores the item record with `remainingQuantity=500`, `reservedQuantity=0`, `deliveredQuantity=0`, and returns `HTTP 201 Created`.
  - **Scenario 2 (Invalid Unit or Non-Standard Category):**  
    `GIVEN` a request containing an unlisted category string or free-text unit outside the master list (`CASE`, `PIECE`, `BOX`, `PALLET`, `KG`),  
    `WHEN` schema validation runs,  
    `THEN` the system returns `HTTP 400 Bad Request` with explicit validation errors.

---

### US-05: Direct Appointment Slot Booking & Quota Lock
- **Story Statement:**  
  *As a* volunteer vehicle owner or logistics carrier (`CARRIER`),  
  *I want to* select an open time-slot, pledge goods within open deficit limits, and receive an instant booking confirmation,  
  *so that* my delivery appointment is guaranteed without waiting for manual coordinator triage.
- **Priority:** 5 (High) | **Estimate:** 8 Story Points | **Assigned Role:** Implementation Engineer
- **Dependencies:** US-03, US-04
- **API Reference:** `POST /api/v1/carrier-applications`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Successful Reservation & Immediate Lock):**  
    `GIVEN` a time slot with `maxVehicles=5` and `assignedVehicles=2`,  
    `WHEN` an authenticated Carrier submits license plate `34 ABC 123`, vehicle type `TRUCK_TIR`, and pledged goods within open deficit limits,  
    `THEN` the database atomically increments `assignedVehicles` to `3`, transitions shipment directly to `CONFIRMED`, generates a unique alphanumeric verification code (`AFL-XXXX`), increments `reservedQuantity` for the pledged items, and returns `HTTP 201 Created`.
  - **Scenario 2 (Atomic Conflict on Overcapacity):**  
    `GIVEN` a time slot with only 1 vehicle capacity remaining,  
    `WHEN` two carriers simultaneously submit reservations for the same slot,  
    `THEN` database row-level locking ensures the first succeeds with `201 Created` and the second fails deterministically with `HTTP 409 Conflict` (`SLOT_FULL`).
  - **Scenario 3 (Overlapping Interval Conflict for Same Plate):**  
    `GIVEN` license plate `34 ABC 123` already has an active, non-delivered booking whose time interval overlaps with the requested slot,  
    `WHEN` another reservation is submitted for that overlapping window,  
    `THEN` the system blocks the booking with `HTTP 409 Conflict` (`VEHICLE_OVERLAPPING_BOOKING`).

---

### US-06: Transition Shipment to In-Transit with Verification Code
- **Story Statement:**  
  *As a* scheduled Carrier (`CARRIER`),  
  *I want to* mark my vehicle as departed (`IN_TRANSIT`) and access my handover verification code,  
  *so that* coordinators track incoming transit volumes and on-site staff can verify my arrival.
- **Priority:** 6 (Medium) | **Estimate:** 3 Story Points | **Assigned Role:** Implementation Engineer
- **Dependencies:** US-05
- **API Reference:** `PATCH /api/v1/shipments/{id}/status`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Valid Departure Transition):**  
    `GIVEN` a Carrier with a `CONFIRMED` shipment,  
    `WHEN` the carrier submits status transition `IN_TRANSIT`,  
    `THEN` the shipment status updates to `IN_TRANSIT`, national KPI `inTransitVehiclesCount` increments, and the driver mobile view displays the 6-character verification code (`AFL-7492`).
  - **Scenario 2 (Unauthorized Carrier Transition):**  
    `GIVEN` a Carrier attempting to update another carrier's shipment,  
    `WHEN` authorization check validates JWT token subject,  
    `THEN` the system returns `HTTP 403 Forbidden`.

---

### US-07: Execute Two-Factor Handover Verification on Drop-Off
- **Story Statement:**  
  *As an* on-site Field Staff member (`FIELD_STAFF`),  
  *I want to* verify an arriving vehicle by matching its license plate and verification code, and record actual received quantities per item,  
  *so that* delivery is authenticated and inventory discrepancies are audited.
- **Priority:** 7 (High) | **Estimate:** 8 Story Points | **Assigned Role:** Implementation Engineer
- **Dependencies:** US-05, US-06
- **API Reference:** `POST /api/v1/handover/verify`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Successful Handover with Multi-Item Partial Delivery):**  
    `GIVEN` an approved Field Staff assigned to `zoneId="Z-101"`,  
    `WHEN` an arriving truck with plate `34 ABC 123` provides verification code `AFL-7492`, and field staff inputs actual delivered quantities (`items: [{itemId: "ITEM-1", actualDeliveredQuantity: 90}]` where pledged was 100),  
    `THEN` the system verifies plate and code, updates shipment status to `DELIVERED`, updates inventory (`deliveredQuantity += 90`, `reservedQuantity -= 100`), returns the 10 unfulfilled units to `openDeficit`, records an audit log, and returns `HTTP 200 OK`. *(Slot quota remains consumed as appointment ceiling).*
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
- **Priority:** 8 (Medium) | **Estimate:** 5 Story Points | **Assigned Role:** Implementation Engineer
- **Dependencies:** US-06, US-07
- **API Reference:** `POST /api/v1/handover/fallback`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Offline Radio Liaison Fallback Confirmation):**  
    `GIVEN` an `IN_TRANSIT` shipment whose destination drop-off point has zero cellular/internet coverage,  
    `WHEN` the central Coordinator receives radio/satellite confirmation and triggers fallback handover with mandatory `fallbackReason="Field telecom blackout confirmed via AFAD VHF radio"`,  
    `THEN` the system updates status to `DELIVERED`, reconciles delivered quantities, records the Coordinator's ID and timestamp in the immutable audit log, and returns `HTTP 200 OK`.

---

### US-09: Register Standby Vehicle into Regional Fleet Pool
- **Story Statement:**  
  *As an* empty vehicle owner (`CARRIER`),  
  *I want to* register my vehicle into a regional standby pool without pre-booking a specific zone,  
  *so that* coordinators can assign my vehicle to sudden emergency evacuation or priority supply routes.
- **Priority:** 9 (Low) | **Estimate:** 3 Story Points | **Assigned Role:** Implementation Engineer
- **Dependencies:** None
- **API Reference:** `POST /api/v1/standby-fleet`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Standby Pool Enrollment):**  
    `GIVEN` an authenticated carrier with an empty vehicle,  
    `WHEN` they submit plate, vehicle capacity, current location, and availability dates,  
    `THEN` the system records vehicle state as `STANDBY_AVAILABLE` for coordinator direct route assignment.

---

### US-10: Query Immutable System Audit Log & Governance Audit
- **Story Statement:**  
  *As a* System Administrator (`ADMIN`),  
  *I want to* filter and inspect immutable system audit logs of all status transitions, approvals, and fallback actions,  
  *so that* relief distribution operations maintain full legal and organizational accountability.
- **Priority:** 10 (Low) | **Estimate:** 3 Story Points | **Assigned Role:** Implementation Engineer
- **Dependencies:** US-03, US-05, US-07, US-08
- **API Reference:** `GET /api/v1/admin/audit-logs`
- **Acceptance Criteria (Gherkin):**
  - **Scenario 1 (Admin Audit Trail Query):**  
    `GIVEN` an authenticated user with `ADMIN` role token,  
    `WHEN` querying `/api/v1/admin/audit-logs?action=HANDOVER_FALLBACK`,  
    `THEN` the system returns an ordered chronological list of audit records including actor ID, entity ID, before/after states, timestamp, and IP address.
