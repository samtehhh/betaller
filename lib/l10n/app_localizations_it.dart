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
  String get disciplineTitle => 'Disciplina';

  @override
  String get disciplineProgramTitle => 'Programma di disciplina';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total giorni';
  }

  @override
  String get disciplineCompleteDay => 'Completa la giornata';

  @override
  String disciplineDayN(int n) {
    return 'Giorno $n';
  }

  @override
  String get disciplineLevels => 'Livelli';

  @override
  String get disciplineLevelDone => 'Fatto';

  @override
  String get disciplineLocked => 'Bloccato';

  @override
  String get disciplineTodayIs => 'Oggi';

  @override
  String get disciplineToday => 'Oggi';

  @override
  String get disciplineTodayPlan => 'Piano di oggi';

  @override
  String get disciplineWeek => 'Questa settimana';

  @override
  String get disciplineMonth => 'Questo mese';

  @override
  String get disciplineLevel => 'Livello di disciplina';

  @override
  String disciplineStreakDays(int days) {
    return '$days giorni di fila';
  }

  @override
  String disciplineToNext(int days) {
    return '$days giorni al prossimo livello';
  }

  @override
  String get disciplineMaxTier => 'Livello massimo raggiunto';

  @override
  String get disciplineTierSpark => 'Scintilla';

  @override
  String get disciplineTierSteady => 'Costante';

  @override
  String get disciplineTierSharp => 'Affilato';

  @override
  String get disciplineTierSolid => 'Solido';

  @override
  String get disciplineTierRelentless => 'Instancabile';

  @override
  String get disciplineTierUnbroken => 'Indomabile';

  @override
  String get disciplineTierLegend => 'Leggenda';

  @override
  String get goalPerfectDays => 'Giorni in cui hai completato il piano';

  @override
  String get goalWorkouts => 'Sessioni di allenamento';

  @override
  String get goalMeasurement => 'Misurazione dell\'altezza';

  @override
  String get goalPhoto => 'Foto dei progressi';

  @override
  String get goalPostureCheck => 'Controllo della postura';

  @override
  String get disciplineAllDone => 'Giornata completata';

  @override
  String disciplineDayProgress(int done, int total) {
    return '$done/$total completato';
  }

  @override
  String get navProgress => 'Progressi';

  @override
  String get trackingSection => 'I tuoi strumenti di monitoraggio';

  @override
  String get photosBenefit =>
      'Prima e dopo, fianco a fianco. Vedi il cambiamento invece di leggerlo.';

  @override
  String get postureBenefit =>
      'Cifosi, lordosi e posizione della testa. Solo una buona postura vale 2-3 cm.';

  @override
  String get reportBenefit =>
      'Valuta la tua settimana giorno per giorno e scopri dove hai perso il ritmo.';

  @override
  String get photosCta => 'Aggiungi una foto';

  @override
  String get postureCta => 'Analizza';

  @override
  String get reportCta => 'Apri il report';

  @override
  String get toolStateReady => 'Pronto';

  @override
  String get photosSummaryEmpty => 'Aggiungi la tua prima foto';

  @override
  String photosSummaryCount(int count) {
    return '$count foto';
  }

  @override
  String get postureSummaryEmpty => 'Ancora nessuna analisi';

  @override
  String postureSummaryScore(int score) {
    return '$score/100 postura';
  }

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
  String get waterGoalReached => 'Obiettivo giornaliero raggiunto';

  @override
  String waterRemaining(String amount) {
    return 'Mancano $amount L';
  }

  @override
  String get undo => 'Annulla';

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
  String get bodyFactsTitle => 'Il tuo corpo';

  @override
  String get dailyNeedsTitle => 'I tuoi obiettivi giornalieri';

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
  String get growthRemaining => 'Ancora davanti a te';

  @override
  String get growthBreakdown => 'Da dove vengono questi centimetri';

  @override
  String get geneticGainLabel => 'Guadagno Genetico';

  @override
  String get lifestyleLabel => 'Stile di Vita';

  @override
  String get geneticCeilingLabel => 'Massimo';

  @override
  String get reachableTargetHeight => 'La tua altezza obiettivo raggiungibile';

  @override
  String get geneticCeilingProgress => 'Progresso verso il limite genetico';

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
  String get reminderNextLabel => 'Prossimo promemoria';

  @override
  String get reminderManageHint => 'Gestisci i tuoi promemoria';

  @override
  String get reminderOffCta => 'Attiva le notifiche';

  @override
  String get stateOn => 'Attivo';

  @override
  String get stateOff => 'Disattivo';

  @override
  String get reminderMasterTitle => 'Notifiche';

  @override
  String reminderActiveCount(int count) {
    return '$count promemoria attivi';
  }

  @override
  String get reminderBuiltIn => 'Promemoria integrati';

  @override
  String get reminderYourOwn => 'I tuoi promemoria';

  @override
  String get reminderAdd => 'Aggiungi promemoria';

  @override
  String get reminderDays => 'Giorni';

  @override
  String get reminderEveryDay => 'Ogni giorno';

  @override
  String get reminderLabelHint => 'Di cosa vuoi che ti ricordiamo?';

  @override
  String get reminderEmptyHint =>
      'Aggiungi il tuo: allenamento, vitamine, stretching, ciò che ti serve.';

  @override
  String get reminderCustom => 'Promemoria';

  @override
  String get reminderCustomBody => 'È arrivata l\'ora che hai impostato.';

  @override
  String get reminderExercise => 'Esercizio';

  @override
  String get reminderNutrition => 'Alimentazione';

  @override
  String get reminderWater => 'Acqua';

  @override
  String get reminderPosture => 'Postura';

  @override
  String get reminderRoutine => 'Routine giornaliera';

  @override
  String get reminderSleep => 'Sonno';

  @override
  String get reminderMeasurement => 'Misurazione dell\'altezza';

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
      'Ho scoperto il mio potenziale di crescita con BeTaller! Provalo anche tu: https://apps.apple.com/app/id6761445065';

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
  String get profileGroupSupport => 'Supporto';

  @override
  String get profileGroupAccount => 'Account';

  @override
  String get profileGroupApp => 'App';

  @override
  String get profileGroupDanger => 'Zona pericolosa';

  @override
  String profileMemberSince(String date) {
    return 'Dal $date';
  }

  @override
  String get profileYourJourney => 'Il tuo percorso';

  @override
  String get profileTotalGrowth => 'Totale';

  @override
  String get currentStreak => 'Serie Attuale';

  @override
  String get bestStreakLabel => 'Miglior Serie';

  @override
  String get achievementLabel => 'Traguardo';

  @override
  String get achievements => 'Traguardi';

  @override
  String get achievementUnlockedTitle => '🏆 Obiettivo sbloccato!';

  @override
  String get reminderTapHint =>
      'Tocca un promemoria per cambiarne ora e giorni';

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
  String get analysisDataReceivedTitle => 'Dati ricevuti';

  @override
  String get analysisDataReceivedSubtitle => 'La tua analisi sta iniziando...';

  @override
  String get yourScore => 'Il Tuo Punteggio BeTaller';

  @override
  String get letsStart => 'Iniziamo';

  @override
  String get splashJourneySubtitle => 'Il tuo viaggio comincia. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Il tuo piano personalizzato è pronto.\nPronto a scoprire il tuo potenziale di altezza?';

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
  String get routineDailyCalories => 'Obiettivo calorico giornaliero';

  @override
  String get routineDailyCaloriesDesc =>
      'Raggiungi il tuo obiettivo calorico giornaliero — mangiare troppo poco rallenta la crescita.';

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
  String get achieveCommitment => 'Determinazione';

  @override
  String get achieveCommitmentDesc =>
      'Inserisci tutti i tuoi dati, esplora completamente l\'app e inizia a usarla';

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
  String get obPastHeightsTitle => 'Altezze Passate';

  @override
  String get obPastHeightsSubPart1 =>
      'Inserisci le tue altezze passate per aumentare la fiducia della previsione al ';

  @override
  String get obPastHeightsSubPart2 => ' in più.';

  @override
  String obHowTallAtAge(String age) {
    return 'Quanto eri alto/a a $age anni?';
  }

  @override
  String get obSkip => 'Salta';

  @override
  String get obNext => 'Avanti';

  @override
  String get obSkipAll => 'Salta tutto';

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
  String get sectionSupplements => 'Integratori';

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
  String get weeklyScoreLabel => 'Punteggio settimanale';

  @override
  String get weeklyDailyCompletion => 'Giorno per giorno';

  @override
  String get weeklyHabits => 'Abitudini';

  @override
  String get overview => 'Panoramica';

  @override
  String get routinesLabel => 'Routine';

  @override
  String get streakLabel => 'Serie';

  @override
  String get heightLabel => 'Altezza';

  @override
  String get weightLabel => 'Peso';

  @override
  String get dadLabel => 'Papà';

  @override
  String get motherLabel => 'Mamma';

  @override
  String get metricShort => 'Metrico';

  @override
  String get imperialShort => 'Imperiale';

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
  String get bellCurveCaption => 'Come è distribuita l\'altezza alla tua età';

  @override
  String get bellShorterThanYou => 'più bassi di te';

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
  String photoGainInDays(String cm, int days) {
    return '$cm cm in $days giorni';
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
  String get recipeDiffEasy => 'Facile';

  @override
  String get recipeDiffMedium => 'Media';

  @override
  String get recipeDiffHard => 'Difficile';

  @override
  String get recipesFilterType => 'TIPO';

  @override
  String get recipesFilterNutrient => 'RICCO DI';

  @override
  String get recipesGoalVitaminD => 'Vitamina D';

  @override
  String get recipesGoalZinc => 'Zinco';

  @override
  String get recipesGoalMagnesium => 'Magnesio';

  @override
  String recipesCountLabel(int count) {
    return '$count ricette';
  }

  @override
  String get recipeIngredients => 'Ingredienti';

  @override
  String get recipeSteps => 'Preparazione';

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
  String get formDailyCalories =>
      'Distribuisci le calorie su 3-5 pasti e non saltare la colazione. Preferisci cibi integrali alle calorie vuote.';

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
  String get sciDailyCalories =>
      'Un deficit calorico prolungato abbassa l\'IGF-1 e indebolisce i picchi dell\'ormone della crescita, rallentando direttamente la crescita lineare durante l\'adolescenza';

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
  String get kyphosisLabel => 'Cifosi (schiena alta)';

  @override
  String get lordosisLabel => 'Lordosi (schiena bassa)';

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
  String routineProteinAmountDesc(int grams) {
    return 'Assumi oggi almeno ${grams}g di proteine — calcolato in base al tuo peso.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'Bevi oggi almeno ${liters}L di acqua — calcolato in base al tuo peso.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'Punta oggi a circa $kcal kcal per sostenere la crescita.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'Assumi oggi $iu UI di vitamina D — tramite sole, cibo o un integratore.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'Assumi oggi ${mg}mg di zinco per sostenere la produzione dell\'ormone della crescita.';
  }

  @override
  String get nutritionSupplementsTitle => 'INTEGRATORI';

  @override
  String get nutritionSupplementsDisclaimer =>
      'Un supporto facoltativo, non un sostituto del cibo. Parla con un medico prima di iniziare qualsiasi integratore, soprattutto se sei minorenne.';

  @override
  String get supplementVitaminDName => 'Vitamina D3';

  @override
  String get supplementVitaminDDose => '3.000 UI';

  @override
  String get supplementVitaminDBenefit =>
      'Migliora l\'assorbimento del calcio per la densità ossea e la salute delle cartilagini di accrescimento';

  @override
  String get supplementZincName => 'Zinco';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit =>
      'Un minerale chiave per la produzione dell\'ormone della crescita';

  @override
  String get supplementMagnesiumName => 'Magnesio';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit =>
      'Favorisce la fase di sonno profondo, quando viene rilasciato più ormone della crescita';

  @override
  String get supplementCalciumName => 'Calcio';

  @override
  String get supplementCalciumDose => '1.000-1.300mg';

  @override
  String get supplementCalciumBenefit =>
      'L\'elemento fondamentale per la densità ossea e le cartilagini di accrescimento';

  @override
  String get supplementOmega3Name => 'Omega-3';

  @override
  String get supplementOmega3Dose => '1.000mg';

  @override
  String get supplementOmega3Benefit =>
      'Riduce l\'infiammazione e favorisce il corretto funzionamento delle cartilagini di accrescimento';

  @override
  String get supplementCollagenName => 'Collagene + Vitamina C';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit =>
      'La vitamina C aiuta il tuo corpo a usare il collagene per costruire cartilagine e matrice ossea';

  @override
  String get sciSourcePrefix => 'Source: ';

  @override
  String get program => 'Programma';

  @override
  String get todaysExercises => 'ESERCIZI DI OGGI';

  @override
  String get dailyNutritionPlan => 'PIANO NUTRIZIONALE GIORNALIERO';

  @override
  String get nutritionGoalsComplete =>
      '🎉 Tutti gli obiettivi nutrizionali completati!';

  @override
  String get nutritionGoalsIncomplete =>
      'Completa i tuoi obiettivi nutrizionali per una crescita ottimale';

  @override
  String get postureDetectingAlignment =>
      'Rilevamento dell\'allineamento della colonna...';

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
  String get analysisBalance => 'Il tuo equilibrio';

  @override
  String get analysisWeakest => 'Il tuo punto debole';

  @override
  String get analysisPrediction => 'Previsione dell\'altezza';

  @override
  String get analysisComparison => 'Confronto';

  @override
  String get analysisGrowth => 'Stato della crescita';

  @override
  String get analysisWeakestHint =>
      'Qui puoi migliorare il tuo punteggio più rapidamente.';

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
  String get paywallPromoCode => 'Hai un codice promozionale?';

  @override
  String get paywallHeightUnit => 'altezza obiettivo';

  @override
  String get paywallHeightTitle => 'Quanti cm puoi ancora crescere?';

  @override
  String get paywallHeightDesc =>
      'Analizziamo genetica, stile di vita e postura insieme e tracciamo la previsione anno per anno. Nulla è fisso: ogni passo la aggiorna.';

  @override
  String get paywallGrowthUnit => 'quest’anno';

  @override
  String get paywallGrowthTitle => 'Seguiamo la tua crescita con te';

  @override
  String get paywallGrowthDesc =>
      'Ogni misura entra subito nel grafico. Vedi i progressi mese dopo mese, centimetro dopo centimetro.';

  @override
  String get paywallPostureUnit => 'punteggio postura';

  @override
  String get paywallPostureTitle => 'La postura è la chiave delle tue routine';

  @override
  String get paywallPostureDesc =>
      'Una foto misura cifosi, lordosi e posizione della testa, e ricevi routine di correzione su misura. Una buona postura vale già 2-3 cm.';

  @override
  String get paywallReportUnit => 'routine completate';

  @override
  String get paywallReportTitle => 'Ti valutiamo ogni settimana';

  @override
  String get paywallReportDesc =>
      'Acqua, sonno, routine e serie in una sola schermata. Ogni settimana troviamo i tuoi punti forti e le lacune.';

  @override
  String get paywallNutritionUnit => 'pasti al giorno';

  @override
  String get paywallNutritionTitle => 'Il tuo piano alimentare è pronto';

  @override
  String get paywallNutritionDesc =>
      'Dalla colazione alla cena, un piano giornaliero completo con proteine, calcio, zinco e vitamina D già calcolati.';

  @override
  String get paywallScoreUnit => 'Punteggio BeTaller';

  @override
  String get paywallScoreTitle => 'Il sistema che ti spinge sempre avanti';

  @override
  String get paywallScoreDesc =>
      'Genetica, crescita, alimentazione, sonno e disciplina si uniscono in un solo punteggio. Appena scende, vedi dove migliorare.';

  @override
  String get paywallPhotosUnit => 'differenza visibile';

  @override
  String get paywallPhotosTitle => 'Dimostra il cambiamento con le foto';

  @override
  String get paywallPhotosDesc =>
      'I confronti prima/dopo si creano da soli e la foto di ogni mese resta sulla tua timeline.';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => 'Partiamo in tre passi';

  @override
  String get journeyIntroSubtitle =>
      'Configuriamo BeTaller insieme. Il prossimo passo ti aspetta.';

  @override
  String get journeyStep1Title => 'Raccolta dei tuoi dati';

  @override
  String get journeyStep1Desc =>
      'Prendiamo altezza, età e stile di vita e calcoliamo il tuo potenziale.';

  @override
  String get journeyStep2Title => 'Tour dell’app';

  @override
  String get journeyStep2Desc =>
      'Passiamo in rassegna ogni funzione: a cosa serve e come si usa.';

  @override
  String get journeyStep3Title => 'Uso quotidiano';

  @override
  String get journeyStep3Desc =>
      'Porti avanti la tua routine e noi seguiamo i tuoi progressi.';

  @override
  String get journeyNow => 'ORA';

  @override
  String get journeyDone => 'FATTO';

  @override
  String get journeySoon => 'PRESTO';

  @override
  String get tourHomeStreakTitle => 'La Tua Serie';

  @override
  String get tourHomeStreakDesc =>
      'Cresce finché mantieni la disciplina — salta un giorno e si azzera.';

  @override
  String get tourHomeXpTitle => 'Il Tuo Livello';

  @override
  String get tourHomeXpDesc =>
      'Sale con l\'XP che guadagni restando disciplinato. Non deragliare!';

  @override
  String get tourHomeGoalsTitle => 'Obiettivi di Oggi';

  @override
  String get tourHomeGoalsDesc =>
      'Mostra le tue routine, i compiti e l\'obiettivo d\'acqua del giorno in un colpo d\'occhio.';

  @override
  String get tourHomeTrackTitle => 'Monitoraggio Acqua e Sonno';

  @override
  String get tourHomeTrackDesc =>
      'Registra qui la tua acqua e il tuo sonno giornalieri, in pochi secondi.';

  @override
  String get tourPlanTabsTitle => 'Tre Schede: Oggi, Disciplina, Nutrizione';

  @override
  String get tourPlanTabsDesc =>
      'La tua routine quotidiana, il tuo programma settimanale e il tuo piano nutrizionale sono tutti qui.';

  @override
  String get tourPlanLevelTitle => 'Il Tuo Livello di Disciplina';

  @override
  String get tourPlanLevelDesc =>
      'Mostra quanto costantemente completi le tue routine. Sali di livello per risultati migliori.';

  @override
  String get tourPlanTodayTitle => 'Il Piano di Oggi';

  @override
  String get tourPlanTodayDesc =>
      'Spunta qui le tue routine quotidiane per far crescere la tua serie.';

  @override
  String get tourPlanTodayListTitle => 'Le Tue Routine di Oggi';

  @override
  String get tourPlanTodayListDesc =>
      'Spuntale man mano che le fai — tocca una routine per i dettagli.';

  @override
  String get tourPlanWeekGoalsTitle => 'Questa Settimana';

  @override
  String get tourPlanWeekGoalsDesc =>
      'Giorni perfetti, allenamenti e la misurazione richiesta questa settimana, compresa quella obbligatoria.';

  @override
  String get tourPlanMonthGoalsTitle => 'Questo Mese';

  @override
  String get tourPlanMonthGoalsDesc =>
      'Foto dei progressi, controllo della postura e le misurazioni di questo mese — quelle da non saltare.';

  @override
  String get tourProgressHeightTitle => 'La Tua Altezza Attuale';

  @override
  String get tourProgressHeightDesc =>
      'Mostra la tua altezza attuale e il tuo guadagno totale. Aggiungi una nuova misurazione da qui.';

  @override
  String get tourProgressPhotosTitle => 'Foto dei Progressi';

  @override
  String get tourProgressPhotosDesc =>
      'Segui la tua trasformazione visivamente con foto scattate regolarmente.';

  @override
  String get tourProgressPostureTitle => 'Analisi della Postura';

  @override
  String get tourProgressPostureDesc =>
      'Fai analizzare la tua postura da una foto e scopri su cosa lavorare.';

  @override
  String get tourAnalysisScoreTitle => 'Il Tuo Punteggio BeTaller';

  @override
  String get tourAnalysisScoreDesc =>
      'Il tuo punteggio complessivo, calcolato da genetica, velocità, nutrizione e sonno.';

  @override
  String get tourAnalysisPredictionTitle => 'La Tua Previsione di Altezza';

  @override
  String get tourAnalysisPredictionDesc =>
      'Mostra la tua altezza finale prevista e il tuo andamento anno per anno.';

  @override
  String get tourAnalysisPeerTitle => 'Confrontati con i Tuoi Coetanei';

  @override
  String get tourAnalysisPeerDesc =>
      'Guarda la tua posizione in classifica e confrontati con altri della tua età.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'Le Tue Routine';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'Guarda quante routine di esercizio devi ancora completare oggi.';

  @override
  String get tourHomeGoalsChallengesTitle => 'I Tuoi Compiti';

  @override
  String get tourHomeGoalsChallengesDesc =>
      'Segui l\'avanzamento delle tue sfide attive proprio qui.';

  @override
  String get tourHomeGoalsWaterTitle => 'Il Tuo Obiettivo Acqua';

  @override
  String get tourHomeGoalsWaterDesc =>
      'Guarda quanto sei vicino al tuo obiettivo giornaliero di acqua.';

  @override
  String get tourHomeReminderTitle => 'Il Tuo Prossimo Promemoria';

  @override
  String get tourHomeReminderDesc =>
      'Guarda quando arriva il tuo prossimo promemoria e modificalo da qui.';

  @override
  String get tourHomeChallengesTitle => 'Le Tue Sfide';

  @override
  String get tourHomeChallengesDesc =>
      'Completa le sfide attive per guadagnare XP extra.';

  @override
  String get tourHomeGrowthTitle => 'Il Tuo Stato di Crescita';

  @override
  String get tourHomeGrowthDesc =>
      'Guarda la differenza tra la tua misurazione totale e quella più recente, e quante ne hai registrate.';

  @override
  String get tourHomeExploreTitle => 'Esplora';

  @override
  String get tourHomeExploreDesc =>
      'Guide nutrizionali, ricette per la crescita e altro ti aspettano qui.';

  @override
  String get tourPlanProgramHeaderTitle => 'Il Tuo Programma di 70 Giorni';

  @override
  String get tourPlanProgramHeaderDesc =>
      'Guarda i tuoi progressi complessivi, il tuo livello attuale e il giorno in questo anello.';

  @override
  String get tourPlanProgramLevelsTitle => 'Livelli';

  @override
  String get tourPlanProgramLevelsDesc =>
      'Guarda a quale dei 10 livelli sei arrivato e quali sono ancora bloccati.';

  @override
  String get tourPlanNutritionHeaderTitle => 'I Tuoi Progressi Nutrizionali';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'Segui quante delle tue routine nutrizionali giornaliere hai completato.';

  @override
  String get tourPlanNutritionFirstTitle => 'Routine Nutrizionali';

  @override
  String get tourPlanNutritionFirstDesc =>
      'Spunta le abitudini nutrizionali che supportano la tua crescita.';

  @override
  String get tourProgressChartTitle => 'Curva di Crescita';

  @override
  String get tourProgressChartDesc =>
      'Guarda le tue misurazioni passate su un grafico e capisci dove stai andando.';

  @override
  String get tourProgressReportTitle => 'Report Settimanale';

  @override
  String get tourProgressReportDesc =>
      'Consulta il report che riassume i progressi della tua settimana.';

  @override
  String get tourProgressHistoryTitle => 'La Tua Cronologia Misurazioni';

  @override
  String get tourProgressHistoryDesc =>
      'Guarda ogni misurazione di altezza registrata su una timeline.';

  @override
  String get tourAnalysisRadarTitle => 'Il Tuo Grafico di Equilibrio';

  @override
  String get tourAnalysisRadarDesc =>
      'Guarda il tuo equilibrio tra genetica, velocità di crescita, nutrizione, sonno e disciplina in un grafico radar, e scopri il tuo punto debole.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'I Tuoi Bisogni Giornalieri';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'Guarda il tuo fabbisogno giornaliero di proteine, calorie, sonno e acqua, calibrato sulla tua altezza e peso.';

  @override
  String get journeyDataDoneTitle => 'Primo passo completato';

  @override
  String get journeyDataDoneSubtitle =>
      'Abbiamo i tuoi dati e il tuo potenziale. Ora tocca al tour dell’app.';

  @override
  String get journeyContinue => 'Continua';

  @override
  String get journeyEnterApp => 'Entra nell’app';

  @override
  String get journeyProgressLabel => 'Avvio';

  @override
  String get journeyTourDoneTitle => 'Benvenuto su BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'Hai completato tutti e tre i passaggi. Ora tocca a te — inizia il tuo percorso completando la tua prima routine.';

  @override
  String get journeyViewPlansButton => 'Vedi i piani per iniziare';

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
  String get introTag1 => 'PREVISIONE';

  @override
  String get introTag2 => 'CRESCITA';

  @override
  String get introTag3 => 'MONITORAGGIO';

  @override
  String get introTag4 => 'GAMIFICATION';

  @override
  String get introTag5 => 'COMUNITÀ';

  @override
  String get introTitle1 => 'Scopri il tuo\npotenziale di altezza';

  @override
  String get introSubtitle1 =>
      'Calcoliamo il tuo pieno potenziale\nin base a genetica, età e stile di vita.';

  @override
  String get introTitle2 => 'Un centimetro in più\nogni giorno';

  @override
  String get introSubtitle2 =>
      'Sfrutta il tuo potenziale con piani\npersonalizzati di esercizio e alimentazione.';

  @override
  String get introTitle3 => 'Monitora ogni\ncentimetro';

  @override
  String get introSubtitle3 =>
      'Guarda come si sviluppano i tuoi\nprogressi reali con misurazioni mensili.';

  @override
  String get introTitle4 => 'Sali di livello,\nguadagna premi';

  @override
  String get introSubtitle4 =>
      'Completa programmi di 70 giorni,\nguadagna XP e sblocca nuovi livelli.';

  @override
  String get introTitle5 => 'Migliaia sono già\ncresciuti';

  @override
  String get introSubtitle5 =>
      'Unisciti alla community di utenti\nche hanno raggiunto il loro obiettivo.';

  @override
  String get criticalWindow => 'FINESTRA CRITICA';

  @override
  String get heightPotentialFading => 'I fatti sul tuo';

  @override
  String get fadingAway => 'potenziale di altezza..';

  @override
  String get painHookDesc =>
      'Ogni giorno che passa senza le giuste abitudini, si perdono centimetri in modo permanente. Ma si può ancora invertire la rotta.';

  @override
  String get painGeneticTitle => 'La genetica non è tutto';

  @override
  String get painGeneticDesc =>
      'La genetica determina il 60% — il restante 40% lo determini tu. BeTaller è qui esattamente per quel 40%.';

  @override
  String get painGeneticTag => 'Analisi';

  @override
  String get painSleepTitle => 'Ottimizza la tua routine del sonno';

  @override
  String get painSleepDesc =>
      'Dormire bene ogni notte può aumentare la produzione dell\'ormone della crescita del 70%. BeTaller automatizza il monitoraggio del sonno, tu devi solo dormire.';

  @override
  String get painSleepTag => 'Monitoraggio';

  @override
  String get painPostureTitle => 'Guadagna centimetri subito con la postura';

  @override
  String get painPostureDesc =>
      'Una postura corretta può aggiungere istantaneamente 1,5-3 cm. La routine posturale quotidiana di BeTaller la stabilizza in poche settimane.';

  @override
  String get painPostureTag => 'Postura';

  @override
  String get painExerciseTitle => 'Il tuo piano di esercizi su misura è pronto';

  @override
  String get painExerciseDesc =>
      'Stretching mattutino, sospensioni, esercizi per la colonna — BeTaller li ha preparati e programmati per te. Solo 8-12 minuti al giorno.';

  @override
  String get painExerciseTag => 'Routine';

  @override
  String get painNutritionTitle =>
      'La tua alimentazione influisce direttamente sulla crescita';

  @override
  String get painNutritionDesc =>
      'Proteine, calcio, vitamina D — BeTaller ti ricorda ogni giorno quali nutrienti assumere e quando.';

  @override
  String get painNutritionTag => 'Alimentazione';

  @override
  String get painTrackingTitle => 'Monitora la tua crescita con i tuoi occhi';

  @override
  String get painTrackingDesc =>
      'Misurazioni mensili, foto dei progressi, grafico di crescita — vedi ogni centimetro guadagnato.';

  @override
  String get painTrackingTag => 'Progressi';

  @override
  String get selectYourGender => 'Seleziona il tuo genere';

  @override
  String get onboardingPredictSubtitle =>
      'Verrà usato per prevedere il tuo potenziale di altezza e creare il tuo piano personalizzato.';

  @override
  String get other => 'Altro';

  @override
  String get whenWereYouBorn => 'Quando sei nato/a?';

  @override
  String get heightAndWeight => 'Altezza e peso';

  @override
  String get parentsHeight => 'Altezza dei genitori';

  @override
  String get weeklyWorkout => 'Allenamento settimanale';

  @override
  String get workoutsPerWeek => 'Allenamenti a settimana';

  @override
  String get whatsYourEthnicity => 'Qual è la tua etnia?';

  @override
  String get whiteCaucasian => 'Bianco / Caucasico';

  @override
  String get blackAfricanAmerican => 'Nero / Afroamericano';

  @override
  String get hispanicLatino => 'Ispanico / Latino';

  @override
  String get asian => 'Asiatico';

  @override
  String get middleEasternIndigenous => 'Medio Oriente / Indigeno';

  @override
  String get dontWantToAnswer => 'Preferisco non rispondere';

  @override
  String get footSizeLabel => 'Numero di scarpe';

  @override
  String get selectYourSize => 'Seleziona la tua taglia';

  @override
  String get whatsYourDreamHeight => 'Qual è la tua altezza ideale?';

  @override
  String get dreamHeightCalcSubtitle =>
      'In base ai tuoi dati, calcoleremo la probabilità di raggiungere questa altezza.';

  @override
  String get dreamHeightLabel => 'Altezza ideale';

  @override
  String get sleepQuestion => 'Quante ore dormi\nogni notte?';

  @override
  String get thousandsSucceeded => 'Migliaia ce\nl\'hanno già fatta';

  @override
  String get youCanToo => 'Puoi farcela anche tu';

  @override
  String get yearsOld => 'anni';

  @override
  String get verifiedLabel => 'Verificato';

  @override
  String get scientificData => 'DATI SCIENTIFICI';

  @override
  String get longTermResults => 'BeTaller crea\nrisultati a lungo termine';

  @override
  String get longTermResultsSubtitle =>
      'Molte persone non raggiungono la loro altezza massima a causa di cattive abitudini.';

  @override
  String get yourFinalHeight => 'La tua altezza finale';

  @override
  String get badHabitsLegend => 'Cattive abitudini';

  @override
  String get optimizedLegend => 'Ottimizzato';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'L\'altezza può cambiare\ncon le abitudini';

  @override
  String get chartFact2Pct => '9-10h';

  @override
  String get chartFact2Desc =>
      'Il sonno ideale aumenta\nl\'ormone della crescita';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Si possono guadagnare\nmigliorando la postura';

  @override
  String get didYouKnow => 'Lo sapevi?';

  @override
  String get didYouKnowFact1 =>
      'Le abitudini quotidiane influenzano il 30% della tua altezza';

  @override
  String get didYouKnowFact2 =>
      'La compressione della colonna ti fa perdere 1,5-3 cm di altezza';

  @override
  String get didYouKnowFact3 => 'La mancanza di sonno riduce l\'HGH del 70%';

  @override
  String get transformJourneyBegins => 'La tua trasformazione\ninizia ora';

  @override
  String get transformJourneySubtitle =>
      'Un programma completo pensato per sostenere\nla tua crescita sana, passo dopo passo.';

  @override
  String get week1Label => '1S';

  @override
  String get week1Title => 'Settimana 1';

  @override
  String get week1Desc =>
      'L\'allineamento della colonna migliora, la postura si corregge';

  @override
  String get month1Label => '1M';

  @override
  String get month1Title => 'Mese 1';

  @override
  String get month1Desc =>
      'Primi centimetri visibili, migliore qualità del sonno';

  @override
  String get month3Label => '3M';

  @override
  String get month3Title => 'Mese 3';

  @override
  String get month3Desc => 'Guadagno medio di +1,5–2,5 cm, sviluppo muscolare';

  @override
  String get month6Label => '6M';

  @override
  String get month6Title => 'Mese 6';

  @override
  String get month6Desc =>
      'Raggiungi il massimo potenziale, vivi con la tua nuova altezza';

  @override
  String get reachYourGoal => 'Raggiungi il tuo obiettivo';

  @override
  String get journeyBullet1 => 'Sblocca il tuo massimo potenziale';

  @override
  String get journeyBullet2 => 'Inizia a vivere con la tua nuova altezza';

  @override
  String get journeyBullet3 => 'Scrivi la tua storia di successo';

  @override
  String get unlockButton => 'Sblocca tutto';

  @override
  String get dreamHeightOdds => 'Probabilità della tua\naltezza ideale';

  @override
  String get growthCompleteLabel => 'Crescita\ncompletata';

  @override
  String get tallerThanPct => 'Più alto del 76,7% alla tua età';

  @override
  String get levelNovice => 'Novizio';

  @override
  String get levelBuilder => 'Costruttore';

  @override
  String get levelGrinder => 'Instancabile';

  @override
  String get levelWarrior => 'Guerriero';

  @override
  String get levelGodTier => 'Divino';

  @override
  String get levelDesc0 => 'Costruisci le tue basi';

  @override
  String get levelDesc1 => 'Accelera la crescita';

  @override
  String get levelDesc2 => 'Intensifica l\'allenamento';

  @override
  String get levelDesc3 => 'Supera i tuoi limiti';

  @override
  String get levelDesc4 => 'Nessun dolore, nessun guadagno';

  @override
  String get levelDesc5 => 'Mentalità da campione';

  @override
  String get levelDesc6 => 'Prestazione élite';

  @override
  String get levelDesc7 => 'Domina il tuo corpo';

  @override
  String get levelDesc8 => 'Disciplina leggendaria';

  @override
  String get levelDesc9 => 'Potenziale massimo';

  @override
  String levelLabel(int level) {
    return 'LIVELLO $level';
  }

  @override
  String daysLeftProgram(int days) {
    return '$days giorni rimasti nel programma';
  }

  @override
  String get tapLabel => 'TOCCA';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'Giorno';

  @override
  String get legendShort => 'Basso';

  @override
  String get legendBelowAvg => 'Sotto media';

  @override
  String get legendAverage => 'Media';

  @override
  String get legendTall => 'Alto';

  @override
  String get legendVeryTall => 'Molto alto';

  @override
  String get pctBottom5 => '5% inferiore';

  @override
  String get pctBottom25 => '25% inferiore';

  @override
  String get pctMedian => 'Mediana';

  @override
  String get pctTop25 => '25% superiore';

  @override
  String get pctTop5 => '5% superiore';

  @override
  String get fallingBehind => 'Stai rimanendo indietro';

  @override
  String readTimeMinutes(int minutes) {
    return '$minutes min di lettura';
  }

  @override
  String get inThisArticle => 'In questo articolo';

  @override
  String get nextArticle => 'Articolo successivo';

  @override
  String get purchaseUnavailable =>
      'Non è stato possibile completare l\'acquisto. Riprova.';

  @override
  String get viewPlan => 'Vedi piano';

  @override
  String get viewPlanSubtitle => 'Consulta i dettagli del tuo abbonamento';

  @override
  String predictionConfidenceHint(String percent) {
    return 'Ogni misurazione porta la previsione al $percent%';
  }

  @override
  String get paywallSlideHomeTitle => 'La tua giornata, una schermata';

  @override
  String get paywallSlideHomeCaption =>
      'Routine, acqua, sonno: tre anelli da chiudere.';

  @override
  String get paywallSlideProgressTitle => 'Vedi ogni centimetro';

  @override
  String get paywallSlideProgressCaption =>
      'Ogni misura entra subito nella curva.';

  @override
  String get paywallSlideAnalysisTitle => 'Cinque metriche, una forma';

  @override
  String get paywallSlideAnalysisCaption =>
      'Il radar indica il tuo anello debole.';

  @override
  String get paywallSlidePotentialTitle => 'Scopri il tuo potenziale';

  @override
  String get paywallSlidePotentialCaption =>
      'Guarda dove sei rispetto ai tuoi coetanei.';

  @override
  String get paywallSlideDisciplineTitle => 'Non spezzare la serie';

  @override
  String get paywallSlideDisciplineCaption =>
      'Ogni giorno alza il tuo livello.';

  @override
  String get paywallSlideRemindersTitle => 'Il promemoria al momento giusto';

  @override
  String get paywallSlideRemindersCaption =>
      'Imposta gli orari, al resto pensa l\'app.';

  @override
  String get paywallSlidePostureTitle => 'Correggi la postura';

  @override
  String get paywallSlidePostureCaption =>
      'Una foto, un punteggio misurato, una routine chiara.';

  @override
  String paywallTrialHeadline(String days) {
    return '$days GIORNI GRATIS';
  }

  @override
  String paywallTrialThen(String price) {
    return 'Poi $price · disdici quando vuoi';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / anno · disdici quando vuoi';
  }

  @override
  String get obBedtimeTitle => 'A che ora vai a dormire?';

  @override
  String get obBedtimeSubtitle =>
      'Il promemoria del sonno seguirà questo orario.';

  @override
  String get obWorkoutTimeTitle => 'A che ora ti alleni?';

  @override
  String get obWorkoutTimeSubtitle =>
      'Così il promemoria arriva al momento giusto.';

  @override
  String get obMealsTitle => 'Quanti pasti al giorno?';

  @override
  String get obMealsSubtitle => 'Tocca un orario per adattarlo a te.';

  @override
  String obMealsCount(String count) {
    return '$count pasti';
  }

  @override
  String obMealLabel(String n) {
    return 'Pasto $n';
  }

  @override
  String get obProteinTitle => 'Quanti grammi di proteine al giorno?';

  @override
  String get obProteinSubtitle =>
      'Basta un valore indicativo per costruire il piano.';

  @override
  String get obCaloriesTitle => 'Quante calorie al giorno?';

  @override
  String get obCaloriesSubtitle =>
      'Una stima basta, la affiniamo insieme più avanti.';

  @override
  String get obNotSure => 'Non ne sono sicuro';
}
