# Mağaza Gönderimi — Denetim ve Düzeltme Raporu

**Tarih:** 2026-09-08
**Sürüm:** 1.5.0+26
**Dal:** `feature/v6-experiments`
**Bağlam:** iOS'ta yayında ([id6761445065](https://apps.apple.com/tr/app/betaller-taller-height-growth/id6761445065), yaş derecelendirmesi 9+, 8 dil). Play Store'a ilk gönderim hazırlanıyor.

Bu dosya iki şeyi bir arada tutar: uygulamanın tamamında yapılan taramanın bulguları ve bu bulgulara karşılık **uygulanan** düzeltmeler. Uygulanmayanlar ve nedenleri en sonda.

---

## 1. Uygulanan düzeltmeler

### 1.1 Release paketi debug anahtarıyla imzalanıyordu — ENGELLEYİCİ

Denetimden önce derlenen AAB'nin sertifikası:

```
keytool -printcert -jarfile app-release.aab
Owner: C=US, O=Android, CN=Android Debug
```

Play Console bunu doğrudan reddeder. `android/app/build.gradle.kts` içinde `signingConfig = signingConfigs.getByName("debug")` satırı ve üzerinde duran `// TODO: Add your own signing config` yorumu vardı.

**Değişen dosyalar**
- `android/app/build.gradle.kts` — `key.properties` okuyan gerçek bir `release` imzalama yapılandırması eklendi. Dosya yoksa build **devam eder ama yüksek sesle uyarır**, böylece yayınlanamayacak bir paket sessizce üretilmez.
- `android/key.properties.example` — yeni. Keystore üretme komutu ve dört alanın açıklaması içinde.
- `.gitignore` — `android/key.properties` eklendi (`*.jks` / `*.keystore` zaten vardı).

**Senin yapman gereken:**
```bash
keytool -genkey -v -keystore %USERPROFILE%\betaller-upload.jks \
        -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias betaller
```
Sonra `android/key.properties.example` dosyasını `android/key.properties` olarak kopyalayıp doldur. **Keystore'u yedekle** — kaybedersen aynı Play listesine bir daha güncelleme gönderemezsin.

---

### 1.2 Android'de satın alma tamamen bypass ediliyordu — ENGELLEYİCİ

`premium_paywall.dart` içinde satın alma ve geri yükleme, Android'de hiçbir faturalama çağrısı yapmadan doğrudan `setPremium(true)` çağırıyordu. Play'de yayınlansaydı premium bedava dağıtılacaktı; ayrıca inceleme ekibi satın alma akışını test ediyor.

**Değişen dosyalar**
- `lib/widgets/premium_paywall.dart` — `_purchase()` ve `_restore()` içindeki `if (Platform.isAndroid)` bypass blokları kaldırıldı. Başarısız satın alma artık kullanıcıya bilgi veriyor (`purchaseUnavailable`). `_redeemPromoCode()` dahil üç yerdeki async-gap `context` kullanımları `if (!mounted) return;` ile düzeltildi.

**Cihazda doğrulandı:** premium kapalıyken paywall açılıp "Devam Et"e basıldı → `isPremium` `false` kaldı. Eskiden anında `true` oluyordu.

---

### 1.3 Android RevenueCat anahtarı iOS anahtarının kopyasıydı — ENGELLEYİCİ

`_iosApiKey` ve `_androidApiKey` aynı `appl_…` değerini taşıyordu. Google Play anahtarları `goog_` ile başlar; bu hâliyle Android'de RevenueCat hiç bağlanmıyordu. 1.2'deki bypass'ın sebebi büyük ihtimalle buydu.

**Değişen dosya**
- `lib/services/purchase_service.dart`
  - İki anahtar da `String.fromEnvironment` ile derleme zamanında geçersiz kılınabilir hâle geldi (`--dart-define=RC_ANDROID_KEY=goog_xxx`). iOS varsayılanı **yayındaki anahtarla aynı bırakıldı**, değiştirilmedi.
  - Android varsayılanı `goog_REPLACE_WITH_YOUR_PLAY_KEY` yer tutucusu.
  - `_keyMatchesPlatform()` kontrolü: platforma uymayan anahtarla `Purchases.configure` hiç çağrılmıyor, SDK sessizce kapalı kalıyor ve premium verilmiyor.
  - `Purchases.configure` `try/catch` içine alındı, `isInitialized` getter'ı eklendi.
  - `setLogLevel(LogLevel.debug)` → release'de `LogLevel.error`. Ayrıntılı satın alma logları logcat/Console'a sızmıyor.

