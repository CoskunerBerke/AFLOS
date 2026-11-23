-- AFLOS Issue #31: PROPOSED PostgreSQL schema for UML/ERD consistency.
-- NOT an existing deployed or approved migration. Review with DevOps/PO before use.
-- Baseline OpenAPI and Sprint 2 SRS do not currently agree on all states and fields.
BEGIN;

CREATE TABLE user_account (
  id UUID PRIMARY KEY NOT NULL,
  role TEXT NOT NULL CHECK (role IN ('REPORTER','CARRIER','FIELD_STAFF','WAREHOUSE_STAFF','COORDINATOR','ADMIN')),
  created_at TIMESTAMPTZ NOT NULL
);

CREATE TABLE aid_zone (
  id UUID PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  latitude NUMERIC(9,6) NOT NULL,
  longitude NUMERIC(9,6) NOT NULL,
  disaster_type TEXT NOT NULL,
  status TEXT NOT NULL CHECK (status IN ('ACTIVE','DEACTIVATED'))
);

CREATE TABLE aid_request (
  id UUID PRIMARY KEY NOT NULL,
  reporter_id UUID REFERENCES user_account(id),
  zone_id UUID REFERENCES aid_zone(id),
  review_status TEXT NOT NULL CHECK (review_status IN ('PENDING_VERIFICATION','VERIFIED','REJECTED')),
  lifecycle_state TEXT NOT NULL CHECK (lifecycle_state IN ('PENDING','VERIFIED','DISPATCHED','DELIVERED','ARCHIVED','REJECTED')),
  latitude NUMERIC(9,6) NOT NULL,
  longitude NUMERIC(9,6) NOT NULL,
  contact_phone_encrypted BYTEA,
  urgency_score NUMERIC(3,1) CHECK (urgency_score BETWEEN 1 AND 10),
  tracking_token_hash TEXT,
  submitted_at TIMESTAMPTZ NOT NULL
);

CREATE TABLE aid_request_line (
  id UUID PRIMARY KEY NOT NULL,
  request_id UUID NOT NULL REFERENCES aid_request(id),
  category TEXT NOT NULL,
  item_name TEXT NOT NULL,
  quantity NUMERIC(14,2) NOT NULL,
  unit TEXT NOT NULL,
  CHECK (quantity > 0)
);

CREATE TABLE aid_need (
  id UUID PRIMARY KEY NOT NULL,
  zone_id UUID NOT NULL REFERENCES aid_zone(id),
  category TEXT NOT NULL,
  item_name TEXT NOT NULL,
  unit TEXT NOT NULL,
  required_quantity NUMERIC(14,2) NOT NULL,
  reserved_quantity NUMERIC(14,2) NOT NULL,
  delivered_quantity NUMERIC(14,2) NOT NULL,
  CHECK (required_quantity >= 0),
  CHECK (reserved_quantity >= 0),
  CHECK (delivered_quantity >= 0),
  CHECK (reserved_quantity + delivered_quantity <= required_quantity)
);

CREATE TABLE time_slot (
  id UUID PRIMARY KEY NOT NULL,
  zone_id UUID NOT NULL REFERENCES aid_zone(id),
  starts_at TIMESTAMPTZ NOT NULL,
  ends_at TIMESTAMPTZ NOT NULL,
  max_vehicles INTEGER NOT NULL,
  assigned_vehicles INTEGER NOT NULL,
  CHECK (starts_at < ends_at),
  CHECK (max_vehicles > 0),
  CHECK (assigned_vehicles BETWEEN 0 AND max_vehicles)
);

CREATE TABLE vehicle (
  id UUID PRIMARY KEY NOT NULL,
  carrier_id UUID NOT NULL REFERENCES user_account(id),
  license_plate TEXT NOT NULL UNIQUE,
  vehicle_type TEXT NOT NULL,
  capacity_kg NUMERIC(14,2) NOT NULL,
  CHECK (capacity_kg > 0)
);

CREATE TABLE shipment (
  id UUID PRIMARY KEY NOT NULL,
  carrier_id UUID NOT NULL REFERENCES user_account(id),
  vehicle_id UUID NOT NULL REFERENCES vehicle(id),
  target_zone_id UUID NOT NULL REFERENCES aid_zone(id),
  time_slot_id UUID NOT NULL REFERENCES time_slot(id),
  status TEXT NOT NULL CHECK (status IN ('CONFIRMED','IN_TRANSIT','DELIVERED','CANCELLED','NO_SHOW')),
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ NOT NULL
);

