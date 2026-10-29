# SENG 321 – Sprint 1 Deliverable 1: Project Proposal

**Project Title:** AFLOS – Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) – Software Engineering Project  
**Sprint:** Sprint 1 – Project Foundation & Team Operating Model  
**Role / Document Owner:** Product Owner and Requirements Engineer – **Kaan Kılınç (230204047)** (`@kaanklnc`)  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  

---

## 1. Problem Statement and Supporting Evidence

### 1.1 Observed Situation and Operational Context
In the immediate aftermath of large-scale disasters—such as **earthquakes (`EARTHQUAKE`), floods (`FLOOD`), wildfires (`WILDFIRE`), landslides/avalanches (`LANDSLIDE_AVALANCHE`), or humanitarian/conflict crises (`CONFLICT_HUMANITARIAN`)**—hundreds of volunteer trucks, commercial logistics fleets, and individual vehicles mobilize across Turkey to deliver emergency relief supplies (drinking water, biscuits/dry food, blankets, tents, winter clothing, hygiene kits, and medical supplies).

Despite high civic and institutional mobilization, post-disaster logistics consistently suffer from five critical coordination failures:

1. **Asymmetric Aid Distribution (Over-Supply vs. Deprivation):** Without a live, centralized geographic view of verified regional needs, popular or easily accessible locations often receive ten trucks of drinking water while lacking basic shelter (blankets and tents), whereas harder-to-reach neighborhoods or villages receive no aid at all.
2. **Severe Traffic Bottlenecks at Drop-off Zones:** Volunteer truck drivers and civilian vehicles depart simultaneously without scheduled arrival windows (**Time Slots**). When dozens of heavy semi-trailer trucks (*Tır*) arrive at narrow disaster-zone streets at the same hour, roads become gridlocked—blocking both aid unloading and emergency search-and-rescue ambulances.
3. **Lack of License Plate and Cargo Traceability:** Ad-hoc tracking via spreadsheets, phone calls, or messaging groups (WhatsApp/Telegram) fails to connect **which vehicle (by license plate, e.g., `34 ABC 123`)** is carrying **what exact item quantities**, **which time slot** it is assigned to, whether it is currently **in transit (`IN_TRANSIT`)**, and whether the cargo was physically **handed over on-site (`DELIVERED`)**.
4. **Unstructured Need Reporting & Uncoordinated Volunteer Onboarding:** Citizens/local representatives (*Muhtars*) lack a structured portal to report categorized item needs; truck owners with either ready cargo or empty available trucks lack a unified dispatch application portal; and field volunteers have no structured shift-application mechanism.
5. **Telecommunication & Internet Blackouts in the Disaster Epicenter:** Major earthquakes frequently destroy local cellular towers and internet access. Systems that rely solely on affected citizens filling out web forms fail in practice. Therefore, a resilient platform must allow **authorized Disaster Coordinators** (in constant radio, satellite, or phone communication with official agencies such as AFAD, municipalities, Kızılay, and search-and-rescue teams) to open aid zones, input categorized needs, and perform fallback delivery confirmations directly from unaffected command centers.

### 1.2 Current Harm and Measurable Baseline
| Problem Dimension | Observed Baseline in Uncoordinated Relief | Operational Consequence |
|---|---|---|
| **Supply-Need Mismatch** | 30%–40% of spontaneous initial shipments do not match the urgent category priorities of the destination zone. | Critical shortages of shelter/medical items alongside wasted surplus of unrequested goods. |
| **Unscheduled Truck Arrivals** | Multiple heavy trucks arriving within the same hour at a single distribution school/camp. | Multi-hour unloading queues and road congestion in critical disaster corridors. |
| **Data Fragmentation** | Separate spreadsheets maintained by different volunteer groups with no single source of truth. | Duplicate dispatches to the same address, conflicting inventory counts, and zero audit trail. |
| **Free-Text Chaos** | Users recording items inconsistently ("Su", "0.5L Su", "İçme Suyu", "Bisküvi", "Koli Bisküvi"). | Inability to calculate national KPI totals for how much aid has been delivered vs. how much is in transit. |

---

## 2. Stakeholder Identification and Analysis

### 2.1 Detailed Stakeholder Matrix