**Senin yapman gereken:** RevenueCat panelinden Play anahtarını al ve ya sabiti güncelle ya da `--dart-define=RC_ANDROID_KEY=goog_…` ile derle. **Bu yapılana kadar Android'de satın alma çalışmaz** — bu artık sessiz bir "her şey bedava" yerine dürüst bir "yapılandırılmamış" durumu.

---

### 1.4 Mağaza fiyat döndürmediğinde sabit fiyat gösteriliyordu

`premium_paywall.dart` teklifler yüklenemediğinde `₺149,99` / `$11.99` sabitlerine düşüyordu. Bölgesel fiyatlandırmayla bu yalnızca TR ve US vitrinleri için doğru; Almanya'daki bir kullanıcı gerçek EUR fiyatı yerine dolar görüyordu. App Store 3.1.2 ve Play, gösterilen fiyatın kullanıcının vitrininden gelmesini şart koşuyor.

**Değişen dosya**
- `lib/widgets/premium_paywall.dart` — sabit yedek fiyatlar kaldırıldı. `_PlanPill.price` artık `String?`; fiyat yokken `—` gösteriliyor. Satın alma butonu bu durumda zaten `paywallLoadError` veriyordu, davranışı değişmedi.

> **Not:** Bu kod yolu yalnızca mağaza ürünleri **hiç yüklenemediğinde** çalışır. iOS'ta anahtar geçerli olduğu için yayındaki görünüm değişmez. Android'de `goog_` anahtarı girilene kadar paywall'da fiyat yerine `—` göreceksin — Play ekran görüntüleri için önce 1.3'ü tamamla. Sabit yedeği geri istersen tek satırlık değişiklik.

---

### 1.5 Kullanılmayan kısıtlı izin

`SCHEDULE_EXACT_ALARM` manifest'te beyan edilmişti, ama `notification_service.dart` her yerde `AndroidScheduleMode.inexactAllowWhileIdle` kullanıyor. Play bu izin için gerekçe formu istiyor ve gerekçesiz beyanları reddedebiliyor.

**Değişen dosya**
- `android/app/src/main/AndroidManifest.xml` — izin kaldırıldı, nedeni yorumda bırakıldı.

---

### 1.6 Her dilde Türkçe görünen sabit metinler

| Konum | Eski | Yeni |
|---|---|---|
| `profile_screen.dart:118,123` | "Premium'a Geç" / "Tüm premium özelliklerin kilidini açın." | mevcut `l.premium` / `l.premiumSubtitle` |
| `profile_screen.dart:373-374` | "Planı Görüntüle" / "Abonelik detaylarını görüntüle" | yeni `l.viewPlan` / `l.viewPlanSubtitle` |
| `notifications_screen.dart:93,565` | `['Pzt','Sal','Çar',…]` | `_shortWeekdays()` — `DateFormat.E(locale)` ile cihaz dilinde |
| `growth_analysis_flow.dart:554-559` | "Boy ölçümü ekledikçe tahmin %X'e ulaşır" | yeni `l.predictionConfidenceHint(percent)` |
| `onboarding_screen.dart:1234` | `'yaş'` | mevcut `l.ageLabel` |

**Eklenen çeviri anahtarları** (8 dilin hepsinde, İngilizce fallback yok): `purchaseUnavailable`, `viewPlan`, `viewPlanSubtitle`, `predictionConfidenceHint`.

**Değişen dosyalar:** `lib/l10n/app_{en,tr,de,fr,es,it,pt,hi}.arb` + `flutter gen-l10n` çıktıları, yukarıdaki 4 ekran dosyası.

---

### 1.7 Doğum yılı listesi sabitlenmişti

