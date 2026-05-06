// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get navHome => 'Startseite';

  @override
  String get navAnalysis => 'Analyse';

  @override
  String get navRoutines => 'Routinen';

  @override
  String get navProgress => 'Fortschritt';

  @override
  String get navProfile => 'Profil';

  @override
  String greeting(String name) {
    return 'Hallo, $name';
  }

  @override
  String get currentHeight => 'Aktuelle Größe';

  @override
  String get target => 'Ziel';

  @override
  String completed(String pct) {
    return '$pct% abgeschlossen';
  }

  @override
  String remaining(String cm) {
    return '+$cm cm übrig';
  }

  @override
  String get updateAnalysis => 'Analyse aktualisieren';

  @override
  String get analysisSubtitle =>
      'Vorhersagen aus vergangenen Größen + Gewohnheiten';

  @override
  String get dailyRoutines => 'Tägliche Routinen';

  @override
  String get allRoutinesDone => 'Alle Routinen abgeschlossen!';

  @override
  String get water => 'Wasser';

  @override
  String get sleep => 'Schlaf';

  @override
  String get growthSummary => 'Wachstumsübersicht';

  @override
  String get total => 'GESAMT';

  @override
  String get last => 'LETZTE';

  @override
  String get measurement => 'MESS.';

  @override
  String get dailyTip => 'Tipp des Tages';

  @override
  String get waterTracking => 'Wasseraufnahme';

  @override
  String waterToday(String amount) {
    return 'Heute: $amount L';
  }

  @override
  String get sleepTracking => 'Schlafaufzeichnung';

  @override
  String sleepTarget(String hours) {
    return 'Ziel: $hours Stunden';
  }

  @override
  String get hours => 'Stunden';

  @override
  String get save => 'Speichern';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get analysis => 'Analyse';

  @override
  String get betallerScore => 'BeTaller-Punktzahl';

  @override
  String get genetic => 'Genetik';

  @override
  String get growth => 'Wachstum';

  @override
  String get nutrition => 'Ernährung';

  @override
  String get sleepLabel => 'Schlaf';

  @override
  String get discipline => 'Disziplin';

  @override
  String get improveScore => 'Punktzahl verbessern';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Ernährung kritisch!';

  @override
  String get nutritionStrengthen => 'Ernährung stärken';

  @override
  String get sleepRecordAdd => 'Schlafaufzeichnung hinzufügen';

  @override
  String get sleepPoor => 'Schlechter Schlafrhythmus';

  @override
  String get sleepImprove => 'Schlaf verbessern';

  @override
  String get startToday => 'Heute starten!';

  @override
  String routinesRemaining(int count) {
    return '$count Routinen übrig';
  }

  @override
  String get keepStreak => 'Serie beibehalten';

  @override
  String get addFirstMeasurement => 'Erste Messung hinzufügen';

  @override
  String get addMeasurement => 'Messung hinzufügen';

  @override
  String waterHalfNotReached(String amount) {
    return 'Du hast heute noch nicht die Hälfte deines Wasserziels erreicht. Trinke noch ${amount}L mehr.';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'Noch ${amount}L bis zum Wasserziel. Fast geschafft!';
  }

  @override
  String bmiLow(String bmi) {
    return 'Dein BMI liegt bei $bmi — etwas niedrig. Erhöhe die Protein- und Kalorienzufuhr.';
  }

  @override
  String bmiHigh(String bmi) {
    return 'Dein BMI liegt bei $bmi — etwas hoch. Achte auf gesunde Ernährung.';
  }

  @override
  String get nutritionDefault =>
      'Erreiche dein Wasserziel und achte auf ausgewogene Ernährung.';

  @override
  String sleepNoRecord(String hours) {
    return 'Heute keine Schlafaufzeichnung. Versuche $hours Stunden zu schlafen und trage es ein.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Du hast heute $current Stunden geschlafen — $missing Stunden zu wenig. Geh früher ins Bett!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Fast geschafft. $hours Stunden erreichen maximiert die Wachstumshormon-Ausschüttung.';
  }

  @override
  String get sleepGood => 'Toller Schlafrhythmus! Weiter so.';

  @override
  String noRoutinesDone(int total) {
    return 'Heute keine Routinen abgeschlossen. Starte mit einer von $total!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '$done/$total Routinen heute erledigt. Noch $left übrig!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Toll gemacht heute! Noch $needed Tage bis zur Serie.';
  }

  @override
  String streakContinue(int days) {
    return '$days Tage Serie! Deine Punktzahl steigt, wenn du weitermachst.';
  }

  @override
  String get noMeasurements =>
      'Noch keine Größenmessungen. Füge deine erste hinzu für genaue Vorhersagen.';

  @override
  String fewMeasurements(int count) {
    return 'Füge noch $count Messungen hinzu, um die Wachstumsgeschwindigkeit zu berechnen.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Du hast $count Messungen. 5 zu erreichen verbessert die Genauigkeit erheblich.';
  }

  @override
  String get keepMeasuring =>
      'Füge weiterhin Messungen hinzu. Jeder neue Datenpunkt verbessert die Vorhersagen.';

  @override
  String get heightPrediction => 'Größenvorhersage';

  @override
  String get predictedHeightAt21 => 'Voraussichtliche Größe mit 21';

  @override
  String get predictionMethod =>
      'Berechnet durch Kombination von genetischen (Eltern), Wachstumsgeschwindigkeit, BMI- und Altersdaten.';

  @override
  String get growthStatus => 'Wachstumsstatus';

  @override
  String get geneticGainLabel => 'Genetischer Gewinn';

  @override
  String get lifestyleLabel => 'Lebensstil';

  @override
  String get geneticCeilingLabel => 'Maximum';

  @override
  String get reachableTargetHeight => 'Deine erreichbare Zielgröße';

  @override
  String get geneticCeilingProgress => 'Fortschritt zur genetischen Obergrenze';

  @override
  String get completionLabel => 'FORTSCHRITT';

  @override
  String get growthVelocity => 'WACHSTUMSGESCHWINDIGKEIT';

  @override
  String get noData => 'KEINE DATEN';

  @override
  String growthRate(String rating) {
    return 'Wachstumsrate: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'Kalorien';

  @override
  String get kcalDay => 'kcal/Tag';

  @override
  String get daily => 'täglich';

  @override
  String get protein => 'Protein';

  @override
  String get minimum => 'Minimum';

  @override
  String get age => 'Alter';

  @override
  String get male => 'Männlich';

  @override
  String get female => 'Weiblich';

  @override
  String get yearlyPrediction => 'JÄHRLICHE VORHERSAGE';

  @override
  String ageYear(int age) {
    return '$age Jahre';
  }

  @override
  String get progressTitle => 'Fortschrittsverfolgung';

  @override
  String get totalGrowth => 'Gesamt';

  @override
  String get lastDiff => 'Letzte Diff.';

  @override
  String get measurementCount => 'Mess.';

  @override
  String get heightChart => 'Größendiagramm';

  @override
  String get chartMinData =>
      'Mindestens 2 Messungen für das Diagramm erforderlich';

  @override
  String get chartInstruction =>
      'Füge Messungen hinzu, um dein Fortschrittsdiagramm zu sehen!';

  @override
  String get addMeasurementButton => 'NEUE MESSUNG HINZUFÜGEN';

  @override
  String get measurementHistory => 'MESSUNGSVERLAUF';

  @override
  String get deleteTitle => 'Messung löschen';

  @override
  String get deleteMessage => 'Möchtest du diese Messung wirklich löschen?';

  @override
  String get dismiss => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get newMeasurement => 'Neue Größenmessung';

  @override
  String get routines => 'Routinen';

  @override
  String streakDays(int days) {
    return '$days Tage';
  }

  @override
  String get progressStatus => 'Fortschrittsstatus';

  @override
  String get completedLabel => 'Abgeschlossen!';

  @override
  String get all => 'Alle';

  @override
  String get exercise => 'Übung';

  @override
  String get posture => 'Haltung';

  @override
  String bestStreak(int days) {
    return 'Beste: $days Tage';
  }

  @override
  String get editProfile => 'Profil bearbeiten';

  @override
  String get editProfileSubtitle => 'Größe, Gewicht und Alter aktualisieren';

  @override
  String get name => 'Name';

  @override
  String birthDate(String date) {
    return 'Geburt: $date';
  }

  @override
  String get heightCm => 'Größe (cm)';

  @override
  String get weightKg => 'Gewicht (kg)';

  @override
  String get fatherHeight => 'Größe des Vaters (cm)';

  @override
  String get motherHeight => 'Größe der Mutter (cm)';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get notificationsOn => 'Erinnerungen aktiv';

  @override
  String get notificationsOff => 'Erinnerungen aus';

  @override
  String get premium => 'Auf Premium upgraden';

  @override
  String get premiumSubtitle => 'Alle Funktionen freischalten';

  @override
  String get rateUs => 'Bewerte uns';

  @override
  String get rateSubtitle => 'Gefällt dir die App? Gib uns 5 Sterne!';

  @override
  String get share => 'App teilen';

  @override
  String get shareSubtitle => 'Erzähle deinen Freunden von BeTaller';

  @override
  String get shareText =>
      'Ich habe mein Wachstumspotenzial mit BeTaller entdeckt! Probiere es auch: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'Feedback geben';

  @override
  String get feedbackSubtitle => 'Kontaktiere uns';

  @override
  String get resetData => 'Alle Daten zurücksetzen';

  @override
  String get resetSubtitle => 'Alle Daten werden gelöscht';

  @override
  String get resetTitle => 'Daten zurücksetzen';

  @override
  String get resetMessage =>
      'Alle Daten werden gelöscht und du kehrst zum Einführungsbildschirm zurück. Dies kann nicht rückgängig gemacht werden!';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get premiumSoon => 'Premium kommt bald!';

  @override
  String get brandingSubtitle => 'Entdecke dein Wachstumspotenzial';

  @override
  String get statistics => 'Statistiken';

  @override
  String get currentStreak => 'Aktuelle Serie';

  @override
  String get bestStreakLabel => 'Beste Serie';

  @override
  String get achievementLabel => 'Erfolg';

  @override
  String get achievements => 'Erfolge';

  @override
  String get earned => 'Verdient!';

  @override
  String get notEarned => 'Noch nicht verdient';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Sprache';

  @override
  String get languageSubtitle => 'App-Sprache ändern';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Entdecke dein Wachstumspotenzial';

  @override
  String get onboardingMeetYou => 'Lass uns dich kennenlernen';

  @override
  String get onboardingInfoNeeded =>
      'Grundlegende Informationen für die Analyse benötigt.';

  @override
  String get gender => 'GESCHLECHT';

  @override
  String get birthDateLabel => 'GEBURTSDATUM';

  @override
  String get bodyMeasurements => 'Körpermaße';

  @override
  String get bodyInfo =>
      'Deine aktuelle Größe und dein Gewicht werden für die Analyse benötigt.';

  @override
  String get geneticData => 'Genetische Daten';

  @override
  String get geneticInfo =>
      'Die Größe der Eltern bestimmt dein genetisches Potenzial.';

  @override
  String get pastHeights => 'Frühere Größen';

  @override
  String get pastHeightsInfo =>
      'Gib Größen ein, an die du dich in verschiedenen Altern erinnerst. Du kannst Felder leer lassen.';

  @override
  String get heightHint => 'Größe eingeben...';

  @override
  String get ageLabel => 'Alter';

  @override
  String get habits => 'Deine Gewohnheiten';

  @override
  String get habitsInfo =>
      'Dein Lebensstil beeinflusst die Vorhersagen direkt.';

  @override
  String get weeklyExercise => 'Wöchentliche Bewegung';

  @override
  String get dailySleep => 'Täglicher Schlaf';

  @override
  String get nutritionQuality => 'ERNÄHRUNGSQUALITÄT';

  @override
  String get nutritionDesc => 'Protein-, Milch-, Gemüse- und Obstaufnahme';

  @override
  String get nutritionBad => 'Schlecht';

  @override
  String get nutritionPoor => 'Mangelhaft';

  @override
  String get nutritionMedium => 'Durchschnittlich';

  @override
  String get nutritionGood => 'Gut';

  @override
  String get nutritionGreat => 'Sehr gut';

  @override
  String get startAnalysis => 'Analyse starten';

  @override
  String get continueBtn => 'Weiter';

  @override
  String get analyzeBtn => 'Analysieren';

  @override
  String get analyzing => 'Wird analysiert';

  @override
  String get analysisComplete => 'Abgeschlossen!';

  @override
  String get yourScore => 'Deine BeTaller-Punktzahl';

  @override
  String get letsStart => 'Los geht\'s';

  @override
  String get splashJourneySubtitle => 'Deine Reise beginnt. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Dein persönlicher Plan ist bereit.\nBereit, dein Wachstumspotenzial zu entdecken?';

  @override
  String get doneBtn => 'Fertig';

  @override
  String get analysisStep1 => 'Genetische Daten werden analysiert...';

  @override
  String get analysisStep2 => 'Wachstumsgeschwindigkeit wird berechnet...';

  @override
  String get analysisStep3 =>
      'Ernährungs- und Schlafdaten werden verarbeitet...';

  @override
  String get analysisStep4 => 'Größenvorhersage wird erstellt...';

  @override
  String get analysisStep5 => 'BeTaller-Punktzahl wird berechnet...';

  @override
  String growthPotential(String cm) {
    return '+$cm cm Wachstumspotenzial';
  }

  @override
  String get heightAt21 => 'mit 21 Jahren';

  @override
  String confidenceLevel(String pct) {
    return '$pct% Konfidenzgrad';
  }

  @override
  String heightRange(String min, String max) {
    return '$min - $max cm Bereich';
  }

  @override
  String get currentLabel => 'AKTUELL';

  @override
  String get predictedLabel => 'VORHERSAGE';

  @override
  String get yearlyPredictions => 'Jährliche Vorhersagen';

  @override
  String get tipMorningMeasure =>
      'Miss deine Größe morgens – der Bandscheibendruck verursacht Größenverlust im Tagesverlauf. Die genaueste Messung ist morgens.';

  @override
  String get tipProteinSpread =>
      'Verteile die Proteinzufuhr über die Mahlzeiten. Iss nicht alles auf einmal, sondern nimm zu jeder Mahlzeit Protein zu dir.';

  @override
  String get tipGrowthHormone =>
      'Das Wachstumshormon erreicht seinen Höhepunkt im Schlaf. Schlafe zwischen 22 und 2 Uhr!';

  @override
  String get tipVitaminD =>
      '15 Minuten tägliche Sonneneinstrahlung steigert die Vitamin-D-Produktion. Vitamin D ist essentiell für die Kalziumaufnahme.';

  @override
  String get tipBarHanging =>
      'Hängen an der Stange dekomprimiert die Wirbelsäule. Versuche täglich 3x30 Sekunden.';

  @override
  String get tipSwimming =>
      'Schwimmen ist der beste Sport für ein Ganzkörpertraining und unterstützt das Größenwachstum.';

  @override
  String get tipStress =>
      'Stress unterdrückt das Wachstumshormon. Reduziere Stress durch Meditation und Yoga.';

  @override
  String get routineMorningStretch => 'Morgendehnung';

  @override
  String get routineMorningStretchDesc =>
      'Mache 10 Minuten Dehnübungen direkt nach dem Aufwachen. Dehne Wirbelsäule und Beinmuskeln.';

  @override
  String get routineBarHanging => 'Stange hängen';

  @override
  String get routineBarHangingDesc =>
      'Häng dich an eine Klimmzugstange, um die Wirbelsäule zu strecken. 3 Sätze x 30 Sekunden.';

  @override
  String get routineCobraStretch => 'Kobra-Dehnung';

  @override
  String get routineCobraStretchDesc =>
      'Leg dich auf den Bauch und hebe den Oberkörper. Dehne die Wirbelsäule. 3 Sätze x 15 Sekunden.';

  @override
  String get routineJumping => 'Sprungübungen';

  @override
  String get routineJumpingDesc =>
      'Seilspringen oder Kniebeugensprünge. Stimuliert die Wachstumsfugen. 3 Sätze x 20 Wiederholungen.';

  @override
  String get routineSwimming => 'Schwimmen oder Basketball';

  @override
  String get routineSwimmingDesc =>
      'Betreibe einen Sport, der das Größenwachstum unterstützt. Mindestens 30 Minuten.';

  @override
  String get routineYoga => 'Abend-Yoga & Dehnung';

  @override
  String get routineYogaDesc =>
      'Yoga- und Dehnroutine vor dem Schlafengehen. Stress abbauen, Muskeln entspannen.';

  @override
  String get routineProtein => 'Proteinzufuhr';

  @override
  String get routineProteinDesc =>
      'Eier, Hähnchen, Fisch, Milchprodukte. Mindestens 1,5g/kg Protein täglich.';

  @override
  String get routineCalcium => 'Kalzium & Vitamin D';

  @override
  String get routineCalciumDesc =>
      'Konsumiere Milch, Käse, Joghurt. 15 Min. Sonnenbaden. Wichtig für die Knochenentwicklung.';

  @override
  String get routineWater => 'Wasserziel';

  @override
  String get routineWaterDesc =>
      'Trinke mindestens 2-3 Liter Wasser täglich. Essentiell für Stoffwechsel und Wachstum.';

  @override
  String get routineAvoidJunk => 'Junk Food vermeiden';

  @override
  String get routineAvoidJunkDesc =>
      'Halte dich fern von Fast Food, zuckerhaltigen Getränken und verarbeiteten Lebensmitteln.';

  @override
  String get routineSleep => 'Qualitätsschlaf (8-10 Std.)';

  @override
  String get routineSleepDesc =>
      'Wachstumshormon wird im Schlaf ausgeschüttet. 22-6 Uhr sind die goldenen Stunden.';

  @override
  String get routineNoScreen => 'Bildschirmpause vor dem Schlafen';

  @override
  String get routineNoScreenDesc =>
      'Lege Handy und Computer 1 Stunde vor dem Schlafengehen weg. Blockiere nicht die Melatoninproduktion.';

  @override
  String get routinePosture => 'Haltungskontrolle';

  @override
  String get routinePostureDesc =>
      'Halte den Rücken gerade, Schultern zurück. Jede Stunde überprüfen. Gute Haltung = 2-3 cm Unterschied.';

  @override
  String get routineWallStand => 'Wandsteh-Übung';

  @override
  String get routineWallStandDesc =>
      'Lehne dich mit dem Rücken an die Wand: Fersen, Hüften, Schultern und Kopf berühren die Wand. 5 Min. halten.';

  @override
  String get routineSprintIntervals => 'Sprint-Intervalltraining';

  @override
  String get routineSprintIntervalsDesc =>
      'Sprint-Intervalltraining löst durch hochintensive Belastungen eine signifikante Wachstumshormon-Ausschüttung aus.';

  @override
  String get routineHiitWorkout => 'HIIT-Training';

  @override
  String get routineHiitWorkoutDesc =>
      'Hochintensives Intervalltraining zur Maximierung der Wachstumshormon-Ausschüttung.';

  @override
  String get routineSquats => 'Kniebeugen';

  @override
  String get routineSquatsDesc =>
      'Kniebeugen mit Körpergewicht stimulieren die Wachstumsfugen in Beinen und Wirbelsäule.';

  @override
  String get routineDeadliftStretch => 'Kreuzheben-Dehnung';

  @override
  String get routineDeadliftStretchDesc =>
      'Kreuzheben-Dehnung für die Dekompression der Wirbelsäule und die Gesundheit der Bandscheiben.';

  @override
  String get routineOverheadPress => 'Überkopfdrücken';

  @override
  String get routineOverheadPressDesc =>
      'Überkopfdrücken dehnt die Wirbelsäule und stärkt die Haltungsmuskeln.';

  @override
  String get routineSkippingRope => 'Seilspringen';

  @override
  String get routineSkippingRopeDesc =>
      'Wiederholtes Springen mit dem Seil stimuliert die Wachstumsfugen in den unteren Extremitäten.';

  @override
  String get routinePilatesCore => 'Pilates Core';

  @override
  String get routinePilatesCoreDesc =>
      'Pilates-Core-Übungen unterstützen die Ausrichtung der Wirbelsäule und die Haltung.';

  @override
  String get routineInversionHang => 'Inversions-Hängen';

  @override
  String get routineInversionHangDesc =>
      'Inversion dekomprimiert die Bandscheiben und kann vorübergehend 1-2 cm hinzufügen.';

  @override
  String get routineZincIntake => 'Zinkreiche Lebensmittel';

  @override
  String get routineZincIntakeDesc =>
      'Konsumiere über den Tag verteilt zinkreiche Lebensmittel für die Wachstumshormon-Produktion.';

  @override
  String get routineVitaminDSunlight => 'Vitamin D & Sonnenlicht';

  @override
  String get routineVitaminDSunlightDesc =>
      'Mindestens 15 Minuten direktes Sonnenlicht für die Vitamin-D-Synthese und das Knochenwachstum.';

  @override
  String get routineArginineFoods => 'Argininreiche Lebensmittel';

  @override
  String get routineArginineFoodsDesc =>
      'Iss argininreiche Lebensmittel, um die Wachstumshormon-Ausschüttung anzuregen.';

  @override
  String get routineSleepEnvironment => 'Schlafumgebung optimieren';

  @override
  String get routineSleepEnvironmentDesc =>
      'Schaffe eine dunkle, kühle Schlafumgebung, um die Melatonin- und Wachstumshormon-Ausschüttung zu maximieren.';

  @override
  String get routinePreSleepRoutine => 'Vor-Schlaf-Routine';

  @override
  String get routinePreSleepRoutineDesc =>
      'Eine konsequente Vor-Schlaf-Routine verbessert die Tiefschlafqualität um 23%.';

  @override
  String get routineNeckStretches => 'Nackendehnungen';

  @override
  String get routineNeckStretchesDesc =>
      'Nackendehnungen lösen Kompression und verbessern die Halswirbelsäulen-Ausrichtung.';

  @override
  String get routineShoulderRolls => 'Schulterrollen & -öffnung';

  @override
  String get routineShoulderRollsDesc =>
      'Das Öffnen der Schultern korrigiert die Vorwärtshaltung und kann optisch 1-2 cm ausmachen.';

  @override
  String get achieveFirstDay => 'Erster Schritt';

  @override
  String get achieveFirstDayDesc => 'Schließe deinen ersten Tag ab';

  @override
  String get achieveThreeStreak => '3-Tage-Serie';

  @override
  String get achieveThreeStreakDesc =>
      'Schließe Routinen 3 Tage hintereinander ab';

  @override
  String get achieveWeekStreak => '7-Tage-Serie';

  @override
  String get achieveWeekStreakDesc =>
      'Schließe Routinen 7 Tage hintereinander ab';

  @override
  String get achieveTwoWeekStreak => '14-Tage-Serie';

  @override
  String get achieveTwoWeekStreakDesc => 'Halte 14 Tage am Stück durch';

  @override
  String get achieveMonthStreak => '30-Tage-Serie';

  @override
  String get achieveMonthStreakDesc => 'Schließe 30 Tage am Stück ab';

  @override
  String get achieveTwoMonthStreak => '60-Tage-Serie';

  @override
  String get achieveTwoMonthStreakDesc => 'Schließe 60 Tage am Stück ab';

  @override
  String get achieveHundredStreak => '100-Tage-Serie';

  @override
  String get achieveHundredStreakDesc => 'Schließe 100 Tage am Stück ab';

  @override
  String get achieveFirstMeasure => 'Erste Messung';

  @override
  String get achieveFirstMeasureDesc => 'Zeichne deine erste Größenmessung auf';

  @override
  String get achieveThreeMeasures => 'Tracker';

  @override
  String get achieveThreeMeasuresDesc => 'Zeichne 3 Größenmessungen auf';

  @override
  String get achieveFiveMeasures => 'Regelmäßiges Tracking';

  @override
  String get achieveFiveMeasuresDesc => 'Zeichne 5 Größenmessungen auf';

  @override
  String get achieveTenMeasures => 'Datenjäger';

  @override
  String get achieveTenMeasuresDesc => 'Zeichne 10 Größenmessungen auf';

  @override
  String get achieveFirstCm => 'Erster Zentimeter';

  @override
  String get achieveFirstCmDesc => 'Zeichne 1 cm Gesamtwachstum auf';

  @override
  String get achieveThreeCm => '3 cm Wachstum';

  @override
  String get achieveThreeCmDesc => 'Zeichne 3 cm Gesamtwachstum auf';

  @override
  String get achieveFiveCm => '5 cm Wachstum';

  @override
  String get achieveFiveCmDesc => 'Zeichne 5 cm Gesamtwachstum auf';

  @override
  String get achieveTenCm => '10 cm Wachstum';

  @override
  String get achieveTenCmDesc => 'Zeichne 10 cm Gesamtwachstum auf';

  @override
  String get quote1 => 'Sei jeden Tag besser als gestern.';

  @override
  String get quote2 =>
      'Wachstum geschieht nicht über Nacht, aber jede Nacht bringt dich näher.';

  @override
  String get quote3 => 'Wachstum braucht Geduld, mach weiter!';

  @override
  String get quote4 =>
      'Der Schritt, den du heute machst, baut das Fundament von morgen.';

  @override
  String get quote5 => 'Disziplin beginnt dort, wo Motivation endet.';

  @override
  String get quote6 => 'Dein Körper wird es dir danken, mach weiter!';

  @override
  String get quote7 => 'Du bestimmst die Grenzen deines Potenzials.';

  @override
  String get quote8 => 'Kleine Schritte bewirken große Veränderungen.';

  @override
  String get quote9 => 'Die beste Investition ist in dich selbst.';

  @override
  String get quote10 => 'Du kommst deinem Ziel jeden Tag näher.';

  @override
  String get quote11 => 'Veränderung ist schwer, aber Bedauern ist schwerer.';

  @override
  String get quote12 => 'Dein Körper ist ein Tempel, pflege ihn.';

  @override
  String get quote13 =>
      'Dein Rivale ist dein gestriges Ich. Übertreffe es heute!';

  @override
  String get quote14 => 'BeTaller = Geduld + Disziplin + Glaube';

  @override
  String get quote15 => 'Glaub an dich, der Prozess wird dich formen.';

  @override
  String get quote16 =>
      'Sag nicht heute Ich kann nicht, bereue es nicht morgen.';

  @override
  String get quote17 =>
      'Zeige jeden Tag Fortschritt, selbst wenn es nur 1% ist.';

  @override
  String get quote18 =>
      'Der Spiegel wird deinen Fortschritt zeigen, sei geduldig.';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiUnderweight => 'Untergewicht';

  @override
  String get bmiOverweight => 'Übergewicht';

  @override
  String get bmiObese => 'Adipös';

  @override
  String get velocityExcellent => 'Ausgezeichnet';

  @override
  String get velocityNormal => 'Normal';

  @override
  String get velocitySlow => 'Langsam';

  @override
  String get velocityVeryLow => 'Sehr niedrig';

  @override
  String durationMinutes(String min) {
    return '$min Min.';
  }

  @override
  String get durationAllDay => 'Ganztägig';

  @override
  String get durationNight => 'Nacht';

  @override
  String durationHours(String hours) {
    return '$hours Stunden';
  }

  @override
  String get onboardingStep1 => 'Gib deine persönlichen Daten ein';

  @override
  String get onboardingStep2 => 'Teile deine vergangenen Körpergrößen';

  @override
  String get onboardingStep3 => 'Bewerte deine Gewohnheiten';

  @override
  String get onboardingStep4 => 'Sieh deine Vorhersage und deinen Score';

  @override
  String get hoursShort => 'Std';

  @override
  String get selectLanguage => 'Sprache wählen';

  @override
  String get systemLanguage => 'Systemsprache';

  @override
  String get emailSubject => 'BeTaller Feedback';

  @override
  String get pastHeightsTip =>
      'Du kannst unbekannte Alter leer lassen. 1-2 vergangene Größen einzugeben reicht.';

  @override
  String get obPastHeightsTitle => 'Vergangene Größen';

  @override
  String get obPastHeightsSubPart1 =>
      'Gib vergangene Größen ein, um die Konfidenz deiner Vorhersage auf ';

  @override
  String get obPastHeightsSubPart2 => ' zu erhöhen.';

  @override
  String obHowTallAtAge(String age) {
    return 'Wie groß warst du mit $age Jahren?';
  }

  @override
  String get obSkip => 'Überspringen';

  @override
  String get obNext => 'Weiter';

  @override
  String get currentSuffix => '(aktuell)';

  @override
  String personalizedProtein(String amount) {
    return 'Eier, Hähnchen, Fisch, Milchprodukte. Iss mindestens ${amount}g Protein täglich.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Trink mindestens ${amount}L Wasser täglich. Wichtig für Stoffwechsel und Wachstum.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'Wachstumshormon wird im Schlaf ausgeschüttet. Schlafe mindestens $hours Stunden. 22-06 Uhr sind goldene Stunden.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Milch, Käse, Joghurt konsumieren. 15 Min sonnen. Tägliches Kalorienziel: $calories kcal.';
  }

  @override
  String get scoreS =>
      'Ausgezeichnet! Du erreichst den Gipfel deines Potenzials.';

  @override
  String get scoreA =>
      'Läuft super! Kleine Verbesserungen bringen dich an die Spitze.';

  @override
  String get scoreB =>
      'Auf dem richtigen Weg. Konzentriere dich etwas mehr auf Routinen und Ernährung.';

  @override
  String get scoreC =>
      'Verbesserungspotenzial vorhanden. Regelmäßige Routinen machen den Unterschied.';

  @override
  String get scoreD => 'Hohes Potenzial, aber du musst aktiv werden.';

  @override
  String get scoreF =>
      'Starte jetzt! Ein kleiner Schritt jeden Tag macht einen großen Unterschied.';

  @override
  String get cmPerYear => 'cm/Jahr';

  @override
  String get howToDoIt => 'So geht\'s';

  @override
  String get musclesTargeted => 'Beanspruchte Muskeln & Knochen';

  @override
  String get scientificBasis => 'Wissenschaftliche Grundlage';

  @override
  String setXofY(String current, String total) {
    return 'Satz $current von $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Pause vor Satz $set';
  }

  @override
  String get allSetsComplete => 'Alle Sätze abgeschlossen!';

  @override
  String get setTimer => 'Satz-Timer';

  @override
  String get setTracker => 'Satz-Tracker';

  @override
  String get builtInTimer => 'Integrierter Timer';

  @override
  String get markComplete => 'Als erledigt markieren';

  @override
  String get markIncomplete => 'Als unerledigt markieren';

  @override
  String get done => 'Fertig';

  @override
  String get doneExclamation => 'Fertig!';

  @override
  String get start => 'Start';

  @override
  String get pause => 'Pause';

  @override
  String get resetTimer => 'Zurücksetzen';

  @override
  String get skipRest => 'Pause überspringen';

  @override
  String get restart => 'Neustart';

  @override
  String get perSet => 'pro Satz';

  @override
  String get rest => 'PAUSE';

  @override
  String get reps => 'Wdh.';

  @override
  String get difficultyBeginner => 'Anfänger';

  @override
  String get difficultyIntermediate => 'Mittelstufe';

  @override
  String get difficultyAdvanced => 'Fortgeschritten';

  @override
  String get learnTitle => 'Lernen';

  @override
  String get learnSubtitle => 'Wissenschaftlich fundiertes Wissen für Wachstum';

  @override
  String get categoryAll => 'Alle';

  @override
  String get categoryScience => 'Wissenschaft';

  @override
  String get categoryNutrition => 'Ernährung';

  @override
  String get categoryExercise => 'Übung';

  @override
  String get categorySleep => 'Schlaf';

  @override
  String get categoryMyths => 'Mythen';

  @override
  String get scientificReferences => 'Wissenschaftliche Referenzen';

  @override
  String get relatedRoutines => 'Verwandte Routinen';

  @override
  String get nutritionTitle => 'Ernährung';

  @override
  String get sectionMealPlan => 'Mahlzeitenplan';

  @override
  String get sectionNutrients => 'Nährstoffe';

  @override
  String get sectionFoods => 'Lebensmittel';

  @override
  String todaysPlan(String day) {
    return 'Heutiger Plan — $day';
  }

  @override
  String get breakfast => 'Frühstück';

  @override
  String get lunch => 'Mittagessen';

  @override
  String get dinner => 'Abendessen';

  @override
  String get snacks => 'Snacks';

  @override
  String get searchFoods => 'Lebensmittel suchen...';

  @override
  String nFoods(String count) {
    return '$count Lebensmittel';
  }

  @override
  String dailyLabel(String amount) {
    return 'Täglich: $amount';
  }

  @override
  String get dailyNeedByAge => 'TÄGLICHER BEDARF NACH ALTER';

  @override
  String agePrefix(String range) {
    return 'Alter $range';
  }

  @override
  String get topFoodSources => 'TOP NAHRUNGSQUELLEN';

  @override
  String get categoryDairy => 'Milchprodukte';

  @override
  String get categoryMeatFish => 'Fleisch & Fisch';

  @override
  String get categoryVegetables => 'Gemüse';

  @override
  String get categoryFruits => 'Obst';

  @override
  String get categoryGrains => 'Getreide & Hülsenfrüchte';

  @override
  String get categoryNutsSeeds => 'Nüsse & Samen';

  @override
  String get weeklyReportTitle => 'Wochenbericht';

  @override
  String get overview => 'Überblick';

  @override
  String get routinesLabel => 'Routinen';

  @override
  String get streakLabel => 'Serie';

  @override
  String get heightLabel => 'Größe';

  @override
  String get weightLabel => 'Gewicht';

  @override
  String get dadLabel => 'Vater';

  @override
  String get motherLabel => 'Mutter';

  @override
  String get metricShort => 'Metrisch';

  @override
  String get imperialShort => 'Imperial';

  @override
  String get dailyScores => 'Tägliche Punkte';

  @override
  String get waterToday2 => 'Wasser heute';

  @override
  String get sleepToday => 'Schlaf heute';

  @override
  String get routineCompletion => 'Routinen-Abschluss';

  @override
  String get xpAndLevel => 'XP & Level';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP bis zum nächsten Level';
  }

  @override
  String get activeChallenges => 'Aktive Herausforderungen';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m abgeschlossen';
  }

  @override
  String get shareYourProgress => 'Fortschritt teilen';

  @override
  String get shareComingSoon => 'Teilen-Funktion kommt bald!';

  @override
  String get premiumTest => 'Premium (Test)';

  @override
  String get premiumActive => 'Aktiv';

  @override
  String get premiumFree => 'Kostenlos';

  @override
  String get weeklyReportMenu => 'Wochenbericht';

  @override
  String get weeklyReportMenuSubtitle => 'Deine Fortschrittsübersicht';

  @override
  String get unlockGrowthPotential => 'Entfalte dein volles Wachstumspotenzial';

  @override
  String get featureGrowthAnalysis => 'Wachstumsanalyse & Punktzahl';

  @override
  String get featureHeightPrediction => 'Größenvorhersage & Prognose';

  @override
  String get featureAllRoutines => 'Alle 14 täglichen Routinen';

  @override
  String get featureWaterSleep => 'Wasser- & Schlafaufzeichnung';

  @override
  String get featureProgress => 'Fortschritt & Messungen';

  @override
  String get featureAchievements => 'Erfolge & Serien';

  @override
  String get planMonthly => 'Monatlich';

  @override
  String get planYearly => 'Jährlich';

  @override
  String get bestValue => 'BESTES ANGEBOT';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'LVL $level';
  }

  @override
  String get levelBeginner => 'Anfänger';

  @override
  String get levelStarter => 'Einsteiger';

  @override
  String get levelCommitted => 'Engagiert';

  @override
  String get levelDedicated => 'Hingegeben';

  @override
  String get levelConsistent => 'Beständig';

  @override
  String get levelFocused => 'Fokussiert';

  @override
  String get levelDetermined => 'Entschlossen';

  @override
  String get levelDisciplined => 'Diszipliniert';

  @override
  String get levelStrong => 'Stark';

  @override
  String get levelAdvanced => 'Fortgeschritten';

  @override
  String get levelExpert => 'Experte';

  @override
  String get levelMaster => 'Meister';

  @override
  String get levelElite => 'Elite';

  @override
  String get levelChampion => 'Champion';

  @override
  String get levelLegend => 'Legende';

  @override
  String get levelTitan => 'Titan';

  @override
  String get levelMythic => 'Mythisch';

  @override
  String get levelImmortal => 'Unsterblich';

  @override
  String get levelTranscendent => 'Transzendent';

  @override
  String get levelUltimate => 'Ultimativ';

  @override
  String get challengeCompleteAllRoutines => 'Alle Routinen abschließen';

  @override
  String get challengeCompleteAllRoutinesDesc => 'Beende heute jede Routine';

  @override
  String get challengeHydrationHero => 'Hydrations-Held';

  @override
  String get challengeHydrationHeroDesc => 'Erreiche dein tägliches Wasserziel';

  @override
  String get challengeEarlySleeper => 'Frühschläfer';

  @override
  String get challengeEarlySleeperDesc => '8+ Stunden Schlaf eintragen';

  @override
  String get challengeExerciseTrio => 'Übungs-Trio';

  @override
  String get challengeExerciseTrioDesc => '3 Übungsroutinen abschließen';

  @override
  String get challengeMorningStretch => 'Morgendehnung';

  @override
  String get challengeMorningStretchDesc => 'Vor 9 Uhr morgens dehnen';

  @override
  String get challenge7DayWarrior => '7-Tage-Krieger';

  @override
  String get challenge7DayWarriorDesc =>
      '7 Tage hintereinander alle Routinen abschließen';

  @override
  String get challengeGrowthTracker => 'Wachstums-Tracker';

  @override
  String get challengeGrowthTrackerDesc =>
      'Diese Woche eine Größenmessung eintragen';

  @override
  String get challengeHydrationWeek => 'Hydrations-Woche';

  @override
  String get challengeHydrationWeekDesc =>
      'Diese Woche 5 Tage Wasserziel erreichen';

  @override
  String get challengeFitnessChampion => 'Fitness-Champion';

  @override
  String get challengeFitnessChampionDesc =>
      'Diese Woche 15 Übungsroutinen abschließen';

  @override
  String get challengeSleepMaster => 'Schlafmeister';

  @override
  String get challengeSleepMasterDesc =>
      '5 Tage lang 8+ Stunden Schlaf eintragen';

  @override
  String get performanceDashboard => 'LEISTUNGS-DASHBOARD';

  @override
  String get tierA => 'STUFE A';

  @override
  String get tierB => 'STUFE B';

  @override
  String get tierC => 'STUFE C';

  @override
  String get tierD => 'STUFE D';

  @override
  String get tierE => 'STUFE E';

  @override
  String get maxTierReached => 'MAXIMALE STUFE ERREICHT';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Nächste Stufe: $tier · +$pts Pkt. benötigt';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Routinen verwalten';

  @override
  String get manageRoutinesSubtitle =>
      'Routinen aus deiner täglichen Liste ein- oder ausblenden';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible von $total aktiv';
  }

  @override
  String get showAll => 'Alle anzeigen';

  @override
  String get hideAll => 'Alle ausblenden';

  @override
  String get heightAnalysis => 'Körpergrößen-Analyse';

  @override
  String get heightVsPopulation => 'Deine Position in der Weltbevölkerung';

  @override
  String get globalAveragesTable => 'Globale Durchschnitte nach Alter';

  @override
  String get standingTall => 'Überdurchschnittlich groß';

  @override
  String get standingAboveAverage => 'Über dem Durchschnitt';

  @override
  String get standingBelowAverage => 'Unter dem Durchschnitt';

  @override
  String get standingShort => 'Unter Gleichaltrigen';

  @override
  String get yourHeightStanding => 'DEIN KÖRPERGRÖSSEN-RANG';

  @override
  String get yourHeight => 'Du';

  @override
  String peerAvg(int age) {
    return 'Ø Alter $age';
  }

  @override
  String get aboveAvg => 'Über Ø';

  @override
  String get belowAvg => 'Unter Ø';

  @override
  String get whoDataSource => 'WHO 2007 Globale Referenz';

  @override
  String get percentileShort5 => 'P5';

  @override
  String get percentileShort50 => 'P50';

  @override
  String get percentileShort95 => 'P95';

  @override
  String get youLabel => 'Du';

  @override
  String get avgHeightLabel => 'Ø';

  @override
  String get percentileLabel => 'PCT';

  @override
  String get diffLabel => 'DIFF';

  @override
  String get whoSourceNote =>
      'Datenquelle: WHO 2007 Wachstumsreferenz & NCD-RisC globale Schätzungen. Perzentilen sind globale Durchschnitte und können je nach Land variieren.';

  @override
  String get quickPhotos => 'Fotos';

  @override
  String get quickPosture => 'Haltung';

  @override
  String get quickWellness => 'Wellness';

  @override
  String get quickRecipes => 'Rezepte';

  @override
  String get wellnessTitle => 'Wellness-Tracker';

  @override
  String get wellnessHeader => 'WELLNESS';

  @override
  String get wellnessSubtitle =>
      'Verfolge Faktoren, die dein Wachstum beeinflussen';

  @override
  String get caffeineToday => 'Koffein heute';

  @override
  String get withinLimits => 'Im gesunden Bereich';

  @override
  String get approachingLimit => 'Limit wird erreicht';

  @override
  String get overLimit => 'Über dem Limit — beeinflusst HGH';

  @override
  String get resetToday => 'Heute zurücksetzen';

  @override
  String get stressToday => 'Stress heute';

  @override
  String get stressVeryCalmLabel => 'Sehr ruhig — optimal für Wachstum';

  @override
  String get stressCalmLabel => 'Ruhig';

  @override
  String get stressNeutralLabel => 'Neutral';

  @override
  String get stressStressedLabel => 'Gestresst';

  @override
  String get stressVeryStressedLabel =>
      'Sehr gestresst — Cortisol blockiert HGH';

  @override
  String get stressTapToLog => 'Tippe, um dein Befinden zu erfassen';

  @override
  String get todaysJournal => 'Heutiges Tagebuch';

  @override
  String get journalNoNote => '(keine Notiz)';

  @override
  String get journalEdit => 'Bearbeiten';

  @override
  String get journalHowWasToday => 'Wie war dein Tag?';

  @override
  String get journalSaved => 'Tagebuch gespeichert · +5 XP';

  @override
  String get journalSaveEntry => 'Eintrag speichern';

  @override
  String get weeklyInsight => 'Wöchentliche Erkenntnis';

  @override
  String get weeklyInsightCaffeine => 'KOFFEIN';

  @override
  String get weeklyInsightStress => 'STRESS';

  @override
  String get weeklyInsightMood => 'STIMMUNG';

  @override
  String get wellnessInfoTitle => 'Warum Wellness wichtig ist';

  @override
  String get wellnessInfoBody =>
      'Koffein stört den Tiefschlaf, in dem das meiste Wachstumshormon (HGH) ausgeschüttet wird. Chronischer Stress erhöht Cortisol, das HGH direkt unterdrückt. Tagebuch führen hilft, wachstumsfördernde Gewohnheiten beizubehalten.';

  @override
  String get wellnessInfoGotIt => 'Verstanden';

  @override
  String get insightCaffeineHigh =>
      'Dein Koffeinkonsum ist diese Woche hoch. Versuche, für besseren Schlaf und HGH zu reduzieren.';

  @override
  String get insightStressHigh =>
      'Stress ist diese Woche erhöht. Denke an Atemübungen — Cortisol blockiert Wachstum.';

  @override
  String get insightMoodLow =>
      'Deine Stimmung war in letzter Zeit niedrig. Sonnenlicht, Schlaf und leichte Bewegung helfen.';

  @override
  String get insightGreat =>
      'Tolle Balance diese Woche. Dein Wohlbefinden unterstützt optimales Wachstum.';

  @override
  String get insightDefault =>
      'Dein Wohlbefinden ist auf Kurs. Logge weiter für tiefere Einblicke.';

  @override
  String get insightNeedMoreData => 'Logge noch ein paar Tage für Einblicke.';

  @override
  String get progressPhotosTitle => 'Fortschrittsfotos';

  @override
  String get progressPhotosHeader => 'FORTSCHRITTSFOTOS';

  @override
  String get progressPhotosSubtitle => 'Verfolge deine visuelle Reise';

  @override
  String get addProgressPhoto => 'Foto hinzufügen';

  @override
  String get captureJourney => 'Halte deine visuelle Reise fest';

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get chooseFromLibrary => 'Aus Galerie wählen';

  @override
  String get deletePhotoTitle => 'Foto löschen?';

  @override
  String get deletePhotoBody =>
      'Dieses Foto wird aus deiner Fortschritts-Zeitleiste entfernt.';

  @override
  String get timelineTab => 'Zeitleiste';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Fotos',
      one: 'Foto',
    );
    return '$_temp0';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tage',
      one: 'Tag',
    );
    return '$_temp0';
  }

  @override
  String get cmGained => 'cm gewonnen';

  @override
  String get firstPhotoMessage =>
      'Mache dein erstes Foto, um deinen visuellen Fortschritt zu verfolgen.';

  @override
  String get takeFirstPhoto => 'Erstes Foto aufnehmen';

  @override
  String get beforeAfter => 'VORHER / NACHHER';

  @override
  String get beforeLabel => 'VORHER';

  @override
  String get afterLabel => 'NACHHER';

  @override
  String get yourHeightDialog => 'Deine Größe';

  @override
  String get heightDialogMessage =>
      'Gib deine aktuelle Größe in cm für dieses Foto ein';

  @override
  String get postureAnalysisTitle => 'Haltungsanalyse';

  @override
  String get postureCoachHeader => 'HALTUNGSCOACH';

  @override
  String get postureCoachSubtitle => 'KI-gestützte Haltungsbewertung';

  @override
  String get latestScore => 'LETZTER WERT';

  @override
  String get latestAnalysis => 'LETZTE ANALYSE';

  @override
  String get headPosition => 'Kopfposition';

  @override
  String get progressLabel => 'FORTSCHRITT';

  @override
  String get choosePhotoSource => 'Fotoquelle wählen';

  @override
  String get sideProfileHint => 'Seitenprofil, ganzer Körper im Bild';

  @override
  String get howToTakePhoto => 'WIE MAN DAS FOTO MACHT';

  @override
  String get takePosturePhoto => 'Haltungsfoto aufnehmen';

  @override
  String get postureExcellent => 'Ausgezeichnet';

  @override
  String get postureGood => 'Gut';

  @override
  String get postureNeedsWork => 'Verbesserungsbedarf';

  @override
  String get posturePoor => 'Schlecht';

  @override
  String get recommendedExercises => 'EMPFOHLENE ÜBUNGEN';

  @override
  String get postureWallStand => 'Wandstehen';

  @override
  String get postureWallStandDesc =>
      'Stehe täglich 2 Minuten mit dem Rücken an der Wand.';

  @override
  String get postureChestOpener => 'Brustöffner';

  @override
  String get postureChestOpenerDesc =>
      'Öffnet verspannte Brustmuskeln, die die Schultern nach vorne ziehen.';

  @override
  String get postureChinTucks => 'Kinneinzug';

  @override
  String get postureChinTucksDesc =>
      'Korrigiert die Vorwärtskopfhaltung — 3×10 Wiederholungen.';

  @override
  String get postureDeadbug => 'Deadbug';

  @override
  String get postureDeadbugDesc =>
      'Stärkt die tiefe Rumpfmuskulatur zur Lordose-Kontrolle.';

  @override
  String get recipesTitle => 'Rezepte';

  @override
  String get recipesHeader => 'REZEPTE';

  @override
  String get recipesSubtitle => 'Füttere dein Wachstum';

  @override
  String get recipesCategoryAll => 'Alle';

  @override
  String get recipesCategoryBreakfast => 'Frühstück';

  @override
  String get recipesCategoryLunch => 'Mittagessen';

  @override
  String get recipesCategoryDinner => 'Abendessen';

  @override
  String get recipesCategorySnack => 'Snack';

  @override
  String get recipesGoalAll => 'Alle';

  @override
  String get recipesGoalProtein => 'Viel Protein';

  @override
  String get recipesGoalCalcium => 'Kalzium';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => 'Eisen';

  @override
  String get recipesNoMatch => 'Keine Rezepte für diese Filter gefunden';

  @override
  String get recipesIngredients => 'Zutaten';

  @override
  String get recipesInstructions => 'Zubereitung';

  @override
  String get recipesClose => 'SCHLIEẞEN';

  @override
  String get recipesAboutTitle => 'Über Rezepte';

  @override
  String get recipesAboutBody =>
      'Ausgewählte Rezepte für dein Wachstum. Filtere nach Mahlzeittyp oder Nährstoffziel, um das Passende für deinen Plan zu finden.';

  @override
  String get animHintSpinalDecomp => 'Wirbelsäulendekompression';

  @override
  String get animHintGravityReversal => 'Schwerkraftumkehr';

  @override
  String get animHintImpactBones => 'Stoßbelastung für Knochen';

  @override
  String get animHintHighImpact => 'Hohe Knochenbelastung';

  @override
  String get animHintMetabolicBurst => 'Metabolisches Burst-Training';

  @override
  String get animHintFullBodyStretch => 'Ganzkörper-Aufwachdehnung';

  @override
  String get animHintSpinalExtension => 'Wirbelsäulenstreckung';

  @override
  String get animHintCervicalDecomp => 'Zervikale Dekompression';

  @override
  String get animHintShoulderMobility => 'Schultermobilität';

  @override
  String get animHintFullBodyMotion => 'Ganzkörperbewegung';

  @override
  String get animHintPosteriorChain => 'Rückseitige Kettendehnung';

  @override
  String get animHintMuscleGrowth => 'Muskelwachstums-Treibstoff';

  @override
  String get animHintBoneDensity => 'Knochendichte-Unterstützung';

  @override
  String get animHintSpinalDisc => 'Bandscheibenhydrierung';

  @override
  String get animHintCleanNutrition => 'Saubere Ernährung';

  @override
  String get animHintIgf1 => 'IGF-1-Optimierung';

  @override
  String get animHintHghAmino => 'HGH-Aminovorstufe';

  @override
  String get animHintCalciumAbsorption => 'Kalziumaufnahme';

  @override
  String get animHintSpinalAlignment => 'Wirbelsäulenausrichtung';

  @override
  String get animHintPostureCorrection => 'Haltungskorrektur';

  @override
  String get animHintMindBody => 'Geist-Körper-Gleichgewicht';

  @override
  String get animHintCoreStability => 'Rumpfstabilität';

  @override
  String get animHintLegPower => 'Beinkraft & HGH-Schub';

  @override
  String get animHintVerticalPower => 'Vertikale Kraft';

  @override
  String get animHintHghSurge => 'HGH-Schub-Training';

  @override
  String get animHintPeakHgh => 'Höchstes HGH-Freisetzungsfenster';

  @override
  String get animHintMelatonin => 'Melatonin-Optimierung';

  @override
  String get animHintDeepSleep => 'Tiefschlaf-Setup';

  @override
  String get animHintSleepOpt => 'Schlafoptimierung';

  @override
  String get animHintExercise => 'Übung';

  @override
  String get formMorningStretch =>
      'Start with neck rolls, then move to full body stretches. Hold each stretch for 20-30 seconds without bouncing.';

  @override
  String get formBarHanging =>
      'Grip the bar shoulder-width apart, relax your body completely, let gravity stretch your spine. Avoid swinging.';

  @override
  String get formCobraStretch =>
      'Lie face down, place hands under shoulders, slowly push upper body up while keeping hips on the floor. Look upward.';

  @override
  String get formJumping =>
      'Perform squat jumps or jump rope. Land softly on the balls of your feet. Rest 30 seconds between sets.';

  @override
  String get formSwimmingBasketball =>
      'Choose swimming (freestyle/backstroke) or basketball. Focus on jumping, reaching, and full range of motion.';

  @override
  String get formEveningYoga =>
      'Perform gentle poses: cat-cow, child pose, downward dog, forward fold. Breathe deeply and hold each pose 30-60 seconds.';

  @override
  String get formSprintIntervals =>
      'Warm up for 5 minutes, then sprint at maximum effort for 30 seconds. Walk or jog for 90 seconds to recover. Repeat.';

  @override
  String get formHiitWorkout =>
      'Perform exercises like burpees, mountain climbers, and jump squats at maximum intensity for 45 seconds, rest 15 seconds.';

  @override
  String get formSquats =>
      'Stand with feet shoulder-width apart. Lower your body until thighs are parallel to ground. Keep back straight and knees behind toes.';

  @override
  String get formDeadliftStretch =>
      'Stand with feet hip-width apart, hinge at hips keeping back flat. Reach toward toes, feel the stretch in hamstrings and back.';

  @override
  String get formOverheadPress =>
      'Stand tall, press arms overhead fully extending. Use light weights or bodyweight. Keep core tight and avoid arching back.';

  @override
  String get formSkippingRope =>
      'Jump with both feet, landing softly on the balls of your feet. Keep jumps low and consistent. Rest between sets.';

  @override
  String get formPilatesCore =>
      'Perform plank, dead bug, bird dog, bridge, and leg raises. Focus on controlled movement and breathing.';

  @override
  String get formInversionHang =>
      'Use an inversion table or gravity boots. Start with a slight incline and gradually increase. Keep sessions short.';

  @override
  String get formProtein =>
      'Spread protein intake across 3-4 meals. Include eggs, chicken, fish, dairy, and legumes.';

  @override
  String get formCalciumVitaminD =>
      'Consume 3 servings of dairy daily and get 15 minutes of sunlight for natural Vitamin D synthesis.';

  @override
  String get formWater =>
      'Drink water consistently throughout the day. Carry a water bottle and set hourly reminders.';

  @override
  String get formAvoidJunk =>
      'Replace fast food with whole foods. Swap sugary drinks for water. Read labels and avoid processed ingredients.';

  @override
  String get formZincIntake =>
      'Include red meat, pumpkin seeds, chickpeas, cashews, and oysters in your diet. Aim for 8-11mg daily.';

  @override
  String get formVitaminDSunlight =>
      'Expose arms and face to direct sunlight for 15 minutes, preferably before noon. No sunscreen needed for this duration.';

  @override
  String get formArginineFoods =>
      'Include nuts, seeds, turkey, chicken, soybeans, and dairy in your meals. Best consumed before sleep.';

  @override
  String get formQualitySleep =>
      'Go to bed by 10 PM. Keep the room dark and cool. Avoid caffeine after 2 PM.';

  @override
  String get formNoScreen =>
      'Set an alarm 1 hour before bedtime. Put all screens away. Read a book or do gentle stretching instead.';

  @override
  String get formSleepEnvironment =>
      'Use blackout curtains, keep room at 18-20°C, remove all light sources. Use a comfortable mattress and pillow.';

  @override
  String get formPreSleepRoutine =>
      'Start 30 minutes before bed: dim lights, read a book, do breathing exercises, avoid stimulating activities.';

  @override
  String get formPostureCheck =>
      'Stand tall with shoulders back and down. Engage core slightly. Imagine a string pulling you up from the crown of your head.';

  @override
  String get formWallStand =>
      'Stand with heels, buttocks, shoulder blades, and head touching the wall. Hold for 5 minutes. Breathe normally.';

  @override
  String get formNeckStretches =>
      'Tilt head slowly to each side, forward, and backward. Hold each direction for 30 seconds. Do not force the stretch.';

  @override
  String get formShoulderRolls =>
      'Roll shoulders forward 15 times, then backward 15 times. Follow with chest-opening stretches holding for 20 seconds.';

  @override
  String get sciMorningStretch =>
      'Morning stretching decompresses spinal discs that were rehydrated overnight, maximizing height retention';

  @override
  String get sciBarHanging =>
      'Hanging decompresses vertebral discs by using gravity to stretch the spine, potentially adding temporary height';

  @override
  String get sciCobraStretch =>
      'Cobra stretch extends the spine and opens the chest, counteracting spinal compression from sitting';

  @override
  String get sciJumping =>
      'High-impact jumping stimulates growth plates in the legs and triggers growth hormone release';

  @override
  String get sciSwimmingBasketball =>
      'Swimming and basketball involve full-body stretching, jumping, and reaching that stimulate growth plate activity';

  @override
  String get sciEveningYoga =>
      'Evening yoga reduces cortisol which inhibits growth hormone, and stretches muscles for overnight recovery';

  @override
  String get sciSprintIntervals =>
      'Sprinting triggers significant growth hormone release';

  @override
  String get sciHiitWorkout =>
      'High intensity exercise increases HGH by up to 450%';

  @override
  String get sciSquats => 'Squats stimulate growth plates in legs and spine';

  @override
  String get sciDeadliftStretch =>
      'Spinal decompression promotes vertebral disc health';

  @override
  String get sciOverheadPress =>
      'Overhead pressing stretches the spine and strengthens posture muscles';

  @override
  String get sciSkippingRope =>
      'Repetitive jumping stimulates growth plates in lower extremities';

  @override
  String get sciPilatesCore =>
      'Core strength supports spinal alignment and posture';

  @override
  String get sciInversionHang =>
      'Inversion decompresses spinal discs, can temporarily add 1-2cm';

  @override
  String get sciProtein =>
      'Protein provides amino acids essential for bone and muscle growth, especially during growth spurts';

  @override
  String get sciCalciumVitaminD =>
      'Calcium and Vitamin D are the primary building blocks for bone density and linear bone growth';

  @override
  String get sciWater =>
      'Hydration is essential for nutrient transport to growth plates and joint cartilage health';

  @override
  String get sciAvoidJunk =>
      'Processed foods and sugar cause inflammation and insulin spikes that suppress growth hormone secretion';

  @override
  String get sciZincIntake => 'Zinc is essential for growth hormone production';

  @override
  String get sciVitaminDSunlight =>
      'Vitamin D is crucial for calcium absorption and bone growth';

  @override
  String get sciArginineFoods =>
      'L-Arginine stimulates growth hormone secretion';

  @override
  String get sciQualitySleep =>
      '70-80% of daily growth hormone is released during deep sleep stages, especially between 10 PM and 2 AM';

  @override
  String get sciNoScreen =>
      'Blue light from screens suppresses melatonin production, delaying sleep onset and reducing deep sleep quality';

  @override
  String get sciSleepEnvironment =>
      'Dark, cool environment maximizes melatonin and growth hormone';

  @override
  String get sciPreSleepRoutine =>
      'Consistent pre-sleep routine improves deep sleep quality by 23%';

  @override
  String get sciPostureCheck =>
      'Correct posture alignment can immediately add 2-3 cm to apparent height and prevents spinal compression';

  @override
  String get sciWallStand =>
      'Wall stands train postural muscle memory, helping maintain proper spinal alignment throughout the day';

  @override
  String get sciNeckStretches =>
      'Neck stretches relieve compression and improve cervical alignment';

  @override
  String get sciShoulderRolls =>
      'Opening shoulders corrects forward posture, can add 1-2cm appearance';

  @override
  String get muscleSpine => 'Wirbelsäule';

  @override
  String get muscleLegs => 'Beine';

  @override
  String get muscleBack => 'Rücken';

  @override
  String get muscleShoulders => 'Schultern';

  @override
  String get muscleArms => 'Arme';

  @override
  String get muscleCore => 'Rumpf';

  @override
  String get muscleChest => 'Brust';

  @override
  String get muscleCalves => 'Waden';

  @override
  String get muscleFullBody => 'Ganzkörper';

  @override
  String get muscleHips => 'Hüfte';

  @override
  String get muscleBones => 'Knochen';

  @override
  String get muscleMuscles => 'Muskeln';

  @override
  String get muscleNeck => 'Nacken';

  @override
  String get muscleUpperSpine => 'Obere Wirbelsäule';

  @override
  String get muscleUpperBack => 'Oberer Rücken';

  @override
  String get createRoutine => 'Routine erstellen';

  @override
  String get createRoutineTitle => 'Eigene Routine erstellen';

  @override
  String get createRoutineSubtitle => 'Erstelle deine eigene tägliche Routine';

  @override
  String get routineIcon => 'Symbol';

  @override
  String get routineTitleField => 'Titel';

  @override
  String get routineDescField => 'Beschreibung';

  @override
  String get routineDescHint => 'Kurze Zusammenfassung der Routine';

  @override
  String get routineCategoryField => 'Kategorie';

  @override
  String get routineDifficultyField => 'Schwierigkeit';

  @override
  String get routineDurationField => 'Dauer';

  @override
  String get routineSetsRepsField => 'Sätze x Wiederholungen';

  @override
  String get routineFormField => 'Anleitung';

  @override
  String get routineFormHint => 'Optional — wie die Routine durchgeführt wird';

  @override
  String get diffBeginner => 'Anfänger';

  @override
  String get diffIntermediate => 'Mittelstufe';

  @override
  String get diffAdvanced => 'Fortgeschritten';

  @override
  String get catExercise => 'Übung';

  @override
  String get catNutrition => 'Ernährung';

  @override
  String get catSleep => 'Schlaf';

  @override
  String get catPosture => 'Haltung';

  @override
  String get postureTip1 => 'Stand sideways (side profile) to the camera.';

  @override
  String get postureTip2 => 'Keep ~2 meters distance from the lens.';

  @override
  String get postureTip3 => 'Arms relaxed, look straight ahead.';

  @override
  String get postureTip4 => 'Wear fitted clothes for accurate scoring.';

  @override
  String get postureTip5 => 'Use good lighting and a plain background.';

  @override
  String get kyphosisLabel => 'Kyphosis (upper back)';

  @override
  String get lordosisLabel => 'Lordosis (lower back)';

  @override
  String get analyzingPosture => 'ANALYZING POSTURE';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String version(String ver) {
    return 'Version $ver';
  }

  @override
  String get rateApp => 'Rate BeTaller';

  @override
  String get rateAppSubtitle => 'Your review helps us grow!';

  @override
  String get unitSystem => 'Unit System';

  @override
  String get unitMetric => 'Metric (cm, kg)';

  @override
  String get unitImperial => 'Imperial (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'Health Disclaimer';

  @override
  String get healthDisclaimerBody =>
      'BeTaller provides general wellness and fitness guidance. Results vary based on age, genetics, and individual factors. This app does not provide medical advice. Exercises focus on posture optimization, spinal health, and growth hormone support through natural habits. Consult a healthcare professional before starting any new exercise or nutrition program. Height changes after growth plate closure (typically 18-25) are primarily from posture improvement.';

  @override
  String get sciSourcePrefix => 'Source: ';

  @override
  String get program => 'Programm';

  @override
  String get todaysExercises => 'HEUTIGE ÜBUNGEN';

  @override
  String get dailyNutritionPlan => 'TÄGLICHER ERNÄHRUNGSPLAN';

  @override
  String get testimonial1 =>
      'Ich hatte keine Hoffnung wegen meines Alters, aber mit BeTaller bin ich gewachsen.';

  @override
  String get testimonialDuration1 => '4 Monate';

  @override
  String get testimonial2 =>
      'Alle sagten ich könne nicht mehr wachsen. BeTaller hat alle überrascht.';

  @override
  String get testimonialDuration2 => '3 Monate';

  @override
  String get testimonial3 =>
      'Nach den Routinen bin ich gewachsen und meine Haltung hat sich verbessert.';

  @override
  String get testimonialDuration3 => '6 Monate';

  @override
  String get testimonial4 =>
      'Ich bin noch im Wachstum und BeTallers Effekt ist unglaublich.';

  @override
  String get testimonialDuration4 => '3 Monate';

  @override
  String get testimonial5 =>
      'Ich habe schnell einen echten Unterschied bemerkt. Sehr empfehlenswert.';

  @override
  String get testimonialDuration5 => '4 Monate';

  @override
  String get designedForYou => 'Für dich entwickelt';

  @override
  String get designedForYouDesc =>
      'BeTaller wurde speziell für dich gebaut, um dein genetisches Limit zu erreichen.';

  @override
  String get greetingAllDone => 'Toll gemacht! 🎯';

  @override
  String get greetingAllDoneSub => 'Du hast die heutigen Aufgaben erledigt.';

  @override
  String greetingStreak30(int streak) {
    return '$streak Tage Serie — legendäres Level.';
  }

  @override
  String greetingStreak7(int streak) {
    return '$streak Tage Serie — weiter so.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak Tage hintereinander. Die meisten geben auf. Du nicht.';
  }

  @override
  String get greetingMorning =>
      'Guten Morgen. Ein neuer Tag, eine neue Chance.';

  @override
  String get greetingAfternoon =>
      'Heute ist ein toller Tag, deine Serie zu starten.';

  @override
  String get greetingEvening => 'Aufgaben erledigen, Serie starten.';

  @override
  String get todayCompleted => 'Heute erledigt ✓';

  @override
  String get todayGoals => 'Heutige Ziele';

  @override
  String get challengesLabel => 'Aufgaben';

  @override
  String get dailyChallengesLabel => 'TÄGLICHE AUFGABEN';

  @override
  String get expiresTonight => 'Läuft heute Nacht ab';

  @override
  String get allChallengesCompleted => 'Alle erledigt ✓';

  @override
  String get challengesLoading => 'Neue Aufgaben werden geladen.';

  @override
  String get challengesLoadingTitle => 'Tägliche Aufgaben';

  @override
  String get behindPace => 'Du bist im Rückstand';

  @override
  String get growthTracking => 'Wachstumsverfolgung';

  @override
  String get growthEmptyFirst => 'Erfasse deine erste Größe.';

  @override
  String get growthEmptySecond => 'Zweite Messung für Diagramm eingeben.';

  @override
  String get growthSectionLabel => 'WACHSTUM';

  @override
  String get generalPerformance => 'GESAMTLEISTUNG';

  @override
  String get exploreLabel => 'ENTDECKEN';

  @override
  String get explorePosture => 'Haltungsanalyse';

  @override
  String get explorePostureSub => 'Haltungsanalyse und Korrekturtipps';

  @override
  String get explorePhotos => 'Fortschrittsfotos';

  @override
  String get explorePhotosSub => 'Verfolge deine Veränderung mit Fotos';

  @override
  String get exploreNutrition => 'Ernährung';

  @override
  String get exploreNutritionSub => 'Protein-, Kalzium- und Vitaminratgeber';

  @override
  String get exploreHealth => 'Gesundheit';

  @override
  String get exploreHealthSub => 'Stress-, Koffein- und Wellness-Tracking';

  @override
  String get exploreRecipes => 'Wachstumsrezepte';

  @override
  String get exploreRecipesSub => 'Rezepte die das Wachstum unterstützen';

  @override
  String get educationLabel => 'BILDUNG';

  @override
  String get educationTitle => 'Wissenschaft des\nGrößenwachstums';

  @override
  String get educationSubtitle => 'Experten-Inhalte, Forschung und Leitfäden';

  @override
  String get aiAnalysisLabel => 'KI-ANALYSE';

  @override
  String get peerCompareLabel => 'MIT GLEICHALTRIGEN VERGLEICHEN';

  @override
  String peerCompareText(int topPct) {
    return 'Du bist in den Top $topPct% deiner Altersgruppe';
  }

  @override
  String get notifWaterTitle => '💧 Vergiss nicht zu trinken!';

  @override
  String get notifWaterBody => 'Tagesziel erreicht? Trink noch ein Glas!';

  @override
  String get notifMorningTitle => '🌅 Guten Morgen! Trainingszeit';

  @override
  String get notifMorningBody =>
      'Morgendehnungen! 10 Minuten für Wirbelsäule und Beine.';

  @override
  String get notifRoutineTitle => '🔥 Routinen abschließen!';

  @override
  String get notifRoutineBody =>
      'Routinen vor Tagesende überprüfen. Serie = Disziplin!';

  @override
  String get notifProteinTitle => '🥚 Proteintag!';

  @override
  String get notifProteinBody =>
      'Stark in die Woche! Protein bei jeder Mahlzeit.';

  @override
  String get notifNewWeekTitle => '✨ Neue Woche, neue Ziele!';

  @override
  String get notifNewWeekBody =>
      'Keine Routinen überspringen. Kleine Schritte, große Wirkung!';

  @override
  String get notifSleepTitle => '😴 Schlafenszeit!';

  @override
  String get notifSleepBody =>
      'Wachstumshormon zwischen 22-2 Uhr am höchsten. Handy weg!';

  @override
  String get notifPostureTitle => '🧍 Haltungskontrolle!';

  @override
  String get notifPostureBody =>
      'Rücken gerade, Schultern zurück. Gute Haltung = 2-3 cm!';

  @override
  String get notifVitaminDTitle => '☀️ Vitamin D!';

  @override
  String get notifVitaminDBody =>
      '15 Minuten Sonne! Vitamin D fördert Kalziumaufnahme.';

  @override
  String get notifMidweekTitle => '✨ Halbzeit!';

  @override
  String get notifMidweekBody =>
      'Mitte der Woche. Wachstum braucht Geduld. Weiter!';

  @override
  String get notifScreenTitle => '📵 Bildschirme aus!';

  @override
  String get notifScreenBody =>
      '1 Stunde vor dem Schlafen keine Bildschirme. Blaues Licht blockiert Melatonin!';

  @override
  String get notifJumpTitle => '🦘 Sprungzeit!';

  @override
  String get notifJumpBody =>
      'Sprungübungen stimulieren Wachstumsfugen. 3 x 20!';

  @override
  String get notifCalciumTitle => '🥛 Kalziumzeit!';

  @override
  String get notifCalciumBody =>
      'Milch oder Joghurt. Kalzium wichtig für Knochen!';

  @override
  String get notifPostureCheckTitle => '🧍 Haltungskontrolle!';

  @override
  String get notifPostureCheckBody =>
      'Hals nicht beim Handyschauen neigen! Gerade sitzen.';

  @override
  String get notifWeekendTitle => '✨ Wochenend-Motivation';

  @override
  String get notifWeekendBody =>
      'Auch am Wochenende Routinen! Disziplin gilt jeden Tag!';

  @override
  String get notifWeeklyProgressTitle => '📊 Wöchentlicher Fortschritt';

  @override
  String get notifWeeklyProgressBody =>
      'Wie war die Woche? Wachstumsdiagramm überprüfen!';

  @override
  String get notifMeasureTitle => '📏 Wöchentliche Messung!';

  @override
  String get notifMeasureBody => 'Miss dich! Morgenmessungen am genauesten.';

  @override
  String get notifEarlySleepTitle => '😴 Früh ins Bett!';

  @override
  String get notifEarlySleepBody =>
      'Morgen Montag! Guter Schlaf. Mindestens 8 Stunden.';

  @override
  String get notifStreak3Title => '🔥 3 Tage Serie!';

  @override
  String get notifStreak3Body => 'Toller Start! 3 Tage. Weiter zu 7!';

  @override
  String get notifStreak7Title => '🏆 1 Woche!';

  @override
  String get notifStreak7Body => 'Unglaublich! 7 Tage in Folge!';

  @override
  String get notifStreak14Title => '⭐ 2 Wochen!';

  @override
  String get notifStreak14Body => '14 Tage Disziplin! Körper verändert sich.';

  @override
  String get notifStreak30Title => '👑 1 Monat!';

  @override
  String get notifStreak30Body => '30 Tage! Du bist Champion!';

  @override
  String get notifStreak60Title => '🌟 60 Tage!';

  @override
  String get notifStreak60Body => '60 Tage! Unglaubliche Leistung.';

  @override
  String get notifStreak100Title => '💎 100 TAGE! LEGENDÄR!';

  @override
  String get notifStreak100Body => '100 Tage! Du bist eine Legende.';

  @override
  String get notifStreakRiskTitle => '⚠️ Serie nicht verlieren!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Deine $streak-Tage-Serie ist in Gefahr!';
  }

  @override
  String get paywallStat1 => 'cm — dein Potenzial ist gesperrt';

  @override
  String get paywallTitle1 => 'Wie viele cm\nkannst du wachsen?';

  @override
  String get paywallBullet1a => 'Genetisches Maximum berechnet, sehen?';

  @override
  String get paywallBullet1b =>
      'Wie beeinflusst dein Lebensstil dein Wachstum?';

  @override
  String get paywallBullet1c => 'Dein persönlicher Fahrplan wartet';

  @override
  String get paywallStat2 => 'deine Routine ist bereit';

  @override
  String get paywallTitle2 => 'Dein Plan\nist bereit';

  @override
  String get paywallBullet2a =>
      '8 Minuten jeden Morgen — für deine Wirbelsäule';

  @override
  String get paywallBullet2b => 'Schlaf, Ernährung, Wasser — alles im Blick';

  @override
  String get paywallBullet2c => 'Jeden Tag ein Schritt weiter';

  @override
  String get paywallStat3 => 'Echtzeit-Fortschrittsdiagramme';

  @override
  String get paywallTitle3 => 'Verfolge dein\nWachstum';

  @override
  String get paywallBullet3a => 'Monatliche Messungen — sieh dein Wachstum';

  @override
  String get paywallBullet3b => '2 cm jetzt mit Haltungsanalyse';

  @override
  String get paywallBullet3c => 'Fortschrittsfotos — den Unterschied sehen';

  @override
  String get paywallStat4 => 'Tagesprogramm — Level up';

  @override
  String get paywallTitle4 => 'Jeden Tag\nstärker';

  @override
  String get paywallBullet4a => 'XP verdienen, Level freischalten';

  @override
  String get paywallBullet4b => 'Erfolgreiche kamen hier durch';

  @override
  String get paywallBullet4c => 'Jetzt starten — erste Woche kostenlos';

  @override
  String get paywallRestore => 'Kein früherer Kauf gefunden';

  @override
  String get paywallRestoreNotFound => 'Kein früherer Kauf gefunden';

  @override
  String get paywallRestoreLabel => 'Käufe wiederherstellen';

  @override
  String get paywallYearly => 'Jährlich';

  @override
  String get paywallBestValue => 'Bester Wert';

  @override
  String get paywallMonthly => 'Monatlich';

  @override
  String get paywallFreeTrial => '3 Tage kostenlos';

  @override
  String get paywallLoadError => 'Kauf konnte nicht geladen werden';

  @override
  String get paywallCta => 'Kostenlos testen';

  @override
  String get paywallCtaAlt => 'Weiter';

  @override
  String get paywallTrialDisclaimer =>
      '3 Tage kostenlos · auto Verlängerung · jederzeit kündbar';

  @override
  String get paywallYearlyDisclaimer =>
      'Jährliche auto Verlängerung · jederzeit kündbar';

  @override
  String get paywallTester => 'Tester';

  @override
  String get introTag1 => 'PREDICTION';

  @override
  String get introTag2 => 'GROWTH';

  @override
  String get introTag3 => 'TRACKING';

  @override
  String get introTag4 => 'GAMIFICATION';

  @override
  String get introTag5 => 'COMMUNITY';

  @override
  String get introTitle1 => 'Discover your\nheight potential';

  @override
  String get introSubtitle1 =>
      'Let us calculate your full potential\nbased on genetics, age, and lifestyle.';

  @override
  String get introTitle2 => 'One step taller\nevery day';

  @override
  String get introSubtitle2 =>
      'Push your potential with personalized\nexercise and nutrition plans.';

  @override
  String get introTitle3 => 'Track every\ncentimeter';

  @override
  String get introSubtitle3 =>
      'See how your real progress\ndevelops with monthly measurements.';

  @override
  String get introTitle4 => 'Level up,\nearn rewards';

  @override
  String get introSubtitle4 =>
      'Complete 70-day programs,\nearn XP, and unlock new levels.';

  @override
  String get introTitle5 => 'Thousands already\ngrew taller';

  @override
  String get introSubtitle5 =>
      'Join the community of users\nwho reached their goals.';

  @override
  String get criticalWindow => 'KRITISCHES FENSTER';

  @override
  String get heightPotentialFading => 'Dein Wachstumspotenzial';

  @override
  String get fadingAway => 'schwindet dahin!';

  @override
  String get painHookDesc =>
      'Jeden Tag gehen Zentimeter unwiederbringlich verloren, ohne die richtigen Gewohnheiten. Aber das kann noch umgekehrt werden.';

  @override
  String get painGeneticTitle => 'Genetik ist nicht alles';

  @override
  String get painGeneticDesc =>
      'Genetik bestimmt 60 % — aber was du tust, bestimmt die anderen 40 %. BeTaller ist genau für diese 40 % da.';

  @override
  String get painGeneticTag => 'Analyse';

  @override
  String get painSleepTitle => 'Optimiere deine Schlafroutine';

  @override
  String get painSleepDesc =>
      'Richtiger Schlaf jede Nacht kann die Wachstumshormonproduktion um 70 % steigern. BeTaller automatisiert das Schlaf-Tracking, du schläfst einfach.';

  @override
  String get painSleepTag => 'Tracking';

  @override
  String get painPostureTitle => 'Gain centimeters now with posture';

  @override
  String get painPostureDesc =>
      'Correct posture can instantly add 1.5–3 cm. BeTaller\'s daily posture routine establishes this in a few weeks.';

  @override
  String get painPostureTag => 'Posture';

  @override
  String get painExerciseTitle => 'Your custom exercise plan is ready';

  @override
  String get painExerciseDesc =>
      'Morning stretches, hanging, spine routines — BeTaller prepared and scheduled these for you. Just 8–12 minutes a day.';

  @override
  String get painExerciseTag => 'Routines';

  @override
  String get painNutritionTitle => 'Your nutrition directly affects growth';

  @override
  String get painNutritionDesc =>
      'Protein, calcium, vitamin D — BeTaller reminds you every day which nutrients to take and when.';

  @override
  String get painNutritionTag => 'Nutrition';

  @override
  String get painTrackingTitle => 'Track your growth with your own eyes';

  @override
  String get painTrackingDesc =>
      'Monthly measurements, progress photos, growth chart — see every centimeter you gain.';

  @override
  String get painTrackingTag => 'Progress';

  @override
  String get selectYourGender => 'Select your gender';

  @override
  String get onboardingPredictSubtitle =>
      'This will be used to predict your height potential & create your custom plan.';

  @override
  String get other => 'Other';

  @override
  String get whenWereYouBorn => 'When were you born?';

  @override
  String get heightAndWeight => 'Height & weight';

  @override
  String get parentsHeight => 'Parents height';

  @override
  String get weeklyWorkout => 'Weekly workout';

  @override
  String get workoutsPerWeek => 'Workouts per week';

  @override
  String get whatsYourEthnicity => 'What\'s your ethnicity?';

  @override
  String get whiteCaucasian => 'White / Caucasian';

  @override
  String get blackAfricanAmerican => 'Black / African American';

  @override
  String get hispanicLatino => 'Hispanic / Latino';

  @override
  String get asian => 'Asian';

  @override
  String get middleEasternIndigenous => 'Middle Eastern / Indigenous';

  @override
  String get dontWantToAnswer => 'I don\'t want to answer';

  @override
  String get footSizeLabel => 'Foot size';

  @override
  String get selectYourSize => 'Select your size';

  @override
  String get whatsYourDreamHeight => 'What\'s your dream height?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Based on your input, we\'ll calculate the likelihood of achieving this height.';

  @override
  String get dreamHeightLabel => 'Dream height';

  @override
  String get sleepQuestion => 'How many hours do\nyou sleep each night?';

  @override
  String get thousandsSucceeded => 'Thousands\nSucceeded';

  @override
  String get youCanToo => 'You can do it too';

  @override
  String get yearsOld => 'years old';

  @override
  String get verifiedLabel => 'Verified';

  @override
  String get scientificData => 'SCIENTIFIC DATA';

  @override
  String get longTermResults => 'BeTaller creates\nlong-term results';

  @override
  String get longTermResultsSubtitle =>
      'Many people don\'t reach their ultimate height due to bad habits.';

  @override
  String get yourFinalHeight => 'Your final height';

  @override
  String get badHabitsLegend => 'Bad habits';

  @override
  String get optimizedLegend => 'Optimized';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'Height can be changed\nwith habits';

  @override
  String get chartFact2Pct => '9-10h';

  @override
  String get chartFact2Desc => 'Ideal sleep boosts\ngrowth hormone';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Can be gained with\nposture improvement';

  @override
  String get didYouKnow => 'Did you know?';

  @override
  String get didYouKnowFact1 => 'Daily habits affect 30% of your height';

  @override
  String get didYouKnowFact2 => 'Spinal compression steals 1.5-3 cm of height';

  @override
  String get didYouKnowFact3 => 'Sleep deprivation reduces HGH by 70%';

  @override
  String get transformJourneyBegins => 'Your Transformation\nJourney Begins';

  @override
  String get transformJourneySubtitle =>
      'A comprehensive program designed to support\nyour healthy growth, step by step.';

  @override
  String get week1Label => '1W';

  @override
  String get week1Title => 'Week 1';

  @override
  String get week1Desc => 'Spine alignment improves, posture gets better';

  @override
  String get month1Label => '1M';

  @override
  String get month1Title => 'Month 1';

  @override
  String get month1Desc => 'First visible centimeters, sleep quality improves';

  @override
  String get month3Label => '3M';

  @override
  String get month3Title => 'Month 3';

  @override
  String get month3Desc => 'Average +1.5–2.5 cm gain, muscle development';

  @override
  String get month6Label => '6M';

  @override
  String get month6Title => 'Month 6';

  @override
  String get month6Desc => 'Reach maximum potential, live with your new height';

  @override
  String get reachYourGoal => 'Reach Your Goal';

  @override
  String get journeyBullet1 => 'Unlock your maximum potential';

  @override
  String get journeyBullet2 => 'Start living with your new height';

  @override
  String get journeyBullet3 => 'Write your success story';

  @override
  String get unlockButton => 'Unlock All';

  @override
  String get dreamHeightOdds => 'Dream height\nodds';

  @override
  String get growthCompleteLabel => 'Growth\ncomplete';

  @override
  String get tallerThanPct => 'Taller than 76.7% of your age';

  @override
  String get levelNovice => 'Anfänger';

  @override
  String get levelBuilder => 'Aufbauer';

  @override
  String get levelGrinder => 'Kämpfer';

  @override
  String get levelWarrior => 'Krieger';

  @override
  String get levelGodTier => 'Gottgleich';

  @override
  String get levelDesc0 => 'Lege dein Fundament';

  @override
  String get levelDesc1 => 'Beschleunige dein Wachstum';

  @override
  String get levelDesc2 => 'Intensiviere das Training';

  @override
  String get levelDesc3 => 'Überschreite deine Grenzen';

  @override
  String get levelDesc4 => 'Kein Schmerz, kein Gewinn';

  @override
  String get levelDesc5 => 'Champion-Mentalität';

  @override
  String get levelDesc6 => 'Elite-Leistung';

  @override
  String get levelDesc7 => 'Meistere deinen Körper';

  @override
  String get levelDesc8 => 'Legendäre Disziplin';

  @override
  String get levelDesc9 => 'Maximales Potenzial';

  @override
  String levelLabel(int level) {
    return 'LEVEL $level';
  }

  @override
  String daysLeftProgram(int days) {
    return '$days Tage im Programm verbleibend';
  }

  @override
  String get tapLabel => 'TIPPEN';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'Tag';

  @override
  String get legendShort => 'Klein';

  @override
  String get legendBelowAvg => 'Unter Durchschnitt';

  @override
  String get legendAverage => 'Durchschnitt';

  @override
  String get legendTall => 'Groß';

  @override
  String get legendVeryTall => 'Sehr groß';

  @override
  String get pctBottom5 => 'Untere 5%';

  @override
  String get pctBottom25 => 'Untere 25%';

  @override
  String get pctMedian => 'Median';

  @override
  String get pctTop25 => 'Obere 25%';

  @override
  String get pctTop5 => 'Obere 5%';

  @override
  String get fallingBehind => 'Du liegst zurück';
}
