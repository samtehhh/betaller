import '../l10n/app_localizations.dart';

/// Returns localized routine title/description/form/science by routine ID
Map<String, String> localizedRoutine(AppLocalizations l, String id) {
  final t = _routineData[id];
  if (t == null) {
    return {'title': id, 'description': '', 'form': '', 'science': ''};
  }
  return {
    'title': t.$1(l),
    'description': t.$2(l),
    'form': t.$3(l),
    'science': t.$4(l),
  };
}

typedef _R = (
  String Function(AppLocalizations),
  String Function(AppLocalizations),
  String Function(AppLocalizations),
  String Function(AppLocalizations),
);

final Map<String, _R> _routineData = {
  'morning_stretch': (
    (l) => l.routineMorningStretch,
    (l) => l.routineMorningStretchDesc,
    (l) => l.formMorningStretch,
    (l) => l.sciMorningStretch,
  ),
  'bar_hanging': (
    (l) => l.routineBarHanging,
    (l) => l.routineBarHangingDesc,
    (l) => l.formBarHanging,
    (l) => l.sciBarHanging,
  ),
  'cobra_stretch': (
    (l) => l.routineCobraStretch,
    (l) => l.routineCobraStretchDesc,
    (l) => l.formCobraStretch,
    (l) => l.sciCobraStretch,
  ),
  'jumping': (
    (l) => l.routineJumping,
    (l) => l.routineJumpingDesc,
    (l) => l.formJumping,
    (l) => l.sciJumping,
  ),
  'swimming_basketball': (
    (l) => l.routineSwimming,
    (l) => l.routineSwimmingDesc,
    (l) => l.formSwimmingBasketball,
    (l) => l.sciSwimmingBasketball,
  ),
  'evening_yoga': (
    (l) => l.routineYoga,
    (l) => l.routineYogaDesc,
    (l) => l.formEveningYoga,
    (l) => l.sciEveningYoga,
  ),
  'protein': (
    (l) => l.routineProtein,
    (l) => l.routineProteinDesc,
    (l) => l.formProtein,
    (l) => l.sciProtein,
  ),
  'calcium_vitamin_d': (
    (l) => l.routineCalcium,
    (l) => l.routineCalciumDesc,
    (l) => l.formCalciumVitaminD,
    (l) => l.sciCalciumVitaminD,
  ),
  'water': (
    (l) => l.routineWater,
    (l) => l.routineWaterDesc,
    (l) => l.formWater,
    (l) => l.sciWater,
  ),
  'avoid_junk': (
    (l) => l.routineAvoidJunk,
    (l) => l.routineAvoidJunkDesc,
    (l) => l.formAvoidJunk,
    (l) => l.sciAvoidJunk,
  ),
  'quality_sleep': (
    (l) => l.routineSleep,
    (l) => l.routineSleepDesc,
    (l) => l.formQualitySleep,
    (l) => l.sciQualitySleep,
  ),
  'no_screen': (
    (l) => l.routineNoScreen,
    (l) => l.routineNoScreenDesc,
    (l) => l.formNoScreen,
    (l) => l.sciNoScreen,
  ),
  'posture_check': (
    (l) => l.routinePosture,
    (l) => l.routinePostureDesc,
    (l) => l.formPostureCheck,
    (l) => l.sciPostureCheck,
  ),
  'wall_stand': (
    (l) => l.routineWallStand,
    (l) => l.routineWallStandDesc,
    (l) => l.formWallStand,
    (l) => l.sciWallStand,
  ),
  'sprint_intervals': (
    (l) => l.routineSprintIntervals,
    (l) => l.routineSprintIntervalsDesc,
    (l) => l.formSprintIntervals,
    (l) => l.sciSprintIntervals,
  ),
  'hiit_workout': (
    (l) => l.routineHiitWorkout,
    (l) => l.routineHiitWorkoutDesc,
    (l) => l.formHiitWorkout,
    (l) => l.sciHiitWorkout,
  ),
  'squats': (
    (l) => l.routineSquats,
    (l) => l.routineSquatsDesc,
    (l) => l.formSquats,
    (l) => l.sciSquats,
  ),
  'deadlift_stretch': (
    (l) => l.routineDeadliftStretch,
    (l) => l.routineDeadliftStretchDesc,
    (l) => l.formDeadliftStretch,
    (l) => l.sciDeadliftStretch,
  ),
  'overhead_press': (
    (l) => l.routineOverheadPress,
    (l) => l.routineOverheadPressDesc,
    (l) => l.formOverheadPress,
    (l) => l.sciOverheadPress,
  ),
  'skipping_rope': (
    (l) => l.routineSkippingRope,
    (l) => l.routineSkippingRopeDesc,
    (l) => l.formSkippingRope,
    (l) => l.sciSkippingRope,
  ),
  'pilates_core': (
    (l) => l.routinePilatesCore,
    (l) => l.routinePilatesCoreDesc,
    (l) => l.formPilatesCore,
    (l) => l.sciPilatesCore,
  ),
  'inversion_hang': (
    (l) => l.routineInversionHang,
    (l) => l.routineInversionHangDesc,
    (l) => l.formInversionHang,
    (l) => l.sciInversionHang,
  ),
  'zinc_intake': (
    (l) => l.routineZincIntake,
    (l) => l.routineZincIntakeDesc,
    (l) => l.formZincIntake,
    (l) => l.sciZincIntake,
  ),
  'vitamin_d_sunlight': (
    (l) => l.routineVitaminDSunlight,
    (l) => l.routineVitaminDSunlightDesc,
    (l) => l.formVitaminDSunlight,
    (l) => l.sciVitaminDSunlight,
  ),
  'arginine_foods': (
    (l) => l.routineArginineFoods,
    (l) => l.routineArginineFoodsDesc,
    (l) => l.formArginineFoods,
    (l) => l.sciArginineFoods,
  ),
  'sleep_environment': (
    (l) => l.routineSleepEnvironment,
    (l) => l.routineSleepEnvironmentDesc,
    (l) => l.formSleepEnvironment,
    (l) => l.sciSleepEnvironment,
  ),
  'pre_sleep_routine': (
    (l) => l.routinePreSleepRoutine,
    (l) => l.routinePreSleepRoutineDesc,
    (l) => l.formPreSleepRoutine,
    (l) => l.sciPreSleepRoutine,
  ),
  'neck_stretches': (
    (l) => l.routineNeckStretches,
    (l) => l.routineNeckStretchesDesc,
    (l) => l.formNeckStretches,
    (l) => l.sciNeckStretches,
  ),
  'shoulder_rolls': (
    (l) => l.routineShoulderRolls,
    (l) => l.routineShoulderRollsDesc,
    (l) => l.formShoulderRolls,
    (l) => l.sciShoulderRolls,
  ),
};

