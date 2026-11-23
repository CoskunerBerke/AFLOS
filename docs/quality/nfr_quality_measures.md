# AFLOS — Non-Functional Requirements (NFR) Verification Benchmarks & Quality Measures

| Metadata | Details |
| :--- | :--- |
| **Project** | AFLOS (Disaster & Emergency Relief Coordination Platform) |
| **Course** | BM321 Software Engineering — Sprint 2 |
| **Related Issues** | `#26` (NFR Specification & ISO/IEC 25010), `#33` (QA Verification Benchmarks) |
| **Author (QA)** | Onur Şahin (`@clickOMorphism`) |
| **Consulted (Lead Architects)** | `@huseyinzor`, `@akgozmirza` |
| **Target Stack** | .NET (ASP.NET Core Web API), PostgreSQL + PostGIS, `[TBD: Frontend/Mobile Framework]` |
| **Standard** | ISO/IEC 25010 Software Quality Model |

---

## 1. Purpose & Verification Philosophy

This document establishes objective, non-subjective measurement methodologies, acceptance thresholds (Pass/Fail criteria), disaster-scale test data generation strategies, and traceability mappings for all Non-Functional Requirements (NFRs) defined in Issue `#26`. Every quality measure specified below is designed to be automated or empirically audited during **Sprint 3** testing phases.

---

## 2. Measurement Methodologies & Tooling

To ensure reproducible results across local, staging, and CI/CD environments, the following verification tools and methodologies are standardized for AFLOS:

| ISO/IEC 25010 Characteristic | Verification Tooling | Methodology |
| :--- | :--- | :--- |
| **Performance Efficiency** | **k6**, **BenchmarkDotNet**, PostgreSQL `EXPLAIN (ANALYZE, BUFFERS)` | Automated HTTP load profiles targeting .NET API endpoints; direct SQL execution plan profiling for PostGIS spatial queries. |
| **Scalability & Concurrency** | **k6** (Distributed / Cloud), **Prometheus + Grafana** | Spike and stress testing simulating sudden disaster-onset traffic surges while monitoring .NET ThreadPool, GC pauses, and DB connection pool saturation. |
| **Reliability & Availability** | **UptimeRobot / Prometheus Blackbox**, **Playwright / Chrome DevTools Network Throttling**, `[TBD: SMS Gateway Sandbox]` | Continuous synthetic health-check polling (`/healthz`); simulated GSM/network drop tests to verify Offline-First local queue persistence, background sync, and 2G SMS fallback routing. |
| **Security & Privacy (KVKK/GDPR)** | **OWASP ZAP**, **xUnit + WebApplicationFactory**, **Postman / Newman** | Automated DAST vulnerability scanning; integration tests asserting JWT validation, RBAC role boundaries (`401`/`403`), AES-256 encryption at rest, and geospatial coordinate blurring. |
| **Usability & Accessibility** | **Google Lighthouse**, **axe-core**, Moderated Task-Completion Audits | Automated CI accessibility audits against WCAG 2.1 AA; timed usability testing under simulated stress conditions; automated i18n key completeness checks for TR/EN/AR. |

---

## 3. NFR Quality Measures & Pass/Fail Acceptance Thresholds

Every NFR below has a strict binary **Pass/Fail** threshold. Any metric falling outside the specified threshold constitutes a **FAIL** and blocks release promotion.

### 3.1 Performance Efficiency
| NFR ID | Metric | Measurement Method | Pass Threshold | Fail Condition |
| :--- | :--- | :--- | :--- | :--- |
| **NFR-PERF-01** | Normal API Response Time | k6 baseline load test (100 VUs, 5 min) on core .NET endpoints | `p95 <= 200 ms` | `p95 > 200 ms` |
| **NFR-PERF-02** | Peak Disaster Load Response Time | k6 spike/stress test under peak disaster concurrency | `p95 <= 500 ms` (and `p99 <= 800 ms`) | `p95 > 500 ms` or `p99 > 800 ms` |
| **NFR-PERF-03** | PostGIS Geospatial Query Latency | `EXPLAIN ANALYZE` on radius/nearest-neighbor queries (`ST_DWithin`, `ST_Distance`) with GiST index | Execution time `<= 100 ms` | Execution time `> 100 ms` or sequential scan on spatial table |