`onboarding_screen.dart` yıl listesi `List.generate(36, (i) => '${2024 - i}')` idi — en yeni yıl 2024'e çakılı, yani liste her yıl geride kalıyordu ve 2 yaşındaki bir kullanıcı seçilebiliyordu.

**Değişen dosya**
- `lib/screens/onboarding_screen.dart` — `kMinimumAge = 9` / `kMaximumAge = 45` sabitleri, liste ve kaydırma göstergesi bugünden türetiliyor. Varsayılan doğum tarihi de sabit 2008 yerine `now.year - 17`.

> Alt sınır **9** seçildi: yayındaki uygulamanın App Store yaş derecelendirmesi 9+, dolayısıyla mevcut kullanıcı kitlesinden kimse dışarıda kalmıyor. 13'e çekmek COPPA/Play Families yükünü hafifletir ama 9-12 yaş grubunu onboarding'den tamamen çıkarır — bu senin ürün kararın.

---

### 1.8 Açılışta boş ekran riski

`main()`, `runApp()`den önce bildirim servisini ve RevenueCat'i `await` ediyordu. İkisinden biri yavaşlarsa kullanıcı o süre boyunca boş ekrana bakıyor, takılırsa uygulama hiç çizilmiyordu.

**Değişen dosya**
- `lib/main.dart` — yalnızca `loadData()` ilk kareden önce bekleniyor (profil ilk ekranı belirliyor). Bildirim ve satın alma başlatma `unawaited(_initServices(...))` ile UI ayağa kalktıktan sonra, her biri kendi `try/catch`i içinde.

---

### 1.9 iOS bildirim izni ilk karede isteniyordu

`DarwinInitializationSettings(requestAlertPermission: true)` uygulama açılışında, kullanıcı hatırlatıcıların ne olduğunu görmeden izin diyaloğunu tetikliyordu — kalıcı "İzin verme" almanın en hızlı yolu.

**Değişen dosya**
- `lib/services/notification_service.dart` — `init()` artık izin istemiyor. `requestPermission()` iOS kolunu da kapsayacak şekilde genişletildi ve kullanıcı hatırlatıcıları açtığında `setEnabled(true)` üzerinden çağrılıyor.

---

### 1.10 iOS gizlilik manifesti yoktu

`ios/Runner/PrivacyInfo.xcprivacy` bulunmuyordu. Apple, "required reason API" kullanan uygulamalara ITMS-91053 uyarısı gönderiyor (shared_preferences → NSUserDefaults, fotoğraf dosyaları → file timestamp).

**Yeni dosya**
- `ios/Runner/PrivacyInfo.xcprivacy` — veri toplama yok, izleme yok; UserDefaults (`CA92.1`), file timestamp (`C617.1`) ve disk space (`E174.1`) gerekçeleri beyan edildi.

> ⚠️ **Elle yapman gereken tek adım:** Bu dosyayı Xcode'da Runner hedefine eklemen gerekiyor (sürükle-bırak, "Copy items if needed" + Runner hedefi işaretli). `project.pbxproj`'u elle düzenlemedim; Windows'ta iOS derlemesini doğrulayamadığım için bozma riskini almadım.

---

### 1.11 Sıfırlama v5 verilerini bırakıyordu

`resetAllData()` program günleri, günlük, kafein/stres, fotoğraflar ve özel rutinleri temizlemiyordu; sıfırlama sonrası yarı silinmiş bir hesap kalıyordu.

**Değişen dosya**
- `lib/providers/app_provider.dart` — eksik alanlar temizleniyor. `test/demo_data_test.dart` bunu doğruluyor.

---

## 2. Uygulanmayanlar ve nedenleri

### 2.1 iOS bundle identifier — DOKUNULMADI

`com.glowup.boyuzatmaApp.33JY92T594`. Denetimde bunu Xcode'un otomatik ürettiği bir çakışma eki sandım ve kısaltmıştım; uygulamanın yayında olduğunu öğrenince **değişikliği tamamen geri aldım**. `project.pbxproj` şu an git HEAD ile birebir aynı.

Yayındaki bir uygulamanın bundle id'si değişirse aynı App Store listesine güncelleme gönderilemez. Sondaki 10 karakter Apple Team ID formatında — büyük olasılıkla App Store Connect'teki gerçek kimlik. **Doğrulamadan dokunma.**