/// Returns localized muscle name from English key
String localizedMuscle(AppLocalizations l, String key) {
  switch (key) {
    case 'spine':
      return l.muscleSpine;
    case 'legs':
      return l.muscleLegs;
    case 'back':
      return l.muscleBack;
    case 'shoulders':
      return l.muscleShoulders;
    case 'arms':
      return l.muscleArms;
    case 'core':
      return l.muscleCore;
    case 'chest':
      return l.muscleChest;
    case 'calves':
      return l.muscleCalves;
    case 'full_body':
      return l.muscleFullBody;
    case 'hips':
      return l.muscleHips;
    case 'bones':
      return l.muscleBones;
    case 'muscles':
      return l.muscleMuscles;
    case 'neck':
      return l.muscleNeck;
    case 'upper_spine':
      return l.muscleUpperSpine;
    case 'upper_back':
      return l.muscleUpperBack;
    default:
      return key[0].toUpperCase() + key.substring(1);
  }
}

/// Returns localized achievement title/description by achievement ID
Map<String, String> localizedAchievement(AppLocalizations l, String id) {
  switch (id) {
    case 'first_day':
      return {'title': l.achieveFirstDay, 'description': l.achieveFirstDayDesc};
    case 'three_streak':
      return {
        'title': l.achieveThreeStreak,
        'description': l.achieveThreeStreakDesc,
      };
    case 'week_streak':
      return {
        'title': l.achieveWeekStreak,
        'description': l.achieveWeekStreakDesc,
      };
    case 'two_week_streak':
      return {
        'title': l.achieveTwoWeekStreak,
        'description': l.achieveTwoWeekStreakDesc,
      };
    case 'month_streak':
      return {
        'title': l.achieveMonthStreak,
        'description': l.achieveMonthStreakDesc,
      };
    case 'two_month_streak':
      return {
        'title': l.achieveTwoMonthStreak,
        'description': l.achieveTwoMonthStreakDesc,
      };
    case 'hundred_streak':
      return {
        'title': l.achieveHundredStreak,
        'description': l.achieveHundredStreakDesc,
      };
    case 'first_measure':
      return {
        'title': l.achieveFirstMeasure,
        'description': l.achieveFirstMeasureDesc,
      };
    case 'three_measures':
      return {
        'title': l.achieveThreeMeasures,
        'description': l.achieveThreeMeasuresDesc,
      };
    case 'five_measures':
      return {
        'title': l.achieveFiveMeasures,
        'description': l.achieveFiveMeasuresDesc,
      };
    case 'ten_measures':
      return {
        'title': l.achieveTenMeasures,
        'description': l.achieveTenMeasuresDesc,
      };
    case 'first_cm':
      return {'title': l.achieveFirstCm, 'description': l.achieveFirstCmDesc};
    case 'three_cm':
      return {'title': l.achieveThreeCm, 'description': l.achieveThreeCmDesc};
    case 'five_cm':
      return {'title': l.achieveFiveCm, 'description': l.achieveFiveCmDesc};
    case 'ten_cm':
      return {'title': l.achieveTenCm, 'description': l.achieveTenCmDesc};
    default:
      return {'title': id, 'description': ''};
  }
}