### 3.2 Scalability & Concurrency
| NFR ID | Metric | Measurement Method | Pass Threshold | Fail Condition |
| :--- | :--- | :--- | :--- | :--- |
| **NFR-SCAL-01** | Concurrent Disaster Victim Requests | k6 ramping-VUs scenario up to 10,000 virtual users | `>= 10,000` concurrent users handled with HTTP 5xx error rate `< 0.5%` | Error rate `>= 0.5%` or server OOM/crash |
| **NFR-SCAL-02** | Peak Throughput (TPS) | k6 constant-arrival-rate executor targeting emergency submission endpoint | Sustained `>= 1,500 TPS` for 5 consecutive minutes | Throughput drops below `1,500 TPS` or request queue timeout |

### 3.3 Reliability & Availability
| NFR ID | Metric | Measurement Method | Pass Threshold | Fail Condition |
| :--- | :--- | :--- | :--- | :--- |
| **NFR-REL-01** | Service Uptime | Synthetic HTTP checks on `/healthz` every 30s over rolling 30-day window (`[TBD: Cloud Provider]`) | `>= 99.9%` uptime (`<= 43.2 min` downtime/month) | Uptime `< 99.9%` |
| **NFR-REL-02** | Offline-First Local Queue & Background Sync | Toggle client offline, submit 5 emergency requests, restore network | `100%` of queued payloads persisted locally and synced to backend within `<= 30s` of reconnection with zero duplicates (idempotency verified) | Any data loss, duplicate record creation, or sync failure |
| **NFR-REL-03** | 2G SMS Gateway Fallback | Simulate HTTP/data timeout while GSM signal is active using `[TBD: SMS Gateway Provider]` sandbox | Fallback SMS payload generated, dispatched, and parsed into DB within `<= 60s` | Fallback fails to trigger or payload fails schema validation |

### 3.4 Security & Privacy (KVKK / GDPR)
| NFR ID | Metric | Measurement Method | Pass Threshold | Fail Condition |
| :--- | :--- | :--- | :--- | :--- |
| **NFR-SEC-01** | JWT Authentication | xUnit integration tests with missing, expired, and tampered JWTs | `100%` of protected endpoints return `401 Unauthorized` | Any protected endpoint returns `2xx` without a valid JWT |
| **NFR-SEC-02** | RBAC Authorization | xUnit role-matrix tests (Victim, Volunteer, Coordinator, Admin) | `100%` of unauthorized role accesses return `403 Forbidden` | Any privilege escalation or cross-role data leak |
| **NFR-SEC-03** | Encryption at Rest (AES-256) | Database & storage configuration audit (`[TBD: Cloud/DB Encryption Provider]`) + PII column inspection | `100%` of PII fields & DB volumes encrypted using `AES-256` | Any plaintext PII stored in DB or unencrypted volume |
| **NFR-SEC-04** | Public Endpoint Coordinate Blurring | Automated API assertion comparing raw DB coordinates vs. public endpoint response | Public response coordinates deviate within `[±450m, ±500m]` (or exact `±500m` bounding radius) from true location | Exact coordinates exposed or blur radius `< 500m` |

### 3.5 Usability & Accessibility
| NFR ID | Metric | Measurement Method | Pass Threshold | Fail Condition |
| :--- | :--- | :--- | :--- | :--- |
| **NFR-USA-01** | Emergency Request Submission Time & Steps | Timed task audit with 5 test users under simulated stress | Completion time `< 2 minutes` AND total user interactions `<= 3 steps` | Average time `>= 2 minutes` or flow requires `> 3 steps` |
| **NFR-USA-02** | WCAG 2.1 AA Compliance | Google Lighthouse Accessibility audit + `axe-core` automated scan | Lighthouse Accessibility score `>= 90` AND `0` critical/serious `axe-core` violations | Score `< 90` or any critical/serious WCAG 2.1 AA violation |
| **NFR-USA-03** | Localization (TR / EN / AR) | Automated i18n key coverage script + RTL layout visual check for Arabic | `100%` translation key coverage across TR, EN, AR; zero overlapping/broken RTL UI elements | Missing translation keys or broken RTL rendering |

---

## 4. Test Data Generation Strategy (Disaster-Scale)

Testing 10,000 concurrent requests and 1,500 TPS requires realistic, anonymized, and spatially distributed synthetic datasets. Production or real personal data **must never** be used.

### 4.1 Synthetic Data Generation Pipeline
* **Tooling:** `.NET Bogus` library (for database seeding) and `k6` `SharedArray` / pre-generated JSON/CSV payloads (to avoid CPU bottlenecks on load generators).
* **Geospatial Distribution:** Generate randomized WGS84 (`SRID 4326`) coordinates clustered around high-density urban disaster zones (e.g., bounding boxes for Ankara, Istanbul, and Hatay) to realistically stress PostGIS GiST spatial indexes.
* **Payload Variety:**
  * **70%** Emergency Help Requests (varying urgency levels: Critical, High, Medium; mixed text lengths in TR/EN/AR).
  * **20%** Resource/Status Polling Requests (read-heavy `GET` queries with spatial radius filters).
  * **10%** Volunteer/Coordinator Status Updates (`PUT`/`PATCH` write operations).
