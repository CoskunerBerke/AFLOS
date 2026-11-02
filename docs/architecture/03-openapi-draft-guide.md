# SENG 321 – Sprint 1 Deliverable 3: OpenAPI Draft

**Proje:** AFLOS – Afet Lojistik ve Koordinasyon Sistemi  
**Çıktı sahibi:** Lead Software Architect / Technical Lead ekibi  
**Sürüm:** 0.1.0 – ekip incelemesine hazır taslak  
**Tarih:** 2 Kasım 2026  
**Ana çıktı:** [api/openapi.yaml](../../api/openapi.yaml)

## 1. Teslimin amacı ve sınırı

Bu teslim, arayüz ile sunucu ekibinin birlikte kullanacağı API sözleşmesidir. Sunucu uygulaması, veritabanı veya çalışan servis içermez. Dersin Sprint 1 gereksinimi olan geçerli OpenAPI YAML, kaynaklar, HTTP işlemleri, istek/yanıt şemaları ve örnek başarı/hata yanıtlarını sağlar. Ayrıntılı C4/UML teslimi ikinci sprint kapsamındadır.

Takım numarası, architect isimleri/öğrenci numaraları, GitHub issue/PR/commit bağlantıları ve Sprint 1 release etiketi henüz sağlanmadığı için uydurulmamıştır. Bunlar takımın teslim üst belgesine ve PR kaydına eklenmelidir.

## 2. Kaynaklar ve karar önceliği

Girdiler, Product Owner'ın paylaştığı `01-project-proposal.md`, `02-system-vision-and-boundary.md`, `06-initial-product-backlog.md` dosyaları ve 2 Kasım 2026 tarihinde bu çalışmaya aktarılan karar mesajıdır.

Çelişkide öncelik: **son açık PO kararı → güncel backlog → proposal/vision içindeki eski anlatım**. Kaynak dosyalar değiştirilmemiştir. Özellikle proposal ve vision içinde manuel taşıyıcı onayı, QR, güven puanlama, EXPIRED/APPROVED ve kategori toplamlarına ilişkin eski ifadeler kalmıştır. PO bu metinleri teslimden önce eşitlemelidir.