| Stakeholder / Role | System Role Code | Primary Responsibilities & Needs | Influence on Project | Dependence on System |
|---|---|---|---|---|
| **System Administrator** | `ADMIN` | Manages platform governance, creates and authorizes `COORDINATOR` accounts, configures master **Disaster Types** and **Aid Item Categories/Units**, and audits system-wide security logs. | **High** (Governance & security authority) | **Medium** (Uses platform for oversight and configuration) |
| **Disaster Coordinator** *(Official Agency / AFAD / Municipality / NGO Liaison)* | `COORDINATOR` | **Primary operational decision-maker.** Opens active **Aid Zones** on the Turkey map (using institutional field reports or verified citizen requests), configures **Time Slots & Vehicle Quotas** (e.g., `08:00–12:00`, max 5 trucks), enters/updates required item quantities, approves **Carrier** and **Field Volunteer** applications, assigns empty standby trucks from the fleet pool, and executes **fallback delivery confirmations** when field internet is down. | **High** (Core operational driver) | **High** (Relies on system to prevent bottlenecks and track needs) |
| **Carrier / Vehicle Owner** *(Truck Drivers, Logistics Companies, Civilian Vehicle Owners)* | `CARRIER` | Registers vehicles with **License Plate (`34 ABC 123`)**, vehicle type (*Tır / Semi-Trailer, Lorry / Kamyon, Van / Panelvan, Car / Binek*), and load capacity. Applies either **(A) with ready cargo** for a specific zone and open time slot, or **(B) as an empty standby vehicle** waiting for coordinator assignment. Updates status to `IN_TRANSIT` upon departure. | **Medium** (Primary external logistics user) | **High** (Needs clear slot rules, open needs, and route approval) |
| **Field Staff / Site Volunteer** *(On-Site Distribution Personnel)* | `FIELD_STAFF` | Applies via the **Field Volunteer Portal** to work at a specific Aid Zone and shift interval. Once approved, views the scheduled incoming truck list for their zone, inspects arriving vehicles by **License Plate**, and records physical handover (`DELIVERED`). | **Medium** (Operational verification user) | **High** (Depends on accurate arrival schedules and plate lists) |
| **Affected Citizens / Local Representatives / Proxy Reporters** | `REPORTER` / `PUBLIC` | Views the transparent **Interactive Turkey Map** and **Live KPI Cards** (*Active Zones, Vehicles In-Transit, Delivered Shipments, Category Progress*). Submits **Regional Aid Need Requests** (directly from the zone or by proxy from another city on behalf of affected relatives/villages). | **Low** (Public end-user) | **High** (Depends on timely verification and aid fulfillment) |
| **External Service Providers** *(Map & Notification Services)* | `EXTERNAL` | **Map Provider (OpenStreetMap/Leaflet):** Supplies geographic tiles and coordinate rendering for Turkey.<br>**Identity & Notification Stubs:** Handles JWT role authentication and dispatches SMS/Email alerts for slot approvals. | **Low** (Technical interface constraint) | **Low** (External dependency) |

### 2.2 Stakeholder Influence vs. Dependence Summary
- **High Influence / High Dependence (Key Players):** `COORDINATOR` and `ADMIN` — Their workflows dictate system boundaries, fallback mechanisms, and approval rules.
- **Medium Influence / High Dependence (Core Operational Users):** `CARRIER` and `FIELD_STAFF` — Require intuitive onboarding forms, strict conflict prevention (`409 Conflict`), and fast license-plate lookup.
- **Low Influence / High Dependence (Beneficiaries):** `REPORTER` / `PUBLIC` — Protected through transparent KPI visibility and proxy need reporting.

---

## 3. Proposed Solution and Expected Outcomes

### 3.1 Solution Hypothesis
We propose **AFLOS (Disaster Logistics & Aid Coordination System)**, an API-first, web-based disaster logistics command and coordination platform built around an **Interactive Turkey Disaster Map** and **Real-Time KPI Dashboard**.

AFLOS resolves post-disaster logistics chaos through **five integrated mechanisms**:

1. **National Live KPI Dashboard & Interactive Turkey Map:**
   - **KPI Summary Bar:** Displays real-time counters for **Active Aid Zones**, **Vehicles Currently In-Transit (`IN_TRANSIT`)**, **Completed Deliveries (`DELIVERED`)**, and **Category-Level Fulfillment Progress Bars** (*Delivered vs. In-Transit vs. Remaining Need* for Water, Food, Shelter/Blankets, Clothing, Medical, Hygiene, Equipment).
   - **Color-Coded Map Pins & Multi-Dimensional Filtering:** Aid zones on the Turkey map are color-coded by fulfillment urgency (**Red:** Critical `<30%` met, **Yellow:** Aid In-Transit `30%–80%` met, **Green:** Fulfilled `>80%` met) and can be filtered by **Disaster Type** (*Earthquake, Flood, Wildfire, Conflict/Humanitarian, Landslide*) or **Aid Category**.

2. **Three-Tier Structured Data Model (Preserving KPI Integrity with Manual Item Entry):**
   - **Tier 1 – Disaster Type (`DisasterType`):** Classifies the emergency (`EARTHQUAKE`, `FLOOD`, `WILDFIRE`, `CONFLICT_HUMANITARIAN`, `LANDSLIDE_AVALANCHE`).
   - **Tier 2 – Master Aid Category (`AidCategory`):** Standardized parent categories managed by Admin (`WATER_BEVERAGE`, `FOOD_NUTRITION`, `SHELTER_WARMING`, `CLOTHING`, `MEDICAL_FIRST_AID`, `HYGIENE`, `EQUIPMENT_TOOLS`).
   - **Tier 3 – Manual Line-Item Specification (`AidNeedItem`):** Coordinators or Need Reporters select a Master Category and manually type the specific **Item Name** (e.g., *"0.5L İçme Suyu"*, *"Bisküvi"*, *"Çift Kişilik Battaniye"*, *"Çocuk Botu"*), **Quantity** (e.g., `1000`, `500`), and **Unit** (`CASE` / Koli, `PIECE` / Adet, `BOX` / Kutu, `PALLET` / Palet, `KG`). This allows complete flexibility for field needs while keeping national KPI counters mathematically consistent.

3. **Time-Slot & Vehicle Quota Management (Bottleneck Prevention):**
   - Each Aid Zone defines specific operational **Time Slots** (e.g., `08:00–12:00`, `12:00–16:00`, `16:00–20:00`) with a strict **Maximum Vehicle Quota** per slot (e.g., `maxVehicles: 5`).
   - The system automatically blocks overbooking a full time slot or double-booking the same vehicle license plate across overlapping time intervals (`HTTP 409 Conflict`).

4. **Three Public & Volunteer Onboarding Portals:**
   - **Portal 1 – Regional Need Request Portal:** Citizens, village heads (*Muhtars*), or out-of-city relatives submit location-based need requests (`PENDING_VERIFICATION`). Upon Coordinator verification, the request becomes an active Aid Zone on the Turkey map.
   - **Portal 2 – Carrier & Fleet Application Portal (Dual Mode):**
     - *Mode A (Ready Cargo Application):* A truck owner (`34 ABC 123`) selects an active zone and an available time slot on the map, specifies the exact quantities of items they will carry, and submits a shipment application.
     - *Mode B (Standby Empty Vehicle Pool):* A truck owner with an available vehicle but no cargo registers into the standby fleet pool; Coordinators directly assign them to urgent routes and time slots.
   - **Portal 3 – Field Volunteer Application Portal:** Volunteers apply to serve at a specific Aid Zone and shift window. Once approved by a Coordinator, they gain `FIELD_STAFF` privileges for that zone.

5. **Offline-Resilient Institutional Workflow & Handover Verification:**
   - If internet infrastructure collapses in the disaster zone, **Coordinators** open Aid Zones and enter needs directly based on official institutional communications (AFAD/municipality radio or satellite reports).
   - When a truck arrives on-site, **Field Staff** verify the vehicle's **License Plate** and confirm delivery (`DELIVERED`), which automatically deducts the delivered amounts from the zone's remaining needs and updates the live KPI dashboard. If Field Staff lose internet connectivity during unloading, the **Coordinator** can execute a **Fallback Handover Confirmation** centrally.

