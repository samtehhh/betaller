import 'package:flutter/widgets.dart';

/// One [GlobalKey] per real widget the app walkthrough points at.
///
/// Each key is attached — via a [KeyedSubtree] wrapper, so the target
/// widget itself never needs to change — to the actual card the app already
/// renders, so what the tour highlights is never out of date with what the
/// screen actually looks like.
class TourKeys {
  TourKeys._();

  // ── Home ─────────────────────────────────────────────────────────────
  static final homeStreak = GlobalKey(debugLabel: 'tour.homeStreak');
  static final homeXp = GlobalKey(debugLabel: 'tour.homeXp');
  static final homeGoals = GlobalKey(debugLabel: 'tour.homeGoals');
  static final homeGoalsRoutines = GlobalKey(
    debugLabel: 'tour.homeGoalsRoutines',
  );
  static final homeGoalsChallenges = GlobalKey(
    debugLabel: 'tour.homeGoalsChallenges',
  );
  static final homeGoalsWater = GlobalKey(debugLabel: 'tour.homeGoalsWater');
  static final homeTrack = GlobalKey(debugLabel: 'tour.homeTrack');
  static final homeReminder = GlobalKey(debugLabel: 'tour.homeReminder');
  static final homeChallenges = GlobalKey(debugLabel: 'tour.homeChallenges');
  static final homeGrowth = GlobalKey(debugLabel: 'tour.homeGrowth');
  static final homeExplore = GlobalKey(debugLabel: 'tour.homeExplore');

  // ── My Plan ──────────────────────────────────────────────────────────
  static final planTabs = GlobalKey(debugLabel: 'tour.planTabs');
  static final planLevel = GlobalKey(debugLabel: 'tour.planLevel');
  static final planToday = GlobalKey(debugLabel: 'tour.planToday');
  static final planTodayList = GlobalKey(debugLabel: 'tour.planTodayList');
  static final planWeekGoals = GlobalKey(debugLabel: 'tour.planWeekGoals');
  static final planMonthGoals = GlobalKey(debugLabel: 'tour.planMonthGoals');
  static final planProgramHeader = GlobalKey(
    debugLabel: 'tour.planProgramHeader',
  );
  static final planProgramLevels = GlobalKey(
    debugLabel: 'tour.planProgramLevels',
  );
  static final planNutritionHeader = GlobalKey(
    debugLabel: 'tour.planNutritionHeader',
  );
  static final planNutritionFirst = GlobalKey(
    debugLabel: 'tour.planNutritionFirst',
  );

  // ── Progress ─────────────────────────────────────────────────────────
  static final progressHeight = GlobalKey(debugLabel: 'tour.progressHeight');
  static final progressChart = GlobalKey(debugLabel: 'tour.progressChart');
  static final progressPhotos = GlobalKey(debugLabel: 'tour.progressPhotos');
  static final progressPosture = GlobalKey(debugLabel: 'tour.progressPosture');
  static final progressReport = GlobalKey(debugLabel: 'tour.progressReport');
  static final progressHistory = GlobalKey(debugLabel: 'tour.progressHistory');

  // ── Analysis ─────────────────────────────────────────────────────────
  static final analysisScore = GlobalKey(debugLabel: 'tour.analysisScore');
  static final analysisRadar = GlobalKey(debugLabel: 'tour.analysisRadar');
  static final analysisPrediction = GlobalKey(
    debugLabel: 'tour.analysisPrediction',
  );
  static final analysisPeer = GlobalKey(debugLabel: 'tour.analysisPeer');
  static final analysisDailyNeeds = GlobalKey(
    debugLabel: 'tour.analysisDailyNeeds',
  );
}
