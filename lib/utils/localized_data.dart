import '../l10n/app_localizations.dart';

/// Returns localized routine title/description by routine ID
Map<String, String> localizedRoutine(AppLocalizations l, String id) {
  switch (id) {
    case 'morning_stretch':
      return {'title': l.routineMorningStretch, 'description': l.routineMorningStretchDesc};
    case 'bar_hanging':
      return {'title': l.routineBarHanging, 'description': l.routineBarHangingDesc};
    case 'cobra_stretch':
      return {'title': l.routineCobraStretch, 'description': l.routineCobraStretchDesc};
    case 'jumping':
      return {'title': l.routineJumping, 'description': l.routineJumpingDesc};
    case 'swimming_basketball':
      return {'title': l.routineSwimming, 'description': l.routineSwimmingDesc};
    case 'evening_yoga':
      return {'title': l.routineYoga, 'description': l.routineYogaDesc};
    case 'protein':
      return {'title': l.routineProtein, 'description': l.routineProteinDesc};
    case 'calcium_vitamin_d':
      return {'title': l.routineCalcium, 'description': l.routineCalciumDesc};
    case 'water':
      return {'title': l.routineWater, 'description': l.routineWaterDesc};
    case 'avoid_junk':
      return {'title': l.routineAvoidJunk, 'description': l.routineAvoidJunkDesc};
    case 'quality_sleep':
      return {'title': l.routineSleep, 'description': l.routineSleepDesc};
    case 'no_screen':
      return {'title': l.routineNoScreen, 'description': l.routineNoScreenDesc};
    case 'posture_check':
      return {'title': l.routinePosture, 'description': l.routinePostureDesc};
    case 'wall_stand':
      return {'title': l.routineWallStand, 'description': l.routineWallStandDesc};
    case 'sprint_intervals':
      return {'title': l.routineSprintIntervals, 'description': l.routineSprintIntervalsDesc};
    case 'hiit_workout':
      return {'title': l.routineHiitWorkout, 'description': l.routineHiitWorkoutDesc};
    case 'squats':
      return {'title': l.routineSquats, 'description': l.routineSquatsDesc};
    case 'deadlift_stretch':
      return {'title': l.routineDeadliftStretch, 'description': l.routineDeadliftStretchDesc};
    case 'overhead_press':
      return {'title': l.routineOverheadPress, 'description': l.routineOverheadPressDesc};
    case 'skipping_rope':
      return {'title': l.routineSkippingRope, 'description': l.routineSkippingRopeDesc};
    case 'pilates_core':
      return {'title': l.routinePilatesCore, 'description': l.routinePilatesCoreDesc};
    case 'inversion_hang':
      return {'title': l.routineInversionHang, 'description': l.routineInversionHangDesc};
    case 'zinc_intake':
      return {'title': l.routineZincIntake, 'description': l.routineZincIntakeDesc};
    case 'vitamin_d_sunlight':
      return {'title': l.routineVitaminDSunlight, 'description': l.routineVitaminDSunlightDesc};
    case 'arginine_foods':
      return {'title': l.routineArginineFoods, 'description': l.routineArginineFoodsDesc};
    case 'sleep_environment':
      return {'title': l.routineSleepEnvironment, 'description': l.routineSleepEnvironmentDesc};
    case 'pre_sleep_routine':
      return {'title': l.routinePreSleepRoutine, 'description': l.routinePreSleepRoutineDesc};
    case 'neck_stretches':
      return {'title': l.routineNeckStretches, 'description': l.routineNeckStretchesDesc};
    case 'shoulder_rolls':
      return {'title': l.routineShoulderRolls, 'description': l.routineShoulderRollsDesc};
    default:
      return {'title': id, 'description': ''};
  }
}

/// Returns localized achievement title/description by achievement ID
Map<String, String> localizedAchievement(AppLocalizations l, String id) {
  switch (id) {
    case 'first_day': return {'title': l.achieveFirstDay, 'description': l.achieveFirstDayDesc};
    case 'three_streak': return {'title': l.achieveThreeStreak, 'description': l.achieveThreeStreakDesc};
    case 'week_streak': return {'title': l.achieveWeekStreak, 'description': l.achieveWeekStreakDesc};
    case 'two_week_streak': return {'title': l.achieveTwoWeekStreak, 'description': l.achieveTwoWeekStreakDesc};
    case 'month_streak': return {'title': l.achieveMonthStreak, 'description': l.achieveMonthStreakDesc};
    case 'two_month_streak': return {'title': l.achieveTwoMonthStreak, 'description': l.achieveTwoMonthStreakDesc};
    case 'hundred_streak': return {'title': l.achieveHundredStreak, 'description': l.achieveHundredStreakDesc};
    case 'first_measure': return {'title': l.achieveFirstMeasure, 'description': l.achieveFirstMeasureDesc};
    case 'three_measures': return {'title': l.achieveThreeMeasures, 'description': l.achieveThreeMeasuresDesc};
    case 'five_measures': return {'title': l.achieveFiveMeasures, 'description': l.achieveFiveMeasuresDesc};
    case 'ten_measures': return {'title': l.achieveTenMeasures, 'description': l.achieveTenMeasuresDesc};
    case 'first_cm': return {'title': l.achieveFirstCm, 'description': l.achieveFirstCmDesc};
    case 'three_cm': return {'title': l.achieveThreeCm, 'description': l.achieveThreeCmDesc};
    case 'five_cm': return {'title': l.achieveFiveCm, 'description': l.achieveFiveCmDesc};
    case 'ten_cm': return {'title': l.achieveTenCm, 'description': l.achieveTenCmDesc};
    default: return {'title': id, 'description': ''};
  }
}

