// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get navHome => 'Home';

  @override
  String get navAnalysis => 'Analisi';

  @override
  String get navRoutines => 'Routine';

  @override
  String get navProgress => 'Progressi';

  @override
  String get navProfile => 'Profilo';

  @override
  String greeting(String name) {
    return 'Ciao, $name';
  }

  @override
  String get currentHeight => 'Altezza Attuale';

  @override
  String get target => 'Obiettivo';

  @override
  String completed(String pct) {
    return '$pct% completato';
  }

  @override
  String remaining(String cm) {
    return '+$cm cm rimanenti';
  }

  @override
  String get updateAnalysis => 'Aggiorna Analisi';

  @override
  String get analysisSubtitle =>
      'Ottieni previsioni da altezze passate + abitudini';

  @override
  String get dailyRoutines => 'Routine Giornaliere';

  @override
  String get allRoutinesDone => 'Tutte le routine completate!';

  @override
  String get water => 'Acqua';

  @override
  String get sleep => 'Sonno';

  @override
  String get growthSummary => 'Riepilogo Crescita';

  @override
  String get total => 'TOTALE';

  @override
  String get last => 'ULTIMO';

  @override
  String get measurement => 'MIS.';

  @override
  String get dailyTip => 'Consiglio del Giorno';

  @override
  String get waterTracking => 'Monitoraggio Acqua';

  @override
  String waterToday(String amount) {
    return 'Oggi: $amount L';
  }

  @override
  String get sleepTracking => 'Monitoraggio Sonno';

  @override
  String sleepTarget(String hours) {
    return 'Obiettivo: $hours ore';
  }

  @override
  String get hours => 'ore';

  @override
  String get save => 'Salva';

  @override
  String get cancel => 'Annulla';

  @override
  String get analysis => 'Analisi';

  @override
  String get betallerScore => 'Punteggio BeTaller';

  @override
  String get genetic => 'Genetico';

  @override
  String get growth => 'Crescita';

  @override
  String get nutrition => 'Nutrizione';

  @override
  String get sleepLabel => 'Sonno';

  @override
  String get discipline => 'Disciplina';

  @override
  String get improveScore => 'Migliora il Tuo Punteggio';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Nutrizione Critica!';

  @override
  String get nutritionStrengthen => 'Rafforza la Nutrizione';

  @override
  String get sleepRecordAdd => 'Aggiungi Registro Sonno';

  @override
  String get sleepPoor => 'Programma di Sonno Scarso';

  @override
  String get sleepImprove => 'Migliora il Sonno';

  @override
  String get startToday => 'Inizia Oggi!';

  @override
  String routinesRemaining(int count) {
    return '$count Routine Rimanenti';
  }

  @override
  String get keepStreak => 'Mantieni la Serie';

  @override
  String get addFirstMeasurement => 'Aggiungi Prima Misurazione';

  @override
  String get addMeasurement => 'Aggiungi Misurazione';

  @override
  String waterHalfNotReached(String amount) {
    return 'Non hai raggiunto metà del tuo obiettivo d\'acqua oggi. Bevi ancora ${amount}L.';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'Mancano ${amount}L per raggiungere l\'obiettivo d\'acqua. Ci sei quasi!';
  }

  @override
  String bmiLow(String bmi) {
    return 'Il tuo IMC è $bmi — un po\' basso. Aumenta l\'assunzione di proteine e calorie.';
  }

  @override
  String bmiHigh(String bmi) {
    return 'Il tuo IMC è $bmi — un po\' alto. Concentrati su un\'alimentazione sana.';
  }

  @override
  String get nutritionDefault =>
      'Completa il tuo obiettivo d\'acqua e mantieni una nutrizione equilibrata.';

  @override
  String sleepNoRecord(String hours) {
    return 'Nessun registro di sonno oggi. Punta a $hours ore e registralo.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Hai dormito $current ore oggi — ti mancano $missing ore. Vai a letto prima!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Quasi fatto. Raggiungere $hours ore massimizzerà l\'ormone della crescita.';
  }

  @override
  String get sleepGood => 'Ottimo programma di sonno! Continua così.';

  @override
  String noRoutinesDone(int total) {
    return 'Nessuna routine completata oggi. Inizia con una delle $total!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '$done/$total routine fatte oggi. Ancora $left da fare!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Ottimo lavoro oggi! Ancora $needed giorni per iniziare una serie.';
  }

  @override
  String streakContinue(int days) {
    return 'Serie di $days giorni! Il tuo punteggio sale mentre continui.';
  }

  @override
  String get noMeasurements =>
      'Nessuna misurazione dell\'altezza ancora. Aggiungi la prima per previsioni accurate.';

  @override
  String fewMeasurements(int count) {
    return 'Aggiungi altre $count misurazioni per calcolare la velocità di crescita.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Hai $count misurazioni. Raggiungere 5 migliorerà molto la precisione.';
  }

  @override
  String get keepMeasuring =>
      'Continua ad aggiungere misurazioni. Ogni nuovo dato migliora le previsioni.';

  @override
  String get heightPrediction => 'Previsione Altezza';

  @override
  String get predictedHeightAt21 => 'Altezza prevista a 21 anni';

  @override
  String get predictionMethod =>
      'Calcolato combinando dati genetici (genitori), velocità di crescita, IMC ed età.';

  @override
  String get growthStatus => 'Stato di Crescita';

  @override
  String get completionLabel => 'COMPLETAMENTO';

  @override
  String get growthVelocity => 'VELOCITÀ DI CRESCITA';

  @override
  String get noData => 'NESSUN DATO';

  @override
  String growthRate(String rating) {
    return 'Tasso di crescita: $rating';
  }

  @override
  String get bmi => 'IMC';

  @override
  String get calories => 'Calorie';

  @override
  String get kcalDay => 'kcal/giorno';

  @override
  String get daily => 'giornaliero';

  @override
  String get protein => 'Proteine';

  @override
  String get minimum => 'minimo';

  @override
  String get age => 'Età';

  @override
  String get male => 'Maschio';

  @override
  String get female => 'Femmina';

  @override
  String get yearlyPrediction => 'PREVISIONE ANNUALE';

  @override
  String ageYear(int age) {
    return '$age anni';
  }

  @override
  String get progressTitle => 'Monitoraggio Progressi';

  @override
  String get totalGrowth => 'Totale';

  @override
  String get lastDiff => 'Ultima Diff.';

  @override
  String get measurementCount => 'Mis.';

  @override
  String get heightChart => 'Grafico Altezza';

  @override
  String get chartMinData => 'Servono almeno 2 misurazioni per il grafico';

  @override
  String get chartInstruction =>
      'Aggiungi misurazioni per vedere il grafico dei progressi!';

  @override
  String get addMeasurementButton => 'AGGIUNGI NUOVA MISURAZIONE';

  @override
  String get measurementHistory => 'STORICO MISURAZIONI';

  @override
  String get deleteTitle => 'Elimina Misurazione';

  @override
  String get deleteMessage =>
      'Sei sicuro di voler eliminare questa misurazione?';

  @override
  String get dismiss => 'Annulla';

  @override
  String get delete => 'Elimina';

  @override
  String get newMeasurement => 'Nuova Misurazione Altezza';

  @override
  String get routines => 'Routine';

  @override
  String streakDays(int days) {
    return '$days Giorni';
  }

  @override
  String get progressStatus => 'Stato Progressi';

  @override
  String get completedLabel => 'Completato!';

  @override
  String get all => 'Tutti';

  @override
  String get exercise => 'Esercizio';

  @override
  String get posture => 'Postura';

  @override
  String bestStreak(int days) {
    return 'Migliore: $days giorni';
  }

  @override
  String get editProfile => 'Modifica Profilo';

  @override
  String get editProfileSubtitle =>
      'Aggiorna informazioni su altezza, peso ed età';

  @override
  String get name => 'Nome';

  @override
  String birthDate(String date) {
    return 'Nascita: $date';
  }

  @override
  String get heightCm => 'Altezza (cm)';

  @override
  String get weightKg => 'Peso (kg)';

  @override
  String get fatherHeight => 'Altezza del Padre (cm)';

  @override
  String get motherHeight => 'Altezza della Madre (cm)';

  @override
  String get notifications => 'Notifiche';

  @override
  String get notificationsOn => 'Promemoria attivi';

  @override
  String get notificationsOff => 'Promemoria disattivati';

  @override
  String get premium => 'Passa a Premium';

  @override
  String get premiumSubtitle => 'Sblocca tutte le funzionalità';

  @override
  String get rateUs => 'Valutaci';

  @override
  String get rateSubtitle => 'Ti piace l\'app? Dacci 5 stelle!';

  @override
  String get share => 'Condividi App';

  @override
  String get shareSubtitle => 'Racconta ai tuoi amici di BeTaller';

  @override
  String get shareText =>
      'Ho scoperto il mio potenziale di crescita con BeTaller! Provalo anche tu: https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app';

  @override
  String get feedback => 'Invia Feedback';

  @override
  String get feedbackSubtitle => 'Contattaci';

  @override
  String get resetData => 'Ripristina Tutti i Dati';

  @override
  String get resetSubtitle => 'Tutti i dati verranno eliminati';

  @override
  String get resetTitle => 'Ripristina Dati';

  @override
  String get resetMessage =>
      'Tutti i dati verranno eliminati e tornerai alla schermata iniziale. Questa azione non può essere annullata!';

  @override
  String get reset => 'Ripristina';

  @override
  String get premiumSoon => 'Premium in arrivo!';

  @override
  String get brandingSubtitle => 'Scopri il tuo potenziale di crescita';

  @override
  String get statistics => 'Statistiche';

  @override
  String get currentStreak => 'Serie Attuale';

  @override
  String get bestStreakLabel => 'Miglior Serie';

  @override
  String get achievementLabel => 'Traguardo';

  @override
  String get achievements => 'Traguardi';

  @override
  String get earned => 'Ottenuto!';

  @override
  String get notEarned => 'Non ancora ottenuto';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Lingua';

  @override
  String get languageSubtitle => 'Cambia lingua dell\'app';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Scopri il tuo potenziale di crescita';

  @override
  String get onboardingMeetYou => 'Conosciamoci';

  @override
  String get onboardingInfoNeeded =>
      'Informazioni di base necessarie per l\'analisi.';

  @override
  String get gender => 'SESSO';

  @override
  String get birthDateLabel => 'DATA DI NASCITA';

  @override
  String get bodyMeasurements => 'Misure Corporee';

  @override
  String get bodyInfo =>
      'La tua altezza e il tuo peso attuali sono necessari per l\'analisi.';

  @override
  String get geneticData => 'Dati Genetici';

  @override
  String get geneticInfo =>
      'L\'altezza dei genitori determina il tuo potenziale genetico.';

  @override
  String get pastHeights => 'Altezze Precedenti';

  @override
  String get pastHeightsInfo =>
      'Inserisci le altezze che ricordi a diverse età. Puoi lasciare spazi vuoti.';

  @override
  String get heightHint => 'Inserisci altezza...';

  @override
  String get ageLabel => 'età';

  @override
  String get habits => 'Le Tue Abitudini';

  @override
  String get habitsInfo =>
      'Il tuo stile di vita influisce direttamente sulle previsioni.';

  @override
  String get weeklyExercise => 'Esercizio Settimanale';

  @override
  String get dailySleep => 'Sonno Giornaliero';

  @override
  String get nutritionQuality => 'QUALITÀ NUTRIZIONALE';

  @override
  String get nutritionDesc =>
      'Assunzione di proteine, latticini, verdure e frutta';

  @override
  String get nutritionBad => 'Pessima';

  @override
  String get nutritionPoor => 'Scarsa';

  @override
  String get nutritionMedium => 'Media';

  @override
  String get nutritionGood => 'Buona';

  @override
  String get nutritionGreat => 'Ottima';

  @override
  String get startAnalysis => 'Inizia Analisi';

  @override
  String get continueBtn => 'Continua';

  @override
  String get analyzeBtn => 'Analizza';

  @override
  String get analyzing => 'Analizzando';

  @override
  String get analysisComplete => 'Completato!';

  @override
  String get yourScore => 'Il Tuo Punteggio BeTaller';

  @override
  String get letsStart => 'Iniziamo';

  @override
  String get doneBtn => 'Fatto';

  @override
  String get analysisStep1 => 'Analizzando dati genetici...';

  @override
  String get analysisStep2 => 'Calcolando velocità di crescita...';

  @override
  String get analysisStep3 => 'Elaborando dati di nutrizione e sonno...';

  @override
  String get analysisStep4 => 'Generando previsione di altezza...';

  @override
  String get analysisStep5 => 'Calcolando punteggio BeTaller...';

  @override
  String growthPotential(String cm) {
    return '+$cm cm di potenziale di crescita';
  }

  @override
  String get heightAt21 => 'a 21 anni';

  @override
  String confidenceLevel(String pct) {
    return '$pct% livello di confidenza';
  }

  @override
  String heightRange(String min, String max) {
    return 'Intervallo $min - $max cm';
  }

  @override
  String get currentLabel => 'ATTUALE';

  @override
  String get predictedLabel => 'PREVISTO';

  @override
  String get yearlyPredictions => 'Previsioni Annuali';

  @override
  String get tipMorningMeasure =>
      'Misura l\'altezza al mattino - la pressione sui dischi causa perdita di altezza durante il giorno. La misurazione più precisa è al mattino.';

  @override
  String get tipProteinSpread =>
      'Distribuisci l\'assunzione di proteine tra i pasti. Non mangiare tutto in una volta, includi proteine in ogni pasto.';

  @override
  String get tipGrowthHormone =>
      'L\'ormone della crescita raggiunge il picco durante il sonno. Dormi tra le 22 e le 2!';

  @override
  String get tipVitaminD =>
      '15 minuti di esposizione solare giornaliera aumentano la produzione di vitamina D. La vitamina D è essenziale per l\'assorbimento del calcio.';

  @override
  String get tipBarHanging =>
      'Appendersi alla sbarra decomprime la colonna vertebrale. Prova 3x30 secondi al giorno.';

  @override
  String get tipSwimming =>
      'Il nuoto è il miglior sport per un allenamento completo e per supportare la crescita in altezza.';

  @override
  String get tipStress =>
      'Lo stress sopprime l\'ormone della crescita. Riduci lo stress con meditazione e yoga.';

  @override
  String get routineMorningStretch => 'Stretching Mattutino';

  @override
  String get routineMorningStretchDesc =>
      'Fai 10 minuti di stretching appena sveglio. Allunga la colonna vertebrale e i muscoli delle gambe.';

  @override
  String get routineBarHanging => 'Appendersi alla Sbarra';

  @override
  String get routineBarHangingDesc =>
      'Appenditi a una sbarra per trazioni per estendere la colonna. 3 serie x 30 secondi.';

  @override
  String get routineCobraStretch => 'Stretching del Cobra';

  @override
  String get routineCobraStretchDesc =>
      'Sdraiati a pancia in giù e solleva il busto. Allunga la colonna. 3 serie x 15 secondi.';

  @override
  String get routineJumping => 'Esercizi di Salto';

  @override
  String get routineJumpingDesc =>
      'Salto con la corda o squat jump. Stimola le placche di crescita. 3 serie x 20 ripetizioni.';

  @override
  String get routineSwimming => 'Nuoto o Pallacanestro';

  @override
  String get routineSwimmingDesc =>
      'Pratica uno sport che favorisca la crescita in altezza. Almeno 30 minuti.';

  @override
  String get routineYoga => 'Yoga e Stretching Serale';

  @override
  String get routineYogaDesc =>
      'Routine di yoga e stretching prima di dormire. Rilascia lo stress, rilassa i muscoli.';

  @override
  String get routineProtein => 'Assunzione di Proteine';

  @override
  String get routineProteinDesc =>
      'Uova, pollo, pesce, latticini. Almeno 1,5g/kg di proteine al giorno.';

  @override
  String get routineCalcium => 'Calcio e Vitamina D';

  @override
  String get routineCalciumDesc =>
      'Consuma latte, formaggio, yogurt. Prendi il sole 15 min. Essenziale per lo sviluppo osseo.';

  @override
  String get routineWater => 'Obiettivo Assunzione Acqua';

  @override
  String get routineWaterDesc =>
      'Bevi almeno 2-3 litri d\'acqua al giorno. Essenziale per il metabolismo e la crescita.';

  @override
  String get routineAvoidJunk => 'Evita il Cibo Spazzatura';

  @override
  String get routineAvoidJunkDesc =>
      'Stai lontano da fast food, bevande zuccherate e cibi processati.';

  @override
  String get routineSleep => 'Sonno di Qualità (8-10 ore)';

  @override
  String get routineSleepDesc =>
      'L\'ormone della crescita viene rilasciato durante il sonno. 22-6 sono le ore d\'oro.';

  @override
  String get routineNoScreen => 'Pausa Schermi Prima di Dormire';

  @override
  String get routineNoScreenDesc =>
      'Metti via telefono e computer 1 ora prima di dormire. Non bloccare la produzione di melatonina.';

  @override
  String get routinePosture => 'Controllo Postura';

  @override
  String get routinePostureDesc =>
      'Tieni la schiena dritta, spalle indietro. Controlla ogni ora. Buona postura = 2-3 cm di differenza.';

  @override
  String get routineWallStand => 'Esercizio alla Parete';

  @override
  String get routineWallStandDesc =>
      'Appoggiati alla parete: talloni, fianchi, spalle e testa a contatto con il muro. Mantieni 5 min.';

  @override
  String get routineSprintIntervals => 'Intervalli di Sprint';

  @override
  String get routineSprintIntervalsDesc =>
      'L\'allenamento a intervalli di sprint innesca un rilascio significativo di ormone della crescita attraverso esplosioni ad alta intensità.';

  @override
  String get routineHiitWorkout => 'Allenamento HIIT';

  @override
  String get routineHiitWorkoutDesc =>
      'Allenamento a intervalli ad alta intensità per massimizzare il rilascio di ormone della crescita.';

  @override
  String get routineSquats => 'Squat a Corpo Libero';

  @override
  String get routineSquatsDesc =>
      'Gli squat a corpo libero stimolano le placche di crescita nelle gambe e nella colonna vertebrale.';

  @override
  String get routineDeadliftStretch => 'Stretching Deadlift';

  @override
  String get routineDeadliftStretchDesc =>
      'Stretching deadlift per la decompressione spinale e la salute dei dischi vertebrali.';

  @override
  String get routineOverheadPress => 'Press Sopra la Testa';

  @override
  String get routineOverheadPressDesc =>
      'Il press sopra la testa allunga la colonna vertebrale e rafforza i muscoli posturali.';

  @override
  String get routineSkippingRope => 'Salto con la Corda';

  @override
  String get routineSkippingRopeDesc =>
      'I salti ripetitivi con la corda stimolano le placche di crescita nelle estremità inferiori.';

  @override
  String get routinePilatesCore => 'Pilates Core';

  @override
  String get routinePilatesCoreDesc =>
      'Gli esercizi Pilates Core supportano l\'allineamento della colonna vertebrale e la postura.';

  @override
  String get routineInversionHang => 'Sospensione Invertita';

  @override
  String get routineInversionHangDesc =>
      'L\'inversione decomprime i dischi spinali e può aggiungere temporaneamente 1-2 cm.';

  @override
  String get routineZincIntake => 'Alimenti Ricchi di Zinco';

  @override
  String get routineZincIntakeDesc =>
      'Consuma alimenti ricchi di zinco durante la giornata per la produzione di ormone della crescita.';

  @override
  String get routineVitaminDSunlight => 'Vitamina D e Luce Solare';

  @override
  String get routineVitaminDSunlightDesc =>
      'Prendi almeno 15 minuti di luce solare diretta per la sintesi di vitamina D e la crescita ossea.';

  @override
  String get routineArginineFoods => 'Alimenti Ricchi di Arginina';

  @override
  String get routineArginineFoodsDesc =>
      'Mangia alimenti ricchi di arginina per stimolare la secrezione di ormone della crescita.';

  @override
  String get routineSleepEnvironment => 'Ottimizza l\'Ambiente del Sonno';

  @override
  String get routineSleepEnvironmentDesc =>
      'Crea un ambiente di sonno buio e fresco per massimizzare il rilascio di melatonina e ormone della crescita.';

  @override
  String get routinePreSleepRoutine => 'Routine Pre-Sonno';

  @override
  String get routinePreSleepRoutineDesc =>
      'Una routine pre-sonno costante migliora la qualità del sonno profondo del 23%.';

  @override
  String get routineNeckStretches => 'Stretching del Collo';

  @override
  String get routineNeckStretchesDesc =>
      'Lo stretching del collo allevia la compressione e migliora l\'allineamento cervicale.';

  @override
  String get routineShoulderRolls => 'Rotazioni e Aperture delle Spalle';

  @override
  String get routineShoulderRollsDesc =>
      'Aprire le spalle corregge la postura in avanti e può aggiungere 1-2 cm nell\'aspetto.';

  @override
  String get achieveFirstDay => 'Primo Passo';

  @override
  String get achieveFirstDayDesc => 'Completa il tuo primo giorno';

  @override
  String get achieveThreeStreak => 'Serie di 3 Giorni';

  @override
  String get achieveThreeStreakDesc =>
      'Completa le routine per 3 giorni di fila';

  @override
  String get achieveWeekStreak => 'Serie di 7 Giorni';

  @override
  String get achieveWeekStreakDesc =>
      'Completa le routine per 7 giorni di fila';

  @override
  String get achieveTwoWeekStreak => 'Serie di 14 Giorni';

  @override
  String get achieveTwoWeekStreakDesc => 'Continua per 14 giorni di fila';

  @override
  String get achieveMonthStreak => 'Serie di 30 Giorni';

  @override
  String get achieveMonthStreakDesc => 'Completa 30 giorni di fila';

  @override
  String get achieveTwoMonthStreak => 'Serie di 60 Giorni';

  @override
  String get achieveTwoMonthStreakDesc => 'Completa 60 giorni di fila';

  @override
  String get achieveHundredStreak => 'Serie di 100 Giorni';

  @override
  String get achieveHundredStreakDesc => 'Completa 100 giorni di fila';

  @override
  String get achieveFirstMeasure => 'Prima Misurazione';

  @override
  String get achieveFirstMeasureDesc =>
      'Registra la tua prima misurazione di altezza';

  @override
  String get achieveThreeMeasures => 'Monitoratore';

  @override
  String get achieveThreeMeasuresDesc => 'Registra 3 misurazioni di altezza';

  @override
  String get achieveFiveMeasures => 'Monitoraggio Regolare';

  @override
  String get achieveFiveMeasuresDesc => 'Registra 5 misurazioni di altezza';

  @override
  String get achieveTenMeasures => 'Cacciatore di Dati';

  @override
  String get achieveTenMeasuresDesc => 'Registra 10 misurazioni di altezza';

  @override
  String get achieveFirstCm => 'Primo Centimetro';

  @override
  String get achieveFirstCmDesc => 'Registra 1 cm di crescita totale';

  @override
  String get achieveThreeCm => '3 cm di Crescita';

  @override
  String get achieveThreeCmDesc => 'Registra 3 cm di crescita totale';

  @override
  String get achieveFiveCm => '5 cm di Crescita';

  @override
  String get achieveFiveCmDesc => 'Registra 5 cm di crescita totale';

  @override
  String get achieveTenCm => '10 cm di Crescita';

  @override
  String get achieveTenCmDesc => 'Registra 10 cm di crescita totale';

  @override
  String get quote1 => 'Sii migliore di ieri, ogni giorno.';

  @override
  String get quote2 =>
      'La crescita non avviene dall\'oggi al domani, ma ogni notte ti avvicina.';

  @override
  String get quote3 => 'La crescita richiede pazienza, continua così!';

  @override
  String get quote4 =>
      'Il passo che fai oggi costruisce le fondamenta di domani.';

  @override
  String get quote5 => 'La disciplina inizia dove finisce la motivazione.';

  @override
  String get quote6 => 'Il tuo corpo ti ringrazierà, continua così!';

  @override
  String get quote7 => 'Sei tu a stabilire i limiti del tuo potenziale.';

  @override
  String get quote8 => 'Piccoli passi creano grandi cambiamenti.';

  @override
  String get quote9 => 'Il miglior investimento è in te stesso.';

  @override
  String get quote10 => 'Ogni giorno sei più vicino al tuo obiettivo.';

  @override
  String get quote11 => 'Il cambiamento è difficile, ma il rimpianto è peggio.';

  @override
  String get quote12 => 'Il tuo corpo è un tempio, prenditi cura di esso.';

  @override
  String get quote13 => 'Il tuo rivale è il te di ieri. Superalo oggi!';

  @override
  String get quote14 => 'BeTaller = Pazienza + Disciplina + Fiducia';

  @override
  String get quote15 => 'Credi in te stesso, il processo ti formerà.';

  @override
  String get quote16 => 'Non dire oggi non posso, non pentirti domani.';

  @override
  String get quote17 => 'Mostra progressi ogni giorno, anche solo l\'1%.';

  @override
  String get quote18 => 'Lo specchio mostrerà i tuoi progressi, abbi pazienza.';

  @override
  String get bmiNormal => 'Normale';

  @override
  String get bmiUnderweight => 'Sottopeso';

  @override
  String get bmiOverweight => 'Sovrappeso';

  @override
  String get bmiObese => 'Obeso';

  @override
  String get velocityExcellent => 'Eccellente';

  @override
  String get velocityNormal => 'Normale';

  @override
  String get velocitySlow => 'Lento';

  @override
  String get velocityVeryLow => 'Molto Basso';

  @override
  String durationMinutes(String min) {
    return '$min min';
  }

  @override
  String get durationAllDay => 'Tutto il giorno';

  @override
  String get durationNight => 'Notte';

  @override
  String durationHours(String hours) {
    return '$hours ore';
  }

  @override
  String get onboardingStep1 => 'Inserisci le tue informazioni personali';

  @override
  String get onboardingStep2 => 'Condividi le tue altezze passate';

  @override
  String get onboardingStep3 => 'Valuta le tue abitudini';

  @override
  String get onboardingStep4 => 'Scopri la tua previsione e il tuo punteggio';

  @override
  String get hoursShort => 'ore';

  @override
  String get selectLanguage => 'Seleziona lingua';

  @override
  String get systemLanguage => 'Lingua di sistema';

  @override
  String get emailSubject => 'BeTaller Feedback';

  @override
  String get pastHeightsTip =>
      'Puoi lasciare vuote le età che non ricordi. Inserire 1-2 altezze passate è sufficiente.';

  @override
  String get currentSuffix => '(attuale)';

  @override
  String personalizedProtein(String amount) {
    return 'Uova, pollo, pesce, latticini. Mangia almeno ${amount}g di proteine al giorno.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Bevi almeno ${amount}L di acqua al giorno. Essenziale per metabolismo e crescita.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'L\'ormone della crescita viene rilasciato durante il sonno. Dormi almeno $hours ore. 22-06 sono ore d\'oro.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Consuma latte, formaggio, yogurt. 15 min di sole. Obiettivo calorico: $calories kcal.';
  }

  @override
  String get scoreS =>
      'Eccellente! Stai raggiungendo il massimo del tuo potenziale.';

  @override
  String get scoreA =>
      'Stai andando alla grande! Piccoli miglioramenti possono portarti in cima.';

  @override
  String get scoreB =>
      'Sulla strada giusta. Concentrati un po\' di più su routine e nutrizione.';

  @override
  String get scoreC =>
      'C\'è margine di miglioramento. Le routine regolari faranno la differenza.';

  @override
  String get scoreD => 'Alto potenziale ma devi passare all\'azione.';

  @override
  String get scoreF =>
      'Inizia ora! Un piccolo passo ogni giorno fa una grande differenza.';

  @override
  String get cmPerYear => 'cm/anno';

  @override
  String get howToDoIt => 'Come si fa';

  @override
  String get musclesTargeted => 'Muscoli e ossa coinvolti';

  @override
  String get scientificBasis => 'Base scientifica';

  @override
  String setXofY(String current, String total) {
    return 'Serie $current di $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Riposo prima della serie $set';
  }

  @override
  String get allSetsComplete => 'Tutte le serie completate!';

  @override
  String get setTimer => 'Timer della serie';

  @override
  String get setTracker => 'Tracciamento serie';

  @override
  String get builtInTimer => 'Timer integrato';

  @override
  String get markComplete => 'Segna come completato';

  @override
  String get markIncomplete => 'Segna come incompleto';

  @override
  String get done => 'Fatto';

  @override
  String get doneExclamation => 'Fatto!';

  @override
  String get start => 'Avvia';

  @override
  String get pause => 'Pausa';

  @override
  String get resetTimer => 'Ripristina';

  @override
  String get skipRest => 'Salta il riposo';

  @override
  String get restart => 'Ricomincia';

  @override
  String get perSet => 'per serie';

  @override
  String get rest => 'RIPOSO';

  @override
  String get reps => 'rip.';

  @override
  String get difficultyBeginner => 'Principiante';

  @override
  String get difficultyIntermediate => 'Intermedio';

  @override
  String get difficultyAdvanced => 'Avanzato';

  @override
  String get learnTitle => 'Impara';

  @override
  String get learnSubtitle => 'Conoscenze scientifiche per la crescita';

  @override
  String get categoryAll => 'Tutti';

  @override
  String get categoryScience => 'Scienza';

  @override
  String get categoryNutrition => 'Nutrizione';

  @override
  String get categoryExercise => 'Esercizio';

  @override
  String get categorySleep => 'Sonno';

  @override
  String get categoryMyths => 'Miti';

  @override
  String get scientificReferences => 'Riferimenti scientifici';

  @override
  String get relatedRoutines => 'Routine correlate';

  @override
  String get nutritionTitle => 'Nutrizione';

  @override
  String get sectionMealPlan => 'Piano pasti';

  @override
  String get sectionNutrients => 'Nutrienti';

  @override
  String get sectionFoods => 'Alimenti';

  @override
  String todaysPlan(String day) {
    return 'Piano di oggi — $day';
  }

  @override
  String get breakfast => 'Colazione';

  @override
  String get lunch => 'Pranzo';

  @override
  String get dinner => 'Cena';

  @override
  String get snacks => 'Spuntini';

  @override
  String get searchFoods => 'Cerca alimenti...';

  @override
  String nFoods(String count) {
    return '$count alimenti';
  }

  @override
  String dailyLabel(String amount) {
    return 'Giornaliero: $amount';
  }

  @override
  String get dailyNeedByAge => 'FABBISOGNO GIORNALIERO PER ETÀ';

  @override
  String agePrefix(String range) {
    return 'Età $range';
  }

  @override
  String get topFoodSources => 'MIGLIORI FONTI ALIMENTARI';

  @override
  String get categoryDairy => 'Latticini';

  @override
  String get categoryMeatFish => 'Carne e pesce';

  @override
  String get categoryVegetables => 'Verdure';

  @override
  String get categoryFruits => 'Frutta';

  @override
  String get categoryGrains => 'Cereali e legumi';

  @override
  String get categoryNutsSeeds => 'Frutta secca e semi';

  @override
  String get weeklyReportTitle => 'Rapporto settimanale';

  @override
  String get overview => 'Panoramica';

  @override
  String get routinesLabel => 'Routine';

  @override
  String get streakLabel => 'Serie';

  @override
  String get heightLabel => 'Altezza';

  @override
  String get dailyScores => 'Punteggi giornalieri';

  @override
  String get waterToday2 => 'Acqua oggi';

  @override
  String get sleepToday => 'Sonno oggi';

  @override
  String get routineCompletion => 'Completamento routine';

  @override
  String get xpAndLevel => 'XP e livello';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP al prossimo livello';
  }

  @override
  String get activeChallenges => 'Sfide attive';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m completati';
  }

  @override
  String get shareYourProgress => 'Condividi i tuoi progressi';

  @override
  String get shareComingSoon => 'Funzione di condivisione in arrivo!';

  @override
  String get premiumTest => 'Premium (Test)';

  @override
  String get premiumActive => 'Attivo';

  @override
  String get premiumFree => 'Gratuito';

  @override
  String get weeklyReportMenu => 'Rapporto settimanale';

  @override
  String get weeklyReportMenuSubtitle => 'Il tuo riepilogo di progressi';

  @override
  String get unlockGrowthPotential =>
      'Sblocca tutto il tuo potenziale di crescita';

  @override
  String get featureGrowthAnalysis => 'Analisi di crescita e punteggio';

  @override
  String get featureHeightPrediction => 'Previsione e pronostico altezza';

  @override
  String get featureAllRoutines => 'Tutte le 14 routine giornaliere';

  @override
  String get featureWaterSleep => 'Monitoraggio acqua e sonno';

  @override
  String get featureProgress => 'Progressi e misurazioni';

  @override
  String get featureAchievements => 'Traguardi e serie';

  @override
  String get planMonthly => 'Mensile';

  @override
  String get planYearly => 'Annuale';

  @override
  String get bestValue => 'MIGLIOR OFFERTA';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'LIV $level';
  }

  @override
  String get levelBeginner => 'Principiante';

  @override
  String get levelStarter => 'Novizio';

  @override
  String get levelCommitted => 'Impegnato';

  @override
  String get levelDedicated => 'Dedicato';

  @override
  String get levelConsistent => 'Costante';

  @override
  String get levelFocused => 'Concentrato';

  @override
  String get levelDetermined => 'Determinato';

  @override
  String get levelDisciplined => 'Disciplinato';

  @override
  String get levelStrong => 'Forte';

  @override
  String get levelAdvanced => 'Avanzato';

  @override
  String get levelExpert => 'Esperto';

  @override
  String get levelMaster => 'Maestro';

  @override
  String get levelElite => 'Elite';

  @override
  String get levelChampion => 'Campione';

  @override
  String get levelLegend => 'Leggenda';

  @override
  String get levelTitan => 'Titano';

  @override
  String get levelMythic => 'Mitico';

  @override
  String get levelImmortal => 'Immortale';

  @override
  String get levelTranscendent => 'Trascendente';

  @override
  String get levelUltimate => 'Supremo';

  @override
  String get challengeCompleteAllRoutines => 'Completare tutte le routine';

  @override
  String get challengeCompleteAllRoutinesDesc => 'Termina ogni routine oggi';

  @override
  String get challengeHydrationHero => 'Eroe dell\'idratazione';

  @override
  String get challengeHydrationHeroDesc =>
      'Raggiungi l\'obiettivo d\'acqua giornaliero';

  @override
  String get challengeEarlySleeper => 'Dormiente precoce';

  @override
  String get challengeEarlySleeperDesc => 'Registra 8+ ore di sonno';

  @override
  String get challengeExerciseTrio => 'Trio di esercizi';

  @override
  String get challengeExerciseTrioDesc => 'Completa 3 routine di esercizio';

  @override
  String get challengeMorningStretch => 'Stretching mattutino';

  @override
  String get challengeMorningStretchDesc => 'Fai stretching prima delle 9';

  @override
  String get challenge7DayWarrior => 'Guerriero dei 7 giorni';

  @override
  String get challenge7DayWarriorDesc =>
      'Completa tutte le routine per 7 giorni consecutivi';

  @override
  String get challengeGrowthTracker => 'Tracciatore di crescita';

  @override
  String get challengeGrowthTrackerDesc =>
      'Registra una misurazione di altezza questa settimana';

  @override
  String get challengeHydrationWeek => 'Settimana idratazione';

  @override
  String get challengeHydrationWeekDesc =>
      'Raggiungi l\'obiettivo d\'acqua 5 giorni questa settimana';

  @override
  String get challengeFitnessChampion => 'Campione fitness';

  @override
  String get challengeFitnessChampionDesc =>
      'Completa 15 routine di esercizio questa settimana';

  @override
  String get challengeSleepMaster => 'Maestro del sonno';

  @override
  String get challengeSleepMasterDesc =>
      'Registra 8+ ore di sonno per 5 giorni';

  @override
  String get performanceDashboard => 'PANNELLO PRESTAZIONI';

  @override
  String get tierA => 'LIVELLO A';

  @override
  String get tierB => 'LIVELLO B';

  @override
  String get tierC => 'LIVELLO C';

  @override
  String get tierD => 'LIVELLO D';

  @override
  String get tierE => 'LIVELLO E';

  @override
  String get maxTierReached => 'LIVELLO MASSIMO RAGGIUNTO';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Prossimo: $tier · +$pts punti necessari';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Gestisci routine';

  @override
  String get manageRoutinesSubtitle =>
      'Mostra o nascondi routine dalla tua lista quotidiana';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible su $total attive';
  }

  @override
  String get showAll => 'Mostra tutto';

  @override
  String get hideAll => 'Nascondi tutto';

  @override
  String get heightAnalysis => 'Analisi dell\'Altezza';

  @override
  String get heightVsPopulation =>
      'La Tua Posizione nella Popolazione Mondiale';

  @override
  String get globalAveragesTable => 'Medie Globali per Età';

  @override
  String get standingTall => 'Statura Alta';

  @override
  String get standingAboveAverage => 'Sopra la Media';

  @override
  String get standingBelowAverage => 'Sotto la Media';

  @override
  String get standingShort => 'Sotto i Pari Età';

  @override
  String get yourHeightStanding => 'LA TUA POSIZIONE IN ALTEZZA';

  @override
  String get yourHeight => 'Tu';

  @override
  String peerAvg(int age) {
    return 'Media età $age';
  }

  @override
  String get aboveAvg => 'Sopra media';

  @override
  String get belowAvg => 'Sotto media';

  @override
  String get whoDataSource => 'Riferimento Globale OMS 2007';

  @override
  String get percentileShort5 => 'P5';

  @override
  String get percentileShort50 => 'P50';

  @override
  String get percentileShort95 => 'P95';

  @override
  String get youLabel => 'Tu';

  @override
  String get avgHeightLabel => 'MED';

  @override
  String get percentileLabel => 'PCT';

  @override
  String get diffLabel => 'DIFF';

  @override
  String get whoSourceNote =>
      'Fonte: Riferimento crescita OMS 2007 e stime globali NCD-RisC. I percentili sono medie globali e possono variare per paese.';

  @override
  String get quickPhotos => 'Foto';

  @override
  String get quickPosture => 'Postura';

  @override
  String get quickWellness => 'Benessere';

  @override
  String get quickRecipes => 'Ricette';

  @override
  String get wellnessTitle => 'Tracker Benessere';

  @override
  String get wellnessHeader => 'BENESSERE';

  @override
  String get wellnessSubtitle =>
      'Monitora i fattori che influenzano la tua crescita';

  @override
  String get caffeineToday => 'Caffeina oggi';

  @override
  String get withinLimits => 'Entro i limiti sani';

  @override
  String get approachingLimit => 'Vicino al limite';

  @override
  String get overLimit => 'Oltre il limite — influisce sull\'HGH';

  @override
  String get resetToday => 'Azzera oggi';

  @override
  String get stressToday => 'Stress oggi';

  @override
  String get stressVeryCalmLabel => 'Molto calmo — ottimo per la crescita';

  @override
  String get stressCalmLabel => 'Calmo';

  @override
  String get stressNeutralLabel => 'Neutro';

  @override
  String get stressStressedLabel => 'Stressato';

  @override
  String get stressVeryStressedLabel =>
      'Molto stressato — il cortisolo blocca l\'HGH';

  @override
  String get stressTapToLog => 'Tocca per registrare come ti senti';

  @override
  String get todaysJournal => 'Diario di oggi';

  @override
  String get journalNoNote => '(nessuna nota)';

  @override
  String get journalEdit => 'Modifica';

  @override
  String get journalHowWasToday => 'Com\'è andata oggi?';

  @override
  String get journalSaved => 'Diario salvato · +5 XP';

  @override
  String get journalSaveEntry => 'Salva';

  @override
  String get weeklyInsight => 'Analisi settimanale';

  @override
  String get weeklyInsightCaffeine => 'CAFFEINA';

  @override
  String get weeklyInsightStress => 'STRESS';

  @override
  String get weeklyInsightMood => 'UMORE';

  @override
  String get wellnessInfoTitle => 'Perché il benessere conta';

  @override
  String get wellnessInfoBody =>
      'La caffeina interferisce col sonno profondo, quando viene rilasciata la maggior parte dell\'ormone della crescita (HGH). Lo stress cronico aumenta il cortisolo, che sopprime direttamente l\'HGH. Tenere un diario aiuta a mantenere abitudini che supportano la crescita.';

  @override
  String get wellnessInfoGotIt => 'Capito';

  @override
  String get insightCaffeineHigh =>
      'La caffeina è alta questa settimana. Prova a ridurla per un sonno migliore e HGH.';

  @override
  String get insightStressHigh =>
      'Lo stress è elevato questa settimana. Considera esercizi di respirazione — il cortisolo blocca la crescita.';

  @override
  String get insightMoodLow =>
      'L\'umore è stato basso ultimamente. Luce solare, sonno ed esercizio leggero aiutano.';

  @override
  String get insightGreat =>
      'Ottimo equilibrio questa settimana. Il tuo benessere supporta una crescita ottimale.';

  @override
  String get insightDefault =>
      'Il tuo benessere è sulla buona strada. Continua a registrare per analisi più approfondite.';

  @override
  String get insightNeedMoreData =>
      'Registra per qualche giorno in più per vedere le analisi.';

  @override
  String get progressPhotosTitle => 'Foto di progresso';

  @override
  String get progressPhotosHeader => 'FOTO DI PROGRESSO';

  @override
  String get progressPhotosSubtitle => 'Segui il tuo percorso visivo';

  @override
  String get addProgressPhoto => 'Aggiungi foto';

  @override
  String get captureJourney => 'Cattura il tuo percorso visivo';

  @override
  String get takePhoto => 'Scatta foto';

  @override
  String get chooseFromLibrary => 'Scegli dalla galleria';

  @override
  String get deletePhotoTitle => 'Eliminare la foto?';

  @override
  String get deletePhotoBody =>
      'Questa foto sarà rimossa dalla tua timeline di progresso.';

  @override
  String get timelineTab => 'Timeline';

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
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'giorni',
      one: 'giorno',
    );
    return '$_temp0';
  }

  @override
  String get cmGained => 'cm guadagnati';

  @override
  String get firstPhotoMessage =>
      'Scatta la tua prima foto per iniziare a seguire il tuo progresso visivo.';

  @override
  String get takeFirstPhoto => 'Prima foto';

  @override
  String get beforeAfter => 'PRIMA / DOPO';

  @override
  String get beforeLabel => 'PRIMA';

  @override
  String get afterLabel => 'DOPO';

  @override
  String get yourHeightDialog => 'La tua altezza';

  @override
  String get heightDialogMessage =>
      'Inserisci la tua altezza attuale in cm per questa foto';

  @override
  String get postureAnalysisTitle => 'Analisi posturale';

  @override
  String get postureCoachHeader => 'COACH POSTURA';

  @override
  String get postureCoachSubtitle => 'Valutazione posturale con IA';

  @override
  String get latestScore => 'ULTIMO PUNTEGGIO';

  @override
  String get latestAnalysis => 'ULTIMA ANALISI';

  @override
  String get headPosition => 'Posizione della testa';

  @override
  String get progressLabel => 'PROGRESSO';

  @override
  String get choosePhotoSource => 'Scegli fonte foto';

  @override
  String get sideProfileHint =>
      'Profilo laterale, corpo intero nell\'inquadratura';

  @override
  String get howToTakePhoto => 'COME SCATTARE LA FOTO';

  @override
  String get takePosturePhoto => 'Foto postura';

  @override
  String get postureExcellent => 'Eccellente';

  @override
  String get postureGood => 'Buono';

  @override
  String get postureNeedsWork => 'Da migliorare';

  @override
  String get posturePoor => 'Scarso';

  @override
  String get recommendedExercises => 'ESERCIZI RACCOMANDATI';

  @override
  String get postureWallStand => 'Postura al muro';

  @override
  String get postureWallStandDesc =>
      'Stai con la schiena contro il muro per 2 minuti al giorno.';

  @override
  String get postureChestOpener => 'Apertura toracica';

  @override
  String get postureChestOpenerDesc =>
      'Apre i pettorali tesi che tirano le spalle in avanti.';

  @override
  String get postureChinTucks => 'Retrazione del mento';

  @override
  String get postureChinTucksDesc =>
      'Corregge la postura della testa in avanti — 3×10 ripetizioni.';

  @override
  String get postureDeadbug => 'Deadbug';

  @override
  String get postureDeadbugDesc =>
      'Rafforza il core profondo per il controllo della lordosi.';

  @override
  String get recipesTitle => 'Ricette';

  @override
  String get recipesHeader => 'RICETTE';

  @override
  String get recipesSubtitle => 'Alimenta la tua crescita';

  @override
  String get recipesCategoryAll => 'Tutte';

  @override
  String get recipesCategoryBreakfast => 'Colazione';

  @override
  String get recipesCategoryLunch => 'Pranzo';

  @override
  String get recipesCategoryDinner => 'Cena';

  @override
  String get recipesCategorySnack => 'Spuntino';

  @override
  String get recipesGoalAll => 'Tutti';

  @override
  String get recipesGoalProtein => 'Alto in proteine';

  @override
  String get recipesGoalCalcium => 'Calcio';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => 'Ferro';

  @override
  String get recipesNoMatch => 'Nessuna ricetta corrisponde a questi filtri';

  @override
  String get recipesIngredients => 'Ingredienti';

  @override
  String get recipesInstructions => 'Istruzioni';

  @override
  String get recipesClose => 'CHIUDI';

  @override
  String get recipesAboutTitle => 'Info sulle ricette';

  @override
  String get recipesAboutBody =>
      'Ricette selezionate per alimentare la tua crescita. Filtra per tipo di pasto o obiettivo nutrizionale per trovare la scelta perfetta.';

  @override
  String get animHintSpinalDecomp => 'Decompressione spinale';

  @override
  String get animHintGravityReversal => 'Inversione di gravità';

  @override
  String get animHintImpactBones => 'Carico d\'impatto osseo';

  @override
  String get animHintHighImpact => 'Carico osseo ad alto impatto';

  @override
  String get animHintMetabolicBurst => 'Allenamento metabolico intenso';

  @override
  String get animHintFullBodyStretch => 'Stretching completo del risveglio';

  @override
  String get animHintSpinalExtension => 'Estensione spinale';

  @override
  String get animHintCervicalDecomp => 'Decompressione cervicale';

  @override
  String get animHintShoulderMobility => 'Mobilità delle spalle';

  @override
  String get animHintFullBodyMotion => 'Movimento corporeo completo';

  @override
  String get animHintPosteriorChain => 'Stretching catena posteriore';

  @override
  String get animHintMuscleGrowth => 'Carburante per la crescita muscolare';

  @override
  String get animHintBoneDensity => 'Supporto densità ossea';

  @override
  String get animHintSpinalDisc => 'Idratazione dei dischi spinali';

  @override
  String get animHintCleanNutrition => 'Nutrizione pulita';

  @override
  String get animHintIgf1 => 'Ottimizzazione IGF-1';

  @override
  String get animHintHghAmino => 'Precursore amino HGH';

  @override
  String get animHintCalciumAbsorption => 'Assorbimento del calcio';

  @override
  String get animHintSpinalAlignment => 'Allineamento spinale';

  @override
  String get animHintPostureCorrection => 'Correzione posturale';

  @override
  String get animHintMindBody => 'Equilibrio mente-corpo';

  @override
  String get animHintCoreStability => 'Stabilità del core';

  @override
  String get animHintLegPower => 'Potenza delle gambe e picco HGH';

  @override
  String get animHintVerticalPower => 'Potenza verticale';

  @override
  String get animHintHghSurge => 'Allenamento picco HGH';

  @override
  String get animHintPeakHgh => 'Finestra di rilascio max HGH';

  @override
  String get animHintMelatonin => 'Ottimizzazione della melatonina';

  @override
  String get animHintDeepSleep => 'Setup sonno profondo';

  @override
  String get animHintSleepOpt => 'Ottimizzazione del sonno';

  @override
  String get animHintExercise => 'Esercizio';

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
  String get muscleSpine => 'Colonna';

  @override
  String get muscleLegs => 'Gambe';

  @override
  String get muscleBack => 'Schiena';

  @override
  String get muscleShoulders => 'Spalle';

  @override
  String get muscleArms => 'Braccia';

  @override
  String get muscleCore => 'Addominali';

  @override
  String get muscleChest => 'Petto';

  @override
  String get muscleCalves => 'Polpacci';

  @override
  String get muscleFullBody => 'Corpo intero';

  @override
  String get muscleHips => 'Fianchi';

  @override
  String get muscleBones => 'Ossa';

  @override
  String get muscleMuscles => 'Muscoli';

  @override
  String get muscleNeck => 'Collo';

  @override
  String get muscleUpperSpine => 'Colonna sup.';

  @override
  String get muscleUpperBack => 'Schiena alta';

  @override
  String get createRoutine => 'Crea routine';

  @override
  String get createRoutineTitle => 'Crea routine personalizzata';

  @override
  String get createRoutineSubtitle => 'Crea la tua routine quotidiana';

  @override
  String get routineIcon => 'Icona';

  @override
  String get routineTitleField => 'Titolo';

  @override
  String get routineDescField => 'Descrizione';

  @override
  String get routineDescHint => 'Breve riepilogo della routine';

  @override
  String get routineCategoryField => 'Categoria';

  @override
  String get routineDifficultyField => 'Difficoltà';

  @override
  String get routineDurationField => 'Durata';

  @override
  String get routineSetsRepsField => 'Serie x Ripetizioni';

  @override
  String get routineFormField => 'Istruzioni';

  @override
  String get routineFormHint => 'Opzionale — come eseguire questa routine';

  @override
  String get diffBeginner => 'Principiante';

  @override
  String get diffIntermediate => 'Intermedio';

  @override
  String get diffAdvanced => 'Avanzato';

  @override
  String get catExercise => 'Esercizio';

  @override
  String get catNutrition => 'Nutrizione';

  @override
  String get catSleep => 'Sonno';

  @override
  String get catPosture => 'Postura';

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
  String get program => 'Programma';

  @override
  String get todaysExercises => 'ESERCIZI DI OGGI';

  @override
  String get dailyNutritionPlan => 'PIANO NUTRIZIONALE GIORNALIERO';

  @override
  String get testimonial1 =>
      'Non avevo speranza per la mia età, ma sono cresciuto con BeTaller.';

  @override
  String get testimonialDuration1 => '4 mesi';

  @override
  String get testimonial2 =>
      'Tutti dicevano che non potevo più crescere. BeTaller li ha sorpresi.';

  @override
  String get testimonialDuration2 => '3 mesi';

  @override
  String get testimonial3 =>
      'Dopo le routine, sono cresciuto e la mia postura è migliorata.';

  @override
  String get testimonialDuration3 => '6 mesi';

  @override
  String get testimonial4 =>
      'Sono ancora in fase di crescita e l\'effetto di BeTaller è incredibile.';

  @override
  String get testimonialDuration4 => '3 mesi';

  @override
  String get testimonial5 =>
      'Ho notato una differenza reale rapidamente. Lo consiglio vivamente.';

  @override
  String get testimonialDuration5 => '4 mesi';

  @override
  String get designedForYou => 'Progettato per te';

  @override
  String get designedForYouDesc =>
      'BeTaller è stato costruito per aiutarti a raggiungere il tuo limite genetico.';

  @override
  String get greetingAllDone => 'Ottimo lavoro! 🎯';

  @override
  String get greetingAllDoneSub => 'Hai completato le attività di oggi.';

  @override
  String greetingStreak30(int streak) {
    return 'Serie di $streak giorni — livello leggendario.';
  }

  @override
  String greetingStreak7(int streak) {
    return 'Serie di $streak giorni — continua così.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak giorni di fila. La maggior parte molla. Tu no.';
  }

  @override
  String get greetingMorning => 'Buongiorno. Nuovo giorno, nuova possibilità.';

  @override
  String get greetingAfternoon => 'Oggi è perfetto per iniziare la serie.';

  @override
  String get greetingEvening => 'Completa le attività, inizia la serie.';

  @override
  String get todayCompleted => 'Oggi completato ✓';

  @override
  String get todayGoals => 'Obiettivi di oggi';

  @override
  String get challengesLabel => 'Sfide';

  @override
  String get dailyChallengesLabel => 'SFIDE GIORNALIERE';

  @override
  String get expiresTonight => 'Scade stasera';

  @override
  String get allChallengesCompleted => 'Tutte completate ✓';

  @override
  String get challengesLoading => 'Nuove sfide in arrivo.';

  @override
  String get challengesLoadingTitle => 'Sfide giornaliere';

  @override
  String get behindPace => 'Sei in ritardo';

  @override
  String get growthTracking => 'Monitoraggio crescita';

  @override
  String get growthEmptyFirst => 'Registra la tua prima altezza.';

  @override
  String get growthEmptySecond => '2ª misurazione per il grafico.';

  @override
  String get growthSectionLabel => 'CRESCITA';

  @override
  String get generalPerformance => 'PRESTAZIONI GENERALI';

  @override
  String get exploreLabel => 'ESPLORA';

  @override
  String get explorePosture => 'Analisi posturale';

  @override
  String get explorePostureSub => 'Analisi e consigli postura';

  @override
  String get explorePhotos => 'Foto progressi';

  @override
  String get explorePhotosSub => 'Segui la trasformazione con foto';

  @override
  String get exploreNutrition => 'Nutrizione';

  @override
  String get exploreNutritionSub => 'Guida proteine, calcio e vitamine';

  @override
  String get exploreHealth => 'Salute';

  @override
  String get exploreHealthSub => 'Monitoraggio stress, caffeina e benessere';

  @override
  String get exploreRecipes => 'Ricette crescita';

  @override
  String get exploreRecipesSub => 'Ricette che supportano la crescita';

  @override
  String get educationLabel => 'FORMAZIONE';

  @override
  String get educationTitle => 'Scienza della\ncrescita';

  @override
  String get educationSubtitle => 'Contenuti esperti, ricerche e guide';

  @override
  String get aiAnalysisLabel => 'ANALISI IA';

  @override
  String get peerCompareLabel => 'CONFRONTA CON COETANEI';

  @override
  String peerCompareText(int topPct) {
    return 'Sei nel Top $topPct% dei tuoi coetanei';
  }

  @override
  String get notifWaterTitle => '💧 Non dimenticare di bere!';

  @override
  String get notifWaterBody => 'Obiettivo raggiunto? Un altro bicchiere!';

  @override
  String get notifMorningTitle => '🌅 Buongiorno! Allenamento';

  @override
  String get notifMorningBody => 'Stretching mattutino! 10 min.';

  @override
  String get notifRoutineTitle => '🔥 Completa le routine!';

  @override
  String get notifRoutineBody => 'Controlla prima di fine giornata.';

  @override
  String get notifProteinTitle => '🥚 Giorno proteine!';

  @override
  String get notifProteinBody => 'Settimana forte! Proteine ad ogni pasto.';

  @override
  String get notifNewWeekTitle => '✨ Nuova settimana!';

  @override
  String get notifNewWeekBody => 'Non saltare routine. Piccoli passi!';

  @override
  String get notifSleepTitle => '😴 Ora di dormire!';

  @override
  String get notifSleepBody =>
      'Ormone crescita massimo tra 22-2. Posa il telefono!';

  @override
  String get notifPostureTitle => '🧍 Postura!';

  @override
  String get notifPostureBody => 'Schiena dritta, spalle indietro. 2-3 cm!';

  @override
  String get notifVitaminDTitle => '☀️ Vitamina D!';

  @override
  String get notifVitaminDBody => '15 min di sole!';

  @override
  String get notifMidweekTitle => '✨ Metà settimana!';

  @override
  String get notifMidweekBody => 'Continua!';

  @override
  String get notifScreenTitle => '📵 Schermi spenti!';

  @override
  String get notifScreenBody => 'Niente schermi 1h prima di dormire.';

  @override
  String get notifJumpTitle => '🦘 Ora di saltare!';

  @override
  String get notifJumpBody => 'Salti stimolano placche crescita. 3 x 20!';

  @override
  String get notifCalciumTitle => '🥛 Calcio!';

  @override
  String get notifCalciumBody => 'Latte o yogurt. Calcio fondamentale!';

  @override
  String get notifPostureCheckTitle => '🧍 Postura!';

  @override
  String get notifPostureCheckBody => 'Non piegare il collo al telefono!';

  @override
  String get notifWeekendTitle => '✨ Motivazione weekend';

  @override
  String get notifWeekendBody => 'Non saltare routine nel weekend!';

  @override
  String get notifWeeklyProgressTitle => '📊 Progresso settimanale';

  @override
  String get notifWeeklyProgressBody => 'Controlla il grafico!';

  @override
  String get notifMeasureTitle => '📏 Misurazione settimanale!';

  @override
  String get notifMeasureBody => 'Misura e registra! Mattina più accurata.';

  @override
  String get notifEarlySleepTitle => '😴 A letto presto!';

  @override
  String get notifEarlySleepBody => 'Domani lunedì! Almeno 8 ore.';

  @override
  String get notifStreak3Title => '🔥 Serie di 3 giorni!';

  @override
  String get notifStreak3Body => 'Ottimo! Continua fino a 7!';

  @override
  String get notifStreak7Title => '🏆 1 settimana!';

  @override
  String get notifStreak7Body => 'Incredibile! 7 giorni!';

  @override
  String get notifStreak14Title => '⭐ 2 settimane!';

  @override
  String get notifStreak14Body => '14 giorni disciplina!';

  @override
  String get notifStreak30Title => '👑 1 mese!';

  @override
  String get notifStreak30Body => '30 giorni! Sei campione!';

  @override
  String get notifStreak60Title => '🌟 60 giorni!';

  @override
  String get notifStreak60Body => '60 giorni! Traguardo incredibile.';

  @override
  String get notifStreak100Title => '💎 100 GIORNI! LEGGENDARIO!';

  @override
  String get notifStreak100Body => '100 giorni! Sei una leggenda.';

  @override
  String get notifStreakRiskTitle => '⚠️ Non perdere la serie!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'La serie di $streak giorni è a rischio!';
  }

  @override
  String get paywallStat1 => 'cm — potenziale bloccato';

  @override
  String get paywallTitle1 => 'Quanti cm puoi\ncrescere?';

  @override
  String get paywallBullet1a => 'Tetto genetico calcolato, vederlo?';

  @override
  String get paywallBullet1b => 'Come influisce il tuo stile di vita?';

  @override
  String get paywallBullet1c => 'La tua roadmap aspetta';

  @override
  String get paywallStat2 => 'routine personalizzata pronta';

  @override
  String get paywallTitle2 => 'Il tuo piano\nè pronto';

  @override
  String get paywallBullet2a => '8 min ogni mattina';

  @override
  String get paywallBullet2b => 'Sonno, nutrizione, acqua — tutto monitorato';

  @override
  String get paywallBullet2c => 'Un passo avanti ogni giorno';

  @override
  String get paywallStat3 => 'grafici in tempo reale';

  @override
  String get paywallTitle3 => 'Monitora la\ncrescita';

  @override
  String get paywallBullet3a => 'Misurazioni mensili';

  @override
  String get paywallBullet3b => '2 cm ora con analisi posturale';

  @override
  String get paywallBullet3c => 'Foto progressi — vedrai la differenza';

  @override
  String get paywallStat4 => 'programma giornaliero — sali';

  @override
  String get paywallTitle4 => 'Più forte\nogni giorno';

  @override
  String get paywallBullet4a => 'XP, livelli — abitudini = gioco';

  @override
  String get paywallBullet4b =>
      'Chi ha raggiunto l\'obiettivo è passato da qui';

  @override
  String get paywallBullet4c => 'Inizia — prima settimana gratuita';

  @override
  String get paywallRestore => 'Nessun acquisto trovato';

  @override
  String get paywallRestoreNotFound => 'Nessun acquisto trovato';

  @override
  String get paywallRestoreLabel => 'Ripristina acquisti';

  @override
  String get paywallYearly => 'Annuale';

  @override
  String get paywallBestValue => 'Miglior valore';

  @override
  String get paywallMonthly => 'Mensile';

  @override
  String get paywallFreeTrial => '3 giorni gratis';

  @override
  String get paywallLoadError => 'Impossibile caricare, riprova';

  @override
  String get paywallCta => 'Prova gratuita';

  @override
  String get paywallCtaAlt => 'Continua';

  @override
  String get paywallTrialDisclaimer =>
      '3 giorni gratis · rinnovo auto · cancella quando vuoi';

  @override
  String get paywallYearlyDisclaimer =>
      'Rinnovo annuale auto · cancella quando vuoi';

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
  String get criticalWindow => 'CRITICAL WINDOW';

  @override
  String get heightPotentialFading => 'Your height potential';

  @override
  String get fadingAway => 'is fading away!';

  @override
  String get painHookDesc =>
      'Every passing day, centimeters are permanently lost without the right habits. But this can still be reversed.';

  @override
  String get painGeneticTitle => 'Genetics isn\'t everything';

  @override
  String get painGeneticDesc =>
      'Genetics determines 60% — but what you do determines the other 40%. BeTaller is here for exactly that 40%.';

  @override
  String get painGeneticTag => 'Analysis';

  @override
  String get painSleepTitle => 'Optimize your sleep routine';

  @override
  String get painSleepDesc =>
      'Proper sleep every night can boost growth hormone production by 70%. BeTaller automates sleep tracking, you just sleep.';

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
      'A scientifically proven program will\ntake you to your goal step by step.';

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
}
