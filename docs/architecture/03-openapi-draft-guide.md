# SENG 321 – Sprint 1 Deliverable 3: OpenAPI Specification & Architecture Guide

**Project:** AFLOS – Disaster Logistics & Aid Coordination System  
**Document Owner:** Lead Software Architect / Technical Lead Team  
**Version:** 0.1.0 – Review-Ready Draft for Team Evaluation  
**Date:** November 2, 2026  
**Primary Deliverable:** [api/openapi.yaml](../../api/openapi.yaml)  

---

## 1. Purpose and Scope of Deliverable

This deliverable establishes the formal API contract shared between frontend and backend engineering teams. It does not provide an implemented backend service, database engine, or running runtime environment. In alignment with SENG 321 Sprint 1 academic requirements, it provides a valid OpenAPI 3.1.0 specification detailing endpoints, HTTP operations, request/response JSON schemas, and deterministic success/error payloads. Detailed C4 model diagrams and Unified Modeling Language (UML) structural artifacts are scheduled for Sprint 2.

Team identifiers, architect student credentials, GitHub issue/PR/commit hashes, and Sprint 1 release tags will be finalized within the team submission cover page and repository pull request metadata.

---

## 2. Sources and Decision Precedence

The requirements for this specification derive from the Product Owner artifacts: `01-project-proposal.md`, `02-system-vision-and-boundary.md`, `06-initial-product-backlog.md`, and the architectural alignment decisions communicated on November 2, 2026.

In the event of ambiguity or discrepancy, precedence is enforced as follows:  
**Latest Explicit PO Decision $\longrightarrow$ Active Product Backlog $\longrightarrow$ Legacy Prose in Proposal/Vision**.  
Upstream requirements files remain unmodified. Legacy references in the proposal and vision regarding manual truck approval queues, dynamic QR codes, automated trust scoring, `EXPIRED`/`APPROVED` statuses, and cross-category aggregate sums are superseded by these explicit backlog rules. The PO team is responsible for reconciling those legacy documents prior to final submission.

