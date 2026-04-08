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
      'मैंने BeTaller से अपनी विकास क्षमता जानी! आप भी आज़माएँ: https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app';

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
}