* **Database Pre-Seeding:** Before executing PostGIS (`NFR-PERF-03`) and scalability (`NFR-SCAL-01`) benchmarks, the PostgreSQL database will be pre-seeded with at least **100,000 historical/active spatial records** to prevent artificially fast queries on empty tables.
* **Cleanup & Isolation:** All synthetic test records will be tagged with a `is_synthetic = true` flag or executed in an ephemeral staging database spun up via Docker Compose (`[TBD: CI/CD Environment]`) and torn down post-run.

---

## 5. Traceability Matrix (NFRs ↔ SRS ↔ Sprint 3 Test Suites)

| NFR ID | ISO/IEC 25010 Category | Issue Ref | Mapped SRS Requirement ID | Planned Sprint 3 Test Suite ID | Automation Level |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `NFR-PERF-01` | Performance Efficiency | `#26` | `SRS-NFR-01` | `TS-S3-PERF-01` (k6 Baseline) | Automated (CI) |
| `NFR-PERF-02` | Performance Efficiency | `#26` | `SRS-NFR-02` | `TS-S3-PERF-02` (k6 Spike) | Automated (Staging) |
| `NFR-PERF-03` | Performance Efficiency | `#26` | `SRS-NFR-03` | `TS-S3-DB-01` (PostGIS Profile) | Automated (SQL) |
| `NFR-SCAL-01` | Scalability & Concurrency | `#26` | `SRS-NFR-04` | `TS-S3-SCAL-01` (10k VUs) | Automated (Staging) |
| `NFR-SCAL-02` | Scalability & Concurrency | `#26` | `SRS-NFR-05` | `TS-S3-SCAL-02` (1.5k TPS) | Automated (Staging) |
| `NFR-REL-01` | Reliability & Availability | `#26` | `SRS-NFR-06` | `TS-S3-REL-01` (Uptime Monitor) | Automated (Continuous) |
| `NFR-REL-02` | Reliability & Availability | `#26` | `SRS-NFR-07` | `TS-S3-REL-02` (Offline Sync E2E) | Automated (Playwright) |
| `NFR-REL-03` | Reliability & Availability | `#26` | `SRS-NFR-08` | `TS-S3-REL-03` (2G SMS Fallback) | Semi-Automated (Sandbox) |
| `NFR-SEC-01` | Security & Privacy | `#26` | `SRS-NFR-09` | `TS-S3-SEC-01` (xUnit JWT) | Automated (CI) |
| `NFR-SEC-02` | Security & Privacy | `#26` | `SRS-NFR-10` | `TS-S3-SEC-02` (xUnit RBAC) | Automated (CI) |
| `NFR-SEC-03` | Security & Privacy | `#26` | `SRS-NFR-11` | `TS-S3-SEC-03` (Encryption Audit) | Manual / Config Audit |
| `NFR-SEC-04` | Security & Privacy | `#26` | `SRS-NFR-12` | `TS-S3-SEC-04` (Geo-Blur Test) | Automated (CI) |
| `NFR-USA-01` | Usability & Accessibility | `#26` | `SRS-NFR-13` | `TS-S3-USA-01` (User Stress Audit) | Manual (Timed) |
| `NFR-USA-02` | Usability & Accessibility | `#26` | `SRS-NFR-14` | `TS-S3-USA-02` (Lighthouse/axe) | Automated (CI) |
| `NFR-USA-03` | Usability & Accessibility | `#26` | `SRS-NFR-15` | `TS-S3-USA-03` (i18n & RTL Check) | Semi-Automated |

---

## 6. Architectural Alignment & Open Placeholders (For Review)

> **Action Required (`@huseyinzor`, `@akgozmirza`):** Please review and confirm the following architectural placeholders before Sprint 3 test environment provisioning:
> 1. `[TBD: Frontend/Mobile Framework]` — Confirm target client stack for Offline-First queue & Lighthouse/Playwright E2E tests.
> 2. `[TBD: Cloud Provider]` — Confirm hosting environment for 10,000 VU load testing and uptime monitoring.
> 3. `[TBD: SMS Gateway Provider]` — Confirm sandbox/mock endpoint for 2G SMS fallback verification.
