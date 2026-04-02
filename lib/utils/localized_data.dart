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
