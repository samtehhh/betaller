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
  String get navRoutines => 'Rutinler';

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
  String get noData => 'Veri yok';

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
  String get brandingSubtitle => 'Büyüme potansiyelini keşfet';

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
  String get onboardingSubtitle => 'Büyüme potansiyelini keşfet';

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
  String get routineSprintIntervals => 'Sprint Interval Training';

  @override
  String get routineSprintIntervalsDesc =>
      'Sprint interval training triggers significant growth hormone release through high-intensity bursts.';

  @override
  String get routineHiitWorkout => 'HIIT Workout';

  @override
  String get routineHiitWorkoutDesc =>
      'High intensity interval training to maximize growth hormone release.';

  @override
  String get routineSquats => 'Bodyweight Squats';

  @override
  String get routineSquatsDesc =>
      'Bodyweight squats stimulate growth plates in legs and spine.';

  @override
  String get routineDeadliftStretch => 'Deadlift Stretch';

  @override
  String get routineDeadliftStretchDesc =>
      'Deadlift stretch for spinal decompression and vertebral disc health.';

  @override
  String get routineOverheadPress => 'Overhead Press';

  @override
  String get routineOverheadPressDesc =>
      'Overhead pressing stretches the spine and strengthens posture muscles.';

  @override
  String get routineSkippingRope => 'Skipping Rope';

  @override
  String get routineSkippingRopeDesc =>
      'Repetitive jumping with a skipping rope stimulates growth plates in lower extremities.';

  @override
  String get routinePilatesCore => 'Pilates Core';

  @override
  String get routinePilatesCoreDesc =>
      'Pilates core exercises support spinal alignment and posture.';

  @override
  String get routineInversionHang => 'Inversion Hanging';

  @override
  String get routineInversionHangDesc =>
      'Inversion decompresses spinal discs, can temporarily add 1-2cm.';

  @override
  String get routineZincIntake => 'Zinc Rich Foods';

  @override
  String get routineZincIntakeDesc =>
      'Consume zinc-rich foods throughout the day for growth hormone production.';

  @override
  String get routineVitaminDSunlight => 'Vitamin D & Sunlight';

  @override
  String get routineVitaminDSunlightDesc =>
      'Get at least 15 minutes of direct sunlight for Vitamin D synthesis and bone growth.';

  @override
  String get routineArginineFoods => 'Arginine Rich Foods';

  @override
  String get routineArginineFoodsDesc =>
      'Eat arginine-rich foods to stimulate growth hormone secretion.';

  @override
  String get routineSleepEnvironment => 'Optimize Sleep Environment';

  @override
  String get routineSleepEnvironmentDesc =>
      'Create a dark, cool sleeping environment to maximize melatonin and growth hormone release.';

  @override
  String get routinePreSleepRoutine => 'Pre-Sleep Wind Down';

  @override
  String get routinePreSleepRoutineDesc =>
      'A consistent pre-sleep routine improves deep sleep quality by 23%.';

  @override
  String get routineNeckStretches => 'Neck Stretches';

  @override
  String get routineNeckStretchesDesc =>
      'Neck stretches relieve compression and improve cervical alignment.';

  @override
  String get routineShoulderRolls => 'Shoulder Rolls & Opens';

  @override
  String get routineShoulderRollsDesc =>
      'Opening shoulders corrects forward posture, can add 1-2cm in appearance.';

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
  String get durationNight => 'Night';

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
}
