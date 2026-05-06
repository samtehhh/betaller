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
  String get navProgress => 'Progrès';

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
  String remaining(String cm) {
    return '+$cm cm restants';
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
  String get improveScore => 'Améliorez votre score';

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
  String get keepStreak => 'Maintenez la série';

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
  String bmiHigh(String bmi) {
    return 'Votre IMC est de $bmi — un peu élevé. Privilégiez une alimentation saine.';
  }

  @override
  String get nutritionDefault =>
      'Atteignez votre objectif d\'eau et maintenez une nutrition équilibrée.';

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
    return 'Série de $days jours ! Votre score augmente en continuant.';
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
      'Ajoutez des mesures pour voir votre graphique de progression !';

  @override
  String get addMeasurementButton => 'AJOUTER UNE MESURE';

  @override
  String get measurementHistory => 'HISTORIQUE DES MESURES';

  @override
  String get deleteTitle => 'Supprimer la mesure';

  @override
  String get deleteMessage =>
      'Êtes-vous sûr de vouloir supprimer cette mesure ?';

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
  String get notificationsOn => 'Rappels activés';

  @override
  String get notificationsOff => 'Rappels désactivés';

  @override
  String get premium => 'Passer à Premium';

  @override
  String get premiumSubtitle => 'Débloquer toutes les fonctionnalités';

  @override
  String get rateUs => 'Notez-nous';

  @override
  String get rateSubtitle => 'Vous aimez l\'appli ? Donnez-nous 5 étoiles !';

  @override
  String get share => 'Partager l\'appli';

  @override
  String get shareSubtitle => 'Parlez de BeTaller à vos amis';

  @override
  String get shareText =>
      'J\'ai découvert mon potentiel de croissance avec BeTaller ! Essayez aussi : https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'Donner un avis';

  @override
  String get feedbackSubtitle => 'Contactez-nous';

  @override
  String get resetData => 'Réinitialiser toutes les données';

  @override
  String get resetSubtitle => 'Toutes les données seront supprimées';

  @override
  String get resetTitle => 'Réinitialiser les données';

  @override
  String get resetMessage =>
      'Toutes les données seront supprimées et vous reviendrez à l\'écran d\'accueil. Cette action est irréversible !';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get premiumSoon => 'Premium bientôt disponible !';

  @override
  String get brandingSubtitle => 'Découvrez votre potentiel de croissance';

  @override
  String get statistics => 'Statistiques';

  @override
  String get currentStreak => 'Série actuelle';

  @override
  String get bestStreakLabel => 'Meilleure série';

  @override
  String get achievementLabel => 'Succès';

  @override
  String get achievements => 'Succès';

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
  String get onboardingSubtitle => 'Découvrez votre potentiel de croissance';

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
      'Entrez les tailles dont vous vous souvenez à différents âges. Vous pouvez laisser des cases vides.';

  @override
  String get heightHint => 'Entrez la taille...';

  @override
  String get ageLabel => 'âge';

  @override
  String get habits => 'Vos habitudes';

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
  String growthPotential(String cm) {
    return '+$cm cm de potentiel de croissance';
  }

  @override
  String get heightAt21 => 'à 21 ans';

  @override
  String confidenceLevel(String pct) {
    return 'Niveau de confiance de $pct%';
  }

  @override
  String heightRange(String min, String max) {
    return 'Fourchette de $min - $max cm';
  }

  @override
  String get currentLabel => 'ACTUEL';

  @override
  String get predictedLabel => 'PRÉDIT';

  @override
  String get yearlyPredictions => 'Prédictions annuelles';

  @override
  String get tipMorningMeasure =>
      'Mesurez-vous le matin — la pression sur les disques réduit la taille au cours de la journée. La mesure la plus précise est le matin.';

  @override
  String get tipProteinSpread =>
      'Répartissez les protéines sur tous les repas. Ne mangez pas tout d\'un coup, prenez des protéines à chaque repas.';

  @override
  String get tipGrowthHormone =>
      'L\'hormone de croissance atteint son pic pendant le sommeil. Soyez endormi entre 22h et 2h !';

  @override
  String get tipVitaminD =>
      '15 minutes d\'exposition quotidienne au soleil augmentent la production de vitamine D. La vitamine D est essentielle à l\'absorption du calcium.';

  @override
  String get tipBarHanging =>
      'La suspension à la barre décompresse la colonne vertébrale. Essayez 3x30 secondes par jour.';

  @override
  String get tipSwimming =>
      'La natation est le meilleur sport pour un entraînement complet du corps et le soutien de la croissance.';

  @override
  String get tipStress =>
      'Le stress inhibe l\'hormone de croissance. Réduisez le stress avec la méditation et le yoga.';

  @override
  String get routineMorningStretch => 'Étirements matinaux';

  @override
  String get routineMorningStretchDesc =>
      'Faites 10 minutes d\'étirements au réveil. Étirez la colonne vertébrale et les muscles des jambes.';

  @override
  String get routineBarHanging => 'Suspension à la barre';

  @override
  String get routineBarHangingDesc =>
      'Suspendez-vous à une barre de traction pour étendre la colonne vertébrale. 3 séries x 30 secondes.';

  @override
  String get routineCobraStretch => 'Étirement du cobra';

  @override
  String get routineCobraStretchDesc =>
      'Allongez-vous face au sol et soulevez le haut du corps. Étirez la colonne vertébrale. 3 séries x 15 secondes.';

  @override
  String get routineJumping => 'Exercices de saut';

  @override
  String get routineJumpingDesc =>
      'Corde à sauter ou squats sautés. Stimule les plaques de croissance. 3 séries x 20 répétitions.';

  @override
  String get routineSwimming => 'Natation ou basketball';

  @override
  String get routineSwimmingDesc =>
      'Pratiquez un sport qui favorise la croissance. Au moins 30 minutes.';

  @override
  String get routineYoga => 'Yoga et étirements du soir';

  @override
  String get routineYogaDesc =>
      'Routine de yoga et d\'étirements avant le coucher. Relâchez le stress, détendez les muscles.';

  @override
  String get routineProtein => 'Apport en protéines';

  @override
  String get routineProteinDesc =>
      'Œufs, poulet, poisson, produits laitiers. Au moins 1,5g/kg de protéines par jour.';

  @override
  String get routineCalcium => 'Calcium et vitamine D';

  @override
  String get routineCalciumDesc =>
      'Consommez du lait, du fromage, du yaourt. Exposez-vous au soleil 15 min. Essentiel pour le développement osseux.';

  @override
  String get routineWater => 'Objectif d\'hydratation';

  @override
  String get routineWaterDesc =>
      'Buvez au moins 2 à 3 litres d\'eau par jour. Essentiel pour le métabolisme et la croissance.';

  @override
  String get routineAvoidJunk => 'Éviter la malbouffe';

  @override
  String get routineAvoidJunkDesc =>
      'Évitez le fast-food, les boissons sucrées et les aliments transformés.';

  @override
  String get routineSleep => 'Sommeil de qualité (8-10h)';

  @override
  String get routineSleepDesc =>
      'L\'hormone de croissance est libérée pendant le sommeil. 22h-6h sont les heures d\'or.';

  @override
  String get routineNoScreen => 'Pause écran avant le coucher';

  @override
  String get routineNoScreenDesc =>
      'Rangez téléphone et ordinateur 1 heure avant le coucher. Ne bloquez pas la production de mélatonine.';

  @override
  String get routinePosture => 'Vérification de la posture';

  @override
  String get routinePostureDesc =>
      'Gardez le dos droit, les épaules en arrière. Vérifiez toutes les heures. Une bonne posture = 2-3 cm de différence.';

  @override
  String get routineWallStand => 'Exercice contre le mur';

  @override
  String get routineWallStandDesc =>
      'Adossez-vous au mur : talons, hanches, épaules et tête contre le mur. Tenez 5 min.';

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
      'Consommez des aliments riches en zinc tout au long de la journée pour la production d\'hormone de croissance.';

  @override
  String get routineVitaminDSunlight => 'Vitamine D et Soleil';

  @override
  String get routineVitaminDSunlightDesc =>
      'Exposez-vous au moins 15 minutes au soleil direct pour la synthèse de vitamine D et la croissance osseuse.';

  @override
  String get routineArginineFoods => 'Aliments Riches en Arginine';

  @override
  String get routineArginineFoodsDesc =>
      'Mangez des aliments riches en arginine pour stimuler la sécrétion d\'hormone de croissance.';

  @override
  String get routineSleepEnvironment => 'Optimiser l\'Environnement de Sommeil';

  @override
  String get routineSleepEnvironmentDesc =>
      'Créez un environnement de sommeil sombre et frais pour maximiser la libération de mélatonine et d\'hormone de croissance.';

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
  String get achieveFirstDay => 'Premier pas';

  @override
  String get achieveFirstDayDesc => 'Terminez votre premier jour';

  @override
  String get achieveThreeStreak => 'Série de 3 jours';

  @override
  String get achieveThreeStreakDesc =>
      'Complétez les routines 3 jours de suite';

  @override
  String get achieveWeekStreak => 'Série de 7 jours';

  @override
  String get achieveWeekStreakDesc => 'Complétez les routines 7 jours de suite';

  @override
  String get achieveTwoWeekStreak => 'Série de 14 jours';

  @override
  String get achieveTwoWeekStreakDesc =>
      'Continuez pendant 14 jours consécutifs';

  @override
  String get achieveMonthStreak => 'Série de 30 jours';

  @override
  String get achieveMonthStreakDesc => 'Complétez 30 jours de suite';

  @override
  String get achieveTwoMonthStreak => 'Série de 60 jours';

  @override
  String get achieveTwoMonthStreakDesc => 'Complétez 60 jours de suite';

  @override
  String get achieveHundredStreak => 'Série de 100 jours';

  @override
  String get achieveHundredStreakDesc => 'Complétez 100 jours de suite';

  @override
  String get achieveFirstMeasure => 'Première mesure';

  @override
  String get achieveFirstMeasureDesc =>
      'Enregistrez votre première mesure de taille';

  @override
  String get achieveThreeMeasures => 'Suivi régulier';

  @override
  String get achieveThreeMeasuresDesc => 'Enregistrez 3 mesures de taille';

  @override
  String get achieveFiveMeasures => 'Suivi assidu';

  @override
  String get achieveFiveMeasuresDesc => 'Enregistrez 5 mesures de taille';

  @override
  String get achieveTenMeasures => 'Chasseur de données';

  @override
  String get achieveTenMeasuresDesc => 'Enregistrez 10 mesures de taille';

  @override
  String get achieveFirstCm => 'Premier centimètre';

  @override
  String get achieveFirstCmDesc => 'Enregistrez 1 cm de croissance totale';

  @override
  String get achieveThreeCm => '3 cm de croissance';

  @override
  String get achieveThreeCmDesc => 'Enregistrez 3 cm de croissance totale';

  @override
  String get achieveFiveCm => '5 cm de croissance';

  @override
  String get achieveFiveCmDesc => 'Enregistrez 5 cm de croissance totale';

  @override
  String get achieveTenCm => '10 cm de croissance';

  @override
  String get achieveTenCmDesc => 'Enregistrez 10 cm de croissance totale';

  @override
  String get quote1 => 'Soyez meilleur qu\'hier, chaque jour.';

  @override
  String get quote2 =>
      'La croissance ne se fait pas en une nuit, mais chaque nuit vous en rapproche.';

  @override
  String get quote3 => 'La croissance demande de la patience, continuez !';

  @override
  String get quote4 =>
      'Le pas que vous faites aujourd\'hui construit les fondations de demain.';

  @override
  String get quote5 => 'La discipline commence là où la motivation s\'arrête.';

  @override
  String get quote6 => 'Votre corps vous remerciera, continuez !';

  @override
  String get quote7 => 'C\'est vous qui fixez les limites de votre potentiel.';

  @override
  String get quote8 => 'Les petits pas créent de grands changements.';

  @override
  String get quote9 => 'Le meilleur investissement, c\'est en soi-même.';

  @override
  String get quote10 => 'Vous vous rapprochez de votre objectif chaque jour.';

  @override
  String get quote11 =>
      'Le changement est difficile, mais le regret l\'est encore plus.';

  @override
  String get quote12 => 'Votre corps est un temple, prenez-en soin.';

  @override
  String get quote13 =>
      'Votre rival, c\'est le vous d\'hier. Dépassez-le aujourd\'hui !';

  @override
  String get quote14 => 'BeTaller = Patience + Discipline + Conviction';

  @override
  String get quote15 => 'Croyez en vous, le processus vous façonnera.';

  @override
  String get quote16 =>
      'Ne dites pas je ne peux pas aujourd\'hui, ne regrettez pas demain.';

  @override
  String get quote17 =>
      'Montrez des progrès chaque jour, même si ce n\'est que 1%.';

  @override
  String get quote18 => 'Le miroir montrera vos progrès, soyez patient.';

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
      'Suivez les facteurs qui affectent votre croissance';

  @override
  String get caffeineToday => 'Caféine aujourd\'hui';

  @override
  String get withinLimits => 'Dans les limites saines';

  @override
  String get approachingLimit => 'Proche de la limite';

  @override
  String get overLimit => 'Limite dépassée — affecte l\'HGH';

  @override
  String get resetToday => 'Réinitialiser aujourd\'hui';

  @override
  String get stressToday => 'Stress aujourd\'hui';

  @override
  String get stressVeryCalmLabel => 'Très calme — optimal pour la croissance';

  @override
  String get stressCalmLabel => 'Calme';

  @override
  String get stressNeutralLabel => 'Neutre';

  @override
  String get stressStressedLabel => 'Stressé';

  @override
  String get stressVeryStressedLabel =>
      'Très stressé — le cortisol bloque l\'HGH';

  @override
  String get stressTapToLog => 'Appuyez pour enregistrer votre humeur';

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
      'Votre consommation de caféine est élevée cette semaine. Essayez de réduire pour un meilleur sommeil et HGH.';

  @override
  String get insightStressHigh =>
      'Le stress est élevé cette semaine. Pensez à des exercices de respiration — le cortisol bloque la croissance.';

  @override
  String get insightMoodLow =>
      'L\'humeur est basse récemment. Le soleil, le sommeil et l\'exercice léger aident.';

  @override
  String get insightGreat =>
      'Excellent équilibre cette semaine. Votre bien-être soutient une croissance optimale.';

  @override
  String get insightDefault =>
      'Votre bien-être est en bonne voie. Continuez à enregistrer pour des analyses plus profondes.';

  @override
  String get insightNeedMoreData =>
      'Enregistrez pendant quelques jours de plus pour voir les analyses.';

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
      'Cette photo sera retirée de votre chronologie de progrès.';

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
  String get cmGained => 'cm gagnés';

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
  String get yourHeightDialog => 'Votre taille';

  @override
  String get heightDialogMessage =>
      'Entrez votre taille actuelle en cm pour cette photo';

  @override
  String get postureAnalysisTitle => 'Analyse posturale';

  @override
  String get postureCoachHeader => 'COACH POSTURE';

  @override
  String get postureCoachSubtitle => 'Évaluation posturale par IA';

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
      'Tenez-vous dos au mur pendant 2 minutes par jour.';

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
  String get recipesSubtitle => 'Alimentez votre croissance';

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
      'Des recettes sélectionnées pour alimenter votre croissance. Filtrez par type de repas ou objectif nutritionnel pour trouver le match parfait.';

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
  String get routineFormHint => 'Optionnel — comment effectuer cette routine';

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
  String get program => 'Programme';

  @override
  String get todaysExercises => 'EXERCICES DU JOUR';

  @override
  String get dailyNutritionPlan => 'PLAN NUTRITION QUOTIDIEN';

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
  String get designedForYou => 'Conçu pour vous';

  @override
  String get designedForYouDesc =>
      'BeTaller a été conçu spécialement pour vous aider à atteindre votre potentiel génétique.';

  @override
  String get greetingAllDone => 'Excellent ! 🎯';

  @override
  String get greetingAllDoneSub => 'Vous avez terminé les tâches du jour.';

  @override
  String greetingStreak30(int streak) {
    return 'Série de $streak jours — niveau légendaire.';
  }

  @override
  String greetingStreak7(int streak) {
    return 'Série de $streak jours — continuez.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak jours d\'affilée. La plupart abandonnent. Pas vous.';
  }

  @override
  String get greetingMorning =>
      'Bonjour. Un nouveau jour, une nouvelle chance.';

  @override
  String get greetingAfternoon =>
      'Aujourd\'hui est parfait pour commencer votre série.';

  @override
  String get greetingEvening => 'Terminez vos tâches, commencez votre série.';

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
  String get growthEmptyFirst => 'Enregistrez votre première taille.';

  @override
  String get growthEmptySecond => '2e mesure pour voir le graphique.';

  @override
  String get growthSectionLabel => 'CROISSANCE';

  @override
  String get generalPerformance => 'PERFORMANCE GÉNÉRALE';

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
  String get aiAnalysisLabel => 'ANALYSE IA';

  @override
  String get peerCompareLabel => 'COMPARER AVEC VOS PAIRS';

  @override
  String peerCompareText(int topPct) {
    return 'Vous êtes dans le Top $topPct% de vos pairs';
  }

  @override
  String get notifWaterTitle => '💧 N\'oubliez pas de boire !';

  @override
  String get notifWaterBody => 'Objectif atteint ? Buvez encore un verre !';

  @override
  String get notifMorningTitle => '🌅 Bonjour ! Exercice';

  @override
  String get notifMorningBody =>
      'Étirements matinaux ! 10 minutes pour colonne et jambes.';

  @override
  String get notifRoutineTitle => '🔥 Complétez vos routines !';

  @override
  String get notifRoutineBody =>
      'Vérifiez avant fin de journée. Série = discipline !';

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
      'Hormone de croissance maximale entre 22h-2h. Posez le téléphone !';

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
  String get notifMeasureBody => 'Mesurez-vous ! Le matin est le plus précis.';

  @override
  String get notifEarlySleepTitle => '😴 Couchez-vous tôt !';

  @override
  String get notifEarlySleepBody =>
      'Demain lundi ! Bon sommeil. Au moins 8 heures.';

  @override
  String get notifStreak3Title => '🔥 Série de 3 jours !';

  @override
  String get notifStreak3Body => 'Super début ! 3 jours. Continuez vers 7 !';

  @override
  String get notifStreak7Title => '🏆 1 semaine !';

  @override
  String get notifStreak7Body => 'Incroyable ! 7 jours consécutifs !';

  @override
  String get notifStreak14Title => '⭐ 2 semaines !';

  @override
  String get notifStreak14Body =>
      '14 jours de discipline ! Votre corps change.';

  @override
  String get notifStreak30Title => '👑 1 mois !';

  @override
  String get notifStreak30Body => '30 jours ! Vous êtes champion !';

  @override
  String get notifStreak60Title => '🌟 60 jours !';

  @override
  String get notifStreak60Body => '60 jours ! Exploit incroyable.';

  @override
  String get notifStreak100Title => '💎 100 JOURS ! LÉGENDAIRE !';

  @override
  String get notifStreak100Body => '100 jours ! Vous êtes une légende.';

  @override
  String get notifStreakRiskTitle => '⚠️ Ne perdez pas votre série !';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Votre série de $streak jours est en danger !';
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
  String get paywallRestoreLabel => 'Restaurer les achats';

  @override
  String get paywallYearly => 'Annuel';

  @override
  String get paywallBestValue => 'Meilleur rapport';

  @override
  String get paywallMonthly => 'Mensuel';

  @override
  String get paywallFreeTrial => '3 jours gratuits';

  @override
  String get paywallLoadError => 'Impossible de charger, réessayez';

  @override
  String get paywallCta => 'Essai gratuit';

  @override
  String get paywallCtaAlt => 'Continuer';

  @override
  String get paywallTrialDisclaimer =>
      '3 jours gratuits · renouvellement auto · annulation à tout moment';

  @override
  String get paywallYearlyDisclaimer =>
      'Renouvellement annuel auto · annulation à tout moment';

  @override
  String get paywallTester => 'Testeur';

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
}