/// Returns localized motivational quote by index
String localizedQuote(AppLocalizations l, int index) {
  final quotes = [
    l.quote1,
    l.quote2,
    l.quote3,
    l.quote4,
    l.quote5,
    l.quote6,
    l.quote7,
    l.quote8,
    l.quote9,
    l.quote10,
    l.quote11,
    l.quote12,
    l.quote13,
    l.quote14,
    l.quote15,
    l.quote16,
    l.quote17,
    l.quote18,
  ];
  return quotes[index % quotes.length];
}

/// Returns localized daily tip by index
String localizedTip(AppLocalizations l, int index) {
  final tips = [
    l.tipMorningMeasure,
    l.tipProteinSpread,
    l.tipGrowthHormone,
    l.tipVitaminD,
    l.tipBarHanging,
    l.tipSwimming,
    l.tipStress,
  ];
  return tips[index % tips.length];
}

/// Returns localized category title
String localizedCategory(AppLocalizations l, String category) {
  switch (category) {
    case 'exercise':
      return l.exercise;
    case 'nutrition':
      return l.nutrition;
    case 'sleep':
      return l.sleepLabel;
    case 'posture':
      return l.posture;
    default:
      return category;
  }
}

/// Returns localized duration string
String localizedDuration(AppLocalizations l, String duration) {
  // Parse "X dk" or "X saat" or "Gün boyu" patterns
  if (duration == 'Gün boyu') return l.durationAllDay;
  if (duration == 'Gece') return l.durationNight;
  final minMatch = RegExp(r'(\d+)\s*dk').firstMatch(duration);
  if (minMatch != null) return l.durationMinutes(minMatch.group(1)!);
  final hourMatch = RegExp(r'([\d-]+)\s*saat').firstMatch(duration);
  if (hourMatch != null) return l.durationHours(hourMatch.group(1)!);
  return duration;
}

/// Returns localized BMI category
String localizedBmiCategory(AppLocalizations l, String category) {
  switch (category) {
    case 'underweight':
      return l.bmiUnderweight;
    case 'normal':
      return l.bmiNormal;
    case 'overweight':
      return l.bmiOverweight;
    case 'obese':
      return l.bmiObese;
    default:
      return category;
  }
}

/// Returns localized velocity rating
String localizedVelocityRating(AppLocalizations l, String rating) {
  switch (rating) {
    case 'excellent':
      return l.velocityExcellent;
    case 'normal':
      return l.velocityNormal;
    case 'slow':
      return l.velocitySlow;
    case 'very_low':
      return l.velocityVeryLow;
    default:
      return rating;
  }
}