Resmî biçim kaynağı: [OpenAPI 3.1.0](https://spec.openapis.org/oas/v3.1.0.html). İşlem açıklamaları İngilizce, öğrenme ve karar notları Türkçedir. `x-user-stories` izlenebilirlik, `x-roles` uygulama yetkisi metaverisidir; bu alanlar kendiliğinden sunucuda yetki uygulamaz.

## 3. PO tarafından kesinleştirilen kurallar

- `POST /carrier-applications` doğrudan randevu oluşturur. Yolu backlog ile aynı tutulmuştur; manuel onay kuyruğu değildir.
- Rezervasyon tek atomik işlemde araç kontrolü, kota tüketimi, ihtiyaç rezervasyonu, CONFIRMED sevkiyat ve kod üretimini gerçekleştirir. Bir aşama başarısızsa tüm değişiklikler geri alınır.
- Durumlar yalnızca CONFIRMED, IN_TRANSIT, DELIVERED, CANCELLED ve NO_SHOW'dur.
- Saatlerde tarih ve UTC farkı bulunur. Örnek: `2026-11-05T08:00:00+03:00`.
- Aynı normalize plakanın çakışan aktif rezervasyonları engellenir. Bitiş ve başlangıcı aynı olan aralıklar çakışmaz: `[başlangıç, bitiş)`.
- `assignedVehicles`, CONFIRMED + IN_TRANSIT + DELIVERED randevularını sayar. DELIVERED kotayı açmaz; CANCELLED ve NO_SHOW rezervasyonu serbest bırakır.
- `reservedQuantity` CONFIRMED ve IN_TRANSIT yüklerini kapsar. Yola çıkışta tekrar artırılmaz.
- `openDeficit = max(0, requiredQuantity - reservedQuantity - deliveredQuantity)`.
- Teslimat her yük kalemi için fiili miktarı alır. Tüm taahhüt rezervasyonu kaldırılır, yalnızca gerçek miktar teslim hanesine eklenir.
- İlerleme nokta ve ihtiyaç kalemi bazlıdır. Farklı ürünler veya birimler toplanmaz.
- QR ve otomatik güven puanlama MVP'de yoktur.
- Kimlik doğrulama sorunu 401; rol/sahiplik/nokta yetkisi sorunu 403; geçersiz veri 400; durum/kapasite çakışması 409; istek sınırı 429.

## 4. Ana akışın açıklaması

1. Koordinatör noktayı ve tarihli slotlarını oluşturur.
2. Koordinatör ihtiyaç kalemlerini ekler. Sunucu her kaleme `itemId` verir.
3. Taşıyıcı slot ve bu ihtiyaç kimlikleriyle yük taahhüdü gönderir.
4. Başarılı işlem 201 ile sevkiyatı ve yalnızca yetkili tarafa doğrulama kodunu döndürür.
5. Taşıyıcı kendi sevkiyatını IN_TRANSIT yapar.
6. Atandığı noktada ve vardiyada yetkili saha görevlisi plaka/kod ve bütün gerçek miktarları gönderir. Alternatif olarak koordinatör gerekçe ve gerçek miktarlarla fallback işlemini yapar.
7. Sunucu tek teslimat kaydı oluşturur; kodu tüketir; miktarları ve audit kaydını atomik günceller.
8. Kamuya açık göstergeler en fazla belirtilen önbellek süresi kadar gecikmeli güncellenebilir.

### Kısmi teslimat örneği

| An | required | reserved | delivered | openDeficit | assignedVehicles |
|---|---:|---:|---:|---:|---:|
| Başlangıç | 100 | 0 | 0 | 100 | 0 |
| 100 birim randevu | 100 | 100 | 0 | 0 | 1 |
| Yola çıkış | 100 | 100 | 0 | 0 | 1 |
| 90 birim teslim | 100 | 0 | 90 | 10 | 1 |

Bu tabloda hiçbir birim iki kez düşülmez. Teslimat randevu kotasını açmaz. Aynı teslimat isteğinin tekrarı ikinci kez stok eklememelidir.

## 5. Backlog → sözleşme eşleştirmesi

Aşağıdaki yolların tamamı `/api/v1` sunucu tabanının altındadır. YAML'de yollar ayrıca `/api/v1` ile başlamaz; taban iki kez eklenmemelidir.

| Hikâye | İşlem | Başarı |
|---|---|---|
| US-01 | POST /need-requests | 201 NeedRequestReceipt |
| US-02 | GET /dashboard/summary; GET /aid-zones; GET /aid-zones/{zoneId} | 200 |
| US-03 | POST /aid-zones | 201 ZoneDetail |
| US-04 | POST /aid-zones/{zoneId}/needs | 201 Need |
| US-05 | POST /carrier-applications | 201 BookingReceipt |
| US-06 | PATCH /shipments/{shipmentId}/status | 200 Shipment |
| US-07 | POST /handover/verify | 200 DeliveryReceipt |
| US-08 | POST /handover/fallback | 200 DeliveryReceipt |
| US-09 | POST /standby-fleet | 201 Standby |
| US-10 | GET /admin/audit-logs | 200 AuditEntryList |

US-04'teki `remainingQuantity` ismi, `openDeficit` ile aynı değeri taşıyan uyumluluk alanı olarak korunmuştur. İleride tek isme indirilebilir. Her iki alan istemciden alınmaz; sunucu hesaplar.

### Destekleyici işlemler

Giriş, özel başvuru listeleri/inceleme, sevkiyat listesi/detayı/kod erişimi, iptal, no-show, yönlendirme, nokta kapatma, boş araç atama ve gönüllü işlemleri ana akışı tamamlamak için taslakta yer alır. Bunlar `x-scope` ile işaretlidir; yeni kesinleşmiş kullanıcı hikâyesi gibi gösterilmez. PO bunlar için backlog maddeleri açmalıdır.

Yönetici hesap/rol oluşturma ve dinamik ana kategori yönetimi henüz ayrıntılı hikâyelere sahip değildir. İlk taslak enum değerleri ve önceden hazırlanmış demo hesapları kullanır. Bu yönetim ekranlarının API'leri sonraki sözleşme sürümüne bırakılmıştır; bütün vision kapsamının tamamlandığı iddia edilmez. Harita kutucukları AFLOS REST sözleşmesine kopyalanmamıştır; harita hizmeti ayrı bağımlılıktır.

## 6. Yetki ve gizlilik yaklaşımı

| Kullanıcı | Erişim sınırı |
|---|---|
| PUBLIC | Aktif noktalar, anonim göstergeler ve ihtiyaç bildirimi gönderimi |
| REPORTER | Kendi gönüllü başvuruları; bildirimler varsayılan olarak anonim de gönderilebilir |
| CARRIER | Kendi araçları, rezervasyonları ve kodları |
| FIELD_STAFF | Yalnızca onaylı nokta/vardiya kapsamındaki operasyonlar; gelen sevkiyat listesi kod içermez |
| COORDINATOR | Nokta/ihtiyaç yönetimi, özel başvuru inceleme, istisnalar ve fallback |
| ADMIN | Audit okuma; otomatik operasyon yetkisi mirası varsayılmaz |

Saha yetkisi her istekte güncel görev kaydından değerlendirilir; yalnızca JWT içindeki eski zoneId yeterli sayılmaz. Üstlenilen ID'lere sahiplik kontrolü yapılır. Kamu yanıtlarında iletişim, plaka, kod veya erişim token'ı yoktur. Özel yanıtlarda `Cache-Control: no-store` tanımlıdır. Doğrulama kodu audit kayıtlarına yazılmaz.

Bunlar teknik tasarım kurallarıdır; hukuki uygunluk belgesi veya gerçek saldırı dayanıklılığı kanıtı değildir. Plaka + kod eşleştirmesi bağımsız iki faktörlü kimlik doğrulama garantisi olarak sunulmaz. Gerçek T.C. kimlik verisi bu ilk API taslağında toplanmaz; ihtiyaç ve saklama kararı ayrıca değerlendirilmelidir.

## 7. Açık noktalar ve açıkça işaretlenmiş taslak varsayımları

Bu konular incelemeyi engellemeden somut taslak üretmek için aşağıdaki şekilde ele alınmıştır. PO kararı olarak gösterilmezler.

| Kimlik | Taslak tercihi | İnceleyecek kişi |
|---|---|---|
| A-01 | `AFL-` + 6 büyük harf/rakam, örnek `AFL-7K49P2`. Kaynaklardaki `AFL-7492` ve `AFL-XXXX` altı karakter açıklamasıyla uyuşmuyor. Kod üretimi güvenli rastgelelik, aktif kapsamda çakışma kontrolü ve deneme sınırı gerektirir. | PO + Architect |
| A-02 | Açık ihtiyaç üstü taahhüt sessizce kırpılmaz, 409 NEED_EXCEEDED ile reddedilir. Arayüz yeni miktarı gösterip kullanıcı onayı alır. Eski proposal otomatik kırpma anlatıyor. | PO |
| A-03 | Aynı noktanın slotları çakışmaz; her slotun izin verilen araç türleri vardır. Başlangıcı geçmiş slota yeni randevu alınmaz. KG kesirli, diğer birimler tam sayıdır. | PO + Architect |
| A-04 | Teslimatta bütün taahhüt kalemleri tam bir kez gönderilir; teslim edilmeyen kalem sıfırdır. Plan üstü teslim ilk taslakta 409 ile reddedilir; ek ürün ve fazla teslim ayrı ürün kararı gerektirir. | PO + QA |
| A-05 | NO_SHOW yalnızca CONFIRMED sevkiyata slot bitiminden sonra uygulanır. PO'nun beş durumlu şeması IN_TRANSIT → NO_SHOW geçişi içermiyor. Yoldaki ancak gelmeyen/arızalanan araçların kapanışı açık karardır. Otomatik zamanlayıcı uygulaması bu dosyada yoktur. | PO + Architect |
| A-06 | Reroute atomik işlemle eski kota/rezervasyonu hedefe taşır, ihtiyaç kimliklerini birebir eşler, IN_TRANSIT'i korur ve kodu yeniler. Yeni hedefi koordinatör seçer; otomatik güvenli yol bulunmaz. PO normalde yalnız iptal/no-show için kota açılmasını söylediği için bu istisnanın onayı gerekir. | PO + Architect |
| A-07 | Gönüllü başvurusu için mevcut REPORTER/FIELD_STAFF hesabı gerekir. Onay nokta/vardiya görevlendirmesi yaratır. Demo hesabı üretimi geliştirme ortamında yapılır; public ADMIN kaydı yoktur. | PO + DevOps |
| A-08 | İhtiyaç doğrulama mevcut noktaya bağlanır; rapor doğrulamak otomatik ihtiyaç çoğaltmaz. Koordinatör nokta ve ihtiyacı ayrı açık işlemlerle yaratır. | PO |
| A-09 | Etki yaratan işlemler Idempotency-Key ister. Aynı çağrı tekrarı 24 saat aynı sonucu verir; farklı gövde aynı anahtar ile 409 olur. Kimlikli kullanıcıda kullanıcı/metot/yol/anahtar kapsamı; anonim bildirimde yüksek rastgelelikli anahtar ve metot/yol kapsamı kullanılır. Anahtar kişisel veri içermez. | Architect + QA |
| A-10 | Harita pin rengi için farklı birimleri birleştiren tek yüzde tanımlanmadı. API kalem ilerlemelerini verir; renk kuralı ve eşik sınırları PO kararı sonrası eklenir. Konum sınırı backlog'daki dikdörtgendir; gerçek ülke sınırı doğrulaması değildir. | PO |

## 8. Tekrar gönderim, yarış ve audit beklentileri

- Son kota için iki eşzamanlı rezervasyondan en fazla biri başarıyla sonuçlanmalı; diğeri 409 SLOT_FULL almalıdır.
- Farklı slotlarda aynı ihtiyaç için eşzamanlı rezervasyonlar da açık ihtiyacı aşmamalıdır. Yalnız slot kilitlemek yeterli değildir; ihtiyaç ve normalize araç kayıtları da tutarlı korunmalıdır.
- Tüm atomik değişiklikler ve başarılı idempotency kaydı birlikte kalıcılaşmalıdır. Audit ve miktar güncellemesi ayrışmamalıdır.
- İş kuralları yalnız JSON Schema ile uygulanamaz: tarih sırası, nokta/slot ilişkisi, mülkiyet, yinelenen itemId, miktar üst sınırı ve eşzamanlılık sunucuda uygulanır.
- Append-only uygulama kaydı, veritabanı yöneticisinin değiştiremeyeceği kriptografik kayıt garantisi değildir. Gerçek değiştirilemezlik ayrıca tasarlanır.

## 9. Doğrulama ve yeniden çalıştırma

[Doğrulama aracı](../../tools/validate_openapi.py) ve [bağımlılıklar](../../tools/requirements-openapi.txt) teslim paketindedir.

Proje kökünde, tercihen ayrı bir Python ortamında:

```bash
python3 -m pip install -r tools/requirements-openapi.txt
python3 tools/validate_openapi.py
```

Araç YAML'yi, OpenAPI 3.1 yapısını, dahili referansları, örnek gövdelerini ve zaman biçimlerini, benzersiz işlem adlarını, yol parametrelerini, 401/403 yanıtlarını, on hikâyenin kapsanmasını ve kamu yanıtlarındaki özel alanları kontrol eder. Sonuç [doğrulama raporuna](./openapi-validation-report.json) yazılır.

Bu bir çalışan sunucu testi değildir. Yetki, rezervasyon yarışı, zamanlayıcı, kalıcı kayıt ve stok güncellemesi davranışları uygulama geliştirildiğinde QA ile ayrıca test edilmelidir.

## 10. Takıma teslim ve GitHub izlenebilirliği

1. `api/openapi.yaml`, bu rehber, doğrulama raporu ve `tools/` altındaki doğrulama dosyalarını kendi architect dalınıza ekleyin.
2. Örneğin “Sprint 1: AFLOS OpenAPI draft” başlıklı issue açın; gerçek issue numarasını kullanın.
3. Commit ve PR açıklamasında US-01..US-10 eşleştirmesini, öncelik verilen PO kararlarını ve A-01..A-10 inceleme konularını belirtin.
4. Diğer architect, PO ve QA'dan ilgili alanları incelemelerini isteyin. Gözden geçirmeler depoda görünür olsun.
5. İnceleme düzeltmeleri sonrası takımın dal kurallarına göre birleştirin. Sprint 1 etiketi ve teslim bağlantılarını Scrum Master/DevOps ile tamamlayın.

Yerel dosyalar oluşturulmuştur; bu çalışma GitHub'a push, PR veya release oluşturma işlemi yapmamıştır. “Closes #US-03” yerine GitHub'ın gerçek sayısal issue bağlantısını (örneğin yalnız gerçekten varsa “Closes #12”) kullanın.
