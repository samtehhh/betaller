// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navAnalysis => 'Analiz';

  @override
  String get navRoutines => 'Planım';

  @override
  String get navProgress => 'İlerleme';

  @override
  String get navProfile => 'Profil';

  @override
  String greeting(String name) {
    return 'Merhaba, $name';
  }

  @override
  String get currentHeight => 'Mevcut Boy';

  @override
  String get target => 'Hedef';

  @override
  String completed(String pct) {
    return '%$pct tamamlandı';
  }

  @override
  String remaining(String cm) {
    return '+$cm cm kaldı';
  }

  @override
  String get updateAnalysis => 'Analizi Güncelle';

  @override
  String get analysisSubtitle => 'Geçmiş boy ve alışkanlıklardan tahmin al';

  @override
  String get dailyRoutines => 'Günlük Rutinler';

  @override
  String get allRoutinesDone => 'Tüm rutinler tamamlandı!';

  @override
  String get water => 'Su';

  @override
  String get sleep => 'Uyku';

  @override
  String get growthSummary => 'Büyüme Özeti';

  @override
  String get total => 'TOPLAM';

  @override
  String get last => 'SON';

  @override
  String get measurement => 'ÖLÇÜM';

  @override
  String get dailyTip => 'Günün İpucu';

  @override
  String get waterTracking => 'Su Takibi';

  @override
  String waterToday(String amount) {
    return 'Bugün: $amount L';
  }

  @override
  String get sleepTracking => 'Uyku Takibi';

  @override
  String sleepTarget(String hours) {
    return 'Hedef: $hours saat';
  }

  @override
  String get hours => 'saat';

  @override
  String get save => 'Kaydet';

  @override
  String get cancel => 'İptal';

  @override
  String get analysis => 'Analiz';

  @override
  String get betallerScore => 'BeTaller Puanı';

  @override
  String get genetic => 'Genetik';

  @override
  String get growth => 'Büyüme';

  @override
  String get nutrition => 'Beslenme';

  @override
  String get sleepLabel => 'Uyku';

  @override
  String get discipline => 'Disiplin';

  @override
  String get improveScore => 'Puanını Yükselt';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Beslenme Kritik!';

  @override
  String get nutritionStrengthen => 'Beslenmeyi Güçlendir';

  @override
  String get sleepRecordAdd => 'Uyku Kaydı Ekle';

  @override
  String get sleepPoor => 'Kötü Uyku Düzeni';

  @override
  String get sleepImprove => 'Uykuyu İyileştir';

  @override
  String get startToday => 'Bugün Başla!';

  @override
  String routinesRemaining(int count) {
    return '$count Rutin Kaldı';
  }

  @override
  String get keepStreak => 'Seriyi Koru';

  @override
  String get addFirstMeasurement => 'İlk Ölçümü Ekle';

  @override
  String get addMeasurement => 'Ölçüm Ekle';

  @override
  String waterHalfNotReached(String amount) {
    return 'Bugün su hedefinizin yarısına ulaşamadınız. ${amount}L daha için.';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'Su hedefinize ${amount}L kaldı. Neredeyse tamam!';
  }

  @override
  String bmiLow(String bmi) {
    return 'BMI değeriniz $bmi — biraz düşük. Protein ve kalori alımını artırın.';
  }

  @override
  String bmiHigh(String bmi) {
    return 'BMI değeriniz $bmi — biraz yüksek. Sağlıklı beslenmeye odaklanın.';
  }

  @override
  String get nutritionDefault =>
      'Su hedefinizi tamamlayın ve dengeli beslenmeyi sürdürün.';

  @override
  String sleepNoRecord(String hours) {
    return 'Bugün uyku kaydı yok. $hours saat hedefleyin ve kaydedin.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Bugün $current saat uyudunuz — $missing saat eksik. Daha erken yatın!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Neredeyse tamam. $hours saate ulaşmak büyüme hormonunu en üst düzeye çıkaracak.';
  }

  @override
  String get sleepGood => 'Harika uyku düzeni! Böyle devam edin.';

  @override
  String noRoutinesDone(int total) {
    return 'Bugün hiç rutin tamamlanmadı. $total rutinden birine başlayın!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return 'Bugün $done/$total rutin tamamlandı. $left tane daha!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Bugün harika gidiyorsun! Seri başlatmak için $needed gün daha.';
  }

  @override
  String streakContinue(int days) {
    return '$days günlük seri! Devam ettikçe puanın yükselir.';
  }

  @override
  String get noMeasurements =>
      'Henüz boy ölçümü yok. Doğru tahminler için ilk ölçümünüzü ekleyin.';

  @override
  String fewMeasurements(int count) {
    return 'Büyüme hızını hesaplamak için $count ölçüm daha ekleyin.';
  }

  @override
  String goodMeasurements(int count) {
    return '$count ölçümünüz var. 5\'e ulaşmak doğruluğu büyük ölçüde artıracak.';
  }

  @override
  String get keepMeasuring =>
      'Ölçüm eklemeye devam edin. Her yeni veri tahminleri iyileştirir.';

  @override
  String get heightPrediction => 'Boy Tahmini';

  @override
  String get predictedHeightAt21 => '21 yaşında tahmini boy';

  @override
  String get predictionMethod =>
      'Genetik (anne-baba), büyüme hızı, BMI ve yaş verileri birleştirilerek hesaplandı.';

  @override
  String get growthStatus => 'Büyüme Durumu';

  @override
  String get completionLabel => 'TAMAMLANMA';

  @override
  String get growthVelocity => 'BÜYÜME HIZI';

  @override
  String get noData => 'VERİ YOK';

  @override
  String growthRate(String rating) {
    return 'Büyüme hızı: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'Kalori';

  @override
  String get kcalDay => 'kcal/gün';

  @override
  String get daily => 'günlük';

  @override
  String get protein => 'Protein';

  @override
  String get minimum => 'minimum';

  @override
  String get age => 'Yaş';

  @override
  String get male => 'Erkek';

  @override
  String get female => 'Kadın';

  @override
  String get yearlyPrediction => 'YILLIK TAHMİN';

  @override
  String ageYear(int age) {
    return '$age yaş';
  }

  @override
  String get progressTitle => 'İlerleme Takibi';

  @override
  String get totalGrowth => 'Toplam';

  @override
  String get lastDiff => 'Son Fark';

  @override
  String get measurementCount => 'Ölçüm';

  @override
  String get heightChart => 'Boy Grafiği';

  @override
  String get chartMinData => 'Grafik için en az 2 ölçüm gerekli';

  @override
  String get chartInstruction =>
      'İlerleme grafiğinizi görmek için ölçüm ekleyin!';

  @override
  String get addMeasurementButton => 'YENİ ÖLÇÜM EKLE';

  @override
  String get measurementHistory => 'ÖLÇÜM GEÇMİŞİ';

  @override
  String get deleteTitle => 'Ölçümü Sil';

  @override
  String get deleteMessage => 'Bu ölçümü silmek istediğinizden emin misiniz?';

  @override
  String get dismiss => 'İptal';

  @override
  String get delete => 'Sil';

  @override
  String get newMeasurement => 'Yeni Boy Ölçümü';

  @override
  String get routines => 'Rutinler';

  @override
  String streakDays(int days) {
    return '$days Gün';
  }

  @override
  String get progressStatus => 'İlerleme Durumu';

  @override
  String get completedLabel => 'Tamamlandı!';

  @override
  String get all => 'Tümü';

  @override
  String get exercise => 'Egzersiz';

  @override
  String get posture => 'Duruş';

  @override
  String bestStreak(int days) {
    return 'En iyi: $days gün';
  }

  @override
  String get editProfile => 'Profili Düzenle';

  @override
  String get editProfileSubtitle => 'Boy, kilo, yaş bilgilerini güncelle';

  @override
  String get name => 'İsim';

  @override
  String birthDate(String date) {
    return 'Doğum: $date';
  }

  @override
  String get heightCm => 'Boy (cm)';

  @override
  String get weightKg => 'Kilo (kg)';

  @override
  String get fatherHeight => 'Baba Boyu (cm)';

  @override
  String get motherHeight => 'Anne Boyu (cm)';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get notificationsOn => 'Hatırlatmalar açık';

  @override
  String get notificationsOff => 'Hatırlatmalar kapalı';

  @override
  String get premium => 'Premium\'a Yükselt';

  @override
  String get premiumSubtitle => 'Tüm özelliklerin kilidini aç';

  @override
  String get rateUs => 'Bizi Değerlendirin';

  @override
  String get rateSubtitle => 'Uygulamayı beğendiniz mi? 5 yıldız verin!';

  @override
  String get share => 'Uygulamayı Paylaş';

  @override
  String get shareSubtitle => 'Arkadaşlarına BeTaller\'ı anlat';

  @override
  String get shareText =>
      'BeTaller ile büyüme potansiyelimi keşfettim! Sen de dene: https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app';

  @override
  String get feedback => 'Geri Bildirim';

  @override
  String get feedbackSubtitle => 'Bize ulaşın';

  @override
  String get resetData => 'Tüm Verileri Sıfırla';

  @override
  String get resetSubtitle => 'Tüm veriler silinecek';

  @override
  String get resetTitle => 'Verileri Sıfırla';

  @override
  String get resetMessage =>
      'Tüm veriler silinecek ve giriş ekranına döneceksiniz. Bu işlem geri alınamaz!';

  @override
  String get reset => 'Sıfırla';

  @override
  String get premiumSoon => 'Premium yakında geliyor!';

  @override
  String get brandingSubtitle => 'Boy potansiyelini keşfet';

  @override
  String get statistics => 'İstatistikler';

  @override
  String get currentStreak => 'Mevcut Seri';

  @override
  String get bestStreakLabel => 'En İyi Seri';

  @override
  String get achievementLabel => 'Başarım';

  @override
  String get achievements => 'Başarımlar';

  @override
  String get earned => 'Kazanıldı!';

  @override
  String get notEarned => 'Henüz kazanılmadı';

  @override
  String get ok => 'Tamam';

  @override
  String get language => 'Dil';

  @override
  String get languageSubtitle => 'Uygulama dilini değiştir';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Boy potansiyelini keşfet';

  @override
  String get onboardingMeetYou => 'Seni Tanıyalım';

  @override
  String get onboardingInfoNeeded => 'Analiz için temel bilgiler gerekli.';

  @override
  String get gender => 'CİNSİYET';

  @override
  String get birthDateLabel => 'DOĞUM TARİHİ';

  @override
  String get bodyMeasurements => 'Vücut Ölçüleri';

  @override
  String get bodyInfo => 'Analiz için mevcut boy ve kilonuz gerekli.';

  @override
  String get geneticData => 'Genetik Veriler';

  @override
  String get geneticInfo =>
      'Anne-baba boyları genetik potansiyelinizi belirler.';

  @override
  String get pastHeights => 'Geçmiş Boylar';

  @override
  String get pastHeightsInfo =>
      'Farklı yaşlarda hatırladığınız boyları girin. Boş bırakabilirsiniz.';

  @override
  String get heightHint => 'Boy girin...';

  @override
  String get ageLabel => 'yaş';

  @override
  String get habits => 'Alışkanlıkların';

  @override
  String get habitsInfo => 'Yaşam tarzınız tahminleri doğrudan etkiler.';

  @override
  String get weeklyExercise => 'Haftalık Egzersiz';

  @override
  String get dailySleep => 'Günlük Uyku';

  @override
  String get nutritionQuality => 'BESLENME KALİTESİ';

  @override
  String get nutritionDesc => 'Protein, süt ürünleri, sebze, meyve tüketimi';

  @override
  String get nutritionBad => 'Kötü';

  @override
  String get nutritionPoor => 'Zayıf';

  @override
  String get nutritionMedium => 'Orta';

  @override
  String get nutritionGood => 'İyi';

  @override
  String get nutritionGreat => 'Harika';

  @override
  String get startAnalysis => 'Analizi Başlat';

  @override
  String get continueBtn => 'Devam';

  @override
  String get analyzeBtn => 'Analiz Et';

  @override
  String get analyzing => 'Analiz Ediliyor';

  @override
  String get analysisComplete => 'Tamamlandı!';

  @override
  String get yourScore => 'BeTaller Puanın';

  @override
  String get letsStart => 'Hadi Başlayalım';

  @override
  String get doneBtn => 'Tamam';

  @override
  String get analysisStep1 => 'Genetik veriler analiz ediliyor...';

  @override
  String get analysisStep2 => 'Büyüme hızı hesaplanıyor...';

  @override
  String get analysisStep3 => 'Beslenme ve uyku verileri işleniyor...';

  @override
  String get analysisStep4 => 'Boy tahmini oluşturuluyor...';

  @override
  String get analysisStep5 => 'BeTaller puanı hesaplanıyor...';

  @override
  String growthPotential(String cm) {
    return '+$cm cm büyüme potansiyeli';
  }

  @override
  String get heightAt21 => '21 yaşında';

  @override
  String confidenceLevel(String pct) {
    return '%$pct güven düzeyi';
  }

  @override
  String heightRange(String min, String max) {
    return '$min - $max cm aralığı';
  }

  @override
  String get currentLabel => 'MEVCUT';

  @override
  String get predictedLabel => 'TAHMİNİ';

  @override
  String get yearlyPredictions => 'Yıllık Tahminler';

  @override
  String get tipMorningMeasure =>
      'Boyunuzu sabah ölçün - gün içinde diskler üzerindeki basınç boy kaybına neden olur. En doğru ölçüm sabah yapılır.';

  @override
  String get tipProteinSpread =>
      'Protein alımını öğünlere yayın. Hepsini bir seferde yemeyin, her öğünde protein tüketin.';

  @override
  String get tipGrowthHormone =>
      'Büyüme hormonu uyku sırasında zirve yapar. Gece 22:00-02:00 arası uykuda olun!';

  @override
  String get tipVitaminD =>
      'Günde 15 dakika güneşlenmek D vitamini üretimini artırır. D vitamini kalsiyum emilimi için gereklidir.';

  @override
  String get tipBarHanging =>
      'Barfiks çubuğunda asılmak omurgayı açar. Günde 3x30 saniye deneyin.';

  @override
  String get tipSwimming =>
      'Yüzme, tüm vücut çalıştıran ve boy uzamayı destekleyen en iyi spordur.';

  @override
  String get tipStress =>
      'Stres büyüme hormonunu baskılar. Meditasyon ve yoga ile stresi azaltın.';

  @override
  String get routineMorningStretch => 'Sabah Esneme';

  @override
  String get routineMorningStretchDesc =>
      'Uyanır uyanmaz 10 dakika esneme yapın. Omurga ve bacak kaslarını esnetin.';

  @override
  String get routineBarHanging => 'Barfiks Çubuğunda Asılma';

  @override
  String get routineBarHangingDesc =>
      'Barfiks çubuğunda asılarak omurgayı uzatın. 3 set x 30 saniye.';

  @override
  String get routineCobraStretch => 'Kobra Esneme';

  @override
  String get routineCobraStretchDesc =>
      'Yüzüstü yatın ve üst vücudu kaldırın. Omurgayı esnetin. 3 set x 15 saniye.';

  @override
  String get routineJumping => 'Zıplama Egzersizleri';

  @override
  String get routineJumpingDesc =>
      'İp atlama veya squat jump yapın. Büyüme plaklarını uyarır. 3 set x 20 tekrar.';

  @override
  String get routineSwimming => 'Yüzme veya Basketbol';

  @override
  String get routineSwimmingDesc =>
      'Boy uzamayı destekleyen bir spor yapın. En az 30 dakika.';

  @override
  String get routineYoga => 'Akşam Yoga ve Esneme';

  @override
  String get routineYogaDesc =>
      'Yatmadan önce yoga ve esneme rutini. Stresi atın, kasları gevşetin.';

  @override
  String get routineProtein => 'Protein Alımı';

  @override
  String get routineProteinDesc =>
      'Yumurta, tavuk, balık, süt ürünleri. Günde en az 1.5g/kg protein.';

  @override
  String get routineCalcium => 'Kalsiyum ve D Vitamini';

  @override
  String get routineCalciumDesc =>
      'Süt, peynir, yoğurt tüketin. 15 dk güneşlenin. Kemik gelişimi için kritik.';

  @override
  String get routineWater => 'Su İçme Hedefi';

  @override
  String get routineWaterDesc =>
      'Günde en az 2-3 litre su için. Metabolizma ve büyüme için şart.';

  @override
  String get routineAvoidJunk => 'Abur Cuburdan Kaçının';

  @override
  String get routineAvoidJunkDesc =>
      'Fast food, şekerli içecekler ve işlenmiş gıdalardan uzak durun.';

  @override
  String get routineSleep => 'Kaliteli Uyku (8-10 saat)';

  @override
  String get routineSleepDesc =>
      'Büyüme hormonu uyku sırasında salgılanır. 22:00-06:00 arası altın saatlerdir.';

  @override
  String get routineNoScreen => 'Yatmadan Önce Ekran Molası';

  @override
  String get routineNoScreenDesc =>
      'Yatmadan 1 saat önce telefon ve bilgisayarı bırakın. Melatonin üretimini engellemeyin.';

  @override
  String get routinePosture => 'Duruş Kontrolü';

  @override
  String get routinePostureDesc =>
      'Sırtınızı dik, omuzlarınızı geriye doğru tutun. Her saat kontrol edin. İyi duruş = 2-3 cm fark.';

  @override
  String get routineWallStand => 'Duvara Yaslanma Egzersizi';

  @override
  String get routineWallStandDesc =>
      'Sırtınızı duvara yaslayın: topuklar, kalça, omuzlar, baş duvara değsin. 5 dk tutun.';

  @override
  String get routineSprintIntervals => 'Sprint Aralıkları';

  @override
  String get routineSprintIntervalsDesc =>
      'Sprint aralık antrenmanı, yüksek yoğunluklu patlamalarla önemli ölçüde büyüme hormonu salgılatır.';

  @override
  String get routineHiitWorkout => 'HIIT Antrenmanı';

  @override
  String get routineHiitWorkoutDesc =>
      'Büyüme hormonu salgısını en üst düzeye çıkarmak için yüksek yoğunluklu aralıklı antrenman.';

  @override
  String get routineSquats => 'Vücut Ağırlığı Squatları';

  @override
  String get routineSquatsDesc =>
      'Vücut ağırlığı squatları bacaklardaki ve omurgadaki büyüme plaklarını uyarır.';

  @override
  String get routineDeadliftStretch => 'Deadlift Esneme';

  @override
  String get routineDeadliftStretchDesc =>
      'Omurga dekompresyonu ve vertebral disk sağlığı için deadlift esneme hareketi.';

  @override
  String get routineOverheadPress => 'Baş Üstü Press';

  @override
  String get routineOverheadPressDesc =>
      'Baş üstü press omurgayı esnetir ve duruş kaslarını güçlendirir.';

  @override
  String get routineSkippingRope => 'İp Atlama';

  @override
  String get routineSkippingRopeDesc =>
      'İp ile tekrarlayan zıplama, alt ekstremitelerdeki büyüme plaklarını uyarır.';

  @override
  String get routinePilatesCore => 'Pilates Core';

  @override
  String get routinePilatesCoreDesc =>
      'Pilates core egzersizleri omurga hizalamasını ve duruşu destekler.';

  @override
  String get routineInversionHang => 'Ters Asılma';

  @override
  String get routineInversionHangDesc =>
      'Ters asılma omurga disklerini dekomprese eder, geçici olarak 1-2 cm ekleyebilir.';

  @override
  String get routineZincIntake => 'Çinko Açısından Zengin Gıdalar';

  @override
  String get routineZincIntakeDesc =>
      'Büyüme hormonu üretimi için gün boyunca çinko açısından zengin gıdalar tüketin.';

  @override
  String get routineVitaminDSunlight => 'D Vitamini ve Güneş Işığı';

  @override
  String get routineVitaminDSunlightDesc =>
      'D vitamini sentezi ve kemik büyümesi için en az 15 dakika doğrudan güneş ışığı alın.';

  @override
  String get routineArginineFoods => 'Arjinin Açısından Zengin Gıdalar';

  @override
  String get routineArginineFoodsDesc =>
      'Büyüme hormonu salgısını uyarmak için arjinin açısından zengin gıdalar yiyin.';

  @override
  String get routineSleepEnvironment => 'Uyku Ortamını Optimize Et';

  @override
  String get routineSleepEnvironmentDesc =>
      'Melatonin ve büyüme hormonu salgısını en üst düzeye çıkarmak için karanlık, serin bir uyku ortamı oluşturun.';

  @override
  String get routinePreSleepRoutine => 'Uyku Öncesi Gevşeme';

  @override
  String get routinePreSleepRoutineDesc =>
      'Düzenli bir uyku öncesi rutin, derin uyku kalitesini %23 artırır.';

  @override
  String get routineNeckStretches => 'Boyun Esnemeleri';

  @override
  String get routineNeckStretchesDesc =>
      'Boyun esnemeleri baskıyı azaltır ve servikal hizalamayı iyileştirir.';

  @override
  String get routineShoulderRolls => 'Omuz Açma Hareketleri';

  @override
  String get routineShoulderRollsDesc =>
      'Omuzları açmak öne eğik duruşu düzeltir, görünümde 1-2 cm fark yaratabilir.';

  @override
  String get achieveFirstDay => 'İlk Adım';

  @override
  String get achieveFirstDayDesc => 'İlk gününü tamamla';

  @override
  String get achieveThreeStreak => '3 Günlük Seri';

  @override
  String get achieveThreeStreakDesc => 'Rutinleri 3 gün üst üste tamamla';

  @override
  String get achieveWeekStreak => '7 Günlük Seri';

  @override
  String get achieveWeekStreakDesc => 'Rutinleri 7 gün üst üste tamamla';

  @override
  String get achieveTwoWeekStreak => '14 Günlük Seri';

  @override
  String get achieveTwoWeekStreakDesc => '14 gün boyunca devam et';

  @override
  String get achieveMonthStreak => '30 Günlük Seri';

  @override
  String get achieveMonthStreakDesc => '30 gün üst üste tamamla';

  @override
  String get achieveTwoMonthStreak => '60 Günlük Seri';

  @override
  String get achieveTwoMonthStreakDesc => '60 gün üst üste tamamla';

  @override
  String get achieveHundredStreak => '100 Günlük Seri';

  @override
  String get achieveHundredStreakDesc => '100 gün üst üste tamamla';

  @override
  String get achieveFirstMeasure => 'İlk Ölçüm';

  @override
  String get achieveFirstMeasureDesc => 'İlk boy ölçümünü kaydet';

  @override
  String get achieveThreeMeasures => 'Takipçi';

  @override
  String get achieveThreeMeasuresDesc => '3 boy ölçümü kaydet';

  @override
  String get achieveFiveMeasures => 'Düzenli Takip';

  @override
  String get achieveFiveMeasuresDesc => '5 boy ölçümü kaydet';

  @override
  String get achieveTenMeasures => 'Veri Avcısı';

  @override
  String get achieveTenMeasuresDesc => '10 boy ölçümü kaydet';

  @override
  String get achieveFirstCm => 'İlk Santimetre';

  @override
  String get achieveFirstCmDesc => 'Toplam 1 cm büyüme kaydet';

  @override
  String get achieveThreeCm => '3 cm Büyüme';

  @override
  String get achieveThreeCmDesc => 'Toplam 3 cm büyüme kaydet';

  @override
  String get achieveFiveCm => '5 cm Büyüme';

  @override
  String get achieveFiveCmDesc => 'Toplam 5 cm büyüme kaydet';

  @override
  String get achieveTenCm => '10 cm Büyüme';

  @override
  String get achieveTenCmDesc => 'Toplam 10 cm büyüme kaydet';

  @override
  String get quote1 => 'Her gün dünden daha iyi ol.';

  @override
  String get quote2 =>
      'Büyüme bir gecede olmaz ama her gece seni hedefe yaklaştırır.';

  @override
  String get quote3 => 'Büyüme sabır ister, devam et!';

  @override
  String get quote4 => 'Bugün attığın adım yarının temelini kurar.';

  @override
  String get quote5 => 'Disiplin, motivasyonun bittiği yerde başlar.';

  @override
  String get quote6 => 'Vücudun sana teşekkür edecek, devam et!';

  @override
  String get quote7 => 'Potansiyelinin sınırlarını sen belirlersin.';

  @override
  String get quote8 => 'Küçük adımlar büyük değişimler yaratır.';

  @override
  String get quote9 => 'En iyi yatırım kendine yapılandır.';

  @override
  String get quote10 => 'Her gün hedefine biraz daha yaklaşıyorsun.';

  @override
  String get quote11 => 'Değişim zordur ama pişmanlık daha zordur.';

  @override
  String get quote12 => 'Vücudun bir tapınak, ona iyi bak.';

  @override
  String get quote13 => 'Rakibin dünkü sensin. Bugün onu yen!';

  @override
  String get quote14 => 'BeTaller = Sabır + Disiplin + İnanç';

  @override
  String get quote15 => 'Kendine inan, süreç seni şekillendirecek.';

  @override
  String get quote16 => 'Bugün yapamam deme, yarın pişman olma.';

  @override
  String get quote17 => 'Her gün ilerleme göster, %1 bile olsa.';

  @override
  String get quote18 => 'Ayna ilerlemenizi gösterecek, sabırlı olun.';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiUnderweight => 'Zayıf';

  @override
  String get bmiOverweight => 'Fazla Kilolu';

  @override
  String get bmiObese => 'Obez';

  @override
  String get velocityExcellent => 'Mükemmel';

  @override
  String get velocityNormal => 'Normal';

  @override
  String get velocitySlow => 'Yavaş';

  @override
  String get velocityVeryLow => 'Çok Düşük';

  @override
  String durationMinutes(String min) {
    return '$min dk';
  }

  @override
  String get durationAllDay => 'Tüm gün';

  @override
  String get durationNight => 'Gece';

  @override
  String durationHours(String hours) {
    return '$hours saat';
  }

  @override
  String get onboardingStep1 => 'Kişisel bilgilerini gir';

  @override
  String get onboardingStep2 => 'Geçmiş boylarını paylaş';

  @override
  String get onboardingStep3 => 'Alışkanlıklarını değerlendir';

  @override
  String get onboardingStep4 => 'Tahminini ve skorunu gör';

  @override
  String get hoursShort => 'sa';

  @override
  String get selectLanguage => 'Dil Seçin';

  @override
  String get systemLanguage => 'Sistem Dili';

  @override
  String get emailSubject => 'BeTaller Geri Bildirim';

  @override
  String get pastHeightsTip =>
      'Hatırlamadığın yaşları boş bırakabilirsin. En az 1-2 geçmiş boy girmen yeterli.';

  @override
  String get currentSuffix => '(mevcut)';

  @override
  String personalizedProtein(String amount) {
    return 'Yumurta, tavuk, balık, süt ürünleri. Günde en az ${amount}g protein al.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Günde en az ${amount}L su iç. Metabolizma ve büyüme için şart.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'Büyüme hormonu uyku sırasında salgılanır. En az $hours saat uyu. 22:00-06:00 arası altın saatler.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Süt, peynir, yoğurt tüket. 15 dk güneşlen. Günlük kalori hedefin: $calories kcal.';
  }

  @override
  String get scoreS => 'Mükemmel! Potansiyelinin zirvesine ulaşıyorsun.';

  @override
  String get scoreA => 'Harika gidiyorsun! Küçük iyileştirmelerle zirveye çık.';

  @override
  String get scoreB => 'İyi yoldasın. Rutin ve beslenmeye biraz daha odaklan.';

  @override
  String get scoreC =>
      'Gelişim alanların var. Düzenli rutinler fark yaratacak.';

  @override
  String get scoreD => 'Potansiyelin yüksek ama aksiyona geçmen lazım.';

  @override
  String get scoreF =>
      'Şimdi başla! Her gün küçük bir adım büyük fark yaratır.';

  @override
  String get cmPerYear => 'cm/yıl';

  @override
  String get howToDoIt => 'Nasıl Yapılır';

  @override
  String get musclesTargeted => 'Hedeflenen Kaslar ve Kemikler';

  @override
  String get scientificBasis => 'Bilimsel Temel';

  @override
  String setXofY(String current, String total) {
    return 'Set $current / $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Set $set öncesi dinlenme';
  }

  @override
  String get allSetsComplete => 'Tüm Setler Tamamlandı!';

  @override
  String get setTimer => 'Set Zamanlayıcı';

  @override
  String get setTracker => 'Set Takibi';

  @override
  String get builtInTimer => 'Yerleşik Zamanlayıcı';

  @override
  String get markComplete => 'Tamamlandı İşaretle';

  @override
  String get markIncomplete => 'Tamamlanmadı İşaretle';

  @override
  String get done => 'Bitti';

  @override
  String get doneExclamation => 'Bitti!';

  @override
  String get start => 'Başla';

  @override
  String get pause => 'Duraklat';

  @override
  String get resetTimer => 'Sıfırla';

  @override
  String get skipRest => 'Dinlenmeyi Atla';

  @override
  String get restart => 'Yeniden Başla';

  @override
  String get perSet => 'set başına';

  @override
  String get rest => 'DİNLENME';

  @override
  String get reps => 'tekrar';

  @override
  String get difficultyBeginner => 'Başlangıç';

  @override
  String get difficultyIntermediate => 'Orta';

  @override
  String get difficultyAdvanced => 'İleri';

  @override
  String get learnTitle => 'Öğren';

  @override
  String get learnSubtitle => 'Büyüme için bilimsel bilgi';

  @override
  String get categoryAll => 'Tümü';

  @override
  String get categoryScience => 'Bilim';

  @override
  String get categoryNutrition => 'Beslenme';

  @override
  String get categoryExercise => 'Egzersiz';

  @override
  String get categorySleep => 'Uyku';

  @override
  String get categoryMyths => 'Mitler';

  @override
  String get scientificReferences => 'Bilimsel Kaynaklar';

  @override
  String get relatedRoutines => 'İlgili Rutinler';

  @override
  String get nutritionTitle => 'Beslenme';

  @override
  String get sectionMealPlan => 'Öğün Planı';

  @override
  String get sectionNutrients => 'Besinler';

  @override
  String get sectionFoods => 'Yiyecekler';

  @override
  String todaysPlan(String day) {
    return 'Bugünün Planı — $day';
  }

  @override
  String get breakfast => 'Kahvaltı';

  @override
  String get lunch => 'Öğle Yemeği';

  @override
  String get dinner => 'Akşam Yemeği';

  @override
  String get snacks => 'Atıştırmalıklar';

  @override
  String get searchFoods => 'Yiyecek ara...';

  @override
  String nFoods(String count) {
    return '$count yiyecek';
  }

  @override
  String dailyLabel(String amount) {
    return 'Günlük: $amount';
  }

  @override
  String get dailyNeedByAge => 'YAŞA GÖRE GÜNLÜK İHTİYAÇ';

  @override
  String agePrefix(String range) {
    return 'Yaş $range';
  }

  @override
  String get topFoodSources => 'EN İYİ GIDA KAYNAKLARI';

  @override
  String get categoryDairy => 'Süt Ürünleri';

  @override
  String get categoryMeatFish => 'Et ve Balık';

  @override
  String get categoryVegetables => 'Sebzeler';

  @override
  String get categoryFruits => 'Meyveler';

  @override
  String get categoryGrains => 'Tahıllar ve Baklagiller';

  @override
  String get categoryNutsSeeds => 'Kuruyemişler ve Tohumlar';

  @override
  String get weeklyReportTitle => 'Haftalık Rapor';

  @override
  String get overview => 'Genel Bakış';

  @override
  String get routinesLabel => 'Rutinler';

  @override
  String get streakLabel => 'Seri';

  @override
  String get heightLabel => 'Boy';

  @override
  String get dailyScores => 'Günlük Puanlar';

  @override
  String get waterToday2 => 'Bugün Su';

  @override
  String get sleepToday => 'Bugün Uyku';

  @override
  String get routineCompletion => 'Rutin Tamamlama';

  @override
  String get xpAndLevel => 'XP ve Seviye';

  @override
  String xpToNextLevel(String xp) {
    return 'Sonraki seviyeye $xp XP';
  }

  @override
  String get activeChallenges => 'Aktif Görevler';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m tamamlandı';
  }

  @override
  String get shareYourProgress => 'İlerlemenizi Paylaşın';

  @override
  String get shareComingSoon => 'Paylaşım özelliği yakında geliyor!';

  @override
  String get premiumTest => 'Premium (Test)';

  @override
  String get premiumActive => 'Aktif';

  @override
  String get premiumFree => 'Ücretsiz';

  @override
  String get weeklyReportMenu => 'Haftalık Rapor';

  @override
  String get weeklyReportMenuSubtitle => 'İlerleme özetin';

  @override
  String get unlockGrowthPotential => 'Tam büyüme potansiyelini aç';

  @override
  String get featureGrowthAnalysis => 'Büyüme analizi ve puan';

  @override
  String get featureHeightPrediction => 'Boy tahmini ve öngörü';

  @override
  String get featureAllRoutines => 'Tüm 14 günlük rutin';

  @override
  String get featureWaterSleep => 'Su ve uyku takibi';

  @override
  String get featureProgress => 'İlerleme ve ölçümler';

  @override
  String get featureAchievements => 'Başarımlar ve seriler';

  @override
  String get planMonthly => 'Aylık';

  @override
  String get planYearly => 'Yıllık';

  @override
  String get bestValue => 'EN İYİ FİYAT';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'SEVİYE $level';
  }

  @override
  String get levelBeginner => 'Başlangıç';

  @override
  String get levelStarter => 'Yeni Başlayan';

  @override
  String get levelCommitted => 'Kararlı';

  @override
  String get levelDedicated => 'Adanmış';

  @override
  String get levelConsistent => 'Tutarlı';

  @override
  String get levelFocused => 'Odaklı';

  @override
  String get levelDetermined => 'Azimli';

  @override
  String get levelDisciplined => 'Disiplinli';

  @override
  String get levelStrong => 'Güçlü';

  @override
  String get levelAdvanced => 'İleri';

  @override
  String get levelExpert => 'Uzman';

  @override
  String get levelMaster => 'Usta';

  @override
  String get levelElite => 'Elit';

  @override
  String get levelChampion => 'Şampiyon';

  @override
  String get levelLegend => 'Efsane';

  @override
  String get levelTitan => 'Titan';

  @override
  String get levelMythic => 'Mitik';

  @override
  String get levelImmortal => 'Ölümsüz';

  @override
  String get levelTranscendent => 'Aşkın';

  @override
  String get levelUltimate => 'Nihai';

  @override
  String get challengeCompleteAllRoutines => 'Tüm Rutinleri Tamamla';

  @override
  String get challengeCompleteAllRoutinesDesc => 'Bugün tüm rutinleri bitir';

  @override
  String get challengeHydrationHero => 'Hidrasyon Kahramanı';

  @override
  String get challengeHydrationHeroDesc => 'Günlük su hedefine ulaş';

  @override
  String get challengeEarlySleeper => 'Erken Uyuyan';

  @override
  String get challengeEarlySleeperDesc => '8+ saat uyku kaydet';

  @override
  String get challengeExerciseTrio => 'Egzersiz Üçlüsü';

  @override
  String get challengeExerciseTrioDesc => '3 egzersiz rutini tamamla';

  @override
  String get challengeMorningStretch => 'Sabah Esneme';

  @override
  String get challengeMorningStretchDesc => 'Sabah 9\'dan önce esneme yap';

  @override
  String get challenge7DayWarrior => '7 Günlük Savaşçı';

  @override
  String get challenge7DayWarriorDesc => '7 gün üst üste tüm rutinleri tamamla';

  @override
  String get challengeGrowthTracker => 'Büyüme Takipçisi';

  @override
  String get challengeGrowthTrackerDesc => 'Bu hafta bir boy ölçümü kaydet';

  @override
  String get challengeHydrationWeek => 'Hidrasyon Haftası';

  @override
  String get challengeHydrationWeekDesc => 'Bu hafta 5 gün su hedefine ulaş';

  @override
  String get challengeFitnessChampion => 'Fitness Şampiyonu';

  @override
  String get challengeFitnessChampionDesc =>
      'Bu hafta 15 egzersiz rutini tamamla';

  @override
  String get challengeSleepMaster => 'Uyku Ustası';

  @override
  String get challengeSleepMasterDesc => '5 gün boyunca 8+ saat uyku kaydet';

  @override
  String get performanceDashboard => 'PERFORMANS PANELİ';

  @override
  String get tierA => 'SEVİYE A';

  @override
  String get tierB => 'SEVİYE B';

  @override
  String get tierC => 'SEVİYE C';

  @override
  String get tierD => 'SEVİYE D';

  @override
  String get tierE => 'SEVİYE E';

  @override
  String get maxTierReached => 'MAKSİMUM SEVİYE';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Sonraki: $tier · +$pts puan gerekli';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Rutinleri Yönet';

  @override
  String get manageRoutinesSubtitle =>
      'Günlük listenden rutin göster veya gizle';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible / $total aktif';
  }

  @override
  String get showAll => 'Hepsini göster';

  @override
  String get hideAll => 'Hepsini gizle';

  @override
  String get heightAnalysis => 'Boy Analizi';

  @override
  String get heightVsPopulation => 'Küresel Nüfustaki Konumun';

  @override
  String get globalAveragesTable => 'Yaşa Göre Küresel Ortalamalar';

  @override
  String get standingTall => 'Boyun Yüksek';

  @override
  String get standingAboveAverage => 'Ortalamanın Üstünde';

  @override
  String get standingBelowAverage => 'Ortalamanın Altında';

  @override
  String get standingShort => 'Yaşıtlarının Gerisinde';

  @override
  String get yourHeightStanding => 'BOY DURUMUN';

  @override
  String get yourHeight => 'Sen';

  @override
  String peerAvg(int age) {
    return '$age yaş ort.';
  }

  @override
  String get aboveAvg => 'Ort. üstü';

  @override
  String get belowAvg => 'Ort. altı';

  @override
  String get whoDataSource => 'WHO 2007 Küresel Referans';

  @override
  String get percentileShort5 => '5.';

  @override
  String get percentileShort50 => '50.';

  @override
  String get percentileShort95 => '95.';

  @override
  String get youLabel => 'Sen';

  @override
  String get avgHeightLabel => 'ORT';

  @override
  String get percentileLabel => '%';

  @override
  String get diffLabel => 'FARK';

  @override
  String get whoSourceNote =>
      'Veri kaynağı: WHO 2007 Büyüme Referansı & NCD-RisC küresel havuz tahminleri. Yüzdelikler küresel ortalamadır, ülkeye göre farklılık gösterebilir.';

  @override
  String get quickPhotos => 'Fotoğraflar';

  @override
  String get quickPosture => 'Postür';

  @override
  String get quickWellness => 'Sağlık';

  @override
  String get quickRecipes => 'Tarifler';

  @override
  String get wellnessTitle => 'Sağlık Takibi';

  @override
  String get wellnessHeader => 'SAĞLIK';

  @override
  String get wellnessSubtitle => 'Büyümenizi etkileyen faktörleri takip edin';

  @override
  String get caffeineToday => 'Bugünkü Kafein';

  @override
  String get withinLimits => 'Sağlıklı sınırlar içinde';

  @override
  String get approachingLimit => 'Limite yaklaşıyor';

  @override
  String get overLimit => 'Limit aşıldı — HGH\'yi etkiler';

  @override
  String get resetToday => 'Bugünü sıfırla';

  @override
  String get stressToday => 'Bugünkü Stres';

  @override
  String get stressVeryCalmLabel => 'Çok sakin — büyüme için ideal';

  @override
  String get stressCalmLabel => 'Sakin';

  @override
  String get stressNeutralLabel => 'Nötr';

  @override
  String get stressStressedLabel => 'Stresli';

  @override
  String get stressVeryStressedLabel =>
      'Çok stresli — kortizol HGH\'yi engeller';

  @override
  String get stressTapToLog => 'Bugün nasıl hissettiğini kaydet';

  @override
  String get todaysJournal => 'Günlük';

  @override
  String get journalNoNote => '(not yok)';

  @override
  String get journalEdit => 'Düzenle';

  @override
  String get journalHowWasToday => 'Bugün nasıldı?';

  @override
  String get journalSaved => 'Günlük kaydedildi · +5 XP';

  @override
  String get journalSaveEntry => 'Kaydet';

  @override
  String get weeklyInsight => 'Haftalık Analiz';

  @override
  String get weeklyInsightCaffeine => 'KAFEİN';

  @override
  String get weeklyInsightStress => 'STRES';

  @override
  String get weeklyInsightMood => 'RUH HALİ';

  @override
  String get wellnessInfoTitle => 'Sağlık neden önemli';

  @override
  String get wellnessInfoBody =>
      'Kafein derin uykuyu bozar; büyüme hormonu (HGH) en çok bu dönemde salgılanır. Kronik stres kortizolü yükseltir ve HGH\'yi doğrudan baskılar. Günlük tutmak büyümeyi destekleyen alışkanlıklarınızı sürdürmenize yardımcı olur.';

  @override
  String get wellnessInfoGotIt => 'Anladım';

  @override
  String get insightCaffeineHigh =>
      'Bu hafta kafein tüketiminiz yüksek. Daha iyi uyku ve HGH için azaltmayı deneyin.';

  @override
  String get insightStressHigh =>
      'Bu hafta stres seviyeniz yüksek. Nefes egzersizlerini düşünün — kortizol büyümeyi engeller.';

  @override
  String get insightMoodLow =>
      'Son günlerde ruh haliniz düşük. Güneş ışığı, uyku ve hafif egzersiz faydalı olur.';

  @override
  String get insightGreat =>
      'Bu hafta harika bir denge! Sağlığınız büyümenizi destekliyor.';

  @override
  String get insightDefault =>
      'Sağlığınız iyi yolda. Daha derin analizler için kayıt tutmaya devam edin.';

  @override
  String get insightNeedMoreData => 'Analiz için birkaç gün daha kayıt yapın.';

  @override
  String get progressPhotosTitle => 'İlerleme Fotoğrafları';

  @override
  String get progressPhotosHeader => 'İLERLEME FOTOĞRAFLARI';

  @override
  String get progressPhotosSubtitle => 'Görsel yolculuğunuzu takip edin';

  @override
  String get addProgressPhoto => 'Fotoğraf Ekle';

  @override
  String get captureJourney => 'Görsel yolculuğunuzu kaydedin';

  @override
  String get takePhoto => 'Fotoğraf Çek';

  @override
  String get chooseFromLibrary => 'Galeriden Seç';

  @override
  String get deletePhotoTitle => 'Fotoğrafı Sil?';

  @override
  String get deletePhotoBody =>
      'Bu fotoğraf ilerleme zaman çizelgenizden kaldırılacak.';

  @override
  String get timelineTab => 'Zaman Çizelgesi';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'fotoğraf',
      one: 'fotoğraf',
    );
    return '$_temp0';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'gün',
      one: 'gün',
    );
    return '$_temp0';
  }

  @override
  String get cmGained => 'cm kazanç';

  @override
  String get firstPhotoMessage =>
      'Görsel ilerlemenizi takip etmek için ilk fotoğrafınızı çekin.';

  @override
  String get takeFirstPhoto => 'İlk Fotoğrafı Çek';

  @override
  String get beforeAfter => 'ÖNCE / SONRA';

  @override
  String get beforeLabel => 'ÖNCE';

  @override
  String get afterLabel => 'SONRA';

  @override
  String get yourHeightDialog => 'Boyunuz';

  @override
  String get heightDialogMessage =>
      'Bu fotoğraf için güncel boyunuzu cm olarak girin';

  @override
  String get postureAnalysisTitle => 'Postür Analizi';

  @override
  String get postureCoachHeader => 'POSTÜR KOÇU';

  @override
  String get postureCoachSubtitle => 'Yapay zeka destekli postür puanlaması';

  @override
  String get latestScore => 'SON PUAN';

  @override
  String get latestAnalysis => 'SON ANALİZ';

  @override
  String get headPosition => 'Baş Pozisyonu';

  @override
  String get progressLabel => 'İLERLEME';

  @override
  String get choosePhotoSource => 'Fotoğraf Kaynağı Seç';

  @override
  String get sideProfileHint => 'Yan profil, tüm vücut karede';

  @override
  String get howToTakePhoto => 'FOTOĞRAF NASIL ÇEKİLİR';

  @override
  String get takePosturePhoto => 'Postür Fotoğrafı Çek';

  @override
  String get postureExcellent => 'Mükemmel';

  @override
  String get postureGood => 'İyi';

  @override
  String get postureNeedsWork => 'Geliştirilmeli';

  @override
  String get posturePoor => 'Zayıf';

  @override
  String get recommendedExercises => 'ÖNERİLEN EGZERSİZLER';

  @override
  String get postureWallStand => 'Duvar Duruşu';

  @override
  String get postureWallStandDesc =>
      'Sırtınızı duvara dayayarak günde 2 dakika durun.';

  @override
  String get postureChestOpener => 'Göğüs Açıcı';

  @override
  String get postureChestOpenerDesc =>
      'Omuzları öne çeken sıkı göğüs kaslarını açar.';

  @override
  String get postureChinTucks => 'Çene Çekme';

  @override
  String get postureChinTucksDesc =>
      'İleri baş postürünü düzeltir — 3×10 tekrar.';

  @override
  String get postureDeadbug => 'Deadbug';

  @override
  String get postureDeadbugDesc =>
      'Lordoz kontrolü için derin karnı güçlendirir.';

  @override
  String get recipesTitle => 'Tarifler';

  @override
  String get recipesHeader => 'TARİFLER';

  @override
  String get recipesSubtitle => 'Büyümenizi besleyin';

  @override
  String get recipesCategoryAll => 'Tümü';

  @override
  String get recipesCategoryBreakfast => 'Kahvaltı';

  @override
  String get recipesCategoryLunch => 'Öğle';

  @override
  String get recipesCategoryDinner => 'Akşam';

  @override
  String get recipesCategorySnack => 'Atıştırmalık';

  @override
  String get recipesGoalAll => 'Tümü';

  @override
  String get recipesGoalProtein => 'Yüksek Protein';

  @override
  String get recipesGoalCalcium => 'Kalsiyum';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => 'Demir';

  @override
  String get recipesNoMatch => 'Bu filtrelere uygun tarif bulunamadı';

  @override
  String get recipesIngredients => 'Malzemeler';

  @override
  String get recipesInstructions => 'Hazırlanışı';

  @override
  String get recipesClose => 'KAPAT';

  @override
  String get recipesAboutTitle => 'Tarifler Hakkında';

  @override
  String get recipesAboutBody =>
      'Büyümenizi desteklemek için özenle seçilmiş tarifler. Öğün türü veya besin hedefine göre filtreleyerek planınıza en uygun tarifi bulun.';

  @override
  String get animHintSpinalDecomp => 'Omurga dekompresyonu';

  @override
  String get animHintGravityReversal => 'Yerçekimi tersine çevirme';

  @override
  String get animHintImpactBones => 'Kemiklere darbe yüklemesi';

  @override
  String get animHintHighImpact => 'Yüksek etkili kemik yüklemesi';

  @override
  String get animHintMetabolicBurst => 'Metabolik patlama antrenmanı';

  @override
  String get animHintFullBodyStretch => 'Tüm vücut uyanış esneme';

  @override
  String get animHintSpinalExtension => 'Omurga uzantısı';

  @override
  String get animHintCervicalDecomp => 'Servikal dekompresyon';

  @override
  String get animHintShoulderMobility => 'Omuz hareketliliği';

  @override
  String get animHintFullBodyMotion => 'Tüm vücut hareketi';

  @override
  String get animHintPosteriorChain => 'Arka zincir esneme';

  @override
  String get animHintMuscleGrowth => 'Kas büyüme yakıtı';

  @override
  String get animHintBoneDensity => 'Kemik yoğunluğu desteği';

  @override
  String get animHintSpinalDisc => 'Omurga diski hidrasyonu';

  @override
  String get animHintCleanNutrition => 'Temiz beslenme';

  @override
  String get animHintIgf1 => 'IGF-1 optimizasyonu';

  @override
  String get animHintHghAmino => 'HGH amino öncüsü';

  @override
  String get animHintCalciumAbsorption => 'Kalsiyum emilimi';

  @override
  String get animHintSpinalAlignment => 'Omurga hizalaması';

  @override
  String get animHintPostureCorrection => 'Postür düzeltme';

  @override
  String get animHintMindBody => 'Zihin-beden dengesi';

  @override
  String get animHintCoreStability => 'Kor stabilite';

  @override
  String get animHintLegPower => 'Bacak gücü ve HGH patlaması';

  @override
  String get animHintVerticalPower => 'Dikey güç';

  @override
  String get animHintHghSurge => 'HGH patlama antrenmanı';

  @override
  String get animHintPeakHgh => 'Tepe HGH salınım penceresi';

  @override
  String get animHintMelatonin => 'Melatonin optimizasyonu';

  @override
  String get animHintDeepSleep => 'Derin uyku düzeni';

  @override
  String get animHintSleepOpt => 'Uyku optimizasyonu';

  @override
  String get animHintExercise => 'Egzersiz';

  @override
  String get formMorningStretch =>
      'Boyun rotasyonlarıyla başla, sonra tüm vücut esneme hareketlerine geç. Her esnemeyi 20-30 saniye sekme yapmadan tut.';

  @override
  String get formBarHanging =>
      'Bara omuz genişliğinde tut, vücudunu tamamen gevşet, yerçekiminin omurganı esnetmesine izin ver. Sallanmaktan kaçın.';

  @override
  String get formCobraStretch =>
      'Yüzüstü yat, elleri omuzların altına koy, kalçayı yerde tutarak üst vücudu yavaşça yukarı it. Yukarı bak.';

  @override
  String get formJumping =>
      'Squat jump veya ip atlama yap. Ayağının parmak uçlarına yumuşak bir şekilde in. Setler arasında 30 saniye dinlen.';

  @override
  String get formSwimmingBasketball =>
      'Yüzme (serbest/sırt üstü) veya basketbol seç. Zıplama, uzanma ve tam hareket aralığına odaklan.';

  @override
  String get formEveningYoga =>
      'Kedi-inek, çocuk pozu, aşağı bakan köpek, öne eğilme gibi nazik pozlar yap. Derin nefes al ve her pozu 30-60 saniye tut.';

  @override
  String get formSprintIntervals =>
      '5 dakika ısın, sonra 30 saniye maksimum eforla sprint yap. 90 saniye yürü veya hafif koş. Tekrarla.';

  @override
  String get formHiitWorkout =>
      'Burpees, dağ tırmanıcısı, squat jump gibi egzersizleri 45 saniye maksimum yoğunlukta yap, 15 saniye dinlen.';

  @override
  String get formSquats =>
      'Ayaklarını omuz genişliğinde aç. Uyluklar yere paralel olana kadar in. Sırtını düz tut, dizlerin ayak parmaklarını geçmesin.';

  @override
  String get formDeadliftStretch =>
      'Ayaklarını kalça genişliğinde aç, sırtını düz tutarak kalçadan eğil. Ayak parmaklarına uzanarak hamstring ve sırt esnekliğini hisset.';

  @override
  String get formOverheadPress =>
      'Dik dur, kollarını tamamen uzatarak yukarı it. Hafif ağırlık veya vücut ağırlığı kullan. Karın kaslarını sık, sırtı bükmekten kaçın.';

  @override
  String get formSkippingRope =>
      'İki ayakla zıpla, ayak parmak uçlarına yumuşak in. Zıplamaları alçak ve tutarlı tut. Setler arasında dinlen.';

  @override
  String get formPilatesCore =>
      'Plank, dead bug, bird dog, köprü ve bacak kaldırma yap. Kontrollü hareket ve nefes almaya odaklan.';

  @override
  String get formInversionHang =>
      'İnversiyon masası veya yerçekimi botları kullan. Hafif bir eğimle başla ve yavaşça artır. Seansları kısa tut.';

  @override
  String get formProtein =>
      'Protein alımını 3-4 öğüne yay. Yumurta, tavuk, balık, süt ürünleri ve baklagilleri dahil et.';

  @override
  String get formCalciumVitaminD =>
      'Günde 3 porsiyon süt ürünü tüket ve doğal D vitamini sentezi için 15 dakika güneşlen.';

  @override
  String get formWater =>
      'Gün boyunca düzenli su iç. Yanında su şişesi taşı ve saatlik hatırlatıcılar kur.';

  @override
  String get formAvoidJunk =>
      'Fast food yerine doğal gıdalar tercih et. Şekerli içecekleri suyla değiştir. Etiketleri oku ve işlenmiş gıdalardan kaçın.';

  @override
  String get formZincIntake =>
      'Kırmızı et, kabak çekirdeği, nohut, kaju ve istiridye diyetine dahil et. Günde 8-11 mg hedefle.';

  @override
  String get formVitaminDSunlight =>
      'Kollarını ve yüzünü 15 dakika doğrudan güneş ışığına maruz bırak, tercihen öğleden önce. Bu süre için güneş kremi gerekmez.';

  @override
  String get formArginineFoods =>
      'Fındık, tohumlar, hindi, tavuk, soya fasulyesi ve süt ürünlerini öğünlerine dahil et. Uyku öncesi tüketilmesi en iyisidir.';

  @override
  String get formQualitySleep =>
      'Saat 22:00\'ye kadar yat. Odayı karanlık ve serin tut. Öğleden sonra 14:00\'ten sonra kafein tüketmekten kaçın.';

  @override
  String get formNoScreen =>
      'Yatmadan 1 saat önce alarm kur. Tüm ekranları kaldır. Bunun yerine kitap oku veya hafif esneme yap.';

  @override
  String get formSleepEnvironment =>
      'Karartma perdeleri kullan, odayı 18-20°C\'de tut, tüm ışık kaynaklarını kaldır. Rahat bir yatak ve yastık kullan.';

  @override
  String get formPreSleepRoutine =>
      'Yatmadan 30 dakika önce başla: ışıkları kıs, kitap oku, nefes egzersizleri yap, uyarıcı aktivitelerden kaçın.';

  @override
  String get formPostureCheck =>
      'Omuzlarını geri ve aşağı çekerek dik dur. Karın kaslarını hafifçe sık. Başının tepesinden seni yukarı çeken bir ip hayal et.';

  @override
  String get formWallStand =>
      'Topuklar, kalça, kürek kemikleri ve başın duvara değecek şekilde dur. 5 dakika tut. Normal nefes al.';

  @override
  String get formNeckStretches =>
      'Başını yavaşça her iki tarafa, öne ve arkaya eğ. Her yönü 30 saniye tut. Esnemeyi zorlama.';

  @override
  String get formShoulderRolls =>
      'Omuzları 15 kez öne, sonra 15 kez arkaya döndür. Ardından 20 saniye tutarak göğüs açma esnemeleri yap.';

  @override
  String get sciMorningStretch =>
      'Sabah esnemesi, gece boyunca yeniden hidrate olan omurga disklerini açar ve boy korumayı maksimize eder';

  @override
  String get sciBarHanging =>
      'Asılma, yerçekimini kullanarak omurga disklerini açar ve geçici olarak boy uzaması sağlayabilir';

  @override
  String get sciCobraStretch =>
      'Kobra esneme, omurgayı uzatır ve göğsü açarak oturmadan kaynaklanan omurga sıkışmasını azaltır';

  @override
  String get sciJumping =>
      'Yüksek etkili zıplama, bacaklardaki büyüme plaklarını uyarır ve büyüme hormonu salınımını tetikler';

  @override
  String get sciSwimmingBasketball =>
      'Yüzme ve basketbol, büyüme plağı aktivitesini uyaran tüm vücut esneme, zıplama ve uzanma içerir';

  @override
  String get sciEveningYoga =>
      'Akşam yogası, büyüme hormonunu baskılayan kortizolü azaltır ve gece toparlanması için kasları esnetir';

  @override
  String get sciSprintIntervals =>
      'Sprint, önemli miktarda büyüme hormonu salınımını tetikler';

  @override
  String get sciHiitWorkout =>
      'Yüksek yoğunluklu egzersiz, HGH\'yi %450\'ye kadar artırır';

  @override
  String get sciSquats => 'Squat, bacak ve omurgadaki büyüme plaklarını uyarır';

  @override
  String get sciDeadliftStretch =>
      'Omurga dekompresyonu, vertebral disk sağlığını destekler';

  @override
  String get sciOverheadPress =>
      'Baş üstü press, omurgayı esnetir ve duruş kaslarını güçlendirir';

  @override
  String get sciSkippingRope =>
      'Tekrarlayan zıplama, alt ekstremitelerdeki büyüme plaklarını uyarır';

  @override
  String get sciPilatesCore =>
      'Karın gücü, omurga hizalamasını ve duruşu destekler';

  @override
  String get sciInversionHang =>
      'İnversiyon, omurga disklerini açar, geçici olarak 1-2 cm ekleyebilir';

  @override
  String get sciProtein =>
      'Protein, kemik ve kas büyümesi için gerekli amino asitleri sağlar, özellikle büyüme atılımları sırasında';

  @override
  String get sciCalciumVitaminD =>
      'Kalsiyum ve D Vitamini, kemik yoğunluğu ve doğrusal kemik büyümesinin temel yapı taşlarıdır';

  @override
  String get sciWater =>
      'Hidrasyon, büyüme plaklarına besin taşınması ve eklem kıkırdak sağlığı için gereklidir';

  @override
  String get sciAvoidJunk =>
      'İşlenmiş gıdalar ve şeker, büyüme hormonu salgılanmasını baskılayan iltihap ve insülin artışlarına neden olur';

  @override
  String get sciZincIntake => 'Çinko, büyüme hormonu üretimi için gereklidir';

  @override
  String get sciVitaminDSunlight =>
      'D Vitamini, kalsiyum emilimi ve kemik büyümesi için çok önemlidir';

  @override
  String get sciArginineFoods =>
      'L-Arjinin, büyüme hormonu salgılanmasını uyarır';

  @override
  String get sciQualitySleep =>
      'Günlük büyüme hormonunun %70-80\'i derin uyku evrelerinde, özellikle 22:00-02:00 arasında salınır';

  @override
  String get sciNoScreen =>
      'Ekranlardan gelen mavi ışık, melatonin üretimini baskılar, uykuya dalmayı geciktirir ve derin uyku kalitesini düşürür';

  @override
  String get sciSleepEnvironment =>
      'Karanlık, serin ortam melatonin ve büyüme hormonunu maksimize eder';

  @override
  String get sciPreSleepRoutine =>
      'Tutarlı uyku öncesi rutin, derin uyku kalitesini %23 artırır';

  @override
  String get sciPostureCheck =>
      'Doğru duruş hizalaması, görünen boya anında 2-3 cm ekleyebilir ve omurga sıkışmasını önler';

  @override
  String get sciWallStand =>
      'Duvar duruşu, postüral kas hafızasını eğitir ve gün boyunca doğru omurga hizalamasını korumaya yardımcı olur';

  @override
  String get sciNeckStretches =>
      'Boyun esnemeleri, sıkışmayı giderir ve servikal hizalamayı iyileştirir';

  @override
  String get sciShoulderRolls =>
      'Omuzları açmak, öne doğru duruşu düzeltir, görünüşte 1-2 cm ekleyebilir';

  @override
  String get muscleSpine => 'Omurga';

  @override
  String get muscleLegs => 'Bacaklar';

  @override
  String get muscleBack => 'Sırt';

  @override
  String get muscleShoulders => 'Omuzlar';

  @override
  String get muscleArms => 'Kollar';

  @override
  String get muscleCore => 'Karın';

  @override
  String get muscleChest => 'Göğüs';

  @override
  String get muscleCalves => 'Baldırlar';

  @override
  String get muscleFullBody => 'Tüm Vücut';

  @override
  String get muscleHips => 'Kalça';

  @override
  String get muscleBones => 'Kemikler';

  @override
  String get muscleMuscles => 'Kaslar';

  @override
  String get muscleNeck => 'Boyun';

  @override
  String get muscleUpperSpine => 'Üst Omurga';

  @override
  String get muscleUpperBack => 'Üst Sırt';

  @override
  String get createRoutine => 'Rutin Oluştur';

  @override
  String get createRoutineTitle => 'Özel Rutin Oluştur';

  @override
  String get createRoutineSubtitle => 'Kendi günlük rutinini oluştur';

  @override
  String get routineIcon => 'İkon';

  @override
  String get routineTitleField => 'Başlık';

  @override
  String get routineDescField => 'Açıklama';

  @override
  String get routineDescHint => 'Rutinin kısa özeti';

  @override
  String get routineCategoryField => 'Kategori';

  @override
  String get routineDifficultyField => 'Zorluk';

  @override
  String get routineDurationField => 'Süre';

  @override
  String get routineSetsRepsField => 'Set x Tekrar';

  @override
  String get routineFormField => 'Yapılışı ve Talimatlar';

  @override
  String get routineFormHint => 'İsteğe bağlı — rutinin nasıl yapılacağı';

  @override
  String get diffBeginner => 'Başlangıç';

  @override
  String get diffIntermediate => 'Orta';

  @override
  String get diffAdvanced => 'İleri';

  @override
  String get catExercise => 'Egzersiz';

  @override
  String get catNutrition => 'Beslenme';

  @override
  String get catSleep => 'Uyku';

  @override
  String get catPosture => 'Postür';

  @override
  String get postureTip1 => 'Kameraya yan durun (yan profil).';

  @override
  String get postureTip2 => 'Objektiften ~2 metre uzakta durun.';

  @override
  String get postureTip3 => 'Kollarınız rahat olsun, dümdüz bakın.';

  @override
  String get postureTip4 => 'Doğru puanlama için dar kıyafet giyin.';

  @override
  String get postureTip5 => 'İyi aydınlatma ve düz arka plan kullanın.';

  @override
  String get kyphosisLabel => 'Kifoz (üst sırt)';

  @override
  String get lordosisLabel => 'Lordoz (alt sırt)';

  @override
  String get analyzingPosture => 'POSTÜR ANALİZ EDİLİYOR';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get termsOfService => 'Kullanım Şartları';

  @override
  String version(String ver) {
    return 'Versiyon $ver';
  }

  @override
  String get rateApp => 'BeTaller\'ı Değerlendir';

  @override
  String get rateAppSubtitle => 'Değerlendirmeniz bize güç veriyor!';

  @override
  String get unitSystem => 'Ölçü Birimi';

  @override
  String get unitMetric => 'Metrik (cm, kg)';

  @override
  String get unitImperial => 'İngiliz (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'Sağlık Uyarısı';

  @override
  String get healthDisclaimerBody =>
      'BeTaller genel sağlık ve fitness rehberliği sunar. Sonuçlar yaşa, genetiğe ve bireysel faktörlere göre değişir. Bu uygulama tıbbi tavsiye vermez. Egzersizler postür optimizasyonu, omurga sağlığı ve doğal alışkanlıklarla büyüme hormonu desteğine odaklanır. Yeni bir egzersiz veya beslenme programına başlamadan önce bir sağlık uzmanına danışın. Büyüme plakları kapandıktan sonra (genellikle 18-25 yaş) boy değişiklikleri ağırlıklı olarak postür iyileştirmesinden kaynaklanır.';

  @override
  String get sciSourcePrefix => 'Kaynak: ';

  @override
  String get program => 'Program';

  @override
  String get todaysExercises => 'BUGÜNKÜ EGZERSİZLER';

  @override
  String get dailyNutritionPlan => 'GÜNLÜK BESLENME PLANI';

  @override
  String get testimonial1 =>
      'Yaşım büyük olduğu için umudum yoktu ama BeTaller ile uzadım. Özgüvenim hiç bu kadar yüksek olmamıştı.';

  @override
  String get testimonialDuration1 => '4 ay';

  @override
  String get testimonial2 =>
      'Herkes \"artık büyüyemezsin\" dedi. BeTaller\'ı kullandım ve herkesi şaşırttım.';

  @override
  String get testimonialDuration2 => '3 ay';

  @override
  String get testimonial3 =>
      'Rutinlere başladıktan sonra hem boyum uzadı hem duruşum düzeldi. Çevremdekiler farkı hemen fark etti.';

  @override
  String get testimonialDuration3 => '6 ay';

  @override
  String get testimonial4 =>
      'Hâlâ büyüme çağındayım ama BeTaller\'ın etkisi inanılmaz. Hem daha uzun hem daha güçlü hissediyorum.';

  @override
  String get testimonialDuration4 => '3 ay';

  @override
  String get testimonial5 =>
      'BeTaller\'ı denemedim desem yalan olur. Kısa sürede ciddi fark hissettim, kesinlikle tavsiye ederim.';

  @override
  String get testimonialDuration5 => '4 ay';

  @override
  String get designedForYou => 'Senin için tasarlandı';

  @override
  String get designedForYouDesc =>
      'BeTaller, genetik limitine ulaşman — hatta onu aşman — için sana özel kuruldu. Her özellik, sen için.';

  @override
  String get greetingAllDone => 'Harika iş! 🎯';

  @override
  String get greetingAllDoneSub => 'Bugünkü görevlerini tamamladın.';

  @override
  String greetingStreak30(int streak) {
    return '$streak günlük seri — efsane seviyedesin.';
  }

  @override
  String greetingStreak7(int streak) {
    return '$streak günlük seri — yoluna devam et.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak gün art arda. Çoğu kişi bıraktı. Sen bırakmadın.';
  }

  @override
  String get greetingMorning => 'Günaydın. Yeni bir gün, yeni bir fırsat.';

  @override
  String get greetingAfternoon => 'Serine başlamak için bugün harika bir gün.';

  @override
  String get greetingEvening => 'Görevleri tamamla, serine başla.';

  @override
  String get todayCompleted => 'Bugün tamamlandı ✓';

  @override
  String get todayGoals => 'Bugünkü hedefler';

  @override
  String get challengesLabel => 'Görevler';

  @override
  String get dailyChallengesLabel => 'GÜNLÜK GÖREVLER';

  @override
  String get expiresTonight => 'Bu gece bitiyor';

  @override
  String get allChallengesCompleted => 'Hepsi tamamlandı ✓';

  @override
  String get challengesLoading => 'Yeni görevler yakında yükleniyor.';

  @override
  String get challengesLoadingTitle => 'Günlük görevler';

  @override
  String get behindPace => 'Geride kalıyorsun';

  @override
  String get growthTracking => 'Büyüme takibi';

  @override
  String get growthEmptyFirst => 'İlk boyunu kaydet, büyümeni takip et.';

  @override
  String get growthEmptySecond => 'İkinci ölçümünü kaydet, grafiğini gör.';

  @override
  String get growthSectionLabel => 'BÜYÜME';

  @override
  String get generalPerformance => 'GENEL PERFORMANS';

  @override
  String get exploreLabel => 'KEŞFET';

  @override
  String get explorePosture => 'Postür Analizi';

  @override
  String get explorePostureSub => 'Duruş analizi ve düzeltme önerileri';

  @override
  String get explorePhotos => 'İlerleme Fotoğrafları';

  @override
  String get explorePhotosSub => 'Değişimi fotoğraflarla takip et';

  @override
  String get exploreNutrition => 'Beslenme';

  @override
  String get exploreNutritionSub => 'Protein, kalsiyum ve vitamin rehberi';

  @override
  String get exploreHealth => 'Sağlık Takibi';

  @override
  String get exploreHealthSub => 'Stres, kafein ve wellness takibi';

  @override
  String get exploreRecipes => 'Büyüme Tarifleri';

  @override
  String get exploreRecipesSub => 'Büyümeyi destekleyen yemek tarifleri';

  @override
  String get educationLabel => 'EĞİTİM';

  @override
  String get educationTitle => 'Boy uzatma\nbilimi';

  @override
  String get educationSubtitle => 'Uzman içerikler, araştırmalar ve rehberler';

  @override
  String get aiAnalysisLabel => 'AI ANALİZ';

  @override
  String get peerCompareLabel => 'AKRANLARLA KARŞILAŞTIR';

  @override
  String peerCompareText(int topPct) {
    return 'Akranlarının Top $topPct%\'ündesin';
  }

  @override
  String get notifWaterTitle => '💧 Su İçmeyi Unutma!';

  @override
  String get notifWaterBody =>
      'Günlük su hedefine ulaştın mı? Bir bardak daha iç!';

  @override
  String get notifMorningTitle => '🌅 Günaydın! Egzersiz Vakti';

  @override
  String get notifMorningBody =>
      'Sabah germe egzersizini yap! 10 dakika omurga ve bacak kaslarını esnet.';

  @override
  String get notifRoutineTitle => '🔥 Rutinlerini Tamamla!';

  @override
  String get notifRoutineBody =>
      'Gün bitmeden rutinlerini kontrol et. Seri yapmak = disiplin!';

  @override
  String get notifProteinTitle => '🥚 Protein Günü!';

  @override
  String get notifProteinBody => 'Haftaya güçlü başla! Her öğünde protein al.';

  @override
  String get notifNewWeekTitle => '✨ Yeni Hafta, Yeni Hedefler!';

  @override
  String get notifNewWeekBody =>
      'Bu hafta rutinlerini aksatma. Küçük adımlar büyük farklar yaratır!';

  @override
  String get notifSleepTitle => '😴 Uyku Zamanı!';

  @override
  String get notifSleepBody =>
      'Büyüme hormonu 22:00-02:00 arası en yüksek. Telefonunu bırak ve uyu!';

  @override
  String get notifPostureTitle => '🧍 Duruş Kontrolü!';

  @override
  String get notifPostureBody =>
      'Sırtını dik tut, omuzlarını geri çek. Doğru duruş = 2-3 cm fark!';

  @override
  String get notifVitaminDTitle => '☀️ D Vitamini Zamanı!';

  @override
  String get notifVitaminDBody =>
      '15 dakika güneşlen! D vitamini kalsiyum emilimini artırır.';

  @override
  String get notifMidweekTitle => '✨ Yarı Yoldayız!';

  @override
  String get notifMidweekBody =>
      'Haftanın ortası. Büyüme sabır ister ama düzenli olan kazanır!';

  @override
  String get notifScreenTitle => '📵 Ekranları Kapat!';

  @override
  String get notifScreenBody =>
      'Yatmadan 1 saat önce ekranlardan uzaklaş. Mavi ışık melatonin üretimini engeller!';

  @override
  String get notifJumpTitle => '🦘 Zıplama Vakti!';

  @override
  String get notifJumpBody =>
      'Zıplama egzersizleri büyüme plakalarını uyarır. 3 set x 20 tekrar dene!';

  @override
  String get notifCalciumTitle => '🥛 Kalsiyum Zamanı!';

  @override
  String get notifCalciumBody =>
      'Bir bardak süt veya yoğurt tüket. Kalsiyum kemik gelişimi için kritik!';

  @override
  String get notifPostureCheckTitle => '🧍 Duruş Kontrolü!';

  @override
  String get notifPostureCheckBody =>
      'Telefona bakarken boynunu eğme! Dik otur dik yürü.';

  @override
  String get notifWeekendTitle => '✨ Hafta Sonu Motivasyonu';

  @override
  String get notifWeekendBody =>
      'Hafta sonu da rutinlerini aksatma! Disiplin her gün geçerli.';

  @override
  String get notifWeeklyProgressTitle => '📊 Haftalık İlerleme';

  @override
  String get notifWeeklyProgressBody =>
      'Bu haftayı nasıl geçirdin? Büyüme grafiğini kontrol et!';

  @override
  String get notifMeasureTitle => '📏 Haftalık Boy Ölçümü!';

  @override
  String get notifMeasureBody =>
      'Boyunu ölç ve kaydet! Sabah ölçümü en doğru sonucu verir.';

  @override
  String get notifEarlySleepTitle => '😴 Erken Yat, Erken Kalk!';

  @override
  String get notifEarlySleepBody =>
      'Yarın pazartesi! İyi bir uykuyla haftaya güçlü başla.';

  @override
  String get notifStreak3Title => '🔥 3 Gün Serisi!';

  @override
  String get notifStreak3Body =>
      'Harika başlangıç! 3 gün üst üste tamamladın. Devam et!';

  @override
  String get notifStreak7Title => '🏆 1 Hafta Serisi!';

  @override
  String get notifStreak7Body =>
      'İnanılmaz! 7 gün üst üste tüm rutinleri tamamladın!';

  @override
  String get notifStreak14Title => '⭐ 2 Hafta Serisi!';

  @override
  String get notifStreak14Body =>
      '14 gün disiplin! Vücudun değişmeye başlıyor.';

  @override
  String get notifStreak30Title => '👑 1 Ay Serisi!';

  @override
  String get notifStreak30Body => '30 gün! Sen bir şampiyon!';

  @override
  String get notifStreak60Title => '🌟 60 Gün Serisi!';

  @override
  String get notifStreak60Body => '60 gün! İnanılmaz bir başarı.';

  @override
  String get notifStreak100Title => '💎 100 GÜN! EFSANEVİ!';

  @override
  String get notifStreak100Body => '100 gün üst üste! Sen bir efsane oldun.';

  @override
  String get notifStreakRiskTitle => '⚠️ Serini Kaybetme!';

  @override
  String notifStreakRiskBody(int streak) {
    return '$streak günlük serin tehlikede! Rutinlerini tamamla.';
  }

  @override
  String get paywallStat1 => 'cm — senin potansiyelin kilitli';

  @override
  String get paywallTitle1 => 'Kaç cm Daha\nUzayabilirsin?';

  @override
  String get paywallBullet1a =>
      'Genetik tavanın hesaplandı, görmek ister misin?';

  @override
  String get paywallBullet1b => 'Yaşam tarzın büyümeni nasıl etkiliyor?';

  @override
  String get paywallBullet1c => 'Sana özel yol haritası seni bekliyor';

  @override
  String get paywallStat2 => 'sana özel rutin hazır';

  @override
  String get paywallTitle2 => 'Planın\nHazır';

  @override
  String get paywallBullet2a => 'Her sabah 8 dakika — omurgan için tasarlandı';

  @override
  String get paywallBullet2b => 'Uyku, beslenme, su — hepsi takip altında';

  @override
  String get paywallBullet2c => 'Her gün bir adım daha, seri kırılmasın';

  @override
  String get paywallStat3 => 'gerçek zamanlı ilerleme grafiklerin';

  @override
  String get paywallTitle3 => 'Büyümeni\nTakip Et';

  @override
  String get paywallBullet3a => 'Aylık ölçüm — büyümeni kendi gözlerinle gör';

  @override
  String get paywallBullet3b => 'Postür analizi ile şu an bile 2 cm kazan';

  @override
  String get paywallBullet3c => 'İlerleme fotoğrafları — farkı net göreceksin';

  @override
  String get paywallStat4 => 'günlük program — seviye atlıyor';

  @override
  String get paywallTitle4 => 'Her Gün\nDaha Güçlü';

  @override
  String get paywallBullet4a =>
      'XP kazan, seviyeleri aç — alışkanlık oyuna döner';

  @override
  String get paywallBullet4b => 'Hedefine ulaşanlar buradan geçti';

  @override
  String get paywallBullet4c => 'Sen de başla — ilk hafta ücretsiz';

  @override
  String get paywallRestore => 'Daha önce yapılmış bir satın alma bulunamadı';

  @override
  String get paywallRestoreNotFound =>
      'Daha önce yapılmış bir satın alma bulunamadı';

  @override
  String get paywallRestoreLabel => 'Satın Alımları Geri Yükle';

  @override
  String get paywallYearly => 'Yıllık';

  @override
  String get paywallBestValue => 'En iyi değer';

  @override
  String get paywallMonthly => 'Aylık';

  @override
  String get paywallFreeTrial => '3 gün ücretsiz';

  @override
  String get paywallLoadError => 'Satın alma yüklenemedi, tekrar dene';

  @override
  String get paywallCta => 'Ücretsiz Dene';

  @override
  String get paywallCtaAlt => 'Devam Et';

  @override
  String get paywallTrialDisclaimer =>
      '3 gün ücretsiz · sonra otomatik yenilenir · istediğin zaman iptal et';

  @override
  String get paywallYearlyDisclaimer =>
      'Yıllık otomatik yenilenir · istediğin zaman iptal et';

  @override
  String get paywallTester => 'Tester';

  @override
  String get introTag1 => 'TAHMİN';

  @override
  String get introTag2 => 'BÜYÜME';

  @override
  String get introTag3 => 'TAKİP';

  @override
  String get introTag4 => 'GAMİFİKASYON';

  @override
  String get introTag5 => 'TOPLULUK';

  @override
  String get introTitle1 => 'Boy potansiyelini\nkeşfet';

  @override
  String get introSubtitle1 =>
      'Genetik, yaş ve yaşam tarzına göre\ntam potansiyelini hesaplayalım.';

  @override
  String get introTitle2 => 'Her gün 1 adım\ndaha uzun';

  @override
  String get introSubtitle2 =>
      'Kişiselleştirilmiş egzersiz ve beslenme\nplanıyla potansiyelini zorla.';

  @override
  String get introTitle3 => 'Her santimetreyi\ntakip et';

  @override
  String get introSubtitle3 =>
      'Aylık ölçümlerle gerçek ilerlemenin\nnasıl geliştiğini izle.';

  @override
  String get introTitle4 => 'Seviyeleri aş,\nödülleri kazan';

  @override
  String get introSubtitle4 =>
      '70 günlük programları tamamla,\nXP kazan ve yeni seviyeleri aç.';

  @override
  String get introTitle5 => 'Binlerce kişi\nzaten büyüdü';

  @override
  String get introSubtitle5 =>
      'Hedefine ulaşan kullanıcı topluluğuna\nsen de katıl.';

  @override
  String get criticalWindow => 'KRİTİK PENCERE';

  @override
  String get heightPotentialFading => 'Boy potansiyelin';

  @override
  String get fadingAway => 'kaybolup gidiyor!';

  @override
  String get painHookDesc =>
      'Her geçen gün, doğru alışkanlıklar olmadan santimler kalıcı olarak kayboluyor. Ama bu hâlâ tersine çevrilebilir.';

  @override
  String get painGeneticTitle => 'Genetiğin her şeyi değil';

  @override
  String get painGeneticDesc =>
      'Genetiğin %60\'ını belirliyor — ama yaptıkların geri kalan %40\'ı belirliyor. BeTaller tam da bu %40 için burada.';

  @override
  String get painGeneticTag => 'Analiz';

  @override
  String get painSleepTitle => 'Uyku rutinini optimize et';

  @override
  String get painSleepDesc =>
      'Her gece doğru uyku büyüme hormonu üretimini %70 artırabilir. BeTaller uyku takibini otomatik yapar, sen sadece uyu.';

  @override
  String get painSleepTag => 'Takip';

  @override
  String get painPostureTitle => 'Postürünle şu an santim kazan';

  @override
  String get painPostureDesc =>
      'Doğru duruş sana anında 1.5–3 cm katabilir. BeTaller\'ın günlük postür rutini bunu birkaç haftada yerleştirir.';

  @override
  String get painPostureTag => 'Postür';

  @override
  String get painExerciseTitle => 'Sana özel egzersiz planın hazır';

  @override
  String get painExerciseDesc =>
      'Sabah germe, asılma, omurga rutinleri — BeTaller bunları senin için hazırladı ve planladı. Her gün 8–12 dakika yeter.';

  @override
  String get painExerciseTag => 'Rutinler';

  @override
  String get painNutritionTitle => 'Beslenmen büyümeni doğrudan etkiler';

  @override
  String get painNutritionDesc =>
      'Protein, kalsiyum, D vitamini — BeTaller hangi besinleri ne zaman almanı gerektiğini her gün hatırlatır.';

  @override
  String get painNutritionTag => 'Beslenme';

  @override
  String get painTrackingTitle => 'Büyümeni gözlerinle takip et';

  @override
  String get painTrackingDesc =>
      'Aylık ölçüm, ilerleme fotoğrafları, büyüme grafiği — kazandığın her santimi gör.';

  @override
  String get painTrackingTag => 'İlerleme';

  @override
  String get selectYourGender => 'Cinsiyetini seç';

  @override
  String get onboardingPredictSubtitle =>
      'Boy potansiyelini tahmin etmek ve sana özel plan oluşturmak için kullanılacak.';

  @override
  String get other => 'Diğer';

  @override
  String get whenWereYouBorn => 'Ne zaman doğdun?';

  @override
  String get heightAndWeight => 'Boy ve kilo';

  @override
  String get parentsHeight => 'Anne-baba boyu';

  @override
  String get weeklyWorkout => 'Haftalık antrenman';

  @override
  String get workoutsPerWeek => 'Haftada antrenman';

  @override
  String get whatsYourEthnicity => 'Etnik kökenin nedir?';

  @override
  String get whiteCaucasian => 'Beyaz / Kafkas';

  @override
  String get blackAfricanAmerican => 'Siyahi / Afrikalı Amerikalı';

  @override
  String get hispanicLatino => 'Hispanik / Latin';

  @override
  String get asian => 'Asyalı';

  @override
  String get middleEasternIndigenous => 'Orta Doğulu / Yerli';

  @override
  String get dontWantToAnswer => 'Cevap vermek istemiyorum';

  @override
  String get footSizeLabel => 'Ayak numarası';

  @override
  String get selectYourSize => 'Numaranı seç';

  @override
  String get whatsYourDreamHeight => 'Hedef boyun ne?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Girdiğin bilgilere göre bu boya ulaşma olasılığını hesaplayacağız.';

  @override
  String get dreamHeightLabel => 'Hedef boy';

  @override
  String get sleepQuestion => 'Her gece kaç saat\nuyuyorsun?';

  @override
  String get thousandsSucceeded => 'Binlerce Kişi\nBaşardı';

  @override
  String get youCanToo => 'Sen de başarabilirsin';

  @override
  String get yearsOld => 'yaşında';

  @override
  String get verifiedLabel => 'Doğrulanmış';

  @override
  String get scientificData => 'BİLİMSEL VERİ';

  @override
  String get longTermResults => 'BeTaller uzun vadeli\nsonuçlar yaratır';

  @override
  String get longTermResultsSubtitle =>
      'Pek çok kişi yanlış alışkanlıklar yüzünden nihai boyuna ulaşamıyor.';

  @override
  String get yourFinalHeight => 'Nihai boyun';

  @override
  String get badHabitsLegend => 'Kötü alışkanlıklar';

  @override
  String get optimizedLegend => 'Optimize edilmiş';

  @override
  String get chartFact1Pct => '%30';

  @override
  String get chartFact1Desc => 'Boy alışkanlıklarla\ndeğiştirilebilir';

  @override
  String get chartFact2Pct => '9-10s';

  @override
  String get chartFact2Desc => 'İdeal uyku büyüme\nhormonunu artırır';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Postür iyileştirmeyle\nkazanılabilir';

  @override
  String get didYouKnow => 'Biliyor muydun?';

  @override
  String get didYouKnowFact1 => 'Günlük alışkanlıklar boyun %30\'unu etkiler';

  @override
  String get didYouKnowFact2 => 'Omurga kasılması 1.5-3 cm boyunu çalar';

  @override
  String get didYouKnowFact3 => 'Uyku eksikliği HGH\'ı %70 düşürür';

  @override
  String get transformJourneyBegins => 'Dönüşüm\nYolculuğun Başlıyor';

  @override
  String get transformJourneySubtitle =>
      'Bilimsel olarak kanıtlanmış program seni\nhedefine adım adım taşır.';

  @override
  String get week1Label => '1H';

  @override
  String get week1Title => '1. Hafta';

  @override
  String get week1Desc => 'Omurga düzelir, duruş pozisyonu iyileşir';

  @override
  String get month1Label => '1A';

  @override
  String get month1Title => '1. Ay';

  @override
  String get month1Desc => 'İlk görünür santimler, uyku kalitesi artar';

  @override
  String get month3Label => '3A';

  @override
  String get month3Title => '3. Ay';

  @override
  String get month3Desc => 'Ortalama +1.5–2.5 cm kazanım, kas gelişimi';

  @override
  String get month6Label => '6A';

  @override
  String get month6Title => '6. Ay';

  @override
  String get month6Desc => 'Maksimum potansiyeline ulaş, yeni boyunla yaşa';

  @override
  String get reachYourGoal => 'Hedefine Ulaş';

  @override
  String get journeyBullet1 => 'Maksimum potansiyelini ortaya çıkar';

  @override
  String get journeyBullet2 => 'Yeni boyunla yaşamaya başla';

  @override
  String get journeyBullet3 => 'Başarı hikayeni yaz';

  @override
  String get unlockButton => 'Kilitleri Aç';

  @override
  String get dreamHeightOdds => 'Hedef boy\nolasılığı';

  @override
  String get growthCompleteLabel => 'Büyüme\ntamamlanma';

  @override
  String get tallerThanPct => 'Yaşıtlarının %76.7\'sinden uzun';

  @override
  String get levelNovice => 'Acemi';

  @override
  String get levelBuilder => 'Geliştirici';

  @override
  String get levelGrinder => 'Azimkar';

  @override
  String get levelWarrior => 'Savaşçı';

  @override
  String get levelGodTier => 'Efsanevi';

  @override
  String get levelDesc0 => 'Temelini oluştur';

  @override
  String get levelDesc1 => 'Büyümeyi hızlandır';

  @override
  String get levelDesc2 => 'Antrenmanı yoğunlaştır';

  @override
  String get levelDesc3 => 'Limitlerini zorla';

  @override
  String get levelDesc4 => 'Acısız zafer olmaz';

  @override
  String get levelDesc5 => 'Şampiyon zihniyeti';

  @override
  String get levelDesc6 => 'Elit performans';

  @override
  String get levelDesc7 => 'Bedenine hakim ol';

  @override
  String get levelDesc8 => 'Efsanevi disiplin';

  @override
  String get levelDesc9 => 'Maksimum potansiyel';

  @override
  String levelLabel(int level) {
    return 'SEVİYE $level';
  }

  @override
  String daysLeftProgram(int days) {
    return 'Programında $days gün kaldı';
  }

  @override
  String get tapLabel => 'TIKLA';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'Gün';

  @override
  String get legendShort => 'Kısa';

  @override
  String get legendBelowAvg => 'Orta altı';

  @override
  String get legendAverage => 'Ortalama';

  @override
  String get legendTall => 'Uzun';

  @override
  String get legendVeryTall => 'Çok uzun';

  @override
  String get pctBottom5 => 'Alt 5%';

  @override
  String get pctBottom25 => 'Alt 25%';

  @override
  String get pctMedian => 'Ortalama';

  @override
  String get pctTop25 => 'Üst 25%';

  @override
  String get pctTop5 => 'Üst 5%';

  @override
  String get fallingBehind => 'Geride kalıyorsun';
}