/// Returns localized motivational quote by index
String localizedQuote(AppLocalizations l, int index) {
  final quotes = [
    l.quote1, l.quote2, l.quote3, l.quote4, l.quote5,
    l.quote6, l.quote7, l.quote8, l.quote9, l.quote10,
    l.quote11, l.quote12, l.quote13, l.quote14, l.quote15,
    l.quote16, l.quote17, l.quote18,
  ];
  return quotes[index % quotes.length];
}

/// Returns localized daily tip by index
String localizedTip(AppLocalizations l, int index) {
  final tips = [
    l.tipMorningMeasure, l.tipProteinSpread, l.tipGrowthHormone,
    l.tipVitaminD, l.tipBarHanging, l.tipSwimming, l.tipStress,
  ];
  return tips[index % tips.length];
}

/// Returns localized category title
String localizedCategory(AppLocalizations l, String category) {
  switch (category) {
    case 'exercise': return l.exercise;
    case 'nutrition': return l.nutrition;
    case 'sleep': return l.sleepLabel;
    case 'posture': return l.posture;
    default: return category;
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
    case 'underweight': return l.bmiUnderweight;
    case 'normal': return l.bmiNormal;
    case 'overweight': return l.bmiOverweight;
    case 'obese': return l.bmiObese;
    default: return category;
  }
}

/// Returns localized velocity rating
String localizedVelocityRating(AppLocalizations l, String rating) {
  switch (rating) {
    case 'excellent': return l.velocityExcellent;
    case 'normal': return l.velocityNormal;
    case 'slow': return l.velocitySlow;
    case 'very_low': return l.velocityVeryLow;
    default: return rating;
  }
}

/// Returns localized score summary
String localizedScoreSummary(AppLocalizations l, String key) {
  switch (key) {
    case 'score_s': return l.scoreS;
    case 'score_a': return l.scoreA;
    case 'score_b': return l.scoreB;
    case 'score_c': return l.scoreC;
    case 'score_d': return l.scoreD;
    case 'score_f': return l.scoreF;
    default: return key;
  }
}

/// Returns localized level title from English level title string
String localizedLevelTitle(AppLocalizations l, String englishTitle) {
  switch (englishTitle) {
    case 'Beginner': return l.levelBeginner;
    case 'Starter': return l.levelStarter;
    case 'Committed': return l.levelCommitted;
    case 'Dedicated': return l.levelDedicated;
    case 'Consistent': return l.levelConsistent;
    case 'Focused': return l.levelFocused;
    case 'Determined': return l.levelDetermined;
    case 'Disciplined': return l.levelDisciplined;
    case 'Strong': return l.levelStrong;
    case 'Advanced': return l.levelAdvanced;
    case 'Expert': return l.levelExpert;
    case 'Master': return l.levelMaster;
    case 'Elite': return l.levelElite;
    case 'Champion': return l.levelChampion;
    case 'Legend': return l.levelLegend;
    case 'Titan': return l.levelTitan;
    case 'Mythic': return l.levelMythic;
    case 'Immortal': return l.levelImmortal;
    case 'Transcendent': return l.levelTranscendent;
    case 'Ultimate': return l.levelUltimate;
    default: return englishTitle;
  }
}

/// Returns localized challenge title by challenge ID
String localizedChallengeTitle(AppLocalizations l, String challengeId) {
  switch (challengeId) {
    case 'daily_all_routines': return l.challengeCompleteAllRoutines;
    case 'daily_water': return l.challengeHydrationHero;
    case 'daily_sleep_early': return l.challengeEarlySleeper;
    case 'daily_exercise_3': return l.challengeExerciseTrio;
    case 'daily_stretch': return l.challengeMorningStretch;
    case 'weekly_streak_7': return l.challenge7DayWarrior;
    case 'weekly_measure': return l.challengeGrowthTracker;
    case 'weekly_water_5': return l.challengeHydrationWeek;
    case 'weekly_exercise_15': return l.challengeFitnessChampion;
    case 'weekly_sleep_5': return l.challengeSleepMaster;
    default: return challengeId;
  }
}

/// Returns localized challenge description by challenge ID
String localizedChallengeDesc(AppLocalizations l, String challengeId) {
  switch (challengeId) {
    case 'daily_all_routines': return l.challengeCompleteAllRoutinesDesc;
    case 'daily_water': return l.challengeHydrationHeroDesc;
    case 'daily_sleep_early': return l.challengeEarlySleeperDesc;
    case 'daily_exercise_3': return l.challengeExerciseTrioDesc;
    case 'daily_stretch': return l.challengeMorningStretchDesc;
    case 'weekly_streak_7': return l.challenge7DayWarriorDesc;
    case 'weekly_measure': return l.challengeGrowthTrackerDesc;
    case 'weekly_water_5': return l.challengeHydrationWeekDesc;
    case 'weekly_exercise_15': return l.challengeFitnessChampionDesc;
    case 'weekly_sleep_5': return l.challengeSleepMasterDesc;
    default: return challengeId;
  }
}

/// Returns localized education category label
String localizedEducationCategory(AppLocalizations l, String category) {
  switch (category) {
    case 'all': return l.categoryAll;
    case 'science': return l.categoryScience;
    case 'nutrition': return l.categoryNutrition;
    case 'exercise': return l.categoryExercise;
    case 'sleep': return l.categorySleep;
    case 'myths': return l.categoryMyths;
    default: return category[0].toUpperCase() + category.substring(1);
  }
}
