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
  String get routineSprintIntervals => 'Sprint Interval Training';

  @override
  String get routineSprintIntervalsDesc =>
      'Sprint interval training triggers significant growth hormone release through high-intensity bursts.';

  @override
  String get routineHiitWorkout => 'HIIT Workout';

  @override
  String get routineHiitWorkoutDesc =>
      'High intensity interval training to maximize growth hormone release.';

  @override
  String get routineSquats => 'Bodyweight Squats';

  @override
  String get routineSquatsDesc =>
      'Bodyweight squats stimulate growth plates in legs and spine.';

  @override
  String get routineDeadliftStretch => 'Deadlift Stretch';

  @override
  String get routineDeadliftStretchDesc =>
      'Deadlift stretch for spinal decompression and vertebral disc health.';

  @override
  String get routineOverheadPress => 'Overhead Press';

  @override
  String get routineOverheadPressDesc =>
      'Overhead pressing stretches the spine and strengthens posture muscles.';

  @override
  String get routineSkippingRope => 'Skipping Rope';

  @override
  String get routineSkippingRopeDesc =>
      'Repetitive jumping with a skipping rope stimulates growth plates in lower extremities.';

  @override
  String get routinePilatesCore => 'Pilates Core';

  @override
  String get routinePilatesCoreDesc =>
      'Pilates core exercises support spinal alignment and posture.';

  @override
  String get routineInversionHang => 'Inversion Hanging';

  @override
  String get routineInversionHangDesc =>
      'Inversion decompresses spinal discs, can temporarily add 1-2cm.';

  @override
  String get routineZincIntake => 'Zinc Rich Foods';

  @override
  String get routineZincIntakeDesc =>
      'Consume zinc-rich foods throughout the day for growth hormone production.';

  @override
  String get routineVitaminDSunlight => 'Vitamin D & Sunlight';

  @override
  String get routineVitaminDSunlightDesc =>
      'Get at least 15 minutes of direct sunlight for Vitamin D synthesis and bone growth.';

  @override
  String get routineArginineFoods => 'Arginine Rich Foods';

  @override
  String get routineArginineFoodsDesc =>
      'Eat arginine-rich foods to stimulate growth hormone secretion.';

  @override
  String get routineSleepEnvironment => 'Optimize Sleep Environment';

  @override
  String get routineSleepEnvironmentDesc =>
      'Create a dark, cool sleeping environment to maximize melatonin and growth hormone release.';

  @override
  String get routinePreSleepRoutine => 'Pre-Sleep Wind Down';

  @override
  String get routinePreSleepRoutineDesc =>
      'A consistent pre-sleep routine improves deep sleep quality by 23%.';

  @override
  String get routineNeckStretches => 'Neck Stretches';

  @override
  String get routineNeckStretchesDesc =>
      'Neck stretches relieve compression and improve cervical alignment.';

  @override
  String get routineShoulderRolls => 'Shoulder Rolls & Opens';

  @override
  String get routineShoulderRollsDesc =>
      'Opening shoulders corrects forward posture, can add 1-2cm in appearance.';

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
  String get durationNight => 'Night';

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
}
