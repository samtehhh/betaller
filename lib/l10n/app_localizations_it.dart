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
  String get noData => 'Nessun dato';

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
}
