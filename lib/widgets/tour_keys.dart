import 'package:flutter/widgets.dart';

/// One [GlobalKey] per real widget the app tour points at.
///
/// Each key is attached, through a [KeyedSubtree] wrapper so the target
/// widget itself never changes, to the card the screen already renders. The
/// tour therefore highlights exactly what the screen looks like today, and
/// test/tour_test.dart fails if a key stops being attached.
class TourKeys {
  TourKeys._();

  /// Home: today's height next to the potential (_PotentialHero).
  static final homePotential = GlobalKey(debugLabel: 'tour.homePotential');

  /// My Plan, Today tab: the day's workout with Start workout (_TodayHero).
  static final planTodayHero = GlobalKey(debugLabel: 'tour.planTodayHero');

  /// My Plan, Discipline tab: today's step of the 70-day program
  /// (_ProgramDayCard, behind the lock for free users).
  static final planProgramDay = GlobalKey(debugLabel: 'tour.planProgramDay');

  /// My Plan, Discipline tab: the 70-day ring. Shown to free users, for
  /// whom the day card sits blurred behind the lock.
  static final planProgramHeader = GlobalKey(
    debugLabel: 'tour.planProgramHeader',
  );

  /// My Plan, Nutrition tab: the daily targets (NutritionTargetsHeader).
  static final planNutritionTargets = GlobalKey(
    debugLabel: 'tour.planNutritionTargets',
  );

  /// Progress: the growth curve card.
  static final progressChart = GlobalKey(debugLabel: 'tour.progressChart');

  /// Analysis: the BeTaller Score hero.
  static final analysisScore = GlobalKey(debugLabel: 'tour.analysisScore');
}
