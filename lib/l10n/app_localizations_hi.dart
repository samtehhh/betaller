// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get navHome => 'होम';

  @override
  String get navAnalysis => 'विश्लेषण';

  @override
  String get navRoutines => 'दिनचर्या';

  @override
  String get navProgress => 'प्रगति';

  @override
  String get navProfile => 'प्रोफ़ाइल';

  @override
  String greeting(String name) {
    return 'नमस्ते, $name';
  }

  @override
  String get currentHeight => 'वर्तमान ऊँचाई';

  @override
  String get target => 'लक्ष्य';

  @override
  String completed(String pct) {
    return '$pct% पूरा';
  }

  @override
  String remaining(String cm) {
    return '+$cm सेमी शेष';
  }

  @override
  String get updateAnalysis => 'विश्लेषण अपडेट करें';

  @override
  String get analysisSubtitle =>
      'पिछली ऊँचाइयों + आदतों से भविष्यवाणी प्राप्त करें';

  @override
  String get dailyRoutines => 'दैनिक दिनचर्या';

  @override
  String get allRoutinesDone => 'सभी दिनचर्या पूरी हो गईं!';

  @override
  String get water => 'पानी';

  @override
  String get sleep => 'नींद';

  @override
  String get growthSummary => 'विकास सारांश';

  @override
  String get total => 'कुल';

  @override
  String get last => 'अंतिम';

  @override
  String get measurement => 'माप';

  @override
  String get dailyTip => 'आज की सलाह';

  @override
  String get waterTracking => 'पानी ट्रैकिंग';

  @override
  String waterToday(String amount) {
    return 'आज: $amount L';
  }

  @override
  String get sleepTracking => 'नींद ट्रैकिंग';

  @override
  String sleepTarget(String hours) {
    return 'लक्ष्य: $hours घंटे';
  }

  @override
  String get hours => 'घंटे';

  @override
  String get save => 'सहेजें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get analysis => 'विश्लेषण';

  @override
  String get betallerScore => 'BeTaller स्कोर';

  @override
  String get genetic => 'आनुवंशिक';

  @override
  String get growth => 'विकास';

  @override
  String get nutrition => 'पोषण';

  @override
  String get sleepLabel => 'नींद';

  @override
  String get discipline => 'अनुशासन';

  @override
  String get improveScore => 'अपना स्कोर बढ़ाएँ';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'पोषण गंभीर!';

  @override
  String get nutritionStrengthen => 'पोषण मजबूत करें';

  @override
  String get sleepRecordAdd => 'नींद रिकॉर्ड जोड़ें';

  @override
  String get sleepPoor => 'खराब नींद शेड्यूल';

  @override
  String get sleepImprove => 'नींद सुधारें';

  @override
  String get startToday => 'आज से शुरू करें!';

  @override
  String routinesRemaining(int count) {
    return '$count दिनचर्या शेष';
  }

  @override
  String get keepStreak => 'लगातार बनाए रखें';

  @override
  String get addFirstMeasurement => 'पहला माप जोड़ें';

  @override
  String get addMeasurement => 'माप जोड़ें';

  @override
  String waterHalfNotReached(String amount) {
    return 'आपने आज अपने पानी के लक्ष्य का आधा भी पूरा नहीं किया। ${amount}L और पिएँ।';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'पानी के लक्ष्य तक पहुँचने में ${amount}L बाकी। लगभग हो गया!';
  }

  @override
  String bmiLow(String bmi) {
    return 'आपका BMI $bmi है — थोड़ा कम। प्रोटीन और कैलोरी का सेवन बढ़ाएँ।';
  }

  @override
  String bmiHigh(String bmi) {
    return 'आपका BMI $bmi है — थोड़ा अधिक। स्वस्थ खान-पान पर ध्यान दें।';
  }

  @override
  String get nutritionDefault =>
      'अपना पानी का लक्ष्य पूरा करें और संतुलित पोषण बनाए रखें।';

  @override
  String sleepNoRecord(String hours) {
    return 'आज नींद का कोई रिकॉर्ड नहीं। $hours घंटे का लक्ष्य रखें और रिकॉर्ड करें।';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'आपने आज $current घंटे सोए — $missing घंटे कम। जल्दी सोएँ!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'लगभग हो गया। $hours घंटे की नींद ग्रोथ हार्मोन को अधिकतम करेगी।';
  }

  @override
  String get sleepGood => 'बढ़िया नींद शेड्यूल! ऐसे ही जारी रखें।';

  @override
  String noRoutinesDone(int total) {
    return 'आज कोई दिनचर्या पूरी नहीं हुई। $total में से एक से शुरू करें!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return 'आज $done/$total दिनचर्या पूरी। $left और बाकी!';
  }

  @override
  String streakBuilding(int needed) {
    return 'आज बढ़िया काम! लगातार शुरू करने के लिए $needed और दिन।';
  }

  @override
  String streakContinue(int days) {
    return '$days दिन की लगातार श्रृंखला! जारी रखते हुए आपका स्कोर बढ़ता है।';
  }

  @override
  String get noMeasurements =>
      'अभी तक कोई ऊँचाई माप नहीं। सटीक भविष्यवाणी के लिए पहला जोड़ें।';

  @override
  String fewMeasurements(int count) {
    return 'विकास की गति जानने के लिए $count और माप जोड़ें।';
  }

  @override
  String goodMeasurements(int count) {
    return 'आपके पास $count माप हैं। 5 तक पहुँचने पर सटीकता काफी बढ़ेगी।';
  }

  @override
  String get keepMeasuring =>
      'माप जोड़ते रहें। हर नया डेटा भविष्यवाणी को बेहतर बनाता है।';

  @override
  String get heightPrediction => 'ऊँचाई भविष्यवाणी';

  @override
  String get predictedHeightAt21 => '21 पर अनुमानित ऊँचाई';

  @override
  String get predictionMethod =>
      'आनुवंशिक (माता-पिता), विकास गति, BMI और आयु डेटा मिलाकर गणना की गई।';

  @override
  String get growthStatus => 'विकास स्थिति';

  @override
  String get geneticGainLabel => 'आनुवंशिक लाभ';

  @override
  String get lifestyleLabel => 'जीवनशैली';

  @override
  String get geneticCeilingLabel => 'अधिकतम';

  @override
  String get reachableTargetHeight => 'आपकी प्राप्य लक्ष्य ऊंचाई';

  @override
  String get geneticCeilingProgress => 'आनुवंशिक सीमा की ओर प्रगति';

  @override
  String get completionLabel => 'पूर्णता';

  @override
  String get growthVelocity => 'विकास गति';

  @override
  String get noData => 'कोई डेटा नहीं';

  @override
  String growthRate(String rating) {
    return 'विकास दर: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'कैलोरी';

  @override
  String get kcalDay => 'kcal/दिन';

  @override
  String get daily => 'दैनिक';

  @override
  String get protein => 'प्रोटीन';

  @override
  String get minimum => 'न्यूनतम';

  @override
  String get age => 'आयु';

  @override
  String get male => 'पुरुष';

  @override
  String get female => 'महिला';

  @override
  String get yearlyPrediction => 'वार्षिक भविष्यवाणी';

  @override
  String ageYear(int age) {
    return '$age वर्ष';
  }

  @override
  String get progressTitle => 'प्रगति ट्रैकिंग';

  @override
  String get totalGrowth => 'कुल';

  @override
  String get lastDiff => 'अंतिम अंतर';

  @override
  String get measurementCount => 'माप';

  @override
  String get heightChart => 'ऊँचाई चार्ट';

  @override
  String get chartMinData => 'चार्ट के लिए कम से कम 2 माप आवश्यक हैं';

  @override
  String get chartInstruction => 'अपना प्रगति चार्ट देखने के लिए माप जोड़ें!';

  @override
  String get addMeasurementButton => 'नया माप जोड़ें';

  @override
  String get measurementHistory => 'माप इतिहास';

  @override
  String get deleteTitle => 'माप हटाएँ';

  @override
  String get deleteMessage => 'क्या आप वाकई इस माप को हटाना चाहते हैं?';

  @override
  String get dismiss => 'रद्द करें';

  @override
  String get delete => 'हटाएँ';

  @override
  String get newMeasurement => 'नया ऊँचाई माप';

  @override
  String get routines => 'दिनचर्या';

  @override
  String streakDays(int days) {
    return '$days दिन';
  }

  @override
  String get progressStatus => 'प्रगति स्थिति';

  @override
  String get completedLabel => 'पूरा हुआ!';

  @override
  String get all => 'सभी';

  @override
  String get exercise => 'व्यायाम';

  @override
  String get posture => 'मुद्रा';

  @override
  String bestStreak(int days) {
    return 'सर्वश्रेष्ठ: $days दिन';
  }

  @override
  String get editProfile => 'प्रोफ़ाइल संपादित करें';

  @override
  String get editProfileSubtitle => 'ऊँचाई, वज़न, आयु की जानकारी अपडेट करें';

  @override
  String get name => 'नाम';

  @override
  String birthDate(String date) {
    return 'जन्म: $date';
  }

  @override
  String get heightCm => 'ऊँचाई (सेमी)';

  @override
  String get weightKg => 'वज़न (किग्रा)';

  @override
  String get fatherHeight => 'पिता की ऊँचाई (सेमी)';

  @override
  String get motherHeight => 'माता की ऊँचाई (सेमी)';

  @override
  String get notifications => 'सूचनाएँ';

  @override
  String get notificationsOn => 'रिमाइंडर चालू';

  @override
  String get notificationsOff => 'रिमाइंडर बंद';

  @override
  String get premium => 'Premium में अपग्रेड करें';

  @override
  String get premiumSubtitle => 'सभी सुविधाएँ अनलॉक करें';

  @override
  String get rateUs => 'हमें रेट करें';

  @override
  String get rateSubtitle => 'ऐप पसंद आया? हमें 5 स्टार दें!';

  @override
  String get share => 'ऐप शेयर करें';

  @override
  String get shareSubtitle => 'अपने दोस्तों को BeTaller के बारे में बताएँ';

  @override
  String get shareText =>
      'मैंने BeTaller से अपनी विकास क्षमता जानी! आप भी आज़माएँ: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'फ़ीडबैक दें';

  @override
  String get feedbackSubtitle => 'हमसे संपर्क करें';

  @override
  String get resetData => 'सभी डेटा रीसेट करें';

  @override
  String get resetSubtitle => 'सभी डेटा हटा दिया जाएगा';

  @override
  String get resetTitle => 'डेटा रीसेट करें';

  @override
  String get resetMessage =>
      'सभी डेटा हटा दिया जाएगा और आप ऑनबोर्डिंग स्क्रीन पर वापस आ जाएँगे। यह पूर्ववत नहीं किया जा सकता!';

  @override
  String get reset => 'रीसेट';

  @override
  String get premiumSoon => 'Premium जल्द आ रहा है!';

  @override
  String get brandingSubtitle => 'अपनी विकास क्षमता जानें';

  @override
  String get statistics => 'आँकड़े';

  @override
  String get currentStreak => 'वर्तमान श्रृंखला';

  @override
  String get bestStreakLabel => 'सर्वश्रेष्ठ श्रृंखला';

  @override
  String get achievementLabel => 'उपलब्धि';

  @override
  String get achievements => 'उपलब्धियाँ';

  @override
  String get earned => 'अर्जित!';

  @override
  String get notEarned => 'अभी तक अर्जित नहीं';

  @override
  String get ok => 'ठीक है';

  @override
  String get language => 'भाषा';

  @override
  String get languageSubtitle => 'ऐप की भाषा बदलें';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'अपनी विकास क्षमता जानें';

  @override
  String get onboardingMeetYou => 'आइए आपको जानते हैं';

  @override
  String get onboardingInfoNeeded =>
      'विश्लेषण के लिए बुनियादी जानकारी आवश्यक है।';

  @override
  String get gender => 'लिंग';

  @override
  String get birthDateLabel => 'जन्म तिथि';

  @override
  String get bodyMeasurements => 'शारीरिक माप';

  @override
  String get bodyInfo =>
      'विश्लेषण के लिए आपकी वर्तमान ऊँचाई और वज़न आवश्यक हैं।';

  @override
  String get geneticData => 'आनुवंशिक डेटा';

  @override
  String get geneticInfo =>
      'माता-पिता की ऊँचाई आपकी आनुवंशिक क्षमता निर्धारित करती है।';

  @override
  String get pastHeights => 'पिछली ऊँचाइयाँ';

  @override
  String get pastHeightsInfo =>
      'विभिन्न आयु में याद की गई ऊँचाइयाँ दर्ज करें। खाली छोड़ सकते हैं।';

  @override
  String get heightHint => 'ऊँचाई दर्ज करें...';

  @override
  String get ageLabel => 'आयु';

  @override
  String get habits => 'आपकी आदतें';

  @override
  String get habitsInfo =>
      'आपकी जीवनशैली सीधे भविष्यवाणियों को प्रभावित करती है।';

  @override
  String get weeklyExercise => 'साप्ताहिक व्यायाम';

  @override
  String get dailySleep => 'दैनिक नींद';

  @override
  String get nutritionQuality => 'पोषण गुणवत्ता';

  @override
  String get nutritionDesc => 'प्रोटीन, डेयरी, सब्जियाँ, फल का सेवन';

  @override
  String get nutritionBad => 'बुरा';

  @override
  String get nutritionPoor => 'कमज़ोर';

  @override
  String get nutritionMedium => 'औसत';

  @override
  String get nutritionGood => 'अच्छा';

  @override
  String get nutritionGreat => 'बहुत अच्छा';

  @override
  String get startAnalysis => 'विश्लेषण शुरू करें';

  @override
  String get continueBtn => 'जारी रखें';

  @override
  String get analyzeBtn => 'विश्लेषण करें';

  @override
  String get analyzing => 'विश्लेषण हो रहा है';

  @override
  String get analysisComplete => 'पूरा हुआ!';

  @override
  String get yourScore => 'आपका BeTaller स्कोर';

  @override
  String get letsStart => 'शुरू करें';

  @override
  String get splashJourneySubtitle => 'तुम्हारी यात्रा शुरू होती है। 🚀';

  @override
  String get splashPlanSubtitle =>
      'तुम्हारी व्यक्तिगत योजना तैयार है।\nअपनी ऊंचाई की क्षमता जानने के लिए तैयार हो?';

  @override
  String get doneBtn => 'हो गया';

  @override
  String get analysisStep1 => 'आनुवंशिक डेटा का विश्लेषण हो रहा है...';

  @override
  String get analysisStep2 => 'विकास गति की गणना हो रही है...';

  @override
  String get analysisStep3 => 'पोषण और नींद डेटा प्रोसेस हो रहा है...';

  @override
  String get analysisStep4 => 'ऊँचाई भविष्यवाणी तैयार हो रही है...';

  @override
  String get analysisStep5 => 'BeTaller स्कोर की गणना हो रही है...';

  @override
  String growthPotential(String cm) {
    return '+$cm सेमी विकास क्षमता';
  }

  @override
  String get heightAt21 => '21 वर्ष की आयु में';

  @override
  String confidenceLevel(String pct) {
    return '$pct% विश्वास स्तर';
  }

  @override
  String heightRange(String min, String max) {
    return '$min - $max सेमी सीमा';
  }

  @override
  String get currentLabel => 'वर्तमान';

  @override
  String get predictedLabel => 'अनुमानित';

  @override
  String get yearlyPredictions => 'वार्षिक भविष्यवाणियाँ';

  @override
  String get tipMorningMeasure =>
      'सुबह ऊँचाई मापें - दिन में डिस्क दबाव से ऊँचाई कम होती है। सबसे सटीक माप सुबह होता है।';

  @override
  String get tipProteinSpread =>
      'प्रोटीन सेवन को भोजन में बाँटें। एक बार में सब न खाएँ, हर भोजन में प्रोटीन लें।';

  @override
  String get tipGrowthHormone =>
      'ग्रोथ हार्मोन नींद के दौरान चरम पर होता है। रात 10 बजे से 2 बजे के बीच सो जाएँ!';

  @override
  String get tipVitaminD =>
      'रोज़ 15 मिनट धूप में रहने से विटामिन D का उत्पादन बढ़ता है। विटामिन D कैल्शियम अवशोषण के लिए ज़रूरी है।';

  @override
  String get tipBarHanging =>
      'बार पर लटकने से रीढ़ की हड्डी डीकंप्रेस होती है। रोज़ 3x30 सेकंड आज़माएँ।';

  @override
  String get tipSwimming =>
      'तैराकी पूरे शरीर की कसरत और ऊँचाई बढ़ाने में सहायक सबसे अच्छा खेल है।';

  @override
  String get tipStress =>
      'तनाव ग्रोथ हार्मोन को दबाता है। ध्यान और योग से तनाव कम करें।';

  @override
  String get routineMorningStretch => 'सुबह की स्ट्रेचिंग';

  @override
  String get routineMorningStretchDesc =>
      'उठने के बाद 10 मिनट स्ट्रेचिंग करें। रीढ़ और पैर की मांसपेशियों को खींचें।';

  @override
  String get routineBarHanging => 'बार पर लटकना';

  @override
  String get routineBarHangingDesc =>
      'रीढ़ को फैलाने के लिए पुल-अप बार पर लटकें। 3 सेट x 30 सेकंड।';

  @override
  String get routineCobraStretch => 'कोबरा स्ट्रेच';

  @override
  String get routineCobraStretchDesc =>
      'पेट के बल लेटें और ऊपरी शरीर उठाएँ। रीढ़ खींचें। 3 सेट x 15 सेकंड।';

  @override
  String get routineJumping => 'कूदने के व्यायाम';

  @override
  String get routineJumpingDesc =>
      'रस्सी कूदना या स्क्वाट जंप। ग्रोथ प्लेट्स को उत्तेजित करता है। 3 सेट x 20 बार।';

  @override
  String get routineSwimming => 'तैराकी या बास्केटबॉल';

  @override
  String get routineSwimmingDesc =>
      'ऊँचाई बढ़ाने में सहायक कोई खेल खेलें। कम से कम 30 मिनट।';

  @override
  String get routineYoga => 'शाम का योग और स्ट्रेचिंग';

  @override
  String get routineYogaDesc =>
      'सोने से पहले योग और स्ट्रेचिंग। तनाव मुक्त करें, मांसपेशियों को आराम दें।';

  @override
  String get routineProtein => 'प्रोटीन सेवन';

  @override
  String get routineProteinDesc =>
      'अंडे, चिकन, मछली, डेयरी। रोज़ कम से कम 1.5g/kg प्रोटीन।';

  @override
  String get routineCalcium => 'कैल्शियम और विटामिन D';

  @override
  String get routineCalciumDesc =>
      'दूध, पनीर, दही लें। 15 मिनट धूप लें। हड्डियों के विकास के लिए ज़रूरी।';

  @override
  String get routineWater => 'पानी पीने का लक्ष्य';

  @override
  String get routineWaterDesc =>
      'रोज़ कम से कम 2-3 लीटर पानी पिएँ। चयापचय और विकास के लिए आवश्यक।';

  @override
  String get routineAvoidJunk => 'जंक फ़ूड से बचें';

  @override
  String get routineAvoidJunkDesc =>
      'फास्ट फ़ूड, मीठे पेय और प्रोसेस्ड खाद्य पदार्थों से दूर रहें।';

  @override
  String get routineSleep => 'गुणवत्ता वाली नींद (8-10 घंटे)';

  @override
  String get routineSleepDesc =>
      'ग्रोथ हार्मोन नींद में निकलता है। रात 10 बजे-सुबह 6 बजे सुनहरे घंटे हैं।';

  @override
  String get routineNoScreen => 'सोने से पहले स्क्रीन ब्रेक';

  @override
  String get routineNoScreenDesc =>
      'सोने से 1 घंटे पहले फ़ोन और कंप्यूटर रख दें। मेलाटोनिन उत्पादन को न रोकें।';

  @override
  String get routinePosture => 'मुद्रा जाँच';

  @override
  String get routinePostureDesc =>
      'पीठ सीधी रखें, कंधे पीछे। हर घंटे जाँचें। अच्छी मुद्रा = 2-3 सेमी का अंतर।';

  @override
  String get routineWallStand => 'दीवार व्यायाम';

  @override
  String get routineWallStandDesc =>
      'दीवार से पीठ लगाएँ: एड़ी, कूल्हे, कंधे, सिर दीवार से लगा हो। 5 मिनट रुकें।';

  @override
  String get routineSprintIntervals => 'स्प्रिंट इंटरवल ट्रेनिंग';

  @override
  String get routineSprintIntervalsDesc =>
      'स्प्रिंट इंटरवल ट्रेनिंग उच्च तीव्रता वाले विस्फोटों से महत्वपूर्ण ग्रोथ हार्मोन रिलीज़ को सक्रिय करती है।';

  @override
  String get routineHiitWorkout => 'HIIT वर्कआउट';

  @override
  String get routineHiitWorkoutDesc =>
      'ग्रोथ हार्मोन रिलीज़ को अधिकतम करने के लिए उच्च तीव्रता वाली इंटरवल ट्रेनिंग।';

  @override
  String get routineSquats => 'बॉडीवेट स्क्वाट्स';

  @override
  String get routineSquatsDesc =>
      'बॉडीवेट स्क्वाट्स पैरों और रीढ़ की ग्रोथ प्लेट्स को उत्तेजित करते हैं।';

  @override
  String get routineDeadliftStretch => 'डेडलिफ्ट स्ट्रेच';

  @override
  String get routineDeadliftStretchDesc =>
      'रीढ़ की हड्डी के डीकंप्रेशन और वर्टिब्रल डिस्क स्वास्थ्य के लिए डेडलिफ्ट स्ट्रेच।';

  @override
  String get routineOverheadPress => 'ओवरहेड प्रेस';

  @override
  String get routineOverheadPressDesc =>
      'ओवरहेड प्रेस रीढ़ की हड्डी को खींचता है और मुद्रा की मांसपेशियों को मजबूत करता है।';

  @override
  String get routineSkippingRope => 'रस्सी कूदना';

  @override
  String get routineSkippingRopeDesc =>
      'रस्सी से बार-बार कूदना निचले अंगों की ग्रोथ प्लेट्स को उत्तेजित करता है।';

  @override
  String get routinePilatesCore => 'पिलाटीज़ कोर';

  @override
  String get routinePilatesCoreDesc =>
      'पिलाटीज़ कोर व्यायाम रीढ़ की हड्डी के संरेखण और मुद्रा का समर्थन करते हैं।';

  @override
  String get routineInversionHang => 'उल्टा लटकना';

  @override
  String get routineInversionHangDesc =>
      'उल्टा लटकने से रीढ़ की डिस्क डीकंप्रेस होती हैं, अस्थायी रूप से 1-2 सेमी जोड़ सकता है।';

  @override
  String get routineZincIntake => 'ज़िंक से भरपूर खाद्य पदार्थ';

  @override
  String get routineZincIntakeDesc =>
      'ग्रोथ हार्मोन उत्पादन के लिए दिन भर ज़िंक से भरपूर खाद्य पदार्थ खाएँ।';

  @override
  String get routineVitaminDSunlight => 'विटामिन D और धूप';

  @override
  String get routineVitaminDSunlightDesc =>
      'विटामिन D संश्लेषण और हड्डियों की वृद्धि के लिए कम से कम 15 मिनट सीधी धूप लें।';

  @override
  String get routineArginineFoods => 'आर्जिनिन से भरपूर खाद्य पदार्थ';

  @override
  String get routineArginineFoodsDesc =>
      'ग्रोथ हार्मोन स्राव को उत्तेजित करने के लिए आर्जिनिन से भरपूर खाद्य पदार्थ खाएँ।';

  @override
  String get routineSleepEnvironment => 'नींद का वातावरण सुधारें';

  @override
  String get routineSleepEnvironmentDesc =>
      'मेलाटोनिन और ग्रोथ हार्मोन रिलीज़ को अधिकतम करने के लिए अंधेरा और ठंडा सोने का वातावरण बनाएँ।';

  @override
  String get routinePreSleepRoutine => 'सोने से पहले की दिनचर्या';

  @override
  String get routinePreSleepRoutineDesc =>
      'नियमित सोने से पहले की दिनचर्या गहरी नींद की गुणवत्ता को 23% तक बेहतर बनाती है।';

  @override
  String get routineNeckStretches => 'गर्दन की स्ट्रेचिंग';

  @override
  String get routineNeckStretchesDesc =>
      'गर्दन की स्ट्रेचिंग दबाव से राहत देती है और सर्वाइकल संरेखण में सुधार करती है।';

  @override
  String get routineShoulderRolls => 'कंधे खोलने के व्यायाम';

  @override
  String get routineShoulderRollsDesc =>
      'कंधे खोलने से आगे झुकी मुद्रा ठीक होती है, दिखने में 1-2 सेमी का अंतर हो सकता है।';

  @override
  String get achieveFirstDay => 'पहला कदम';

  @override
  String get achieveFirstDayDesc => 'अपना पहला दिन पूरा करें';

  @override
  String get achieveThreeStreak => '3 दिन की श्रृंखला';

  @override
  String get achieveThreeStreakDesc => 'लगातार 3 दिन दिनचर्या पूरी करें';

  @override
  String get achieveWeekStreak => '7 दिन की श्रृंखला';

  @override
  String get achieveWeekStreakDesc => 'लगातार 7 दिन दिनचर्या पूरी करें';

  @override
  String get achieveTwoWeekStreak => '14 दिन की श्रृंखला';

  @override
  String get achieveTwoWeekStreakDesc => 'लगातार 14 दिन जारी रखें';

  @override
  String get achieveMonthStreak => '30 दिन की श्रृंखला';

  @override
  String get achieveMonthStreakDesc => 'लगातार 30 दिन पूरे करें';

  @override
  String get achieveTwoMonthStreak => '60 दिन की श्रृंखला';

  @override
  String get achieveTwoMonthStreakDesc => 'लगातार 60 दिन पूरे करें';

  @override
  String get achieveHundredStreak => '100 दिन की श्रृंखला';

  @override
  String get achieveHundredStreakDesc => 'लगातार 100 दिन पूरे करें';

  @override
  String get achieveFirstMeasure => 'पहला माप';

  @override
  String get achieveFirstMeasureDesc => 'अपना पहला ऊँचाई माप रिकॉर्ड करें';

  @override
  String get achieveThreeMeasures => 'ट्रैकर';

  @override
  String get achieveThreeMeasuresDesc => '3 ऊँचाई माप रिकॉर्ड करें';

  @override
  String get achieveFiveMeasures => 'नियमित ट्रैकिंग';

  @override
  String get achieveFiveMeasuresDesc => '5 ऊँचाई माप रिकॉर्ड करें';

  @override
  String get achieveTenMeasures => 'डेटा शिकारी';

  @override
  String get achieveTenMeasuresDesc => '10 ऊँचाई माप रिकॉर्ड करें';

  @override
  String get achieveFirstCm => 'पहला सेंटीमीटर';

  @override
  String get achieveFirstCmDesc => 'कुल 1 सेमी विकास रिकॉर्ड करें';

  @override
  String get achieveThreeCm => '3 सेमी विकास';

  @override
  String get achieveThreeCmDesc => 'कुल 3 सेमी विकास रिकॉर्ड करें';

  @override
  String get achieveFiveCm => '5 सेमी विकास';

  @override
  String get achieveFiveCmDesc => 'कुल 5 सेमी विकास रिकॉर्ड करें';

  @override
  String get achieveTenCm => '10 सेमी विकास';

  @override
  String get achieveTenCmDesc => 'कुल 10 सेमी विकास रिकॉर्ड करें';

  @override
  String get quote1 => 'हर दिन कल से बेहतर बनें।';

  @override
  String get quote2 =>
      'विकास रातोंरात नहीं होता, लेकिन हर रात आपको करीब लाती है।';

  @override
  String get quote3 => 'विकास में धैर्य चाहिए, आगे बढ़ते रहें!';

  @override
  String get quote4 => 'आज जो कदम उठाते हैं वह कल की नींव बनाता है।';

  @override
  String get quote5 => 'अनुशासन वहाँ शुरू होता है जहाँ प्रेरणा खत्म होती है।';

  @override
  String get quote6 => 'आपका शरीर आपको धन्यवाद देगा, आगे बढ़ते रहें!';

  @override
  String get quote7 => 'अपनी क्षमता की सीमा आप खुद तय करते हैं।';

  @override
  String get quote8 => 'छोटे कदम बड़े बदलाव लाते हैं।';

  @override
  String get quote9 => 'सबसे अच्छा निवेश खुद में है।';

  @override
  String get quote10 => 'आप हर दिन अपने लक्ष्य के करीब पहुँच रहे हैं।';

  @override
  String get quote11 => 'बदलाव कठिन है, लेकिन पछतावा और भी कठिन।';

  @override
  String get quote12 => 'आपका शरीर एक मंदिर है, इसकी देखभाल करें।';

  @override
  String get quote13 => 'आपका प्रतिद्वंद्वी कल का आप है। आज उसे हराएँ!';

  @override
  String get quote14 => 'BeTaller = धैर्य + अनुशासन + विश्वास';

  @override
  String get quote15 => 'खुद पर विश्वास करें, प्रक्रिया आपको आकार देगी।';

  @override
  String get quote16 => 'आज नहीं कर सकता मत कहें, कल पछतावा मत करें।';

  @override
  String get quote17 => 'हर दिन प्रगति दिखाएँ, चाहे सिर्फ 1% ही हो।';

  @override
  String get quote18 => 'आईना आपकी प्रगति दिखाएगा, धैर्य रखें।';

  @override
  String get bmiNormal => 'सामान्य';

  @override
  String get bmiUnderweight => 'कम वज़न';

  @override
  String get bmiOverweight => 'अधिक वज़न';

  @override
  String get bmiObese => 'मोटापा';

  @override
  String get velocityExcellent => 'उत्कृष्ट';

  @override
  String get velocityNormal => 'सामान्य';

  @override
  String get velocitySlow => 'धीमा';

  @override
  String get velocityVeryLow => 'बहुत कम';

  @override
  String durationMinutes(String min) {
    return '$min मिनट';
  }

  @override
  String get durationAllDay => 'पूरा दिन';

  @override
  String get durationNight => 'रात';

  @override
  String durationHours(String hours) {
    return '$hours घंटे';
  }

  @override
  String get onboardingStep1 => 'अपनी व्यक्तिगत जानकारी दर्ज करें';

  @override
  String get onboardingStep2 => 'अपनी पिछली लंबाई साझा करें';

  @override
  String get onboardingStep3 => 'अपनी आदतों का मूल्यांकन करें';

  @override
  String get onboardingStep4 => 'अपनी भविष्यवाणी और स्कोर देखें';

  @override
  String get hoursShort => 'घंटे';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String get systemLanguage => 'सिस्टम भाषा';

  @override
  String get emailSubject => 'BeTaller प्रतिक्रिया';

  @override
  String get pastHeightsTip =>
      'अज्ञात उम्र को खाली छोड़ सकते हैं। 1-2 पिछली लंबाई दर्ज करना पर्याप्त है।';

  @override
  String get obPastHeightsTitle => 'पिछली लंबाइयाँ';

  @override
  String get obPastHeightsSubPart1 =>
      'अपनी पिछली लंबाइयाँ दर्ज करके अनुमान की विश्वसनीयता को ';

  @override
  String get obPastHeightsSubPart2 => ' तक बढ़ाएं।';

  @override
  String obHowTallAtAge(String age) {
    return '$age साल की उम्र में आपकी लंबाई कितनी थी?';
  }

  @override
  String get obSkip => 'छोड़ें';

  @override
  String get obNext => 'आगे';

  @override
  String get currentSuffix => '(वर्तमान)';

  @override
  String personalizedProtein(String amount) {
    return 'अंडे, चिकन, मछली, डेयरी। रोजाना कम से कम ${amount}g प्रोटीन लें।';
  }

  @override
  String personalizedWater(String amount) {
    return 'रोजाना कम से कम ${amount}L पानी पिएं। चयापचय और विकास के लिए आवश्यक।';
  }

  @override
  String personalizedSleep(String hours) {
    return 'नींद के दौरान ग्रोथ हार्मोन निकलता है। कम से कम $hours घंटे सोएं। रात 10-सुबह 6 सुनहरे घंटे हैं।';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'दूध, पनीर, दही का सेवन करें। 15 मिनट धूप लें। दैनिक कैलोरी लक्ष्य: $calories kcal।';
  }

  @override
  String get scoreS => 'उत्कृष्ट! आप अपनी क्षमता के शिखर पर पहुंच रहे हैं।';

  @override
  String get scoreA => 'बहुत अच्छा! छोटे सुधार आपको शीर्ष पर ले जा सकते हैं।';

  @override
  String get scoreB => 'सही रास्ते पर। रूटीन और पोषण पर थोड़ा और ध्यान दें।';

  @override
  String get scoreC => 'सुधार की गुंजाइश है। नियमित रूटीन फर्क लाएगी।';

  @override
  String get scoreD => 'उच्च क्षमता लेकिन आपको कार्रवाई करनी होगी।';

  @override
  String get scoreF => 'अभी शुरू करें! हर दिन एक छोटा कदम बड़ा फर्क लाता है।';

  @override
  String get cmPerYear => 'cm/वर्ष';

  @override
  String get howToDoIt => 'कैसे करें';

  @override
  String get musclesTargeted => 'लक्षित मांसपेशियाँ और हड्डियाँ';

  @override
  String get scientificBasis => 'वैज्ञानिक आधार';

  @override
  String setXofY(String current, String total) {
    return 'सेट $current / $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'सेट $set से पहले आराम';
  }

  @override
  String get allSetsComplete => 'सभी सेट पूरे!';

  @override
  String get setTimer => 'सेट टाइमर';

  @override
  String get setTracker => 'सेट ट्रैकर';

  @override
  String get builtInTimer => 'अंतर्निहित टाइमर';

  @override
  String get markComplete => 'पूरा चिह्नित करें';

  @override
  String get markIncomplete => 'अधूरा चिह्नित करें';

  @override
  String get done => 'हो गया';

  @override
  String get doneExclamation => 'हो गया!';

  @override
  String get start => 'शुरू';

  @override
  String get pause => 'रोकें';

  @override
  String get resetTimer => 'रीसेट';

  @override
  String get skipRest => 'आराम छोड़ें';

  @override
  String get restart => 'पुनः आरंभ';

  @override
  String get perSet => 'प्रति सेट';

  @override
  String get rest => 'आराम';

  @override
  String get reps => 'बार';

  @override
  String get difficultyBeginner => 'शुरुआती';

  @override
  String get difficultyIntermediate => 'मध्यम';

  @override
  String get difficultyAdvanced => 'उन्नत';

  @override
  String get learnTitle => 'सीखें';

  @override
  String get learnSubtitle => 'विकास के लिए वैज्ञानिक ज्ञान';

  @override
  String get categoryAll => 'सभी';

  @override
  String get categoryScience => 'विज्ञान';

  @override
  String get categoryNutrition => 'पोषण';

  @override
  String get categoryExercise => 'व्यायाम';

  @override
  String get categorySleep => 'नींद';

  @override
  String get categoryMyths => 'मिथक';

  @override
  String get scientificReferences => 'वैज्ञानिक संदर्भ';

  @override
  String get relatedRoutines => 'संबंधित दिनचर्या';

  @override
  String get nutritionTitle => 'पोषण';

  @override
  String get sectionMealPlan => 'भोजन योजना';

  @override
  String get sectionNutrients => 'पोषक तत्व';

  @override
  String get sectionFoods => 'खाद्य पदार्थ';

  @override
  String todaysPlan(String day) {
    return 'आज की योजना — $day';
  }

  @override
  String get breakfast => 'नाश्ता';

  @override
  String get lunch => 'दोपहर का भोजन';

  @override
  String get dinner => 'रात का भोजन';

  @override
  String get snacks => 'स्नैक्स';

  @override
  String get searchFoods => 'खाद्य पदार्थ खोजें...';

  @override
  String nFoods(String count) {
    return '$count खाद्य पदार्थ';
  }

  @override
  String dailyLabel(String amount) {
    return 'दैनिक: $amount';
  }

  @override
  String get dailyNeedByAge => 'आयु के अनुसार दैनिक आवश्यकता';

  @override
  String agePrefix(String range) {
    return 'आयु $range';
  }

  @override
  String get topFoodSources => 'शीर्ष खाद्य स्रोत';

  @override
  String get categoryDairy => 'डेयरी';

  @override
  String get categoryMeatFish => 'मांस और मछली';

  @override
  String get categoryVegetables => 'सब्जियाँ';

  @override
  String get categoryFruits => 'फल';

  @override
  String get categoryGrains => 'अनाज और दालें';

  @override
  String get categoryNutsSeeds => 'मेवे और बीज';

  @override
  String get weeklyReportTitle => 'साप्ताहिक रिपोर्ट';

  @override
  String get overview => 'अवलोकन';

  @override
  String get routinesLabel => 'दिनचर्या';

  @override
  String get streakLabel => 'श्रृंखला';

  @override
  String get heightLabel => 'ऊँचाई';

  @override
  String get weightLabel => 'वज़न';

  @override
  String get dadLabel => 'पिता';

  @override
  String get motherLabel => 'माँ';

  @override
  String get metricShort => 'मेट्रिक';

  @override
  String get imperialShort => 'इम्पीरियल';

  @override
  String get dailyScores => 'दैनिक अंक';

  @override
  String get waterToday2 => 'आज पानी';

  @override
  String get sleepToday => 'आज नींद';

  @override
  String get routineCompletion => 'दिनचर्या पूर्णता';

  @override
  String get xpAndLevel => 'XP और स्तर';

  @override
  String xpToNextLevel(String xp) {
    return 'अगले स्तर तक $xp XP';
  }

  @override
  String get activeChallenges => 'सक्रिय चुनौतियाँ';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m पूर्ण';
  }

  @override
  String get shareYourProgress => 'अपनी प्रगति साझा करें';

  @override
  String get shareComingSoon => 'शेयर सुविधा जल्द आ रही है!';

  @override
  String get premiumTest => 'Premium (टेस्ट)';

  @override
  String get premiumActive => 'सक्रिय';

  @override
  String get premiumFree => 'निःशुल्क';

  @override
  String get weeklyReportMenu => 'साप्ताहिक रिपोर्ट';

  @override
  String get weeklyReportMenuSubtitle => 'आपकी प्रगति का सारांश';

  @override
  String get unlockGrowthPotential => 'अपनी पूरी विकास क्षमता अनलॉक करें';

  @override
  String get featureGrowthAnalysis => 'विकास विश्लेषण और स्कोर';

  @override
  String get featureHeightPrediction => 'ऊँचाई भविष्यवाणी और पूर्वानुमान';

  @override
  String get featureAllRoutines => 'सभी 14 दैनिक दिनचर्या';

  @override
  String get featureWaterSleep => 'पानी और नींद ट्रैकिंग';

  @override
  String get featureProgress => 'प्रगति और माप';

  @override
  String get featureAchievements => 'उपलब्धियाँ और श्रृंखलाएँ';

  @override
  String get planMonthly => 'मासिक';

  @override
  String get planYearly => 'वार्षिक';

  @override
  String get bestValue => 'सबसे अच्छा मूल्य';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'स्तर $level';
  }

  @override
  String get levelBeginner => 'शुरुआती';

  @override
  String get levelStarter => 'नया';

  @override
  String get levelCommitted => 'प्रतिबद्ध';

  @override
  String get levelDedicated => 'समर्पित';

  @override
  String get levelConsistent => 'निरंतर';

  @override
  String get levelFocused => 'केंद्रित';

  @override
  String get levelDetermined => 'दृढ़';

  @override
  String get levelDisciplined => 'अनुशासित';

  @override
  String get levelStrong => 'मज़बूत';

  @override
  String get levelAdvanced => 'उन्नत';

  @override
  String get levelExpert => 'विशेषज्ञ';

  @override
  String get levelMaster => 'मास्टर';

  @override
  String get levelElite => 'विशिष्ट';

  @override
  String get levelChampion => 'चैंपियन';

  @override
  String get levelLegend => 'दिग्गज';

  @override
  String get levelTitan => 'टाइटन';

  @override
  String get levelMythic => 'पौराणिक';

  @override
  String get levelImmortal => 'अमर';

  @override
  String get levelTranscendent => 'अतीन्द्रिय';

  @override
  String get levelUltimate => 'परम';

  @override
  String get challengeCompleteAllRoutines => 'सभी दिनचर्या पूरी करें';

  @override
  String get challengeCompleteAllRoutinesDesc => 'आज हर दिनचर्या पूरी करें';

  @override
  String get challengeHydrationHero => 'हाइड्रेशन हीरो';

  @override
  String get challengeHydrationHeroDesc => 'दैनिक पानी का लक्ष्य पूरा करें';

  @override
  String get challengeEarlySleeper => 'जल्दी सोने वाला';

  @override
  String get challengeEarlySleeperDesc => '8+ घंटे की नींद रिकॉर्ड करें';

  @override
  String get challengeExerciseTrio => 'व्यायाम तिकड़ी';

  @override
  String get challengeExerciseTrioDesc => '3 व्यायाम दिनचर्या पूरी करें';

  @override
  String get challengeMorningStretch => 'सुबह की स्ट्रेचिंग';

  @override
  String get challengeMorningStretchDesc =>
      'सुबह 9 बजे से पहले स्ट्रेचिंग करें';

  @override
  String get challenge7DayWarrior => '7 दिन का योद्धा';

  @override
  String get challenge7DayWarriorDesc => 'लगातार 7 दिन सभी दिनचर्या पूरी करें';

  @override
  String get challengeGrowthTracker => 'विकास ट्रैकर';

  @override
  String get challengeGrowthTrackerDesc =>
      'इस हफ़्ते एक ऊँचाई माप रिकॉर्ड करें';

  @override
  String get challengeHydrationWeek => 'हाइड्रेशन सप्ताह';

  @override
  String get challengeHydrationWeekDesc =>
      'इस हफ़्ते 5 दिन पानी का लक्ष्य पूरा करें';

  @override
  String get challengeFitnessChampion => 'फ़िटनेस चैंपियन';

  @override
  String get challengeFitnessChampionDesc =>
      'इस हफ़्ते 15 व्यायाम दिनचर्या पूरी करें';

  @override
  String get challengeSleepMaster => 'नींद मास्टर';

  @override
  String get challengeSleepMasterDesc => '5 दिन 8+ घंटे की नींद रिकॉर्ड करें';

  @override
  String get performanceDashboard => 'प्रदर्शन डैशबोर्ड';

  @override
  String get tierA => 'स्तर A';

  @override
  String get tierB => 'स्तर B';

  @override
  String get tierC => 'स्तर C';

  @override
  String get tierD => 'स्तर D';

  @override
  String get tierE => 'स्तर E';

  @override
  String get maxTierReached => 'अधिकतम स्तर प्राप्त';

  @override
  String nextTierHint(String tier, String pts) {
    return 'अगला: $tier · +$pts अंक आवश्यक';
  }

  @override
  String get premiumBadge => 'प्रीमियम';

  @override
  String get manageRoutines => 'रूटीन प्रबंधित करें';

  @override
  String get manageRoutinesSubtitle => 'दैनिक सूची से रूटीन दिखाएं या छुपाएं';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$total में से $visible सक्रिय';
  }

  @override
  String get showAll => 'सभी दिखाएं';

  @override
  String get hideAll => 'सभी छुपाएं';

  @override
  String get heightAnalysis => 'ऊंचाई विश्लेषण';

  @override
  String get heightVsPopulation => 'वैश्विक जनसंख्या में आपकी स्थिति';

  @override
  String get globalAveragesTable => 'उम्र के अनुसार वैश्विक औसत';

  @override
  String get standingTall => 'लंबे कद का';

  @override
  String get standingAboveAverage => 'औसत से ऊपर';

  @override
  String get standingBelowAverage => 'औसत से नीचे';

  @override
  String get standingShort => 'साथियों से कम';

  @override
  String get yourHeightStanding => 'आपकी ऊंचाई की स्थिति';

  @override
  String get yourHeight => 'आप';

  @override
  String peerAvg(int age) {
    return '$age उम्र औसत';
  }

  @override
  String get aboveAvg => 'औसत से ऊपर';

  @override
  String get belowAvg => 'औसत से नीचे';

  @override
  String get whoDataSource => 'WHO 2007 वैश्विक संदर्भ';

  @override
  String get percentileShort5 => '5वां';

  @override
  String get percentileShort50 => '50वां';

  @override
  String get percentileShort95 => '95वां';

  @override
  String get youLabel => 'आप';

  @override
  String get avgHeightLabel => 'औसत';

  @override
  String get percentileLabel => 'PCT';

  @override
  String get diffLabel => 'अंतर';

  @override
  String get whoSourceNote =>
      'डेटा स्रोत: WHO 2007 विकास संदर्भ और NCD-RisC वैश्विक अनुमान। प्रतिशतक वैश्विक औसत हैं और देश के अनुसार भिन्न हो सकते हैं।';

  @override
  String get quickPhotos => 'फ़ोटो';

  @override
  String get quickPosture => 'पोस्चर';

  @override
  String get quickWellness => 'कल्याण';

  @override
  String get quickRecipes => 'रेसिपी';

  @override
  String get wellnessTitle => 'कल्याण ट्रैकर';

  @override
  String get wellnessHeader => 'कल्याण';

  @override
  String get wellnessSubtitle =>
      'आपकी वृद्धि को प्रभावित करने वाले कारकों को ट्रैक करें';

  @override
  String get caffeineToday => 'आज की कैफीन';

  @override
  String get withinLimits => 'स्वस्थ सीमा में';

  @override
  String get approachingLimit => 'सीमा के करीब';

  @override
  String get overLimit => 'सीमा से अधिक — HGH को प्रभावित करता है';

  @override
  String get resetToday => 'आज रीसेट करें';

  @override
  String get stressToday => 'आज का तनाव';

  @override
  String get stressVeryCalmLabel => 'बहुत शांत — वृद्धि के लिए आदर्श';

  @override
  String get stressCalmLabel => 'शांत';

  @override
  String get stressNeutralLabel => 'तटस्थ';

  @override
  String get stressStressedLabel => 'तनावग्रस्त';

  @override
  String get stressVeryStressedLabel =>
      'बहुत तनावग्रस्त — कोर्टिसोल HGH रोकता है';

  @override
  String get stressTapToLog => 'आज कैसा महसूस हो रहा है दर्ज करें';

  @override
  String get todaysJournal => 'आज की डायरी';

  @override
  String get journalNoNote => '(कोई नोट नहीं)';

  @override
  String get journalEdit => 'संपादित';

  @override
  String get journalHowWasToday => 'आज कैसा रहा?';

  @override
  String get journalSaved => 'डायरी सहेजी गई · +5 XP';

  @override
  String get journalSaveEntry => 'सहेजें';

  @override
  String get weeklyInsight => 'साप्ताहिक विश्लेषण';

  @override
  String get weeklyInsightCaffeine => 'कैफीन';

  @override
  String get weeklyInsightStress => 'तनाव';

  @override
  String get weeklyInsightMood => 'मनोदशा';

  @override
  String get wellnessInfoTitle => 'कल्याण क्यों मायने रखता है';

  @override
  String get wellnessInfoBody =>
      'कैफीन गहरी नींद में बाधा डालती है, जब ग्रोथ हार्मोन (HGH) सबसे अधिक निकलता है। दीर्घकालिक तनाव कोर्टिसोल बढ़ाता है, जो सीधे HGH को दबाता है। डायरी रखना वृद्धि सहायक आदतों को बनाए रखने में मदद करता है।';

  @override
  String get wellnessInfoGotIt => 'समझ गया';

  @override
  String get insightCaffeineHigh =>
      'इस सप्ताह कैफीन अधिक है। बेहतर नींद और HGH के लिए कम करें।';

  @override
  String get insightStressHigh =>
      'इस सप्ताह तनाव बढ़ा है। श्वास व्यायाम पर विचार करें — कोर्टिसोल वृद्धि रोकता है।';

  @override
  String get insightMoodLow =>
      'हाल ही में मनोदशा कम रही है। धूप, नींद और हल्का व्यायाम मदद करता है।';

  @override
  String get insightGreat =>
      'इस सप्ताह बढ़िया संतुलन। आपका कल्याण इष्टतम वृद्धि का समर्थन करता है।';

  @override
  String get insightDefault =>
      'आपका कल्याण सही दिशा में है। गहन विश्लेषण के लिए लॉगिंग जारी रखें।';

  @override
  String get insightNeedMoreData =>
      'विश्लेषण देखने के लिए कुछ और दिन लॉग करें।';

  @override
  String get progressPhotosTitle => 'प्रगति फ़ोटो';

  @override
  String get progressPhotosHeader => 'प्रगति फ़ोटो';

  @override
  String get progressPhotosSubtitle => 'अपनी दृश्य यात्रा को ट्रैक करें';

  @override
  String get addProgressPhoto => 'फ़ोटो जोड़ें';

  @override
  String get captureJourney => 'अपनी दृश्य यात्रा कैप्चर करें';

  @override
  String get takePhoto => 'फ़ोटो लें';

  @override
  String get chooseFromLibrary => 'गैलरी से चुनें';

  @override
  String get deletePhotoTitle => 'फ़ोटो हटाएं?';

  @override
  String get deletePhotoBody =>
      'यह फ़ोटो आपकी प्रगति टाइमलाइन से हटा दी जाएगी।';

  @override
  String get timelineTab => 'टाइमलाइन';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'फ़ोटो',
      one: 'फ़ोटो',
    );
    return '$_temp0';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'दिन',
      one: 'दिन',
    );
    return '$_temp0';
  }

  @override
  String get cmGained => 'सेमी वृद्धि';

  @override
  String get firstPhotoMessage =>
      'अपनी दृश्य प्रगति ट्रैक करने के लिए पहली फ़ोटो लें।';

  @override
  String get takeFirstPhoto => 'पहली फ़ोटो लें';

  @override
  String get beforeAfter => 'पहले / बाद';

  @override
  String get beforeLabel => 'पहले';

  @override
  String get afterLabel => 'बाद';

  @override
  String get yourHeightDialog => 'आपकी ऊंचाई';

  @override
  String get heightDialogMessage =>
      'इस फ़ोटो के लिए अपनी वर्तमान ऊंचाई सेमी में दर्ज करें';

  @override
  String get postureAnalysisTitle => 'पोस्चर विश्लेषण';

  @override
  String get postureCoachHeader => 'पोस्चर कोच';

  @override
  String get postureCoachSubtitle => 'AI-संचालित पोस्चर स्कोरिंग';

  @override
  String get latestScore => 'नवीनतम स्कोर';

  @override
  String get latestAnalysis => 'नवीनतम विश्लेषण';

  @override
  String get headPosition => 'सिर की स्थिति';

  @override
  String get progressLabel => 'प्रगति';

  @override
  String get choosePhotoSource => 'फ़ोटो स्रोत चुनें';

  @override
  String get sideProfileHint => 'साइड प्रोफ़ाइल, पूरा शरीर फ़्रेम में';

  @override
  String get howToTakePhoto => 'फ़ोटो कैसे लें';

  @override
  String get takePosturePhoto => 'पोस्चर फ़ोटो लें';

  @override
  String get postureExcellent => 'उत्कृष्ट';

  @override
  String get postureGood => 'अच्छा';

  @override
  String get postureNeedsWork => 'सुधार आवश्यक';

  @override
  String get posturePoor => 'कमज़ोर';

  @override
  String get recommendedExercises => 'अनुशंसित व्यायाम';

  @override
  String get postureWallStand => 'दीवार पर खड़े रहें';

  @override
  String get postureWallStandDesc =>
      'दैनिक 2 मिनट दीवार से पीठ लगाकर खड़े रहें।';

  @override
  String get postureChestOpener => 'छाती खोलना';

  @override
  String get postureChestOpenerDesc =>
      'तंग पेक्टोरल मांसपेशियों को खोलता है जो कंधों को आगे खींचती हैं।';

  @override
  String get postureChinTucks => 'ठुड्डी पीछे करना';

  @override
  String get postureChinTucksDesc =>
      'आगे की सिर की स्थिति को उलटता है — 3×10 दोहराव।';

  @override
  String get postureDeadbug => 'डेडबग';

  @override
  String get postureDeadbugDesc =>
      'लॉर्डोसिस नियंत्रण के लिए गहरे कोर को मजबूत करता है।';

  @override
  String get recipesTitle => 'रेसिपी';

  @override
  String get recipesHeader => 'रेसिपी';

  @override
  String get recipesSubtitle => 'अपनी वृद्धि को पोषित करें';

  @override
  String get recipesCategoryAll => 'सभी';

  @override
  String get recipesCategoryBreakfast => 'नाश्ता';

  @override
  String get recipesCategoryLunch => 'दोपहर का भोजन';

  @override
  String get recipesCategoryDinner => 'रात का भोजन';

  @override
  String get recipesCategorySnack => 'स्नैक';

  @override
  String get recipesGoalAll => 'सभी';

  @override
  String get recipesGoalProtein => 'उच्च प्रोटीन';

  @override
  String get recipesGoalCalcium => 'कैल्शियम';

  @override
  String get recipesGoalOmega3 => 'ओमेगा-3';

  @override
  String get recipesGoalIron => 'आयरन';

  @override
  String get recipesNoMatch => 'इन फ़िल्टर से कोई रेसिपी मेल नहीं खाती';

  @override
  String get recipesIngredients => 'सामग्री';

  @override
  String get recipesInstructions => 'निर्देश';

  @override
  String get recipesClose => 'बंद करें';

  @override
  String get recipesAboutTitle => 'रेसिपी के बारे में';

  @override
  String get recipesAboutBody =>
      'आपकी वृद्धि को पोषित करने के लिए चुनी गई रेसिपी। भोजन प्रकार या पोषण लक्ष्य के अनुसार फ़िल्टर करें।';

  @override
  String get animHintSpinalDecomp => 'रीढ़ की हड्डी का विसंपीड़न';

  @override
  String get animHintGravityReversal => 'गुरुत्वाकर्षण उलटाव';

  @override
  String get animHintImpactBones => 'हड्डियों पर प्रभाव भार';

  @override
  String get animHintHighImpact => 'उच्च प्रभाव हड्डी भार';

  @override
  String get animHintMetabolicBurst => 'मेटाबॉलिक बर्स्ट ट्रेनिंग';

  @override
  String get animHintFullBodyStretch => 'पूर्ण शरीर जागृति स्ट्रेच';

  @override
  String get animHintSpinalExtension => 'रीढ़ विस्तार';

  @override
  String get animHintCervicalDecomp => 'सर्वाइकल विसंपीड़न';

  @override
  String get animHintShoulderMobility => 'कंधे की गतिशीलता';

  @override
  String get animHintFullBodyMotion => 'पूर्ण शरीर गति';

  @override
  String get animHintPosteriorChain => 'पोस्टीरियर चेन स्ट्रेच';

  @override
  String get animHintMuscleGrowth => 'मांसपेशी वृद्धि ईंधन';

  @override
  String get animHintBoneDensity => 'हड्डी घनत्व सहायता';

  @override
  String get animHintSpinalDisc => 'स्पाइनल डिस्क हाइड्रेशन';

  @override
  String get animHintCleanNutrition => 'स्वच्छ पोषण';

  @override
  String get animHintIgf1 => 'IGF-1 अनुकूलन';

  @override
  String get animHintHghAmino => 'HGH अमीनो पूर्ववर्ती';

  @override
  String get animHintCalciumAbsorption => 'कैल्शियम अवशोषण';

  @override
  String get animHintSpinalAlignment => 'रीढ़ संरेखण';

  @override
  String get animHintPostureCorrection => 'पोस्चर सुधार';

  @override
  String get animHintMindBody => 'मन-शरीर संतुलन';

  @override
  String get animHintCoreStability => 'कोर स्थिरता';

  @override
  String get animHintLegPower => 'पैर की शक्ति और HGH उछाल';

  @override
  String get animHintVerticalPower => 'ऊर्ध्वाधर शक्ति';

  @override
  String get animHintHghSurge => 'HGH उछाल ट्रेनिंग';

  @override
  String get animHintPeakHgh => 'शिखर HGH रिलीज़ विंडो';

  @override
  String get animHintMelatonin => 'मेलाटोनिन अनुकूलन';

  @override
  String get animHintDeepSleep => 'गहरी नींद सेटअप';

  @override
  String get animHintSleepOpt => 'नींद अनुकूलन';

  @override
  String get animHintExercise => 'व्यायाम';

  @override
  String get formMorningStretch =>
      'गर्दन के चक्कर से शुरू करें, फिर पूरे शरीर की स्ट्रेचिंग पर जाएं। प्रत्येक स्ट्रेच को उछाले बिना 20-30 सेकंड तक रखें।';

  @override
  String get formBarHanging =>
      'कंधे की चौड़ाई पर बार पकड़ें, शरीर को पूरी तरह से शिथिल करें, गुरुत्वाकर्षण को आपकी रीढ़ को खींचने दें। झूलने से बचें।';

  @override
  String get formCobraStretch =>
      'पेट के बल लेटें, हाथों को कंधों के नीचे रखें, कूल्हों को जमीन पर रखते हुए धीरे-धीरे ऊपरी शरीर को उठाएं। ऊपर देखें।';

  @override
  String get formJumping =>
      'स्क्वाट जंप या रस्सी कूदें। पैरों की उंगलियों पर धीरे से उतरें। सेट के बीच 30 सेकंड आराम करें।';

  @override
  String get formSwimmingBasketball =>
      'तैराकी (फ्रीस्टाइल/बैकस्ट्रोक) या बास्केटबॉल चुनें। कूदने, पहुंचने और पूर्ण गति सीमा पर ध्यान दें।';

  @override
  String get formEveningYoga =>
      'सौम्य आसन करें: कैट-काउ, बाल मुद्रा, अधोमुख श्वान, आगे की ओर झुकाव। गहरी सांस लें और प्रत्येक आसन को 30-60 सेकंड तक रखें।';

  @override
  String get formSprintIntervals =>
      '5 मिनट गर्म करें, फिर 30 सेकंड के लिए पूरी गति से दौड़ें। ठीक होने के लिए 90 सेकंड चलें या जॉग करें। दोहराएं।';

  @override
  String get formHiitWorkout =>
      'अधिकतम तीव्रता पर 45 सेकंड के लिए बर्पीज़, माउंटेन क्लाइंबर्स और जंप स्क्वाट जैसे व्यायाम करें, 15 सेकंड आराम करें।';

  @override
  String get formSquats =>
      'पैरों को कंधे की चौड़ाई पर रखें। जांघें जमीन के समानांतर होने तक शरीर को नीचे करें। पीठ सीधी और घुटने पैर की उंगलियों के पीछे रखें।';

  @override
  String get formDeadliftStretch =>
      'पैरों को कूल्हे की चौड़ाई पर रखें, पीठ को सपाट रखते हुए कूल्हों पर झुकें। पैर की उंगलियों तक पहुंचें, हैमस्ट्रिंग और पीठ में खिंचाव महसूस करें।';

  @override
  String get formOverheadPress =>
      'सीधे खड़े हों, बाहों को सिर के ऊपर पूरी तरह फैलाकर दबाएं। हल्के वजन या शरीर के वजन का उपयोग करें। कोर तंग रखें और पीठ को झुकाने से बचें।';

  @override
  String get formSkippingRope =>
      'दोनों पैरों से कूदें, पैरों की उंगलियों पर धीरे से उतरें। कूद को कम और लगातार रखें। सेट के बीच आराम करें।';

  @override
  String get formPilatesCore =>
      'प्लैंक, डेड बग, बर्ड डॉग, ब्रिज और लेग रेज करें। नियंत्रित गति और श्वास पर ध्यान दें।';

  @override
  String get formInversionHang =>
      'इनवर्जन टेबल या ग्रेविटी बूट का उपयोग करें। थोड़ी झुकाव से शुरू करें और धीरे-धीरे बढ़ाएं। सत्र छोटे रखें।';

  @override
  String get formProtein =>
      'प्रोटीन का सेवन 3-4 भोजन में बांटें। अंडे, चिकन, मछली, डेयरी और फलियां शामिल करें।';

  @override
  String get formCalciumVitaminD =>
      'रोजाना 3 डेयरी सर्विंग लें और प्राकृतिक विटामिन D संश्लेषण के लिए 15 मिनट धूप लें।';

  @override
  String get formWater =>
      'पूरे दिन नियमित रूप से पानी पिएं। पानी की बोतल साथ रखें और घंटेवार अनुस्मारक सेट करें।';

  @override
  String get formAvoidJunk =>
      'फास्ट फूड को साबुत खाद्य पदार्थों से बदलें। मीठे पेय को पानी से बदलें। लेबल पढ़ें और प्रसंस्कृत सामग्री से बचें।';

  @override
  String get formZincIntake =>
      'आहार में लाल मांस, कद्दू के बीज, छोले, काजू और सीप शामिल करें। प्रतिदिन 8-11 मिग्रा लक्ष्य रखें।';

  @override
  String get formVitaminDSunlight =>
      'दोपहर से पहले 15 मिनट के लिए बाहों और चेहरे को सीधी धूप में रखें। इस अवधि के लिए सनस्क्रीन की जरूरत नहीं।';

  @override
  String get formArginineFoods =>
      'भोजन में मेवे, बीज, टर्की, चिकन, सोयाबीन और डेयरी शामिल करें। सोने से पहले सेवन करना सबसे अच्छा है।';

  @override
  String get formQualitySleep =>
      'रात 10 बजे तक सो जाएं। कमरे को अंधेरा और ठंडा रखें। दोपहर 2 बजे के बाद कैफीन से बचें।';

  @override
  String get formNoScreen =>
      'सोने से 1 घंटे पहले अलार्म सेट करें। सभी स्क्रीन रख दें। इसके बजाय किताब पढ़ें या हल्की स्ट्रेचिंग करें।';

  @override
  String get formSleepEnvironment =>
      'ब्लैकआउट पर्दे उपयोग करें, कमरे को 18-20°C पर रखें, सभी प्रकाश स्रोत हटाएं। आरामदायक गद्दा और तकिया उपयोग करें।';

  @override
  String get formPreSleepRoutine =>
      'सोने से 30 मिनट पहले शुरू करें: रोशनी कम करें, किताब पढ़ें, श्वास व्यायाम करें, उत्तेजक गतिविधियों से बचें।';

  @override
  String get formPostureCheck =>
      'कंधों को पीछे और नीचे रखकर सीधे खड़े हों। थोड़ा कोर सक्रिय करें। कल्पना करें कि सिर के ऊपर से एक धागा आपको ऊपर खींच रहा है।';

  @override
  String get formWallStand =>
      'एड़ियां, नितंब, कंधे के ब्लेड और सिर को दीवार से लगाकर खड़े हों। 5 मिनट तक रखें। सामान्य रूप से सांस लें।';

  @override
  String get formNeckStretches =>
      'सिर को धीरे-धीरे हर तरफ, आगे और पीछे झुकाएं। प्रत्येक दिशा को 30 सेकंड तक रखें। खिंचाव को जबरदस्ती न करें।';

  @override
  String get formShoulderRolls =>
      'कंधों को आगे 15 बार, फिर पीछे 15 बार घुमाएं। 20 सेकंड तक पकड़े हुए चेस्ट-ओपनिंग स्ट्रेच के साथ जारी रखें।';

  @override
  String get sciMorningStretch =>
      'सुबह की स्ट्रेचिंग रीढ़ की डिस्क को डीकंप्रेस करती है जो रात भर रीहाइड्रेट हुई, ऊंचाई को अधिकतम बनाए रखती है';

  @override
  String get sciBarHanging =>
      'लटकना गुरुत्वाकर्षण का उपयोग करके कशेरुकीय डिस्क को डीकंप्रेस करता है, संभावित रूप से अस्थायी ऊंचाई जोड़ता है';

  @override
  String get sciCobraStretch =>
      'कोबरा स्ट्रेच रीढ़ को फैलाता है और छाती खोलता है, बैठने से रीढ़ के संपीड़न का मुकाबला करता है';

  @override
  String get sciJumping =>
      'उच्च प्रभाव कूदना पैरों में विकास प्लेट को उत्तेजित करता है और विकास हार्मोन की रिहाई को ट्रिगर करता है';

  @override
  String get sciSwimmingBasketball =>
      'तैराकी और बास्केटबॉल में पूरे शरीर को खींचना, कूदना और पहुंचना शामिल है जो विकास प्लेट गतिविधि को उत्तेजित करता है';

  @override
  String get sciEveningYoga =>
      'शाम का योग कोर्टिसोल को कम करता है जो विकास हार्मोन को रोकता है, और रात की वसूली के लिए मांसपेशियों को खींचता है';

  @override
  String get sciSprintIntervals =>
      'दौड़ना महत्वपूर्ण विकास हार्मोन रिहाई को ट्रिगर करता है';

  @override
  String get sciHiitWorkout =>
      'उच्च तीव्रता व्यायाम HGH को 450% तक बढ़ाता है';

  @override
  String get sciSquats => 'स्क्वाट पैरों और रीढ़ में विकास प्लेट को उत्तेजित करते हैं';

  @override
  String get sciDeadliftStretch =>
      'रीढ़ की डीकंप्रेशन कशेरुकीय डिस्क स्वास्थ्य को बढ़ावा देती है';

  @override
  String get sciOverheadPress =>
      'ओवरहेड प्रेसिंग रीढ़ को खींचती है और मुद्रा मांसपेशियों को मजबूत करती है';

  @override
  String get sciSkippingRope =>
      'बार-बार कूदना निचले अंगों में विकास प्लेट को उत्तेजित करता है';

  @override
  String get sciPilatesCore =>
      'कोर शक्ति रीढ़ के संरेखण और मुद्रा का समर्थन करती है';

  @override
  String get sciInversionHang =>
      'उलटा लटकना रीढ़ की डिस्क को डीकंप्रेस करता है, अस्थायी रूप से 1-2 सेमी जोड़ सकता है';

  @override
  String get sciProtein =>
      'प्रोटीन हड्डी और मांसपेशियों की वृद्धि के लिए आवश्यक अमीनो एसिड प्रदान करता है, विशेष रूप से विकास के समय';

  @override
  String get sciCalciumVitaminD =>
      'कैल्शियम और विटामिन D हड्डी के घनत्व और रैखिक हड्डी विकास के लिए मुख्य निर्माण खंड हैं';

  @override
  String get sciWater =>
      'जलयोजन विकास प्लेट में पोषक तत्वों के परिवहन और जोड़ उपास्थि स्वास्थ्य के लिए आवश्यक है';

  @override
  String get sciAvoidJunk =>
      'प्रसंस्कृत खाद्य पदार्थ और चीनी सूजन और इंसुलिन स्पाइक का कारण बनते हैं जो विकास हार्मोन स्राव को दबाते हैं';

  @override
  String get sciZincIntake => 'जिंक विकास हार्मोन उत्पादन के लिए आवश्यक है';

  @override
  String get sciVitaminDSunlight =>
      'विटामिन D कैल्शियम अवशोषण और हड्डी विकास के लिए महत्वपूर्ण है';

  @override
  String get sciArginineFoods =>
      'L-आर्जिनिन विकास हार्मोन स्राव को उत्तेजित करता है';

  @override
  String get sciQualitySleep =>
      'दैनिक विकास हार्मोन का 70-80% गहरी नींद के चरणों के दौरान रिलीज होता है, विशेष रूप से रात 10 बजे से सुबह 2 बजे के बीच';

  @override
  String get sciNoScreen =>
      'स्क्रीन से नीली रोशनी मेलाटोनिन उत्पादन को दबाती है, नींद आने में देरी करती है और गहरी नींद की गुणवत्ता कम करती है';

  @override
  String get sciSleepEnvironment =>
      'अंधेरा, ठंडा वातावरण मेलाटोनिन और विकास हार्मोन को अधिकतम करता है';

  @override
  String get sciPreSleepRoutine =>
      'लगातार पूर्व-नींद दिनचर्या गहरी नींद की गुणवत्ता को 23% सुधारती है';

  @override
  String get sciPostureCheck =>
      'सही मुद्रा संरेखण तुरंत 2-3 सेमी ऊंचाई जोड़ सकता है और रीढ़ के संपीड़न को रोकता है';

  @override
  String get sciWallStand =>
      'दीवार स्टैंड मुद्रा मांसपेशी स्मृति को प्रशिक्षित करता है, पूरे दिन उचित रीढ़ संरेखण बनाए रखने में मदद करता है';

  @override
  String get sciNeckStretches =>
      'गर्दन की स्ट्रेचिंग संपीड़न को दूर करती है और ग्रीवा संरेखण में सुधार करती है';

  @override
  String get sciShoulderRolls =>
      'कंधे खोलना आगे की मुद्रा को ठीक करता है, दिखावे में 1-2 सेमी जोड़ सकता है';

  @override
  String get muscleSpine => 'रीढ़';

  @override
  String get muscleLegs => 'पैर';

  @override
  String get muscleBack => 'पीठ';

  @override
  String get muscleShoulders => 'कंधे';

  @override
  String get muscleArms => 'बाहें';

  @override
  String get muscleCore => 'कोर';

  @override
  String get muscleChest => 'छाती';

  @override
  String get muscleCalves => 'पिंडली';

  @override
  String get muscleFullBody => 'पूरा शरीर';

  @override
  String get muscleHips => 'कूल्हे';

  @override
  String get muscleBones => 'हड्डियां';

  @override
  String get muscleMuscles => 'मांसपेशियां';

  @override
  String get muscleNeck => 'गर्दन';

  @override
  String get muscleUpperSpine => 'ऊपरी रीढ़';

  @override
  String get muscleUpperBack => 'ऊपरी पीठ';

  @override
  String get createRoutine => 'रूटीन बनाएं';

  @override
  String get createRoutineTitle => 'कस्टम रूटीन बनाएं';

  @override
  String get createRoutineSubtitle => 'अपनी दैनिक दिनचर्या बनाएं';

  @override
  String get routineIcon => 'आइकन';

  @override
  String get routineTitleField => 'शीर्षक';

  @override
  String get routineDescField => 'विवरण';

  @override
  String get routineDescHint => 'रूटीन का संक्षिप्त सारांश';

  @override
  String get routineCategoryField => 'श्रेणी';

  @override
  String get routineDifficultyField => 'कठिनाई';

  @override
  String get routineDurationField => 'अवधि';

  @override
  String get routineSetsRepsField => 'सेट x दोहराव';

  @override
  String get routineFormField => 'निर्देश';

  @override
  String get routineFormHint => 'वैकल्पिक — यह रूटीन कैसे करें';

  @override
  String get diffBeginner => 'शुरुआती';

  @override
  String get diffIntermediate => 'मध्यम';

  @override
  String get diffAdvanced => 'उन्नत';

  @override
  String get catExercise => 'व्यायाम';

  @override
  String get catNutrition => 'पोषण';

  @override
  String get catSleep => 'नींद';

  @override
  String get catPosture => 'पोस्चर';

  @override
  String get postureTip1 => 'कैमरे की ओर बगल में (साइड प्रोफाइल) खड़े हों।';

  @override
  String get postureTip2 => 'लेंस से ~2 मीटर की दूरी बनाए रखें।';

  @override
  String get postureTip3 => 'बाहें शिथिल, सीधे आगे देखें।';

  @override
  String get postureTip4 => 'सटीक स्कोरिंग के लिए फिटिंग कपड़े पहनें।';

  @override
  String get postureTip5 => 'अच्छी रोशनी और सादी पृष्ठभूमि का उपयोग करें।';

  @override
  String get kyphosisLabel => 'किफोसिस (ऊपरी पीठ)';

  @override
  String get lordosisLabel => 'लोर्डोसिस (निचली पीठ)';

  @override
  String get analyzingPosture => 'मुद्रा का विश्लेषण';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String version(String ver) {
    return 'संस्करण $ver';
  }

  @override
  String get rateApp => 'BeTaller को रेट करें';

  @override
  String get rateAppSubtitle => 'आपकी समीक्षा हमें बढ़ने में मदद करती है!';

  @override
  String get unitSystem => 'इकाई प्रणाली';

  @override
  String get unitMetric => 'मेट्रिक (सेमी, किग्रा)';

  @override
  String get unitImperial => 'इम्पीरियल (फीट-इंच, पाउंड)';

  @override
  String get healthDisclaimer => 'स्वास्थ्य अस्वीकरण';

  @override
  String get healthDisclaimerBody =>
      'BeTaller सामान्य स्वास्थ्य और फिटनेस मार्गदर्शन प्रदान करता है। परिणाम आयु, आनुवंशिकी और व्यक्तिगत कारकों के आधार पर भिन्न होते हैं। यह ऐप चिकित्सा सलाह प्रदान नहीं करता। व्यायाम मुद्रा अनुकूलन, रीढ़ की स्वास्थ्य और प्राकृतिक आदतों के माध्यम से विकास हार्मोन समर्थन पर ध्यान केंद्रित करते हैं। कोई भी नया व्यायाम या पोषण कार्यक्रम शुरू करने से पहले स्वास्थ्य देखभाल पेशेवर से परामर्श करें। विकास प्लेट बंद होने के बाद ऊंचाई में बदलाव (आमतौर पर 18-25) मुख्य रूप से मुद्रा सुधार से होता है।';

  @override
  String get sciSourcePrefix => 'स्रोत: ';

  @override
  String get program => 'कार्यक्रम';

  @override
  String get todaysExercises => 'आज के व्यायाम';

  @override
  String get dailyNutritionPlan => 'दैनिक पोषण योजना';

  @override
  String get testimonial1 =>
      'उम्र की वजह से उम्मीद नहीं थी, लेकिन BeTaller से बढ़ा। आत्मविश्वास कभी इतना नहीं था।';

  @override
  String get testimonialDuration1 => '4 महीने';

  @override
  String get testimonial2 =>
      'सबने कहा अब नहीं बढ़ सकते। BeTaller से सबको चौंका दिया।';

  @override
  String get testimonialDuration2 => '3 महीने';

  @override
  String get testimonial3 =>
      'रूटीन शुरू करने के बाद लंबाई और पोस्चर दोनों सुधरे।';

  @override
  String get testimonialDuration3 => '6 महीने';

  @override
  String get testimonial4 =>
      'अभी ग्रोथ फेज में हूं और BeTaller का असर अविश्वसनीय है।';

  @override
  String get testimonialDuration4 => '3 महीने';

  @override
  String get testimonial5 =>
      'जल्दी ही असली फर्क महसूस किया। बिल्कुल सिफारिश करता हूं।';

  @override
  String get testimonialDuration5 => '4 महीने';

  @override
  String get designedForYou => 'आपके लिए बनाया गया';

  @override
  String get designedForYouDesc =>
      'BeTaller आपकी जेनेटिक सीमा तक पहुंचने के लिए बनाया गया है।';

  @override
  String get greetingAllDone => 'बहुत बढ़िया! 🎯';

  @override
  String get greetingAllDoneSub => 'आज के सभी कार्य पूरे हो गए।';

  @override
  String greetingStreak30(int streak) {
    return '$streak दिन की लगातार — महान स्तर।';
  }

  @override
  String greetingStreak7(int streak) {
    return '$streak दिन की लगातार — जारी रखो।';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak दिन लगातार। ज़्यादातर छोड़ देते हैं। तुमने नहीं छोड़ा।';
  }

  @override
  String get greetingMorning => 'सुप्रभात। नया दिन, नया मौका।';

  @override
  String get greetingAfternoon => 'आज लगातार शुरू करने का बढ़िया दिन है।';

  @override
  String get greetingEvening => 'कार्य पूरे करो, लगातार शुरू करो।';

  @override
  String get todayCompleted => 'आज पूरा ✓';

  @override
  String get todayGoals => 'आज के लक्ष्य';

  @override
  String get challengesLabel => 'चुनौतियाँ';

  @override
  String get dailyChallengesLabel => 'दैनिक चुनौतियाँ';

  @override
  String get expiresTonight => 'आज रात समाप्त';

  @override
  String get allChallengesCompleted => 'सभी पूरी ✓';

  @override
  String get challengesLoading => 'नई चुनौतियाँ जल्द।';

  @override
  String get challengesLoadingTitle => 'दैनिक चुनौतियाँ';

  @override
  String get behindPace => 'पीछे चल रहे हो';

  @override
  String get growthTracking => 'विकास ट्रैकिंग';

  @override
  String get growthEmptyFirst => 'पहली ऊँचाई दर्ज करें।';

  @override
  String get growthEmptySecond => 'ग्राफ के लिए दूसरा माप।';

  @override
  String get growthSectionLabel => 'विकास';

  @override
  String get generalPerformance => 'समग्र प्रदर्शन';

  @override
  String get exploreLabel => 'खोजें';

  @override
  String get explorePosture => 'पोस्चर विश्लेषण';

  @override
  String get explorePostureSub => 'पोस्चर विश्लेषण और सुझाव';

  @override
  String get explorePhotos => 'प्रगति फ़ोटो';

  @override
  String get explorePhotosSub => 'फ़ोटो से बदलाव ट्रैक करें';

  @override
  String get exploreNutrition => 'पोषण';

  @override
  String get exploreNutritionSub => 'प्रोटीन, कैल्शियम और विटामिन गाइड';

  @override
  String get exploreHealth => 'स्वास्थ्य';

  @override
  String get exploreHealthSub => 'तनाव, कैफीन और वेलनेस';

  @override
  String get exploreRecipes => 'ग्रोथ रेसिपी';

  @override
  String get exploreRecipesSub => 'विकास में मदद करने वाली रेसिपी';

  @override
  String get educationLabel => 'शिक्षा';

  @override
  String get educationTitle => 'लंबाई बढ़ने\nका विज्ञान';

  @override
  String get educationSubtitle => 'विशेषज्ञ सामग्री, शोध और गाइड';

  @override
  String get aiAnalysisLabel => 'AI विश्लेषण';

  @override
  String get peerCompareLabel => 'साथियों से तुलना';

  @override
  String peerCompareText(int topPct) {
    return 'आप Top $topPct% में हैं';
  }

  @override
  String get notifWaterTitle => '💧 पानी पीना न भूलें!';

  @override
  String get notifWaterBody => 'लक्ष्य पूरा? एक गिलास और!';

  @override
  String get notifMorningTitle => '🌅 सुप्रभात! व्यायाम';

  @override
  String get notifMorningBody => 'सुबह स्ट्रेचिंग! 10 मिनट।';

  @override
  String get notifRoutineTitle => '🔥 रूटीन पूरी करें!';

  @override
  String get notifRoutineBody => 'दिन खत्म होने से पहले जांचें।';

  @override
  String get notifProteinTitle => '🥚 प्रोटीन दिवस!';

  @override
  String get notifProteinBody => 'मजबूत शुरुआत! हर भोजन में प्रोटीन।';

  @override
  String get notifNewWeekTitle => '✨ नया सप्ताह!';

  @override
  String get notifNewWeekBody => 'रूटीन न छोड़ें। छोटे कदम!';

  @override
  String get notifSleepTitle => '😴 सोने का समय!';

  @override
  String get notifSleepBody => 'ग्रोथ हॉर्मोन 10-2 बजे चरम पर।';

  @override
  String get notifPostureTitle => '🧍 पोस्चर!';

  @override
  String get notifPostureBody => 'पीठ सीधी, कंधे पीछे। 2-3 cm!';

  @override
  String get notifVitaminDTitle => '☀️ विटामिन D!';

  @override
  String get notifVitaminDBody => '15 मिनट धूप!';

  @override
  String get notifMidweekTitle => '✨ आधा सप्ताह!';

  @override
  String get notifMidweekBody => 'जारी रखो!';

  @override
  String get notifScreenTitle => '📵 स्क्रीन बंद!';

  @override
  String get notifScreenBody => 'सोने से 1 घंटे पहले स्क्रीन से दूर।';

  @override
  String get notifJumpTitle => '🦘 कूदने का समय!';

  @override
  String get notifJumpBody => 'कूद ग्रोथ प्लेट्स उत्तेजित करती है। 3 x 20!';

  @override
  String get notifCalciumTitle => '🥛 कैल्शियम!';

  @override
  String get notifCalciumBody => 'दूध या दही। कैल्शियम ज़रूरी!';

  @override
  String get notifPostureCheckTitle => '🧍 पोस्चर!';

  @override
  String get notifPostureCheckBody => 'फोन पर गर्दन न झुकाएं!';

  @override
  String get notifWeekendTitle => '✨ वीकेंड प्रेरणा';

  @override
  String get notifWeekendBody => 'वीकेंड पर भी रूटीन!';

  @override
  String get notifWeeklyProgressTitle => '📊 साप्ताहिक प्रगति';

  @override
  String get notifWeeklyProgressBody => 'ग्राफ देखें!';

  @override
  String get notifMeasureTitle => '📏 साप्ताहिक माप!';

  @override
  String get notifMeasureBody => 'नापें! सुबह सबसे सटीक।';

  @override
  String get notifEarlySleepTitle => '😴 जल्दी सोएं!';

  @override
  String get notifEarlySleepBody => 'कल सोमवार! कम से कम 8 घंटे।';

  @override
  String get notifStreak3Title => '🔥 3 दिन लगातार!';

  @override
  String get notifStreak3Body => 'शानदार! 7 तक पहुँचो!';

  @override
  String get notifStreak7Title => '🏆 1 सप्ताह!';

  @override
  String get notifStreak7Body => 'अविश्वसनीय! 7 दिन!';

  @override
  String get notifStreak14Title => '⭐ 2 सप्ताह!';

  @override
  String get notifStreak14Body => '14 दिन अनुशासन!';

  @override
  String get notifStreak30Title => '👑 1 महीना!';

  @override
  String get notifStreak30Body => '30 दिन! चैंपियन!';

  @override
  String get notifStreak60Title => '🌟 60 दिन!';

  @override
  String get notifStreak60Body => '60 दिन! अविश्वसनीय।';

  @override
  String get notifStreak100Title => '💎 100 दिन! महान!';

  @override
  String get notifStreak100Body => '100 दिन! किंवदंती!';

  @override
  String get notifStreakRiskTitle => '⚠️ लगातार न खोएं!';

  @override
  String notifStreakRiskBody(int streak) {
    return '$streak दिन की लगातार खतरे में!';
  }

  @override
  String get paywallStat1 => 'cm — क्षमता लॉक है';

  @override
  String get paywallTitle1 => 'कितने cm\nबढ़ सकते हो?';

  @override
  String get paywallBullet1a => 'जेनेटिक सीमा गणना हो चुकी, देखना?';

  @override
  String get paywallBullet1b => 'जीवनशैली विकास को कैसे प्रभावित करती है?';

  @override
  String get paywallBullet1c => 'व्यक्तिगत रोडमैप तैयार';

  @override
  String get paywallStat2 => 'कस्टम रूटीन तैयार';

  @override
  String get paywallTitle2 => 'योजना\nतैयार है';

  @override
  String get paywallBullet2a => 'हर सुबह 8 मिनट';

  @override
  String get paywallBullet2b => 'नींद, पोषण, पानी — सब ट्रैक';

  @override
  String get paywallBullet2c => 'हर दिन एक कदम आगे';

  @override
  String get paywallStat3 => 'रियल-टाइम प्रगति ग्राफ';

  @override
  String get paywallTitle3 => 'वृद्धि\nट्रैक करें';

  @override
  String get paywallBullet3a => 'मासिक माप';

  @override
  String get paywallBullet3b => 'पोस्चर विश्लेषण से 2 cm';

  @override
  String get paywallBullet3c => 'प्रगति फ़ोटो — फर्क दिखेगा';

  @override
  String get paywallStat4 => 'दैनिक कार्यक्रम — लेवल अप';

  @override
  String get paywallTitle4 => 'हर दिन\nमजबूत';

  @override
  String get paywallBullet4a => 'XP, लेवल — आदतें खेल';

  @override
  String get paywallBullet4b => 'जो सफल हुए वो यहीं से गुज़रे';

  @override
  String get paywallBullet4c => 'शुरू करें — पहला सप्ताह मुफ्त';

  @override
  String get paywallRestore => 'कोई खरीदारी नहीं मिली';

  @override
  String get paywallRestoreNotFound => 'कोई खरीदारी नहीं मिली';

  @override
  String get paywallRestoreLabel => 'खरीदारी बहाल करें';

  @override
  String get paywallYearly => 'वार्षिक';

  @override
  String get paywallBestValue => 'सर्वोत्तम मूल्य';

  @override
  String get paywallMonthly => 'मासिक';

  @override
  String get paywallFreeTrial => '3 दिन मुफ्त';

  @override
  String get paywallLoadError => 'लोड नहीं हो सका';

  @override
  String get paywallCta => 'मुफ्त आज़माएं';

  @override
  String get paywallCtaAlt => 'जारी रखें';

  @override
  String get paywallTrialDisclaimer => '3 दिन मुफ्त · ऑटो-रिन्यू · कभी भी रद्द';

  @override
  String get paywallYearlyDisclaimer => 'वार्षिक ऑटो-रिन्यू · कभी भी रद्द';

  @override
  String get paywallTester => 'Tester';

  @override
  String get introTag1 => 'पूर्वानुमान';

  @override
  String get introTag2 => 'विकास';

  @override
  String get introTag3 => 'ट्रैकिंग';

  @override
  String get introTag4 => 'गेमिफिकेशन';

  @override
  String get introTag5 => 'समुदाय';

  @override
  String get introTitle1 => 'अपनी ऊंचाई\nक्षमता खोजें';

  @override
  String get introSubtitle1 =>
      'हमें आपकी पूरी क्षमता की गणना करने दें\nजेनेटिक्स, उम्र और जीवनशैली के आधार पर।';

  @override
  String get introTitle2 => 'हर दिन एक कदम\nऊंचे जाएं';

  @override
  String get introSubtitle2 =>
      'व्यक्तिगत व्यायाम और पोषण योजनाओं से\nअपनी क्षमता बढ़ाएं।';

  @override
  String get introTitle3 => 'हर सेंटीमीटर\nट्रैक करें';

  @override
  String get introSubtitle3 =>
      'देखें कि मासिक माप के साथ\nआपकी वास्तविक प्रगति कैसे विकसित होती है।';

  @override
  String get introTitle4 => 'लेवल अप करें,\nइनाम कमाएं';

  @override
  String get introSubtitle4 =>
      '70-दिन के कार्यक्रम पूरे करें,\nXP कमाएं और नए स्तर अनलॉक करें।';

  @override
  String get introTitle5 => 'हजारों पहले ही\nलंबे हो गए';

  @override
  String get introSubtitle5 =>
      'उन उपयोगकर्ताओं के समुदाय में शामिल हों\nजिन्होंने अपने लक्ष्य प्राप्त किए।';

  @override
  String get criticalWindow => 'महत्वपूर्ण समय';

  @override
  String get heightPotentialFading => 'तुम्हारी लंबाई की क्षमता';

  @override
  String get fadingAway => 'खत्म होती जा रही है!';

  @override
  String get painHookDesc =>
      'हर गुजरते दिन के साथ, सही आदतों के बिना सेंटीमीटर हमेशा के लिए खो जाते हैं। लेकिन इसे अभी भी बदला जा सकता है।';

  @override
  String get painGeneticTitle => 'आनुवंशिकता सब कुछ नहीं है';

  @override
  String get painGeneticDesc =>
      'आनुवंशिकता 60% निर्धारित करती है — लेकिन तुम जो करते हो वह बाकी 40% निर्धारित करता है। BeTaller ठीक उसी 40% के लिए है।';

  @override
  String get painGeneticTag => 'विश्लेषण';

  @override
  String get painSleepTitle => 'अपनी नींद की दिनचर्या को बेहतर बनाओ';

  @override
  String get painSleepDesc =>
      'हर रात अच्छी नींद विकास हार्मोन उत्पादन को 70% तक बढ़ा सकती है। BeTaller नींद की ट्रैकिंग स्वचालित करता है, तुम बस सोओ।';

  @override
  String get painSleepTag => 'ट्रैकिंग';

  @override
  String get painPostureTitle => 'मुद्रा से अभी सेंटीमीटर पाएं';

  @override
  String get painPostureDesc =>
      'सही मुद्रा तुरंत 1.5–3 सेमी जोड़ सकती है। BeTaller की दैनिक मुद्रा दिनचर्या इसे कुछ हफ्तों में स्थापित करती है।';

  @override
  String get painPostureTag => 'मुद्रा';

  @override
  String get painExerciseTitle => 'आपकी कस्टम व्यायाम योजना तैयार है';

  @override
  String get painExerciseDesc =>
      'सुबह की स्ट्रेचिंग, लटकना, रीढ़ की दिनचर्या — BeTaller ने इन्हें आपके लिए तैयार किया है। बस 8–12 मिनट प्रतिदिन।';

  @override
  String get painExerciseTag => 'दिनचर्या';

  @override
  String get painNutritionTitle => 'आपका पोषण विकास को सीधे प्रभावित करता है';

  @override
  String get painNutritionDesc =>
      'प्रोटीन, कैल्शियम, विटामिन D — BeTaller आपको हर दिन याद दिलाता है कि कौन से पोषक तत्व लेने हैं और कब।';

  @override
  String get painNutritionTag => 'पोषण';

  @override
  String get painTrackingTitle => 'अपनी आंखों से अपना विकास ट्रैक करें';

  @override
  String get painTrackingDesc =>
      'मासिक माप, प्रगति फोटो, विकास चार्ट — हर सेंटीमीटर देखें जो आप प्राप्त करते हैं।';

  @override
  String get painTrackingTag => 'प्रगति';

  @override
  String get selectYourGender => 'अपना लिंग चुनें';

  @override
  String get onboardingPredictSubtitle =>
      'इसका उपयोग आपकी ऊंचाई क्षमता का अनुमान लगाने और आपकी कस्टम योजना बनाने के लिए किया जाएगा।';

  @override
  String get other => 'अन्य';

  @override
  String get whenWereYouBorn => 'आप कब पैदा हुए?';

  @override
  String get heightAndWeight => 'ऊंचाई और वजन';

  @override
  String get parentsHeight => 'माता-पिता की ऊंचाई';

  @override
  String get weeklyWorkout => 'साप्ताहिक व्यायाम';

  @override
  String get workoutsPerWeek => 'प्रति सप्ताह वर्कआउट';

  @override
  String get whatsYourEthnicity => 'आपकी जातीयता क्या है?';

  @override
  String get whiteCaucasian => 'सफेद / कॉकेशियन';

  @override
  String get blackAfricanAmerican => 'काला / अफ्रीकी अमेरिकी';

  @override
  String get hispanicLatino => 'हिस्पैनिक / लैटिनो';

  @override
  String get asian => 'एशियाई';

  @override
  String get middleEasternIndigenous => 'मध्य पूर्वी / स्वदेशी';

  @override
  String get dontWantToAnswer => 'मैं जवाब नहीं देना चाहता';

  @override
  String get footSizeLabel => 'पैर का आकार';

  @override
  String get selectYourSize => 'अपना आकार चुनें';

  @override
  String get whatsYourDreamHeight => 'आपकी सपनों की ऊंचाई क्या है?';

  @override
  String get dreamHeightCalcSubtitle =>
      'आपके इनपुट के आधार पर, हम इस ऊंचाई को प्राप्त करने की संभावना की गणना करेंगे।';

  @override
  String get dreamHeightLabel => 'सपनों की ऊंचाई';

  @override
  String get sleepQuestion => 'आप हर रात कितने\nघंटे सोते हैं?';

  @override
  String get thousandsSucceeded => 'हजारों ने\nसफलता पाई';

  @override
  String get youCanToo => 'आप भी कर सकते हैं';

  @override
  String get yearsOld => 'साल';

  @override
  String get verifiedLabel => 'सत्यापित';

  @override
  String get scientificData => 'वैज्ञानिक डेटा';

  @override
  String get longTermResults => 'BeTaller बनाता है\nदीर्घकालिक परिणाम';

  @override
  String get longTermResultsSubtitle =>
      'बहुत से लोग बुरी आदतों के कारण अपनी अंतिम ऊंचाई नहीं पा पाते।';

  @override
  String get yourFinalHeight => 'आपकी अंतिम ऊंचाई';

  @override
  String get badHabitsLegend => 'बुरी आदतें';

  @override
  String get optimizedLegend => 'अनुकूलित';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'ऊंचाई को आदतों से\nबदला जा सकता है';

  @override
  String get chartFact2Pct => '9-10h';

  @override
  String get chartFact2Desc => 'आदर्श नींद विकास\nहार्मोन को बढ़ाती है';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'मुद्रा सुधार से\nपाया जा सकता है';

  @override
  String get didYouKnow => 'क्या आप जानते हैं?';

  @override
  String get didYouKnowFact1 => 'दैनिक आदतें आपकी ऊंचाई के 30% को प्रभावित करती हैं';

  @override
  String get didYouKnowFact2 => 'रीढ़ की हड्डी का दबाव 1.5-3 सेमी ऊंचाई चुराता है';

  @override
  String get didYouKnowFact3 => 'नींद की कमी HGH को 70% कम कर देती है';

  @override
  String get transformJourneyBegins => 'आपकी परिवर्तन\nयात्रा शुरू होती है';

  @override
  String get transformJourneySubtitle =>
      'आपके स्वस्थ विकास को समर्थन देने के लिए डिज़ाइन किया गया\nएक व्यापक कार्यक्रम, कदम दर कदम।';

  @override
  String get week1Label => '1स';

  @override
  String get week1Title => 'सप्ताह 1';

  @override
  String get week1Desc => 'रीढ़ की हड्डी का संरेखण सुधरता है, मुद्रा बेहतर होती है';

  @override
  String get month1Label => '1म';

  @override
  String get month1Title => 'महीना 1';

  @override
  String get month1Desc => 'पहले दिखाई देने वाले सेंटीमीटर, नींद की गुणवत्ता सुधरती है';

  @override
  String get month3Label => '3म';

  @override
  String get month3Title => 'महीना 3';

  @override
  String get month3Desc => 'औसत +1.5–2.5 सेमी वृद्धि, मांसपेशियों का विकास';

  @override
  String get month6Label => '6म';

  @override
  String get month6Title => 'महीना 6';

  @override
  String get month6Desc => 'अधिकतम क्षमता प्राप्त करें, अपनी नई ऊंचाई के साथ जिएं';

  @override
  String get reachYourGoal => 'अपना लक्ष्य प्राप्त करें';

  @override
  String get journeyBullet1 => 'अपनी अधिकतम क्षमता अनलॉक करें';

  @override
  String get journeyBullet2 => 'अपनी नई ऊंचाई के साथ जीना शुरू करें';

  @override
  String get journeyBullet3 => 'अपनी सफलता की कहानी लिखें';

  @override
  String get unlockButton => 'सब अनलॉक करें';

  @override
  String get dreamHeightOdds => 'सपनों की ऊंचाई\nकी संभावना';

  @override
  String get growthCompleteLabel => 'विकास\nपूर्ण';

  @override
  String get tallerThanPct => 'आपकी उम्र के 76.7% से लंबे';

  @override
  String get levelNovice => 'नौसिखिया';

  @override
  String get levelBuilder => 'निर्माता';

  @override
  String get levelGrinder => 'मेहनती';

  @override
  String get levelWarrior => 'योद्धा';

  @override
  String get levelGodTier => 'देव स्तर';

  @override
  String get levelDesc0 => 'अपनी नींव बनाओ';

  @override
  String get levelDesc1 => 'विकास तेज करो';

  @override
  String get levelDesc2 => 'प्रशिक्षण तीव्र करो';

  @override
  String get levelDesc3 => 'अपनी सीमाएं तोड़ो';

  @override
  String get levelDesc4 => 'बिना दर्द, कोई लाभ नहीं';

  @override
  String get levelDesc5 => 'चैंपियन मानसिकता';

  @override
  String get levelDesc6 => 'एलीट प्रदर्शन';

  @override
  String get levelDesc7 => 'अपने शरीर पर काबू';

  @override
  String get levelDesc8 => 'किंवदंती अनुशासन';

  @override
  String get levelDesc9 => 'अधिकतम क्षमता';

  @override
  String levelLabel(int level) {
    return 'स्तर $level';
  }

  @override
  String daysLeftProgram(int days) {
    return 'कार्यक्रम में $days दिन बाकी';
  }

  @override
  String get tapLabel => 'दबाएं';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'दिन';

  @override
  String get legendShort => 'छोटा';

  @override
  String get legendBelowAvg => 'औसत से कम';

  @override
  String get legendAverage => 'औसत';

  @override
  String get legendTall => 'लंबा';

  @override
  String get legendVeryTall => 'बहुत लंबा';

  @override
  String get pctBottom5 => 'नीचे 5%';

  @override
  String get pctBottom25 => 'नीचे 25%';

  @override
  String get pctMedian => 'मध्यिका';

  @override
  String get pctTop25 => 'ऊपर 25%';

  @override
  String get pctTop5 => 'ऊपर 5%';

  @override
  String get fallingBehind => 'पिछड़ रहे हैं';
}