### 2.2 "Doğrulanmış" referanslar — SENİN KARARIN

`onboarding_screen.dart:1418-1453` — isim, fotoğraf, "+2.6 cm", yeşil `verified` rozeti. Gerçek ve kanıtlanabilir kullanıcılar değilse Apple 2.3.1 / Play "Deceptive Behavior" kapsamında; sağlık sonucu iddiası olduğu için ekstra hassas. Uygulama bu ekranla bir kez incelemeden geçmiş, dolayısıyla akut bir engel değil. İçeriğin doğruluğu benim bilemeyeceğim bir olgu olduğu için sosyal kanıt bölümüne dokunmadım.

### 2.3 Çeviri boşlukları — BÜYÜK İŞ

`fr/es/it/pt/hi`'de **277**, `de`'de **250** anahtar eksik (en/tr 1175, diğerleri 894-921). Eksikler ana ekranlar: Analiz sayfasının tamamı, disiplin programı, görevler. Bunlar İngilizceye düşüyor ama App Store'da 8 dilin hepsi beyan edilmiş durumda.

Bu ~1600 dizelik bir çeviri işi; bu turda yalnızca yeni eklediğim 4 anahtarı 8 dilde tamamladım. Eksik listesini şöyle çıkarabilirsin:

```bash
keys() { grep -o '^[[:space:]]*"[a-zA-Z][a-zA-Z0-9_]*"[[:space:]]*:' "lib/l10n/app_$1.arb" | tr -d ' ":' | sort -u; }
keys en > /tmp/en.txt; keys fr > /tmp/fr.txt
comm -23 /tmp/en.txt /tmp/fr.txt
```

İstersen ayrı bir turda dil dil tamamlayabilirim.

### 2.4 Dokunmadıklarım (bilinçli)

- **Paywall'ın her açılışta 3.5 sn sonra otomatik açılması** (`main_screen.dart:46-58`) — ürün/gelir kararı, teknik kusur değil.
- **R8 küçültme** — boyut kazandırırdı ama RevenueCat ve bildirim eklentilerinde release-only çökme riski taşıyor; gönderim öncesi girilecek bir değişiklik değil.
- **Demo assets** (`assets/demo/`, 204 KB) — release'e giriyor. Tohumlayıcı `kDebugMode` ile kapalı, işlevsel sızıntı yok. Mağaza görselleri bitince `pubspec.yaml`'daki `assets/demo/` satırını sil.

---

## 3. Doğrulama

Bu rapordaki her düzeltme uygulandıktan sonra:

| Kontrol | Sonuç |
|---|---|
| `flutter analyze` | 0 hata, 0 uyarı (14 info — hepsi stil; denetim öncesi 16 idi) |
| `flutter test` | 13/13 geçti |
| `flutter build appbundle --release` | Başarılı, 58.6 MB |
| Cihazda duman testi (SM A065F) | Uygulama açılıyor, veri yerinde, çökme yok |
| Android satın alma bypass'ı | Cihazda doğrulandı — "Devam Et" artık premium **vermiyor** |
| iOS derlemesi | ❌ Windows'ta doğrulanamadı — Mac'te `flutter build ipa` gerekli |

---

## 4. Gönderim öncesi kontrol listesi

- [ ] Upload keystore üret, `android/key.properties` doldur, yedekle (§1.1)
- [ ] RevenueCat Play anahtarını (`goog_…`) gir (§1.3)
- [ ] `PrivacyInfo.xcprivacy`'yi Xcode'da Runner hedefine ekle (§1.10)
- [ ] Mac'te `flutter build ipa` ile iOS derlemesini doğrula
- [ ] Play Console: hedef kitle ve içerik beyanı (yaş grubu §1.7 ile tutarlı olsun)
- [ ] Play Console: Data Safety formu — tüm veri cihazda, sunucuya gönderim yok
- [ ] Referansların doğruluğuna karar ver (§2.2)
- [ ] Mağaza görselleri bitince `assets/demo/` satırını `pubspec.yaml`'dan sil
- [ ] `versionCode`'u artır (şu an `1.5.0+26`)
