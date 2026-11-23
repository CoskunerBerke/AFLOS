# SENG 321 — Sprint 2 Deliverable 02: Non-Functional Requirements & Quality Measures (NFR)

**Project Title:** AFLOS — Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) — Software Engineering Project, Fall 2026  
**Sprint:** Sprint 2 — Requirements Engineering, UI/UX Prototyping & Software Architecture  
**Quality Framework Standard:** ISO/IEC 25010:2011 Systems and software engineering — Systems and software Quality Requirements and Evaluation (SQuaRE) — System and software quality models  
**Role / Primary Author:** Product Owner & Requirements Engineer — **Kaan Kılınç (230204047)** ([`@kaanklnc`](https://github.com/kaanklnc))  
**Co-Author & Verification Lead:** QA Engineer & Test Automation Lead — **Onur Şahin (230201030)** ([`@clickOMorphism`](https://github.com/clickOMorphism))  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  
**Document Version:** 1.0.0 (Release 1 Baseline)  
**Status:** Approved for QA Test Strategy & Architecture Design  

---

## Executive Summary

Disaster response software cannot afford ambiguous quality criteria. During sudden-onset catastrophes, system sluggishness, server crashes under traffic surges, or security leaks of survivor locations directly translate into human suffering. 

This document defines the formal **Non-Functional Requirements (NFRs)** and **Quality Measures** for **AFLOS**. Grounded in the international **ISO/IEC 25010** quality model, every requirement establishes concrete, verifiable, and numerically bounded acceptance thresholds, defining specific test harnesses, measurement protocols, and operational constraints for the engineering and QA teams.

---

## 1. ISO/IEC 25010 Quality Model Overview

The quality characteristics of AFLOS are structured across the eight standardized product quality characteristics of ISO/IEC 25010:

```
                         ISO/IEC 25010 Quality Model
                                      |
      +---------------+---------------+---------------+---------------+
      |               |               |               |               |
[Performance]   [Reliability]    [Security]      [Usability]   [Maintainability]
 Efficiency      & Availability                   & Access       & Portability
      |               |               |               |               |
 Latency <=200ms  99.9% Uptime    TLS 1.3/AES-256 WCAG 2.1 AA    Docker / CI
 10,000 Users    PWA Offline Sync KVKK/GDPR Audit <2 min Submit  OpenAPI 3.1.0
 1,500 TPS       SMS Fallback     RBAC Strict     i18n (TR/EN/AR) >80% Coverage
```

---

## 2. Performance Efficiency (ISO 25010 §4.2.2)

### [NFR-PE-01] API Latency Under Normal Operational Load
* **Requirement Statement:** Under baseline operational load ($\le 500$ concurrent active requests), the AFLOS API Gateway SHALL respond to 95% of non-analytical REST requests ($p95$) within $\le 200\text{ ms}$ and 99% ($p99$) within $\le 400\text{ ms}$.
* **Measurement Metric:** End-to-end HTTP response latency measured from edge ingress to client egress.
* **Test Tool & Protocol:** Locust / k6 load testing suite executing automated synthetic user journeys against staging environment.
* **Acceptance Threshold:** $p95 \le 200\text{ ms}$, $p99 \le 400\text{ ms}$, HTTP 5xx error rate $< 0.01\%$.

### [NFR-PE-02] Disaster Peak Surge Latency & Throughput
* **Requirement Statement:** During peak disaster ingestion surges (simulating sudden earthquake notifications), the system SHALL maintain a minimum sustained throughput of **1,500 Transactions Per Second (TPS)** with an upper latency threshold of $p95 \le 500\text{ ms}$.
* **Measurement Metric:** Sustained TPS capacity without request drops or unhandled socket timeouts.
* **Test Tool & Protocol:** Distributed k6 load generator simulating 10,000 concurrent client sessions over a 15-minute ramp-up window.
* **Acceptance Threshold:** Throughput $\ge 1,500\text{ TPS}$, zero fatal process crashes, zero data loss.

### [NFR-PE-03] Spatial Geospatial Query Response Time
* **Requirement Statement:** Complex geospatial radius queries (e.g., retrieving all active high-urgency needs within a 25 km disaster radius) SHALL execute and return geo-JSON results in $\le 100\text{ ms}$ for datasets containing up to 100,000 spatial points.
* **Measurement Metric:** Database query execution time (`EXPLAIN ANALYZE`) using PostGIS spatial indexing and Redis geospatial cache layers.
* **Acceptance Threshold:** PostGIS query execution time $\le 100\text{ ms}$ on 100k spatial coordinates.

---

## 3. Reliability & Availability (ISO 25010 §4.2.4)

### [NFR-RA-01] High Availability Service Level Objective (SLO)
* **Requirement Statement:** The AFLOS core API and data ingestion services SHALL provide an operational availability of **99.9%** (Three Nines), allowing a maximum unplanned downtime of $\le 43.8\text{ minutes per month}$ during non-catastrophe phases and **99.95%** during active national disaster declarations.
* **Measurement Metric:** Uptime percentage calculated via multi-region health probes at 30-second ping intervals.
* **Acceptance Threshold:** Monthly uptime $\ge 99.9\%$, Mean Time Between Failures (MTBF) $\ge 720\text{ hours}$.

### [NFR-RA-02] Mean Time to Recover (MTTR) & Disaster Recovery
* **Requirement Statement:** In the event of catastrophic primary cloud host failure, the system SHALL execute automated container orchestration failover with a Recovery Point Objective (RPO) of $\le 60\text{ seconds}$ and a Recovery Time Objective (RTO) of $\le 15\text{ minutes}$.
* **Measurement Metric:** Total elapsed time from synthetic cluster termination to full standby cluster DNS routing and state recovery.
* **Acceptance Threshold:** $\text{RPO} \le 60\text{ s}$, $\text{RTO} \le 15\text{ minutes}$.

### [NFR-RA-03] Offline-First Progressive Web App (PWA) Resilience
* **Requirement Statement:** When client network connectivity is completely interrupted, the client PWA SHALL maintain full offline responsiveness, permitting local queueing of need submissions, barcode scans, and delivery confirmations in browser IndexedDB with zero interface lockups.
* **Measurement Metric:** Successful local caching of data and automated conflict-free replay upon network reconnection.
* **Acceptance Threshold:** Zero data loss for up to 500 buffered offline transactions per client device; automated synchronization within $\le 5\text{ seconds}$ of network re-establishment.

### [NFR-RA-04] Cellular Telecommunications Blackout SMS Relay
* **Requirement Statement:** In regions experiencing complete 4G/5G mobile packet data blackouts, the system SHALL ingest emergency aid requests via a 2G SMS GSM gateway with an end-to-end processing delay of $\le 15\text{ seconds}$ from SMS arrival to database persistence.
* **Measurement Metric:** Queue processing latency between SMS webhook delivery and parsed need insertion.
* **Acceptance Threshold:** Latency $\le 15\text{ seconds}$, SMS ingestion success rate $\ge 98\%$.

---

## 4. Scalability & Capacity (ISO 25010 §4.2.2)

### [NFR-SC-01] Concurrent Active Users
* **Requirement Statement:** The AFLOS platform SHALL support at least **10,000 concurrent active users** (including 8,000 citizens browsing/submitting, 1,000 field staff scanning inventory, 800 carriers transmitting telemetry, and 200 coordinators viewing GIS dashboards).
* **Measurement Metric:** Simulated concurrent active HTTP/WebSocket sessions maintained simultaneously.
* **Acceptance Threshold:** 10,000 active sessions with memory utilization $\le 75\%$ per container node.

### [NFR-SC-02] Horizontal Auto-Scaling Elasticity
* **Requirement Statement:** The containerized backend services SHALL trigger automated horizontal scaling (adding replica pods) within $\le 45\text{ seconds}$ whenever CPU utilization exceeds 70% or average request latency exceeds 300 ms for three consecutive checks.
* **Measurement Metric:** Horizontal Pod Autoscaler (HPA) event response time.
* **Acceptance Threshold:** Scaling event initiated and healthy within $\le 45\text{ seconds}$; scale-down cooldown set to 300 seconds to prevent thrashing.

---

## 5. Security & Privacy (ISO 25010 §4.2.6)

### [NFR-SE-01] Cryptographic Transport & Rest Encryption
* **Requirement Statement:** All communications across public networks SHALL be encrypted using **TLS 1.3** (with TLS 1.2 as minimum fallback), using strong cipher suites (ECDHE-ECDSA-AES256-GCM). All relational database volumes, backups, and sensitive fields SHALL be encrypted at rest using **AES-256**.
* **Measurement Metric:** SSL Labs Server Test rating and static database configuration audit.
* **Acceptance Threshold:** Qualys SSL Labs rating of **A+**; zero plaintext storage of PII or credentials.

### [NFR-SE-02] Authentication & Stateless Session Lifecycle
* **Requirement Statement:** Operator authentication (Coordinators, Warehouse Staff, Carriers) SHALL utilize cryptographically signed **JWT tokens (RFC 7519)** with HMAC-SHA256 or RSA-256 signatures. Access tokens SHALL expire after 15 minutes; refresh tokens SHALL be rotatable, revocable, and expire after 24 hours.
* **Measurement Metric:** Token expiry validation and token revocation blacklist checks.
* **Acceptance Threshold:** Expired tokens rejected with HTTP 401 Unauthorized within $\le 5\text{ ms}$; token hijacking vulnerability tests zero findings.

### [NFR-SE-03] Turkish KVKK (Law No. 6698) & GDPR Compliance
* **Requirement Statement:** The system SHALL protect survivor Personally Identifiable Information (PII) by:
  1. Restricting exact GPS coordinates to verified rescue coordinators and dispatchers.
  2. Displaying only obfuscated/blurred coordinates ($\pm 500\text{ meters}$) on public map layers.
  3. Supporting automated data redaction and anonymization upon citizen request token verification.
* **Measurement Metric:** PII exposure audit across public API endpoints (`GET /needs`, `GET /dashboard/spatial-overview`).
* **Acceptance Threshold:** Zero PII leakage in public payloads; 100% compliance with KVKK data minimization guidelines.

### [NFR-SE-04] Immutable Security Audit Logging
* **Requirement Statement:** All administrative privilege escalations, manual triage score modifications, shipment rerouting, and inventory write-offs SHALL be written to an immutable, append-only audit log recording UTC timestamp, User ID, Client IP, Action, and Justification.
* **Measurement Metric:** Audit log coverage of state-modifying actions.
* **Acceptance Threshold:** 100% audit capture rate; audit records tamper-proof against deletion or revision even by database administrators.

---

## 6. Usability & Accessibility (ISO 25010 §4.2.3)

### [NFR-US-01] Rapid Emergency Task Completion Under Stress
* **Requirement Statement:** A first-time user under acute psychological distress SHALL be able to successfully submit an emergency aid request in **less than two (2) minutes** and requiring **no more than three (3) screen interactions** on a mobile smartphone.
* **Measurement Metric:** Time-on-Task (ToT) measured in empirical usability tests across a cohort of 10 non-technical subjects.
* **Acceptance Threshold:** Average completion time $\le 120\text{ seconds}$; task success rate $\ge 95\%$ without prior training.

### [NFR-US-02] Accessibility Compliance (WCAG 2.1 Level AA)
* **Requirement Statement:** The AFLOS web client interfaces SHALL strictly comply with the **Web Content Accessibility Guidelines (WCAG) 2.1 Level AA**, maintaining a minimum visual contrast ratio of **4.5:1** for standard text and **3:0:1** for large graphics, complete keyboard navigation support, and ARIA screen-reader landmarks.
* **Measurement Metric:** Automated axe-core / Lighthouse Accessibility audit score.
* **Acceptance Threshold:** Lighthouse Accessibility Score $\ge 95/100$; zero critical WCAG violations.

### [NFR-US-03] Multi-Lingual Humanitarian Localization (i18n)
* **Requirement Statement:** The citizen intake interface and critical alerts SHALL provide instant runtime language localization for Turkish (**tr**), English (**en**), and Arabic (**ar** - with full Right-to-Left RTL layout rendering), catering to multinational disaster victims and international search-and-rescue teams.
* **Measurement Metric:** Locale rendering accuracy, zero untranslated UI strings, and proper RTL alignment.
* **Acceptance Threshold:** 100% localized interface strings across all three languages.

---

## 7. Maintainability & Portability (ISO 25010 §4.2.7 & §4.2.8)

### [NFR-MP-01] OpenAPI 3.1.0 Contract Strictness
* **Requirement Statement:** 100% of implemented API endpoints, request payloads, and response bodies SHALL strictly validate against the official OpenAPI 3.1.0 schema specification (`api/openapi.yaml`) with zero schema deviation or unhandled property leakage.
* **Measurement Metric:** Automated Spectral linting and Dredd/Prism contract testing in CI/CD pipeline.
* **Acceptance Threshold:** Zero OpenAPI linting errors, zero undocumented status codes.

### [NFR-MP-02] Automated Test Code Coverage Target
* **Requirement Statement:** The automated unit and integration test suite SHALL maintain a minimum branch code coverage of **80%** across core domain business logic (Triage Scoring, Inventory Ledger, Dispatch Optimization, and RBAC Guards).
* **Measurement Metric:** Jest / pytest coverage reports executed on every pull request.
* **Acceptance Threshold:** Total line coverage $\ge 80\%$, core logic branch coverage $\ge 85\%$.

### [NFR-MP-03] Containerized Deployment Portability
* **Requirement Statement:** All backend microservices, spatial caches, and database schemas SHALL be fully containerized using **Docker** and orchestrated via **Docker Compose**, building from scratch on any standard Linux/macOS/Windows host running Docker 24+ in under 5 minutes.
* **Measurement Metric:** Clean container build and execution time via automated script.
* **Acceptance Threshold:** Single command startup (`docker compose up --build -d`) completes in $\le 300\text{ seconds}$ with all healthchecks passing.

---

## 8. Quantitative Quality Measures & Verification Matrix

The following table summarizes the quantitative metrics, test methodologies, and verification assignments between Product Owner Kaan and QA Engineer Onur:

| Quality ID | ISO 25010 Attribute | Target Numerical Metric | Tolerance Limit | Test Verification Tool | Primary Owner |
|---|---|---|---|---|:---:|
| **NFR-PE-01** | Performance | Normal API Latency: $p95 \le 200\text{ ms}$ | Max $400\text{ ms}$ ($p99$) | k6 / Locust | **Onur (QA)** |
| **NFR-PE-02** | Performance | Disaster Peak Throughput: $\ge 1,500\text{ TPS}$ | Min $1,200\text{ TPS}$ | k6 Distributed Stress | **Onur (QA)** |
| **NFR-PE-03** | Performance | Spatial PostGIS Query: $\le 100\text{ ms}$ | Max $150\text{ ms}$ | `EXPLAIN ANALYZE` | **Hüseyin (Arch)** |
| **NFR-RA-01** | Reliability | Platform Uptime SLO: $\ge 99.9\%$ | Min $99.85\%$ | Prometheus / Uptime Kuma | **Berke (DevOps)** |
| **NFR-RA-02** | Reliability | Disaster Recovery: $\text{RTO} \le 15\text{ min}$, $\text{RPO} \le 60\text{ s}$ | Max $20\text{ min}$ RTO | Chaos Simulation Test | **Berke (DevOps)** |
| **NFR-RA-03** | Reliability | PWA Offline Buffer: 500 actions, $0$ data loss | Min $300$ actions | Cypress Offline Mode | **Onur (QA)** |
| **NFR-RA-04** | Reliability | 2G SMS Ingestion: $\le 15\text{ s}$, $\ge 98\%$ success | Max $25\text{ s}$ | Twilio/Simulated Modem | **Ulaş (Dev)** |
| **NFR-SC-01** | Scalability | 10,000 Concurrent Active Users | Min $8,000$ users | Distributed k6 Cluster | **Onur (QA)** |
| **NFR-SC-02** | Scalability | HPA Horizontal Pod Scale-up: $\le 45\text{ s}$ | Max $60\text{ s}$ | Kubernetes HPA Metrics | **Berke (DevOps)** |
| **NFR-SE-01** | Security | TLS 1.3 / AES-256 / SSL Labs A+ Grade | Zero plaintext PII | Qualys SSL Labs / Trivy | **Berke (DevOps)** |
| **NFR-SE-02** | Security | JWT Expiry: 15 min access, 24h refresh | Zero token reuse | Automated Auth Tests | **Ulaş (Dev)** |
| **NFR-SE-03** | Security | KVKK Masking: $\pm 500\text{m}$ blur on public maps | $100\%$ PII redaction | Penetration Inspection | **Kaan (PO)** |
| **NFR-SE-04** | Security | Audit Log: 100% state change capture | Zero unlogged actions | DB Append-Only Trigger | **Mirza (Arch)** |
| **NFR-US-01** | Usability | Citizen Submission Time: $\le 120\text{ s}$, $\le 3$ clicks | Max $150\text{ s}$ | Usability Testing Cohort | **Kaan (PO)** |
| **NFR-US-02** | Usability | WCAG 2.1 AA: Lighthouse Accessibility $\ge 95$ | Min $90/100$ | axe-core / Lighthouse | **Kaan (PO)** |
| **NFR-US-03** | Usability | Localization: 100% strings in TR, EN, AR (RTL) | Zero missing keys | i18next Validation Tool | **Kaan (PO)** |
| **NFR-MP-01** | Maintainability| OpenAPI 3.1.0 Contract Compliance: 100% | Zero syntax errors | Spectral Lint / Swagger | **Mirza (Arch)** |
| **NFR-MP-02** | Maintainability| Automated Code Coverage: $\ge 80\%$ | Min $75\%$ coverage | Jest / pytest-cov | **Onur (QA)** |
| **NFR-MP-03** | Maintainability| Docker Single-Command Build: $\le 300\text{ s}$ | Max $450\text{ s}$ | Docker Buildx CI Runner | **Berke (DevOps)** |

---

## 9. Sign-off and Quality Acceptance Authority

* **Author & Product Owner:** Kaan Kılınç ([`@kaanklnc`](https://github.com/kaanklnc))
* **Co-Author & Quality Assurance Lead:** Onur Şahin ([`@clickOMorphism`](https://github.com/clickOMorphism))
* **Approved By:** 
  * Lead Software Architect: Mirza Akgöz ([`@akgozmirza`](https://github.com/akgozmirza))
  * Lead Software Architect: Hüseyin Zor ([`@kurdoglu25`](https://github.com/kurdoglu25))
  * Scrum Master: Mustafa Çebin ([`@Noct-0`](https://github.com/Noct-0))