/// Returns localized score summary
String localizedScoreSummary(AppLocalizations l, String key) {
  switch (key) {
    case 'score_s':
      return l.scoreS;
    case 'score_a':
      return l.scoreA;
    case 'score_b':
      return l.scoreB;
    case 'score_c':
      return l.scoreC;
    case 'score_d':
      return l.scoreD;
    case 'score_f':
      return l.scoreF;
    default:
      return key;
  }
}

/// Returns localized level title from English level title string
String localizedLevelTitle(AppLocalizations l, String englishTitle) {
  switch (englishTitle) {
    case 'Beginner':
      return l.levelBeginner;
    case 'Starter':
      return l.levelStarter;
    case 'Committed':
      return l.levelCommitted;
    case 'Dedicated':
      return l.levelDedicated;
    case 'Consistent':
      return l.levelConsistent;
    case 'Focused':
      return l.levelFocused;
    case 'Determined':
      return l.levelDetermined;
    case 'Disciplined':
      return l.levelDisciplined;
    case 'Strong':
      return l.levelStrong;
    case 'Advanced':
      return l.levelAdvanced;
    case 'Expert':
      return l.levelExpert;
    case 'Master':
      return l.levelMaster;
    case 'Elite':
      return l.levelElite;
    case 'Champion':
      return l.levelChampion;
    case 'Legend':
      return l.levelLegend;
    case 'Titan':
      return l.levelTitan;
    case 'Mythic':
      return l.levelMythic;
    case 'Immortal':
      return l.levelImmortal;
    case 'Transcendent':
      return l.levelTranscendent;
    case 'Ultimate':
      return l.levelUltimate;
    default:
      return englishTitle;
  }
}

/// Returns localized challenge title by challenge ID
String localizedChallengeTitle(AppLocalizations l, String challengeId) {
  switch (challengeId) {
    case 'daily_all_routines':
      return l.challengeCompleteAllRoutines;
    case 'daily_water':
      return l.challengeHydrationHero;
    case 'daily_sleep_early':
      return l.challengeEarlySleeper;
    case 'daily_exercise_3':
      return l.challengeExerciseTrio;
    case 'daily_stretch':
      return l.challengeMorningStretch;
    case 'weekly_streak_7':
      return l.challenge7DayWarrior;
    case 'weekly_measure':
      return l.challengeGrowthTracker;
    case 'weekly_water_5':
      return l.challengeHydrationWeek;
    case 'weekly_exercise_15':
      return l.challengeFitnessChampion;
    case 'weekly_sleep_5':
      return l.challengeSleepMaster;
    default:
      return challengeId;
  }
}

/// Returns localized challenge description by challenge ID
String localizedChallengeDesc(AppLocalizations l, String challengeId) {
  switch (challengeId) {
    case 'daily_all_routines':
      return l.challengeCompleteAllRoutinesDesc;
    case 'daily_water':
      return l.challengeHydrationHeroDesc;
    case 'daily_sleep_early':
      return l.challengeEarlySleeperDesc;
    case 'daily_exercise_3':
      return l.challengeExerciseTrioDesc;
    case 'daily_stretch':
      return l.challengeMorningStretchDesc;
    case 'weekly_streak_7':
      return l.challenge7DayWarriorDesc;
    case 'weekly_measure':
      return l.challengeGrowthTrackerDesc;
    case 'weekly_water_5':
      return l.challengeHydrationWeekDesc;
    case 'weekly_exercise_15':
      return l.challengeFitnessChampionDesc;
    case 'weekly_sleep_5':
      return l.challengeSleepMasterDesc;
    default:
      return challengeId;
  }
}

/// Returns localized education category label
String localizedEducationCategory(AppLocalizations l, String category) {
  switch (category) {
    case 'all':
      return l.categoryAll;
    case 'science':
      return l.categoryScience;
    case 'nutrition':
      return l.categoryNutrition;
    case 'exercise':
      return l.categoryExercise;
    case 'sleep':
      return l.categorySleep;
    case 'myths':
      return l.categoryMyths;
    default:
      return category[0].toUpperCase() + category.substring(1);
  }
}
