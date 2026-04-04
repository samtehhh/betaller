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
  String get completionLabel => 'ACHÈVEMENT';

  @override
  String get growthVelocity => 'VITESSE DE CROISSANCE';

  @override
  String get noData => 'Aucune donnée';

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
      'J\'ai découvert mon potentiel de croissance avec BeTaller ! Essayez aussi : https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app';

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
  String get durationNight => 'Night';

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
}
