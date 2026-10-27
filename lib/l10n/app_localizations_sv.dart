// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get navHome => 'Hem';

  @override
  String get navAnalysis => 'Analys';

  @override
  String get navRoutines => 'Min plan';

  @override
  String get disciplineTitle => 'Disciplin';

  @override
  String get disciplineProgramTitle => 'Disciplinprogram';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total dagar';
  }

  @override
  String get disciplineCompleteDay => 'Slutför dagen';

  @override
  String disciplineDayN(int n) {
    return 'Dag $n';
  }

  @override
  String get disciplineLevels => 'Nivåer';

  @override
  String get disciplineLevelDone => 'Klar';

  @override
  String get disciplineLocked => 'Låst';

  @override
  String get disciplineTodayIs => 'Idag';

  @override
  String get disciplineToday => 'Idag';

  @override
  String get disciplineTodayPlan => 'Dagens plan';

  @override
  String get disciplineWeek => 'Den här veckan';

  @override
  String get disciplineMonth => 'Den här månaden';

  @override
  String get disciplineLevel => 'Disciplinnivå';

  @override
  String disciplineStreakDays(int days) {
    return '$days dagar i rad';
  }

  @override
  String disciplineToNext(int days) {
    return '$days dagar kvar till nästa nivå';
  }

  @override
  String get disciplineMaxTier => 'Högsta nivån nådd';

  @override
  String get disciplineTierSpark => 'Gnista';

  @override
  String get disciplineTierSteady => 'Stadig';

  @override
  String get disciplineTierSharp => 'Skarp';

  @override
  String get disciplineTierSolid => 'Solid';

  @override
  String get disciplineTierRelentless => 'Outtröttlig';

  @override
  String get disciplineTierUnbroken => 'Obruten';

  @override
  String get disciplineTierLegend => 'Legend';

  @override
  String get goalPerfectDays => 'Dagar med klar plan';

  @override
  String get goalWorkouts => 'Träningspass';

  @override
  String get goalMeasurement => 'Längdmätning';

  @override
  String get goalPhoto => 'Framstegsfoto';

  @override
  String get goalPostureCheck => 'Hållningskoll';

  @override
  String get disciplineAllDone => 'Dagen är klar';

  @override
  String disciplineDayProgress(int done, int total) {
    return '$done/$total klara';
  }

  @override
  String get navProgress => 'Framsteg';

  @override
  String get trackingSection => 'Dina verktyg för uppföljning';

  @override
  String get photosBenefit =>
      'Före och efter, sida vid sida. Se förändringen i stället för att läsa om den.';

  @override
  String get postureBenefit =>
      'Huvud, axlar och ländrygg. En rak hållning kan visa upp till 2–3 cm mer av din verkliga längd.';

  @override
  String get reportBenefit =>
      'Betygsätt din vecka dag för dag och se var det sprack.';

  @override
  String get photosCta => 'Lägg till foto';

  @override
  String get postureCta => 'Analysera';

  @override
  String get reportCta => 'Öppna rapporten';

  @override
  String get toolStateReady => 'Redo';

  @override
  String get photosSummaryEmpty => 'Lägg till ditt första foto';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foton',
      one: '$count foto',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => 'Ingen analys än';

  @override
  String postureSummaryScore(int score) {
    return '$score/100 hållning';
  }

  @override
  String get navProfile => 'Profil';

  @override
  String greeting(String name) {
    return 'Hej, $name';
  }

  @override
  String get currentHeight => 'Nuvarande längd';

  @override
  String get target => 'Mål';

  @override
  String completed(String pct) {
    return '$pct % klart';
  }

  @override
  String remaining(String cm, String unit) {
    return '+$cm $unit kvar';
  }

  @override
  String get updateAnalysis => 'Uppdatera analys';

  @override
  String get analysisSubtitle => 'Få prognoser från tidigare längder + vanor';

  @override
  String get dailyRoutines => 'Dagliga rutiner';

  @override
  String get allRoutinesDone => 'Alla rutiner klara!';

  @override
  String get water => 'Vatten';

  @override
  String get sleep => 'Sömn';

  @override
  String get growthSummary => 'Tillväxtöversikt';

  @override
  String get total => 'TOTALT';

  @override
  String get last => 'SENAST';

  @override
  String get measurement => 'MÄTN.';

  @override
  String get dailyTip => 'Dagens tips';

  @override
  String get waterTracking => 'Vattenintag';

  @override
  String get waterGoalReached => 'Dagsmålet nått';

  @override
  String waterRemaining(String amount) {
    return '$amount kvar';
  }

  @override
  String get undo => 'Ångra';

  @override
  String waterToday(String amount) {
    return 'Idag: $amount L';
  }

  @override
  String get sleepTracking => 'Sömnlogg';

  @override
  String sleepTarget(String hours) {
    return 'Mål: $hours timmar';
  }

  @override
  String get hours => 'timmar';

  @override
  String get save => 'Spara';

  @override
  String get cancel => 'Avbryt';

  @override
  String get analysis => 'Analys';

  @override
  String get betallerScore => 'BeTaller-poäng';

  @override
  String get genetic => 'Genetik';

  @override
  String get growth => 'Tillväxt';

  @override
  String get nutrition => 'Kost';

  @override
  String get sleepLabel => 'Sömn';

  @override
  String get discipline => 'Disciplin';

  @override
  String get improveScore => 'Höj din poäng';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Kosten är kritisk!';

  @override
  String get nutritionStrengthen => 'Stärk din kost';

  @override
  String get sleepRecordAdd => 'Logga sömn';

  @override
  String get sleepPoor => 'Dåliga sömnvanor';

  @override
  String get sleepImprove => 'Förbättra sömnen';

  @override
  String get startToday => 'Börja idag!';

  @override
  String routinesRemaining(int count) {
    return '$count rutiner kvar';
  }

  @override
  String get keepStreak => 'Håll sviten vid liv';

  @override
  String get addFirstMeasurement => 'Lägg till första mätningen';

  @override
  String get addMeasurement => 'Lägg till mätning';

  @override
  String waterHalfNotReached(String amount) {
    return 'Du har inte nått halva vattenmålet idag. Drick $amount L till.';
  }

  @override
  String waterAlmostDone(String amount) {
    return '$amount L kvar till vattenmålet. Nästan där!';
  }

  @override
  String bmiLow(String bmi) {
    return 'Ditt BMI är $bmi – lite lågt. Öka intaget av protein och kalorier.';
  }

  @override
  String get bodyFactsTitle => 'Din kropp';

  @override
  String get dailyNeedsTitle => 'Dina dagliga mål';

  @override
  String bmiHigh(String bmi) {
    return 'Ditt BMI är $bmi – lite högt. Fokusera på hälsosam mat.';
  }

  @override
  String get nutritionDefault => 'Nå ditt vattenmål och ät en balanserad kost.';

  @override
  String sleepNoRecord(String hours) {
    return 'Ingen sömn loggad idag. Sikta på $hours timmar och logga dem.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Du sov $current timmar idag – $missing timmar för lite. Gå och lägg dig tidigare!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Nästan där. $hours timmar ger mest tillväxthormon.';
  }

  @override
  String get sleepGood => 'Grymma sömnvanor! Fortsätt så.';

  @override
  String noRoutinesDone(int total) {
    return 'Inga rutiner klara idag. Börja med en av $total!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '$done/$total rutiner klara idag. $left kvar!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Bra jobbat idag! $needed dagar till för att starta en svit.';
  }

  @override
  String streakContinue(int days) {
    return '$days dagar i rad! Din poäng stiger när du fortsätter.';
  }

  @override
  String get noMeasurements =>
      'Inga längdmätningar än. Lägg till din första för säkrare prognoser.';

  @override
  String fewMeasurements(int count) {
    return 'Lägg till $count mätningar till för att räkna ut tillväxttakten.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Du har $count mätningar. Med 5 blir prognosen mycket säkrare.';
  }

  @override
  String get keepMeasuring =>
      'Fortsätt lägga till mätningar. Varje ny datapunkt förbättrar prognoserna.';

  @override
  String get heightPrediction => 'Längdprognos';

  @override
  String get predictedHeightAt21 => 'Beräknad längd vid 21';

  @override
  String get predictionMethod =>
      'Beräknas genom att kombinera genetik (föräldrar), tillväxttakt, BMI och ålder.';

  @override
  String get growthStatus => 'Tillväxtstatus';

  @override
  String get growthRemaining => 'Kvar att växa';

  @override
  String get growthBreakdown => 'Var centimetrarna kommer ifrån';

  @override
  String get geneticGainLabel => 'Genetiskt bidrag';

  @override
  String get lifestyleLabel => 'Livsstil';

  @override
  String get geneticCeilingLabel => 'Tak';

  @override
  String get reachableTargetHeight => 'Din nåbara mållängd';

  @override
  String get geneticCeilingProgress => 'Framsteg mot det genetiska taket';

  @override
  String get completionLabel => 'FRAMSTEG';

  @override
  String get growthVelocity => 'TILLVÄXTTAKT';

  @override
  String get noData => 'INGA DATA';

  @override
  String growthRate(String rating) {
    return 'Tillväxttakt: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'Kalorier';

  @override
  String get kcalDay => 'kcal/dag';

  @override
  String get daily => 'dagligen';

  @override
  String get protein => 'Protein';

  @override
  String get minimum => 'minst';

  @override
  String get age => 'Ålder';

  @override
  String get male => 'Kille';

  @override
  String get female => 'Tjej';

  @override
  String get yearlyPrediction => 'PROGNOS PER ÅR';

  @override
  String ageYear(int age) {
    return '$age år';
  }

  @override
  String get progressTitle => 'Framstegsuppföljning';

  @override
  String get totalGrowth => 'Totalt';

  @override
  String get lastDiff => 'Senaste diff';

  @override
  String get measurementCount => 'Mätn.';

  @override
  String get heightChart => 'Längddiagram';

  @override
  String get chartMinData => 'Minst 2 mätningar behövs för diagrammet';

  @override
  String get chartInstruction =>
      'Lägg till mätningar för att se ditt framstegsdiagram!';

  @override
  String get addMeasurementButton => 'LÄGG TILL MÄTNING';

  @override
  String get measurementHistory => 'MÄTHISTORIK';

  @override
  String get deleteTitle => 'Radera mätning';

  @override
  String get deleteMessage => 'Vill du verkligen radera den här mätningen?';

  @override
  String get dismiss => 'Avbryt';

  @override
  String get delete => 'Radera';

  @override
  String get newMeasurement => 'Ny längdmätning';

  @override
  String get routines => 'Rutiner';

  @override
  String streakDays(int days) {
    return '$days dagar';
  }

  @override
  String get progressStatus => 'Framstegsstatus';

  @override
  String get completedLabel => 'Klart!';

  @override
  String get all => 'Alla';

  @override
  String get exercise => 'Träning';

  @override
  String get posture => 'Hållning';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '$days dag',
    );
    return 'Bästa: $_temp0';
  }

  @override
  String get editProfile => 'Redigera profil';

  @override
  String get editProfileSubtitle => 'Uppdatera längd, vikt och ålder';

  @override
  String get name => 'Namn';

  @override
  String birthDate(String date) {
    return 'Född: $date';
  }

  @override
  String get heightCm => 'Längd (cm)';

  @override
  String get weightKg => 'Vikt (kg)';

  @override
  String get fatherHeight => 'Pappas längd (cm)';

  @override
  String get motherHeight => 'Mammas längd (cm)';

  @override
  String get notifications => 'Notiser';

  @override
  String get reminderNextLabel => 'Nästa påminnelse';

  @override
  String get reminderManageHint => 'Hantera dina påminnelser';

  @override
  String get reminderOffCta => 'Slå på notiser';

  @override
  String get stateOn => 'På';

  @override
  String get stateOff => 'Av';

  @override
  String get reminderMasterTitle => 'Notiser';

  @override
  String reminderActiveCount(int count) {
    return '$count påminnelser på';
  }

  @override
  String get reminderBuiltIn => 'Inbyggda påminnelser';

  @override
  String get reminderYourOwn => 'Egna påminnelser';

  @override
  String get reminderAdd => 'Lägg till påminnelse';

  @override
  String get reminderDays => 'Dagar';

  @override
  String get reminderEveryDay => 'Varje dag';

  @override
  String get reminderLabelHint => 'Vad ska vi påminna dig om?';

  @override
  String get reminderEmptyHint =>
      'Lägg till egna: träning, vitaminer, stretching – vad du än behöver.';

  @override
  String get reminderCustom => 'Påminnelse';

  @override
  String get reminderCustomBody => 'Tiden du ställde in är här.';

  @override
  String get reminderExercise => 'Träning';

  @override
  String get reminderNutrition => 'Kost';

  @override
  String get reminderWater => 'Vatten';

  @override
  String get reminderPosture => 'Hållning';

  @override
  String get reminderRoutine => 'Daglig rutin';

  @override
  String get reminderSleep => 'Sömn';

  @override
  String get reminderMeasurement => 'Längdmätning';

  @override
  String get notificationsOn => 'Påminnelser på';

  @override
  String get notificationsOff => 'Påminnelser av';

  @override
  String get premium => 'Uppgradera till Premium';

  @override
  String get premiumSubtitle => 'Lås upp alla funktioner';

  @override
  String get rateUs => 'Betygsätt oss';

  @override
  String get rateSubtitle => 'Gillar du appen? Ge oss 5 stjärnor!';

  @override
  String get share => 'Dela appen';

  @override
  String get shareSubtitle => 'Berätta om BeTaller för dina vänner';

  @override
  String get shareText =>
      'Jag upptäckte min tillväxtpotential med BeTaller! Testa du också: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'Ge feedback';

  @override
  String get feedbackSubtitle => 'Kontakta oss';

  @override
  String get resetData => 'Återställ all data';

  @override
  String get resetSubtitle => 'All data raderas';

  @override
  String get resetTitle => 'Återställ data';

  @override
  String get resetMessage =>
      'All data raderas och du kommer tillbaka till introduktionen. Det går inte att ångra!';

  @override
  String get reset => 'Återställ';

  @override
  String get premiumSoon => 'Premium kommer snart!';

  @override
  String get brandingSubtitle => 'Upptäck din tillväxtpotential';

  @override
  String get statistics => 'Statistik';

  @override
  String get profileGroupSupport => 'Support';

  @override
  String get profileGroupAccount => 'Konto';

  @override
  String get profileGroupApp => 'App';

  @override
  String get profileGroupDanger => 'Riskzon';

  @override
  String profileMemberSince(String date) {
    return 'Sedan $date';
  }

  @override
  String get profileYourJourney => 'Din resa';

  @override
  String get profileTotalGrowth => 'Totalt';

  @override
  String get currentStreak => 'Nuvarande svit';

  @override
  String get bestStreakLabel => 'Bästa svit';

  @override
  String get achievementLabel => 'Utmärkelse';

  @override
  String get achievements => 'Utmärkelser';

  @override
  String get achievementUnlockedTitle => '🏆 Utmärkelse upplåst!';

  @override
  String get reminderTapHint => 'Tryck på en för att ändra tid och dagar';

  @override
  String get earned => 'Upplåst!';

  @override
  String get notEarned => 'Inte upplåst än';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Språk';

  @override
  String get languageSubtitle => 'Byt språk i appen';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Upptäck din tillväxtpotential';

  @override
  String get onboardingMeetYou => 'Vi lär känna dig';

  @override
  String get onboardingInfoNeeded => 'Grundinfo som behövs för analysen.';

  @override
  String get gender => 'KÖN';

  @override
  String get birthDateLabel => 'FÖDELSEDATUM';

  @override
  String get bodyMeasurements => 'Kroppsmått';

  @override
  String get bodyInfo => 'Din nuvarande längd och vikt behövs för analysen.';

  @override
  String get geneticData => 'Genetiska data';

  @override
  String get geneticInfo => 'Föräldrarnas längd avgör din genetiska potential.';

  @override
  String get pastHeights => 'Tidigare längder';

  @override
  String get pastHeightsInfo =>
      'Ange längder du minns från olika åldrar. Du kan lämna tomt.';

  @override
  String get heightHint => 'Ange längd...';

  @override
  String get ageLabel => 'ålder';

  @override
  String get habits => 'Dina vanor';

  @override
  String get habitsInfo => 'Din livsstil påverkar prognoserna direkt.';

  @override
  String get weeklyExercise => 'Träning per vecka';

  @override
  String get dailySleep => 'Sömn per natt';

  @override
  String get nutritionQuality => 'KOSTENS KVALITET';

  @override
  String get nutritionDesc =>
      'Intag av protein, mejeriprodukter, grönsaker och frukt';

  @override
  String get nutritionBad => 'Dålig';

  @override
  String get nutritionPoor => 'Svag';

  @override
  String get nutritionMedium => 'Medel';

  @override
  String get nutritionGood => 'Bra';

  @override
  String get nutritionGreat => 'Toppen';

  @override
  String get startAnalysis => 'Starta analys';

  @override
  String get continueBtn => 'Fortsätt';

  @override
  String get analyzeBtn => 'Analysera';

  @override
  String get analyzing => 'Analyserar';

  @override
  String get analysisComplete => 'Klart!';

  @override
  String get analysisDataReceivedTitle => 'Data mottagna';

  @override
  String get analysisDataReceivedSubtitle => 'Din analys startar...';

  @override
  String get yourScore => 'Din BeTaller-poäng';

  @override
  String get letsStart => 'Nu kör vi';

  @override
  String get splashJourneySubtitle => 'Din resa börjar. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Din personliga plan är klar.\nRedo att upptäcka din längdpotential?';

  @override
  String get doneBtn => 'Klar';

  @override
  String get analysisStep1 => 'Analyserar genetiska data...';

  @override
  String get analysisStep2 => 'Beräknar tillväxttakt...';

  @override
  String get analysisStep3 => 'Bearbetar kost- och sömndata...';

  @override
  String get analysisStep4 => 'Tar fram längdprognos...';

  @override
  String get analysisStep5 => 'Beräknar BeTaller-poäng...';

  @override
  String growthPotential(String cm, String unit) {
    return '+$cm $unit tillväxtpotential';
  }

  @override
  String get heightAt21 => 'vid 21 år';

  @override
  String confidenceLevel(String pct) {
    return '$pct % säkerhet';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return 'Spann $min - $max $unit';
  }

  @override
  String get currentLabel => 'NU';

  @override
  String get predictedLabel => 'PROGNOS';

  @override
  String get yearlyPredictions => 'Prognos per år';

  @override
  String get tipMorningMeasure =>
      'Mät din längd på morgonen. Trycket på diskarna gör dig lite kortare under dagen, så morgonmätningen är mest exakt.';

  @override
  String get tipProteinSpread =>
      'Fördela proteinet över dagens måltider. Ät inte allt på en gång – få i dig protein till varje måltid.';

  @override
  String get tipGrowthHormone =>
      'Tillväxthormonet når sin topp under sömnen. Sov mellan 22 och 02!';

  @override
  String get tipVitaminD =>
      '15 minuter sol om dagen ökar kroppens D-vitaminproduktion. D-vitamin behövs för att ta upp kalcium.';

  @override
  String get tipBarHanging =>
      'Att hänga i en stång avlastar ryggraden. Testa 3 x 30 sekunder om dagen.';

  @override
  String get tipSwimming =>
      'Simning är den bästa sporten för att träna hela kroppen och stödja tillväxten.';

  @override
  String get tipStress =>
      'Stress hämmar tillväxthormonet. Minska stressen med meditation och yoga.';

  @override
  String get routineMorningStretch => 'Morgonstretch';

  @override
  String get routineMorningStretchDesc =>
      'Stretcha 10 minuter direkt när du vaknat. Sträck ut ryggraden och benmusklerna.';

  @override
  String get routineBarHanging => 'Stånghäng';

  @override
  String get routineBarHangingDesc =>
      'Häng i en chinsstång för att sträcka ut ryggraden. 3 set x 30 sekunder.';

  @override
  String get routineCobraStretch => 'Kobrastretch';

  @override
  String get routineCobraStretchDesc =>
      'Ligg på mage och lyft överkroppen. Sträck ut ryggraden. 3 set x 15 sekunder.';

  @override
  String get routineJumping => 'Hoppövningar';

  @override
  String get routineJumpingDesc =>
      'Hopprep eller knäböjshopp. Stimulerar tillväxtzonerna. 3 set x 20 reps.';

  @override
  String get routineSwimming => 'Simning eller basket';

  @override
  String get routineSwimmingDesc =>
      'Utöva en sport som stödjer tillväxten. Minst 30 minuter.';

  @override
  String get routineYoga => 'Kvällsyoga & stretch';

  @override
  String get routineYogaDesc =>
      'Yoga och stretch innan du lägger dig. Släpp stressen och slappna av i musklerna.';

  @override
  String get routineProtein => 'Proteinintag';

  @override
  String get routineProteinDesc =>
      'Ägg, kyckling, fisk, mejeri. Minst 1,5 g/kg protein per dag.';

  @override
  String get routineCalcium => 'Kalcium & D-vitamin';

  @override
  String get routineCalciumDesc =>
      'Ät mjölk, ost och yoghurt. Sola 15 min. Viktigt för skelettets utveckling.';

  @override
  String get routineWater => 'Vattenmål';

  @override
  String get routineWaterDesc =>
      'Drick minst 2–3 liter vatten om dagen. Viktigt för ämnesomsättning och tillväxt.';

  @override
  String get routineAvoidJunk => 'Undvik skräpmat';

  @override
  String get routineAvoidJunkDesc =>
      'Håll dig borta från snabbmat, söta drycker och processad mat.';

  @override
  String get routineSleep => 'Bra sömn (8–10 tim)';

  @override
  String get routineSleepDesc =>
      'Tillväxthormon frisätts under sömnen. 22–06 är de gyllene timmarna.';

  @override
  String get routineNoScreen => 'Skärmpaus före läggdags';

  @override
  String get routineNoScreenDesc =>
      'Lägg undan mobil och dator 1 timme innan du sover. Blockera inte melatoninet.';

  @override
  String get routinePosture => 'Hållningskoll';

  @override
  String get routinePostureDesc =>
      'Håll ryggen rak och axlarna bakåt. Kolla varje timme. Bra hållning = 2–3 cm skillnad.';

  @override
  String get routineWallStand => 'Väggstående';

  @override
  String get routineWallStandDesc =>
      'Stå med ryggen mot väggen: hälar, höfter, axlar och huvud mot väggen. Håll i 5 min.';

  @override
  String get routineSprintIntervals => 'Sprintintervaller';

  @override
  String get routineSprintIntervalsDesc =>
      'Sprintintervaller ger en tydlig frisättning av tillväxthormon genom korta, intensiva ruscher.';

  @override
  String get routineHiitWorkout => 'HIIT-pass';

  @override
  String get routineHiitWorkoutDesc =>
      'Högintensiv intervallträning för att maximera frisättningen av tillväxthormon.';

  @override
  String get routineSquats => 'Knäböj utan vikter';

  @override
  String get routineSquatsDesc =>
      'Knäböj med kroppsvikten stimulerar tillväxtzonerna i ben och ryggrad.';

  @override
  String get routineDeadliftStretch => 'Marklyftsstretch';

  @override
  String get routineDeadliftStretchDesc =>
      'Marklyftsstretch för att avlasta ryggraden och hålla diskarna friska.';

  @override
  String get routineOverheadPress => 'Axelpress';

  @override
  String get routineOverheadPressDesc =>
      'Press över huvudet sträcker ryggraden och stärker hållningsmusklerna.';

  @override
  String get routineSkippingRope => 'Hopprep';

  @override
  String get routineSkippingRopeDesc =>
      'Upprepade hopp med hopprep stimulerar tillväxtzonerna i benen.';

  @override
  String get routinePilatesCore => 'Pilates core';

  @override
  String get routinePilatesCoreDesc =>
      'Coreövningar från pilates stödjer ryggradens linjering och hållningen.';

  @override
  String get routineInversionHang => 'Upp och ner-häng';

  @override
  String get routineInversionHangDesc =>
      'Att hänga upp och ner avlastar diskarna och kan tillfälligt ge 1–2 cm.';

  @override
  String get routineZincIntake => 'Zinkrik mat';

  @override
  String get routineZincIntakeDesc =>
      'Ät zinkrik mat under dagen för kroppens produktion av tillväxthormon.';

  @override
  String get routineVitaminDSunlight => 'D-vitamin & solljus';

  @override
  String get routineVitaminDSunlightDesc =>
      'Få minst 15 minuter direkt solljus för D-vitaminbildning och skelettillväxt.';

  @override
  String get routineArginineFoods => 'Argininrik mat';

  @override
  String get routineArginineFoodsDesc =>
      'Ät argininrik mat för att stimulera utsöndringen av tillväxthormon.';

  @override
  String get routineDailyCalories => 'Dagligt kalorimål';

  @override
  String get routineDailyCaloriesDesc =>
      'Nå ditt dagliga kalorimål. För lite mat bromsar tillväxten.';

  @override
  String get routineSleepEnvironment => 'Optimera sovmiljön';

  @override
  String get routineSleepEnvironmentDesc =>
      'Skapa en mörk och sval sovmiljö för att maximera melatonin och tillväxthormon.';

  @override
  String get routinePreSleepRoutine => 'Varva ner före sömn';

  @override
  String get routinePreSleepRoutineDesc =>
      'En fast kvällsrutin förbättrar den djupa sömnen med 23 %.';

  @override
  String get routineNeckStretches => 'Nackstretch';

  @override
  String get routineNeckStretchesDesc =>
      'Nackstretch minskar trycket och förbättrar nackens linjering.';

  @override
  String get routineShoulderRolls => 'Axelrullningar';

  @override
  String get routineShoulderRollsDesc =>
      'Att öppna upp axlarna rättar till framåtlutad hållning och kan se ut som 1–2 cm extra.';

  @override
  String get achieveCommitment => 'Engagemang';

  @override
  String get achieveCommitmentDesc =>
      'Fyll i alla dina uppgifter, utforska appen och börja använda den';

  @override
  String get achieveFirstDay => 'Första steget';

  @override
  String get achieveFirstDayDesc => 'Slutför din första dag';

  @override
  String get achieveThreeStreak => '3 dagar i rad';

  @override
  String get achieveThreeStreakDesc => 'Slutför rutiner 3 dagar i rad';

  @override
  String get achieveWeekStreak => '7 dagar i rad';

  @override
  String get achieveWeekStreakDesc => 'Slutför rutiner 7 dagar i rad';

  @override
  String get achieveTwoWeekStreak => '14 dagar i rad';

  @override
  String get achieveTwoWeekStreakDesc => 'Håll i 14 dagar i sträck';

  @override
  String get achieveMonthStreak => '30 dagar i rad';

  @override
  String get achieveMonthStreakDesc => 'Slutför 30 dagar i rad';

  @override
  String get achieveTwoMonthStreak => '60 dagar i rad';

  @override
  String get achieveTwoMonthStreakDesc => 'Slutför 60 dagar i rad';

  @override
  String get achieveHundredStreak => '100 dagar i rad';

  @override
  String get achieveHundredStreakDesc => 'Slutför 100 dagar i rad';

  @override
  String get achieveFirstMeasure => 'Första mätningen';

  @override
  String get achieveFirstMeasureDesc => 'Registrera din första längdmätning';

  @override
  String get achieveThreeMeasures => 'Mätare';

  @override
  String get achieveThreeMeasuresDesc => 'Registrera 3 längdmätningar';

  @override
  String get achieveFiveMeasures => 'Regelbunden koll';

  @override
  String get achieveFiveMeasuresDesc => 'Registrera 5 längdmätningar';

  @override
  String get achieveTenMeasures => 'Datajägare';

  @override
  String get achieveTenMeasuresDesc => 'Registrera 10 längdmätningar';

  @override
  String get achieveFirstCm => 'Första centimetern';

  @override
  String get achieveFirstCmDesc => 'Registrera 1 cm tillväxt totalt';

  @override
  String get achieveThreeCm => '3 cm tillväxt';

  @override
  String get achieveThreeCmDesc => 'Registrera 3 cm tillväxt totalt';

  @override
  String get achieveFiveCm => '5 cm tillväxt';

  @override
  String get achieveFiveCmDesc => 'Registrera 5 cm tillväxt totalt';

  @override
  String get achieveTenCm => '10 cm tillväxt';

  @override
  String get achieveTenCmDesc => 'Registrera 10 cm tillväxt totalt';

  @override
  String get quote1 => 'Bli lite bättre än igår, varje dag.';

  @override
  String get quote2 =>
      'Tillväxt sker inte över en natt, men varje natt tar dig närmare.';

  @override
  String get quote3 => 'Tillväxt kräver tålamod – fortsätt!';

  @override
  String get quote4 => 'Steget du tar idag bygger grunden för imorgon.';

  @override
  String get quote5 => 'Disciplin börjar där motivationen tar slut.';

  @override
  String get quote6 => 'Din kropp kommer att tacka dig – fortsätt!';

  @override
  String get quote7 => 'Det är du som sätter gränserna för din potential.';

  @override
  String get quote8 => 'Små steg skapar stora förändringar.';

  @override
  String get quote9 => 'Den bästa investeringen är den i dig själv.';

  @override
  String get quote10 => 'Du kommer närmare ditt mål varje dag.';

  @override
  String get quote11 => 'Förändring är svårt, men ånger är svårare.';

  @override
  String get quote12 => 'Din kropp är ett tempel – ta hand om den.';

  @override
  String get quote13 => 'Din rival är gårdagens du. Slå den idag!';

  @override
  String get quote14 => 'BeTaller = Tålamod + Disciplin + Tro';

  @override
  String get quote15 => 'Tro på dig själv – processen formar dig.';

  @override
  String get quote16 =>
      'Säg inte ”jag kan inte” idag, så slipper du ångra dig imorgon.';

  @override
  String get quote17 => 'Visa framsteg varje dag, även om det bara är 1 %.';

  @override
  String get quote18 => 'Spegeln kommer att visa dina framsteg – ha tålamod.';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiUnderweight => 'Undervikt';

  @override
  String get bmiOverweight => 'Övervikt';

  @override
  String get bmiObese => 'Fetma';

  @override
  String get velocityExcellent => 'Utmärkt';

  @override
  String get velocityNormal => 'Normal';

  @override
  String get velocitySlow => 'Långsam';

  @override
  String get velocityVeryLow => 'Mycket låg';

  @override
  String durationMinutes(String min) {
    return '$min min';
  }

  @override
  String get durationAllDay => 'Hela dagen';

  @override
  String get durationNight => 'Natt';

  @override
  String durationHours(String hours) {
    return '$hours timmar';
  }

  @override
  String get onboardingStep1 => 'Fyll i dina uppgifter';

  @override
  String get onboardingStep2 => 'Ange tidigare längder';

  @override
  String get onboardingStep3 => 'Bedöm dina vanor';

  @override
  String get onboardingStep4 => 'Se din prognos och poäng';

  @override
  String get hoursShort => 'tim';

  @override
  String get selectLanguage => 'Välj språk';

  @override
  String get systemLanguage => 'Systemspråk';

  @override
  String get emailSubject => 'Feedback om BeTaller';

  @override
  String get pastHeightsTip =>
      'Du kan lämna okända åldrar tomma. Det räcker med 1–2 tidigare längder.';

  @override
  String get obPastHeightsTitle => 'Tidigare längder';

  @override
  String get obPastHeightsSubPart1 =>
      'Dina tidigare längder gör prognosen mer exakt.';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return 'Hur lång var du när du var $age?';
  }

  @override
  String get obSkip => 'Hoppa över';

  @override
  String get obNext => 'Nästa';

  @override
  String get obSkipAll => 'Hoppa över alla';

  @override
  String get currentSuffix => '(nu)';

  @override
  String personalizedProtein(String amount) {
    return 'Ägg, kyckling, fisk, mejeri. Ät minst $amount g protein om dagen.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Drick minst $amount L vatten om dagen. Viktigt för ämnesomsättning och tillväxt.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'Tillväxthormon frisätts under sömnen. Sov minst $hours timmar. 22–06 är de gyllene timmarna.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Ät mjölk, ost och yoghurt. Sol 15 min. Dagligt kalorimål: $calories kcal.';
  }

  @override
  String get scoreS => 'Utmärkt! Du närmar dig toppen av din potential.';

  @override
  String get scoreA =>
      'Det går toppen! Små förbättringar kan ta dig hela vägen.';

  @override
  String get scoreB =>
      'Du är på rätt väg. Fokusera lite mer på rutiner och kost.';

  @override
  String get scoreC =>
      'Det finns utrymme att förbättra. Regelbundna rutiner gör skillnad.';

  @override
  String get scoreD => 'Stor potential, men du behöver komma igång.';

  @override
  String get scoreF => 'Börja nu! Ett litet steg varje dag gör stor skillnad.';

  @override
  String get cmPerYear => 'cm/år';

  @override
  String get howToDoIt => 'Så gör du';

  @override
  String get musclesTargeted => 'Muskler & skelett som tränas';

  @override
  String get scientificBasis => 'Vetenskaplig grund';

  @override
  String setXofY(String current, String total) {
    return 'Set $current av $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Vila före set $set';
  }

  @override
  String get allSetsComplete => 'Alla set klara!';

  @override
  String get setTimer => 'Set-timer';

  @override
  String get setTracker => 'Set-räknare';

  @override
  String get builtInTimer => 'Inbyggd timer';

  @override
  String get markComplete => 'Markera som klar';

  @override
  String get markIncomplete => 'Markera som ej klar';

  @override
  String get done => 'Klar';

  @override
  String get doneExclamation => 'Klart!';

  @override
  String get start => 'Starta';

  @override
  String get pause => 'Paus';

  @override
  String get resetTimer => 'Nollställ';

  @override
  String get skipRest => 'Hoppa över vila';

  @override
  String get restart => 'Börja om';

  @override
  String get perSet => 'per set';

  @override
  String get rest => 'VILA';

  @override
  String get reps => 'reps';

  @override
  String get difficultyBeginner => 'Nybörjare';

  @override
  String get difficultyIntermediate => 'Medel';

  @override
  String get difficultyAdvanced => 'Avancerad';

  @override
  String get learnTitle => 'Lär dig';

  @override
  String get learnSubtitle => 'Vetenskapligt underbyggd kunskap om tillväxt';

  @override
  String get categoryAll => 'Alla';

  @override
  String get categoryScience => 'Vetenskap';

  @override
  String get categoryNutrition => 'Kost';

  @override
  String get categoryExercise => 'Träning';

  @override
  String get categorySleep => 'Sömn';

  @override
  String get categoryMyths => 'Myter';

  @override
  String get scientificReferences => 'Vetenskapliga källor';

  @override
  String get relatedRoutines => 'Relaterade rutiner';

  @override
  String get nutritionTitle => 'Kost';

  @override
  String get sectionMealPlan => 'Måltidsplan';

  @override
  String get sectionNutrients => 'Näringsämnen';

  @override
  String get sectionFoods => 'Livsmedel';

  @override
  String get sectionSupplements => 'Kosttillskott';

  @override
  String todaysPlan(String day) {
    return 'Dagens plan – $day';
  }

  @override
  String get breakfast => 'Frukost';

  @override
  String get lunch => 'Lunch';

  @override
  String get dinner => 'Middag';

  @override
  String get snacks => 'Mellanmål';

  @override
  String get searchFoods => 'Sök livsmedel...';

  @override
  String nFoods(String count) {
    return '$count livsmedel';
  }

  @override
  String dailyLabel(String amount) {
    return 'Per dag: $amount';
  }

  @override
  String get dailyNeedByAge => 'DAGLIGT BEHOV EFTER ÅLDER';

  @override
  String agePrefix(String range) {
    return 'Ålder $range';
  }

  @override
  String get topFoodSources => 'BÄSTA KÄLLORNA';

  @override
  String get categoryDairy => 'Mejeri';

  @override
  String get categoryMeatFish => 'Kött & fisk';

  @override
  String get categoryVegetables => 'Grönsaker';

  @override
  String get categoryFruits => 'Frukt';

  @override
  String get categoryGrains => 'Spannmål & baljväxter';

  @override
  String get categoryNutsSeeds => 'Nötter & frön';

  @override
  String get weeklyReportTitle => 'Veckorapport';

  @override
  String get weeklyScoreLabel => 'Veckans poäng';

  @override
  String get weeklyDailyCompletion => 'Dag för dag';

  @override
  String get weeklyHabits => 'Vanor';

  @override
  String get overview => 'Översikt';

  @override
  String get routinesLabel => 'Rutiner';

  @override
  String get streakLabel => 'Svit';

  @override
  String get heightLabel => 'Längd';

  @override
  String get weightLabel => 'Vikt';

  @override
  String get dadLabel => 'Pappa';

  @override
  String get motherLabel => 'Mamma';

  @override
  String get metricShort => 'Metriskt';

  @override
  String get imperialShort => 'Imperiskt';

  @override
  String get dailyScores => 'Dagliga poäng';

  @override
  String get waterToday2 => 'Vatten idag';

  @override
  String get sleepToday => 'Sömn idag';

  @override
  String get routineCompletion => 'Klara rutiner';

  @override
  String get xpAndLevel => 'XP & nivå';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP till nästa nivå';
  }

  @override
  String get activeChallenges => 'Aktiva utmaningar';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m klara';
  }

  @override
  String get shareYourProgress => 'Dela dina framsteg';

  @override
  String get shareComingSoon => 'Delning kommer snart!';

  @override
  String get premiumTest => 'Premium (test)';

  @override
  String get premiumActive => 'Aktiv';

  @override
  String get premiumFree => 'Gratis';

  @override
  String get weeklyReportMenu => 'Veckorapport';

  @override
  String get weeklyReportMenuSubtitle => 'Sammanfattning av dina framsteg';

  @override
  String get unlockGrowthPotential => 'Lås upp hela din tillväxtpotential';

  @override
  String get featureGrowthAnalysis => 'Tillväxtanalys & poäng';

  @override
  String get featureHeightPrediction => 'Längdprognos & framtidsbild';

  @override
  String get featureAllRoutines => 'Alla 14 dagliga rutiner';

  @override
  String get featureWaterSleep => 'Vatten- & sömnlogg';

  @override
  String get featureProgress => 'Framsteg & mätningar';

  @override
  String get featureAchievements => 'Utmärkelser & sviter';

  @override
  String get planMonthly => 'Månadsvis';

  @override
  String get planYearly => 'Årsvis';

  @override
  String get bestValue => 'BÄSTA VALET';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'NIVÅ $level';
  }

  @override
  String get levelBeginner => 'Nybörjare';

  @override
  String get levelStarter => 'Startare';

  @override
  String get levelCommitted => 'Engagerad';

  @override
  String get levelDedicated => 'Hängiven';

  @override
  String get levelConsistent => 'Stabil';

  @override
  String get levelFocused => 'Fokuserad';

  @override
  String get levelDetermined => 'Målmedveten';

  @override
  String get levelDisciplined => 'Disciplinerad';

  @override
  String get levelStrong => 'Stark';

  @override
  String get levelAdvanced => 'Avancerad';

  @override
  String get levelExpert => 'Expert';

  @override
  String get levelMaster => 'Mästare';

  @override
  String get levelElite => 'Elit';

  @override
  String get levelChampion => 'Mästarklass';

  @override
  String get levelLegend => 'Legend';

  @override
  String get levelTitan => 'Titan';

  @override
  String get levelMythic => 'Mytisk';

  @override
  String get levelImmortal => 'Odödlig';

  @override
  String get levelTranscendent => 'Överjordisk';

  @override
  String get levelUltimate => 'Ultimat';

  @override
  String get challengeCompleteAllRoutines => 'Slutför alla rutiner';

  @override
  String get challengeCompleteAllRoutinesDesc => 'Gör klart varje rutin idag';

  @override
  String get challengeHydrationHero => 'Vätskehjälte';

  @override
  String get challengeHydrationHeroDesc => 'Nå ditt dagliga vattenmål';

  @override
  String get challengeEarlySleeper => 'Tidigt i säng';

  @override
  String get challengeEarlySleeperDesc => 'Logga 8+ timmars sömn';

  @override
  String get challengeExerciseTrio => 'Träningstrio';

  @override
  String get challengeExerciseTrioDesc => 'Slutför 3 träningsrutiner';

  @override
  String get challengeMorningStretch => 'Morgonstretch';

  @override
  String get challengeMorningStretchDesc => 'Stretcha före kl. 9 på morgonen';

  @override
  String get challenge7DayWarrior => '7-dagarskrigare';

  @override
  String get challenge7DayWarriorDesc => 'Slutför alla rutiner 7 dagar i rad';

  @override
  String get challengeGrowthTracker => 'Tillväxtkoll';

  @override
  String get challengeGrowthTrackerDesc =>
      'Logga en längdmätning den här veckan';

  @override
  String get challengeHydrationWeek => 'Vätskevecka';

  @override
  String get challengeHydrationWeekDesc =>
      'Nå vattenmålet 5 dagar den här veckan';

  @override
  String get challengeFitnessChampion => 'Träningsmästare';

  @override
  String get challengeFitnessChampionDesc =>
      'Slutför 15 träningsrutiner den här veckan';

  @override
  String get challengeSleepMaster => 'Sömnmästare';

  @override
  String get challengeSleepMasterDesc => 'Logga 8+ timmars sömn i 5 dagar';

  @override
  String get performanceDashboard => 'PRESTATIONSÖVERSIKT';

  @override
  String get tierA => 'NIVÅ A';

  @override
  String get tierB => 'NIVÅ B';

  @override
  String get tierC => 'NIVÅ C';

  @override
  String get tierD => 'NIVÅ D';

  @override
  String get tierE => 'NIVÅ E';

  @override
  String get maxTierReached => 'HÖGSTA NIVÅN NÅDD';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Nästa nivå: $tier · +$pts p behövs';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Hantera rutiner';

  @override
  String get manageRoutinesSubtitle =>
      'Visa eller dölj rutiner i din dagliga lista';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible av $total aktiva';
  }

  @override
  String get showAll => 'Visa alla';

  @override
  String get hideAll => 'Dölj alla';

  @override
  String get heightAnalysis => 'Längdanalys';

  @override
  String get heightVsPopulation => 'Din plats på CDC:s tillväxtkurva';

  @override
  String get globalAveragesTable => 'Medellängd efter ålder (CDC)';

  @override
  String get standingTall => 'Lång för åldern';

  @override
  String get standingAboveAverage => 'Över snittet';

  @override
  String get standingBelowAverage => 'Under snittet';

  @override
  String get standingShort => 'Kortare än jämnåriga';

  @override
  String get yourHeightStanding => 'DIN LÄNGDPLACERING';

  @override
  String get bellCurveCaption => 'Så fördelas längden i din ålder';

  @override
  String get bellShorterThanYou => 'kortare än du';

  @override
  String get yourHeight => 'Du';

  @override
  String peerAvg(int age) {
    return 'Snitt $age år';
  }

  @override
  String get aboveAvg => 'Över snitt';

  @override
  String get belowAvg => 'Under snitt';

  @override
  String get whoDataSource => 'Tillväxtkurvor från US CDC';

  @override
  String get percentileShort5 => '5:e';

  @override
  String get percentileShort50 => '50:e';

  @override
  String get percentileShort95 => '95:e';

  @override
  String get youLabel => 'Du';

  @override
  String get avgHeightLabel => 'SNITT';

  @override
  String get percentileLabel => 'PERC';

  @override
  String get diffLabel => 'DIFF';

  @override
  String get whoSourceNote =>
      'Datakälla: US CDC:s tillväxtkurvor från 2000 (längd för ålder, 2 till 20 år). Percentilerna jämför dig med befolkningen i USA och kan skilja sig mellan länder.';

  @override
  String get quickPhotos => 'Foton';

  @override
  String get quickPosture => 'Hållning';

  @override
  String get quickWellness => 'Välmående';

  @override
  String get quickRecipes => 'Recept';

  @override
  String get wellnessTitle => 'Välmåendelogg';

  @override
  String get wellnessHeader => 'VÄLMÅENDE';

  @override
  String get wellnessSubtitle => 'Följ faktorer som påverkar din tillväxt';

  @override
  String get caffeineToday => 'Koffein idag';

  @override
  String get withinLimits => 'Inom hälsosamma gränser';

  @override
  String get approachingLimit => 'Nära gränsen';

  @override
  String get overLimit => 'Över gränsen, påverkar HGH';

  @override
  String get resetToday => 'Nollställ idag';

  @override
  String get stressToday => 'Stress idag';

  @override
  String get stressVeryCalmLabel => 'Mycket lugn, perfekt för tillväxt';

  @override
  String get stressCalmLabel => 'Lugn';

  @override
  String get stressNeutralLabel => 'Neutral';

  @override
  String get stressStressedLabel => 'Stressad';

  @override
  String get stressVeryStressedLabel =>
      'Mycket stressad, kortisol blockerar HGH';

  @override
  String get stressTapToLog => 'Tryck för att logga hur du mår idag';

  @override
  String get todaysJournal => 'Dagens dagbok';

  @override
  String get journalNoNote => '(ingen text)';

  @override
  String get journalEdit => 'Redigera';

  @override
  String get journalHowWasToday => 'Hur var dagen?';

  @override
  String get journalSaved => 'Dagbok sparad · +5 XP';

  @override
  String get journalSaveEntry => 'Spara inlägg';

  @override
  String get weeklyInsight => 'Veckans insikt';

  @override
  String get weeklyInsightCaffeine => 'KOFFEIN';

  @override
  String get weeklyInsightStress => 'STRESS';

  @override
  String get weeklyInsightMood => 'HUMÖR';

  @override
  String get wellnessInfoTitle => 'Därför spelar välmående roll';

  @override
  String get wellnessInfoBody =>
      'Koffein stör den djupa sömnen, och det är då det mesta tillväxthormonet (HGH) frisätts. Långvarig stress höjer kortisolet, som direkt hämmar HGH. En dagbok hjälper dig att hålla fast vid vanor som stödjer tillväxten.';

  @override
  String get wellnessInfoGotIt => 'Uppfattat';

  @override
  String get insightCaffeineHigh =>
      'Ditt koffeinintag är högt den här veckan. Försök dra ner för bättre sömn och mer HGH.';

  @override
  String get insightStressHigh =>
      'Stressen är förhöjd den här veckan. Testa några andningsövningar: kortisol blockerar tillväxten.';

  @override
  String get insightMoodLow =>
      'Humöret har varit lågt på sistone. Solljus, sömn och lugn träning hjälper.';

  @override
  String get insightGreat =>
      'Bra balans den här veckan. Ditt välmående stödjer tillväxten optimalt.';

  @override
  String get insightDefault =>
      'Ditt välmående är på rätt spår. Fortsätt logga för djupare insikter.';

  @override
  String get insightNeedMoreData =>
      'Logga några dagar till för att se insikter.';

  @override
  String get progressPhotosTitle => 'Framstegsfoton';

  @override
  String get progressPhotosHeader => 'FRAMSTEGSFOTON';

  @override
  String get progressPhotosSubtitle => 'Följ din resa i bilder';

  @override
  String get addProgressPhoto => 'Lägg till foto';

  @override
  String get captureJourney => 'Fånga din resa i bilder';

  @override
  String get takePhoto => 'Ta foto';

  @override
  String get chooseFromLibrary => 'Välj från bibliotek';

  @override
  String get deletePhotoTitle => 'Radera foto?';

  @override
  String get deletePhotoBody => 'Fotot tas bort från din tidslinje.';

  @override
  String get timelineTab => 'Tidslinje';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'foton',
      one: 'foto',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$cm $unit på $days dagar';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dagar',
      one: 'dag',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '$unit vuxit';
  }

  @override
  String get firstPhotoMessage =>
      'Ta ditt första foto för att börja följa dina framsteg i bilder.';

  @override
  String get takeFirstPhoto => 'Ta första fotot';

  @override
  String get beforeAfter => 'FÖRE / EFTER';

  @override
  String get beforeLabel => 'FÖRE';

  @override
  String get afterLabel => 'EFTER';

  @override
  String get yourHeightDialog => 'Din längd';

  @override
  String get heightDialogMessage =>
      'Ange din nuvarande längd för det här fotot';

  @override
  String get postureAnalysisTitle => 'Hållningsanalys';

  @override
  String get postureCoachHeader => 'HÅLLNINGSCOACH';

  @override
  String get postureCoachSubtitle => 'Självtest med ett foto från sidan';

  @override
  String get latestScore => 'SENASTE POÄNG';

  @override
  String get latestAnalysis => 'SENASTE ANALYS';

  @override
  String get headPosition => 'Huvudets position';

  @override
  String get progressLabel => 'FRAMSTEG';

  @override
  String get choosePhotoSource => 'Välj fotokälla';

  @override
  String get sideProfileHint => 'Från sidan, hela kroppen i bild';

  @override
  String get howToTakePhoto => 'SÅ TAR DU FOTOT';

  @override
  String get takePosturePhoto => 'Ta hållningsfoto';

  @override
  String get postureExcellent => 'Utmärkt';

  @override
  String get postureGood => 'Bra';

  @override
  String get postureNeedsWork => 'Kan förbättras';

  @override
  String get posturePoor => 'Dålig';

  @override
  String get recommendedExercises => 'REKOMMENDERADE ÖVNINGAR';

  @override
  String get postureWallStand => 'Väggstående';

  @override
  String get postureWallStandDesc =>
      'Stå med ryggen mot väggen 2 minuter varje dag.';

  @override
  String get postureChestOpener => 'Bröstöppnare';

  @override
  String get postureChestOpenerDesc =>
      'Öppnar strama bröstmuskler som drar axlarna framåt.';

  @override
  String get postureChinTucks => 'Hakindrag';

  @override
  String get postureChinTucksDesc => 'Motverka framskjutet huvud – 3×10 reps.';

  @override
  String get postureDeadbug => 'Dead bug';

  @override
  String get postureDeadbugDesc =>
      'Stärker djupa coremuskler för att kontrollera svankrygg.';

  @override
  String get recipesTitle => 'Recept';

  @override
  String get recipesHeader => 'RECEPT';

  @override
  String get recipesSubtitle => 'Ge din tillväxt bränsle';

  @override
  String get recipesCategoryAll => 'Alla';

  @override
  String get recipesCategoryBreakfast => 'Frukost';

  @override
  String get recipesCategoryLunch => 'Lunch';

  @override
  String get recipesCategoryDinner => 'Middag';

  @override
  String get recipesCategorySnack => 'Mellanmål';

  @override
  String get recipesGoalAll => 'Alla';

  @override
  String get recipeDiffEasy => 'Lätt';

  @override
  String get recipeDiffMedium => 'Medel';

  @override
  String get recipeDiffHard => 'Svår';

  @override
  String get recipesFilterType => 'TYP';

  @override
  String get recipesFilterNutrient => 'RIK PÅ';

  @override
  String get recipesGoalVitaminD => 'D-vitamin';

  @override
  String get recipesGoalZinc => 'Zink';

  @override
  String get recipesGoalMagnesium => 'Magnesium';

  @override
  String recipesCountLabel(int count) {
    return '$count recept';
  }

  @override
  String get recipeIngredients => 'Ingredienser';

  @override
  String get recipeSteps => 'Gör så här';

  @override
  String get recipesGoalProtein => 'Mycket protein';

  @override
  String get recipesGoalCalcium => 'Kalcium';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => 'Järn';

  @override
  String get recipesNoMatch => 'Inga recept matchar filtren';

  @override
  String get recipesIngredients => 'Ingredienser';

  @override
  String get recipesInstructions => 'Instruktioner';

  @override
  String get recipesClose => 'STÄNG';

  @override
  String get recipesAboutTitle => 'Om recepten';

  @override
  String get recipesAboutBody =>
      'Utvalda recept som ger din tillväxt bränsle. Filtrera på måltid eller näringsmål för att hitta det som passar din plan.';

  @override
  String get animHintSpinalDecomp => 'Avlastar ryggraden';

  @override
  String get animHintGravityReversal => 'Omvänd tyngdkraft';

  @override
  String get animHintImpactBones => 'Stötbelastning för skelettet';

  @override
  String get animHintHighImpact => 'Hög belastning för skelettet';

  @override
  String get animHintMetabolicBurst => 'Explosiv konditionsträning';

  @override
  String get animHintFullBodyStretch => 'Uppvaknande helkroppsstretch';

  @override
  String get animHintSpinalExtension => 'Sträcker ryggraden';

  @override
  String get animHintCervicalDecomp => 'Avlastar nacken';

  @override
  String get animHintShoulderMobility => 'Axelrörlighet';

  @override
  String get animHintFullBodyMotion => 'Helkroppsrörelse';

  @override
  String get animHintPosteriorChain => 'Stretch för baksidan';

  @override
  String get animHintMuscleGrowth => 'Bränsle för musklerna';

  @override
  String get animHintBoneDensity => 'Stöd för bentätheten';

  @override
  String get animHintSpinalDisc => 'Vätska till diskarna';

  @override
  String get animHintCleanNutrition => 'Ren kost';

  @override
  String get animHintIgf1 => 'Optimerar IGF-1';

  @override
  String get animHintHghAmino => 'Aminosyra för HGH';

  @override
  String get animHintCalciumAbsorption => 'Kalciumupptag';

  @override
  String get animHintSpinalAlignment => 'Ryggradens linjering';

  @override
  String get animHintPostureCorrection => 'Hållningskorrigering';

  @override
  String get animHintMindBody => 'Kropp och sinne';

  @override
  String get animHintCoreStability => 'Bålstabilitet';

  @override
  String get animHintLegPower => 'Benkraft & HGH-boost';

  @override
  String get animHintVerticalPower => 'Spänst';

  @override
  String get animHintHghSurge => 'HGH-boostande träning';

  @override
  String get animHintPeakHgh => 'Toppfönster för HGH';

  @override
  String get animHintMelatonin => 'Optimerar melatonin';

  @override
  String get animHintDeepSleep => 'Förbered djupsömn';

  @override
  String get animHintSleepOpt => 'Optimerar sömnen';

  @override
  String get animHintExercise => 'Övning';

  @override
  String get formMorningStretch =>
      'Börja med nackrullningar och gå sedan över till stretch för hela kroppen. Håll varje stretch i 20–30 sekunder utan att gunga.';

  @override
  String get formBarHanging =>
      'Greppa stången axelbrett, slappna av helt och låt tyngdkraften sträcka ryggraden. Undvik att svinga.';

  @override
  String get formCobraStretch =>
      'Ligg på mage med händerna under axlarna och pressa långsamt upp överkroppen medan höfterna ligger kvar mot golvet. Titta uppåt.';

  @override
  String get formJumping =>
      'Gör knäböjshopp eller hoppa hopprep. Landa mjukt på framfoten. Vila 30 sekunder mellan seten.';

  @override
  String get formSwimmingBasketball =>
      'Välj simning (crawl/ryggsim) eller basket. Fokusera på hopp, sträckningar och fullt rörelseomfång.';

  @override
  String get formEveningYoga =>
      'Gör lugna positioner: katt-ko, barnets position, nedåtgående hund, framåtfällning. Andas djupt och håll varje position i 30–60 sekunder.';

  @override
  String get formSprintIntervals =>
      'Värm upp i 5 minuter och spurta sedan för fullt i 30 sekunder. Gå eller jogga i 90 sekunder för att återhämta dig. Upprepa.';

  @override
  String get formHiitWorkout =>
      'Gör övningar som burpees, mountain climbers och knäböjshopp på max i 45 sekunder, vila 15 sekunder.';

  @override
  String get formSquats =>
      'Stå med fötterna axelbrett. Sänk kroppen tills låren är parallella med golvet. Håll ryggen rak och knäna bakom tårna.';

  @override
  String get formDeadliftStretch =>
      'Stå med fötterna höftbrett och fäll framåt i höften med rak rygg. Sträck dig mot tårna och känn stretchen i baksida lår och rygg.';

  @override
  String get formOverheadPress =>
      'Stå rakt och pressa armarna upp över huvudet tills de är helt raka. Använd lätta vikter eller kroppsvikt. Spänn magen och undvik att svanka.';

  @override
  String get formSkippingRope =>
      'Hoppa jämfota och landa mjukt på framfoten. Håll hoppen låga och jämna. Vila mellan seten.';

  @override
  String get formPilatesCore =>
      'Gör plankan, dead bug, bird dog, bäckenlyft och benlyft. Fokusera på kontrollerade rörelser och andning.';

  @override
  String get formInversionHang =>
      'Använd en inversionsbänk eller gravity boots. Börja med en lätt lutning och öka gradvis. Håll passen korta.';

  @override
  String get formProtein =>
      'Fördela proteinet över 3–4 måltider. Ät ägg, kyckling, fisk, mejeri och baljväxter.';

  @override
  String get formCalciumVitaminD =>
      'Ät 3 portioner mejeriprodukter om dagen och få 15 minuter solljus för kroppens egen D-vitaminbildning.';

  @override
  String get formWater =>
      'Drick vatten jämnt under dagen. Ha med dig en vattenflaska och ställ in påminnelser varje timme.';

  @override
  String get formAvoidJunk =>
      'Byt snabbmat mot riktig mat. Byt söta drycker mot vatten. Läs etiketterna och undvik processade ingredienser.';

  @override
  String get formZincIntake =>
      'Ät rött kött, pumpafrön, kikärtor, cashewnötter och ostron. Sikta på 8–11 mg per dag.';

  @override
  String get formVitaminDSunlight =>
      'Låt solen skina direkt på armar och ansikte i 15 minuter, helst före lunch. Ingen solkräm behövs under så kort tid.';

  @override
  String get formArginineFoods =>
      'Ät nötter, frön, kalkon, kyckling, sojabönor och mejeri. Bäst före sänggåendet.';

  @override
  String get formDailyCalories =>
      'Fördela kalorierna över 3–5 måltider och hoppa inte över frukosten. Välj riktig mat framför tomma kalorier.';

  @override
  String get formQualitySleep =>
      'Gå och lägg dig senast kl. 22. Håll rummet mörkt och svalt. Undvik koffein efter kl. 14.';

  @override
  String get formNoScreen =>
      'Ställ ett alarm 1 timme före läggdags. Lägg undan alla skärmar. Läs en bok eller stretcha lugnt i stället.';

  @override
  String get formSleepEnvironment =>
      'Använd mörkläggningsgardiner, håll rummet på 18–20 °C och ta bort alla ljuskällor. Ha en skön madrass och kudde.';

  @override
  String get formPreSleepRoutine =>
      'Börja 30 minuter före läggdags: dämpa belysningen, läs en bok, gör andningsövningar och undvik uppvarvande aktiviteter.';

  @override
  String get formPostureCheck =>
      'Stå rakt med axlarna bakåt och nedåt. Spänn magen lätt. Tänk dig ett snöre som drar dig uppåt från hjässan.';

  @override
  String get formWallStand =>
      'Stå med hälar, rumpa, skulderblad och huvud mot väggen. Håll i 5 minuter. Andas normalt.';

  @override
  String get formNeckStretches =>
      'Luta huvudet långsamt åt sidorna, framåt och bakåt. Håll varje riktning i 30 sekunder. Tvinga inte stretchen.';

  @override
  String get formShoulderRolls =>
      'Rulla axlarna framåt 15 gånger och sedan bakåt 15 gånger. Avsluta med bröstöppnande stretch i 20 sekunder.';

  @override
  String get sciMorningStretch =>
      'Morgonstretch avlastar diskarna som återfått vätska under natten och hjälper dig att behålla längden';

  @override
  String get sciBarHanging =>
      'Att hänga avlastar diskarna genom att låta tyngdkraften sträcka ryggraden, vilket kan ge tillfällig extra längd';

  @override
  String get sciCobraStretch =>
      'Kobrastretch sträcker ryggraden och öppnar bröstet, vilket motverkar kompressionen från sittande';

  @override
  String get sciJumping =>
      'Hopp med hög belastning stimulerar tillväxtzonerna i benen och frisätter tillväxthormon';

  @override
  String get sciSwimmingBasketball =>
      'Simning och basket innebär stretch, hopp och sträckningar för hela kroppen som stimulerar tillväxtzonerna';

  @override
  String get sciEveningYoga =>
      'Kvällsyoga sänker kortisolet som hämmar tillväxthormonet och stretchar musklerna inför nattens återhämtning';

  @override
  String get sciSprintIntervals =>
      'Sprintlöpning ger en tydlig frisättning av tillväxthormon';

  @override
  String get sciHiitWorkout =>
      'Högintensiv träning kan öka HGH med upp till 450 %';

  @override
  String get sciSquats => 'Knäböj stimulerar tillväxtzonerna i ben och ryggrad';

  @override
  String get sciDeadliftStretch =>
      'Avlastning av ryggraden främjar friska diskar';

  @override
  String get sciOverheadPress =>
      'Press över huvudet sträcker ryggraden och stärker hållningsmusklerna';

  @override
  String get sciSkippingRope =>
      'Upprepade hopp stimulerar tillväxtzonerna i benen';

  @override
  String get sciPilatesCore =>
      'En stark bål stödjer ryggradens linjering och hållningen';

  @override
  String get sciInversionHang =>
      'Att hänga upp och ner avlastar diskarna och kan tillfälligt ge 1–2 cm';

  @override
  String get sciProtein =>
      'Protein ger aminosyror som behövs för skelett- och muskeltillväxt, särskilt under tillväxtspurter';

  @override
  String get sciCalciumVitaminD =>
      'Kalcium och D-vitamin är de viktigaste byggstenarna för bentäthet och skelettets längdtillväxt';

  @override
  String get sciWater =>
      'Vätska behövs för att transportera näring till tillväxtzonerna och hålla ledbrosket friskt';

  @override
  String get sciAvoidJunk =>
      'Processad mat och socker ger inflammation och insulintoppar som hämmar utsöndringen av tillväxthormon';

  @override
  String get sciZincIntake =>
      'Zink behövs för att kroppen ska producera tillväxthormon';

  @override
  String get sciVitaminDSunlight =>
      'D-vitamin är avgörande för kalciumupptag och skelettillväxt';

  @override
  String get sciArginineFoods =>
      'L-arginin stimulerar utsöndringen av tillväxthormon';

  @override
  String get sciDailyCalories =>
      'Ett långvarigt kaloriunderskott sänker IGF-1 och dämpar tillväxthormonets pulser, vilket direkt bromsar längdtillväxten under tonåren';

  @override
  String get sciQualitySleep =>
      '70–80 % av dygnets tillväxthormon frisätts under djupsömnen, särskilt mellan kl. 22 och 02';

  @override
  String get sciNoScreen =>
      'Blått ljus från skärmar hämmar melatoninet, vilket gör att du somnar senare och sover sämre djupsömn';

  @override
  String get sciSleepEnvironment =>
      'En mörk och sval miljö maximerar melatonin och tillväxthormon';

  @override
  String get sciPreSleepRoutine =>
      'En fast kvällsrutin förbättrar den djupa sömnen med 23 %';

  @override
  String get sciPostureCheck =>
      'Rätt hållning kan direkt få dig att se 2–3 cm längre ut och förebygger kompression av ryggraden';

  @override
  String get sciWallStand =>
      'Väggstående tränar hållningsmusklernas minne så att ryggraden hålls rätt under dagen';

  @override
  String get sciNeckStretches =>
      'Nackstretch minskar trycket och förbättrar nackens linjering';

  @override
  String get sciShoulderRolls =>
      'Att öppna upp axlarna rättar till framåtlutad hållning och kan se ut som 1–2 cm extra';

  @override
  String get muscleSpine => 'Ryggrad';

  @override
  String get muscleLegs => 'Ben';

  @override
  String get muscleBack => 'Rygg';

  @override
  String get muscleShoulders => 'Axlar';

  @override
  String get muscleArms => 'Armar';

  @override
  String get muscleCore => 'Bål';

  @override
  String get muscleChest => 'Bröst';

  @override
  String get muscleCalves => 'Vader';

  @override
  String get muscleFullBody => 'Hela kroppen';

  @override
  String get muscleHips => 'Höfter';

  @override
  String get muscleBones => 'Skelett';

  @override
  String get muscleMuscles => 'Muskler';

  @override
  String get muscleNeck => 'Nacke';

  @override
  String get muscleUpperSpine => 'Övre ryggrad';

  @override
  String get muscleUpperBack => 'Övre rygg';

  @override
  String get createRoutine => 'Skapa rutin';

  @override
  String get createRoutineTitle => 'Skapa egen rutin';

  @override
  String get createRoutineSubtitle => 'Bygg din egen dagliga rutin';

  @override
  String get routineIcon => 'Ikon';

  @override
  String get routineTitleField => 'Titel';

  @override
  String get routineDescField => 'Beskrivning';

  @override
  String get routineDescHint => 'Kort sammanfattning av rutinen';

  @override
  String get routineCategoryField => 'Kategori';

  @override
  String get routineDifficultyField => 'Svårighet';

  @override
  String get routineDurationField => 'Längd';

  @override
  String get routineSetsRepsField => 'Set x reps';

  @override
  String get routineFormField => 'Utförande & instruktioner';

  @override
  String get routineFormHint => 'Valfritt: hur rutinen ska utföras';

  @override
  String get diffBeginner => 'Nybörjare';

  @override
  String get diffIntermediate => 'Medel';

  @override
  String get diffAdvanced => 'Avancerad';

  @override
  String get catExercise => 'Träning';

  @override
  String get catNutrition => 'Kost';

  @override
  String get catSleep => 'Sömn';

  @override
  String get catPosture => 'Hållning';

  @override
  String get postureTip1 => 'Stå med sidan (profilen) mot kameran.';

  @override
  String get postureTip2 => 'Håll ca 2 meters avstånd till kameran.';

  @override
  String get postureTip3 => 'Slappna av i armarna och titta rakt fram.';

  @override
  String get postureTip4 => 'Ha åtsittande kläder för en exakt bedömning.';

  @override
  String get postureTip5 => 'Använd bra ljus och en enfärgad bakgrund.';

  @override
  String get kyphosisLabel => 'Kyfos (övre rygg)';

  @override
  String get lordosisLabel => 'Lordos (ländrygg)';

  @override
  String get analyzingPosture => 'ANALYSERAR HÅLLNING';

  @override
  String get privacyPolicy => 'Integritetspolicy';

  @override
  String get termsOfService => 'Användarvillkor';

  @override
  String version(String ver) {
    return 'Version $ver';
  }

  @override
  String get rateApp => 'Betygsätt BeTaller';

  @override
  String get rateAppSubtitle => 'Ditt omdöme hjälper oss att växa!';

  @override
  String get unitSystem => 'Enhetssystem';

  @override
  String get unitMetric => 'Metriskt (cm, kg)';

  @override
  String get unitImperial => 'Imperiskt (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'Hälsoinformation';

  @override
  String get healthDisclaimerBody =>
      'BeTaller ger allmänna råd om välmående och träning. Resultaten varierar beroende på ålder, gener och individuella faktorer. Appen ger inga medicinska råd. Övningarna fokuserar på bättre hållning, en frisk ryggrad och stöd för tillväxthormonet genom naturliga vanor. Rådgör med vårdpersonal innan du börjar med ett nytt tränings- eller kostprogram. Längdförändringar efter att tillväxtzonerna slutits (oftast vid 18–25 år) beror främst på förbättrad hållning.';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'Få i dig minst $grams g protein idag – beräknat utifrån din vikt.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'Drick minst $liters L vatten idag – beräknat utifrån din vikt.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'Sikta på cirka $kcal kcal idag för att ge tillväxten bränsle.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'Få i dig $iu IU D-vitamin idag – från sol, mat eller tillskott.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'Få i dig $mg mg zink idag för att stödja produktionen av tillväxthormon.';
  }

  @override
  String get nutritionSupplementsTitle => 'KOSTTILLSKOTT';

  @override
  String get nutritionSupplementsDisclaimer =>
      'Ett valfritt stöd, inte en ersättning för mat. Prata med en läkare innan du börjar med något tillskott, särskilt om du är under 18.';

  @override
  String get supplementVitaminDName => 'D3-vitamin';

  @override
  String get supplementVitaminDDose => '3 000 IU';

  @override
  String get supplementVitaminDBenefit =>
      'Ökar kalciumupptaget för bentäthet och friska tillväxtzoner';

  @override
  String get supplementZincName => 'Zink';

  @override
  String get supplementZincDose => '8–11 mg';

  @override
  String get supplementZincBenefit =>
      'Ett viktigt mineral för produktionen av tillväxthormon';

  @override
  String get supplementMagnesiumName => 'Magnesium';

  @override
  String get supplementMagnesiumDose => '300–400 mg';

  @override
  String get supplementMagnesiumBenefit =>
      'Stödjer djupsömnen, då det mesta tillväxthormonet frisätts';

  @override
  String get supplementCalciumName => 'Kalcium';

  @override
  String get supplementCalciumDose => '1 000–1 300 mg';

  @override
  String get supplementCalciumBenefit =>
      'Den viktigaste byggstenen för bentäthet och tillväxtzoner';

  @override
  String get supplementOmega3Name => 'Omega-3';

  @override
  String get supplementOmega3Dose => '1 000 mg';

  @override
  String get supplementOmega3Benefit =>
      'Minskar inflammation och stödjer friska tillväxtzoner';

  @override
  String get supplementCollagenName => 'Kollagen + C-vitamin';

  @override
  String get supplementCollagenDose => '10 g + 500 mg';

  @override
  String get supplementCollagenBenefit =>
      'C-vitamin hjälper kroppen att använda kollagen för att bygga brosk och benvävnad';

  @override
  String get sciSourcePrefix => 'Källa: ';

  @override
  String get program => 'Program';

  @override
  String get todaysExercises => 'DAGENS ÖVNINGAR';

  @override
  String get dailyNutritionPlan => 'DAGLIG KOSTPLAN';

  @override
  String get nutritionGoalsComplete => '🎉 Alla kostmål klara!';

  @override
  String get nutritionGoalsIncomplete =>
      'Nå dina kostmål för bästa möjliga tillväxt';

  @override
  String get postureDetectingAlignment => 'Känner av ryggradens linjering...';

  @override
  String get testimonial1 =>
      'Jag hade gett upp hoppet på grund av min ålder, men jag växte med BeTaller. Mitt självförtroende har aldrig varit så högt.';

  @override
  String get testimonialDuration1 => '4 månader';

  @override
  String get testimonial2 =>
      'Alla sa ”du kan inte växa mer”. Jag använde BeTaller och överraskade alla.';

  @override
  String get testimonialDuration2 => '3 månader';

  @override
  String get testimonial3 =>
      'Efter att jag började med rutinerna blev jag längre och fick bättre hållning. Alla märkte skillnaden.';

  @override
  String get testimonialDuration3 => '6 månader';

  @override
  String get testimonial4 =>
      'Jag växer fortfarande och effekten av BeTaller är otrolig. Jag känner mig längre och starkare.';

  @override
  String get testimonialDuration4 => '3 månader';

  @override
  String get testimonial5 =>
      'Jag skulle ljuga om jag sa att jag inte testat BeTaller. Jag märkte snabbt en verklig skillnad – rekommenderas varmt.';

  @override
  String get testimonialDuration5 => '4 månader';

  @override
  String get designedForYou => 'Skapad för dig';

  @override
  String get designedForYouDesc =>
      'BeTaller är byggd just för att du ska nå din genetiska gräns, och till och med passera den. Varje funktion, för dig.';

  @override
  String get greetingAllDone => 'Bra jobbat! 🎯';

  @override
  String get greetingAllDoneSub => 'Du har klarat dagens uppgifter.';

  @override
  String greetingStreak30(int streak) {
    return '$streak dagar i rad. Legendarisk nivå.';
  }

  @override
  String greetingStreak7(int streak) {
    return '$streak dagar i rad. Fortsätt så.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak dagar i rad. De flesta ger upp. Inte du.';
  }

  @override
  String get greetingMorning => 'God morgon. En ny dag, en ny chans.';

  @override
  String get greetingAfternoon => 'Idag är en perfekt dag att starta din svit.';

  @override
  String get greetingEvening => 'Gör klart dina uppgifter och starta din svit.';

  @override
  String get todayCompleted => 'Dagen klar ✓';

  @override
  String get todayGoals => 'Dagens mål';

  @override
  String get challengesLabel => 'Utmaningar';

  @override
  String get dailyChallengesLabel => 'DAGLIGA UTMANINGAR';

  @override
  String get expiresTonight => 'Går ut ikväll';

  @override
  String get allChallengesCompleted => 'Alla klara ✓';

  @override
  String get challengesLoading => 'Nya utmaningar laddas snart.';

  @override
  String get challengesLoadingTitle => 'Dagliga utmaningar';

  @override
  String get behindPace => 'Ligger efter';

  @override
  String get growthTracking => 'Tillväxtkoll';

  @override
  String get growthEmptyFirst => 'Logga din första längd för att komma igång.';

  @override
  String get growthEmptySecond =>
      'Logga din andra mätning för att se diagrammet.';

  @override
  String get growthSectionLabel => 'TILLVÄXT';

  @override
  String get generalPerformance => 'TOTAL PRESTATION';

  @override
  String get analysisBalance => 'Din balans';

  @override
  String get analysisWeakest => 'Din svagaste länk';

  @override
  String get analysisPrediction => 'Längdprognos';

  @override
  String get analysisComparison => 'Jämförelse';

  @override
  String get analysisGrowth => 'Tillväxtstatus';

  @override
  String get analysisWeakestHint => 'Här höjer du din poäng snabbast.';

  @override
  String get exploreLabel => 'UTFORSKA';

  @override
  String get explorePosture => 'Hållningsanalys';

  @override
  String get explorePostureSub =>
      'Hållningsanalys och tips för att rätta till den';

  @override
  String get explorePhotos => 'Framstegsfoton';

  @override
  String get explorePhotosSub => 'Följ din förvandling med foton';

  @override
  String get exploreNutrition => 'Kost';

  @override
  String get exploreNutritionSub => 'Guide till protein, kalcium och vitaminer';

  @override
  String get exploreHealth => 'Hälsokoll';

  @override
  String get exploreHealthSub => 'Logga stress, koffein och välmående';

  @override
  String get exploreRecipes => 'Tillväxtrecept';

  @override
  String get exploreRecipesSub => 'Recept som stödjer tillväxten';

  @override
  String get educationLabel => 'KUNSKAP';

  @override
  String get educationTitle => 'Vetenskapen bakom\nlängdtillväxt';

  @override
  String get educationSubtitle => 'Expertinnehåll, forskning och guider';

  @override
  String get aiAnalysisLabel => 'TILLVÄXTANALYS';

  @override
  String get peerCompareLabel => 'JÄMFÖR MED JÄMNÅRIGA';

  @override
  String peerCompareText(int topPct) {
    return 'Du är bland topp $topPct % av dina jämnåriga';
  }

  @override
  String get notifWaterTitle => '💧 Glöm inte att dricka vatten!';

  @override
  String get notifWaterBody =>
      'Har du nått ditt dagliga vattenmål? Drick ett glas till!';

  @override
  String get notifMorningTitle => '🌅 God morgon! Dags att träna';

  @override
  String get notifMorningBody =>
      'Gör din morgonstretch! 10 minuter stretch för rygg och ben.';

  @override
  String get notifRoutineTitle => '🔥 Slutför dina rutiner!';

  @override
  String get notifRoutineBody =>
      'Kolla dina rutiner innan dagen är slut. Svit = disciplin!';

  @override
  String get notifProteinTitle => '🥚 Proteindag!';

  @override
  String get notifProteinBody =>
      'Starta veckan starkt! Få i dig protein till varje måltid.';

  @override
  String get notifNewWeekTitle => '✨ Ny vecka, nya mål!';

  @override
  String get notifNewWeekBody =>
      'Hoppa inte över rutinerna den här veckan. Små steg, stor skillnad!';

  @override
  String get notifSleepTitle => '😴 Dags att sova!';

  @override
  String get notifSleepBody =>
      'Tillväxthormonet toppar mellan kl. 22 och 02. Lägg ifrån dig mobilen!';

  @override
  String get notifPostureTitle => '🧍 Hållningskoll!';

  @override
  String get notifPostureBody =>
      'Rak rygg, axlarna bakåt. Bra hållning = 2–3 cm skillnad!';

  @override
  String get notifVitaminDTitle => '☀️ Dags för D-vitamin!';

  @override
  String get notifVitaminDBody =>
      'Ta 15 minuter i solen! D-vitamin ökar kalciumupptaget.';

  @override
  String get notifMidweekTitle => '✨ Halvvägs!';

  @override
  String get notifMidweekBody =>
      'Mitt i veckan. Tillväxt kräver tålamod, men den som håller i vinner!';

  @override
  String get notifScreenTitle => '📵 Skärmarna av!';

  @override
  String get notifScreenBody =>
      'Inga skärmar 1 timme före läggdags. Blått ljus blockerar melatoninet!';

  @override
  String get notifJumpTitle => '🦘 Dags att hoppa!';

  @override
  String get notifJumpBody =>
      'Hoppövningar stimulerar tillväxtzonerna. Testa 3 x 20 reps!';

  @override
  String get notifCalciumTitle => '🥛 Dags för kalcium!';

  @override
  String get notifCalciumBody =>
      'Ett glas mjölk eller en yoghurt. Kalcium är avgörande för skelettet!';

  @override
  String get notifPostureCheckTitle => '🧍 Hållningskoll!';

  @override
  String get notifPostureCheckBody =>
      'Böj inte nacken ner mot mobilen! Sitt och gå rakt.';

  @override
  String get notifWeekendTitle => '✨ Helgmotivation';

  @override
  String get notifWeekendBody =>
      'Hoppa inte över rutinerna på helgen! Disciplin gäller varje dag.';

  @override
  String get notifWeeklyProgressTitle => '📊 Veckans framsteg';

  @override
  String get notifWeeklyProgressBody =>
      'Hur var din vecka? Kolla ditt tillväxtdiagram!';

  @override
  String get notifMeasureTitle => '📏 Veckans mätning!';

  @override
  String get notifMeasureBody =>
      'Mät och logga din längd! Mätningar på morgonen är mest exakta.';

  @override
  String get notifEarlySleepTitle => '😴 Tidigt i säng!';

  @override
  String get notifEarlySleepBody =>
      'Imorgon är det måndag! Starta veckan starkt med bra sömn.';

  @override
  String get notifStreak3Title => '🔥 3 dagar i rad!';

  @override
  String get notifStreak3Body => 'Bra start! 3 dagar i rad. Fortsätt till 7!';

  @override
  String get notifStreak7Title => '🏆 1 vecka i rad!';

  @override
  String get notifStreak7Body => 'Otroligt! 7 dagar i rad med klara rutiner!';

  @override
  String get notifStreak14Title => '⭐ 2 veckor i rad!';

  @override
  String get notifStreak14Body =>
      '14 dagar av disciplin! Din kropp börjar förändras.';

  @override
  String get notifStreak30Title => '👑 1 månad i rad!';

  @override
  String get notifStreak30Body => '30 dagar! Du är en mästare!';

  @override
  String get notifStreak60Title => '🌟 60 dagar i rad!';

  @override
  String get notifStreak60Body => '60 dagar! En otrolig prestation.';

  @override
  String get notifStreak100Title => '💎 100 DAGAR! LEGENDARISKT!';

  @override
  String get notifStreak100Body => '100 dagar i rad! Du har blivit en legend.';

  @override
  String get notifStreakRiskTitle => '⚠️ Tappa inte din svit!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Din svit på $streak dagar är i fara! Slutför dina rutiner.';
  }

  @override
  String get paywallStat1 => 'cm – din potential är låst';

  @override
  String get paywallTitle1 => 'Hur många cm\nkan du växa?';

  @override
  String get paywallBullet1a =>
      'Ditt genetiska tak är uträknat – vill du se det?';

  @override
  String get paywallBullet1b => 'Hur påverkar din livsstil din tillväxt?';

  @override
  String get paywallBullet1c => 'Din personliga färdplan väntar';

  @override
  String get paywallStat2 => 'din egen rutin är klar';

  @override
  String get paywallTitle2 => 'Din plan\när klar';

  @override
  String get paywallBullet2a =>
      '8 minuter varje morgon – anpassat för din ryggrad';

  @override
  String get paywallBullet2b => 'Sömn, kost, vatten – allt följs upp';

  @override
  String get paywallBullet2c => 'Ett steg närmare varje dag – bryt inte sviten';

  @override
  String get paywallStat3 => 'framstegsdiagram i realtid';

  @override
  String get paywallTitle3 => 'Följ din\ntillväxt';

  @override
  String get paywallBullet3a =>
      'Månadsvisa mätningar – se din tillväxt med egna ögon';

  @override
  String get paywallBullet3b => 'Vinn 2 cm direkt med hållningsanalysen';

  @override
  String get paywallBullet3c => 'Framstegsfoton – du kommer att se skillnaden';

  @override
  String get paywallStat4 => 'dagligt program – nivå upp';

  @override
  String get paywallTitle4 => 'Starkare\nvarje dag';

  @override
  String get paywallBullet4a =>
      'Tjäna XP, lås upp nivåer – vanorna blir ett spel';

  @override
  String get paywallBullet4b => 'De som nådde sitt mål började här';

  @override
  String get paywallBullet4c => 'Börja nu – första veckan gratis';

  @override
  String get paywallRestore => 'Inget tidigare köp hittades';

  @override
  String get paywallRestoreNotFound => 'Inget tidigare köp hittades';

  @override
  String get paywallPromoCode => 'Har du en kampanjkod?';

  @override
  String get paywallHeightUnit => 'mållängd';

  @override
  String get paywallHeightTitle => 'Hur mycket längre kan du bli?';

  @override
  String get paywallHeightDesc =>
      'Vi analyserar dina gener, din livsstil och din hållning tillsammans och visar prognosen år för år. Inget är fast: varje steg du tar uppdaterar den.';

  @override
  String get paywallGrowthUnit => 'i år';

  @override
  String get paywallGrowthTitle => 'Vi följer din tillväxt tillsammans med dig';

  @override
  String get paywallGrowthDesc =>
      'Varje mätning hamnar direkt i diagrammet. Du ser dina framsteg månad för månad, centimeter för centimeter.';

  @override
  String get paywallPostureUnit => 'hållningspoäng';

  @override
  String get paywallPostureTitle => 'Din hållning är nyckeln till dina rutiner';

  @override
  String get paywallPostureDesc =>
      'En snabb koll med 3 frågor om huvud, axlar och ländrygg, med exakt de övningar som rättar till var och en.';

  @override
  String get paywallReportUnit => 'rutiner klara';

  @override
  String get paywallReportTitle => 'Vi går igenom din vecka varje vecka';

  @override
  String get paywallReportDesc =>
      'Vatten, sömn, rutiner och svit på en skärm. Varje vecka hittar vi tillsammans dina styrkor och luckor.';

  @override
  String get paywallNutritionUnit => 'måltider om dagen';

  @override
  String get paywallNutritionTitle => 'Din kompletta kostplan är klar';

  @override
  String get paywallNutritionDesc =>
      'Från frukost till middag – en hel dagsplan där protein, kalcium, zink och D-vitamin redan är uträknade.';

  @override
  String get paywallScoreUnit => 'BeTaller-poäng';

  @override
  String get paywallScoreTitle => 'Systemet som hela tiden driver dig framåt';

  @override
  String get paywallScoreDesc =>
      'Genetik, tillväxt, kost, sömn och disciplin blir en enda poäng. Så fort den sjunker ser du exakt var du kan förbättra dig.';

  @override
  String get paywallPhotosUnit => 'synlig skillnad';

  @override
  String get paywallPhotosTitle => 'Bevisa din förändring med foton';

  @override
  String get paywallPhotosDesc =>
      'Före- och efterjämförelser skapas av sig själva, och varje månads foto hamnar bredvid de andra på din tidslinje.';

  @override
  String get paywallReportStat => '82 %';

  @override
  String get journeyIntroTitle => 'Vi börjar i tre steg';

  @override
  String get journeyIntroSubtitle =>
      'Vi ställer in BeTaller tillsammans. Ditt nästa steg väntar.';

  @override
  String get journeyStep1Title => 'Vi samlar in dina uppgifter';

  @override
  String get journeyStep1Desc =>
      'Vi tar din längd, ålder och livsstil och räknar sedan ut din potential.';

  @override
  String get journeyStep2Title => 'En rundtur i appen';

  @override
  String get journeyStep2Desc =>
      'Vi går igenom varje funktion: vad den gör och hur du använder den.';

  @override
  String get journeyStep3Title => 'Använd den själv';

  @override
  String get journeyStep3Desc =>
      'Du kör din dagliga rutin och vi håller koll på dina framsteg.';

  @override
  String get journeyNow => 'NU';

  @override
  String get journeyDone => 'KLART';

  @override
  String get journeySoon => 'SNART';

  @override
  String get tourHomeStreakTitle => 'Din svit';

  @override
  String get tourHomeStreakDesc =>
      'Växer så länge du håller disciplinen. Missar du en dag börjar den om.';

  @override
  String get tourHomeXpTitle => 'Din nivå';

  @override
  String get tourHomeXpDesc =>
      'Stiger med XP:n du tjänar genom att vara disciplinerad. Tappa inte tråden!';

  @override
  String get tourHomeGoalsTitle => 'Dagens mål';

  @override
  String get tourHomeGoalsDesc =>
      'Visar dagens rutiner, uppgifter och vattenmål på ett ögonkast, så att inget glöms bort.';

  @override
  String get tourHomeTrackTitle => 'Vatten- & sömnlogg';

  @override
  String get tourHomeTrackDesc =>
      'Logga ditt vatten och din sömn här på några sekunder.';

  @override
  String get tourPlanTabsTitle => 'Tre flikar: Idag, Disciplin, Kost';

  @override
  String get tourPlanTabsDesc =>
      'Din dagliga rutin, ditt veckoprogram och din kostplan finns här.';

  @override
  String get tourPlanLevelTitle => 'Din disciplinnivå';

  @override
  String get tourPlanLevelDesc =>
      'Visar hur jämnt du slutför dina rutiner. Gå upp i nivå för bättre resultat.';

  @override
  String get tourPlanTodayTitle => 'Dagens plan';

  @override
  String get tourPlanTodayDesc =>
      'Bocka av dina dagliga rutiner här för att bygga din svit.';

  @override
  String get tourPlanTodayListTitle => 'Dina rutiner för idag';

  @override
  String get tourPlanTodayListDesc =>
      'Bocka av var och en när du gjort den. Tryck på en rutin för att se detaljerna.';

  @override
  String get tourPlanWeekGoalsTitle => 'Den här veckan';

  @override
  String get tourPlanWeekGoalsDesc =>
      'Perfekta dagar, träningspass och veckans mätning, inklusive den obligatoriska.';

  @override
  String get tourPlanMonthGoalsTitle => 'Den här månaden';

  @override
  String get tourPlanMonthGoalsDesc =>
      'Framstegsfoton, en hållningskoll och månadens mätningar: de du inte ska hoppa över.';

  @override
  String get tourProgressHeightTitle => 'Din nuvarande längd';

  @override
  String get tourProgressHeightDesc =>
      'Visar din längd just nu och hur mycket du vuxit totalt. Lägg till en ny mätning härifrån.';

  @override
  String get tourProgressPhotosTitle => 'Framstegsfoton';

  @override
  String get tourProgressPhotosDesc =>
      'Följ din förvandling visuellt med foton som du tar regelbundet.';

  @override
  String get tourProgressPostureTitle => 'Hållningsanalys';

  @override
  String get tourProgressPostureDesc =>
      'Få din hållning analyserad från ett foto och se vad du ska jobba på.';

  @override
  String get tourAnalysisScoreTitle => 'Din BeTaller-poäng';

  @override
  String get tourAnalysisScoreDesc =>
      'Din totala prestationspoäng, beräknad utifrån genetik, tillväxttakt, kost och sömn.';

  @override
  String get tourAnalysisPredictionTitle => 'Din längdprognos';

  @override
  String get tourAnalysisPredictionDesc =>
      'Visar din beräknade slutlängd och din kurva år för år.';

  @override
  String get tourAnalysisPeerTitle => 'Jämför med jämnåriga';

  @override
  String get tourAnalysisPeerDesc =>
      'Se var du hamnar och jämför dig med andra i din ålder.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'Dina rutiner';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'Se hur många träningsrutiner du har kvar idag.';

  @override
  String get tourHomeGoalsChallengesTitle => 'Dina uppgifter';

  @override
  String get tourHomeGoalsChallengesDesc => 'Följ dina aktiva utmaningar här.';

  @override
  String get tourHomeGoalsWaterTitle => 'Ditt vattenmål';

  @override
  String get tourHomeGoalsWaterDesc =>
      'Se hur nära du är ditt dagliga vattenmål.';

  @override
  String get tourHomeReminderTitle => 'Din nästa påminnelse';

  @override
  String get tourHomeReminderDesc =>
      'Se när nästa påminnelse kommer och ändra den härifrån.';

  @override
  String get tourHomeChallengesTitle => 'Dina utmaningar';

  @override
  String get tourHomeChallengesDesc =>
      'Klara aktiva utmaningar för att tjäna extra XP.';

  @override
  String get tourHomeGrowthTitle => 'Din tillväxtstatus';

  @override
  String get tourHomeGrowthDesc =>
      'Se skillnaden mellan din totala och senaste mätning, och hur många du har loggat.';

  @override
  String get tourHomeExploreTitle => 'Utforska';

  @override
  String get tourHomeExploreDesc =>
      'Kostguider, tillväxtrecept och mer väntar på dig här.';

  @override
  String get tourPlanProgramHeaderTitle => 'Ditt 70-dagarsprogram';

  @override
  String get tourPlanProgramHeaderDesc =>
      'Se dina totala framsteg, din nuvarande nivå och dag i den här ringen.';

  @override
  String get tourPlanProgramLevelsTitle => 'Nivåer';

  @override
  String get tourPlanProgramLevelsDesc =>
      'Se vilken av de 10 nivåerna du är på och vilka som fortfarande är låsta.';

  @override
  String get tourPlanNutritionHeaderTitle => 'Dina kostframsteg';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'Se hur många av dina dagliga kostrutiner du har klarat.';

  @override
  String get tourPlanNutritionFirstTitle => 'Kostrutiner';

  @override
  String get tourPlanNutritionFirstDesc =>
      'Bocka av kostvanorna som stödjer din tillväxt.';

  @override
  String get tourProgressChartTitle => 'Tillväxtkurva';

  @override
  String get tourProgressChartDesc =>
      'Se dina tidigare mätningar i ett diagram och förstå vart du är på väg.';

  @override
  String get tourProgressReportTitle => 'Veckorapport';

  @override
  String get tourProgressReportDesc =>
      'Gå igenom rapporten som sammanfattar veckans framsteg.';

  @override
  String get tourProgressHistoryTitle => 'Din mäthistorik';

  @override
  String get tourProgressHistoryDesc =>
      'Se alla längdmätningar du har loggat på en tidslinje.';

  @override
  String get tourAnalysisRadarTitle => 'Ditt balansdiagram';

  @override
  String get tourAnalysisRadarDesc =>
      'Se balansen mellan genetik, tillväxttakt, kost, sömn och disciplin i ett radardiagram och ta reda på din svagaste länk.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'Ditt dagliga behov';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'Se ditt dagliga behov av protein, kalorier, sömn och vatten, anpassat efter din längd och vikt.';

  @override
  String get journeyDataDoneTitle => 'Första steget klart';

  @override
  String get journeyDataDoneSubtitle =>
      'Vi har dina uppgifter och din potential. Nu kommer rundturen i appen.';

  @override
  String get journeyContinue => 'Fortsätt';

  @override
  String get journeyEnterApp => 'Till appen';

  @override
  String get journeyProgressLabel => 'Kom igång';

  @override
  String get journeyTourDoneTitle => 'Välkommen till BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'Du har klarat alla tre stegen. Nu är det din tur: starta din resa genom att slutföra din första rutin.';

  @override
  String get journeyViewPlansButton => 'Se planerna och kom igång';

  @override
  String get paywallRestoreLabel => 'Återställ köp';

  @override
  String get paywallYearly => 'Årsvis';

  @override
  String get paywallBestValue => 'Bästa värdet';

  @override
  String paywallSavePercent(String percent) {
    return 'SPARA $percent %';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/vecka';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/månad';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/år';
  }

  @override
  String get paywallMonthly => 'Månadsvis';

  @override
  String get paywallWeekly => 'Veckovis';

  @override
  String get paywallFreeTrial => '3 dagar gratis';

  @override
  String get paywallLoadError =>
      'Kunde inte ladda köpalternativen, försök igen';

  @override
  String get paywallCtaAlt => 'Fortsätt';

  @override
  String get paywallTrialDisclaimer =>
      '3 dagar gratis · förnyas sedan automatiskt · avsluta när du vill';

  @override
  String get paywallYearlyDisclaimer =>
      'Förnyas automatiskt varje år · avsluta när du vill';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '$days dagar gratis, sedan $price/vecka · avsluta när du vill';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '$days dagar gratis, sedan $price/månad · avsluta när du vill';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '$days dagar gratis, sedan $price/år · avsluta när du vill';
  }

  @override
  String get paywallRenewsWeekly =>
      'Förnyas automatiskt varje vecka · avsluta när du vill';

  @override
  String get paywallRenewsMonthly =>
      'Förnyas automatiskt varje månad · avsluta när du vill';

  @override
  String get resultCardTitle => 'Din beräknade vuxenlängd';

  @override
  String resultRange(String min, String max) {
    return 'Troligt spann: $min till $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'Längre än $percent % av alla i din ålder';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'Beräknad tillväxt kvar: $amount';
  }

  @override
  String get resultFootnote =>
      'En uppskattning baserad på dina föräldrars längd och data från tillväxtkurvor. Inte medicinsk rådgivning.';

  @override
  String get postureCheckTitle => 'Snabb hållningskoll';

  @override
  String get postureCheckIntro =>
      'Stå med hälar, höfter och skulderblad mot en vägg och svara sedan på tre frågor. Din poäng kommer från dina svar; fotot sparas för att jämföra före och efter.';

  @override
  String get postureQHead => 'Når bakhuvudet väggen utan att du lyfter hakan?';

  @override
  String get postureQHeadA1 => 'Ja, lätt';

  @override
  String get postureQHeadA2 => 'Bara om jag trycker bakåt';

  @override
  String get postureQHeadA3 => 'Nej, det är ett mellanrum';

  @override
  String get postureQShoulders =>
      'Var är dina axlar jämfört med öronen på fotot från sidan?';

  @override
  String get postureQShouldersA1 => 'I linje med öronen';

  @override
  String get postureQShouldersA2 => 'Lite framför';

  @override
  String get postureQShouldersA3 => 'Tydligt framåtrundade';

  @override
  String get postureQLowerBack =>
      'Skjut in en hand bakom ländryggen. Hur mycket plats finns det?';

  @override
  String get postureQLowerBackA1 => 'En platt hand får precis plats';

  @override
  String get postureQLowerBackA2 => 'Ingen plats alls';

  @override
  String get postureQLowerBackA3 => 'En knytnäve får plats';

  @override
  String get postureCheckSave => 'Visa min poäng';

  @override
  String get postureCheckNote => 'Ett självtest, inte en medicinsk bedömning.';

  @override
  String get paywallTester => 'Testare';

  @override
  String get introTag1 => 'PROGNOS';

  @override
  String get introTag2 => 'TILLVÄXT';

  @override
  String get introTag3 => 'UPPFÖLJNING';

  @override
  String get introTag4 => 'SPELIFIERING';

  @override
  String get introTag5 => 'GEMENSKAP';

  @override
  String get introTitle1 => 'Upptäck din\nlängdpotential';

  @override
  String get introSubtitle1 =>
      'Låt oss räkna ut hela din potential\nutifrån genetik, ålder och livsstil.';

  @override
  String get introTitle2 => 'Ett steg längre\nvarje dag';

  @override
  String get introSubtitle2 =>
      'Nå din fulla potential med personliga\ntränings- och kostplaner.';

  @override
  String get introTitle3 => 'Följ varje\ncentimeter';

  @override
  String get introSubtitle3 =>
      'Se hur dina verkliga framsteg\nutvecklas med månadsvisa mätningar.';

  @override
  String get introTitle4 => 'Gå upp i nivå,\ntjäna belöningar';

  @override
  String get introSubtitle4 =>
      'Klara 70-dagarsprogram,\ntjäna XP och lås upp nya nivåer.';

  @override
  String get introTitle5 => 'Tusentals har\nredan blivit längre';

  @override
  String get introSubtitle5 =>
      'Bli en del av gemenskapen\nsom har nått sina mål.';

  @override
  String get criticalWindow => 'KRITISKT FÖNSTER';

  @override
  String get heightPotentialFading => 'Fakta om din';

  @override
  String get fadingAway => 'längdpotential..';

  @override
  String get painHookDesc =>
      'För varje dag som går försvinner centimetrar för gott utan rätt vanor. Men det går fortfarande att vända.';

  @override
  String get painGeneticTitle => 'Generna är inte allt';

  @override
  String get painGeneticDesc =>
      'Generna avgör 60 %, men det du gör avgör resterande 40 %. BeTaller finns här för just de 40 %.';

  @override
  String get painGeneticTag => 'Analys';

  @override
  String get painSleepTitle => 'Optimera din sömnrutin';

  @override
  String get painSleepDesc =>
      'Rätt sömn varje natt kan öka produktionen av tillväxthormon med 70 %. BeTaller sköter sömnloggen åt dig – du bara sover.';

  @override
  String get painSleepTag => 'Uppföljning';

  @override
  String get painPostureTitle => 'Vinn centimetrar nu med hållningen';

  @override
  String get painPostureDesc =>
      'Rätt hållning kan direkt ge 1,5–3 cm. BeTallers dagliga hållningsrutin bygger upp det på några veckor.';

  @override
  String get painPostureTag => 'Hållning';

  @override
  String get painExerciseTitle => 'Din egen träningsplan är klar';

  @override
  String get painExerciseDesc =>
      'Morgonstretch, häng, ryggrutiner: BeTaller har förberett och schemalagt allt åt dig. Bara 8–12 minuter om dagen.';

  @override
  String get painExerciseTag => 'Rutiner';

  @override
  String get painNutritionTitle => 'Din kost påverkar tillväxten direkt';

  @override
  String get painNutritionDesc =>
      'Protein, kalcium, D-vitamin: BeTaller påminner dig varje dag om vilka näringsämnen du ska få i dig och när.';

  @override
  String get painNutritionTag => 'Kost';

  @override
  String get painTrackingTitle => 'Se din tillväxt med egna ögon';

  @override
  String get painTrackingDesc =>
      'Månadsvisa mätningar, framstegsfoton, tillväxtdiagram: se varje centimeter du vinner.';

  @override
  String get painTrackingTag => 'Framsteg';

  @override
  String get selectYourGender => 'Välj ditt kön';

  @override
  String get onboardingPredictSubtitle =>
      'Det används för att beräkna din längdpotential och skapa din personliga plan.';

  @override
  String get other => 'Annat';

  @override
  String get whenWereYouBorn => 'När är du född?';

  @override
  String get heightAndWeight => 'Längd & vikt';

  @override
  String get parentsHeight => 'Föräldrarnas längd';

  @override
  String get weeklyWorkout => 'Träning per vecka';

  @override
  String get workoutsPerWeek => 'Träningspass per vecka';

  @override
  String get whatsYourEthnicity => 'Vilken är din etniska bakgrund?';

  @override
  String get whiteCaucasian => 'Vit / europeisk';

  @override
  String get blackAfricanAmerican => 'Svart / afroamerikansk';

  @override
  String get hispanicLatino => 'Hispanic / latino';

  @override
  String get asian => 'Asiatisk';

  @override
  String get middleEasternIndigenous => 'Mellanöstern / urfolk';

  @override
  String get dontWantToAnswer => 'Vill inte svara';

  @override
  String get footSizeLabel => 'Skostorlek';

  @override
  String get selectYourSize => 'Välj din storlek';

  @override
  String get whatsYourDreamHeight => 'Vilken är din drömlängd?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Utifrån dina svar räknar vi ut hur troligt det är att du når den längden.';

  @override
  String get dreamHeightLabel => 'Drömlängd';

  @override
  String get sleepQuestion => 'Hur många timmar\nsover du per natt?';

  @override
  String get thousandsSucceeded => 'Tusentals har\nlyckats';

  @override
  String get youCanToo => 'Du kan också';

  @override
  String get yearsOld => 'år';

  @override
  String get verifiedLabel => 'Verifierad';

  @override
  String get scientificData => 'VETENSKAPLIGA DATA';

  @override
  String get longTermResults => 'BeTaller ger\nlångsiktiga resultat';

  @override
  String get longTermResultsSubtitle =>
      'Många når aldrig sin fulla längd på grund av dåliga vanor.';

  @override
  String get yourFinalHeight => 'Din slutlängd';

  @override
  String get badHabitsLegend => 'Dåliga vanor';

  @override
  String get optimizedLegend => 'Optimerat';

  @override
  String get chartFact1Pct => '30 %';

  @override
  String get chartFact1Desc => 'Längden kan påverkas\nav vanor';

  @override
  String get chartFact2Pct => '9–10 h';

  @override
  String get chartFact2Desc => 'Bra sömn ökar\ntillväxthormonet';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Kan vinnas med\nbättre hållning';

  @override
  String get didYouKnow => 'Visste du?';

  @override
  String get didYouKnowFact1 => 'Dagliga vanor påverkar 30 % av din längd';

  @override
  String get didYouKnowFact2 => 'Kompression av ryggraden stjäl 1,5–3 cm längd';

  @override
  String get didYouKnowFact3 => 'Sömnbrist minskar HGH med 70 %';

  @override
  String get transformJourneyBegins => 'Din förvandling\nbörjar nu';

  @override
  String get transformJourneySubtitle =>
      'Ett heltäckande program som stödjer\ndin sunda tillväxt, steg för steg.';

  @override
  String get week1Label => '1V';

  @override
  String get week1Title => 'Vecka 1';

  @override
  String get week1Desc => 'Ryggradens linjering och hållningen blir bättre';

  @override
  String get month1Label => '1M';

  @override
  String get month1Title => 'Månad 1';

  @override
  String get month1Desc =>
      'De första synliga centimetrarna, bättre sömnkvalitet';

  @override
  String get month3Label => '3M';

  @override
  String get month3Title => 'Månad 3';

  @override
  String get month3Desc => 'I snitt +1,5–2,5 cm, muskelutveckling';

  @override
  String get month6Label => '6M';

  @override
  String get month6Title => 'Månad 6';

  @override
  String get month6Desc =>
      'Nå din maximala potential och lev med din nya längd';

  @override
  String get reachYourGoal => 'Nå ditt mål';

  @override
  String get journeyBullet1 => 'Lås upp din maximala potential';

  @override
  String get journeyBullet2 => 'Börja leva med din nya längd';

  @override
  String get journeyBullet3 => 'Skriv din egen framgångssaga';

  @override
  String get unlockButton => 'Lås upp allt';

  @override
  String get dreamHeightOdds => 'Chans att nå\ndrömlängden';

  @override
  String get growthCompleteLabel => 'Tillväxt\nklar';

  @override
  String get tallerThanPct => 'Längre än 76,7 % i din ålder';

  @override
  String get levelNovice => 'Novis';

  @override
  String get levelBuilder => 'Byggare';

  @override
  String get levelGrinder => 'Slitvarg';

  @override
  String get levelWarrior => 'Krigare';

  @override
  String get levelGodTier => 'Gudanivå';

  @override
  String get levelDesc0 => 'Bygg din grund';

  @override
  String get levelDesc1 => 'Öka tillväxttakten';

  @override
  String get levelDesc2 => 'Intensifiera träningen';

  @override
  String get levelDesc3 => 'Tänj dina gränser';

  @override
  String get levelDesc4 => 'Inget slit, ingen vinst';

  @override
  String get levelDesc5 => 'Mästarmentalitet';

  @override
  String get levelDesc6 => 'Elitprestation';

  @override
  String get levelDesc7 => 'Bemästra din kropp';

  @override
  String get levelDesc8 => 'Legendarisk disciplin';

  @override
  String get levelDesc9 => 'Maximal potential';

  @override
  String levelLabel(int level) {
    return 'NIVÅ $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar kvar',
      one: '$days dag kvar',
    );
    return '$_temp0 av ditt program';
  }

  @override
  String get tapLabel => 'TRYCK';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100 g';
  }

  @override
  String get dayShort => 'Dag';

  @override
  String get legendShort => 'Kort';

  @override
  String get legendBelowAvg => 'Under snitt';

  @override
  String get legendAverage => 'Snitt';

  @override
  String get legendTall => 'Lång';

  @override
  String get legendVeryTall => 'Mycket lång';

  @override
  String get pctBottom5 => 'Lägsta 5 %';

  @override
  String get pctBottom25 => 'Lägsta 25 %';

  @override
  String get pctMedian => 'Median';

  @override
  String get pctTop25 => 'Topp 25 %';

  @override
  String get pctTop5 => 'Topp 5 %';

  @override
  String get fallingBehind => 'Du halkar efter';

  @override
  String readTimeMinutes(int minutes) {
    return '$minutes min läsning';
  }

  @override
  String get inThisArticle => 'I den här artikeln';

  @override
  String get nextArticle => 'Nästa artikel';

  @override
  String get purchaseUnavailable => 'Köpet kunde inte genomföras. Försök igen.';

  @override
  String get viewPlan => 'Visa plan';

  @override
  String get viewPlanSubtitle => 'Se detaljer om ditt abonnemang';

  @override
  String predictionConfidenceHint(String percent) {
    return 'Med fler längdmätningar blir prognosen $percent % säker';
  }

  @override
  String get paywallSlideHomeTitle => 'Din dag på en skärm';

  @override
  String get paywallSlideHomeCaption =>
      'Rutiner, vatten, sömn: tre ringar att sluta.';

  @override
  String get paywallSlideProgressTitle => 'Se varje centimeter';

  @override
  String get paywallSlideProgressCaption =>
      'Varje mätning hamnar direkt på kurvan.';

  @override
  String get paywallSlideAnalysisTitle => 'Fem mått, en form';

  @override
  String get paywallSlideAnalysisCaption => 'Radarn visar din svagaste länk.';

  @override
  String get paywallSlidePotentialTitle => 'Känn din potential';

  @override
  String get paywallSlidePotentialCaption =>
      'Se var du står bland dina jämnåriga.';

  @override
  String get paywallSlideDisciplineTitle => 'Håll sviten';

  @override
  String get paywallSlideDisciplineCaption => 'Varje dag höjer din nivå.';

  @override
  String get paywallSlideRemindersTitle => 'En knuff i rätt tid';

  @override
  String get paywallSlideRemindersCaption =>
      'Välj dina tider, appen sköter resten.';

  @override
  String get paywallSlidePostureTitle => 'Rätta till hållningen';

  @override
  String get paywallSlidePostureCaption =>
      'Ett foto från sidan, ett snabbt självtest, en tydlig rutin.';

  @override
  String paywallTrialHeadline(String days) {
    return '$days DAGAR GRATIS';
  }

  @override
  String paywallTrialThen(String price) {
    return 'Sedan $price · avsluta när du vill';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / år · avsluta när du vill';
  }

  @override
  String get obBedtimeTitle => 'När brukar du lägga dig?';

  @override
  String get obBedtimeSubtitle =>
      'Din sömnpåminnelse ställs in runt den här tiden.';

  @override
  String get obWorkoutTimeTitle => 'När brukar du träna?';

  @override
  String get obWorkoutTimeSubtitle =>
      'Så att din träningspåminnelse kommer i rätt tid.';

  @override
  String get obMealsTitle => 'Hur många måltider om dagen?';

  @override
  String get obMealsSubtitle =>
      'Tryck på en tid för att anpassa den till din rutin.';

  @override
  String obMealsCount(String count) {
    return '$count måltider';
  }

  @override
  String obMealLabel(String n) {
    return 'Måltid $n';
  }

  @override
  String get obProteinTitle => 'Hur många gram protein om dagen?';

  @override
  String get obProteinSubtitle =>
      'En ungefärlig siffra räcker. Vi bygger din plan runt den.';

  @override
  String get obCaloriesTitle => 'Hur många kalorier om dagen i snitt?';

  @override
  String get obCaloriesSubtitle =>
      'En uppskattning räcker; vi kan finjustera den tillsammans senare.';

  @override
  String get obNotSure => 'Jag vet inte';

  @override
  String get silNow => 'NU';

  @override
  String get silPotential => 'POTENTIAL';

  @override
  String get chartMeasured => 'Dina mätningar';

  @override
  String chartPotential(String height) {
    return 'Potential $height';
  }

  @override
  String chartDream(String height) {
    return 'Ditt mål $height';
  }

  @override
  String get targetsTitle => 'Idag, för dig';

  @override
  String get targetsSubtitle => 'Uträknat från din ålder, vikt och träning.';

  @override
  String get targetProtein => 'Protein';

  @override
  String get targetCalcium => 'Kalcium';

  @override
  String get targetVitaminD => 'D-vitamin';

  @override
  String get targetWater => 'Vatten';

  @override
  String get targetSleep => 'Sömn';

  @override
  String get targetMove => 'Träning';

  @override
  String targetPerMeal(String g) {
    return '$g g per måltid';
  }

  @override
  String get unitHours => 'h';

  @override
  String get unitMinutes => 'min';

  @override
  String get planStrength => 'Styrka';

  @override
  String get planJump => 'Hopp & sprinter';

  @override
  String get planMobility => 'Stretch';

  @override
  String get planSport => 'Idrott';

  @override
  String get planPosture => 'Hållning';

  @override
  String get planRest => 'Vila';

  @override
  String planWeekTitle(int days) {
    return 'Din vecka: $days träningsdagar';
  }

  @override
  String get planPreviewTitle => 'Din plan är klar';

  @override
  String planPreviewTraining(int days) {
    return '$days träningsdagar i veckan, byggda för tillväxt';
  }

  @override
  String planPreviewProtein(int grams) {
    return '$grams g protein om dagen, fördelat på dina måltider';
  }

  @override
  String planPreviewSleep(String hours) {
    return '$hours timmars sömn, med en påminnelse vid läggdags';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'Idag: $plan · $minutes min';
  }

  @override
  String get nRestTitle => 'Vilodag idag';

  @override
  String get nRestBody =>
      'Tio minuter stretch räcker. Återhämtning är en del av planen.';

  @override
  String nProteinTitle(int grams) {
    return 'Dagens proteinmål: $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return 'Cirka $grams g per måltid: ägg, yoghurt, kyckling, linser.';
  }

  @override
  String nWaterTitle(String liters) {
    return 'Vattenmål: $liters';
  }

  @override
  String get nWaterBody => 'Ett glas nu håller dig på rätt spår idag.';

  @override
  String get nSleepTitle => 'Dags att varva ner';

  @override
  String nSleepBody(String hours) {
    return 'Ditt mål är $hours timmar. Skärmarna av, dämpa ljuset.';
  }

  @override
  String nMeasureBody(String potential) {
    return 'Din potential: $potential. Mät på morgonen och se diagrammet röra sig.';
  }

  @override
  String get nTrialDay1Title => 'Din plan väntar';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'Idag: $plan, $minutes min. Logga din längd så att diagrammet kommer igång.';
  }

  @override
  String get nTrialEndTitle => 'Din gratisperiod slutar imorgon';

  @override
  String nTrialEndBody(String price) {
    return 'Sedan fortsätter den för $price. Din plan och dina framsteg sparas oavsett.';
  }

  @override
  String get trophyContinue => 'Fortsätt så';

  @override
  String get guideSteps => 'Steg för steg';

  @override
  String get guideMistakes => 'Vanliga misstag';

  @override
  String get guideTip => 'Tips';

  @override
  String get homeHeroTitle => 'Din längd och din potential';

  @override
  String homeHeroGap(String cm) {
    return '$cm kvar att växa';
  }

  @override
  String get anSubtitle =>
      'Din poäng, vad som påverkar den och vart du är på väg';

  @override
  String get anScoreLabel => 'BeTaller-poäng';

  @override
  String get anTierStarting => 'Start';

  @override
  String get anTierBuilding => 'Bygger';

  @override
  String get anTierRising => 'Stigande';

  @override
  String get anTierStrong => 'Stark';

  @override
  String get anTierPeak => 'Topp';

  @override
  String anTrendUp(int n) {
    return '+$n mot förra veckan';
  }

  @override
  String anTrendDown(int n) {
    return '-$n mot förra veckan';
  }

  @override
  String get anTrendFlat => 'Samma som förra veckan';

  @override
  String get anTrendFirst => 'Din veckotrend börjar nästa vecka';

  @override
  String anNextTier(int n, String tier) {
    return '$n poäng till $tier';
  }

  @override
  String get anTopTier => 'Högsta nivån. Håll dig kvar';

  @override
  String anCoverage(int n, int total) {
    return 'Baserat på $n av $total signaler';
  }

  @override
  String get anNoScoreTitle => 'För lite data än';

  @override
  String get anNoScoreBody =>
      'Logga sömn, lite vatten eller ett träningspass idag så dyker din första poäng upp.';

  @override
  String get anFastestWin => 'Snabbaste vinsten';

  @override
  String get anBreakdownTitle => 'Det här bygger din poäng';

  @override
  String get anBreakdownHint =>
      'Varje signal får 0 till 100 poäng utifrån dina egna data. Procenten visar hur mycket den väger.';

  @override
  String anWeight(int n) {
    return '$n %';
  }

  @override
  String get anNoData => 'Inga data än';

  @override
  String get anNotCounted => 'Räknas inte';

  @override
  String get anFTraining => 'Träning';

  @override
  String get anFConsistency => 'Jämnhet';

  @override
  String get anFSleep => 'Sömn';

  @override
  String get anFHydration => 'Vätska';

  @override
  String get anFNutrition => 'Kost';

  @override
  String get anFPosture => 'Hållning';

  @override
  String get anFMeasuring => 'Mätning';

  @override
  String get anFGrowth => 'Tillväxttakt';

  @override
  String get anFHeadroom => 'Kvar att växa';

  @override
  String anBTraining(int done, int planned) {
    return '$done av $planned planerade träningsdagar de senaste 7 dagarna';
  }

  @override
  String get anBTrainingNone =>
      'Räknar dagarna du tränar jämfört med din veckoplan.';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak dagar',
      one: '$streak dag',
    );
    return 'Svit $_temp0, $active av $days dagar med halva planen klar';
  }

  @override
  String get anBConsistencyNone =>
      'Räknar din svit och dagarna då du klarar minst halva planen.';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days nätter',
      one: '$days natt',
    );
    return '$hours h per natt i snitt, mål $target h, $_temp0 loggade';
  }

  @override
  String get anBSleepNone => 'Ingen sömn loggad de senaste 7 dagarna.';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '$days dag',
    );
    return '$litres per dag i snitt, mål $target, $_temp0 loggade';
  }

  @override
  String get anBHydrationNone => 'Inget vatten loggat de senaste 7 dagarna.';

  @override
  String anBNutrition(int done, int planned) {
    return '$done av $planned kostvanor klara de senaste 7 dagarna';
  }

  @override
  String get anBNutritionNone =>
      'Räknar vanorna för protein, kalcium, zink och D-vitamin i din plan.';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '$days dag',
    );
    return 'Självtest mot vägg $raw/90, för $_temp0 sedan';
  }

  @override
  String anBPostureToday(int raw) {
    return 'Självtest mot vägg $raw/90, idag';
  }

  @override
  String get anBPostureNone => 'Inget hållningstest än.';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '$days dag',
    );
    return 'Senast mätt för $_temp0 sedan';
  }

  @override
  String get anBMeasuringToday => 'Mätt idag';

  @override
  String get anBMeasuringNone => 'Ingen mätning än.';

  @override
  String anBGrowth(String v, String e) {
    return '$v per år, vanligt i din ålder $e';
  }

  @override
  String get anBGrowthNone =>
      'Kräver två mätningar med minst 30 dagars mellanrum.';

  @override
  String get anBGrowthAdult =>
      'Tillväxtzonerna sluts oftast vid 21, så tillväxttakten räknas inte för dig.';

  @override
  String anBHeadroom(String cm) {
    return '$cm mellan idag och din potential';
  }

  @override
  String get anATraining => 'Starta dagens träning';

  @override
  String get anAConsistency => 'Klara halva dagens plan';

  @override
  String get anASleepLog => 'Logga nattens sömn';

  @override
  String anASleep(String target) {
    return 'Sov $target h inatt';
  }

  @override
  String get anAHydrationLog => 'Logga ett glas vatten';

  @override
  String anAHydration(String left) {
    return 'Drick $left till idag';
  }

  @override
  String get anAHydrationDone => 'Målet nått idag. Samma sak imorgon';

  @override
  String get anANutrition => 'Bocka av dagens kostvanor';

  @override
  String get anAPostureFirst => 'Gör ett hållningstest på 1 minut';

  @override
  String get anAPostureRedo => 'Gör om hållningstestet';

  @override
  String get anAPostureKeep => 'Håll fast vid den dagliga hållningsrutinen';

  @override
  String get anAMeasure => 'Mät din längd nu';

  @override
  String get anAMeasureKeep => 'Mät igen nästa vecka';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '$days dag',
    );
    return 'Mät igen om $_temp0';
  }

  @override
  String get anAGrowth => 'Mät varannan vecka för att följa den';

  @override
  String get anAHeadroom => 'Se din potential';

  @override
  String get anPotentialTitle => 'Din potential';

  @override
  String get anPotentialLabel => 'Beräknad vuxenlängd';

  @override
  String anPotentialToGo(String cm) {
    return '+$cm kvar';
  }

  @override
  String get anPotentialReached => 'Du har nått din beräknade längd';

  @override
  String get anPotentialNote =>
      'Samma siffra överallt i appen. Den kan bara gå uppåt.';

  @override
  String anDreamLine(String h) {
    return 'Ditt mål: $h';
  }

  @override
  String get anSourcesTitle => 'Var centimetrarna kommer ifrån';

  @override
  String get anSourcesGenes => 'Gener och ålder';

  @override
  String get anSourcesHabits => 'Sömn, mat, träning';

  @override
  String get anSourcesPosture => 'Hållning';

  @override
  String get anPctTitle => 'Längd för din ålder';

  @override
  String anPctValue(int p) {
    return 'Längre än $p % av alla i din ålder';
  }

  @override
  String get anPctBasis => 'US CDC:s tillväxtkurvor, samma ålder och kön';

  @override
  String get anPctMore => 'Hela jämförelsen';

  @override
  String get anNeedsBasis => 'Uträknat från din ålder, vikt och träning';

  @override
  String get anCalcium => 'Kalcium';

  @override
  String get anVitaminD => 'D-vitamin';

  @override
  String get anMovement => 'Rörelse';

  @override
  String get anUnitMin => 'min';

  @override
  String get anUnitHours => 'h';

  @override
  String get anPerDay => 'per dag';

  @override
  String get anPerNight => 'per natt';

  @override
  String get anUnlockScoreTitle => 'Hela din BeTaller-poäng';

  @override
  String get anUnlockScoreBody =>
      'Poängen, alla nio signaler bakom den och vad du ska göra härnäst.';

  @override
  String get anUnlockSourcesTitle => 'Se var dina centimetrar kommer ifrån';

  @override
  String get anUnlockNeedsTitle => 'Ditt dagliga behov, uträknat åt dig';

  @override
  String get anUnlockCta => 'Lås upp';

  @override
  String get anFlowResultTitle => 'Sparat i ditt diagram';

  @override
  String get anFlowResultBody =>
      'Dina tidigare längder ligger nu på samma kurva som dina mätningar och din potential.';

  @override
  String get anFlowOpenAnalysis => 'Öppna din analys';

  @override
  String anTopPct(int p) {
    return 'TOPP $p %';
  }

  @override
  String get anNeedsTitle => 'Ditt dagliga behov';

  @override
  String get pgUnlockPro => 'Lås upp med Pro';

  @override
  String get pgPhotosLockedTitle => 'Se din förvandling';

  @override
  String get pgPhotosLockedBody =>
      'Spara ett foto med din längd varannan vecka och jämför två valfria med ett reglage.';

  @override
  String get pgTransformationTitle => 'Din förvandling';

  @override
  String get pgHeightChange => 'längdskillnad';

  @override
  String get pgDaysApart => 'dagar emellan';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagars',
      one: '$days dags',
    );
    return '$delta mellan de här två fotona, tagna med $_temp0 mellanrum.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '$days dag',
    );
    return 'Samma längd, $_temp0 emellan. Hållning och form förändras först, längden följer efter under månader.';
  }

  @override
  String get pgModeSlider => 'Reglage';

  @override
  String get pgModeSideBySide => 'Sida vid sida';

  @override
  String get pgDragToReveal => 'Dra för att jämföra';

  @override
  String get pgOnePhotoTitle => 'Ditt före-foto är sparat';

  @override
  String pgOnePhotoBody(String date) {
    return 'Ta nästa den $date i samma pose för att se din första jämförelse.';
  }

  @override
  String get pgEmptyTitle => 'Starta din förvandling';

  @override
  String get pgEmptyBody =>
      'Ett foto varannan vecka, samma pose, samma plats, med din längd på. Om några månader kan du dra mellan dag 1 och idag.';

  @override
  String get pgTakeFirstPhoto => 'Ta ditt första foto';

  @override
  String get pgPhotoDueNow => 'Dags för nytt foto';

  @override
  String pgNextPhotoOn(String date) {
    return 'Nästa foto $date';
  }

  @override
  String pgDayN(int n) {
    return 'Dag $n';
  }

  @override
  String get pgNewPhoto => 'Nytt foto';

  @override
  String get pgGuideTitle => 'Samma pose varje gång';

  @override
  String get pgGuideSubtitle =>
      'Foton går bara att jämföra bra om de tas på samma sätt.';

  @override
  String get pgGuideGhost =>
      'Ditt senaste foto visas svagt. Ställ dig i linje med det.';

  @override
  String get pgGuideStep1 => 'Stå 2 m bort, mobilen i brösthöjd';

  @override
  String get pgGuideStep2 =>
      'Titta mot kameran, fötterna ihop, armarna avslappnade';

  @override
  String get pgGuideStep3 => 'Samma plats, samma ljus, åtsittande kläder';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => 'brösthöjd';

  @override
  String get pgTakePhoto => 'Ta foto';

  @override
  String get pgFromGallery => 'Välj från galleriet';

  @override
  String get pgChoosePhoto => 'Välj ett foto';

  @override
  String get pgPostureTitle => 'Hållningskoll';

  @override
  String get pgPostureLockedTitle => 'Hitta dina svaga punkter';

  @override
  String get pgPostureLockedBody =>
      'Bedöm huvud, axlar och ländrygg, få två övningar för varje och se din poäng vecka för vecka.';

  @override
  String get pgAreaHead => 'Huvud';

  @override
  String get pgAreaShoulders => 'Axlar';

  @override
  String get pgAreaLowerBack => 'Ländrygg';

  @override
  String get pgHeadMeaning0 =>
      'Ditt huvud sitter rakt över axlarna. Behåll det så med en kort daglig återställning.';

  @override
  String get pgHeadMeaning1 =>
      'Ditt huvud glider framåt när du slappnar av. Väldigt vanligt vid mycket mobiltid, och går snabbt att förbättra.';

  @override
  String get pgHeadMeaning2 =>
      'Ditt huvud sitter framför axlarna. Fixa det här först: det får dig att se kortare ut på varje foto.';

  @override
  String get pgShouldersMeaning0 =>
      'Axlarna i linje med öronen. Din övre rygg gör sitt jobb.';

  @override
  String get pgShouldersMeaning1 =>
      'Axlarna lite framåt. Ett stramt bröst drar in dem; öppnar du upp det kommer de tillbaka.';

  @override
  String get pgShouldersMeaning2 =>
      'Rundade axlar. Din övre rygg böjer sig framåt, vilket tar längd från hur du står.';

  @override
  String get pgLowerBackMeaning0 =>
      'En neutral kurva. Dina höfter och din bål håller ryggraden där den ska vara.';

  @override
  String get pgLowerBackMeaning1 =>
      'En platt ländrygg. Lätta bakåtböjningar och rörlighetsövningar ger tillbaka den naturliga kurvan.';

  @override
  String get pgLowerBackMeaning2 =>
      'En tydlig svank. Strama höftböjare tippar bäckenet framåt; stretch av dem och en starkare bål jämnar ut det.';

  @override
  String get pgLegacyMeaning =>
      'Sparat av en äldre version utan de här frågorna. Gör om testet för råd om det här området.';

  @override
  String get pgHowItWorks => 'Så fungerar testet';

  @override
  String get pgYourPosture => 'Din hållning';

  @override
  String pgCheckedOn(String date) {
    return 'Testat $date';
  }

  @override
  String get pgOutOf100 => 'av 100';

  @override
  String get pgAllAreasGood => 'Alla tre områdena ser bra ut. Håll dem så.';

  @override
  String pgStartWith(String area) {
    return 'Börja här: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta mot förra testet';
  }

  @override
  String get pgStatusGood => 'Bra';

  @override
  String get pgStatusFair => 'Kan bli bättre';

  @override
  String get pgStatusFix => 'Fixa först';

  @override
  String get pgKeepItWith => 'Behåll det med';

  @override
  String get pgFixItWith => 'Fixa det med';

  @override
  String get pgRetakeNow => 'Dags för veckans test';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Nästa test om $n dagar',
      one: 'Nästa test imorgon',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'Samma vägg, samma tre frågor. Testen varje vecka visar om övningarna fungerar.';

  @override
  String pgRetakeBodyWait(String date) {
    return 'Gör övningarna ovan fram till $date och gör sedan om testet för att se om de fungerade.';
  }

  @override
  String get pgRetakeCheck => 'Gör om testet';

  @override
  String get pgRetakeAnyway => 'Gör om nu';

  @override
  String get pgHistoryTitle => 'Dina poäng';

  @override
  String pgSinceFirst(String delta) {
    return '$delta sedan första';
  }

  @override
  String get pgHistoryOne =>
      'Det här är ditt första test. Gör om det om 7 dagar så börjar din trend här.';

  @override
  String get pgPostureIntroTitle => 'Hur rakt står du?';

  @override
  String get pgPostureIntroBody =>
      'Tre frågor mot en vägg, ungefär en minut. Du får en poäng och de två övningar som fixar varje svag punkt.';

  @override
  String get pgPostureStep1 =>
      'Stå med hälar, höfter och skulderblad mot en vägg.';

  @override
  String get pgPostureStep2 =>
      'Ta ett foto från sidan med hela kroppen i bild, så att du kan titta tillbaka senare.';

  @override
  String get pgPostureStep3 =>
      'Svara ärligt på tre frågor. Din poäng kommer från dina svar.';

  @override
  String get pgPostureStep4 =>
      'Gör om det en gång i veckan, vid samma tid på dagen.';

  @override
  String get pgStartCheck => 'Starta hållningstest';

  @override
  String pgWeekRange(String start, String end) {
    return '$start till $end';
  }

  @override
  String get pgGradeGreat => 'Mästarvecka';

  @override
  String get pgGradeGood => 'Stabil vecka';

  @override
  String get pgGradeOk => 'På gång';

  @override
  String get pgGradeStart => 'En nystart';

  @override
  String get pgTopWeek => 'Toppvecka';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta mot förra veckan';
  }

  @override
  String get pgDaysCompleted => 'dagar med hela planen';

  @override
  String get pgDayStreak => 'dagar i rad';

  @override
  String pgBestDay(String day) {
    return 'Bäst: $day';
  }

  @override
  String get pgNextWeekFocus => 'Fokus nästa vecka';

  @override
  String pgFocusPlan(int n, int done) {
    return 'Klara hela planen $n dagar. Den här veckan blev det $done.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'Få in $n träningspass. Den här veckan blev det $done.';
  }

  @override
  String get pgFocusMeasure =>
      'Mät din längd en gång, på morgonen, barfota, på samma plats. Det är så du ser verklig förändring.';

  @override
  String pgFocusKeepDay(String day) {
    return 'Alla mål nådda. Gör nu $day till en full dag också.';
  }

  @override
  String get pgFocusKeep =>
      'Alla mål nådda och varje dag full. Samma plan, samma rytm.';

  @override
  String get pgHeightThisWeek => 'Längd den här veckan';

  @override
  String pgHeightNow(String height) {
    return 'Nu $height';
  }

  @override
  String get pgNoMeasurementWeek => 'Ingen mätning den här veckan än';

  @override
  String get pgFirstMeasurement => 'Din första mätning';

  @override
  String pgStartedAt(String height) {
    return 'Start $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'Potential $height';
  }

  @override
  String pgToPotential(String cm) {
    return '$cm kvar till din beräknade potential.';
  }

  @override
  String get pgPotentialReached =>
      'Du har nått din beräknade potential. Hållningsträning kan fortfarande öka hur lång du ser ut.';

  @override
  String get pgHabitsToday => 'Loggat idag';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves övningar · $minutes min';
  }

  @override
  String plDoneCount(int done, int total) {
    return '$done/$total klara';
  }

  @override
  String get plStartWorkout => 'Starta passet';

  @override
  String get plContinueWorkout => 'Fortsätt passet';

  @override
  String get plWorkoutDoneToday => 'Dagens pass är klart';

  @override
  String get plTraining => 'Träning';

  @override
  String get plHabits => 'Dagliga vanor';

  @override
  String get plRestDayNote =>
      'En lugn dag: ett kort yogaflöde håller dig mjuk inför imorgon.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps reps';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds s';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds s per sida';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g fördelat på dina måltider';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters under dagen';
  }

  @override
  String plHabitSleep(String hours) {
    return '$hours h inatt';
  }

  @override
  String get plYourRoutines => 'Dina rutiner';

  @override
  String get plNewRoutine => 'Ny rutin';

  @override
  String get plCustomEmpty =>
      'Bygg en egen rutin och bocka av den här varje dag.';

  @override
  String plDeleteRoutineQ(String name) {
    return 'Radera ”$name”?';
  }

  @override
  String get plHoldToDelete => 'Håll in en rutin för att radera den.';

  @override
  String plSetOf(int current, int total) {
    return 'Set $current av $total';
  }

  @override
  String get plRest => 'Vila';

  @override
  String get plStartSet => 'Starta set';

  @override
  String get plSetDone => 'Set klart';

  @override
  String get plSkipRest => 'Hoppa över vila';

  @override
  String get plNextMove => 'Nästa övning';

  @override
  String get plSkipMove => 'Hoppa över';

  @override
  String plUpNext(String name) {
    return 'Härnäst: $name';
  }

  @override
  String get plLastMove => 'Sista övningen';

  @override
  String get plWorkoutComplete => 'Passet klart';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves övningar på cirka $minutes min. Varje pass räknas.';
  }

  @override
  String get plEachSide => 'Per sida';

  @override
  String get plMoveDone => 'Övning klar';

  @override
  String plRepsBig(int reps) {
    return '$reps reps';
  }

  @override
  String get plSessionHint =>
      'Kör i din egen takt och tryck på klar när du är färdig.';

  @override
  String plProgramDayOf(int day, int total) {
    return 'Dag $day av $total';
  }

  @override
  String get plTodayStep => 'Dagens steg';

  @override
  String get plTickToComplete => 'Bocka av varje övning för att klara dagen';

  @override
  String plNextDayTomorrow(int day) {
    return 'Dag $day öppnas imorgon. Vila är en del av att växa.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '$days dag',
    );
    return '$_temp0 till nivå $level';
  }

  @override
  String get plProgramFinished =>
      'Alla 70 dagar klara. Du har slutfört programmet.';

  @override
  String plDayCompleteToast(int day) {
    return 'Dag $day klar';
  }

  @override
  String get plLevelWeek => 'Nivåns vecka';

  @override
  String get plProgressionTitle => 'Så blir det svårare';

  @override
  String get plNow => 'Nu';

  @override
  String plLevelN(int n) {
    return 'Nv $n';
  }

  @override
  String get plUnlockProgram => 'Lås upp 70-dagarsprogrammet';

  @override
  String get plProgramPitch =>
      '10 nivåer, en per vecka. Varje nivå lägger till sekunder i dina håll, reps i dina hopp och ett set när du är redo.';

  @override
  String plDayLocked(int day) {
    return 'Klara dag $day först';
  }

  @override
  String plCurrentDay(int day) {
    return 'Dag $day';
  }

  @override
  String get plTodaysTargets => 'Dagens mål';

  @override
  String get plTargetsBasis => 'Uträknat från din ålder, vikt och träning';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals måltider x $grams g';
  }

  @override
  String get plZinc => 'Zink';

  @override
  String get plMagnesium => 'Magnesium';

  @override
  String get plEnergy => 'Energi';

  @override
  String get plChecklist => 'Dagens checklista';

  @override
  String plCheckProtein(int grams) {
    return 'Protein $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'Kalcium $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'D-vitamin $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return 'Vatten $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '$amount från avbockade måltider';
  }

  @override
  String get plVitaminDNote =>
      '15 min middagssol på armar och ansikte, eller ett tillskott som din läkare godkänner';

  @override
  String plWaterLogged(String liters) {
    return '$liters loggat hittills';
  }

  @override
  String get plMealPlan => 'Din måltidsplan';

  @override
  String get plMealPlanSub =>
      'Riktig mat, riktiga gram, anpassat efter dina mål';

  @override
  String get plSnack => 'Mellanmål';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein g protein · $calcium mg kalcium · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return 'mål $grams g';
  }

  @override
  String get plMarkEaten => 'Markera som äten';

  @override
  String get plEaten => 'Äten';

  @override
  String get plPlanTotal => 'Dagssumma';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'De här måltiderna ger cirka $planKcal av dina $kcal kcal. Fyll på resten med frukt, grönsaker, bröd eller ris.';
  }

  @override
  String get plWeeklyMenu => 'Veckomeny';

  @override
  String get plWeeklyMenuSub => 'En ny tallrik varje dag, samma mål';

  @override
  String get plUnlockMenu => 'Lås upp hela veckomenyn';

  @override
  String get plRecipes => 'Recept';

  @override
  String get plRecipesSub => 'Snabba rätter med mycket protein';

  @override
  String get plNutritionGuide => 'Kostguide';

  @override
  String get plNutritionGuideSub => 'Näringsämnen, livsmedel och tillskott';

  @override
  String plPieces(int n) {
    return '$n st';
  }

  @override
  String get plFoodOats => 'Havregryn';

  @override
  String get plFoodMilk => 'Mjölk';

  @override
  String get plFoodBanana => 'Banan';

  @override
  String get plFoodWalnuts => 'Valnötter';

  @override
  String get plFoodGreekYogurt => 'Grekisk yoghurt';

  @override
  String get plFoodYogurt => 'Yoghurt';

  @override
  String get plFoodEggs => 'Ägg';

  @override
  String get plFoodBread => 'Fullkornsbröd';

  @override
  String get plFoodWhiteCheese => 'Fetaost';

  @override
  String get plFoodHardCheese => 'Lagrad ost';

  @override
  String get plFoodSalad => 'Tomat- och gurksallad';

  @override
  String get plFoodOrange => 'Apelsin';

  @override
  String get plFoodPeanutButter => 'Jordnötssmör';

  @override
  String get plFoodSpinach => 'Spenat';

  @override
  String get plFoodCottageCheese => 'Keso';

  @override
  String get plFoodChicken => 'Kycklingbröst';

  @override
  String get plFoodBulgur => 'Bulgur';

  @override
  String get plFoodAyran => 'Ayran (yoghurtdryck)';

  @override
  String get plFoodTuna => 'Tonfisk (konserv)';

  @override
  String get plFoodPasta => 'Pasta';

  @override
  String get plFoodBeef => 'Magert nötkött';

  @override
  String get plFoodRice => 'Ris';

  @override
  String get plFoodChickpeas => 'Kikärtor';

  @override
  String get plFoodSalmon => 'Lax';

  @override
  String get plFoodBroccoli => 'Broccoli';

  @override
  String get plFoodPotato => 'Potatis';

  @override
  String get plFoodLentils => 'Linser';

  @override
  String get plFoodSardines => 'Sardiner';

  @override
  String get plFoodAlmonds => 'Mandlar';

  @override
  String get plFoodKefir => 'Kefir';

  @override
  String get plFoodPumpkinSeeds => 'Pumpafrön';

  @override
  String get wtCoffee => 'Kaffe';

  @override
  String get wtTea => 'Te';

  @override
  String get wtCola => 'Cola';

  @override
  String get wtEnergyDrink => 'Energidryck';

  @override
  String get crCustomBadge => 'Egen';

  @override
  String get crNameHint => 't.ex. Morgonstretch med kraft';

  @override
  String get crDoseHint => 't.ex. 3x10 reps eller 3x30 sekunder';

  @override
  String get paywallLifetime => 'Livstid';

  @override
  String paywallOnce(String price) {
    return '$price en gång';
  }

  @override
  String get paywallLifetimeBadge => 'Inget abonnemang';

  @override
  String get paywallLifetimeDisclaimer =>
      'Engångsbetalning · inget abonnemang, inget förnyas';

  @override
  String get pwSlidePotentialTitle => 'Se din potential';

  @override
  String get pwSlidePotentialCaption =>
      'Uträknad från din ålder, din längd och dina föräldrars längd.';

  @override
  String get pwSlideTodayTitle => 'En plan för varje dag';

  @override
  String get pwSlideTodayCaption => 'Korta dagliga pass med videoguider.';

  @override
  String get pwSlideProgramTitle => '70 dagar, 10 nivåer';

  @override
  String get pwSlideProgramCaption =>
      'Varje vecka blir övningarna lite svårare.';

  @override
  String get pwSlideNutritionTitle => 'Ät för att växa';

  @override
  String get pwSlideNutritionCaption =>
      'Dagliga mål för protein, kalcium och D-vitamin, gjorda för dig.';

  @override
  String get pwSlideChartTitle => 'Se din kurva stiga';

  @override
  String get pwSlideChartCaption =>
      'Varje mätning hamnar på vägen mot din potential.';

  @override
  String get pwSlideScoreTitle => 'En poäng för dina vanor';

  @override
  String get pwSlideScoreCaption => 'Se vilken vana du ska fixa först.';

  @override
  String get pwSlidePostureTitle => 'Stå rakare redan idag';

  @override
  String get pwSlidePostureCaption =>
      'En snabb hållningskoll och övningarna som rättar till den.';

  @override
  String get pwExample => 'Exempel';

  @override
  String pwYouLine(String now, String potential) {
    return 'Du: $now → potential $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return 'Exempel: $now → potential $potential';
  }

  @override
  String get tv3NewEyebrow => 'Nyheter';

  @override
  String get tv3NewTitle => 'BeTaller har fått en stor uppdatering';

  @override
  String get tv3NewDesc =>
      'Ny plan, nytt program, nytt utseende. Här är nyheterna.';

  @override
  String get tv3PotentialTitle => 'Det här är din potential';

  @override
  String get tv3PotentialDesc =>
      'Din längd idag bredvid hur lång du kan bli. Planen minskar avståndet.';

  @override
  String get tv3TodayTitle => 'Dagens plan';

  @override
  String tv3TodayDesc(String button) {
    return 'Ett kort pass gjort för idag. Tryck på $button och följ med.';
  }

  @override
  String get tv3ProgramTitle => '70 dagar av disciplin';

  @override
  String get tv3ProgramDesc =>
      'Ett steg om dagen genom 10 nivåer. Varje dag bygger på den förra.';

  @override
  String get tv3NutritionTitle => 'Dina dagliga mål';

  @override
  String get tv3NutritionDesc =>
      'Protein, kalcium, D-vitamin och vatten, uträknat för din kropp.';

  @override
  String get tv3ChartTitle => 'Följ din kurva';

  @override
  String get tv3ChartDesc =>
      'Mät varje eller varannan vecka och se linjen klättra mot din potential.';

  @override
  String get tv3ScoreTitle => 'Din BeTaller-poäng';

  @override
  String get tv3ScoreDesc =>
      'En siffra för hur det går för dig. Lyft ditt svagaste område först.';

  @override
  String get tv3Next => 'Nästa';

  @override
  String get tv3ShowMe => 'Visa mig';

  @override
  String get tv3Done => 'Nu kör vi';

  @override
  String get obWhyTitle => 'Varför vill du bli längre?';

  @override
  String get obWhySubtitle =>
      'Välj allt som stämmer. Din plan utgår från ditt skäl.';

  @override
  String get obWhyConfidence => 'Få bättre självförtroende';

  @override
  String get obWhyImpression => 'Göra ett starkare första intryck';

  @override
  String get obWhySports => 'Bli bättre i sport';

  @override
  String get obWhyClothes => 'Kläderna sitter bättre';

  @override
  String get obWhyPhotos => 'Se bättre ut på bild';

  @override
  String get obWhyPotential => 'Vill bara veta min potential';

  @override
  String get obTriedTitle => 'Har du testat andra längdappar?';

  @override
  String get obTriedSubtitle =>
      'Det finns inget fel svar. Det hjälper oss att visa vad som är annorlunda här.';

  @override
  String get obTriedStopped => 'Ja, men jag slutade';

  @override
  String get obTriedStill => 'Ja, jag använder en nu';

  @override
  String get obTriedFirst => 'Nej, det här är min första';

  @override
  String get obTriedStoppedTitle => 'En siffra räcker inte för att hålla igång';

  @override
  String get obTriedStoppedBody =>
      'De flesta appar ger dig en siffra. BeTaller gör den till en daglig plan som du kan bocka av, med påminnelser på dina egna tider.';

  @override
  String get obTriedStillTitle => 'Behåll det som funkar för dig';

  @override
  String get obTriedStillBody =>
      'BeTaller lägger till den dagliga delen: en plan byggd på dina egna svar som du kan bocka av, ett steg i taget.';

  @override
  String get obTriedFirstTitle => 'Bra ställe att börja';

  @override
  String get obTriedFirstBody =>
      'Här får du inte bara en siffra. BeTaller gör dina svar till en daglig plan som du kan bocka av.';

  @override
  String get obTriedCardTitle => 'Det här bockar du av varje dag';

  @override
  String get obTriedItem1 => 'Ett kort pass valt för din vecka';

  @override
  String get obTriedItem2 => 'Ditt proteinmål';

  @override
  String get obTriedItem3 => 'Släck i tid';

  @override
  String get obBlockTitle => 'Vad står i vägen?';

  @override
  String get obBlockSubtitle =>
      'Välj allt som stämmer. Din plan tar hänsyn till det.';

  @override
  String get obBlockForget => 'Jag glömmer';

  @override
  String get obBlockTime => 'För lite tid';

  @override
  String get obBlockExercises => 'Jag vet inte vilka övningar';

  @override
  String get obBlockMotivation => 'Jag tappar motivationen';

  @override
  String get obBlockBedtime => 'Jag lägger mig sent';

  @override
  String get obBlockMeals => 'Jag hoppar över måltider';

  @override
  String get obFirstTitle => 'Vad gör du först när du är längre?';

  @override
  String get obFirstSubtitle => 'Föreställ dig det. Det är det du jobbar mot.';

  @override
  String get obFirstWardrobe => 'Förnya garderoben';

  @override
  String get obFirstMuscle => 'Bygga muskler';

  @override
  String get obFirstPhotos => 'Lägga upp fler bilder';

  @override
  String get obFirstTeam => 'Provspela för ett lag';

  @override
  String get obFirstFeelGood => 'Inget särskilt, bara må bra';

  @override
  String get obBuiltChip => 'Gjord för dig';

  @override
  String get obBuiltTitle => 'Din plan, byggd runt dig';

  @override
  String get obBuiltReason => 'Ditt skäl';

  @override
  String get obBuiltGoal => 'Mål';

  @override
  String get obBuiltWhen => 'När du är där';

  @override
  String get obBuiltBlockers => 'Det som står i vägen, löst';

  @override
  String get obFixForget => 'Påminnelser på tiderna du valt';

  @override
  String get obFixTime => 'Korta pass, de flesta runt 15 minuter';

  @override
  String get obFixExercises => 'Övningar med video, steg för steg';

  @override
  String get obFixMotivation => 'Sviter och nivåer som håller dig igång';

  @override
  String get obFixBedtime => 'Ett sömnmål och en påminnelse vid läggdags';

  @override
  String get obFixMeals => 'Ett proteinmål och en måltidsplan';

  @override
  String get obNotifTitle => 'BeTaller påminner dig när det spelar roll';

  @override
  String get obNotifSubtitle =>
      'Inställt efter tiderna du gav oss. Du kan ändra dem när du vill.';

  @override
  String get obNotifWorkout => 'Träning';

  @override
  String obNotifWorkoutDetail(String time) {
    return '30 min före ditt pass kl. $time';
  }

  @override
  String get obNotifMeal => 'Mat och protein';

  @override
  String obNotifMealDetail(String time) {
    return 'Vid din måltid kl. $time';
  }

  @override
  String get obNotifWater => 'Vatten';

  @override
  String get obNotifWaterDetail => 'En vattenpaus på eftermiddagen';

  @override
  String get obNotifSleep => 'Varva ner';

  @override
  String obNotifSleepDetail(String time) {
    return 'En timme innan du lägger dig kl. $time';
  }

  @override
  String get obNotifAllow => 'Slå på påminnelser';

  @override
  String get obNotifNotNow => 'Inte nu';

  @override
  String get obNotifNow => 'nu';

  @override
  String get ftOneFree => '1 gratis';

  @override
  String get ftFreeToday => 'Gratis idag';

  @override
  String get ftContinuePro => 'Fortsätt med Pro';

  @override
  String get ftNotNow => 'Inte nu';

  @override
  String get ftOutWorkoutTitle => 'Du har använt ditt gratispass';

  @override
  String get ftOutWorkoutBody =>
      'Behåll din svit med Pro: ett guidat pass varje dag, varje övning tidsatt åt dig.';

  @override
  String get ftOutDayTitle => 'Din första gratisdag är slut';

  @override
  String get ftOutDayBody =>
      'Din plan, dina mål och dina framsteg finns kvar att läsa. Behåll din svit med Pro: bocka av planen och logga vatten och sömn varje dag.';

  @override
  String get ftOutPostureTitle => 'Du har använt ditt gratis hållningstest';

  @override
  String get ftOutPostureBody =>
      'Ditt resultat finns kvar här. Testa igen varje vecka med Pro och se din hållning bli bättre.';

  @override
  String get ftOutPhotosTitle => 'Du har använt din gratis fotojämförelse';

  @override
  String get ftOutPhotosBody =>
      'Det paret är ditt att titta på. Lägg till fler foton och jämför två valfria med Pro.';

  @override
  String get ftOutReportTitle => 'Du har använt din gratis veckorapport';

  @override
  String get ftOutReportBody =>
      'Få hela sammanfattningen varje vecka med Pro: varje dag bedömd, dina mål och en sak att göra bättre.';

  @override
  String get ftOutScoreTitle => 'Du har sett din gratis poänguppdelning';

  @override
  String get ftOutScoreBody =>
      'Din poäng finns kvar på skärmen. Se vad som bygger den, och vad du ska göra härnäst, varje dag med Pro.';

  @override
  String get ftOutArticleTitle => 'Du har läst din gratisartikel';

  @override
  String get ftOutArticleBody =>
      'Den artikeln är fortsatt öppen för dig. Läs hela biblioteket med Pro.';

  @override
  String get ftWhyWorkout => 'Guidade pass ingår i Pro';

  @override
  String get ftWhyPlan => 'Att bocka av planen ingår i Pro';

  @override
  String get ftWhyProgram => '70-dagarsprogrammet ingår i Pro';

  @override
  String get ftWhyWater => 'Att logga vatten varje dag ingår i Pro';

  @override
  String get ftWhySleep => 'Att logga sömn varje dag ingår i Pro';

  @override
  String get ftWhyNutrition => 'Din dagliga kostplan ingår i Pro';

  @override
  String get ftWhyPosture => 'Hållningstest varje vecka ingår i Pro';

  @override
  String get ftWhyPhotos => 'Fotojämförelser ingår i Pro';

  @override
  String get ftWhyReport => 'Din veckorapport ingår i Pro';

  @override
  String get ftWhyScore => 'Din poänguppdelning ingår i Pro';

  @override
  String get ftWhyArticle => 'Hela biblioteket ingår i Pro';

  @override
  String get ftPlanLocked =>
      'Din plan finns kvar att läsa. Att bocka av den ingår i Pro.';

  @override
  String get ftNutritionLocked =>
      'Dina mål och måltider finns kvar att läsa. Att bocka av dem ingår i Pro.';

  @override
  String get ftPreviewTag => 'Smakprov';

  @override
  String get ftPreviewTitle => 'Det var din förhandsvisning';

  @override
  String get ftPreviewBody =>
      'Resten av passet ingår i Pro. Det här kommer härnäst:';

  @override
  String get ftFreeWorkoutUsed =>
      'Det var ditt gratis guidade pass. Med Pro får du nya varje dag.';

  @override
  String get ftScoreLockedTitle => 'Det här bygger din poäng';

  @override
  String get ftScoreLockedBody =>
      'Varje del av din poäng, vad den bygger på och det enda du ska göra härnäst.';

  @override
  String get ftReportLockedTitle => 'Hela din vecka';

  @override
  String get ftReportLockedBody =>
      'Varje dag bedömd mot din plan, dina mål, din längd och ett fokus för nästa vecka.';

  @override
  String get ftPhotosLockedTitle => 'Jämför de här två';

  @override
  String get ftPhotosLockedBody =>
      'Din gratisjämförelse är använd. Med Pro kan du dra mellan två valfria foton.';

  @override
  String get ftArticleFreeLine =>
      'Din första artikel är gratis. Välj den du vill läsa.';

  @override
  String get plFinishWorkout => 'Avsluta';

  @override
  String get obTriedMostApps => 'De flesta appar';

  @override
  String get obTriedThatsIt => 'En siffra, och sedan inget mer.';

  @override
  String get obTriedPlanLabel => 'Din dag med BeTaller';

  @override
  String get obTriedProteinSub => 'Fördelat på dina måltider';

  @override
  String get obTriedSleepSub => 'En påminnelse innan du sover';

  @override
  String get obTriedFeatVideo => 'Övningar med video';

  @override
  String get obTriedFeatReminders => 'Påminnelser på dina tider';

  @override
  String get obTriedFeatStreaks => 'Sviter och nivåer';

  @override
  String get obBedtimeUnknown => 'Vet inte, det varierar';

  @override
  String obBedtimeUnknownHint(String time) {
    return 'Vi föreslår $time, utifrån hur mycket sömn du behöver i din ålder. Du kan ändra det när du vill.';
  }

  @override
  String get obWorkoutTimeUnknown => 'Vet inte, jag har ingen fast tid';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return 'Vi använder $time så länge. Du kan ändra det när du vill.';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return 'Förslag: läggdags runt $time. Ändra när du vill.';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return 'Förslag: träning runt $time. Ändra när du vill.';
  }

  @override
  String get obNotifSubtitleSuggested =>
      'Inställt efter tiderna du gav oss, med ett förslag där du var osäker. Du kan ändra dem när du vill.';

  @override
  String get plFoodBrownRice => 'Fullkornsris';

  @override
  String get unitHeightTitle => 'Enhet för längd';

  @override
  String get unitWeightTitle => 'Enhet för vikt';

  @override
  String get unitWaterTitle => 'Enhet för vatten';

  @override
  String get unitOptCm => 'Centimeter';

  @override
  String get unitOptFtIn => 'Fot och tum';

  @override
  String get unitOptKg => 'Kilogram';

  @override
  String get unitOptLb => 'Pund';

  @override
  String get unitOptStLb => 'Stone och pund';

  @override
  String get unitOptLiters => 'Liter';

  @override
  String get unitOptFlOz => 'Vätskeuns';

  @override
  String achieveGrowthImp(String amount) {
    return '$amount tillväxt';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return 'Registrera $amount tillväxt totalt';
  }

  @override
  String get postureBenefitIn =>
      'Huvud, axlar och ländrygg. En rak hållning kan visa upp till cirka 1 tum mer av din verkliga längd.';

  @override
  String get notifPostureBodyIn =>
      'Rak rygg, axlarna bakåt. Bra hållning = cirka 1 tums skillnad!';

  @override
  String get painPostureDescIn =>
      'Rätt hållning kan direkt ge upp till cirka 1 tum. BeTallers dagliga hållningsrutin bygger upp det på några veckor.';

  @override
  String get routinePostureDescIn =>
      'Håll ryggen rak och axlarna bakåt. Kolla varje timme. Bra hållning = cirka 1 tums skillnad.';

  @override
  String get sciPostureCheckIn =>
      'Rätt hållning kan direkt få dig att se cirka 1 tum längre ut och förebygger kompression av ryggraden';

  @override
  String get routineProteinDescLb =>
      'Ägg, kyckling, fisk, mejeri. Minst 0,7 g protein per lb kroppsvikt om dagen.';

  @override
  String pwPersonalTitle(String height) {
    return 'Din plan för att nå $height är klar';
  }

  @override
  String get pwPersonalEstimate =>
      'Uppskattad potential utifrån dina svar, ingen garanti';

  @override
  String pwPersonalReason(String reason) {
    return 'Ditt skäl: $reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return 'En påminnelse att varva ner före din läggdags $time';
  }

  @override
  String get obParentUnknown => 'Vet inte';

  @override
  String get obParentUnknownHint =>
      'Vi använder då genomsnittlig vuxenlängd. Mindre exakt, och du kan lägga till den i din profil när som helst.';

  @override
  String get obEthnicityWhy =>
      'Används bara för att uppskatta längden på den förälder du inte vet.';

  @override
  String get resultNoParentNote =>
      'Uppskattat utan ena förälderns längd, så mindre exakt. Lägg till den i din profil när som helst.';

  @override
  String get resultNoParentsNote =>
      'Uppskattat utan dina föräldrars längd, så mindre exakt. Lägg till dem i din profil när som helst.';

  @override
  String get resultFootnoteEstimated =>
      'Uppskattning utifrån tillväxtkurvor och genomsnittlig vuxenlängd. Inte medicinsk rådgivning.';

  @override
  String get obBudgetChip => 'SCHYSST PRIS';

  @override
  String get obBudgetTitle =>
      'BeTaller är prissatt för varje tonåring som vill växa';

  @override
  String get obBudgetDesc =>
      'Din längd ska inte bero på hur mycket pengar du har. Därför sätts priset separat för varje land.';

  @override
  String obBudgetWeek(String price) {
    return 'En vecka Pro här: $price';
  }

  @override
  String get obBudgetLocalTitle => 'Pris för ditt land';

  @override
  String get obBudgetLocalDesc =>
      'Inte omräknat från dollar, utan satt efter budgetar där du bor.';

  @override
  String get obBudgetWeekTitle => 'Börja med bara en vecka';

  @override
  String get obBudgetWeekDesc =>
      'Ingen stor betalning i förväg. Avsluta när du vill i inställningarna för ditt Apple-ID.';

  @override
  String get obBudgetAllTitle => 'Allt i en plan';

  @override
  String get obBudgetAllDesc =>
      'Träningspass, sömn, kost, hållning och framstegsrapporter.';
}