Official specification standard: [OpenAPI 3.1.0](https://spec.openapis.org/oas/v3.1.0.html). Operation descriptions are documented in English; educational rationale and decision notes are presented for engineering evaluation. `x-user-stories` provides bidirectional requirement traceability, while `x-roles` documents authorization boundaries (these metadata extensions do not enforce server runtime security on their own).

---

## 3. Core Domain Rules Finalized by the Product Owner

- **Self-Service Appointment Model:** `POST /carrier-applications` executes direct appointment booking. The path preserves backlog consistency; it is not an asynchronous manual triage queue.
- **Single-Transaction Atomic Booking:** Booking execution atomically validates vehicle plate eligibility, increments slot quota (`assignedVehicles`), locks pledged inventory (`reservedQuantity`), sets shipment state directly to `CONFIRMED`, and generates the single-use verification code. If any constraint fails, the entire transaction rolls back.
- **Strict 5-State Shipment Lifecycle:** Valid states are strictly `CONFIRMED`, `IN_TRANSIT`, `DELIVERED`, `CANCELLED`, and `NO_SHOW`.
- **Full ISO 8601 Intervals:** Time slots contain explicit calendar dates and UTC offsets (e.g., `2026-11-05T08:00:00+03:00`).
- **Overlapping Booking Prevention:** Normalized license plates cannot hold multiple active bookings across overlapping intervals. Half-open intervals apply: `[startsAt, endsAt)`.
- **Slot Capacity as Total Arrival Ceiling:** `assignedVehicles` tracks total appointments in `CONFIRMED`, `IN_TRANSIT`, and `DELIVERED`. A completed physical delivery does not reopen or recycle slot quota (preventing physical road gridlock); only `CANCELLED` and `NO_SHOW` release quota.
- **Reserved Inventory Accounting:** `reservedQuantity` covers inventory pledged across `CONFIRMED` and `IN_TRANSIT` shipments. It is not incremented a second time upon departure.
- **Open Deficit Formula:**  
  $$\text{openDeficit} = \max(0, \text{requiredQuantity} - \text{reservedQuantity} - \text{deliveredQuantity})$$
- **Itemized Handover Reconciliation:** Delivery requests submit actual delivered quantities per item. The entire pledged reservation is released; only physical received amounts increment `deliveredQuantity`. Unfulfilled surplus reverts to `openDeficit`.
- **Line-Item Progress Integrity:** Progress tracking is calculated strictly per individual need item. Different items or incompatible units (cases vs. kilograms) are never aggregated together.
- **MVP Scope Boundaries:** Dynamic QR rendering and automated machine-learning trust scores are deferred beyond MVP.
- **Standard HTTP Error Mapping:** Authentication failure returns `401 Unauthorized`; insufficient role or out-of-scope zone access returns `403 Forbidden`; malformed syntax returns `400 Bad Request`; domain state/capacity collisions return `409 Conflict`; rate limits return `429 Too Many Requests`.

---

## 4. End-to-End Operational Workflow

1. A Coordinator creates an active Aid Zone and configures ISO 8601 time slots with vehicle quotas.
2. The Coordinator appends itemized need lines. The server generates unique opaque `itemId` keys.
3. An authenticated Carrier selects an open slot and submits pledged cargo referencing these item keys.
4. On success, the API returns `201 Created` with shipment details and exposes the secret verification code exclusively to the carrier.
5. The Carrier transitions their assigned shipment to `IN_TRANSIT` upon physical departure.
6. Authorized on-site Field Staff (scoped to that specific zone and shift) submit physical plate, verification code, and actual delivered quantities. Alternatively, a Coordinator executes central fallback delivery with mandatory justification during communication blackouts.
7. The server commits the delivery atomically: consumes the single-use code, reconciles line-item quantities, and appends an immutable audit entry.
8. Public dashboard metrics update deterministically, subject only to explicit edge cache TTL headers (e.g., 15 seconds).

### Partial Delivery Reconciliation Example

| Stage | required | reserved | delivered | openDeficit | assignedVehicles |
|---|---:|---:|---:|---:|---:|
| Initial Need Creation | 100 | 0 | 0 | 100 | 0 |
| Carrier Pledges 100 Units | 100 | 100 | 0 | 0 | 1 |
| In-Transit Departure | 100 | 100 | 0 | 0 | 1 |
| Actual Handover of 90 Units | 100 | 0 | 90 | 10 | 1 |

*Note: No quantity is double-deducted. Completed deliveries do not recycle vehicle quota. Idempotent replay of a delivery request will never double-count stock.*

---

## 5. Backlog-to-Contract Traceability Mapping

All routes below reside under the `/api/v1` server base path. Path definitions in `openapi.yaml` do not repeat the `/api/v1` prefix.

| User Story | Target Endpoint & Method | Success Status & Schema |
|---|---|---|
| **US-01** | `POST /need-requests` | `201 Created` (`NeedRequestReceipt`) |
| **US-02** | `GET /dashboard/summary`<br>`GET /aid-zones`<br>`GET /aid-zones/{zoneId}` | `200 OK` (`Dashboard`)<br>`200 OK` (`ZoneList`)<br>`200 OK` (`ZoneDetail`) |
| **US-03** | `POST /aid-zones` | `201 Created` (`ZoneDetail`) |
| **US-04** | `POST /aid-zones/{zoneId}/needs` | `201 Created` (`Need`) |
| **US-05** | `POST /carrier-applications` | `201 Created` (`BookingReceipt`) |
| **US-06** | `PATCH /shipments/{shipmentId}/status` | `200 OK` (`Shipment`) |
| **US-07** | `POST /handover/verify` | `200 OK` (`DeliveryReceipt`) |
| **US-08** | `POST /handover/fallback` | `200 OK` (`DeliveryReceipt`) |
| **US-09** | `POST /standby-fleet` | `201 Created` (`Standby`) |
| **US-10** | `GET /admin/audit-logs` | `200 OK` (`AuditEntryList`) |

*Compatibility Note on US-04:* The `remainingQuantity` field in schema `Need` is retained as a compatibility alias reflecting `openDeficit`. Both fields are calculated by the server and rejected if supplied by clients.

### Supporting Operations

To ensure architectural completeness, the specification defines supporting operations marked with `x-scope: Supporting contract proposal`:
- Authentication token issuance (`POST /auth/token`) using pre-seeded classroom accounts.
- Administrative need request triage (`POST /need-requests/{requestId}/review`).
- Shipment query, detail, code lookup, cancellation, no-show, and emergency rerouting endpoints.
- Zone deactivation (`POST /aid-zones/{zoneId}/deactivate`).
- Standby fleet assignment (`POST /standby-fleet/{standbyId}/assign`).
- Volunteer portal lifecycle (`POST /volunteer-applications`, query, and review).

Dynamic administrative account provisioning and runtime category creation will be specified in subsequent contract iterations. Map tile services (e.g., OpenStreetMap raster/vector tiles) remain external platform dependencies and are intentionally excluded from the REST domain API.

---

## 6. Role-Based Access Control (RBAC) and Privacy Strategy

| Role | Authorization Boundary |
|---|---|
| `PUBLIC` | Access to active aid zones, anonymized dashboard KPI aggregations, and public need submission. |
| `REPORTER` | Citizen portal access; need reporting defaults to anonymous submission. |
| `CARRIER` | Scoped strictly to carrier's registered vehicles, active bookings, and owned verification codes. |
| `FIELD_STAFF` | Scoped strictly to assigned `zoneId` and operational shift; incoming shipment views never expose raw verification codes. |
| `COORDINATOR` | Zone and need management, application review, exceptional rerouting, and central fallback handover. |
| `ADMIN` | Read-only inspection of immutable governance audit logs; does not inherit operational execution permissions. |

**Privacy and Zero-Knowledge Design:**
- On-site field authorization is verified dynamically per request against current assignment tables; static tokens containing stale `zoneId` claims are rejected.
- Public responses mask reporter identities, telephone numbers, driver plates, and tokens.
- Authenticated endpoints mandate `Cache-Control: no-store` headers.
- Secret verification codes are strictly omitted from public endpoints, field listings, and persistent audit logs.
- Turkish Republic ID numbers (TCKN) are not collected in this baseline specification.

---

## 7. Open Architectural Assumptions (A-01 through A-10)

The following design decisions were incorporated to deliver an actionable, deterministic contract for review. They represent architectural proposals subject to PO and QA alignment:

| ID | Specification Assumption | Review Stakeholders |
|---|---|---|
| **A-01** | Verification codes follow the format `^AFL-[A-Z0-9]{6}$` (e.g., `AFL-7K49P2`). This resolves ambiguity between 4-character legacy strings (`AFL-7492`) and provides collision resistance. | PO + Lead Architect |
| **A-02** | Over-pledging beyond `openDeficit` is rejected with `409 Conflict` (`NEED_EXCEEDED`) rather than silently trimmed. The client UI must display current deficit and prompt for confirmation. | PO |
| **A-03** | Time slots within a single zone cannot overlap; each slot explicitly defines `allowedVehicleTypes`. Bookings for past intervals are rejected. Units allow decimal precision for `KG` and integers for discrete packaging (`CASE`, `PIECE`, `BOX`, `PALLET`). | PO + Lead Architect |
| **A-04** | Delivery requests must submit all pledged items in a single atomic array; omitted items are treated as zero delivered. Surplus beyond pledged amounts is rejected with `409 Conflict` pending unrequested cargo policy. | PO + QA |
| **A-05** | `NO_SHOW` transitions apply strictly to `CONFIRMED` shipments whose slot window has elapsed. The state machine does not support direct `IN_TRANSIT` $\rightarrow$ `NO_SHOW`. Automated timeout handling will be governed by scheduled cron jobs. | PO + Lead Architect |
| **A-06** | Zone rerouting atomically migrates allocated quota and reservations to an alternate target zone, preserves `IN_TRANSIT` state, and regenerates verification codes. Coordinator selection is required. | PO + Lead Architect |
| **A-07** | Field volunteer registration requires an authenticated `REPORTER` or `FIELD_STAFF` account. Administrative approval creates a scoped assignment record. Public self-registration for `ADMIN` is disallowed. | PO + DevOps |
| **A-08** | Need report verification binds a request to an existing zone; it does not automatically duplicate need lines. Coordinators manage zone needs through explicit operations. | PO |
| **A-09** | State-modifying operations require a mandatory `Idempotency-Key` header. Requests matching the same actor, method, path, key, and payload return cached results for 24 hours. Payload mismatches return `409 IDEMPOTENCY_CONFLICT`. | Architect + QA |
| **A-10** | Map pin coloration thresholds (Red < 30%, Yellow 30%–80%, Green $\ge 80\%$) are evaluated at the line-item level. Bounding box coordinates validate the geographic envelope of Turkey (`lat 35.9-42.1`, `lng 25.6-44.8`). | PO |

---

## 8. Concurrency, Replay Protection, and Audit Guarantees

- **Slot Quota Race Protection:** When multiple carriers compete for the final vehicle slot, database row-level locking (`SELECT ... FOR UPDATE`) guarantees exactly one success (`201 Created`) while competing transactions fail with `409 Conflict` (`SLOT_FULL`).
- **Distributed Inventory Locking:** Concurrent pledges across distinct slots targeting the same item cannot exceed total `openDeficit`.
- **Atomic State Consistency:** All database mutations, idempotency cache entries, and audit trail records commit within a unified database transaction boundary.
- **Application Validation Enforcement:** Business constraints (chronological timestamp order, zone ownership, non-duplicate item keys) are enforced in application service layers.
- **Append-Only Logging:** Governance audit logs are append-only; updates and deletions are restricted at the database privilege level.

---

## 9. Validation and Reproduction Instructions

Validation scripts and dependency definitions are included directly within the delivery package:
- Validation script: [`../../tools/validate_openapi.py`](../../tools/validate_openapi.py)
- Dependencies: [`../../tools/requirements-openapi.txt`](../../tools/requirements-openapi.txt)

To execute contract validation locally from the project root:

```bash
python3 -m pip install -r tools/requirements-openapi.txt
python3 tools/validate_openapi.py
```

The script verifies YAML syntax, OpenAPI 3.1.0 structural compliance, internal `$ref` resolution, example schemas, ISO 8601 timestamps, unique operation IDs, path parameters, mandatory 401/403 responses, US-01 through US-10 requirement coverage, and privacy field masking. The verification output is recorded in [`openapi-validation-report.json`](./openapi-validation-report.json).

*Note: This suite represents a static contract verification. Concurrency, row locking, authorization filters, and database triggers must be verified through automated integration tests in Sprint 2 and Sprint 3.*

---

## 10. Team Handoff and GitHub Traceability

1. Add `api/openapi.yaml`, this guide, the validation report, and `tools/` validator files to your architect branch (`role/architect-mirza`).
2. Open a GitHub Issue titled *"Sprint 1: AFLOS OpenAPI 3.1 Contract and Architecture Specification"*.
3. In the Pull Request description, cross-reference US-01..US-10 traceability, PO alignment decisions, and assumptions A-01..A-10.
4. Request formal peer review from the Product Owner (`@kaanklnc`), co-architect, and QA engineer to ensure cross-functional consensus.
5. Following review approval, merge into the team integration branch in accordance with project Git-Flow conventions.
