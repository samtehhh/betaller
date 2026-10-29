// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get navHome => 'Utama';

  @override
  String get navAnalysis => 'Analisis';

  @override
  String get navRoutines => 'Pelan Saya';

  @override
  String get disciplineTitle => 'Disiplin';

  @override
  String get disciplineProgramTitle => 'Program disiplin';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total hari';
  }

  @override
  String get disciplineCompleteDay => 'Selesaikan hari ini';

  @override
  String disciplineDayN(int n) {
    return 'Hari $n';
  }

  @override
  String get disciplineLevels => 'Tahap';

  @override
  String get disciplineLevelDone => 'Selesai';

  @override
  String get disciplineLocked => 'Terkunci';

  @override
  String get disciplineTodayIs => 'Hari ini';

  @override
  String get disciplineToday => 'Hari ini';

  @override
  String get disciplineTodayPlan => 'Pelan hari ini';

  @override
  String get disciplineWeek => 'Minggu ini';

  @override
  String get disciplineMonth => 'Bulan ini';

  @override
  String get disciplineLevel => 'Tahap disiplin';

  @override
  String disciplineStreakDays(int days) {
    return '$days hari berturut-turut';
  }

  @override
  String disciplineToNext(int days) {
    return '$days hari lagi ke tahap seterusnya';
  }

  @override
  String get disciplineMaxTier => 'Tahap tertinggi dicapai';

  @override
  String get disciplineTierSpark => 'Percikan';

  @override
  String get disciplineTierSteady => 'Mantap';

  @override
  String get disciplineTierSharp => 'Tajam';

  @override
  String get disciplineTierSolid => 'Kukuh';

  @override
  String get disciplineTierRelentless => 'Tak Kenal Henti';

  @override
  String get disciplineTierUnbroken => 'Tak Terputus';

  @override
  String get disciplineTierLegend => 'Lagenda';

  @override
  String get goalPerfectDays => 'Hari pelan disiapkan';

  @override
  String get goalWorkouts => 'Sesi latihan';

  @override
  String get goalMeasurement => 'Ukuran tinggi';

  @override
  String get goalPhoto => 'Foto kemajuan';

  @override
  String get goalPostureCheck => 'Semakan postur';

  @override
  String get disciplineAllDone => 'Hari ini selesai';

  @override
  String disciplineDayProgress(int done, int total) {
    return '$done/$total selesai';
  }

  @override
  String get navProgress => 'Kemajuan';

  @override
  String get trackingSection => 'Alat penjejakan anda';

  @override
  String get photosBenefit =>
      'Sebelum dan selepas, sebelah-menyebelah. Lihat sendiri perubahannya.';

  @override
  String get postureBenefit =>
      'Kepala, bahu dan pinggang. Berdiri tegak boleh menunjukkan sehingga 2-3 cm lagi tinggi sebenar anda.';

  @override
  String get reportBenefit =>
      'Nilai minggu anda hari demi hari dan lihat di mana ia tergelincir.';

  @override
  String get photosCta => 'Tambah foto';

  @override
  String get postureCta => 'Analisis';

  @override
  String get reportCta => 'Buka laporan';

  @override
  String get toolStateReady => 'Sedia';

  @override
  String get photosSummaryEmpty => 'Tambah foto pertama anda';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto',
      one: '$count foto',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => 'Belum ada analisis';

  @override
  String postureSummaryScore(int score) {
    return 'Postur $score/100';
  }

  @override
  String get navProfile => 'Profil';

  @override
  String greeting(String name) {
    return 'Hai, $name';
  }

  @override
  String get currentHeight => 'Tinggi Semasa';

  @override
  String get target => 'Sasaran';

  @override
  String completed(String pct) {
    return '$pct% selesai';
  }

  @override
  String remaining(String cm, String unit) {
    return '+$cm $unit lagi';
  }

  @override
  String get updateAnalysis => 'Kemas Kini Analisis';

  @override
  String get analysisSubtitle =>
      'Dapatkan ramalan daripada tinggi lepas + tabiat';

  @override
  String get dailyRoutines => 'Rutin Harian';

  @override
  String get allRoutinesDone => 'Semua rutin selesai!';

  @override
  String get water => 'Air';

  @override
  String get sleep => 'Tidur';

  @override
  String get growthSummary => 'Ringkasan Pertumbuhan';

  @override
  String get total => 'JUMLAH';

  @override
  String get last => 'TERAKHIR';

  @override
  String get measurement => 'UKURAN';

  @override
  String get dailyTip => 'Tip Hari Ini';

  @override
  String get waterTracking => 'Penjejakan Air';

  @override
  String get waterGoalReached => 'Sasaran harian dicapai';

  @override
  String waterRemaining(String amount) {
    return '$amount lagi';
  }

  @override
  String get undo => 'Buat asal';

  @override
  String waterToday(String amount) {
    return 'Hari ini: $amount L';
  }

  @override
  String get sleepTracking => 'Penjejakan Tidur';

  @override
  String sleepTarget(String hours) {
    return 'Sasaran: $hours jam';
  }

  @override
  String get hours => 'jam';

  @override
  String get save => 'Simpan';

  @override
  String get cancel => 'Batal';

  @override
  String get analysis => 'Analisis';

  @override
  String get betallerScore => 'Skor BeTaller';

  @override
  String get genetic => 'Genetik';

  @override
  String get growth => 'Pertumbuhan';

  @override
  String get nutrition => 'Pemakanan';

  @override
  String get sleepLabel => 'Tidur';

  @override
  String get discipline => 'Disiplin';

  @override
  String get improveScore => 'Naikkan Skor Anda';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Pemakanan Kritikal!';

  @override
  String get nutritionStrengthen => 'Perkukuh Pemakanan';

  @override
  String get sleepRecordAdd => 'Tambah Rekod Tidur';

  @override
  String get sleepPoor => 'Jadual Tidur Lemah';

  @override
  String get sleepImprove => 'Perbaiki Tidur';

  @override
  String get startToday => 'Mula Hari Ini!';

  @override
  String routinesRemaining(int count) {
    return '$count Rutin Lagi';
  }

  @override
  String get keepStreak => 'Kekalkan Rentetan';

  @override
  String get addFirstMeasurement => 'Tambah Ukuran Pertama';

  @override
  String get addMeasurement => 'Tambah Ukuran';

  @override
  String waterHalfNotReached(String amount) {
    return 'Anda belum capai separuh sasaran air hari ini. Minum ${amount}L lagi.';
  }

  @override
  String waterAlmostDone(String amount) {
    return '${amount}L lagi untuk capai sasaran air. Hampir sampai!';
  }

  @override
  String bmiLow(String bmi) {
    return 'BMI anda $bmi — agak rendah. Tambahkan protein dan kalori.';
  }

  @override
  String get bodyFactsTitle => 'Badan anda';

  @override
  String get dailyNeedsTitle => 'Sasaran harian anda';

  @override
  String bmiHigh(String bmi) {
    return 'BMI anda $bmi — agak tinggi. Fokus pada pemakanan sihat.';
  }

  @override
  String get nutritionDefault =>
      'Capai sasaran air anda dan kekalkan pemakanan seimbang.';

  @override
  String sleepNoRecord(String hours) {
    return 'Tiada rekod tidur hari ini. Sasarkan $hours jam dan catatkannya.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Anda tidur $current jam hari ini — kurang $missing jam. Tidur lebih awal!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Hampir sampai. Capai $hours jam untuk hormon pertumbuhan maksimum.';
  }

  @override
  String get sleepGood => 'Jadual tidur hebat! Teruskan.';

  @override
  String noRoutinesDone(int total) {
    return 'Belum ada rutin selesai hari ini. Mulakan satu daripada $total!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '$done/$total rutin selesai hari ini. $left lagi!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Syabas hari ini! $needed hari lagi untuk mula rentetan.';
  }

  @override
  String streakContinue(int days) {
    return '$days hari berturut-turut! Skor anda naik jika anda teruskan.';
  }

  @override
  String get noMeasurements =>
      'Belum ada ukuran tinggi. Tambah yang pertama untuk ramalan tepat.';

  @override
  String fewMeasurements(int count) {
    return 'Tambah $count ukuran lagi untuk mengira kadar pertumbuhan.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Anda ada $count ukuran. Capai 5 untuk ketepatan yang jauh lebih baik.';
  }

  @override
  String get keepMeasuring =>
      'Terus tambah ukuran. Setiap data baharu memperbaik ramalan.';

  @override
  String get heightPrediction => 'Ramalan Tinggi';

  @override
  String get predictedHeightAt21 => 'Ramalan tinggi pada umur 21';

  @override
  String get predictionMethod =>
      'Dikira dengan menggabungkan data genetik (ibu bapa), kadar pertumbuhan, BMI dan umur.';

  @override
  String get growthStatus => 'Status Pertumbuhan';

  @override
  String get growthRemaining => 'Masih menanti anda';

  @override
  String get growthBreakdown => 'Dari mana datangnya sentimeter itu';

  @override
  String get geneticGainLabel => 'Tambahan Genetik';

  @override
  String get lifestyleLabel => 'Gaya Hidup';

  @override
  String get geneticCeilingLabel => 'Had';

  @override
  String get reachableTargetHeight => 'Sasaran tinggi yang boleh anda capai';

  @override
  String get geneticCeilingProgress => 'Kemajuan ke arah had genetik';

  @override
  String get completionLabel => 'PENCAPAIAN';

  @override
  String get growthVelocity => 'KADAR PERTUMBUHAN';

  @override
  String get noData => 'TIADA DATA';

  @override
  String growthRate(String rating) {
    return 'Kadar pertumbuhan: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'Kalori';

  @override
  String get kcalDay => 'kcal/hari';

  @override
  String get daily => 'sehari';

  @override
  String get protein => 'Protein';

  @override
  String get minimum => 'minimum';

  @override
  String get age => 'Umur';

  @override
  String get male => 'Lelaki';

  @override
  String get female => 'Perempuan';

  @override
  String get yearlyPrediction => 'RAMALAN TAHUNAN';

  @override
  String ageYear(int age) {
    return '$age thn';
  }

  @override
  String get progressTitle => 'Penjejakan Kemajuan';

  @override
  String get totalGrowth => 'Jumlah';

  @override
  String get lastDiff => 'Beza Terakhir';

  @override
  String get measurementCount => 'Ukuran';

  @override
  String get heightChart => 'Carta Tinggi';

  @override
  String get chartMinData =>
      'Sekurang-kurangnya 2 ukuran diperlukan untuk carta';

  @override
  String get chartInstruction =>
      'Tambah ukuran untuk melihat carta kemajuan anda!';

  @override
  String get addMeasurementButton => 'TAMBAH UKURAN BAHARU';

  @override
  String get measurementHistory => 'SEJARAH UKURAN';

  @override
  String get deleteTitle => 'Padam Ukuran';

  @override
  String get deleteMessage => 'Anda pasti mahu memadam ukuran ini?';

  @override
  String get dismiss => 'Batal';

  @override
  String get delete => 'Padam';

  @override
  String get newMeasurement => 'Ukuran Tinggi Baharu';

  @override
  String get routines => 'Rutin';

  @override
  String streakDays(int days) {
    return '$days Hari';
  }

  @override
  String get progressStatus => 'Status Kemajuan';

  @override
  String get completedLabel => 'Selesai!';

  @override
  String get all => 'Semua';

  @override
  String get exercise => 'Senaman';

  @override
  String get posture => 'Postur';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return 'Terbaik: $_temp0';
  }

  @override
  String get editProfile => 'Edit Profil';

  @override
  String get editProfileSubtitle => 'Kemas kini tinggi, berat, umur';

  @override
  String get name => 'Nama';

  @override
  String birthDate(String date) {
    return 'Lahir: $date';
  }

  @override
  String get heightCm => 'Tinggi (cm)';

  @override
  String get weightKg => 'Berat (kg)';

  @override
  String get fatherHeight => 'Tinggi Bapa (cm)';

  @override
  String get motherHeight => 'Tinggi Ibu (cm)';

  @override
  String get notifications => 'Pemberitahuan';

  @override
  String get reminderNextLabel => 'Peringatan seterusnya';

  @override
  String get reminderManageHint => 'Urus peringatan anda';

  @override
  String get reminderOffCta => 'Hidupkan pemberitahuan';

  @override
  String get stateOn => 'Hidup';

  @override
  String get stateOff => 'Mati';

  @override
  String get reminderMasterTitle => 'Pemberitahuan';

  @override
  String reminderActiveCount(int count) {
    return '$count peringatan aktif';
  }

  @override
  String get reminderBuiltIn => 'Peringatan terbina dalam';

  @override
  String get reminderYourOwn => 'Peringatan anda sendiri';

  @override
  String get reminderAdd => 'Tambah peringatan';

  @override
  String get reminderDays => 'Hari';

  @override
  String get reminderEveryDay => 'Setiap hari';

  @override
  String get reminderLabelHint => 'Apa yang perlu kami ingatkan?';

  @override
  String get reminderEmptyHint =>
      'Tambah sendiri: latihan, vitamin, regangan, apa saja yang anda perlukan.';

  @override
  String get reminderCustom => 'Peringatan';

  @override
  String get reminderCustomBody => 'Sudah tiba masa yang anda tetapkan.';

  @override
  String get reminderExercise => 'Senaman';

  @override
  String get reminderNutrition => 'Pemakanan';

  @override
  String get reminderWater => 'Air';

  @override
  String get reminderPosture => 'Postur';

  @override
  String get reminderRoutine => 'Rutin harian';

  @override
  String get reminderSleep => 'Tidur';

  @override
  String get reminderMeasurement => 'Ukuran tinggi';

  @override
  String get notificationsOn => 'Peringatan aktif';

  @override
  String get notificationsOff => 'Peringatan dimatikan';

  @override
  String get premium => 'Naik taraf ke Premium';

  @override
  String get premiumSubtitle => 'Buka semua ciri';

  @override
  String get rateUs => 'Nilai Kami';

  @override
  String get rateSubtitle => 'Suka aplikasi ini? Beri kami 5 bintang!';

  @override
  String get share => 'Kongsi Aplikasi';

  @override
  String get shareSubtitle => 'Beritahu kawan anda tentang BeTaller';

  @override
  String get shareText =>
      'Saya dah temui potensi tinggi saya dengan BeTaller! Cubalah juga: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'Beri Maklum Balas';

  @override
  String get feedbackSubtitle => 'Hubungi kami';

  @override
  String get resetData => 'Set Semula Semua Data';

  @override
  String get resetSubtitle => 'Semua data akan dipadam';

  @override
  String get resetTitle => 'Set Semula Data';

  @override
  String get resetMessage =>
      'Semua data akan dipadam dan anda akan kembali ke skrin pengenalan. Ini tidak boleh dibuat asal!';

  @override
  String get reset => 'Set Semula';

  @override
  String get premiumSoon => 'Premium akan datang!';

  @override
  String get brandingSubtitle => 'Temui potensi tinggi anda';

  @override
  String get statistics => 'Statistik';

  @override
  String get profileGroupSupport => 'Sokongan';

  @override
  String get profileGroupAccount => 'Akaun';

  @override
  String get profileGroupApp => 'Aplikasi';

  @override
  String get profileGroupDanger => 'Zon bahaya';

  @override
  String profileMemberSince(String date) {
    return 'Sejak $date';
  }

  @override
  String get profileYourJourney => 'Perjalanan anda';

  @override
  String get profileTotalGrowth => 'Jumlah';

  @override
  String get currentStreak => 'Rentetan Semasa';

  @override
  String get bestStreakLabel => 'Rentetan Terbaik';

  @override
  String get achievementLabel => 'Pencapaian';

  @override
  String get achievements => 'Pencapaian';

  @override
  String get achievementUnlockedTitle => '🏆 Pencapaian dibuka!';

  @override
  String get reminderTapHint => 'Ketik satu untuk tukar masa dan harinya';

  @override
  String get earned => 'Diperoleh!';

  @override
  String get notEarned => 'Belum diperoleh';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSubtitle => 'Tukar bahasa aplikasi';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Temui potensi tinggi anda';

  @override
  String get onboardingMeetYou => 'Mari Kenali Anda';

  @override
  String get onboardingInfoNeeded => 'Maklumat asas diperlukan untuk analisis.';

  @override
  String get gender => 'JANTINA';

  @override
  String get birthDateLabel => 'TARIKH LAHIR';

  @override
  String get bodyMeasurements => 'Ukuran Badan';

  @override
  String get bodyInfo =>
      'Tinggi dan berat semasa anda diperlukan untuk analisis.';

  @override
  String get geneticData => 'Data Genetik';

  @override
  String get geneticInfo => 'Tinggi ibu bapa menentukan potensi genetik anda.';

  @override
  String get pastHeights => 'Tinggi Lepas';

  @override
  String get pastHeightsInfo =>
      'Masukkan tinggi yang anda ingat pada umur berbeza. Boleh dibiarkan kosong.';

  @override
  String get heightHint => 'Masukkan tinggi...';

  @override
  String get ageLabel => 'umur';

  @override
  String get habits => 'Tabiat Anda';

  @override
  String get habitsInfo => 'Gaya hidup anda terus mempengaruhi ramalan.';

  @override
  String get weeklyExercise => 'Senaman Mingguan';

  @override
  String get dailySleep => 'Tidur Harian';

  @override
  String get nutritionQuality => 'KUALITI PEMAKANAN';

  @override
  String get nutritionDesc => 'Pengambilan protein, tenusu, sayur, buah';

  @override
  String get nutritionBad => 'Teruk';

  @override
  String get nutritionPoor => 'Lemah';

  @override
  String get nutritionMedium => 'Sederhana';

  @override
  String get nutritionGood => 'Baik';

  @override
  String get nutritionGreat => 'Hebat';

  @override
  String get startAnalysis => 'Mula Analisis';

  @override
  String get continueBtn => 'Teruskan';

  @override
  String get analyzeBtn => 'Analisis';

  @override
  String get analyzing => 'Menganalisis';

  @override
  String get analysisComplete => 'Selesai!';

  @override
  String get analysisDataReceivedTitle => 'Data Diterima';

  @override
  String get analysisDataReceivedSubtitle => 'Memulakan analisis anda...';

  @override
  String get yourScore => 'Skor BeTaller Anda';

  @override
  String get letsStart => 'Jom Mula';

  @override
  String get splashJourneySubtitle => 'Perjalanan anda bermula. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Pelan peribadi anda sudah sedia.\nSedia untuk temui potensi tinggi anda?';

  @override
  String get doneBtn => 'Selesai';

  @override
  String get analysisStep1 => 'Menganalisis data genetik...';

  @override
  String get analysisStep2 => 'Mengira kadar pertumbuhan...';

  @override
  String get analysisStep3 => 'Memproses data pemakanan dan tidur...';

  @override
  String get analysisStep4 => 'Menjana ramalan tinggi...';

  @override
  String get analysisStep5 => 'Mengira skor BeTaller...';

  @override
  String growthPotential(String cm, String unit) {
    return 'Potensi pertumbuhan +$cm $unit';
  }

  @override
  String get heightAt21 => 'pada umur 21';

  @override
  String confidenceLevel(String pct) {
    return 'Tahap keyakinan $pct%';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return 'Julat $min - $max $unit';
  }

  @override
  String get currentLabel => 'SEMASA';

  @override
  String get predictedLabel => 'RAMALAN';

  @override
  String get yearlyPredictions => 'Ramalan Tahunan';

  @override
  String get tipMorningMeasure =>
      'Ukur tinggi anda pada waktu pagi. Tekanan pada cakera tulang belakang membuat anda sedikit rendah pada siang hari, jadi bacaan pagi paling tepat.';

  @override
  String get tipProteinSpread =>
      'Agihkan protein ke semua waktu makan. Jangan makan sekali gus, ambil protein setiap kali makan.';

  @override
  String get tipGrowthHormone =>
      'Hormon pertumbuhan memuncak semasa tidur. Pastikan anda tidur antara 10 malam-2 pagi!';

  @override
  String get tipVitaminD =>
      '15 minit cahaya matahari setiap hari meningkatkan penghasilan vitamin D. Vitamin D penting untuk penyerapan kalsium.';

  @override
  String get tipBarHanging =>
      'Bergantung pada palang meregangkan tulang belakang. Cuba 3x30 saat setiap hari.';

  @override
  String get tipSwimming =>
      'Berenang ialah sukan terbaik untuk latihan seluruh badan dan menyokong pertumbuhan tinggi.';

  @override
  String get tipStress =>
      'Tekanan menyekat hormon pertumbuhan. Kurangkan tekanan dengan meditasi dan yoga.';

  @override
  String get routineMorningStretch => 'Regangan Pagi';

  @override
  String get routineMorningStretchDesc =>
      'Buat regangan 10 minit sebaik bangun tidur. Regangkan tulang belakang dan otot kaki.';

  @override
  String get routineBarHanging => 'Bergantung pada Palang';

  @override
  String get routineBarHangingDesc =>
      'Bergantung pada palang pull-up untuk meregangkan tulang belakang. 3 set x 30 saat.';

  @override
  String get routineCobraStretch => 'Regangan Kobra';

  @override
  String get routineCobraStretchDesc =>
      'Meniarap dan angkat badan atas. Regangkan tulang belakang. 3 set x 15 saat.';

  @override
  String get routineJumping => 'Senaman Lompat';

  @override
  String get routineJumpingDesc =>
      'Lompat tali atau squat jump. Merangsang plat pertumbuhan. 3 set x 20 kali.';

  @override
  String get routineSwimming => 'Berenang atau Bola Keranjang';

  @override
  String get routineSwimmingDesc =>
      'Main sukan yang menyokong pertumbuhan tinggi. Sekurang-kurangnya 30 minit.';

  @override
  String get routineYoga => 'Yoga & Regangan Malam';

  @override
  String get routineYogaDesc =>
      'Rutin yoga dan regangan sebelum tidur. Lepaskan tekanan, rehatkan otot.';

  @override
  String get routineProtein => 'Pengambilan Protein';

  @override
  String get routineProteinDesc =>
      'Telur, ayam, ikan, tenusu. Sekurang-kurangnya 1.5g/kg protein sehari.';

  @override
  String get routineCalcium => 'Kalsium & Vitamin D';

  @override
  String get routineCalciumDesc =>
      'Ambil susu, keju, yogurt. Berjemur 15 min. Penting untuk perkembangan tulang.';

  @override
  String get routineWater => 'Sasaran Minum Air';

  @override
  String get routineWaterDesc =>
      'Minum sekurang-kurangnya 2-3 liter air sehari. Penting untuk metabolisme dan pertumbuhan.';

  @override
  String get routineAvoidJunk => 'Elak Makanan Ringan';

  @override
  String get routineAvoidJunkDesc =>
      'Jauhi makanan segera, minuman manis dan makanan diproses.';

  @override
  String get routineSleep => 'Tidur Berkualiti (8-10 jam)';

  @override
  String get routineSleepDesc =>
      'Hormon pertumbuhan dirembeskan semasa tidur. 10 malam-6 pagi ialah waktu emas.';

  @override
  String get routineNoScreen => 'Rehat Skrin Sebelum Tidur';

  @override
  String get routineNoScreenDesc =>
      'Simpan telefon dan komputer 1 jam sebelum tidur. Jangan halang penghasilan melatonin.';

  @override
  String get routinePosture => 'Semakan Postur';

  @override
  String get routinePostureDesc =>
      'Belakang lurus, bahu ke belakang. Semak setiap jam. Postur baik = beza 2-3 cm.';

  @override
  String get routineWallStand => 'Senaman Berdiri di Dinding';

  @override
  String get routineWallStandDesc =>
      'Sandar pada dinding: tumit, punggung, bahu, kepala menyentuh dinding. Tahan 5 min.';

  @override
  String get routineSprintIntervals => 'Latihan Pecut Selang-seli';

  @override
  String get routineSprintIntervalsDesc =>
      'Latihan pecut selang-seli mencetuskan rembesan hormon pertumbuhan yang ketara melalui letusan intensiti tinggi.';

  @override
  String get routineHiitWorkout => 'Latihan HIIT';

  @override
  String get routineHiitWorkoutDesc =>
      'Latihan selang-seli intensiti tinggi untuk memaksimumkan rembesan hormon pertumbuhan.';

  @override
  String get routineSquats => 'Squat Berat Badan';

  @override
  String get routineSquatsDesc =>
      'Squat berat badan merangsang plat pertumbuhan di kaki dan tulang belakang.';

  @override
  String get routineDeadliftStretch => 'Regangan Deadlift';

  @override
  String get routineDeadliftStretchDesc =>
      'Regangan deadlift untuk melegakan tekanan tulang belakang dan kesihatan cakera vertebra.';

  @override
  String get routineOverheadPress => 'Overhead Press';

  @override
  String get routineOverheadPressDesc =>
      'Tekanan atas kepala meregangkan tulang belakang dan menguatkan otot postur.';

  @override
  String get routineSkippingRope => 'Lompat Tali';

  @override
  String get routineSkippingRopeDesc =>
      'Lompatan berulang dengan tali merangsang plat pertumbuhan di bahagian bawah badan.';

  @override
  String get routinePilatesCore => 'Pilates Teras';

  @override
  String get routinePilatesCoreDesc =>
      'Senaman teras Pilates menyokong penjajaran tulang belakang dan postur.';

  @override
  String get routineInversionHang => 'Bergantung Songsang';

  @override
  String get routineInversionHangDesc =>
      'Posisi songsang melegakan tekanan cakera tulang belakang, boleh menambah 1-2cm buat sementara.';

  @override
  String get routineZincIntake => 'Makanan Kaya Zink';

  @override
  String get routineZincIntakeDesc =>
      'Ambil makanan kaya zink sepanjang hari untuk penghasilan hormon pertumbuhan.';

  @override
  String get routineVitaminDSunlight => 'Vitamin D & Cahaya Matahari';

  @override
  String get routineVitaminDSunlightDesc =>
      'Dapatkan sekurang-kurangnya 15 minit cahaya matahari terus untuk sintesis Vitamin D dan pertumbuhan tulang.';

  @override
  String get routineArginineFoods => 'Makanan Kaya Arginina';

  @override
  String get routineArginineFoodsDesc =>
      'Makan makanan kaya arginina untuk merangsang rembesan hormon pertumbuhan.';

  @override
  String get routineDailyCalories => 'Sasaran Kalori Harian';

  @override
  String get routineDailyCaloriesDesc =>
      'Capai sasaran kalori harian anda. Makan terlalu sedikit melambatkan pertumbuhan.';

  @override
  String get routineSleepEnvironment => 'Optimumkan Suasana Tidur';

  @override
  String get routineSleepEnvironmentDesc =>
      'Wujudkan suasana tidur yang gelap dan sejuk untuk memaksimumkan rembesan melatonin dan hormon pertumbuhan.';

  @override
  String get routinePreSleepRoutine => 'Bertenang Sebelum Tidur';

  @override
  String get routinePreSleepRoutineDesc =>
      'Rutin sebelum tidur yang konsisten meningkatkan kualiti tidur nyenyak sebanyak 23%.';

  @override
  String get routineNeckStretches => 'Regangan Leher';

  @override
  String get routineNeckStretchesDesc =>
      'Regangan leher melegakan tekanan dan memperbaik penjajaran leher.';

  @override
  String get routineShoulderRolls => 'Putaran & Bukaan Bahu';

  @override
  String get routineShoulderRollsDesc =>
      'Membuka bahu membetulkan postur bongkok, boleh nampak 1-2cm lebih tinggi.';

  @override
  String get achieveCommitment => 'Komitmen';

  @override
  String get achieveCommitmentDesc =>
      'Masukkan semua data anda, terokai aplikasi sepenuhnya dan mula menggunakannya';

  @override
  String get achieveFirstDay => 'Langkah Pertama';

  @override
  String get achieveFirstDayDesc => 'Selesaikan hari pertama anda';

  @override
  String get achieveThreeStreak => 'Rentetan 3 Hari';

  @override
  String get achieveThreeStreakDesc => 'Selesaikan rutin 3 hari berturut-turut';

  @override
  String get achieveWeekStreak => 'Rentetan 7 Hari';

  @override
  String get achieveWeekStreakDesc => 'Selesaikan rutin 7 hari berturut-turut';

  @override
  String get achieveTwoWeekStreak => 'Rentetan 14 Hari';

  @override
  String get achieveTwoWeekStreakDesc => 'Teruskan selama 14 hari tanpa henti';

  @override
  String get achieveMonthStreak => 'Rentetan 30 Hari';

  @override
  String get achieveMonthStreakDesc => 'Selesaikan 30 hari berturut-turut';

  @override
  String get achieveTwoMonthStreak => 'Rentetan 60 Hari';

  @override
  String get achieveTwoMonthStreakDesc => 'Selesaikan 60 hari berturut-turut';

  @override
  String get achieveHundredStreak => 'Rentetan 100 Hari';

  @override
  String get achieveHundredStreakDesc => 'Selesaikan 100 hari berturut-turut';

  @override
  String get achieveFirstMeasure => 'Ukuran Pertama';

  @override
  String get achieveFirstMeasureDesc => 'Rekod ukuran tinggi pertama anda';

  @override
  String get achieveThreeMeasures => 'Penjejak';

  @override
  String get achieveThreeMeasuresDesc => 'Rekod 3 ukuran tinggi';

  @override
  String get achieveFiveMeasures => 'Penjejakan Tetap';

  @override
  String get achieveFiveMeasuresDesc => 'Rekod 5 ukuran tinggi';

  @override
  String get achieveTenMeasures => 'Pemburu Data';

  @override
  String get achieveTenMeasuresDesc => 'Rekod 10 ukuran tinggi';

  @override
  String get achieveFirstCm => 'Sentimeter Pertama';

  @override
  String get achieveFirstCmDesc => 'Rekod jumlah pertumbuhan 1 cm';

  @override
  String get achieveThreeCm => 'Pertumbuhan 3 cm';

  @override
  String get achieveThreeCmDesc => 'Rekod jumlah pertumbuhan 3 cm';

  @override
  String get achieveFiveCm => 'Pertumbuhan 5 cm';

  @override
  String get achieveFiveCmDesc => 'Rekod jumlah pertumbuhan 5 cm';

  @override
  String get achieveTenCm => 'Pertumbuhan 10 cm';

  @override
  String get achieveTenCmDesc => 'Rekod jumlah pertumbuhan 10 cm';

  @override
  String get quote1 => 'Jadi lebih baik daripada semalam, setiap hari.';

  @override
  String get quote2 =>
      'Pertumbuhan tak berlaku sekelip mata, tapi setiap malam membawa anda lebih dekat.';

  @override
  String get quote3 => 'Pertumbuhan perlukan kesabaran, teruskan!';

  @override
  String get quote4 => 'Langkah anda hari ini membina asas untuk esok.';

  @override
  String get quote5 => 'Disiplin bermula apabila motivasi berakhir.';

  @override
  String get quote6 => 'Badan anda akan berterima kasih, teruskan!';

  @override
  String get quote7 => 'Andalah yang menentukan had potensi anda.';

  @override
  String get quote8 => 'Langkah kecil membawa perubahan besar.';

  @override
  String get quote9 => 'Pelaburan terbaik ialah pada diri sendiri.';

  @override
  String get quote10 => 'Anda makin dekat dengan matlamat setiap hari.';

  @override
  String get quote11 => 'Berubah itu susah, tapi menyesal lebih susah.';

  @override
  String get quote12 => 'Badan anda amanah, jagalah ia.';

  @override
  String get quote13 =>
      'Saingan anda ialah diri anda semalam. Kalahkan hari ini!';

  @override
  String get quote14 => 'BeTaller = Sabar + Disiplin + Yakin';

  @override
  String get quote15 =>
      'Percaya pada diri sendiri, prosesnya akan membentuk anda.';

  @override
  String get quote16 =>
      'Jangan kata tak boleh hari ini, supaya tak menyesal esok.';

  @override
  String get quote17 => 'Tunjukkan kemajuan setiap hari, walaupun cuma 1%.';

  @override
  String get quote18 => 'Cermin akan menunjukkan kemajuan anda, bersabarlah.';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiUnderweight => 'Kurang berat badan';

  @override
  String get bmiOverweight => 'Berlebihan berat badan';

  @override
  String get bmiObese => 'Obes';

  @override
  String get velocityExcellent => 'Cemerlang';

  @override
  String get velocityNormal => 'Normal';

  @override
  String get velocitySlow => 'Perlahan';

  @override
  String get velocityVeryLow => 'Sangat Rendah';

  @override
  String durationMinutes(String min) {
    return '$min min';
  }

  @override
  String get durationAllDay => 'Sepanjang hari';

  @override
  String get durationNight => 'Malam';

  @override
  String durationHours(String hours) {
    return '$hours jam';
  }

  @override
  String get onboardingStep1 => 'Masukkan maklumat peribadi anda';

  @override
  String get onboardingStep2 => 'Kongsi tinggi anda dahulu';

  @override
  String get onboardingStep3 => 'Nilai tabiat anda';

  @override
  String get onboardingStep4 => 'Lihat ramalan dan skor anda';

  @override
  String get hoursShort => 'j';

  @override
  String get selectLanguage => 'Pilih Bahasa';

  @override
  String get systemLanguage => 'Bahasa Sistem';

  @override
  String get emailSubject => 'Maklum Balas BeTaller';

  @override
  String get pastHeightsTip =>
      'Umur yang anda tak tahu boleh dibiarkan kosong. 1-2 tinggi lepas pun sudah cukup.';

  @override
  String get obPastHeightsTitle => 'Tinggi Lepas';

  @override
  String get obPastHeightsSubPart1 =>
      'Tinggi anda dahulu menjadikan ramalan lebih tepat.';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return 'Berapa tinggi anda pada umur $age?';
  }

  @override
  String get obSkip => 'Langkau';

  @override
  String get obNext => 'Seterusnya';

  @override
  String get obSkipAll => 'Langkau Semua';

  @override
  String get currentSuffix => '(semasa)';

  @override
  String personalizedProtein(String amount) {
    return 'Telur, ayam, ikan, tenusu. Makan sekurang-kurangnya ${amount}g protein sehari.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Minum sekurang-kurangnya ${amount}L air sehari. Penting untuk metabolisme dan pertumbuhan.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'Hormon pertumbuhan dirembeskan semasa tidur. Tidur sekurang-kurangnya $hours jam. 10 malam-6 pagi waktu emas.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Ambil susu, keju, yogurt. Berjemur 15 min. Sasaran kalori harian: $calories kcal.';
  }

  @override
  String get scoreS => 'Cemerlang! Anda hampir mencapai kemuncak potensi anda.';

  @override
  String get scoreA =>
      'Bagus sekali! Sedikit penambahbaikan boleh bawa anda ke puncak.';

  @override
  String get scoreB =>
      'Di landasan betul. Fokus sedikit lagi pada rutin dan pemakanan.';

  @override
  String get scoreC =>
      'Masih boleh diperbaiki. Rutin yang tetap akan membawa perubahan.';

  @override
  String get scoreD => 'Potensi tinggi, tapi anda perlu bertindak.';

  @override
  String get scoreF =>
      'Mulakan sekarang! Langkah kecil setiap hari membawa perubahan besar.';

  @override
  String get cmPerYear => 'cm/tahun';

  @override
  String get howToDoIt => 'Cara Melakukannya';

  @override
  String get musclesTargeted => 'Otot & Tulang Sasaran';

  @override
  String get scientificBasis => 'Asas Saintifik';

  @override
  String setXofY(String current, String total) {
    return 'Set $current daripada $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Rehat sebelum Set $set';
  }

  @override
  String get allSetsComplete => 'Semua Set Selesai!';

  @override
  String get setTimer => 'Pemasa Set';

  @override
  String get setTracker => 'Penjejak Set';

  @override
  String get builtInTimer => 'Pemasa Terbina';

  @override
  String get markComplete => 'Tanda Selesai';

  @override
  String get markIncomplete => 'Tanda Belum Selesai';

  @override
  String get done => 'Selesai';

  @override
  String get doneExclamation => 'Selesai!';

  @override
  String get start => 'Mula';

  @override
  String get pause => 'Jeda';

  @override
  String get resetTimer => 'Set Semula';

  @override
  String get skipRest => 'Langkau Rehat';

  @override
  String get restart => 'Mula Semula';

  @override
  String get perSet => 'setiap set';

  @override
  String get rest => 'REHAT';

  @override
  String get reps => 'kali';

  @override
  String get difficultyBeginner => 'Pemula';

  @override
  String get difficultyIntermediate => 'Pertengahan';

  @override
  String get difficultyAdvanced => 'Lanjutan';

  @override
  String get learnTitle => 'Belajar';

  @override
  String get learnSubtitle => 'Ilmu berasaskan sains untuk pertumbuhan';

  @override
  String get categoryAll => 'Semua';

  @override
  String get categoryScience => 'Sains';

  @override
  String get categoryNutrition => 'Pemakanan';

  @override
  String get categoryExercise => 'Senaman';

  @override
  String get categorySleep => 'Tidur';

  @override
  String get categoryMyths => 'Mitos';

  @override
  String get scientificReferences => 'Rujukan Saintifik';

  @override
  String get relatedRoutines => 'Rutin Berkaitan';

  @override
  String get nutritionTitle => 'Pemakanan';

  @override
  String get sectionMealPlan => 'Pelan Makan';

  @override
  String get sectionNutrients => 'Nutrien';

  @override
  String get sectionFoods => 'Makanan';

  @override
  String get sectionSupplements => 'Suplemen';

  @override
  String todaysPlan(String day) {
    return 'Pelan Hari Ini — $day';
  }

  @override
  String get breakfast => 'Sarapan';

  @override
  String get lunch => 'Makan Tengah Hari';

  @override
  String get dinner => 'Makan Malam';

  @override
  String get snacks => 'Snek';

  @override
  String get searchFoods => 'Cari makanan...';

  @override
  String nFoods(String count) {
    return '$count makanan';
  }

  @override
  String dailyLabel(String amount) {
    return 'Harian: $amount';
  }

  @override
  String get dailyNeedByAge => 'KEPERLUAN HARIAN MENGIKUT UMUR';

  @override
  String agePrefix(String range) {
    return 'Umur $range';
  }

  @override
  String get topFoodSources => 'SUMBER MAKANAN UTAMA';

  @override
  String get categoryDairy => 'Tenusu';

  @override
  String get categoryMeatFish => 'Daging & Ikan';

  @override
  String get categoryVegetables => 'Sayur-sayuran';

  @override
  String get categoryFruits => 'Buah-buahan';

  @override
  String get categoryGrains => 'Bijirin & Kekacang';

  @override
  String get categoryNutsSeeds => 'Kacang & Biji';

  @override
  String get weeklyReportTitle => 'Laporan Mingguan';

  @override
  String get weeklyScoreLabel => 'Skor minggu';

  @override
  String get weeklyDailyCompletion => 'Hari demi hari';

  @override
  String get weeklyHabits => 'Tabiat';

  @override
  String get overview => 'Gambaran Keseluruhan';

  @override
  String get routinesLabel => 'Rutin';

  @override
  String get streakLabel => 'Rentetan';

  @override
  String get heightLabel => 'Tinggi';

  @override
  String get weightLabel => 'Berat';

  @override
  String get dadLabel => 'Ayah';

  @override
  String get motherLabel => 'Ibu';

  @override
  String get metricShort => 'Metrik';

  @override
  String get imperialShort => 'Imperial';

  @override
  String get dailyScores => 'Skor Harian';

  @override
  String get waterToday2 => 'Air Hari Ini';

  @override
  String get sleepToday => 'Tidur Hari Ini';

  @override
  String get routineCompletion => 'Penyiapan Rutin';

  @override
  String get xpAndLevel => 'XP & Tahap';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP ke tahap seterusnya';
  }

  @override
  String get activeChallenges => 'Cabaran Aktif';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m selesai';
  }

  @override
  String get shareYourProgress => 'Kongsi Kemajuan Anda';

  @override
  String get shareComingSoon => 'Ciri kongsi akan datang!';

  @override
  String get premiumTest => 'Premium (Ujian)';

  @override
  String get premiumActive => 'Aktif';

  @override
  String get premiumFree => 'Percuma';

  @override
  String get weeklyReportMenu => 'Laporan Mingguan';

  @override
  String get weeklyReportMenuSubtitle => 'Ringkasan kemajuan anda';

  @override
  String get unlockGrowthPotential => 'Buka potensi pertumbuhan penuh anda';

  @override
  String get featureGrowthAnalysis => 'Analisis & skor pertumbuhan';

  @override
  String get featureHeightPrediction => 'Ramalan & unjuran tinggi';

  @override
  String get featureAllRoutines => 'Kesemua 14 rutin harian';

  @override
  String get featureWaterSleep => 'Penjejakan air & tidur';

  @override
  String get featureProgress => 'Kemajuan & ukuran';

  @override
  String get featureAchievements => 'Pencapaian & rentetan';

  @override
  String get planMonthly => 'Bulanan';

  @override
  String get planYearly => 'Tahunan';

  @override
  String get bestValue => 'NILAI TERBAIK';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'TAHAP $level';
  }

  @override
  String get levelBeginner => 'Pemula';

  @override
  String get levelStarter => 'Permulaan';

  @override
  String get levelCommitted => 'Komited';

  @override
  String get levelDedicated => 'Berdedikasi';

  @override
  String get levelConsistent => 'Konsisten';

  @override
  String get levelFocused => 'Fokus';

  @override
  String get levelDetermined => 'Tekad';

  @override
  String get levelDisciplined => 'Berdisiplin';

  @override
  String get levelStrong => 'Kuat';

  @override
  String get levelAdvanced => 'Mahir';

  @override
  String get levelExpert => 'Pakar';

  @override
  String get levelMaster => 'Master';

  @override
  String get levelElite => 'Elit';

  @override
  String get levelChampion => 'Juara';

  @override
  String get levelLegend => 'Lagenda';

  @override
  String get levelTitan => 'Titan';

  @override
  String get levelMythic => 'Mitos';

  @override
  String get levelImmortal => 'Abadi';

  @override
  String get levelTranscendent => 'Luar Biasa';

  @override
  String get levelUltimate => 'Teragung';

  @override
  String get challengeCompleteAllRoutines => 'Siapkan Semua Rutin';

  @override
  String get challengeCompleteAllRoutinesDesc =>
      'Siapkan setiap rutin hari ini';

  @override
  String get challengeHydrationHero => 'Wira Hidrasi';

  @override
  String get challengeHydrationHeroDesc => 'Capai sasaran air harian anda';

  @override
  String get challengeEarlySleeper => 'Tidur Awal';

  @override
  String get challengeEarlySleeperDesc => 'Catat tidur 8+ jam';

  @override
  String get challengeExerciseTrio => 'Trio Senaman';

  @override
  String get challengeExerciseTrioDesc => 'Siapkan 3 rutin senaman';

  @override
  String get challengeMorningStretch => 'Regangan Pagi';

  @override
  String get challengeMorningStretchDesc => 'Buat regangan pagi sebelum 9 pagi';

  @override
  String get challenge7DayWarrior => 'Pahlawan 7 Hari';

  @override
  String get challenge7DayWarriorDesc =>
      'Siapkan semua rutin selama 7 hari berturut-turut';

  @override
  String get challengeGrowthTracker => 'Penjejak Pertumbuhan';

  @override
  String get challengeGrowthTrackerDesc =>
      'Catat satu ukuran tinggi minggu ini';

  @override
  String get challengeHydrationWeek => 'Minggu Hidrasi';

  @override
  String get challengeHydrationWeekDesc =>
      'Capai sasaran air 5 hari minggu ini';

  @override
  String get challengeFitnessChampion => 'Juara Kecergasan';

  @override
  String get challengeFitnessChampionDesc =>
      'Siapkan 15 rutin senaman minggu ini';

  @override
  String get challengeSleepMaster => 'Pakar Tidur';

  @override
  String get challengeSleepMasterDesc => 'Catat tidur 8+ jam selama 5 hari';

  @override
  String get performanceDashboard => 'PAPAN PRESTASI';

  @override
  String get tierA => 'TAHAP A';

  @override
  String get tierB => 'TAHAP B';

  @override
  String get tierC => 'TAHAP C';

  @override
  String get tierD => 'TAHAP D';

  @override
  String get tierE => 'TAHAP E';

  @override
  String get maxTierReached => 'TAHAP MAKSIMUM DICAPAI';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Tahap Seterusnya: $tier · perlu +$pts mata';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Urus Rutin';

  @override
  String get manageRoutinesSubtitle =>
      'Tunjuk atau sembunyi rutin daripada senarai harian anda';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible daripada $total aktif';
  }

  @override
  String get showAll => 'Tunjuk semua';

  @override
  String get hideAll => 'Sembunyi semua';

  @override
  String get heightAnalysis => 'Analisis Tinggi';

  @override
  String get heightVsPopulation => 'Kedudukan Anda pada Carta Pertumbuhan CDC';

  @override
  String get globalAveragesTable => 'Purata Tinggi Mengikut Umur (CDC)';

  @override
  String get standingTall => 'Tinggi';

  @override
  String get standingAboveAverage => 'Atas Purata';

  @override
  String get standingBelowAverage => 'Bawah Purata';

  @override
  String get standingShort => 'Lebih Rendah daripada Rakan Sebaya';

  @override
  String get yourHeightStanding => 'KEDUDUKAN TINGGI ANDA';

  @override
  String get bellCurveCaption => 'Taburan tinggi pada umur anda';

  @override
  String get bellShorterThanYou => 'lebih rendah daripada anda';

  @override
  String get yourHeight => 'Anda';

  @override
  String peerAvg(int age) {
    return 'Purata umur $age';
  }

  @override
  String get aboveAvg => 'Atas purata';

  @override
  String get belowAvg => 'Bawah purata';

  @override
  String get whoDataSource => 'Carta Pertumbuhan CDC AS';

  @override
  String get percentileShort5 => 'ke-5';

  @override
  String get percentileShort50 => 'ke-50';

  @override
  String get percentileShort95 => 'ke-95';

  @override
  String get youLabel => 'Anda';

  @override
  String get avgHeightLabel => 'PURATA';

  @override
  String get percentileLabel => 'PERSENTIL';

  @override
  String get diffLabel => 'BEZA';

  @override
  String get whoSourceNote =>
      'Sumber data: carta pertumbuhan CDC AS 2000 (tinggi mengikut umur, 2 hingga 20 tahun). Persentil membandingkan anda dengan populasi AS dan boleh berbeza mengikut negara.';

  @override
  String get quickPhotos => 'Foto';

  @override
  String get quickPosture => 'Postur';

  @override
  String get quickWellness => 'Kesejahteraan';

  @override
  String get quickRecipes => 'Resipi';

  @override
  String get wellnessTitle => 'Penjejak Kesejahteraan';

  @override
  String get wellnessHeader => 'KESEJAHTERAAN';

  @override
  String get wellnessSubtitle =>
      'Jejak faktor yang mempengaruhi pertumbuhan anda';

  @override
  String get caffeineToday => 'Kafein Hari Ini';

  @override
  String get withinLimits => 'Dalam had sihat';

  @override
  String get approachingLimit => 'Hampir mencapai had';

  @override
  String get overLimit => 'Melebihi had, menjejaskan HGH';

  @override
  String get resetToday => 'Set semula hari ini';

  @override
  String get stressToday => 'Tekanan Hari Ini';

  @override
  String get stressVeryCalmLabel => 'Sangat tenang, terbaik untuk pertumbuhan';

  @override
  String get stressCalmLabel => 'Tenang';

  @override
  String get stressNeutralLabel => 'Neutral';

  @override
  String get stressStressedLabel => 'Tertekan';

  @override
  String get stressVeryStressedLabel =>
      'Sangat tertekan, kortisol menyekat HGH';

  @override
  String get stressTapToLog => 'Ketik untuk catat perasaan anda hari ini';

  @override
  String get todaysJournal => 'Jurnal Hari Ini';

  @override
  String get journalNoNote => '(tiada catatan)';

  @override
  String get journalEdit => 'Edit';

  @override
  String get journalHowWasToday => 'Bagaimana hari ini?';

  @override
  String get journalSaved => 'Jurnal disimpan · +5 XP';

  @override
  String get journalSaveEntry => 'Simpan catatan';

  @override
  String get weeklyInsight => 'Pandangan Mingguan';

  @override
  String get weeklyInsightCaffeine => 'KAFEIN';

  @override
  String get weeklyInsightStress => 'TEKANAN';

  @override
  String get weeklyInsightMood => 'MOOD';

  @override
  String get wellnessInfoTitle => 'Kenapa kesejahteraan penting';

  @override
  String get wellnessInfoBody =>
      'Kafein mengganggu tidur nyenyak, iaitu waktu kebanyakan hormon pertumbuhan (HGH) dirembeskan. Tekanan berpanjangan menaikkan kortisol, yang terus menyekat HGH. Menulis jurnal membantu anda konsisten dengan tabiat yang menyokong pertumbuhan.';

  @override
  String get wellnessInfoGotIt => 'Faham';

  @override
  String get insightCaffeineHigh =>
      'Kafein anda tinggi minggu ini. Cuba kurangkan untuk tidur dan HGH yang lebih baik.';

  @override
  String get insightStressHigh =>
      'Tekanan meningkat minggu ini. Cuba senaman pernafasan: kortisol menyekat pertumbuhan.';

  @override
  String get insightMoodLow =>
      'Mood anda rendah kebelakangan ini. Cahaya matahari, tidur dan senaman ringan semuanya membantu.';

  @override
  String get insightGreat =>
      'Keseimbangan hebat minggu ini. Kesejahteraan anda menyokong pertumbuhan optimum.';

  @override
  String get insightDefault =>
      'Kesejahteraan anda di landasan betul. Terus mencatat untuk pandangan lebih mendalam.';

  @override
  String get insightNeedMoreData =>
      'Catat beberapa hari lagi untuk melihat pandangan.';

  @override
  String get progressPhotosTitle => 'Foto Kemajuan';

  @override
  String get progressPhotosHeader => 'FOTO KEMAJUAN';

  @override
  String get progressPhotosSubtitle => 'Jejak perjalanan visual anda';

  @override
  String get addProgressPhoto => 'Tambah Foto Kemajuan';

  @override
  String get captureJourney => 'Rakam perjalanan visual anda';

  @override
  String get takePhoto => 'Ambil Foto';

  @override
  String get chooseFromLibrary => 'Pilih dari Galeri';

  @override
  String get deletePhotoTitle => 'Padam Foto?';

  @override
  String get deletePhotoBody =>
      'Foto ini akan dibuang daripada garis masa kemajuan anda.';

  @override
  String get timelineTab => 'Garis Masa';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'foto',
      one: 'foto',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$cm $unit dalam $days hari';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hari',
      one: 'hari',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '$unit bertambah';
  }

  @override
  String get firstPhotoMessage =>
      'Ambil foto pertama anda untuk mula menjejak kemajuan visual.';

  @override
  String get takeFirstPhoto => 'Ambil Foto Pertama';

  @override
  String get beforeAfter => 'SEBELUM / SELEPAS';

  @override
  String get beforeLabel => 'SEBELUM';

  @override
  String get afterLabel => 'SELEPAS';

  @override
  String get yourHeightDialog => 'Tinggi Anda';

  @override
  String get heightDialogMessage =>
      'Masukkan tinggi semasa anda untuk foto ini';

  @override
  String get postureAnalysisTitle => 'Analisis Postur';

  @override
  String get postureCoachHeader => 'JURULATIH POSTUR';

  @override
  String get postureCoachSubtitle => 'Semak sendiri dengan foto sisi anda';

  @override
  String get latestScore => 'SKOR TERKINI';

  @override
  String get latestAnalysis => 'ANALISIS TERKINI';

  @override
  String get headPosition => 'Kedudukan Kepala';

  @override
  String get progressLabel => 'KEMAJUAN';

  @override
  String get choosePhotoSource => 'Pilih Sumber Foto';

  @override
  String get sideProfileHint => 'Pandangan sisi, seluruh badan dalam bingkai';

  @override
  String get howToTakePhoto => 'CARA MENGAMBIL FOTO';

  @override
  String get takePosturePhoto => 'Ambil Foto Postur';

  @override
  String get postureExcellent => 'Cemerlang';

  @override
  String get postureGood => 'Baik';

  @override
  String get postureNeedsWork => 'Perlu diperbaiki';

  @override
  String get posturePoor => 'Lemah';

  @override
  String get recommendedExercises => 'SENAMAN DISYORKAN';

  @override
  String get postureWallStand => 'Berdiri di Dinding';

  @override
  String get postureWallStandDesc =>
      'Berdiri dengan belakang rapat ke dinding selama 2 minit setiap hari.';

  @override
  String get postureChestOpener => 'Pembuka Dada';

  @override
  String get postureChestOpenerDesc =>
      'Melonggarkan otot dada tegang yang menarik bahu ke depan.';

  @override
  String get postureChinTucks => 'Tarik Dagu';

  @override
  String get postureChinTucksDesc =>
      'Betulkan postur kepala ke depan — 3×10 kali.';

  @override
  String get postureDeadbug => 'Deadbug';

  @override
  String get postureDeadbugDesc =>
      'Menguatkan otot teras dalam untuk mengawal lordosis.';

  @override
  String get recipesTitle => 'Resipi';

  @override
  String get recipesHeader => 'RESIPI';

  @override
  String get recipesSubtitle => 'Bekalan tenaga untuk pertumbuhan';

  @override
  String get recipesCategoryAll => 'Semua';

  @override
  String get recipesCategoryBreakfast => 'Sarapan';

  @override
  String get recipesCategoryLunch => 'Tengah Hari';

  @override
  String get recipesCategoryDinner => 'Makan Malam';

  @override
  String get recipesCategorySnack => 'Snek';

  @override
  String get recipesGoalAll => 'Semua';

  @override
  String get recipeDiffEasy => 'Mudah';

  @override
  String get recipeDiffMedium => 'Sederhana';

  @override
  String get recipeDiffHard => 'Sukar';

  @override
  String get recipesFilterType => 'JENIS';

  @override
  String get recipesFilterNutrient => 'KAYA DENGAN';

  @override
  String get recipesGoalVitaminD => 'Vitamin D';

  @override
  String get recipesGoalZinc => 'Zink';

  @override
  String get recipesGoalMagnesium => 'Magnesium';

  @override
  String recipesCountLabel(int count) {
    return '$count resipi';
  }

  @override
  String get recipeIngredients => 'Bahan-bahan';

  @override
  String get recipeSteps => 'Cara Membuat';

  @override
  String get recipesGoalProtein => 'Tinggi Protein';

  @override
  String get recipesGoalCalcium => 'Kalsium';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => 'Zat Besi';

  @override
  String get recipesNoMatch => 'Tiada resipi sepadan dengan penapis ini';

  @override
  String get recipesIngredients => 'Bahan-bahan';

  @override
  String get recipesInstructions => 'Arahan';

  @override
  String get recipesClose => 'TUTUP';

  @override
  String get recipesAboutTitle => 'Tentang Resipi';

  @override
  String get recipesAboutBody =>
      'Resipi pilihan untuk menyokong pertumbuhan anda. Tapis mengikut jenis hidangan atau matlamat nutrisi untuk mencari yang paling sesuai dengan pelan anda.';

  @override
  String get animHintSpinalDecomp => 'Melegakan tekanan tulang belakang';

  @override
  String get animHintGravityReversal => 'Melawan graviti';

  @override
  String get animHintImpactBones => 'Hentakan untuk tulang';

  @override
  String get animHintHighImpact => 'Hentakan tinggi untuk tulang';

  @override
  String get animHintMetabolicBurst => 'Latihan letusan metabolik';

  @override
  String get animHintFullBodyStretch => 'Regangan seluruh badan';

  @override
  String get animHintSpinalExtension => 'Lanjutan tulang belakang';

  @override
  String get animHintCervicalDecomp => 'Melegakan tekanan leher';

  @override
  String get animHintShoulderMobility => 'Mobiliti bahu';

  @override
  String get animHintFullBodyMotion => 'Gerakan seluruh badan';

  @override
  String get animHintPosteriorChain => 'Regangan rantaian posterior';

  @override
  String get animHintMuscleGrowth => 'Bahan api pertumbuhan otot';

  @override
  String get animHintBoneDensity => 'Sokongan ketumpatan tulang';

  @override
  String get animHintSpinalDisc => 'Hidrasi cakera tulang belakang';

  @override
  String get animHintCleanNutrition => 'Pemakanan bersih';

  @override
  String get animHintIgf1 => 'Pengoptimuman IGF-1';

  @override
  String get animHintHghAmino => 'Prekursor amino HGH';

  @override
  String get animHintCalciumAbsorption => 'Penyerapan kalsium';

  @override
  String get animHintSpinalAlignment => 'Penjajaran tulang belakang';

  @override
  String get animHintPostureCorrection => 'Pembetulan postur';

  @override
  String get animHintMindBody => 'Keseimbangan minda-badan';

  @override
  String get animHintCoreStability => 'Kestabilan teras';

  @override
  String get animHintLegPower => 'Kuasa kaki & lonjakan HGH';

  @override
  String get animHintVerticalPower => 'Kuasa menegak';

  @override
  String get animHintHghSurge => 'Latihan lonjakan HGH';

  @override
  String get animHintPeakHgh => 'Waktu puncak rembesan HGH';

  @override
  String get animHintMelatonin => 'Pengoptimuman melatonin';

  @override
  String get animHintDeepSleep => 'Persediaan tidur nyenyak';

  @override
  String get animHintSleepOpt => 'Pengoptimuman tidur';

  @override
  String get animHintExercise => 'Senaman';

  @override
  String get formMorningStretch =>
      'Mulakan dengan memutar leher, kemudian regangan seluruh badan. Tahan setiap regangan 20-30 saat tanpa melantun.';

  @override
  String get formBarHanging =>
      'Pegang palang selebar bahu, rehatkan badan sepenuhnya, biar graviti meregangkan tulang belakang. Elakkan berayun.';

  @override
  String get formCobraStretch =>
      'Meniarap, letak tangan di bawah bahu, tolak badan atas perlahan-lahan sambil pinggul kekal di lantai. Pandang ke atas.';

  @override
  String get formJumping =>
      'Buat squat jump atau lompat tali. Mendarat lembut di hujung tapak kaki. Rehat 30 saat antara set.';

  @override
  String get formSwimmingBasketball =>
      'Pilih berenang (gaya bebas/kuak lentang) atau bola keranjang. Fokus pada lompatan, capaian dan julat gerakan penuh.';

  @override
  String get formEveningYoga =>
      'Buat pose ringan: cat-cow, child pose, downward dog, forward fold. Bernafas dalam dan tahan setiap pose 30-60 saat.';

  @override
  String get formSprintIntervals =>
      'Panaskan badan 5 minit, kemudian pecut sekuat hati selama 30 saat. Jalan atau jogging 90 saat untuk pulih. Ulang.';

  @override
  String get formHiitWorkout =>
      'Buat senaman seperti burpee, mountain climber dan jump squat pada intensiti maksimum selama 45 saat, rehat 15 saat.';

  @override
  String get formSquats =>
      'Berdiri dengan kaki selebar bahu. Turunkan badan sehingga peha selari dengan lantai. Belakang lurus, lutut tidak melepasi jari kaki.';

  @override
  String get formDeadliftStretch =>
      'Berdiri dengan kaki selebar pinggul, bongkok dari pinggul dengan belakang rata. Capai jari kaki, rasakan regangan di hamstring dan belakang.';

  @override
  String get formOverheadPress =>
      'Berdiri tegak, tolak tangan ke atas kepala sehingga lurus sepenuhnya. Guna beban ringan atau berat badan. Ketatkan teras dan jangan lengkungkan belakang.';

  @override
  String get formSkippingRope =>
      'Lompat dengan kedua-dua kaki, mendarat lembut di hujung tapak kaki. Lompatan rendah dan konsisten. Rehat antara set.';

  @override
  String get formPilatesCore =>
      'Buat plank, dead bug, bird dog, bridge dan angkat kaki. Fokus pada gerakan terkawal dan pernafasan.';

  @override
  String get formInversionHang =>
      'Guna meja songsang atau but graviti. Mulakan dengan condong sedikit dan tambah secara beransur. Pastikan sesi singkat.';

  @override
  String get formProtein =>
      'Agihkan protein ke 3-4 waktu makan. Termasuk telur, ayam, ikan, tenusu dan kekacang.';

  @override
  String get formCalciumVitaminD =>
      'Ambil 3 hidangan tenusu sehari dan dapatkan 15 minit cahaya matahari untuk sintesis Vitamin D semula jadi.';

  @override
  String get formWater =>
      'Minum air secara konsisten sepanjang hari. Bawa botol air dan tetapkan peringatan setiap jam.';

  @override
  String get formAvoidJunk =>
      'Gantikan makanan segera dengan makanan asli. Tukar minuman manis kepada air. Baca label dan elak bahan diproses.';

  @override
  String get formZincIntake =>
      'Masukkan daging merah, biji labu, kacang kuda, gajus dan tiram dalam diet anda. Sasarkan 8-11mg sehari.';

  @override
  String get formVitaminDSunlight =>
      'Dedahkan lengan dan muka kepada cahaya matahari terus selama 15 minit, sebaik-baiknya sebelum tengah hari. Tak perlu pelindung matahari untuk tempoh ini.';

  @override
  String get formArginineFoods =>
      'Masukkan kacang, biji-bijian, ayam belanda, ayam, kacang soya dan tenusu dalam hidangan anda. Paling baik diambil sebelum tidur.';

  @override
  String get formDailyCalories =>
      'Agihkan kalori ke 3-5 waktu makan dan jangan tinggal sarapan. Utamakan makanan asli berbanding kalori kosong.';

  @override
  String get formQualitySleep =>
      'Tidur sebelum 10 malam. Pastikan bilik gelap dan sejuk. Elak kafein selepas 2 petang.';

  @override
  String get formNoScreen =>
      'Tetapkan penggera 1 jam sebelum tidur. Simpan semua skrin. Baca buku atau buat regangan ringan sebagai ganti.';

  @override
  String get formSleepEnvironment =>
      'Guna langsir gelap, pastikan bilik pada 18-20°C, buang semua sumber cahaya. Guna tilam dan bantal yang selesa.';

  @override
  String get formPreSleepRoutine =>
      'Mulakan 30 minit sebelum tidur: malapkan lampu, baca buku, buat senaman pernafasan, elak aktiviti yang merangsang.';

  @override
  String get formPostureCheck =>
      'Berdiri tegak dengan bahu ke belakang dan ke bawah. Ketatkan teras sedikit. Bayangkan seutas tali menarik anda ke atas dari ubun-ubun.';

  @override
  String get formWallStand =>
      'Berdiri dengan tumit, punggung, bilah bahu dan kepala menyentuh dinding. Tahan 5 minit. Bernafas seperti biasa.';

  @override
  String get formNeckStretches =>
      'Condongkan kepala perlahan ke setiap sisi, ke depan dan ke belakang. Tahan setiap arah 30 saat. Jangan paksa regangan.';

  @override
  String get formShoulderRolls =>
      'Putar bahu ke depan 15 kali, kemudian ke belakang 15 kali. Diikuti regangan membuka dada, tahan 20 saat.';

  @override
  String get sciMorningStretch =>
      'Regangan pagi melegakan cakera tulang belakang yang terhidrat semula semalaman, membantu mengekalkan tinggi';

  @override
  String get sciBarHanging =>
      'Bergantung melegakan cakera vertebra dengan graviti yang meregangkan tulang belakang, mungkin menambah tinggi buat sementara';

  @override
  String get sciCobraStretch =>
      'Regangan kobra melanjutkan tulang belakang dan membuka dada, melawan tekanan tulang belakang akibat duduk';

  @override
  String get sciJumping =>
      'Lompatan hentakan tinggi merangsang plat pertumbuhan di kaki dan mencetuskan rembesan hormon pertumbuhan';

  @override
  String get sciSwimmingBasketball =>
      'Berenang dan bola keranjang melibatkan regangan seluruh badan, lompatan dan capaian yang merangsang aktiviti plat pertumbuhan';

  @override
  String get sciEveningYoga =>
      'Yoga malam mengurangkan kortisol yang menyekat hormon pertumbuhan, dan meregangkan otot untuk pemulihan semalaman';

  @override
  String get sciSprintIntervals =>
      'Pecut mencetuskan rembesan hormon pertumbuhan yang ketara';

  @override
  String get sciHiitWorkout =>
      'Senaman intensiti tinggi meningkatkan HGH sehingga 450%';

  @override
  String get sciSquats =>
      'Squat merangsang plat pertumbuhan di kaki dan tulang belakang';

  @override
  String get sciDeadliftStretch =>
      'Melegakan tekanan tulang belakang menggalakkan kesihatan cakera vertebra';

  @override
  String get sciOverheadPress =>
      'Tekanan atas kepala meregangkan tulang belakang dan menguatkan otot postur';

  @override
  String get sciSkippingRope =>
      'Lompatan berulang merangsang plat pertumbuhan di bahagian bawah badan';

  @override
  String get sciPilatesCore =>
      'Kekuatan teras menyokong penjajaran tulang belakang dan postur';

  @override
  String get sciInversionHang =>
      'Posisi songsang melegakan tekanan cakera tulang belakang, boleh menambah 1-2cm buat sementara';

  @override
  String get sciProtein =>
      'Protein membekalkan asid amino penting untuk pertumbuhan tulang dan otot, terutamanya semasa lonjakan pertumbuhan';

  @override
  String get sciCalciumVitaminD =>
      'Kalsium dan Vitamin D ialah asas utama ketumpatan tulang dan pertumbuhan tulang memanjang';

  @override
  String get sciWater =>
      'Hidrasi penting untuk mengangkut nutrien ke plat pertumbuhan dan kesihatan rawan sendi';

  @override
  String get sciAvoidJunk =>
      'Makanan diproses dan gula menyebabkan keradangan dan lonjakan insulin yang menyekat rembesan hormon pertumbuhan';

  @override
  String get sciZincIntake =>
      'Zink penting untuk penghasilan hormon pertumbuhan';

  @override
  String get sciVitaminDSunlight =>
      'Vitamin D sangat penting untuk penyerapan kalsium dan pertumbuhan tulang';

  @override
  String get sciArginineFoods =>
      'L-Arginina merangsang rembesan hormon pertumbuhan';

  @override
  String get sciDailyCalories =>
      'Defisit kalori berterusan menurunkan IGF-1 dan melemahkan denyutan hormon pertumbuhan, terus memperlahankan pertumbuhan tinggi semasa remaja';

  @override
  String get sciQualitySleep =>
      '70-80% hormon pertumbuhan harian dirembeskan semasa tidur nyenyak, terutamanya antara 10 malam dan 2 pagi';

  @override
  String get sciNoScreen =>
      'Cahaya biru dari skrin menyekat penghasilan melatonin, melewatkan tidur dan mengurangkan kualiti tidur nyenyak';

  @override
  String get sciSleepEnvironment =>
      'Suasana gelap dan sejuk memaksimumkan melatonin dan hormon pertumbuhan';

  @override
  String get sciPreSleepRoutine =>
      'Rutin sebelum tidur yang konsisten meningkatkan kualiti tidur nyenyak sebanyak 23%';

  @override
  String get sciPostureCheck =>
      'Penjajaran postur yang betul boleh terus menambah 2-3 cm pada tinggi yang kelihatan dan mencegah tekanan tulang belakang';

  @override
  String get sciWallStand =>
      'Berdiri di dinding melatih ingatan otot postur, membantu mengekalkan penjajaran tulang belakang sepanjang hari';

  @override
  String get sciNeckStretches =>
      'Regangan leher melegakan tekanan dan memperbaik penjajaran leher';

  @override
  String get sciShoulderRolls =>
      'Membuka bahu membetulkan postur bongkok, boleh nampak 1-2cm lebih tinggi';

  @override
  String get muscleSpine => 'Tulang Belakang';

  @override
  String get muscleLegs => 'Kaki';

  @override
  String get muscleBack => 'Belakang';

  @override
  String get muscleShoulders => 'Bahu';

  @override
  String get muscleArms => 'Lengan';

  @override
  String get muscleCore => 'Teras';

  @override
  String get muscleChest => 'Dada';

  @override
  String get muscleCalves => 'Betis';

  @override
  String get muscleFullBody => 'Seluruh Badan';

  @override
  String get muscleHips => 'Pinggul';

  @override
  String get muscleBones => 'Tulang';

  @override
  String get muscleMuscles => 'Otot';

  @override
  String get muscleNeck => 'Leher';

  @override
  String get muscleUpperSpine => 'Tulang Belakang Atas';

  @override
  String get muscleUpperBack => 'Belakang Atas';

  @override
  String get createRoutine => 'Cipta Rutin';

  @override
  String get createRoutineTitle => 'Cipta Rutin Sendiri';

  @override
  String get createRoutineSubtitle => 'Bina rutin harian anda sendiri';

  @override
  String get routineIcon => 'Ikon';

  @override
  String get routineTitleField => 'Tajuk';

  @override
  String get routineDescField => 'Penerangan';

  @override
  String get routineDescHint => 'Ringkasan pendek rutin';

  @override
  String get routineCategoryField => 'Kategori';

  @override
  String get routineDifficultyField => 'Kesukaran';

  @override
  String get routineDurationField => 'Tempoh';

  @override
  String get routineSetsRepsField => 'Set x Ulangan';

  @override
  String get routineFormField => 'Teknik & Arahan';

  @override
  String get routineFormHint => 'Pilihan: cara melakukan rutin ini';

  @override
  String get diffBeginner => 'Pemula';

  @override
  String get diffIntermediate => 'Pertengahan';

  @override
  String get diffAdvanced => 'Lanjutan';

  @override
  String get catExercise => 'Senaman';

  @override
  String get catNutrition => 'Pemakanan';

  @override
  String get catSleep => 'Tidur';

  @override
  String get catPosture => 'Postur';

  @override
  String get postureTip1 => 'Berdiri mengiring (pandangan sisi) ke kamera.';

  @override
  String get postureTip2 => 'Jarak ~2 meter dari lensa.';

  @override
  String get postureTip3 => 'Lengan santai, pandang lurus ke depan.';

  @override
  String get postureTip4 => 'Pakai pakaian yang muat untuk skor tepat.';

  @override
  String get postureTip5 => 'Guna pencahayaan baik dan latar belakang kosong.';

  @override
  String get kyphosisLabel => 'Kifosis (belakang atas)';

  @override
  String get lordosisLabel => 'Lordosis (pinggang)';

  @override
  String get analyzingPosture => 'MENGANALISIS POSTUR';

  @override
  String get privacyPolicy => 'Dasar Privasi';

  @override
  String get termsOfService => 'Terma Perkhidmatan';

  @override
  String version(String ver) {
    return 'Versi $ver';
  }

  @override
  String get rateApp => 'Nilai BeTaller';

  @override
  String get rateAppSubtitle => 'Ulasan anda membantu kami berkembang!';

  @override
  String get unitSystem => 'Sistem Unit';

  @override
  String get unitMetric => 'Metrik (cm, kg)';

  @override
  String get unitImperial => 'Imperial (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'Penafian Kesihatan';

  @override
  String get healthDisclaimerBody =>
      'BeTaller memberikan panduan kesejahteraan dan kecergasan umum. Hasil berbeza mengikut umur, genetik dan faktor individu. Aplikasi ini tidak memberikan nasihat perubatan. Senaman memberi tumpuan pada pengoptimuman postur, kesihatan tulang belakang dan sokongan hormon pertumbuhan melalui tabiat semula jadi. Dapatkan nasihat profesional kesihatan sebelum memulakan sebarang program senaman atau pemakanan baharu. Perubahan tinggi selepas plat pertumbuhan tertutup (biasanya umur 18-25) kebanyakannya datang daripada postur yang lebih baik.';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'Dapatkan sekurang-kurangnya ${grams}g protein hari ini — dikira daripada berat anda.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'Minum sekurang-kurangnya ${liters}L air hari ini — dikira daripada berat anda.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'Sasarkan kira-kira $kcal kcal hari ini untuk menyokong pertumbuhan.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'Dapatkan $iu IU Vitamin D hari ini — daripada cahaya matahari, makanan atau suplemen.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'Dapatkan ${mg}mg Zink hari ini untuk menyokong penghasilan hormon pertumbuhan.';
  }

  @override
  String get nutritionSupplementsTitle => 'SUPLEMEN';

  @override
  String get nutritionSupplementsDisclaimer =>
      'Sokongan pilihan, bukan pengganti makanan. Berbincang dengan doktor sebelum mula mengambil suplemen, terutamanya jika bawah 18 tahun.';

  @override
  String get supplementVitaminDName => 'Vitamin D3';

  @override
  String get supplementVitaminDDose => '3,000 IU';

  @override
  String get supplementVitaminDBenefit =>
      'Meningkatkan penyerapan kalsium untuk ketumpatan tulang dan kesihatan plat pertumbuhan';

  @override
  String get supplementZincName => 'Zink';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit =>
      'Mineral utama untuk penghasilan hormon pertumbuhan';

  @override
  String get supplementMagnesiumName => 'Magnesium';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit =>
      'Menyokong peringkat tidur nyenyak, ketika kebanyakan hormon pertumbuhan dirembeskan';

  @override
  String get supplementCalciumName => 'Kalsium';

  @override
  String get supplementCalciumDose => '1,000-1,300mg';

  @override
  String get supplementCalciumBenefit =>
      'Asas utama ketumpatan tulang dan plat pertumbuhan';

  @override
  String get supplementOmega3Name => 'Omega-3';

  @override
  String get supplementOmega3Dose => '1,000mg';

  @override
  String get supplementOmega3Benefit =>
      'Mengurangkan keradangan dan menyokong fungsi plat pertumbuhan yang sihat';

  @override
  String get supplementCollagenName => 'Kolagen + Vitamin C';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit =>
      'Vitamin C membantu badan menggunakan kolagen untuk membina rawan dan matriks tulang';

  @override
  String get sciSourcePrefix => 'Sumber: ';

  @override
  String get program => 'Program';

  @override
  String get todaysExercises => 'SENAMAN HARI INI';

  @override
  String get dailyNutritionPlan => 'PELAN PEMAKANAN HARIAN';

  @override
  String get nutritionGoalsComplete => '🎉 Semua sasaran pemakanan selesai!';

  @override
  String get nutritionGoalsIncomplete =>
      'Capai sasaran pemakanan anda untuk pertumbuhan optimum';

  @override
  String get postureDetectingAlignment =>
      'Mengesan penjajaran tulang belakang...';

  @override
  String get testimonial1 =>
      'Saya hilang harapan sebab umur saya, tapi saya bertambah tinggi dengan BeTaller. Keyakinan saya tak pernah setinggi ini.';

  @override
  String get testimonialDuration1 => '4 bulan';

  @override
  String get testimonial2 =>
      'Semua orang kata \"kau dah tak boleh tinggi lagi.\" Saya guna BeTaller dan buat semua orang terkejut.';

  @override
  String get testimonialDuration2 => '3 bulan';

  @override
  String get testimonial3 =>
      'Selepas mula buat rutin, saya bertambah tinggi dan postur saya makin baik. Semua orang perasan bezanya.';

  @override
  String get testimonialDuration3 => '6 bulan';

  @override
  String get testimonial4 =>
      'Saya masih dalam fasa pertumbuhan dan kesan BeTaller memang luar biasa. Saya rasa lebih tinggi dan lebih kuat.';

  @override
  String get testimonialDuration4 => '3 bulan';

  @override
  String get testimonial5 =>
      'Kalau saya kata tak pernah cuba BeTaller, saya tipu. Saya cepat nampak beza yang nyata, sangat disyorkan.';

  @override
  String get testimonialDuration5 => '4 bulan';

  @override
  String get designedForYou => 'Direka untuk anda';

  @override
  String get designedForYouDesc =>
      'BeTaller dibina khas untuk membantu anda mencapai had genetik anda, malah melepasinya. Setiap ciri, untuk anda.';

  @override
  String get greetingAllDone => 'Syabas! 🎯';

  @override
  String get greetingAllDoneSub => 'Anda sudah siapkan tugasan hari ini.';

  @override
  String greetingStreak30(int streak) {
    return '$streak hari berturut-turut. Tahap lagenda.';
  }

  @override
  String greetingStreak7(int streak) {
    return '$streak hari berturut-turut. Teruskan.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak hari berturut-turut. Ramai orang berhenti. Anda tidak.';
  }

  @override
  String get greetingMorning => 'Selamat pagi. Hari baharu, peluang baharu.';

  @override
  String get greetingAfternoon =>
      'Hari ini hari yang sesuai untuk mula rentetan anda.';

  @override
  String get greetingEvening => 'Siapkan tugasan anda, mulakan rentetan anda.';

  @override
  String get todayCompleted => 'Hari ini selesai ✓';

  @override
  String get todayGoals => 'Sasaran hari ini';

  @override
  String get challengesLabel => 'Cabaran';

  @override
  String get dailyChallengesLabel => 'CABARAN HARIAN';

  @override
  String get expiresTonight => 'Tamat malam ini';

  @override
  String get allChallengesCompleted => 'Semua selesai ✓';

  @override
  String get challengesLoading =>
      'Cabaran baharu akan dimuatkan tidak lama lagi.';

  @override
  String get challengesLoadingTitle => 'Cabaran harian';

  @override
  String get behindPace => 'Ketinggalan';

  @override
  String get growthTracking => 'Penjejakan pertumbuhan';

  @override
  String get growthEmptyFirst =>
      'Catat tinggi pertama anda untuk mula menjejak.';

  @override
  String get growthEmptySecond =>
      'Catat ukuran kedua anda untuk melihat carta.';

  @override
  String get growthSectionLabel => 'PERTUMBUHAN';

  @override
  String get generalPerformance => 'PRESTASI KESELURUHAN';

  @override
  String get analysisBalance => 'Keseimbangan anda';

  @override
  String get analysisWeakest => 'Titik paling lemah anda';

  @override
  String get analysisPrediction => 'Ramalan tinggi';

  @override
  String get analysisComparison => 'Perbandingan';

  @override
  String get analysisGrowth => 'Status pertumbuhan';

  @override
  String get analysisWeakestHint =>
      'Di sinilah cara paling cepat untuk naikkan skor anda.';

  @override
  String get exploreLabel => 'TEROKA';

  @override
  String get explorePosture => 'Analisis Postur';

  @override
  String get explorePostureSub => 'Analisis postur dan tip pembetulan';

  @override
  String get explorePhotos => 'Foto Kemajuan';

  @override
  String get explorePhotosSub => 'Jejak perubahan anda dengan foto';

  @override
  String get exploreNutrition => 'Pemakanan';

  @override
  String get exploreNutritionSub => 'Panduan protein, kalsium dan vitamin';

  @override
  String get exploreHealth => 'Penjejakan Kesihatan';

  @override
  String get exploreHealthSub => 'Penjejakan tekanan, kafein dan kesejahteraan';

  @override
  String get exploreRecipes => 'Resipi Pertumbuhan';

  @override
  String get exploreRecipesSub => 'Resipi yang menyokong pertumbuhan';

  @override
  String get educationLabel => 'PENDIDIKAN';

  @override
  String get educationTitle => 'Sains pertumbuhan\ntinggi';

  @override
  String get educationSubtitle => 'Kandungan pakar, kajian dan panduan';

  @override
  String get aiAnalysisLabel => 'ANALISIS PERTUMBUHAN';

  @override
  String get peerCompareLabel => 'BANDING DENGAN RAKAN SEBAYA';

  @override
  String peerCompareText(int topPct) {
    return 'Anda dalam $topPct% teratas rakan sebaya anda';
  }

  @override
  String get notifWaterTitle => '💧 Jangan Lupa Minum Air!';

  @override
  String get notifWaterBody =>
      'Sudah capai sasaran air harian? Minum segelas lagi!';

  @override
  String get notifMorningTitle => '🌅 Selamat Pagi! Masa Bersenam';

  @override
  String get notifMorningBody =>
      'Buat regangan pagi anda! 10 minit regangan tulang belakang dan kaki.';

  @override
  String get notifRoutineTitle => '🔥 Siapkan Rutin Anda!';

  @override
  String get notifRoutineBody =>
      'Semak rutin anda sebelum hari berakhir. Rentetan = disiplin!';

  @override
  String get notifProteinTitle => '🥚 Hari Protein!';

  @override
  String get notifProteinBody =>
      'Mulakan minggu dengan bertenaga! Ambil protein setiap kali makan.';

  @override
  String get notifNewWeekTitle => '✨ Minggu Baharu, Sasaran Baharu!';

  @override
  String get notifNewWeekBody =>
      'Jangan tinggal rutin minggu ini. Langkah kecil, perubahan besar!';

  @override
  String get notifSleepTitle => '😴 Masa Tidur!';

  @override
  String get notifSleepBody =>
      'Hormon pertumbuhan memuncak antara 10 malam-2 pagi. Letak telefon anda!';

  @override
  String get notifPostureTitle => '🧍 Semakan Postur!';

  @override
  String get notifPostureBody =>
      'Belakang lurus, bahu ke belakang. Postur baik = beza 2-3 cm!';

  @override
  String get notifVitaminDTitle => '☀️ Masa Vitamin D!';

  @override
  String get notifVitaminDBody =>
      'Dapatkan 15 minit cahaya matahari! Vitamin D meningkatkan penyerapan kalsium.';

  @override
  String get notifMidweekTitle => '✨ Sudah Separuh Jalan!';

  @override
  String get notifMidweekBody =>
      'Semakan tengah minggu. Pertumbuhan perlukan kesabaran, tapi konsisten itu kunci kemenangan!';

  @override
  String get notifScreenTitle => '📵 Tutup Skrin!';

  @override
  String get notifScreenBody =>
      'Tiada skrin 1 jam sebelum tidur. Cahaya biru menyekat melatonin!';

  @override
  String get notifJumpTitle => '🦘 Masa Melompat!';

  @override
  String get notifJumpBody =>
      'Senaman lompat merangsang plat pertumbuhan. Cuba 3 x 20 kali!';

  @override
  String get notifCalciumTitle => '🥛 Masa Kalsium!';

  @override
  String get notifCalciumBody =>
      'Segelas susu atau yogurt. Kalsium sangat penting untuk tulang!';

  @override
  String get notifPostureCheckTitle => '🧍 Semakan Postur!';

  @override
  String get notifPostureCheckBody =>
      'Jangan tunduk leher ke telefon! Duduk dan berjalan dengan tegak.';

  @override
  String get notifWeekendTitle => '✨ Motivasi Hujung Minggu';

  @override
  String get notifWeekendBody =>
      'Jangan tinggal rutin pada hujung minggu! Disiplin berlaku setiap hari.';

  @override
  String get notifWeeklyProgressTitle => '📊 Kemajuan Mingguan';

  @override
  String get notifWeeklyProgressBody =>
      'Bagaimana minggu anda? Semak carta pertumbuhan anda!';

  @override
  String get notifMeasureTitle => '📏 Ukuran Mingguan!';

  @override
  String get notifMeasureBody =>
      'Ukur dan catat tinggi anda! Ukuran pagi paling tepat.';

  @override
  String get notifEarlySleepTitle => '😴 Tidur Awal!';

  @override
  String get notifEarlySleepBody =>
      'Esok hari Isnin! Mulakan minggu dengan bertenaga melalui tidur yang cukup.';

  @override
  String get notifStreak3Title => '🔥 Rentetan 3 Hari!';

  @override
  String get notifStreak3Body =>
      'Permulaan hebat! 3 hari berturut-turut. Teruskan sehingga 7!';

  @override
  String get notifStreak7Title => '🏆 Rentetan 1 Minggu!';

  @override
  String get notifStreak7Body =>
      'Luar biasa! 7 hari berturut-turut rutin disiapkan!';

  @override
  String get notifStreak14Title => '⭐ Rentetan 2 Minggu!';

  @override
  String get notifStreak14Body => '14 hari disiplin! Badan anda mula berubah.';

  @override
  String get notifStreak30Title => '👑 Rentetan 1 Bulan!';

  @override
  String get notifStreak30Body => '30 hari! Anda memang juara!';

  @override
  String get notifStreak60Title => '🌟 Rentetan 60 Hari!';

  @override
  String get notifStreak60Body => '60 hari! Pencapaian yang luar biasa.';

  @override
  String get notifStreak100Title => '💎 100 HARI! LAGENDA!';

  @override
  String get notifStreak100Body =>
      '100 hari berturut-turut! Anda sudah jadi lagenda.';

  @override
  String get notifStreakRiskTitle => '⚠️ Jangan Putuskan Rentetan Anda!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Rentetan $streak hari anda dalam bahaya! Siapkan rutin anda.';
  }

  @override
  String get paywallStat1 => 'cm — potensi anda masih terkunci';

  @override
  String get paywallTitle1 => 'Berapa cm\nAnda Boleh Tumbuh?';

  @override
  String get paywallBullet1a => 'Had genetik anda sudah dikira, mahu lihat?';

  @override
  String get paywallBullet1b =>
      'Bagaimana gaya hidup mempengaruhi pertumbuhan anda?';

  @override
  String get paywallBullet1c => 'Pelan hala tuju peribadi anda menanti';

  @override
  String get paywallStat2 => 'rutin khas anda sudah sedia';

  @override
  String get paywallTitle2 => 'Pelan Anda\nSudah Sedia';

  @override
  String get paywallBullet2a =>
      '8 minit setiap pagi — direka untuk tulang belakang anda';

  @override
  String get paywallBullet2b => 'Tidur, pemakanan, air — semuanya dijejak';

  @override
  String get paywallBullet2c =>
      'Selangkah lebih dekat setiap hari, jangan putuskan rentetan';

  @override
  String get paywallStat3 => 'carta kemajuan masa nyata';

  @override
  String get paywallTitle3 => 'Jejak\nPertumbuhan Anda';

  @override
  String get paywallBullet3a =>
      'Ukuran bulanan — lihat pertumbuhan anda dengan mata sendiri';

  @override
  String get paywallBullet3b =>
      'Tambah 2 cm serta-merta dengan analisis postur';

  @override
  String get paywallBullet3c => 'Foto kemajuan — anda akan nampak bezanya';

  @override
  String get paywallStat4 => 'program harian — naik tahap';

  @override
  String get paywallTitle4 => 'Lebih Kuat\nSetiap Hari';

  @override
  String get paywallBullet4a => 'Kumpul XP, buka tahap — tabiat jadi permainan';

  @override
  String get paywallBullet4b => 'Mereka yang capai matlamat bermula di sini';

  @override
  String get paywallBullet4c => 'Mula sekarang — minggu pertama percuma';

  @override
  String get paywallRestore => 'Tiada pembelian terdahulu ditemui';

  @override
  String get paywallRestoreNotFound => 'Tiada pembelian terdahulu ditemui';

  @override
  String get paywallPromoCode => 'Ada kod promo?';

  @override
  String get paywallHeightUnit => 'sasaran tinggi';

  @override
  String get paywallHeightTitle => 'Berapa tinggi lagi anda boleh capai?';

  @override
  String get paywallHeightDesc =>
      'Kami analisis genetik, gaya hidup dan postur anda bersama-sama, lalu petakan ramalan tahun demi tahun. Tiada yang tetap: setiap langkah anda mengemas kininya.';

  @override
  String get paywallGrowthUnit => 'tahun ini';

  @override
  String get paywallGrowthTitle => 'Kami jejak pertumbuhan anda bersama';

  @override
  String get paywallGrowthDesc =>
      'Setiap ukuran terus masuk ke carta. Anda lihat kemajuan bulan demi bulan, sentimeter demi sentimeter.';

  @override
  String get paywallPostureUnit => 'skor postur';

  @override
  String get paywallPostureTitle => 'Postur anda kunci kepada rutin anda';

  @override
  String get paywallPostureDesc =>
      'Semakan pantas 3 soalan untuk kepala, bahu dan pinggang, berserta senaman tepat untuk membetulkan setiap satu.';

  @override
  String get paywallReportUnit => 'rutin disiapkan';

  @override
  String get paywallReportTitle => 'Kami semak prestasi anda setiap minggu';

  @override
  String get paywallReportDesc =>
      'Air, tidur, rutin dan rentetan dalam satu skrin. Setiap minggu kita kenal pasti kekuatan dan kelemahan anda bersama.';

  @override
  String get paywallNutritionUnit => 'hidangan sehari';

  @override
  String get paywallNutritionTitle =>
      'Pelan pemakanan lengkap anda sudah sedia';

  @override
  String get paywallNutritionDesc =>
      'Dari sarapan hingga makan malam, pelan harian penuh dengan protein, kalsium, zink dan vitamin D yang sudah dikira.';

  @override
  String get paywallScoreUnit => 'Skor BeTaller';

  @override
  String get paywallScoreTitle => 'Sistem yang terus mendorong anda ke depan';

  @override
  String get paywallScoreDesc =>
      'Genetik, pertumbuhan, pemakanan, tidur dan disiplin digabungkan dalam satu skor. Sebaik ia turun, anda nampak tepat di mana perlu diperbaiki.';

  @override
  String get paywallPhotosUnit => 'perbezaan ketara';

  @override
  String get paywallPhotosTitle => 'Buktikan perubahan anda dengan foto';

  @override
  String get paywallPhotosDesc =>
      'Perbandingan sebelum dan selepas terbina sendiri, dan foto setiap bulan tersusun bersama dalam garis masa anda.';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => 'Jom mula dalam tiga langkah';

  @override
  String get journeyIntroSubtitle =>
      'Kita sediakan BeTaller bersama-sama. Langkah seterusnya sedang menanti.';

  @override
  String get journeyStep1Title => 'Mengumpul data anda';

  @override
  String get journeyStep1Desc =>
      'Kami ambil tinggi, umur dan gaya hidup anda, kemudian kira potensi anda.';

  @override
  String get journeyStep2Title => 'Lawatan aplikasi';

  @override
  String get journeyStep2Desc =>
      'Kami tunjukkan setiap ciri: apa fungsinya dan cara menggunakannya.';

  @override
  String get journeyStep3Title => 'Guna sendiri';

  @override
  String get journeyStep3Desc =>
      'Anda jalankan rutin harian dan kami jejak kemajuan anda.';

  @override
  String get journeyNow => 'SEKARANG';

  @override
  String get journeyDone => 'SELESAI';

  @override
  String get journeySoon => 'AKAN DATANG';

  @override
  String get tourHomeStreakTitle => 'Rentetan Anda';

  @override
  String get tourHomeStreakDesc =>
      'Terus bertambah selagi anda kekal berdisiplin. Terlepas sehari, ia bermula semula.';

  @override
  String get tourHomeXpTitle => 'Tahap Anda';

  @override
  String get tourHomeXpDesc =>
      'Naik dengan XP yang anda kumpul melalui disiplin. Jangan terkeluar landasan!';

  @override
  String get tourHomeGoalsTitle => 'Sasaran Hari Ini';

  @override
  String get tourHomeGoalsDesc =>
      'Tunjuk rutin, tugasan dan sasaran air hari ini sekali pandang, supaya tiada yang terlepas.';

  @override
  String get tourHomeTrackTitle => 'Penjejakan Air & Tidur';

  @override
  String get tourHomeTrackDesc =>
      'Catat air dan tidur harian anda di sini, dalam beberapa saat.';

  @override
  String get tourPlanTabsTitle => 'Tiga Tab: Hari Ini, Disiplin, Pemakanan';

  @override
  String get tourPlanTabsDesc =>
      'Rutin harian, program mingguan dan pelan pemakanan anda semuanya di sini.';

  @override
  String get tourPlanLevelTitle => 'Tahap Disiplin Anda';

  @override
  String get tourPlanLevelDesc =>
      'Menunjukkan sejauh mana anda konsisten menyiapkan rutin. Naik tahap untuk hasil lebih baik.';

  @override
  String get tourPlanTodayTitle => 'Pelan Hari Ini';

  @override
  String get tourPlanTodayDesc =>
      'Tandakan rutin harian anda di sini untuk memanjangkan rentetan.';

  @override
  String get tourPlanTodayListTitle => 'Rutin Anda Hari Ini';

  @override
  String get tourPlanTodayListDesc =>
      'Tandakan setiap satu selepas anda buat. Ketik rutin untuk lihat butirannya.';

  @override
  String get tourPlanWeekGoalsTitle => 'Minggu Ini';

  @override
  String get tourPlanWeekGoalsDesc =>
      'Hari sempurna, latihan dan ukuran yang diperlukan minggu ini, termasuk yang wajib.';

  @override
  String get tourPlanMonthGoalsTitle => 'Bulan Ini';

  @override
  String get tourPlanMonthGoalsDesc =>
      'Foto kemajuan, semakan postur dan ukuran bulan ini: yang tak patut anda tinggalkan.';

  @override
  String get tourProgressHeightTitle => 'Tinggi Semasa Anda';

  @override
  String get tourProgressHeightDesc =>
      'Tunjuk tinggi anda sekarang dan jumlah pertambahan. Tambah ukuran baharu dari sini.';

  @override
  String get tourProgressPhotosTitle => 'Foto Kemajuan';

  @override
  String get tourProgressPhotosDesc =>
      'Jejak perubahan anda secara visual dengan foto yang diambil secara tetap.';

  @override
  String get tourProgressPostureTitle => 'Analisis Postur';

  @override
  String get tourProgressPostureDesc =>
      'Analisis postur anda daripada foto dan ketahui apa yang perlu diperbaiki.';

  @override
  String get tourAnalysisScoreTitle => 'Skor BeTaller Anda';

  @override
  String get tourAnalysisScoreDesc =>
      'Skor prestasi keseluruhan anda, dikira daripada genetik, kadar pertumbuhan, pemakanan dan tidur.';

  @override
  String get tourAnalysisPredictionTitle => 'Ramalan Tinggi Anda';

  @override
  String get tourAnalysisPredictionDesc =>
      'Tunjuk ramalan tinggi akhir anda dan trajektori tahun demi tahun.';

  @override
  String get tourAnalysisPeerTitle => 'Banding dengan Rakan Sebaya';

  @override
  String get tourAnalysisPeerDesc =>
      'Lihat kedudukan anda dan bandingkan diri dengan mereka yang sebaya.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'Rutin Anda';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'Lihat berapa banyak rutin senaman yang masih perlu disiapkan hari ini.';

  @override
  String get tourHomeGoalsChallengesTitle => 'Tugasan Anda';

  @override
  String get tourHomeGoalsChallengesDesc =>
      'Jejak kemajuan cabaran aktif anda di sini.';

  @override
  String get tourHomeGoalsWaterTitle => 'Sasaran Air Anda';

  @override
  String get tourHomeGoalsWaterDesc =>
      'Lihat sejauh mana anda dengan sasaran air harian.';

  @override
  String get tourHomeReminderTitle => 'Peringatan Seterusnya';

  @override
  String get tourHomeReminderDesc =>
      'Lihat bila peringatan seterusnya, dan edit dari sini.';

  @override
  String get tourHomeChallengesTitle => 'Cabaran Anda';

  @override
  String get tourHomeChallengesDesc =>
      'Siapkan cabaran aktif untuk dapat XP tambahan.';

  @override
  String get tourHomeGrowthTitle => 'Status Pertumbuhan Anda';

  @override
  String get tourHomeGrowthDesc =>
      'Lihat jumlah pertambahan, beza ukuran terakhir dan berapa ukuran yang sudah dicatat.';

  @override
  String get tourHomeExploreTitle => 'Teroka';

  @override
  String get tourHomeExploreDesc =>
      'Panduan pemakanan, resipi pertumbuhan dan banyak lagi menanti anda di sini.';

  @override
  String get tourPlanProgramHeaderTitle => 'Program 70 Hari Anda';

  @override
  String get tourPlanProgramHeaderDesc =>
      'Lihat kemajuan keseluruhan, tahap dan hari semasa anda dalam cincin ini.';

  @override
  String get tourPlanProgramLevelsTitle => 'Tahap';

  @override
  String get tourPlanProgramLevelsDesc =>
      'Lihat anda di tahap mana daripada 10 tahap, dan yang mana masih terkunci.';

  @override
  String get tourPlanNutritionHeaderTitle => 'Kemajuan Pemakanan Anda';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'Jejak berapa banyak rutin pemakanan harian yang sudah disiapkan.';

  @override
  String get tourPlanNutritionFirstTitle => 'Rutin Pemakanan';

  @override
  String get tourPlanNutritionFirstDesc =>
      'Tandakan tabiat pemakanan yang menyokong pertumbuhan anda.';

  @override
  String get tourProgressChartTitle => 'Lengkung Pertumbuhan';

  @override
  String get tourProgressChartDesc =>
      'Lihat ukuran lepas anda pada carta dan fahami hala tuju anda.';

  @override
  String get tourProgressReportTitle => 'Laporan Mingguan';

  @override
  String get tourProgressReportDesc =>
      'Semak laporan yang merumuskan kemajuan minggu anda.';

  @override
  String get tourProgressHistoryTitle => 'Sejarah Ukuran Anda';

  @override
  String get tourProgressHistoryDesc =>
      'Lihat setiap ukuran tinggi yang anda catat pada garis masa.';

  @override
  String get tourAnalysisRadarTitle => 'Carta Keseimbangan Anda';

  @override
  String get tourAnalysisRadarDesc =>
      'Lihat keseimbangan genetik, kadar pertumbuhan, pemakanan, tidur dan disiplin anda pada carta radar, dan kenal pasti titik paling lemah.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'Keperluan Harian Anda';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'Lihat keperluan protein, kalori, tidur dan air harian anda, disesuaikan dengan tinggi dan berat anda.';

  @override
  String get journeyDataDoneTitle => 'Langkah pertama selesai';

  @override
  String get journeyDataDoneSubtitle =>
      'Kami sudah ada data dan potensi anda. Seterusnya, lawatan aplikasi.';

  @override
  String get journeyContinue => 'Teruskan';

  @override
  String get journeyEnterApp => 'Masuk aplikasi';

  @override
  String get journeyProgressLabel => 'Bermula';

  @override
  String get journeyTourDoneTitle => 'Selamat datang ke BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'Anda sudah lengkapkan ketiga-tiga langkah. Kini giliran anda: mulakan perjalanan dengan menyiapkan rutin pertama.';

  @override
  String get journeyViewPlansButton => 'Lihat pelan untuk bermula';

  @override
  String get paywallRestoreLabel => 'Pulihkan Pembelian';

  @override
  String get paywallYearly => 'Tahunan';

  @override
  String get paywallBestValue => 'Nilai terbaik';

  @override
  String paywallSavePercent(String percent) {
    return 'JIMAT $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/minggu';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/bulan';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/tahun';
  }

  @override
  String get paywallMonthly => 'Bulanan';

  @override
  String get paywallWeekly => 'Mingguan';

  @override
  String get paywallFreeTrial => '3 hari percuma';

  @override
  String get paywallLoadError =>
      'Tidak dapat memuatkan pilihan pembelian, cuba lagi';

  @override
  String get paywallCtaAlt => 'Teruskan';

  @override
  String get paywallTrialDisclaimer =>
      '3 hari percuma · kemudian diperbaharui automatik · batal bila-bila masa';

  @override
  String get paywallYearlyDisclaimer =>
      'Diperbaharui automatik setiap tahun · batal bila-bila masa';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '$days hari percuma, kemudian $price/minggu · batal bila-bila masa';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '$days hari percuma, kemudian $price/bulan · batal bila-bila masa';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '$days hari percuma, kemudian $price/tahun · batal bila-bila masa';
  }

  @override
  String get paywallRenewsWeekly =>
      'Diperbaharui automatik setiap minggu · batal bila-bila masa';

  @override
  String get paywallRenewsMonthly =>
      'Diperbaharui automatik setiap bulan · batal bila-bila masa';

  @override
  String get resultCardTitle => 'Ramalan tinggi dewasa anda';

  @override
  String resultRange(String min, String max) {
    return 'Julat berkemungkinan: $min hingga $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'Lebih tinggi daripada $percent% orang sebaya anda';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'Anggaran baki pertumbuhan: $amount';
  }

  @override
  String get resultFootnote =>
      'Anggaran berdasarkan tinggi ibu bapa anda dan data carta pertumbuhan. Bukan nasihat perubatan.';

  @override
  String get postureCheckTitle => 'Semakan postur pantas';

  @override
  String get postureCheckIntro =>
      'Berdiri dengan tumit, pinggul dan bilah bahu rapat ke dinding, kemudian jawab tiga soalan. Skor anda datang daripada jawapan anda; foto disimpan untuk perbandingan sebelum dan selepas.';

  @override
  String get postureQHead =>
      'Adakah belakang kepala anda menyentuh dinding tanpa mengangkat dagu?';

  @override
  String get postureQHeadA1 => 'Ya, dengan mudah';

  @override
  String get postureQHeadA2 => 'Hanya jika saya tolak ke belakang';

  @override
  String get postureQHeadA3 => 'Tidak, ada ruang';

  @override
  String get postureQShoulders =>
      'Dalam foto sisi anda, di mana bahu anda berbanding telinga?';

  @override
  String get postureQShouldersA1 => 'Selari dengan telinga';

  @override
  String get postureQShouldersA2 => 'Sedikit ke depan';

  @override
  String get postureQShouldersA3 => 'Jelas membongkok ke depan';

  @override
  String get postureQLowerBack =>
      'Selitkan tangan di belakang pinggang anda. Berapa banyak ruang yang ada?';

  @override
  String get postureQLowerBackA1 => 'Cukup-cukup untuk tapak tangan';

  @override
  String get postureQLowerBackA2 => 'Langsung tiada ruang';

  @override
  String get postureQLowerBackA3 => 'Muat satu genggaman';

  @override
  String get postureCheckSave => 'Lihat skor saya';

  @override
  String get postureCheckNote => 'Semakan sendiri, bukan penilaian perubatan.';

  @override
  String get paywallTester => 'Penguji';

  @override
  String get introTag1 => 'RAMALAN';

  @override
  String get introTag2 => 'PERTUMBUHAN';

  @override
  String get introTag3 => 'PENJEJAKAN';

  @override
  String get introTag4 => 'GAMIFIKASI';

  @override
  String get introTag5 => 'KOMUNITI';

  @override
  String get introTitle1 => 'Temui potensi\ntinggi anda';

  @override
  String get introSubtitle1 =>
      'Biar kami kira potensi penuh anda\nberdasarkan genetik, umur dan gaya hidup.';

  @override
  String get introTitle2 => 'Selangkah lebih tinggi\nsetiap hari';

  @override
  String get introSubtitle2 =>
      'Tingkatkan potensi anda dengan pelan\nsenaman dan pemakanan peribadi.';

  @override
  String get introTitle3 => 'Jejak setiap\nsentimeter';

  @override
  String get introSubtitle3 =>
      'Lihat kemajuan sebenar anda\nberkembang dengan ukuran bulanan.';

  @override
  String get introTitle4 => 'Naik tahap,\nraih ganjaran';

  @override
  String get introSubtitle4 =>
      'Lengkapkan program 70 hari,\nkumpul XP dan buka tahap baharu.';

  @override
  String get introTitle5 => 'Ribuan sudah\nbertambah tinggi';

  @override
  String get introSubtitle5 =>
      'Sertai komuniti pengguna\nyang telah capai matlamat mereka.';

  @override
  String get criticalWindow => 'TEMPOH KRITIKAL';

  @override
  String get heightPotentialFading => 'Fakta tentang';

  @override
  String get fadingAway => 'potensi tinggi anda..';

  @override
  String get painHookDesc =>
      'Setiap hari berlalu, sentimeter hilang selamanya tanpa tabiat yang betul. Tapi ini masih boleh diubah.';

  @override
  String get painGeneticTitle => 'Genetik bukan segalanya';

  @override
  String get painGeneticDesc =>
      'Genetik menentukan 60%, tapi apa yang anda lakukan menentukan 40% lagi. BeTaller hadir untuk 40% itu.';

  @override
  String get painGeneticTag => 'Analisis';

  @override
  String get painSleepTitle => 'Optimumkan rutin tidur anda';

  @override
  String get painSleepDesc =>
      'Tidur yang cukup setiap malam boleh meningkatkan penghasilan hormon pertumbuhan sebanyak 70%. BeTaller jejak tidur secara automatik, anda cuma perlu tidur.';

  @override
  String get painSleepTag => 'Penjejakan';

  @override
  String get painPostureTitle => 'Tambah sentimeter sekarang dengan postur';

  @override
  String get painPostureDesc =>
      'Postur yang betul boleh terus menambah 1.5-3 cm. Rutin postur harian BeTaller membentuknya dalam beberapa minggu.';

  @override
  String get painPostureTag => 'Postur';

  @override
  String get painExerciseTitle => 'Pelan senaman khas anda sudah sedia';

  @override
  String get painExerciseDesc =>
      'Regangan pagi, bergantung, rutin tulang belakang: BeTaller sediakan dan jadualkan semuanya untuk anda. Hanya 8-12 minit sehari.';

  @override
  String get painExerciseTag => 'Rutin';

  @override
  String get painNutritionTitle =>
      'Pemakanan anda terus mempengaruhi pertumbuhan';

  @override
  String get painNutritionDesc =>
      'Protein, kalsium, vitamin D: BeTaller ingatkan anda setiap hari nutrien apa yang perlu diambil dan bila.';

  @override
  String get painNutritionTag => 'Pemakanan';

  @override
  String get painTrackingTitle => 'Jejak pertumbuhan anda dengan mata sendiri';

  @override
  String get painTrackingDesc =>
      'Ukuran bulanan, foto kemajuan, carta pertumbuhan: lihat setiap sentimeter yang anda tambah.';

  @override
  String get painTrackingTag => 'Kemajuan';

  @override
  String get selectYourGender => 'Pilih jantina anda';

  @override
  String get onboardingPredictSubtitle =>
      'Ini akan digunakan untuk meramal potensi tinggi anda & mencipta pelan khas anda.';

  @override
  String get other => 'Lain-lain';

  @override
  String get whenWereYouBorn => 'Bila anda dilahirkan?';

  @override
  String get heightAndWeight => 'Tinggi & berat';

  @override
  String get parentsHeight => 'Tinggi ibu bapa';

  @override
  String get weeklyWorkout => 'Senaman mingguan';

  @override
  String get workoutsPerWeek => 'Senaman seminggu';

  @override
  String get whatsYourEthnicity => 'Apakah etnik anda?';

  @override
  String get whiteCaucasian => 'Kulit Putih / Kaukasia';

  @override
  String get blackAfricanAmerican => 'Kulit Hitam / Afrika Amerika';

  @override
  String get hispanicLatino => 'Hispanik / Latino';

  @override
  String get asian => 'Asia';

  @override
  String get middleEasternIndigenous => 'Timur Tengah / Orang Asal';

  @override
  String get dontWantToAnswer => 'Saya tidak mahu menjawab';

  @override
  String get footSizeLabel => 'Saiz kaki';

  @override
  String get selectYourSize => 'Pilih saiz anda';

  @override
  String get whatsYourDreamHeight => 'Berapa tinggi impian anda?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Berdasarkan maklumat anda, kami akan kira kemungkinan mencapai tinggi ini.';

  @override
  String get dreamHeightLabel => 'Tinggi impian';

  @override
  String get sleepQuestion => 'Berapa jam anda\ntidur setiap malam?';

  @override
  String get thousandsSucceeded => 'Ribuan\nBerjaya';

  @override
  String get youCanToo => 'Anda juga boleh';

  @override
  String get yearsOld => 'tahun';

  @override
  String get verifiedLabel => 'Disahkan';

  @override
  String get scientificData => 'DATA SAINTIFIK';

  @override
  String get longTermResults => 'BeTaller memberi\nhasil jangka panjang';

  @override
  String get longTermResultsSubtitle =>
      'Ramai orang tidak mencapai tinggi maksimum mereka kerana tabiat buruk.';

  @override
  String get yourFinalHeight => 'Tinggi akhir anda';

  @override
  String get badHabitsLegend => 'Tabiat buruk';

  @override
  String get optimizedLegend => 'Dioptimumkan';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'Tinggi boleh diubah\ndengan tabiat';

  @override
  String get chartFact2Pct => '9-10j';

  @override
  String get chartFact2Desc => 'Tidur ideal meningkatkan\nhormon pertumbuhan';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Boleh ditambah dengan\npostur yang lebih baik';

  @override
  String get didYouKnow => 'Tahukah anda?';

  @override
  String get didYouKnowFact1 => 'Tabiat harian mempengaruhi 30% tinggi anda';

  @override
  String get didYouKnowFact2 =>
      'Tekanan tulang belakang mencuri 1.5-3 cm tinggi';

  @override
  String get didYouKnowFact3 => 'Kurang tidur mengurangkan HGH sebanyak 70%';

  @override
  String get transformJourneyBegins => 'Perjalanan Transformasi\nAnda Bermula';

  @override
  String get transformJourneySubtitle =>
      'Program menyeluruh yang direka untuk menyokong\npertumbuhan sihat anda, langkah demi langkah.';

  @override
  String get week1Label => '1M';

  @override
  String get week1Title => 'Minggu 1';

  @override
  String get week1Desc =>
      'Penjajaran tulang belakang bertambah baik, postur makin elok';

  @override
  String get month1Label => '1B';

  @override
  String get month1Title => 'Bulan 1';

  @override
  String get month1Desc =>
      'Sentimeter pertama kelihatan, kualiti tidur bertambah baik';

  @override
  String get month3Label => '3B';

  @override
  String get month3Title => 'Bulan 3';

  @override
  String get month3Desc => 'Purata pertambahan +1.5–2.5 cm, perkembangan otot';

  @override
  String get month6Label => '6B';

  @override
  String get month6Title => 'Bulan 6';

  @override
  String get month6Desc =>
      'Capai potensi maksimum, hidup dengan tinggi baharu anda';

  @override
  String get reachYourGoal => 'Capai Matlamat Anda';

  @override
  String get journeyBullet1 => 'Buka potensi maksimum anda';

  @override
  String get journeyBullet2 => 'Mula hidup dengan tinggi baharu anda';

  @override
  String get journeyBullet3 => 'Tulis kisah kejayaan anda';

  @override
  String get unlockButton => 'Buka Semua';

  @override
  String get dreamHeightOdds => 'Peluang tinggi\nimpian';

  @override
  String get growthCompleteLabel => 'Pertumbuhan\nselesai';

  @override
  String get tallerThanPct => 'Lebih tinggi daripada 76.7% orang sebaya';

  @override
  String get levelNovice => 'Baharu';

  @override
  String get levelBuilder => 'Pembina';

  @override
  String get levelGrinder => 'Pejuang Gigih';

  @override
  String get levelWarrior => 'Pahlawan';

  @override
  String get levelGodTier => 'Tahap Dewa';

  @override
  String get levelDesc0 => 'Bina asas anda';

  @override
  String get levelDesc1 => 'Percepat pertumbuhan';

  @override
  String get levelDesc2 => 'Tingkatkan latihan';

  @override
  String get levelDesc3 => 'Uji had anda';

  @override
  String get levelDesc4 => 'Tiada usaha, tiada hasil';

  @override
  String get levelDesc5 => 'Minda juara';

  @override
  String get levelDesc6 => 'Prestasi elit';

  @override
  String get levelDesc7 => 'Kuasai badan anda';

  @override
  String get levelDesc8 => 'Disiplin lagenda';

  @override
  String get levelDesc9 => 'Potensi maksimum';

  @override
  String levelLabel(int level) {
    return 'TAHAP $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari lagi',
      one: '$days hari lagi',
    );
    return '$_temp0 dalam program anda';
  }

  @override
  String get tapLabel => 'KETIK';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'Hari';

  @override
  String get legendShort => 'Rendah';

  @override
  String get legendBelowAvg => 'Bawah purata';

  @override
  String get legendAverage => 'Purata';

  @override
  String get legendTall => 'Tinggi';

  @override
  String get legendVeryTall => 'Sangat tinggi';

  @override
  String get pctBottom5 => '5% terbawah';

  @override
  String get pctBottom25 => '25% terbawah';

  @override
  String get pctMedian => 'Median';

  @override
  String get pctTop25 => '25% teratas';

  @override
  String get pctTop5 => '5% teratas';

  @override
  String get fallingBehind => 'Ketinggalan';

  @override
  String readTimeMinutes(int minutes) {
    return 'Bacaan $minutes min';
  }

  @override
  String get inThisArticle => 'Dalam artikel ini';

  @override
  String get nextArticle => 'Artikel seterusnya';

  @override
  String get purchaseUnavailable =>
      'Pembelian tidak dapat diselesaikan. Sila cuba lagi.';

  @override
  String get viewPlan => 'Lihat Pelan';

  @override
  String get viewPlanSubtitle => 'Lihat butiran langganan anda';

  @override
  String predictionConfidenceHint(String percent) {
    return 'Menambah ukuran tinggi menaikkan ramalan ke $percent%';
  }

  @override
  String get paywallSlideHomeTitle => 'Hari anda, satu skrin';

  @override
  String get paywallSlideHomeCaption =>
      'Rutin, air, tidur: tiga cincin untuk dilengkapkan.';

  @override
  String get paywallSlideProgressTitle => 'Lihat setiap sentimeter';

  @override
  String get paywallSlideProgressCaption =>
      'Setiap ukuran terus masuk ke lengkung.';

  @override
  String get paywallSlideAnalysisTitle => 'Lima metrik, satu bentuk';

  @override
  String get paywallSlideAnalysisCaption =>
      'Radar menunjukkan titik paling lemah anda.';

  @override
  String get paywallSlidePotentialTitle => 'Kenali potensi anda';

  @override
  String get paywallSlidePotentialCaption =>
      'Lihat kedudukan anda dalam kalangan rakan sebaya.';

  @override
  String get paywallSlideDisciplineTitle => 'Kekalkan rentetan';

  @override
  String get paywallSlideDisciplineCaption =>
      'Setiap hari menaikkan tahap anda.';

  @override
  String get paywallSlideRemindersTitle => 'Diingatkan pada masa yang tepat';

  @override
  String get paywallSlideRemindersCaption =>
      'Tetapkan waktu anda, aplikasi urus selebihnya.';

  @override
  String get paywallSlidePostureTitle => 'Betulkan postur anda';

  @override
  String get paywallSlidePostureCaption =>
      'Satu foto sisi, semakan sendiri yang pantas, rutin yang jelas.';

  @override
  String paywallTrialHeadline(String days) {
    return '$days HARI PERCUMA';
  }

  @override
  String paywallTrialThen(String price) {
    return 'Kemudian $price · batal bila-bila masa';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / tahun · batal bila-bila masa';
  }

  @override
  String get obBedtimeTitle => 'Pukul berapa anda biasanya tidur?';

  @override
  String get obBedtimeSubtitle =>
      'Peringatan tidur anda akan ditetapkan sekitar waktu ini.';

  @override
  String get obWorkoutTimeTitle => 'Pukul berapa anda bersenam?';

  @override
  String get obWorkoutTimeSubtitle =>
      'Supaya peringatan latihan anda tiba tepat pada masanya.';

  @override
  String get obMealsTitle => 'Berapa kali makan sehari?';

  @override
  String get obMealsSubtitle =>
      'Ketik waktu untuk sesuaikan dengan rutin anda.';

  @override
  String obMealsCount(String count) {
    return '$count kali makan';
  }

  @override
  String obMealLabel(String n) {
    return 'Makan $n';
  }

  @override
  String get obProteinTitle => 'Berapa gram protein sehari?';

  @override
  String get obProteinSubtitle =>
      'Anggaran kasar sudah cukup. Kami bina pelan anda berdasarkannya.';

  @override
  String get obCaloriesTitle => 'Berapa kalori sehari, secara purata?';

  @override
  String get obCaloriesSubtitle =>
      'Anggaran pun boleh; kita boleh perhalusi bersama nanti.';

  @override
  String get obNotSure => 'Saya tidak pasti';

  @override
  String get silNow => 'SEKARANG';

  @override
  String get silPotential => 'POTENSI';

  @override
  String get chartMeasured => 'Ukuran anda';

  @override
  String chartPotential(String height) {
    return 'Potensi $height';
  }

  @override
  String chartDream(String height) {
    return 'Matlamat anda $height';
  }

  @override
  String get targetsTitle => 'Hari ini, untuk anda';

  @override
  String get targetsSubtitle => 'Dikira daripada umur, berat dan latihan anda.';

  @override
  String get targetProtein => 'Protein';

  @override
  String get targetCalcium => 'Kalsium';

  @override
  String get targetVitaminD => 'Vitamin D';

  @override
  String get targetWater => 'Air';

  @override
  String get targetSleep => 'Tidur';

  @override
  String get targetMove => 'Latihan';

  @override
  String targetPerMeal(String g) {
    return '$g g setiap hidangan';
  }

  @override
  String get unitHours => 'j';

  @override
  String get unitMinutes => 'min';

  @override
  String get planStrength => 'Kekuatan';

  @override
  String get planJump => 'Lompat & pecut';

  @override
  String get planMobility => 'Regangan';

  @override
  String get planSport => 'Sukan';

  @override
  String get planPosture => 'Postur';

  @override
  String get planRest => 'Rehat';

  @override
  String planWeekTitle(int days) {
    return 'Minggu anda: $days hari latihan';
  }

  @override
  String get planPreviewTitle => 'Pelan anda sudah sedia';

  @override
  String planPreviewTraining(int days) {
    return '$days hari latihan seminggu, dibina untuk pertumbuhan';
  }

  @override
  String planPreviewProtein(int grams) {
    return '$grams g protein sehari, dibahagi ikut waktu makan anda';
  }

  @override
  String planPreviewSleep(String hours) {
    return '$hours jam tidur, dengan peringatan waktu tidur';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'Hari ini: $plan · $minutes min';
  }

  @override
  String get nRestTitle => 'Hari rehat hari ini';

  @override
  String get nRestBody =>
      'Sepuluh minit regangan sudah cukup. Pemulihan juga sebahagian daripada pelan.';

  @override
  String nProteinTitle(int grams) {
    return 'Sasaran protein hari ini: $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return 'Kira-kira $grams g setiap hidangan: telur, yogurt, ayam, kacang dal.';
  }

  @override
  String nWaterTitle(String liters) {
    return 'Sasaran air: $liters';
  }

  @override
  String get nWaterBody =>
      'Segelas sekarang membuatkan anda kekal di landasan hari ini.';

  @override
  String get nSleepTitle => 'Masa untuk bertenang';

  @override
  String nSleepBody(String hours) {
    return 'Sasaran anda $hours jam. Tutup skrin, malapkan lampu.';
  }

  @override
  String nMeasureBody(String potential) {
    return 'Potensi anda: $potential. Ukur pada waktu pagi dan lihat carta anda bergerak.';
  }

  @override
  String get nTrialDay1Title => 'Pelan anda sedang menanti';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'Hari ini: $plan, $minutes min. Catat tinggi anda supaya carta anda bermula.';
  }

  @override
  String get nTrialEndTitle => 'Percubaan percuma anda tamat esok';

  @override
  String nTrialEndBody(String price) {
    return 'Selepas itu ia diteruskan pada $price. Pelan dan kemajuan anda tetap disimpan walau apa pun.';
  }

  @override
  String get trophyContinue => 'Teruskan';

  @override
  String get guideSteps => 'Langkah demi langkah';

  @override
  String get guideMistakes => 'Kesilapan biasa';

  @override
  String get guideTip => 'Tip';

  @override
  String get homeHeroTitle => 'Tinggi dan potensi anda';

  @override
  String homeHeroGap(String cm) {
    return '$cm lagi menanti anda';
  }

  @override
  String get anSubtitle =>
      'Skor anda, apa yang menggerakkannya, dan hala tuju anda';

  @override
  String get anScoreLabel => 'Skor BeTaller';

  @override
  String get anTierStarting => 'Bermula';

  @override
  String get anTierBuilding => 'Membina';

  @override
  String get anTierRising => 'Meningkat';

  @override
  String get anTierStrong => 'Kuat';

  @override
  String get anTierPeak => 'Puncak';

  @override
  String anTrendUp(int n) {
    return '+$n berbanding minggu lepas';
  }

  @override
  String anTrendDown(int n) {
    return '-$n berbanding minggu lepas';
  }

  @override
  String get anTrendFlat => 'Sama seperti minggu lepas';

  @override
  String get anTrendFirst => 'Trend mingguan anda bermula minggu depan';

  @override
  String anNextTier(int n, String tier) {
    return '$n mata lagi ke $tier';
  }

  @override
  String get anTopTier => 'Tahap teratas. Kekalkannya';

  @override
  String anCoverage(int n, int total) {
    return 'Berdasarkan $n daripada $total isyarat';
  }

  @override
  String get anNoScoreTitle => 'Data belum mencukupi';

  @override
  String get anNoScoreBody =>
      'Catat tidur, sedikit air atau satu senaman hari ini dan skor pertama anda akan muncul.';

  @override
  String get anFastestWin => 'Kemenangan terpantas';

  @override
  String get anBreakdownTitle => 'Apa yang membina skor anda';

  @override
  String get anBreakdownHint =>
      'Setiap isyarat diberi skor 0 hingga 100 daripada data anda sendiri. Peratusan menunjukkan berapa banyak ia dikira.';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => 'Belum ada data';

  @override
  String get anNotCounted => 'Tidak dikira';

  @override
  String get anFTraining => 'Latihan';

  @override
  String get anFConsistency => 'Konsistensi';

  @override
  String get anFSleep => 'Tidur';

  @override
  String get anFHydration => 'Hidrasi';

  @override
  String get anFNutrition => 'Pemakanan';

  @override
  String get anFPosture => 'Postur';

  @override
  String get anFMeasuring => 'Pengukuran';

  @override
  String get anFGrowth => 'Kadar pertumbuhan';

  @override
  String get anFHeadroom => 'Ruang untuk tumbuh';

  @override
  String anBTraining(int done, int planned) {
    return '$done daripada $planned hari latihan dirancang dalam 7 hari lepas';
  }

  @override
  String get anBTrainingNone =>
      'Mengira hari anda berlatih berbanding pelan mingguan.';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak hari',
      one: '$streak hari',
    );
    return 'Rentetan $_temp0, $active daripada $days hari dengan separuh pelan siap';
  }

  @override
  String get anBConsistencyNone =>
      'Mengira rentetan anda dan hari anda siapkan sekurang-kurangnya separuh pelan.';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days malam',
      one: '$days malam',
    );
    return 'Purata $hours j semalam, sasaran $target j, $_temp0 dicatat';
  }

  @override
  String get anBSleepNone => 'Tiada tidur dicatat dalam 7 hari lepas.';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return 'Purata $litres sehari, sasaran $target, $_temp0 dicatat';
  }

  @override
  String get anBHydrationNone => 'Tiada air dicatat dalam 7 hari lepas.';

  @override
  String anBNutrition(int done, int planned) {
    return '$done daripada $planned tabiat pemakanan siap dalam 7 hari lepas';
  }

  @override
  String get anBNutritionNone =>
      'Mengira tabiat protein, kalsium, zink dan vitamin D dalam pelan anda.';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return 'Semakan dinding $raw/90, $_temp0 lalu';
  }

  @override
  String anBPostureToday(int raw) {
    return 'Semakan dinding $raw/90, hari ini';
  }

  @override
  String get anBPostureNone => 'Belum ada semakan postur.';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return 'Kali terakhir diukur $_temp0 lalu';
  }

  @override
  String get anBMeasuringToday => 'Diukur hari ini';

  @override
  String get anBMeasuringNone => 'Belum ada ukuran.';

  @override
  String anBGrowth(String v, String e) {
    return '$v setahun, biasa pada umur anda $e';
  }

  @override
  String get anBGrowthNone =>
      'Perlu dua ukuran dengan jarak sekurang-kurangnya 30 hari.';

  @override
  String get anBGrowthAdult =>
      'Plat pertumbuhan biasanya tertutup sekitar umur 21, jadi kadar pertumbuhan tidak dikira untuk anda.';

  @override
  String anBHeadroom(String cm) {
    return '$cm antara hari ini dan potensi anda';
  }

  @override
  String get anATraining => 'Mulakan latihan hari ini';

  @override
  String get anAConsistency => 'Siapkan separuh pelan hari ini';

  @override
  String get anASleepLog => 'Catat tidur malam tadi';

  @override
  String anASleep(String target) {
    return 'Tidur $target j malam ini';
  }

  @override
  String get anAHydrationLog => 'Catat segelas air';

  @override
  String anAHydration(String left) {
    return 'Minum $left lagi hari ini';
  }

  @override
  String get anAHydrationDone => 'Sasaran dicapai hari ini. Ulang lagi esok';

  @override
  String get anANutrition => 'Tandakan tabiat pemakanan hari ini';

  @override
  String get anAPostureFirst => 'Buat semakan postur 1 minit';

  @override
  String get anAPostureRedo => 'Ulang semakan postur anda';

  @override
  String get anAPostureKeep => 'Teruskan rutin postur harian';

  @override
  String get anAMeasure => 'Ukur tinggi anda sekarang';

  @override
  String get anAMeasureKeep => 'Ukur lagi minggu depan';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return 'Ukur lagi dalam $_temp0';
  }

  @override
  String get anAGrowth => 'Ukur setiap 2 minggu untuk menjejaknya';

  @override
  String get anAHeadroom => 'Lihat potensi anda';

  @override
  String get anPotentialTitle => 'Potensi anda';

  @override
  String get anPotentialLabel => 'Ramalan tinggi dewasa';

  @override
  String anPotentialToGo(String cm) {
    return '+$cm lagi';
  }

  @override
  String get anPotentialReached => 'Anda sudah capai ramalan tinggi anda';

  @override
  String get anPotentialNote =>
      'Nombor yang sama di seluruh aplikasi. Ia hanya akan naik.';

  @override
  String anDreamLine(String h) {
    return 'Matlamat anda: $h';
  }

  @override
  String get anSourcesTitle => 'Dari mana datangnya sentimeter';

  @override
  String get anSourcesGenes => 'Genetik dan umur';

  @override
  String get anSourcesHabits => 'Tidur, makanan, latihan';

  @override
  String get anSourcesPosture => 'Postur';

  @override
  String get anPctTitle => 'Tinggi mengikut umur anda';

  @override
  String anPctValue(int p) {
    return 'Lebih tinggi daripada $p% orang sebaya anda';
  }

  @override
  String get anPctBasis =>
      'Carta pertumbuhan CDC AS, umur dan jantina yang sama';

  @override
  String get anPctMore => 'Perbandingan penuh';

  @override
  String get anNeedsBasis => 'Dikira daripada umur, berat dan latihan anda';

  @override
  String get anCalcium => 'Kalsium';

  @override
  String get anVitaminD => 'Vitamin D';

  @override
  String get anMovement => 'Pergerakan';

  @override
  String get anUnitMin => 'min';

  @override
  String get anUnitHours => 'j';

  @override
  String get anPerDay => 'sehari';

  @override
  String get anPerNight => 'semalam';

  @override
  String get anUnlockScoreTitle => 'Skor BeTaller penuh anda';

  @override
  String get anUnlockScoreBody =>
      'Skor, kesemua sembilan isyarat di sebaliknya dan langkah seterusnya.';

  @override
  String get anUnlockSourcesTitle =>
      'Lihat dari mana datangnya sentimeter anda';

  @override
  String get anUnlockNeedsTitle => 'Keperluan harian anda, dikira untuk anda';

  @override
  String get anUnlockCta => 'Buka';

  @override
  String get anFlowResultTitle => 'Disimpan ke carta anda';

  @override
  String get anFlowResultBody =>
      'Tinggi lepas anda kini berada pada lengkung yang sama dengan ukuran dan potensi anda.';

  @override
  String get anFlowOpenAnalysis => 'Buka analisis anda';

  @override
  String anTopPct(int p) {
    return '$p% TERATAS';
  }

  @override
  String get anNeedsTitle => 'Keperluan harian anda';

  @override
  String get pgUnlockPro => 'Buka dengan Pro';

  @override
  String get pgPhotosLockedTitle => 'Lihat transformasi anda';

  @override
  String get pgPhotosLockedBody =>
      'Simpan foto dengan tinggi anda setiap dua minggu dan bandingkan mana-mana dua dengan peluncur.';

  @override
  String get pgTransformationTitle => 'Transformasi anda';

  @override
  String get pgHeightChange => 'perubahan tinggi';

  @override
  String get pgDaysApart => 'hari berselang';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return '$delta antara dua foto ini, diambil $_temp0 berselang.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return 'Tinggi sama, $_temp0 berselang. Postur dan bentuk badan berubah dulu, tinggi menyusul dalam beberapa bulan.';
  }

  @override
  String get pgModeSlider => 'Peluncur';

  @override
  String get pgModeSideBySide => 'Sebelah-menyebelah';

  @override
  String get pgDragToReveal => 'Seret untuk banding';

  @override
  String get pgOnePhotoTitle => 'Foto sebelum anda sudah disimpan';

  @override
  String pgOnePhotoBody(String date) {
    return 'Ambil foto seterusnya pada $date dengan pose sama untuk melihat perbandingan pertama anda.';
  }

  @override
  String get pgEmptyTitle => 'Mulakan transformasi anda';

  @override
  String get pgEmptyBody =>
      'Satu foto setiap dua minggu, pose sama, tempat sama, dengan tinggi anda. Dalam beberapa bulan anda boleh luncur antara hari 1 dan hari ini.';

  @override
  String get pgTakeFirstPhoto => 'Ambil foto pertama anda';

  @override
  String get pgPhotoDueNow => 'Masa untuk foto baharu';

  @override
  String pgNextPhotoOn(String date) {
    return 'Foto seterusnya $date';
  }

  @override
  String pgDayN(int n) {
    return 'Hari $n';
  }

  @override
  String get pgNewPhoto => 'Foto baharu';

  @override
  String get pgGuideTitle => 'Pose sama, setiap kali';

  @override
  String get pgGuideSubtitle =>
      'Foto hanya boleh dibandingkan dengan baik jika diambil dengan cara yang sama.';

  @override
  String get pgGuideGhost =>
      'Foto terakhir anda ditunjukkan samar-samar. Selaraskan diri anda dengannya.';

  @override
  String get pgGuideStep1 => 'Berdiri 2 m jauh, telefon pada paras dada';

  @override
  String get pgGuideStep2 => 'Hadap kamera, kaki rapat, lengan santai';

  @override
  String get pgGuideStep3 => 'Tempat sama, cahaya sama, pakaian yang muat';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => 'paras dada';

  @override
  String get pgTakePhoto => 'Ambil foto';

  @override
  String get pgFromGallery => 'Pilih dari galeri';

  @override
  String get pgChoosePhoto => 'Pilih foto';

  @override
  String get pgPostureTitle => 'Semakan postur';

  @override
  String get pgPostureLockedTitle => 'Cari titik lemah anda';

  @override
  String get pgPostureLockedBody =>
      'Nilai kepala, bahu dan pinggang anda, dapatkan dua senaman untuk setiap satu, dan lihat skor anda minggu demi minggu.';

  @override
  String get pgAreaHead => 'Kepala';

  @override
  String get pgAreaShoulders => 'Bahu';

  @override
  String get pgAreaLowerBack => 'Pinggang';

  @override
  String get pgHeadMeaning0 =>
      'Kepala anda tepat di atas bahu. Kekalkan dengan regangan ringkas setiap hari.';

  @override
  String get pgHeadMeaning1 =>
      'Kepala anda terjulur ke depan apabila santai. Sangat biasa jika lama guna telefon, dan cepat diperbaiki.';

  @override
  String get pgHeadMeaning2 =>
      'Kepala anda berada di depan bahu. Betulkan ini dulu: ia membuat anda nampak lebih rendah dalam setiap foto.';

  @override
  String get pgShouldersMeaning0 =>
      'Bahu selari dengan telinga. Belakang atas anda berfungsi dengan baik.';

  @override
  String get pgShouldersMeaning1 =>
      'Bahu sedikit ke depan. Dada yang tegang menariknya ke dalam; membukanya akan bawa bahu kembali.';

  @override
  String get pgShouldersMeaning2 =>
      'Bahu membongkok. Belakang atas anda melengkung ke depan, yang mengurangkan tinggi semasa anda berdiri.';

  @override
  String get pgLowerBackMeaning0 =>
      'Lengkung neutral. Pinggul dan teras anda memegang tulang belakang di tempat yang sepatutnya.';

  @override
  String get pgLowerBackMeaning1 =>
      'Pinggang rata. Regangan lanjutan dan mobiliti yang lembut mengembalikan lengkung semula jadi.';

  @override
  String get pgLowerBackMeaning2 =>
      'Lengkung yang kuat. Otot fleksor pinggul yang tegang mencondongkan pelvis ke depan; meregangkannya dan teras yang lebih kuat akan meratakannya.';

  @override
  String get pgLegacyMeaning =>
      'Disimpan oleh versi lama tanpa soalan ini. Ulang semakan untuk nasihat tentang bahagian ini.';

  @override
  String get pgHowItWorks => 'Cara semakan berfungsi';

  @override
  String get pgYourPosture => 'Postur anda';

  @override
  String pgCheckedOn(String date) {
    return 'Disemak $date';
  }

  @override
  String get pgOutOf100 => 'daripada 100';

  @override
  String get pgAllAreasGood => 'Ketiga-tiga bahagian nampak baik. Kekalkannya.';

  @override
  String pgStartWith(String area) {
    return 'Mula di sini: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta berbanding semakan lepas';
  }

  @override
  String get pgStatusGood => 'Baik';

  @override
  String get pgStatusFair => 'Boleh diperbaiki';

  @override
  String get pgStatusFix => 'Betulkan dulu';

  @override
  String get pgKeepItWith => 'Kekalkan dengan';

  @override
  String get pgFixItWith => 'Betulkan dengan';

  @override
  String get pgRetakeNow => 'Masa untuk semakan mingguan';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Semakan seterusnya dalam $n hari',
      one: 'Semakan seterusnya esok',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'Dinding sama, tiga soalan sama. Semakan mingguan menunjukkan sama ada senaman berkesan.';

  @override
  String pgRetakeBodyWait(String date) {
    return 'Buat senaman di atas sehingga $date, kemudian ulang semakan untuk lihat sama ada ia berkesan.';
  }

  @override
  String get pgRetakeCheck => 'Ulang semakan';

  @override
  String get pgRetakeAnyway => 'Ulang sekarang';

  @override
  String get pgHistoryTitle => 'Skor anda';

  @override
  String pgSinceFirst(String delta) {
    return '$delta sejak yang pertama';
  }

  @override
  String get pgHistoryOne =>
      'Ini semakan pertama anda. Ulang dalam 7 hari dan trend anda bermula di sini.';

  @override
  String get pgPostureIntroTitle => 'Setegak mana anda berdiri?';

  @override
  String get pgPostureIntroBody =>
      'Tiga soalan di dinding, kira-kira satu minit. Anda dapat skor dan dua senaman untuk membetulkan setiap titik lemah.';

  @override
  String get pgPostureStep1 =>
      'Berdiri dengan tumit, pinggul dan bilah bahu rapat ke dinding.';

  @override
  String get pgPostureStep2 =>
      'Ambil foto sisi, seluruh badan dalam bingkai, supaya boleh dilihat semula nanti.';

  @override
  String get pgPostureStep3 =>
      'Jawab tiga soalan dengan jujur. Skor anda datang daripada jawapan anda.';

  @override
  String get pgPostureStep4 => 'Ulang seminggu sekali, pada waktu yang sama.';

  @override
  String get pgStartCheck => 'Mula semakan postur';

  @override
  String pgWeekRange(String start, String end) {
    return '$start hingga $end';
  }

  @override
  String get pgGradeGreat => 'Minggu juara';

  @override
  String get pgGradeGood => 'Minggu mantap';

  @override
  String get pgGradeOk => 'Mula bergerak';

  @override
  String get pgGradeStart => 'Permulaan baharu';

  @override
  String get pgTopWeek => 'Minggu terbaik';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta berbanding minggu lepas';
  }

  @override
  String get pgDaysCompleted => 'hari dengan pelan penuh';

  @override
  String get pgDayStreak => 'hari berturut-turut';

  @override
  String pgBestDay(String day) {
    return 'Terbaik: $day';
  }

  @override
  String get pgNextWeekFocus => 'Fokus minggu depan';

  @override
  String pgFocusPlan(int n, int done) {
    return 'Siapkan seluruh pelan pada $n hari. Minggu ini anda berjaya pada $done hari.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'Muatkan $n sesi latihan. Minggu ini anda buat $done.';
  }

  @override
  String get pgFocusMeasure =>
      'Ukur tinggi anda sekali, waktu pagi, berkaki ayam, di tempat sama. Begitulah cara melihat perubahan sebenar.';

  @override
  String pgFocusKeepDay(String day) {
    return 'Semua sasaran dicapai. Sekarang jadikan $day hari penuh juga.';
  }

  @override
  String get pgFocusKeep =>
      'Semua sasaran dicapai dan setiap hari penuh. Pelan sama, rentak sama.';

  @override
  String get pgHeightThisWeek => 'Tinggi minggu ini';

  @override
  String pgHeightNow(String height) {
    return 'Sekarang $height';
  }

  @override
  String get pgNoMeasurementWeek => 'Belum ada ukuran minggu ini';

  @override
  String get pgFirstMeasurement => 'Ukuran pertama anda';

  @override
  String pgStartedAt(String height) {
    return 'Mula $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'Potensi $height';
  }

  @override
  String pgToPotential(String cm) {
    return '$cm lagi ke ramalan potensi anda.';
  }

  @override
  String get pgPotentialReached =>
      'Anda sudah capai ramalan potensi anda. Latihan postur masih boleh menambah apa yang kelihatan.';

  @override
  String get pgHabitsToday => 'Dicatat hari ini';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves gerakan · $minutes min';
  }

  @override
  String plDoneCount(int done, int total) {
    return '$done/$total selesai';
  }

  @override
  String get plStartWorkout => 'Mula latihan';

  @override
  String get plContinueWorkout => 'Teruskan latihan';

  @override
  String get plWorkoutDoneToday => 'Latihan hari ini selesai';

  @override
  String get plTraining => 'Latihan';

  @override
  String get plHabits => 'Tabiat harian';

  @override
  String get plRestDayNote =>
      'Hari santai: aliran yoga ringkas memastikan badan anda lentur untuk esok.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps kali';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds s';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds s setiap sisi';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g sepanjang waktu makan';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters sepanjang hari';
  }

  @override
  String plHabitSleep(String hours) {
    return '$hours j malam ini';
  }

  @override
  String get plYourRoutines => 'Rutin anda';

  @override
  String get plNewRoutine => 'Rutin baharu';

  @override
  String get plCustomEmpty =>
      'Bina rutin anda sendiri dan tandakan di sini setiap hari.';

  @override
  String plDeleteRoutineQ(String name) {
    return 'Padam \"$name\"?';
  }

  @override
  String get plHoldToDelete => 'Tekan lama pada rutin untuk memadamnya.';

  @override
  String plSetOf(int current, int total) {
    return 'Set $current daripada $total';
  }

  @override
  String get plRest => 'Rehat';

  @override
  String get plStartSet => 'Mula set';

  @override
  String get plSetDone => 'Set selesai';

  @override
  String get plSkipRest => 'Langkau rehat';

  @override
  String get plNextMove => 'Gerakan seterusnya';

  @override
  String get plSkipMove => 'Langkau';

  @override
  String plUpNext(String name) {
    return 'Seterusnya: $name';
  }

  @override
  String get plLastMove => 'Gerakan terakhir';

  @override
  String get plWorkoutComplete => 'Latihan selesai';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves gerakan dalam kira-kira $minutes min. Setiap sesi bermakna.';
  }

  @override
  String get plEachSide => 'Setiap sisi';

  @override
  String get plMoveDone => 'Gerakan selesai';

  @override
  String plRepsBig(int reps) {
    return '$reps kali';
  }

  @override
  String get plSessionHint =>
      'Ikut rentak anda sendiri dan ketik selesai apabila siap.';

  @override
  String plProgramDayOf(int day, int total) {
    return 'Hari $day daripada $total';
  }

  @override
  String get plTodayStep => 'Langkah hari ini';

  @override
  String get plTickToComplete =>
      'Tandakan setiap gerakan untuk melengkapkan hari ini';

  @override
  String plNextDayTomorrow(int day) {
    return 'Hari $day dibuka esok. Rehat juga sebahagian daripada pertumbuhan.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return '$_temp0 lagi ke tahap $level';
  }

  @override
  String get plProgramFinished =>
      'Kesemua 70 hari selesai. Anda telah tamatkan program.';

  @override
  String plDayCompleteToast(int day) {
    return 'Hari $day selesai';
  }

  @override
  String get plLevelWeek => 'Minggu tahap ini';

  @override
  String get plProgressionTitle => 'Bagaimana ia makin mencabar';

  @override
  String get plNow => 'Sekarang';

  @override
  String plLevelN(int n) {
    return 'Thp $n';
  }

  @override
  String get plUnlockProgram => 'Buka program 70 hari';

  @override
  String get plProgramPitch =>
      '10 tahap, satu setiap minggu. Setiap tahap menambah saat pada tahanan, ulangan pada lompatan dan satu set apabila anda sudah bersedia.';

  @override
  String plDayLocked(int day) {
    return 'Siapkan hari $day dulu';
  }

  @override
  String plCurrentDay(int day) {
    return 'Hari $day';
  }

  @override
  String get plTodaysTargets => 'Sasaran hari ini';

  @override
  String get plTargetsBasis => 'Dikira daripada umur, berat dan latihan anda';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals hidangan x $grams g';
  }

  @override
  String get plZinc => 'Zink';

  @override
  String get plMagnesium => 'Magnesium';

  @override
  String get plEnergy => 'Tenaga';

  @override
  String get plChecklist => 'Senarai semak hari ini';

  @override
  String plCheckProtein(int grams) {
    return 'Protein $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'Kalsium $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'Vitamin D $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return 'Air $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '$amount daripada hidangan yang ditanda';
  }

  @override
  String get plVitaminDNote =>
      '15 min cahaya matahari tengah hari pada lengan dan muka, atau suplemen yang dibenarkan doktor';

  @override
  String plWaterLogged(String liters) {
    return '$liters dicatat setakat ini';
  }

  @override
  String get plMealPlan => 'Pelan makan anda';

  @override
  String get plMealPlanSub =>
      'Makanan sebenar, gram sebenar, ikut sasaran anda';

  @override
  String get plSnack => 'Snek';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein g protein · $calcium mg kalsium · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return 'sasaran $grams g';
  }

  @override
  String get plMarkEaten => 'Tanda sudah makan';

  @override
  String get plEaten => 'Sudah makan';

  @override
  String get plPlanTotal => 'Jumlah hari';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'Hidangan ini memberi kira-kira $planKcal daripada $kcal kcal anda. Cukupkan bakinya dengan buah, sayur, roti atau nasi.';
  }

  @override
  String get plWeeklyMenu => 'Menu mingguan';

  @override
  String get plWeeklyMenuSub =>
      'Hidangan berbeza setiap hari, sasaran yang sama';

  @override
  String get plUnlockMenu => 'Buka menu mingguan penuh';

  @override
  String get plRecipes => 'Resipi';

  @override
  String get plRecipesSub => 'Hidangan pantas tinggi protein';

  @override
  String get plNutritionGuide => 'Panduan pemakanan';

  @override
  String get plNutritionGuideSub => 'Nutrien, makanan dan suplemen';

  @override
  String plPieces(int n) {
    return '$n biji';
  }

  @override
  String get plFoodOats => 'Oat';

  @override
  String get plFoodMilk => 'Susu';

  @override
  String get plFoodBanana => 'Pisang';

  @override
  String get plFoodWalnuts => 'Walnut';

  @override
  String get plFoodGreekYogurt => 'Yogurt Greek';

  @override
  String get plFoodYogurt => 'Yogurt';

  @override
  String get plFoodEggs => 'Telur';

  @override
  String get plFoodBread => 'Roti gandum penuh';

  @override
  String get plFoodWhiteCheese => 'Keju feta';

  @override
  String get plFoodHardCheese => 'Keju cheddar';

  @override
  String get plFoodSalad => 'Salad tomato dan timun';

  @override
  String get plFoodOrange => 'Oren';

  @override
  String get plFoodPeanutButter => 'Mentega kacang';

  @override
  String get plFoodSpinach => 'Bayam';

  @override
  String get plFoodCottageCheese => 'Keju kotej';

  @override
  String get plFoodChicken => 'Dada ayam';

  @override
  String get plFoodBulgur => 'Bulgur';

  @override
  String get plFoodAyran => 'Ayran (minuman yogurt)';

  @override
  String get plFoodTuna => 'Tuna (tin)';

  @override
  String get plFoodPasta => 'Pasta';

  @override
  String get plFoodBeef => 'Daging lembu tanpa lemak';

  @override
  String get plFoodRice => 'Nasi';

  @override
  String get plFoodChickpeas => 'Kacang kuda';

  @override
  String get plFoodSalmon => 'Salmon';

  @override
  String get plFoodBroccoli => 'Brokoli';

  @override
  String get plFoodPotato => 'Kentang';

  @override
  String get plFoodLentils => 'Kacang dal';

  @override
  String get plFoodSardines => 'Sardin';

  @override
  String get plFoodAlmonds => 'Badam';

  @override
  String get plFoodKefir => 'Kefir';

  @override
  String get plFoodPumpkinSeeds => 'Biji labu';

  @override
  String get wtCoffee => 'Kopi';

  @override
  String get wtTea => 'Teh';

  @override
  String get wtCola => 'Kola';

  @override
  String get wtEnergyDrink => 'Minuman tenaga';

  @override
  String get crCustomBadge => 'Sendiri';

  @override
  String get crNameHint => 'cth. Regangan Pagi Bertenaga';

  @override
  String get crDoseHint => 'cth. 3x10 kali atau 3x30 saat';

  @override
  String get paywallLifetime => 'Seumur Hidup';

  @override
  String paywallOnce(String price) {
    return '$price sekali bayar';
  }

  @override
  String get paywallLifetimeBadge => 'Tiada langganan';

  @override
  String get paywallLifetimeDisclaimer =>
      'Bayaran sekali · tiada langganan, tiada pembaharuan';

  @override
  String get pwSlidePotentialTitle => 'Lihat potensi anda';

  @override
  String get pwSlidePotentialCaption =>
      'Dikira daripada umur, tinggi anda dan tinggi ibu bapa anda.';

  @override
  String get pwSlideTodayTitle => 'Pelan untuk setiap hari';

  @override
  String get pwSlideTodayCaption =>
      'Latihan harian yang singkat dengan panduan video.';

  @override
  String get pwSlideProgramTitle => '70 hari, 10 tahap';

  @override
  String get pwSlideProgramCaption =>
      'Setiap minggu gerakan jadi sedikit lebih mencabar.';

  @override
  String get pwSlideNutritionTitle => 'Makan untuk tumbuh';

  @override
  String get pwSlideNutritionCaption =>
      'Sasaran harian protein, kalsium dan vitamin D yang dibuat untuk anda.';

  @override
  String get pwSlideChartTitle => 'Lihat lengkung anda naik';

  @override
  String get pwSlideChartCaption =>
      'Setiap ukuran masuk ke laluan menuju potensi anda.';

  @override
  String get pwSlideScoreTitle => 'Satu skor untuk tabiat anda';

  @override
  String get pwSlideScoreCaption => 'Lihat tabiat mana perlu dibetulkan dulu.';

  @override
  String get pwSlidePostureTitle => 'Berdiri lebih tegak hari ini';

  @override
  String get pwSlidePostureCaption =>
      'Semakan postur pantas, dan gerakan untuk membetulkannya.';

  @override
  String get pwExample => 'Contoh';

  @override
  String pwYouLine(String now, String potential) {
    return 'Anda: $now → potensi $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return 'Contoh: $now → potensi $potential';
  }

  @override
  String get tv3NewEyebrow => 'Apa yang baharu';

  @override
  String get tv3NewTitle => 'BeTaller dapat kemas kini besar';

  @override
  String get tv3NewDesc =>
      'Pelan baharu, program baharu, rupa baharu. Ini yang baharu.';

  @override
  String get tv3PotentialTitle => 'Inilah potensi anda';

  @override
  String get tv3PotentialDesc =>
      'Tinggi anda hari ini di sebelah tahap yang boleh anda capai. Pelan ini merapatkan jurangnya.';

  @override
  String get tv3TodayTitle => 'Pelan hari ini';

  @override
  String tv3TodayDesc(String button) {
    return 'Latihan singkat yang dibuat untuk hari ini. Ketik $button dan ikut sekali.';
  }

  @override
  String get tv3ProgramTitle => '70 hari Disiplin';

  @override
  String get tv3ProgramDesc =>
      'Satu langkah sehari merentasi 10 tahap. Setiap hari dibina atas hari sebelumnya.';

  @override
  String get tv3NutritionTitle => 'Sasaran harian anda';

  @override
  String get tv3NutritionDesc =>
      'Protein, kalsium, vitamin D dan air, dikira untuk badan anda.';

  @override
  String get tv3ChartTitle => 'Lihat lengkung anda';

  @override
  String get tv3ChartDesc =>
      'Ukur setiap satu atau dua minggu dan lihat garisan anda naik ke arah potensi anda.';

  @override
  String get tv3ScoreTitle => 'Skor BeTaller Anda';

  @override
  String get tv3ScoreDesc =>
      'Satu nombor untuk prestasi anda. Naikkan bahagian paling lemah dulu.';

  @override
  String get tv3Next => 'Seterusnya';

  @override
  String get tv3ShowMe => 'Tunjukkan';

  @override
  String get tv3Done => 'Jom';

  @override
  String get obWhyTitle => 'Kenapa anda mahu lebih tinggi?';

  @override
  String get obWhySubtitle =>
      'Pilih semua yang berkaitan. Pelan anda bermula dengan sebab anda.';

  @override
  String get obWhyConfidence => 'Rasa lebih yakin';

  @override
  String get obWhyImpression => 'Tanggapan pertama yang lebih kuat';

  @override
  String get obWhySports => 'Lebih baik dalam sukan';

  @override
  String get obWhyClothes => 'Pakaian lebih padan';

  @override
  String get obWhyPhotos => 'Nampak lebih baik dalam foto';

  @override
  String get obWhyPotential => 'Cuma mahu tahu potensi saya';

  @override
  String get obTriedTitle => 'Pernah cuba aplikasi tinggi lain?';

  @override
  String get obTriedSubtitle =>
      'Tiada jawapan salah. Ini bantu kami tunjukkan apa yang berbeza di sini.';

  @override
  String get obTriedStopped => 'Ya, tapi saya berhenti';

  @override
  String get obTriedStill => 'Ya, saya masih guna satu';

  @override
  String get obTriedFirst => 'Tidak, ini yang pertama';

  @override
  String get obTriedStoppedTitle =>
      'Nombor sahaja takkan buat anda terus bersemangat';

  @override
  String get obTriedStoppedBody =>
      'Kebanyakan aplikasi cuma beri nombor. BeTaller jadikannya pelan harian yang boleh anda tandakan, dengan peringatan pada waktu anda sendiri.';

  @override
  String get obTriedStillTitle => 'Kekalkan apa yang berkesan untuk anda';

  @override
  String get obTriedStillBody =>
      'BeTaller menambah bahagian harian: pelan daripada jawapan anda sendiri yang boleh anda tandakan, selangkah demi selangkah.';

  @override
  String get obTriedFirstTitle => 'Tempat yang baik untuk bermula';

  @override
  String get obTriedFirstBody =>
      'Di sini anda bukan sekadar dapat nombor. BeTaller jadikan jawapan anda pelan harian yang boleh anda tandakan.';

  @override
  String get obTriedCardTitle => 'Apa yang anda tandakan setiap hari';

  @override
  String get obTriedItem1 => 'Latihan singkat yang dipilih untuk minggu anda';

  @override
  String get obTriedItem2 => 'Sasaran protein anda';

  @override
  String get obTriedItem3 => 'Tutup lampu tepat pada masanya';

  @override
  String get obBlockTitle => 'Apa yang menghalang anda?';

  @override
  String get obBlockSubtitle =>
      'Pilih semua yang berkaitan. Pelan anda akan menyesuaikannya.';

  @override
  String get obBlockForget => 'Saya terlupa';

  @override
  String get obBlockTime => 'Tak cukup masa';

  @override
  String get obBlockExercises => 'Saya tak tahu senaman yang mana';

  @override
  String get obBlockMotivation => 'Saya hilang motivasi';

  @override
  String get obBlockBedtime => 'Saya tidur lewat';

  @override
  String get obBlockMeals => 'Saya selalu tinggal makan';

  @override
  String get obFirstTitle => 'Apa perkara pertama anda buat bila lebih tinggi?';

  @override
  String get obFirstSubtitle => 'Bayangkannya. Itulah matlamat anda.';

  @override
  String get obFirstWardrobe => 'Tukar gaya pakaian';

  @override
  String get obFirstMuscle => 'Bina otot';

  @override
  String get obFirstPhotos => 'Kongsi lebih banyak foto';

  @override
  String get obFirstTeam => 'Cuba masuk pasukan';

  @override
  String get obFirstFeelGood => 'Tiada apa istimewa, cuma rasa seronok';

  @override
  String get obBuiltChip => 'Dibina untuk anda';

  @override
  String get obBuiltTitle => 'Pelan anda, dibina mengikut anda';

  @override
  String get obBuiltReason => 'Sebab anda';

  @override
  String get obBuiltGoal => 'Matlamat';

  @override
  String get obBuiltWhen => 'Bila anda capai';

  @override
  String get obBuiltBlockers => 'Penghalang anda, sudah diatasi';

  @override
  String get obFixForget => 'Peringatan pada waktu yang anda pilih';

  @override
  String get obFixTime => 'Sesi singkat, kebanyakannya sekitar 15 minit';

  @override
  String get obFixExercises =>
      'Gerakan berpandukan video, langkah demi langkah';

  @override
  String get obFixMotivation =>
      'Rentetan dan tahap yang buat anda terus bersemangat';

  @override
  String get obFixBedtime => 'Sasaran tidur dan peringatan waktu tidur';

  @override
  String get obFixMeals => 'Sasaran protein dan pelan makan';

  @override
  String get obNotifTitle => 'BeTaller ingatkan anda pada masa yang penting';

  @override
  String get obNotifSubtitle =>
      'Ditetapkan ikut waktu yang anda beri. Boleh ditukar bila-bila masa.';

  @override
  String get obNotifWorkout => 'Latihan';

  @override
  String obNotifWorkoutDetail(String time) {
    return '30 min sebelum sesi $time anda';
  }

  @override
  String get obNotifMeal => 'Makan dan protein';

  @override
  String obNotifMealDetail(String time) {
    return 'Pada waktu makan $time anda';
  }

  @override
  String get obNotifWater => 'Air';

  @override
  String get obNotifWaterDetail => 'Rehat minum air pada waktu petang';

  @override
  String get obNotifSleep => 'Bertenang';

  @override
  String obNotifSleepDetail(String time) {
    return 'Sejam sebelum waktu tidur $time anda';
  }

  @override
  String get obNotifAllow => 'Hidupkan peringatan';

  @override
  String get obNotifNotNow => 'Bukan sekarang';

  @override
  String get obNotifNow => 'sekarang';

  @override
  String get ftOneFree => '1 percuma';

  @override
  String get ftFreeToday => 'Percuma hari ini';

  @override
  String get ftContinuePro => 'Teruskan dengan Pro';

  @override
  String get ftNotNow => 'Bukan sekarang';

  @override
  String get ftOutWorkoutTitle => 'Anda sudah guna latihan percuma anda';

  @override
  String get ftOutWorkoutBody =>
      'Kekalkan rentetan dengan Pro: latihan berpandu setiap hari, setiap gerakan dimasa untuk anda.';

  @override
  String get ftOutDayTitle => 'Hari pertama percuma anda sudah tamat';

  @override
  String get ftOutDayBody =>
      'Pelan, sasaran dan kemajuan anda kekal di sini untuk dibaca. Kekalkan rentetan dengan Pro: tandakan pelan dan catat air serta tidur setiap hari.';

  @override
  String get ftOutPostureTitle => 'Anda sudah guna semakan postur percuma anda';

  @override
  String get ftOutPostureBody =>
      'Keputusan anda kekal di sini. Semak lagi setiap minggu dengan Pro dan lihat postur anda bertambah baik.';

  @override
  String get ftOutPhotosTitle =>
      'Anda sudah guna perbandingan foto percuma anda';

  @override
  String get ftOutPhotosBody =>
      'Pasangan itu kekal untuk anda lihat. Tambah lebih banyak foto dan bandingkan mana-mana dua dengan Pro.';

  @override
  String get ftOutReportTitle =>
      'Anda sudah guna laporan mingguan percuma anda';

  @override
  String get ftOutReportBody =>
      'Dapatkan rumusan penuh setiap minggu dengan Pro: skor setiap hari, sasaran anda dan satu perkara untuk diperbaiki.';

  @override
  String get ftOutScoreTitle => 'Anda sudah lihat pecahan skor percuma anda';

  @override
  String get ftOutScoreBody =>
      'Skor anda kekal di skrin. Lihat apa yang membinanya, dan apa langkah seterusnya, setiap hari dengan Pro.';

  @override
  String get ftOutArticleTitle => 'Anda sudah baca artikel percuma anda';

  @override
  String get ftOutArticleBody =>
      'Artikel itu kekal terbuka untuk anda. Baca seluruh perpustakaan dengan Pro.';

  @override
  String get ftWhyWorkout => 'Latihan berpandu sebahagian daripada Pro';

  @override
  String get ftWhyPlan => 'Menandakan pelan sebahagian daripada Pro';

  @override
  String get ftWhyProgram => 'Program 70 hari sebahagian daripada Pro';

  @override
  String get ftWhyWater => 'Mencatat air setiap hari sebahagian daripada Pro';

  @override
  String get ftWhySleep => 'Mencatat tidur setiap hari sebahagian daripada Pro';

  @override
  String get ftWhyNutrition => 'Pelan pemakanan harian sebahagian daripada Pro';

  @override
  String get ftWhyPosture => 'Semakan postur mingguan sebahagian daripada Pro';

  @override
  String get ftWhyPhotos => 'Perbandingan foto sebahagian daripada Pro';

  @override
  String get ftWhyReport => 'Laporan mingguan sebahagian daripada Pro';

  @override
  String get ftWhyScore => 'Pecahan skor sebahagian daripada Pro';

  @override
  String get ftWhyArticle => 'Perpustakaan penuh sebahagian daripada Pro';

  @override
  String get ftPlanLocked =>
      'Pelan anda kekal di sini untuk dibaca. Menandakannya sebahagian daripada Pro.';

  @override
  String get ftNutritionLocked =>
      'Sasaran dan hidangan anda kekal di sini untuk dibaca. Menandakannya sebahagian daripada Pro.';

  @override
  String get ftPreviewTag => 'Pratonton';

  @override
  String get ftPreviewTitle => 'Itulah pratonton anda';

  @override
  String get ftPreviewBody =>
      'Baki latihan ini sebahagian daripada Pro. Ini yang seterusnya:';

  @override
  String get ftFreeWorkoutUsed =>
      'Itulah latihan berpandu percuma anda. Pro menyediakannya setiap hari.';

  @override
  String get ftScoreLockedTitle => 'Apa yang membina skor anda';

  @override
  String get ftScoreLockedBody =>
      'Setiap bahagian skor anda, asasnya dan satu perkara untuk dibuat seterusnya.';

  @override
  String get ftReportLockedTitle => 'Minggu penuh anda';

  @override
  String get ftReportLockedBody =>
      'Setiap hari dinilai berbanding pelan, sasaran dan tinggi anda, serta satu fokus untuk minggu depan.';

  @override
  String get ftPhotosLockedTitle => 'Bandingkan dua ini';

  @override
  String get ftPhotosLockedBody =>
      'Perbandingan percuma anda sudah digunakan. Dengan Pro anda boleh luncur antara mana-mana dua foto.';

  @override
  String get ftArticleFreeLine =>
      'Artikel pertama anda percuma. Pilih yang anda mahu.';

  @override
  String get plFinishWorkout => 'Tamat';

  @override
  String get obTriedMostApps => 'Kebanyakan aplikasi';

  @override
  String get obTriedThatsIt => 'Satu nombor, itu sahaja.';

  @override
  String get obTriedPlanLabel => 'Hari anda dengan BeTaller';

  @override
  String get obTriedProteinSub => 'Dibahagi ikut waktu makan anda';

  @override
  String get obTriedSleepSub => 'Peringatan sebelum tidur';

  @override
  String get obTriedFeatVideo => 'Gerakan berpandukan video';

  @override
  String get obTriedFeatReminders => 'Peringatan pada waktu anda';

  @override
  String get obTriedFeatStreaks => 'Rentetan dan tahap';

  @override
  String get obBedtimeUnknown => 'Saya tak tahu, ia berubah-ubah';

  @override
  String obBedtimeUnknownHint(String time) {
    return 'Kami cadangkan $time, berdasarkan tidur yang anda perlukan pada umur anda. Boleh ditukar bila-bila masa.';
  }

  @override
  String get obWorkoutTimeUnknown => 'Saya tak tahu, tiada waktu tetap';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return 'Kami guna $time buat masa ini. Boleh ditukar bila-bila masa.';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return 'Cadangan: tidur sekitar $time. Boleh ditukar bila-bila masa.';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return 'Cadangan: latihan sekitar $time. Boleh ditukar bila-bila masa.';
  }

  @override
  String get obNotifSubtitleSuggested =>
      'Ditetapkan ikut waktu yang anda beri, dengan cadangan di mana anda tidak pasti. Boleh ditukar bila-bila masa.';

  @override
  String get plFoodBrownRice => 'Beras perang';

  @override
  String get unitHeightTitle => 'Unit tinggi';

  @override
  String get unitWeightTitle => 'Unit berat';

  @override
  String get unitWaterTitle => 'Unit air';

  @override
  String get unitOptCm => 'Sentimeter';

  @override
  String get unitOptFtIn => 'Kaki dan inci';

  @override
  String get unitOptKg => 'Kilogram';

  @override
  String get unitOptLb => 'Paun';

  @override
  String get unitOptStLb => 'Stone dan paun';

  @override
  String get unitOptLiters => 'Liter';

  @override
  String get unitOptFlOz => 'Auns cecair';

  @override
  String achieveGrowthImp(String amount) {
    return 'Pertumbuhan $amount';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return 'Rekod jumlah pertumbuhan $amount';
  }

  @override
  String get postureBenefitIn =>
      'Kepala, bahu dan pinggang. Berdiri tegak boleh menunjukkan sehingga kira-kira 1 inci lagi tinggi sebenar anda.';

  @override
  String get notifPostureBodyIn =>
      'Belakang lurus, bahu ke belakang. Postur baik = beza kira-kira 1 inci!';

  @override
  String get painPostureDescIn =>
      'Postur yang betul boleh terus menambah sehingga kira-kira 1 inci. Rutin postur harian BeTaller membentuknya dalam beberapa minggu.';

  @override
  String get routinePostureDescIn =>
      'Belakang lurus, bahu ke belakang. Semak setiap jam. Postur baik = beza kira-kira 1 inci.';

  @override
  String get sciPostureCheckIn =>
      'Penjajaran postur yang betul boleh terus menambah kira-kira 1 inci pada tinggi yang kelihatan dan mencegah tekanan tulang belakang';

  @override
  String get routineProteinDescLb =>
      'Telur, ayam, ikan, tenusu. Sekurang-kurangnya 0.7 g protein bagi setiap lb berat badan sehari.';

  @override
  String pwPersonalTitle(String height) {
    return 'Pelan anda untuk capai $height sudah sedia';
  }

  @override
  String get pwPersonalEstimate =>
      'Anggaran potensi daripada jawapan anda, bukan jaminan';

  @override
  String pwPersonalReason(String reason) {
    return 'Sebab anda: $reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return 'Peringatan bertenang sebelum waktu tidur $time anda';
  }

  @override
  String get obParentUnknown => 'Saya tak tahu';

  @override
  String get obParentUnknownHint =>
      'Kami akan guna purata tinggi dewasa. Kurang tepat, dan anda boleh tambah dalam profil bila-bila masa.';

  @override
  String get obEthnicityWhy =>
      'Hanya digunakan untuk menganggar tinggi ibu atau bapa yang anda tak tahu.';

  @override
  String get resultNoParentNote =>
      'Dianggar tanpa tinggi salah seorang ibu bapa, jadi kurang tepat. Tambah dalam profil bila-bila masa.';

  @override
  String get resultNoParentsNote =>
      'Dianggar tanpa tinggi ibu bapa anda, jadi kurang tepat. Tambah dalam profil bila-bila masa.';

  @override
  String get resultFootnoteEstimated =>
      'Anggaran berdasarkan data carta pertumbuhan dan purata tinggi dewasa. Bukan nasihat perubatan.';

  @override
  String get obBudgetChip => 'HARGA BERPATUTAN';

  @override
  String get obBudgetTitle =>
      'Harga BeTaller sesuai untuk setiap remaja yang mahu tumbuh';

  @override
  String get obBudgetDesc =>
      'Tinggi anda tak sepatutnya bergantung pada berapa banyak wang anda ada. Sebab itu harga ditetapkan berasingan untuk setiap negara.';

  @override
  String obBudgetWeek(String price) {
    return 'Seminggu Pro di sini: $price';
  }

  @override
  String get obBudgetLocalTitle => 'Harga untuk negara anda';

  @override
  String get obBudgetLocalDesc =>
      'Bukan ditukar daripada dolar AS: ditetapkan ikut bajet tempat anda tinggal.';

  @override
  String get obBudgetWeekTitle => 'Mula dengan seminggu sahaja';

  @override
  String get obBudgetWeekDesc =>
      'Tiada bayaran besar di awal. Batal bila-bila masa dalam tetapan Apple ID anda.';

  @override
  String get obBudgetAllTitle => 'Semuanya dalam satu pelan';

  @override
  String get obBudgetAllDesc =>
      'Latihan, tidur, pemakanan, postur dan laporan kemajuan.';

  @override
  String get obRateTitle => 'BeTaller dibina untuk benar-benar membantu anda';

  @override
  String get obRateDesc =>
      'Jika anda suka perhatian peribadi dan kejujuran kami, kami akan sangat gembira jika anda menilai kami.';

  @override
  String get obRateCta => 'Nilai BeTaller';

  @override
  String get obRateLater => 'Mungkin nanti';
}
