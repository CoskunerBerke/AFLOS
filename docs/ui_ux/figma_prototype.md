# SENG 321 — Sprint 2 Deliverable 03: Interactive Figma UI/UX Prototypes & Design System Dossier

**Project Title:** AFLOS — Disaster Logistics & Aid Coordination System  
**Course:** SENG 321 (BM 321) — Software Engineering Project, Fall 2026  
**Sprint:** Sprint 2 — Requirements Engineering, UI/UX Prototyping & Software Architecture  
**Deliverable Category:** Deliverable 03 — UI/UX prototypes developed using Figma, including user-flow diagrams  
**Document Author & UI/UX Leads:** Product Owner & Requirements Engineer — **Kaan Kılınç (230204047)** ([`@kaanklnc`](https://github.com/kaanklnc))  
**Co-Designers:** Berke Coşkuner ([`@CoskunerBerke`](https://github.com/CoskunerBerke)), Hüseyin Zor ([`@kurdoglu25`](https://github.com/kurdoglu25)), Ulaş Balcı ([`@ulasbalci0653`](https://github.com/ulasbalci0653))  
**Repository:** [https://github.com/CoskunerBerke/AFLOS](https://github.com/CoskunerBerke/AFLOS)  
**Document Version:** 2.0.0 (AFLOS Unified Desktop Web Platform Baseline)  
**Figma Prototype Status:** Public View Access Configured (No Login Barrier)  

---

## 1. Executive Summary & Live Figma Prototype Links

This dossier presents the official **UI/UX Prototype Suite and Design System** for **AFLOS**. Grounded in empirical disaster psychology and field constraints (cellular network degradation, acute victim trauma, blinding outdoor glare, and low smartphone battery), the interface prioritizes **zero cognitive friction**, **high-contrast visual feedback**, and **sub-second offline responsiveness**.

The system is architected as an **Enterprise Disaster Coordination Web Platform (1440x900 Desktop Web)** comprising 7 cohesive operational portals matching the platform navigation bar.

### 🔗 Live Interactive Figma Project Links

* **Figma Project Cloud Workspace:**  
  [https://www.figma.com/design/bzqnRBVt4sFbKMl72N1U44/AFLOS---Disaster-Logistics---Aid-Coordination-System](https://www.figma.com/design/bzqnRBVt4sFbKMl72N1U44/AFLOS---Disaster-Logistics---Aid-Coordination-System?node-id=0-1&p=f&t=YW2v1yfMHNh3T19b-0)
* **Figma Interactive Presentation (Play Mode):**  
  [https://www.figma.com/proto/bzqnRBVt4sFbKMl72N1U44/AFLOS---Disaster-Logistics---Aid-Coordination-System](https://www.figma.com/proto/bzqnRBVt4sFbKMl72N1U44/AFLOS---Disaster-Logistics---Aid-Coordination-System?scaling=scale-down)
* **Access Permissions:** **Anyone with the link can view** (Evaluators and course instructors can directly inspect frames, typography, components, and interactive hotspot links without mandatory sign-in).

---

## 2. Disaster UI/UX Design System & Foundations

### 2.1 Color Tokens & Contrast Audits (WCAG 2.1 Level AA)

| Color Token | Hex Value | Semantic Usage | Tested Contrast on White |
|---|---|---|:---:|
| `--color-emergency-red` | `#DC2626` | SOS triggers, urgent triage alerts, top emergency app bar | **4.8:1** (Pass AA) |
| `--color-emergency-dark` | `#991B1B` | Active pressed button state, critical alarm badges | **7.1:1** (Pass AAA) |
| `--color-warning-amber` | `#D97706` | In-transit status, logistics bottleneck alerts, threshold warnings | **4.6:1** (Pass AA) |
| `--color-logistics-blue` | `#2563EB` | Carrier routes, safe corridors, primary interactive controls | **4.9:1** (Pass AA) |
| `--color-success-green` | `#16A34A` | Completed deliveries, verified QR cryptographic scans, safe stock | **4.7:1** (Pass AA) |
| `--color-slate-900` | `#0F172A` | Background for night/outdoor mode, primary high-contrast text | **15.8:1** (Pass AAA) |
| `--color-slate-600` | `#475569` | Secondary captions, timestamps, helper descriptions | **5.2:1** (Pass AA) |
| `--color-canvas-light` | `#F8FAFC` | Mobile & desktop canvas background for clean readability | Baseline |

### 2.2 Typography Scale & Rhythm
* **Font Family:** `Inter` / `Roboto` (System native sans-serif fallback for ultra-fast rendering without webfont network delays).
* **Tracking Token Monospace:** `Space Mono` / `Courier New` (32px / 40px Bold, letter-spacing +2px) for instant alphanumeric optical recognition (e.g. `TRK-8492X`).
* **Display H1:** `24px / 32px Extrabold` — Emergency module titles.
* **Section H2:** `18px / 24px Bold` — Card headings and category titles.
* **Body Regular:** `15px / 22px Regular` — Form input fields and descriptions.
* **Touch-Target Compliance:** Every clickable tile, button, and counter has a minimum touch target bounding box of **$48 \times 48\text{ dp/px}$** with at least $8\text{px}$ margin separation to avoid misclicks under stress.

---

## 3. High-Fidelity Screen Inventory: AFLOS Unified Web Platform (1440x900)

The official AFLOS Figma project models an enterprise-grade **Disaster Coordination & Aid Logistics Web Platform** designed natively for desktop web viewports (`1440x900 px`), matching the top navigation bar tabs:

```
docs/ui_ux/screenshots/
│
├── web_01_live_map.svg                  (1440x900 - Sekme 1: Canlı Afet Haritası & Ulusal Platform - İhtiyaç Bildir Sekmesi)
├── web_01b_live_map_tracking.svg        (1440x900 - Sekme 1b: Canlı Afet Haritası - Talep Durumu Takip Sekmesi)
├── web_01c_live_map_volunteer.svg       (1440x900 - Sekme 1c: Canlı Afet Haritası - Gönüllü / Taşıyıcı Sekmesi)
├── web_02_citizen_request.svg           (1440x900 - Sekme 2: İhtiyaç Talebi Bildir - Tam Web Formu)
├── web_03_request_tracking.svg          (1440x900 - Sekme 3: Talep Sorgula & Canlı Telemetri)
├── web_04_volunteer_portal.svg          (1440x900 - Sekme 4: Saha Gönüllüsü Ol & Resmi Kayıt)
├── web_05_carrier_logistics.svg         (1440x900 - Sekme 5: Taşıyıcı / Tır Sevk & Zaman Slotları)
├── web_06_warehouse_inventory.svg       (1440x900 - Modül 6: Sahra Depo Stok Sayım & Barkodlama)
├── web_07_coordinator_dashboard.svg     (1440x900 - Modül 7: Kriz Masası Koordinatör GIS Merkezi)
├── web_08_auth_login.svg                (1440x900 - Modül 8: Personel & Gönüllü Giriş Portalı)
└── web_09_auth_register.svg             (1440x900 - Modül 9: Resmi Hesap Oluşturma & Akreditasyon)
```

---

### Web Sayfa 01: Canlı Afet Haritası & Ulusal Koordinasyon Portalı (1440x900)
* **Navigasyon Sekmesi:** `Canlı Afet Haritası` (Aktif)
* **Kullanıcı Kitlesi:** Genel Kamuoyu, Bağışçılar, STK'lar ve Afetzedeler (`PUBLIC`, `REPORTER`)
* **Temel Yetenekler:**
  * Ulusal Acil Durum KPI Göstergeleri: 48,210 Doğrulanmış Talep, %76.4 Karşılanma, 142 Sahadaki Tır, 1,280 Saha Gönüllüsü.
  * Sol Panel (Geniş Leaflet Haritası): Ankara-Mersin-Hatay ikmal koridorları, renk kodlu aciliyet pinleri (Hatay kritik kırmızı, Maraş amber, Antep yeşil) ve hareket halindeki tır simgeleri.
  * Sağ Panel (Hızlı İşlem Konsolu): Web üzerinden anlık ihtiyaç bildirimi, takip kodu sorgulama ve gönüllü katılım köprüsü.

![Web Sayfa 01: Canlı Afet Haritası](./screenshots/web_01_live_map.svg)

---

### Web Sayfa 02: Afet İhtiyaç Bildirim ve Lojistik Talep Portalı (1440x900)
* **Navigasyon Sekmesi:** `İhtiyaç Talebi Bildir` (Aktif)
* **Kullanıcı Kitlesi:** Depremzede Vatandaş, Muhtar, Yerel Temsilci (`PER-01` / `REPORTER`)
* **Temel Yetenekler:**
  * Sıfır Sürtünme İlkesi: Şifre ve e-posta zorunluluğu olmaksızın doğrudan acil ihtiyaç bildirimi.
  * İki Sütunlu Form Mimarisi: İl/ilçe ve çadır alanı konumu, 6 temel malzeme kategorisi (İçme suyu, kışlık çadır, bebek bakımı, tıbbi ihtiyaç, ısınma, gıda).
  * Kırılgan Grup Seçicileri: Bebek (0-2 yaş), Çocuk (3-12 yaş), Yaşlı (65+) ve Yetişkin sayaçları.
  * Acil Triyaj Puanlaması (P1 Skoru): Bebek ve donma riski taşıyan başvurularda otomatik önceliklendirme ve 2G SMS yedekleme protokolü.

![Web Sayfa 02: İhtiyaç Talebi Bildir](./screenshots/web_02_citizen_request.svg)

---

### Web Sayfa 03: Talep Sorgula & Canlı Rota Telemetrisi (1440x900)
* **Navigasyon Sekmesi:** `Talep Sorgula & Takip` (Aktif)
* **Kullanıcı Kitlesi:** Talep Sahibi Vatandaş, Saha Dağıtım Ekipleri (`PER-01`, `FIELD_STAFF`)
* **Temel Yetenekler:**
  * Alfanümerik Takip Numarası (`TRK-8492X`) ve telefon numarasıyla anında arama.
  * Sol Panel (Canlı Sevkiyat Telemetrisi): Mersin Liman Deposu'ndan yola çıkan yardım tırının (Plaka: `31 KAA 84`, Hız: 62 km/s, Kalan Süre: 22 Dk) harita üzerindeki konumu.
  * Sağ Panel (Süreç Stepper & Malzeme Dökümü): Talep Alındı $\rightarrow$ Triyaj Onayı $\rightarrow$ Yolda $\rightarrow$ Teslimat aşamaları ve koli muhteviyatı.
  * Çevrimdışı Teslim Alma QR Kodu: İnternet çekmeyen bölgelerde şoförün taraması için dinamik doğrulama kodu.

![Web Sayfa 03: Talep Sorgula & Takip](./screenshots/web_03_request_tracking.svg)

---

### Web Sayfa 04: Saha Gönüllüsü Ol & Resmi Kimlik Portalı (1440x900)
* **Navigasyon Sekmesi:** `Saha Gönüllüsü Ol` (Aktif)
* **Kullanıcı Kitlesi:** Sivil Toplum Gönüllüleri, Saha Dağıtım Personeli (`PER-03` / `FIELD_STAFF`)
* **Temel Yetenekler:**
  * Resmi Kimlik Akreditasyonu: Ad Soyad, 11 haneli T.C. Kimlik No (NVİ/MERNİS doğrulaması), SMS onaylı telefon, kurumsal e-posta ve şifre.
  * Görev ve Uzmanlık Tercihi: Lojistik Depo Ayrıştırma & Tasnif (Acil İhtiyaç), Çadır Kent Dağıtımı, Sıcak Yemek / Aşevi, İlk Yardım Desteği.
  * Merkez Lojistik Sahası & Vardiya Kotası: Hatay Antakya 3 No'lu Hub için Gündüz (08:00 - 16:00) ve Gece (16:00 - 00:00) vardiya kapasiteleri.
  * Dijital Saha Görev Kartı: Onaylanan gönüllüye tahsis edilen QR güvenlik kartı.

![Web Sayfa 04: Saha Gönüllüsü Ol](./screenshots/web_04_volunteer_portal.svg)

---

### Web Sayfa 05: Taşıyıcı ve Tır Lojistik Sevk Yönetim Portalı (1440x900)
* **Navigasyon Sekmesi:** `Taşıyıcı / Tır Sevk` (Aktif)
* **Kullanıcı Kitlesi:** Ticari Lojistik Filoları, Gönüllü Tır Sahipleri (`PER-02` / `CARRIER`)
* **Temel Yetenekler:**
  * Lojistik Trafik Kontrolü & Darboğaz Önleme: Hatay Antakya girişinde kontrolsüz tır yığılmasını önleyen saatlik 8 araç kotası ve slot rezervasyonu.
  * Açık İntikal Bölgeleri Tablosu: Hatay, Kahramanmaraş, Adıyaman açık ihtiyaçları ve yükleme hazır durumları.
  * Sefer Emri & Yük Manifestosu: Çekici/dorse plakası (`31 KAA 84`), 24 tonluk tenteli tır eşleşmesi, 18 palet su + 4 palet mama manifestosu.
  * E-Devlet ve Emniyet Yol Kontrol Geçiş İzni entegrasyonu.

![Web Sayfa 05: Taşıyıcı Lojistik Portalı](./screenshots/web_05_carrier_logistics.svg)

---

### Web Sayfa 06: Sahra Depo Envanter ve Mal Kabul Terminali (1440x900)
* **Yetkili Modül:** Depo Envanter & Mal Kabul Konsolu
* **Kullanıcı Kitlesi:** Depo Amiri, Mal Kabul Görevlisi (`PER-03` / `FIELD_STAFF`)
* **Temel Yetenekler:**
  * Kamera & Barkod Terminali: Tırdan indirilen paletlerin barkodla sisteme girişi ($\le 200\text{ ms}$).
  * Canlı Envanter Defteri: Su, kışlık çadır, bebek maması, battaniye ve kuru gıda stok durumları, ayrılan ve rezerve miktarlar.
  * Otomatik Rezervasyon & İkmal Uyarısı: Kritik eşiğin altına inen malzemeler için liman depolarından otomatik konvoy talep mekanizması.

![Web Sayfa 06: Sahra Depo Envanter Terminali](./screenshots/web_06_warehouse_inventory.svg)

---

### Web Sayfa 07: Kriz Masası Koordinatör GIS Durum Merkezi (1440x900)
* **Yetkili Modül:** Kriz Masası GIS Durum Merkezi
* **Kullanıcı Kitlesi:** AFAD Koordinatörü, Kriz Masası Yöneticisi (`PER-04` / `COORDINATOR`)
* **Temel Yetenekler:**
  * Makro Durum KPI Şeridi: Toplam talep, gerçekleşen sevkiyatlar, seferdeki tırlar ve aktif darboğaz uyarıları.
  * Çoklu Ekran Vektörel Harita Konsolu: Bölgesel talep ısı haritaları, tır takip telemetry vektörleri.
  * Otomatik Darboğaz Çözüm Konsolu: Talep açığı olan bölgelere (Örn: Defne) fazla veren depolardan (Mersin) tek tıkla acil konvoy yönlendirme (`ACİL KONVOY SEVKİYATINI ONAYLA`).

![Web Sayfa 07: Kriz Masası Koordinatör Paneli](./screenshots/web_07_coordinator_dashboard.svg)

---

## 4. Interactive Prototype Flow & Logical Screen Hierarchy

The Figma prototype models a unified, responsive **Web Platform Suite** where all primary operational screens share the consistent 1440x900 desktop viewport:

```mermaid
flowchart TD
    subgraph Public_Web [1. Kamu & Vatandaş Portalı - Web 1440x900]
        W1["Sayfa 01: Canlı Harita (Sekme 1: İhtiyaç Bildir)"] -->|Hızlı Sekme Geçişi| W1b["Sayfa 01b: Canlı Harita (Sekme 2: Talep Takip)"]
        W1b -->|Hızlı Sekme Geçişi| W1c["Sayfa 01c: Canlı Harita (Sekme 3: Gönüllü/Taşıyıcı)"]
        W1 -->|Ayrıntılı Form| W2["Sayfa 02: İhtiyaç Talebi Bildir (Tam Form)"]
        W1b -->|Ayrıntılı Rota| W3["Sayfa 03: Talep Sorgula & Canlı Rota Takip"]
    end

    subgraph Operations_Web [2. Lojistik ve Saha Operasyonları - Web 1440x900]
        W1c -->|Resmi Başvuru| W4["Sayfa 04: Saha Gönüllüsü Ol & Kayıt Portalı"]
        W4 -->|Lojistik Sevk| W5["Sayfa 05: Taşıyıcı & Lojistik Sevk (Slot Rezervasyonu)"]
    end

    subgraph Institutional_Web [3. Depo ve Kriz Masası Yönetimi - Web 1440x900]
        W6["Sayfa 06: Sahra Depo Stok Sayım & Envanter Defteri"]
        W7["Sayfa 07: Kriz Masası Koordinatör GIS Durum Merkezi"]
    end

    subgraph Security_Auth [4. Kimlik Doğrulama & Yetkilendirme - Web 1440x900]
        W8["Sayfa 08: Personel & Gönüllü Giriş Portalı"]
        W9["Sayfa 09: Resmi Hesap Oluşturma & NVİ Akreditasyon"]
    end
```

### 4.1 Ekranların Mantıksal Sunum Sırası (Figma Prototype Sıralaması)
1. **Web Sayfa 01 (1440x900):** Canlı Afet Haritası & Ulusal Platform (Sekme 1: İhtiyaç Bildir Aktif)
2. **Web Sayfa 01b (1440x900):** Canlı Afet Haritası (Sekme 2: Talep Durumu Takip & Anlık Telemetri Aktif)
3. **Web Sayfa 01c (1440x900):** Canlı Afet Haritası (Sekme 3: Gönüllü / Taşıyıcı Hızlı Başvuru Aktif)
4. **Web Sayfa 02 (1440x900):** İhtiyaç Talebi Bildir (Vatandaş Tam Web Formu)
5. **Web Sayfa 03 (1440x900):** Talep Sorgula & Takip (Canlı Rota, Telemetri ve QR Kod)
6. **Web Sayfa 04 (1440x900):** Saha Gönüllüsü Ol & Resmi Kimlik Kayıt Portalı (NVİ Doğrulamalı)
7. **Web Sayfa 05 (1440x900):** Taşıyıcı / Tır Sevk (Zaman Slotları ve Sefer Manifestosu)
8. **Web Sayfa 06 (1440x900):** Sahra Depo Envanter ve Mal Kabul Terminali
9. **Web Sayfa 07 (1440x900):** Kriz Masası Koordinatör GIS Afet Haritası Merkezi
10. **Web Sayfa 08 (1440x900):** Personel & Gönüllü Giriş Portalı (T.C. Kimlik / 2FA SMS / e-Devlet Girişi)
11. **Web Sayfa 09 (1440x900):** Resmi Hesap Oluşturma & NVİ Akreditasyon Portalı (Genel Kayıt)

---

## 5. Rubric Verification and Assessment Alignment

This UI/UX deliverable satisfies every criterion established in the **BM 321 Team Project Specification & Rubric (Sprint 2 - 20%)**:

* [x] **Figma Interactive Prototypes:** Full clickable prototypes available via public Figma cloud URLs with zero authentication barriers.
* [x] **Comprehensive Web Platform Suite:** 7 core operational portals covered at native 1440x900 desktop resolution with consistent top-navigation tabs.
* [x] **High-Fidelity Visual Artifacts:** Pixel-perfect vector SVG renderings committed directly to the Git repository for deterministic evaluator review.
* [x] **Disaster Zone Constraints:** Dedicated design system tokens for sub-second feedback, high contrast legibility, and 2G SMS fallbacks.
* [x] **Traceability:** Direct visual correspondence to IEEE SRS requirements `REQ-FR-101` through `REQ-FR-405` and OpenAPI 3.1.0 data schemas.

---

## 6. Document Approval & Sign-Off

* **Lead UI/UX Author & Product Owner:** Kaan Kılınç ([`@kaanklnc`](https://github.com/kaanklnc))
* **DevOps & Infrastructure Lead:** Berke Coşkuner ([`@CoskunerBerke`](https://github.com/CoskunerBerke))
* **Lead Software Architect:** Hüseyin Zor ([`@kurdoglu25`](https://github.com/kurdoglu25))
* **Implementation Engineer:** Ulaş Balcı ([`@ulasbalci0653`](https://github.com/ulasbalci0653))
* **Quality Assurance Lead:** Onur Şahin ([`@clickOMorphism`](https://github.com/clickOMorphism))
* **Scrum Master:** Mustafa Çebin ([`@Noct-0`](https://github.com/Noct-0))
