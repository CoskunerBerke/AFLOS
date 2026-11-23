workspace "AFLOS" "Sprint 2 C4 architecture design proposal, including SRS additions" {
    model {
        citizen = person "Citizen / Reporter" "Reports aid needs and uses public dashboard"
        carrier = person "Carrier" "Books deliveries and reports departures"
        field = person "Field / Warehouse Staff" "Receives aid stock and verifies handovers"
        coordinator = person "Coordinator" "Manages operational zones, fleet and emergencies"
        admin = person "System Administrator" "Audits the system"
        tiles = softwareSystem "OpenStreetMap Tile Provider" "External map layers" { tags "External" }
        smsgw = softwareSystem "SMS Gateway" "SRS target integration, not present in the current OpenAPI" { tags "SRS-Proposed" }
        aflos = softwareSystem "AFLOS" "Disaster logistics and aid coordination" {
            edge = container "NGINX Edge" "Routes HTTPS web and API traffic" "NGINX"
            web = container "Responsive Web Client" "Web maps, forms and dashboard" "Browser"
            pwa = container "Offline PWA Queue" "Service Worker and IndexedDB replay, SRS target" "Browser PWA" { tags "SRS-Proposed" }
            api = container "Backend REST API" "Current OpenAPI 3.1 contract" "HTTP/JSON" {
                router = component "API Adapter" "Routing and validation"
                auth = component "RBAC and Authorization" "Enforces role, owner and zone scope"
                need = component "Need and Zone Service" "Reports, zones, time slots"
                booking = component "Booking and Dispatch Engine" "Atomic slot and pledge reservation"
                inventory = component "Item Quota Accounting" "Reserved and delivered quantities"
                handover = component "Handover Verification" "Plate, one-use code and actual item quantities"
                lifecycle = component "Shipment Lifecycle" "Five contractual states"
                dashboard = component "Public Read Model" "Anonymized dashboard and zone results"
                audit = component "Audit and Idempotency" "Append-only and replay-safe mutations"
                triage = component "Priority and Duplicate Triage" "FR-103/104 extension" { tags "SRS-Proposed" }
                warehouse = component "Warehouse Stock and Barcode Ledger" "FR-201/203/205 extension" { tags "SRS-Proposed" }
                routing = component "Route and Telemetry Service" "FR-303/305/402 extension" { tags "SRS-Proposed" }
                sms = component "SMS Adapter" "FR-105 extension" { tags "SRS-Proposed" }
                sync = component "Offline Replay API" "FR-405 extension, endpoints TBD" { tags "SRS-Proposed" }
                qr = component "Offline QR Verification" "FR-304 extension, protocol TBD" { tags "SRS-Proposed" }
            }
            db = container "PostgreSQL" "Aid operations and audit records" "PostgreSQL" { tags "Database" }
            cache = container "Public HTTP Cache" "Proposed optional edge caching" "TBD" { tags "SRS-Proposed" }
            redis = container "Redis Spatial Index" "SRS spatial/queue proposal" "Redis" { tags "SRS-Proposed" }
        }
        citizen -> aflos "Reports needs / views maps"
        carrier -> aflos "Books and tracks deliveries"
        field -> aflos "Receives stock and confirms delivery"
        coordinator -> aflos "Operates zones, fleet and crisis decisions"
        admin -> aflos "Reviews security and audit"
        aflos -> tiles "Uses map tiles" "HTTPS"
        aflos -> smsgw "Proposed SMS intake and alerts" "TBD"
        citizen -> edge "Uses AFLOS" "HTTPS"
        carrier -> edge "Uses AFLOS" "HTTPS"
        field -> edge "Uses AFLOS" "HTTPS"
        coordinator -> edge "Uses AFLOS" "HTTPS"
        admin -> edge "Uses AFLOS" "HTTPS"
        edge -> web "Serves browser application" "HTTPS"
        web -> edge "Calls domain API" "HTTPS"
        edge -> api "Forwards API requests" "HTTP/JSON"
        web -> tiles "Downloads map tiles" "HTTPS"
        web -> pwa "Queues offline actions" "Browser APIs"
        pwa -> api "Proposed replay and conflict reconciliation" "TBD"
        api -> db "Stores operational data" "SQL"
        cache -> api "Optional public cache refresh" "TBD"
        api -> redis "Proposed spatial queries" "TBD"
        router -> auth "Authorizes requests"
        router -> need "Delegates reporting"
        router -> booking "Delegates booking"
        router -> handover "Delegates delivery verification"
        router -> dashboard "Delegates dashboard reads"
        router -> audit "Delegates audit operations"
        booking -> inventory "Reserves item deficits"
        booking -> lifecycle "Creates confirmed shipments"
        handover -> lifecycle "Completes deliveries"
        handover -> inventory "Reconciles actual delivered quantity"
        need -> triage "Proposed scoring and deduplication"
        inventory -> warehouse "Proposed physical stock ledger"
        booking -> routing "Proposed route optimization"
        need -> sms "Proposed SMS intake"
        handover -> qr "Proposed offline QR proof"
        router -> sync "Proposed synchronization endpoint"
    }
    views {
        systemContext aflos "SystemContext" {
            include *
            autoLayout lr
        }
        container aflos "Containers" {
            include *
            autoLayout tb
        }
        component api "APIComponents" {
            include *
            autoLayout tb
        }
        styles {
            element "Person" { shape person background #08427b color #ffffff }
            element "Software System" { background #1168bd color #ffffff }
            element "Container" { background #438dd5 color #ffffff }
            element "Component" { background #85bbf0 color #000000 }
            element "Database" { shape cylinder }
            element "External" { background #777777 color #ffffff }
            element "SRS-Proposed" { background #fff1cf color #5b4500 }
        }
    }
}