CREATE TABLE shipment_item (
  id UUID PRIMARY KEY NOT NULL,
  shipment_id UUID NOT NULL REFERENCES shipment(id),
  aid_need_id UUID NOT NULL REFERENCES aid_need(id),
  pledged_quantity NUMERIC(14,2) NOT NULL,
  actual_delivered_quantity NUMERIC(14,2),
  CHECK (pledged_quantity > 0),
  CHECK (actual_delivered_quantity IS NULL OR actual_delivered_quantity >= 0)
);

CREATE TABLE warehouse (
  id UUID PRIMARY KEY NOT NULL,
  zone_id UUID REFERENCES aid_zone(id),
  name TEXT NOT NULL,
  latitude NUMERIC(9,6) NOT NULL,
  longitude NUMERIC(9,6) NOT NULL
);

CREATE TABLE stock_item (
  id UUID PRIMARY KEY NOT NULL,
  warehouse_id UUID NOT NULL REFERENCES warehouse(id),
  category TEXT NOT NULL,
  item_name TEXT NOT NULL,
  unit TEXT NOT NULL,
  on_hand_quantity NUMERIC(14,2) NOT NULL,
  reserved_quantity NUMERIC(14,2) NOT NULL,
  barcode TEXT,
  lot_number TEXT,
  CHECK (on_hand_quantity >= 0),
  CHECK (reserved_quantity >= 0),
  CHECK (reserved_quantity <= on_hand_quantity)
);

CREATE TABLE stock_reservation (
  id UUID PRIMARY KEY NOT NULL,
  stock_item_id UUID NOT NULL REFERENCES stock_item(id),
  shipment_item_id UUID NOT NULL REFERENCES shipment_item(id),
  quantity NUMERIC(14,2) NOT NULL,
  status TEXT NOT NULL CHECK (status IN ('ACTIVE','RELEASED','CONSUMED')),
  CHECK (quantity > 0)
);

CREATE TABLE handover_proof (
  id UUID PRIMARY KEY NOT NULL,
  shipment_id UUID NOT NULL REFERENCES shipment(id),
  verifier_user_id UUID NOT NULL REFERENCES user_account(id),
  proof_method TEXT NOT NULL CHECK (proof_method IN ('PLATE_CODE','SIGNED_QR')),
  proof_hash TEXT NOT NULL,
  confirmed_at TIMESTAMPTZ,
  server_verified BOOLEAN NOT NULL
);

CREATE TABLE audit_entry (
  id UUID PRIMARY KEY NOT NULL,
  actor_id UUID REFERENCES user_account(id),
  entity_type TEXT NOT NULL,
  entity_id UUID NOT NULL,
  action TEXT NOT NULL,
  occurred_at TIMESTAMPTZ NOT NULL,
  payload JSONB NOT NULL
);

CREATE TABLE idempotency_record (
  id UUID PRIMARY KEY NOT NULL,
  actor_scope TEXT NOT NULL,
  http_method TEXT NOT NULL,
  path TEXT NOT NULL,
  idempotency_key TEXT NOT NULL,
  payload_hash TEXT NOT NULL,
  result JSONB NOT NULL,
  expires_at TIMESTAMPTZ NOT NULL
);

CREATE UNIQUE INDEX ux_idempotency_request ON idempotency_record(actor_scope, http_method, path, idempotency_key);
CREATE INDEX ix_request_review_zone ON aid_request(zone_id, review_status);
CREATE INDEX ix_request_state ON aid_request(lifecycle_state);
CREATE INDEX ix_stock_warehouse ON stock_item(warehouse_id);
CREATE INDEX ix_slot_zone ON time_slot(zone_id, starts_at);
CREATE INDEX ix_shipment_zone ON shipment(target_zone_id, status);
CREATE INDEX ix_audit_entity ON audit_entry(entity_type, entity_id, occurred_at);
COMMIT;

-- Concurrency: use SELECT ... FOR UPDATE when booking slots and allocating need/warehouse stock.
-- Cross-row shipment/stock invariants require transactional service logic + tests.
-- Treat audit_entry as append-only via separate DB privileges (no UPDATE/DELETE to application role).
-- Client-side IndexedDB offline queue is NOT a PostgreSQL table; replay dedupe uses idempotency_record.
-- aid_request.lifecycle_state is a PROPOSED workflow projection, not a field in OpenAPI v0.1.0.