### 3.2 Expected Outcomes and Measurable Success Criteria
- **Primary Journey Speed:** An authenticated Carrier or Coordinator can locate an active Aid Zone on the Turkey map, inspect remaining item needs and time-slot quotas, and complete a valid, conflict-free shipment assignment in **less than 2 minutes**.
- **100% Conflict Enforcement:** Zero instances of time-slot capacity overflow or simultaneous overlapping assignments for the same license plate, verified via automated API contract and integration tests (`409 Conflict`).
- **Full Auditability:** 100% of shipment lifecycle transitions (`PENDING` $\rightarrow$ `APPROVED` $\rightarrow$ `IN_TRANSIT` $\rightarrow$ `DELIVERED` / `CANCELLED`) and need adjustments are recorded in an immutable audit log with actor ID, role, and timestamp.

---

## 4. Feasibility Assessment and Initial Project Scope

### 4.1 Multi-Dimensional Feasibility Review
| Dimension | Assessment | Justification |
|---|---|---|
| **Technical Feasibility** | **High** | Built on a modular, API-first architecture (OpenAPI 3.1.0, RESTful backend, transactional relational database for atomic slot/inventory updates, responsive web UI with Leaflet/OpenStreetMap, and single-command `docker-compose` deployment). |
| **Operational Feasibility** | **High** | Specifically addresses post-disaster communication blackouts through the **Coordinator Institutional Entry** and **Central Fallback Handover** workflows, ensuring the system never deadlocks when field internet drops. |
| **Schedule Feasibility** | **High** | Scoped for a 7-member software engineering team across a 10-week semester (Sprint 1: Foundation & OpenAPI; Sprint 2: SRS, Figma UX & C4/UML Architecture; Sprint 3: Working MVP & CI/CD with >50% unit-test coverage; Final: Dockerized live product & SonarQube verification). |
| **Legal & Ethical Feasibility** | **High** | Minimizes personal data collection (only operational contact and vehicle license plate for dispatch), prevents public panic by requiring Coordinator verification (`PENDING_VERIFICATION`) before publishing citizen need requests on the live map, and uses permissive open-source licensing. |

### 4.2 Initial Project Scope (First Release / MVP vs. Out-of-Scope)

#### Included in First Release (In-Scope)
- **Live National Dashboard & Interactive Turkey Map:** KPI summary cards (*Active Zones, Vehicles In-Transit, Delivered Shipments, Category Fulfillment*) and map pins filtered by Disaster Type and Aid Category.
- **Role-Based Access Control (RBAC):** Distinct permissions and views for `ADMIN`, `COORDINATOR`, `CARRIER`, `FIELD_STAFF`, and `PUBLIC`/`REPORTER`.
- **Aid Zone, Time-Slot & Need Catalogue Management:** Creating zones with geographic coordinates, disaster types, time-slot capacities, and line-item needs (Master Category + Manual Item Name + Quantity + Unit).
- **Three Onboarding/Application Workflows:** Regional Need Request submission & verification; Carrier vehicle registration (`License Plate`) with Ready-Cargo or Standby-Pool modes; Field Volunteer shift application & approval.
- **Conflict-Free Shipment Lifecycle & Fallback Handover:** Slot quota and license-plate overlap validation (`409 Conflict`), `IN_TRANSIT` tracking, on-site `DELIVERED` confirmation by Field Staff, Coordinator offline fallback confirmation, and automated KPI/inventory recalculation.
- **Audit Logging:** Traceable history of all approvals, assignments, and delivery confirmations.

#### Excluded / Deferred from First Release (Out-of-Scope)
- **Hardware GPS / IoT Transponder Integration:** Real-time satellite hardware telemetry inside trucks is out of scope; transit and delivery states are updated through authenticated role actions.
- **Financial Donations & Payment Gateways:** The system coordinates physical relief supplies and logistics vehicles only; monetary fundraising, credit card processing, and accounting are excluded.
- **AI Route Optimization & Fuel/Maintenance ERP:** Turn-by-turn navigation engines, fuel consumption calculation, and vehicle mechanical maintenance scheduling are outside the software boundary.
- **Government Intranet / MERNİS Hardware Integration:** Official identity verification and SMS gateways are represented via clean service interfaces and local stubs for academic demonstration and automated testing.

