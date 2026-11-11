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

  // ── The longer tour (Nov 2026): five more stops ───────────────────────────

  /// Home: the water and sleep trackers, side by side.
  static final homeTrackers = GlobalKey(debugLabel: 'tour.homeTrackers');

  /// Progress: the before/after photos tool card.
  static final progressPhotos = GlobalKey(debugLabel: 'tour.progressPhotos');

  /// Progress: the posture check tool card.
  static final progressPosture = GlobalKey(debugLabel: 'tour.progressPosture');

  /// Progress: the weekly report tool card.
  static final progressReport = GlobalKey(debugLabel: 'tour.progressReport');

  /// Analysis: what the score is made of (blurred behind the lock once the
  /// free look is spent).
  static final analysisBreakdown = GlobalKey(
    debugLabel: 'tour.analysisBreakdown',
  );
}
