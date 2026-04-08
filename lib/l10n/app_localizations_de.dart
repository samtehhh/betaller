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
  String get completionLabel => 'FORTSCHRITT';

  @override
  String get growthVelocity => 'WACHSTUMSGESCHWINDIGKEIT';

  @override
  String get noData => 'Keine Daten';

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
      'Ich habe mein Wachstumspotenzial mit BeTaller entdeckt! Probiere es auch: https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app';

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
}