---

## 5. Assumptions, Potential Risks, and Open-Source License Selection

### 5.1 Assumptions and Risk Register

| Type | ID | Statement / Scenario | Severity | Validation or Mitigation Strategy |
|---|---|---|---|---|
| **Assumption** | **ASM-01** | Official relief agencies (AFAD, municipalities, NGOs) communicate verified field needs to Disaster Coordinators via radio, satellite, or liaison channels when local internet is down. | High | Provide a dedicated Coordinator workflow to create Aid Zones and input needs directly without waiting for citizen web submissions. |
| **Assumption** | **ASM-02** | Volunteer carriers and logistics fleets departing from unaffected provinces have internet access to inspect the Turkey map, register license plates, and book time slots. | Medium | Design a lightweight, mobile-responsive web application accessible from any standard smartphone or desktop browser. |
| **Risk** | **RSK-01** | **Internet Blackout at the Distribution Point:** On-site Field Staff may lose cellular/internet connectivity when a truck arrives for unloading, preventing `DELIVERED` status updates. | **High** | **Mitigation:** Implement a **Coordinator Fallback Handover** capability allowing command-center Coordinators to mark shipments as `DELIVERED` upon verbal/radio confirmation from the field. |
| **Risk** | **RSK-02** | **Concurrent Time-Slot Booking Race Condition:** Two carriers may simultaneously submit applications for the last remaining vehicle quota in a `08:00–12:00` time slot. | **High** | **Mitigation:** Treat as a core architectural driver; enforce atomic database transactions/locking and return standard `HTTP 409 Conflict` (`SLOT_FULL` or `VEHICLE_ALREADY_ASSIGNED`), verified by automated integration tests. |
| **Risk** | **RSK-03** | **Inconsistent Manual Item Naming:** Users typing free-text item names (e.g., *"Su"*, *"0.5L Su"*, *"Bisküvi"*, *"Koli Bisküvi"*) could break national KPI aggregation. | **Medium** | **Mitigation:** Enforce a two-level input rule where every manually named item must belong to one of the 7 standardized **Master Aid Categories** (`WATER_BEVERAGE`, `FOOD_NUTRITION`, etc.) and use a standard unit (`CASE`, `PIECE`, `BOX`, `PALLET`, `KG`). |
| **Risk** | **RSK-04** | **Unverified or Duplicate Public Need Requests:** Panic or malicious actors during a disaster may flood the system with unverified regional need reports. | **Medium** | **Mitigation:** All public need requests enter `PENDING_VERIFICATION` status and remain hidden from public carrier dispatch until reviewed, merged, or approved by an authenticated `COORDINATOR`. |
| **Risk** | **RSK-05** | **Unavailable External Identity or Notification Services:** Third-party SMS or institutional identity providers may be inaccessible in the classroom/test environment. | **Low** | **Mitigation:** Isolate authentication and notification behind clean adapter boundaries with documented local stubs for deterministic CI/CD testing. |

---

### 5.2 Open-Source License Decision Record

```markdown
Decision: Apache License 2.0 for all original AFLOS source code, API specifications, and documentation.

Rationale:
1. Permissive Humanitarian & Civic Adoption: Allows public disaster management agencies, municipalities, NGOs, and civic-tech volunteers to freely deploy, modify, and distribute the platform in both public and commercial environments.
2. Explicit Patent Protection: Includes an explicit patent grant from contributors, protecting downstream operators and institutions from patent litigation.
3. Dependency Compatibility: Fully compatible with the open-source ecosystem planned for the project (OpenStreetMap/Leaflet, OpenAPI tooling, Docker, Node.js/Python/Java frameworks, and PostgreSQL).
4. Attribution & Notice Preservation: Ensures academic and contributor credit is preserved in derivative works through standard copyright and NOTICE headers.

Follow-up Actions:
- Commit the complete Apache License 2.0 text to the root `LICENSE` file in the repository.
- Audit all direct and transitive third-party library licenses during Sprint 2 and Sprint 3 to ensure zero incompatible copyleft (e.g., AGPL) conflicts.
```
