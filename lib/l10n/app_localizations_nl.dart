// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get navHome => 'Start';

  @override
  String get navAnalysis => 'Analyse';

  @override
  String get navRoutines => 'Mijn plan';

  @override
  String get disciplineTitle => 'Discipline';

  @override
  String get disciplineProgramTitle => 'Disciplineprogramma';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total dagen';
  }

  @override
  String get disciplineCompleteDay => 'Rond de dag af';

  @override
  String disciplineDayN(int n) {
    return 'Dag $n';
  }

  @override
  String get disciplineLevels => 'Niveaus';

  @override
  String get disciplineLevelDone => 'Klaar';

  @override
  String get disciplineLocked => 'Vergrendeld';

  @override
  String get disciplineTodayIs => 'Vandaag';

  @override
  String get disciplineToday => 'Vandaag';

  @override
  String get disciplineTodayPlan => 'Plan van vandaag';

  @override
  String get disciplineWeek => 'Deze week';

  @override
  String get disciplineMonth => 'Deze maand';

  @override
  String get disciplineLevel => 'Disciplineniveau';

  @override
  String disciplineStreakDays(int days) {
    return '$days dagen op rij';
  }

  @override
  String disciplineToNext(int days) {
    return 'Nog $days dagen tot het volgende niveau';
  }

  @override
  String get disciplineMaxTier => 'Hoogste niveau bereikt';

  @override
  String get disciplineTierSpark => 'Vonk';

  @override
  String get disciplineTierSteady => 'Stabiel';

  @override
  String get disciplineTierSharp => 'Scherp';

  @override
  String get disciplineTierSolid => 'Solide';

  @override
  String get disciplineTierRelentless => 'Onvermoeibaar';

  @override
  String get disciplineTierUnbroken => 'Ongebroken';

  @override
  String get disciplineTierLegend => 'Legende';

  @override
  String get goalPerfectDays => 'Dagen met afgerond plan';

  @override
  String get goalWorkouts => 'Trainingen';

  @override
  String get goalMeasurement => 'Lengtemeting';

  @override
  String get goalPhoto => 'Voortgangsfoto';

  @override
  String get goalPostureCheck => 'Houdingscheck';

  @override
  String get disciplineAllDone => 'Vandaag klaar';

  @override
  String disciplineDayProgress(int done, int total) {
    return '$done/$total klaar';
  }

  @override
  String get navProgress => 'Voortgang';

  @override
  String get trackingSection => 'Je trackingtools';

  @override
  String get photosBenefit =>
      'Voor en na, naast elkaar. Zie de verandering in plaats van erover te lezen.';

  @override
  String get postureBenefit =>
      'Hoofd, schouders en onderrug. Rechtop staan laat tot 2-3 cm meer van je echte lengte zien.';

  @override
  String get reportBenefit =>
      'Beoordeel je week dag voor dag en zie waar het misging.';

  @override
  String get photosCta => 'Foto toevoegen';

  @override
  String get postureCta => 'Analyseren';

  @override
  String get reportCta => 'Rapport openen';

  @override
  String get toolStateReady => 'Klaar';

  @override
  String get photosSummaryEmpty => 'Voeg je eerste foto toe';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s',
      one: '$count foto',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => 'Nog geen analyse';

  @override
  String postureSummaryScore(int score) {
    return '$score/100 houding';
  }

  @override
  String get navProfile => 'Profiel';

  @override
  String greeting(String name) {
    return 'Hoi, $name';
  }

  @override
  String get currentHeight => 'Huidige lengte';

  @override
  String get target => 'Doel';

  @override
  String completed(String pct) {
    return '$pct% voltooid';
  }

  @override
  String remaining(String cm, String unit) {
    return 'Nog +$cm $unit';
  }

  @override
  String get updateAnalysis => 'Analyse bijwerken';

  @override
  String get analysisSubtitle =>
      'Krijg voorspellingen op basis van eerdere lengtes + gewoontes';

  @override
  String get dailyRoutines => 'Dagelijkse routines';

  @override
  String get allRoutinesDone => 'Alle routines voltooid!';

  @override
  String get water => 'Water';

  @override
  String get sleep => 'Slaap';

  @override
  String get growthSummary => 'Groeioverzicht';

  @override
  String get total => 'TOTAAL';

  @override
  String get last => 'LAATSTE';

  @override
  String get measurement => 'METING';

  @override
  String get dailyTip => 'Tip van de dag';

  @override
  String get waterTracking => 'Water bijhouden';

  @override
  String get waterGoalReached => 'Dagdoel bereikt';

  @override
  String waterRemaining(String amount) {
    return 'Nog $amount';
  }

  @override
  String get undo => 'Herstel';

  @override
  String waterToday(String amount) {
    return 'Vandaag: $amount L';
  }

  @override
  String get sleepTracking => 'Slaap bijhouden';

  @override
  String sleepTarget(String hours) {
    return 'Doel: $hours uur';
  }

  @override
  String get hours => 'uur';

  @override
  String get save => 'Opslaan';

  @override
  String get cancel => 'Annuleren';

  @override
  String get analysis => 'Analyse';

  @override
  String get betallerScore => 'BeTaller-score';

  @override
  String get genetic => 'Genetica';

  @override
  String get growth => 'Groei';

  @override
  String get nutrition => 'Voeding';

  @override
  String get sleepLabel => 'Slaap';

  @override
  String get discipline => 'Discipline';

  @override
  String get improveScore => 'Verhoog je score';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Voeding kritiek!';

  @override
  String get nutritionStrengthen => 'Verbeter je voeding';

  @override
  String get sleepRecordAdd => 'Slaap toevoegen';

  @override
  String get sleepPoor => 'Slecht slaapritme';

  @override
  String get sleepImprove => 'Verbeter je slaap';

  @override
  String get startToday => 'Begin vandaag!';

  @override
  String routinesRemaining(int count) {
    return 'Nog $count routines';
  }

  @override
  String get keepStreak => 'Houd je reeks vast';

  @override
  String get addFirstMeasurement => 'Eerste meting toevoegen';

  @override
  String get addMeasurement => 'Meting toevoegen';

  @override
  String waterHalfNotReached(String amount) {
    return 'Je hebt vandaag nog niet de helft van je waterdoel gehaald. Drink nog $amount L.';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'Nog $amount L tot je waterdoel. Bijna!';
  }

  @override
  String bmiLow(String bmi) {
    return 'Je BMI is $bmi, een beetje aan de lage kant. Eet meer eiwitten en calorieën.';
  }

  @override
  String get bodyFactsTitle => 'Je lichaam';

  @override
  String get dailyNeedsTitle => 'Je dagdoelen';

  @override
  String bmiHigh(String bmi) {
    return 'Je BMI is $bmi, een beetje aan de hoge kant. Focus op gezond eten.';
  }

  @override
  String get nutritionDefault => 'Haal je waterdoel en eet gevarieerd.';

  @override
  String sleepNoRecord(String hours) {
    return 'Vandaag nog geen slaap gelogd. Mik op $hours uur en log het.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Je hebt vandaag $current uur geslapen, $missing uur te weinig. Ga eerder naar bed!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Bijna. Met $hours uur haal je het meeste uit je groeihormoon.';
  }

  @override
  String get sleepGood => 'Top slaapritme! Ga zo door.';

  @override
  String noRoutinesDone(int total) {
    return 'Vandaag nog geen routines gedaan. Begin met één van de $total!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '$done/$total routines gedaan vandaag. Nog $left te gaan!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Goed bezig vandaag! Nog $needed dagen om een reeks te starten.';
  }

  @override
  String streakContinue(int days) {
    return '$days dagen op rij! Je score stijgt als je doorgaat.';
  }

  @override
  String get noMeasurements =>
      'Nog geen lengtemetingen. Voeg je eerste toe voor nauwkeurige voorspellingen.';

  @override
  String fewMeasurements(int count) {
    return 'Voeg nog $count metingen toe om je groeisnelheid te berekenen.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Je hebt $count metingen. Met 5 wordt de nauwkeurigheid veel beter.';
  }

  @override
  String get keepMeasuring =>
      'Blijf metingen toevoegen. Elk nieuw meetpunt verbetert de voorspellingen.';

  @override
  String get heightPrediction => 'Lengtevoorspelling';

  @override
  String get predictedHeightAt21 => 'Voorspelde lengte op 21';

  @override
  String get predictionMethod =>
      'Berekend door genetica (ouders), groeisnelheid, BMI en leeftijd te combineren.';

  @override
  String get growthStatus => 'Groeistatus';

  @override
  String get growthRemaining => 'Nog te gaan';

  @override
  String get growthBreakdown => 'Waar die centimeters vandaan komen';

  @override
  String get geneticGainLabel => 'Genetische groei';

  @override
  String get lifestyleLabel => 'Leefstijl';

  @override
  String get geneticCeilingLabel => 'Plafond';

  @override
  String get reachableTargetHeight => 'Je haalbare streeflengte';

  @override
  String get geneticCeilingProgress => 'Voortgang richting genetisch plafond';

  @override
  String get completionLabel => 'VOORTGANG';

  @override
  String get growthVelocity => 'GROEISNELHEID';

  @override
  String get noData => 'GEEN DATA';

  @override
  String growthRate(String rating) {
    return 'Groeitempo: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'Calorieën';

  @override
  String get kcalDay => 'kcal/dag';

  @override
  String get daily => 'per dag';

  @override
  String get protein => 'Eiwit';

  @override
  String get minimum => 'minimaal';

  @override
  String get age => 'Leeftijd';

  @override
  String get male => 'Man';

  @override
  String get female => 'Vrouw';

  @override
  String get yearlyPrediction => 'JAARLIJKSE VOORSPELLING';

  @override
  String ageYear(int age) {
    return '$age jr';
  }

  @override
  String get progressTitle => 'Voortgang bijhouden';

  @override
  String get totalGrowth => 'Totaal';

  @override
  String get lastDiff => 'Verschil';

  @override
  String get measurementCount => 'Metingen';

  @override
  String get heightChart => 'Lengtegrafiek';

  @override
  String get chartMinData => 'Minstens 2 metingen nodig voor de grafiek';

  @override
  String get chartInstruction =>
      'Voeg metingen toe om je voortgangsgrafiek te zien!';

  @override
  String get addMeasurementButton => 'NIEUWE METING TOEVOEGEN';

  @override
  String get measurementHistory => 'MEETGESCHIEDENIS';

  @override
  String get deleteTitle => 'Meting verwijderen';

  @override
  String get deleteMessage =>
      'Weet je zeker dat je deze meting wilt verwijderen?';

  @override
  String get dismiss => 'Annuleren';

  @override
  String get delete => 'Verwijderen';

  @override
  String get newMeasurement => 'Nieuwe lengtemeting';

  @override
  String get routines => 'Routines';

  @override
  String streakDays(int days) {
    return '$days dagen';
  }

  @override
  String get progressStatus => 'Voortgangsstatus';

  @override
  String get completedLabel => 'Voltooid!';

  @override
  String get all => 'Alle';

  @override
  String get exercise => 'Oefening';

  @override
  String get posture => 'Houding';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
      one: '$days dag',
    );
    return 'Record: $_temp0';
  }

  @override
  String get editProfile => 'Profiel bewerken';

  @override
  String get editProfileSubtitle => 'Lengte, gewicht en leeftijd bijwerken';

  @override
  String get name => 'Naam';

  @override
  String birthDate(String date) {
    return 'Geboren: $date';
  }

  @override
  String get heightCm => 'Lengte (cm)';

  @override
  String get weightKg => 'Gewicht (kg)';

  @override
  String get fatherHeight => 'Lengte vader (cm)';

  @override
  String get motherHeight => 'Lengte moeder (cm)';

  @override
  String get notifications => 'Meldingen';

  @override
  String get reminderNextLabel => 'Volgende herinnering';

  @override
  String get reminderManageHint => 'Beheer je herinneringen';

  @override
  String get reminderOffCta => 'Zet meldingen aan';

  @override
  String get stateOn => 'Aan';

  @override
  String get stateOff => 'Uit';

  @override
  String get reminderMasterTitle => 'Meldingen';

  @override
  String reminderActiveCount(int count) {
    return '$count herinneringen aan';
  }

  @override
  String get reminderBuiltIn => 'Standaardherinneringen';

  @override
  String get reminderYourOwn => 'Je eigen herinneringen';

  @override
  String get reminderAdd => 'Herinnering toevoegen';

  @override
  String get reminderDays => 'Dagen';

  @override
  String get reminderEveryDay => 'Elke dag';

  @override
  String get reminderLabelHint => 'Waaraan moeten we je herinneren?';

  @override
  String get reminderEmptyHint =>
      'Voeg je eigen toe: training, vitamines, stretchen, wat je maar nodig hebt.';

  @override
  String get reminderCustom => 'Herinnering';

  @override
  String get reminderCustomBody => 'Het is tijd voor je herinnering.';

  @override
  String get reminderExercise => 'Training';

  @override
  String get reminderNutrition => 'Voeding';

  @override
  String get reminderWater => 'Water';

  @override
  String get reminderPosture => 'Houding';

  @override
  String get reminderRoutine => 'Dagelijkse routine';

  @override
  String get reminderSleep => 'Slaap';

  @override
  String get reminderMeasurement => 'Lengtemeting';

  @override
  String get notificationsOn => 'Herinneringen aan';

  @override
  String get notificationsOff => 'Herinneringen uit';

  @override
  String get premium => 'Upgrade naar Premium';

  @override
  String get premiumSubtitle => 'Ontgrendel alle functies';

  @override
  String get rateUs => 'Beoordeel ons';

  @override
  String get rateSubtitle => 'Vind je de app leuk? Geef ons 5 sterren!';

  @override
  String get share => 'App delen';

  @override
  String get shareSubtitle => 'Vertel je vrienden over BeTaller';

  @override
  String get shareText =>
      'Ik heb mijn groeipotentieel ontdekt met BeTaller! Probeer het ook: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'Feedback geven';

  @override
  String get feedbackSubtitle => 'Neem contact op';

  @override
  String get resetData => 'Alle gegevens wissen';

  @override
  String get resetSubtitle => 'Alle gegevens worden verwijderd';

  @override
  String get resetTitle => 'Gegevens wissen';

  @override
  String get resetMessage =>
      'Alle gegevens worden verwijderd en je gaat terug naar het startscherm. Dit kan niet ongedaan worden gemaakt!';

  @override
  String get reset => 'Wissen';

  @override
  String get premiumSoon => 'Premium komt eraan!';

  @override
  String get brandingSubtitle => 'Ontdek je groeipotentieel';

  @override
  String get statistics => 'Statistieken';

  @override
  String get profileGroupSupport => 'Support';

  @override
  String get profileGroupAccount => 'Account';

  @override
  String get profileGroupApp => 'App';

  @override
  String get profileGroupDanger => 'Gevarenzone';

  @override
  String profileMemberSince(String date) {
    return 'Sinds $date';
  }

  @override
  String get profileYourJourney => 'Jouw traject';

  @override
  String get profileTotalGrowth => 'Totaal';

  @override
  String get currentStreak => 'Huidige reeks';

  @override
  String get bestStreakLabel => 'Langste reeks';

  @override
  String get achievementLabel => 'Prestatie';

  @override
  String get achievements => 'Prestaties';

  @override
  String get achievementUnlockedTitle => '🏆 Prestatie ontgrendeld!';

  @override
  String get reminderTapHint => 'Tik erop om de tijd en dagen te wijzigen';

  @override
  String get earned => 'Behaald!';

  @override
  String get notEarned => 'Nog niet behaald';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Taal';

  @override
  String get languageSubtitle => 'Taal van de app wijzigen';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Ontdek je groeipotentieel';

  @override
  String get onboardingMeetYou => 'Laten we kennismaken';

  @override
  String get onboardingInfoNeeded => 'Basisgegevens nodig voor de analyse.';

  @override
  String get gender => 'GESLACHT';

  @override
  String get birthDateLabel => 'GEBOORTEDATUM';

  @override
  String get bodyMeasurements => 'Lichaamsmaten';

  @override
  String get bodyInfo =>
      'Je huidige lengte en gewicht zijn nodig voor de analyse.';

  @override
  String get geneticData => 'Genetische gegevens';

  @override
  String get geneticInfo =>
      'De lengte van je ouders bepaalt je genetisch potentieel.';

  @override
  String get pastHeights => 'Eerdere lengtes';

  @override
  String get pastHeightsInfo =>
      'Vul lengtes in die je je herinnert van verschillende leeftijden. Je mag vakjes leeg laten.';

  @override
  String get heightHint => 'Lengte invullen...';

  @override
  String get ageLabel => 'leeftijd';

  @override
  String get habits => 'Je gewoontes';

  @override
  String get habitsInfo =>
      'Je leefstijl heeft direct invloed op de voorspellingen.';

  @override
  String get weeklyExercise => 'Wekelijkse beweging';

  @override
  String get dailySleep => 'Slaap per dag';

  @override
  String get nutritionQuality => 'KWALITEIT VOEDING';

  @override
  String get nutritionDesc => 'Eiwitten, zuivel, groente, fruit';

  @override
  String get nutritionBad => 'Slecht';

  @override
  String get nutritionPoor => 'Matig';

  @override
  String get nutritionMedium => 'Gemiddeld';

  @override
  String get nutritionGood => 'Goed';

  @override
  String get nutritionGreat => 'Top';

  @override
  String get startAnalysis => 'Start analyse';

  @override
  String get continueBtn => 'Doorgaan';

  @override
  String get analyzeBtn => 'Analyseren';

  @override
  String get analyzing => 'Bezig met analyse';

  @override
  String get analysisComplete => 'Voltooid!';

  @override
  String get analysisDataReceivedTitle => 'Gegevens ontvangen';

  @override
  String get analysisDataReceivedSubtitle => 'Je analyse start...';

  @override
  String get yourScore => 'Je BeTaller-score';

  @override
  String get letsStart => 'Aan de slag';

  @override
  String get splashJourneySubtitle => 'Je traject begint. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Je persoonlijke plan staat klaar.\nKlaar om je lengtepotentieel te ontdekken?';

  @override
  String get doneBtn => 'Klaar';

  @override
  String get analysisStep1 => 'Genetische gegevens analyseren...';

  @override
  String get analysisStep2 => 'Groeisnelheid berekenen...';

  @override
  String get analysisStep3 => 'Voedings- en slaapgegevens verwerken...';

  @override
  String get analysisStep4 => 'Lengtevoorspelling maken...';

  @override
  String get analysisStep5 => 'BeTaller-score berekenen...';

  @override
  String growthPotential(String cm, String unit) {
    return '+$cm $unit groeipotentieel';
  }

  @override
  String get heightAt21 => 'op je 21e';

  @override
  String confidenceLevel(String pct) {
    return '$pct% betrouwbaarheid';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return 'Bereik $min - $max $unit';
  }

  @override
  String get currentLabel => 'NU';

  @override
  String get predictedLabel => 'VOORSPELD';

  @override
  String get yearlyPredictions => 'Voorspellingen per jaar';

  @override
  String get tipMorningMeasure =>
      'Meet je lengte \'s ochtends. Door druk op je tussenwervelschijven ben je overdag iets korter, dus de ochtendmeting is het nauwkeurigst.';

  @override
  String get tipProteinSpread =>
      'Verdeel je eiwitten over je maaltijden. Eet niet alles in één keer, maar neem bij elke maaltijd eiwitten.';

  @override
  String get tipGrowthHormone =>
      'Groeihormoon piekt tijdens je slaap. Zorg dat je tussen 22:00 en 2:00 slaapt!';

  @override
  String get tipVitaminD =>
      'Elke dag 15 minuten zon verhoogt de aanmaak van vitamine D. Vitamine D is essentieel voor de opname van calcium.';

  @override
  String get tipBarHanging =>
      'Hangen aan een stang ontlast je wervelkolom. Probeer 3x30 seconden per dag.';

  @override
  String get tipSwimming =>
      'Zwemmen is de beste sport om je hele lichaam te trainen en je groei te ondersteunen.';

  @override
  String get tipStress =>
      'Stress remt je groeihormoon. Verminder stress met meditatie en yoga.';

  @override
  String get routineMorningStretch => 'Ochtendstretch';

  @override
  String get routineMorningStretchDesc =>
      'Stretch 10 minuten direct na het opstaan. Rek je rug- en beenspieren.';

  @override
  String get routineBarHanging => 'Hangen aan stang';

  @override
  String get routineBarHangingDesc =>
      'Hang aan een optrekstang om je wervelkolom te strekken. 3 sets x 30 seconden.';

  @override
  String get routineCobraStretch => 'Cobrastretch';

  @override
  String get routineCobraStretchDesc =>
      'Ga op je buik liggen en til je bovenlichaam op. Strek je wervelkolom. 3 sets x 15 seconden.';

  @override
  String get routineJumping => 'Springoefeningen';

  @override
  String get routineJumpingDesc =>
      'Touwtjespringen of squat jumps. Stimuleert de groeischijven. 3 sets x 20 herhalingen.';

  @override
  String get routineSwimming => 'Zwemmen of basketbal';

  @override
  String get routineSwimmingDesc =>
      'Doe een sport die groei ondersteunt. Minstens 30 minuten.';

  @override
  String get routineYoga => 'Avondyoga en stretchen';

  @override
  String get routineYogaDesc =>
      'Yoga- en stretchroutine voor het slapengaan. Laat stress los, ontspan je spieren.';

  @override
  String get routineProtein => 'Eiwitinname';

  @override
  String get routineProteinDesc =>
      'Eieren, kip, vis, zuivel. Minstens 1,5 g/kg eiwit per dag.';

  @override
  String get routineCalcium => 'Calcium en vitamine D';

  @override
  String get routineCalciumDesc =>
      'Neem melk, kaas, yoghurt. 15 min in de zon. Belangrijk voor je botontwikkeling.';

  @override
  String get routineWater => 'Waterdoel';

  @override
  String get routineWaterDesc =>
      'Drink minstens 2-3 liter water per dag. Essentieel voor je stofwisseling en groei.';

  @override
  String get routineAvoidJunk => 'Geen junkfood';

  @override
  String get routineAvoidJunkDesc =>
      'Blijf weg van fastfood, suikerrijke drankjes en bewerkt eten.';

  @override
  String get routineSleep => 'Goede slaap (8-10 uur)';

  @override
  String get routineSleepDesc =>
      'Groeihormoon komt vrij tijdens je slaap. 22:00-6:00 zijn de gouden uren.';

  @override
  String get routineNoScreen => 'Schermpauze voor bedtijd';

  @override
  String get routineNoScreenDesc =>
      'Leg je telefoon en computer 1 uur voor het slapengaan weg. Blokkeer de aanmaak van melatonine niet.';

  @override
  String get routinePosture => 'Houdingscheck';

  @override
  String get routinePostureDesc =>
      'Houd je rug recht en je schouders naar achteren. Check elk uur. Goede houding = 2-3 cm verschil.';

  @override
  String get routineWallStand => 'Muuroefening';

  @override
  String get routineWallStandDesc =>
      'Leun met je rug tegen de muur: hielen, heupen, schouders en hoofd raken de muur. Houd 5 min vast.';

  @override
  String get routineSprintIntervals => 'Sprintintervaltraining';

  @override
  String get routineSprintIntervalsDesc =>
      'Sprintintervaltraining zorgt met korte, intensieve sprints voor een flinke afgifte van groeihormoon.';

  @override
  String get routineHiitWorkout => 'HIIT-workout';

  @override
  String get routineHiitWorkoutDesc =>
      'Intensieve intervaltraining om zoveel mogelijk groeihormoon vrij te maken.';

  @override
  String get routineSquats => 'Squats';

  @override
  String get routineSquatsDesc =>
      'Squats met je eigen gewicht stimuleren de groeischijven in je benen en wervelkolom.';

  @override
  String get routineDeadliftStretch => 'Deadliftstretch';

  @override
  String get routineDeadliftStretchDesc =>
      'Deadliftstretch om je wervelkolom te ontlasten en je tussenwervelschijven gezond te houden.';

  @override
  String get routineOverheadPress => 'Overhead press';

  @override
  String get routineOverheadPressDesc =>
      'Boven je hoofd drukken strekt je wervelkolom en versterkt je houdingsspieren.';

  @override
  String get routineSkippingRope => 'Touwtjespringen';

  @override
  String get routineSkippingRopeDesc =>
      'Herhaald springen met een springtouw stimuleert de groeischijven in je benen.';

  @override
  String get routinePilatesCore => 'Pilates core';

  @override
  String get routinePilatesCoreDesc =>
      'Pilates-coreoefeningen ondersteunen de uitlijning van je wervelkolom en je houding.';

  @override
  String get routineInversionHang => 'Ondersteboven hangen';

  @override
  String get routineInversionHangDesc =>
      'Ondersteboven hangen ontlast je tussenwervelschijven en kan tijdelijk 1-2 cm opleveren.';

  @override
  String get routineZincIntake => 'Zinkrijk eten';

  @override
  String get routineZincIntakeDesc =>
      'Eet verspreid over de dag zinkrijk voedsel voor de aanmaak van groeihormoon.';

  @override
  String get routineVitaminDSunlight => 'Vitamine D en zonlicht';

  @override
  String get routineVitaminDSunlightDesc =>
      'Pak minstens 15 minuten direct zonlicht voor de aanmaak van vitamine D en botgroei.';

  @override
  String get routineArginineFoods => 'Argininerijk eten';

  @override
  String get routineArginineFoodsDesc =>
      'Eet argininerijk voedsel om de afgifte van groeihormoon te stimuleren.';

  @override
  String get routineDailyCalories => 'Dagelijks caloriedoel';

  @override
  String get routineDailyCaloriesDesc =>
      'Haal je dagelijkse caloriedoel. Te weinig eten remt je groei.';

  @override
  String get routineSleepEnvironment => 'Optimale slaapkamer';

  @override
  String get routineSleepEnvironmentDesc =>
      'Zorg voor een donkere, koele slaapkamer voor zoveel mogelijk melatonine en groeihormoon.';

  @override
  String get routinePreSleepRoutine => 'Tot rust komen';

  @override
  String get routinePreSleepRoutineDesc =>
      'Een vaste routine voor het slapengaan verbetert je diepe slaap met 23%.';

  @override
  String get routineNeckStretches => 'Nekstretches';

  @override
  String get routineNeckStretchesDesc =>
      'Nekstretches verminderen druk en verbeteren de stand van je nekwervels.';

  @override
  String get routineShoulderRolls => 'Schouders rollen en openen';

  @override
  String get routineShoulderRollsDesc =>
      'Je schouders openen corrigeert een voorovergebogen houding en kan je er 1-2 cm langer laten uitzien.';

  @override
  String get achieveCommitment => 'Toewijding';

  @override
  String get achieveCommitmentDesc =>
      'Vul al je gegevens in, ontdek de hele app en ga ermee aan de slag';

  @override
  String get achieveFirstDay => 'Eerste stap';

  @override
  String get achieveFirstDayDesc => 'Rond je eerste dag af';

  @override
  String get achieveThreeStreak => '3 dagen op rij';

  @override
  String get achieveThreeStreakDesc => 'Rond 3 dagen op rij je routines af';

  @override
  String get achieveWeekStreak => '7 dagen op rij';

  @override
  String get achieveWeekStreakDesc => 'Rond 7 dagen op rij je routines af';

  @override
  String get achieveTwoWeekStreak => '14 dagen op rij';

  @override
  String get achieveTwoWeekStreakDesc => 'Houd het 14 dagen achter elkaar vol';

  @override
  String get achieveMonthStreak => '30 dagen op rij';

  @override
  String get achieveMonthStreakDesc => 'Rond 30 dagen op rij af';

  @override
  String get achieveTwoMonthStreak => '60 dagen op rij';

  @override
  String get achieveTwoMonthStreakDesc => 'Rond 60 dagen op rij af';

  @override
  String get achieveHundredStreak => '100 dagen op rij';

  @override
  String get achieveHundredStreakDesc => 'Rond 100 dagen op rij af';

  @override
  String get achieveFirstMeasure => 'Eerste meting';

  @override
  String get achieveFirstMeasureDesc => 'Leg je eerste lengtemeting vast';

  @override
  String get achieveThreeMeasures => 'Tracker';

  @override
  String get achieveThreeMeasuresDesc => 'Leg 3 lengtemetingen vast';

  @override
  String get achieveFiveMeasures => 'Vaste tracker';

  @override
  String get achieveFiveMeasuresDesc => 'Leg 5 lengtemetingen vast';

  @override
  String get achieveTenMeasures => 'Datajager';

  @override
  String get achieveTenMeasuresDesc => 'Leg 10 lengtemetingen vast';

  @override
  String get achieveFirstCm => 'Eerste centimeter';

  @override
  String get achieveFirstCmDesc => 'Leg in totaal 1 cm groei vast';

  @override
  String get achieveThreeCm => '3 cm groei';

  @override
  String get achieveThreeCmDesc => 'Leg in totaal 3 cm groei vast';

  @override
  String get achieveFiveCm => '5 cm groei';

  @override
  String get achieveFiveCmDesc => 'Leg in totaal 5 cm groei vast';

  @override
  String get achieveTenCm => '10 cm groei';

  @override
  String get achieveTenCmDesc => 'Leg in totaal 10 cm groei vast';

  @override
  String get quote1 => 'Word elke dag een beetje beter dan gisteren.';

  @override
  String get quote2 =>
      'Groeien gaat niet in één nacht, maar elke nacht brengt je dichterbij.';

  @override
  String get quote3 => 'Groeien vraagt geduld, ga door!';

  @override
  String get quote4 => 'De stap die je vandaag zet, is de basis van morgen.';

  @override
  String get quote5 => 'Discipline begint waar motivatie ophoudt.';

  @override
  String get quote6 => 'Je lichaam zal je dankbaar zijn, ga door!';

  @override
  String get quote7 => 'Jij bepaalt de grenzen van je potentieel.';

  @override
  String get quote8 => 'Kleine stappen zorgen voor grote veranderingen.';

  @override
  String get quote9 => 'De beste investering is die in jezelf.';

  @override
  String get quote10 => 'Je komt elke dag dichter bij je doel.';

  @override
  String get quote11 => 'Veranderen is zwaar, maar spijt is zwaarder.';

  @override
  String get quote12 => 'Je lichaam is een tempel, zorg er goed voor.';

  @override
  String get quote13 => 'Je rivaal is wie je gisteren was. Versla die vandaag!';

  @override
  String get quote14 => 'BeTaller = geduld + discipline + vertrouwen';

  @override
  String get quote15 => 'Geloof in jezelf, het proces vormt je.';

  @override
  String get quote16 =>
      'Zeg vandaag niet \'ik kan het niet\', dan heb je morgen geen spijt.';

  @override
  String get quote17 => 'Boek elke dag vooruitgang, al is het maar 1%.';

  @override
  String get quote18 => 'De spiegel laat je vooruitgang zien, heb geduld.';

  @override
  String get bmiNormal => 'Normaal';

  @override
  String get bmiUnderweight => 'Ondergewicht';

  @override
  String get bmiOverweight => 'Overgewicht';

  @override
  String get bmiObese => 'Obesitas';

  @override
  String get velocityExcellent => 'Uitstekend';

  @override
  String get velocityNormal => 'Normaal';

  @override
  String get velocitySlow => 'Traag';

  @override
  String get velocityVeryLow => 'Zeer laag';

  @override
  String durationMinutes(String min) {
    return '$min min';
  }

  @override
  String get durationAllDay => 'Hele dag';

  @override
  String get durationNight => 'Nacht';

  @override
  String durationHours(String hours) {
    return '$hours uur';
  }

  @override
  String get onboardingStep1 => 'Vul je persoonlijke gegevens in';

  @override
  String get onboardingStep2 => 'Deel je eerdere lengtes';

  @override
  String get onboardingStep3 => 'Beoordeel je gewoontes';

  @override
  String get onboardingStep4 => 'Bekijk je voorspelling en score';

  @override
  String get hoursShort => 'u';

  @override
  String get selectLanguage => 'Kies taal';

  @override
  String get systemLanguage => 'Systeemtaal';

  @override
  String get emailSubject => 'BeTaller-feedback';

  @override
  String get pastHeightsTip =>
      'Onbekende leeftijden mag je leeg laten. 1-2 eerdere lengtes invullen is genoeg.';

  @override
  String get obPastHeightsTitle => 'Eerdere lengtes';

  @override
  String get obPastHeightsSubPart1 =>
      'Met je eerdere lengtes wordt je voorspelling nauwkeuriger.';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return 'Hoe lang was je toen je $age was?';
  }

  @override
  String get obSkip => 'Overslaan';

  @override
  String get obNext => 'Volgende';

  @override
  String get obSkipAll => 'Alles overslaan';

  @override
  String get currentSuffix => '(nu)';

  @override
  String personalizedProtein(String amount) {
    return 'Eieren, kip, vis, zuivel. Eet minstens $amount g eiwit per dag.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Drink minstens $amount L water per dag. Essentieel voor je stofwisseling en groei.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'Groeihormoon komt vrij tijdens je slaap. Slaap minstens $hours uur. 22:00-6:00 zijn de gouden uren.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Neem melk, kaas, yoghurt. 15 min zon. Dagelijks caloriedoel: $calories kcal.';
  }

  @override
  String get scoreS => 'Uitstekend! Je haalt het maximale uit je potentieel.';

  @override
  String get scoreA =>
      'Het gaat super! Met kleine verbeteringen kom je aan de top.';

  @override
  String get scoreB =>
      'Je bent op de goede weg. Let wat meer op je routines en voeding.';

  @override
  String get scoreC =>
      'Er valt nog wat te winnen. Vaste routines maken het verschil.';

  @override
  String get scoreD => 'Veel potentieel, maar je moet in actie komen.';

  @override
  String get scoreF =>
      'Begin nu! Elke dag een kleine stap maakt een groot verschil.';

  @override
  String get cmPerYear => 'cm/jaar';

  @override
  String get howToDoIt => 'Zo doe je het';

  @override
  String get musclesTargeted => 'Getrainde spieren en botten';

  @override
  String get scientificBasis => 'Wetenschappelijke basis';

  @override
  String setXofY(String current, String total) {
    return 'Set $current van $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Rust voor set $set';
  }

  @override
  String get allSetsComplete => 'Alle sets klaar!';

  @override
  String get setTimer => 'Settimer';

  @override
  String get setTracker => 'Settracker';

  @override
  String get builtInTimer => 'Ingebouwde timer';

  @override
  String get markComplete => 'Markeer als klaar';

  @override
  String get markIncomplete => 'Markeer als niet klaar';

  @override
  String get done => 'Klaar';

  @override
  String get doneExclamation => 'Klaar!';

  @override
  String get start => 'Start';

  @override
  String get pause => 'Pauze';

  @override
  String get resetTimer => 'Resetten';

  @override
  String get skipRest => 'Rust overslaan';

  @override
  String get restart => 'Opnieuw';

  @override
  String get perSet => 'per set';

  @override
  String get rest => 'RUST';

  @override
  String get reps => 'herh.';

  @override
  String get difficultyBeginner => 'Beginner';

  @override
  String get difficultyIntermediate => 'Gemiddeld';

  @override
  String get difficultyAdvanced => 'Gevorderd';

  @override
  String get learnTitle => 'Leren';

  @override
  String get learnSubtitle => 'Wetenschappelijk onderbouwde kennis over groei';

  @override
  String get categoryAll => 'Alle';

  @override
  String get categoryScience => 'Wetenschap';

  @override
  String get categoryNutrition => 'Voeding';

  @override
  String get categoryExercise => 'Oefening';

  @override
  String get categorySleep => 'Slaap';

  @override
  String get categoryMyths => 'Mythes';

  @override
  String get scientificReferences => 'Wetenschappelijke bronnen';

  @override
  String get relatedRoutines => 'Gerelateerde routines';

  @override
  String get nutritionTitle => 'Voeding';

  @override
  String get sectionMealPlan => 'Maaltijdplan';

  @override
  String get sectionNutrients => 'Voedingsstoffen';

  @override
  String get sectionFoods => 'Producten';

  @override
  String get sectionSupplements => 'Supplementen';

  @override
  String todaysPlan(String day) {
    return 'Plan van vandaag — $day';
  }

  @override
  String get breakfast => 'Ontbijt';

  @override
  String get lunch => 'Lunch';

  @override
  String get dinner => 'Avondeten';

  @override
  String get snacks => 'Snacks';

  @override
  String get searchFoods => 'Zoek producten...';

  @override
  String nFoods(String count) {
    return '$count producten';
  }

  @override
  String dailyLabel(String amount) {
    return 'Per dag: $amount';
  }

  @override
  String get dailyNeedByAge => 'BEHOEFTE PER LEEFTIJD';

  @override
  String agePrefix(String range) {
    return 'Leeftijd $range';
  }

  @override
  String get topFoodSources => 'BESTE VOEDINGSBRONNEN';

  @override
  String get categoryDairy => 'Zuivel';

  @override
  String get categoryMeatFish => 'Vlees en vis';

  @override
  String get categoryVegetables => 'Groente';

  @override
  String get categoryFruits => 'Fruit';

  @override
  String get categoryGrains => 'Granen en peulvruchten';

  @override
  String get categoryNutsSeeds => 'Noten en zaden';

  @override
  String get weeklyReportTitle => 'Weekrapport';

  @override
  String get weeklyScoreLabel => 'Weekscore';

  @override
  String get weeklyDailyCompletion => 'Dag voor dag';

  @override
  String get weeklyHabits => 'Gewoontes';

  @override
  String get overview => 'Overzicht';

  @override
  String get routinesLabel => 'Routines';

  @override
  String get streakLabel => 'Reeks';

  @override
  String get heightLabel => 'Lengte';

  @override
  String get weightLabel => 'Gewicht';

  @override
  String get dadLabel => 'Vader';

  @override
  String get motherLabel => 'Moeder';

  @override
  String get metricShort => 'Metrisch';

  @override
  String get imperialShort => 'Imperiaal';

  @override
  String get dailyScores => 'Dagscores';

  @override
  String get waterToday2 => 'Water vandaag';

  @override
  String get sleepToday => 'Slaap vandaag';

  @override
  String get routineCompletion => 'Routines afgerond';

  @override
  String get xpAndLevel => 'XP en level';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP tot volgend level';
  }

  @override
  String get activeChallenges => 'Actieve uitdagingen';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m voltooid';
  }

  @override
  String get shareYourProgress => 'Deel je voortgang';

  @override
  String get shareComingSoon => 'Delen komt binnenkort!';

  @override
  String get premiumTest => 'Premium (test)';

  @override
  String get premiumActive => 'Actief';

  @override
  String get premiumFree => 'Gratis';

  @override
  String get weeklyReportMenu => 'Weekrapport';

  @override
  String get weeklyReportMenuSubtitle => 'Overzicht van je voortgang';

  @override
  String get unlockGrowthPotential => 'Ontgrendel je volledige groeipotentieel';

  @override
  String get featureGrowthAnalysis => 'Groeianalyse en score';

  @override
  String get featureHeightPrediction => 'Lengtevoorspelling en prognose';

  @override
  String get featureAllRoutines => 'Alle 14 dagelijkse routines';

  @override
  String get featureWaterSleep => 'Water en slaap bijhouden';

  @override
  String get featureProgress => 'Voortgang en metingen';

  @override
  String get featureAchievements => 'Prestaties en reeksen';

  @override
  String get planMonthly => 'Maandelijks';

  @override
  String get planYearly => 'Jaarlijks';

  @override
  String get bestValue => 'BESTE DEAL';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'LVL $level';
  }

  @override
  String get levelBeginner => 'Beginner';

  @override
  String get levelStarter => 'Starter';

  @override
  String get levelCommitted => 'Betrokken';

  @override
  String get levelDedicated => 'Toegewijd';

  @override
  String get levelConsistent => 'Consequent';

  @override
  String get levelFocused => 'Gefocust';

  @override
  String get levelDetermined => 'Vastberaden';

  @override
  String get levelDisciplined => 'Gedisciplineerd';

  @override
  String get levelStrong => 'Sterk';

  @override
  String get levelAdvanced => 'Gevorderd';

  @override
  String get levelExpert => 'Expert';

  @override
  String get levelMaster => 'Meester';

  @override
  String get levelElite => 'Elite';

  @override
  String get levelChampion => 'Kampioen';

  @override
  String get levelLegend => 'Legende';

  @override
  String get levelTitan => 'Titaan';

  @override
  String get levelMythic => 'Mythisch';

  @override
  String get levelImmortal => 'Onsterfelijk';

  @override
  String get levelTranscendent => 'Transcendent';

  @override
  String get levelUltimate => 'Ultiem';

  @override
  String get challengeCompleteAllRoutines => 'Rond alle routines af';

  @override
  String get challengeCompleteAllRoutinesDesc => 'Maak vandaag elke routine af';

  @override
  String get challengeHydrationHero => 'Waterheld';

  @override
  String get challengeHydrationHeroDesc => 'Haal je dagelijkse waterdoel';

  @override
  String get challengeEarlySleeper => 'Vroege slaper';

  @override
  String get challengeEarlySleeperDesc => 'Log 8+ uur slaap';

  @override
  String get challengeExerciseTrio => 'Trainingstrio';

  @override
  String get challengeExerciseTrioDesc => 'Rond 3 trainingsroutines af';

  @override
  String get challengeMorningStretch => 'Ochtendstretch';

  @override
  String get challengeMorningStretchDesc => 'Stretch \'s ochtends voor 9:00';

  @override
  String get challenge7DayWarrior => '7-dagenstrijder';

  @override
  String get challenge7DayWarriorDesc => 'Rond 7 dagen op rij alle routines af';

  @override
  String get challengeGrowthTracker => 'Groeitracker';

  @override
  String get challengeGrowthTrackerDesc => 'Log deze week een lengtemeting';

  @override
  String get challengeHydrationWeek => 'Waterweek';

  @override
  String get challengeHydrationWeekDesc =>
      'Haal deze week 5 dagen je waterdoel';

  @override
  String get challengeFitnessChampion => 'Fitnesskampioen';

  @override
  String get challengeFitnessChampionDesc =>
      'Rond deze week 15 trainingsroutines af';

  @override
  String get challengeSleepMaster => 'Slaapmeester';

  @override
  String get challengeSleepMasterDesc => 'Log 5 dagen 8+ uur slaap';

  @override
  String get performanceDashboard => 'PRESTATIEDASHBOARD';

  @override
  String get tierA => 'NIVEAU A';

  @override
  String get tierB => 'NIVEAU B';

  @override
  String get tierC => 'NIVEAU C';

  @override
  String get tierD => 'NIVEAU D';

  @override
  String get tierE => 'NIVEAU E';

  @override
  String get maxTierReached => 'HOOGSTE NIVEAU BEREIKT';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Volgend niveau: $tier · nog +$pts ptn nodig';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Routines beheren';

  @override
  String get manageRoutinesSubtitle =>
      'Toon of verberg routines in je dagelijkse lijst';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible van $total actief';
  }

  @override
  String get showAll => 'Alles tonen';

  @override
  String get hideAll => 'Alles verbergen';

  @override
  String get heightAnalysis => 'Lengteanalyse';

  @override
  String get heightVsPopulation => 'Jouw positie op de CDC-groeicurve';

  @override
  String get globalAveragesTable => 'Gemiddelde lengte per leeftijd (CDC)';

  @override
  String get standingTall => 'Lang';

  @override
  String get standingAboveAverage => 'Bovengemiddeld';

  @override
  String get standingBelowAverage => 'Ondergemiddeld';

  @override
  String get standingShort => 'Kleiner dan anderen';

  @override
  String get yourHeightStanding => 'JOUW LENGTEPOSITIE';

  @override
  String get bellCurveCaption => 'Hoe lengte verdeeld is op jouw leeftijd';

  @override
  String get bellShorterThanYou => 'kleiner dan jij';

  @override
  String get yourHeight => 'Jij';

  @override
  String peerAvg(int age) {
    return 'Gem. $age jaar';
  }

  @override
  String get aboveAvg => 'Boven gem.';

  @override
  String get belowAvg => 'Onder gem.';

  @override
  String get whoDataSource => 'CDC-groeicurves (VS)';

  @override
  String get percentileShort5 => 'P5';

  @override
  String get percentileShort50 => 'P50';

  @override
  String get percentileShort95 => 'P95';

  @override
  String get youLabel => 'Jij';

  @override
  String get avgHeightLabel => 'GEM.';

  @override
  String get percentileLabel => 'PCT';

  @override
  String get diffLabel => 'VERSCH.';

  @override
  String get whoSourceNote =>
      'Gegevensbron: groeicurves van de Amerikaanse CDC uit 2000 (lengte naar leeftijd, 2 tot 20 jaar). Percentielen vergelijken je met de Amerikaanse bevolking en kunnen per land verschillen.';

  @override
  String get quickPhotos => 'Foto\'s';

  @override
  String get quickPosture => 'Houding';

  @override
  String get quickWellness => 'Welzijn';

  @override
  String get quickRecipes => 'Recepten';

  @override
  String get wellnessTitle => 'Welzijnstracker';

  @override
  String get wellnessHeader => 'WELZIJN';

  @override
  String get wellnessSubtitle => 'Houd factoren bij die je groei beïnvloeden';

  @override
  String get caffeineToday => 'Cafeïne vandaag';

  @override
  String get withinLimits => 'Binnen gezonde grenzen';

  @override
  String get approachingLimit => 'Bijna aan de grens';

  @override
  String get overLimit => 'Over de grens, remt HGH';

  @override
  String get resetToday => 'Vandaag wissen';

  @override
  String get stressToday => 'Stress vandaag';

  @override
  String get stressVeryCalmLabel => 'Heel rustig, ideaal voor groei';

  @override
  String get stressCalmLabel => 'Rustig';

  @override
  String get stressNeutralLabel => 'Neutraal';

  @override
  String get stressStressedLabel => 'Gestrest';

  @override
  String get stressVeryStressedLabel => 'Erg gestrest, cortisol remt HGH';

  @override
  String get stressTapToLog => 'Tik om te loggen hoe je je vandaag voelt';

  @override
  String get todaysJournal => 'Dagboek van vandaag';

  @override
  String get journalNoNote => '(geen notitie)';

  @override
  String get journalEdit => 'Bewerken';

  @override
  String get journalHowWasToday => 'Hoe was je dag?';

  @override
  String get journalSaved => 'Dagboek opgeslagen · +5 XP';

  @override
  String get journalSaveEntry => 'Opslaan';

  @override
  String get weeklyInsight => 'Inzicht van de week';

  @override
  String get weeklyInsightCaffeine => 'CAFEÏNE';

  @override
  String get weeklyInsightStress => 'STRESS';

  @override
  String get weeklyInsightMood => 'STEMMING';

  @override
  String get wellnessInfoTitle => 'Waarom welzijn telt';

  @override
  String get wellnessInfoBody =>
      'Cafeïne verstoort je diepe slaap, en juist dan komt het meeste groeihormoon (HGH) vrij. Langdurige stress verhoogt cortisol, dat HGH direct remt. Een dagboek helpt je om vol te houden met gewoontes die je groei ondersteunen.';

  @override
  String get wellnessInfoGotIt => 'Begrepen';

  @override
  String get insightCaffeineHigh =>
      'Je cafeïne is hoog deze week. Probeer te minderen voor betere slaap en meer HGH.';

  @override
  String get insightStressHigh =>
      'Je stress is verhoogd deze week. Probeer wat ademhalingsoefeningen: cortisol remt je groei.';

  @override
  String get insightMoodLow =>
      'Je stemming is de laatste tijd laag. Zonlicht, slaap en rustige beweging helpen allemaal.';

  @override
  String get insightGreat =>
      'Mooie balans deze week. Je welzijn ondersteunt een optimale groei.';

  @override
  String get insightDefault =>
      'Je welzijn zit goed. Blijf loggen voor diepere inzichten.';

  @override
  String get insightNeedMoreData =>
      'Log nog een paar dagen om inzichten te zien.';

  @override
  String get progressPhotosTitle => 'Voortgangsfoto\'s';

  @override
  String get progressPhotosHeader => 'VOORTGANGSFOTO\'S';

  @override
  String get progressPhotosSubtitle => 'Volg je traject in beeld';

  @override
  String get addProgressPhoto => 'Foto toevoegen';

  @override
  String get captureJourney => 'Leg je traject vast in beeld';

  @override
  String get takePhoto => 'Foto maken';

  @override
  String get chooseFromLibrary => 'Kies uit bibliotheek';

  @override
  String get deletePhotoTitle => 'Foto verwijderen?';

  @override
  String get deletePhotoBody =>
      'Deze foto wordt uit je voortgangstijdlijn verwijderd.';

  @override
  String get timelineTab => 'Tijdlijn';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'foto\'s',
      one: 'foto',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$cm $unit in $days dagen';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dagen',
      one: 'dag',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '$unit gegroeid';
  }

  @override
  String get firstPhotoMessage =>
      'Maak je eerste foto om je voortgang in beeld bij te houden.';

  @override
  String get takeFirstPhoto => 'Eerste foto maken';

  @override
  String get beforeAfter => 'VOOR / NA';

  @override
  String get beforeLabel => 'VOOR';

  @override
  String get afterLabel => 'NA';

  @override
  String get yourHeightDialog => 'Je lengte';

  @override
  String get heightDialogMessage => 'Vul je huidige lengte in voor deze foto';

  @override
  String get postureAnalysisTitle => 'Houdingsanalyse';

  @override
  String get postureCoachHeader => 'HOUDINGSCOACH';

  @override
  String get postureCoachSubtitle => 'Check jezelf met een foto van opzij';

  @override
  String get latestScore => 'LAATSTE SCORE';

  @override
  String get latestAnalysis => 'LAATSTE ANALYSE';

  @override
  String get headPosition => 'Hoofdpositie';

  @override
  String get progressLabel => 'VOORTGANG';

  @override
  String get choosePhotoSource => 'Kies fotobron';

  @override
  String get sideProfileHint => 'Van opzij, hele lichaam in beeld';

  @override
  String get howToTakePhoto => 'ZO MAAK JE DE FOTO';

  @override
  String get takePosturePhoto => 'Houdingsfoto maken';

  @override
  String get postureExcellent => 'Uitstekend';

  @override
  String get postureGood => 'Goed';

  @override
  String get postureNeedsWork => 'Kan beter';

  @override
  String get posturePoor => 'Slecht';

  @override
  String get recommendedExercises => 'AANBEVOLEN OEFENINGEN';

  @override
  String get postureWallStand => 'Tegen de muur';

  @override
  String get postureWallStandDesc =>
      'Sta elke dag 2 minuten met je rug tegen de muur.';

  @override
  String get postureChestOpener => 'Borstopener';

  @override
  String get postureChestOpenerDesc =>
      'Rekt strakke borstspieren die je schouders naar voren trekken.';

  @override
  String get postureChinTucks => 'Kin intrekken';

  @override
  String get postureChinTucksDesc =>
      'Corrigeert een naar voren hangend hoofd — 3×10 herhalingen.';

  @override
  String get postureDeadbug => 'Dead bug';

  @override
  String get postureDeadbugDesc =>
      'Versterkt je diepe core om een holle rug te voorkomen.';

  @override
  String get recipesTitle => 'Recepten';

  @override
  String get recipesHeader => 'RECEPTEN';

  @override
  String get recipesSubtitle => 'Brandstof voor je groei';

  @override
  String get recipesCategoryAll => 'Alle';

  @override
  String get recipesCategoryBreakfast => 'Ontbijt';

  @override
  String get recipesCategoryLunch => 'Lunch';

  @override
  String get recipesCategoryDinner => 'Avondeten';

  @override
  String get recipesCategorySnack => 'Snack';

  @override
  String get recipesGoalAll => 'Alle';

  @override
  String get recipeDiffEasy => 'Makkelijk';

  @override
  String get recipeDiffMedium => 'Gemiddeld';

  @override
  String get recipeDiffHard => 'Moeilijk';

  @override
  String get recipesFilterType => 'TYPE';

  @override
  String get recipesFilterNutrient => 'RIJK AAN';

  @override
  String get recipesGoalVitaminD => 'Vitamine D';

  @override
  String get recipesGoalZinc => 'Zink';

  @override
  String get recipesGoalMagnesium => 'Magnesium';

  @override
  String recipesCountLabel(int count) {
    return '$count recepten';
  }

  @override
  String get recipeIngredients => 'Ingrediënten';

  @override
  String get recipeSteps => 'Bereiding';

  @override
  String get recipesGoalProtein => 'Eiwitrijk';

  @override
  String get recipesGoalCalcium => 'Calcium';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => 'IJzer';

  @override
  String get recipesNoMatch => 'Geen recepten voor deze filters';

  @override
  String get recipesIngredients => 'Ingrediënten';

  @override
  String get recipesInstructions => 'Bereiding';

  @override
  String get recipesClose => 'SLUITEN';

  @override
  String get recipesAboutTitle => 'Over recepten';

  @override
  String get recipesAboutBody =>
      'Zorgvuldig gekozen recepten die je groei een boost geven. Filter op maaltijd of voedingsdoel om te vinden wat bij je plan past.';

  @override
  String get animHintSpinalDecomp => 'Ontlasting van de wervelkolom';

  @override
  String get animHintGravityReversal => 'Zwaartekracht omkeren';

  @override
  String get animHintImpactBones => 'Impactbelasting voor botten';

  @override
  String get animHintHighImpact => 'Stevige botbelasting';

  @override
  String get animHintMetabolicBurst => 'Korte, intensieve training';

  @override
  String get animHintFullBodyStretch =>
      'Wakker worden met een full-body stretch';

  @override
  String get animHintSpinalExtension => 'Rugstrekking';

  @override
  String get animHintCervicalDecomp => 'Ontlasting van de nek';

  @override
  String get animHintShoulderMobility => 'Schoudermobiliteit';

  @override
  String get animHintFullBodyMotion => 'Volledige beweging';

  @override
  String get animHintPosteriorChain => 'Stretch voor de achterkant';

  @override
  String get animHintMuscleGrowth => 'Brandstof voor spiergroei';

  @override
  String get animHintBoneDensity => 'Steun voor botdichtheid';

  @override
  String get animHintSpinalDisc => 'Vocht voor tussenwervelschijven';

  @override
  String get animHintCleanNutrition => 'Gezonde voeding';

  @override
  String get animHintIgf1 => 'IGF-1-optimalisatie';

  @override
  String get animHintHghAmino => 'Aminozuur voor HGH';

  @override
  String get animHintCalciumAbsorption => 'Opname van calcium';

  @override
  String get animHintSpinalAlignment => 'Rechte wervelkolom';

  @override
  String get animHintPostureCorrection => 'Houdingscorrectie';

  @override
  String get animHintMindBody => 'Balans lichaam-geest';

  @override
  String get animHintCoreStability => 'Corestabiliteit';

  @override
  String get animHintLegPower => 'Beenkracht en HGH-boost';

  @override
  String get animHintVerticalPower => 'Springkracht';

  @override
  String get animHintHghSurge => 'Training voor HGH-boost';

  @override
  String get animHintPeakHgh => 'Piekmoment voor HGH';

  @override
  String get animHintMelatonin => 'Melatonine-optimalisatie';

  @override
  String get animHintDeepSleep => 'Klaar voor diepe slaap';

  @override
  String get animHintSleepOpt => 'Slaapoptimalisatie';

  @override
  String get animHintExercise => 'Oefening';

  @override
  String get formMorningStretch =>
      'Begin met nekrollen en ga dan over op stretches voor je hele lichaam. Houd elke stretch 20-30 seconden vast zonder te veren.';

  @override
  String get formBarHanging =>
      'Pak de stang op schouderbreedte, ontspan je hele lichaam en laat de zwaartekracht je wervelkolom strekken. Niet zwaaien.';

  @override
  String get formCobraStretch =>
      'Ga op je buik liggen, zet je handen onder je schouders en duw je bovenlichaam langzaam omhoog terwijl je heupen op de grond blijven. Kijk omhoog.';

  @override
  String get formJumping =>
      'Doe squat jumps of touwtjespringen. Land zacht op je voorvoeten. Rust 30 seconden tussen de sets.';

  @override
  String get formSwimmingBasketball =>
      'Kies zwemmen (borstcrawl/rugslag) of basketbal. Focus op springen, reiken en een volledige bewegingsuitslag.';

  @override
  String get formEveningYoga =>
      'Doe rustige houdingen: kat-koe, kindhouding, neerwaartse hond, voorwaartse buiging. Adem diep en houd elke houding 30-60 seconden vast.';

  @override
  String get formSprintIntervals =>
      'Warm 5 minuten op en sprint dan 30 seconden op maximale kracht. Wandel of jog 90 seconden om te herstellen. Herhaal.';

  @override
  String get formHiitWorkout =>
      'Doe oefeningen zoals burpees, mountain climbers en jump squats 45 seconden op maximale intensiteit, en rust 15 seconden.';

  @override
  String get formSquats =>
      'Sta met je voeten op schouderbreedte. Zak tot je bovenbenen parallel aan de grond zijn. Houd je rug recht en je knieën achter je tenen.';

  @override
  String get formDeadliftStretch =>
      'Sta met je voeten op heupbreedte en buig vanuit je heupen met een vlakke rug. Reik naar je tenen en voel de stretch in je hamstrings en rug.';

  @override
  String get formOverheadPress =>
      'Sta rechtop en duw je armen helemaal gestrekt boven je hoofd. Gebruik lichte gewichten of je eigen gewicht. Span je core aan en maak geen holle rug.';

  @override
  String get formSkippingRope =>
      'Spring met beide voeten en land zacht op je voorvoeten. Houd je sprongen laag en gelijkmatig. Rust tussen de sets.';

  @override
  String get formPilatesCore =>
      'Doe planken, dead bugs, bird dogs, bruggen en beenheffingen. Focus op gecontroleerde bewegingen en je ademhaling.';

  @override
  String get formInversionHang =>
      'Gebruik een inversietafel of zwaartekrachtlaarzen. Begin met een kleine hoek en bouw langzaam op. Houd de sessies kort.';

  @override
  String get formProtein =>
      'Verdeel je eiwitten over 3-4 maaltijden. Eet eieren, kip, vis, zuivel en peulvruchten.';

  @override
  String get formCalciumVitaminD =>
      'Neem 3 porties zuivel per dag en pak 15 minuten zonlicht voor natuurlijke aanmaak van vitamine D.';

  @override
  String get formWater =>
      'Drink de hele dag door regelmatig water. Neem een waterfles mee en zet elk uur een herinnering.';

  @override
  String get formAvoidJunk =>
      'Vervang fastfood door onbewerkt eten. Ruil suikerrijke drankjes in voor water. Lees etiketten en vermijd bewerkte ingrediënten.';

  @override
  String get formZincIntake =>
      'Eet rood vlees, pompoenpitten, kikkererwten, cashewnoten en oesters. Mik op 8-11 mg per dag.';

  @override
  String get formVitaminDSunlight =>
      'Laat je armen en gezicht 15 minuten in de directe zon, het liefst voor 12:00. Voor zo\'n korte tijd is zonnebrand niet nodig.';

  @override
  String get formArginineFoods =>
      'Eet noten, zaden, kalkoen, kip, sojabonen en zuivel. Het beste voor het slapengaan.';

  @override
  String get formDailyCalories =>
      'Verdeel je calorieën over 3-5 maaltijden en sla het ontbijt niet over. Kies onbewerkt eten boven lege calorieën.';

  @override
  String get formQualitySleep =>
      'Ga om 22:00 naar bed. Houd je kamer donker en koel. Geen cafeïne na 14:00.';

  @override
  String get formNoScreen =>
      'Zet een wekker 1 uur voor bedtijd. Leg alle schermen weg. Lees een boek of doe rustige stretches.';

  @override
  String get formSleepEnvironment =>
      'Gebruik verduisterende gordijnen, houd je kamer op 18-20 °C en haal alle lichtbronnen weg. Zorg voor een fijn matras en kussen.';

  @override
  String get formPreSleepRoutine =>
      'Begin 30 minuten voor bedtijd: dim het licht, lees een boek, doe ademhalingsoefeningen en vermijd prikkelende activiteiten.';

  @override
  String get formPostureCheck =>
      'Sta rechtop met je schouders naar achteren en omlaag. Span je core licht aan. Stel je voor dat een touwtje je aan je kruin omhoogtrekt.';

  @override
  String get formWallStand =>
      'Sta met je hielen, billen, schouderbladen en hoofd tegen de muur. Houd 5 minuten vast. Adem normaal.';

  @override
  String get formNeckStretches =>
      'Kantel je hoofd langzaam naar elke kant, naar voren en naar achteren. Houd elke richting 30 seconden vast. Forceer de stretch niet.';

  @override
  String get formShoulderRolls =>
      'Rol je schouders 15 keer naar voren en daarna 15 keer naar achteren. Doe daarna borstopenende stretches en houd die 20 seconden vast.';

  @override
  String get sciMorningStretch =>
      'Stretchen in de ochtend ontlast de tussenwervelschijven die \'s nachts weer vocht hebben opgenomen, zodat je zoveel mogelijk lengte behoudt';

  @override
  String get sciBarHanging =>
      'Hangen ontlast de tussenwervelschijven doordat de zwaartekracht je wervelkolom strekt, wat je tijdelijk iets langer kan maken';

  @override
  String get sciCobraStretch =>
      'De cobrastretch strekt je wervelkolom en opent je borst, als tegenwicht voor de druk van het zitten';

  @override
  String get sciJumping =>
      'Stevig springen prikkelt de groeischijven in je benen en zet de afgifte van groeihormoon in gang';

  @override
  String get sciSwimmingBasketball =>
      'Zwemmen en basketbal combineren strekken, springen en reiken van je hele lichaam, wat de groeischijven activeert';

  @override
  String get sciEveningYoga =>
      'Yoga in de avond verlaagt cortisol, dat groeihormoon remt, en rekt je spieren voor herstel tijdens de nacht';

  @override
  String get sciSprintIntervals =>
      'Sprinten zorgt voor een flinke afgifte van groeihormoon';

  @override
  String get sciHiitWorkout => 'Intensieve training kan HGH tot 450% verhogen';

  @override
  String get sciSquats =>
      'Squats prikkelen de groeischijven in je benen en wervelkolom';

  @override
  String get sciDeadliftStretch =>
      'Ontlasting van de wervelkolom houdt je tussenwervelschijven gezond';

  @override
  String get sciOverheadPress =>
      'Boven je hoofd drukken strekt je wervelkolom en versterkt je houdingsspieren';

  @override
  String get sciSkippingRope =>
      'Herhaald springen prikkelt de groeischijven in je benen';

  @override
  String get sciPilatesCore =>
      'Een sterke core ondersteunt de uitlijning van je wervelkolom en je houding';

  @override
  String get sciInversionHang =>
      'Ondersteboven hangen ontlast je tussenwervelschijven en kan tijdelijk 1-2 cm opleveren';

  @override
  String get sciProtein =>
      'Eiwit levert aminozuren die essentieel zijn voor bot- en spiergroei, vooral tijdens groeispurts';

  @override
  String get sciCalciumVitaminD =>
      'Calcium en vitamine D zijn de belangrijkste bouwstenen voor botdichtheid en de lengtegroei van botten';

  @override
  String get sciWater =>
      'Genoeg drinken is essentieel voor het transport van voedingsstoffen naar je groeischijven en voor gezond gewrichtskraakbeen';

  @override
  String get sciAvoidJunk =>
      'Bewerkt eten en suiker veroorzaken ontstekingen en insulinepieken die de afgifte van groeihormoon remmen';

  @override
  String get sciZincIntake =>
      'Zink is essentieel voor de aanmaak van groeihormoon';

  @override
  String get sciVitaminDSunlight =>
      'Vitamine D is cruciaal voor de opname van calcium en botgroei';

  @override
  String get sciArginineFoods =>
      'L-arginine stimuleert de afgifte van groeihormoon';

  @override
  String get sciDailyCalories =>
      'Een langdurig calorietekort verlaagt IGF-1 en dempt de pieken van groeihormoon, waardoor je lengtegroei in de puberteit direct vertraagt';

  @override
  String get sciQualitySleep =>
      '70-80% van je dagelijkse groeihormoon komt vrij tijdens de diepe slaap, vooral tussen 22:00 en 2:00';

  @override
  String get sciNoScreen =>
      'Blauw licht van schermen remt de aanmaak van melatonine, waardoor je later inslaapt en minder diep slaapt';

  @override
  String get sciSleepEnvironment =>
      'Een donkere, koele kamer zorgt voor zoveel mogelijk melatonine en groeihormoon';

  @override
  String get sciPreSleepRoutine =>
      'Een vaste routine voor het slapengaan verbetert je diepe slaap met 23%';

  @override
  String get sciPostureCheck =>
      'Een goede houding kan je direct 2-3 cm langer laten lijken en voorkomt druk op je wervelkolom';

  @override
  String get sciWallStand =>
      'Tegen de muur staan traint het spiergeheugen voor je houding, zodat je wervelkolom de hele dag goed uitgelijnd blijft';

  @override
  String get sciNeckStretches =>
      'Nekstretches verminderen druk en verbeteren de stand van je nekwervels';

  @override
  String get sciShoulderRolls =>
      'Je schouders openen corrigeert een voorovergebogen houding en kan je er 1-2 cm langer laten uitzien';

  @override
  String get muscleSpine => 'Wervelkolom';

  @override
  String get muscleLegs => 'Benen';

  @override
  String get muscleBack => 'Rug';

  @override
  String get muscleShoulders => 'Schouders';

  @override
  String get muscleArms => 'Armen';

  @override
  String get muscleCore => 'Core';

  @override
  String get muscleChest => 'Borst';

  @override
  String get muscleCalves => 'Kuiten';

  @override
  String get muscleFullBody => 'Hele lichaam';

  @override
  String get muscleHips => 'Heupen';

  @override
  String get muscleBones => 'Botten';

  @override
  String get muscleMuscles => 'Spieren';

  @override
  String get muscleNeck => 'Nek';

  @override
  String get muscleUpperSpine => 'Bovenste wervelkolom';

  @override
  String get muscleUpperBack => 'Bovenrug';

  @override
  String get createRoutine => 'Routine maken';

  @override
  String get createRoutineTitle => 'Eigen routine maken';

  @override
  String get createRoutineSubtitle => 'Stel je eigen dagelijkse routine samen';

  @override
  String get routineIcon => 'Icoon';

  @override
  String get routineTitleField => 'Titel';

  @override
  String get routineDescField => 'Beschrijving';

  @override
  String get routineDescHint => 'Korte samenvatting van de routine';

  @override
  String get routineCategoryField => 'Categorie';

  @override
  String get routineDifficultyField => 'Moeilijkheid';

  @override
  String get routineDurationField => 'Duur';

  @override
  String get routineSetsRepsField => 'Sets x herhalingen';

  @override
  String get routineFormField => 'Uitvoering';

  @override
  String get routineFormHint => 'Optioneel: hoe je deze routine uitvoert';

  @override
  String get diffBeginner => 'Beginner';

  @override
  String get diffIntermediate => 'Gemiddeld';

  @override
  String get diffAdvanced => 'Gevorderd';

  @override
  String get catExercise => 'Oefening';

  @override
  String get catNutrition => 'Voeding';

  @override
  String get catSleep => 'Slaap';

  @override
  String get catPosture => 'Houding';

  @override
  String get postureTip1 => 'Ga zijwaarts (van opzij) voor de camera staan.';

  @override
  String get postureTip2 => 'Houd zo\'n 2 meter afstand van de lens.';

  @override
  String get postureTip3 => 'Armen ontspannen, kijk recht vooruit.';

  @override
  String get postureTip4 =>
      'Draag nauwsluitende kleding voor een nauwkeurige score.';

  @override
  String get postureTip5 => 'Zorg voor goed licht en een effen achtergrond.';

  @override
  String get kyphosisLabel => 'Kyfose (bovenrug)';

  @override
  String get lordosisLabel => 'Lordose (onderrug)';

  @override
  String get analyzingPosture => 'HOUDING ANALYSEREN';

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String get termsOfService => 'Gebruiksvoorwaarden';

  @override
  String version(String ver) {
    return 'Versie $ver';
  }

  @override
  String get rateApp => 'Beoordeel BeTaller';

  @override
  String get rateAppSubtitle => 'Jouw review helpt ons groeien!';

  @override
  String get unitSystem => 'Eenheden';

  @override
  String get unitMetric => 'Metrisch (cm, kg)';

  @override
  String get unitImperial => 'Imperiaal (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'Gezondheidsdisclaimer';

  @override
  String get healthDisclaimerBody =>
      'BeTaller geeft algemene adviezen over welzijn en fitness. Resultaten verschillen per leeftijd, genetica en persoonlijke factoren. Deze app geeft geen medisch advies. De oefeningen richten zich op een betere houding, een gezonde wervelkolom en ondersteuning van groeihormoon via natuurlijke gewoontes. Raadpleeg een zorgverlener voordat je aan een nieuw trainings- of voedingsprogramma begint. Lengteveranderingen nadat de groeischijven gesloten zijn (meestal tussen 18 en 25) komen vooral door een betere houding.';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'Eet vandaag minstens $grams g eiwit — berekend op basis van je gewicht.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'Drink vandaag minstens $liters L water — berekend op basis van je gewicht.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'Mik vandaag op ongeveer $kcal kcal als brandstof voor je groei.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'Neem vandaag $iu IU vitamine D — uit zonlicht, voeding of een supplement.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'Neem vandaag $mg mg zink voor de aanmaak van groeihormoon.';
  }

  @override
  String get nutritionSupplementsTitle => 'SUPPLEMENTEN';

  @override
  String get nutritionSupplementsDisclaimer =>
      'Optionele aanvulling, geen vervanging voor eten. Overleg met een arts voordat je een supplement gaat nemen, zeker als je jonger bent dan 18.';

  @override
  String get supplementVitaminDName => 'Vitamine D3';

  @override
  String get supplementVitaminDDose => '3.000 IU';

  @override
  String get supplementVitaminDBenefit =>
      'Verbetert de opname van calcium voor botdichtheid en gezonde groeischijven';

  @override
  String get supplementZincName => 'Zink';

  @override
  String get supplementZincDose => '8-11 mg';

  @override
  String get supplementZincBenefit =>
      'Een belangrijk mineraal voor de aanmaak van groeihormoon';

  @override
  String get supplementMagnesiumName => 'Magnesium';

  @override
  String get supplementMagnesiumDose => '300-400 mg';

  @override
  String get supplementMagnesiumBenefit =>
      'Ondersteunt de diepe slaap, waarin het meeste groeihormoon vrijkomt';

  @override
  String get supplementCalciumName => 'Calcium';

  @override
  String get supplementCalciumDose => '1.000-1.300 mg';

  @override
  String get supplementCalciumBenefit =>
      'De belangrijkste bouwsteen voor botdichtheid en groeischijven';

  @override
  String get supplementOmega3Name => 'Omega-3';

  @override
  String get supplementOmega3Dose => '1.000 mg';

  @override
  String get supplementOmega3Benefit =>
      'Remt ontstekingen en ondersteunt gezonde groeischijven';

  @override
  String get supplementCollagenName => 'Collageen + vitamine C';

  @override
  String get supplementCollagenDose => '10 g + 500 mg';

  @override
  String get supplementCollagenBenefit =>
      'Vitamine C helpt je lichaam collageen te gebruiken om kraakbeen en botweefsel op te bouwen';

  @override
  String get sciSourcePrefix => 'Bron: ';

  @override
  String get program => 'Programma';

  @override
  String get todaysExercises => 'OEFENINGEN VAN VANDAAG';

  @override
  String get dailyNutritionPlan => 'DAGELIJKS VOEDINGSPLAN';

  @override
  String get nutritionGoalsComplete => '🎉 Alle voedingsdoelen gehaald!';

  @override
  String get nutritionGoalsIncomplete =>
      'Haal je voedingsdoelen voor optimale groei';

  @override
  String get postureDetectingAlignment =>
      'Uitlijning van wervelkolom bepalen...';

  @override
  String get testimonial1 =>
      'Door mijn leeftijd had ik geen hoop meer, maar met BeTaller ben ik gegroeid. Ik heb nog nooit zoveel zelfvertrouwen gehad.';

  @override
  String get testimonialDuration1 => '4 maanden';

  @override
  String get testimonial2 =>
      'Iedereen zei: \"Je kunt niet meer groeien.\" Ik gebruikte BeTaller en verraste iedereen.';

  @override
  String get testimonialDuration2 => '3 maanden';

  @override
  String get testimonial3 =>
      'Sinds ik met de routines ben begonnen, ben ik langer geworden en is mijn houding beter. Iedereen zag het verschil.';

  @override
  String get testimonialDuration3 => '6 maanden';

  @override
  String get testimonial4 =>
      'Ik zit nog in mijn groeifase en het effect van BeTaller is ongelooflijk. Ik voel me langer en sterker.';

  @override
  String get testimonialDuration4 => '3 maanden';

  @override
  String get testimonial5 =>
      'Als ik zou zeggen dat ik BeTaller niet heb geprobeerd, zou ik liegen. Ik merkte snel echt verschil, echt een aanrader.';

  @override
  String get testimonialDuration5 => '4 maanden';

  @override
  String get designedForYou => 'Gemaakt voor jou';

  @override
  String get designedForYouDesc =>
      'BeTaller is speciaal gemaakt om jou je genetische limiet te laten bereiken, en zelfs te overtreffen. Elke functie, voor jou.';

  @override
  String get greetingAllDone => 'Goed gedaan! 🎯';

  @override
  String get greetingAllDoneSub => 'Je hebt de taken van vandaag afgerond.';

  @override
  String greetingStreak30(int streak) {
    return '$streak dagen op rij. Legendarisch niveau.';
  }

  @override
  String greetingStreak7(int streak) {
    return '$streak dagen op rij. Ga zo door.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak dagen op rij. De meeste mensen haken af. Jij niet.';
  }

  @override
  String get greetingMorning => 'Goedemorgen. Een nieuwe dag, een nieuwe kans.';

  @override
  String get greetingAfternoon =>
      'Vandaag is een mooie dag om je reeks te starten.';

  @override
  String get greetingEvening => 'Rond je taken af en start je reeks.';

  @override
  String get todayCompleted => 'Vandaag voltooid ✓';

  @override
  String get todayGoals => 'Doelen van vandaag';

  @override
  String get challengesLabel => 'Uitdagingen';

  @override
  String get dailyChallengesLabel => 'DAGELIJKSE UITDAGINGEN';

  @override
  String get expiresTonight => 'Verloopt vannacht';

  @override
  String get allChallengesCompleted => 'Alles voltooid ✓';

  @override
  String get challengesLoading => 'Nieuwe uitdagingen komen eraan.';

  @override
  String get challengesLoadingTitle => 'Dagelijkse uitdagingen';

  @override
  String get behindPace => 'Achter op schema';

  @override
  String get growthTracking => 'Groei bijhouden';

  @override
  String get growthEmptyFirst => 'Log je eerste lengte om te beginnen.';

  @override
  String get growthEmptySecond => 'Log je tweede meting om je grafiek te zien.';

  @override
  String get growthSectionLabel => 'GROEI';

  @override
  String get generalPerformance => 'TOTALE PRESTATIE';

  @override
  String get analysisBalance => 'Je balans';

  @override
  String get analysisWeakest => 'Je zwakste schakel';

  @override
  String get analysisPrediction => 'Lengtevoorspelling';

  @override
  String get analysisComparison => 'Vergelijking';

  @override
  String get analysisGrowth => 'Groeistatus';

  @override
  String get analysisWeakestHint => 'Hier verhoog je je score het snelst.';

  @override
  String get exploreLabel => 'ONTDEKKEN';

  @override
  String get explorePosture => 'Houdingsanalyse';

  @override
  String get explorePostureSub => 'Houdingsanalyse en tips om te corrigeren';

  @override
  String get explorePhotos => 'Voortgangsfoto\'s';

  @override
  String get explorePhotosSub => 'Volg je transformatie met foto\'s';

  @override
  String get exploreNutrition => 'Voeding';

  @override
  String get exploreNutritionSub => 'Gids voor eiwit, calcium en vitamines';

  @override
  String get exploreHealth => 'Gezondheid';

  @override
  String get exploreHealthSub => 'Stress, cafeïne en welzijn bijhouden';

  @override
  String get exploreRecipes => 'Groeirecepten';

  @override
  String get exploreRecipesSub => 'Recepten die groei ondersteunen';

  @override
  String get educationLabel => 'KENNIS';

  @override
  String get educationTitle => 'De wetenschap\nvan lengtegroei';

  @override
  String get educationSubtitle => 'Expertcontent, onderzoek en gidsen';

  @override
  String get aiAnalysisLabel => 'GROEIANALYSE';

  @override
  String get peerCompareLabel => 'VERGELIJK MET LEEFTIJDSGENOTEN';

  @override
  String peerCompareText(int topPct) {
    return 'Je hoort bij de top $topPct% van je leeftijdsgenoten';
  }

  @override
  String get notifWaterTitle => '💧 Vergeet niet te drinken!';

  @override
  String get notifWaterBody =>
      'Heb je je dagelijkse waterdoel al gehaald? Drink nog een glas!';

  @override
  String get notifMorningTitle => '🌅 Goedemorgen! Tijd om te bewegen';

  @override
  String get notifMorningBody =>
      'Doe je ochtendstretch! 10 minuten stretchen voor je rug en benen.';

  @override
  String get notifRoutineTitle => '🔥 Rond je routines af!';

  @override
  String get notifRoutineBody =>
      'Check je routines voordat de dag voorbij is. Reeks = discipline!';

  @override
  String get notifProteinTitle => '🥚 Eiwitdag!';

  @override
  String get notifProteinBody =>
      'Begin de week sterk! Eet bij elke maaltijd eiwitten.';

  @override
  String get notifNewWeekTitle => '✨ Nieuwe week, nieuwe doelen!';

  @override
  String get notifNewWeekBody =>
      'Sla deze week geen routines over. Kleine stappen, groot verschil!';

  @override
  String get notifSleepTitle => '😴 Bedtijd!';

  @override
  String get notifSleepBody =>
      'Groeihormoon piekt tussen 22:00 en 2:00. Leg je telefoon weg!';

  @override
  String get notifPostureTitle => '🧍 Houdingscheck!';

  @override
  String get notifPostureBody =>
      'Rug recht, schouders naar achteren. Goede houding = 2-3 cm verschil!';

  @override
  String get notifVitaminDTitle => '☀️ Tijd voor vitamine D!';

  @override
  String get notifVitaminDBody =>
      'Pak 15 minuten zon! Vitamine D helpt je calcium op te nemen.';

  @override
  String get notifMidweekTitle => '✨ Halverwege!';

  @override
  String get notifMidweekBody =>
      'Check halverwege de week. Groeien vraagt geduld, maar volhouden wint!';

  @override
  String get notifScreenTitle => '📵 Schermen uit!';

  @override
  String get notifScreenBody =>
      'Geen schermen 1 uur voor bedtijd. Blauw licht blokkeert melatonine!';

  @override
  String get notifJumpTitle => '🦘 Springtijd!';

  @override
  String get notifJumpBody =>
      'Springoefeningen prikkelen je groeischijven. Probeer 3 x 20 herhalingen!';

  @override
  String get notifCalciumTitle => '🥛 Tijd voor calcium!';

  @override
  String get notifCalciumBody =>
      'Een glas melk of yoghurt. Calcium is cruciaal voor je botten!';

  @override
  String get notifPostureCheckTitle => '🧍 Houdingscheck!';

  @override
  String get notifPostureCheckBody =>
      'Buig je nek niet naar je telefoon! Zit en loop rechtop.';

  @override
  String get notifWeekendTitle => '✨ Weekendmotivatie';

  @override
  String get notifWeekendBody =>
      'Sla in het weekend geen routines over! Discipline geldt elke dag.';

  @override
  String get notifWeeklyProgressTitle => '📊 Weekvoortgang';

  @override
  String get notifWeeklyProgressBody =>
      'Hoe was je week? Bekijk je groeigrafiek!';

  @override
  String get notifMeasureTitle => '📏 Wekelijkse meting!';

  @override
  String get notifMeasureBody =>
      'Meet en log je lengte! Metingen in de ochtend zijn het nauwkeurigst.';

  @override
  String get notifEarlySleepTitle => '😴 Vroeg naar bed!';

  @override
  String get notifEarlySleepBody =>
      'Morgen is het maandag! Begin de week sterk met goede slaap.';

  @override
  String get notifStreak3Title => '🔥 3 dagen op rij!';

  @override
  String get notifStreak3Body => 'Mooie start! 3 dagen op rij. Ga door tot 7!';

  @override
  String get notifStreak7Title => '🏆 1 week op rij!';

  @override
  String get notifStreak7Body =>
      'Ongelooflijk! 7 dagen achter elkaar je routines afgerond!';

  @override
  String get notifStreak14Title => '⭐ 2 weken op rij!';

  @override
  String get notifStreak14Body =>
      '14 dagen discipline! Je lichaam begint te veranderen.';

  @override
  String get notifStreak30Title => '👑 1 maand op rij!';

  @override
  String get notifStreak30Body => '30 dagen! Je bent een kampioen!';

  @override
  String get notifStreak60Title => '🌟 60 dagen op rij!';

  @override
  String get notifStreak60Body => '60 dagen! Een ongelooflijke prestatie.';

  @override
  String get notifStreak100Title => '💎 100 DAGEN! LEGENDARISCH!';

  @override
  String get notifStreak100Body =>
      '100 dagen op rij! Je bent een legende geworden.';

  @override
  String get notifStreakRiskTitle => '⚠️ Verlies je reeks niet!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Je reeks van $streak dagen loopt gevaar! Rond je routines af.';
  }

  @override
  String get paywallStat1 => 'cm — je potentieel is vergrendeld';

  @override
  String get paywallTitle1 => 'Hoeveel cm\nkun je groeien?';

  @override
  String get paywallBullet1a =>
      'Je genetisch plafond is berekend, wil je het zien?';

  @override
  String get paywallBullet1b => 'Hoe beïnvloedt je leefstijl je groei?';

  @override
  String get paywallBullet1c => 'Je persoonlijke stappenplan staat klaar';

  @override
  String get paywallStat2 => 'je eigen routine staat klaar';

  @override
  String get paywallTitle2 => 'Je plan\nstaat klaar';

  @override
  String get paywallBullet2a =>
      'Elke ochtend 8 minuten — gemaakt voor je wervelkolom';

  @override
  String get paywallBullet2b => 'Slaap, voeding, water — alles bijgehouden';

  @override
  String get paywallBullet2c =>
      'Elke dag een stap dichterbij, verbreek je reeks niet';

  @override
  String get paywallStat3 => 'voortgangsgrafieken in realtime';

  @override
  String get paywallTitle3 => 'Volg je\ngroei';

  @override
  String get paywallBullet3a =>
      'Maandelijkse metingen — zie je groei met eigen ogen';

  @override
  String get paywallBullet3b => 'Win direct 2 cm met de houdingsanalyse';

  @override
  String get paywallBullet3c => 'Voortgangsfoto\'s — je gaat het verschil zien';

  @override
  String get paywallStat4 => 'dagprogramma — level up';

  @override
  String get paywallTitle4 => 'Elke dag\nsterker';

  @override
  String get paywallBullet4a =>
      'Verdien XP, ontgrendel levels — gewoontes worden een game';

  @override
  String get paywallBullet4b => 'Wie zijn doel bereikte, begon hier';

  @override
  String get paywallBullet4c => 'Begin nu — eerste week gratis';

  @override
  String get paywallRestore => 'Geen eerdere aankoop gevonden';

  @override
  String get paywallRestoreNotFound => 'Geen eerdere aankoop gevonden';

  @override
  String get paywallPromoCode => 'Heb je een promocode?';

  @override
  String get paywallHeightUnit => 'streeflengte';

  @override
  String get paywallHeightTitle => 'Hoeveel langer kun je worden?';

  @override
  String get paywallHeightDesc =>
      'We analyseren je genetica, leefstijl en houding samen en zetten de voorspelling per jaar uit. Niets ligt vast: elke stap die je zet, werkt hem bij.';

  @override
  String get paywallGrowthUnit => 'dit jaar';

  @override
  String get paywallGrowthTitle => 'We volgen je groei samen met jou';

  @override
  String get paywallGrowthDesc =>
      'Elke meting staat meteen in de grafiek. Je ziet je voortgang maand na maand, centimeter voor centimeter.';

  @override
  String get paywallPostureUnit => 'houdingsscore';

  @override
  String get paywallPostureTitle => 'Je houding is de sleutel tot je routines';

  @override
  String get paywallPostureDesc =>
      'Een snelle check van 3 vragen over je hoofd, schouders en onderrug, met precies de oefeningen om elk punt te verbeteren.';

  @override
  String get paywallReportUnit => 'routines afgerond';

  @override
  String get paywallReportTitle => 'We bekijken je voortgang elke week';

  @override
  String get paywallReportDesc =>
      'Water, slaap, routines en reeks op één scherm. Elke week zien we samen precies wat je sterke punten zijn en waar je nog kunt groeien.';

  @override
  String get paywallNutritionUnit => 'maaltijden per dag';

  @override
  String get paywallNutritionTitle => 'Je complete voedingsplan staat klaar';

  @override
  String get paywallNutritionDesc =>
      'Van ontbijt tot avondeten: een volledig dagplan met eiwit, calcium, zink en vitamine D al uitgerekend.';

  @override
  String get paywallScoreUnit => 'BeTaller-score';

  @override
  String get paywallScoreTitle => 'Het systeem dat je blijft vooruithelpen';

  @override
  String get paywallScoreDesc =>
      'Genetica, groei, voeding, slaap en discipline komen samen in één score. Zodra die daalt, zie je precies waar je kunt verbeteren.';

  @override
  String get paywallPhotosUnit => 'zichtbaar verschil';

  @override
  String get paywallPhotosTitle => 'Bewijs je verandering met foto\'s';

  @override
  String get paywallPhotosDesc =>
      'Voor-en-navergelijkingen maken zichzelf, en de foto van elke maand staat samen op je tijdlijn.';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => 'We beginnen in drie stappen';

  @override
  String get journeyIntroSubtitle =>
      'We stellen BeTaller samen in. Je volgende stap wacht.';

  @override
  String get journeyStep1Title => 'Je gegevens verzamelen';

  @override
  String get journeyStep1Desc =>
      'We nemen je lengte, leeftijd en leefstijl en berekenen je potentieel.';

  @override
  String get journeyStep2Title => 'Rondleiding door de app';

  @override
  String get journeyStep2Desc =>
      'We lopen elke functie door: wat ze doet en hoe je ze gebruikt.';

  @override
  String get journeyStep3Title => 'Zelf aan de slag';

  @override
  String get journeyStep3Desc =>
      'Jij doet je dagelijkse routine en wij houden je voortgang bij.';

  @override
  String get journeyNow => 'NU';

  @override
  String get journeyDone => 'KLAAR';

  @override
  String get journeySoon => 'STRAKS';

  @override
  String get tourHomeStreakTitle => 'Je reeks';

  @override
  String get tourHomeStreakDesc =>
      'Groeit zolang je gedisciplineerd blijft. Mis je een dag, dan begint hij opnieuw.';

  @override
  String get tourHomeXpTitle => 'Je level';

  @override
  String get tourHomeXpDesc =>
      'Stijgt met de XP die je verdient door gedisciplineerd te blijven. Raak niet van het pad af!';

  @override
  String get tourHomeGoalsTitle => 'Doelen van vandaag';

  @override
  String get tourHomeGoalsDesc =>
      'Toont je routines, taken en waterdoel van vandaag in één oogopslag, zodat je niets mist.';

  @override
  String get tourHomeTrackTitle => 'Water en slaap bijhouden';

  @override
  String get tourHomeTrackDesc =>
      'Log je water en slaap hier, in een paar seconden.';

  @override
  String get tourPlanTabsTitle => 'Drie tabs: Vandaag, Discipline, Voeding';

  @override
  String get tourPlanTabsDesc =>
      'Je dagelijkse routine, je weekprogramma en je voedingsplan staan allemaal hier.';

  @override
  String get tourPlanLevelTitle => 'Je disciplineniveau';

  @override
  String get tourPlanLevelDesc =>
      'Laat zien hoe consequent je je routines afrondt. Stijg in niveau voor betere resultaten.';

  @override
  String get tourPlanTodayTitle => 'Plan van vandaag';

  @override
  String get tourPlanTodayDesc =>
      'Vink hier je dagelijkse routines af om je reeks te laten groeien.';

  @override
  String get tourPlanTodayListTitle => 'Je routines voor vandaag';

  @override
  String get tourPlanTodayListDesc =>
      'Vink ze af zodra je ze doet. Tik op een routine om de details te openen.';

  @override
  String get tourPlanWeekGoalsTitle => 'Deze week';

  @override
  String get tourPlanWeekGoalsDesc =>
      'Perfecte dagen, trainingen en de meting die deze week van je vraagt, inclusief de verplichte.';

  @override
  String get tourPlanMonthGoalsTitle => 'Deze maand';

  @override
  String get tourPlanMonthGoalsDesc =>
      'Voortgangsfoto\'s, een houdingscheck en de metingen van deze maand: die wil je niet overslaan.';

  @override
  String get tourProgressHeightTitle => 'Je huidige lengte';

  @override
  String get tourProgressHeightDesc =>
      'Toont je lengte van nu en je totale groei. Voeg hier een nieuwe meting toe.';

  @override
  String get tourProgressPhotosTitle => 'Voortgangsfoto\'s';

  @override
  String get tourProgressPhotosDesc =>
      'Volg je transformatie in beeld met foto\'s die je regelmatig maakt.';

  @override
  String get tourProgressPostureTitle => 'Houdingsanalyse';

  @override
  String get tourProgressPostureDesc =>
      'Laat je houding analyseren met een foto en ontdek waar je aan moet werken.';

  @override
  String get tourAnalysisScoreTitle => 'Je BeTaller-score';

  @override
  String get tourAnalysisScoreDesc =>
      'Je totaalscore, berekend uit je genetica, groeisnelheid, voeding en slaap.';

  @override
  String get tourAnalysisPredictionTitle => 'Je lengtevoorspelling';

  @override
  String get tourAnalysisPredictionDesc =>
      'Toont je voorspelde eindlengte en je verloop per jaar.';

  @override
  String get tourAnalysisPeerTitle => 'Vergelijk met leeftijdsgenoten';

  @override
  String get tourAnalysisPeerDesc =>
      'Zie waar je staat en vergelijk jezelf met anderen van je leeftijd.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'Je routines';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'Zie hoeveel trainingsroutines je vandaag nog moet afronden.';

  @override
  String get tourHomeGoalsChallengesTitle => 'Je taken';

  @override
  String get tourHomeGoalsChallengesDesc =>
      'Volg hier de voortgang van je actieve uitdagingen.';

  @override
  String get tourHomeGoalsWaterTitle => 'Je waterdoel';

  @override
  String get tourHomeGoalsWaterDesc =>
      'Zie hoe dicht je bij je dagelijkse waterdoel bent.';

  @override
  String get tourHomeReminderTitle => 'Je volgende herinnering';

  @override
  String get tourHomeReminderDesc =>
      'Zie wanneer je volgende herinnering komt en pas hem hier aan.';

  @override
  String get tourHomeChallengesTitle => 'Je uitdagingen';

  @override
  String get tourHomeChallengesDesc =>
      'Rond actieve uitdagingen af om extra XP te verdienen.';

  @override
  String get tourHomeGrowthTitle => 'Je groeistatus';

  @override
  String get tourHomeGrowthDesc =>
      'Zie het verschil tussen je totale en laatste meting, en hoeveel metingen je hebt gelogd.';

  @override
  String get tourHomeExploreTitle => 'Ontdekken';

  @override
  String get tourHomeExploreDesc =>
      'Voedingsgidsen, groeirecepten en meer wachten hier op je.';

  @override
  String get tourPlanProgramHeaderTitle => 'Je 70-dagenprogramma';

  @override
  String get tourPlanProgramHeaderDesc =>
      'Zie in deze ring je totale voortgang, je huidige niveau en dag.';

  @override
  String get tourPlanProgramLevelsTitle => 'Niveaus';

  @override
  String get tourPlanProgramLevelsDesc =>
      'Zie op welk van de 10 niveaus je zit en welke nog vergrendeld zijn.';

  @override
  String get tourPlanNutritionHeaderTitle => 'Je voedingsvoortgang';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'Volg hoeveel van je dagelijkse voedingsroutines je hebt afgerond.';

  @override
  String get tourPlanNutritionFirstTitle => 'Voedingsroutines';

  @override
  String get tourPlanNutritionFirstDesc =>
      'Vink de voedingsgewoontes af die je groei ondersteunen.';

  @override
  String get tourProgressChartTitle => 'Groeicurve';

  @override
  String get tourProgressChartDesc =>
      'Zie je eerdere metingen in een grafiek en begrijp waar je naartoe gaat.';

  @override
  String get tourProgressReportTitle => 'Weekrapport';

  @override
  String get tourProgressReportDesc =>
      'Bekijk het rapport dat je voortgang van de week samenvat.';

  @override
  String get tourProgressHistoryTitle => 'Je meetgeschiedenis';

  @override
  String get tourProgressHistoryDesc =>
      'Zie elke lengtemeting die je hebt gelogd op een tijdlijn.';

  @override
  String get tourAnalysisRadarTitle => 'Je balansgrafiek';

  @override
  String get tourAnalysisRadarDesc =>
      'Zie de balans tussen je genetica, groeisnelheid, voeding, slaap en discipline in een radargrafiek, en ontdek je zwakste schakel.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'Je dagelijkse behoefte';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'Zie je dagelijkse behoefte aan eiwit, calorieën, slaap en water, afgestemd op je lengte en gewicht.';

  @override
  String get journeyDataDoneTitle => 'Eerste stap gezet';

  @override
  String get journeyDataDoneSubtitle =>
      'We hebben je gegevens en je potentieel. Nu volgt de rondleiding door de app.';

  @override
  String get journeyContinue => 'Doorgaan';

  @override
  String get journeyEnterApp => 'Naar de app';

  @override
  String get journeyProgressLabel => 'Aan de slag';

  @override
  String get journeyTourDoneTitle => 'Welkom bij BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'Je hebt alle drie de stappen afgerond. Nu ben jij aan de beurt: begin je traject met je eerste routine.';

  @override
  String get journeyViewPlansButton => 'Bekijk je plannen om te beginnen';

  @override
  String get paywallRestoreLabel => 'Aankopen herstellen';

  @override
  String get paywallYearly => 'Jaarlijks';

  @override
  String get paywallBestValue => 'Beste deal';

  @override
  String paywallSavePercent(String percent) {
    return 'BESPAAR $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/week';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/maand';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/jaar';
  }

  @override
  String get paywallMonthly => 'Maandelijks';

  @override
  String get paywallWeekly => 'Wekelijks';

  @override
  String get paywallFreeTrial => '3 dagen gratis';

  @override
  String get paywallLoadError =>
      'Kan aankoopopties niet laden, probeer het opnieuw';

  @override
  String get paywallCtaAlt => 'Doorgaan';

  @override
  String get paywallTrialDisclaimer =>
      '3 dagen gratis · daarna automatisch verlengd · altijd opzegbaar';

  @override
  String get paywallYearlyDisclaimer =>
      'Wordt jaarlijks verlengd · altijd opzegbaar';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '$days dagen gratis, daarna $price/week · altijd opzegbaar';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '$days dagen gratis, daarna $price/maand · altijd opzegbaar';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '$days dagen gratis, daarna $price/jaar · altijd opzegbaar';
  }

  @override
  String get paywallRenewsWeekly =>
      'Wordt wekelijks verlengd · altijd opzegbaar';

  @override
  String get paywallRenewsMonthly =>
      'Wordt maandelijks verlengd · altijd opzegbaar';

  @override
  String get resultCardTitle => 'Je voorspelde lengte als volwassene';

  @override
  String resultRange(String min, String max) {
    return 'Waarschijnlijk tussen $min en $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'Langer dan $percent% van je leeftijdsgenoten';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'Geschatte groei nog te gaan: $amount';
  }

  @override
  String get resultFootnote =>
      'Schatting op basis van de lengte van je ouders en gegevens uit groeicurves. Geen medisch advies.';

  @override
  String get postureCheckTitle => 'Snelle houdingscheck';

  @override
  String get postureCheckIntro =>
      'Sta met je hielen, heupen en schouderbladen tegen een muur en beantwoord drie vragen. Je score komt uit je antwoorden; de foto wordt bewaard voor een voor-en-navergelijking.';

  @override
  String get postureQHead =>
      'Raakt je achterhoofd de muur zonder dat je je kin optilt?';

  @override
  String get postureQHeadA1 => 'Ja, makkelijk';

  @override
  String get postureQHeadA2 => 'Alleen als ik hem terugduw';

  @override
  String get postureQHeadA3 => 'Nee, er zit ruimte tussen';

  @override
  String get postureQShoulders =>
      'Waar staan je schouders op je foto van opzij ten opzichte van je oren?';

  @override
  String get postureQShouldersA1 => 'In lijn met mijn oren';

  @override
  String get postureQShouldersA2 => 'Iets ervoor';

  @override
  String get postureQShouldersA3 => 'Duidelijk naar voren gebogen';

  @override
  String get postureQLowerBack =>
      'Schuif een hand achter je onderrug. Hoeveel ruimte is er?';

  @override
  String get postureQLowerBackA1 => 'Een platte hand past er net';

  @override
  String get postureQLowerBackA2 => 'Helemaal geen ruimte';

  @override
  String get postureQLowerBackA3 => 'Er past een vuist';

  @override
  String get postureCheckSave => 'Bekijk mijn score';

  @override
  String get postureCheckNote => 'Een zelfcheck, geen medisch onderzoek.';

  @override
  String get paywallTester => 'Tester';

  @override
  String get introTag1 => 'VOORSPELLING';

  @override
  String get introTag2 => 'GROEI';

  @override
  String get introTag3 => 'BIJHOUDEN';

  @override
  String get introTag4 => 'GAMIFICATION';

  @override
  String get introTag5 => 'COMMUNITY';

  @override
  String get introTitle1 => 'Ontdek je\nlengtepotentieel';

  @override
  String get introSubtitle1 =>
      'Laat ons je volledige potentieel berekenen\nop basis van genetica, leeftijd en leefstijl.';

  @override
  String get introTitle2 => 'Elke dag\neen stapje langer';

  @override
  String get introSubtitle2 =>
      'Haal meer uit je potentieel met persoonlijke\ntrainings- en voedingsplannen.';

  @override
  String get introTitle3 => 'Volg elke\ncentimeter';

  @override
  String get introSubtitle3 =>
      'Zie hoe je echte voortgang\nzich ontwikkelt met maandelijkse metingen.';

  @override
  String get introTitle4 => 'Stijg in level,\nverdien beloningen';

  @override
  String get introSubtitle4 =>
      'Rond programma\'s van 70 dagen af,\nverdien XP en ontgrendel nieuwe levels.';

  @override
  String get introTitle5 => 'Duizenden zijn\nal langer geworden';

  @override
  String get introSubtitle5 =>
      'Sluit je aan bij de community van gebruikers\ndie hun doel hebben bereikt.';

  @override
  String get criticalWindow => 'CRUCIALE PERIODE';

  @override
  String get heightPotentialFading => 'De feiten over je';

  @override
  String get fadingAway => 'lengtepotentieel..';

  @override
  String get painHookDesc =>
      'Zonder de juiste gewoontes gaan er elke dag centimeters voorgoed verloren. Maar dit kun je nog omkeren.';

  @override
  String get painGeneticTitle => 'Genetica is niet alles';

  @override
  String get painGeneticDesc =>
      'Genetica bepaalt 60%, maar wat jij doet bepaalt de andere 40%. BeTaller is er precies voor die 40%.';

  @override
  String get painGeneticTag => 'Analyse';

  @override
  String get painSleepTitle => 'Optimaliseer je slaaproutine';

  @override
  String get painSleepDesc =>
      'Elke nacht goed slapen kan de aanmaak van groeihormoon met 70% verhogen. BeTaller automatiseert het bijhouden van je slaap, jij hoeft alleen te slapen.';

  @override
  String get painSleepTag => 'Bijhouden';

  @override
  String get painPostureTitle => 'Win nu centimeters met je houding';

  @override
  String get painPostureDesc =>
      'Een goede houding kan je direct 1,5-3 cm opleveren. De dagelijkse houdingsroutine van BeTaller zorgt daar binnen een paar weken voor.';

  @override
  String get painPostureTag => 'Houding';

  @override
  String get painExerciseTitle => 'Je eigen trainingsplan staat klaar';

  @override
  String get painExerciseDesc =>
      'Ochtendstretches, hangen, rugroutines: BeTaller heeft ze voor je klaargezet en ingepland. Maar 8-12 minuten per dag.';

  @override
  String get painExerciseTag => 'Routines';

  @override
  String get painNutritionTitle =>
      'Je voeding heeft direct invloed op je groei';

  @override
  String get painNutritionDesc =>
      'Eiwit, calcium, vitamine D: BeTaller herinnert je er elke dag aan welke voedingsstoffen je nodig hebt en wanneer.';

  @override
  String get painNutritionTag => 'Voeding';

  @override
  String get painTrackingTitle => 'Zie je groei met eigen ogen';

  @override
  String get painTrackingDesc =>
      'Maandelijkse metingen, voortgangsfoto\'s, groeigrafiek: zie elke centimeter die je erbij krijgt.';

  @override
  String get painTrackingTag => 'Voortgang';

  @override
  String get selectYourGender => 'Kies je geslacht';

  @override
  String get onboardingPredictSubtitle =>
      'Hiermee voorspellen we je lengtepotentieel en maken we je persoonlijke plan.';

  @override
  String get other => 'Anders';

  @override
  String get whenWereYouBorn => 'Wanneer ben je geboren?';

  @override
  String get heightAndWeight => 'Lengte en gewicht';

  @override
  String get parentsHeight => 'Lengte ouders';

  @override
  String get weeklyWorkout => 'Training per week';

  @override
  String get workoutsPerWeek => 'Trainingen per week';

  @override
  String get whatsYourEthnicity => 'Wat is je afkomst?';

  @override
  String get whiteCaucasian => 'Wit / Europees';

  @override
  String get blackAfricanAmerican => 'Zwart / Afrikaans';

  @override
  String get hispanicLatino => 'Hispanic / Latino';

  @override
  String get asian => 'Aziatisch';

  @override
  String get middleEasternIndigenous => 'Midden-Oosters / inheems';

  @override
  String get dontWantToAnswer => 'Zeg ik liever niet';

  @override
  String get footSizeLabel => 'Schoenmaat';

  @override
  String get selectYourSize => 'Kies je maat';

  @override
  String get whatsYourDreamHeight => 'Wat is je droomlengte?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Op basis van je gegevens berekenen we hoe groot de kans is dat je deze lengte haalt.';

  @override
  String get dreamHeightLabel => 'Droomlengte';

  @override
  String get sleepQuestion => 'Hoeveel uur slaap\nje per nacht?';

  @override
  String get thousandsSucceeded => 'Duizenden\ngingen je voor';

  @override
  String get youCanToo => 'Jij kunt het ook';

  @override
  String get yearsOld => 'jaar oud';

  @override
  String get verifiedLabel => 'Geverifieerd';

  @override
  String get scientificData => 'WETENSCHAPPELIJKE DATA';

  @override
  String get longTermResults =>
      'BeTaller zorgt voor\nresultaten op lange termijn';

  @override
  String get longTermResultsSubtitle =>
      'Veel mensen halen hun maximale lengte niet door slechte gewoontes.';

  @override
  String get yourFinalHeight => 'Je eindlengte';

  @override
  String get badHabitsLegend => 'Slechte gewoontes';

  @override
  String get optimizedLegend => 'Geoptimaliseerd';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'Lengte is te beïnvloeden\nmet gewoontes';

  @override
  String get chartFact2Pct => '9-10 u';

  @override
  String get chartFact2Desc => 'Ideale slaap stimuleert\ngroeihormoon';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Te winnen met\neen betere houding';

  @override
  String get didYouKnow => 'Wist je dat?';

  @override
  String get didYouKnowFact1 =>
      'Dagelijkse gewoontes bepalen 30% van je lengte';

  @override
  String get didYouKnowFact2 =>
      'Druk op je wervelkolom kost je 1,5-3 cm lengte';

  @override
  String get didYouKnowFact3 => 'Slaaptekort verlaagt HGH met 70%';

  @override
  String get transformJourneyBegins => 'Je transformatie\nbegint nu';

  @override
  String get transformJourneySubtitle =>
      'Een compleet programma dat je gezonde groei\nstap voor stap ondersteunt.';

  @override
  String get week1Label => '1W';

  @override
  String get week1Title => 'Week 1';

  @override
  String get week1Desc =>
      'Je wervelkolom komt beter in lijn, je houding verbetert';

  @override
  String get month1Label => '1M';

  @override
  String get month1Title => 'Maand 1';

  @override
  String get month1Desc => 'Eerste zichtbare centimeters, je slaapt beter';

  @override
  String get month3Label => '3M';

  @override
  String get month3Title => 'Maand 3';

  @override
  String get month3Desc => 'Gemiddeld +1,5–2,5 cm, spieropbouw';

  @override
  String get month6Label => '6M';

  @override
  String get month6Title => 'Maand 6';

  @override
  String get month6Desc =>
      'Bereik je maximale potentieel, leef met je nieuwe lengte';

  @override
  String get reachYourGoal => 'Bereik je doel';

  @override
  String get journeyBullet1 => 'Ontgrendel je maximale potentieel';

  @override
  String get journeyBullet2 => 'Begin te leven met je nieuwe lengte';

  @override
  String get journeyBullet3 => 'Schrijf je eigen succesverhaal';

  @override
  String get unlockButton => 'Alles ontgrendelen';

  @override
  String get dreamHeightOdds => 'Kans op je\ndroomlengte';

  @override
  String get growthCompleteLabel => 'Groei\nvoltooid';

  @override
  String get tallerThanPct => 'Langer dan 76,7% van je leeftijdsgenoten';

  @override
  String get levelNovice => 'Nieuwkomer';

  @override
  String get levelBuilder => 'Bouwer';

  @override
  String get levelGrinder => 'Doorzetter';

  @override
  String get levelWarrior => 'Strijder';

  @override
  String get levelGodTier => 'Godniveau';

  @override
  String get levelDesc0 => 'Leg je fundament';

  @override
  String get levelDesc1 => 'Versnel je groei';

  @override
  String get levelDesc2 => 'Train intensiever';

  @override
  String get levelDesc3 => 'Verleg je grenzen';

  @override
  String get levelDesc4 => 'Zonder pijn geen winst';

  @override
  String get levelDesc5 => 'Kampioensmentaliteit';

  @override
  String get levelDesc6 => 'Eliteprestatie';

  @override
  String get levelDesc7 => 'Beheers je lichaam';

  @override
  String get levelDesc8 => 'Legendarische discipline';

  @override
  String get levelDesc9 => 'Maximaal potentieel';

  @override
  String levelLabel(int level) {
    return 'LEVEL $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Nog $days dagen',
      one: 'Nog $days dag',
    );
    return '$_temp0 in je programma';
  }

  @override
  String get tapLabel => 'TIK';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100 g';
  }

  @override
  String get dayShort => 'Dag';

  @override
  String get legendShort => 'Klein';

  @override
  String get legendBelowAvg => 'Onder gem.';

  @override
  String get legendAverage => 'Gemiddeld';

  @override
  String get legendTall => 'Lang';

  @override
  String get legendVeryTall => 'Heel lang';

  @override
  String get pctBottom5 => 'Onderste 5%';

  @override
  String get pctBottom25 => 'Onderste 25%';

  @override
  String get pctMedian => 'Mediaan';

  @override
  String get pctTop25 => 'Top 25%';

  @override
  String get pctTop5 => 'Top 5%';

  @override
  String get fallingBehind => 'Je loopt achter';

  @override
  String readTimeMinutes(int minutes) {
    return '$minutes min lezen';
  }

  @override
  String get inThisArticle => 'In dit artikel';

  @override
  String get nextArticle => 'Volgend artikel';

  @override
  String get purchaseUnavailable =>
      'De aankoop kon niet worden afgerond. Probeer het opnieuw.';

  @override
  String get viewPlan => 'Abonnement';

  @override
  String get viewPlanSubtitle => 'Bekijk de details van je abonnement';

  @override
  String predictionConfidenceHint(String percent) {
    return 'Met lengtemetingen stijgt de voorspelling naar $percent%';
  }

  @override
  String get paywallSlideHomeTitle => 'Je dag op één scherm';

  @override
  String get paywallSlideHomeCaption =>
      'Routines, water, slaap: drie ringen om te sluiten.';

  @override
  String get paywallSlideProgressTitle => 'Zie elke centimeter';

  @override
  String get paywallSlideProgressCaption =>
      'Elke meting staat meteen op de curve.';

  @override
  String get paywallSlideAnalysisTitle => 'Vijf waarden, één vorm';

  @override
  String get paywallSlideAnalysisCaption =>
      'De radar toont je zwakste schakel.';

  @override
  String get paywallSlidePotentialTitle => 'Ken je potentieel';

  @override
  String get paywallSlidePotentialCaption =>
      'Zie waar je staat tussen je leeftijdsgenoten.';

  @override
  String get paywallSlideDisciplineTitle => 'Houd je reeks vast';

  @override
  String get paywallSlideDisciplineCaption => 'Elke dag tilt je level omhoog.';

  @override
  String get paywallSlideRemindersTitle => 'Een seintje op het juiste moment';

  @override
  String get paywallSlideRemindersCaption =>
      'Kies je tijden, de app doet de rest.';

  @override
  String get paywallSlidePostureTitle => 'Verbeter je houding';

  @override
  String get paywallSlidePostureCaption =>
      'Een foto van opzij, een snelle zelfcheck, een duidelijke routine.';

  @override
  String paywallTrialHeadline(String days) {
    return '$days DAGEN GRATIS';
  }

  @override
  String paywallTrialThen(String price) {
    return 'Daarna $price · altijd opzegbaar';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / jaar · altijd opzegbaar';
  }

  @override
  String get obBedtimeTitle => 'Hoe laat ga je meestal slapen?';

  @override
  String get obBedtimeSubtitle =>
      'Je slaapherinnering wordt rond dit tijdstip ingesteld.';

  @override
  String get obWorkoutTimeTitle => 'Hoe laat train je?';

  @override
  String get obWorkoutTimeSubtitle =>
      'Zodat je trainingsherinnering precies op tijd komt.';

  @override
  String get obMealsTitle => 'Hoeveel maaltijden per dag?';

  @override
  String get obMealsSubtitle =>
      'Tik op een tijd om hem aan je eigen ritme aan te passen.';

  @override
  String obMealsCount(String count) {
    return '$count maaltijden';
  }

  @override
  String obMealLabel(String n) {
    return 'Maaltijd $n';
  }

  @override
  String get obProteinTitle => 'Hoeveel gram eiwit per dag?';

  @override
  String get obProteinSubtitle =>
      'Een ruwe schatting is genoeg. We bouwen je plan eromheen.';

  @override
  String get obCaloriesTitle => 'Hoeveel calorieën per dag, gemiddeld?';

  @override
  String get obCaloriesSubtitle =>
      'Een schatting is prima; we kunnen hem later samen aanscherpen.';

  @override
  String get obNotSure => 'Weet ik niet';

  @override
  String get silNow => 'NU';

  @override
  String get silPotential => 'POTENTIEEL';

  @override
  String get chartMeasured => 'Je metingen';

  @override
  String chartPotential(String height) {
    return 'Potentieel $height';
  }

  @override
  String chartDream(String height) {
    return 'Je doel $height';
  }

  @override
  String get targetsTitle => 'Vandaag, voor jou';

  @override
  String get targetsSubtitle =>
      'Berekend op basis van je leeftijd, gewicht en training.';

  @override
  String get targetProtein => 'Eiwit';

  @override
  String get targetCalcium => 'Calcium';

  @override
  String get targetVitaminD => 'Vitamine D';

  @override
  String get targetWater => 'Water';

  @override
  String get targetSleep => 'Slaap';

  @override
  String get targetMove => 'Training';

  @override
  String targetPerMeal(String g) {
    return '$g g per maaltijd';
  }

  @override
  String get unitHours => 'u';

  @override
  String get unitMinutes => 'min';

  @override
  String get planStrength => 'Kracht';

  @override
  String get planJump => 'Sprongen en sprints';

  @override
  String get planMobility => 'Stretchen';

  @override
  String get planSport => 'Sport';

  @override
  String get planPosture => 'Houding';

  @override
  String get planRest => 'Rust';

  @override
  String planWeekTitle(int days) {
    return 'Je week: $days trainingsdagen';
  }

  @override
  String get planPreviewTitle => 'Je plan staat klaar';

  @override
  String planPreviewTraining(int days) {
    return '$days trainingsdagen per week, gemaakt voor groei';
  }

  @override
  String planPreviewProtein(int grams) {
    return '$grams g eiwit per dag, verdeeld over je maaltijden';
  }

  @override
  String planPreviewSleep(String hours) {
    return '$hours uur slaap, met een bedtijdherinnering';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'Vandaag: $plan · $minutes min';
  }

  @override
  String get nRestTitle => 'Rustdag vandaag';

  @override
  String get nRestBody =>
      'Tien minuten stretchen is genoeg. Herstel hoort bij het plan.';

  @override
  String nProteinTitle(int grams) {
    return 'Eiwitdoel van vandaag: $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return 'Ongeveer $grams g per maaltijd: eieren, yoghurt, kip, linzen.';
  }

  @override
  String nWaterTitle(String liters) {
    return 'Waterdoel: $liters';
  }

  @override
  String get nWaterBody => 'Eén glas nu houdt je vandaag op schema.';

  @override
  String get nSleepTitle => 'Tijd om tot rust te komen';

  @override
  String nSleepBody(String hours) {
    return 'Je doel is $hours uur. Schermen uit, licht gedimd.';
  }

  @override
  String nMeasureBody(String potential) {
    return 'Je potentieel: $potential. Meet \'s ochtends en zie je grafiek bewegen.';
  }

  @override
  String get nTrialDay1Title => 'Je plan wacht op je';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'Vandaag: $plan, $minutes min. Log je lengte zodat je grafiek begint.';
  }

  @override
  String get nTrialEndTitle => 'Je gratis proefperiode eindigt morgen';

  @override
  String nTrialEndBody(String price) {
    return 'Daarna gaat het verder voor $price. Je plan en voortgang blijven hoe dan ook bewaard.';
  }

  @override
  String get trophyContinue => 'Ga door';

  @override
  String get guideSteps => 'Stap voor stap';

  @override
  String get guideMistakes => 'Veelgemaakte fouten';

  @override
  String get guideTip => 'Tip';

  @override
  String get homeHeroTitle => 'Je lengte en je potentieel';

  @override
  String homeHeroGap(String cm) {
    return 'Nog $cm te gaan';
  }

  @override
  String get anSubtitle =>
      'Je score, wat hem beïnvloedt en waar je naartoe gaat';

  @override
  String get anScoreLabel => 'BeTaller-score';

  @override
  String get anTierStarting => 'Begin';

  @override
  String get anTierBuilding => 'Opbouw';

  @override
  String get anTierRising => 'Stijgend';

  @override
  String get anTierStrong => 'Sterk';

  @override
  String get anTierPeak => 'Top';

  @override
  String anTrendUp(int n) {
    return '+$n t.o.v. vorige week';
  }

  @override
  String anTrendDown(int n) {
    return '-$n t.o.v. vorige week';
  }

  @override
  String get anTrendFlat => 'Gelijk aan vorige week';

  @override
  String get anTrendFirst => 'Je weektrend begint volgende week';

  @override
  String anNextTier(int n, String tier) {
    return 'Nog $n punten tot $tier';
  }

  @override
  String get anTopTier => 'Hoogste niveau. Houd het vast';

  @override
  String anCoverage(int n, int total) {
    return 'Op basis van $n van $total signalen';
  }

  @override
  String get anNoScoreTitle => 'Nog niet genoeg gegevens';

  @override
  String get anNoScoreBody =>
      'Log vandaag je slaap, wat water of één training en je eerste score verschijnt.';

  @override
  String get anFastestWin => 'Snelste winst';

  @override
  String get anBreakdownTitle => 'Waaruit je score bestaat';

  @override
  String get anBreakdownHint =>
      'Elk signaal krijgt een score van 0 tot 100 op basis van je eigen gegevens. Het percentage is hoe zwaar het meetelt.';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => 'Nog geen gegevens';

  @override
  String get anNotCounted => 'Telt niet mee';

  @override
  String get anFTraining => 'Training';

  @override
  String get anFConsistency => 'Consistentie';

  @override
  String get anFSleep => 'Slaap';

  @override
  String get anFHydration => 'Drinken';

  @override
  String get anFNutrition => 'Voeding';

  @override
  String get anFPosture => 'Houding';

  @override
  String get anFMeasuring => 'Meten';

  @override
  String get anFGrowth => 'Groeitempo';

  @override
  String get anFHeadroom => 'Groeiruimte';

  @override
  String anBTraining(int done, int planned) {
    return '$done van $planned geplande trainingsdagen in de afgelopen 7 dagen';
  }

  @override
  String get anBTrainingNone =>
      'Telt de dagen dat je traint ten opzichte van je weekplan.';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak dagen',
      one: '$streak dag',
    );
    return 'Reeks van $_temp0, $active van $days dagen met de helft van je plan gedaan';
  }

  @override
  String get anBConsistencyNone =>
      'Telt je reeks en de dagen waarop je minstens de helft van je plan afrondt.';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days nachten',
      one: '$days nacht',
    );
    return 'Gemiddeld $hours u per nacht, doel $target u, $_temp0 gelogd';
  }

  @override
  String get anBSleepNone => 'Geen slaap gelogd in de afgelopen 7 dagen.';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
      one: '$days dag',
    );
    return 'Gemiddeld $litres per dag, doel $target, $_temp0 gelogd';
  }

  @override
  String get anBHydrationNone => 'Geen water gelogd in de afgelopen 7 dagen.';

  @override
  String anBNutrition(int done, int planned) {
    return '$done van $planned voedingsgewoontes gedaan in de afgelopen 7 dagen';
  }

  @override
  String get anBNutritionNone =>
      'Telt de gewoontes voor eiwit, calcium, zink en vitamine D in je plan.';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
      one: '$days dag',
    );
    return 'Muurcheck $raw/90, $_temp0 geleden';
  }

  @override
  String anBPostureToday(int raw) {
    return 'Muurcheck $raw/90, vandaag';
  }

  @override
  String get anBPostureNone => 'Nog geen houdingscheck gedaan.';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
      one: '$days dag',
    );
    return 'Laatst gemeten: $_temp0 geleden';
  }

  @override
  String get anBMeasuringToday => 'Vandaag gemeten';

  @override
  String get anBMeasuringNone => 'Nog geen meting.';

  @override
  String anBGrowth(String v, String e) {
    return '$v per jaar, normaal op jouw leeftijd $e';
  }

  @override
  String get anBGrowthNone =>
      'Heeft twee metingen nodig met minstens 30 dagen ertussen.';

  @override
  String get anBGrowthAdult =>
      'Groeischijven sluiten meestal rond je 21e, dus groeitempo telt voor jou niet mee.';

  @override
  String anBHeadroom(String cm) {
    return '$cm tussen nu en je potentieel';
  }

  @override
  String get anATraining => 'Start de training van vandaag';

  @override
  String get anAConsistency => 'Rond de helft van je plan af';

  @override
  String get anASleepLog => 'Log je slaap van vannacht';

  @override
  String anASleep(String target) {
    return 'Slaap vannacht $target u';
  }

  @override
  String get anAHydrationLog => 'Log een glas water';

  @override
  String anAHydration(String left) {
    return 'Drink vandaag nog $left';
  }

  @override
  String get anAHydrationDone => 'Doel gehaald vandaag. Morgen weer zo';

  @override
  String get anANutrition => 'Vink je voedingsgewoontes van vandaag af';

  @override
  String get anAPostureFirst => 'Doe een houdingscheck van 1 minuut';

  @override
  String get anAPostureRedo => 'Doe je houdingscheck opnieuw';

  @override
  String get anAPostureKeep => 'Houd je dagelijkse houdingsroutine vol';

  @override
  String get anAMeasure => 'Meet nu je lengte';

  @override
  String get anAMeasureKeep => 'Meet volgende week opnieuw';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
      one: '$days dag',
    );
    return 'Meet opnieuw over $_temp0';
  }

  @override
  String get anAGrowth => 'Meet elke 2 weken om het te volgen';

  @override
  String get anAHeadroom => 'Bekijk je potentieel';

  @override
  String get anPotentialTitle => 'Je potentieel';

  @override
  String get anPotentialLabel => 'Voorspelde lengte als volwassene';

  @override
  String anPotentialToGo(String cm) {
    return 'Nog +$cm';
  }

  @override
  String get anPotentialReached => 'Je hebt je voorspelde lengte bereikt';

  @override
  String get anPotentialNote =>
      'Overal in de app hetzelfde getal. Het kan alleen maar stijgen.';

  @override
  String anDreamLine(String h) {
    return 'Je doel: $h';
  }

  @override
  String get anSourcesTitle => 'Waar de centimeters vandaan komen';

  @override
  String get anSourcesGenes => 'Genen en leeftijd';

  @override
  String get anSourcesHabits => 'Slaap, eten, training';

  @override
  String get anSourcesPosture => 'Houding';

  @override
  String get anPctTitle => 'Lengte voor je leeftijd';

  @override
  String anPctValue(int p) {
    return 'Langer dan $p% van je leeftijdsgenoten';
  }

  @override
  String get anPctBasis =>
      'Groeicurves van de Amerikaanse CDC, zelfde leeftijd en geslacht';

  @override
  String get anPctMore => 'Volledige vergelijking';

  @override
  String get anNeedsBasis =>
      'Berekend op basis van je leeftijd, gewicht en training';

  @override
  String get anCalcium => 'Calcium';

  @override
  String get anVitaminD => 'Vitamine D';

  @override
  String get anMovement => 'Beweging';

  @override
  String get anUnitMin => 'min';

  @override
  String get anUnitHours => 'u';

  @override
  String get anPerDay => 'per dag';

  @override
  String get anPerNight => 'per nacht';

  @override
  String get anUnlockScoreTitle => 'Je volledige BeTaller-score';

  @override
  String get anUnlockScoreBody =>
      'De score, alle negen signalen erachter en wat je nu kunt doen.';

  @override
  String get anUnlockSourcesTitle => 'Zie waar je centimeters vandaan komen';

  @override
  String get anUnlockNeedsTitle =>
      'Je dagelijkse behoefte, voor je uitgerekend';

  @override
  String get anUnlockCta => 'Ontgrendel';

  @override
  String get anFlowResultTitle => 'Opgeslagen in je grafiek';

  @override
  String get anFlowResultBody =>
      'Je eerdere lengtes staan nu op dezelfde curve als je metingen en je potentieel.';

  @override
  String get anFlowOpenAnalysis => 'Open je analyse';

  @override
  String anTopPct(int p) {
    return 'TOP $p%';
  }

  @override
  String get anNeedsTitle => 'Je dagelijkse behoefte';

  @override
  String get pgUnlockPro => 'Ontgrendel met Pro';

  @override
  String get pgPhotosLockedTitle => 'Zie je transformatie';

  @override
  String get pgPhotosLockedBody =>
      'Sla elke twee weken een foto met je lengte op en vergelijk er twee met een schuifregelaar.';

  @override
  String get pgTransformationTitle => 'Je transformatie';

  @override
  String get pgHeightChange => 'lengteverschil';

  @override
  String get pgDaysApart => 'dagen ertussen';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
      one: '$days dag',
    );
    return '$delta tussen deze twee foto\'s, genomen met $_temp0 ertussen.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
      one: '$days dag',
    );
    return 'Zelfde lengte, $_temp0 ertussen. Houding en vorm veranderen eerst, lengte volgt in de loop van maanden.';
  }

  @override
  String get pgModeSlider => 'Schuif';

  @override
  String get pgModeSideBySide => 'Naast elkaar';

  @override
  String get pgDragToReveal => 'Sleep om te vergelijken';

  @override
  String get pgOnePhotoTitle => 'Je voor-foto is opgeslagen';

  @override
  String pgOnePhotoBody(String date) {
    return 'Maak de volgende op $date in dezelfde houding om je eerste vergelijking te zien.';
  }

  @override
  String get pgEmptyTitle => 'Start je transformatie';

  @override
  String get pgEmptyBody =>
      'Elke twee weken een foto, zelfde houding, zelfde plek, met je lengte erbij. Over een paar maanden schuif je tussen dag 1 en vandaag.';

  @override
  String get pgTakeFirstPhoto => 'Maak je eerste foto';

  @override
  String get pgPhotoDueNow => 'Nieuwe foto nodig';

  @override
  String pgNextPhotoOn(String date) {
    return 'Volgende foto $date';
  }

  @override
  String pgDayN(int n) {
    return 'Dag $n';
  }

  @override
  String get pgNewPhoto => 'Nieuwe foto';

  @override
  String get pgGuideTitle => 'Elke keer dezelfde houding';

  @override
  String get pgGuideSubtitle =>
      'Foto\'s zijn alleen goed te vergelijken als ze op dezelfde manier zijn gemaakt.';

  @override
  String get pgGuideGhost =>
      'Je vorige foto staat er vaag achter. Lijn jezelf ermee uit.';

  @override
  String get pgGuideStep1 => 'Sta op 2 m afstand, telefoon op borsthoogte';

  @override
  String get pgGuideStep2 =>
      'Kijk naar de camera, voeten samen, armen ontspannen';

  @override
  String get pgGuideStep3 => 'Zelfde plek, zelfde licht, nauwsluitende kleding';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => 'borsthoogte';

  @override
  String get pgTakePhoto => 'Foto maken';

  @override
  String get pgFromGallery => 'Kies uit galerij';

  @override
  String get pgChoosePhoto => 'Kies een foto';

  @override
  String get pgPostureTitle => 'Houdingscheck';

  @override
  String get pgPostureLockedTitle => 'Vind je zwakke plekken';

  @override
  String get pgPostureLockedBody =>
      'Geef je hoofd, schouders en onderrug een score, krijg voor elk twee oefeningen en zie je score week na week.';

  @override
  String get pgAreaHead => 'Hoofd';

  @override
  String get pgAreaShoulders => 'Schouders';

  @override
  String get pgAreaLowerBack => 'Onderrug';

  @override
  String get pgHeadMeaning0 =>
      'Je hoofd staat recht boven je schouders. Houd dat zo met een korte dagelijkse reset.';

  @override
  String get pgHeadMeaning1 =>
      'Je hoofd zakt naar voren als je ontspant. Heel normaal als je veel op je telefoon zit, en snel te verbeteren.';

  @override
  String get pgHeadMeaning2 =>
      'Je hoofd staat voor je schouders. Pak dit eerst aan: je lijkt er op elke foto kleiner door.';

  @override
  String get pgShouldersMeaning0 =>
      'Schouders in lijn met je oren. Je bovenrug doet zijn werk.';

  @override
  String get pgShouldersMeaning1 =>
      'Schouders iets naar voren. Strakke borstspieren trekken ze naar binnen; door die te openen komen ze terug.';

  @override
  String get pgShouldersMeaning2 =>
      'Ronde schouders. Je bovenrug buigt naar voren, waardoor je minder lang staat.';

  @override
  String get pgLowerBackMeaning0 =>
      'Een neutrale kromming. Je heupen en core houden je wervelkolom waar hij hoort.';

  @override
  String get pgLowerBackMeaning1 =>
      'Een platte onderrug. Rustig strekken en mobiliteitsoefeningen brengen de natuurlijke kromming terug.';

  @override
  String get pgLowerBackMeaning2 =>
      'Een sterke holle rug. Strakke heupbuigers kantelen je bekken naar voren; door ze te rekken en je core te versterken trek je het recht.';

  @override
  String get pgLegacyMeaning =>
      'Opgeslagen met een oudere versie zonder deze vragen. Doe de check opnieuw voor advies over dit gebied.';

  @override
  String get pgHowItWorks => 'Zo werkt de check';

  @override
  String get pgYourPosture => 'Je houding';

  @override
  String pgCheckedOn(String date) {
    return 'Gecheckt op $date';
  }

  @override
  String get pgOutOf100 => 'van 100';

  @override
  String get pgAllAreasGood =>
      'Alle drie de gebieden zien er goed uit. Houd dat zo.';

  @override
  String pgStartWith(String area) {
    return 'Begin hier: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta t.o.v. vorige check';
  }

  @override
  String get pgStatusGood => 'Goed';

  @override
  String get pgStatusFair => 'Kan beter';

  @override
  String get pgStatusFix => 'Eerst aanpakken';

  @override
  String get pgKeepItWith => 'Zo houd je het';

  @override
  String get pgFixItWith => 'Zo los je het op';

  @override
  String get pgRetakeNow => 'Tijd voor je weekcheck';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Volgende check over $n dagen',
      one: 'Volgende check morgen',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'Zelfde muur, zelfde drie vragen. Wekelijkse checks laten zien of de oefeningen werken.';

  @override
  String pgRetakeBodyWait(String date) {
    return 'Doe de oefeningen hierboven tot $date en doe dan de check opnieuw om te zien of ze werken.';
  }

  @override
  String get pgRetakeCheck => 'Check opnieuw doen';

  @override
  String get pgRetakeAnyway => 'Nu opnieuw doen';

  @override
  String get pgHistoryTitle => 'Je scores';

  @override
  String pgSinceFirst(String delta) {
    return '$delta sinds de eerste';
  }

  @override
  String get pgHistoryOne =>
      'Dit is je eerste check. Doe hem over 7 dagen opnieuw en hier begint je trend.';

  @override
  String get pgPostureIntroTitle => 'Hoe recht sta je?';

  @override
  String get pgPostureIntroBody =>
      'Drie vragen tegen een muur, ongeveer een minuut. Je krijgt een score en voor elke zwakke plek twee oefeningen.';

  @override
  String get pgPostureStep1 =>
      'Sta met je hielen, heupen en schouderbladen tegen een muur.';

  @override
  String get pgPostureStep2 =>
      'Maak een foto van opzij, hele lichaam in beeld, zodat je later kunt terugkijken.';

  @override
  String get pgPostureStep3 =>
      'Beantwoord drie vragen eerlijk. Je score komt uit je antwoorden.';

  @override
  String get pgPostureStep4 =>
      'Doe hem eens per week opnieuw, op hetzelfde tijdstip.';

  @override
  String get pgStartCheck => 'Start houdingscheck';

  @override
  String pgWeekRange(String start, String end) {
    return '$start tot $end';
  }

  @override
  String get pgGradeGreat => 'Kampioensweek';

  @override
  String get pgGradeGood => 'Sterke week';

  @override
  String get pgGradeOk => 'Het komt op gang';

  @override
  String get pgGradeStart => 'Een frisse start';

  @override
  String get pgTopWeek => 'Topweek';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta t.o.v. vorige week';
  }

  @override
  String get pgDaysCompleted => 'dagen met het volledige plan';

  @override
  String get pgDayStreak => 'dagen op rij';

  @override
  String pgBestDay(String day) {
    return 'Beste: $day';
  }

  @override
  String get pgNextWeekFocus => 'Focus volgende week';

  @override
  String pgFocusPlan(int n, int done) {
    return 'Rond je hele plan af op $n dagen. Deze week lukte dat op $done.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'Plan $n trainingen in. Deze week deed je er $done.';
  }

  @override
  String get pgFocusMeasure =>
      'Meet je lengte één keer, \'s ochtends, op blote voeten, op dezelfde plek. Zo zie je echte verandering.';

  @override
  String pgFocusKeepDay(String day) {
    return 'Elk doel gehaald. Maak nu ook van $day een volle dag.';
  }

  @override
  String get pgFocusKeep =>
      'Elk doel gehaald en elke dag vol. Zelfde plan, zelfde ritme.';

  @override
  String get pgHeightThisWeek => 'Lengte deze week';

  @override
  String pgHeightNow(String height) {
    return 'Nu $height';
  }

  @override
  String get pgNoMeasurementWeek => 'Deze week nog niet gemeten';

  @override
  String get pgFirstMeasurement => 'Je eerste meting';

  @override
  String pgStartedAt(String height) {
    return 'Start $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'Potentieel $height';
  }

  @override
  String pgToPotential(String cm) {
    return 'Nog $cm tot je voorspelde potentieel.';
  }

  @override
  String get pgPotentialReached =>
      'Je hebt je voorspelde potentieel bereikt. Met houdingswerk kun je nog meer laten zien.';

  @override
  String get pgHabitsToday => 'Vandaag gelogd';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves oefeningen · $minutes min';
  }

  @override
  String plDoneCount(int done, int total) {
    return '$done/$total klaar';
  }

  @override
  String get plStartWorkout => 'Start training';

  @override
  String get plContinueWorkout => 'Ga verder met training';

  @override
  String get plWorkoutDoneToday => 'Training van vandaag klaar';

  @override
  String get plTraining => 'Training';

  @override
  String get plHabits => 'Dagelijkse gewoontes';

  @override
  String get plRestDayNote =>
      'Een rustige dag: een korte yogaflow houdt je soepel voor morgen.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps herh.';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds s';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds s per kant';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g verdeeld over je maaltijden';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters verspreid over de dag';
  }

  @override
  String plHabitSleep(String hours) {
    return '$hours u vannacht';
  }

  @override
  String get plYourRoutines => 'Je routines';

  @override
  String get plNewRoutine => 'Nieuwe routine';

  @override
  String get plCustomEmpty =>
      'Maak je eigen routine en vink hem hier elke dag af.';

  @override
  String plDeleteRoutineQ(String name) {
    return '\"$name\" verwijderen?';
  }

  @override
  String get plHoldToDelete =>
      'Houd een routine ingedrukt om hem te verwijderen.';

  @override
  String plSetOf(int current, int total) {
    return 'Set $current van $total';
  }

  @override
  String get plRest => 'Rust';

  @override
  String get plStartSet => 'Start set';

  @override
  String get plSetDone => 'Set klaar';

  @override
  String get plSkipRest => 'Rust overslaan';

  @override
  String get plNextMove => 'Volgende';

  @override
  String get plSkipMove => 'Overslaan';

  @override
  String plUpNext(String name) {
    return 'Hierna: $name';
  }

  @override
  String get plLastMove => 'Slotoefening';

  @override
  String get plWorkoutComplete => 'Training voltooid';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves oefeningen in ongeveer $minutes min. Elke sessie telt.';
  }

  @override
  String get plEachSide => 'Per kant';

  @override
  String get plMoveDone => 'Oefening klaar';

  @override
  String plRepsBig(int reps) {
    return '$reps herh.';
  }

  @override
  String get plSessionHint =>
      'Ga in je eigen tempo en tik op klaar als je klaar bent.';

  @override
  String plProgramDayOf(int day, int total) {
    return 'Dag $day van $total';
  }

  @override
  String get plTodayStep => 'Stap van vandaag';

  @override
  String get plTickToComplete => 'Vink elke oefening af om de dag af te ronden';

  @override
  String plNextDayTomorrow(int day) {
    return 'Dag $day opent morgen. Rust hoort bij groeien.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
      one: '$days dag',
    );
    return 'Nog $_temp0 tot niveau $level';
  }

  @override
  String get plProgramFinished =>
      'Alle 70 dagen klaar. Je hebt het programma afgerond.';

  @override
  String plDayCompleteToast(int day) {
    return 'Dag $day voltooid';
  }

  @override
  String get plLevelWeek => 'Week van dit niveau';

  @override
  String get plProgressionTitle => 'Zo wordt het zwaarder';

  @override
  String get plNow => 'Nu';

  @override
  String plLevelN(int n) {
    return 'Niv. $n';
  }

  @override
  String get plUnlockProgram => 'Ontgrendel het 70-dagenprogramma';

  @override
  String get plProgramPitch =>
      '10 niveaus, één per week. Elk niveau voegt seconden toe aan je houdoefeningen, herhalingen aan je sprongen en een set als je er klaar voor bent.';

  @override
  String plDayLocked(int day) {
    return 'Rond eerst dag $day af';
  }

  @override
  String plCurrentDay(int day) {
    return 'Dag $day';
  }

  @override
  String get plTodaysTargets => 'Doelen van vandaag';

  @override
  String get plTargetsBasis =>
      'Berekend op basis van je leeftijd, gewicht en training';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals maaltijden x $grams g';
  }

  @override
  String get plZinc => 'Zink';

  @override
  String get plMagnesium => 'Magnesium';

  @override
  String get plEnergy => 'Energie';

  @override
  String get plChecklist => 'Checklist van vandaag';

  @override
  String plCheckProtein(int grams) {
    return 'Eiwit $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'Calcium $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'Vitamine D $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return 'Water $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '$amount uit afgevinkte maaltijden';
  }

  @override
  String get plVitaminDNote =>
      '15 min middagzon op je armen en gezicht, of een supplement waar je arts mee akkoord is';

  @override
  String plWaterLogged(String liters) {
    return 'Tot nu toe $liters gelogd';
  }

  @override
  String get plMealPlan => 'Je maaltijdplan';

  @override
  String get plMealPlanSub =>
      'Echt eten, echte grammen, afgestemd op je doelen';

  @override
  String get plSnack => 'Snack';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein g eiwit · $calcium mg calcium · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return 'doel $grams g';
  }

  @override
  String get plMarkEaten => 'Markeer als gegeten';

  @override
  String get plEaten => 'Gegeten';

  @override
  String get plPlanTotal => 'Dagtotaal';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'Deze maaltijden leveren ongeveer $planKcal van je $kcal kcal. Vul de rest aan met fruit, groente, brood of rijst.';
  }

  @override
  String get plWeeklyMenu => 'Weekmenu';

  @override
  String get plWeeklyMenuSub => 'Elke dag een ander bord, dezelfde doelen';

  @override
  String get plUnlockMenu => 'Ontgrendel het volledige weekmenu';

  @override
  String get plRecipes => 'Recepten';

  @override
  String get plRecipesSub => 'Snelle eiwitrijke gerechten';

  @override
  String get plNutritionGuide => 'Voedingsgids';

  @override
  String get plNutritionGuideSub =>
      'Voedingsstoffen, voedingsmiddelen en supplementen';

  @override
  String plPieces(int n) {
    return '$n st.';
  }

  @override
  String get plFoodOats => 'Havermout';

  @override
  String get plFoodMilk => 'Melk';

  @override
  String get plFoodBanana => 'Banaan';

  @override
  String get plFoodWalnuts => 'Walnoten';

  @override
  String get plFoodGreekYogurt => 'Griekse yoghurt';

  @override
  String get plFoodYogurt => 'Yoghurt';

  @override
  String get plFoodEggs => 'Eieren';

  @override
  String get plFoodBread => 'Volkorenbrood';

  @override
  String get plFoodWhiteCheese => 'Feta';

  @override
  String get plFoodHardCheese => 'Goudse kaas';

  @override
  String get plFoodSalad => 'Tomaat-komkommersalade';

  @override
  String get plFoodOrange => 'Sinaasappel';

  @override
  String get plFoodPeanutButter => 'Pindakaas';

  @override
  String get plFoodSpinach => 'Spinazie';

  @override
  String get plFoodCottageCheese => 'Hüttenkäse';

  @override
  String get plFoodChicken => 'Kipfilet';

  @override
  String get plFoodBulgur => 'Bulgur';

  @override
  String get plFoodAyran => 'Ayran (yoghurtdrank)';

  @override
  String get plFoodTuna => 'Tonijn (blik)';

  @override
  String get plFoodPasta => 'Pasta';

  @override
  String get plFoodBeef => 'Mager rundvlees';

  @override
  String get plFoodRice => 'Rijst';

  @override
  String get plFoodChickpeas => 'Kikkererwten';

  @override
  String get plFoodSalmon => 'Zalm';

  @override
  String get plFoodBroccoli => 'Broccoli';

  @override
  String get plFoodPotato => 'Aardappelen';

  @override
  String get plFoodLentils => 'Linzen';

  @override
  String get plFoodSardines => 'Sardines';

  @override
  String get plFoodAlmonds => 'Amandelen';

  @override
  String get plFoodKefir => 'Kefir';

  @override
  String get plFoodPumpkinSeeds => 'Pompoenpitten';

  @override
  String get wtCoffee => 'Koffie';

  @override
  String get wtTea => 'Thee';

  @override
  String get wtCola => 'Cola';

  @override
  String get wtEnergyDrink => 'Energydrank';

  @override
  String get crCustomBadge => 'Eigen';

  @override
  String get crNameHint => 'bijv. Power-ochtendstretch';

  @override
  String get crDoseHint => 'bijv. 3x10 herh. of 3x30 seconden';

  @override
  String get paywallLifetime => 'Levenslang';

  @override
  String paywallOnce(String price) {
    return '$price eenmalig';
  }

  @override
  String get paywallLifetimeBadge => 'Geen abonnement';

  @override
  String get paywallLifetimeDisclaimer =>
      'Eenmalige betaling · geen abonnement, niets wordt verlengd';

  @override
  String get pwSlidePotentialTitle => 'Zie je potentieel';

  @override
  String get pwSlidePotentialCaption =>
      'Berekend op basis van je leeftijd, je lengte en de lengte van je ouders.';

  @override
  String get pwSlideTodayTitle => 'Een plan voor elke dag';

  @override
  String get pwSlideTodayCaption =>
      'Korte dagelijkse trainingen met video-uitleg.';

  @override
  String get pwSlideProgramTitle => '70 dagen, 10 niveaus';

  @override
  String get pwSlideProgramCaption =>
      'Elke week worden de oefeningen iets zwaarder.';

  @override
  String get pwSlideNutritionTitle => 'Eet voor je groei';

  @override
  String get pwSlideNutritionCaption =>
      'Dagelijkse doelen voor eiwit, calcium en vitamine D, op maat voor jou.';

  @override
  String get pwSlideChartTitle => 'Zie je curve stijgen';

  @override
  String get pwSlideChartCaption =>
      'Elke meting komt op de lijn naar je potentieel.';

  @override
  String get pwSlideScoreTitle => 'Eén score voor je gewoontes';

  @override
  String get pwSlideScoreCaption =>
      'Zie welke gewoonte je eerst moet verbeteren.';

  @override
  String get pwSlidePostureTitle => 'Sta vandaag rechter';

  @override
  String get pwSlidePostureCaption =>
      'Een snelle houdingscheck, en de oefeningen die helpen.';

  @override
  String get pwExample => 'Voorbeeld';

  @override
  String pwYouLine(String now, String potential) {
    return 'Jij: $now → potentieel $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return 'Voorbeeld: $now → potentieel $potential';
  }

  @override
  String get tv3NewEyebrow => 'Wat is er nieuw';

  @override
  String get tv3NewTitle => 'BeTaller heeft een grote update';

  @override
  String get tv3NewDesc =>
      'Nieuw plan, nieuw programma, nieuwe look. Dit is er nieuw.';

  @override
  String get tv3PotentialTitle => 'Dit is je potentieel';

  @override
  String get tv3PotentialDesc =>
      'Je lengte van nu naast waar je kunt komen. Het plan verkleint het verschil.';

  @override
  String get tv3TodayTitle => 'Plan van vandaag';

  @override
  String tv3TodayDesc(String button) {
    return 'Een korte training voor vandaag. Tik op $button en doe mee.';
  }

  @override
  String get tv3ProgramTitle => '70 dagen discipline';

  @override
  String get tv3ProgramDesc =>
      'Elke dag een stap, verdeeld over 10 niveaus. Elke dag bouwt voort op de vorige.';

  @override
  String get tv3NutritionTitle => 'Je dagdoelen';

  @override
  String get tv3NutritionDesc =>
      'Eiwit, calcium, vitamine D en water, berekend voor jouw lichaam.';

  @override
  String get tv3ChartTitle => 'Volg je curve';

  @override
  String get tv3ChartDesc =>
      'Meet elke week of twee weken en zie je lijn stijgen richting je potentieel.';

  @override
  String get tv3ScoreTitle => 'Je BeTaller-score';

  @override
  String get tv3ScoreDesc =>
      'Eén getal voor hoe je ervoor staat. Verbeter eerst je zwakste punt.';

  @override
  String get tv3Next => 'Volgende';

  @override
  String get tv3ShowMe => 'Laat zien';

  @override
  String get tv3Done => 'Aan de slag';

  @override
  String get obWhyTitle => 'Waarom wil je langer zijn?';

  @override
  String get obWhySubtitle =>
      'Kies alles wat past. Je plan begint bij jouw reden.';

  @override
  String get obWhyConfidence => 'Meer zelfvertrouwen';

  @override
  String get obWhyImpression => 'Een sterkere eerste indruk maken';

  @override
  String get obWhySports => 'Beter worden in sport';

  @override
  String get obWhyClothes => 'Kleding past beter';

  @override
  String get obWhyPhotos => 'Beter op foto\'s staan';

  @override
  String get obWhyPotential => 'Gewoon mijn potentieel weten';

  @override
  String get obTriedTitle => 'Heb je andere lengte-apps geprobeerd?';

  @override
  String get obTriedSubtitle =>
      'Er is geen fout antwoord. Zo kunnen we je laten zien wat hier anders is.';

  @override
  String get obTriedStopped => 'Ja, maar ik ben gestopt';

  @override
  String get obTriedStill => 'Ja, ik gebruik er nog een';

  @override
  String get obTriedFirst => 'Nee, dit is mijn eerste';

  @override
  String get obTriedStoppedTitle =>
      'Alleen een getal houdt je niet gemotiveerd';

  @override
  String get obTriedStoppedBody =>
      'De meeste apps geven je een getal. BeTaller maakt er een dagplan van dat je kunt afvinken, met herinneringen op jouw tijden.';

  @override
  String get obTriedStillTitle => 'Houd wat voor jou werkt';

  @override
  String get obTriedStillBody =>
      'BeTaller voegt het dagelijkse deel toe: een plan op basis van je eigen antwoorden dat je stap voor stap kunt afvinken.';

  @override
  String get obTriedFirstTitle => 'Een goed begin';

  @override
  String get obTriedFirstBody =>
      'Je krijgt hier niet alleen een getal. BeTaller maakt van je antwoorden een dagplan dat je kunt afvinken.';

  @override
  String get obTriedCardTitle => 'Wat je elke dag afvinkt';

  @override
  String get obTriedItem1 => 'Een korte training, gekozen voor jouw week';

  @override
  String get obTriedItem2 => 'Je eiwitdoel';

  @override
  String get obTriedItem3 => 'Op tijd het licht uit';

  @override
  String get obBlockTitle => 'Wat zit je in de weg?';

  @override
  String get obBlockSubtitle =>
      'Kies alles wat past. Je plan houdt er rekening mee.';

  @override
  String get obBlockForget => 'Ik vergeet het';

  @override
  String get obBlockTime => 'Te weinig tijd';

  @override
  String get obBlockExercises => 'Ik weet niet welke oefeningen';

  @override
  String get obBlockMotivation => 'Ik verlies mijn motivatie';

  @override
  String get obBlockBedtime => 'Ik ga laat naar bed';

  @override
  String get obBlockMeals => 'Ik sla maaltijden over';

  @override
  String get obFirstTitle => 'Wat doe je als eerste als je langer bent?';

  @override
  String get obFirstSubtitle => 'Stel het je voor. Daar werk je naartoe.';

  @override
  String get obFirstWardrobe => 'Nieuwe kleren kopen';

  @override
  String get obFirstMuscle => 'Spieren opbouwen';

  @override
  String get obFirstPhotos => 'Meer foto\'s posten';

  @override
  String get obFirstTeam => 'Proberen een team te halen';

  @override
  String get obFirstFeelGood => 'Niets bijzonders, gewoon goed voelen';

  @override
  String get obBuiltChip => 'Voor jou gemaakt';

  @override
  String get obBuiltTitle => 'Je plan, rond jou gebouwd';

  @override
  String get obBuiltReason => 'Jouw reden';

  @override
  String get obBuiltGoal => 'Doel';

  @override
  String get obBuiltWhen => 'Als je er bent';

  @override
  String get obBuiltBlockers => 'Wat je tegenhoudt, opgelost';

  @override
  String get obFixForget => 'Herinneringen op de tijden die jij koos';

  @override
  String get obFixTime => 'Korte sessies, meestal rond 15 minuten';

  @override
  String get obFixExercises => 'Oefeningen met video, stap voor stap';

  @override
  String get obFixMotivation => 'Reeksen en levels die je gemotiveerd houden';

  @override
  String get obFixBedtime => 'Een slaapdoel en een bedtijdherinnering';

  @override
  String get obFixMeals => 'Een eiwitdoel en een maaltijdplan';

  @override
  String get obNotifTitle => 'BeTaller herinnert je op het juiste moment';

  @override
  String get obNotifSubtitle =>
      'Ingesteld op de tijden die je hebt opgegeven. Je kunt ze altijd wijzigen.';

  @override
  String get obNotifWorkout => 'Training';

  @override
  String obNotifWorkoutDetail(String time) {
    return '30 min voor je training om $time';
  }

  @override
  String get obNotifMeal => 'Eten en eiwit';

  @override
  String obNotifMealDetail(String time) {
    return 'Bij je maaltijd om $time';
  }

  @override
  String get obNotifWater => 'Water';

  @override
  String get obNotifWaterDetail => 'Een drinkpauze in de middag';

  @override
  String get obNotifSleep => 'Tot rust komen';

  @override
  String obNotifSleepDetail(String time) {
    return 'Een uur voor je bedtijd om $time';
  }

  @override
  String get obNotifAllow => 'Zet herinneringen aan';

  @override
  String get obNotifNotNow => 'Niet nu';

  @override
  String get obNotifNow => 'nu';

  @override
  String get ftOneFree => '1 gratis';

  @override
  String get ftFreeToday => 'Vandaag gratis';

  @override
  String get ftContinuePro => 'Doorgaan met Pro';

  @override
  String get ftNotNow => 'Niet nu';

  @override
  String get ftOutWorkoutTitle => 'Je gratis training is gebruikt';

  @override
  String get ftOutWorkoutBody =>
      'Houd je reeks vast met Pro: elke dag een begeleide training, elke oefening voor je getimed.';

  @override
  String get ftOutDayTitle => 'Je gratis eerste dag zit erop';

  @override
  String get ftOutDayBody =>
      'Je plan, doelen en voortgang blijven hier staan om te lezen. Houd je reeks vast met Pro: vink je plan af en log elke dag water en slaap.';

  @override
  String get ftOutPostureTitle => 'Je gratis houdingscheck is gebruikt';

  @override
  String get ftOutPostureBody =>
      'Je resultaat blijft hier staan. Check elke week opnieuw met Pro en zie je houding verbeteren.';

  @override
  String get ftOutPhotosTitle => 'Je gratis fotovergelijking is gebruikt';

  @override
  String get ftOutPhotosBody =>
      'Dat paar blijft van jou om te bekijken. Voeg meer foto\'s toe en vergelijk er twee met Pro.';

  @override
  String get ftOutReportTitle => 'Je gratis weekrapport is gebruikt';

  @override
  String get ftOutReportBody =>
      'Krijg elke week je volledige terugblik met Pro: elke dag een score, je doelen en één ding om beter te doen.';

  @override
  String get ftOutScoreTitle => 'Je hebt je gratis scoreoverzicht gezien';

  @override
  String get ftOutScoreBody =>
      'Je score blijft op het scherm. Zie elke dag met Pro waaruit hij bestaat en wat je nu kunt doen.';

  @override
  String get ftOutArticleTitle => 'Je hebt je gratis artikel gelezen';

  @override
  String get ftOutArticleBody =>
      'Dat artikel blijft voor je open. Lees de hele bibliotheek met Pro.';

  @override
  String get ftWhyWorkout => 'Begeleide trainingen horen bij Pro';

  @override
  String get ftWhyPlan => 'Je plan afvinken hoort bij Pro';

  @override
  String get ftWhyProgram => 'Het 70-dagenprogramma hoort bij Pro';

  @override
  String get ftWhyWater => 'Elke dag water loggen hoort bij Pro';

  @override
  String get ftWhySleep => 'Elke dag slaap loggen hoort bij Pro';

  @override
  String get ftWhyNutrition => 'Je dagelijkse voedingsplan hoort bij Pro';

  @override
  String get ftWhyPosture => 'Wekelijkse houdingschecks horen bij Pro';

  @override
  String get ftWhyPhotos => 'Fotovergelijkingen horen bij Pro';

  @override
  String get ftWhyReport => 'Je weekrapport hoort bij Pro';

  @override
  String get ftWhyScore => 'Je scoreoverzicht hoort bij Pro';

  @override
  String get ftWhyArticle => 'De volledige bibliotheek hoort bij Pro';

  @override
  String get ftPlanLocked =>
      'Je plan blijft hier staan om te lezen. Afvinken hoort bij Pro.';

  @override
  String get ftNutritionLocked =>
      'Je doelen en maaltijden blijven hier staan om te lezen. Afvinken hoort bij Pro.';

  @override
  String get ftPreviewTag => 'Preview';

  @override
  String get ftPreviewTitle => 'Dat was je preview';

  @override
  String get ftPreviewBody =>
      'De rest van deze training hoort bij Pro. Dit komt er hierna:';

  @override
  String get ftFreeWorkoutUsed =>
      'Dat was je gratis begeleide training. Met Pro krijg je er elke dag een.';

  @override
  String get ftScoreLockedTitle => 'Waaruit je score bestaat';

  @override
  String get ftScoreLockedBody =>
      'Elk onderdeel van je score, waar het op gebaseerd is en het ene ding dat je nu kunt doen.';

  @override
  String get ftReportLockedTitle => 'Je hele week';

  @override
  String get ftReportLockedBody =>
      'Elke dag gescoord tegen je plan, je doelen, je lengte en één focuspunt voor volgende week.';

  @override
  String get ftPhotosLockedTitle => 'Vergelijk deze twee';

  @override
  String get ftPhotosLockedBody =>
      'Je gratis vergelijking is gebruikt. Met Pro schuif je tussen twee willekeurige foto\'s.';

  @override
  String get ftArticleFreeLine =>
      'Je eerste artikel is gratis. Kies het artikel dat je wilt.';

  @override
  String get plFinishWorkout => 'Afronden';

  @override
  String get obTriedMostApps => 'De meeste apps';

  @override
  String get obTriedThatsIt => 'Een getal, en dat is het.';

  @override
  String get obTriedPlanLabel => 'Je dag met BeTaller';

  @override
  String get obTriedProteinSub => 'Verdeeld over je maaltijden';

  @override
  String get obTriedSleepSub => 'Een herinnering voor bedtijd';

  @override
  String get obTriedFeatVideo => 'Oefeningen met video';

  @override
  String get obTriedFeatReminders => 'Herinneringen op jouw tijden';

  @override
  String get obTriedFeatStreaks => 'Reeksen en levels';

  @override
  String get obBedtimeUnknown => 'Weet ik niet, dat wisselt';

  @override
  String obBedtimeUnknownHint(String time) {
    return 'We stellen $time voor, op basis van de slaap die je op jouw leeftijd nodig hebt. Je kunt het altijd wijzigen.';
  }

  @override
  String get obWorkoutTimeUnknown => 'Weet ik niet, ik heb geen vaste tijd';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return 'We gebruiken voorlopig $time. Je kunt het altijd wijzigen.';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return 'Voorstel: bedtijd rond $time. Altijd te wijzigen.';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return 'Voorstel: training rond $time. Altijd te wijzigen.';
  }

  @override
  String get obNotifSubtitleSuggested =>
      'Ingesteld op de tijden die je hebt opgegeven, met een voorstel waar je het niet zeker wist. Je kunt ze altijd wijzigen.';

  @override
  String get plFoodBrownRice => 'Zilvervliesrijst';

  @override
  String get unitHeightTitle => 'Eenheid voor lengte';

  @override
  String get unitWeightTitle => 'Eenheid voor gewicht';

  @override
  String get unitWaterTitle => 'Eenheid voor water';

  @override
  String get unitOptCm => 'Centimeters';

  @override
  String get unitOptFtIn => 'Feet en inches';

  @override
  String get unitOptKg => 'Kilogram';

  @override
  String get unitOptLb => 'Pounds';

  @override
  String get unitOptStLb => 'Stones en pounds';

  @override
  String get unitOptLiters => 'Liters';

  @override
  String get unitOptFlOz => 'Fluid ounces';

  @override
  String achieveGrowthImp(String amount) {
    return '$amount groei';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return 'Leg in totaal $amount groei vast';
  }

  @override
  String get postureBenefitIn =>
      'Hoofd, schouders en onderrug. Rechtop staan laat tot ongeveer 1 inch meer van je echte lengte zien.';

  @override
  String get notifPostureBodyIn =>
      'Rug recht, schouders naar achteren. Goede houding = ongeveer 1 inch verschil!';

  @override
  String get painPostureDescIn =>
      'Een goede houding kan je direct tot ongeveer 1 inch opleveren. De dagelijkse houdingsroutine van BeTaller zorgt daar binnen een paar weken voor.';

  @override
  String get routinePostureDescIn =>
      'Houd je rug recht en je schouders naar achteren. Check elk uur. Goede houding = ongeveer 1 inch verschil.';

  @override
  String get sciPostureCheckIn =>
      'Een goede houding kan je direct ongeveer 1 inch langer laten lijken en voorkomt druk op je wervelkolom';

  @override
  String get routineProteinDescLb =>
      'Eieren, kip, vis, zuivel. Minstens 0,7 g eiwit per lb lichaamsgewicht per dag.';

  @override
  String pwPersonalTitle(String height) {
    return 'Je plan om $height te halen is klaar';
  }

  @override
  String get pwPersonalEstimate =>
      'Geschat potentieel op basis van je antwoorden, geen garantie';

  @override
  String pwPersonalReason(String reason) {
    return 'Jouw reden: $reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return 'Een herinnering om tot rust te komen voor je bedtijd van $time';
  }

  @override
  String get obParentUnknown => 'Weet ik niet';

  @override
  String get obParentUnknownHint =>
      'We gebruiken dan de gemiddelde lengte van volwassenen. Minder precies, en je kunt het altijd in je profiel toevoegen.';

  @override
  String get obEthnicityWhy =>
      'Alleen gebruikt om de lengte te schatten van de ouder die je niet weet.';

  @override
  String get resultNoParentNote =>
      'Geschat zonder de lengte van één ouder, dus minder precies. Voeg die altijd toe in je profiel.';

  @override
  String get resultNoParentsNote =>
      'Geschat zonder de lengte van je ouders, dus minder precies. Voeg die altijd toe in je profiel.';

  @override
  String get resultFootnoteEstimated =>
      'Schatting op basis van groeicurves en gemiddelde lengtes van volwassenen. Geen medisch advies.';
}
