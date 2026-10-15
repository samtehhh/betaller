// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get navHome => 'Accueil';

  @override
  String get navAnalysis => 'Analyse';

  @override
  String get navRoutines => 'Routines';

  @override
  String get disciplineTitle => 'Discipline';

  @override
  String get disciplineProgramTitle => 'Programme de discipline';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total jours';
  }

  @override
  String get disciplineCompleteDay => 'Terminer la journée';

  @override
  String disciplineDayN(int n) {
    return 'Jour $n';
  }

  @override
  String get disciplineLevels => 'Niveaux';

  @override
  String get disciplineLevelDone => 'Terminé';

  @override
  String get disciplineLocked => 'Verrouillé';

  @override
  String get disciplineTodayIs => 'Aujourd\'hui';

  @override
  String get disciplineToday => 'Aujourd\'hui';

  @override
  String get disciplineTodayPlan => 'Plan du jour';

  @override
  String get disciplineWeek => 'Cette semaine';

  @override
  String get disciplineMonth => 'Ce mois-ci';

  @override
  String get disciplineLevel => 'Niveau de discipline';

  @override
  String disciplineStreakDays(int days) {
    return '$days jours d\'affilée';
  }

  @override
  String disciplineToNext(int days) {
    return '$days jours avant le prochain niveau';
  }

  @override
  String get disciplineMaxTier => 'Niveau maximum atteint';

  @override
  String get disciplineTierSpark => 'Étincelle';

  @override
  String get disciplineTierSteady => 'Régulier';

  @override
  String get disciplineTierSharp => 'Affûté';

  @override
  String get disciplineTierSolid => 'Solide';

  @override
  String get disciplineTierRelentless => 'Acharné';

  @override
  String get disciplineTierUnbroken => 'Inébranlable';

  @override
  String get disciplineTierLegend => 'Légende';

  @override
  String get goalPerfectDays => 'Jours où tu as terminé le plan';

  @override
  String get goalWorkouts => 'Séances d\'entraînement';

  @override
  String get goalMeasurement => 'Mesure de taille';

  @override
  String get goalPhoto => 'Photo de progression';

  @override
  String get goalPostureCheck => 'Contrôle de posture';

  @override
  String get disciplineAllDone => 'Journée terminée';

  @override
  String disciplineDayProgress(int done, int total) {
    return '$done/$total terminé';
  }

  @override
  String get navProgress => 'Progrès';

  @override
  String get trackingSection => 'Tes outils de suivi';

  @override
  String get photosBenefit =>
      'Avant et après, côte à côte. Vois le changement au lieu de le lire.';

  @override
  String get postureBenefit =>
      'Cyphose, lordose et position de la tête. Une bonne posture vaut à elle seule 2-3 cm.';

  @override
  String get reportBenefit =>
      'Note ta semaine jour par jour et vois où ça a coincé.';

  @override
  String get photosCta => 'Ajouter une photo';

  @override
  String get postureCta => 'Analyser';

  @override
  String get reportCta => 'Ouvrir le rapport';

  @override
  String get toolStateReady => 'Prêt';

  @override
  String get photosSummaryEmpty => 'Ajoute ta première photo';

  @override
  String photosSummaryCount(int count) {
    return '$count photos';
  }

  @override
  String get postureSummaryEmpty => 'Pas encore d\'analyse';

  @override
  String postureSummaryScore(int score) {
    return '$score/100 posture';
  }

  @override
  String get navProfile => 'Profil';

  @override
  String greeting(String name) {
    return 'Bonjour, $name';
  }

  @override
  String get currentHeight => 'Taille actuelle';

  @override
  String get target => 'Objectif';

  @override
  String completed(String pct) {
    return '$pct% accompli';
  }

  @override
  String remaining(String cm, String unit) {
    return '+$cm $unit restants';
  }

  @override
  String get updateAnalysis => 'Mettre à jour l\'analyse';

  @override
  String get analysisSubtitle =>
      'Obtenez des prédictions à partir de vos tailles et habitudes passées';

  @override
  String get dailyRoutines => 'Routines quotidiennes';

  @override
  String get allRoutinesDone => 'Toutes les routines sont terminées !';

  @override
  String get water => 'Eau';

  @override
  String get sleep => 'Sommeil';

  @override
  String get growthSummary => 'Résumé de croissance';

  @override
  String get total => 'TOTAL';

  @override
  String get last => 'DERNIER';

  @override
  String get measurement => 'MES.';

  @override
  String get dailyTip => 'Conseil du jour';

  @override
  String get waterTracking => 'Suivi d\'hydratation';

  @override
  String get waterGoalReached => 'Objectif quotidien atteint';

  @override
  String waterRemaining(String amount) {
    return 'Encore $amount L';
  }

  @override
  String get undo => 'Annuler';

  @override
  String waterToday(String amount) {
    return 'Aujourd\'hui : $amount L';
  }

  @override
  String get sleepTracking => 'Suivi du sommeil';

  @override
  String sleepTarget(String hours) {
    return 'Objectif : $hours heures';
  }

  @override
  String get hours => 'heures';

  @override
  String get save => 'Enregistrer';

  @override
  String get cancel => 'Annuler';

  @override
  String get analysis => 'Analyse';

  @override
  String get betallerScore => 'Score BeTaller';

  @override
  String get genetic => 'Génétique';

  @override
  String get growth => 'Croissance';

  @override
  String get nutrition => 'Nutrition';

  @override
  String get sleepLabel => 'Sommeil';

  @override
  String get discipline => 'Discipline';

  @override
  String get improveScore => 'Améliore ton score';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Nutrition critique !';

  @override
  String get nutritionStrengthen => 'Renforcer la nutrition';

  @override
  String get sleepRecordAdd => 'Ajouter un enregistrement de sommeil';

  @override
  String get sleepPoor => 'Mauvais rythme de sommeil';

  @override
  String get sleepImprove => 'Améliorer le sommeil';

  @override
  String get startToday => 'Commencez aujourd\'hui !';

  @override
  String routinesRemaining(int count) {
    return '$count routines restantes';
  }

  @override
  String get keepStreak => 'Garde ta série';

  @override
  String get addFirstMeasurement => 'Ajouter la première mesure';

  @override
  String get addMeasurement => 'Ajouter une mesure';

  @override
  String waterHalfNotReached(String amount) {
    return 'Vous n\'avez pas atteint la moitié de votre objectif d\'eau aujourd\'hui. Buvez encore ${amount}L.';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'Plus que ${amount}L pour atteindre votre objectif d\'eau. Vous y êtes presque !';
  }

  @override
  String bmiLow(String bmi) {
    return 'Votre IMC est de $bmi — un peu bas. Augmentez votre apport en protéines et en calories.';
  }

  @override
  String get bodyFactsTitle => 'Ton corps';

  @override
  String get dailyNeedsTitle => 'Tes objectifs du jour';

  @override
  String bmiHigh(String bmi) {
    return 'Votre IMC est de $bmi — un peu élevé. Privilégiez une alimentation saine.';
  }

  @override
  String get nutritionDefault =>
      'Atteins ton objectif d\'eau et garde une alimentation équilibrée.';

  @override
  String sleepNoRecord(String hours) {
    return 'Aucun enregistrement de sommeil aujourd\'hui. Visez $hours heures et notez-le.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Vous avez dormi $current heures aujourd\'hui — il vous manque $missing heures. Couchez-vous plus tôt !';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Presque ! Atteindre $hours heures maximisera l\'hormone de croissance.';
  }

  @override
  String get sleepGood => 'Excellent rythme de sommeil ! Continuez comme ça.';

  @override
  String noRoutinesDone(int total) {
    return 'Aucune routine terminée aujourd\'hui. Commencez par l\'une des $total !';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '$done/$total routines terminées aujourd\'hui. Encore $left à faire !';
  }

  @override
  String streakBuilding(int needed) {
    return 'Bravo pour aujourd\'hui ! Encore $needed jours pour commencer une série.';
  }

  @override
  String streakContinue(int days) {
    return 'Série de $days jours ! Ton score augmente si tu continues.';
  }

  @override
  String get noMeasurements =>
      'Aucune mesure de taille pour l\'instant. Ajoutez la première pour des prédictions précises.';

  @override
  String fewMeasurements(int count) {
    return 'Ajoutez $count mesures supplémentaires pour calculer la vitesse de croissance.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Vous avez $count mesures. En atteindre 5 améliorera grandement la précision.';
  }

  @override
  String get keepMeasuring =>
      'Continuez à ajouter des mesures. Chaque nouveau point de données améliore les prédictions.';

  @override
  String get heightPrediction => 'Prédiction de taille';

  @override
  String get predictedHeightAt21 => 'Taille prédite à 21 ans';

  @override
  String get predictionMethod =>
      'Calculé en combinant les données génétiques (parents), la vitesse de croissance, l\'IMC et l\'âge.';

  @override
  String get growthStatus => 'État de croissance';

  @override
  String get growthRemaining => 'Encore devant toi';

  @override
  String get growthBreakdown => 'D\'où viennent ces centimètres';

  @override
  String get geneticGainLabel => 'Gain Génétique';

  @override
  String get lifestyleLabel => 'Mode de Vie';

  @override
  String get geneticCeilingLabel => 'Plafond';

  @override
  String get reachableTargetHeight => 'Ta taille cible atteignable';

  @override
  String get geneticCeilingProgress => 'Progrès vers le plafond génétique';

  @override
  String get completionLabel => 'ACHÈVEMENT';

  @override
  String get growthVelocity => 'VITESSE DE CROISSANCE';

  @override
  String get noData => 'PAS DE DONNÉES';

  @override
  String growthRate(String rating) {
    return 'Taux de croissance : $rating';
  }

  @override
  String get bmi => 'IMC';

  @override
  String get calories => 'Calories';

  @override
  String get kcalDay => 'kcal/jour';

  @override
  String get daily => 'quotidien';

  @override
  String get protein => 'Protéines';

  @override
  String get minimum => 'minimum';

  @override
  String get age => 'Âge';

  @override
  String get male => 'Homme';

  @override
  String get female => 'Femme';

  @override
  String get yearlyPrediction => 'PRÉDICTION ANNUELLE';

  @override
  String ageYear(int age) {
    return '$age ans';
  }

  @override
  String get progressTitle => 'Suivi des progrès';

  @override
  String get totalGrowth => 'Total';

  @override
  String get lastDiff => 'Dernière diff.';

  @override
  String get measurementCount => 'Mes.';

  @override
  String get heightChart => 'Graphique de taille';

  @override
  String get chartMinData => 'Au moins 2 mesures nécessaires pour le graphique';

  @override
  String get chartInstruction =>
      'Ajoute des mesures pour voir ta courbe de progression !';

  @override
  String get addMeasurementButton => 'AJOUTER UNE MESURE';

  @override
  String get measurementHistory => 'HISTORIQUE DES MESURES';

  @override
  String get deleteTitle => 'Supprimer la mesure';

  @override
  String get deleteMessage => 'Tu es sûr de vouloir supprimer cette mesure ?';

  @override
  String get dismiss => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get newMeasurement => 'Nouvelle mesure de taille';

  @override
  String get routines => 'Routines';

  @override
  String streakDays(int days) {
    return '$days jours';
  }

  @override
  String get progressStatus => 'État de progression';

  @override
  String get completedLabel => 'Terminé !';

  @override
  String get all => 'Tout';

  @override
  String get exercise => 'Exercice';

  @override
  String get posture => 'Posture';

  @override
  String bestStreak(int days) {
    return 'Record : $days jours';
  }

  @override
  String get editProfile => 'Modifier le profil';

  @override
  String get editProfileSubtitle =>
      'Mettre à jour la taille, le poids et l\'âge';

  @override
  String get name => 'Nom';

  @override
  String birthDate(String date) {
    return 'Naissance : $date';
  }

  @override
  String get heightCm => 'Taille (cm)';

  @override
  String get weightKg => 'Poids (kg)';

  @override
  String get fatherHeight => 'Taille du père (cm)';

  @override
  String get motherHeight => 'Taille de la mère (cm)';

  @override
  String get notifications => 'Notifications';

  @override
  String get reminderNextLabel => 'Prochain rappel';

  @override
  String get reminderManageHint => 'Gère tes rappels';

  @override
  String get reminderOffCta => 'Activer les notifications';

  @override
  String get stateOn => 'Activé';

  @override
  String get stateOff => 'Désactivé';

  @override
  String get reminderMasterTitle => 'Notifications';

  @override
  String reminderActiveCount(int count) {
    return '$count rappels actifs';
  }

  @override
  String get reminderBuiltIn => 'Rappels intégrés';

  @override
  String get reminderYourOwn => 'Tes propres rappels';

  @override
  String get reminderAdd => 'Ajouter un rappel';

  @override
  String get reminderDays => 'Jours';

  @override
  String get reminderEveryDay => 'Tous les jours';

  @override
  String get reminderLabelHint => 'De quoi veux-tu qu\'on te rappelle ?';

  @override
  String get reminderEmptyHint =>
      'Ajoute le tien : entraînement, vitamines, étirements, ce dont tu as besoin.';

  @override
  String get reminderCustom => 'Rappel';

  @override
  String get reminderCustomBody => 'L\'heure que tu as fixée est arrivée.';

  @override
  String get reminderExercise => 'Exercice';

  @override
  String get reminderNutrition => 'Nutrition';

  @override
  String get reminderWater => 'Eau';

  @override
  String get reminderPosture => 'Posture';

  @override
  String get reminderRoutine => 'Routine quotidienne';

  @override
  String get reminderSleep => 'Sommeil';

  @override
  String get reminderMeasurement => 'Mesure de taille';

  @override
  String get notificationsOn => 'Rappels activés';

  @override
  String get notificationsOff => 'Rappels désactivés';

  @override
  String get premium => 'Passer à Premium';

  @override
  String get premiumSubtitle => 'Débloquer toutes les fonctionnalités';

  @override
  String get rateUs => 'Note-nous';

  @override
  String get rateSubtitle => 'Tu aimes l\'appli ? Donne-nous 5 étoiles !';

  @override
  String get share => 'Partager l\'appli';

  @override
  String get shareSubtitle => 'Parle de BeTaller à tes amis';

  @override
  String get shareText =>
      'J\'ai découvert mon potentiel de croissance avec BeTaller ! Essaie aussi : https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'Donner un avis';

  @override
  String get feedbackSubtitle => 'Contacte-nous';

  @override
  String get resetData => 'Réinitialiser toutes les données';

  @override
  String get resetSubtitle => 'Toutes les données seront supprimées';

  @override
  String get resetTitle => 'Réinitialiser les données';

  @override
  String get resetMessage =>
      'Toutes les données seront supprimées et tu reviendras à l\'écran d\'accueil. Cette action est irréversible !';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get premiumSoon => 'Premium bientôt disponible !';

  @override
  String get brandingSubtitle => 'Découvre ton potentiel de croissance';

  @override
  String get statistics => 'Statistiques';

  @override
  String get profileGroupSupport => 'Support';

  @override
  String get profileGroupAccount => 'Compte';

  @override
  String get profileGroupApp => 'Application';

  @override
  String get profileGroupDanger => 'Zone à risque';

  @override
  String profileMemberSince(String date) {
    return 'Depuis le $date';
  }

  @override
  String get profileYourJourney => 'Ton parcours';

  @override
  String get profileTotalGrowth => 'Total';

  @override
  String get currentStreak => 'Série actuelle';

  @override
  String get bestStreakLabel => 'Meilleure série';

  @override
  String get achievementLabel => 'Succès';

  @override
  String get achievements => 'Succès';

  @override
  String get achievementUnlockedTitle => '🏆 Succès débloqué !';

  @override
  String get reminderTapHint =>
      'Appuie sur un rappel pour changer son heure et ses jours';

  @override
  String get earned => 'Obtenu !';

  @override
  String get notEarned => 'Pas encore obtenu';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Langue';

  @override
  String get languageSubtitle => 'Changer la langue de l\'appli';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Découvre ton potentiel de croissance';

  @override
  String get onboardingMeetYou => 'Faisons connaissance';

  @override
  String get onboardingInfoNeeded =>
      'Informations de base nécessaires pour l\'analyse.';

  @override
  String get gender => 'SEXE';

  @override
  String get birthDateLabel => 'DATE DE NAISSANCE';

  @override
  String get bodyMeasurements => 'Mensurations corporelles';

  @override
  String get bodyInfo =>
      'Votre taille et votre poids actuels sont nécessaires pour l\'analyse.';

  @override
  String get geneticData => 'Données génétiques';

  @override
  String get geneticInfo =>
      'La taille des parents détermine votre potentiel génétique.';

  @override
  String get pastHeights => 'Tailles passées';

  @override
  String get pastHeightsInfo =>
      'Entre les tailles dont tu te souviens à différents âges. Tu peux laisser des cases vides.';

  @override
  String get heightHint => 'Entre ta taille...';

  @override
  String get ageLabel => 'âge';

  @override
  String get habits => 'Tes habitudes';

  @override
  String get habitsInfo =>
      'Votre mode de vie influence directement les prédictions.';

  @override
  String get weeklyExercise => 'Exercice hebdomadaire';

  @override
  String get dailySleep => 'Sommeil quotidien';

  @override
  String get nutritionQuality => 'QUALITÉ NUTRITIONNELLE';

  @override
  String get nutritionDesc =>
      'Apport en protéines, produits laitiers, légumes et fruits';

  @override
  String get nutritionBad => 'Mauvais';

  @override
  String get nutritionPoor => 'Faible';

  @override
  String get nutritionMedium => 'Moyen';

  @override
  String get nutritionGood => 'Bon';

  @override
  String get nutritionGreat => 'Excellent';

  @override
  String get startAnalysis => 'Démarrer l\'analyse';

  @override
  String get continueBtn => 'Continuer';

  @override
  String get analyzeBtn => 'Analyser';

  @override
  String get analyzing => 'Analyse en cours';

  @override
  String get analysisComplete => 'Terminé !';

  @override
  String get analysisDataReceivedTitle => 'Données reçues';

  @override
  String get analysisDataReceivedSubtitle => 'Ton analyse démarre...';

  @override
  String get yourScore => 'Votre score BeTaller';

  @override
  String get letsStart => 'C\'est parti';

  @override
  String get splashJourneySubtitle => 'Ton voyage commence. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Ton plan personnalisé est prêt.\nPrêt à découvrir ton potentiel de taille ?';

  @override
  String get doneBtn => 'Terminé';

  @override
  String get analysisStep1 => 'Analyse des données génétiques...';

  @override
  String get analysisStep2 => 'Calcul de la vitesse de croissance...';

  @override
  String get analysisStep3 =>
      'Traitement des données de nutrition et sommeil...';

  @override
  String get analysisStep4 => 'Génération de la prédiction de taille...';

  @override
  String get analysisStep5 => 'Calcul du score BeTaller...';

  @override
  String growthPotential(String cm, String unit) {
    return '+$cm $unit de potentiel de croissance';
  }

  @override
  String get heightAt21 => 'à 21 ans';

  @override
  String confidenceLevel(String pct) {
    return 'Niveau de confiance de $pct%';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return 'Fourchette de $min - $max $unit';
  }

  @override
  String get currentLabel => 'ACTUEL';

  @override
  String get predictedLabel => 'PRÉDIT';

  @override
  String get yearlyPredictions => 'Prédictions annuelles';

  @override
  String get tipMorningMeasure =>
      'Mesure-toi le matin. La pression sur les disques te fait perdre un peu de taille au fil de la journée, la mesure la plus précise est celle du matin.';

  @override
  String get tipProteinSpread =>
      'Répartis les protéines sur tous tes repas. Ne mange pas tout d\'un coup, prends des protéines à chaque repas.';

  @override
  String get tipGrowthHormone =>
      'L\'hormone de croissance atteint son pic pendant le sommeil. Sois endormi entre 22 h et 2 h !';

  @override
  String get tipVitaminD =>
      '15 minutes d\'exposition quotidienne au soleil augmentent la production de vitamine D. La vitamine D est essentielle à l\'absorption du calcium.';

  @override
  String get tipBarHanging =>
      'La suspension à la barre décompresse la colonne vertébrale. Essaie 3x30 secondes par jour.';

  @override
  String get tipSwimming =>
      'La natation est le meilleur sport pour un entraînement complet du corps et le soutien de la croissance.';

  @override
  String get tipStress =>
      'Le stress freine l\'hormone de croissance. Réduis-le avec la méditation et le yoga.';

  @override
  String get routineMorningStretch => 'Étirements matinaux';

  @override
  String get routineMorningStretchDesc =>
      'Fais 10 minutes d\'étirements au réveil. Étire ta colonne et les muscles de tes jambes.';

  @override
  String get routineBarHanging => 'Suspension à la barre';

  @override
  String get routineBarHangingDesc =>
      'Suspends-toi à une barre de traction pour étirer ta colonne. 3 séries x 30 secondes.';

  @override
  String get routineCobraStretch => 'Étirement du cobra';

  @override
  String get routineCobraStretchDesc =>
      'Allonge-toi sur le ventre et soulève le haut du corps. Étire ta colonne. 3 séries x 15 secondes.';

  @override
  String get routineJumping => 'Exercices de saut';

  @override
  String get routineJumpingDesc =>
      'Corde à sauter ou squats sautés. Stimule les plaques de croissance. 3 séries x 20 répétitions.';

  @override
  String get routineSwimming => 'Natation ou basketball';

  @override
  String get routineSwimmingDesc =>
      'Pratique un sport qui favorise la croissance. Au moins 30 minutes.';

  @override
  String get routineYoga => 'Yoga et étirements du soir';

  @override
  String get routineYogaDesc =>
      'Routine de yoga et d\'étirements avant le coucher. Relâche le stress, détends tes muscles.';

  @override
  String get routineProtein => 'Apport en protéines';

  @override
  String get routineProteinDesc =>
      'Œufs, poulet, poisson, produits laitiers. Au moins 1,5g/kg de protéines par jour.';

  @override
  String get routineCalcium => 'Calcium et vitamine D';

  @override
  String get routineCalciumDesc =>
      'Consomme du lait, du fromage, du yaourt. Expose-toi au soleil 15 min. Essentiel pour le développement osseux.';

  @override
  String get routineWater => 'Objectif d\'hydratation';

  @override
  String get routineWaterDesc =>
      'Bois au moins 2 à 3 litres d\'eau par jour. Essentiel pour le métabolisme et la croissance.';

  @override
  String get routineAvoidJunk => 'Éviter la malbouffe';

  @override
  String get routineAvoidJunkDesc =>
      'Évite le fast-food, les boissons sucrées et les aliments transformés.';

  @override
  String get routineSleep => 'Sommeil de qualité (8-10h)';

  @override
  String get routineSleepDesc =>
      'L\'hormone de croissance est libérée pendant le sommeil. 22h-6h sont les heures d\'or.';

  @override
  String get routineNoScreen => 'Pause écran avant le coucher';

  @override
  String get routineNoScreenDesc =>
      'Range ton téléphone et ton ordinateur 1 heure avant le coucher. Ne bloque pas la production de mélatonine.';

  @override
  String get routinePosture => 'Vérification de la posture';

  @override
  String get routinePostureDesc =>
      'Garde le dos droit, les épaules en arrière. Vérifie toutes les heures. Une bonne posture = 2-3 cm de différence.';

  @override
  String get routineWallStand => 'Exercice contre le mur';

  @override
  String get routineWallStandDesc =>
      'Adosse-toi au mur : talons, hanches, épaules et tête contre le mur. Tiens 5 min.';

  @override
  String get routineSprintIntervals => 'Intervalles de Sprint';

  @override
  String get routineSprintIntervalsDesc =>
      'L\'entraînement par intervalles de sprint déclenche une libération significative d\'hormone de croissance par des efforts intenses.';

  @override
  String get routineHiitWorkout => 'Entraînement HIIT';

  @override
  String get routineHiitWorkoutDesc =>
      'Entraînement par intervalles de haute intensité pour maximiser la libération d\'hormone de croissance.';

  @override
  String get routineSquats => 'Squats au Poids du Corps';

  @override
  String get routineSquatsDesc =>
      'Les squats au poids du corps stimulent les plaques de croissance des jambes et de la colonne vertébrale.';

  @override
  String get routineDeadliftStretch => 'Étirement Deadlift';

  @override
  String get routineDeadliftStretchDesc =>
      'Étirement deadlift pour la décompression de la colonne vertébrale et la santé des disques vertébraux.';

  @override
  String get routineOverheadPress => 'Développé au-dessus de la Tête';

  @override
  String get routineOverheadPressDesc =>
      'Le développé au-dessus de la tête étire la colonne vertébrale et renforce les muscles posturaux.';

  @override
  String get routineSkippingRope => 'Corde à Sauter';

  @override
  String get routineSkippingRopeDesc =>
      'Les sauts répétitifs à la corde stimulent les plaques de croissance des membres inférieurs.';

  @override
  String get routinePilatesCore => 'Pilates Core';

  @override
  String get routinePilatesCoreDesc =>
      'Les exercices Pilates Core soutiennent l\'alignement de la colonne vertébrale et la posture.';

  @override
  String get routineInversionHang => 'Suspension Inversée';

  @override
  String get routineInversionHangDesc =>
      'L\'inversion décompresse les disques vertébraux et peut ajouter temporairement 1-2 cm.';

  @override
  String get routineZincIntake => 'Aliments Riches en Zinc';

  @override
  String get routineZincIntakeDesc =>
      'Consomme des aliments riches en zinc tout au long de la journée pour la production d\'hormone de croissance.';

  @override
  String get routineVitaminDSunlight => 'Vitamine D et Soleil';

  @override
  String get routineVitaminDSunlightDesc =>
      'Expose-toi au moins 15 minutes au soleil direct pour la synthèse de vitamine D et la croissance osseuse.';

  @override
  String get routineArginineFoods => 'Aliments Riches en Arginine';

  @override
  String get routineArginineFoodsDesc =>
      'Mange des aliments riches en arginine pour stimuler la sécrétion d\'hormone de croissance.';

  @override
  String get routineDailyCalories => 'Objectif calorique quotidien';

  @override
  String get routineDailyCaloriesDesc =>
      'Atteins ton objectif calorique quotidien. Manger trop peu ralentit la croissance.';

  @override
  String get routineSleepEnvironment => 'Optimiser l\'Environnement de Sommeil';

  @override
  String get routineSleepEnvironmentDesc =>
      'Crée une chambre sombre et fraîche pour maximiser la libération de mélatonine et d\'hormone de croissance.';

  @override
  String get routinePreSleepRoutine => 'Routine Pré-Sommeil';

  @override
  String get routinePreSleepRoutineDesc =>
      'Une routine pré-sommeil régulière améliore la qualité du sommeil profond de 23%.';

  @override
  String get routineNeckStretches => 'Étirements du Cou';

  @override
  String get routineNeckStretchesDesc =>
      'Les étirements du cou soulagent la compression et améliorent l\'alignement cervical.';

  @override
  String get routineShoulderRolls => 'Rotations et Ouvertures des Épaules';

  @override
  String get routineShoulderRollsDesc =>
      'Ouvrir les épaules corrige la posture en avant et peut ajouter 1-2 cm en apparence.';

  @override
  String get achieveCommitment => 'Détermination';

  @override
  String get achieveCommitmentDesc =>
      'Entre toutes tes données, explore entièrement l\'application et commence à l\'utiliser';

  @override
  String get achieveFirstDay => 'Premier pas';

  @override
  String get achieveFirstDayDesc => 'Termine ton premier jour';

  @override
  String get achieveThreeStreak => 'Série de 3 jours';

  @override
  String get achieveThreeStreakDesc => 'Complète tes routines 3 jours de suite';

  @override
  String get achieveWeekStreak => 'Série de 7 jours';

  @override
  String get achieveWeekStreakDesc => 'Complète tes routines 7 jours de suite';

  @override
  String get achieveTwoWeekStreak => 'Série de 14 jours';

  @override
  String get achieveTwoWeekStreakDesc => 'Continue pendant 14 jours d\'affilée';

  @override
  String get achieveMonthStreak => 'Série de 30 jours';

  @override
  String get achieveMonthStreakDesc => 'Complète 30 jours de suite';

  @override
  String get achieveTwoMonthStreak => 'Série de 60 jours';

  @override
  String get achieveTwoMonthStreakDesc => 'Complète 60 jours de suite';

  @override
  String get achieveHundredStreak => 'Série de 100 jours';

  @override
  String get achieveHundredStreakDesc => 'Complète 100 jours de suite';

  @override
  String get achieveFirstMeasure => 'Première mesure';

  @override
  String get achieveFirstMeasureDesc =>
      'Enregistre ta première mesure de taille';

  @override
  String get achieveThreeMeasures => 'Suivi régulier';

  @override
  String get achieveThreeMeasuresDesc => 'Enregistre 3 mesures de taille';

  @override
  String get achieveFiveMeasures => 'Suivi assidu';

  @override
  String get achieveFiveMeasuresDesc => 'Enregistre 5 mesures de taille';

  @override
  String get achieveTenMeasures => 'Chasseur de données';

  @override
  String get achieveTenMeasuresDesc => 'Enregistre 10 mesures de taille';

  @override
  String get achieveFirstCm => 'Premier centimètre';

  @override
  String get achieveFirstCmDesc => 'Enregistre 1 cm de croissance au total';

  @override
  String get achieveThreeCm => '3 cm de croissance';

  @override
  String get achieveThreeCmDesc => 'Enregistre 3 cm de croissance au total';

  @override
  String get achieveFiveCm => '5 cm de croissance';

  @override
  String get achieveFiveCmDesc => 'Enregistre 5 cm de croissance au total';

  @override
  String get achieveTenCm => '10 cm de croissance';

  @override
  String get achieveTenCmDesc => 'Enregistre 10 cm de croissance au total';

  @override
  String get quote1 => 'Sois meilleur qu\'hier, chaque jour.';

  @override
  String get quote2 =>
      'La croissance ne se fait pas en une nuit, mais chaque nuit t\'en rapproche.';

  @override
  String get quote3 => 'La croissance demande de la patience, continue !';

  @override
  String get quote4 =>
      'Le pas que tu fais aujourd\'hui construit les fondations de demain.';

  @override
  String get quote5 => 'La discipline commence là où la motivation s\'arrête.';

  @override
  String get quote6 => 'Ton corps te remerciera, continue !';

  @override
  String get quote7 => 'C\'est toi qui fixes les limites de ton potentiel.';

  @override
  String get quote8 => 'Les petits pas créent de grands changements.';

  @override
  String get quote9 => 'Le meilleur investissement, c\'est en soi-même.';

  @override
  String get quote10 => 'Tu te rapproches de ton objectif chaque jour.';

  @override
  String get quote11 =>
      'Le changement est difficile, mais le regret l\'est encore plus.';

  @override
  String get quote12 => 'Ton corps est un temple, prends-en soin.';

  @override
  String get quote13 => 'Ton rival, c\'est toi hier. Dépasse-le aujourd\'hui !';

  @override
  String get quote14 => 'BeTaller = Patience + Discipline + Conviction';

  @override
  String get quote15 => 'Crois en toi, le processus te façonnera.';

  @override
  String get quote16 =>
      'Ne dis pas « je ne peux pas » aujourd\'hui, et tu n\'auras rien à regretter demain.';

  @override
  String get quote17 => 'Progresse chaque jour, même si ce n\'est que de 1 %.';

  @override
  String get quote18 => 'Le miroir montrera tes progrès, sois patient.';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiUnderweight => 'Insuffisance pondérale';

  @override
  String get bmiOverweight => 'Surpoids';

  @override
  String get bmiObese => 'Obésité';

  @override
  String get velocityExcellent => 'Excellente';

  @override
  String get velocityNormal => 'Normale';

  @override
  String get velocitySlow => 'Lente';

  @override
  String get velocityVeryLow => 'Très faible';

  @override
  String durationMinutes(String min) {
    return '$min min';
  }

  @override
  String get durationAllDay => 'Toute la journée';

  @override
  String get durationNight => 'Nuit';

  @override
  String durationHours(String hours) {
    return '$hours heures';
  }

  @override
  String get onboardingStep1 => 'Entre tes informations personnelles';

  @override
  String get onboardingStep2 => 'Partage tes tailles passées';

  @override
  String get onboardingStep3 => 'Évalue tes habitudes';

  @override
  String get onboardingStep4 => 'Découvre ta prédiction et ton score';

  @override
  String get hoursShort => 'h';

  @override
  String get selectLanguage => 'Choisir la langue';

  @override
  String get systemLanguage => 'Langue du système';

  @override
  String get emailSubject => 'BeTaller Retour';

  @override
  String get pastHeightsTip =>
      'Tu peux laisser les âges inconnus vides. Entrer 1-2 tailles passées suffit.';

  @override
  String get obPastHeightsTitle => 'Tailles Passées';

  @override
  String get obPastHeightsSubPart1 =>
      'Entre tes tailles passées pour augmenter la confiance de ta prédiction à ';

  @override
  String get obPastHeightsSubPart2 => ' ou plus.';

  @override
  String obHowTallAtAge(String age) {
    return 'Quelle était ta taille à $age ans ?';
  }

  @override
  String get obSkip => 'Passer';

  @override
  String get obNext => 'Suivant';

  @override
  String get obSkipAll => 'Tout passer';

  @override
  String get currentSuffix => '(actuel)';

  @override
  String personalizedProtein(String amount) {
    return 'Œufs, poulet, poisson, produits laitiers. Mange au moins ${amount}g de protéines par jour.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Bois au moins ${amount}L d\'eau par jour. Essentiel pour le métabolisme et la croissance.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'L\'hormone de croissance est libérée pendant le sommeil. Dors au moins $hours heures. 22h-6h sont les heures d\'or.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Consomme lait, fromage, yaourt. 15 min de soleil. Objectif calorique : $calories kcal.';
  }

  @override
  String get scoreS => 'Excellent ! Tu atteins le sommet de ton potentiel.';

  @override
  String get scoreA =>
      'Super ! De petites améliorations peuvent te mener au sommet.';

  @override
  String get scoreB =>
      'Sur la bonne voie. Concentre-toi un peu plus sur les routines et la nutrition.';

  @override
  String get scoreC =>
      'Des améliorations sont possibles. Des routines régulières feront la différence.';

  @override
  String get scoreD => 'Potentiel élevé mais tu dois passer à l\'action.';

  @override
  String get scoreF =>
      'Commence maintenant ! Un petit pas chaque jour fait une grande différence.';

  @override
  String get cmPerYear => 'cm/an';

  @override
  String get howToDoIt => 'Comment faire';

  @override
  String get musclesTargeted => 'Muscles et os ciblés';

  @override
  String get scientificBasis => 'Base scientifique';

  @override
  String setXofY(String current, String total) {
    return 'Série $current sur $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Repos avant la série $set';
  }

  @override
  String get allSetsComplete => 'Toutes les séries terminées !';

  @override
  String get setTimer => 'Minuteur de série';

  @override
  String get setTracker => 'Suivi des séries';

  @override
  String get builtInTimer => 'Minuteur intégré';

  @override
  String get markComplete => 'Marquer comme terminé';

  @override
  String get markIncomplete => 'Marquer comme non terminé';

  @override
  String get done => 'Terminé';

  @override
  String get doneExclamation => 'Terminé !';

  @override
  String get start => 'Démarrer';

  @override
  String get pause => 'Pause';

  @override
  String get resetTimer => 'Réinitialiser';

  @override
  String get skipRest => 'Passer le repos';

  @override
  String get restart => 'Recommencer';

  @override
  String get perSet => 'par série';

  @override
  String get rest => 'REPOS';

  @override
  String get reps => 'reps';

  @override
  String get difficultyBeginner => 'Débutant';

  @override
  String get difficultyIntermediate => 'Intermédiaire';

  @override
  String get difficultyAdvanced => 'Avancé';

  @override
  String get learnTitle => 'Apprendre';

  @override
  String get learnSubtitle => 'Connaissances scientifiques pour la croissance';

  @override
  String get categoryAll => 'Tout';

  @override
  String get categoryScience => 'Science';

  @override
  String get categoryNutrition => 'Nutrition';

  @override
  String get categoryExercise => 'Exercice';

  @override
  String get categorySleep => 'Sommeil';

  @override
  String get categoryMyths => 'Mythes';

  @override
  String get scientificReferences => 'Références scientifiques';

  @override
  String get relatedRoutines => 'Routines associées';

  @override
  String get nutritionTitle => 'Nutrition';

  @override
  String get sectionMealPlan => 'Plan repas';

  @override
  String get sectionNutrients => 'Nutriments';

  @override
  String get sectionFoods => 'Aliments';

  @override
  String get sectionSupplements => 'Compléments';

  @override
  String todaysPlan(String day) {
    return 'Plan du jour — $day';
  }

  @override
  String get breakfast => 'Petit-déjeuner';

  @override
  String get lunch => 'Déjeuner';

  @override
  String get dinner => 'Dîner';

  @override
  String get snacks => 'Collations';

  @override
  String get searchFoods => 'Rechercher des aliments...';

  @override
  String nFoods(String count) {
    return '$count aliments';
  }

  @override
  String dailyLabel(String amount) {
    return 'Quotidien : $amount';
  }

  @override
  String get dailyNeedByAge => 'BESOIN QUOTIDIEN PAR ÂGE';

  @override
  String agePrefix(String range) {
    return 'Âge $range';
  }

  @override
  String get topFoodSources => 'MEILLEURES SOURCES ALIMENTAIRES';

  @override
  String get categoryDairy => 'Produits laitiers';

  @override
  String get categoryMeatFish => 'Viande et poisson';

  @override
  String get categoryVegetables => 'Légumes';

  @override
  String get categoryFruits => 'Fruits';

  @override
  String get categoryGrains => 'Céréales et légumineuses';

  @override
  String get categoryNutsSeeds => 'Noix et graines';

  @override
  String get weeklyReportTitle => 'Rapport hebdomadaire';

  @override
  String get weeklyScoreLabel => 'Score de la semaine';

  @override
  String get weeklyDailyCompletion => 'Jour par jour';

  @override
  String get weeklyHabits => 'Habitudes';

  @override
  String get overview => 'Aperçu';

  @override
  String get routinesLabel => 'Routines';

  @override
  String get streakLabel => 'Série';

  @override
  String get heightLabel => 'Taille';

  @override
  String get weightLabel => 'Poids';

  @override
  String get dadLabel => 'Papa';

  @override
  String get motherLabel => 'Maman';

  @override
  String get metricShort => 'Métrique';

  @override
  String get imperialShort => 'Impérial';

  @override
  String get dailyScores => 'Scores quotidiens';

  @override
  String get waterToday2 => 'Eau aujourd\'hui';

  @override
  String get sleepToday => 'Sommeil aujourd\'hui';

  @override
  String get routineCompletion => 'Complétion des routines';

  @override
  String get xpAndLevel => 'XP et niveau';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP pour le prochain niveau';
  }

  @override
  String get activeChallenges => 'Défis actifs';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m terminés';
  }

  @override
  String get shareYourProgress => 'Partagez vos progrès';

  @override
  String get shareComingSoon =>
      'Fonctionnalité de partage bientôt disponible !';

  @override
  String get premiumTest => 'Premium (Test)';

  @override
  String get premiumActive => 'Actif';

  @override
  String get premiumFree => 'Gratuit';

  @override
  String get weeklyReportMenu => 'Rapport hebdomadaire';

  @override
  String get weeklyReportMenuSubtitle => 'Votre résumé de progression';

  @override
  String get unlockGrowthPotential =>
      'Libérez tout votre potentiel de croissance';

  @override
  String get featureGrowthAnalysis => 'Analyse de croissance et score';

  @override
  String get featureHeightPrediction => 'Prédiction et prévision de taille';

  @override
  String get featureAllRoutines => 'Les 14 routines quotidiennes';

  @override
  String get featureWaterSleep => 'Suivi eau et sommeil';

  @override
  String get featureProgress => 'Progrès et mesures';

  @override
  String get featureAchievements => 'Succès et séries';

  @override
  String get planMonthly => 'Mensuel';

  @override
  String get planYearly => 'Annuel';

  @override
  String get bestValue => 'MEILLEURE OFFRE';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'NIV $level';
  }

  @override
  String get levelBeginner => 'Débutant';

  @override
  String get levelStarter => 'Novice';

  @override
  String get levelCommitted => 'Engagé';

  @override
  String get levelDedicated => 'Dévoué';

  @override
  String get levelConsistent => 'Régulier';

  @override
  String get levelFocused => 'Concentré';

  @override
  String get levelDetermined => 'Déterminé';

  @override
  String get levelDisciplined => 'Discipliné';

  @override
  String get levelStrong => 'Fort';

  @override
  String get levelAdvanced => 'Avancé';

  @override
  String get levelExpert => 'Expert';

  @override
  String get levelMaster => 'Maître';

  @override
  String get levelElite => 'Élite';

  @override
  String get levelChampion => 'Champion';

  @override
  String get levelLegend => 'Légende';

  @override
  String get levelTitan => 'Titan';

  @override
  String get levelMythic => 'Mythique';

  @override
  String get levelImmortal => 'Immortel';

  @override
  String get levelTranscendent => 'Transcendant';

  @override
  String get levelUltimate => 'Ultime';

  @override
  String get challengeCompleteAllRoutines => 'Compléter toutes les routines';

  @override
  String get challengeCompleteAllRoutinesDesc =>
      'Terminer chaque routine aujourd\'hui';

  @override
  String get challengeHydrationHero => 'Héros de l\'hydratation';

  @override
  String get challengeHydrationHeroDesc =>
      'Atteindre l\'objectif d\'eau quotidien';

  @override
  String get challengeEarlySleeper => 'Couche-tôt';

  @override
  String get challengeEarlySleeperDesc => 'Enregistrer 8+ heures de sommeil';

  @override
  String get challengeExerciseTrio => 'Trio d\'exercices';

  @override
  String get challengeExerciseTrioDesc => 'Terminer 3 routines d\'exercice';

  @override
  String get challengeMorningStretch => 'Étirement matinal';

  @override
  String get challengeMorningStretchDesc => 'Faire des étirements avant 9h';

  @override
  String get challenge7DayWarrior => 'Guerrier 7 jours';

  @override
  String get challenge7DayWarriorDesc =>
      'Compléter toutes les routines pendant 7 jours consécutifs';

  @override
  String get challengeGrowthTracker => 'Suivi de croissance';

  @override
  String get challengeGrowthTrackerDesc =>
      'Enregistrer une mesure de taille cette semaine';

  @override
  String get challengeHydrationWeek => 'Semaine hydratation';

  @override
  String get challengeHydrationWeekDesc =>
      'Atteindre l\'objectif d\'eau 5 jours cette semaine';

  @override
  String get challengeFitnessChampion => 'Champion fitness';

  @override
  String get challengeFitnessChampionDesc =>
      'Terminer 15 routines d\'exercice cette semaine';

  @override
  String get challengeSleepMaster => 'Maître du sommeil';

  @override
  String get challengeSleepMasterDesc =>
      'Enregistrer 8+ heures de sommeil pendant 5 jours';

  @override
  String get performanceDashboard => 'TABLEAU DE PERFORMANCE';

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
  String get maxTierReached => 'NIVEAU MAXIMUM ATTEINT';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Prochain : $tier · +$pts pts requis';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Gérer les routines';

  @override
  String get manageRoutinesSubtitle =>
      'Afficher ou masquer les routines de votre liste quotidienne';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible sur $total actives';
  }

  @override
  String get showAll => 'Tout afficher';

  @override
  String get hideAll => 'Tout masquer';

  @override
  String get heightAnalysis => 'Analyse de Taille';

  @override
  String get heightVsPopulation => 'Ta Position dans la Population Mondiale';

  @override
  String get globalAveragesTable => 'Moyennes Mondiales par Âge';

  @override
  String get standingTall => 'Grande Stature';

  @override
  String get standingAboveAverage => 'Au-dessus de la Moyenne';

  @override
  String get standingBelowAverage => 'En Dessous de la Moyenne';

  @override
  String get standingShort => 'En Retard sur les Pairs';

  @override
  String get yourHeightStanding => 'TON CLASSEMENT EN TAILLE';

  @override
  String get bellCurveCaption => 'Répartition de la taille à ton âge';

  @override
  String get bellShorterThanYou => 'plus petits que toi';

  @override
  String get yourHeight => 'Toi';

  @override
  String peerAvg(int age) {
    return 'Moy. $age ans';
  }

  @override
  String get aboveAvg => 'Au-dessus';

  @override
  String get belowAvg => 'En dessous';

  @override
  String get whoDataSource => 'Référence Mondiale OMS 2007';

  @override
  String get percentileShort5 => '5e';

  @override
  String get percentileShort50 => '50e';

  @override
  String get percentileShort95 => '95e';

  @override
  String get youLabel => 'Toi';

  @override
  String get avgHeightLabel => 'MOY';

  @override
  String get percentileLabel => 'PCT';

  @override
  String get diffLabel => 'DIFF';

  @override
  String get whoSourceNote =>
      'Source: Référence de croissance OMS 2007 & estimations mondiales NCD-RisC. Les percentiles sont des moyennes mondiales et peuvent varier selon le pays.';

  @override
  String get quickPhotos => 'Photos';

  @override
  String get quickPosture => 'Posture';

  @override
  String get quickWellness => 'Bien-être';

  @override
  String get quickRecipes => 'Recettes';

  @override
  String get wellnessTitle => 'Suivi Bien-être';

  @override
  String get wellnessHeader => 'BIEN-ÊTRE';

  @override
  String get wellnessSubtitle =>
      'Suis les facteurs qui influencent ta croissance';

  @override
  String get caffeineToday => 'Caféine aujourd\'hui';

  @override
  String get withinLimits => 'Dans les limites saines';

  @override
  String get approachingLimit => 'Proche de la limite';

  @override
  String get overLimit => 'Limite dépassée, affecte l\'HGH';

  @override
  String get resetToday => 'Réinitialiser aujourd\'hui';

  @override
  String get stressToday => 'Stress aujourd\'hui';

  @override
  String get stressVeryCalmLabel => 'Très calme, idéal pour la croissance';

  @override
  String get stressCalmLabel => 'Calme';

  @override
  String get stressNeutralLabel => 'Neutre';

  @override
  String get stressStressedLabel => 'Stressé';

  @override
  String get stressVeryStressedLabel =>
      'Très stressé, le cortisol bloque l\'HGH';

  @override
  String get stressTapToLog => 'Touche pour noter ton humeur du jour';

  @override
  String get todaysJournal => 'Journal du jour';

  @override
  String get journalNoNote => '(pas de note)';

  @override
  String get journalEdit => 'Modifier';

  @override
  String get journalHowWasToday => 'Comment était aujourd\'hui ?';

  @override
  String get journalSaved => 'Journal enregistré · +5 XP';

  @override
  String get journalSaveEntry => 'Enregistrer';

  @override
  String get weeklyInsight => 'Bilan hebdomadaire';

  @override
  String get weeklyInsightCaffeine => 'CAFÉINE';

  @override
  String get weeklyInsightStress => 'STRESS';

  @override
  String get weeklyInsightMood => 'HUMEUR';

  @override
  String get wellnessInfoTitle => 'Pourquoi le bien-être compte';

  @override
  String get wellnessInfoBody =>
      'La caféine perturbe le sommeil profond, moment où la majorité de l\'hormone de croissance (HGH) est libérée. Le stress chronique augmente le cortisol, qui supprime directement l\'HGH. Tenir un journal aide à maintenir les habitudes qui soutiennent la croissance.';

  @override
  String get wellnessInfoGotIt => 'Compris';

  @override
  String get insightCaffeineHigh =>
      'Ta consommation de caféine est élevée cette semaine. Essaie de réduire pour mieux dormir et pour l\'HGH.';

  @override
  String get insightStressHigh =>
      'Ton stress est élevé cette semaine. Essaie des exercices de respiration : le cortisol bloque la croissance.';

  @override
  String get insightMoodLow =>
      'L\'humeur est basse récemment. Le soleil, le sommeil et l\'exercice léger aident.';

  @override
  String get insightGreat =>
      'Excellent équilibre cette semaine. Ton bien-être soutient une croissance optimale.';

  @override
  String get insightDefault =>
      'Ton bien-être est sur la bonne voie. Continue à noter pour des analyses plus fines.';

  @override
  String get insightNeedMoreData =>
      'Note encore quelques jours pour voir les analyses.';

  @override
  String get progressPhotosTitle => 'Photos de progrès';

  @override
  String get progressPhotosHeader => 'PHOTOS DE PROGRÈS';

  @override
  String get progressPhotosSubtitle => 'Suivez votre parcours visuel';

  @override
  String get addProgressPhoto => 'Ajouter une photo';

  @override
  String get captureJourney => 'Capturez votre parcours visuel';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get chooseFromLibrary => 'Choisir dans la galerie';

  @override
  String get deletePhotoTitle => 'Supprimer la photo ?';

  @override
  String get deletePhotoBody =>
      'Cette photo sera retirée de ta chronologie de progression.';

  @override
  String get timelineTab => 'Chronologie';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'photos',
      one: 'photo',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$cm $unit en $days jours';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'jours',
      one: 'jour',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '$unit gagnés';
  }

  @override
  String get firstPhotoMessage =>
      'Prenez votre première photo pour commencer à suivre votre progrès visuel.';

  @override
  String get takeFirstPhoto => 'Première photo';

  @override
  String get beforeAfter => 'AVANT / APRÈS';

  @override
  String get beforeLabel => 'AVANT';

  @override
  String get afterLabel => 'APRÈS';

  @override
  String get yourHeightDialog => 'Ta taille';

  @override
  String get heightDialogMessage =>
      'Entre ta taille actuelle en cm pour cette photo';

  @override
  String get postureAnalysisTitle => 'Analyse posturale';

  @override
  String get postureCoachHeader => 'COACH POSTURE';

  @override
  String get postureCoachSubtitle => 'Auto-test avec ta photo de profil';

  @override
  String get latestScore => 'DERNIER SCORE';

  @override
  String get latestAnalysis => 'DERNIÈRE ANALYSE';

  @override
  String get headPosition => 'Position de la tête';

  @override
  String get progressLabel => 'PROGRÈS';

  @override
  String get choosePhotoSource => 'Choisir la source photo';

  @override
  String get sideProfileHint => 'Profil latéral, corps entier dans le cadre';

  @override
  String get howToTakePhoto => 'COMMENT PRENDRE LA PHOTO';

  @override
  String get takePosturePhoto => 'Photo de posture';

  @override
  String get postureExcellent => 'Excellent';

  @override
  String get postureGood => 'Bon';

  @override
  String get postureNeedsWork => 'À améliorer';

  @override
  String get posturePoor => 'Mauvais';

  @override
  String get recommendedExercises => 'EXERCICES RECOMMANDÉS';

  @override
  String get postureWallStand => 'Posture au mur';

  @override
  String get postureWallStandDesc =>
      'Tiens-toi dos au mur pendant 2 minutes par jour.';

  @override
  String get postureChestOpener => 'Ouverture du thorax';

  @override
  String get postureChestOpenerDesc =>
      'Ouvre les pectoraux serrés qui tirent les épaules vers l\'avant.';

  @override
  String get postureChinTucks => 'Rentrée du menton';

  @override
  String get postureChinTucksDesc =>
      'Corrige la tête vers l\'avant — 3×10 répétitions.';

  @override
  String get postureDeadbug => 'Deadbug';

  @override
  String get postureDeadbugDesc =>
      'Renforce le noyau profond pour le contrôle de la lordose.';

  @override
  String get recipesTitle => 'Recettes';

  @override
  String get recipesHeader => 'RECETTES';

  @override
  String get recipesSubtitle => 'Nourris ta croissance';

  @override
  String get recipesCategoryAll => 'Toutes';

  @override
  String get recipesCategoryBreakfast => 'Petit-déjeuner';

  @override
  String get recipesCategoryLunch => 'Déjeuner';

  @override
  String get recipesCategoryDinner => 'Dîner';

  @override
  String get recipesCategorySnack => 'Collation';

  @override
  String get recipesGoalAll => 'Tous';

  @override
  String get recipeDiffEasy => 'Facile';

  @override
  String get recipeDiffMedium => 'Moyen';

  @override
  String get recipeDiffHard => 'Difficile';

  @override
  String get recipesFilterType => 'TYPE';

  @override
  String get recipesFilterNutrient => 'RICHE EN';

  @override
  String get recipesGoalVitaminD => 'Vitamine D';

  @override
  String get recipesGoalZinc => 'Zinc';

  @override
  String get recipesGoalMagnesium => 'Magnésium';

  @override
  String recipesCountLabel(int count) {
    return '$count recettes';
  }

  @override
  String get recipeIngredients => 'Ingrédients';

  @override
  String get recipeSteps => 'Préparation';

  @override
  String get recipesGoalProtein => 'Riche en protéines';

  @override
  String get recipesGoalCalcium => 'Calcium';

  @override
  String get recipesGoalOmega3 => 'Oméga-3';

  @override
  String get recipesGoalIron => 'Fer';

  @override
  String get recipesNoMatch => 'Aucune recette ne correspond à ces filtres';

  @override
  String get recipesIngredients => 'Ingrédients';

  @override
  String get recipesInstructions => 'Instructions';

  @override
  String get recipesClose => 'FERMER';

  @override
  String get recipesAboutTitle => 'À propos des recettes';

  @override
  String get recipesAboutBody =>
      'Des recettes sélectionnées pour nourrir ta croissance. Filtre par type de repas ou objectif nutritionnel pour trouver celle qui colle à ton plan.';

  @override
  String get animHintSpinalDecomp => 'Décompression vertébrale';

  @override
  String get animHintGravityReversal => 'Inversion de gravité';

  @override
  String get animHintImpactBones => 'Charge d\'impact osseuse';

  @override
  String get animHintHighImpact => 'Charge osseuse élevée';

  @override
  String get animHintMetabolicBurst => 'Entraînement métabolique intense';

  @override
  String get animHintFullBodyStretch => 'Étirement d\'éveil complet';

  @override
  String get animHintSpinalExtension => 'Extension vertébrale';

  @override
  String get animHintCervicalDecomp => 'Décompression cervicale';

  @override
  String get animHintShoulderMobility => 'Mobilité des épaules';

  @override
  String get animHintFullBodyMotion => 'Mouvement complet du corps';

  @override
  String get animHintPosteriorChain => 'Étirement chaîne postérieure';

  @override
  String get animHintMuscleGrowth => 'Carburant de croissance musculaire';

  @override
  String get animHintBoneDensity => 'Soutien de la densité osseuse';

  @override
  String get animHintSpinalDisc => 'Hydratation des disques';

  @override
  String get animHintCleanNutrition => 'Nutrition propre';

  @override
  String get animHintIgf1 => 'Optimisation IGF-1';

  @override
  String get animHintHghAmino => 'Précurseur amino HGH';

  @override
  String get animHintCalciumAbsorption => 'Absorption du calcium';

  @override
  String get animHintSpinalAlignment => 'Alignement vertébral';

  @override
  String get animHintPostureCorrection => 'Correction posturale';

  @override
  String get animHintMindBody => 'Équilibre corps-esprit';

  @override
  String get animHintCoreStability => 'Stabilité du noyau';

  @override
  String get animHintLegPower => 'Puissance des jambes & poussée HGH';

  @override
  String get animHintVerticalPower => 'Puissance verticale';

  @override
  String get animHintHghSurge => 'Entraînement poussée HGH';

  @override
  String get animHintPeakHgh => 'Fenêtre de libération max HGH';

  @override
  String get animHintMelatonin => 'Optimisation de la mélatonine';

  @override
  String get animHintDeepSleep => 'Configuration du sommeil profond';

  @override
  String get animHintSleepOpt => 'Optimisation du sommeil';

  @override
  String get animHintExercise => 'Exercice';

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
      'Répartis tes protéines sur 3-4 repas. Mange des œufs, du poulet, du poisson, des produits laitiers et des légumineuses.';

  @override
  String get formCalciumVitaminD =>
      'Prends 3 portions de produits laitiers par jour et expose-toi 15 minutes au soleil pour que ton corps fabrique de la vitamine D.';

  @override
  String get formWater =>
      'Bois de l\'eau régulièrement tout au long de la journée. Garde une gourde avec toi et mets des rappels toutes les heures.';

  @override
  String get formAvoidJunk =>
      'Remplace le fast-food par des aliments bruts. Échange les boissons sucrées contre de l\'eau. Lis les étiquettes et évite les ingrédients transformés.';

  @override
  String get formZincIntake =>
      'Ajoute de la viande rouge, des graines de courge, des pois chiches, des noix de cajou et des huîtres à tes repas. Vise 8-11 mg par jour.';

  @override
  String get formVitaminDSunlight =>
      'Expose tes bras et ton visage au soleil direct pendant 15 minutes, de préférence avant midi. Pas besoin de crème solaire pour une durée aussi courte.';

  @override
  String get formArginineFoods =>
      'Ajoute des noix, des graines, de la dinde, du poulet, du soja et des produits laitiers à tes repas. Idéal avant de dormir.';

  @override
  String get formDailyCalories =>
      'Répartis tes calories sur 3 à 5 repas et ne saute pas le petit-déjeuner. Privilégie les aliments complets aux calories vides.';

  @override
  String get formQualitySleep =>
      'Couche-toi avant 22 h. Garde la chambre sombre et fraîche. Plus de caféine après 14 h.';

  @override
  String get formNoScreen =>
      'Mets une alarme 1 heure avant le coucher. Range tous les écrans. Lis un livre ou fais des étirements doux à la place.';

  @override
  String get formSleepEnvironment =>
      'Utilise des rideaux occultants, garde la chambre entre 18 et 20 °C et éteins toutes les sources de lumière. Dors sur un matelas et un oreiller confortables.';

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
      'Les étirements du matin soulagent les disques de la colonne, réhydratés pendant la nuit, et t\'aident à garder ta taille au fil de la journée';

  @override
  String get sciBarHanging =>
      'La suspension soulage les disques vertébraux grâce à la gravité qui étire la colonne, ce qui peut te faire gagner un peu de taille temporairement';

  @override
  String get sciCobraStretch =>
      'Le cobra étire la colonne et ouvre la poitrine, ce qui compense la compression due à la position assise';

  @override
  String get sciJumping =>
      'Les sauts avec impact sollicitent les cartilages de croissance des jambes et stimulent la libération d\'hormone de croissance';

  @override
  String get sciSwimmingBasketball =>
      'La natation et le basket font travailler tout le corps en extension, en saut et en allonge, ce qui sollicite les cartilages de croissance';

  @override
  String get sciEveningYoga =>
      'Le yoga du soir réduit le cortisol, qui freine l\'hormone de croissance, et étire les muscles pour la récupération de la nuit';

  @override
  String get sciSprintIntervals =>
      'Le sprint provoque une forte libération d\'hormone de croissance';

  @override
  String get sciHiitWorkout =>
      'L\'exercice intense peut augmenter l\'hormone de croissance jusqu\'à 450 %';

  @override
  String get sciSquats =>
      'Les squats sollicitent les cartilages de croissance des jambes et de la colonne';

  @override
  String get sciDeadliftStretch =>
      'Soulager la colonne favorise la santé des disques vertébraux';

  @override
  String get sciOverheadPress =>
      'Pousser au-dessus de la tête étire la colonne et renforce les muscles de la posture';

  @override
  String get sciSkippingRope =>
      'Les sauts répétés sollicitent les cartilages de croissance des jambes';

  @override
  String get sciPilatesCore =>
      'Une sangle abdominale solide soutient l\'alignement de la colonne et ta posture';

  @override
  String get sciInversionHang =>
      'L\'inversion soulage les disques vertébraux et peut ajouter 1-2 cm temporairement';

  @override
  String get sciProtein =>
      'Les protéines apportent les acides aminés dont tes os et tes muscles ont besoin pour grandir, surtout pendant les poussées de croissance';

  @override
  String get sciCalciumVitaminD =>
      'Le calcium et la vitamine D sont les bases de la densité osseuse et de la croissance des os en longueur';

  @override
  String get sciWater =>
      'Bien t\'hydrater transporte les nutriments vers les cartilages de croissance et garde le cartilage des articulations en bonne santé';

  @override
  String get sciAvoidJunk =>
      'Les aliments transformés et le sucre provoquent de l\'inflammation et des pics d\'insuline qui freinent la sécrétion d\'hormone de croissance';

  @override
  String get sciZincIntake =>
      'Le zinc est essentiel à la production d\'hormone de croissance';

  @override
  String get sciVitaminDSunlight =>
      'La vitamine D est indispensable pour absorber le calcium et faire grandir les os';

  @override
  String get sciArginineFoods =>
      'La L-arginine stimule la sécrétion d\'hormone de croissance';

  @override
  String get sciDailyCalories =>
      'Un déficit calorique prolongé fait baisser l\'IGF-1 et affaiblit les pics d\'hormone de croissance, ce qui ralentit directement la croissance linéaire à l\'adolescence';

  @override
  String get sciQualitySleep =>
      '70-80 % de l\'hormone de croissance de la journée est libérée pendant le sommeil profond, surtout entre 22 h et 2 h';

  @override
  String get sciNoScreen =>
      'La lumière bleue des écrans freine la production de mélatonine, retarde l\'endormissement et réduit la qualité du sommeil profond';

  @override
  String get sciSleepEnvironment =>
      'Une chambre sombre et fraîche favorise la mélatonine et l\'hormone de croissance';

  @override
  String get sciPreSleepRoutine =>
      'Une routine régulière avant le coucher améliore la qualité du sommeil profond de 23 %';

  @override
  String get sciPostureCheck =>
      'Une bonne posture peut te faire paraître 2-3 cm plus grand tout de suite et évite la compression de la colonne';

  @override
  String get sciWallStand =>
      'Se tenir contre le mur entraîne la mémoire musculaire de ta posture pour garder la colonne bien alignée toute la journée';

  @override
  String get sciNeckStretches =>
      'Les étirements du cou soulagent la compression et améliorent l\'alignement cervical';

  @override
  String get sciShoulderRolls =>
      'Ouvrir les épaules corrige une posture penchée en avant et peut te faire paraître 1-2 cm plus grand';

  @override
  String get muscleSpine => 'Colonne vertébrale';

  @override
  String get muscleLegs => 'Jambes';

  @override
  String get muscleBack => 'Dos';

  @override
  String get muscleShoulders => 'Épaules';

  @override
  String get muscleArms => 'Bras';

  @override
  String get muscleCore => 'Abdominaux';

  @override
  String get muscleChest => 'Poitrine';

  @override
  String get muscleCalves => 'Mollets';

  @override
  String get muscleFullBody => 'Corps entier';

  @override
  String get muscleHips => 'Hanches';

  @override
  String get muscleBones => 'Os';

  @override
  String get muscleMuscles => 'Muscles';

  @override
  String get muscleNeck => 'Cou';

  @override
  String get muscleUpperSpine => 'Colonne sup.';

  @override
  String get muscleUpperBack => 'Haut du dos';

  @override
  String get createRoutine => 'Créer une routine';

  @override
  String get createRoutineTitle => 'Créer une routine personnalisée';

  @override
  String get createRoutineSubtitle => 'Construis ta propre routine quotidienne';

  @override
  String get routineIcon => 'Icône';

  @override
  String get routineTitleField => 'Titre';

  @override
  String get routineDescField => 'Description';

  @override
  String get routineDescHint => 'Résumé court de la routine';

  @override
  String get routineCategoryField => 'Catégorie';

  @override
  String get routineDifficultyField => 'Difficulté';

  @override
  String get routineDurationField => 'Durée';

  @override
  String get routineSetsRepsField => 'Séries x Répétitions';

  @override
  String get routineFormField => 'Instructions';

  @override
  String get routineFormHint => 'Facultatif : comment faire cette routine';

  @override
  String get diffBeginner => 'Débutant';

  @override
  String get diffIntermediate => 'Intermédiaire';

  @override
  String get diffAdvanced => 'Avancé';

  @override
  String get catExercise => 'Exercice';

  @override
  String get catNutrition => 'Nutrition';

  @override
  String get catSleep => 'Sommeil';

  @override
  String get catPosture => 'Posture';

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
  String get kyphosisLabel => 'Cyphose (haut du dos)';

  @override
  String get lordosisLabel => 'Lordose (bas du dos)';

  @override
  String get analyzingPosture => 'ANALYZING POSTURE';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String version(String ver) {
    return 'Version $ver';
  }

  @override
  String get rateApp => 'Rate BeTaller';

  @override
  String get rateAppSubtitle => 'Your review helps us grow!';

  @override
  String get unitSystem => 'Système d\'unités';

  @override
  String get unitMetric => 'Métrique (cm, kg)';

  @override
  String get unitImperial => 'Impérial (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'Health Disclaimer';

  @override
  String get healthDisclaimerBody =>
      'BeTaller provides general wellness and fitness guidance. Results vary based on age, genetics, and individual factors. This app does not provide medical advice. Exercises focus on posture optimization, spinal health, and growth hormone support through natural habits. Consult a healthcare professional before starting any new exercise or nutrition program. Height changes after growth plate closure (typically 18-25) are primarily from posture improvement.';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'Consomme aujourd\'hui au moins ${grams}g de protéines — calculé selon ton poids.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'Bois aujourd\'hui au moins ${liters}L d\'eau — calculé selon ton poids.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'Vise environ $kcal kcal aujourd\'hui pour soutenir ta croissance.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'Prends aujourd\'hui $iu UI de vitamine D — via le soleil, l\'alimentation ou un complément.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'Prends aujourd\'hui ${mg}mg de zinc pour soutenir la production d\'hormone de croissance.';
  }

  @override
  String get nutritionSupplementsTitle => 'COMPLÉMENTS';

  @override
  String get nutritionSupplementsDisclaimer =>
      'Un soutien optionnel, pas un substitut à l\'alimentation. Parle à un médecin avant de commencer un complément, surtout avant 18 ans.';

  @override
  String get supplementVitaminDName => 'Vitamine D3';

  @override
  String get supplementVitaminDDose => '3 000 UI';

  @override
  String get supplementVitaminDBenefit =>
      'Améliore l\'absorption du calcium pour la densité osseuse et la santé des cartilages de croissance';

  @override
  String get supplementZincName => 'Zinc';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit =>
      'Un minéral clé pour la production d\'hormone de croissance';

  @override
  String get supplementMagnesiumName => 'Magnésium';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit =>
      'Favorise la phase de sommeil profond, où l\'hormone de croissance est le plus libérée';

  @override
  String get supplementCalciumName => 'Calcium';

  @override
  String get supplementCalciumDose => '1 000-1 300mg';

  @override
  String get supplementCalciumBenefit =>
      'L\'élément de base de la densité osseuse et des cartilages de croissance';

  @override
  String get supplementOmega3Name => 'Oméga-3';

  @override
  String get supplementOmega3Dose => '1 000mg';

  @override
  String get supplementOmega3Benefit =>
      'Réduit l\'inflammation et soutient le bon fonctionnement des cartilages de croissance';

  @override
  String get supplementCollagenName => 'Collagène + Vitamine C';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit =>
      'La vitamine C aide ton corps à utiliser le collagène pour construire cartilage et matrice osseuse';

  @override
  String get sciSourcePrefix => 'Source: ';

  @override
  String get program => 'Programme';

  @override
  String get todaysExercises => 'EXERCICES DU JOUR';

  @override
  String get dailyNutritionPlan => 'PLAN NUTRITION QUOTIDIEN';

  @override
  String get nutritionGoalsComplete =>
      '🎉 Tous les objectifs nutritionnels atteints !';

  @override
  String get nutritionGoalsIncomplete =>
      'Atteins tes objectifs nutritionnels pour une croissance optimale';

  @override
  String get postureDetectingAlignment =>
      'Détection de l\'alignement de la colonne...';

  @override
  String get testimonial1 =>
      'Je n\'avais plus d\'espoir à cause de mon âge, mais j\'ai grandi avec BeTaller.';

  @override
  String get testimonialDuration1 => '4 mois';

  @override
  String get testimonial2 =>
      'Tout le monde disait que je ne pouvais plus grandir. BeTaller les a surpris.';

  @override
  String get testimonialDuration2 => '3 mois';

  @override
  String get testimonial3 =>
      'Après les routines, j\'ai grandi et ma posture s\'est améliorée.';

  @override
  String get testimonialDuration3 => '6 mois';

  @override
  String get testimonial4 =>
      'Je suis encore en croissance et l\'effet de BeTaller est incroyable.';

  @override
  String get testimonialDuration4 => '3 mois';

  @override
  String get testimonial5 =>
      'J\'ai remarqué une vraie différence rapidement. Je recommande fortement.';

  @override
  String get testimonialDuration5 => '4 mois';

  @override
  String get designedForYou => 'Conçu pour toi';

  @override
  String get designedForYouDesc =>
      'BeTaller a été conçu spécialement pour t\'aider à atteindre ton potentiel génétique.';

  @override
  String get greetingAllDone => 'Excellent ! 🎯';

  @override
  String get greetingAllDoneSub => 'Tu as terminé les tâches du jour.';

  @override
  String greetingStreak30(int streak) {
    return 'Série de $streak jours. Niveau légendaire.';
  }

  @override
  String greetingStreak7(int streak) {
    return 'Série de $streak jours. Continue comme ça.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak jours d\'affilée. La plupart abandonnent. Pas toi.';
  }

  @override
  String get greetingMorning =>
      'Bonjour. Un nouveau jour, une nouvelle chance.';

  @override
  String get greetingAfternoon =>
      'Aujourd\'hui est parfait pour commencer ta série.';

  @override
  String get greetingEvening => 'Termine tes tâches, commence ta série.';

  @override
  String get todayCompleted => 'Aujourd\'hui terminé ✓';

  @override
  String get todayGoals => 'Objectifs du jour';

  @override
  String get challengesLabel => 'Défis';

  @override
  String get dailyChallengesLabel => 'DÉFIS QUOTIDIENS';

  @override
  String get expiresTonight => 'Expire ce soir';

  @override
  String get allChallengesCompleted => 'Tous terminés ✓';

  @override
  String get challengesLoading => 'Nouveaux défis bientôt.';

  @override
  String get challengesLoadingTitle => 'Défis quotidiens';

  @override
  String get behindPace => 'En retard';

  @override
  String get growthTracking => 'Suivi de croissance';

  @override
  String get growthEmptyFirst =>
      'Enregistre ta première taille pour commencer le suivi.';

  @override
  String get growthEmptySecond => '2e mesure pour voir le graphique.';

  @override
  String get growthSectionLabel => 'CROISSANCE';

  @override
  String get generalPerformance => 'PERFORMANCE GÉNÉRALE';

  @override
  String get analysisBalance => 'Ton équilibre';

  @override
  String get analysisWeakest => 'Ton point faible';

  @override
  String get analysisPrediction => 'Prédiction de taille';

  @override
  String get analysisComparison => 'Comparaison';

  @override
  String get analysisGrowth => 'État de croissance';

  @override
  String get analysisWeakestHint =>
      'C\'est ici que tu peux le plus vite améliorer ton score.';

  @override
  String get exploreLabel => 'EXPLORER';

  @override
  String get explorePosture => 'Analyse posturale';

  @override
  String get explorePostureSub => 'Analyse et conseils de posture';

  @override
  String get explorePhotos => 'Photos de progrès';

  @override
  String get explorePhotosSub => 'Suivez votre transformation en photos';

  @override
  String get exploreNutrition => 'Nutrition';

  @override
  String get exploreNutritionSub => 'Guide protéines, calcium et vitamines';

  @override
  String get exploreHealth => 'Suivi santé';

  @override
  String get exploreHealthSub => 'Suivi stress, caféine et bien-être';

  @override
  String get exploreRecipes => 'Recettes croissance';

  @override
  String get exploreRecipesSub => 'Recettes qui favorisent la croissance';

  @override
  String get educationLabel => 'ÉDUCATION';

  @override
  String get educationTitle => 'Science de la\ncroissance';

  @override
  String get educationSubtitle => 'Contenus experts, recherches et guides';

  @override
  String get aiAnalysisLabel => 'ANALYSE DE CROISSANCE';

  @override
  String get peerCompareLabel => 'COMPARER AVEC TES PAIRS';

  @override
  String peerCompareText(int topPct) {
    return 'Tu es dans le Top $topPct% de tes pairs';
  }

  @override
  String get notifWaterTitle => '💧 N\'oublie pas de boire !';

  @override
  String get notifWaterBody => 'Objectif atteint ? Bois encore un verre !';

  @override
  String get notifMorningTitle => '🌅 Bonjour ! Exercice';

  @override
  String get notifMorningBody =>
      'Étirements matinaux ! 10 minutes pour colonne et jambes.';

  @override
  String get notifRoutineTitle => '🔥 Complète tes routines !';

  @override
  String get notifRoutineBody =>
      'Vérifie tes routines avant la fin de la journée. Série = discipline !';

  @override
  String get notifProteinTitle => '🥚 Jour protéines !';

  @override
  String get notifProteinBody => 'Semaine forte ! Protéines à chaque repas.';

  @override
  String get notifNewWeekTitle => '✨ Nouvelle semaine !';

  @override
  String get notifNewWeekBody =>
      'Ne sautez pas vos routines. Petits pas, grands résultats !';

  @override
  String get notifSleepTitle => '😴 Sommeil !';

  @override
  String get notifSleepBody =>
      'L\'hormone de croissance est au max entre 22 h et 2 h. Pose ton téléphone !';

  @override
  String get notifPostureTitle => '🧍 Posture !';

  @override
  String get notifPostureBody =>
      'Dos droit, épaules en arrière. Bonne posture = 2-3 cm !';

  @override
  String get notifVitaminDTitle => '☀️ Vitamine D !';

  @override
  String get notifVitaminDBody =>
      '15 min de soleil ! Vitamine D favorise absorption du calcium.';

  @override
  String get notifMidweekTitle => '✨ Mi-semaine !';

  @override
  String get notifMidweekBody =>
      'Milieu de semaine. Patience et régularité. Continuez !';

  @override
  String get notifScreenTitle => '📵 Écrans éteints !';

  @override
  String get notifScreenBody =>
      'Pas d\'écrans 1h avant de dormir. Lumière bleue bloque mélatonine !';

  @override
  String get notifJumpTitle => '🦘 Sauter !';

  @override
  String get notifJumpBody => 'Sauts stimulent plaques de croissance. 3 x 20 !';

  @override
  String get notifCalciumTitle => '🥛 Calcium !';

  @override
  String get notifCalciumBody =>
      'Lait ou yaourt. Calcium essentiel pour les os !';

  @override
  String get notifPostureCheckTitle => '🧍 Posture !';

  @override
  String get notifPostureCheckBody =>
      'Ne penchez pas la tête sur le téléphone !';

  @override
  String get notifWeekendTitle => '✨ Motivation week-end';

  @override
  String get notifWeekendBody =>
      'Pas de pause le week-end ! Discipline chaque jour !';

  @override
  String get notifWeeklyProgressTitle => '📊 Progrès hebdo';

  @override
  String get notifWeeklyProgressBody =>
      'Comment va la semaine ? Vérifiez votre graphique !';

  @override
  String get notifMeasureTitle => '📏 Mesure hebdo !';

  @override
  String get notifMeasureBody =>
      'Mesure-toi et note ta taille ! Le matin, c\'est le plus précis.';

  @override
  String get notifEarlySleepTitle => '😴 Couchez-vous tôt !';

  @override
  String get notifEarlySleepBody =>
      'Demain lundi ! Bon sommeil. Au moins 8 heures.';

  @override
  String get notifStreak3Title => '🔥 Série de 3 jours !';

  @override
  String get notifStreak3Body =>
      'Super début ! 3 jours d\'affilée. Continue jusqu\'à 7 !';

  @override
  String get notifStreak7Title => '🏆 1 semaine !';

  @override
  String get notifStreak7Body => 'Incroyable ! 7 jours consécutifs !';

  @override
  String get notifStreak14Title => '⭐ 2 semaines !';

  @override
  String get notifStreak14Body =>
      '14 jours de discipline ! Ton corps commence à changer.';

  @override
  String get notifStreak30Title => '👑 1 mois !';

  @override
  String get notifStreak30Body => '30 jours ! Tu es un champion !';

  @override
  String get notifStreak60Title => '🌟 60 jours !';

  @override
  String get notifStreak60Body => '60 jours ! Exploit incroyable.';

  @override
  String get notifStreak100Title => '💎 100 JOURS ! LÉGENDAIRE !';

  @override
  String get notifStreak100Body =>
      '100 jours d\'affilée ! Tu es devenu une légende.';

  @override
  String get notifStreakRiskTitle => '⚠️ Ne perds pas ta série !';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Ta série de $streak jours est en danger ! Complète tes routines.';
  }

  @override
  String get paywallStat1 => 'cm — potentiel verrouillé';

  @override
  String get paywallTitle1 => 'Combien de cm\npouvez-vous grandir ?';

  @override
  String get paywallBullet1a => 'Plafond génétique calculé, le voir ?';

  @override
  String get paywallBullet1b =>
      'Comment votre mode de vie affecte la croissance ?';

  @override
  String get paywallBullet1c => 'Votre feuille de route personnalisée attend';

  @override
  String get paywallStat2 => 'routine personnalisée prête';

  @override
  String get paywallTitle2 => 'Votre plan\nest prêt';

  @override
  String get paywallBullet2a => '8 min chaque matin — pour votre colonne';

  @override
  String get paywallBullet2b => 'Sommeil, nutrition, eau — tout suivi';

  @override
  String get paywallBullet2c => 'Un pas de plus chaque jour';

  @override
  String get paywallStat3 => 'graphiques en temps réel';

  @override
  String get paywallTitle3 => 'Suivez votre\ncroissance';

  @override
  String get paywallBullet3a => 'Mesures mensuelles — voyez votre croissance';

  @override
  String get paywallBullet3b => '2 cm maintenant avec analyse posturale';

  @override
  String get paywallBullet3c => 'Photos de progrès — la différence';

  @override
  String get paywallStat4 => 'programme quotidien — monter';

  @override
  String get paywallTitle4 => 'Plus fort\nchaque jour';

  @override
  String get paywallBullet4a => 'XP, niveaux — habitudes = jeu';

  @override
  String get paywallBullet4b => 'Ceux qui ont réussi sont passés par ici';

  @override
  String get paywallBullet4c => 'Commencez — première semaine gratuite';

  @override
  String get paywallRestore => 'Aucun achat trouvé';

  @override
  String get paywallRestoreNotFound => 'Aucun achat trouvé';

  @override
  String get paywallPromoCode => 'Tu as un code promo ?';

  @override
  String get paywallHeightUnit => 'taille visée';

  @override
  String get paywallHeightTitle => 'Combien de cm peux-tu encore prendre ?';

  @override
  String get paywallHeightDesc =>
      'Nous analysons ta génétique, ton mode de vie et ta posture, puis traçons ta prévision année par année. Rien n’est figé : chaque effort la met à jour.';

  @override
  String get paywallGrowthUnit => 'cette année';

  @override
  String get paywallGrowthTitle => 'Nous suivons ta croissance avec toi';

  @override
  String get paywallGrowthDesc =>
      'Chaque mesure rejoint le graphique aussitôt. Tu vois ta progression mois après mois, centimètre après centimètre.';

  @override
  String get paywallPostureUnit => 'score de posture';

  @override
  String get paywallPostureTitle => 'Ta posture, la clé de tes routines';

  @override
  String get paywallPostureDesc =>
      'Une seule photo mesure cyphose, lordose et position de la tête, et tu reçois des routines de correction sur mesure. Une bonne posture vaut 2 à 3 cm.';

  @override
  String get paywallReportUnit => 'routines terminées';

  @override
  String get paywallReportTitle => 'Nous t’évaluons chaque semaine';

  @override
  String get paywallReportDesc =>
      'Eau, sommeil, routines et série sur un seul écran. Chaque semaine, nous repérons tes forces et tes manques.';

  @override
  String get paywallNutritionUnit => 'repas par jour';

  @override
  String get paywallNutritionTitle => 'Ton programme nutrition est prêt';

  @override
  String get paywallNutritionDesc =>
      'Du petit-déjeuner au dîner, un plan complet avec protéines, calcium, zinc et vitamine D déjà calculés.';

  @override
  String get paywallScoreUnit => 'Score BeTaller';

  @override
  String get paywallScoreTitle => 'Le système qui te fait progresser';

  @override
  String get paywallScoreDesc =>
      'Génétique, croissance, nutrition, sommeil et discipline se réunissent en un seul score. Dès qu’il baisse, tu vois où agir.';

  @override
  String get paywallPhotosUnit => 'différence visible';

  @override
  String get paywallPhotosTitle => 'Prouve ton évolution en photos';

  @override
  String get paywallPhotosDesc =>
      'Les comparaisons avant/après se créent toutes seules, et chaque photo mensuelle reste sur ta frise.';

  @override
  String get paywallReportStat => '82 %';

  @override
  String get journeyIntroTitle => 'Commençons en trois étapes';

  @override
  String get journeyIntroSubtitle =>
      'Nous installons BeTaller ensemble. Ta prochaine étape t’attend.';

  @override
  String get journeyStep1Title => 'Collecte de tes données';

  @override
  String get journeyStep1Desc =>
      'Nous prenons ta taille, ton âge et ton mode de vie, puis calculons ton potentiel.';

  @override
  String get journeyStep2Title => 'Visite de l’application';

  @override
  String get journeyStep2Desc =>
      'Nous passons en revue chaque fonction : à quoi elle sert et comment l’utiliser.';

  @override
  String get journeyStep3Title => 'À toi de jouer';

  @override
  String get journeyStep3Desc =>
      'Tu suis ta routine quotidienne et nous suivons ta progression.';

  @override
  String get journeyNow => 'MAINTENANT';

  @override
  String get journeyDone => 'FAIT';

  @override
  String get journeySoon => 'BIENTÔT';

  @override
  String get tourHomeStreakTitle => 'Ta Série';

  @override
  String get tourHomeStreakDesc =>
      'Augmente tant que tu gardes ta discipline. Rate un jour et elle repart à zéro.';

  @override
  String get tourHomeXpTitle => 'Ton Niveau';

  @override
  String get tourHomeXpDesc =>
      'Monte avec l\'XP que tu gagnes en restant discipliné. Ne dérape pas !';

  @override
  String get tourHomeGoalsTitle => 'Objectifs du Jour';

  @override
  String get tourHomeGoalsDesc =>
      'Affiche tes routines, tâches et objectif d\'eau du jour en un coup d\'œil.';

  @override
  String get tourHomeTrackTitle => 'Suivi Eau et Sommeil';

  @override
  String get tourHomeTrackDesc =>
      'Enregistre ton eau et ton sommeil du jour ici, en quelques secondes.';

  @override
  String get tourPlanTabsTitle =>
      'Trois Onglets : Aujourd\'hui, Discipline, Nutrition';

  @override
  String get tourPlanTabsDesc =>
      'Ta routine quotidienne, ton programme hebdomadaire et ton plan nutritionnel sont tous ici.';

  @override
  String get tourPlanLevelTitle => 'Ton Niveau de Discipline';

  @override
  String get tourPlanLevelDesc =>
      'Montre à quel point tu termines tes routines régulièrement. Monte de niveau pour de meilleurs résultats.';

  @override
  String get tourPlanTodayTitle => 'Plan du Jour';

  @override
  String get tourPlanTodayDesc =>
      'Coche tes routines quotidiennes ici pour faire grandir ta série.';

  @override
  String get tourPlanTodayListTitle => 'Tes Routines du Jour';

  @override
  String get tourPlanTodayListDesc =>
      'Coche chacune au fur et à mesure. Touche une routine pour voir les détails.';

  @override
  String get tourPlanWeekGoalsTitle => 'Cette Semaine';

  @override
  String get tourPlanWeekGoalsDesc =>
      'Jours parfaits, entraînements et la mesure demandée cette semaine, y compris celle obligatoire.';

  @override
  String get tourPlanMonthGoalsTitle => 'Ce Mois-ci';

  @override
  String get tourPlanMonthGoalsDesc =>
      'Photo de progression, contrôle de posture et les mesures de ce mois : celles à ne pas manquer.';

  @override
  String get tourProgressHeightTitle => 'Ta Taille Actuelle';

  @override
  String get tourProgressHeightDesc =>
      'Affiche ta taille actuelle et ton gain total. Ajoute une nouvelle mesure ici.';

  @override
  String get tourProgressPhotosTitle => 'Photos de Progression';

  @override
  String get tourProgressPhotosDesc =>
      'Suis ta transformation visuellement avec des photos prises régulièrement.';

  @override
  String get tourProgressPostureTitle => 'Analyse de Posture';

  @override
  String get tourProgressPostureDesc =>
      'Fais analyser ta posture à partir d\'une photo et découvre sur quoi travailler.';

  @override
  String get tourAnalysisScoreTitle => 'Ton Score BeTaller';

  @override
  String get tourAnalysisScoreDesc =>
      'Ton score global, calculé à partir de ta génétique, ta vitesse, ta nutrition et ton sommeil.';

  @override
  String get tourAnalysisPredictionTitle => 'Ta Prédiction de Taille';

  @override
  String get tourAnalysisPredictionDesc =>
      'Affiche ta taille finale prédite et ta trajectoire année par année.';

  @override
  String get tourAnalysisPeerTitle => 'Compare-toi à tes Pairs';

  @override
  String get tourAnalysisPeerDesc =>
      'Vois ton classement et compare-toi à d\'autres de ton âge.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'Tes Routines';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'Vois combien de routines d\'exercice il te reste à terminer aujourd\'hui.';

  @override
  String get tourHomeGoalsChallengesTitle => 'Tes Tâches';

  @override
  String get tourHomeGoalsChallengesDesc =>
      'Suis la progression de tes défis actifs juste ici.';

  @override
  String get tourHomeGoalsWaterTitle => 'Ton Objectif d\'Eau';

  @override
  String get tourHomeGoalsWaterDesc =>
      'Vois à quel point tu es proche de ton objectif d\'eau quotidien.';

  @override
  String get tourHomeReminderTitle => 'Ton Prochain Rappel';

  @override
  String get tourHomeReminderDesc =>
      'Vois quand arrive ton prochain rappel, et modifie-le ici.';

  @override
  String get tourHomeChallengesTitle => 'Tes Défis';

  @override
  String get tourHomeChallengesDesc =>
      'Termine les défis actifs pour gagner de l\'XP supplémentaire.';

  @override
  String get tourHomeGrowthTitle => 'Ton État de Croissance';

  @override
  String get tourHomeGrowthDesc =>
      'Vois l\'écart entre ta mesure totale et la plus récente, et combien tu en as enregistré.';

  @override
  String get tourHomeExploreTitle => 'Explorer';

  @override
  String get tourHomeExploreDesc =>
      'Guides nutritionnels, recettes de croissance et plus encore t\'attendent ici.';

  @override
  String get tourPlanProgramHeaderTitle => 'Ton Programme de 70 Jours';

  @override
  String get tourPlanProgramHeaderDesc =>
      'Vois ta progression globale, ton niveau actuel et ton jour dans cet anneau.';

  @override
  String get tourPlanProgramLevelsTitle => 'Niveaux';

  @override
  String get tourPlanProgramLevelsDesc =>
      'Vois sur lequel des 10 niveaux tu es, et lesquels sont encore verrouillés.';

  @override
  String get tourPlanNutritionHeaderTitle => 'Ta Progression Nutritionnelle';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'Suis combien de tes routines nutritionnelles quotidiennes tu as terminées.';

  @override
  String get tourPlanNutritionFirstTitle => 'Routines Nutritionnelles';

  @override
  String get tourPlanNutritionFirstDesc =>
      'Coche les habitudes nutritionnelles qui soutiennent ta croissance.';

  @override
  String get tourProgressChartTitle => 'Courbe de Croissance';

  @override
  String get tourProgressChartDesc =>
      'Vois tes mesures passées sur un graphique et comprends où tu vas.';

  @override
  String get tourProgressReportTitle => 'Rapport Hebdomadaire';

  @override
  String get tourProgressReportDesc =>
      'Consulte le rapport qui résume la progression de ta semaine.';

  @override
  String get tourProgressHistoryTitle => 'Ton Historique de Mesures';

  @override
  String get tourProgressHistoryDesc =>
      'Vois chaque mesure de taille enregistrée sur une chronologie.';

  @override
  String get tourAnalysisRadarTitle => 'Ton Graphique d\'Équilibre';

  @override
  String get tourAnalysisRadarDesc =>
      'Vois ton équilibre entre génétique, vitesse de croissance, nutrition, sommeil et discipline sur un graphique radar, et découvre ton maillon faible.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'Tes Besoins Quotidiens';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'Vois tes besoins quotidiens en protéines, calories, sommeil et eau, adaptés à ta taille et ton poids.';

  @override
  String get journeyDataDoneTitle => 'Première étape terminée';

  @override
  String get journeyDataDoneSubtitle =>
      'Nous avons tes données et ton potentiel. Place à la visite guidée.';

  @override
  String get journeyContinue => 'Continuer';

  @override
  String get journeyEnterApp => 'Ouvrir l’application';

  @override
  String get journeyProgressLabel => 'Démarrage';

  @override
  String get journeyTourDoneTitle => 'Bienvenue sur BeTaller !';

  @override
  String get journeyTourDoneSubtitle =>
      'Tu as terminé les trois étapes. À toi de jouer : commence ton parcours en complétant ta première routine.';

  @override
  String get journeyViewPlansButton => 'Voir les plans pour commencer';

  @override
  String get paywallRestoreLabel => 'Restaurer les achats';

  @override
  String get paywallYearly => 'Annuel';

  @override
  String get paywallBestValue => 'Meilleur rapport';

  @override
  String paywallSavePercent(String percent) {
    return 'ÉCONOMISE $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/semaine';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/mois';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/an';
  }

  @override
  String get paywallMonthly => 'Mensuel';

  @override
  String get paywallWeekly => 'Hebdomadaire';

  @override
  String get paywallFreeTrial => '3 jours gratuits';

  @override
  String get paywallLoadError => 'Impossible de charger les offres, réessaie';

  @override
  String get paywallCtaAlt => 'Continuer';

  @override
  String get paywallTrialDisclaimer =>
      '3 jours gratuits · renouvellement auto · annulation à tout moment';

  @override
  String get paywallYearlyDisclaimer =>
      'Renouvellement annuel auto · annulation à tout moment';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '$days jours gratuits, puis $price/semaine · annulation à tout moment';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '$days jours gratuits, puis $price/mois · annulation à tout moment';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '$days jours gratuits, puis $price/an · annulation à tout moment';
  }

  @override
  String get paywallRenewsWeekly =>
      'Renouvellement hebdomadaire auto · annulation à tout moment';

  @override
  String get paywallRenewsMonthly =>
      'Renouvellement mensuel auto · annulation à tout moment';

  @override
  String get resultCardTitle => 'Ta taille adulte estimée';

  @override
  String resultRange(String min, String max) {
    return 'Fourchette probable : de $min à $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'Tu dépasses $percent % des personnes de ton âge';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'Croissance restante estimée : $amount';
  }

  @override
  String get resultFootnote =>
      'Estimation basée sur la taille de tes parents et des courbes de croissance. Ce n\'est pas un avis médical.';

  @override
  String get postureCheckTitle => 'Test de posture rapide';

  @override
  String get postureCheckIntro =>
      'Place-toi dos au mur, talons, fesses et omoplates contre le mur, puis réponds à trois questions. Ton score vient de tes réponses ; la photo est gardée pour comparer avant et après.';

  @override
  String get postureQHead =>
      'L\'arrière de ta tête touche-t-il le mur sans lever le menton ?';

  @override
  String get postureQHeadA1 => 'Oui, facilement';

  @override
  String get postureQHeadA2 => 'Seulement en forçant';

  @override
  String get postureQHeadA3 => 'Non, il reste un espace';

  @override
  String get postureQShoulders =>
      'Sur ta photo de profil, où sont tes épaules par rapport à tes oreilles ?';

  @override
  String get postureQShouldersA1 => 'Alignées avec mes oreilles';

  @override
  String get postureQShouldersA2 => 'Un peu en avant';

  @override
  String get postureQShouldersA3 => 'Nettement enroulées vers l\'avant';

  @override
  String get postureQLowerBack =>
      'Glisse une main derrière le bas de ton dos. Combien d\'espace reste-t-il ?';

  @override
  String get postureQLowerBackA1 => 'Une main à plat passe tout juste';

  @override
  String get postureQLowerBackA2 => 'Aucun espace';

  @override
  String get postureQLowerBackA3 => 'Un poing passe';

  @override
  String get postureCheckSave => 'Voir mon score';

  @override
  String get postureCheckNote => 'Un auto-test, pas un examen médical.';

  @override
  String get paywallTester => 'Testeur';

  @override
  String get introTag1 => 'PRÉDICTION';

  @override
  String get introTag2 => 'CROISSANCE';

  @override
  String get introTag3 => 'SUIVI';

  @override
  String get introTag4 => 'GAMIFICATION';

  @override
  String get introTag5 => 'COMMUNAUTÉ';

  @override
  String get introTitle1 => 'Découvre ton\npotentiel de taille';

  @override
  String get introSubtitle1 =>
      'Calculons ton plein potentiel\nselon ta génétique, ton âge et ton mode de vie.';

  @override
  String get introTitle2 => 'Un centimètre de plus\nchaque jour';

  @override
  String get introSubtitle2 =>
      'Exploite ton potentiel avec des plans\nd\'exercice et de nutrition personnalisés.';

  @override
  String get introTitle3 => 'Suis chaque\ncentimètre';

  @override
  String get introSubtitle3 =>
      'Vois comment évolue ta vraie progression\navec des mesures mensuelles.';

  @override
  String get introTitle4 => 'Monte de niveau,\ngagne des récompenses';

  @override
  String get introSubtitle4 =>
      'Termine des programmes de 70 jours,\ngagne de l\'XP et débloque de nouveaux niveaux.';

  @override
  String get introTitle5 => 'Des milliers ont déjà\ngagné en taille';

  @override
  String get introSubtitle5 =>
      'Rejoins la communauté d\'utilisateurs\nqui ont atteint leur objectif.';

  @override
  String get criticalWindow => 'FENÊTRE CRITIQUE';

  @override
  String get heightPotentialFading => 'Les faits sur ton';

  @override
  String get fadingAway => 'potentiel de taille..';

  @override
  String get painHookDesc =>
      'Chaque jour qui passe sans les bonnes habitudes, des centimètres se perdent définitivement. Mais c\'est encore réversible.';

  @override
  String get painGeneticTitle => 'La génétique n\'est pas tout';

  @override
  String get painGeneticDesc =>
      'La génétique détermine 60 %, les 40 % restants, c\'est toi qui les détermines. BeTaller est là exactement pour ces 40 %.';

  @override
  String get painGeneticTag => 'Analyse';

  @override
  String get painSleepTitle => 'Optimise ta routine de sommeil';

  @override
  String get painSleepDesc =>
      'Un bon sommeil chaque nuit peut augmenter la production d\'hormone de croissance de 70 %. BeTaller automatise le suivi du sommeil, tu n\'as qu\'à dormir.';

  @override
  String get painSleepTag => 'Suivi';

  @override
  String get painPostureTitle =>
      'Gagne des centimètres dès maintenant grâce à la posture';

  @override
  String get painPostureDesc =>
      'Une bonne posture peut ajouter instantanément 1,5 à 3 cm. La routine posturale quotidienne de BeTaller installe ça en quelques semaines.';

  @override
  String get painPostureTag => 'Posture';

  @override
  String get painExerciseTitle => 'Ton plan d\'exercices sur mesure est prêt';

  @override
  String get painExerciseDesc =>
      'Étirements du matin, suspension, exercices pour la colonne : BeTaller a tout préparé et planifié pour toi. Seulement 8 à 12 minutes par jour.';

  @override
  String get painExerciseTag => 'Routines';

  @override
  String get painNutritionTitle =>
      'Ton alimentation influence directement ta croissance';

  @override
  String get painNutritionDesc =>
      'Protéines, calcium, vitamine D : BeTaller te rappelle chaque jour quels nutriments prendre et quand.';

  @override
  String get painNutritionTag => 'Nutrition';

  @override
  String get painTrackingTitle => 'Suis ta croissance de tes propres yeux';

  @override
  String get painTrackingDesc =>
      'Mesures mensuelles, photos de progression, courbe de croissance : vois chaque centimètre gagné.';

  @override
  String get painTrackingTag => 'Progression';

  @override
  String get selectYourGender => 'Sélectionne ton genre';

  @override
  String get onboardingPredictSubtitle =>
      'Cela servira à prédire ton potentiel de taille et à créer ton plan personnalisé.';

  @override
  String get other => 'Autre';

  @override
  String get whenWereYouBorn => 'Quand es-tu né(e) ?';

  @override
  String get heightAndWeight => 'Taille et poids';

  @override
  String get parentsHeight => 'Taille des parents';

  @override
  String get weeklyWorkout => 'Entraînement hebdomadaire';

  @override
  String get workoutsPerWeek => 'Séances par semaine';

  @override
  String get whatsYourEthnicity => 'Quelle est ton origine ethnique ?';

  @override
  String get whiteCaucasian => 'Blanc / Caucasien';

  @override
  String get blackAfricanAmerican => 'Noir / Afro-américain';

  @override
  String get hispanicLatino => 'Hispanique / Latino';

  @override
  String get asian => 'Asiatique';

  @override
  String get middleEasternIndigenous => 'Moyen-Orient / Autochtone';

  @override
  String get dontWantToAnswer => 'Je préfère ne pas répondre';

  @override
  String get footSizeLabel => 'Pointure';

  @override
  String get selectYourSize => 'Sélectionne ta pointure';

  @override
  String get whatsYourDreamHeight => 'Quelle est ta taille de rêve ?';

  @override
  String get dreamHeightCalcSubtitle =>
      'D\'après tes réponses, nous calculerons la probabilité d\'atteindre cette taille.';

  @override
  String get dreamHeightLabel => 'Taille de rêve';

  @override
  String get sleepQuestion => 'Combien d\'heures\ndors-tu chaque nuit ?';

  @override
  String get thousandsSucceeded => 'Des milliers ont\ndéjà réussi';

  @override
  String get youCanToo => 'Toi aussi, tu peux y arriver';

  @override
  String get yearsOld => 'ans';

  @override
  String get verifiedLabel => 'Vérifié';

  @override
  String get scientificData => 'DONNÉES SCIENTIFIQUES';

  @override
  String get longTermResults => 'BeTaller crée des\nrésultats durables';

  @override
  String get longTermResultsSubtitle =>
      'Beaucoup de personnes n\'atteignent pas leur taille maximale à cause de mauvaises habitudes.';

  @override
  String get yourFinalHeight => 'Ta taille finale';

  @override
  String get badHabitsLegend => 'Mauvaises habitudes';

  @override
  String get optimizedLegend => 'Optimisé';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'La taille peut changer\navec les habitudes';

  @override
  String get chartFact2Pct => '9-10h';

  @override
  String get chartFact2Desc =>
      'Un sommeil idéal stimule\nl\'hormone de croissance';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Peuvent être gagnés en\naméliorant la posture';

  @override
  String get didYouKnow => 'Le saviais-tu ?';

  @override
  String get didYouKnowFact1 =>
      'Les habitudes quotidiennes influencent 30 % de ta taille';

  @override
  String get didYouKnowFact2 =>
      'La compression de la colonne te fait perdre 1,5 à 3 cm de taille';

  @override
  String get didYouKnowFact3 => 'Le manque de sommeil réduit l\'HGH de 70 %';

  @override
  String get transformJourneyBegins => 'Ta transformation\ncommence maintenant';

  @override
  String get transformJourneySubtitle =>
      'Un programme complet conçu pour soutenir\nta croissance saine, étape par étape.';

  @override
  String get week1Label => 'S1';

  @override
  String get week1Title => 'Semaine 1';

  @override
  String get week1Desc =>
      'L\'alignement de la colonne s\'améliore, la posture progresse';

  @override
  String get month1Label => 'M1';

  @override
  String get month1Title => 'Mois 1';

  @override
  String get month1Desc =>
      'Premiers centimètres visibles, meilleure qualité de sommeil';

  @override
  String get month3Label => 'M3';

  @override
  String get month3Title => 'Mois 3';

  @override
  String get month3Desc =>
      'Gain moyen de +1,5 à 2,5 cm, développement musculaire';

  @override
  String get month6Label => 'M6';

  @override
  String get month6Title => 'Mois 6';

  @override
  String get month6Desc =>
      'Atteins ton potentiel maximal, vis avec ta nouvelle taille';

  @override
  String get reachYourGoal => 'Atteins ton objectif';

  @override
  String get journeyBullet1 => 'Débloque ton potentiel maximal';

  @override
  String get journeyBullet2 => 'Commence à vivre avec ta nouvelle taille';

  @override
  String get journeyBullet3 => 'Écris ton histoire de réussite';

  @override
  String get unlockButton => 'Tout débloquer';

  @override
  String get dreamHeightOdds => 'Chances d\'atteindre ta\ntaille de rêve';

  @override
  String get growthCompleteLabel => 'Croissance\nterminée';

  @override
  String get tallerThanPct => 'Plus grand que 76,7 % à ton âge';

  @override
  String get levelNovice => 'Novice';

  @override
  String get levelBuilder => 'Bâtisseur';

  @override
  String get levelGrinder => 'Acharné';

  @override
  String get levelWarrior => 'Guerrier';

  @override
  String get levelGodTier => 'Divin';

  @override
  String get levelDesc0 => 'Bâtis tes fondations';

  @override
  String get levelDesc1 => 'Accélère ta croissance';

  @override
  String get levelDesc2 => 'Intensifie l\'entraînement';

  @override
  String get levelDesc3 => 'Repousse tes limites';

  @override
  String get levelDesc4 => 'Pas de douleur, pas de gain';

  @override
  String get levelDesc5 => 'Mentalité de champion';

  @override
  String get levelDesc6 => 'Performance élite';

  @override
  String get levelDesc7 => 'Maîtrise ton corps';

  @override
  String get levelDesc8 => 'Discipline légendaire';

  @override
  String get levelDesc9 => 'Potentiel maximum';

  @override
  String levelLabel(int level) {
    return 'NIVEAU $level';
  }

  @override
  String daysLeftProgram(int days) {
    return '$days jours restants dans ton programme';
  }

  @override
  String get tapLabel => 'APPUIE';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'Jour';

  @override
  String get legendShort => 'Petit';

  @override
  String get legendBelowAvg => 'En dessous';

  @override
  String get legendAverage => 'Moyenne';

  @override
  String get legendTall => 'Grand';

  @override
  String get legendVeryTall => 'Très grand';

  @override
  String get pctBottom5 => '5% inférieur';

  @override
  String get pctBottom25 => '25% inférieur';

  @override
  String get pctMedian => 'Médiane';

  @override
  String get pctTop25 => '25% supérieur';

  @override
  String get pctTop5 => '5% supérieur';

  @override
  String get fallingBehind => 'Tu prends du retard';

  @override
  String readTimeMinutes(int minutes) {
    return '$minutes min de lecture';
  }

  @override
  String get inThisArticle => 'Dans cet article';

  @override
  String get nextArticle => 'Article suivant';

  @override
  String get purchaseUnavailable =>
      'L\'achat n\'a pas pu être finalisé. Réessaie.';

  @override
  String get viewPlan => 'Voir l\'offre';

  @override
  String get viewPlanSubtitle => 'Consulter les détails de ton abonnement';

  @override
  String predictionConfidenceHint(String percent) {
    return 'Chaque mesure ajoutée porte la prédiction à $percent %';
  }

  @override
  String get paywallSlideHomeTitle => 'Ta journée, un écran';

  @override
  String get paywallSlideHomeCaption =>
      'Routines, eau, sommeil : trois cercles à fermer.';

  @override
  String get paywallSlideProgressTitle => 'Vois chaque centimètre';

  @override
  String get paywallSlideProgressCaption =>
      'Chaque mesure rejoint la courbe aussitôt.';

  @override
  String get paywallSlideAnalysisTitle => 'Cinq mesures, une forme';

  @override
  String get paywallSlideAnalysisCaption =>
      'Le radar désigne ton maillon faible.';

  @override
  String get paywallSlidePotentialTitle => 'Connais ton potentiel';

  @override
  String get paywallSlidePotentialCaption =>
      'Vois où tu te situes parmi les autres.';

  @override
  String get paywallSlideDisciplineTitle => 'Garde la série';

  @override
  String get paywallSlideDisciplineCaption =>
      'Chaque jour fait monter ton niveau.';

  @override
  String get paywallSlideRemindersTitle => 'Rappelé au bon moment';

  @override
  String get paywallSlideRemindersCaption =>
      'Règle tes heures, l\'app fait le reste.';

  @override
  String get paywallSlidePostureTitle => 'Corrige ta posture';

  @override
  String get paywallSlidePostureCaption =>
      'Une photo de profil, un auto-test rapide, une routine claire.';

  @override
  String paywallTrialHeadline(String days) {
    return '$days JOURS OFFERTS';
  }

  @override
  String paywallTrialThen(String price) {
    return 'Puis $price · annulable à tout moment';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / an · annulable à tout moment';
  }

  @override
  String get obBedtimeTitle => 'À quelle heure dors-tu ?';

  @override
  String get obBedtimeSubtitle => 'Ton rappel de sommeil suivra cette heure.';

  @override
  String get obWorkoutTimeTitle => 'À quelle heure t\'entraînes-tu ?';

  @override
  String get obWorkoutTimeSubtitle =>
      'Pour que le rappel arrive au bon moment.';

  @override
  String get obMealsTitle => 'Combien de repas par jour ?';

  @override
  String get obMealsSubtitle => 'Touche une heure pour la régler à ton rythme.';

  @override
  String obMealsCount(String count) {
    return '$count repas';
  }

  @override
  String obMealLabel(String n) {
    return 'Repas $n';
  }

  @override
  String get obProteinTitle => 'Combien de protéines par jour ?';

  @override
  String get obProteinSubtitle =>
      'Une valeur approximative suffit pour bâtir ton plan.';

  @override
  String get obCaloriesTitle => 'Combien de calories par jour ?';

  @override
  String get obCaloriesSubtitle =>
      'Une estimation suffit, on l’affinera ensemble.';

  @override
  String get obNotSure => 'Je ne sais pas';

  @override
  String get silNow => 'MAINTENANT';

  @override
  String get silPotential => 'POTENTIEL';

  @override
  String get chartMeasured => 'Tes mesures';

  @override
  String chartPotential(String height) {
    return 'Potentiel $height';
  }

  @override
  String chartDream(String height) {
    return 'Ton objectif $height';
  }

  @override
  String get targetsTitle => 'Aujourd\'hui, pour toi';

  @override
  String get targetsSubtitle =>
      'Calculé selon ton âge, ton poids et ton entraînement.';

  @override
  String get targetProtein => 'Protéines';

  @override
  String get targetCalcium => 'Calcium';

  @override
  String get targetVitaminD => 'Vitamine D';

  @override
  String get targetWater => 'Eau';

  @override
  String get targetSleep => 'Sommeil';

  @override
  String get targetMove => 'Entraînement';

  @override
  String targetPerMeal(String g) {
    return '$g g par repas';
  }

  @override
  String get unitHours => 'h';

  @override
  String get unitMinutes => 'min';

  @override
  String get planStrength => 'Force';

  @override
  String get planJump => 'Sauts & sprints';

  @override
  String get planMobility => 'Étirements';

  @override
  String get planSport => 'Sport';

  @override
  String get planPosture => 'Posture';

  @override
  String get planRest => 'Repos';

  @override
  String planWeekTitle(int days) {
    return 'Ta semaine : $days jours d\'entraînement';
  }

  @override
  String get planPreviewTitle => 'Ton plan est prêt';

  @override
  String planPreviewTraining(int days) {
    return '$days jours d\'entraînement par semaine, pensés pour la croissance';
  }

  @override
  String planPreviewProtein(int grams) {
    return '$grams g de protéines par jour, répartis sur tes repas';
  }

  @override
  String planPreviewSleep(String hours) {
    return '$hours heures de sommeil, avec un rappel du coucher';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'Aujourd\'hui : $plan · $minutes min';
  }

  @override
  String get nRestTitle => 'Aujourd\'hui, repos';

  @override
  String get nRestBody =>
      'Dix minutes d\'étirements suffisent. La récupération fait partie du plan.';

  @override
  String nProteinTitle(int grams) {
    return 'Objectif protéines du jour : $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return 'Environ $grams g par repas : œufs, yaourt, poulet, lentilles.';
  }

  @override
  String nWaterTitle(String liters) {
    return 'Objectif eau : $liters L';
  }

  @override
  String get nWaterBody =>
      'Un verre maintenant et tu restes dans le plan du jour.';

  @override
  String get nSleepTitle => 'C\'est l\'heure de se coucher';

  @override
  String nSleepBody(String hours) {
    return 'Objectif : $hours heures. Écrans éteints, lumière tamisée.';
  }

  @override
  String nMeasureBody(String potential) {
    return 'Ton potentiel : $potential. Mesure-toi le matin et regarde ta courbe avancer.';
  }

  @override
  String get nTrialDay1Title => 'Ton plan t\'attend';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'Aujourd\'hui : $plan, $minutes min. Note ta taille pour lancer ta courbe.';
  }

  @override
  String get nTrialEndTitle => 'Ton essai gratuit se termine demain';

  @override
  String nTrialEndBody(String price) {
    return 'Ensuite, il continue à $price. Ton plan et tes progrès restent enregistrés.';
  }

  @override
  String get trophyContinue => 'On continue';

  @override
  String get guideSteps => 'Étape par étape';

  @override
  String get guideMistakes => 'Erreurs fréquentes';

  @override
  String get guideTip => 'Astuce';

  @override
  String get homeHeroTitle => 'Ta taille et ton potentiel';

  @override
  String homeHeroGap(String cm) {
    return 'Encore $cm devant toi';
  }

  @override
  String get anSubtitle => 'Ton score, ce qui le fait bouger et où tu vas';

  @override
  String get anScoreLabel => 'Score BeTaller';

  @override
  String get anTierStarting => 'Départ';

  @override
  String get anTierBuilding => 'En progrès';

  @override
  String get anTierRising => 'En hausse';

  @override
  String get anTierStrong => 'Solide';

  @override
  String get anTierPeak => 'Sommet';

  @override
  String anTrendUp(int n) {
    return '+$n vs semaine dernière';
  }

  @override
  String anTrendDown(int n) {
    return '-$n vs semaine dernière';
  }

  @override
  String get anTrendFlat => 'Comme la semaine dernière';

  @override
  String get anTrendFirst => 'Ta tendance démarre la semaine prochaine';

  @override
  String anNextTier(int n, String tier) {
    return '$n points avant $tier';
  }

  @override
  String get anTopTier => 'Niveau max. Garde le cap';

  @override
  String anCoverage(int n, int total) {
    return 'Basé sur $n signaux sur $total';
  }

  @override
  String get anNoScoreTitle => 'Pas encore assez de données';

  @override
  String get anNoScoreBody =>
      'Note ton sommeil, un peu d\'eau ou un entraînement aujourd\'hui et ton premier score apparaît.';

  @override
  String get anFastestWin => 'Gain le plus rapide';

  @override
  String get anBreakdownTitle => 'Ce qui compose ton score';

  @override
  String get anBreakdownHint =>
      'Chaque signal est noté de 0 à 100 à partir de tes données. Le pourcentage indique son poids.';

  @override
  String anWeight(int n) {
    return '$n %';
  }

  @override
  String get anNoData => 'Pas encore de données';

  @override
  String get anNotCounted => 'Non compté';

  @override
  String get anFTraining => 'Entraînement';

  @override
  String get anFConsistency => 'Régularité';

  @override
  String get anFSleep => 'Sommeil';

  @override
  String get anFHydration => 'Hydratation';

  @override
  String get anFNutrition => 'Nutrition';

  @override
  String get anFPosture => 'Posture';

  @override
  String get anFMeasuring => 'Mesure';

  @override
  String get anFGrowth => 'Vitesse de croissance';

  @override
  String get anFHeadroom => 'Marge de croissance';

  @override
  String anBTraining(int done, int planned) {
    return '$done jours d\'entraînement sur $planned prévus ces 7 derniers jours';
  }

  @override
  String get anBTrainingNone =>
      'Compte tes jours d\'entraînement par rapport à ton plan de la semaine.';

  @override
  String anBConsistency(int streak, int active, int days) {
    return 'Série de $streak jours, $active jours sur $days avec la moitié du plan faite';
  }

  @override
  String get anBConsistencyNone =>
      'Compte ta série et les jours où tu fais au moins la moitié du plan.';

  @override
  String anBSleep(String hours, String target, int days) {
    return '$hours h par nuit en moyenne, objectif $target h, $days nuits notées';
  }

  @override
  String get anBSleepNone => 'Aucun sommeil noté ces 7 derniers jours.';

  @override
  String anBHydration(String litres, String target, int days) {
    return '$litres L par jour en moyenne, objectif $target L, $days jours notés';
  }

  @override
  String get anBHydrationNone => 'Aucune eau notée ces 7 derniers jours.';

  @override
  String anBNutrition(int done, int planned) {
    return '$done habitudes alimentaires sur $planned faites ces 7 derniers jours';
  }

  @override
  String get anBNutritionNone =>
      'Compte les habitudes protéines, calcium, zinc et vitamine D de ton plan.';

  @override
  String anBPosture(int raw, int days) {
    return 'Auto-test au mur $raw/90, il y a $days jours';
  }

  @override
  String anBPostureToday(int raw) {
    return 'Auto-test au mur $raw/90, aujourd\'hui';
  }

  @override
  String get anBPostureNone => 'Pas encore d\'auto-test de posture.';

  @override
  String anBMeasuring(int days) {
    return 'Dernière mesure il y a $days jours';
  }

  @override
  String get anBMeasuringToday => 'Mesuré aujourd\'hui';

  @override
  String get anBMeasuringNone => 'Pas encore de mesure.';

  @override
  String anBGrowth(String v, String e) {
    return '$v cm par an, typique à ton âge $e cm';
  }

  @override
  String get anBGrowthNone =>
      'Il faut deux mesures espacées d\'au moins 30 jours.';

  @override
  String get anBGrowthAdult =>
      'Les cartilages de croissance se ferment souvent vers 21 ans, donc la vitesse de croissance ne compte pas pour toi.';

  @override
  String anBHeadroom(String cm) {
    return '$cm entre aujourd\'hui et ton potentiel';
  }

  @override
  String get anATraining => 'Lance l\'entraînement du jour';

  @override
  String get anAConsistency => 'Termine la moitié du plan du jour';

  @override
  String get anASleepLog => 'Note ta nuit dernière';

  @override
  String anASleep(String target) {
    return 'Dors $target h cette nuit';
  }

  @override
  String get anAHydrationLog => 'Note un verre d\'eau';

  @override
  String anAHydration(String left) {
    return 'Bois encore $left L aujourd\'hui';
  }

  @override
  String get anAHydrationDone => 'Objectif atteint. Pareil demain';

  @override
  String get anANutrition => 'Coche les habitudes alimentaires du jour';

  @override
  String get anAPostureFirst => 'Fais l\'auto-test de posture en 1 minute';

  @override
  String get anAPostureRedo => 'Refais ton auto-test de posture';

  @override
  String get anAPostureKeep => 'Garde la routine posture quotidienne';

  @override
  String get anAMeasure => 'Mesure ta taille maintenant';

  @override
  String get anAMeasureKeep => 'Remesure-toi la semaine prochaine';

  @override
  String anAGrowthWait(int days) {
    return 'Remesure-toi dans $days jours';
  }

  @override
  String get anAGrowth => 'Mesure-toi toutes les 2 semaines pour le suivre';

  @override
  String get anAHeadroom => 'Vois ton potentiel';

  @override
  String get anPotentialTitle => 'Ton potentiel';

  @override
  String get anPotentialLabel => 'Taille adulte prévue';

  @override
  String anPotentialToGo(String cm) {
    return 'encore +$cm';
  }

  @override
  String get anPotentialReached => 'Tu as atteint ta taille prévue';

  @override
  String get anPotentialNote =>
      'Le même chiffre partout dans l\'app. Il ne fait que monter.';

  @override
  String anDreamLine(String h) {
    return 'Ton objectif : $h';
  }

  @override
  String get anSourcesTitle => 'D\'où viennent les centimètres';

  @override
  String get anSourcesGenes => 'Gènes et âge';

  @override
  String get anSourcesHabits => 'Sommeil, alimentation, sport';

  @override
  String get anSourcesPosture => 'Posture';

  @override
  String get anPctTitle => 'Taille pour ton âge';

  @override
  String anPctValue(int p) {
    return 'Plus grand que $p % des gens de ton âge';
  }

  @override
  String get anPctBasis => 'Référence de croissance OMS 2007, même âge et sexe';

  @override
  String get anPctMore => 'Comparaison complète';

  @override
  String get anNeedsBasis =>
      'Calculé selon ton âge, ton poids et ton entraînement';

  @override
  String get anCalcium => 'Calcium';

  @override
  String get anVitaminD => 'Vitamine D';

  @override
  String get anMovement => 'Activité';

  @override
  String get anUnitMin => 'min';

  @override
  String get anUnitHours => 'h';

  @override
  String get anPerDay => 'par jour';

  @override
  String get anPerNight => 'par nuit';

  @override
  String get anUnlockScoreTitle => 'Ton score BeTaller complet';

  @override
  String get anUnlockScoreBody =>
      'Le score, les neuf signaux derrière et quoi faire ensuite.';

  @override
  String get anUnlockSourcesTitle => 'Vois d\'où viennent tes centimètres';

  @override
  String get anUnlockNeedsTitle => 'Tes besoins du jour, calculés pour toi';

  @override
  String get anUnlockCta => 'Débloquer';

  @override
  String get anFlowResultTitle => 'Enregistré sur ton graphique';

  @override
  String get anFlowResultBody =>
      'Tes tailles passées sont maintenant sur la même courbe que tes mesures et ton potentiel.';

  @override
  String get anFlowOpenAnalysis => 'Ouvre ton analyse';

  @override
  String anTopPct(int p) {
    return 'TOP $p %';
  }

  @override
  String get anNeedsTitle => 'Tes besoins du jour';

  @override
  String get pgUnlockPro => 'Débloquer avec Pro';

  @override
  String get pgPhotosLockedTitle => 'Vois ta transformation';

  @override
  String get pgPhotosLockedBody =>
      'Enregistre une photo avec ta taille toutes les deux semaines et compare-en deux avec un curseur.';

  @override
  String get pgTransformationTitle => 'Ta transformation';

  @override
  String get pgHeightChange => 'écart de taille';

  @override
  String get pgDaysApart => 'jours d\'écart';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours',
      one: '1 jour',
    );
    return '$delta entre ces deux photos, prises à $_temp0 d\'écart.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours',
      one: '1 jour',
    );
    return 'Même taille, à $_temp0 d\'écart. La posture et la silhouette changent d\'abord, la taille suit sur des mois.';
  }

  @override
  String get pgModeSlider => 'Curseur';

  @override
  String get pgModeSideBySide => 'Côte à côte';

  @override
  String get pgDragToReveal => 'Fais glisser pour comparer';

  @override
  String get pgOnePhotoTitle => 'Ta photo avant est enregistrée';

  @override
  String pgOnePhotoBody(String date) {
    return 'Prends la suivante le $date dans la même pose pour voir ta première comparaison.';
  }

  @override
  String get pgEmptyTitle => 'Commence ta transformation';

  @override
  String get pgEmptyBody =>
      'Une photo toutes les deux semaines, même pose, même endroit, avec ta taille. Dans quelques mois, tu passeras du jour 1 à aujourd\'hui d\'un glissement.';

  @override
  String get pgTakeFirstPhoto => 'Prends ta première photo';

  @override
  String get pgPhotoDueNow => 'Nouvelle photo à prendre';

  @override
  String pgNextPhotoOn(String date) {
    return 'Prochaine photo $date';
  }

  @override
  String pgDayN(int n) {
    return 'Jour $n';
  }

  @override
  String get pgNewPhoto => 'Nouvelle photo';

  @override
  String get pgGuideTitle => 'La même pose, à chaque fois';

  @override
  String get pgGuideSubtitle =>
      'Les photos ne se comparent bien que si elles sont prises de la même façon.';

  @override
  String get pgGuideGhost =>
      'Ta dernière photo apparaît en transparence. Aligne-toi dessus.';

  @override
  String get pgGuideStep1 => 'Tiens-toi à 2 m, téléphone à hauteur de poitrine';

  @override
  String get pgGuideStep2 => 'Face à l\'objectif, pieds joints, bras relâchés';

  @override
  String get pgGuideStep3 =>
      'Même endroit, même lumière, vêtements près du corps';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => 'hauteur de poitrine';

  @override
  String get pgTakePhoto => 'Prendre la photo';

  @override
  String get pgFromGallery => 'Choisir dans la galerie';

  @override
  String get pgChoosePhoto => 'Choisis une photo';

  @override
  String get pgPostureTitle => 'Bilan de posture';

  @override
  String get pgPostureLockedTitle => 'Trouve tes points faibles';

  @override
  String get pgPostureLockedBody =>
      'Note ta tête, tes épaules et ton bas du dos, reçois deux exercices pour chaque zone et suis ton score semaine après semaine.';

  @override
  String get pgAreaHead => 'Tête';

  @override
  String get pgAreaShoulders => 'Épaules';

  @override
  String get pgAreaLowerBack => 'Bas du dos';

  @override
  String get pgHeadMeaning0 =>
      'Ta tête est bien au-dessus de tes épaules. Garde-la là avec un petit rappel chaque jour.';

  @override
  String get pgHeadMeaning1 =>
      'Ta tête part vers l\'avant quand tu te relâches. Très courant avec beaucoup d\'écran, et vite corrigé.';

  @override
  String get pgHeadMeaning2 =>
      'Ta tête est en avant de tes épaules. Corrige ça en premier : ça te fait paraître plus petit sur chaque photo.';

  @override
  String get pgShouldersMeaning0 =>
      'Épaules alignées avec tes oreilles. Ton haut du dos fait son travail.';

  @override
  String get pgShouldersMeaning1 =>
      'Épaules un peu en avant. Une poitrine raide les tire vers l\'intérieur ; l\'ouvrir les ramène en place.';

  @override
  String get pgShouldersMeaning2 =>
      'Épaules enroulées. Ton haut du dos se courbe vers l\'avant, ce qui te fait perdre de la hauteur debout.';

  @override
  String get pgLowerBackMeaning0 =>
      'Une courbe neutre. Tes hanches et tes abdos tiennent ta colonne là où il faut.';

  @override
  String get pgLowerBackMeaning1 =>
      'Un bas du dos plat. Un peu d\'extension et de mobilité ramènent la courbe naturelle.';

  @override
  String get pgLowerBackMeaning2 =>
      'Une forte cambrure. Des fléchisseurs de hanche raides basculent ton bassin vers l\'avant ; les étirer et renforcer tes abdos rééquilibre.';

  @override
  String get pgLegacyMeaning =>
      'Enregistré par une ancienne version sans ces questions. Refais le bilan pour un conseil sur cette zone.';

  @override
  String get pgHowItWorks => 'Comment marche le bilan';

  @override
  String get pgYourPosture => 'Ta posture';

  @override
  String pgCheckedOn(String date) {
    return 'Fait le $date';
  }

  @override
  String get pgOutOf100 => 'sur 100';

  @override
  String get pgAllAreasGood =>
      'Les trois zones sont bonnes. Garde-les comme ça.';

  @override
  String pgStartWith(String area) {
    return 'Commence par : $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta depuis le dernier bilan';
  }

  @override
  String get pgStatusGood => 'Bien';

  @override
  String get pgStatusFair => 'Peut mieux faire';

  @override
  String get pgStatusFix => 'À corriger d\'abord';

  @override
  String get pgKeepItWith => 'Pour garder ça';

  @override
  String get pgFixItWith => 'Pour corriger';

  @override
  String get pgRetakeNow => 'C\'est l\'heure de ton bilan de la semaine';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Prochain bilan dans $n jours',
      one: 'Prochain bilan demain',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'Même mur, mêmes trois questions. Un bilan par semaine montre si les exercices marchent.';

  @override
  String pgRetakeBodyWait(String date) {
    return 'Fais les exercices ci-dessus jusqu\'au $date, puis refais le bilan pour voir s\'ils ont marché.';
  }

  @override
  String get pgRetakeCheck => 'Refaire le bilan';

  @override
  String get pgRetakeAnyway => 'Refaire maintenant';

  @override
  String get pgHistoryTitle => 'Tes scores';

  @override
  String pgSinceFirst(String delta) {
    return '$delta depuis le premier';
  }

  @override
  String get pgHistoryOne =>
      'C\'est ton premier bilan. Refais-le dans 7 jours et ta courbe commence ici.';

  @override
  String get pgPostureIntroTitle => 'Tu te tiens droit à quel point ?';

  @override
  String get pgPostureIntroBody =>
      'Trois questions contre un mur, environ une minute. Tu obtiens un score et deux exercices pour chaque point faible.';

  @override
  String get pgPostureStep1 =>
      'Mets-toi contre un mur, talons, fesses et omoplates collés.';

  @override
  String get pgPostureStep2 =>
      'Prends une photo de profil, corps entier dans le cadre, pour pouvoir comparer plus tard.';

  @override
  String get pgPostureStep3 =>
      'Réponds honnêtement à trois questions. Ton score vient de tes réponses.';

  @override
  String get pgPostureStep4 =>
      'Refais-le une fois par semaine, au même moment de la journée.';

  @override
  String get pgStartCheck => 'Commencer le bilan';

  @override
  String pgWeekRange(String start, String end) {
    return 'Du $start au $end';
  }

  @override
  String get pgGradeGreat => 'Semaine de champion';

  @override
  String get pgGradeGood => 'Bonne semaine';

  @override
  String get pgGradeOk => 'Ça démarre';

  @override
  String get pgGradeStart => 'Un nouveau départ';

  @override
  String get pgTopWeek => 'Top semaine';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta par rapport à la semaine dernière';
  }

  @override
  String get pgDaysCompleted => 'jours avec le plan complet';

  @override
  String get pgDayStreak => 'jours de suite';

  @override
  String pgBestDay(String day) {
    return 'Meilleur : $day';
  }

  @override
  String get pgNextWeekFocus => 'Objectif de la semaine prochaine';

  @override
  String pgFocusPlan(int n, int done) {
    return 'Termine tout ton plan $n jours. Cette semaine, tu l\'as fait $done fois.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'Cale $n séances d\'entraînement. Cette semaine, tu en as fait $done.';
  }

  @override
  String get pgFocusMeasure =>
      'Mesure ta taille une fois, le matin, pieds nus, au même endroit. C\'est comme ça que tu verras le vrai changement.';

  @override
  String pgFocusKeepDay(String day) {
    return 'Tous les objectifs sont atteints. Maintenant, fais aussi de $day une journée complète.';
  }

  @override
  String get pgFocusKeep =>
      'Tous les objectifs atteints, chaque jour complet. Même plan, même rythme.';

  @override
  String get pgHeightThisWeek => 'Taille cette semaine';

  @override
  String pgHeightNow(String height) {
    return 'Maintenant $height';
  }

  @override
  String get pgNoMeasurementWeek => 'Pas encore de mesure cette semaine';

  @override
  String get pgFirstMeasurement => 'Ta première mesure';

  @override
  String pgStartedAt(String height) {
    return 'Départ $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'Potentiel $height';
  }

  @override
  String pgToPotential(String cm) {
    return 'Encore $cm jusqu\'à ton potentiel estimé.';
  }

  @override
  String get pgPotentialReached =>
      'Tu es à ton potentiel estimé. Le travail de posture peut encore ajouter à ce que tu montres.';

  @override
  String get pgHabitsToday => 'Noté aujourd\'hui';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves mouvements · $minutes min';
  }

  @override
  String plDoneCount(int done, int total) {
    return '$done/$total faits';
  }

  @override
  String get plStartWorkout => 'Commencer la séance';

  @override
  String get plContinueWorkout => 'Reprendre la séance';

  @override
  String get plWorkoutDoneToday => 'Séance du jour terminée';

  @override
  String get plTraining => 'Entraînement';

  @override
  String get plHabits => 'Habitudes du jour';

  @override
  String get plRestDayNote =>
      'Journée légère : un court flow de yoga te garde souple pour demain.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps répétitions';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds s';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds s de chaque côté';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g répartis sur tes repas';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters L dans la journée';
  }

  @override
  String plHabitSleep(String hours) {
    return '$hours h cette nuit';
  }

  @override
  String get plYourRoutines => 'Tes routines';

  @override
  String get plNewRoutine => 'Nouvelle routine';

  @override
  String get plCustomEmpty =>
      'Crée ta propre routine et coche-la ici chaque jour.';

  @override
  String plDeleteRoutineQ(String name) {
    return 'Supprimer « $name » ?';
  }

  @override
  String get plHoldToDelete =>
      'Appuie longuement sur une routine pour la supprimer.';

  @override
  String plSetOf(int current, int total) {
    return 'Série $current sur $total';
  }

  @override
  String get plRest => 'Repos';

  @override
  String get plStartSet => 'Lancer la série';

  @override
  String get plSetDone => 'Série terminée';

  @override
  String get plSkipRest => 'Passer le repos';

  @override
  String get plNextMove => 'Mouvement suivant';

  @override
  String get plSkipMove => 'Passer';

  @override
  String plUpNext(String name) {
    return 'Ensuite : $name';
  }

  @override
  String get plLastMove => 'Dernier mouvement';

  @override
  String get plWorkoutComplete => 'Séance terminée';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves mouvements en $minutes min environ. Chaque séance compte.';
  }

  @override
  String get plEachSide => 'Chaque côté';

  @override
  String get plMoveDone => 'Mouvement fait';

  @override
  String plRepsBig(int reps) {
    return '$reps répétitions';
  }

  @override
  String get plSessionHint =>
      'Va à ton rythme et touche terminé quand tu as fini.';

  @override
  String plProgramDayOf(int day, int total) {
    return 'Jour $day sur $total';
  }

  @override
  String get plTodayStep => 'L\'étape du jour';

  @override
  String get plTickToComplete =>
      'Coche chaque mouvement pour valider la journée';

  @override
  String plNextDayTomorrow(int day) {
    return 'Le jour $day s\'ouvre demain. Récupérer fait partie de la croissance.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    return '$days jours avant le niveau $level';
  }

  @override
  String get plProgramFinished =>
      'Les 70 jours sont faits. Tu as terminé le programme.';

  @override
  String plDayCompleteToast(int day) {
    return 'Jour $day validé';
  }

  @override
  String get plLevelWeek => 'La semaine de ce niveau';

  @override
  String get plProgressionTitle => 'Comment ça progresse';

  @override
  String get plNow => 'Actuel';

  @override
  String plLevelN(int n) {
    return 'Niv $n';
  }

  @override
  String get plUnlockProgram => 'Débloquer le programme de 70 jours';

  @override
  String get plProgramPitch =>
      '10 niveaux, un par semaine. Chacun allonge tes gainages, ajoute des sauts et une série quand tu es prêt.';

  @override
  String plDayLocked(int day) {
    return 'Termine d\'abord le jour $day';
  }

  @override
  String plCurrentDay(int day) {
    return 'Jour $day';
  }

  @override
  String get plTodaysTargets => 'Tes objectifs du jour';

  @override
  String get plTargetsBasis =>
      'Calculés selon ton âge, ton poids et ton entraînement';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals repas x $grams g';
  }

  @override
  String get plZinc => 'Zinc';

  @override
  String get plMagnesium => 'Magnésium';

  @override
  String get plEnergy => 'Énergie';

  @override
  String get plChecklist => 'Ta liste du jour';

  @override
  String plCheckProtein(int grams) {
    return 'Protéines $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'Calcium $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'Vitamine D $iu UI';
  }

  @override
  String plCheckWater(String liters) {
    return 'Eau $liters L';
  }

  @override
  String plFromMeals(String amount) {
    return '$amount grâce aux repas cochés';
  }

  @override
  String get plVitaminDNote =>
      '15 min de soleil de midi sur les bras et le visage, ou un complément validé par ton médecin';

  @override
  String plWaterLogged(String liters) {
    return '$liters L notés pour l\'instant';
  }

  @override
  String get plMealPlan => 'Ton plan de repas';

  @override
  String get plMealPlanSub =>
      'De vrais aliments, de vrais grammes, ajustés à tes objectifs';

  @override
  String get plSnack => 'Collation';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein g protéines · $calcium mg calcium · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return 'objectif $grams g';
  }

  @override
  String get plMarkEaten => 'Marquer comme mangé';

  @override
  String get plEaten => 'Mangé';

  @override
  String get plPlanTotal => 'Total du jour';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'Ces repas apportent environ $planKcal de tes $kcal kcal. Complète avec des fruits, des légumes, du pain ou du riz.';
  }

  @override
  String get plWeeklyMenu => 'Menu de la semaine';

  @override
  String get plWeeklyMenuSub =>
      'Une assiette différente chaque jour, les mêmes objectifs';

  @override
  String get plUnlockMenu => 'Débloquer tout le menu de la semaine';

  @override
  String get plRecipes => 'Recettes';

  @override
  String get plRecipesSub => 'Plats rapides riches en protéines';

  @override
  String get plNutritionGuide => 'Guide nutrition';

  @override
  String get plNutritionGuideSub => 'Nutriments, aliments, compléments';

  @override
  String plPieces(int n) {
    return '$n pc';
  }

  @override
  String get plFoodOats => 'Flocons d\'avoine';

  @override
  String get plFoodMilk => 'Lait';

  @override
  String get plFoodBanana => 'Banane';

  @override
  String get plFoodWalnuts => 'Noix';

  @override
  String get plFoodGreekYogurt => 'Yaourt grec';

  @override
  String get plFoodYogurt => 'Yaourt nature';

  @override
  String get plFoodEggs => 'Œufs';

  @override
  String get plFoodBread => 'Pain complet';

  @override
  String get plFoodWhiteCheese => 'Feta';

  @override
  String get plFoodHardCheese => 'Emmental';

  @override
  String get plFoodSalad => 'Salade tomate concombre';

  @override
  String get plFoodOrange => 'Orange';

  @override
  String get plFoodPeanutButter => 'Beurre de cacahuète';

  @override
  String get plFoodSpinach => 'Épinards';

  @override
  String get plFoodCottageCheese => 'Fromage cottage';

  @override
  String get plFoodChicken => 'Blanc de poulet';

  @override
  String get plFoodBulgur => 'Boulgour';

  @override
  String get plFoodAyran => 'Ayran (boisson au yaourt)';

  @override
  String get plFoodTuna => 'Thon en boîte';

  @override
  String get plFoodPasta => 'Pâtes';

  @override
  String get plFoodBeef => 'Bœuf maigre';

  @override
  String get plFoodRice => 'Riz';

  @override
  String get plFoodChickpeas => 'Pois chiches';

  @override
  String get plFoodSalmon => 'Saumon';

  @override
  String get plFoodBroccoli => 'Brocoli';

  @override
  String get plFoodPotato => 'Pommes de terre';

  @override
  String get plFoodLentils => 'Lentilles';

  @override
  String get plFoodSardines => 'Sardines';

  @override
  String get plFoodAlmonds => 'Amandes';

  @override
  String get plFoodKefir => 'Kéfir';

  @override
  String get plFoodPumpkinSeeds => 'Graines de courge';
}
