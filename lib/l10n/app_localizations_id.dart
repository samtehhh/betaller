// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get navHome => 'Beranda';

  @override
  String get navAnalysis => 'Analisis';

  @override
  String get navRoutines => 'Rencanaku';

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
  String get disciplineLevels => 'Level';

  @override
  String get disciplineLevelDone => 'Selesai';

  @override
  String get disciplineLocked => 'Terkunci';

  @override
  String get disciplineTodayIs => 'Hari ini';

  @override
  String get disciplineToday => 'Hari ini';

  @override
  String get disciplineTodayPlan => 'Rencana hari ini';

  @override
  String get disciplineWeek => 'Minggu ini';

  @override
  String get disciplineMonth => 'Bulan ini';

  @override
  String get disciplineLevel => 'Level disiplin';

  @override
  String disciplineStreakDays(int days) {
    return 'Streak $days hari';
  }

  @override
  String disciplineToNext(int days) {
    return '$days hari lagi ke level berikutnya';
  }

  @override
  String get disciplineMaxTier => 'Level tertinggi tercapai';

  @override
  String get disciplineTierSpark => 'Percikan';

  @override
  String get disciplineTierSteady => 'Stabil';

  @override
  String get disciplineTierSharp => 'Tajam';

  @override
  String get disciplineTierSolid => 'Kokoh';

  @override
  String get disciplineTierRelentless => 'Pantang Mundur';

  @override
  String get disciplineTierUnbroken => 'Tak Terputus';

  @override
  String get disciplineTierLegend => 'Legenda';

  @override
  String get goalPerfectDays => 'Hari rencana selesai';

  @override
  String get goalWorkouts => 'Sesi latihan';

  @override
  String get goalMeasurement => 'Ukur tinggi badan';

  @override
  String get goalPhoto => 'Foto progres';

  @override
  String get goalPostureCheck => 'Cek postur';

  @override
  String get disciplineAllDone => 'Hari ini beres';

  @override
  String disciplineDayProgress(int done, int total) {
    return '$done/$total selesai';
  }

  @override
  String get navProgress => 'Progres';

  @override
  String get trackingSection => 'Alat pantau kamu';

  @override
  String get photosBenefit =>
      'Sebelum dan sesudah, berdampingan. Lihat sendiri perubahannya.';

  @override
  String get postureBenefit =>
      'Kepala, bahu, dan punggung bawah. Berdiri tegak bisa menampakkan 2-3 cm tinggi aslimu.';

  @override
  String get reportBenefit =>
      'Nilai minggumu per hari dan lihat di mana yang kendor.';

  @override
  String get photosCta => 'Tambah foto';

  @override
  String get postureCta => 'Analisis';

  @override
  String get reportCta => 'Buka laporan';

  @override
  String get toolStateReady => 'Siap';

  @override
  String get photosSummaryEmpty => 'Tambah foto pertamamu';

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
    return 'Halo, $name';
  }

  @override
  String get currentHeight => 'Tinggi Saat Ini';

  @override
  String get target => 'Target';

  @override
  String completed(String pct) {
    return '$pct% tercapai';
  }

  @override
  String remaining(String cm, String unit) {
    return '+$cm $unit lagi';
  }

  @override
  String get updateAnalysis => 'Perbarui Analisis';

  @override
  String get analysisSubtitle => 'Prediksi dari tinggi sebelumnya + kebiasaan';

  @override
  String get dailyRoutines => 'Rutinitas Harian';

  @override
  String get allRoutinesDone => 'Semua rutinitas selesai!';

  @override
  String get water => 'Air';

  @override
  String get sleep => 'Tidur';

  @override
  String get growthSummary => 'Ringkasan Pertumbuhan';

  @override
  String get total => 'TOTAL';

  @override
  String get last => 'TERAKHIR';

  @override
  String get measurement => 'UKUR';

  @override
  String get dailyTip => 'Tips Hari Ini';

  @override
  String get waterTracking => 'Pantau Minum';

  @override
  String get waterGoalReached => 'Target harian tercapai';

  @override
  String waterRemaining(String amount) {
    return '$amount lagi';
  }

  @override
  String get undo => 'Batalkan';

  @override
  String waterToday(String amount) {
    return 'Hari ini: $amount L';
  }

  @override
  String get sleepTracking => 'Pantau Tidur';

  @override
  String sleepTarget(String hours) {
    return 'Target: $hours jam';
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
  String get nutrition => 'Nutrisi';

  @override
  String get sleepLabel => 'Tidur';

  @override
  String get discipline => 'Disiplin';

  @override
  String get improveScore => 'Naikkan Skormu';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Nutrisi Kritis!';

  @override
  String get nutritionStrengthen => 'Perkuat Nutrisi';

  @override
  String get sleepRecordAdd => 'Catat Tidur';

  @override
  String get sleepPoor => 'Jadwal Tidur Buruk';

  @override
  String get sleepImprove => 'Perbaiki Tidur';

  @override
  String get startToday => 'Mulai Hari Ini!';

  @override
  String routinesRemaining(int count) {
    return '$count Rutinitas Lagi';
  }

  @override
  String get keepStreak => 'Jaga Streak-mu';

  @override
  String get addFirstMeasurement => 'Tambah Ukuran Pertama';

  @override
  String get addMeasurement => 'Tambah Ukuran';

  @override
  String waterHalfNotReached(String amount) {
    return 'Kamu belum minum setengah dari target hari ini. Minum ${amount}L lagi.';
  }

  @override
  String waterAlmostDone(String amount) {
    return '${amount}L lagi untuk capai target minum. Hampir sampai!';
  }

  @override
  String bmiLow(String bmi) {
    return 'BMI kamu $bmi, agak rendah. Tambah asupan protein dan kalori.';
  }

  @override
  String get bodyFactsTitle => 'Tubuhmu';

  @override
  String get dailyNeedsTitle => 'Target harianmu';

  @override
  String bmiHigh(String bmi) {
    return 'BMI kamu $bmi, agak tinggi. Fokus ke pola makan sehat.';
  }

  @override
  String get nutritionDefault =>
      'Capai target minummu dan jaga pola makan seimbang.';

  @override
  String sleepNoRecord(String hours) {
    return 'Belum ada catatan tidur hari ini. Usahakan $hours jam lalu catat.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Kamu tidur $current jam hari ini, kurang $missing jam. Tidur lebih awal ya!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Hampir sampai. Tidur $hours jam bikin hormon pertumbuhan maksimal.';
  }

  @override
  String get sleepGood => 'Jadwal tidurmu keren! Pertahankan.';

  @override
  String noRoutinesDone(int total) {
    return 'Belum ada rutinitas selesai hari ini. Mulai dari salah satu dari $total!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '$done/$total rutinitas selesai hari ini. $left lagi!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Mantap hari ini! $needed hari lagi untuk mulai streak.';
  }

  @override
  String streakContinue(int days) {
    return 'Streak $days hari! Skormu naik kalau kamu lanjut terus.';
  }

  @override
  String get noMeasurements =>
      'Belum ada ukuran tinggi. Tambah yang pertama biar prediksinya akurat.';

  @override
  String fewMeasurements(int count) {
    return 'Tambah $count ukuran lagi untuk menghitung kecepatan tumbuh.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Kamu punya $count ukuran. Capai 5 biar akurasinya jauh lebih baik.';
  }

  @override
  String get keepMeasuring =>
      'Terus tambah ukuran. Setiap data baru bikin prediksi makin tepat.';

  @override
  String get heightPrediction => 'Prediksi Tinggi';

  @override
  String get predictedHeightAt21 => 'Prediksi tinggi di usia 21';

  @override
  String get predictionMethod =>
      'Dihitung dari gabungan data genetik (orang tua), kecepatan tumbuh, BMI, dan usia.';

  @override
  String get growthStatus => 'Status Pertumbuhan';

  @override
  String get growthRemaining => 'Masih menantimu';

  @override
  String get growthBreakdown => 'Dari mana sentimeter itu datang';

  @override
  String get geneticGainLabel => 'Tambahan Genetik';

  @override
  String get lifestyleLabel => 'Gaya Hidup';

  @override
  String get geneticCeilingLabel => 'Batas Atas';

  @override
  String get reachableTargetHeight => 'Target tinggi yang bisa kamu capai';

  @override
  String get geneticCeilingProgress => 'Progres menuju batas genetik';

  @override
  String get completionLabel => 'PENCAPAIAN';

  @override
  String get growthVelocity => 'KECEPATAN TUMBUH';

  @override
  String get noData => 'TIDAK ADA DATA';

  @override
  String growthRate(String rating) {
    return 'Laju tumbuh: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'Kalori';

  @override
  String get kcalDay => 'kcal/hari';

  @override
  String get daily => 'harian';

  @override
  String get protein => 'Protein';

  @override
  String get minimum => 'minimal';

  @override
  String get age => 'Usia';

  @override
  String get male => 'Laki-laki';

  @override
  String get female => 'Perempuan';

  @override
  String get yearlyPrediction => 'PREDIKSI TAHUNAN';

  @override
  String ageYear(int age) {
    return '$age thn';
  }

  @override
  String get progressTitle => 'Pantau Progres';

  @override
  String get totalGrowth => 'Total';

  @override
  String get lastDiff => 'Selisih Akhir';

  @override
  String get measurementCount => 'Ukur';

  @override
  String get heightChart => 'Grafik Tinggi';

  @override
  String get chartMinData => 'Butuh minimal 2 ukuran untuk grafik';

  @override
  String get chartInstruction =>
      'Tambah ukuran untuk melihat grafik progresmu!';

  @override
  String get addMeasurementButton => 'TAMBAH UKURAN BARU';

  @override
  String get measurementHistory => 'RIWAYAT UKURAN';

  @override
  String get deleteTitle => 'Hapus Ukuran';

  @override
  String get deleteMessage => 'Yakin mau menghapus ukuran ini?';

  @override
  String get dismiss => 'Batal';

  @override
  String get delete => 'Hapus';

  @override
  String get newMeasurement => 'Ukuran Tinggi Baru';

  @override
  String get routines => 'Rutinitas';

  @override
  String streakDays(int days) {
    return '$days Hari';
  }

  @override
  String get progressStatus => 'Status Progres';

  @override
  String get completedLabel => 'Selesai!';

  @override
  String get all => 'Semua';

  @override
  String get exercise => 'Olahraga';

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
  String get editProfileSubtitle => 'Perbarui tinggi, berat, usia';

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
  String get fatherHeight => 'Tinggi Ayah (cm)';

  @override
  String get motherHeight => 'Tinggi Ibu (cm)';

  @override
  String get notifications => 'Notifikasi';

  @override
  String get reminderNextLabel => 'Pengingat berikutnya';

  @override
  String get reminderManageHint => 'Atur pengingatmu';

  @override
  String get reminderOffCta => 'Nyalakan notifikasi';

  @override
  String get stateOn => 'Aktif';

  @override
  String get stateOff => 'Mati';

  @override
  String get reminderMasterTitle => 'Notifikasi';

  @override
  String reminderActiveCount(int count) {
    return '$count pengingat aktif';
  }

  @override
  String get reminderBuiltIn => 'Pengingat bawaan';

  @override
  String get reminderYourOwn => 'Pengingat buatanmu';

  @override
  String get reminderAdd => 'Tambah pengingat';

  @override
  String get reminderDays => 'Hari';

  @override
  String get reminderEveryDay => 'Setiap hari';

  @override
  String get reminderLabelHint => 'Mau diingatkan soal apa?';

  @override
  String get reminderEmptyHint =>
      'Buat sendiri: latihan, vitamin, peregangan, apa pun yang kamu perlu.';

  @override
  String get reminderCustom => 'Pengingat';

  @override
  String get reminderCustomBody => 'Waktu yang kamu atur sudah tiba.';

  @override
  String get reminderExercise => 'Olahraga';

  @override
  String get reminderNutrition => 'Nutrisi';

  @override
  String get reminderWater => 'Air';

  @override
  String get reminderPosture => 'Postur';

  @override
  String get reminderRoutine => 'Rutinitas harian';

  @override
  String get reminderSleep => 'Tidur';

  @override
  String get reminderMeasurement => 'Ukur tinggi badan';

  @override
  String get notificationsOn => 'Pengingat aktif';

  @override
  String get notificationsOff => 'Pengingat mati';

  @override
  String get premium => 'Upgrade ke Premium';

  @override
  String get premiumSubtitle => 'Buka semua fitur';

  @override
  String get rateUs => 'Beri Rating';

  @override
  String get rateSubtitle => 'Suka aplikasinya? Kasih kami 5 bintang!';

  @override
  String get share => 'Bagikan Aplikasi';

  @override
  String get shareSubtitle => 'Ceritakan BeTaller ke temanmu';

  @override
  String get shareText =>
      'Aku menemukan potensi tinggi badanku dengan BeTaller! Coba juga: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'Kirim Masukan';

  @override
  String get feedbackSubtitle => 'Hubungi kami';

  @override
  String get resetData => 'Reset Semua Data';

  @override
  String get resetSubtitle => 'Semua data akan dihapus';

  @override
  String get resetTitle => 'Reset Data';

  @override
  String get resetMessage =>
      'Semua data akan dihapus dan kamu kembali ke layar awal. Ini tidak bisa dibatalkan!';

  @override
  String get reset => 'Reset';

  @override
  String get premiumSoon => 'Premium segera hadir!';

  @override
  String get brandingSubtitle => 'Temukan potensi tinggi badanmu';

  @override
  String get statistics => 'Statistik';

  @override
  String get profileGroupSupport => 'Bantuan';

  @override
  String get profileGroupAccount => 'Akun';

  @override
  String get profileGroupApp => 'Aplikasi';

  @override
  String get profileGroupDanger => 'Zona berbahaya';

  @override
  String profileMemberSince(String date) {
    return 'Sejak $date';
  }

  @override
  String get profileYourJourney => 'Perjalananmu';

  @override
  String get profileTotalGrowth => 'Total';

  @override
  String get currentStreak => 'Streak Saat Ini';

  @override
  String get bestStreakLabel => 'Streak Terbaik';

  @override
  String get achievementLabel => 'Pencapaian';

  @override
  String get achievements => 'Pencapaian';

  @override
  String get achievementUnlockedTitle => '🏆 Pencapaian terbuka!';

  @override
  String get reminderTapHint => 'Ketuk untuk ubah jam dan harinya';

  @override
  String get earned => 'Didapat!';

  @override
  String get notEarned => 'Belum didapat';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSubtitle => 'Ganti bahasa aplikasi';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Temukan potensi tinggi badanmu';

  @override
  String get onboardingMeetYou => 'Kenalan Dulu, Yuk';

  @override
  String get onboardingInfoNeeded => 'Info dasar untuk analisis.';

  @override
  String get gender => 'JENIS KELAMIN';

  @override
  String get birthDateLabel => 'TANGGAL LAHIR';

  @override
  String get bodyMeasurements => 'Ukuran Tubuh';

  @override
  String get bodyInfo =>
      'Tinggi dan berat badanmu sekarang dibutuhkan untuk analisis.';

  @override
  String get geneticData => 'Data Genetik';

  @override
  String get geneticInfo => 'Tinggi orang tua menentukan potensi genetikmu.';

  @override
  String get pastHeights => 'Tinggi Sebelumnya';

  @override
  String get pastHeightsInfo =>
      'Isi tinggi yang kamu ingat di usia berbeda. Boleh dikosongkan.';

  @override
  String get heightHint => 'Isi tinggi...';

  @override
  String get ageLabel => 'usia';

  @override
  String get habits => 'Kebiasaanmu';

  @override
  String get habitsInfo => 'Gaya hidupmu langsung memengaruhi prediksi.';

  @override
  String get weeklyExercise => 'Olahraga Mingguan';

  @override
  String get dailySleep => 'Tidur Harian';

  @override
  String get nutritionQuality => 'KUALITAS NUTRISI';

  @override
  String get nutritionDesc => 'Asupan protein, susu, sayur, buah';

  @override
  String get nutritionBad => 'Buruk';

  @override
  String get nutritionPoor => 'Kurang';

  @override
  String get nutritionMedium => 'Sedang';

  @override
  String get nutritionGood => 'Baik';

  @override
  String get nutritionGreat => 'Sangat Baik';

  @override
  String get startAnalysis => 'Mulai Analisis';

  @override
  String get continueBtn => 'Lanjut';

  @override
  String get analyzeBtn => 'Analisis';

  @override
  String get analyzing => 'Menganalisis';

  @override
  String get analysisComplete => 'Selesai!';

  @override
  String get analysisDataReceivedTitle => 'Data Diterima';

  @override
  String get analysisDataReceivedSubtitle => 'Memulai analisismu...';

  @override
  String get yourScore => 'Skor BeTaller Kamu';

  @override
  String get letsStart => 'Ayo Mulai';

  @override
  String get splashJourneySubtitle => 'Perjalananmu dimulai. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Rencana pribadimu sudah siap.\nSiap menemukan potensi tinggimu?';

  @override
  String get doneBtn => 'Selesai';

  @override
  String get analysisStep1 => 'Menganalisis data genetik...';

  @override
  String get analysisStep2 => 'Menghitung kecepatan tumbuh...';

  @override
  String get analysisStep3 => 'Memproses data nutrisi dan tidur...';

  @override
  String get analysisStep4 => 'Membuat prediksi tinggi...';

  @override
  String get analysisStep5 => 'Menghitung skor BeTaller...';

  @override
  String growthPotential(String cm, String unit) {
    return 'Potensi tumbuh +$cm $unit';
  }

  @override
  String get heightAt21 => 'di usia 21';

  @override
  String confidenceLevel(String pct) {
    return 'Tingkat keyakinan $pct%';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return 'Rentang $min - $max $unit';
  }

  @override
  String get currentLabel => 'SEKARANG';

  @override
  String get predictedLabel => 'PREDIKSI';

  @override
  String get yearlyPredictions => 'Prediksi Tahunan';

  @override
  String get tipMorningMeasure =>
      'Ukur tinggimu di pagi hari. Tekanan pada bantalan tulang belakang bikin kamu sedikit lebih pendek di siang hari, jadi ukuran pagi paling akurat.';

  @override
  String get tipProteinSpread =>
      'Bagi asupan protein ke semua waktu makan. Jangan sekaligus, makan protein tiap kali makan.';

  @override
  String get tipGrowthHormone =>
      'Hormon pertumbuhan memuncak saat tidur. Usahakan sudah tidur antara jam 22.00-02.00!';

  @override
  String get tipVitaminD =>
      '15 menit kena sinar matahari tiap hari meningkatkan produksi vitamin D. Vitamin D penting untuk penyerapan kalsium.';

  @override
  String get tipBarHanging =>
      'Bergantung di palang meregangkan tulang belakang. Coba 3x30 detik tiap hari.';

  @override
  String get tipSwimming =>
      'Renang adalah olahraga terbaik untuk melatih seluruh tubuh dan mendukung pertumbuhan tinggi.';

  @override
  String get tipStress =>
      'Stres menekan hormon pertumbuhan. Kurangi stres dengan meditasi dan yoga.';

  @override
  String get routineMorningStretch => 'Peregangan Pagi';

  @override
  String get routineMorningStretchDesc =>
      'Lakukan peregangan 10 menit begitu bangun tidur. Regangkan tulang belakang dan otot kaki.';

  @override
  String get routineBarHanging => 'Bergantung di Palang';

  @override
  String get routineBarHangingDesc =>
      'Bergantung di palang pull-up untuk meregangkan tulang belakang. 3 set x 30 detik.';

  @override
  String get routineCobraStretch => 'Peregangan Kobra';

  @override
  String get routineCobraStretchDesc =>
      'Tengkurap lalu angkat badan atas. Regangkan tulang belakang. 3 set x 15 detik.';

  @override
  String get routineJumping => 'Latihan Lompat';

  @override
  String get routineJumpingDesc =>
      'Lompat tali atau squat jump. Merangsang lempeng pertumbuhan. 3 set x 20 kali.';

  @override
  String get routineSwimming => 'Renang atau Basket';

  @override
  String get routineSwimmingDesc =>
      'Lakukan olahraga yang mendukung pertumbuhan tinggi. Minimal 30 menit.';

  @override
  String get routineYoga => 'Yoga & Peregangan Malam';

  @override
  String get routineYogaDesc =>
      'Rutinitas yoga dan peregangan sebelum tidur. Lepaskan stres, rilekskan otot.';

  @override
  String get routineProtein => 'Asupan Protein';

  @override
  String get routineProteinDesc =>
      'Telur, ayam, ikan, susu. Minimal 1.5g/kg protein per hari.';

  @override
  String get routineCalcium => 'Kalsium & Vitamin D';

  @override
  String get routineCalciumDesc =>
      'Konsumsi susu, keju, yogurt. Berjemur 15 menit. Penting untuk perkembangan tulang.';

  @override
  String get routineWater => 'Target Minum Air';

  @override
  String get routineWaterDesc =>
      'Minum minimal 2-3 liter air sehari. Penting untuk metabolisme dan pertumbuhan.';

  @override
  String get routineAvoidJunk => 'Hindari Junk Food';

  @override
  String get routineAvoidJunkDesc =>
      'Jauhi makanan cepat saji, minuman manis, dan makanan olahan.';

  @override
  String get routineSleep => 'Tidur Berkualitas (8-10 jam)';

  @override
  String get routineSleepDesc =>
      'Hormon pertumbuhan dilepaskan saat tidur. Jam 22.00-06.00 adalah jam emas.';

  @override
  String get routineNoScreen => 'Lepas Layar Sebelum Tidur';

  @override
  String get routineNoScreenDesc =>
      'Jauhkan HP dan komputer 1 jam sebelum tidur. Jangan hambat produksi melatonin.';

  @override
  String get routinePosture => 'Cek Postur';

  @override
  String get routinePostureDesc =>
      'Punggung tegak, bahu ke belakang. Cek tiap jam. Postur bagus = beda 2-3 cm.';

  @override
  String get routineWallStand => 'Latihan Berdiri di Dinding';

  @override
  String get routineWallStandDesc =>
      'Bersandar ke dinding: tumit, pinggul, bahu, kepala menempel. Tahan 5 menit.';

  @override
  String get routineSprintIntervals => 'Latihan Interval Sprint';

  @override
  String get routineSprintIntervalsDesc =>
      'Interval sprint memicu pelepasan hormon pertumbuhan yang besar lewat ledakan intensitas tinggi.';

  @override
  String get routineHiitWorkout => 'Latihan HIIT';

  @override
  String get routineHiitWorkoutDesc =>
      'Latihan interval intensitas tinggi untuk memaksimalkan pelepasan hormon pertumbuhan.';

  @override
  String get routineSquats => 'Squat Tanpa Beban';

  @override
  String get routineSquatsDesc =>
      'Squat dengan berat badan merangsang lempeng pertumbuhan di kaki dan tulang belakang.';

  @override
  String get routineDeadliftStretch => 'Peregangan Deadlift';

  @override
  String get routineDeadliftStretchDesc =>
      'Peregangan deadlift untuk meregangkan tulang belakang dan menjaga kesehatan bantalan ruas tulang.';

  @override
  String get routineOverheadPress => 'Overhead Press';

  @override
  String get routineOverheadPressDesc =>
      'Mendorong ke atas kepala meregangkan tulang belakang dan menguatkan otot postur.';

  @override
  String get routineSkippingRope => 'Lompat Tali';

  @override
  String get routineSkippingRopeDesc =>
      'Lompat tali berulang merangsang lempeng pertumbuhan di tubuh bagian bawah.';

  @override
  String get routinePilatesCore => 'Pilates Inti';

  @override
  String get routinePilatesCoreDesc =>
      'Latihan inti pilates mendukung kelurusan tulang belakang dan postur.';

  @override
  String get routineInversionHang => 'Bergantung Terbalik';

  @override
  String get routineInversionHangDesc =>
      'Posisi terbalik meregangkan bantalan tulang belakang, bisa menambah 1-2cm sementara.';

  @override
  String get routineZincIntake => 'Makanan Kaya Zinc';

  @override
  String get routineZincIntakeDesc =>
      'Konsumsi makanan kaya zinc sepanjang hari untuk produksi hormon pertumbuhan.';

  @override
  String get routineVitaminDSunlight => 'Vitamin D & Sinar Matahari';

  @override
  String get routineVitaminDSunlightDesc =>
      'Kena sinar matahari langsung minimal 15 menit untuk pembentukan vitamin D dan pertumbuhan tulang.';

  @override
  String get routineArginineFoods => 'Makanan Kaya Arginin';

  @override
  String get routineArginineFoodsDesc =>
      'Makan makanan kaya arginin untuk merangsang sekresi hormon pertumbuhan.';

  @override
  String get routineDailyCalories => 'Target Kalori Harian';

  @override
  String get routineDailyCaloriesDesc =>
      'Capai target kalori harianmu. Makan terlalu sedikit memperlambat pertumbuhan.';

  @override
  String get routineSleepEnvironment => 'Atur Suasana Tidur';

  @override
  String get routineSleepEnvironmentDesc =>
      'Buat kamar tidur gelap dan sejuk untuk memaksimalkan melatonin dan hormon pertumbuhan.';

  @override
  String get routinePreSleepRoutine => 'Bersantai Sebelum Tidur';

  @override
  String get routinePreSleepRoutineDesc =>
      'Rutinitas sebelum tidur yang konsisten meningkatkan kualitas tidur nyenyak sebesar 23%.';

  @override
  String get routineNeckStretches => 'Peregangan Leher';

  @override
  String get routineNeckStretchesDesc =>
      'Peregangan leher mengurangi tekanan dan memperbaiki kelurusan leher.';

  @override
  String get routineShoulderRolls => 'Putar & Buka Bahu';

  @override
  String get routineShoulderRollsDesc =>
      'Membuka bahu memperbaiki postur membungkuk, bisa terlihat 1-2cm lebih tinggi.';

  @override
  String get achieveCommitment => 'Komitmen';

  @override
  String get achieveCommitmentDesc =>
      'Isi semua datamu, jelajahi aplikasi, dan mulai pakai';

  @override
  String get achieveFirstDay => 'Langkah Pertama';

  @override
  String get achieveFirstDayDesc => 'Selesaikan hari pertamamu';

  @override
  String get achieveThreeStreak => 'Streak 3 Hari';

  @override
  String get achieveThreeStreakDesc =>
      'Selesaikan rutinitas 3 hari berturut-turut';

  @override
  String get achieveWeekStreak => 'Streak 7 Hari';

  @override
  String get achieveWeekStreakDesc =>
      'Selesaikan rutinitas 7 hari berturut-turut';

  @override
  String get achieveTwoWeekStreak => 'Streak 14 Hari';

  @override
  String get achieveTwoWeekStreakDesc => 'Lanjut terus 14 hari tanpa putus';

  @override
  String get achieveMonthStreak => 'Streak 30 Hari';

  @override
  String get achieveMonthStreakDesc => 'Selesaikan 30 hari berturut-turut';

  @override
  String get achieveTwoMonthStreak => 'Streak 60 Hari';

  @override
  String get achieveTwoMonthStreakDesc => 'Selesaikan 60 hari berturut-turut';

  @override
  String get achieveHundredStreak => 'Streak 100 Hari';

  @override
  String get achieveHundredStreakDesc => 'Selesaikan 100 hari berturut-turut';

  @override
  String get achieveFirstMeasure => 'Ukuran Pertama';

  @override
  String get achieveFirstMeasureDesc => 'Catat ukuran tinggi pertamamu';

  @override
  String get achieveThreeMeasures => 'Pemantau';

  @override
  String get achieveThreeMeasuresDesc => 'Catat 3 ukuran tinggi';

  @override
  String get achieveFiveMeasures => 'Rajin Memantau';

  @override
  String get achieveFiveMeasuresDesc => 'Catat 5 ukuran tinggi';

  @override
  String get achieveTenMeasures => 'Pemburu Data';

  @override
  String get achieveTenMeasuresDesc => 'Catat 10 ukuran tinggi';

  @override
  String get achieveFirstCm => 'Sentimeter Pertama';

  @override
  String get achieveFirstCmDesc => 'Catat total tumbuh 1 cm';

  @override
  String get achieveThreeCm => 'Tumbuh 3 cm';

  @override
  String get achieveThreeCmDesc => 'Catat total tumbuh 3 cm';

  @override
  String get achieveFiveCm => 'Tumbuh 5 cm';

  @override
  String get achieveFiveCmDesc => 'Catat total tumbuh 5 cm';

  @override
  String get achieveTenCm => 'Tumbuh 10 cm';

  @override
  String get achieveTenCmDesc => 'Catat total tumbuh 10 cm';

  @override
  String get quote1 => 'Jadi lebih baik dari kemarin, setiap hari.';

  @override
  String get quote2 =>
      'Tumbuh tidak terjadi dalam semalam, tapi setiap malam membawamu lebih dekat.';

  @override
  String get quote3 => 'Tumbuh butuh sabar, terus lanjut!';

  @override
  String get quote4 =>
      'Langkah yang kamu ambil hari ini membangun fondasi hari esok.';

  @override
  String get quote5 => 'Disiplin dimulai saat motivasi habis.';

  @override
  String get quote6 => 'Tubuhmu bakal berterima kasih, terus lanjut!';

  @override
  String get quote7 => 'Kamu sendiri yang menentukan batas potensimu.';

  @override
  String get quote8 => 'Langkah kecil menciptakan perubahan besar.';

  @override
  String get quote9 => 'Investasi terbaik adalah pada dirimu sendiri.';

  @override
  String get quote10 => 'Setiap hari kamu makin dekat ke tujuanmu.';

  @override
  String get quote11 => 'Berubah itu sulit, tapi menyesal lebih sulit.';

  @override
  String get quote12 => 'Tubuhmu berharga, rawat baik-baik.';

  @override
  String get quote13 => 'Sainganmu adalah dirimu kemarin. Kalahkan hari ini!';

  @override
  String get quote14 => 'BeTaller = Sabar + Disiplin + Yakin';

  @override
  String get quote15 => 'Percaya pada dirimu, prosesnya akan membentukmu.';

  @override
  String get quote16 =>
      'Jangan bilang tidak bisa hari ini, biar besok tidak menyesal.';

  @override
  String get quote17 => 'Tunjukkan kemajuan setiap hari, walau cuma 1%.';

  @override
  String get quote18 => 'Cermin akan menunjukkan progresmu, sabar ya.';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiUnderweight => 'Kurus';

  @override
  String get bmiOverweight => 'Berat Berlebih';

  @override
  String get bmiObese => 'Obesitas';

  @override
  String get velocityExcellent => 'Sangat Baik';

  @override
  String get velocityNormal => 'Normal';

  @override
  String get velocitySlow => 'Lambat';

  @override
  String get velocityVeryLow => 'Sangat Rendah';

  @override
  String durationMinutes(String min) {
    return '$min mnt';
  }

  @override
  String get durationAllDay => 'Seharian';

  @override
  String get durationNight => 'Malam';

  @override
  String durationHours(String hours) {
    return '$hours jam';
  }

  @override
  String get onboardingStep1 => 'Isi info pribadimu';

  @override
  String get onboardingStep2 => 'Bagikan tinggi sebelumnya';

  @override
  String get onboardingStep3 => 'Nilai kebiasaanmu';

  @override
  String get onboardingStep4 => 'Lihat prediksi dan skormu';

  @override
  String get hoursShort => 'j';

  @override
  String get selectLanguage => 'Pilih Bahasa';

  @override
  String get systemLanguage => 'Bahasa Sistem';

  @override
  String get emailSubject => 'Masukan BeTaller';

  @override
  String get pastHeightsTip =>
      'Usia yang tidak kamu tahu boleh dikosongkan. Isi 1-2 tinggi sebelumnya sudah cukup.';

  @override
  String get obPastHeightsTitle => 'Tinggi Sebelumnya';

  @override
  String get obPastHeightsSubPart1 =>
      'Tinggi badanmu dulu bikin prediksi lebih akurat.';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return 'Berapa tinggimu di usia $age?';
  }

  @override
  String get obSkip => 'Lewati';

  @override
  String get obNext => 'Berikutnya';

  @override
  String get obSkipAll => 'Lewati Semua';

  @override
  String get currentSuffix => '(sekarang)';

  @override
  String personalizedProtein(String amount) {
    return 'Telur, ayam, ikan, susu. Makan minimal ${amount}g protein per hari.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Minum minimal ${amount}L air per hari. Penting untuk metabolisme dan pertumbuhan.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'Hormon pertumbuhan dilepaskan saat tidur. Tidur minimal $hours jam. Jam 22.00-06.00 jam emas.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Konsumsi susu, keju, yogurt. Berjemur 15 menit. Target kalori harian: $calories kcal.';
  }

  @override
  String get scoreS => 'Luar biasa! Kamu hampir mencapai puncak potensimu.';

  @override
  String get scoreA => 'Keren! Sedikit perbaikan bisa bawa kamu ke puncak.';

  @override
  String get scoreB =>
      'Sudah di jalur yang benar. Fokus sedikit lagi ke rutinitas dan nutrisi.';

  @override
  String get scoreC =>
      'Masih bisa lebih baik. Rutinitas teratur akan bikin perbedaan.';

  @override
  String get scoreD => 'Potensinya tinggi, tapi kamu perlu bergerak.';

  @override
  String get scoreF =>
      'Mulai sekarang! Langkah kecil tiap hari bikin perbedaan besar.';

  @override
  String get cmPerYear => 'cm/tahun';

  @override
  String get howToDoIt => 'Cara Melakukan';

  @override
  String get musclesTargeted => 'Otot & Tulang yang Dilatih';

  @override
  String get scientificBasis => 'Dasar Ilmiah';

  @override
  String setXofY(String current, String total) {
    return 'Set $current dari $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Istirahat sebelum Set $set';
  }

  @override
  String get allSetsComplete => 'Semua Set Selesai!';

  @override
  String get setTimer => 'Timer Set';

  @override
  String get setTracker => 'Pencatat Set';

  @override
  String get builtInTimer => 'Timer Bawaan';

  @override
  String get markComplete => 'Tandai Selesai';

  @override
  String get markIncomplete => 'Tandai Belum Selesai';

  @override
  String get done => 'Selesai';

  @override
  String get doneExclamation => 'Selesai!';

  @override
  String get start => 'Mulai';

  @override
  String get pause => 'Jeda';

  @override
  String get resetTimer => 'Reset';

  @override
  String get skipRest => 'Lewati Istirahat';

  @override
  String get restart => 'Ulangi';

  @override
  String get perSet => 'per set';

  @override
  String get rest => 'ISTIRAHAT';

  @override
  String get reps => 'kali';

  @override
  String get difficultyBeginner => 'Pemula';

  @override
  String get difficultyIntermediate => 'Menengah';

  @override
  String get difficultyAdvanced => 'Mahir';

  @override
  String get learnTitle => 'Belajar';

  @override
  String get learnSubtitle => 'Ilmu berbasis riset untuk tumbuh';

  @override
  String get categoryAll => 'Semua';

  @override
  String get categoryScience => 'Sains';

  @override
  String get categoryNutrition => 'Nutrisi';

  @override
  String get categoryExercise => 'Olahraga';

  @override
  String get categorySleep => 'Tidur';

  @override
  String get categoryMyths => 'Mitos';

  @override
  String get scientificReferences => 'Referensi Ilmiah';

  @override
  String get relatedRoutines => 'Rutinitas Terkait';

  @override
  String get nutritionTitle => 'Nutrisi';

  @override
  String get sectionMealPlan => 'Menu Makan';

  @override
  String get sectionNutrients => 'Zat Gizi';

  @override
  String get sectionFoods => 'Makanan';

  @override
  String get sectionSupplements => 'Suplemen';

  @override
  String todaysPlan(String day) {
    return 'Rencana Hari Ini — $day';
  }

  @override
  String get breakfast => 'Sarapan';

  @override
  String get lunch => 'Makan Siang';

  @override
  String get dinner => 'Makan Malam';

  @override
  String get snacks => 'Camilan';

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
  String get dailyNeedByAge => 'KEBUTUHAN HARIAN MENURUT USIA';

  @override
  String agePrefix(String range) {
    return 'Usia $range';
  }

  @override
  String get topFoodSources => 'SUMBER MAKANAN TERBAIK';

  @override
  String get categoryDairy => 'Susu & Olahan';

  @override
  String get categoryMeatFish => 'Daging & Ikan';

  @override
  String get categoryVegetables => 'Sayuran';

  @override
  String get categoryFruits => 'Buah';

  @override
  String get categoryGrains => 'Biji-bijian & Kacang';

  @override
  String get categoryNutsSeeds => 'Kacang & Biji';

  @override
  String get weeklyReportTitle => 'Laporan Mingguan';

  @override
  String get weeklyScoreLabel => 'Skor minggu ini';

  @override
  String get weeklyDailyCompletion => 'Per hari';

  @override
  String get weeklyHabits => 'Kebiasaan';

  @override
  String get overview => 'Ringkasan';

  @override
  String get routinesLabel => 'Rutinitas';

  @override
  String get streakLabel => 'Streak';

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
  String get waterToday2 => 'Minum Hari Ini';

  @override
  String get sleepToday => 'Tidur Hari Ini';

  @override
  String get routineCompletion => 'Penyelesaian Rutinitas';

  @override
  String get xpAndLevel => 'XP & Level';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP lagi ke level berikutnya';
  }

  @override
  String get activeChallenges => 'Tantangan Aktif';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m selesai';
  }

  @override
  String get shareYourProgress => 'Bagikan Progresmu';

  @override
  String get shareComingSoon => 'Fitur berbagi segera hadir!';

  @override
  String get premiumTest => 'Premium (Tes)';

  @override
  String get premiumActive => 'Aktif';

  @override
  String get premiumFree => 'Gratis';

  @override
  String get weeklyReportMenu => 'Laporan Mingguan';

  @override
  String get weeklyReportMenuSubtitle => 'Ringkasan progresmu';

  @override
  String get unlockGrowthPotential => 'Buka potensi tumbuhmu sepenuhnya';

  @override
  String get featureGrowthAnalysis => 'Analisis & skor pertumbuhan';

  @override
  String get featureHeightPrediction => 'Prediksi & perkiraan tinggi';

  @override
  String get featureAllRoutines => 'Semua 14 rutinitas harian';

  @override
  String get featureWaterSleep => 'Pantau minum & tidur';

  @override
  String get featureProgress => 'Progres & ukuran';

  @override
  String get featureAchievements => 'Pencapaian & streak';

  @override
  String get planMonthly => 'Bulanan';

  @override
  String get planYearly => 'Tahunan';

  @override
  String get bestValue => 'PALING HEMAT';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'LV $level';
  }

  @override
  String get levelBeginner => 'Pemula';

  @override
  String get levelStarter => 'Perintis';

  @override
  String get levelCommitted => 'Berkomitmen';

  @override
  String get levelDedicated => 'Tekun';

  @override
  String get levelConsistent => 'Konsisten';

  @override
  String get levelFocused => 'Fokus';

  @override
  String get levelDetermined => 'Gigih';

  @override
  String get levelDisciplined => 'Disiplin';

  @override
  String get levelStrong => 'Kuat';

  @override
  String get levelAdvanced => 'Mahir';

  @override
  String get levelExpert => 'Ahli';

  @override
  String get levelMaster => 'Master';

  @override
  String get levelElite => 'Elite';

  @override
  String get levelChampion => 'Juara';

  @override
  String get levelLegend => 'Legenda';

  @override
  String get levelTitan => 'Titan';

  @override
  String get levelMythic => 'Mitis';

  @override
  String get levelImmortal => 'Abadi';

  @override
  String get levelTranscendent => 'Transenden';

  @override
  String get levelUltimate => 'Tertinggi';

  @override
  String get challengeCompleteAllRoutines => 'Selesaikan Semua Rutinitas';

  @override
  String get challengeCompleteAllRoutinesDesc =>
      'Selesaikan semua rutinitas hari ini';

  @override
  String get challengeHydrationHero => 'Pahlawan Hidrasi';

  @override
  String get challengeHydrationHeroDesc => 'Capai target minum harianmu';

  @override
  String get challengeEarlySleeper => 'Tidur Awal';

  @override
  String get challengeEarlySleeperDesc => 'Catat tidur 8+ jam';

  @override
  String get challengeExerciseTrio => 'Trio Latihan';

  @override
  String get challengeExerciseTrioDesc => 'Selesaikan 3 rutinitas olahraga';

  @override
  String get challengeMorningStretch => 'Peregangan Pagi';

  @override
  String get challengeMorningStretchDesc =>
      'Lakukan peregangan pagi sebelum jam 09.00';

  @override
  String get challenge7DayWarrior => 'Pejuang 7 Hari';

  @override
  String get challenge7DayWarriorDesc =>
      'Selesaikan semua rutinitas 7 hari berturut-turut';

  @override
  String get challengeGrowthTracker => 'Pemantau Tumbuh';

  @override
  String get challengeGrowthTrackerDesc => 'Catat ukuran tinggi minggu ini';

  @override
  String get challengeHydrationWeek => 'Minggu Hidrasi';

  @override
  String get challengeHydrationWeekDesc =>
      'Capai target minum 5 hari minggu ini';

  @override
  String get challengeFitnessChampion => 'Juara Kebugaran';

  @override
  String get challengeFitnessChampionDesc =>
      'Selesaikan 15 rutinitas olahraga minggu ini';

  @override
  String get challengeSleepMaster => 'Master Tidur';

  @override
  String get challengeSleepMasterDesc => 'Catat tidur 8+ jam selama 5 hari';

  @override
  String get performanceDashboard => 'DASBOR PERFORMA';

  @override
  String get tierA => 'TIER A';

  @override
  String get tierB => 'TIER B';

  @override
  String get tierC => 'TIER C';

  @override
  String get tierD => 'TIER D';

  @override
  String get tierE => 'TIER E';

  @override
  String get maxTierReached => 'TIER TERTINGGI TERCAPAI';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Tier berikutnya: $tier · butuh +$pts poin';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Atur Rutinitas';

  @override
  String get manageRoutinesSubtitle =>
      'Tampilkan atau sembunyikan rutinitas dari daftar harianmu';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible dari $total aktif';
  }

  @override
  String get showAll => 'Tampilkan semua';

  @override
  String get hideAll => 'Sembunyikan semua';

  @override
  String get heightAnalysis => 'Analisis Tinggi';

  @override
  String get heightVsPopulation => 'Posisimu di Grafik Pertumbuhan CDC';

  @override
  String get globalAveragesTable => 'Rata-rata Tinggi per Usia (CDC)';

  @override
  String get standingTall => 'Tinggi';

  @override
  String get standingAboveAverage => 'Di Atas Rata-rata';

  @override
  String get standingBelowAverage => 'Di Bawah Rata-rata';

  @override
  String get standingShort => 'Di Bawah Teman Sebaya';

  @override
  String get yourHeightStanding => 'POSISI TINGGIMU';

  @override
  String get bellCurveCaption => 'Sebaran tinggi di usiamu';

  @override
  String get bellShorterThanYou => 'lebih pendek darimu';

  @override
  String get yourHeight => 'Kamu';

  @override
  String peerAvg(int age) {
    return 'Rata-rata usia $age';
  }

  @override
  String get aboveAvg => 'Di atas rata-rata';

  @override
  String get belowAvg => 'Di bawah rata-rata';

  @override
  String get whoDataSource => 'Grafik Pertumbuhan CDC AS';

  @override
  String get percentileShort5 => 'ke-5';

  @override
  String get percentileShort50 => 'ke-50';

  @override
  String get percentileShort95 => 'ke-95';

  @override
  String get youLabel => 'Kamu';

  @override
  String get avgHeightLabel => 'RATA2';

  @override
  String get percentileLabel => 'PERSENTIL';

  @override
  String get diffLabel => 'SELISIH';

  @override
  String get whoSourceNote =>
      'Sumber data: grafik pertumbuhan CDC AS tahun 2000 (tinggi menurut usia, 2 sampai 20 tahun). Persentil membandingkanmu dengan populasi AS dan bisa berbeda di tiap negara.';

  @override
  String get quickPhotos => 'Foto';

  @override
  String get quickPosture => 'Postur';

  @override
  String get quickWellness => 'Kesehatan';

  @override
  String get quickRecipes => 'Resep';

  @override
  String get wellnessTitle => 'Pantau Kesehatan';

  @override
  String get wellnessHeader => 'KESEHATAN';

  @override
  String get wellnessSubtitle =>
      'Pantau hal-hal yang memengaruhi pertumbuhanmu';

  @override
  String get caffeineToday => 'Kafein Hari Ini';

  @override
  String get withinLimits => 'Masih dalam batas sehat';

  @override
  String get approachingLimit => 'Mendekati batas';

  @override
  String get overLimit => 'Lewat batas, ganggu HGH';

  @override
  String get resetToday => 'Reset hari ini';

  @override
  String get stressToday => 'Stres Hari Ini';

  @override
  String get stressVeryCalmLabel => 'Sangat tenang, ideal untuk tumbuh';

  @override
  String get stressCalmLabel => 'Tenang';

  @override
  String get stressNeutralLabel => 'Biasa';

  @override
  String get stressStressedLabel => 'Stres';

  @override
  String get stressVeryStressedLabel => 'Sangat stres, kortisol menghambat HGH';

  @override
  String get stressTapToLog => 'Ketuk untuk catat perasaanmu hari ini';

  @override
  String get todaysJournal => 'Jurnal Hari Ini';

  @override
  String get journalNoNote => '(tanpa catatan)';

  @override
  String get journalEdit => 'Edit';

  @override
  String get journalHowWasToday => 'Gimana hari ini?';

  @override
  String get journalSaved => 'Jurnal tersimpan · +5 XP';

  @override
  String get journalSaveEntry => 'Simpan catatan';

  @override
  String get weeklyInsight => 'Wawasan Mingguan';

  @override
  String get weeklyInsightCaffeine => 'KAFEIN';

  @override
  String get weeklyInsightStress => 'STRES';

  @override
  String get weeklyInsightMood => 'SUASANA HATI';

  @override
  String get wellnessInfoTitle => 'Kenapa kesehatan itu penting';

  @override
  String get wellnessInfoBody =>
      'Kafein mengganggu tidur nyenyak, padahal saat itulah sebagian besar hormon pertumbuhan (HGH) dilepaskan. Stres berkepanjangan menaikkan kortisol, yang langsung menekan HGH. Menulis jurnal membantumu konsisten dengan kebiasaan yang mendukung pertumbuhan.';

  @override
  String get wellnessInfoGotIt => 'Oke, paham';

  @override
  String get insightCaffeineHigh =>
      'Kafeinmu tinggi minggu ini. Coba kurangi biar tidur dan HGH lebih baik.';

  @override
  String get insightStressHigh =>
      'Stresmu naik minggu ini. Coba latihan pernapasan: kortisol menghambat pertumbuhan.';

  @override
  String get insightMoodLow =>
      'Suasana hatimu lagi turun. Sinar matahari, tidur, dan olahraga ringan semuanya membantu.';

  @override
  String get insightGreat =>
      'Keseimbangan yang bagus minggu ini. Kesehatanmu mendukung pertumbuhan optimal.';

  @override
  String get insightDefault =>
      'Kesehatanmu sesuai jalur. Terus catat untuk wawasan yang lebih dalam.';

  @override
  String get insightNeedMoreData =>
      'Catat beberapa hari lagi untuk melihat wawasan.';

  @override
  String get progressPhotosTitle => 'Foto Progres';

  @override
  String get progressPhotosHeader => 'FOTO PROGRES';

  @override
  String get progressPhotosSubtitle => 'Pantau perjalanan visualmu';

  @override
  String get addProgressPhoto => 'Tambah Foto Progres';

  @override
  String get captureJourney => 'Abadikan perjalanan visualmu';

  @override
  String get takePhoto => 'Ambil Foto';

  @override
  String get chooseFromLibrary => 'Pilih dari Galeri';

  @override
  String get deletePhotoTitle => 'Hapus Foto?';

  @override
  String get deletePhotoBody =>
      'Foto ini akan dihapus dari linimasa progresmu.';

  @override
  String get timelineTab => 'Linimasa';

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
      'Ambil foto pertamamu untuk mulai memantau progres visual.';

  @override
  String get takeFirstPhoto => 'Ambil Foto Pertama';

  @override
  String get beforeAfter => 'SEBELUM / SESUDAH';

  @override
  String get beforeLabel => 'SEBELUM';

  @override
  String get afterLabel => 'SESUDAH';

  @override
  String get yourHeightDialog => 'Tinggimu';

  @override
  String get heightDialogMessage => 'Isi tinggimu saat ini untuk foto ini';

  @override
  String get postureAnalysisTitle => 'Analisis Postur';

  @override
  String get postureCoachHeader => 'PELATIH POSTUR';

  @override
  String get postureCoachSubtitle => 'Cek sendiri dengan foto dari samping';

  @override
  String get latestScore => 'SKOR TERAKHIR';

  @override
  String get latestAnalysis => 'ANALISIS TERAKHIR';

  @override
  String get headPosition => 'Posisi Kepala';

  @override
  String get progressLabel => 'PROGRES';

  @override
  String get choosePhotoSource => 'Pilih Sumber Foto';

  @override
  String get sideProfileHint => 'Dari samping, seluruh badan masuk bingkai';

  @override
  String get howToTakePhoto => 'CARA MENGAMBIL FOTO';

  @override
  String get takePosturePhoto => 'Ambil Foto Postur';

  @override
  String get postureExcellent => 'Sangat Baik';

  @override
  String get postureGood => 'Baik';

  @override
  String get postureNeedsWork => 'Perlu dilatih';

  @override
  String get posturePoor => 'Buruk';

  @override
  String get recommendedExercises => 'LATIHAN YANG DISARANKAN';

  @override
  String get postureWallStand => 'Berdiri di Dinding';

  @override
  String get postureWallStandDesc =>
      'Berdiri dengan punggung menempel dinding 2 menit setiap hari.';

  @override
  String get postureChestOpener => 'Pembuka Dada';

  @override
  String get postureChestOpenerDesc =>
      'Melemaskan otot dada kaku yang menarik bahu ke depan.';

  @override
  String get postureChinTucks => 'Tarik Dagu';

  @override
  String get postureChinTucksDesc => 'Perbaiki posisi kepala maju — 3×10 kali.';

  @override
  String get postureDeadbug => 'Deadbug';

  @override
  String get postureDeadbugDesc =>
      'Menguatkan otot inti dalam untuk mengontrol lordosis.';

  @override
  String get recipesTitle => 'Resep';

  @override
  String get recipesHeader => 'RESEP';

  @override
  String get recipesSubtitle => 'Bahan bakar untuk tumbuh';

  @override
  String get recipesCategoryAll => 'Semua';

  @override
  String get recipesCategoryBreakfast => 'Sarapan';

  @override
  String get recipesCategoryLunch => 'Makan Siang';

  @override
  String get recipesCategoryDinner => 'Makan Malam';

  @override
  String get recipesCategorySnack => 'Camilan';

  @override
  String get recipesGoalAll => 'Semua';

  @override
  String get recipeDiffEasy => 'Mudah';

  @override
  String get recipeDiffMedium => 'Sedang';

  @override
  String get recipeDiffHard => 'Sulit';

  @override
  String get recipesFilterType => 'JENIS';

  @override
  String get recipesFilterNutrient => 'KAYA AKAN';

  @override
  String get recipesGoalVitaminD => 'Vitamin D';

  @override
  String get recipesGoalZinc => 'Zinc';

  @override
  String get recipesGoalMagnesium => 'Magnesium';

  @override
  String recipesCountLabel(int count) {
    return '$count resep';
  }

  @override
  String get recipeIngredients => 'Bahan';

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
  String get recipesNoMatch => 'Tidak ada resep yang cocok dengan filter ini';

  @override
  String get recipesIngredients => 'Bahan';

  @override
  String get recipesInstructions => 'Langkah';

  @override
  String get recipesClose => 'TUTUP';

  @override
  String get recipesAboutTitle => 'Tentang Resep';

  @override
  String get recipesAboutBody =>
      'Resep pilihan untuk mendukung pertumbuhanmu. Filter berdasarkan jenis makanan atau target gizi untuk menemukan yang cocok dengan rencanamu.';

  @override
  String get animHintSpinalDecomp => 'Peregangan tulang belakang';

  @override
  String get animHintGravityReversal => 'Membalik gravitasi';

  @override
  String get animHintImpactBones => 'Beban benturan untuk tulang';

  @override
  String get animHintHighImpact => 'Beban tulang intensitas tinggi';

  @override
  String get animHintMetabolicBurst => 'Latihan ledakan metabolik';

  @override
  String get animHintFullBodyStretch => 'Peregangan seluruh tubuh';

  @override
  String get animHintSpinalExtension => 'Ekstensi tulang belakang';

  @override
  String get animHintCervicalDecomp => 'Peregangan leher';

  @override
  String get animHintShoulderMobility => 'Mobilitas bahu';

  @override
  String get animHintFullBodyMotion => 'Gerakan seluruh tubuh';

  @override
  String get animHintPosteriorChain => 'Peregangan tubuh belakang';

  @override
  String get animHintMuscleGrowth => 'Nutrisi untuk otot';

  @override
  String get animHintBoneDensity => 'Dukung kepadatan tulang';

  @override
  String get animHintSpinalDisc => 'Hidrasi bantalan tulang belakang';

  @override
  String get animHintCleanNutrition => 'Makan bersih';

  @override
  String get animHintIgf1 => 'Optimasi IGF-1';

  @override
  String get animHintHghAmino => 'Asam amino pemicu HGH';

  @override
  String get animHintCalciumAbsorption => 'Penyerapan kalsium';

  @override
  String get animHintSpinalAlignment => 'Kelurusan tulang belakang';

  @override
  String get animHintPostureCorrection => 'Koreksi postur';

  @override
  String get animHintMindBody => 'Keseimbangan pikiran-tubuh';

  @override
  String get animHintCoreStability => 'Stabilitas otot inti';

  @override
  String get animHintLegPower => 'Kekuatan kaki & lonjakan HGH';

  @override
  String get animHintVerticalPower => 'Kekuatan lompat';

  @override
  String get animHintHghSurge => 'Latihan lonjakan HGH';

  @override
  String get animHintPeakHgh => 'Waktu puncak pelepasan HGH';

  @override
  String get animHintMelatonin => 'Optimasi melatonin';

  @override
  String get animHintDeepSleep => 'Persiapan tidur nyenyak';

  @override
  String get animHintSleepOpt => 'Optimasi tidur';

  @override
  String get animHintExercise => 'Olahraga';

  @override
  String get formMorningStretch =>
      'Mulai dengan memutar leher, lalu lanjut peregangan seluruh tubuh. Tahan tiap peregangan 20-30 detik tanpa memantul.';

  @override
  String get formBarHanging =>
      'Pegang palang selebar bahu, lemaskan seluruh badan, biarkan gravitasi meregangkan tulang belakang. Jangan berayun.';

  @override
  String get formCobraStretch =>
      'Tengkurap, taruh tangan di bawah bahu, dorong badan atas perlahan sambil pinggul tetap di lantai. Lihat ke atas.';

  @override
  String get formJumping =>
      'Lakukan squat jump atau lompat tali. Mendarat pelan di ujung telapak kaki. Istirahat 30 detik antar set.';

  @override
  String get formSwimmingBasketball =>
      'Pilih renang (gaya bebas/punggung) atau basket. Fokus pada lompatan, meraih, dan gerakan penuh.';

  @override
  String get formEveningYoga =>
      'Lakukan pose ringan: cat-cow, child pose, downward dog, forward fold. Tarik napas dalam dan tahan tiap pose 30-60 detik.';

  @override
  String get formSprintIntervals =>
      'Pemanasan 5 menit, lalu sprint sekuat tenaga 30 detik. Jalan atau jogging 90 detik untuk pulih. Ulangi.';

  @override
  String get formHiitWorkout =>
      'Lakukan burpee, mountain climber, dan jump squat dengan intensitas maksimal 45 detik, istirahat 15 detik.';

  @override
  String get formSquats =>
      'Berdiri dengan kaki selebar bahu. Turunkan badan sampai paha sejajar lantai. Punggung tegak dan lutut tidak melewati jari kaki.';

  @override
  String get formDeadliftStretch =>
      'Berdiri dengan kaki selebar pinggul, tekuk di pinggul dengan punggung lurus. Raih jari kaki, rasakan regangan di paha belakang dan punggung.';

  @override
  String get formOverheadPress =>
      'Berdiri tegak, dorong tangan ke atas sampai lurus penuh. Pakai beban ringan atau berat badan. Kencangkan otot inti dan jangan melengkungkan punggung.';

  @override
  String get formSkippingRope =>
      'Lompat dengan kedua kaki, mendarat pelan di ujung telapak kaki. Lompat rendah dan stabil. Istirahat antar set.';

  @override
  String get formPilatesCore =>
      'Lakukan plank, dead bug, bird dog, bridge, dan angkat kaki. Fokus pada gerakan terkontrol dan napas.';

  @override
  String get formInversionHang =>
      'Pakai meja inversi atau sepatu gravitasi. Mulai dari kemiringan kecil lalu naikkan perlahan. Jangan lama-lama.';

  @override
  String get formProtein =>
      'Bagi asupan protein ke 3-4 kali makan. Masukkan telur, ayam, ikan, susu, dan kacang-kacangan.';

  @override
  String get formCalciumVitaminD =>
      'Konsumsi 3 porsi susu dan olahannya setiap hari, dan kena sinar matahari 15 menit untuk pembentukan vitamin D alami.';

  @override
  String get formWater =>
      'Minum air secara rutin sepanjang hari. Bawa botol minum dan pasang pengingat tiap jam.';

  @override
  String get formAvoidJunk =>
      'Ganti makanan cepat saji dengan makanan utuh. Ganti minuman manis dengan air. Baca label dan hindari bahan olahan.';

  @override
  String get formZincIntake =>
      'Masukkan daging merah, biji labu, kacang arab, kacang mete, dan tiram ke menumu. Targetkan 8-11mg per hari.';

  @override
  String get formVitaminDSunlight =>
      'Biarkan lengan dan wajah kena sinar matahari langsung 15 menit, sebaiknya sebelum siang. Untuk durasi ini tidak perlu tabir surya.';

  @override
  String get formArginineFoods =>
      'Masukkan kacang, biji-bijian, kalkun, ayam, kedelai, dan susu ke menumu. Paling baik dikonsumsi sebelum tidur.';

  @override
  String get formDailyCalories =>
      'Bagi kalorimu ke 3-5 kali makan dan jangan lewatkan sarapan. Utamakan makanan utuh daripada kalori kosong.';

  @override
  String get formQualitySleep =>
      'Tidur paling lambat jam 22.00. Jaga kamar tetap gelap dan sejuk. Hindari kafein setelah jam 14.00.';

  @override
  String get formNoScreen =>
      'Pasang alarm 1 jam sebelum tidur. Simpan semua layar. Baca buku atau lakukan peregangan ringan sebagai gantinya.';

  @override
  String get formSleepEnvironment =>
      'Pakai tirai gelap, jaga suhu kamar 18-20°C, matikan semua sumber cahaya. Pakai kasur dan bantal yang nyaman.';

  @override
  String get formPreSleepRoutine =>
      'Mulai 30 menit sebelum tidur: redupkan lampu, baca buku, latihan napas, hindari aktivitas yang bikin melek.';

  @override
  String get formPostureCheck =>
      'Berdiri tegak dengan bahu ke belakang dan turun. Kencangkan otot inti sedikit. Bayangkan ada tali yang menarikmu dari puncak kepala.';

  @override
  String get formWallStand =>
      'Berdiri dengan tumit, bokong, tulang belikat, dan kepala menempel dinding. Tahan 5 menit. Bernapas normal.';

  @override
  String get formNeckStretches =>
      'Miringkan kepala pelan ke tiap sisi, ke depan, dan ke belakang. Tahan tiap arah 30 detik. Jangan dipaksa.';

  @override
  String get formShoulderRolls =>
      'Putar bahu ke depan 15 kali, lalu ke belakang 15 kali. Lanjutkan peregangan membuka dada, tahan 20 detik.';

  @override
  String get sciMorningStretch =>
      'Peregangan pagi meregangkan bantalan tulang belakang yang terhidrasi semalaman, membantu mempertahankan tinggi';

  @override
  String get sciBarHanging =>
      'Bergantung meregangkan bantalan ruas tulang belakang dengan bantuan gravitasi, bisa menambah tinggi sementara';

  @override
  String get sciCobraStretch =>
      'Peregangan kobra meluruskan tulang belakang dan membuka dada, melawan tekanan tulang belakang akibat duduk';

  @override
  String get sciJumping =>
      'Lompatan berintensitas tinggi merangsang lempeng pertumbuhan di kaki dan memicu pelepasan hormon pertumbuhan';

  @override
  String get sciSwimmingBasketball =>
      'Renang dan basket melibatkan peregangan seluruh tubuh, melompat, dan meraih yang merangsang aktivitas lempeng pertumbuhan';

  @override
  String get sciEveningYoga =>
      'Yoga malam menurunkan kortisol yang menghambat hormon pertumbuhan, dan meregangkan otot untuk pemulihan malam';

  @override
  String get sciSprintIntervals =>
      'Sprint memicu pelepasan hormon pertumbuhan yang besar';

  @override
  String get sciHiitWorkout =>
      'Olahraga intensitas tinggi meningkatkan HGH hingga 450%';

  @override
  String get sciSquats =>
      'Squat merangsang lempeng pertumbuhan di kaki dan tulang belakang';

  @override
  String get sciDeadliftStretch =>
      'Peregangan tulang belakang menjaga kesehatan bantalan ruas tulang';

  @override
  String get sciOverheadPress =>
      'Mendorong ke atas kepala meregangkan tulang belakang dan menguatkan otot postur';

  @override
  String get sciSkippingRope =>
      'Lompatan berulang merangsang lempeng pertumbuhan di tubuh bagian bawah';

  @override
  String get sciPilatesCore =>
      'Otot inti yang kuat mendukung kelurusan tulang belakang dan postur';

  @override
  String get sciInversionHang =>
      'Posisi terbalik meregangkan bantalan tulang belakang, bisa menambah 1-2cm sementara';

  @override
  String get sciProtein =>
      'Protein menyediakan asam amino penting untuk pertumbuhan tulang dan otot, terutama saat masa lonjakan tumbuh';

  @override
  String get sciCalciumVitaminD =>
      'Kalsium dan vitamin D adalah bahan utama untuk kepadatan tulang dan pertumbuhan panjang tulang';

  @override
  String get sciWater =>
      'Hidrasi penting untuk mengangkut nutrisi ke lempeng pertumbuhan dan menjaga kesehatan tulang rawan sendi';

  @override
  String get sciAvoidJunk =>
      'Makanan olahan dan gula memicu peradangan dan lonjakan insulin yang menekan sekresi hormon pertumbuhan';

  @override
  String get sciZincIntake => 'Zinc penting untuk produksi hormon pertumbuhan';

  @override
  String get sciVitaminDSunlight =>
      'Vitamin D penting untuk penyerapan kalsium dan pertumbuhan tulang';

  @override
  String get sciArginineFoods =>
      'L-Arginin merangsang sekresi hormon pertumbuhan';

  @override
  String get sciDailyCalories =>
      'Kekurangan kalori terus-menerus menurunkan IGF-1 dan melemahkan denyut hormon pertumbuhan, langsung memperlambat pertumbuhan tinggi di masa remaja';

  @override
  String get sciQualitySleep =>
      '70-80% hormon pertumbuhan harian dilepaskan saat tidur nyenyak, terutama antara jam 22.00 dan 02.00';

  @override
  String get sciNoScreen =>
      'Cahaya biru dari layar menekan produksi melatonin, bikin susah tidur dan menurunkan kualitas tidur nyenyak';

  @override
  String get sciSleepEnvironment =>
      'Kamar gelap dan sejuk memaksimalkan melatonin dan hormon pertumbuhan';

  @override
  String get sciPreSleepRoutine =>
      'Rutinitas sebelum tidur yang konsisten meningkatkan kualitas tidur nyenyak sebesar 23%';

  @override
  String get sciPostureCheck =>
      'Postur yang benar bisa langsung menambah 2-3 cm tinggi yang terlihat dan mencegah tekanan pada tulang belakang';

  @override
  String get sciWallStand =>
      'Berdiri di dinding melatih memori otot postur, membantu menjaga tulang belakang tetap lurus sepanjang hari';

  @override
  String get sciNeckStretches =>
      'Peregangan leher mengurangi tekanan dan memperbaiki kelurusan leher';

  @override
  String get sciShoulderRolls =>
      'Membuka bahu memperbaiki postur membungkuk, bisa terlihat 1-2cm lebih tinggi';

  @override
  String get muscleSpine => 'Tulang Belakang';

  @override
  String get muscleLegs => 'Kaki';

  @override
  String get muscleBack => 'Punggung';

  @override
  String get muscleShoulders => 'Bahu';

  @override
  String get muscleArms => 'Lengan';

  @override
  String get muscleCore => 'Otot Inti';

  @override
  String get muscleChest => 'Dada';

  @override
  String get muscleCalves => 'Betis';

  @override
  String get muscleFullBody => 'Seluruh Tubuh';

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
  String get muscleUpperBack => 'Punggung Atas';

  @override
  String get createRoutine => 'Buat Rutinitas';

  @override
  String get createRoutineTitle => 'Buat Rutinitas Sendiri';

  @override
  String get createRoutineSubtitle => 'Susun rutinitas harianmu sendiri';

  @override
  String get routineIcon => 'Ikon';

  @override
  String get routineTitleField => 'Judul';

  @override
  String get routineDescField => 'Deskripsi';

  @override
  String get routineDescHint => 'Ringkasan singkat rutinitas';

  @override
  String get routineCategoryField => 'Kategori';

  @override
  String get routineDifficultyField => 'Tingkat Kesulitan';

  @override
  String get routineDurationField => 'Durasi';

  @override
  String get routineSetsRepsField => 'Set x Repetisi';

  @override
  String get routineFormField => 'Gerakan & Petunjuk';

  @override
  String get routineFormHint => 'Opsional: cara melakukan rutinitas ini';

  @override
  String get diffBeginner => 'Pemula';

  @override
  String get diffIntermediate => 'Menengah';

  @override
  String get diffAdvanced => 'Mahir';

  @override
  String get catExercise => 'Olahraga';

  @override
  String get catNutrition => 'Nutrisi';

  @override
  String get catSleep => 'Tidur';

  @override
  String get catPosture => 'Postur';

  @override
  String get postureTip1 => 'Berdiri menyamping (tampak samping) ke kamera.';

  @override
  String get postureTip2 => 'Jaga jarak ~2 meter dari lensa.';

  @override
  String get postureTip3 => 'Lengan santai, pandangan lurus ke depan.';

  @override
  String get postureTip4 => 'Pakai baju yang pas badan biar skornya akurat.';

  @override
  String get postureTip5 => 'Pakai cahaya yang cukup dan latar polos.';

  @override
  String get kyphosisLabel => 'Kifosis (punggung atas)';

  @override
  String get lordosisLabel => 'Lordosis (punggung bawah)';

  @override
  String get analyzingPosture => 'MENGANALISIS POSTUR';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get termsOfService => 'Ketentuan Layanan';

  @override
  String version(String ver) {
    return 'Versi $ver';
  }

  @override
  String get rateApp => 'Beri Rating BeTaller';

  @override
  String get rateAppSubtitle => 'Ulasanmu membantu kami berkembang!';

  @override
  String get unitSystem => 'Sistem Satuan';

  @override
  String get unitMetric => 'Metrik (cm, kg)';

  @override
  String get unitImperial => 'Imperial (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'Penafian Kesehatan';

  @override
  String get healthDisclaimerBody =>
      'BeTaller memberikan panduan umum kesehatan dan kebugaran. Hasil bisa berbeda tergantung usia, genetik, dan faktor pribadi. Aplikasi ini tidak memberikan saran medis. Latihan berfokus pada perbaikan postur, kesehatan tulang belakang, dan dukungan hormon pertumbuhan lewat kebiasaan alami. Konsultasikan dengan tenaga kesehatan sebelum memulai program olahraga atau nutrisi baru. Perubahan tinggi setelah lempeng pertumbuhan menutup (biasanya usia 18-25) terutama berasal dari perbaikan postur.';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'Penuhi minimal ${grams}g protein hari ini — dihitung dari berat badanmu.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'Minum minimal ${liters}L air hari ini — dihitung dari berat badanmu.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'Targetkan sekitar $kcal kcal hari ini untuk mendukung pertumbuhan.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'Penuhi $iu IU vitamin D hari ini — dari sinar matahari, makanan, atau suplemen.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'Penuhi ${mg}mg zinc hari ini untuk mendukung produksi hormon pertumbuhan.';
  }

  @override
  String get nutritionSupplementsTitle => 'SUPLEMEN';

  @override
  String get nutritionSupplementsDisclaimer =>
      'Hanya pendukung, bukan pengganti makanan. Tanya dokter dulu sebelum mulai suplemen apa pun, apalagi kalau kamu di bawah 18 tahun.';

  @override
  String get supplementVitaminDName => 'Vitamin D3';

  @override
  String get supplementVitaminDDose => '3.000 IU';

  @override
  String get supplementVitaminDBenefit =>
      'Meningkatkan penyerapan kalsium untuk kepadatan tulang dan kesehatan lempeng pertumbuhan';

  @override
  String get supplementZincName => 'Zinc';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit =>
      'Mineral kunci untuk produksi hormon pertumbuhan';

  @override
  String get supplementMagnesiumName => 'Magnesium';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit =>
      'Mendukung tahap tidur nyenyak, saat sebagian besar hormon pertumbuhan dilepaskan';

  @override
  String get supplementCalciumName => 'Kalsium';

  @override
  String get supplementCalciumDose => '1.000-1.300mg';

  @override
  String get supplementCalciumBenefit =>
      'Bahan utama kepadatan tulang dan lempeng pertumbuhan';

  @override
  String get supplementOmega3Name => 'Omega-3';

  @override
  String get supplementOmega3Dose => '1.000mg';

  @override
  String get supplementOmega3Benefit =>
      'Mengurangi peradangan dan mendukung fungsi lempeng pertumbuhan yang sehat';

  @override
  String get supplementCollagenName => 'Kolagen + Vitamin C';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit =>
      'Vitamin C membantu tubuhmu memakai kolagen untuk membangun tulang rawan dan matriks tulang';

  @override
  String get sciSourcePrefix => 'Sumber: ';

  @override
  String get program => 'Program';

  @override
  String get todaysExercises => 'LATIHAN HARI INI';

  @override
  String get dailyNutritionPlan => 'RENCANA NUTRISI HARIAN';

  @override
  String get nutritionGoalsComplete => '🎉 Semua target nutrisi tercapai!';

  @override
  String get nutritionGoalsIncomplete =>
      'Capai target nutrisimu untuk pertumbuhan optimal';

  @override
  String get postureDetectingAlignment =>
      'Mendeteksi kelurusan tulang belakang...';

  @override
  String get testimonial1 =>
      'Aku sudah pasrah karena umurku, tapi aku tumbuh dengan BeTaller. Rasa percaya diriku belum pernah setinggi ini.';

  @override
  String get testimonialDuration1 => '4 bulan';

  @override
  String get testimonial2 =>
      'Semua orang bilang \"kamu sudah nggak bisa tumbuh lagi.\" Aku pakai BeTaller dan bikin semua orang kaget.';

  @override
  String get testimonialDuration2 => '3 bulan';

  @override
  String get testimonial3 =>
      'Setelah mulai rutinitasnya, aku makin tinggi dan postur makin bagus. Semua orang sadar bedanya.';

  @override
  String get testimonialDuration3 => '6 bulan';

  @override
  String get testimonial4 =>
      'Aku masih di masa pertumbuhan dan efek BeTaller luar biasa. Aku merasa lebih tinggi dan lebih kuat.';

  @override
  String get testimonialDuration4 => '3 bulan';

  @override
  String get testimonial5 =>
      'Bohong kalau aku bilang nggak pernah coba BeTaller. Bedanya cepat kerasa, sangat direkomendasikan.';

  @override
  String get testimonialDuration5 => '4 bulan';

  @override
  String get designedForYou => 'Dirancang untukmu';

  @override
  String get designedForYouDesc =>
      'BeTaller dibuat khusus agar kamu mencapai batas genetikmu, bahkan melampauinya. Setiap fitur, untukmu.';

  @override
  String get greetingAllDone => 'Mantap! 🎯';

  @override
  String get greetingAllDoneSub => 'Kamu sudah menyelesaikan tugas hari ini.';

  @override
  String greetingStreak30(int streak) {
    return 'Streak $streak hari. Level legenda.';
  }

  @override
  String greetingStreak7(int streak) {
    return 'Streak $streak hari. Pertahankan.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak hari berturut-turut. Kebanyakan orang menyerah. Kamu tidak.';
  }

  @override
  String get greetingMorning => 'Selamat pagi. Hari baru, kesempatan baru.';

  @override
  String get greetingAfternoon =>
      'Hari ini waktu yang pas untuk mulai streak-mu.';

  @override
  String get greetingEvening => 'Selesaikan tugasmu, mulai streak-mu.';

  @override
  String get todayCompleted => 'Hari ini selesai ✓';

  @override
  String get todayGoals => 'Target hari ini';

  @override
  String get challengesLabel => 'Tantangan';

  @override
  String get dailyChallengesLabel => 'TANTANGAN HARIAN';

  @override
  String get expiresTonight => 'Berakhir malam ini';

  @override
  String get allChallengesCompleted => 'Semua selesai ✓';

  @override
  String get challengesLoading => 'Tantangan baru segera muncul.';

  @override
  String get challengesLoadingTitle => 'Tantangan harian';

  @override
  String get behindPace => 'Tertinggal';

  @override
  String get growthTracking => 'Pantau pertumbuhan';

  @override
  String get growthEmptyFirst => 'Catat tinggi pertamamu untuk mulai memantau.';

  @override
  String get growthEmptySecond => 'Catat ukuran keduamu untuk melihat grafik.';

  @override
  String get growthSectionLabel => 'PERTUMBUHAN';

  @override
  String get generalPerformance => 'PERFORMA KESELURUHAN';

  @override
  String get analysisBalance => 'Keseimbanganmu';

  @override
  String get analysisWeakest => 'Titik terlemahmu';

  @override
  String get analysisPrediction => 'Prediksi tinggi';

  @override
  String get analysisComparison => 'Perbandingan';

  @override
  String get analysisGrowth => 'Status pertumbuhan';

  @override
  String get analysisWeakestHint =>
      'Di sinilah cara tercepat menaikkan skormu.';

  @override
  String get exploreLabel => 'JELAJAHI';

  @override
  String get explorePosture => 'Analisis Postur';

  @override
  String get explorePostureSub => 'Analisis postur dan tips perbaikan';

  @override
  String get explorePhotos => 'Foto Progres';

  @override
  String get explorePhotosSub => 'Pantau perubahanmu lewat foto';

  @override
  String get exploreNutrition => 'Nutrisi';

  @override
  String get exploreNutritionSub => 'Panduan protein, kalsium, dan vitamin';

  @override
  String get exploreHealth => 'Pantau Kesehatan';

  @override
  String get exploreHealthSub => 'Pantau stres, kafein, dan kesehatan';

  @override
  String get exploreRecipes => 'Resep Tumbuh';

  @override
  String get exploreRecipesSub => 'Resep yang mendukung pertumbuhan';

  @override
  String get educationLabel => 'EDUKASI';

  @override
  String get educationTitle => 'Ilmu tentang\ntumbuh tinggi';

  @override
  String get educationSubtitle => 'Konten ahli, riset, dan panduan';

  @override
  String get aiAnalysisLabel => 'ANALISIS PERTUMBUHAN';

  @override
  String get peerCompareLabel => 'BANDINGKAN DENGAN TEMAN SEBAYA';

  @override
  String peerCompareText(int topPct) {
    return 'Kamu masuk $topPct% teratas di antara teman sebaya';
  }

  @override
  String get notifWaterTitle => '💧 Jangan Lupa Minum Air!';

  @override
  String get notifWaterBody =>
      'Sudah capai target minum hari ini? Minum segelas lagi!';

  @override
  String get notifMorningTitle => '🌅 Selamat Pagi! Waktunya Olahraga';

  @override
  String get notifMorningBody =>
      'Lakukan peregangan pagimu! 10 menit peregangan tulang belakang dan kaki.';

  @override
  String get notifRoutineTitle => '🔥 Selesaikan Rutinitasmu!';

  @override
  String get notifRoutineBody =>
      'Cek rutinitasmu sebelum hari berakhir. Streak = disiplin!';

  @override
  String get notifProteinTitle => '🥚 Hari Protein!';

  @override
  String get notifProteinBody =>
      'Mulai minggu dengan kuat! Makan protein tiap kali makan.';

  @override
  String get notifNewWeekTitle => '✨ Minggu Baru, Target Baru!';

  @override
  String get notifNewWeekBody =>
      'Jangan lewatkan rutinitas minggu ini. Langkah kecil, perbedaan besar!';

  @override
  String get notifSleepTitle => '😴 Waktunya Tidur!';

  @override
  String get notifSleepBody =>
      'Hormon pertumbuhan memuncak antara jam 22.00-02.00. Taruh HP-mu!';

  @override
  String get notifPostureTitle => '🧍 Cek Postur!';

  @override
  String get notifPostureBody =>
      'Punggung tegak, bahu ke belakang. Postur bagus = beda 2-3 cm!';

  @override
  String get notifVitaminDTitle => '☀️ Waktunya Vitamin D!';

  @override
  String get notifVitaminDBody =>
      'Berjemur 15 menit! Vitamin D meningkatkan penyerapan kalsium.';

  @override
  String get notifMidweekTitle => '✨ Sudah Setengah Jalan!';

  @override
  String get notifMidweekBody =>
      'Cek tengah minggu. Tumbuh butuh sabar, tapi yang konsisten yang menang!';

  @override
  String get notifScreenTitle => '📵 Matikan Layar!';

  @override
  String get notifScreenBody =>
      'Tanpa layar 1 jam sebelum tidur. Cahaya biru menghambat melatonin!';

  @override
  String get notifJumpTitle => '🦘 Waktunya Lompat!';

  @override
  String get notifJumpBody =>
      'Latihan lompat merangsang lempeng pertumbuhan. Coba 3 x 20 kali!';

  @override
  String get notifCalciumTitle => '🥛 Waktunya Kalsium!';

  @override
  String get notifCalciumBody =>
      'Segelas susu atau yogurt. Kalsium penting banget untuk tulang!';

  @override
  String get notifPostureCheckTitle => '🧍 Cek Postur!';

  @override
  String get notifPostureCheckBody =>
      'Jangan menunduk ke HP! Duduk dan jalan dengan tegak.';

  @override
  String get notifWeekendTitle => '✨ Motivasi Akhir Pekan';

  @override
  String get notifWeekendBody =>
      'Jangan bolos rutinitas di akhir pekan! Disiplin berlaku tiap hari.';

  @override
  String get notifWeeklyProgressTitle => '📊 Progres Mingguan';

  @override
  String get notifWeeklyProgressBody =>
      'Gimana minggumu? Cek grafik pertumbuhanmu!';

  @override
  String get notifMeasureTitle => '📏 Ukur Mingguan!';

  @override
  String get notifMeasureBody =>
      'Ukur dan catat tinggimu! Ukuran pagi paling akurat.';

  @override
  String get notifEarlySleepTitle => '😴 Tidur Lebih Awal!';

  @override
  String get notifEarlySleepBody =>
      'Besok Senin! Mulai minggu dengan kuat lewat tidur yang cukup.';

  @override
  String get notifStreak3Title => '🔥 Streak 3 Hari!';

  @override
  String get notifStreak3Body =>
      'Awal yang keren! 3 hari berturut-turut. Lanjut sampai 7!';

  @override
  String get notifStreak7Title => '🏆 Streak 1 Minggu!';

  @override
  String get notifStreak7Body =>
      'Luar biasa! 7 hari berturut-turut rutinitas selesai!';

  @override
  String get notifStreak14Title => '⭐ Streak 2 Minggu!';

  @override
  String get notifStreak14Body => '14 hari disiplin! Tubuhmu mulai berubah.';

  @override
  String get notifStreak30Title => '👑 Streak 1 Bulan!';

  @override
  String get notifStreak30Body => '30 hari! Kamu juara!';

  @override
  String get notifStreak60Title => '🌟 Streak 60 Hari!';

  @override
  String get notifStreak60Body => '60 hari! Pencapaian yang luar biasa.';

  @override
  String get notifStreak100Title => '💎 100 HARI! LEGENDA!';

  @override
  String get notifStreak100Body =>
      '100 hari berturut-turut! Kamu sudah jadi legenda.';

  @override
  String get notifStreakRiskTitle => '⚠️ Jangan Sampai Streak Putus!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Streak $streak harimu terancam! Selesaikan rutinitasmu.';
  }

  @override
  String get paywallStat1 => 'cm — potensimu masih terkunci';

  @override
  String get paywallTitle1 => 'Berapa cm Lagi\nKamu Bisa Tumbuh?';

  @override
  String get paywallBullet1a => 'Batas genetikmu sudah dihitung, mau lihat?';

  @override
  String get paywallBullet1b =>
      'Bagaimana gaya hidupmu memengaruhi pertumbuhan?';

  @override
  String get paywallBullet1c => 'Peta jalan pribadimu sudah menunggu';

  @override
  String get paywallStat2 => 'rutinitas khususmu sudah siap';

  @override
  String get paywallTitle2 => 'Rencanamu\nSudah Siap';

  @override
  String get paywallBullet2a =>
      '8 menit tiap pagi — dirancang untuk tulang belakangmu';

  @override
  String get paywallBullet2b => 'Tidur, nutrisi, air — semua terpantau';

  @override
  String get paywallBullet2c =>
      'Selangkah lebih dekat tiap hari, jangan putus streak-nya';

  @override
  String get paywallStat3 => 'grafik progres real-time';

  @override
  String get paywallTitle3 => 'Pantau\nPertumbuhanmu';

  @override
  String get paywallBullet3a =>
      'Ukur tiap bulan — lihat pertumbuhanmu dengan mata sendiri';

  @override
  String get paywallBullet3b =>
      'Tampak 2 cm lebih tinggi sekarang juga dengan analisis postur';

  @override
  String get paywallBullet3c => 'Foto progres — kamu akan lihat bedanya';

  @override
  String get paywallStat4 => 'program harian — terus naik level';

  @override
  String get paywallTitle4 => 'Makin Kuat\nSetiap Hari';

  @override
  String get paywallBullet4a =>
      'Kumpulkan XP, buka level — kebiasaan jadi permainan';

  @override
  String get paywallBullet4b =>
      'Yang sudah capai targetnya juga lewat jalan ini';

  @override
  String get paywallBullet4c => 'Mulai sekarang — minggu pertama gratis';

  @override
  String get paywallRestore => 'Tidak ada pembelian sebelumnya';

  @override
  String get paywallRestoreNotFound => 'Tidak ada pembelian sebelumnya';

  @override
  String get paywallPromoCode => 'Punya kode promo?';

  @override
  String get paywallHeightUnit => 'target tinggi';

  @override
  String get paywallHeightTitle => 'Seberapa tinggi lagi kamu bisa tumbuh?';

  @override
  String get paywallHeightDesc =>
      'Kami menganalisis genetik, gaya hidup, dan posturmu sekaligus lalu memetakan prediksinya per tahun. Tidak ada yang pasti: setiap langkahmu memperbaruinya.';

  @override
  String get paywallGrowthUnit => 'tahun ini';

  @override
  String get paywallGrowthTitle => 'Kami memantau pertumbuhanmu bersamamu';

  @override
  String get paywallGrowthDesc =>
      'Setiap ukuran langsung masuk ke grafik. Kamu melihat progresmu bulan demi bulan, sentimeter demi sentimeter.';

  @override
  String get paywallPostureUnit => 'skor postur';

  @override
  String get paywallPostureTitle => 'Posturmu adalah kunci rutinitasmu';

  @override
  String get paywallPostureDesc =>
      'Cek cepat 3 pertanyaan untuk kepala, bahu, dan punggung bawah, lengkap dengan latihan tepat untuk memperbaiki masing-masing.';

  @override
  String get paywallReportUnit => 'rutinitas selesai';

  @override
  String get paywallReportTitle => 'Kami mengevaluasimu tiap minggu';

  @override
  String get paywallReportDesc =>
      'Air, tidur, rutinitas, dan streak dalam satu layar. Tiap minggu kita lihat bareng kekuatan dan kekuranganmu.';

  @override
  String get paywallNutritionUnit => 'kali makan sehari';

  @override
  String get paywallNutritionTitle => 'Rencana nutrisi lengkapmu sudah siap';

  @override
  String get paywallNutritionDesc =>
      'Dari sarapan sampai makan malam, rencana harian lengkap dengan protein, kalsium, zinc, dan vitamin D yang sudah dihitung.';

  @override
  String get paywallScoreUnit => 'Skor BeTaller';

  @override
  String get paywallScoreTitle => 'Sistem yang terus mendorongmu maju';

  @override
  String get paywallScoreDesc =>
      'Genetik, pertumbuhan, nutrisi, tidur, dan disiplin digabung jadi satu skor. Begitu turun, kamu langsung tahu apa yang perlu diperbaiki.';

  @override
  String get paywallPhotosUnit => 'perbedaan terlihat';

  @override
  String get paywallPhotosTitle => 'Buktikan perubahanmu lewat foto';

  @override
  String get paywallPhotosDesc =>
      'Perbandingan sebelum dan sesudah tersusun otomatis, dan foto tiap bulan terkumpul di linimasamu.';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => 'Ayo mulai dalam tiga langkah';

  @override
  String get journeyIntroSubtitle =>
      'Kita siapkan BeTaller bersama. Langkah berikutnya sudah menunggu.';

  @override
  String get journeyStep1Title => 'Mengumpulkan datamu';

  @override
  String get journeyStep1Desc =>
      'Kami ambil tinggi, usia, dan gaya hidupmu, lalu menghitung potensimu.';

  @override
  String get journeyStep2Title => 'Tur aplikasi';

  @override
  String get journeyStep2Desc =>
      'Kami tunjukkan setiap fitur: fungsinya dan cara memakainya.';

  @override
  String get journeyStep3Title => 'Pakai sendiri';

  @override
  String get journeyStep3Desc =>
      'Kamu jalankan rutinitas harianmu, kami pantau progresmu.';

  @override
  String get journeyNow => 'SEKARANG';

  @override
  String get journeyDone => 'SELESAI';

  @override
  String get journeySoon => 'NANTI';

  @override
  String get tourHomeStreakTitle => 'Streak-mu';

  @override
  String get tourHomeStreakDesc =>
      'Terus bertambah selama kamu disiplin. Bolos sehari, kembali ke nol.';

  @override
  String get tourHomeXpTitle => 'Level-mu';

  @override
  String get tourHomeXpDesc =>
      'Naik seiring XP yang kamu kumpulkan dengan disiplin. Jangan keluar jalur!';

  @override
  String get tourHomeGoalsTitle => 'Target Hari Ini';

  @override
  String get tourHomeGoalsDesc =>
      'Menampilkan rutinitas, tugas, dan target minummu sekilas, jadi tidak ada yang terlewat.';

  @override
  String get tourHomeTrackTitle => 'Pantau Minum & Tidur';

  @override
  String get tourHomeTrackDesc =>
      'Catat minum dan tidur harianmu di sini, dalam hitungan detik.';

  @override
  String get tourPlanTabsTitle => 'Tiga Tab: Hari Ini, Disiplin, Nutrisi';

  @override
  String get tourPlanTabsDesc =>
      'Rutinitas harian, program mingguan, dan rencana nutrisimu semua ada di sini.';

  @override
  String get tourPlanLevelTitle => 'Level Disiplinmu';

  @override
  String get tourPlanLevelDesc =>
      'Menunjukkan seberapa konsisten kamu menyelesaikan rutinitas. Naik level untuk hasil lebih baik.';

  @override
  String get tourPlanTodayTitle => 'Rencana Hari Ini';

  @override
  String get tourPlanTodayDesc =>
      'Centang rutinitas harianmu di sini untuk menambah streak.';

  @override
  String get tourPlanTodayListTitle => 'Rutinitasmu Hari Ini';

  @override
  String get tourPlanTodayListDesc =>
      'Centang satu per satu setelah kamu lakukan. Ketuk rutinitas untuk melihat detailnya.';

  @override
  String get tourPlanWeekGoalsTitle => 'Minggu Ini';

  @override
  String get tourPlanWeekGoalsDesc =>
      'Hari sempurna, latihan, dan ukuran yang diminta minggu ini, termasuk yang wajib.';

  @override
  String get tourPlanMonthGoalsTitle => 'Bulan Ini';

  @override
  String get tourPlanMonthGoalsDesc =>
      'Foto progres, cek postur, dan ukuran bulan ini: yang tidak boleh kamu lewatkan.';

  @override
  String get tourProgressHeightTitle => 'Tinggimu Saat Ini';

  @override
  String get tourProgressHeightDesc =>
      'Menampilkan tinggimu sekarang dan total pertambahannya. Tambah ukuran baru dari sini.';

  @override
  String get tourProgressPhotosTitle => 'Foto Progres';

  @override
  String get tourProgressPhotosDesc =>
      'Pantau perubahanmu secara visual lewat foto yang kamu ambil rutin.';

  @override
  String get tourProgressPostureTitle => 'Analisis Postur';

  @override
  String get tourProgressPostureDesc =>
      'Analisis posturmu dari foto dan ketahui apa yang perlu dilatih.';

  @override
  String get tourAnalysisScoreTitle => 'Skor BeTaller-mu';

  @override
  String get tourAnalysisScoreDesc =>
      'Skor performa keseluruhanmu, dihitung dari genetik, kecepatan tumbuh, nutrisi, dan tidur.';

  @override
  String get tourAnalysisPredictionTitle => 'Prediksi Tinggimu';

  @override
  String get tourAnalysisPredictionDesc =>
      'Menampilkan prediksi tinggi akhirmu dan lintasannya per tahun.';

  @override
  String get tourAnalysisPeerTitle => 'Bandingkan dengan Teman Sebaya';

  @override
  String get tourAnalysisPeerDesc =>
      'Lihat peringkatmu dan bandingkan dirimu dengan yang seusia.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'Rutinitasmu';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'Lihat berapa rutinitas olahraga yang masih harus kamu selesaikan hari ini.';

  @override
  String get tourHomeGoalsChallengesTitle => 'Tugasmu';

  @override
  String get tourHomeGoalsChallengesDesc =>
      'Pantau progres tantangan aktifmu di sini.';

  @override
  String get tourHomeGoalsWaterTitle => 'Target Minummu';

  @override
  String get tourHomeGoalsWaterDesc =>
      'Lihat seberapa dekat kamu ke target minum harian.';

  @override
  String get tourHomeReminderTitle => 'Pengingat Berikutnya';

  @override
  String get tourHomeReminderDesc =>
      'Lihat kapan pengingat berikutnya datang, dan ubah dari sini.';

  @override
  String get tourHomeChallengesTitle => 'Tantanganmu';

  @override
  String get tourHomeChallengesDesc =>
      'Selesaikan tantangan aktif untuk dapat XP tambahan.';

  @override
  String get tourHomeGrowthTitle => 'Status Pertumbuhanmu';

  @override
  String get tourHomeGrowthDesc =>
      'Lihat selisih total dan ukuran terakhirmu, serta berapa banyak yang sudah kamu catat.';

  @override
  String get tourHomeExploreTitle => 'Jelajahi';

  @override
  String get tourHomeExploreDesc =>
      'Panduan nutrisi, resep tumbuh, dan lainnya menunggumu di sini.';

  @override
  String get tourPlanProgramHeaderTitle => 'Program 70 Harimu';

  @override
  String get tourPlanProgramHeaderDesc =>
      'Lihat progres keseluruhan, level, dan harimu saat ini di lingkaran ini.';

  @override
  String get tourPlanProgramLevelsTitle => 'Level';

  @override
  String get tourPlanProgramLevelsDesc =>
      'Lihat kamu di level mana dari 10 level, dan mana yang masih terkunci.';

  @override
  String get tourPlanNutritionHeaderTitle => 'Progres Nutrisimu';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'Pantau berapa rutinitas nutrisi harian yang sudah kamu selesaikan.';

  @override
  String get tourPlanNutritionFirstTitle => 'Rutinitas Nutrisi';

  @override
  String get tourPlanNutritionFirstDesc =>
      'Centang kebiasaan makan yang mendukung pertumbuhanmu.';

  @override
  String get tourProgressChartTitle => 'Kurva Pertumbuhan';

  @override
  String get tourProgressChartDesc =>
      'Lihat ukuran-ukuranmu sebelumnya di grafik dan pahami arahnya.';

  @override
  String get tourProgressReportTitle => 'Laporan Mingguan';

  @override
  String get tourProgressReportDesc =>
      'Lihat laporan yang merangkum progres minggumu.';

  @override
  String get tourProgressHistoryTitle => 'Riwayat Ukuranmu';

  @override
  String get tourProgressHistoryDesc =>
      'Lihat semua ukuran tinggi yang sudah kamu catat dalam linimasa.';

  @override
  String get tourAnalysisRadarTitle => 'Grafik Keseimbanganmu';

  @override
  String get tourAnalysisRadarDesc =>
      'Lihat keseimbangan genetik, kecepatan tumbuh, nutrisi, tidur, dan disiplinmu di grafik radar, dan ketahui titik terlemahmu.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'Kebutuhan Harianmu';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'Lihat kebutuhan protein, kalori, tidur, dan air harianmu, disesuaikan dengan tinggi dan beratmu.';

  @override
  String get journeyDataDoneTitle => 'Langkah pertama selesai';

  @override
  String get journeyDataDoneSubtitle =>
      'Data dan potensimu sudah kami punya. Berikutnya tur aplikasi.';

  @override
  String get journeyContinue => 'Lanjut';

  @override
  String get journeyEnterApp => 'Masuk aplikasi';

  @override
  String get journeyProgressLabel => 'Persiapan';

  @override
  String get journeyTourDoneTitle => 'Selamat datang di BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'Kamu sudah menyelesaikan ketiga langkah. Sekarang giliranmu: mulai perjalananmu dengan menyelesaikan rutinitas pertama.';

  @override
  String get journeyViewPlansButton => 'Lihat paket untuk mulai';

  @override
  String get paywallRestoreLabel => 'Pulihkan Pembelian';

  @override
  String get paywallYearly => 'Tahunan';

  @override
  String get paywallBestValue => 'Paling hemat';

  @override
  String paywallSavePercent(String percent) {
    return 'HEMAT $percent%';
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
  String get paywallFreeTrial => 'Gratis 3 hari';

  @override
  String get paywallLoadError => 'Opsi pembelian gagal dimuat, coba lagi';

  @override
  String get paywallCtaAlt => 'Lanjut';

  @override
  String get paywallTrialDisclaimer =>
      'Gratis 3 hari · lalu diperpanjang otomatis · batalkan kapan saja';

  @override
  String get paywallYearlyDisclaimer =>
      'Diperpanjang otomatis tiap tahun · batalkan kapan saja';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return 'Gratis $days hari, lalu $price/minggu · batalkan kapan saja';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return 'Gratis $days hari, lalu $price/bulan · batalkan kapan saja';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return 'Gratis $days hari, lalu $price/tahun · batalkan kapan saja';
  }

  @override
  String get paywallRenewsWeekly =>
      'Diperpanjang otomatis tiap minggu · batalkan kapan saja';

  @override
  String get paywallRenewsMonthly =>
      'Diperpanjang otomatis tiap bulan · batalkan kapan saja';

  @override
  String get resultCardTitle => 'Prediksi tinggi dewasamu';

  @override
  String resultRange(String min, String max) {
    return 'Kemungkinan rentang: $min sampai $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'Lebih tinggi dari $percent% orang seusiamu';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'Perkiraan sisa tumbuh: $amount';
  }

  @override
  String get resultFootnote =>
      'Perkiraan berdasarkan tinggi orang tuamu dan data grafik pertumbuhan. Bukan saran medis.';

  @override
  String get postureCheckTitle => 'Cek postur cepat';

  @override
  String get postureCheckIntro =>
      'Berdiri dengan tumit, pinggul, dan tulang belikat menempel dinding, lalu jawab tiga pertanyaan. Skormu dari jawabanmu; fotonya disimpan untuk perbandingan sebelum dan sesudah.';

  @override
  String get postureQHead =>
      'Apakah bagian belakang kepalamu menyentuh dinding tanpa mengangkat dagu?';

  @override
  String get postureQHeadA1 => 'Ya, gampang';

  @override
  String get postureQHeadA2 => 'Cuma kalau aku dorong ke belakang';

  @override
  String get postureQHeadA3 => 'Tidak, ada celah';

  @override
  String get postureQShoulders =>
      'Di foto sampingmu, di mana posisi bahu dibanding telinga?';

  @override
  String get postureQShouldersA1 => 'Sejajar dengan telinga';

  @override
  String get postureQShouldersA2 => 'Sedikit di depan';

  @override
  String get postureQShouldersA3 => 'Jelas membungkuk ke depan';

  @override
  String get postureQLowerBack =>
      'Selipkan tangan di belakang punggung bawahmu. Seberapa besar celahnya?';

  @override
  String get postureQLowerBackA1 => 'Pas untuk telapak tangan';

  @override
  String get postureQLowerBackA2 => 'Tidak ada celah sama sekali';

  @override
  String get postureQLowerBackA3 => 'Muat satu kepalan';

  @override
  String get postureCheckSave => 'Lihat skorku';

  @override
  String get postureCheckNote => 'Ini cek mandiri, bukan penilaian medis.';

  @override
  String get paywallTester => 'Penguji';

  @override
  String get introTag1 => 'PREDIKSI';

  @override
  String get introTag2 => 'PERTUMBUHAN';

  @override
  String get introTag3 => 'PEMANTAUAN';

  @override
  String get introTag4 => 'GAMIFIKASI';

  @override
  String get introTag5 => 'KOMUNITAS';

  @override
  String get introTitle1 => 'Temukan potensi\ntinggi badanmu';

  @override
  String get introSubtitle1 =>
      'Kami hitung potensi penuhmu\nberdasarkan genetik, usia, dan gaya hidup.';

  @override
  String get introTitle2 => 'Selangkah lebih tinggi\nsetiap hari';

  @override
  String get introSubtitle2 =>
      'Maksimalkan potensimu dengan rencana\nolahraga dan nutrisi pribadi.';

  @override
  String get introTitle3 => 'Pantau setiap\nsentimeter';

  @override
  String get introSubtitle3 =>
      'Lihat progres nyatamu\nlewat ukuran tiap bulan.';

  @override
  String get introTitle4 => 'Naik level,\ndapat hadiah';

  @override
  String get introSubtitle4 =>
      'Selesaikan program 70 hari,\nkumpulkan XP, dan buka level baru.';

  @override
  String get introTitle5 => 'Ribuan orang sudah\ntumbuh lebih tinggi';

  @override
  String get introSubtitle5 =>
      'Gabung dengan komunitas pengguna\nyang sudah mencapai targetnya.';

  @override
  String get criticalWindow => 'MASA KRITIS';

  @override
  String get heightPotentialFading => 'Fakta tentang';

  @override
  String get fadingAway => 'potensi tinggimu..';

  @override
  String get painHookDesc =>
      'Setiap hari yang lewat tanpa kebiasaan yang tepat, sentimeter hilang selamanya. Tapi ini masih bisa diubah.';

  @override
  String get painGeneticTitle => 'Genetik bukan segalanya';

  @override
  String get painGeneticDesc =>
      'Genetik menentukan 60%, tapi yang kamu lakukan menentukan 40% sisanya. BeTaller hadir tepat untuk 40% itu.';

  @override
  String get painGeneticTag => 'Analisis';

  @override
  String get painSleepTitle => 'Optimalkan rutinitas tidurmu';

  @override
  String get painSleepDesc =>
      'Tidur yang cukup tiap malam bisa meningkatkan produksi hormon pertumbuhan hingga 70%. BeTaller memantau tidurmu, kamu tinggal tidur.';

  @override
  String get painSleepTag => 'Pemantauan';

  @override
  String get painPostureTitle => 'Tambah sentimeter sekarang lewat postur';

  @override
  String get painPostureDesc =>
      'Postur yang benar bisa langsung menambah 1.5-3 cm. Rutinitas postur harian BeTaller membentuknya dalam beberapa minggu.';

  @override
  String get painPostureTag => 'Postur';

  @override
  String get painExerciseTitle => 'Rencana olahraga khususmu sudah siap';

  @override
  String get painExerciseDesc =>
      'Peregangan pagi, bergantung, rutinitas tulang belakang: BeTaller sudah menyiapkan dan menjadwalkannya untukmu. Cuma 8-12 menit sehari.';

  @override
  String get painExerciseTag => 'Rutinitas';

  @override
  String get painNutritionTitle => 'Nutrisimu langsung memengaruhi pertumbuhan';

  @override
  String get painNutritionDesc =>
      'Protein, kalsium, vitamin D: BeTaller mengingatkanmu tiap hari zat gizi apa yang perlu dan kapan.';

  @override
  String get painNutritionTag => 'Nutrisi';

  @override
  String get painTrackingTitle => 'Lihat pertumbuhanmu dengan mata sendiri';

  @override
  String get painTrackingDesc =>
      'Ukuran bulanan, foto progres, grafik pertumbuhan: lihat setiap sentimeter yang kamu dapat.';

  @override
  String get painTrackingTag => 'Progres';

  @override
  String get selectYourGender => 'Pilih jenis kelaminmu';

  @override
  String get onboardingPredictSubtitle =>
      'Ini dipakai untuk memprediksi potensi tinggimu & membuat rencana khususmu.';

  @override
  String get other => 'Lainnya';

  @override
  String get whenWereYouBorn => 'Kapan kamu lahir?';

  @override
  String get heightAndWeight => 'Tinggi & berat';

  @override
  String get parentsHeight => 'Tinggi orang tua';

  @override
  String get weeklyWorkout => 'Olahraga mingguan';

  @override
  String get workoutsPerWeek => 'Latihan per minggu';

  @override
  String get whatsYourEthnicity => 'Apa etnismu?';

  @override
  String get whiteCaucasian => 'Kulit Putih / Kaukasia';

  @override
  String get blackAfricanAmerican => 'Kulit Hitam / Afrika-Amerika';

  @override
  String get hispanicLatino => 'Hispanik / Latin';

  @override
  String get asian => 'Asia';

  @override
  String get middleEasternIndigenous => 'Timur Tengah / Pribumi';

  @override
  String get dontWantToAnswer => 'Aku tidak mau menjawab';

  @override
  String get footSizeLabel => 'Ukuran kaki';

  @override
  String get selectYourSize => 'Pilih ukuranmu';

  @override
  String get whatsYourDreamHeight => 'Berapa tinggi impianmu?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Dari datamu, kami akan menghitung peluangmu mencapai tinggi ini.';

  @override
  String get dreamHeightLabel => 'Tinggi impian';

  @override
  String get sleepQuestion => 'Berapa jam kamu\ntidur tiap malam?';

  @override
  String get thousandsSucceeded => 'Ribuan Orang\nBerhasil';

  @override
  String get youCanToo => 'Kamu juga bisa';

  @override
  String get yearsOld => 'tahun';

  @override
  String get verifiedLabel => 'Terverifikasi';

  @override
  String get scientificData => 'DATA ILMIAH';

  @override
  String get longTermResults => 'BeTaller memberi\nhasil jangka panjang';

  @override
  String get longTermResultsSubtitle =>
      'Banyak orang tidak mencapai tinggi maksimalnya karena kebiasaan buruk.';

  @override
  String get yourFinalHeight => 'Tinggi akhirmu';

  @override
  String get badHabitsLegend => 'Kebiasaan buruk';

  @override
  String get optimizedLegend => 'Dioptimalkan';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'Tinggi bisa diubah\nlewat kebiasaan';

  @override
  String get chartFact2Pct => '9-10 jam';

  @override
  String get chartFact2Desc => 'Tidur ideal meningkatkan\nhormon pertumbuhan';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Bisa didapat lewat\nperbaikan postur';

  @override
  String get didYouKnow => 'Tahukah kamu?';

  @override
  String get didYouKnowFact1 => 'Kebiasaan harian memengaruhi 30% tinggimu';

  @override
  String get didYouKnowFact2 =>
      'Tekanan tulang belakang mencuri 1.5-3 cm tinggi';

  @override
  String get didYouKnowFact3 => 'Kurang tidur menurunkan HGH hingga 70%';

  @override
  String get transformJourneyBegins => 'Perjalanan Perubahanmu\nDimulai';

  @override
  String get transformJourneySubtitle =>
      'Program lengkap untuk mendukung\npertumbuhan sehatmu, langkah demi langkah.';

  @override
  String get week1Label => '1M';

  @override
  String get week1Title => 'Minggu 1';

  @override
  String get week1Desc =>
      'Kelurusan tulang belakang membaik, postur makin bagus';

  @override
  String get month1Label => '1B';

  @override
  String get month1Title => 'Bulan 1';

  @override
  String get month1Desc =>
      'Sentimeter pertama terlihat, kualitas tidur membaik';

  @override
  String get month3Label => '3B';

  @override
  String get month3Title => 'Bulan 3';

  @override
  String get month3Desc => 'Rata-rata bertambah +1.5–2.5 cm, otot berkembang';

  @override
  String get month6Label => '6B';

  @override
  String get month6Title => 'Bulan 6';

  @override
  String get month6Desc =>
      'Capai potensi maksimal, jalani hidup dengan tinggi barumu';

  @override
  String get reachYourGoal => 'Capai Targetmu';

  @override
  String get journeyBullet1 => 'Buka potensi maksimalmu';

  @override
  String get journeyBullet2 => 'Mulai hidup dengan tinggi barumu';

  @override
  String get journeyBullet3 => 'Tulis kisah suksesmu';

  @override
  String get unlockButton => 'Buka Semua';

  @override
  String get dreamHeightOdds => 'Peluang\ntinggi impian';

  @override
  String get growthCompleteLabel => 'Pertumbuhan\ntercapai';

  @override
  String get tallerThanPct => 'Lebih tinggi dari 76.7% teman seusiamu';

  @override
  String get levelNovice => 'Pemula';

  @override
  String get levelBuilder => 'Pembangun';

  @override
  String get levelGrinder => 'Pekerja Keras';

  @override
  String get levelWarrior => 'Pejuang';

  @override
  String get levelGodTier => 'Level Dewa';

  @override
  String get levelDesc0 => 'Bangun fondasimu';

  @override
  String get levelDesc1 => 'Percepat pertumbuhan';

  @override
  String get levelDesc2 => 'Tingkatkan latihan';

  @override
  String get levelDesc3 => 'Lewati batasmu';

  @override
  String get levelDesc4 => 'Tanpa usaha, tanpa hasil';

  @override
  String get levelDesc5 => 'Mental juara';

  @override
  String get levelDesc6 => 'Performa elite';

  @override
  String get levelDesc7 => 'Kuasai tubuhmu';

  @override
  String get levelDesc8 => 'Disiplin legendaris';

  @override
  String get levelDesc9 => 'Potensi maksimal';

  @override
  String levelLabel(int level) {
    return 'LEVEL $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Sisa $days hari',
      one: 'Sisa $days hari',
    );
    return '$_temp0 di programmu';
  }

  @override
  String get tapLabel => 'KETUK';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'Hari';

  @override
  String get legendShort => 'Pendek';

  @override
  String get legendBelowAvg => 'Di bawah rata2';

  @override
  String get legendAverage => 'Rata-rata';

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
  String get fallingBehind => 'Mulai tertinggal';

  @override
  String readTimeMinutes(int minutes) {
    return 'Baca $minutes menit';
  }

  @override
  String get inThisArticle => 'Di artikel ini';

  @override
  String get nextArticle => 'Artikel berikutnya';

  @override
  String get purchaseUnavailable => 'Pembelian gagal. Coba lagi ya.';

  @override
  String get viewPlan => 'Lihat Paket';

  @override
  String get viewPlanSubtitle => 'Lihat detail langgananmu';

  @override
  String predictionConfidenceHint(String percent) {
    return 'Menambah ukuran tinggi menaikkan akurasi prediksi ke $percent%';
  }

  @override
  String get paywallSlideHomeTitle => 'Harimu, satu layar';

  @override
  String get paywallSlideHomeCaption =>
      'Rutinitas, air, tidur: tiga lingkaran untuk dipenuhi.';

  @override
  String get paywallSlideProgressTitle => 'Lihat setiap sentimeter';

  @override
  String get paywallSlideProgressCaption =>
      'Setiap ukuran langsung masuk ke kurva.';

  @override
  String get paywallSlideAnalysisTitle => 'Lima metrik, satu bentuk';

  @override
  String get paywallSlideAnalysisCaption =>
      'Radar menunjukkan titik terlemahmu.';

  @override
  String get paywallSlidePotentialTitle => 'Kenali potensimu';

  @override
  String get paywallSlidePotentialCaption =>
      'Lihat posisimu di antara teman sebaya.';

  @override
  String get paywallSlideDisciplineTitle => 'Jaga streak-mu';

  @override
  String get paywallSlideDisciplineCaption =>
      'Setiap hari mendorong levelmu naik.';

  @override
  String get paywallSlideRemindersTitle => 'Diingatkan di waktu yang pas';

  @override
  String get paywallSlideRemindersCaption =>
      'Atur jammu, sisanya diurus aplikasi.';

  @override
  String get paywallSlidePostureTitle => 'Perbaiki posturmu';

  @override
  String get paywallSlidePostureCaption =>
      'Satu foto samping, cek mandiri singkat, rutinitas yang jelas.';

  @override
  String paywallTrialHeadline(String days) {
    return 'GRATIS $days HARI';
  }

  @override
  String paywallTrialThen(String price) {
    return 'Lalu $price · batalkan kapan saja';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / tahun · batalkan kapan saja';
  }

  @override
  String get obBedtimeTitle => 'Biasanya kamu tidur jam berapa?';

  @override
  String get obBedtimeSubtitle =>
      'Pengingat tidurmu akan diatur sekitar jam ini.';

  @override
  String get obWorkoutTimeTitle => 'Kamu olahraga jam berapa?';

  @override
  String get obWorkoutTimeSubtitle =>
      'Biar pengingat latihanmu datang tepat waktu.';

  @override
  String get obMealsTitle => 'Berapa kali makan sehari?';

  @override
  String get obMealsSubtitle =>
      'Ketuk jam untuk menyesuaikan dengan rutinitasmu.';

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
      'Perkiraan kasar sudah cukup. Kami susun rencanamu dari situ.';

  @override
  String get obCaloriesTitle => 'Rata-rata berapa kalori sehari?';

  @override
  String get obCaloriesSubtitle =>
      'Perkiraan saja cukup; nanti bisa kita pertajam bareng.';

  @override
  String get obNotSure => 'Aku tidak yakin';

  @override
  String get silNow => 'SEKARANG';

  @override
  String get silPotential => 'POTENSI';

  @override
  String get chartMeasured => 'Ukuranmu';

  @override
  String chartPotential(String height) {
    return 'Potensi $height';
  }

  @override
  String chartDream(String height) {
    return 'Targetmu $height';
  }

  @override
  String get targetsTitle => 'Hari ini, untukmu';

  @override
  String get targetsSubtitle => 'Dihitung dari usia, berat, dan latihanmu.';

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
    return '$g g per makan';
  }

  @override
  String get unitHours => 'j';

  @override
  String get unitMinutes => 'mnt';

  @override
  String get planStrength => 'Kekuatan';

  @override
  String get planJump => 'Lompat & sprint';

  @override
  String get planMobility => 'Peregangan';

  @override
  String get planSport => 'Olahraga';

  @override
  String get planPosture => 'Postur';

  @override
  String get planRest => 'Istirahat';

  @override
  String planWeekTitle(int days) {
    return 'Minggumu: $days hari latihan';
  }

  @override
  String get planPreviewTitle => 'Rencanamu sudah siap';

  @override
  String planPreviewTraining(int days) {
    return '$days hari latihan seminggu, dirancang untuk tumbuh';
  }

  @override
  String planPreviewProtein(int grams) {
    return '$grams g protein sehari, dibagi ke waktu makanmu';
  }

  @override
  String planPreviewSleep(String hours) {
    return 'Tidur $hours jam, dengan pengingat jam tidur';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'Hari ini: $plan · $minutes mnt';
  }

  @override
  String get nRestTitle => 'Hari ini hari istirahat';

  @override
  String get nRestBody =>
      'Sepuluh menit peregangan sudah cukup. Pemulihan juga bagian dari rencana.';

  @override
  String nProteinTitle(int grams) {
    return 'Target protein hari ini: $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return 'Sekitar $grams g per makan: telur, yogurt, ayam, kacang lentil.';
  }

  @override
  String nWaterTitle(String liters) {
    return 'Target minum: $liters';
  }

  @override
  String get nWaterBody =>
      'Segelas sekarang bikin kamu tetap on track hari ini.';

  @override
  String get nSleepTitle => 'Waktunya bersantai';

  @override
  String nSleepBody(String hours) {
    return 'Targetmu $hours jam. Matikan layar, redupkan lampu.';
  }

  @override
  String nMeasureBody(String potential) {
    return 'Potensimu: $potential. Ukur di pagi hari dan lihat grafikmu bergerak.';
  }

  @override
  String get nTrialDay1Title => 'Rencanamu sudah menunggu';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'Hari ini: $plan, $minutes mnt. Catat tinggimu biar grafiknya mulai.';
  }

  @override
  String get nTrialEndTitle => 'Uji coba gratismu berakhir besok';

  @override
  String nTrialEndBody(String price) {
    return 'Setelah itu lanjut dengan $price. Rencana dan progresmu tetap tersimpan apa pun pilihanmu.';
  }

  @override
  String get trophyContinue => 'Lanjutkan';

  @override
  String get guideSteps => 'Langkah demi langkah';

  @override
  String get guideMistakes => 'Kesalahan umum';

  @override
  String get guideTip => 'Tips';

  @override
  String get homeHeroTitle => 'Tinggi dan potensimu';

  @override
  String homeHeroGap(String cm) {
    return '$cm lagi menantimu';
  }

  @override
  String get anSubtitle =>
      'Skormu, apa yang menggerakkannya, dan ke mana arahmu';

  @override
  String get anScoreLabel => 'Skor BeTaller';

  @override
  String get anTierStarting => 'Memulai';

  @override
  String get anTierBuilding => 'Membangun';

  @override
  String get anTierRising => 'Menanjak';

  @override
  String get anTierStrong => 'Kuat';

  @override
  String get anTierPeak => 'Puncak';

  @override
  String anTrendUp(int n) {
    return '+$n dari minggu lalu';
  }

  @override
  String anTrendDown(int n) {
    return '-$n dari minggu lalu';
  }

  @override
  String get anTrendFlat => 'Sama dengan minggu lalu';

  @override
  String get anTrendFirst => 'Tren mingguanmu mulai minggu depan';

  @override
  String anNextTier(int n, String tier) {
    return '$n poin lagi ke $tier';
  }

  @override
  String get anTopTier => 'Tier tertinggi. Pertahankan';

  @override
  String anCoverage(int n, int total) {
    return 'Berdasarkan $n dari $total sinyal';
  }

  @override
  String get anNoScoreTitle => 'Datanya belum cukup';

  @override
  String get anNoScoreBody =>
      'Catat tidur, minum, atau satu latihan hari ini dan skor pertamamu muncul.';

  @override
  String get anFastestWin => 'Cara tercepat';

  @override
  String get anBreakdownTitle => 'Apa yang membentuk skormu';

  @override
  String get anBreakdownHint =>
      'Setiap sinyal dinilai 0 sampai 100 dari datamu sendiri. Persentasenya menunjukkan seberapa besar bobotnya.';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => 'Belum ada data';

  @override
  String get anNotCounted => 'Tidak dihitung';

  @override
  String get anFTraining => 'Latihan';

  @override
  String get anFConsistency => 'Konsistensi';

  @override
  String get anFSleep => 'Tidur';

  @override
  String get anFHydration => 'Hidrasi';

  @override
  String get anFNutrition => 'Nutrisi';

  @override
  String get anFPosture => 'Postur';

  @override
  String get anFMeasuring => 'Pengukuran';

  @override
  String get anFGrowth => 'Kecepatan tumbuh';

  @override
  String get anFHeadroom => 'Ruang tumbuh';

  @override
  String anBTraining(int done, int planned) {
    return '$done dari $planned hari latihan terencana dalam 7 hari terakhir';
  }

  @override
  String get anBTrainingNone =>
      'Menghitung hari latihanmu dibanding rencana mingguan.';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak hari',
      one: '$streak hari',
    );
    return 'Streak $_temp0, $active dari $days hari dengan setengah rencana selesai';
  }

  @override
  String get anBConsistencyNone =>
      'Menghitung streak-mu dan hari-hari kamu menyelesaikan minimal setengah rencana.';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days malam',
      one: '$days malam',
    );
    return 'Rata-rata $hours j per malam, target $target j, $_temp0 tercatat';
  }

  @override
  String get anBSleepNone => 'Tidak ada catatan tidur dalam 7 hari terakhir.';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return 'Rata-rata $litres sehari, target $target, $_temp0 tercatat';
  }

  @override
  String get anBHydrationNone =>
      'Tidak ada catatan minum dalam 7 hari terakhir.';

  @override
  String anBNutrition(int done, int planned) {
    return '$done dari $planned kebiasaan nutrisi selesai dalam 7 hari terakhir';
  }

  @override
  String get anBNutritionNone =>
      'Menghitung kebiasaan protein, kalsium, zinc, dan vitamin D di rencanamu.';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return 'Cek mandiri di dinding $raw/90, $_temp0 lalu';
  }

  @override
  String anBPostureToday(int raw) {
    return 'Cek mandiri di dinding $raw/90, hari ini';
  }

  @override
  String get anBPostureNone => 'Belum ada cek postur mandiri.';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return 'Terakhir diukur $_temp0 lalu';
  }

  @override
  String get anBMeasuringToday => 'Diukur hari ini';

  @override
  String get anBMeasuringNone => 'Belum ada ukuran.';

  @override
  String anBGrowth(String v, String e) {
    return '$v per tahun, normal di usiamu $e';
  }

  @override
  String get anBGrowthNone => 'Butuh dua ukuran dengan jarak minimal 30 hari.';

  @override
  String get anBGrowthAdult =>
      'Lempeng pertumbuhan biasanya menutup di usia 21, jadi kecepatan tumbuh tidak dihitung untukmu.';

  @override
  String anBHeadroom(String cm) {
    return '$cm antara hari ini dan potensimu';
  }

  @override
  String get anATraining => 'Mulai latihan hari ini';

  @override
  String get anAConsistency => 'Selesaikan setengah rencana hari ini';

  @override
  String get anASleepLog => 'Catat tidur semalam';

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
  String get anAHydrationDone => 'Target tercapai hari ini. Ulangi besok';

  @override
  String get anANutrition => 'Centang kebiasaan nutrisi hari ini';

  @override
  String get anAPostureFirst => 'Lakukan cek postur mandiri 1 menit';

  @override
  String get anAPostureRedo => 'Ulangi cek postur mandirimu';

  @override
  String get anAPostureKeep => 'Pertahankan rutinitas postur harian';

  @override
  String get anAMeasure => 'Ukur tinggimu sekarang';

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
  String get anAGrowth => 'Ukur tiap 2 minggu untuk memantaunya';

  @override
  String get anAHeadroom => 'Lihat potensimu';

  @override
  String get anPotentialTitle => 'Potensimu';

  @override
  String get anPotentialLabel => 'Prediksi tinggi dewasa';

  @override
  String anPotentialToGo(String cm) {
    return '+$cm lagi';
  }

  @override
  String get anPotentialReached => 'Kamu sudah di tinggi prediksimu';

  @override
  String get anPotentialNote =>
      'Angka yang sama di seluruh aplikasi. Hanya bisa naik.';

  @override
  String anDreamLine(String h) {
    return 'Targetmu: $h';
  }

  @override
  String get anSourcesTitle => 'Dari mana sentimeter itu datang';

  @override
  String get anSourcesGenes => 'Genetik dan usia';

  @override
  String get anSourcesHabits => 'Tidur, makan, latihan';

  @override
  String get anSourcesPosture => 'Postur';

  @override
  String get anPctTitle => 'Tinggi untuk usiamu';

  @override
  String anPctValue(int p) {
    return 'Lebih tinggi dari $p% orang seusiamu';
  }

  @override
  String get anPctBasis =>
      'Grafik pertumbuhan CDC AS, usia dan jenis kelamin sama';

  @override
  String get anPctMore => 'Perbandingan lengkap';

  @override
  String get anNeedsBasis => 'Dihitung dari usia, berat, dan latihanmu';

  @override
  String get anCalcium => 'Kalsium';

  @override
  String get anVitaminD => 'Vitamin D';

  @override
  String get anMovement => 'Gerak';

  @override
  String get anUnitMin => 'mnt';

  @override
  String get anUnitHours => 'j';

  @override
  String get anPerDay => 'sehari';

  @override
  String get anPerNight => 'semalam';

  @override
  String get anUnlockScoreTitle => 'Skor BeTaller lengkapmu';

  @override
  String get anUnlockScoreBody =>
      'Skornya, sembilan sinyal di baliknya, dan langkah berikutnya.';

  @override
  String get anUnlockSourcesTitle => 'Lihat dari mana sentimetermu datang';

  @override
  String get anUnlockNeedsTitle => 'Kebutuhan harianmu, sudah dihitung untukmu';

  @override
  String get anUnlockCta => 'Buka';

  @override
  String get anFlowResultTitle => 'Tersimpan di grafikmu';

  @override
  String get anFlowResultBody =>
      'Tinggi sebelumnya sekarang ada di kurva yang sama dengan ukuran dan potensimu.';

  @override
  String get anFlowOpenAnalysis => 'Buka analisismu';

  @override
  String anTopPct(int p) {
    return 'TOP $p%';
  }

  @override
  String get anNeedsTitle => 'Kebutuhan harianmu';

  @override
  String get pgUnlockPro => 'Buka dengan Pro';

  @override
  String get pgPhotosLockedTitle => 'Lihat perubahanmu';

  @override
  String get pgPhotosLockedBody =>
      'Simpan foto beserta tinggimu tiap dua minggu dan bandingkan dua foto mana saja dengan slider.';

  @override
  String get pgTransformationTitle => 'Perubahanmu';

  @override
  String get pgHeightChange => 'perubahan tinggi';

  @override
  String get pgDaysApart => 'hari selisih';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return '$delta di antara dua foto ini, diambil dengan selisih $_temp0.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return 'Tinggi sama, selisih $_temp0. Postur dan bentuk tubuh berubah duluan, tinggi menyusul dalam hitungan bulan.';
  }

  @override
  String get pgModeSlider => 'Slider';

  @override
  String get pgModeSideBySide => 'Berdampingan';

  @override
  String get pgDragToReveal => 'Geser untuk membandingkan';

  @override
  String get pgOnePhotoTitle => 'Foto sebelummu sudah tersimpan';

  @override
  String pgOnePhotoBody(String date) {
    return 'Ambil foto berikutnya pada $date dengan pose sama untuk melihat perbandingan pertamamu.';
  }

  @override
  String get pgEmptyTitle => 'Mulai perubahanmu';

  @override
  String get pgEmptyBody =>
      'Satu foto tiap dua minggu, pose sama, tempat sama, lengkap dengan tinggimu. Dalam beberapa bulan kamu bisa geser antara hari ke-1 dan hari ini.';

  @override
  String get pgTakeFirstPhoto => 'Ambil foto pertamamu';

  @override
  String get pgPhotoDueNow => 'Waktunya foto baru';

  @override
  String pgNextPhotoOn(String date) {
    return 'Foto berikutnya $date';
  }

  @override
  String pgDayN(int n) {
    return 'Hari $n';
  }

  @override
  String get pgNewPhoto => 'Foto baru';

  @override
  String get pgGuideTitle => 'Pose sama, setiap kali';

  @override
  String get pgGuideSubtitle =>
      'Foto hanya bisa dibandingkan dengan baik kalau diambil dengan cara yang sama.';

  @override
  String get pgGuideGhost =>
      'Foto terakhirmu ditampilkan samar. Sejajarkan dirimu dengannya.';

  @override
  String get pgGuideStep1 => 'Berdiri 2 m jauhnya, HP setinggi dada';

  @override
  String get pgGuideStep2 => 'Hadap kamera, kaki rapat, lengan santai';

  @override
  String get pgGuideStep3 => 'Tempat sama, cahaya sama, baju pas badan';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => 'setinggi dada';

  @override
  String get pgTakePhoto => 'Ambil foto';

  @override
  String get pgFromGallery => 'Pilih dari galeri';

  @override
  String get pgChoosePhoto => 'Pilih foto';

  @override
  String get pgPostureTitle => 'Cek postur';

  @override
  String get pgPostureLockedTitle => 'Temukan titik lemahmu';

  @override
  String get pgPostureLockedBody =>
      'Nilai kepala, bahu, dan punggung bawahmu, dapatkan dua latihan untuk masing-masing, dan lihat skormu minggu demi minggu.';

  @override
  String get pgAreaHead => 'Kepala';

  @override
  String get pgAreaShoulders => 'Bahu';

  @override
  String get pgAreaLowerBack => 'Punggung bawah';

  @override
  String get pgHeadMeaning0 =>
      'Kepalamu pas di atas bahu. Pertahankan dengan reset singkat tiap hari.';

  @override
  String get pgHeadMeaning1 =>
      'Kepalamu condong ke depan saat santai. Umum banget kalau sering main HP, dan cepat membaik.';

  @override
  String get pgHeadMeaning2 =>
      'Kepalamu ada di depan bahu. Perbaiki ini dulu: ini bikin kamu terlihat lebih pendek di setiap foto.';

  @override
  String get pgShouldersMeaning0 =>
      'Bahu sejajar telinga. Punggung atasmu bekerja dengan baik.';

  @override
  String get pgShouldersMeaning1 =>
      'Bahu sedikit ke depan. Dada yang kaku menariknya; membukanya akan mengembalikan bahu.';

  @override
  String get pgShouldersMeaning2 =>
      'Bahu membungkuk. Punggung atasmu melengkung ke depan, membuat tinggimu saat berdiri berkurang.';

  @override
  String get pgLowerBackMeaning0 =>
      'Lengkungan netral. Pinggul dan otot intimu menahan tulang belakang di posisi yang benar.';

  @override
  String get pgLowerBackMeaning1 =>
      'Punggung bawah datar. Ekstensi ringan dan latihan mobilitas mengembalikan lengkungan alaminya.';

  @override
  String get pgLowerBackMeaning2 =>
      'Lengkungan kuat. Otot fleksor pinggul yang kaku memiringkan panggul ke depan; meregangkannya dan otot inti yang lebih kuat akan meratakannya.';

  @override
  String get pgLegacyMeaning =>
      'Disimpan oleh versi lama tanpa pertanyaan ini. Ulangi cek untuk saran di area ini.';

  @override
  String get pgHowItWorks => 'Cara kerja cek ini';

  @override
  String get pgYourPosture => 'Posturmu';

  @override
  String pgCheckedOn(String date) {
    return 'Dicek $date';
  }

  @override
  String get pgOutOf100 => 'dari 100';

  @override
  String get pgAllAreasGood => 'Ketiga area terlihat bagus. Pertahankan.';

  @override
  String pgStartWith(String area) {
    return 'Mulai dari sini: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta dari cek terakhir';
  }

  @override
  String get pgStatusGood => 'Baik';

  @override
  String get pgStatusFair => 'Bisa lebih baik';

  @override
  String get pgStatusFix => 'Perbaiki dulu';

  @override
  String get pgKeepItWith => 'Pertahankan dengan';

  @override
  String get pgFixItWith => 'Perbaiki dengan';

  @override
  String get pgRetakeNow => 'Waktunya cek mingguanmu';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Cek berikutnya $n hari lagi',
      one: 'Cek berikutnya besok',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'Dinding sama, tiga pertanyaan sama. Cek mingguan menunjukkan apakah latihannya berhasil.';

  @override
  String pgRetakeBodyWait(String date) {
    return 'Lakukan latihan di atas sampai $date, lalu ulangi cek untuk melihat hasilnya.';
  }

  @override
  String get pgRetakeCheck => 'Ulangi cek';

  @override
  String get pgRetakeAnyway => 'Ulangi sekarang';

  @override
  String get pgHistoryTitle => 'Skormu';

  @override
  String pgSinceFirst(String delta) {
    return '$delta sejak cek pertama';
  }

  @override
  String get pgHistoryOne =>
      'Ini cek pertamamu. Ulangi dalam 7 hari dan trenmu mulai dari sini.';

  @override
  String get pgPostureIntroTitle => 'Seberapa tegak kamu berdiri?';

  @override
  String get pgPostureIntroBody =>
      'Tiga pertanyaan sambil bersandar di dinding, sekitar satu menit. Kamu dapat skor dan dua latihan untuk memperbaiki tiap titik lemah.';

  @override
  String get pgPostureStep1 =>
      'Berdiri dengan tumit, pinggul, dan tulang belikat menempel dinding.';

  @override
  String get pgPostureStep2 =>
      'Ambil foto dari samping, seluruh badan masuk bingkai, biar bisa dilihat lagi nanti.';

  @override
  String get pgPostureStep3 =>
      'Jawab tiga pertanyaan dengan jujur. Skormu dari jawabanmu.';

  @override
  String get pgPostureStep4 => 'Ulangi seminggu sekali, di jam yang sama.';

  @override
  String get pgStartCheck => 'Mulai cek postur';

  @override
  String pgWeekRange(String start, String end) {
    return '$start sampai $end';
  }

  @override
  String get pgGradeGreat => 'Minggu juara';

  @override
  String get pgGradeGood => 'Minggu yang solid';

  @override
  String get pgGradeOk => 'Mulai jalan';

  @override
  String get pgGradeStart => 'Awal yang baru';

  @override
  String get pgTopWeek => 'Minggu terbaik';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta dari minggu lalu';
  }

  @override
  String get pgDaysCompleted => 'hari rencana penuh';

  @override
  String get pgDayStreak => 'hari streak';

  @override
  String pgBestDay(String day) {
    return 'Terbaik: $day';
  }

  @override
  String get pgNextWeekFocus => 'Fokus minggu depan';

  @override
  String pgFocusPlan(int n, int done) {
    return 'Selesaikan seluruh rencanamu di $n hari. Minggu ini kamu berhasil $done hari.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'Masukkan $n sesi latihan. Minggu ini kamu melakukan $done.';
  }

  @override
  String get pgFocusMeasure =>
      'Ukur tinggimu sekali, di pagi hari, tanpa alas kaki, di tempat yang sama. Begitulah cara melihat perubahan nyata.';

  @override
  String pgFocusKeepDay(String day) {
    return 'Semua target tercapai. Sekarang jadikan $day hari penuh juga.';
  }

  @override
  String get pgFocusKeep =>
      'Semua target tercapai dan setiap hari penuh. Rencana sama, ritme sama.';

  @override
  String get pgHeightThisWeek => 'Tinggi minggu ini';

  @override
  String pgHeightNow(String height) {
    return 'Sekarang $height';
  }

  @override
  String get pgNoMeasurementWeek => 'Belum ada ukuran minggu ini';

  @override
  String get pgFirstMeasurement => 'Ukuran pertamamu';

  @override
  String pgStartedAt(String height) {
    return 'Awal $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'Potensi $height';
  }

  @override
  String pgToPotential(String cm) {
    return '$cm lagi menuju prediksi potensimu.';
  }

  @override
  String get pgPotentialReached =>
      'Kamu sudah di prediksi potensimu. Latihan postur masih bisa menambah tinggi yang terlihat.';

  @override
  String get pgHabitsToday => 'Tercatat hari ini';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves gerakan · $minutes mnt';
  }

  @override
  String plDoneCount(int done, int total) {
    return '$done/$total selesai';
  }

  @override
  String get plStartWorkout => 'Mulai latihan';

  @override
  String get plContinueWorkout => 'Lanjutkan latihan';

  @override
  String get plWorkoutDoneToday => 'Latihan hari ini selesai';

  @override
  String get plTraining => 'Latihan';

  @override
  String get plHabits => 'Kebiasaan harian';

  @override
  String get plRestDayNote =>
      'Hari santai: yoga singkat bikin badanmu tetap lentur untuk besok.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps kali';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds dtk';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds dtk tiap sisi';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes mnt';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g dibagi ke waktu makan';
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
  String get plYourRoutines => 'Rutinitasmu';

  @override
  String get plNewRoutine => 'Rutinitas baru';

  @override
  String get plCustomEmpty =>
      'Buat rutinitasmu sendiri dan centang di sini setiap hari.';

  @override
  String plDeleteRoutineQ(String name) {
    return 'Hapus \"$name\"?';
  }

  @override
  String get plHoldToDelete => 'Tekan lama rutinitas untuk menghapusnya.';

  @override
  String plSetOf(int current, int total) {
    return 'Set $current dari $total';
  }

  @override
  String get plRest => 'Istirahat';

  @override
  String get plStartSet => 'Mulai set';

  @override
  String get plSetDone => 'Set selesai';

  @override
  String get plSkipRest => 'Lewati istirahat';

  @override
  String get plNextMove => 'Gerakan berikutnya';

  @override
  String get plSkipMove => 'Lewati';

  @override
  String plUpNext(String name) {
    return 'Berikutnya: $name';
  }

  @override
  String get plLastMove => 'Gerakan terakhir';

  @override
  String get plWorkoutComplete => 'Latihan selesai';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves gerakan dalam sekitar $minutes mnt. Setiap sesi berarti.';
  }

  @override
  String get plEachSide => 'Tiap sisi';

  @override
  String get plMoveDone => 'Gerakan selesai';

  @override
  String plRepsBig(int reps) {
    return '$reps kali';
  }

  @override
  String get plSessionHint =>
      'Ikuti temponya sendiri dan ketuk selesai kalau sudah.';

  @override
  String plProgramDayOf(int day, int total) {
    return 'Hari $day dari $total';
  }

  @override
  String get plTodayStep => 'Langkah hari ini';

  @override
  String get plTickToComplete =>
      'Centang setiap gerakan untuk menyelesaikan hari ini';

  @override
  String plNextDayTomorrow(int day) {
    return 'Hari $day terbuka besok. Istirahat juga bagian dari tumbuh.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return '$_temp0 lagi ke level $level';
  }

  @override
  String get plProgramFinished =>
      'Semua 70 hari selesai. Kamu menuntaskan programnya.';

  @override
  String plDayCompleteToast(int day) {
    return 'Hari $day selesai';
  }

  @override
  String get plLevelWeek => 'Minggu level ini';

  @override
  String get plProgressionTitle => 'Bagaimana makin berat';

  @override
  String get plNow => 'Sekarang';

  @override
  String plLevelN(int n) {
    return 'Lv $n';
  }

  @override
  String get plUnlockProgram => 'Buka program 70 hari';

  @override
  String get plProgramPitch =>
      '10 level, satu per minggu. Tiap level menambah detik di tahananmu, repetisi di lompatanmu, dan satu set saat kamu siap.';

  @override
  String plDayLocked(int day) {
    return 'Selesaikan hari $day dulu';
  }

  @override
  String plCurrentDay(int day) {
    return 'Hari $day';
  }

  @override
  String get plTodaysTargets => 'Target hari ini';

  @override
  String get plTargetsBasis => 'Dihitung dari usia, berat, dan latihanmu';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals kali makan x $grams g';
  }

  @override
  String get plZinc => 'Zinc';

  @override
  String get plMagnesium => 'Magnesium';

  @override
  String get plEnergy => 'Energi';

  @override
  String get plChecklist => 'Daftar cek hari ini';

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
    return '$amount dari makanan yang dicentang';
  }

  @override
  String get plVitaminDNote =>
      '15 menit sinar matahari siang di lengan dan wajah, atau suplemen yang disetujui doktermu';

  @override
  String plWaterLogged(String liters) {
    return '$liters tercatat sejauh ini';
  }

  @override
  String get plMealPlan => 'Menu makanmu';

  @override
  String get plMealPlanSub => 'Makanan nyata, gram nyata, sesuai targetmu';

  @override
  String get plSnack => 'Camilan';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein g protein · $calcium mg kalsium · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return 'target $grams g';
  }

  @override
  String get plMarkEaten => 'Tandai sudah dimakan';

  @override
  String get plEaten => 'Sudah dimakan';

  @override
  String get plPlanTotal => 'Total hari ini';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'Makanan ini memberi sekitar $planKcal dari $kcal kcal-mu. Penuhi sisanya dengan buah, sayur, roti, atau nasi.';
  }

  @override
  String get plWeeklyMenu => 'Menu mingguan';

  @override
  String get plWeeklyMenuSub => 'Piring berbeda tiap hari, target tetap sama';

  @override
  String get plUnlockMenu => 'Buka menu mingguan lengkap';

  @override
  String get plRecipes => 'Resep';

  @override
  String get plRecipesSub => 'Masakan cepat tinggi protein';

  @override
  String get plNutritionGuide => 'Panduan nutrisi';

  @override
  String get plNutritionGuideSub => 'Zat gizi, makanan, dan suplemen';

  @override
  String plPieces(int n) {
    return '$n buah';
  }

  @override
  String get plFoodOats => 'Oat';

  @override
  String get plFoodMilk => 'Susu';

  @override
  String get plFoodBanana => 'Pisang';

  @override
  String get plFoodWalnuts => 'Kenari';

  @override
  String get plFoodGreekYogurt => 'Greek yogurt';

  @override
  String get plFoodYogurt => 'Yogurt';

  @override
  String get plFoodEggs => 'Telur';

  @override
  String get plFoodBread => 'Roti gandum utuh';

  @override
  String get plFoodWhiteCheese => 'Keju feta';

  @override
  String get plFoodHardCheese => 'Keju cheddar';

  @override
  String get plFoodSalad => 'Salad tomat dan timun';

  @override
  String get plFoodOrange => 'Jeruk';

  @override
  String get plFoodPeanutButter => 'Selai kacang';

  @override
  String get plFoodSpinach => 'Bayam';

  @override
  String get plFoodCottageCheese => 'Keju cottage';

  @override
  String get plFoodChicken => 'Dada ayam';

  @override
  String get plFoodBulgur => 'Bulgur';

  @override
  String get plFoodAyran => 'Ayran (minuman yogurt)';

  @override
  String get plFoodTuna => 'Tuna (kaleng)';

  @override
  String get plFoodPasta => 'Pasta';

  @override
  String get plFoodBeef => 'Daging sapi tanpa lemak';

  @override
  String get plFoodRice => 'Nasi';

  @override
  String get plFoodChickpeas => 'Kacang arab';

  @override
  String get plFoodSalmon => 'Salmon';

  @override
  String get plFoodBroccoli => 'Brokoli';

  @override
  String get plFoodPotato => 'Kentang';

  @override
  String get plFoodLentils => 'Kacang lentil';

  @override
  String get plFoodSardines => 'Sarden';

  @override
  String get plFoodAlmonds => 'Almon';

  @override
  String get plFoodKefir => 'Kefir';

  @override
  String get plFoodPumpkinSeeds => 'Biji labu';

  @override
  String get wtCoffee => 'Kopi';

  @override
  String get wtTea => 'Teh';

  @override
  String get wtCola => 'Cola';

  @override
  String get wtEnergyDrink => 'Minuman energi';

  @override
  String get crCustomBadge => 'Buatan sendiri';

  @override
  String get crNameHint => 'mis. Peregangan Pagi Bertenaga';

  @override
  String get crDoseHint => 'mis. 3x10 kali atau 3x30 detik';

  @override
  String get paywallLifetime => 'Seumur Hidup';

  @override
  String paywallOnce(String price) {
    return '$price sekali bayar';
  }

  @override
  String get paywallLifetimeBadge => 'Tanpa langganan';

  @override
  String get paywallLifetimeDisclaimer =>
      'Sekali bayar · tanpa langganan, tidak ada perpanjangan';

  @override
  String get pwSlidePotentialTitle => 'Lihat potensimu';

  @override
  String get pwSlidePotentialCaption =>
      'Dihitung dari usiamu, tinggimu, dan tinggi orang tuamu.';

  @override
  String get pwSlideTodayTitle => 'Rencana untuk setiap hari';

  @override
  String get pwSlideTodayCaption =>
      'Latihan harian singkat dengan panduan video.';

  @override
  String get pwSlideProgramTitle => '70 hari, 10 level';

  @override
  String get pwSlideProgramCaption =>
      'Setiap minggu gerakannya sedikit lebih berat.';

  @override
  String get pwSlideNutritionTitle => 'Makan untuk tumbuh';

  @override
  String get pwSlideNutritionCaption =>
      'Target protein, kalsium, dan vitamin D harian yang dibuat untukmu.';

  @override
  String get pwSlideChartTitle => 'Lihat kurvamu naik';

  @override
  String get pwSlideChartCaption =>
      'Setiap ukuran masuk ke jalur menuju potensimu.';

  @override
  String get pwSlideScoreTitle => 'Satu skor untuk kebiasaanmu';

  @override
  String get pwSlideScoreCaption =>
      'Lihat kebiasaan mana yang perlu diperbaiki dulu.';

  @override
  String get pwSlidePostureTitle => 'Berdiri lebih tegak hari ini';

  @override
  String get pwSlidePostureCaption =>
      'Cek postur cepat, plus gerakan untuk memperbaikinya.';

  @override
  String get pwExample => 'Contoh';

  @override
  String pwYouLine(String now, String potential) {
    return 'Kamu: $now → potensi $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return 'Contoh: $now → potensi $potential';
  }

  @override
  String get tv3NewEyebrow => 'Yang baru';

  @override
  String get tv3NewTitle => 'BeTaller dapat update besar';

  @override
  String get tv3NewDesc =>
      'Rencana baru, program baru, tampilan baru. Ini yang baru.';

  @override
  String get tv3PotentialTitle => 'Ini potensimu';

  @override
  String get tv3PotentialDesc =>
      'Tinggimu hari ini di samping tinggi yang bisa kamu capai. Rencananya menutup selisih itu.';

  @override
  String get tv3TodayTitle => 'Rencana hari ini';

  @override
  String tv3TodayDesc(String button) {
    return 'Latihan singkat khusus hari ini. Ketuk $button dan ikuti.';
  }

  @override
  String get tv3ProgramTitle => '70 Hari Disiplin';

  @override
  String get tv3ProgramDesc =>
      'Satu langkah sehari melewati 10 level. Setiap hari dibangun di atas hari sebelumnya.';

  @override
  String get tv3NutritionTitle => 'Target harianmu';

  @override
  String get tv3NutritionDesc =>
      'Protein, kalsium, vitamin D, dan air, dihitung untuk tubuhmu.';

  @override
  String get tv3ChartTitle => 'Lihat kurvamu';

  @override
  String get tv3ChartDesc =>
      'Ukur tiap satu atau dua minggu dan lihat garismu naik menuju potensimu.';

  @override
  String get tv3ScoreTitle => 'Skor BeTaller-mu';

  @override
  String get tv3ScoreDesc =>
      'Satu angka untuk seberapa baik kamu. Naikkan area terlemahmu dulu.';

  @override
  String get tv3Next => 'Berikutnya';

  @override
  String get tv3ShowMe => 'Tunjukkan';

  @override
  String get tv3Done => 'Ayo';

  @override
  String get obWhyTitle => 'Kenapa kamu ingin lebih tinggi?';

  @override
  String get obWhySubtitle =>
      'Pilih semua yang sesuai. Rencanamu dimulai dari alasanmu.';

  @override
  String get obWhyConfidence => 'Lebih percaya diri';

  @override
  String get obWhyImpression => 'Kesan pertama lebih kuat';

  @override
  String get obWhySports => 'Lebih jago olahraga';

  @override
  String get obWhyClothes => 'Baju lebih pas';

  @override
  String get obWhyPhotos => 'Lebih keren di foto';

  @override
  String get obWhyPotential => 'Cuma ingin tahu potensiku';

  @override
  String get obTriedTitle => 'Pernah coba aplikasi tinggi badan lain?';

  @override
  String get obTriedSubtitle =>
      'Tidak ada jawaban salah. Ini membantu kami menunjukkan bedanya di sini.';

  @override
  String get obTriedStopped => 'Pernah, tapi berhenti';

  @override
  String get obTriedStill => 'Ya, masih pakai satu';

  @override
  String get obTriedFirst => 'Belum, ini yang pertama';

  @override
  String get obTriedStoppedTitle => 'Angka saja tidak bikin kamu bertahan';

  @override
  String get obTriedStoppedBody =>
      'Kebanyakan aplikasi cuma kasih angka. BeTaller mengubahnya jadi rencana harian yang bisa kamu centang, dengan pengingat di jam pilihanmu.';

  @override
  String get obTriedStillTitle => 'Pertahankan yang cocok untukmu';

  @override
  String get obTriedStillBody =>
      'BeTaller menambah bagian hariannya: rencana dari jawabanmu sendiri yang bisa kamu centang, selangkah demi selangkah.';

  @override
  String get obTriedFirstTitle => 'Tempat yang pas untuk mulai';

  @override
  String get obTriedFirstBody =>
      'Di sini kamu tidak cuma dapat angka. BeTaller mengubah jawabanmu jadi rencana harian yang bisa kamu centang.';

  @override
  String get obTriedCardTitle => 'Yang kamu centang tiap hari';

  @override
  String get obTriedItem1 => 'Latihan singkat yang dipilih untuk minggumu';

  @override
  String get obTriedItem2 => 'Target proteinmu';

  @override
  String get obTriedItem3 => 'Tidur tepat waktu';

  @override
  String get obBlockTitle => 'Apa yang menghalangimu?';

  @override
  String get obBlockSubtitle =>
      'Pilih semua yang sesuai. Rencanamu akan menyesuaikan.';

  @override
  String get obBlockForget => 'Aku lupa';

  @override
  String get obBlockTime => 'Tidak cukup waktu';

  @override
  String get obBlockExercises => 'Aku tidak tahu latihan apa';

  @override
  String get obBlockMotivation => 'Aku kehilangan motivasi';

  @override
  String get obBlockBedtime => 'Aku tidur larut';

  @override
  String get obBlockMeals => 'Aku sering lewat makan';

  @override
  String get obFirstTitle =>
      'Hal pertama yang kamu lakukan saat sudah lebih tinggi?';

  @override
  String get obFirstSubtitle => 'Bayangkan. Itulah yang sedang kamu kejar.';

  @override
  String get obFirstWardrobe => 'Ganti isi lemari';

  @override
  String get obFirstMuscle => 'Bangun otot';

  @override
  String get obFirstPhotos => 'Lebih sering posting foto';

  @override
  String get obFirstTeam => 'Ikut seleksi tim';

  @override
  String get obFirstFeelGood => 'Tidak ada yang khusus, cuma merasa senang';

  @override
  String get obBuiltChip => 'Dibuat untukmu';

  @override
  String get obBuiltTitle => 'Rencanamu, disusun sesuai dirimu';

  @override
  String get obBuiltReason => 'Alasanmu';

  @override
  String get obBuiltGoal => 'Target';

  @override
  String get obBuiltWhen => 'Saat kamu sampai';

  @override
  String get obBuiltBlockers => 'Penghalangmu, sudah diatasi';

  @override
  String get obFixForget => 'Pengingat di jam yang kamu pilih';

  @override
  String get obFixTime => 'Sesi singkat, kebanyakan sekitar 15 menit';

  @override
  String get obFixExercises =>
      'Gerakan dengan panduan video, langkah demi langkah';

  @override
  String get obFixMotivation => 'Streak dan level yang bikin kamu terus lanjut';

  @override
  String get obFixBedtime => 'Target tidur dan pengingat jam tidur';

  @override
  String get obFixMeals => 'Target protein dan menu makan';

  @override
  String get obNotifTitle => 'BeTaller mengingatkanmu di saat yang penting';

  @override
  String get obNotifSubtitle =>
      'Diatur sesuai jam yang kamu berikan. Bisa kamu ubah kapan saja.';

  @override
  String get obNotifWorkout => 'Latihan';

  @override
  String obNotifWorkoutDetail(String time) {
    return '30 mnt sebelum sesi jam $time';
  }

  @override
  String get obNotifMeal => 'Makan dan protein';

  @override
  String obNotifMealDetail(String time) {
    return 'Saat makan jam $time';
  }

  @override
  String get obNotifWater => 'Air';

  @override
  String get obNotifWaterDetail => 'Jeda minum di sore hari';

  @override
  String get obNotifSleep => 'Bersantai';

  @override
  String obNotifSleepDetail(String time) {
    return 'Satu jam sebelum tidur jam $time';
  }

  @override
  String get obNotifAllow => 'Nyalakan pengingat';

  @override
  String get obNotifNotNow => 'Nanti saja';

  @override
  String get obNotifNow => 'sekarang';

  @override
  String get ftOneFree => '1 gratis';

  @override
  String get ftFreeToday => 'Gratis hari ini';

  @override
  String get ftContinuePro => 'Lanjut dengan Pro';

  @override
  String get ftNotNow => 'Nanti saja';

  @override
  String get ftOutWorkoutTitle => 'Latihan gratismu sudah terpakai';

  @override
  String get ftOutWorkoutBody =>
      'Jaga streak-mu dengan Pro: latihan terpandu tiap hari, setiap gerakan sudah diatur waktunya.';

  @override
  String get ftOutDayTitle => 'Hari pertama gratismu sudah selesai';

  @override
  String get ftOutDayBody =>
      'Rencana, target, dan progresmu tetap bisa dibaca di sini. Jaga streak-mu dengan Pro: centang rencanamu dan catat minum serta tidur tiap hari.';

  @override
  String get ftOutPostureTitle => 'Cek postur gratismu sudah terpakai';

  @override
  String get ftOutPostureBody =>
      'Hasilmu tetap di sini. Cek lagi tiap minggu dengan Pro dan lihat posturmu membaik.';

  @override
  String get ftOutPhotosTitle => 'Perbandingan foto gratismu sudah terpakai';

  @override
  String get ftOutPhotosBody =>
      'Pasangan foto itu tetap bisa kamu lihat. Tambah foto lagi dan bandingkan dua foto mana saja dengan Pro.';

  @override
  String get ftOutReportTitle => 'Laporan mingguan gratismu sudah terpakai';

  @override
  String get ftOutReportBody =>
      'Dapatkan rangkuman lengkap tiap minggu dengan Pro: tiap hari dinilai, targetmu, dan satu hal untuk diperbaiki.';

  @override
  String get ftOutScoreTitle => 'Kamu sudah melihat rincian skor gratismu';

  @override
  String get ftOutScoreBody =>
      'Skormu tetap di layar. Lihat apa yang membentuknya dan langkah berikutnya, tiap hari dengan Pro.';

  @override
  String get ftOutArticleTitle => 'Kamu sudah membaca artikel gratismu';

  @override
  String get ftOutArticleBody =>
      'Artikel itu tetap terbuka untukmu. Baca seluruh pustaka dengan Pro.';

  @override
  String get ftWhyWorkout => 'Latihan terpandu adalah bagian dari Pro';

  @override
  String get ftWhyPlan => 'Mencentang rencanamu adalah bagian dari Pro';

  @override
  String get ftWhyProgram => 'Program 70 hari adalah bagian dari Pro';

  @override
  String get ftWhyWater => 'Mencatat minum tiap hari adalah bagian dari Pro';

  @override
  String get ftWhySleep => 'Mencatat tidur tiap hari adalah bagian dari Pro';

  @override
  String get ftWhyNutrition =>
      'Rencana nutrisi harianmu adalah bagian dari Pro';

  @override
  String get ftWhyPosture => 'Cek postur mingguan adalah bagian dari Pro';

  @override
  String get ftWhyPhotos => 'Perbandingan foto adalah bagian dari Pro';

  @override
  String get ftWhyReport => 'Laporan mingguanmu adalah bagian dari Pro';

  @override
  String get ftWhyScore => 'Rincian skormu adalah bagian dari Pro';

  @override
  String get ftWhyArticle => 'Seluruh pustaka adalah bagian dari Pro';

  @override
  String get ftPlanLocked =>
      'Rencanamu tetap bisa dibaca di sini. Mencentangnya adalah bagian dari Pro.';

  @override
  String get ftNutritionLocked =>
      'Target dan menu makanmu tetap bisa dibaca di sini. Mencentangnya adalah bagian dari Pro.';

  @override
  String get ftPreviewTag => 'Pratinjau';

  @override
  String get ftPreviewTitle => 'Itu tadi pratinjaumu';

  @override
  String get ftPreviewBody =>
      'Sisa latihan ini adalah bagian dari Pro. Ini yang berikutnya:';

  @override
  String get ftFreeWorkoutUsed =>
      'Itu tadi latihan terpandu gratismu. Dengan Pro, latihannya ada tiap hari.';

  @override
  String get ftScoreLockedTitle => 'Apa yang membentuk skormu';

  @override
  String get ftScoreLockedBody =>
      'Setiap bagian skormu, dasarnya, dan satu hal yang perlu dilakukan berikutnya.';

  @override
  String get ftReportLockedTitle => 'Minggumu selengkapnya';

  @override
  String get ftReportLockedBody =>
      'Setiap hari dinilai sesuai rencanamu, targetmu, tinggimu, dan satu fokus untuk minggu depan.';

  @override
  String get ftPhotosLockedTitle => 'Bandingkan dua foto ini';

  @override
  String get ftPhotosLockedBody =>
      'Perbandingan gratismu sudah terpakai. Dengan Pro kamu bisa geser di antara dua foto mana saja.';

  @override
  String get ftArticleFreeLine =>
      'Artikel pertamamu gratis. Pilih yang kamu mau.';

  @override
  String get plFinishWorkout => 'Selesai';

  @override
  String get obTriedMostApps => 'Kebanyakan aplikasi';

  @override
  String get obTriedThatsIt => 'Satu angka, sudah itu saja.';

  @override
  String get obTriedPlanLabel => 'Harimu di BeTaller';

  @override
  String get obTriedProteinSub => 'Dibagi ke waktu makanmu';

  @override
  String get obTriedSleepSub => 'Pengingat sebelum tidur';

  @override
  String get obTriedFeatVideo => 'Gerakan dengan panduan video';

  @override
  String get obTriedFeatReminders => 'Pengingat di jam pilihanmu';

  @override
  String get obTriedFeatStreaks => 'Streak dan level';

  @override
  String get obBedtimeUnknown => 'Aku tidak tahu, tidak tentu';

  @override
  String obBedtimeUnknownHint(String time) {
    return 'Kami sarankan jam $time, sesuai kebutuhan tidur di usiamu. Bisa kamu ubah kapan saja.';
  }

  @override
  String get obWorkoutTimeUnknown => 'Aku tidak tahu, jamnya tidak tetap';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return 'Untuk sekarang kami pakai jam $time. Bisa kamu ubah kapan saja.';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return 'Saran: tidur sekitar jam $time. Ubah kapan saja.';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return 'Saran: latihan sekitar jam $time. Ubah kapan saja.';
  }

  @override
  String get obNotifSubtitleSuggested =>
      'Diatur sesuai jam yang kamu berikan, dengan saran untuk yang kamu ragu. Bisa kamu ubah kapan saja.';

  @override
  String get plFoodBrownRice => 'Nasi merah';

  @override
  String get unitHeightTitle => 'Satuan tinggi';

  @override
  String get unitWeightTitle => 'Satuan berat';

  @override
  String get unitWaterTitle => 'Satuan air';

  @override
  String get unitOptCm => 'Sentimeter';

  @override
  String get unitOptFtIn => 'Kaki dan inci';

  @override
  String get unitOptKg => 'Kilogram';

  @override
  String get unitOptLb => 'Pon';

  @override
  String get unitOptStLb => 'Stone dan pon';

  @override
  String get unitOptLiters => 'Liter';

  @override
  String get unitOptFlOz => 'Ons cairan';

  @override
  String achieveGrowthImp(String amount) {
    return 'Tumbuh $amount';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return 'Catat total tumbuh $amount';
  }

  @override
  String get postureBenefitIn =>
      'Kepala, bahu, dan punggung bawah. Berdiri tegak bisa menampakkan sekitar 1 inci tinggi aslimu.';

  @override
  String get notifPostureBodyIn =>
      'Punggung tegak, bahu ke belakang. Postur bagus = beda sekitar 1 inci!';

  @override
  String get painPostureDescIn =>
      'Postur yang benar bisa langsung menambah hingga sekitar 1 inci. Rutinitas postur harian BeTaller membentuknya dalam beberapa minggu.';

  @override
  String get routinePostureDescIn =>
      'Punggung tegak, bahu ke belakang. Cek tiap jam. Postur bagus = beda sekitar 1 inci.';

  @override
  String get sciPostureCheckIn =>
      'Postur yang benar bisa langsung menambah sekitar 1 inci tinggi yang terlihat dan mencegah tekanan pada tulang belakang';

  @override
  String get routineProteinDescLb =>
      'Telur, ayam, ikan, susu. Minimal 0.7 g protein per lb berat badan setiap hari.';

  @override
  String pwPersonalTitle(String height) {
    return 'Rencanamu untuk mencapai $height sudah siap';
  }

  @override
  String get pwPersonalEstimate =>
      'Perkiraan potensi dari jawabanmu, bukan jaminan';

  @override
  String pwPersonalReason(String reason) {
    return 'Alasanmu: $reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return 'Pengingat bersantai sebelum tidur jam $time';
  }

  @override
  String get obParentUnknown => 'Aku tidak tahu';

  @override
  String get obParentUnknownHint =>
      'Kami pakai rata-rata tinggi orang dewasa sebagai gantinya. Kurang akurat, dan bisa kamu tambahkan di profil kapan saja.';

  @override
  String get obEthnicityWhy =>
      'Hanya dipakai untuk memperkirakan tinggi orang tua yang tidak kamu ketahui.';

  @override
  String get resultNoParentNote =>
      'Diperkirakan tanpa tinggi salah satu orang tua, jadi kurang akurat. Tambahkan di profil kapan saja.';

  @override
  String get resultNoParentsNote =>
      'Diperkirakan tanpa tinggi orang tuamu, jadi kurang akurat. Tambahkan di profil kapan saja.';

  @override
  String get resultFootnoteEstimated =>
      'Perkiraan berdasarkan data grafik pertumbuhan dan rata-rata tinggi orang dewasa. Bukan saran medis.';

  @override
  String get obBudgetChip => 'HARGA ADIL';

  @override
  String get obBudgetTitle =>
      'Harga BeTaller dibuat untuk setiap remaja yang ingin tumbuh';

  @override
  String get obBudgetDesc =>
      'Tinggi badanmu tidak seharusnya bergantung pada isi dompetmu. Karena itu harganya diatur terpisah untuk tiap negara.';

  @override
  String obBudgetWeek(String price) {
    return 'Pro satu minggu di sini: $price';
  }

  @override
  String get obBudgetLocalTitle => 'Harga untuk negaramu';

  @override
  String get obBudgetLocalDesc =>
      'Bukan konversi dari dolar AS: disesuaikan dengan kantong di tempatmu tinggal.';

  @override
  String get obBudgetWeekTitle => 'Mulai dengan seminggu saja';

  @override
  String get obBudgetWeekDesc =>
      'Tanpa bayar besar di awal. Batalkan kapan saja di pengaturan Apple ID-mu.';

  @override
  String get obBudgetAllTitle => 'Semua dalam satu paket';

  @override
  String get obBudgetAllDesc =>
      'Latihan, tidur, nutrisi, postur, dan laporan progres.';

  @override
  String get obRateTitle => 'BeTaller dibuat untuk benar-benar membantumu';

  @override
  String get obRateDesc =>
      'Kalau kamu suka perhatian pribadi dan kejujuran kami, kami bakal senang banget kalau kamu kasih rating.';

  @override
  String get obRateCta => 'Beri Rating BeTaller';

  @override
  String get obRateLater => 'Nanti saja';
}
