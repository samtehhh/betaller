// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navAnalysis => 'التحليل';

  @override
  String get navRoutines => 'خطتي';

  @override
  String get disciplineTitle => 'الانضباط';

  @override
  String get disciplineProgramTitle => 'برنامج الانضباط';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total يوم';
  }

  @override
  String get disciplineCompleteDay => 'أكمل اليوم';

  @override
  String disciplineDayN(int n) {
    return 'اليوم $n';
  }

  @override
  String get disciplineLevels => 'المستويات';

  @override
  String get disciplineLevelDone => 'مكتمل';

  @override
  String get disciplineLocked => 'مقفل';

  @override
  String get disciplineTodayIs => 'اليوم';

  @override
  String get disciplineToday => 'اليوم';

  @override
  String get disciplineTodayPlan => 'خطة اليوم';

  @override
  String get disciplineWeek => 'هذا الأسبوع';

  @override
  String get disciplineMonth => 'هذا الشهر';

  @override
  String get disciplineLevel => 'مستوى الانضباط';

  @override
  String disciplineStreakDays(int days) {
    return 'سلسلة $days يوم';
  }

  @override
  String disciplineToNext(int days) {
    return '$days يوم للمستوى التالي';
  }

  @override
  String get disciplineMaxTier => 'وصلت لأعلى مستوى';

  @override
  String get disciplineTierSpark => 'شرارة';

  @override
  String get disciplineTierSteady => 'ثابت';

  @override
  String get disciplineTierSharp => 'حاد';

  @override
  String get disciplineTierSolid => 'صلب';

  @override
  String get disciplineTierRelentless => 'لا يتوقف';

  @override
  String get disciplineTierUnbroken => 'لا ينكسر';

  @override
  String get disciplineTierLegend => 'أسطورة';

  @override
  String get goalPerfectDays => 'أيام أكملت فيها الخطة';

  @override
  String get goalWorkouts => 'جلسات التمرين';

  @override
  String get goalMeasurement => 'قياس الطول';

  @override
  String get goalPhoto => 'صورة التقدم';

  @override
  String get goalPostureCheck => 'فحص الوقفة';

  @override
  String get disciplineAllDone => 'خلصت مهام اليوم';

  @override
  String disciplineDayProgress(int done, int total) {
    return '$done/$total مكتمل';
  }

  @override
  String get navProgress => 'التقدم';

  @override
  String get trackingSection => 'أدوات المتابعة';

  @override
  String get photosBenefit =>
      'قبل وبعد، جنبًا إلى جنب. شاهد التغيير بعينك بدل أن تقرأ عنه.';

  @override
  String get postureBenefit =>
      'الرأس والكتفان وأسفل الظهر. الوقفة المستقيمة تُظهر حتى 2-3 cm إضافية من طولك الحقيقي.';

  @override
  String get reportBenefit => 'قيّم أسبوعك يومًا بيوم واعرف أين تراجعت.';

  @override
  String get photosCta => 'أضف صورة';

  @override
  String get postureCta => 'حلّل';

  @override
  String get reportCta => 'افتح التقرير';

  @override
  String get toolStateReady => 'جاهز';

  @override
  String get photosSummaryEmpty => 'أضف أول صورة';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صورة',
      many: '$count صورة',
      few: '$count صور',
      two: '$count صور',
      one: 'صورة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => 'لا يوجد تحليل بعد';

  @override
  String postureSummaryScore(int score) {
    return 'الوقفة $score/100';
  }

  @override
  String get navProfile => 'الملف الشخصي';

  @override
  String greeting(String name) {
    return 'مرحبًا، $name';
  }

  @override
  String get currentHeight => 'الطول الحالي';

  @override
  String get target => 'الهدف';

  @override
  String completed(String pct) {
    return 'مكتمل $pct%';
  }

  @override
  String remaining(String cm, String unit) {
    return 'متبقٍ +$cm $unit';
  }

  @override
  String get updateAnalysis => 'حدّث التحليل';

  @override
  String get analysisSubtitle => 'توقعات من أطوالك السابقة وعاداتك';

  @override
  String get dailyRoutines => 'الروتين اليومي';

  @override
  String get allRoutinesDone => 'أكملت كل الروتين!';

  @override
  String get water => 'الماء';

  @override
  String get sleep => 'النوم';

  @override
  String get growthSummary => 'ملخص النمو';

  @override
  String get total => 'الإجمالي';

  @override
  String get last => 'الأخير';

  @override
  String get measurement => 'قياسات';

  @override
  String get dailyTip => 'نصيحة اليوم';

  @override
  String get waterTracking => 'متابعة الماء';

  @override
  String get waterGoalReached => 'حققت هدف اليوم';

  @override
  String waterRemaining(String amount) {
    return 'باقي $amount';
  }

  @override
  String get undo => 'تراجع';

  @override
  String waterToday(String amount) {
    return 'اليوم: $amount L';
  }

  @override
  String get sleepTracking => 'متابعة النوم';

  @override
  String sleepTarget(String hours) {
    return 'الهدف: $hours ساعات';
  }

  @override
  String get hours => 'ساعات';

  @override
  String get save => 'حفظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get analysis => 'التحليل';

  @override
  String get betallerScore => 'نقاط BeTaller';

  @override
  String get genetic => 'الوراثة';

  @override
  String get growth => 'النمو';

  @override
  String get nutrition => 'التغذية';

  @override
  String get sleepLabel => 'النوم';

  @override
  String get discipline => 'الانضباط';

  @override
  String get improveScore => 'ارفع نقاطك';

  @override
  String gradeProgress(String current, String next) {
    return '$current ← $next';
  }

  @override
  String get nutritionCritical => 'التغذية في خطر!';

  @override
  String get nutritionStrengthen => 'قوِّ تغذيتك';

  @override
  String get sleepRecordAdd => 'أضف سجل نوم';

  @override
  String get sleepPoor => 'نومك غير منتظم';

  @override
  String get sleepImprove => 'حسّن نومك';

  @override
  String get startToday => 'ابدأ اليوم!';

  @override
  String routinesRemaining(int count) {
    return 'باقي $count روتين';
  }

  @override
  String get keepStreak => 'حافظ على السلسلة';

  @override
  String get addFirstMeasurement => 'أضف أول قياس';

  @override
  String get addMeasurement => 'أضف قياسًا';

  @override
  String waterHalfNotReached(String amount) {
    return 'لم تصل لنصف هدف الماء اليوم. اشرب ${amount}L إضافية.';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'باقي ${amount}L لهدف الماء. اقتربت!';
  }

  @override
  String bmiLow(String bmi) {
    return 'مؤشر كتلة جسمك $bmi، وهو منخفض قليلًا. زِد البروتين والسعرات.';
  }

  @override
  String get bodyFactsTitle => 'جسمك';

  @override
  String get dailyNeedsTitle => 'أهدافك اليومية';

  @override
  String bmiHigh(String bmi) {
    return 'مؤشر كتلة جسمك $bmi، وهو مرتفع قليلًا. ركّز على الأكل الصحي.';
  }

  @override
  String get nutritionDefault => 'أكمل هدف الماء وحافظ على تغذية متوازنة.';

  @override
  String sleepNoRecord(String hours) {
    return 'لا يوجد سجل نوم اليوم. استهدف $hours ساعات وسجّلها.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'نمت $current ساعات اليوم، أقل بـ $missing ساعات. نم أبكر!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'اقتربت. الوصول إلى $hours ساعات يرفع هرمون النمو لأقصى حد.';
  }

  @override
  String get sleepGood => 'نومك ممتاز! استمر.';

  @override
  String noRoutinesDone(int total) {
    return 'لم تكمل أي روتين اليوم. ابدأ بواحد من $total!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return 'أكملت $done/$total روتين اليوم. باقي $left!';
  }

  @override
  String streakBuilding(int needed) {
    return 'عمل رائع اليوم! باقي $needed أيام لتبدأ سلسلة.';
  }

  @override
  String streakContinue(int days) {
    return 'سلسلة $days يوم! نقاطك ترتفع كلما استمريت.';
  }

  @override
  String get noMeasurements =>
      'لا توجد قياسات طول بعد. أضف أول قياس لتوقعات أدق.';

  @override
  String fewMeasurements(int count) {
    return 'أضف $count قياسات أخرى لحساب سرعة النمو.';
  }

  @override
  String goodMeasurements(int count) {
    return 'لديك $count قياسات. الوصول إلى 5 يحسّن الدقة كثيرًا.';
  }

  @override
  String get keepMeasuring =>
      'استمر في إضافة القياسات. كل قياس جديد يحسّن التوقعات.';

  @override
  String get heightPrediction => 'توقع الطول';

  @override
  String get predictedHeightAt21 => 'الطول المتوقع في عمر 21';

  @override
  String get predictionMethod =>
      'محسوب بدمج الوراثة (الوالدين) وسرعة النمو ومؤشر كتلة الجسم والعمر.';

  @override
  String get growthStatus => 'حالة النمو';

  @override
  String get growthRemaining => 'ما زال أمامك';

  @override
  String get growthBreakdown => 'من أين تأتي هذه السنتيمترات';

  @override
  String get geneticGainLabel => 'المكسب الوراثي';

  @override
  String get lifestyleLabel => 'نمط الحياة';

  @override
  String get geneticCeilingLabel => 'السقف';

  @override
  String get reachableTargetHeight => 'طولك المستهدف الممكن';

  @override
  String get geneticCeilingProgress => 'التقدم نحو السقف الوراثي';

  @override
  String get completionLabel => 'الإنجاز';

  @override
  String get growthVelocity => 'سرعة النمو';

  @override
  String get noData => 'لا بيانات';

  @override
  String growthRate(String rating) {
    return 'معدل النمو: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'السعرات';

  @override
  String get kcalDay => 'kcal/يوم';

  @override
  String get daily => 'يوميًا';

  @override
  String get protein => 'البروتين';

  @override
  String get minimum => 'الحد الأدنى';

  @override
  String get age => 'العمر';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get yearlyPrediction => 'التوقع السنوي';

  @override
  String ageYear(int age) {
    return '$age سنة';
  }

  @override
  String get progressTitle => 'متابعة التقدم';

  @override
  String get totalGrowth => 'الإجمالي';

  @override
  String get lastDiff => 'آخر فرق';

  @override
  String get measurementCount => 'قياسات';

  @override
  String get heightChart => 'رسم الطول';

  @override
  String get chartMinData => 'يحتاج الرسم إلى قياسين على الأقل';

  @override
  String get chartInstruction => 'أضف قياسات لترى رسم تقدمك!';

  @override
  String get addMeasurementButton => 'أضف قياسًا جديدًا';

  @override
  String get measurementHistory => 'سجل القياسات';

  @override
  String get deleteTitle => 'حذف القياس';

  @override
  String get deleteMessage => 'هل أنت متأكد أنك تريد حذف هذا القياس؟';

  @override
  String get dismiss => 'إلغاء';

  @override
  String get delete => 'حذف';

  @override
  String get newMeasurement => 'قياس طول جديد';

  @override
  String get routines => 'الروتين';

  @override
  String streakDays(int days) {
    return '$days يوم';
  }

  @override
  String get progressStatus => 'حالة التقدم';

  @override
  String get completedLabel => 'اكتمل!';

  @override
  String get all => 'الكل';

  @override
  String get exercise => 'التمرين';

  @override
  String get posture => 'الوقفة';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'الأفضل: $days يوم',
      many: 'الأفضل: $days يومًا',
      few: 'الأفضل: $days أيام',
      two: 'الأفضل: يومان',
      one: 'الأفضل: يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get editProfile => 'تعديل الملف';

  @override
  String get editProfileSubtitle => 'حدّث الطول والوزن والعمر';

  @override
  String get name => 'الاسم';

  @override
  String birthDate(String date) {
    return 'الميلاد: $date';
  }

  @override
  String get heightCm => 'الطول (cm)';

  @override
  String get weightKg => 'الوزن (kg)';

  @override
  String get fatherHeight => 'طول الأب (cm)';

  @override
  String get motherHeight => 'طول الأم (cm)';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get reminderNextLabel => 'التذكير القادم';

  @override
  String get reminderManageHint => 'إدارة تذكيراتك';

  @override
  String get reminderOffCta => 'فعّل الإشعارات';

  @override
  String get stateOn => 'مفعّل';

  @override
  String get stateOff => 'متوقف';

  @override
  String get reminderMasterTitle => 'الإشعارات';

  @override
  String reminderActiveCount(int count) {
    return '$count تذكيرات مفعّلة';
  }

  @override
  String get reminderBuiltIn => 'تذكيرات جاهزة';

  @override
  String get reminderYourOwn => 'تذكيراتك الخاصة';

  @override
  String get reminderAdd => 'أضف تذكيرًا';

  @override
  String get reminderDays => 'الأيام';

  @override
  String get reminderEveryDay => 'كل يوم';

  @override
  String get reminderLabelHint => 'بماذا نذكّرك؟';

  @override
  String get reminderEmptyHint =>
      'أضف تذكيراتك: تمرين، فيتامينات، تمدد، أي شيء تحتاجه.';

  @override
  String get reminderCustom => 'تذكير';

  @override
  String get reminderCustomBody => 'حان الوقت الذي حددته.';

  @override
  String get reminderExercise => 'التمرين';

  @override
  String get reminderNutrition => 'التغذية';

  @override
  String get reminderWater => 'الماء';

  @override
  String get reminderPosture => 'الوقفة';

  @override
  String get reminderRoutine => 'الروتين اليومي';

  @override
  String get reminderSleep => 'النوم';

  @override
  String get reminderMeasurement => 'قياس الطول';

  @override
  String get notificationsOn => 'التذكيرات مفعّلة';

  @override
  String get notificationsOff => 'التذكيرات متوقفة';

  @override
  String get premium => 'ترقَّ إلى Premium';

  @override
  String get premiumSubtitle => 'افتح كل الميزات';

  @override
  String get rateUs => 'قيّمنا';

  @override
  String get rateSubtitle => 'عجبك التطبيق؟ أعطنا 5 نجوم!';

  @override
  String get share => 'شارك التطبيق';

  @override
  String get shareSubtitle => 'أخبر أصدقاءك عن BeTaller';

  @override
  String get shareText =>
      'اكتشفت إمكانات نموي مع BeTaller! جرّبه أنت أيضًا: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'أرسل ملاحظاتك';

  @override
  String get feedbackSubtitle => 'تواصل معنا';

  @override
  String get resetData => 'إعادة ضبط كل البيانات';

  @override
  String get resetSubtitle => 'سيتم حذف كل البيانات';

  @override
  String get resetTitle => 'إعادة ضبط البيانات';

  @override
  String get resetMessage =>
      'سيتم حذف كل البيانات وستعود إلى شاشة البداية. لا يمكن التراجع عن ذلك!';

  @override
  String get reset => 'إعادة ضبط';

  @override
  String get premiumSoon => 'Premium قريبًا!';

  @override
  String get brandingSubtitle => 'اكتشف إمكانات نموك';

  @override
  String get statistics => 'الإحصائيات';

  @override
  String get profileGroupSupport => 'الدعم';

  @override
  String get profileGroupAccount => 'الحساب';

  @override
  String get profileGroupApp => 'التطبيق';

  @override
  String get profileGroupDanger => 'منطقة الخطر';

  @override
  String profileMemberSince(String date) {
    return 'منذ $date';
  }

  @override
  String get profileYourJourney => 'رحلتك';

  @override
  String get profileTotalGrowth => 'الإجمالي';

  @override
  String get currentStreak => 'السلسلة الحالية';

  @override
  String get bestStreakLabel => 'أفضل سلسلة';

  @override
  String get achievementLabel => 'إنجاز';

  @override
  String get achievements => 'الإنجازات';

  @override
  String get achievementUnlockedTitle => '🏆 فتحت إنجازًا!';

  @override
  String get reminderTapHint => 'اضغط على أي تذكير لتغيير وقته وأيامه';

  @override
  String get earned => 'حصلت عليه!';

  @override
  String get notEarned => 'لم تحصل عليه بعد';

  @override
  String get ok => 'حسنًا';

  @override
  String get language => 'اللغة';

  @override
  String get languageSubtitle => 'غيّر لغة التطبيق';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'اكتشف إمكانات نموك';

  @override
  String get onboardingMeetYou => 'خلّنا نتعرف عليك';

  @override
  String get onboardingInfoNeeded => 'معلومات أساسية نحتاجها للتحليل.';

  @override
  String get gender => 'الجنس';

  @override
  String get birthDateLabel => 'تاريخ الميلاد';

  @override
  String get bodyMeasurements => 'قياسات الجسم';

  @override
  String get bodyInfo => 'نحتاج طولك ووزنك الحاليين للتحليل.';

  @override
  String get geneticData => 'البيانات الوراثية';

  @override
  String get geneticInfo => 'طول والديك يحدد إمكاناتك الوراثية.';

  @override
  String get pastHeights => 'أطوالك السابقة';

  @override
  String get pastHeightsInfo =>
      'أدخل الأطوال التي تتذكرها في أعمار مختلفة. يمكنك ترك خانات فارغة.';

  @override
  String get heightHint => 'أدخل الطول...';

  @override
  String get ageLabel => 'عمر';

  @override
  String get habits => 'عاداتك';

  @override
  String get habitsInfo => 'نمط حياتك يؤثر مباشرة على التوقعات.';

  @override
  String get weeklyExercise => 'التمرين الأسبوعي';

  @override
  String get dailySleep => 'النوم اليومي';

  @override
  String get nutritionQuality => 'جودة التغذية';

  @override
  String get nutritionDesc => 'البروتين والألبان والخضار والفواكه';

  @override
  String get nutritionBad => 'سيئة';

  @override
  String get nutritionPoor => 'ضعيفة';

  @override
  String get nutritionMedium => 'متوسطة';

  @override
  String get nutritionGood => 'جيدة';

  @override
  String get nutritionGreat => 'ممتازة';

  @override
  String get startAnalysis => 'ابدأ التحليل';

  @override
  String get continueBtn => 'متابعة';

  @override
  String get analyzeBtn => 'حلّل';

  @override
  String get analyzing => 'جارٍ التحليل';

  @override
  String get analysisComplete => 'اكتمل!';

  @override
  String get analysisDataReceivedTitle => 'استلمنا بياناتك';

  @override
  String get analysisDataReceivedSubtitle => 'نبدأ تحليلك...';

  @override
  String get yourScore => 'نقاطك في BeTaller';

  @override
  String get letsStart => 'يلّا نبدأ';

  @override
  String get splashJourneySubtitle => 'رحلتك تبدأ الآن. 🚀';

  @override
  String get splashPlanSubtitle =>
      'خطتك المخصصة جاهزة.\nمستعد تكتشف إمكانات طولك؟';

  @override
  String get doneBtn => 'تم';

  @override
  String get analysisStep1 => 'نحلل البيانات الوراثية...';

  @override
  String get analysisStep2 => 'نحسب سرعة النمو...';

  @override
  String get analysisStep3 => 'نعالج بيانات التغذية والنوم...';

  @override
  String get analysisStep4 => 'نُعدّ توقع الطول...';

  @override
  String get analysisStep5 => 'نحسب نقاط BeTaller...';

  @override
  String growthPotential(String cm, String unit) {
    return 'إمكانية نمو +$cm $unit';
  }

  @override
  String get heightAt21 => 'في عمر 21';

  @override
  String confidenceLevel(String pct) {
    return 'مستوى الثقة $pct%';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return 'المدى $min - $max $unit';
  }

  @override
  String get currentLabel => 'الحالي';

  @override
  String get predictedLabel => 'المتوقع';

  @override
  String get yearlyPredictions => 'التوقعات السنوية';

  @override
  String get tipMorningMeasure =>
      'قِس طولك في الصباح. الضغط على الفقرات يجعلك أقصر قليلًا خلال اليوم، لذلك قياس الصباح هو الأدق.';

  @override
  String get tipProteinSpread =>
      'وزّع البروتين على وجباتك. لا تأكله دفعة واحدة، تناول بروتينًا مع كل وجبة.';

  @override
  String get tipGrowthHormone =>
      'هرمون النمو يبلغ ذروته أثناء النوم. كن نائمًا بين 10 مساءً و2 فجرًا!';

  @override
  String get tipVitaminD =>
      '15 دقيقة من الشمس يوميًا ترفع إنتاج فيتامين D. وفيتامين D ضروري لامتصاص الكالسيوم.';

  @override
  String get tipBarHanging =>
      'التعلق بالعقلة يخفف الضغط عن العمود الفقري. جرّب 3x30 ثانية يوميًا.';

  @override
  String get tipSwimming =>
      'السباحة من أفضل الرياضات لتمرين الجسم كله ودعم النمو.';

  @override
  String get tipStress =>
      'التوتر يثبّط هرمون النمو. خفّف التوتر بالتأمل واليوغا.';

  @override
  String get routineMorningStretch => 'تمدد الصباح';

  @override
  String get routineMorningStretchDesc =>
      'تمدد 10 دقائق بعد الاستيقاظ مباشرة. مدّ عضلات الظهر والساقين.';

  @override
  String get routineBarHanging => 'التعلق بالعقلة';

  @override
  String get routineBarHangingDesc =>
      'تعلّق بالعقلة لتمديد العمود الفقري. 3 مجموعات x 30 ثانية.';

  @override
  String get routineCobraStretch => 'تمدد الكوبرا';

  @override
  String get routineCobraStretchDesc =>
      'استلقِ على بطنك وارفع الجزء العلوي. مدّ ظهرك. 3 مجموعات x 15 ثانية.';

  @override
  String get routineJumping => 'تمارين القفز';

  @override
  String get routineJumpingDesc =>
      'نط الحبل أو قفز القرفصاء. ينشّط صفائح النمو. 3 مجموعات x 20 تكرار.';

  @override
  String get routineSwimming => 'سباحة أو كرة سلة';

  @override
  String get routineSwimmingDesc =>
      'مارس رياضة تدعم النمو. 30 دقيقة على الأقل.';

  @override
  String get routineYoga => 'يوغا وتمدد المساء';

  @override
  String get routineYogaDesc =>
      'روتين يوغا وتمدد قبل النوم. تخلّص من التوتر وأرخِ عضلاتك.';

  @override
  String get routineProtein => 'تناول البروتين';

  @override
  String get routineProteinDesc =>
      'بيض، دجاج، سمك، ألبان. 1.5g/kg بروتين يوميًا على الأقل.';

  @override
  String get routineCalcium => 'الكالسيوم وفيتامين D';

  @override
  String get routineCalciumDesc =>
      'تناول الحليب والجبن والزبادي. تعرّض للشمس 15 دقيقة. أساسي لنمو العظام.';

  @override
  String get routineWater => 'هدف شرب الماء';

  @override
  String get routineWaterDesc =>
      'اشرب 2-3 لترات ماء يوميًا على الأقل. ضروري للأيض والنمو.';

  @override
  String get routineAvoidJunk => 'ابتعد عن الأكل السريع';

  @override
  String get routineAvoidJunkDesc =>
      'ابتعد عن الوجبات السريعة والمشروبات السكرية والأطعمة المصنّعة.';

  @override
  String get routineSleep => 'نوم جيد (8-10 ساعات)';

  @override
  String get routineSleepDesc =>
      'هرمون النمو يُفرز أثناء النوم. من 10 مساءً إلى 6 صباحًا ساعات ذهبية.';

  @override
  String get routineNoScreen => 'بلا شاشات قبل النوم';

  @override
  String get routineNoScreenDesc =>
      'أبعد الجوال والكمبيوتر قبل النوم بساعة. لا تعطّل إفراز الميلاتونين.';

  @override
  String get routinePosture => 'فحص الوقفة';

  @override
  String get routinePostureDesc =>
      'ظهر مستقيم وكتفان للخلف. افحص كل ساعة. الوقفة الصحيحة = فرق 2-3 cm.';

  @override
  String get routineWallStand => 'تمرين الوقوف على الحائط';

  @override
  String get routineWallStandDesc =>
      'استند للحائط: الكعبان والوركان والكتفان والرأس تلمس الحائط. اثبت 5 دقائق.';

  @override
  String get routineSprintIntervals => 'تمرين الركض المتقطع';

  @override
  String get routineSprintIntervalsDesc =>
      'الركض السريع المتقطع يحفّز إفرازًا كبيرًا لهرمون النمو عبر دفعات عالية الشدة.';

  @override
  String get routineHiitWorkout => 'تمرين HIIT';

  @override
  String get routineHiitWorkoutDesc =>
      'تمرين متقطع عالي الشدة لرفع إفراز هرمون النمو لأقصى حد.';

  @override
  String get routineSquats => 'قرفصاء بوزن الجسم';

  @override
  String get routineSquatsDesc =>
      'القرفصاء بوزن الجسم تنشّط صفائح النمو في الساقين والعمود الفقري.';

  @override
  String get routineDeadliftStretch => 'تمدد الرفعة الميتة';

  @override
  String get routineDeadliftStretchDesc =>
      'تمدد الرفعة الميتة لتخفيف ضغط العمود الفقري وصحة الأقراص الفقرية.';

  @override
  String get routineOverheadPress => 'الضغط فوق الرأس';

  @override
  String get routineOverheadPressDesc =>
      'الضغط فوق الرأس يمدّد العمود الفقري ويقوّي عضلات الوقفة.';

  @override
  String get routineSkippingRope => 'نط الحبل';

  @override
  String get routineSkippingRopeDesc =>
      'القفز المتكرر بالحبل ينشّط صفائح النمو في الأطراف السفلية.';

  @override
  String get routinePilatesCore => 'بيلاتس للجذع';

  @override
  String get routinePilatesCoreDesc =>
      'تمارين البيلاتس للجذع تدعم استقامة العمود الفقري والوقفة.';

  @override
  String get routineInversionHang => 'التعلق المقلوب';

  @override
  String get routineInversionHangDesc =>
      'التعلق المقلوب يخفف ضغط الأقراص الفقرية، وقد يضيف 1-2cm مؤقتًا.';

  @override
  String get routineZincIntake => 'أطعمة غنية بالزنك';

  @override
  String get routineZincIntakeDesc =>
      'تناول أطعمة غنية بالزنك خلال اليوم لدعم إنتاج هرمون النمو.';

  @override
  String get routineVitaminDSunlight => 'فيتامين D والشمس';

  @override
  String get routineVitaminDSunlightDesc =>
      'تعرّض لأشعة الشمس المباشرة 15 دقيقة على الأقل لتكوين فيتامين D ونمو العظام.';

  @override
  String get routineArginineFoods => 'أطعمة غنية بالأرجينين';

  @override
  String get routineArginineFoodsDesc =>
      'تناول أطعمة غنية بالأرجينين لتحفيز إفراز هرمون النمو.';

  @override
  String get routineDailyCalories => 'هدف السعرات اليومي';

  @override
  String get routineDailyCaloriesDesc =>
      'حقق هدف سعراتك اليومي. الأكل القليل يبطّئ النمو.';

  @override
  String get routineSleepEnvironment => 'هيّئ مكان نومك';

  @override
  String get routineSleepEnvironmentDesc =>
      'اجعل غرفة نومك مظلمة وباردة لرفع إفراز الميلاتونين وهرمون النمو.';

  @override
  String get routinePreSleepRoutine => 'استرخاء قبل النوم';

  @override
  String get routinePreSleepRoutineDesc =>
      'روتين ثابت قبل النوم يحسّن جودة النوم العميق بنسبة 23%.';

  @override
  String get routineNeckStretches => 'تمدد الرقبة';

  @override
  String get routineNeckStretchesDesc =>
      'تمدد الرقبة يخفف الضغط ويحسّن استقامة الفقرات العنقية.';

  @override
  String get routineShoulderRolls => 'تدوير وفتح الكتفين';

  @override
  String get routineShoulderRollsDesc =>
      'فتح الكتفين يصحح الانحناء للأمام، وقد يضيف 1-2cm في المظهر.';

  @override
  String get achieveCommitment => 'الالتزام';

  @override
  String get achieveCommitmentDesc =>
      'أدخل كل بياناتك، استكشف التطبيق كاملًا، وابدأ استخدامه';

  @override
  String get achieveFirstDay => 'الخطوة الأولى';

  @override
  String get achieveFirstDayDesc => 'أكمل يومك الأول';

  @override
  String get achieveThreeStreak => 'سلسلة 3 أيام';

  @override
  String get achieveThreeStreakDesc => 'أكمل الروتين 3 أيام متتالية';

  @override
  String get achieveWeekStreak => 'سلسلة 7 أيام';

  @override
  String get achieveWeekStreakDesc => 'أكمل الروتين 7 أيام متتالية';

  @override
  String get achieveTwoWeekStreak => 'سلسلة 14 يومًا';

  @override
  String get achieveTwoWeekStreakDesc => 'استمر 14 يومًا بلا توقف';

  @override
  String get achieveMonthStreak => 'سلسلة 30 يومًا';

  @override
  String get achieveMonthStreakDesc => 'أكمل 30 يومًا متتالية';

  @override
  String get achieveTwoMonthStreak => 'سلسلة 60 يومًا';

  @override
  String get achieveTwoMonthStreakDesc => 'أكمل 60 يومًا متتالية';

  @override
  String get achieveHundredStreak => 'سلسلة 100 يوم';

  @override
  String get achieveHundredStreakDesc => 'أكمل 100 يوم متتالية';

  @override
  String get achieveFirstMeasure => 'أول قياس';

  @override
  String get achieveFirstMeasureDesc => 'سجّل أول قياس لطولك';

  @override
  String get achieveThreeMeasures => 'متابِع';

  @override
  String get achieveThreeMeasuresDesc => 'سجّل 3 قياسات طول';

  @override
  String get achieveFiveMeasures => 'متابعة منتظمة';

  @override
  String get achieveFiveMeasuresDesc => 'سجّل 5 قياسات طول';

  @override
  String get achieveTenMeasures => 'صياد البيانات';

  @override
  String get achieveTenMeasuresDesc => 'سجّل 10 قياسات طول';

  @override
  String get achieveFirstCm => 'أول سنتيمتر';

  @override
  String get achieveFirstCmDesc => 'سجّل نموًا إجماليًا 1 cm';

  @override
  String get achieveThreeCm => 'نمو 3 cm';

  @override
  String get achieveThreeCmDesc => 'سجّل نموًا إجماليًا 3 cm';

  @override
  String get achieveFiveCm => 'نمو 5 cm';

  @override
  String get achieveFiveCmDesc => 'سجّل نموًا إجماليًا 5 cm';

  @override
  String get achieveTenCm => 'نمو 10 cm';

  @override
  String get achieveTenCmDesc => 'سجّل نموًا إجماليًا 10 cm';

  @override
  String get quote1 => 'كن أفضل من أمس، كل يوم.';

  @override
  String get quote2 => 'النمو لا يحدث في ليلة، لكن كل ليلة تقرّبك أكثر.';

  @override
  String get quote3 => 'النمو يحتاج صبرًا، استمر!';

  @override
  String get quote4 => 'خطوتك اليوم تبني أساس الغد.';

  @override
  String get quote5 => 'الانضباط يبدأ حين ينتهي الحماس.';

  @override
  String get quote6 => 'جسمك سيشكرك، استمر!';

  @override
  String get quote7 => 'أنت من يحدد حدود إمكاناتك.';

  @override
  String get quote8 => 'الخطوات الصغيرة تصنع تغييرات كبيرة.';

  @override
  String get quote9 => 'أفضل استثمار هو في نفسك.';

  @override
  String get quote10 => 'كل يوم تقترب أكثر من هدفك.';

  @override
  String get quote11 => 'التغيير صعب، لكن الندم أصعب.';

  @override
  String get quote12 => 'جسمك أمانة، اعتنِ به.';

  @override
  String get quote13 => 'منافسك هو أنت بالأمس. تفوّق عليه اليوم!';

  @override
  String get quote14 => 'BeTaller = صبر + انضباط + إيمان';

  @override
  String get quote15 => 'آمن بنفسك، والرحلة ستصنعك.';

  @override
  String get quote16 => 'لا تقل لا أقدر اليوم، كي لا تندم غدًا.';

  @override
  String get quote17 => 'تقدّم كل يوم، ولو 1% فقط.';

  @override
  String get quote18 => 'المرآة ستُظهر تقدمك، اصبر.';

  @override
  String get bmiNormal => 'طبيعي';

  @override
  String get bmiUnderweight => 'وزن ناقص';

  @override
  String get bmiOverweight => 'وزن زائد';

  @override
  String get bmiObese => 'سمنة';

  @override
  String get velocityExcellent => 'ممتازة';

  @override
  String get velocityNormal => 'طبيعية';

  @override
  String get velocitySlow => 'بطيئة';

  @override
  String get velocityVeryLow => 'منخفضة جدًا';

  @override
  String durationMinutes(String min) {
    return '$min دقيقة';
  }

  @override
  String get durationAllDay => 'طوال اليوم';

  @override
  String get durationNight => 'الليل';

  @override
  String durationHours(String hours) {
    return '$hours ساعات';
  }

  @override
  String get onboardingStep1 => 'أدخل معلوماتك الشخصية';

  @override
  String get onboardingStep2 => 'شاركنا أطوالك السابقة';

  @override
  String get onboardingStep3 => 'قيّم عاداتك';

  @override
  String get onboardingStep4 => 'شاهد توقعك ونقاطك';

  @override
  String get hoursShort => 'س';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get systemLanguage => 'لغة النظام';

  @override
  String get emailSubject => 'ملاحظات BeTaller';

  @override
  String get pastHeightsTip =>
      'يمكنك ترك الأعمار التي لا تعرفها فارغة. يكفي إدخال طول أو طولين سابقين.';

  @override
  String get obPastHeightsTitle => 'أطوالك السابقة';

  @override
  String get obPastHeightsSubPart1 => 'أطوالك السابقة تجعل توقعك أدق.';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return 'كم كان طولك في عمر $age؟';
  }

  @override
  String get obSkip => 'تخطَّ';

  @override
  String get obNext => 'التالي';

  @override
  String get obSkipAll => 'تخطَّ الكل';

  @override
  String get currentSuffix => '(الحالي)';

  @override
  String personalizedProtein(String amount) {
    return 'بيض، دجاج، سمك، ألبان. تناول ${amount}g بروتين يوميًا على الأقل.';
  }

  @override
  String personalizedWater(String amount) {
    return 'اشرب ${amount}L ماء يوميًا على الأقل. ضروري للأيض والنمو.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'هرمون النمو يُفرز أثناء النوم. نم $hours ساعات على الأقل. من 10 مساءً إلى 6 صباحًا ساعات ذهبية.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'تناول الحليب والجبن والزبادي. شمس 15 دقيقة. هدف السعرات اليومي: $calories kcal.';
  }

  @override
  String get scoreS => 'ممتاز! أنت تقترب من قمة إمكاناتك.';

  @override
  String get scoreA => 'أداؤك رائع! تحسينات بسيطة توصلك للقمة.';

  @override
  String get scoreB =>
      'أنت على الطريق الصحيح. ركّز أكثر قليلًا على الروتين والتغذية.';

  @override
  String get scoreC => 'هناك مجال للتحسن. الروتين المنتظم سيصنع الفرق.';

  @override
  String get scoreD => 'إمكاناتك عالية لكن عليك أن تبدأ العمل.';

  @override
  String get scoreF => 'ابدأ الآن! خطوة صغيرة كل يوم تصنع فرقًا كبيرًا.';

  @override
  String get cmPerYear => 'cm/سنة';

  @override
  String get howToDoIt => 'طريقة الأداء';

  @override
  String get musclesTargeted => 'العضلات والعظام المستهدفة';

  @override
  String get scientificBasis => 'الأساس العلمي';

  @override
  String setXofY(String current, String total) {
    return 'المجموعة $current من $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'استرح قبل المجموعة $set';
  }

  @override
  String get allSetsComplete => 'أكملت كل المجموعات!';

  @override
  String get setTimer => 'مؤقت المجموعة';

  @override
  String get setTracker => 'عدّاد المجموعات';

  @override
  String get builtInTimer => 'مؤقت مدمج';

  @override
  String get markComplete => 'علّم كمكتمل';

  @override
  String get markIncomplete => 'علّم كغير مكتمل';

  @override
  String get done => 'تم';

  @override
  String get doneExclamation => 'تم!';

  @override
  String get start => 'ابدأ';

  @override
  String get pause => 'إيقاف مؤقت';

  @override
  String get resetTimer => 'إعادة';

  @override
  String get skipRest => 'تخطَّ الراحة';

  @override
  String get restart => 'أعد البدء';

  @override
  String get perSet => 'لكل مجموعة';

  @override
  String get rest => 'راحة';

  @override
  String get reps => 'تكرار';

  @override
  String get difficultyBeginner => 'مبتدئ';

  @override
  String get difficultyIntermediate => 'متوسط';

  @override
  String get difficultyAdvanced => 'متقدم';

  @override
  String get learnTitle => 'تعلّم';

  @override
  String get learnSubtitle => 'معلومات مدعومة علميًا عن النمو';

  @override
  String get categoryAll => 'الكل';

  @override
  String get categoryScience => 'العلم';

  @override
  String get categoryNutrition => 'التغذية';

  @override
  String get categoryExercise => 'التمرين';

  @override
  String get categorySleep => 'النوم';

  @override
  String get categoryMyths => 'خرافات';

  @override
  String get scientificReferences => 'المراجع العلمية';

  @override
  String get relatedRoutines => 'روتين مرتبط';

  @override
  String get nutritionTitle => 'التغذية';

  @override
  String get sectionMealPlan => 'خطة الوجبات';

  @override
  String get sectionNutrients => 'العناصر الغذائية';

  @override
  String get sectionFoods => 'الأطعمة';

  @override
  String get sectionSupplements => 'المكملات';

  @override
  String todaysPlan(String day) {
    return 'خطة اليوم — $day';
  }

  @override
  String get breakfast => 'الفطور';

  @override
  String get lunch => 'الغداء';

  @override
  String get dinner => 'العشاء';

  @override
  String get snacks => 'وجبات خفيفة';

  @override
  String get searchFoods => 'ابحث عن طعام...';

  @override
  String nFoods(String count) {
    return '$count أطعمة';
  }

  @override
  String dailyLabel(String amount) {
    return 'يوميًا: $amount';
  }

  @override
  String get dailyNeedByAge => 'الاحتياج اليومي حسب العمر';

  @override
  String agePrefix(String range) {
    return 'عمر $range';
  }

  @override
  String get topFoodSources => 'أفضل المصادر الغذائية';

  @override
  String get categoryDairy => 'الألبان';

  @override
  String get categoryMeatFish => 'اللحوم والأسماك';

  @override
  String get categoryVegetables => 'الخضار';

  @override
  String get categoryFruits => 'الفواكه';

  @override
  String get categoryGrains => 'الحبوب والبقوليات';

  @override
  String get categoryNutsSeeds => 'المكسرات والبذور';

  @override
  String get weeklyReportTitle => 'التقرير الأسبوعي';

  @override
  String get weeklyScoreLabel => 'نقاط الأسبوع';

  @override
  String get weeklyDailyCompletion => 'يومًا بيوم';

  @override
  String get weeklyHabits => 'العادات';

  @override
  String get overview => 'نظرة عامة';

  @override
  String get routinesLabel => 'الروتين';

  @override
  String get streakLabel => 'السلسلة';

  @override
  String get heightLabel => 'الطول';

  @override
  String get weightLabel => 'الوزن';

  @override
  String get dadLabel => 'الأب';

  @override
  String get motherLabel => 'الأم';

  @override
  String get metricShort => 'متري';

  @override
  String get imperialShort => 'إمبراطوري';

  @override
  String get dailyScores => 'النقاط اليومية';

  @override
  String get waterToday2 => 'ماء اليوم';

  @override
  String get sleepToday => 'نوم اليوم';

  @override
  String get routineCompletion => 'إنجاز الروتين';

  @override
  String get xpAndLevel => 'XP والمستوى';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP للمستوى التالي';
  }

  @override
  String get activeChallenges => 'التحديات النشطة';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m مكتمل';
  }

  @override
  String get shareYourProgress => 'شارك تقدمك';

  @override
  String get shareComingSoon => 'ميزة المشاركة قريبًا!';

  @override
  String get premiumTest => 'Premium (تجربة)';

  @override
  String get premiumActive => 'مفعّل';

  @override
  String get premiumFree => 'مجاني';

  @override
  String get weeklyReportMenu => 'التقرير الأسبوعي';

  @override
  String get weeklyReportMenuSubtitle => 'ملخص تقدمك';

  @override
  String get unlockGrowthPotential => 'افتح كامل إمكانات نموك';

  @override
  String get featureGrowthAnalysis => 'تحليل النمو والنقاط';

  @override
  String get featureHeightPrediction => 'توقع الطول ومستقبله';

  @override
  String get featureAllRoutines => 'كل الـ14 روتينًا يوميًا';

  @override
  String get featureWaterSleep => 'متابعة الماء والنوم';

  @override
  String get featureProgress => 'التقدم والقياسات';

  @override
  String get featureAchievements => 'الإنجازات والسلاسل';

  @override
  String get planMonthly => 'شهري';

  @override
  String get planYearly => 'سنوي';

  @override
  String get bestValue => 'الأوفر';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'مستوى $level';
  }

  @override
  String get levelBeginner => 'مبتدئ';

  @override
  String get levelStarter => 'منطلق';

  @override
  String get levelCommitted => 'ملتزم';

  @override
  String get levelDedicated => 'مخلص';

  @override
  String get levelConsistent => 'مواظب';

  @override
  String get levelFocused => 'مركّز';

  @override
  String get levelDetermined => 'مصمّم';

  @override
  String get levelDisciplined => 'منضبط';

  @override
  String get levelStrong => 'قوي';

  @override
  String get levelAdvanced => 'متقدم';

  @override
  String get levelExpert => 'خبير';

  @override
  String get levelMaster => 'محترف';

  @override
  String get levelElite => 'نخبة';

  @override
  String get levelChampion => 'بطل';

  @override
  String get levelLegend => 'أسطورة';

  @override
  String get levelTitan => 'عملاق';

  @override
  String get levelMythic => 'خارق';

  @override
  String get levelImmortal => 'خالد';

  @override
  String get levelTranscendent => 'متجاوز الحدود';

  @override
  String get levelUltimate => 'القمة';

  @override
  String get challengeCompleteAllRoutines => 'أكمل كل الروتين';

  @override
  String get challengeCompleteAllRoutinesDesc => 'أنهِ كل روتين اليوم';

  @override
  String get challengeHydrationHero => 'بطل الترطيب';

  @override
  String get challengeHydrationHeroDesc => 'حقق هدف الماء اليومي';

  @override
  String get challengeEarlySleeper => 'نوم مبكر';

  @override
  String get challengeEarlySleeperDesc => 'سجّل 8+ ساعات نوم';

  @override
  String get challengeExerciseTrio => 'ثلاثية التمرين';

  @override
  String get challengeExerciseTrioDesc => 'أكمل 3 روتينات تمرين';

  @override
  String get challengeMorningStretch => 'تمدد الصباح';

  @override
  String get challengeMorningStretchDesc => 'تمدد صباحًا قبل الساعة 9';

  @override
  String get challenge7DayWarrior => 'محارب 7 أيام';

  @override
  String get challenge7DayWarriorDesc => 'أكمل كل الروتين 7 أيام متتالية';

  @override
  String get challengeGrowthTracker => 'متابع النمو';

  @override
  String get challengeGrowthTrackerDesc => 'سجّل قياس طول هذا الأسبوع';

  @override
  String get challengeHydrationWeek => 'أسبوع الترطيب';

  @override
  String get challengeHydrationWeekDesc => 'حقق هدف الماء 5 أيام هذا الأسبوع';

  @override
  String get challengeFitnessChampion => 'بطل اللياقة';

  @override
  String get challengeFitnessChampionDesc => 'أكمل 15 روتين تمرين هذا الأسبوع';

  @override
  String get challengeSleepMaster => 'سيد النوم';

  @override
  String get challengeSleepMasterDesc => 'سجّل 8+ ساعات نوم لمدة 5 أيام';

  @override
  String get performanceDashboard => 'لوحة الأداء';

  @override
  String get tierA => 'الفئة A';

  @override
  String get tierB => 'الفئة B';

  @override
  String get tierC => 'الفئة C';

  @override
  String get tierD => 'الفئة D';

  @override
  String get tierE => 'الفئة E';

  @override
  String get maxTierReached => 'وصلت لأعلى فئة';

  @override
  String nextTierHint(String tier, String pts) {
    return 'الفئة التالية: $tier · تحتاج +$pts نقطة';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'إدارة الروتين';

  @override
  String get manageRoutinesSubtitle => 'أظهر أو أخفِ الروتين من قائمتك اليومية';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible من $total نشط';
  }

  @override
  String get showAll => 'أظهر الكل';

  @override
  String get hideAll => 'أخفِ الكل';

  @override
  String get heightAnalysis => 'تحليل الطول';

  @override
  String get heightVsPopulation => 'موقعك على منحنى نمو CDC';

  @override
  String get globalAveragesTable => 'متوسط الطول حسب العمر (CDC)';

  @override
  String get standingTall => 'طويل';

  @override
  String get standingAboveAverage => 'فوق المتوسط';

  @override
  String get standingBelowAverage => 'تحت المتوسط';

  @override
  String get standingShort => 'أقصر من أقرانك';

  @override
  String get yourHeightStanding => 'ترتيب طولك';

  @override
  String get bellCurveCaption => 'كيف يتوزع الطول في عمرك';

  @override
  String get bellShorterThanYou => 'أقصر منك';

  @override
  String get yourHeight => 'أنت';

  @override
  String peerAvg(int age) {
    return 'متوسط عمر $age';
  }

  @override
  String get aboveAvg => 'فوق المتوسط';

  @override
  String get belowAvg => 'تحت المتوسط';

  @override
  String get whoDataSource => 'منحنيات نمو CDC الأمريكية';

  @override
  String get percentileShort5 => 'الـ5';

  @override
  String get percentileShort50 => 'الـ50';

  @override
  String get percentileShort95 => 'الـ95';

  @override
  String get youLabel => 'أنت';

  @override
  String get avgHeightLabel => 'المتوسط';

  @override
  String get percentileLabel => 'المئين';

  @override
  String get diffLabel => 'الفرق';

  @override
  String get whoSourceNote =>
      'مصدر البيانات: منحنيات نمو CDC الأمريكية 2000 (الطول حسب العمر، من 2 إلى 20 سنة). المئين يقارنك بسكان أمريكا وقد يختلف حسب البلد.';

  @override
  String get quickPhotos => 'الصور';

  @override
  String get quickPosture => 'الوقفة';

  @override
  String get quickWellness => 'العافية';

  @override
  String get quickRecipes => 'الوصفات';

  @override
  String get wellnessTitle => 'متابعة العافية';

  @override
  String get wellnessHeader => 'العافية';

  @override
  String get wellnessSubtitle => 'تابع العوامل التي تؤثر على نموك';

  @override
  String get caffeineToday => 'كافيين اليوم';

  @override
  String get withinLimits => 'ضمن الحد الصحي';

  @override
  String get approachingLimit => 'تقترب من الحد';

  @override
  String get overLimit => 'فوق الحد، يؤثر على HGH';

  @override
  String get resetToday => 'صفّر اليوم';

  @override
  String get stressToday => 'توتر اليوم';

  @override
  String get stressVeryCalmLabel => 'هادئ جدًا، مثالي للنمو';

  @override
  String get stressCalmLabel => 'هادئ';

  @override
  String get stressNeutralLabel => 'عادي';

  @override
  String get stressStressedLabel => 'متوتر';

  @override
  String get stressVeryStressedLabel => 'متوتر جدًا، الكورتيزول يعيق HGH';

  @override
  String get stressTapToLog => 'اضغط لتسجّل شعورك اليوم';

  @override
  String get todaysJournal => 'مذكرة اليوم';

  @override
  String get journalNoNote => '(بلا ملاحظة)';

  @override
  String get journalEdit => 'تعديل';

  @override
  String get journalHowWasToday => 'كيف كان يومك؟';

  @override
  String get journalSaved => 'تم حفظ المذكرة · +5 XP';

  @override
  String get journalSaveEntry => 'احفظ المذكرة';

  @override
  String get weeklyInsight => 'ملاحظة الأسبوع';

  @override
  String get weeklyInsightCaffeine => 'الكافيين';

  @override
  String get weeklyInsightStress => 'التوتر';

  @override
  String get weeklyInsightMood => 'المزاج';

  @override
  String get wellnessInfoTitle => 'لماذا تهم العافية';

  @override
  String get wellnessInfoBody =>
      'الكافيين يؤثر على النوم العميق، وهو الوقت الذي يُفرز فيه معظم هرمون النمو (HGH). التوتر المزمن يرفع الكورتيزول، الذي يثبّط HGH مباشرة. والمذكرات تساعدك على الالتزام بالعادات التي تدعم النمو.';

  @override
  String get wellnessInfoGotIt => 'فهمت';

  @override
  String get insightCaffeineHigh =>
      'الكافيين عندك مرتفع هذا الأسبوع. خفّفه لنوم أفضل وHGH أعلى.';

  @override
  String get insightStressHigh =>
      'التوتر مرتفع هذا الأسبوع. جرّب تمارين التنفس: الكورتيزول يعيق النمو.';

  @override
  String get insightMoodLow =>
      'مزاجك منخفض مؤخرًا. الشمس والنوم والتمرين الخفيف كلها تساعد.';

  @override
  String get insightGreat =>
      'توازن رائع هذا الأسبوع. عافيتك تدعم نموًا مثاليًا.';

  @override
  String get insightDefault =>
      'عافيتك على المسار الصحيح. استمر بالتسجيل لملاحظات أعمق.';

  @override
  String get insightNeedMoreData => 'سجّل بضعة أيام أخرى لترى الملاحظات.';

  @override
  String get progressPhotosTitle => 'صور التقدم';

  @override
  String get progressPhotosHeader => 'صور التقدم';

  @override
  String get progressPhotosSubtitle => 'تابع رحلتك بالصور';

  @override
  String get addProgressPhoto => 'أضف صورة تقدم';

  @override
  String get captureJourney => 'وثّق رحلتك بالصور';

  @override
  String get takePhoto => 'التقط صورة';

  @override
  String get chooseFromLibrary => 'اختر من المعرض';

  @override
  String get deletePhotoTitle => 'حذف الصورة؟';

  @override
  String get deletePhotoBody => 'ستُحذف هذه الصورة من سجل تقدمك.';

  @override
  String get timelineTab => 'الخط الزمني';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'صورة',
      many: 'صورة',
      few: 'صور',
      two: 'صورتان',
      one: 'صورة',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$cm $unit خلال $days يوم';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'يوم',
      many: 'يومًا',
      few: 'أيام',
      two: 'يومان',
      one: 'يوم',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '$unit مكتسبة';
  }

  @override
  String get firstPhotoMessage => 'التقط أول صورة لتبدأ متابعة تقدمك بالصور.';

  @override
  String get takeFirstPhoto => 'التقط أول صورة';

  @override
  String get beforeAfter => 'قبل / بعد';

  @override
  String get beforeLabel => 'قبل';

  @override
  String get afterLabel => 'بعد';

  @override
  String get yourHeightDialog => 'طولك';

  @override
  String get heightDialogMessage => 'أدخل طولك الحالي لهذه الصورة';

  @override
  String get postureAnalysisTitle => 'تحليل الوقفة';

  @override
  String get postureCoachHeader => 'مدرب الوقفة';

  @override
  String get postureCoachSubtitle => 'افحص نفسك بصورة جانبية';

  @override
  String get latestScore => 'آخر نتيجة';

  @override
  String get latestAnalysis => 'آخر تحليل';

  @override
  String get headPosition => 'وضعية الرأس';

  @override
  String get progressLabel => 'التقدم';

  @override
  String get choosePhotoSource => 'اختر مصدر الصورة';

  @override
  String get sideProfileHint => 'من الجانب، والجسم كاملًا في الإطار';

  @override
  String get howToTakePhoto => 'كيف تلتقط الصورة';

  @override
  String get takePosturePhoto => 'التقط صورة الوقفة';

  @override
  String get postureExcellent => 'ممتازة';

  @override
  String get postureGood => 'جيدة';

  @override
  String get postureNeedsWork => 'تحتاج تحسين';

  @override
  String get posturePoor => 'ضعيفة';

  @override
  String get recommendedExercises => 'تمارين مقترحة';

  @override
  String get postureWallStand => 'الوقوف على الحائط';

  @override
  String get postureWallStandDesc => 'قف وظهرك على الحائط دقيقتين يوميًا.';

  @override
  String get postureChestOpener => 'فتح الصدر';

  @override
  String get postureChestOpenerDesc =>
      'يفتح عضلات الصدر المشدودة التي تسحب الكتفين للأمام.';

  @override
  String get postureChinTucks => 'سحب الذقن';

  @override
  String get postureChinTucksDesc => 'يعالج تقدّم الرأس للأمام — 3×10 تكرار.';

  @override
  String get postureDeadbug => 'الحشرة الميتة';

  @override
  String get postureDeadbugDesc =>
      'يقوّي عضلات الجذع العميقة للتحكم في تقوّس أسفل الظهر.';

  @override
  String get recipesTitle => 'الوصفات';

  @override
  String get recipesHeader => 'الوصفات';

  @override
  String get recipesSubtitle => 'غذِّ نموك';

  @override
  String get recipesCategoryAll => 'الكل';

  @override
  String get recipesCategoryBreakfast => 'فطور';

  @override
  String get recipesCategoryLunch => 'غداء';

  @override
  String get recipesCategoryDinner => 'عشاء';

  @override
  String get recipesCategorySnack => 'سناك';

  @override
  String get recipesGoalAll => 'الكل';

  @override
  String get recipeDiffEasy => 'سهلة';

  @override
  String get recipeDiffMedium => 'متوسطة';

  @override
  String get recipeDiffHard => 'صعبة';

  @override
  String get recipesFilterType => 'النوع';

  @override
  String get recipesFilterNutrient => 'غنية بـ';

  @override
  String get recipesGoalVitaminD => 'فيتامين D';

  @override
  String get recipesGoalZinc => 'الزنك';

  @override
  String get recipesGoalMagnesium => 'المغنيسيوم';

  @override
  String recipesCountLabel(int count) {
    return '$count وصفات';
  }

  @override
  String get recipeIngredients => 'المكونات';

  @override
  String get recipeSteps => 'الطريقة';

  @override
  String get recipesGoalProtein => 'بروتين عالٍ';

  @override
  String get recipesGoalCalcium => 'الكالسيوم';

  @override
  String get recipesGoalOmega3 => 'أوميغا-3';

  @override
  String get recipesGoalIron => 'الحديد';

  @override
  String get recipesNoMatch => 'لا توجد وصفات تطابق هذه الفلاتر';

  @override
  String get recipesIngredients => 'المكونات';

  @override
  String get recipesInstructions => 'طريقة التحضير';

  @override
  String get recipesClose => 'إغلاق';

  @override
  String get recipesAboutTitle => 'عن الوصفات';

  @override
  String get recipesAboutBody =>
      'وصفات مختارة لتغذية نموك. فلتر حسب نوع الوجبة أو الهدف الغذائي لتجد ما يناسب خطتك.';

  @override
  String get animHintSpinalDecomp => 'تخفيف ضغط العمود الفقري';

  @override
  String get animHintGravityReversal => 'عكس الجاذبية';

  @override
  String get animHintImpactBones => 'تحميل الصدمات للعظام';

  @override
  String get animHintHighImpact => 'تحميل عالي الصدمة للعظام';

  @override
  String get animHintMetabolicBurst => 'تمرين دفعات الأيض';

  @override
  String get animHintFullBodyStretch => 'تمدد إيقاظ الجسم كله';

  @override
  String get animHintSpinalExtension => 'بسط العمود الفقري';

  @override
  String get animHintCervicalDecomp => 'تخفيف ضغط الرقبة';

  @override
  String get animHintShoulderMobility => 'مرونة الكتفين';

  @override
  String get animHintFullBodyMotion => 'حركة الجسم كله';

  @override
  String get animHintPosteriorChain => 'تمدد السلسلة الخلفية';

  @override
  String get animHintMuscleGrowth => 'وقود نمو العضلات';

  @override
  String get animHintBoneDensity => 'دعم كثافة العظام';

  @override
  String get animHintSpinalDisc => 'ترطيب الأقراص الفقرية';

  @override
  String get animHintCleanNutrition => 'تغذية نظيفة';

  @override
  String get animHintIgf1 => 'تحسين IGF-1';

  @override
  String get animHintHghAmino => 'حمض أميني محفّز لـ HGH';

  @override
  String get animHintCalciumAbsorption => 'امتصاص الكالسيوم';

  @override
  String get animHintSpinalAlignment => 'استقامة العمود الفقري';

  @override
  String get animHintPostureCorrection => 'تصحيح الوقفة';

  @override
  String get animHintMindBody => 'توازن العقل والجسم';

  @override
  String get animHintCoreStability => 'ثبات الجذع';

  @override
  String get animHintLegPower => 'قوة الساقين ودفعة HGH';

  @override
  String get animHintVerticalPower => 'قوة القفز العمودي';

  @override
  String get animHintHghSurge => 'تمرين دفعة HGH';

  @override
  String get animHintPeakHgh => 'نافذة ذروة إفراز HGH';

  @override
  String get animHintMelatonin => 'تحسين الميلاتونين';

  @override
  String get animHintDeepSleep => 'تهيئة النوم العميق';

  @override
  String get animHintSleepOpt => 'تحسين النوم';

  @override
  String get animHintExercise => 'تمرين';

  @override
  String get formMorningStretch =>
      'ابدأ بتدوير الرقبة، ثم انتقل لتمدد الجسم كله. اثبت في كل تمدد 20-30 ثانية بدون ارتداد.';

  @override
  String get formBarHanging =>
      'امسك العقلة بعرض الكتفين، أرخِ جسمك تمامًا، ودع الجاذبية تمدّ عمودك الفقري. تجنّب التأرجح.';

  @override
  String get formCobraStretch =>
      'استلقِ على بطنك، ضع يديك تحت كتفيك، وادفع الجزء العلوي ببطء مع إبقاء الوركين على الأرض. انظر للأعلى.';

  @override
  String get formJumping =>
      'نفّذ قفز القرفصاء أو نط الحبل. انزل بلطف على مقدمة قدميك. استرح 30 ثانية بين المجموعات.';

  @override
  String get formSwimmingBasketball =>
      'اختر السباحة (الحرة/الظهر) أو كرة السلة. ركّز على القفز والمدّ والحركة الكاملة.';

  @override
  String get formEveningYoga =>
      'نفّذ وضعيات هادئة: القطة والبقرة، وضعية الطفل، الكلب المتجه للأسفل، الانحناء للأمام. تنفّس بعمق واثبت 30-60 ثانية في كل وضعية.';

  @override
  String get formSprintIntervals =>
      'سخّن 5 دقائق، ثم اركض بأقصى جهد 30 ثانية. امشِ أو هرول 90 ثانية للتعافي. كرّر.';

  @override
  String get formHiitWorkout =>
      'نفّذ تمارين مثل البيربي ومتسلق الجبل وقفز القرفصاء بأقصى شدة 45 ثانية، واسترح 15 ثانية.';

  @override
  String get formSquats =>
      'قف وقدماك بعرض الكتفين. انزل حتى يصبح فخذاك موازيين للأرض. أبقِ ظهرك مستقيمًا وركبتيك خلف أصابع قدميك.';

  @override
  String get formDeadliftStretch =>
      'قف وقدماك بعرض الوركين، وانحنِ من الوركين مع إبقاء ظهرك مستويًا. مدّ يديك نحو أصابع قدميك واشعر بالتمدد في أوتار الركبة والظهر.';

  @override
  String get formOverheadPress =>
      'قف مستقيمًا، وادفع ذراعيك فوق رأسك حتى تمتدا بالكامل. استخدم أوزانًا خفيفة أو وزن جسمك. شدّ جذعك وتجنّب تقويس ظهرك.';

  @override
  String get formSkippingRope =>
      'اقفز بالقدمين معًا، وانزل بلطف على مقدمة قدميك. اجعل القفزات منخفضة ومنتظمة. استرح بين المجموعات.';

  @override
  String get formPilatesCore =>
      'نفّذ البلانك، الحشرة الميتة، الطائر والكلب، الجسر، ورفع الساقين. ركّز على الحركة المتحكَّم بها والتنفس.';

  @override
  String get formInversionHang =>
      'استخدم طاولة الانقلاب أو أحذية الجاذبية. ابدأ بميل خفيف وزِده تدريجيًا. اجعل الجلسات قصيرة.';

  @override
  String get formProtein =>
      'وزّع البروتين على 3-4 وجبات. أضف البيض والدجاج والسمك والألبان والبقوليات.';

  @override
  String get formCalciumVitaminD =>
      'تناول 3 حصص من الألبان يوميًا وتعرّض للشمس 15 دقيقة لتكوين فيتامين D طبيعيًا.';

  @override
  String get formWater =>
      'اشرب الماء بانتظام طوال اليوم. احمل قارورة ماء واضبط تذكيرًا كل ساعة.';

  @override
  String get formAvoidJunk =>
      'استبدل الوجبات السريعة بأطعمة كاملة. بدّل المشروبات السكرية بالماء. اقرأ الملصقات وتجنّب المكونات المصنّعة.';

  @override
  String get formZincIntake =>
      'أضف اللحم الأحمر وبذور اليقطين والحمص والكاجو والمحار لنظامك. استهدف 8-11mg يوميًا.';

  @override
  String get formVitaminDSunlight =>
      'عرّض ذراعيك ووجهك للشمس المباشرة 15 دقيقة، ويُفضّل قبل الظهر. لا حاجة لواقي الشمس في هذه المدة.';

  @override
  String get formArginineFoods =>
      'أضف المكسرات والبذور والديك الرومي والدجاج وفول الصويا والألبان لوجباتك. الأفضل تناولها قبل النوم.';

  @override
  String get formDailyCalories =>
      'وزّع سعراتك على 3-5 وجبات ولا تتخطَّ الفطور. قدّم الأطعمة الكاملة على السعرات الفارغة.';

  @override
  String get formQualitySleep =>
      'نم قبل الساعة 10 مساءً. اجعل الغرفة مظلمة وباردة. تجنّب الكافيين بعد 2 ظهرًا.';

  @override
  String get formNoScreen =>
      'اضبط منبّهًا قبل النوم بساعة. أبعد كل الشاشات. اقرأ كتابًا أو تمدد بلطف بدلًا منها.';

  @override
  String get formSleepEnvironment =>
      'استخدم ستائر معتمة، واجعل حرارة الغرفة 18-20°C، وأزل كل مصادر الضوء. استخدم فرشة ووسادة مريحتين.';

  @override
  String get formPreSleepRoutine =>
      'ابدأ قبل النوم بـ30 دقيقة: خفّف الإضاءة، اقرأ كتابًا، مارس تمارين التنفس، وتجنّب الأنشطة المنبّهة.';

  @override
  String get formPostureCheck =>
      'قف مستقيمًا والكتفان للخلف وللأسفل. شدّ جذعك قليلًا. تخيّل خيطًا يسحبك للأعلى من قمة رأسك.';

  @override
  String get formWallStand =>
      'قف والكعبان والمؤخرة ولوحا الكتف والرأس تلمس الحائط. اثبت 5 دقائق. تنفّس بشكل طبيعي.';

  @override
  String get formNeckStretches =>
      'أمِل رأسك ببطء لكل جانب وللأمام وللخلف. اثبت 30 ثانية في كل اتجاه. لا تضغط على التمدد.';

  @override
  String get formShoulderRolls =>
      'دوّر كتفيك للأمام 15 مرة، ثم للخلف 15 مرة. بعدها تمددات فتح الصدر مع الثبات 20 ثانية.';

  @override
  String get sciMorningStretch =>
      'تمدد الصباح يخفف الضغط عن الأقراص الفقرية التي امتلأت بالسوائل ليلًا، فيحافظ على أكبر قدر من طولك';

  @override
  String get sciBarHanging =>
      'التعلق يخفف ضغط الأقراص الفقرية باستخدام الجاذبية لتمديد العمود الفقري، وقد يضيف طولًا مؤقتًا';

  @override
  String get sciCobraStretch =>
      'تمدد الكوبرا يبسط العمود الفقري ويفتح الصدر، فيعاكس ضغط الجلوس على الظهر';

  @override
  String get sciJumping =>
      'القفز عالي الصدمة ينشّط صفائح النمو في الساقين ويحفّز إفراز هرمون النمو';

  @override
  String get sciSwimmingBasketball =>
      'السباحة وكرة السلة تتضمن تمددًا للجسم كله وقفزًا ومدًّا ينشّط صفائح النمو';

  @override
  String get sciEveningYoga =>
      'يوغا المساء تخفض الكورتيزول الذي يثبّط هرمون النمو، وتمدد العضلات للتعافي ليلًا';

  @override
  String get sciSprintIntervals =>
      'الركض السريع يحفّز إفرازًا كبيرًا لهرمون النمو';

  @override
  String get sciHiitWorkout => 'التمرين عالي الشدة يرفع HGH بنسبة تصل إلى 450%';

  @override
  String get sciSquats =>
      'القرفصاء تنشّط صفائح النمو في الساقين والعمود الفقري';

  @override
  String get sciDeadliftStretch =>
      'تخفيف ضغط العمود الفقري يدعم صحة الأقراص الفقرية';

  @override
  String get sciOverheadPress =>
      'الضغط فوق الرأس يمدد العمود الفقري ويقوّي عضلات الوقفة';

  @override
  String get sciSkippingRope =>
      'القفز المتكرر ينشّط صفائح النمو في الأطراف السفلية';

  @override
  String get sciPilatesCore => 'قوة الجذع تدعم استقامة العمود الفقري والوقفة';

  @override
  String get sciInversionHang =>
      'التعلق المقلوب يخفف ضغط الأقراص الفقرية، وقد يضيف 1-2cm مؤقتًا';

  @override
  String get sciProtein =>
      'البروتين يوفّر الأحماض الأمينية الضرورية لنمو العظام والعضلات، خاصة في طفرات النمو';

  @override
  String get sciCalciumVitaminD =>
      'الكالسيوم وفيتامين D هما حجر الأساس لكثافة العظام ونموها الطولي';

  @override
  String get sciWater =>
      'الترطيب ضروري لنقل العناصر الغذائية إلى صفائح النمو ولصحة غضاريف المفاصل';

  @override
  String get sciAvoidJunk =>
      'الأطعمة المصنّعة والسكر تسبب التهابات وارتفاعات في الإنسولين تثبّط إفراز هرمون النمو';

  @override
  String get sciZincIntake => 'الزنك ضروري لإنتاج هرمون النمو';

  @override
  String get sciVitaminDSunlight =>
      'فيتامين D أساسي لامتصاص الكالسيوم ونمو العظام';

  @override
  String get sciArginineFoods => 'الأرجينين يحفّز إفراز هرمون النمو';

  @override
  String get sciDailyCalories =>
      'نقص السعرات المستمر يخفض IGF-1 ويضعف نبضات هرمون النمو، فيبطّئ النمو الطولي مباشرة في المراهقة';

  @override
  String get sciQualitySleep =>
      '70-80% من هرمون النمو اليومي يُفرز في مراحل النوم العميق، خاصة بين 10 مساءً و2 فجرًا';

  @override
  String get sciNoScreen =>
      'الضوء الأزرق من الشاشات يثبّط الميلاتونين، فيؤخر النوم ويقلل جودة النوم العميق';

  @override
  String get sciSleepEnvironment =>
      'المكان المظلم والبارد يرفع الميلاتونين وهرمون النمو لأقصى حد';

  @override
  String get sciPreSleepRoutine =>
      'روتين ثابت قبل النوم يحسّن جودة النوم العميق بنسبة 23%';

  @override
  String get sciPostureCheck =>
      'الوقفة الصحيحة قد تضيف 2-3 cm فورًا للطول الظاهر وتمنع ضغط العمود الفقري';

  @override
  String get sciWallStand =>
      'الوقوف على الحائط يدرّب ذاكرة عضلات الوقفة، فيساعدك على استقامة الظهر طوال اليوم';

  @override
  String get sciNeckStretches =>
      'تمدد الرقبة يخفف الضغط ويحسّن استقامة الفقرات العنقية';

  @override
  String get sciShoulderRolls =>
      'فتح الكتفين يصحح الانحناء للأمام، وقد يضيف 1-2cm في المظهر';

  @override
  String get muscleSpine => 'العمود الفقري';

  @override
  String get muscleLegs => 'الساقان';

  @override
  String get muscleBack => 'الظهر';

  @override
  String get muscleShoulders => 'الكتفان';

  @override
  String get muscleArms => 'الذراعان';

  @override
  String get muscleCore => 'الجذع';

  @override
  String get muscleChest => 'الصدر';

  @override
  String get muscleCalves => 'السمّانة';

  @override
  String get muscleFullBody => 'الجسم كله';

  @override
  String get muscleHips => 'الوركان';

  @override
  String get muscleBones => 'العظام';

  @override
  String get muscleMuscles => 'العضلات';

  @override
  String get muscleNeck => 'الرقبة';

  @override
  String get muscleUpperSpine => 'أعلى العمود الفقري';

  @override
  String get muscleUpperBack => 'أعلى الظهر';

  @override
  String get createRoutine => 'أنشئ روتينًا';

  @override
  String get createRoutineTitle => 'أنشئ روتينًا خاصًا';

  @override
  String get createRoutineSubtitle => 'اصنع روتينك اليومي بنفسك';

  @override
  String get routineIcon => 'الأيقونة';

  @override
  String get routineTitleField => 'العنوان';

  @override
  String get routineDescField => 'الوصف';

  @override
  String get routineDescHint => 'ملخص قصير للروتين';

  @override
  String get routineCategoryField => 'الفئة';

  @override
  String get routineDifficultyField => 'الصعوبة';

  @override
  String get routineDurationField => 'المدة';

  @override
  String get routineSetsRepsField => 'المجموعات x التكرار';

  @override
  String get routineFormField => 'الأداء والتعليمات';

  @override
  String get routineFormHint => 'اختياري: كيف تؤدي هذا الروتين';

  @override
  String get diffBeginner => 'مبتدئ';

  @override
  String get diffIntermediate => 'متوسط';

  @override
  String get diffAdvanced => 'متقدم';

  @override
  String get catExercise => 'تمرين';

  @override
  String get catNutrition => 'تغذية';

  @override
  String get catSleep => 'نوم';

  @override
  String get catPosture => 'وقفة';

  @override
  String get postureTip1 => 'قف بجانبك (من الجانب) للكاميرا.';

  @override
  String get postureTip2 => 'ابتعد عن العدسة حوالي مترين.';

  @override
  String get postureTip3 => 'ذراعاك مرتخيتان، وانظر للأمام مباشرة.';

  @override
  String get postureTip4 => 'البس ملابس ضيقة قليلًا لتقييم أدق.';

  @override
  String get postureTip5 => 'استخدم إضاءة جيدة وخلفية سادة.';

  @override
  String get kyphosisLabel => 'الحدب (أعلى الظهر)';

  @override
  String get lordosisLabel => 'التقعّر (أسفل الظهر)';

  @override
  String get analyzingPosture => 'نحلل الوقفة';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String version(String ver) {
    return 'الإصدار $ver';
  }

  @override
  String get rateApp => 'قيّم BeTaller';

  @override
  String get rateAppSubtitle => 'تقييمك يساعدنا نكبر!';

  @override
  String get unitSystem => 'نظام الوحدات';

  @override
  String get unitMetric => 'متري (cm, kg)';

  @override
  String get unitImperial => 'إمبراطوري (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'تنويه صحي';

  @override
  String get healthDisclaimerBody =>
      'يقدّم BeTaller إرشادات عامة للعافية واللياقة. النتائج تختلف حسب العمر والوراثة والعوامل الفردية. هذا التطبيق لا يقدّم نصائح طبية. تركّز التمارين على تحسين الوقفة وصحة العمود الفقري ودعم هرمون النمو عبر عادات طبيعية. استشر مختصًا صحيًا قبل البدء بأي برنامج تمارين أو تغذية جديد. تغيّرات الطول بعد انغلاق صفائح النمو (عادة بين 18 و25) تأتي أساسًا من تحسّن الوقفة.';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'تناول ${grams}g بروتين على الأقل اليوم، محسوبة من وزنك.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'اشرب ${liters}L ماء على الأقل اليوم، محسوبة من وزنك.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'استهدف حوالي $kcal kcal اليوم لتغذية نموك.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'احصل على $iu IU من فيتامين D اليوم، من الشمس أو الطعام أو مكمّل.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'احصل على ${mg}mg زنك اليوم لدعم إنتاج هرمون النمو.';
  }

  @override
  String get nutritionSupplementsTitle => 'المكملات';

  @override
  String get nutritionSupplementsDisclaimer =>
      'دعم اختياري، وليس بديلًا عن الطعام. استشر طبيبًا قبل البدء بأي مكمّل، خاصة إذا كان عمرك أقل من 18.';

  @override
  String get supplementVitaminDName => 'فيتامين D3';

  @override
  String get supplementVitaminDDose => '3,000 IU';

  @override
  String get supplementVitaminDBenefit =>
      'يعزز امتصاص الكالسيوم لكثافة العظام وصحة صفائح النمو';

  @override
  String get supplementZincName => 'الزنك';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit => 'معدن أساسي لإنتاج هرمون النمو';

  @override
  String get supplementMagnesiumName => 'المغنيسيوم';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit =>
      'يدعم مرحلة النوم العميق التي يُفرز فيها معظم هرمون النمو';

  @override
  String get supplementCalciumName => 'الكالسيوم';

  @override
  String get supplementCalciumDose => '1,000-1,300mg';

  @override
  String get supplementCalciumBenefit =>
      'حجر الأساس لكثافة العظام وصفائح النمو';

  @override
  String get supplementOmega3Name => 'أوميغا-3';

  @override
  String get supplementOmega3Dose => '1,000mg';

  @override
  String get supplementOmega3Benefit =>
      'يقلل الالتهاب ويدعم عمل صفائح النمو بشكل صحي';

  @override
  String get supplementCollagenName => 'كولاجين + فيتامين C';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit =>
      'فيتامين C يساعد جسمك على استخدام الكولاجين لبناء الغضروف ونسيج العظم';

  @override
  String get sciSourcePrefix => 'المصدر: ';

  @override
  String get program => 'البرنامج';

  @override
  String get todaysExercises => 'تمارين اليوم';

  @override
  String get dailyNutritionPlan => 'خطة التغذية اليومية';

  @override
  String get nutritionGoalsComplete => '🎉 أكملت كل أهداف التغذية!';

  @override
  String get nutritionGoalsIncomplete => 'أكمل أهداف التغذية لنمو مثالي';

  @override
  String get postureDetectingAlignment => 'نكشف استقامة العمود الفقري...';

  @override
  String get testimonial1 =>
      'ما كان عندي أمل بسبب عمري، لكني طلت مع BeTaller. ثقتي بنفسي ما كانت بهذا الارتفاع من قبل.';

  @override
  String get testimonialDuration1 => '4 أشهر';

  @override
  String get testimonial2 =>
      'الكل قال «ما راح تطول بعد الآن». استخدمت BeTaller وفاجأت الجميع.';

  @override
  String get testimonialDuration2 => '3 أشهر';

  @override
  String get testimonial3 =>
      'بعد ما بدأت الروتين، طلت وتحسّنت وقفتي. الكل لاحظ الفرق.';

  @override
  String get testimonialDuration3 => '6 أشهر';

  @override
  String get testimonial4 =>
      'ما زلت في مرحلة النمو وتأثير BeTaller مذهل. أحس إني أطول وأقوى.';

  @override
  String get testimonialDuration4 => '3 أشهر';

  @override
  String get testimonial5 =>
      'لو قلت إني ما جربت BeTaller لكنت أكذب. لاحظت فرقًا حقيقيًا بسرعة، أنصح فيه بقوة.';

  @override
  String get testimonialDuration5 => '4 أشهر';

  @override
  String get designedForYou => 'مصمَّم لك';

  @override
  String get designedForYouDesc =>
      'صُمّم BeTaller خصيصًا لتصل إلى حدك الوراثي، بل وتتجاوزه. كل ميزة، من أجلك.';

  @override
  String get greetingAllDone => 'عمل رائع! 🎯';

  @override
  String get greetingAllDoneSub => 'أكملت مهام اليوم.';

  @override
  String greetingStreak30(int streak) {
    return 'سلسلة $streak يوم. مستوى أسطوري.';
  }

  @override
  String greetingStreak7(int streak) {
    return 'سلسلة $streak يوم. استمر.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak أيام متتالية. أغلب الناس يستسلمون. أنت لا.';
  }

  @override
  String get greetingMorning => 'صباح الخير. يوم جديد، فرصة جديدة.';

  @override
  String get greetingAfternoon => 'اليوم يوم رائع لتبدأ سلسلتك.';

  @override
  String get greetingEvening => 'أكمل مهامك، وابدأ سلسلتك.';

  @override
  String get todayCompleted => 'اكتمل اليوم ✓';

  @override
  String get todayGoals => 'أهداف اليوم';

  @override
  String get challengesLabel => 'التحديات';

  @override
  String get dailyChallengesLabel => 'التحديات اليومية';

  @override
  String get expiresTonight => 'تنتهي الليلة';

  @override
  String get allChallengesCompleted => 'اكتملت كلها ✓';

  @override
  String get challengesLoading => 'تحديات جديدة قريبًا.';

  @override
  String get challengesLoadingTitle => 'التحديات اليومية';

  @override
  String get behindPace => 'متأخر عن الوتيرة';

  @override
  String get growthTracking => 'متابعة النمو';

  @override
  String get growthEmptyFirst => 'سجّل أول طول لتبدأ المتابعة.';

  @override
  String get growthEmptySecond => 'سجّل قياسك الثاني لترى الرسم.';

  @override
  String get growthSectionLabel => 'النمو';

  @override
  String get generalPerformance => 'الأداء العام';

  @override
  String get analysisBalance => 'توازنك';

  @override
  String get analysisWeakest => 'نقطة ضعفك';

  @override
  String get analysisPrediction => 'توقع الطول';

  @override
  String get analysisComparison => 'المقارنة';

  @override
  String get analysisGrowth => 'حالة النمو';

  @override
  String get analysisWeakestHint => 'هنا أسرع طريق لرفع نقاطك.';

  @override
  String get exploreLabel => 'استكشف';

  @override
  String get explorePosture => 'تحليل الوقفة';

  @override
  String get explorePostureSub => 'تحليل الوقفة ونصائح التصحيح';

  @override
  String get explorePhotos => 'صور التقدم';

  @override
  String get explorePhotosSub => 'تابع تحوّلك بالصور';

  @override
  String get exploreNutrition => 'التغذية';

  @override
  String get exploreNutritionSub => 'دليل البروتين والكالسيوم والفيتامينات';

  @override
  String get exploreHealth => 'متابعة الصحة';

  @override
  String get exploreHealthSub => 'متابعة التوتر والكافيين والعافية';

  @override
  String get exploreRecipes => 'وصفات النمو';

  @override
  String get exploreRecipesSub => 'وصفات تدعم النمو';

  @override
  String get educationLabel => 'التعليم';

  @override
  String get educationTitle => 'علم\nزيادة الطول';

  @override
  String get educationSubtitle => 'محتوى خبراء وأبحاث وأدلة';

  @override
  String get aiAnalysisLabel => 'تحليل النمو';

  @override
  String get peerCompareLabel => 'قارن مع أقرانك';

  @override
  String peerCompareText(int topPct) {
    return 'أنت ضمن أعلى $topPct% من أقرانك';
  }

  @override
  String get notifWaterTitle => '💧 لا تنسَ شرب الماء!';

  @override
  String get notifWaterBody => 'هل وصلت لهدف الماء اليوم؟ اشرب كوبًا آخر!';

  @override
  String get notifMorningTitle => '🌅 صباح الخير! وقت التمرين';

  @override
  String get notifMorningBody =>
      'سوِّ تمدد الصباح! 10 دقائق لتمدد الظهر والساقين.';

  @override
  String get notifRoutineTitle => '🔥 أكمل روتينك!';

  @override
  String get notifRoutineBody =>
      'راجع روتينك قبل نهاية اليوم. السلسلة = انضباط!';

  @override
  String get notifProteinTitle => '🥚 يوم البروتين!';

  @override
  String get notifProteinBody =>
      'ابدأ الأسبوع بقوة! تناول بروتينًا في كل وجبة.';

  @override
  String get notifNewWeekTitle => '✨ أسبوع جديد، أهداف جديدة!';

  @override
  String get notifNewWeekBody =>
      'لا تتخطَّ الروتين هذا الأسبوع. خطوات صغيرة، فروق كبيرة!';

  @override
  String get notifSleepTitle => '😴 وقت النوم!';

  @override
  String get notifSleepBody =>
      'هرمون النمو يبلغ ذروته بين 10 مساءً و2 فجرًا. اترك جوالك!';

  @override
  String get notifPostureTitle => '🧍 فحص الوقفة!';

  @override
  String get notifPostureBody =>
      'ظهر مستقيم، كتفان للخلف. الوقفة الصحيحة = فرق 2-3 cm!';

  @override
  String get notifVitaminDTitle => '☀️ وقت فيتامين D!';

  @override
  String get notifVitaminDBody =>
      'تعرّض للشمس 15 دقيقة! فيتامين D يعزز امتصاص الكالسيوم.';

  @override
  String get notifMidweekTitle => '✨ وصلت لنصف الطريق!';

  @override
  String get notifMidweekBody =>
      'مراجعة منتصف الأسبوع. النمو يحتاج صبرًا، لكن الاستمرار يفوز!';

  @override
  String get notifScreenTitle => '📵 أطفئ الشاشات!';

  @override
  String get notifScreenBody =>
      'بلا شاشات قبل النوم بساعة. الضوء الأزرق يعيق الميلاتونين!';

  @override
  String get notifJumpTitle => '🦘 وقت القفز!';

  @override
  String get notifJumpBody =>
      'تمارين القفز تنشّط صفائح النمو. جرّب 3 x 20 تكرار!';

  @override
  String get notifCalciumTitle => '🥛 وقت الكالسيوم!';

  @override
  String get notifCalciumBody => 'كوب حليب أو زبادي. الكالسيوم أساسي للعظام!';

  @override
  String get notifPostureCheckTitle => '🧍 فحص الوقفة!';

  @override
  String get notifPostureCheckBody =>
      'لا تحنِ رقبتك على الجوال! اجلس وامشِ مستقيمًا.';

  @override
  String get notifWeekendTitle => '✨ حماس نهاية الأسبوع';

  @override
  String get notifWeekendBody =>
      'لا تتخطَّ الروتين في الإجازة! الانضباط كل يوم.';

  @override
  String get notifWeeklyProgressTitle => '📊 التقدم الأسبوعي';

  @override
  String get notifWeeklyProgressBody => 'كيف كان أسبوعك؟ شوف رسم نموك!';

  @override
  String get notifMeasureTitle => '📏 القياس الأسبوعي!';

  @override
  String get notifMeasureBody => 'قِس طولك وسجّله! قياس الصباح هو الأدق.';

  @override
  String get notifEarlySleepTitle => '😴 نم مبكرًا!';

  @override
  String get notifEarlySleepBody => 'بكرة بداية الأسبوع! ابدأه بقوة بنوم جيد.';

  @override
  String get notifStreak3Title => '🔥 سلسلة 3 أيام!';

  @override
  String get notifStreak3Body => 'بداية رائعة! 3 أيام متتالية. استمر حتى 7!';

  @override
  String get notifStreak7Title => '🏆 سلسلة أسبوع!';

  @override
  String get notifStreak7Body => 'مذهل! 7 أيام متتالية من الروتين المكتمل!';

  @override
  String get notifStreak14Title => '⭐ سلسلة أسبوعين!';

  @override
  String get notifStreak14Body => '14 يومًا من الانضباط! جسمك بدأ يتغير.';

  @override
  String get notifStreak30Title => '👑 سلسلة شهر!';

  @override
  String get notifStreak30Body => '30 يومًا! أنت بطل!';

  @override
  String get notifStreak60Title => '🌟 سلسلة 60 يومًا!';

  @override
  String get notifStreak60Body => '60 يومًا! إنجاز مذهل.';

  @override
  String get notifStreak100Title => '💎 100 يوم! أسطوري!';

  @override
  String get notifStreak100Body => '100 يوم متتالية! أصبحت أسطورة.';

  @override
  String get notifStreakRiskTitle => '⚠️ لا تخسر سلسلتك!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'سلسلة $streak يوم في خطر! أكمل روتينك.';
  }

  @override
  String get paywallStat1 => 'cm — إمكاناتك مقفلة';

  @override
  String get paywallTitle1 => 'كم cm\nممكن تطول؟';

  @override
  String get paywallBullet1a => 'حسبنا سقفك الوراثي، تبي تشوفه؟';

  @override
  String get paywallBullet1b => 'كيف يؤثر نمط حياتك على نموك؟';

  @override
  String get paywallBullet1c => 'خريطتك المخصصة بانتظارك';

  @override
  String get paywallStat2 => 'روتينك المخصص جاهز';

  @override
  String get paywallTitle2 => 'خطتك\nجاهزة';

  @override
  String get paywallBullet2a => '8 دقائق كل صباح، مصممة لعمودك الفقري';

  @override
  String get paywallBullet2b => 'النوم والتغذية والماء، كلها متابَعة';

  @override
  String get paywallBullet2c => 'خطوة أقرب كل يوم، لا تكسر السلسلة';

  @override
  String get paywallStat3 => 'رسوم تقدم لحظية';

  @override
  String get paywallTitle3 => 'تابع\nنموك';

  @override
  String get paywallBullet3a => 'قياسات شهرية، شوف نموك بعينك';

  @override
  String get paywallBullet3b => 'اكسب 2 cm الآن مع تحليل الوقفة';

  @override
  String get paywallBullet3c => 'صور التقدم، راح تشوف الفرق';

  @override
  String get paywallStat4 => 'برنامج يومي، ترتقي مستوى';

  @override
  String get paywallTitle4 => 'أقوى\nكل يوم';

  @override
  String get paywallBullet4a => 'اكسب XP وافتح المستويات، العادات تصير لعبة';

  @override
  String get paywallBullet4b => 'من وصلوا لهدفهم مرّوا من هنا';

  @override
  String get paywallBullet4c => 'ابدأ الآن، الأسبوع الأول مجاني';

  @override
  String get paywallRestore => 'لم نجد مشتريات سابقة';

  @override
  String get paywallRestoreNotFound => 'لم نجد مشتريات سابقة';

  @override
  String get paywallPromoCode => 'عندك رمز ترويجي؟';

  @override
  String get paywallHeightUnit => 'الطول المستهدف';

  @override
  String get paywallHeightTitle => 'كم ممكن تطول أكثر؟';

  @override
  String get paywallHeightDesc =>
      'نحلل وراثتك ونمط حياتك ووقفتك معًا ونرسم التوقع سنة بسنة. لا شيء ثابت: كل خطوة تخطوها تحدّثه.';

  @override
  String get paywallGrowthUnit => 'هذه السنة';

  @override
  String get paywallGrowthTitle => 'نتابع نموك معك';

  @override
  String get paywallGrowthDesc =>
      'كل قياس يظهر على الرسم فورًا. تتابع تقدمك شهرًا بشهر، وسنتيمترًا بسنتيمتر.';

  @override
  String get paywallPostureUnit => 'نقاط الوقفة';

  @override
  String get paywallPostureTitle => 'وقفتك هي مفتاح روتينك';

  @override
  String get paywallPostureDesc =>
      'فحص سريع من 3 أسئلة لرأسك وكتفيك وأسفل ظهرك، مع التمارين المناسبة لتصحيح كل واحد.';

  @override
  String get paywallReportUnit => 'روتين مكتمل';

  @override
  String get paywallReportTitle => 'نراجعك كل أسبوع';

  @override
  String get paywallReportDesc =>
      'الماء والنوم والروتين والسلسلة في شاشة واحدة. كل أسبوع نحدد معًا نقاط قوتك ونواقصك.';

  @override
  String get paywallNutritionUnit => 'وجبات في اليوم';

  @override
  String get paywallNutritionTitle => 'خطة تغذيتك الكاملة جاهزة';

  @override
  String get paywallNutritionDesc =>
      'من الفطور إلى العشاء، خطة يومية كاملة محسوب فيها البروتين والكالسيوم والزنك وفيتامين D.';

  @override
  String get paywallScoreUnit => 'نقاط BeTaller';

  @override
  String get paywallScoreTitle => 'النظام اللي يدفعك للأمام دائمًا';

  @override
  String get paywallScoreDesc =>
      'الوراثة والنمو والتغذية والنوم والانضباط تجتمع في نقاط واحدة. أول ما تنزل، تعرف بالضبط وين تتحسن.';

  @override
  String get paywallPhotosUnit => 'فرق واضح';

  @override
  String get paywallPhotosTitle => 'أثبت تغيّرك بالصور';

  @override
  String get paywallPhotosDesc =>
      'مقارنات قبل وبعد تُبنى تلقائيًا، وصورة كل شهر تجتمع في خطك الزمني.';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => 'خلّنا نبدأ بثلاث خطوات';

  @override
  String get journeyIntroSubtitle =>
      'نجهّز BeTaller معًا. خطوتك التالية بانتظارك.';

  @override
  String get journeyStep1Title => 'نجمع بياناتك';

  @override
  String get journeyStep1Desc =>
      'نأخذ طولك وعمرك ونمط حياتك، ثم نحسب إمكاناتك.';

  @override
  String get journeyStep2Title => 'جولة في التطبيق';

  @override
  String get journeyStep2Desc => 'نمر على كل ميزة: ماذا تفعل وكيف تستخدمها.';

  @override
  String get journeyStep3Title => 'تستخدمه بنفسك';

  @override
  String get journeyStep3Desc => 'تنفّذ روتينك اليومي ونحن نتابع تقدمك.';

  @override
  String get journeyNow => 'الآن';

  @override
  String get journeyDone => 'تم';

  @override
  String get journeySoon => 'قريبًا';

  @override
  String get tourHomeStreakTitle => 'سلسلتك';

  @override
  String get tourHomeStreakDesc =>
      'تكبر ما دمت منضبطًا. إذا فاتك يوم، تبدأ من جديد.';

  @override
  String get tourHomeXpTitle => 'مستواك';

  @override
  String get tourHomeXpDesc =>
      'يرتفع مع الـXP اللي تكسبه بانضباطك. لا تخرج عن المسار!';

  @override
  String get tourHomeGoalsTitle => 'أهداف اليوم';

  @override
  String get tourHomeGoalsDesc =>
      'تعرض روتينك ومهامك وهدف الماء لليوم بنظرة واحدة، فلا يفوتك شيء.';

  @override
  String get tourHomeTrackTitle => 'متابعة الماء والنوم';

  @override
  String get tourHomeTrackDesc => 'سجّل الماء والنوم اليومي من هنا، في ثوانٍ.';

  @override
  String get tourPlanTabsTitle => 'ثلاث تبويبات: اليوم، الانضباط، التغذية';

  @override
  String get tourPlanTabsDesc =>
      'روتينك اليومي وبرنامجك الأسبوعي وخطة تغذيتك كلها هنا.';

  @override
  String get tourPlanLevelTitle => 'مستوى انضباطك';

  @override
  String get tourPlanLevelDesc =>
      'يوضح مدى انتظامك في إكمال الروتين. ارتقِ مستوى لنتائج أفضل.';

  @override
  String get tourPlanTodayTitle => 'خطة اليوم';

  @override
  String get tourPlanTodayDesc => 'أنجز روتينك اليومي هنا لتكبر سلسلتك.';

  @override
  String get tourPlanTodayListTitle => 'روتينك لليوم';

  @override
  String get tourPlanTodayListDesc =>
      'علّم كل واحد عند إنجازه. اضغط على أي روتين لتفتح تفاصيله.';

  @override
  String get tourPlanWeekGoalsTitle => 'هذا الأسبوع';

  @override
  String get tourPlanWeekGoalsDesc =>
      'الأيام المثالية والتمارين والقياس المطلوب منك هذا الأسبوع، ومنها الإلزامي.';

  @override
  String get tourPlanMonthGoalsTitle => 'هذا الشهر';

  @override
  String get tourPlanMonthGoalsDesc =>
      'صور التقدم وفحص الوقفة وقياسات هذا الشهر: الأشياء اللي لا يجب أن تتخطاها.';

  @override
  String get tourProgressHeightTitle => 'طولك الحالي';

  @override
  String get tourProgressHeightDesc =>
      'يعرض طولك الآن وإجمالي ما كسبته. أضف قياسًا جديدًا من هنا.';

  @override
  String get tourProgressPhotosTitle => 'صور التقدم';

  @override
  String get tourProgressPhotosDesc =>
      'تابع تحوّلك بصريًا بصور تلتقطها بانتظام.';

  @override
  String get tourProgressPostureTitle => 'تحليل الوقفة';

  @override
  String get tourProgressPostureDesc =>
      'حلّل وقفتك من صورة واعرف ماذا تحتاج أن تحسّن.';

  @override
  String get tourAnalysisScoreTitle => 'نقاط BeTaller';

  @override
  String get tourAnalysisScoreDesc =>
      'نقاط أدائك العام، محسوبة من وراثتك وسرعة نموك وتغذيتك ونومك.';

  @override
  String get tourAnalysisPredictionTitle => 'توقع طولك';

  @override
  String get tourAnalysisPredictionDesc =>
      'يعرض طولك النهائي المتوقع ومسارك سنة بسنة.';

  @override
  String get tourAnalysisPeerTitle => 'قارن مع أقرانك';

  @override
  String get tourAnalysisPeerDesc => 'اعرف ترتيبك وقارن نفسك بمن هم في عمرك.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'روتينك';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'اعرف كم روتين تمرين باقي عليك اليوم.';

  @override
  String get tourHomeGoalsChallengesTitle => 'مهامك';

  @override
  String get tourHomeGoalsChallengesDesc => 'تابع تقدم تحدياتك النشطة من هنا.';

  @override
  String get tourHomeGoalsWaterTitle => 'هدف الماء';

  @override
  String get tourHomeGoalsWaterDesc => 'اعرف كم أنت قريب من هدف الماء اليومي.';

  @override
  String get tourHomeReminderTitle => 'تذكيرك القادم';

  @override
  String get tourHomeReminderDesc =>
      'اعرف متى يأتي تذكيرك القادم، وعدّله من هنا.';

  @override
  String get tourHomeChallengesTitle => 'تحدياتك';

  @override
  String get tourHomeChallengesDesc => 'أكمل التحديات النشطة لتكسب XP إضافية.';

  @override
  String get tourHomeGrowthTitle => 'حالة نموك';

  @override
  String get tourHomeGrowthDesc =>
      'شوف الفرق بين إجماليك وآخر قياس، وكم قياسًا سجّلت.';

  @override
  String get tourHomeExploreTitle => 'استكشف';

  @override
  String get tourHomeExploreDesc =>
      'أدلة التغذية ووصفات النمو وأكثر بانتظارك هنا.';

  @override
  String get tourPlanProgramHeaderTitle => 'برنامجك لـ70 يومًا';

  @override
  String get tourPlanProgramHeaderDesc =>
      'شوف تقدمك العام ومستواك ويومك الحالي في هذه الحلقة.';

  @override
  String get tourPlanProgramLevelsTitle => 'المستويات';

  @override
  String get tourPlanProgramLevelsDesc =>
      'اعرف في أي مستوى من الـ10 أنت، وأيها ما زال مقفلًا.';

  @override
  String get tourPlanNutritionHeaderTitle => 'تقدم تغذيتك';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'تابع كم أكملت من روتين التغذية اليومي.';

  @override
  String get tourPlanNutritionFirstTitle => 'روتين التغذية';

  @override
  String get tourPlanNutritionFirstDesc => 'أنجز عادات التغذية التي تدعم نموك.';

  @override
  String get tourProgressChartTitle => 'منحنى النمو';

  @override
  String get tourProgressChartDesc =>
      'شوف قياساتك السابقة على رسم وافهم إلى أين تتجه.';

  @override
  String get tourProgressReportTitle => 'التقرير الأسبوعي';

  @override
  String get tourProgressReportDesc => 'راجع التقرير الذي يلخص تقدم أسبوعك.';

  @override
  String get tourProgressHistoryTitle => 'سجل قياساتك';

  @override
  String get tourProgressHistoryDesc => 'شوف كل قياسات طولك على خط زمني.';

  @override
  String get tourAnalysisRadarTitle => 'رسم توازنك';

  @override
  String get tourAnalysisRadarDesc =>
      'شوف توازن وراثتك وسرعة نموك وتغذيتك ونومك وانضباطك على رسم راداري، واعرف نقطة ضعفك.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'احتياجاتك اليومية';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'شوف احتياجك اليومي من البروتين والسعرات والنوم والماء، حسب طولك ووزنك.';

  @override
  String get journeyDataDoneTitle => 'الخطوة الأولى تمت';

  @override
  String get journeyDataDoneSubtitle =>
      'عندنا بياناتك وإمكاناتك. الخطوة التالية جولة في التطبيق.';

  @override
  String get journeyContinue => 'متابعة';

  @override
  String get journeyEnterApp => 'ادخل التطبيق';

  @override
  String get journeyProgressLabel => 'البداية';

  @override
  String get journeyTourDoneTitle => 'أهلًا بك في BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'أكملت الخطوات الثلاث. الآن دورك: ابدأ رحلتك بإكمال أول روتين.';

  @override
  String get journeyViewPlansButton => 'شوف خططك لتبدأ';

  @override
  String get paywallRestoreLabel => 'استعادة المشتريات';

  @override
  String get paywallYearly => 'سنوي';

  @override
  String get paywallBestValue => 'الأوفر';

  @override
  String paywallSavePercent(String percent) {
    return 'وفّر $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/أسبوع';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/شهر';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/سنة';
  }

  @override
  String get paywallMonthly => 'شهري';

  @override
  String get paywallWeekly => 'أسبوعي';

  @override
  String get paywallFreeTrial => '3 أيام مجانًا';

  @override
  String get paywallLoadError => 'تعذّر تحميل خيارات الشراء، حاول مرة أخرى';

  @override
  String get paywallCtaAlt => 'متابعة';

  @override
  String get paywallTrialDisclaimer =>
      '3 أيام مجانًا · ثم يتجدد تلقائيًا · ألغِ متى شئت';

  @override
  String get paywallYearlyDisclaimer => 'يتجدد سنويًا تلقائيًا · ألغِ متى شئت';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '$days أيام مجانًا، ثم $price/أسبوع · ألغِ متى شئت';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '$days أيام مجانًا، ثم $price/شهر · ألغِ متى شئت';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '$days أيام مجانًا، ثم $price/سنة · ألغِ متى شئت';
  }

  @override
  String get paywallRenewsWeekly => 'يتجدد أسبوعيًا تلقائيًا · ألغِ متى شئت';

  @override
  String get paywallRenewsMonthly => 'يتجدد شهريًا تلقائيًا · ألغِ متى شئت';

  @override
  String get resultCardTitle => 'طولك المتوقع عند البلوغ';

  @override
  String resultRange(String min, String max) {
    return 'المدى المرجّح: من $min إلى $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'أطول من $percent% ممن في عمرك';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'النمو المتبقي المقدّر: $amount';
  }

  @override
  String get resultFootnote =>
      'تقدير مبني على طول والديك وبيانات منحنيات النمو. ليس نصيحة طبية.';

  @override
  String get postureCheckTitle => 'فحص سريع للوقفة';

  @override
  String get postureCheckIntro =>
      'قف وكعباك ووركاك ولوحا كتفيك على الحائط، ثم أجب عن ثلاثة أسئلة. نتيجتك تأتي من إجاباتك؛ والصورة تُحفظ للمقارنة قبل وبعد.';

  @override
  String get postureQHead => 'هل يلمس مؤخر رأسك الحائط بدون أن ترفع ذقنك؟';

  @override
  String get postureQHeadA1 => 'نعم، بسهولة';

  @override
  String get postureQHeadA2 => 'فقط إذا دفعته للخلف';

  @override
  String get postureQHeadA3 => 'لا، فيه فراغ';

  @override
  String get postureQShoulders => 'في صورتك الجانبية، أين كتفاك مقارنة بأذنيك؟';

  @override
  String get postureQShouldersA1 => 'على خط واحد مع أذني';

  @override
  String get postureQShouldersA2 => 'للأمام قليلًا';

  @override
  String get postureQShouldersA3 => 'منحنيان للأمام بوضوح';

  @override
  String get postureQLowerBack => 'أدخل يدك خلف أسفل ظهرك. كم المسافة؟';

  @override
  String get postureQLowerBackA1 => 'تدخل كف مفرودة بالكاد';

  @override
  String get postureQLowerBackA2 => 'لا توجد مسافة أبدًا';

  @override
  String get postureQLowerBackA3 => 'تدخل قبضة يد';

  @override
  String get postureCheckSave => 'شوف نتيجتي';

  @override
  String get postureCheckNote => 'فحص ذاتي، وليس تقييمًا طبيًا.';

  @override
  String get paywallTester => 'مختبِر';

  @override
  String get introTag1 => 'التوقع';

  @override
  String get introTag2 => 'النمو';

  @override
  String get introTag3 => 'المتابعة';

  @override
  String get introTag4 => 'التحفيز باللعب';

  @override
  String get introTag5 => 'المجتمع';

  @override
  String get introTitle1 => 'اكتشف\nإمكانات طولك';

  @override
  String get introSubtitle1 =>
      'خلّنا نحسب إمكاناتك الكاملة\nحسب الوراثة والعمر ونمط الحياة.';

  @override
  String get introTitle2 => 'أطول بخطوة\nكل يوم';

  @override
  String get introSubtitle2 => 'ادفع إمكاناتك بخطط\nتمارين وتغذية مخصصة لك.';

  @override
  String get introTitle3 => 'تابع كل\nسنتيمتر';

  @override
  String get introSubtitle3 =>
      'شوف كيف يتطور تقدمك الحقيقي\nمع القياسات الشهرية.';

  @override
  String get introTitle4 => 'ارتقِ مستوى،\nواكسب مكافآت';

  @override
  String get introSubtitle4 =>
      'أكمل برامج 70 يومًا،\nاكسب XP، وافتح مستويات جديدة.';

  @override
  String get introTitle5 => 'الآلاف\nطالوا بالفعل';

  @override
  String get introSubtitle5 => 'انضم لمجتمع المستخدمين\nالذين وصلوا لأهدافهم.';

  @override
  String get criticalWindow => 'فترة حاسمة';

  @override
  String get heightPotentialFading => 'الحقائق عن';

  @override
  String get fadingAway => 'إمكانات طولك..';

  @override
  String get painHookDesc =>
      'كل يوم يمر بدون العادات الصحيحة، تضيع سنتيمترات للأبد. لكن ما زال بإمكانك تغيير ذلك.';

  @override
  String get painGeneticTitle => 'الوراثة ليست كل شيء';

  @override
  String get painGeneticDesc =>
      'الوراثة تحدد 60%، لكن ما تفعله يحدد الـ40% الباقية. وBeTaller موجود لهذه الـ40% بالضبط.';

  @override
  String get painGeneticTag => 'التحليل';

  @override
  String get painSleepTitle => 'حسّن روتين نومك';

  @override
  String get painSleepDesc =>
      'النوم الصحيح كل ليلة قد يرفع إنتاج هرمون النمو بنسبة 70%. BeTaller يتابع نومك تلقائيًا، وأنت فقط نم.';

  @override
  String get painSleepTag => 'المتابعة';

  @override
  String get painPostureTitle => 'اكسب سنتيمترات الآن بالوقفة';

  @override
  String get painPostureDesc =>
      'الوقفة الصحيحة قد تضيف 1.5-3 cm فورًا. روتين الوقفة اليومي في BeTaller يثبّت ذلك خلال أسابيع.';

  @override
  String get painPostureTag => 'الوقفة';

  @override
  String get painExerciseTitle => 'خطة تمارينك المخصصة جاهزة';

  @override
  String get painExerciseDesc =>
      'تمدد الصباح، التعلق، روتين الظهر: BeTaller جهّزها وجدولها لك. فقط 8-12 دقيقة يوميًا.';

  @override
  String get painExerciseTag => 'الروتين';

  @override
  String get painNutritionTitle => 'تغذيتك تؤثر مباشرة على نموك';

  @override
  String get painNutritionDesc =>
      'البروتين، الكالسيوم، فيتامين D: BeTaller يذكّرك كل يوم بما تحتاجه ومتى.';

  @override
  String get painNutritionTag => 'التغذية';

  @override
  String get painTrackingTitle => 'تابع نموك بعينك';

  @override
  String get painTrackingDesc =>
      'قياسات شهرية، صور تقدم، رسم نمو: شوف كل سنتيمتر تكسبه.';

  @override
  String get painTrackingTag => 'التقدم';

  @override
  String get selectYourGender => 'اختر جنسك';

  @override
  String get onboardingPredictSubtitle =>
      'سنستخدم هذا لتوقع إمكانات طولك وإعداد خطتك المخصصة.';

  @override
  String get other => 'آخر';

  @override
  String get whenWereYouBorn => 'متى وُلدت؟';

  @override
  String get heightAndWeight => 'الطول والوزن';

  @override
  String get parentsHeight => 'طول الوالدين';

  @override
  String get weeklyWorkout => 'التمرين الأسبوعي';

  @override
  String get workoutsPerWeek => 'تمارين في الأسبوع';

  @override
  String get whatsYourEthnicity => 'ما أصلك العرقي؟';

  @override
  String get whiteCaucasian => 'أبيض / قوقازي';

  @override
  String get blackAfricanAmerican => 'أسود / أفريقي';

  @override
  String get hispanicLatino => 'لاتيني';

  @override
  String get asian => 'آسيوي';

  @override
  String get middleEasternIndigenous => 'شرق أوسطي / من السكان الأصليين';

  @override
  String get dontWantToAnswer => 'لا أريد الإجابة';

  @override
  String get footSizeLabel => 'مقاس القدم';

  @override
  String get selectYourSize => 'اختر مقاسك';

  @override
  String get whatsYourDreamHeight => 'ما هو طول أحلامك؟';

  @override
  String get dreamHeightCalcSubtitle =>
      'بناءً على إجاباتك، سنحسب احتمال وصولك لهذا الطول.';

  @override
  String get dreamHeightLabel => 'طول الأحلام';

  @override
  String get sleepQuestion => 'كم ساعة\nتنام كل ليلة؟';

  @override
  String get thousandsSucceeded => 'الآلاف\nنجحوا';

  @override
  String get youCanToo => 'وأنت تقدر كذلك';

  @override
  String get yearsOld => 'سنة';

  @override
  String get verifiedLabel => 'موثّق';

  @override
  String get scientificData => 'بيانات علمية';

  @override
  String get longTermResults => 'BeTaller يصنع\nنتائج طويلة المدى';

  @override
  String get longTermResultsSubtitle =>
      'كثيرون لا يصلون لأقصى طولهم بسبب العادات السيئة.';

  @override
  String get yourFinalHeight => 'طولك النهائي';

  @override
  String get badHabitsLegend => 'عادات سيئة';

  @override
  String get optimizedLegend => 'عادات محسّنة';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'من الطول يتأثر\nبالعادات';

  @override
  String get chartFact2Pct => '9-10h';

  @override
  String get chartFact2Desc => 'النوم المثالي يرفع\nهرمون النمو';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'يمكن كسبها\nبتحسين الوقفة';

  @override
  String get didYouKnow => 'هل تعلم؟';

  @override
  String get didYouKnowFact1 => 'العادات اليومية تؤثر على 30% من طولك';

  @override
  String get didYouKnowFact2 => 'ضغط العمود الفقري يسرق 1.5-3 cm من طولك';

  @override
  String get didYouKnowFact3 => 'قلة النوم تخفض HGH بنسبة 70%';

  @override
  String get transformJourneyBegins => 'رحلة تحوّلك\nتبدأ الآن';

  @override
  String get transformJourneySubtitle =>
      'برنامج شامل مصمم لدعم\nنموك الصحي، خطوة بخطوة.';

  @override
  String get week1Label => 'أ1';

  @override
  String get week1Title => 'الأسبوع 1';

  @override
  String get week1Desc => 'تتحسن استقامة الظهر وتصير وقفتك أفضل';

  @override
  String get month1Label => 'ش1';

  @override
  String get month1Title => 'الشهر 1';

  @override
  String get month1Desc => 'أول سنتيمترات ظاهرة، وتتحسن جودة النوم';

  @override
  String get month3Label => 'ش3';

  @override
  String get month3Title => 'الشهر 3';

  @override
  String get month3Desc => 'مكسب متوسط +1.5–2.5 cm، ونمو العضلات';

  @override
  String get month6Label => 'ش6';

  @override
  String get month6Title => 'الشهر 6';

  @override
  String get month6Desc => 'صل لأقصى إمكاناتك، وعش بطولك الجديد';

  @override
  String get reachYourGoal => 'حقق هدفك';

  @override
  String get journeyBullet1 => 'افتح أقصى إمكاناتك';

  @override
  String get journeyBullet2 => 'ابدأ العيش بطولك الجديد';

  @override
  String get journeyBullet3 => 'اكتب قصة نجاحك';

  @override
  String get unlockButton => 'افتح الكل';

  @override
  String get dreamHeightOdds => 'فرصة\nطول الأحلام';

  @override
  String get growthCompleteLabel => 'النمو\nالمكتمل';

  @override
  String get tallerThanPct => 'أطول من 76.7% ممن في عمرك';

  @override
  String get levelNovice => 'مبتدئ';

  @override
  String get levelBuilder => 'باني';

  @override
  String get levelGrinder => 'مجتهد';

  @override
  String get levelWarrior => 'محارب';

  @override
  String get levelGodTier => 'المستوى الأسطوري';

  @override
  String get levelDesc0 => 'ابنِ أساسك';

  @override
  String get levelDesc1 => 'سرّع نموك';

  @override
  String get levelDesc2 => 'كثّف تمرينك';

  @override
  String get levelDesc3 => 'تجاوز حدودك';

  @override
  String get levelDesc4 => 'لا إنجاز بلا تعب';

  @override
  String get levelDesc5 => 'عقلية الأبطال';

  @override
  String get levelDesc6 => 'أداء النخبة';

  @override
  String get levelDesc7 => 'سيطر على جسمك';

  @override
  String get levelDesc8 => 'انضباط أسطوري';

  @override
  String get levelDesc9 => 'أقصى الإمكانات';

  @override
  String levelLabel(int level) {
    return 'المستوى $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'باقي $days يوم',
      many: 'باقي $days يومًا',
      few: 'باقي $days أيام',
      two: 'باقي يومان',
      one: 'باقي يوم واحد',
    );
    return '$_temp0 في برنامجك';
  }

  @override
  String get tapLabel => 'اضغط';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'يوم';

  @override
  String get legendShort => 'قصير';

  @override
  String get legendBelowAvg => 'تحت المتوسط';

  @override
  String get legendAverage => 'متوسط';

  @override
  String get legendTall => 'طويل';

  @override
  String get legendVeryTall => 'طويل جدًا';

  @override
  String get pctBottom5 => 'أدنى 5%';

  @override
  String get pctBottom25 => 'أدنى 25%';

  @override
  String get pctMedian => 'الوسيط';

  @override
  String get pctTop25 => 'أعلى 25%';

  @override
  String get pctTop5 => 'أعلى 5%';

  @override
  String get fallingBehind => 'متأخر';

  @override
  String readTimeMinutes(int minutes) {
    return 'قراءة $minutes دقيقة';
  }

  @override
  String get inThisArticle => 'في هذا المقال';

  @override
  String get nextArticle => 'المقال التالي';

  @override
  String get purchaseUnavailable => 'تعذّر إتمام الشراء. حاول مرة أخرى.';

  @override
  String get viewPlan => 'عرض الخطة';

  @override
  String get viewPlanSubtitle => 'شوف تفاصيل اشتراكك';

  @override
  String predictionConfidenceHint(String percent) {
    return 'إضافة قياسات الطول ترفع دقة التوقع إلى $percent%';
  }

  @override
  String get paywallSlideHomeTitle => 'يومك في شاشة واحدة';

  @override
  String get paywallSlideHomeCaption =>
      'الروتين، الماء، النوم: ثلاث حلقات لتكملها.';

  @override
  String get paywallSlideProgressTitle => 'شوف كل سنتيمتر';

  @override
  String get paywallSlideProgressCaption => 'كل قياس يظهر على المنحنى فورًا.';

  @override
  String get paywallSlideAnalysisTitle => 'خمسة مقاييس، شكل واحد';

  @override
  String get paywallSlideAnalysisCaption => 'الرادار يكشف نقطة ضعفك.';

  @override
  String get paywallSlidePotentialTitle => 'اعرف إمكاناتك';

  @override
  String get paywallSlidePotentialCaption => 'شوف موقعك بين أقرانك.';

  @override
  String get paywallSlideDisciplineTitle => 'حافظ على السلسلة';

  @override
  String get paywallSlideDisciplineCaption => 'كل يوم يرفع مستواك.';

  @override
  String get paywallSlideRemindersTitle => 'تذكير في الوقت المناسب';

  @override
  String get paywallSlideRemindersCaption =>
      'حدد ساعاتك، والتطبيق يتكفل بالباقي.';

  @override
  String get paywallSlidePostureTitle => 'صحّح وقفتك';

  @override
  String get paywallSlidePostureCaption =>
      'صورة جانبية، فحص ذاتي سريع، روتين واضح.';

  @override
  String paywallTrialHeadline(String days) {
    return '$days أيام مجانًا';
  }

  @override
  String paywallTrialThen(String price) {
    return 'ثم $price · ألغِ متى شئت';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / سنة · ألغِ متى شئت';
  }

  @override
  String get obBedtimeTitle => 'متى تنام عادةً؟';

  @override
  String get obBedtimeSubtitle => 'سنضبط تذكير النوم حول هذا الوقت.';

  @override
  String get obWorkoutTimeTitle => 'متى تتمرن؟';

  @override
  String get obWorkoutTimeSubtitle => 'ليصلك تذكير التمرين في وقته بالضبط.';

  @override
  String get obMealsTitle => 'كم وجبة في اليوم؟';

  @override
  String get obMealsSubtitle => 'اضغط على أي وقت لتعدّله حسب روتينك.';

  @override
  String obMealsCount(String count) {
    return '$count وجبات';
  }

  @override
  String obMealLabel(String n) {
    return 'الوجبة $n';
  }

  @override
  String get obProteinTitle => 'كم غرام بروتين في اليوم؟';

  @override
  String get obProteinSubtitle => 'رقم تقريبي يكفي. نبني خطتك حوله.';

  @override
  String get obCaloriesTitle => 'كم سعرة في اليوم، بالمتوسط؟';

  @override
  String get obCaloriesSubtitle => 'التقدير يكفي؛ ونقدر ندققه معًا لاحقًا.';

  @override
  String get obNotSure => 'لست متأكدًا';

  @override
  String get silNow => 'الآن';

  @override
  String get silPotential => 'الإمكانات';

  @override
  String get chartMeasured => 'قياساتك';

  @override
  String chartPotential(String height) {
    return 'الإمكانات $height';
  }

  @override
  String chartDream(String height) {
    return 'هدفك $height';
  }

  @override
  String get targetsTitle => 'اليوم، لك';

  @override
  String get targetsSubtitle => 'محسوبة من عمرك ووزنك وتمرينك.';

  @override
  String get targetProtein => 'البروتين';

  @override
  String get targetCalcium => 'الكالسيوم';

  @override
  String get targetVitaminD => 'فيتامين D';

  @override
  String get targetWater => 'الماء';

  @override
  String get targetSleep => 'النوم';

  @override
  String get targetMove => 'التمرين';

  @override
  String targetPerMeal(String g) {
    return '$g g لكل وجبة';
  }

  @override
  String get unitHours => 'س';

  @override
  String get unitMinutes => 'د';

  @override
  String get planStrength => 'قوة';

  @override
  String get planJump => 'قفز وركض سريع';

  @override
  String get planMobility => 'تمدد';

  @override
  String get planSport => 'رياضة';

  @override
  String get planPosture => 'وقفة';

  @override
  String get planRest => 'راحة';

  @override
  String planWeekTitle(int days) {
    return 'أسبوعك: $days أيام تمرين';
  }

  @override
  String get planPreviewTitle => 'خطتك جاهزة';

  @override
  String planPreviewTraining(int days) {
    return '$days أيام تمرين في الأسبوع، مبنية للنمو';
  }

  @override
  String planPreviewProtein(int grams) {
    return '$grams g بروتين يوميًا، موزعة على وجباتك';
  }

  @override
  String planPreviewSleep(String hours) {
    return '$hours ساعات نوم، مع تذكير بوقت النوم';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'اليوم: $plan · $minutes دقيقة';
  }

  @override
  String get nRestTitle => 'اليوم يوم راحة';

  @override
  String get nRestBody => 'عشر دقائق تمدد تكفي. التعافي جزء من الخطة.';

  @override
  String nProteinTitle(int grams) {
    return 'هدف البروتين اليوم: $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return 'حوالي $grams g لكل وجبة: بيض، زبادي، دجاج، عدس.';
  }

  @override
  String nWaterTitle(String liters) {
    return 'هدف الماء: $liters';
  }

  @override
  String get nWaterBody => 'كوب واحد الآن يبقيك على المسار اليوم.';

  @override
  String get nSleepTitle => 'وقت الاسترخاء';

  @override
  String nSleepBody(String hours) {
    return 'هدفك $hours ساعات. أطفئ الشاشات وخفّف الإضاءة.';
  }

  @override
  String nMeasureBody(String potential) {
    return 'إمكاناتك: $potential. قِس طولك في الصباح وشوف رسمك يتحرك.';
  }

  @override
  String get nTrialDay1Title => 'خطتك بانتظارك';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'اليوم: $plan، $minutes دقيقة. سجّل طولك ليبدأ رسمك.';
  }

  @override
  String get nTrialEndTitle => 'تجربتك المجانية تنتهي غدًا';

  @override
  String nTrialEndBody(String price) {
    return 'بعدها يستمر بسعر $price. خطتك وتقدمك محفوظان في كل الأحوال.';
  }

  @override
  String get trophyContinue => 'استمر';

  @override
  String get guideSteps => 'خطوة بخطوة';

  @override
  String get guideMistakes => 'أخطاء شائعة';

  @override
  String get guideTip => 'نصيحة';

  @override
  String get homeHeroTitle => 'طولك وإمكاناتك';

  @override
  String homeHeroGap(String cm) {
    return 'ما زال أمامك $cm';
  }

  @override
  String get anSubtitle => 'نقاطك، وما يحرّكها، وإلى أين تتجه';

  @override
  String get anScoreLabel => 'نقاط BeTaller';

  @override
  String get anTierStarting => 'بداية';

  @override
  String get anTierBuilding => 'بناء';

  @override
  String get anTierRising => 'صعود';

  @override
  String get anTierStrong => 'قوي';

  @override
  String get anTierPeak => 'القمة';

  @override
  String anTrendUp(int n) {
    return '+$n عن الأسبوع الماضي';
  }

  @override
  String anTrendDown(int n) {
    return '-$n عن الأسبوع الماضي';
  }

  @override
  String get anTrendFlat => 'مثل الأسبوع الماضي';

  @override
  String get anTrendFirst => 'اتجاهك الأسبوعي يبدأ الأسبوع القادم';

  @override
  String anNextTier(int n, String tier) {
    return '$n نقطة للوصول إلى $tier';
  }

  @override
  String get anTopTier => 'أعلى فئة. حافظ عليها';

  @override
  String anCoverage(int n, int total) {
    return 'مبني على $n من $total مؤشرات';
  }

  @override
  String get anNoScoreTitle => 'لا توجد بيانات كافية بعد';

  @override
  String get anNoScoreBody =>
      'سجّل نومك أو بعض الماء أو تمرينًا واحدًا اليوم وستظهر أول نقاطك.';

  @override
  String get anFastestWin => 'أسرع مكسب';

  @override
  String get anBreakdownTitle => 'ما يبني نقاطك';

  @override
  String get anBreakdownHint =>
      'كل مؤشر يُقيَّم من 0 إلى 100 من بياناتك. والنسبة هي وزنه في النقاط.';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => 'لا بيانات بعد';

  @override
  String get anNotCounted => 'غير محتسب';

  @override
  String get anFTraining => 'التمرين';

  @override
  String get anFConsistency => 'الانتظام';

  @override
  String get anFSleep => 'النوم';

  @override
  String get anFHydration => 'الترطيب';

  @override
  String get anFNutrition => 'التغذية';

  @override
  String get anFPosture => 'الوقفة';

  @override
  String get anFMeasuring => 'القياس';

  @override
  String get anFGrowth => 'سرعة النمو';

  @override
  String get anFHeadroom => 'مساحة النمو';

  @override
  String anBTraining(int done, int planned) {
    return '$done من $planned أيام تمرين مخططة في آخر 7 أيام';
  }

  @override
  String get anBTrainingNone => 'يحسب أيام تمرينك مقابل خطتك الأسبوعية.';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: 'السلسلة $streak يوم',
      many: 'السلسلة $streak يومًا',
      few: 'السلسلة $streak أيام',
      two: 'السلسلة يومان',
      one: 'السلسلة يوم واحد',
    );
    return '$_temp0، و$active من $days أيام أنجزت فيها نصف الخطة';
  }

  @override
  String get anBConsistencyNone =>
      'يحسب سلسلتك والأيام التي تنهي فيها نصف خطتك على الأقل.';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'سجّلت $days ليلة',
      many: 'سجّلت $days ليلة',
      few: 'سجّلت $days ليالٍ',
      two: 'سجّلت ليلتين',
      one: 'سجّلت ليلة واحدة',
    );
    return '$hours h في الليلة بالمتوسط، الهدف $target h، $_temp0';
  }

  @override
  String get anBSleepNone => 'لا يوجد نوم مسجّل في آخر 7 أيام.';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'سجّلت $days يوم',
      many: 'سجّلت $days يومًا',
      few: 'سجّلت $days أيام',
      two: 'سجّلت يومين',
      one: 'سجّلت يومًا واحدًا',
    );
    return '$litres يوميًا بالمتوسط، الهدف $target، $_temp0';
  }

  @override
  String get anBHydrationNone => 'لا يوجد ماء مسجّل في آخر 7 أيام.';

  @override
  String anBNutrition(int done, int planned) {
    return '$done من $planned عادات تغذية أنجزتها في آخر 7 أيام';
  }

  @override
  String get anBNutritionNone =>
      'يحسب عادات البروتين والكالسيوم والزنك وفيتامين D في خطتك.';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'قبل $days يوم',
      many: 'قبل $days يومًا',
      few: 'قبل $days أيام',
      two: 'قبل يومين',
      one: 'قبل يوم',
    );
    return 'فحص الحائط الذاتي $raw/90، $_temp0';
  }

  @override
  String anBPostureToday(int raw) {
    return 'فحص الحائط الذاتي $raw/90، اليوم';
  }

  @override
  String get anBPostureNone => 'لا يوجد فحص وقفة ذاتي بعد.';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'قبل $days يوم',
      many: 'قبل $days يومًا',
      few: 'قبل $days أيام',
      two: 'قبل يومين',
      one: 'قبل يوم',
    );
    return 'آخر قياس $_temp0';
  }

  @override
  String get anBMeasuringToday => 'قِست اليوم';

  @override
  String get anBMeasuringNone => 'لا يوجد قياس بعد.';

  @override
  String anBGrowth(String v, String e) {
    return '$v في السنة، والمعتاد في عمرك $e';
  }

  @override
  String get anBGrowthNone => 'يحتاج قياسين بينهما 30 يومًا على الأقل.';

  @override
  String get anBGrowthAdult =>
      'صفائح النمو تنغلق عادةً بحلول 21، لذلك سرعة النمو لا تُحتسب لك.';

  @override
  String anBHeadroom(String cm) {
    return '$cm بين اليوم وإمكاناتك';
  }

  @override
  String get anATraining => 'ابدأ تمرين اليوم';

  @override
  String get anAConsistency => 'أنهِ نصف خطة اليوم';

  @override
  String get anASleepLog => 'سجّل نوم البارحة';

  @override
  String anASleep(String target) {
    return 'نم $target h الليلة';
  }

  @override
  String get anAHydrationLog => 'سجّل كوب ماء';

  @override
  String anAHydration(String left) {
    return 'اشرب $left إضافية اليوم';
  }

  @override
  String get anAHydrationDone => 'حققت الهدف اليوم. وكذلك بكرة';

  @override
  String get anANutrition => 'أنجز عادات التغذية اليوم';

  @override
  String get anAPostureFirst => 'سوِّ فحص وقفة ذاتي لدقيقة';

  @override
  String get anAPostureRedo => 'أعد فحص وقفتك الذاتي';

  @override
  String get anAPostureKeep => 'حافظ على روتين الوقفة اليومي';

  @override
  String get anAMeasure => 'قِس طولك الآن';

  @override
  String get anAMeasureKeep => 'قِس مرة أخرى الأسبوع القادم';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'بعد $days يوم',
      many: 'بعد $days يومًا',
      few: 'بعد $days أيام',
      two: 'بعد يومين',
      one: 'بعد يوم',
    );
    return 'قِس مرة أخرى $_temp0';
  }

  @override
  String get anAGrowth => 'قِس كل أسبوعين لتتابعها';

  @override
  String get anAHeadroom => 'شوف إمكاناتك';

  @override
  String get anPotentialTitle => 'إمكاناتك';

  @override
  String get anPotentialLabel => 'الطول المتوقع عند البلوغ';

  @override
  String anPotentialToGo(String cm) {
    return 'باقي +$cm';
  }

  @override
  String get anPotentialReached => 'وصلت لطولك المتوقع';

  @override
  String get anPotentialNote =>
      'نفس الرقم في كل مكان بالتطبيق. ولا يتحرك إلا للأعلى.';

  @override
  String anDreamLine(String h) {
    return 'هدفك: $h';
  }

  @override
  String get anSourcesTitle => 'من أين تأتي السنتيمترات';

  @override
  String get anSourcesGenes => 'الوراثة والعمر';

  @override
  String get anSourcesHabits => 'النوم، الأكل، التمرين';

  @override
  String get anSourcesPosture => 'الوقفة';

  @override
  String get anPctTitle => 'الطول بالنسبة لعمرك';

  @override
  String anPctValue(int p) {
    return 'أطول من $p% ممن في عمرك';
  }

  @override
  String get anPctBasis => 'منحنيات نمو CDC الأمريكية، نفس العمر والجنس';

  @override
  String get anPctMore => 'المقارنة الكاملة';

  @override
  String get anNeedsBasis => 'محسوبة من عمرك ووزنك وتمرينك';

  @override
  String get anCalcium => 'الكالسيوم';

  @override
  String get anVitaminD => 'فيتامين D';

  @override
  String get anMovement => 'الحركة';

  @override
  String get anUnitMin => 'د';

  @override
  String get anUnitHours => 'س';

  @override
  String get anPerDay => 'يوميًا';

  @override
  String get anPerNight => 'في الليلة';

  @override
  String get anUnlockScoreTitle => 'نقاط BeTaller الكاملة';

  @override
  String get anUnlockScoreBody =>
      'النقاط، والمؤشرات التسعة وراءها، وما تفعله بعد ذلك.';

  @override
  String get anUnlockSourcesTitle => 'اعرف من أين تأتي سنتيمتراتك';

  @override
  String get anUnlockNeedsTitle => 'احتياجاتك اليومية، محسوبة لك';

  @override
  String get anUnlockCta => 'افتح';

  @override
  String get anFlowResultTitle => 'حُفظت في رسمك';

  @override
  String get anFlowResultBody =>
      'أطوالك السابقة الآن على نفس المنحنى مع قياساتك وإمكاناتك.';

  @override
  String get anFlowOpenAnalysis => 'افتح تحليلك';

  @override
  String anTopPct(int p) {
    return 'أعلى $p%';
  }

  @override
  String get anNeedsTitle => 'احتياجاتك اليومية';

  @override
  String get pgUnlockPro => 'افتح مع Pro';

  @override
  String get pgPhotosLockedTitle => 'شوف تحوّلك';

  @override
  String get pgPhotosLockedBody =>
      'احفظ صورة مع طولك كل أسبوعين وقارن أي صورتين بشريط تمرير.';

  @override
  String get pgTransformationTitle => 'تحوّلك';

  @override
  String get pgHeightChange => 'تغيّر الطول';

  @override
  String get pgDaysApart => 'يوم بينهما';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'بفارق $days يوم',
      many: 'بفارق $days يومًا',
      few: 'بفارق $days أيام',
      two: 'بفارق يومين',
      one: 'بفارق يوم واحد',
    );
    return '$delta بين هاتين الصورتين، $_temp0.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'بفارق $days يوم',
      many: 'بفارق $days يومًا',
      few: 'بفارق $days أيام',
      two: 'بفارق يومين',
      one: 'بفارق يوم واحد',
    );
    return 'نفس الطول، $_temp0. الوقفة والشكل يتغيران أولًا، والطول يلحق خلال أشهر.';
  }

  @override
  String get pgModeSlider => 'شريط تمرير';

  @override
  String get pgModeSideBySide => 'جنبًا إلى جنب';

  @override
  String get pgDragToReveal => 'اسحب للمقارنة';

  @override
  String get pgOnePhotoTitle => 'صورتك «قبل» محفوظة';

  @override
  String pgOnePhotoBody(String date) {
    return 'التقط الصورة التالية يوم $date بنفس الوضعية لترى أول مقارنة.';
  }

  @override
  String get pgEmptyTitle => 'ابدأ تحوّلك';

  @override
  String get pgEmptyBody =>
      'صورة كل أسبوعين، نفس الوضعية، نفس المكان، مع طولك عليها. بعد بضعة أشهر تقدر تتنقل بين اليوم الأول واليوم.';

  @override
  String get pgTakeFirstPhoto => 'التقط أول صورة';

  @override
  String get pgPhotoDueNow => 'حان وقت صورة جديدة';

  @override
  String pgNextPhotoOn(String date) {
    return 'الصورة التالية $date';
  }

  @override
  String pgDayN(int n) {
    return 'اليوم $n';
  }

  @override
  String get pgNewPhoto => 'صورة جديدة';

  @override
  String get pgGuideTitle => 'نفس الوضعية، كل مرة';

  @override
  String get pgGuideSubtitle =>
      'الصور تُقارن جيدًا فقط إذا التُقطت بنفس الطريقة.';

  @override
  String get pgGuideGhost => 'آخر صورة لك تظهر بشكل خافت. اضبط نفسك عليها.';

  @override
  String get pgGuideStep1 => 'قف على بعد 2 م، والجوال بمستوى صدرك';

  @override
  String get pgGuideStep2 => 'واجه الكاميرا، القدمان معًا، الذراعان مرتخيتان';

  @override
  String get pgGuideStep3 => 'نفس المكان، نفس الإضاءة، ملابس ضيقة قليلًا';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => 'مستوى الصدر';

  @override
  String get pgTakePhoto => 'التقط صورة';

  @override
  String get pgFromGallery => 'اختر من المعرض';

  @override
  String get pgChoosePhoto => 'اختر صورة';

  @override
  String get pgPostureTitle => 'فحص الوقفة';

  @override
  String get pgPostureLockedTitle => 'اكتشف نقاط ضعفك';

  @override
  String get pgPostureLockedBody =>
      'قيّم رأسك وكتفيك وأسفل ظهرك، واحصل على تمرينين لكل منها، وتابع نتيجتك أسبوعًا بأسبوع.';

  @override
  String get pgAreaHead => 'الرأس';

  @override
  String get pgAreaShoulders => 'الكتفان';

  @override
  String get pgAreaLowerBack => 'أسفل الظهر';

  @override
  String get pgHeadMeaning0 =>
      'رأسك فوق كتفيك تمامًا. حافظ عليه هكذا بتمرين قصير يوميًا.';

  @override
  String get pgHeadMeaning1 =>
      'رأسك يميل للأمام عندما ترتاح. شائع جدًا مع طول استخدام الجوال، ويتحسن بسرعة.';

  @override
  String get pgHeadMeaning2 =>
      'رأسك أمام كتفيك. صحّح هذا أولًا: يجعلك تبدو أقصر في كل صورة.';

  @override
  String get pgShouldersMeaning0 => 'كتفاك على خط أذنيك. أعلى ظهرك يقوم بدوره.';

  @override
  String get pgShouldersMeaning1 =>
      'كتفاك للأمام قليلًا. الصدر المشدود يسحبهما؛ وفتحه يعيدهما.';

  @override
  String get pgShouldersMeaning2 =>
      'كتفان منحنيان. أعلى ظهرك ينحني للأمام، وهذا ينقص من طولك في وقفتك.';

  @override
  String get pgLowerBackMeaning0 =>
      'انحناء طبيعي. وركاك وجذعك يثبّتان عمودك الفقري في مكانه الصحيح.';

  @override
  String get pgLowerBackMeaning1 =>
      'أسفل ظهر مسطّح. البسط اللطيف وتمارين المرونة تعيد الانحناء الطبيعي.';

  @override
  String get pgLowerBackMeaning2 =>
      'تقوّس قوي. عضلات الورك المشدودة تميل حوضك للأمام؛ وتمديدها مع جذع أقوى يعيد التوازن.';

  @override
  String get pgLegacyMeaning =>
      'حُفظ بإصدار قديم بدون هذه الأسئلة. أعد الفحص لتحصل على نصيحة لهذه المنطقة.';

  @override
  String get pgHowItWorks => 'كيف يعمل الفحص';

  @override
  String get pgYourPosture => 'وقفتك';

  @override
  String pgCheckedOn(String date) {
    return 'فُحصت $date';
  }

  @override
  String get pgOutOf100 => 'من 100';

  @override
  String get pgAllAreasGood => 'المناطق الثلاث تبدو جيدة. حافظ عليها هكذا.';

  @override
  String pgStartWith(String area) {
    return 'ابدأ من هنا: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta عن آخر فحص';
  }

  @override
  String get pgStatusGood => 'جيدة';

  @override
  String get pgStatusFair => 'ممكن أفضل';

  @override
  String get pgStatusFix => 'صحّحها أولًا';

  @override
  String get pgKeepItWith => 'حافظ عليها بـ';

  @override
  String get pgFixItWith => 'صحّحها بـ';

  @override
  String get pgRetakeNow => 'حان وقت فحصك الأسبوعي';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'الفحص التالي بعد $n يوم',
      many: 'الفحص التالي بعد $n يومًا',
      few: 'الفحص التالي بعد $n أيام',
      two: 'الفحص التالي بعد يومين',
      one: 'الفحص التالي غدًا',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'نفس الحائط، نفس الأسئلة الثلاثة. الفحص الأسبوعي يوضح إذا كانت التمارين تنفع.';

  @override
  String pgRetakeBodyWait(String date) {
    return 'مارس التمارين أعلاه حتى $date، ثم أعد الفحص لترى إن نفعت.';
  }

  @override
  String get pgRetakeCheck => 'أعد الفحص';

  @override
  String get pgRetakeAnyway => 'أعد الآن';

  @override
  String get pgHistoryTitle => 'نتائجك';

  @override
  String pgSinceFirst(String delta) {
    return '$delta منذ أول فحص';
  }

  @override
  String get pgHistoryOne =>
      'هذا أول فحص لك. أعده بعد 7 أيام ويبدأ اتجاهك من هنا.';

  @override
  String get pgPostureIntroTitle => 'كم أنت مستقيم في وقفتك؟';

  @override
  String get pgPostureIntroBody =>
      'ثلاثة أسئلة على الحائط، حوالي دقيقة. تحصل على نتيجة وتمرينين يصححان كل نقطة ضعف.';

  @override
  String get pgPostureStep1 => 'قف وكعباك ووركاك ولوحا كتفيك على الحائط.';

  @override
  String get pgPostureStep2 =>
      'التقط صورة جانبية، والجسم كاملًا في الإطار، لترجع لها لاحقًا.';

  @override
  String get pgPostureStep3 =>
      'أجب عن الأسئلة الثلاثة بصدق. نتيجتك تأتي من إجاباتك.';

  @override
  String get pgPostureStep4 => 'أعده مرة في الأسبوع، في نفس الوقت من اليوم.';

  @override
  String get pgStartCheck => 'ابدأ فحص الوقفة';

  @override
  String pgWeekRange(String start, String end) {
    return 'من $start إلى $end';
  }

  @override
  String get pgGradeGreat => 'أسبوع الأبطال';

  @override
  String get pgGradeGood => 'أسبوع قوي';

  @override
  String get pgGradeOk => 'بداية الانطلاق';

  @override
  String get pgGradeStart => 'بداية جديدة';

  @override
  String get pgTopWeek => 'أفضل أسبوع';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta عن الأسبوع الماضي';
  }

  @override
  String get pgDaysCompleted => 'أيام بالخطة كاملة';

  @override
  String get pgDayStreak => 'يوم متتالي';

  @override
  String pgBestDay(String day) {
    return 'الأفضل: $day';
  }

  @override
  String get pgNextWeekFocus => 'تركيز الأسبوع القادم';

  @override
  String pgFocusPlan(int n, int done) {
    return 'أنهِ خطتك كاملة في $n أيام. هذا الأسبوع فعلتها في $done.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'أضف $n جلسات تمرين. هذا الأسبوع سوّيت $done.';
  }

  @override
  String get pgFocusMeasure =>
      'قِس طولك مرة واحدة، في الصباح، حافيًا، في نفس المكان. هكذا ترى التغيير الحقيقي.';

  @override
  String pgFocusKeepDay(String day) {
    return 'حققت كل الأهداف. الآن اجعل $day يومًا كاملًا أيضًا.';
  }

  @override
  String get pgFocusKeep =>
      'حققت كل الأهداف وكل الأيام كاملة. نفس الخطة، نفس الإيقاع.';

  @override
  String get pgHeightThisWeek => 'الطول هذا الأسبوع';

  @override
  String pgHeightNow(String height) {
    return 'الآن $height';
  }

  @override
  String get pgNoMeasurementWeek => 'لا يوجد قياس هذا الأسبوع بعد';

  @override
  String get pgFirstMeasurement => 'أول قياس لك';

  @override
  String pgStartedAt(String height) {
    return 'البداية $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'الإمكانات $height';
  }

  @override
  String pgToPotential(String cm) {
    return 'باقي $cm لإمكاناتك المتوقعة.';
  }

  @override
  String get pgPotentialReached =>
      'وصلت لإمكاناتك المتوقعة. تمارين الوقفة ما زالت تضيف لما يظهر من طولك.';

  @override
  String get pgHabitsToday => 'سُجّل اليوم';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves حركات · $minutes دقيقة';
  }

  @override
  String plDoneCount(int done, int total) {
    return '$done/$total مكتمل';
  }

  @override
  String get plStartWorkout => 'ابدأ التمرين';

  @override
  String get plContinueWorkout => 'أكمل التمرين';

  @override
  String get plWorkoutDoneToday => 'تمرين اليوم مكتمل';

  @override
  String get plTraining => 'التمرين';

  @override
  String get plHabits => 'العادات اليومية';

  @override
  String get plRestDayNote => 'يوم خفيف: جلسة يوغا قصيرة تبقيك مرنًا لبكرة.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps تكرار';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds ث';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds ث لكل جانب';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes دقيقة';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g موزعة على وجباتك';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters على مدار اليوم';
  }

  @override
  String plHabitSleep(String hours) {
    return '$hours h الليلة';
  }

  @override
  String get plYourRoutines => 'روتينك';

  @override
  String get plNewRoutine => 'روتين جديد';

  @override
  String get plCustomEmpty => 'اصنع روتينك الخاص وأنجزه هنا كل يوم.';

  @override
  String plDeleteRoutineQ(String name) {
    return 'حذف «$name»؟';
  }

  @override
  String get plHoldToDelete => 'اضغط مطولًا على أي روتين لحذفه.';

  @override
  String plSetOf(int current, int total) {
    return 'المجموعة $current من $total';
  }

  @override
  String get plRest => 'راحة';

  @override
  String get plStartSet => 'ابدأ المجموعة';

  @override
  String get plSetDone => 'انتهت المجموعة';

  @override
  String get plSkipRest => 'تخطَّ الراحة';

  @override
  String get plNextMove => 'الحركة التالية';

  @override
  String get plSkipMove => 'تخطَّ';

  @override
  String plUpNext(String name) {
    return 'التالي: $name';
  }

  @override
  String get plLastMove => 'آخر حركة';

  @override
  String get plWorkoutComplete => 'اكتمل التمرين';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves حركات في حوالي $minutes دقيقة. كل جلسة تفرق.';
  }

  @override
  String get plEachSide => 'لكل جانب';

  @override
  String get plMoveDone => 'انتهت الحركة';

  @override
  String plRepsBig(int reps) {
    return '$reps تكرار';
  }

  @override
  String get plSessionHint => 'امشِ على راحتك واضغط تم عندما تنتهي.';

  @override
  String plProgramDayOf(int day, int total) {
    return 'اليوم $day من $total';
  }

  @override
  String get plTodayStep => 'خطوة اليوم';

  @override
  String get plTickToComplete => 'أنجز كل حركة لتكمل اليوم';

  @override
  String plNextDayTomorrow(int day) {
    return 'اليوم $day يُفتح بكرة. الراحة جزء من النمو.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'باقي $days يوم',
      many: 'باقي $days يومًا',
      few: 'باقي $days أيام',
      two: 'باقي يومان',
      one: 'باقي يوم واحد',
    );
    return '$_temp0 للمستوى $level';
  }

  @override
  String get plProgramFinished => 'أكملت الـ70 يومًا كلها. أنهيت البرنامج.';

  @override
  String plDayCompleteToast(int day) {
    return 'اكتمل اليوم $day';
  }

  @override
  String get plLevelWeek => 'أسبوع هذا المستوى';

  @override
  String get plProgressionTitle => 'كيف تزيد الصعوبة';

  @override
  String get plNow => 'الآن';

  @override
  String plLevelN(int n) {
    return 'م $n';
  }

  @override
  String get plUnlockProgram => 'افتح برنامج 70 يومًا';

  @override
  String get plProgramPitch =>
      '10 مستويات، مستوى كل أسبوع. كل مستوى يضيف ثوانٍ لثباتك، وتكرارات لقفزاتك، ومجموعة عندما تكون جاهزًا.';

  @override
  String plDayLocked(int day) {
    return 'أنهِ اليوم $day أولًا';
  }

  @override
  String plCurrentDay(int day) {
    return 'اليوم $day';
  }

  @override
  String get plTodaysTargets => 'أهداف اليوم';

  @override
  String get plTargetsBasis => 'محسوبة من عمرك ووزنك وتمرينك';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals وجبات x $grams g';
  }

  @override
  String get plZinc => 'الزنك';

  @override
  String get plMagnesium => 'المغنيسيوم';

  @override
  String get plEnergy => 'الطاقة';

  @override
  String get plChecklist => 'قائمة اليوم';

  @override
  String plCheckProtein(int grams) {
    return 'بروتين $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'كالسيوم $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'فيتامين D $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return 'ماء $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '$amount من الوجبات المُنجزة';
  }

  @override
  String get plVitaminDNote =>
      '15 دقيقة من شمس الظهيرة على الذراعين والوجه، أو مكمّل يوافق عليه طبيبك';

  @override
  String plWaterLogged(String liters) {
    return 'سجّلت $liters حتى الآن';
  }

  @override
  String get plMealPlan => 'خطة وجباتك';

  @override
  String get plMealPlanSub => 'أطعمة حقيقية، غرامات حقيقية، على قد أهدافك';

  @override
  String get plSnack => 'سناك';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein g بروتين · $calcium mg كالسيوم · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return 'الهدف $grams g';
  }

  @override
  String get plMarkEaten => 'علّم كمأكول';

  @override
  String get plEaten => 'أُكلت';

  @override
  String get plPlanTotal => 'إجمالي اليوم';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'هذه الوجبات تعطيك حوالي $planKcal من $kcal kcal. أكمل الباقي بالفواكه أو الخضار أو الخبز أو الرز.';
  }

  @override
  String get plWeeklyMenu => 'القائمة الأسبوعية';

  @override
  String get plWeeklyMenuSub => 'طبق مختلف كل يوم، ونفس الأهداف';

  @override
  String get plUnlockMenu => 'افتح القائمة الأسبوعية كاملة';

  @override
  String get plRecipes => 'الوصفات';

  @override
  String get plRecipesSub => 'أطباق سريعة غنية بالبروتين';

  @override
  String get plNutritionGuide => 'دليل التغذية';

  @override
  String get plNutritionGuideSub => 'العناصر الغذائية والأطعمة والمكملات';

  @override
  String plPieces(int n) {
    return '$n حبات';
  }

  @override
  String get plFoodOats => 'شوفان';

  @override
  String get plFoodMilk => 'حليب';

  @override
  String get plFoodBanana => 'موز';

  @override
  String get plFoodWalnuts => 'جوز';

  @override
  String get plFoodGreekYogurt => 'زبادي يوناني';

  @override
  String get plFoodYogurt => 'زبادي';

  @override
  String get plFoodEggs => 'بيض';

  @override
  String get plFoodBread => 'خبز القمح الكامل';

  @override
  String get plFoodWhiteCheese => 'جبنة فيتا';

  @override
  String get plFoodHardCheese => 'جبنة شيدر';

  @override
  String get plFoodSalad => 'سلطة طماطم وخيار';

  @override
  String get plFoodOrange => 'برتقال';

  @override
  String get plFoodPeanutButter => 'زبدة فول سوداني';

  @override
  String get plFoodSpinach => 'سبانخ';

  @override
  String get plFoodCottageCheese => 'جبنة قريش';

  @override
  String get plFoodChicken => 'صدر دجاج';

  @override
  String get plFoodBulgur => 'برغل';

  @override
  String get plFoodAyran => 'لبن عيران';

  @override
  String get plFoodTuna => 'تونة (معلّبة)';

  @override
  String get plFoodPasta => 'مكرونة';

  @override
  String get plFoodBeef => 'لحم بقري قليل الدهن';

  @override
  String get plFoodRice => 'رز';

  @override
  String get plFoodChickpeas => 'حمص';

  @override
  String get plFoodSalmon => 'سلمون';

  @override
  String get plFoodBroccoli => 'بروكلي';

  @override
  String get plFoodPotato => 'بطاطس';

  @override
  String get plFoodLentils => 'عدس';

  @override
  String get plFoodSardines => 'سردين';

  @override
  String get plFoodAlmonds => 'لوز';

  @override
  String get plFoodKefir => 'كفير';

  @override
  String get plFoodPumpkinSeeds => 'بذور اليقطين';

  @override
  String get wtCoffee => 'قهوة';

  @override
  String get wtTea => 'شاي';

  @override
  String get wtCola => 'كولا';

  @override
  String get wtEnergyDrink => 'مشروب طاقة';

  @override
  String get crCustomBadge => 'خاص';

  @override
  String get crNameHint => 'مثلًا: تمدد الصباح القوي';

  @override
  String get crDoseHint => 'مثلًا: 3x10 تكرار أو 3x30 ثانية';

  @override
  String get paywallLifetime => 'مدى الحياة';

  @override
  String paywallOnce(String price) {
    return '$price مرة واحدة';
  }

  @override
  String get paywallLifetimeBadge => 'بدون اشتراك';

  @override
  String get paywallLifetimeDisclaimer =>
      'دفعة واحدة · بدون اشتراك، لا شيء يتجدد';

  @override
  String get pwSlidePotentialTitle => 'شوف إمكاناتك';

  @override
  String get pwSlidePotentialCaption => 'محسوبة من عمرك وطولك وطول والديك.';

  @override
  String get pwSlideTodayTitle => 'خطة لكل يوم';

  @override
  String get pwSlideTodayCaption => 'تمارين يومية قصيرة مع شروحات فيديو.';

  @override
  String get pwSlideProgramTitle => '70 يومًا، 10 مستويات';

  @override
  String get pwSlideProgramCaption => 'كل أسبوع تصعب الحركات قليلًا.';

  @override
  String get pwSlideNutritionTitle => 'كُل لتنمو';

  @override
  String get pwSlideNutritionCaption =>
      'أهداف يومية للبروتين والكالسيوم وفيتامين D مصممة لك.';

  @override
  String get pwSlideChartTitle => 'شوف منحناك يرتفع';

  @override
  String get pwSlideChartCaption => 'كل قياس يظهر على الطريق نحو إمكاناتك.';

  @override
  String get pwSlideScoreTitle => 'نقاط واحدة لعاداتك';

  @override
  String get pwSlideScoreCaption => 'اعرف أي عادة تصحح أولًا.';

  @override
  String get pwSlidePostureTitle => 'قف أطول اليوم';

  @override
  String get pwSlidePostureCaption => 'فحص وقفة سريع، والحركات التي تصححها.';

  @override
  String get pwExample => 'مثال';

  @override
  String pwYouLine(String now, String potential) {
    return 'أنت: $now ← الإمكانات $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return 'مثال: $now ← الإمكانات $potential';
  }

  @override
  String get tv3NewEyebrow => 'الجديد';

  @override
  String get tv3NewTitle => 'BeTaller حصل على تحديث كبير';

  @override
  String get tv3NewDesc => 'خطة جديدة، برنامج جديد، شكل جديد. هذا هو الجديد.';

  @override
  String get tv3PotentialTitle => 'هذه إمكاناتك';

  @override
  String get tv3PotentialDesc =>
      'طولك اليوم بجانب ما يمكنك الوصول إليه. والخطة تقلّص الفرق.';

  @override
  String get tv3TodayTitle => 'خطة اليوم';

  @override
  String tv3TodayDesc(String button) {
    return 'تمرين قصير مصمم لليوم. اضغط $button وتابع معه.';
  }

  @override
  String get tv3ProgramTitle => '70 يومًا من الانضباط';

  @override
  String get tv3ProgramDesc =>
      'خطوة كل يوم عبر 10 مستويات. كل يوم يُبنى على اللي قبله.';

  @override
  String get tv3NutritionTitle => 'أهدافك اليومية';

  @override
  String get tv3NutritionDesc =>
      'البروتين والكالسيوم وفيتامين D والماء، محسوبة لجسمك.';

  @override
  String get tv3ChartTitle => 'تابع منحناك';

  @override
  String get tv3ChartDesc =>
      'قِس كل أسبوع أو أسبوعين وشوف خطك يصعد نحو إمكاناتك.';

  @override
  String get tv3ScoreTitle => 'نقاط BeTaller';

  @override
  String get tv3ScoreDesc => 'رقم واحد يوضح أداءك. ارفع أضعف منطقة أولًا.';

  @override
  String get tv3Next => 'التالي';

  @override
  String get tv3ShowMe => 'ورّني';

  @override
  String get tv3Done => 'يلّا';

  @override
  String get obWhyTitle => 'ليش تبي تكون أطول؟';

  @override
  String get obWhySubtitle => 'اختر كل ما ينطبق. خطتك تبدأ من سببك.';

  @override
  String get obWhyConfidence => 'ثقة أكبر بنفسي';

  @override
  String get obWhyImpression => 'انطباع أول أقوى';

  @override
  String get obWhySports => 'أداء أفضل في الرياضة';

  @override
  String get obWhyClothes => 'الملابس تناسبني أكثر';

  @override
  String get obWhyPhotos => 'أبدو أفضل في الصور';

  @override
  String get obWhyPotential => 'فقط أبي أعرف إمكاناتي';

  @override
  String get obTriedTitle => 'جربت تطبيقات طول أخرى؟';

  @override
  String get obTriedSubtitle =>
      'ما فيه إجابة خاطئة. هذا يساعدنا نوضح لك الفرق هنا.';

  @override
  String get obTriedStopped => 'نعم، لكن توقفت';

  @override
  String get obTriedStill => 'نعم، وما زلت أستخدم واحدًا';

  @override
  String get obTriedFirst => 'لا، هذا أول تطبيق';

  @override
  String get obTriedStoppedTitle => 'الرقم وحده ما يخليك تستمر';

  @override
  String get obTriedStoppedBody =>
      'أغلب التطبيقات تعطيك رقمًا. BeTaller يحوّله لخطة يومية تنجزها، مع تذكيرات في أوقاتك.';

  @override
  String get obTriedStillTitle => 'احتفظ بما ينفعك';

  @override
  String get obTriedStillBody =>
      'BeTaller يضيف الجزء اليومي: خطة مبنية من إجاباتك تنجزها خطوة بخطوة.';

  @override
  String get obTriedFirstTitle => 'مكان ممتاز للبداية';

  @override
  String get obTriedFirstBody =>
      'هنا ما راح تحصل على رقم فقط. BeTaller يحوّل إجاباتك لخطة يومية تنجزها.';

  @override
  String get obTriedCardTitle => 'ما تنجزه كل يوم';

  @override
  String get obTriedItem1 => 'تمرين قصير مختار لأسبوعك';

  @override
  String get obTriedItem2 => 'هدف البروتين';

  @override
  String get obTriedItem3 => 'النوم في وقته';

  @override
  String get obBlockTitle => 'وش اللي يعيقك؟';

  @override
  String get obBlockSubtitle => 'اختر كل ما ينطبق. خطتك تتعامل معها.';

  @override
  String get obBlockForget => 'أنسى';

  @override
  String get obBlockTime => 'ما عندي وقت كافٍ';

  @override
  String get obBlockExercises => 'ما أعرف أي تمارين';

  @override
  String get obBlockMotivation => 'أفقد الحماس';

  @override
  String get obBlockBedtime => 'أنام متأخرًا';

  @override
  String get obBlockMeals => 'أتخطى وجبات';

  @override
  String get obFirstTitle => 'أول شيء تسويه لما تصير أطول؟';

  @override
  String get obFirstSubtitle => 'تخيّلها. هذا اللي تشتغل عشانه.';

  @override
  String get obFirstWardrobe => 'أجدد ملابسي';

  @override
  String get obFirstMuscle => 'أبني عضلات';

  @override
  String get obFirstPhotos => 'أنشر صورًا أكثر';

  @override
  String get obFirstTeam => 'أنضم لفريق';

  @override
  String get obFirstFeelGood => 'لا شيء خاص، فقط أحس بشعور حلو';

  @override
  String get obBuiltChip => 'مصمم لك';

  @override
  String get obBuiltTitle => 'خطتك، مبنية حولك';

  @override
  String get obBuiltReason => 'سببك';

  @override
  String get obBuiltGoal => 'الهدف';

  @override
  String get obBuiltWhen => 'لما توصل';

  @override
  String get obBuiltBlockers => 'ما يعيقك، تم التعامل معه';

  @override
  String get obFixForget => 'تذكيرات في الأوقات اللي اخترتها';

  @override
  String get obFixTime => 'جلسات قصيرة، أغلبها حوالي 15 دقيقة';

  @override
  String get obFixExercises => 'حركات بشرح فيديو، خطوة بخطوة';

  @override
  String get obFixMotivation => 'سلاسل ومستويات تبقيك مستمرًا';

  @override
  String get obFixBedtime => 'هدف نوم وتذكير بوقت النوم';

  @override
  String get obFixMeals => 'هدف بروتين وخطة وجبات';

  @override
  String get obNotifTitle => 'BeTaller يذكّرك في الوقت المهم';

  @override
  String get obNotifSubtitle =>
      'مضبوطة على الأوقات اللي أعطيتنا. تقدر تغيّرها متى شئت.';

  @override
  String get obNotifWorkout => 'التمرين';

  @override
  String obNotifWorkoutDetail(String time) {
    return 'قبل جلسة $time بـ30 دقيقة';
  }

  @override
  String get obNotifMeal => 'الوجبة والبروتين';

  @override
  String obNotifMealDetail(String time) {
    return 'عند وجبة $time';
  }

  @override
  String get obNotifWater => 'الماء';

  @override
  String get obNotifWaterDetail => 'استراحة ماء بعد الظهر';

  @override
  String get obNotifSleep => 'الاسترخاء';

  @override
  String obNotifSleepDetail(String time) {
    return 'قبل موعد نومك $time بساعة';
  }

  @override
  String get obNotifAllow => 'فعّل التذكيرات';

  @override
  String get obNotifNotNow => 'ليس الآن';

  @override
  String get obNotifNow => 'الآن';

  @override
  String get ftOneFree => '1 مجاني';

  @override
  String get ftFreeToday => 'مجاني اليوم';

  @override
  String get ftContinuePro => 'تابع مع Pro';

  @override
  String get ftNotNow => 'ليس الآن';

  @override
  String get ftOutWorkoutTitle => 'استخدمت تمرينك المجاني';

  @override
  String get ftOutWorkoutBody =>
      'حافظ على سلسلتك مع Pro: تمرين موجّه كل يوم، وكل حركة بتوقيتها.';

  @override
  String get ftOutDayTitle => 'انتهى يومك الأول المجاني';

  @override
  String get ftOutDayBody =>
      'خطتك وأهدافك وتقدمك تبقى هنا للقراءة. حافظ على سلسلتك مع Pro: أنجز خطتك وسجّل الماء والنوم كل يوم.';

  @override
  String get ftOutPostureTitle => 'استخدمت فحص الوقفة المجاني';

  @override
  String get ftOutPostureBody =>
      'نتيجتك تبقى هنا. افحص كل أسبوع مع Pro وشوف وقفتك تتحسن.';

  @override
  String get ftOutPhotosTitle => 'استخدمت مقارنة الصور المجانية';

  @override
  String get ftOutPhotosBody =>
      'هذه المقارنة تبقى لك. أضف صورًا أكثر وقارن أي صورتين مع Pro.';

  @override
  String get ftOutReportTitle => 'استخدمت تقريرك الأسبوعي المجاني';

  @override
  String get ftOutReportBody =>
      'احصل على ملخصك الكامل كل أسبوع مع Pro: تقييم كل يوم، وأهدافك، وشيء واحد تحسّنه.';

  @override
  String get ftOutScoreTitle => 'شاهدت تفاصيل نقاطك المجانية';

  @override
  String get ftOutScoreBody =>
      'نقاطك تبقى على الشاشة. اعرف ما يبنيها وماذا تفعل بعدها، كل يوم مع Pro.';

  @override
  String get ftOutArticleTitle => 'قرأت مقالك المجاني';

  @override
  String get ftOutArticleBody =>
      'هذا المقال يبقى مفتوحًا لك. اقرأ المكتبة كاملة مع Pro.';

  @override
  String get ftWhyWorkout => 'التمارين الموجّهة جزء من Pro';

  @override
  String get ftWhyPlan => 'إنجاز خطتك جزء من Pro';

  @override
  String get ftWhyProgram => 'برنامج 70 يومًا جزء من Pro';

  @override
  String get ftWhyWater => 'تسجيل الماء كل يوم جزء من Pro';

  @override
  String get ftWhySleep => 'تسجيل النوم كل يوم جزء من Pro';

  @override
  String get ftWhyNutrition => 'خطة تغذيتك اليومية جزء من Pro';

  @override
  String get ftWhyPosture => 'فحوصات الوقفة الأسبوعية جزء من Pro';

  @override
  String get ftWhyPhotos => 'مقارنات الصور جزء من Pro';

  @override
  String get ftWhyReport => 'تقريرك الأسبوعي جزء من Pro';

  @override
  String get ftWhyScore => 'تفاصيل نقاطك جزء من Pro';

  @override
  String get ftWhyArticle => 'المكتبة الكاملة جزء من Pro';

  @override
  String get ftPlanLocked => 'خطتك تبقى هنا للقراءة. وإنجازها جزء من Pro.';

  @override
  String get ftNutritionLocked =>
      'أهدافك ووجباتك تبقى هنا للقراءة. وإنجازها جزء من Pro.';

  @override
  String get ftPreviewTag => 'معاينة';

  @override
  String get ftPreviewTitle => 'كانت هذه معاينتك';

  @override
  String get ftPreviewBody => 'باقي هذا التمرين جزء من Pro. هذا ما يأتي بعده:';

  @override
  String get ftFreeWorkoutUsed =>
      'كان هذا تمرينك الموجّه المجاني. مع Pro يستمر كل يوم.';

  @override
  String get ftScoreLockedTitle => 'ما يبني نقاطك';

  @override
  String get ftScoreLockedBody =>
      'كل جزء من نقاطك، وعلى ماذا يعتمد، والشيء الوحيد الذي تفعله بعدها.';

  @override
  String get ftReportLockedTitle => 'أسبوعك كاملًا';

  @override
  String get ftReportLockedBody =>
      'تقييم كل يوم مقابل خطتك، وأهدافك، وطولك، وتركيز واحد للأسبوع القادم.';

  @override
  String get ftPhotosLockedTitle => 'قارن هاتين';

  @override
  String get ftPhotosLockedBody =>
      'استخدمت مقارنتك المجانية. مع Pro تقدر تتنقل بين أي صورتين.';

  @override
  String get ftArticleFreeLine => 'أول مقال مجاني. اختر اللي يعجبك.';

  @override
  String get plFinishWorkout => 'إنهاء';

  @override
  String get obTriedMostApps => 'أغلب التطبيقات';

  @override
  String get obTriedThatsIt => 'رقم، وبس.';

  @override
  String get obTriedPlanLabel => 'يومك في BeTaller';

  @override
  String get obTriedProteinSub => 'موزع على وجباتك';

  @override
  String get obTriedSleepSub => 'تذكير قبل النوم';

  @override
  String get obTriedFeatVideo => 'حركات بشرح فيديو';

  @override
  String get obTriedFeatReminders => 'تذكيرات في أوقاتك';

  @override
  String get obTriedFeatStreaks => 'سلاسل ومستويات';

  @override
  String get obBedtimeUnknown => 'ما أعرف، يختلف';

  @override
  String obBedtimeUnknownHint(String time) {
    return 'نقترح $time، حسب النوم اللي تحتاجه في عمرك. تقدر تغيّره متى شئت.';
  }

  @override
  String get obWorkoutTimeUnknown => 'ما أعرف، ما عندي وقت ثابت';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return 'نستخدم $time حاليًا. تقدر تغيّره متى شئت.';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return 'مقترح: النوم حوالي $time. غيّره متى شئت.';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return 'مقترح: التمرين حوالي $time. غيّره متى شئت.';
  }

  @override
  String get obNotifSubtitleSuggested =>
      'مضبوطة على الأوقات اللي أعطيتنا، مع اقتراح حيث لم تكن متأكدًا. تقدر تغيّرها متى شئت.';

  @override
  String get plFoodBrownRice => 'رز بني';

  @override
  String get unitHeightTitle => 'وحدة الطول';

  @override
  String get unitWeightTitle => 'وحدة الوزن';

  @override
  String get unitWaterTitle => 'وحدة الماء';

  @override
  String get unitOptCm => 'سنتيمتر';

  @override
  String get unitOptFtIn => 'قدم وبوصة';

  @override
  String get unitOptKg => 'كيلوغرام';

  @override
  String get unitOptLb => 'رطل';

  @override
  String get unitOptStLb => 'ستون ورطل';

  @override
  String get unitOptLiters => 'لتر';

  @override
  String get unitOptFlOz => 'أونصة سائلة';

  @override
  String achieveGrowthImp(String amount) {
    return 'نمو $amount';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return 'سجّل نموًا إجماليًا $amount';
  }

  @override
  String get postureBenefitIn =>
      'الرأس والكتفان وأسفل الظهر. الوقفة المستقيمة تُظهر حتى حوالي 1 in إضافية من طولك الحقيقي.';

  @override
  String get notifPostureBodyIn =>
      'ظهر مستقيم، كتفان للخلف. الوقفة الصحيحة = فرق حوالي 1 in!';

  @override
  String get painPostureDescIn =>
      'الوقفة الصحيحة قد تضيف حتى حوالي 1 in فورًا. روتين الوقفة اليومي في BeTaller يثبّت ذلك خلال أسابيع.';

  @override
  String get routinePostureDescIn =>
      'ظهر مستقيم وكتفان للخلف. افحص كل ساعة. الوقفة الصحيحة = فرق حوالي 1 in.';

  @override
  String get sciPostureCheckIn =>
      'الوقفة الصحيحة قد تضيف حوالي 1 in فورًا للطول الظاهر وتمنع ضغط العمود الفقري';

  @override
  String get routineProteinDescLb =>
      'بيض، دجاج، سمك، ألبان. 0.7 g بروتين لكل lb من وزنك يوميًا على الأقل.';

  @override
  String pwPersonalTitle(String height) {
    return 'خطتك للوصول إلى $height جاهزة';
  }

  @override
  String get pwPersonalEstimate => 'إمكانات مقدّرة من إجاباتك، وليست ضمانًا';

  @override
  String pwPersonalReason(String reason) {
    return 'سببك: $reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return 'تذكير استرخاء قبل موعد نومك $time';
  }

  @override
  String get obParentUnknown => 'ما أعرف';

  @override
  String get obParentUnknownHint =>
      'سنستخدم متوسط طول البالغين بدلًا منه. أقل دقة، وتقدر تضيفه في ملفك متى شئت.';

  @override
  String get obEthnicityWhy => 'يُستخدم فقط لتقدير طول الوالد الذي لا تعرفه.';

  @override
  String get resultNoParentNote =>
      'مقدّر بدون طول أحد الوالدين، لذلك أقل دقة. أضفه في ملفك متى شئت.';

  @override
  String get resultNoParentsNote =>
      'مقدّر بدون طول والديك، لذلك أقل دقة. أضفهما في ملفك متى شئت.';

  @override
  String get resultFootnoteEstimated =>
      'تقدير مبني على بيانات منحنيات النمو ومتوسط أطوال البالغين. ليس نصيحة طبية.';

  @override
  String get obBudgetChip => 'سعر عادل';

  @override
  String get obBudgetTitle => 'سعر BeTaller مناسب لكل مراهق يبي ينمو';

  @override
  String get obBudgetDesc =>
      'طولك ما لازم يعتمد على كم معك فلوس. لهذا السعر محدد لكل دولة على حدة.';

  @override
  String obBudgetWeek(String price) {
    return 'أسبوع Pro هنا: $price';
  }

  @override
  String get obBudgetLocalTitle => 'سعر مناسب لبلدك';

  @override
  String get obBudgetLocalDesc =>
      'مو محوّل من الدولار الأمريكي: محدد حسب الميزانيات في بلدك.';

  @override
  String get obBudgetWeekTitle => 'ابدأ بأسبوع واحد فقط';

  @override
  String get obBudgetWeekDesc =>
      'بدون دفعة كبيرة مقدمًا. ألغِ متى شئت من إعدادات Apple ID.';

  @override
  String get obBudgetAllTitle => 'كل شيء في خطة واحدة';

  @override
  String get obBudgetAllDesc => 'تمارين، نوم، تغذية، وقفة، وتقارير تقدم.';

  @override
  String get obRateTitle => 'صُمّم BeTaller ليساعدك فعلًا';

  @override
  String get obRateDesc =>
      'إذا عجبك اهتمامنا الشخصي وصدقنا، بنكون سعداء جدًا لو قيّمتنا.';

  @override
  String get obRateCta => 'قيّم BeTaller';

  @override
  String get obRateLater => 'ربما لاحقًا';
}
