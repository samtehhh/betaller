import 'dart:convert';
import 'dart:ui' show PlatformDispatcher;
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart' show CustomerInfo;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/dev_tools.dart';

import '../models/user_profile.dart';
import '../models/height_record.dart';
import '../models/onboarding_answers.dart';
import '../models/reminder.dart';
import '../services/notification_service.dart';
import '../models/routine.dart';
import '../utils/calculations.dart';
import '../utils/constants.dart';
import '../utils/betaller_score.dart';
import '../utils/daily_plan.dart';
import '../utils/daily_targets.dart';
import '../utils/free_tier.dart';
import '../utils/haptics.dart';
import '../services/purchase_service.dart';
import '../l10n/app_localizations.dart';
import '../utils/num_format.dart';

/// The positive moments that may lead to the system rating prompt. Each one
/// counts only the first time it happens; the names are stored.
enum ReviewMoment {
  /// The first height the user logs after onboarding.
  firstMeasurement,

  /// The first day the water goal is reached.
  waterGoal,

  /// The first workout played through to the end in the workout player.
  workout,

  /// The first day of the 70-day program completed.
  programDay,

  /// Three full days in a row.
  streak3,
}

class AppProvider extends ChangeNotifier {
  UserProfile? _profile;
  List<HeightRecord> _heightRecords = [];
  List<Routine> _routines = [];
  List<String> _completedRoutineIds = [];
  Set<String> _hiddenRoutineIds = {};
  String _lastRoutineDate = '';
  String _lastAllCompletedDate = '';
  int _streak = 0;
  int _bestStreak = 0;
  double _todayWater = 0;
  double _todaySleep = 0;
  String _todayQuote = '';
  Map<int, double> _pastHeights = {}; // yaş -> boy (geçmiş boylar)
  bool _analysisCompleted = false;
  Locale? _locale;
  bool _isPremium = false;

  /// The highest predicted adult height this user has been shown. The one
  /// number every screen shows as "potential"; it only ever moves up.
  double? _potentialAnchor;

  /// Answers from the onboarding the profile model has no field for:
  /// dreamHeight (cm), weeklyWorkout ('0-2' | '3-5' | '6+'), sleepHours,
  /// footSize, and since onboarding v2 whyTaller (list), triedApps, blockers
  /// (list) and firstWhenTaller, all as ids from [OnboardingIds]. Kept as a
  /// map so a new question never needs a schema change.
  Map<String, dynamic> _onboardingAnswers = {};
  // false = metric (cm/kg), true = imperial (ft-in/lbs). Defaults to
  // imperial for the US and Canada — everywhere else, including the rest
  // of the English-speaking world, defaults to metric. loadData() only
  // overrides this when a value was actually saved before, so an
  // upgrading user who never touched the setting still gets this default.
  bool _useImperial = _detectImperialDefault();

  // Gamification state
  int _totalXP = 0;
  List<Map<String, dynamic>> _activeChallenges = [];
  String _lastChallengeDate = '';
  Map<String, int> _dailyChallengeProgress = {};

  // ── v5 innovation features ──
  // Progress photos: list of {id, date, path, height}
  List<Map<String, dynamic>> _progressPhotos = [];
  // Posture analyses: list of {id, date, path, kyphosisScore, lordosisScore, headPosScore, totalScore}
  List<Map<String, dynamic>> _postureAnalyses = [];
  // Custom user-created routines (stored as raw maps)
  List<Map<String, dynamic>> _customRoutines = [];
  // Daily caffeine intake (mg) — keyed by date
  Map<String, int> _caffeineByDate = {};
  // Daily stress level 1-5 — keyed by date
  Map<String, int> _stressByDate = {};
  // Daily mood 1-5 + optional 1-line note — keyed by date
  Map<String, Map<String, dynamic>> _journalByDate = {};
  // Program progression: set of completed day indices (0-based)
  Set<int> _completedProgramDays = {};
  // Moves ticked inside program days not yet completed: day index (as a
  // string) -> routine ids. Emptied for a day once it is completed.
  Map<String, List<String>> _programMoveChecks = {};
  // The date (yyyy-MM-dd) the last program day was completed: one a day.
  String _lastProgramDayDate = '';
  // Nutrition checklist: date (yyyy-MM-dd) -> ticked keys ('protein',
  // 'calcium', 'vitaminD', 'water', 'meal0'..'meal5').
  Map<String, List<String>> _nutritionChecks = {};

  // yyyy-MM-dd -> hours slept / litres drunk, kept for 35 days so the score
  // can average a week. todaySleep and todayWater stay the live values.
  Map<String, double> _sleepLog = {};
  Map<String, double> _waterLog = {};

  // Monday's yyyy-MM-dd -> the BeTaller Score last seen that week, kept for
  // 12 weeks, so the analysis can say how this week compares.
  Map<String, int> _scoreHistory = {};

  UserProfile? get profile => _profile;
  List<HeightRecord> get heightRecords => _heightRecords;
  List<Routine> get routines =>
      _routines.where((r) => !_hiddenRoutineIds.contains(r.id)).toList();
  List<Routine> get allRoutines => _routines;
  Set<String> get hiddenRoutineIds => _hiddenRoutineIds;

  void toggleRoutineVisibility(String id) {
    if (_hiddenRoutineIds.contains(id)) {
      _hiddenRoutineIds.remove(id);
    } else {
      _hiddenRoutineIds.add(id);
      // If hiding a completed routine, also remove its completed flag from persistence
      _completedRoutineIds.remove(id);
      final r = _routines.firstWhere(
        (x) => x.id == id,
        orElse: () => Routine.fromJson(const {
          'id': '',
          'title': '',
          'description': '',
          'category': '',
          'duration': '',
          'icon': '',
        }),
      );
      if (r.id.isNotEmpty) r.completed = false;
    }
    _saveData();
    notifyListeners();
  }

  int get streak => _streak;
  int get bestStreak => _bestStreak;
  double get todayWater => _todayWater;
  double get todaySleep => _todaySleep;
  Map<int, double> get pastHeights => _pastHeights;
  bool get analysisCompleted => _analysisCompleted;
  String get todayQuote => _todayQuote;
  Locale? get locale => _locale;
  bool get isPremium => _isPremium;

  Map<String, dynamic> get onboardingAnswers => _onboardingAnswers;

  // ── Onboarding v2: the "why" questions ──
  //
  // Everyone who onboarded before these questions existed has none of these
  // keys, and a blob from another build may hold anything under them. Each
  // getter reads defensively, drops ids this build does not know, and falls
  // back to empty.

  /// Why the user wants to be taller, as [OnboardingIds.whyTaller] ids in the
  /// order picked (the first is the main reason). Empty when never asked.
  List<String> get whyTaller =>
      _answerIds('whyTaller', OnboardingIds.whyTaller);

  /// The main reason, or null when never asked.
  String? get mainWhyTaller => whyTaller.isEmpty ? null : whyTaller.first;

  /// Whether the user tried other height apps: one of
  /// [OnboardingIds.triedApps], or '' when never asked.
  String get triedApps => _answerId('triedApps', OnboardingIds.triedApps);

  /// What gets in the way, as [OnboardingIds.blockers] ids in the order
  /// picked (the first is the top blocker). Empty when never asked.
  List<String> get blockers => _answerIds('blockers', OnboardingIds.blockers);

  /// The top blocker, or null when never asked.
  String? get topBlocker => blockers.isEmpty ? null : blockers.first;

  /// The first thing the user wants to do once taller: one of
  /// [OnboardingIds.firstWhenTaller], or '' when never asked.
  String get firstWhenTaller =>
      _answerId('firstWhenTaller', OnboardingIds.firstWhenTaller);

  List<String> _answerIds(String key, List<String> known) {
    final v = _onboardingAnswers[key];
    if (v is! List) return const [];
    return List.unmodifiable(
      v.whereType<String>().where(known.contains).toSet(),
    );
  }

  String _answerId(String key, List<String> known) {
    final v = _onboardingAnswers[key];
    return v is String && known.contains(v) ? v : '';
  }

  /// The height the user told us they want, in cm, or null.
  double? get dreamHeight {
    final v = _onboardingAnswers['dreamHeight'];
    return v is num && v > 100 ? v.toDouble() : null;
  }

  /// Latest measured height, falling back to the profile.
  double get latestHeight => _heightRecords.isNotEmpty
      ? _heightRecords.last.height
      : (_profile?.currentHeight ?? 0);

  /// Today's model prediction, uncapped. Screens should show [potentialHeight].
  PredictionResult? get prediction => _profile == null
      ? null
      : Calculations.predictFinalHeight(_profile!, _heightRecords);

  /// The predicted adult height shown everywhere. Never below the latest
  /// measurement and never below what the user has already been shown: an
  /// evening measurement half a centimetre short must not take a
  /// centimetre off their future.
  double get potentialHeight {
    final p = prediction;
    if (p == null) return latestHeight;
    return [
      p.finalHeight,
      _potentialAnchor ?? 0.0,
      latestHeight,
    ].reduce(max);
  }

  /// Month-by-month path from today's height up to [potentialHeight].
  List<MapEntry<DateTime, double>> get potentialCurve =>
      _profile == null
          ? const []
          : Calculations.projectPotential(
              from: DateTime.now(),
              startHeight: latestHeight,
              potential: potentialHeight,
              age: _profile!.age,
            );

  void _raisePotentialAnchor() {
    if (_profile == null) return;
    final v = potentialHeight;
    if (_potentialAnchor == null || v > _potentialAnchor!) _potentialAnchor = v;
  }

  /// Personal facts for reminder copy, or null before onboarding.
  ReminderContext? get reminderContext => _profile == null
      ? null
      : ReminderContext(
          profile: _profile!,
          weeklyWorkout: _onboardingAnswers['weeklyWorkout'] as String? ?? '',
          potential: formatHeight(potentialHeight),
        );

  void setOnboardingAnswers(Map<String, dynamic> answers) {
    _onboardingAnswers = {..._onboardingAnswers, ...answers};
    _saveData();
    notifyListeners();
  }
  bool get hasPaidPremium => _isPremium; // Check if paid to remove ads
  bool get useImperial => _useImperial;

  // Gamification getters
  int get totalXP => _totalXP;
  int get level => _calculateLevel();
  String get levelTitle =>
      levelTitles[(_calculateLevel() - 1).clamp(0, levelTitles.length - 1)];
  int get xpForCurrentLevel =>
      levelThresholds[(_calculateLevel() - 1).clamp(
        0,
        levelThresholds.length - 1,
      )];
  int get xpForNextLevel => _calculateLevel() < levelThresholds.length
      ? levelThresholds[_calculateLevel()]
      : levelThresholds.last;
  double get levelProgress {
    final currentLevelXP = xpForCurrentLevel;
    final nextLevelXP = xpForNextLevel;
    if (nextLevelXP == currentLevelXP) return 1.0;
    return ((_totalXP - currentLevelXP) / (nextLevelXP - currentLevelXP)).clamp(
      0.0,
      1.0,
    );
  }

  List<Map<String, dynamic>> get activeChallenges => _activeChallenges;

  // ── v5 getters ──
  List<Map<String, dynamic>> get progressPhotos => _progressPhotos;
  List<Map<String, dynamic>> get postureAnalyses => _postureAnalyses;
  List<Map<String, dynamic>> get customRoutines => _customRoutines;
  int get todayCaffeine => _caffeineByDate[_today] ?? 0;
  int get todayStress => _stressByDate[_today] ?? 0;
  Map<String, dynamic>? get todayJournal => _journalByDate[_today];

  Map<String, int> get caffeineByDate => _caffeineByDate;
  Map<String, int> get stressByDate => _stressByDate;
  Map<String, Map<String, dynamic>> get journalByDate => _journalByDate;
  Set<int> get completedProgramDays => _completedProgramDays;

  /// Daily caffeine limit (mg) based on age — teens <100mg, adults <400mg
  int get caffeineLimit {
    final age = _profile?.age ?? 18;
    if (age < 12) return 45;
    if (age < 18) return 100;
    return 400;
  }

  // ── Progress Photos ──
  void addProgressPhoto(String path, double height) {
    final photo = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'date': _today,
      'path': path,
      'height': height,
    };
    _progressPhotos = [..._progressPhotos, photo];
    _progressPhotos.sort(
      (a, b) => (a['date'] as String).compareTo(b['date'] as String),
    );
    addXP(15);
    _saveData();
    notifyListeners();
  }

  void deleteProgressPhoto(String id) {
    _progressPhotos = _progressPhotos.where((p) => p['id'] != id).toList();
    _saveData();
    notifyListeners();
  }

  // ── Posture Analyses ──
  void addPostureAnalysis({
    required String path,
    required int kyphosisScore,
    required int lordosisScore,
    required int headPosScore,
  }) {
    final total = ((kyphosisScore + lordosisScore + headPosScore) / 3).round();
    final analysis = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'date': _today,
      'path': path,
      'kyphosisScore': kyphosisScore,
      'lordosisScore': lordosisScore,
      'headPosScore': headPosScore,
      'totalScore': total,
    };
    _postureAnalyses = [..._postureAnalyses, analysis];
    _postureAnalyses.sort(
      (a, b) => (a['date'] as String).compareTo(b['date'] as String),
    );
    addXP(20);
    _saveData();
    notifyListeners();
  }

  void deletePostureAnalysis(String id) {
    _postureAnalyses = _postureAnalyses.where((p) => p['id'] != id).toList();
    _saveData();
    notifyListeners();
  }

  // ── Custom Routines ──
  void addCustomRoutine(Map<String, dynamic> routineData) {
    final id = 'custom_${DateTime.now().millisecondsSinceEpoch}';
    final r = {...routineData, 'id': id};
    _customRoutines = [..._customRoutines, r];
    // Add to live routines list as well
    _routines = [..._routines, Routine.fromJson(r)];
    _saveData();
    notifyListeners();
  }

  void deleteCustomRoutine(String id) {
    _customRoutines = _customRoutines.where((r) => r['id'] != id).toList();
    _routines = _routines.where((r) => r.id != id).toList();
    _hiddenRoutineIds.remove(id);
    _completedRoutineIds.remove(id);
    _saveData();
    notifyListeners();
  }

  // ── Weekly plan ──
  /// The onboarding answer the plan is built for: '0-2', '3-5', '6+' or ''.
  String get weeklyWorkout =>
      _onboardingAnswers['weeklyWorkout'] as String? ?? '';

  /// This user's week, the single source for today's training block and
  /// the 70-day program.
  WeeklyPlan get weeklyPlan => WeeklyPlan.forAnswers(
        weeklyWorkout: weeklyWorkout,
        age: _profile?.age ?? 16,
      );

  /// Today's plan ids. Today follows the 70-day program, so the Today tab
  /// and the Discipline tab are one workout; other dates keep the weekday
  /// week they were planned with.
  List<String> _planIds([DateTime? date]) {
    if (date != null && _dateKey(date) != _today) {
      return dailyPlanIds(date, weeklyWorkout);
    }
    if (_todayOnWeekdayPlan) return dailyPlanIds(null, weeklyWorkout);
    final ids = <String>[];
    for (final id in [...todayPlanDay.routineIds, ...kDailyCoreRoutineIds]) {
      if (!ids.contains(id)) ids.add(id);
    }
    return ids;
  }

  /// Someone who already ticked today's weekday plan (the plan before today
  /// followed the program, e.g. on the day they update) keeps that plan for
  /// the rest of today, so no tick disappears.
  bool get _todayOnWeekdayPlan {
    if (_lastRoutineDate != _today) return false;
    final weekday = weeklyPlan.today.routineIds;
    final program = weeklyPlan.programDay(todayProgramDay).template.routineIds;
    return _completedRoutineIds.any(
          (id) => weekday.contains(id) && !program.contains(id),
        ) &&
        !_completedRoutineIds.any(
          (id) => program.contains(id) && !weekday.contains(id),
        );
  }

  /// The program day today is about: the one finished today, otherwise the
  /// first one still open.
  int get todayProgramDay {
    final open = currentProgramDay;
    final day = programDayDoneToday ? open - 1 : open;
    return day.clamp(0, kProgramDays - 1);
  }

  /// Today's plan day: the program day's template, or the weekday's day on
  /// the one day [_todayOnWeekdayPlan] keeps it.
  PlanDay get todayPlanDay => _todayOnWeekdayPlan
      ? weeklyPlan.today
      : weeklyPlan.programDay(todayProgramDay).template;

  /// The moves and doses of today's workout, matching [todayPlanDay].
  List<MoveDose> get todayMoves => _todayOnWeekdayPlan
      ? weeklyPlan.today.movesAt(currentProgramLevel(_completedProgramDays))
      : weeklyPlan.programDay(todayProgramDay).moves;

  // ── Program Day Progression ──
  /// The day the program is on: the first one not completed (0..70).
  int get currentProgramDay => firstOpenProgramDay(_completedProgramDays);

  /// Whether a program day was already completed today. The program moves
  /// one day per calendar day, so 70 taps in a row cannot finish it.
  bool get programDayDoneToday => _lastProgramDayDate == _today;

  /// Moves ticked so far in program [day].
  Set<String> programChecksFor(int day) =>
      Set<String>.from(_programMoveChecks['$day'] ?? const <String>[]);

  void toggleProgramMove(int day, String routineId) {
    if (_completedProgramDays.contains(day)) return;
    final ticked = programChecksFor(day);
    if (!ticked.remove(routineId)) ticked.add(routineId);
    _programMoveChecks = {..._programMoveChecks, '$day': ticked.toList()};
    _saveData();
    notifyListeners();
  }

  /// Sets [routineId] ticked or not in today's open program day, if that
  /// day has the move. Edits the map only: no save, no notify, no callback
  /// into [toggleRoutine], so the two never loop.
  void _syncProgramMove(String routineId, bool done) {
    final day = currentProgramDay;
    if (day >= kProgramDays ||
        programDayDoneToday ||
        _completedProgramDays.contains(day)) {
      return;
    }
    if (!weeklyPlan.programDay(day).moves.any((m) => m.routineId == routineId)) {
      return;
    }
    final ticked = programChecksFor(day);
    final changed = done ? ticked.add(routineId) : ticked.remove(routineId);
    if (changed) {
      _programMoveChecks = {..._programMoveChecks, '$day': ticked.toList()};
    }
  }

  /// Ticks [routineId] in program [day] without un-ticking it.
  void checkProgramMove(int day, String routineId) {
    if (programChecksFor(day).contains(routineId)) return;
    toggleProgramMove(day, routineId);
  }

  /// Day [day] can be completed when it is the current one, every move in
  /// it is ticked and no other program day was completed today.
  bool canCompleteProgramDay(int day) {
    if (day != currentProgramDay || day >= kProgramDays) return false;
    if (programDayDoneToday) return false;
    final moves = weeklyPlan.programDay(day).moves;
    final ticked = programChecksFor(day);
    return moves.every((m) => ticked.contains(m.routineId));
  }

  /// Completes program [day] if [canCompleteProgramDay] allows it. Returns
  /// whether it did.
  bool markProgramDayComplete(int day) {
    if (_completedProgramDays.contains(day)) return false;
    if (!canCompleteProgramDay(day)) return false;
    _completedProgramDays = {..._completedProgramDays, day};
    _programMoveChecks = {..._programMoveChecks}..remove('$day');
    _lastProgramDayDate = _today;
    addXP(30);
    noteReviewMoment(ReviewMoment.programDay);
    _saveData();
    notifyListeners();
    return true;
  }

  // ── Nutrition checklist ──
  static const _nutritionRoutineFor = {
    'protein': 'protein',
    'water': 'water',
    'calcium': 'calcium_vitamin_d',
    'vitaminD': 'vitamin_d_sunlight',
  };

  /// What was ticked on the nutrition checklist today.
  Set<String> get todayNutritionChecks =>
      Set<String>.from(_nutritionChecks[_today] ?? const <String>[]);

  Map<String, List<String>> get nutritionChecks => _nutritionChecks;

  /// Whether checklist item [key] is done today: ticked here, or its
  /// matching habit in today's plan was ticked there.
  bool nutritionCheckDone(String key) {
    if (todayNutritionChecks.contains(key)) return true;
    final rid = _nutritionRoutineFor[key];
    if (rid == null) return false;
    return todayRoutines.any((r) => r.id == rid && r.completed);
  }

  /// Ticks or unticks checklist item [key] for today, keeping the matching
  /// habit in today's plan (protein, water) in step with it.
  void toggleNutritionCheck(String key) {
    final wasDone = nutritionCheckDone(key);
    final ticked = todayNutritionChecks;
    if (wasDone) {
      ticked.remove(key);
    } else {
      ticked.add(key);
    }
    final next = {..._nutritionChecks, _today: ticked.toList()};
    // Keep two months, which is all any screen looks back over.
    if (next.length > 60) {
      final keys = next.keys.toList()..sort();
      for (final k in keys.take(next.length - 60)) {
        next.remove(k);
      }
    }
    _nutritionChecks = next;
    final rid = _nutritionRoutineFor[key];
    final habit = rid == null
        ? null
        : todayRoutines.where((r) => r.id == rid).firstOrNull;
    if (habit != null && habit.completed == wasDone) {
      toggleRoutine(habit.id); // saves and notifies
      return;
    }
    _saveData();
    notifyListeners();
  }

  // ── Caffeine Tracker ──
  void addCaffeine(int mg) {
    _caffeineByDate[_today] = (_caffeineByDate[_today] ?? 0) + mg;
    _saveData();
    notifyListeners();
  }

  void resetTodayCaffeine() {
    _caffeineByDate[_today] = 0;
    _saveData();
    notifyListeners();
  }

  // ── Stress Tracker ──
  void setTodayStress(int level) {
    _stressByDate[_today] = level.clamp(1, 5);
    _saveData();
    notifyListeners();
  }

  // ── Growth Journal ──
  void setTodayJournal({required int mood, String? note}) {
    _journalByDate[_today] = {
      'mood': mood.clamp(1, 5),
      'note': note ?? '',
      'date': _today,
    };
    addXP(5);
    _saveData();
    notifyListeners();
  }

  // ── BeTaller Score ──

  /// Logged sleep by day. A night logged before this log existed still
  /// counts for today.
  Map<String, double> get sleepLog => {
    if (_todaySleep > 0) _today: _todaySleep,
    ..._sleepLog,
  };

  Map<String, double> get waterLog => {
    if (_todayWater > 0) _today: _todayWater,
    ..._waterLog,
  };

  Map<String, int> get scoreHistory => Map.unmodifiable(_scoreHistory);

  /// The score saved for last week, or null in the first week.
  int? get lastWeekScore => _scoreHistory[
      weekKey(DateTime.now().subtract(const Duration(days: 7)))];

  /// Today's targets for this user, or null before onboarding.
  DailyTargets? get dailyTargets => _profile == null
      ? null
      : DailyTargets.forProfile(
          _profile!,
          weeklyWorkout: _onboardingAnswers['weeklyWorkout'] as String? ?? '',
          meals: _profile!.mealTimes.length,
          trainingDay: todayPlanDay.kind != PlanDayKind.rest,
        );

  /// Today's water goal in litres, the one number every screen shows:
  /// home, the plan, nutrition and the water sheet.
  double get waterGoal => dailyTargets?.waterL ?? 2.5;

  /// The BeTaller Score from everything logged so far, or null before
  /// onboarding.
  BetallerScore? get betallerScore {
    final p = _profile;
    if (p == null) return null;
    final targets = dailyTargets!;
    return BetallerScore.compute(
      ScoreInputs(
        now: DateTime.now(),
        accountCreated: p.createdAt,
        age: p.age,
        gender: p.gender,
        latestHeight: latestHeight,
        potentialHeight: potentialHeight,
        records: _heightRecords,
        routineHistory: _routineHistory,
        completedToday: _lastRoutineDate == _today
            ? _completedRoutineIds
            : const [],
        trainingIds: {
          for (final r in _routines)
            if (r.category == 'exercise') r.id,
        },
        nutritionIds: {
          for (final r in _routines)
            if (r.category == 'nutrition' && r.id != 'water') r.id,
        },
        weeklyPlan: WeeklyPlan.forAnswers(
          weeklyWorkout: _onboardingAnswers['weeklyWorkout'] as String? ?? '',
          age: p.age,
        ),
        streak: _streak,
        sleepLog: sleepLog,
        waterLog: waterLog,
        sleepTarget: targets.sleepH,
        waterTarget: targets.waterL,
        postureChecks: _postureAnalyses,
      ),
    );
  }

  /// Keeps [total] as this week's score. Saves without notifying: it is
  /// called from the screen that shows the score.
  void recordScoreSnapshot(int total) {
    final week = weekKey();
    if (_scoreHistory[week] == total) return;
    _scoreHistory = {..._scoreHistory, week: total};
    if (_scoreHistory.length > 12) {
      final keys = _scoreHistory.keys.toList()..sort();
      for (final k in keys.take(_scoreHistory.length - 12)) {
        _scoreHistory.remove(k);
      }
    }
    _saveData();
  }

  /// Height on the potential path at each future age up to 21, read off
  /// [potentialCurve] so every screen shows the same projection.
  Map<int, double> get potentialByAge {
    final p = _profile;
    if (p == null || p.age >= 21) return const {};
    final curve = potentialCurve;
    if (curve.isEmpty) return const {};
    return {
      for (var a = p.age + 1; a <= 21; a++)
        a: double.parse(
          curve[((a - p.age) * 12).clamp(0, curve.length - 1)].value
              .toStringAsFixed(1),
        ),
    };
  }

  void _trimLog<T>(Map<String, T> log) {
    if (log.length <= 35) return;
    final keys = log.keys.toList()..sort();
    for (final k in keys.take(log.length - 35)) {
      log.remove(k);
    }
  }

  // ── Height percentile (US CDC growth charts) ──
  /// The user's height percentile (1 to 99) among people of the same age
  /// and sex, at their exact age in months. Same function as onboarding.
  int get peerPercentile {
    final profile = _profile;
    if (profile == null) return 50;
    return Calculations.profilePercentile(profile, heightCm: latestHeight);
  }

  String get _today => DateTime.now().toIso8601String().substring(0, 10);

  /// The routines the app asks for today: the weekday's training block plus
  /// the everyday habits. The catalogue holds far more than a day's work.
  List<Routine> get todayRoutines {
    final ids = _planIds();
    final byId = {for (final r in _routines) r.id: r};
    return [
      for (final id in ids)
        if (byId[id] != null && !_hiddenRoutineIds.contains(id)) byId[id]!,
    ];
  }

  int get todayRoutineTotal => todayRoutines.length;
  int get completedRoutineCount =>
      todayRoutines.where((r) => r.completed).length;
  double get routineProgress =>
      todayRoutines.isEmpty ? 0 : completedRoutineCount / todayRoutines.length;
  bool get allRoutinesCompleted =>
      todayRoutines.isNotEmpty && completedRoutineCount == todayRoutines.length;

  double get totalGrowth {
    if (_heightRecords.length < 2) return 0;
    return double.parse(
      (_heightRecords.last.height - _heightRecords.first.height)
          .toStringAsFixed(1),
    );
  }

  double get lastGrowth {
    if (_heightRecords.length < 2) return 0;
    return double.parse(
      (_heightRecords.last.height -
              _heightRecords[_heightRecords.length - 2].height)
          .toStringAsFixed(1),
    );
  }

  List<Map<String, dynamic>> get unlockedAchievements {
    final unlocked = <Map<String, dynamic>>[];
    for (final a in achievementDefinitions) {
      bool earned = false;
      switch (a['type']) {
        case 'streak':
          earned = _bestStreak >= (a['value'] as int);
          break;
        case 'measures':
          earned = _heightRecords.length >= (a['value'] as int);
          break;
        case 'growth':
          earned = totalGrowth >= (a['value'] as int);
          break;
        case 'tour':
          earned = _journeyProgress >= (a['value'] as int);
          break;
      }
      unlocked.add({...a, 'earned': earned});
    }
    return unlocked;
  }

  /// Collects achievements earned since the last check so the UI can announce
  /// them. Marking them here means a badge is celebrated once, not on every
  /// rebuild.
  void checkNewAchievements() {
    final fresh = unlockedAchievements
        .where(
          (x) =>
              x['earned'] == true &&
              !_announcedAchievements.contains(x['id'] as String),
        )
        .toList();
    if (fresh.isEmpty) return;

    // A first run on an account that already qualifies would fire a burst of
    // notifications, so the very first pass only records them.
    final firstPass = _announcedAchievements.isEmpty;
    _announcedAchievements = {
      ..._announcedAchievements,
      ...fresh.map((x) => x['id'] as String),
    };
    if (!firstPass) {
      _pendingAchievementNotices = [..._pendingAchievementNotices, ...fresh];
    }
    _saveData();
    if (!firstPass) notifyListeners();
  }

  int get earnedAchievementCount =>
      unlockedAchievements.where((a) => a['earned'] == true).length;

  /// The schema this build writes. Bump it, and add a step to [_migrate],
  /// whenever the stored shape changes. Old builds ignore the field.
  static const int schemaVersion = 3;

  /// Everything last read from or written to the blob, including keys this
  /// build does not know. Saving starts from it, so a field an older or
  /// newer build wrote is carried along instead of silently dropped.
  Map<String, dynamic> _rawBlob = {};

  /// Runs [read], or logs and falls back. One unreadable field must cost
  /// that field, never the whole launch: loadData runs before runApp, so a
  /// throw here is an app that never opens and a user who reinstalls.
  T _safe<T>(String field, T Function() read, T fallback) {
    try {
      return read();
    } catch (e) {
      debugPrint('AppProvider.loadData: skipped unreadable "$field": $e');
      return fallback;
    }
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _demoDataActive = prefs.containsKey(_demoBackupKey);
    final data = prefs.getString('glowup_app_data');
    // An empty install: no rating request in this launch.
    // A later reload in the same launch (demo data) keeps it.
    _firstSession = _firstSession || data == null;

    Map<String, dynamic>? decoded;
    var meteringStartedNow = false;
    if (data != null) {
      try {
        decoded = Map<String, dynamic>.from(jsonDecode(data) as Map);
      } catch (e) {
        // Keep the unreadable original before anything can overwrite it.
        debugPrint('AppProvider.loadData: blob unreadable, backed up: $e');
        if (!prefs.containsKey('glowup_app_data_corrupt')) {
          await prefs.setString('glowup_app_data_corrupt', data);
        }
      }
    }

    if (decoded != null) {
      final sv = decoded['schemaVersion'];
      final stored = sv is num ? sv.toInt() : 2;
      _updatedThisLaunch = stored < schemaVersion;
      if (stored < schemaVersion) {
        // One untouched copy of what the previous version left behind.
        final backupKey = 'glowup_app_data_backup_v$stored';
        if (!prefs.containsKey(backupKey)) {
          await prefs.setString(backupKey, data!);
        }
      }
      final json = await _migrate(decoded);
      _rawBlob = json;

      if (json['profile'] != null) {
        _profile = _safe(
          'profile',
          () => UserProfile.fromJson(
            Map<String, dynamic>.from(json['profile'] as Map),
          ),
          null,
        );
      }

      // Record by record: one bad entry drops that entry, not the history.
      _heightRecords = (json['heightRecords'] as List? ?? const [])
          .map(
            (e) => _safe<HeightRecord?>(
              'heightRecord',
              () => HeightRecord.fromJson(Map<String, dynamic>.from(e as Map)),
              null,
            ),
          )
          .whereType<HeightRecord>()
          .toList();

      int asInt(Object? v, [int d = 0]) => v is num ? v.toInt() : d;
      double asDouble(Object? v) => v is num ? v.toDouble() : 0;
      String asStr(Object? v) => v is String ? v : '';
      bool asBool(Object? v) => v is bool ? v : false;
      List<Map<String, dynamic>> maps(String k) => _safe(
        k,
        () => [
          for (final e in (json[k] as List? ?? const []))
            if (e is Map) Map<String, dynamic>.from(e),
        ],
        <Map<String, dynamic>>[],
      );
      Map<String, int> intMap(String k) => _safe(
        k,
        () => ((json[k] as Map?) ?? const {}).map(
          (key, v) => MapEntry(key.toString(), (v as num).toInt()),
        ),
        <String, int>{},
      );

      _streak = asInt(json['streak']);
      _bestStreak = asInt(json['bestStreak']);
      _lastRoutineDate = asStr(json['lastRoutineDate']);
      _lastAllCompletedDate = asStr(json['lastAllCompletedDate']);
      _completedRoutineIds = _safe(
        'completedRoutineIds',
        () => List<String>.from(json['completedRoutineIds'] ?? const []),
        <String>[],
      );
      _hiddenRoutineIds = _safe(
        'hiddenRoutineIds',
        () => Set<String>.from(json['hiddenRoutineIds'] ?? const []),
        <String>{},
      );
      _todayWater = asDouble(json['todayWater']);
      _todaySleep = asDouble(json['todaySleep']);
      _analysisCompleted = asBool(json['analysisCompleted']);
      _isPremium = asBool(json['isPremium']);
      _useImperial = asBool(json['useImperial']);
      if (json['pastHeights'] != null) {
        _pastHeights = _safe(
          'pastHeights',
          () => (json['pastHeights'] as Map).map(
            (k, v) => MapEntry(int.parse(k.toString()), (v as num).toDouble()),
          ),
          _pastHeights,
        );
      }

      if (asStr(json['lastWaterDate']) != _today) _todayWater = 0;
      if (asStr(json['lastSleepDate']) != _today) _todaySleep = 0;

      final savedLocale = asStr(json['locale']);
      if (savedLocale.isNotEmpty) _locale = Locale(savedLocale);

      // Load gamification data
      _totalXP = asInt(json['totalXP']);
      _activeChallenges = maps('activeChallenges');
      _lastChallengeDate = asStr(json['lastChallengeDate']);
      _dailyChallengeProgress = intMap('dailyChallengeProgress');

      // v5 features
      _progressPhotos = _withLivePaths(maps('progressPhotos'));
      _postureAnalyses = _withLivePaths(maps('postureAnalyses'));
      _customRoutines = maps('customRoutines');
      _caffeineByDate = intMap('caffeineByDate');
      _stressByDate = intMap('stressByDate');
      _journalByDate = _safe(
        'journalByDate',
        () => ((json['journalByDate'] as Map?) ?? const {}).map(
          (k, v) => MapEntry(k.toString(), Map<String, dynamic>.from(v as Map)),
        ),
        <String, Map<String, dynamic>>{},
      );
      _completedProgramDays = _safe(
        'completedProgramDays',
        () => Set<int>.from(
          (json['completedProgramDays'] as List? ?? const []).map(
            (e) => (e as num).toInt(),
          ),
        ),
        <int>{},
      );
      Map<String, List<String>> listMap(String k) => _safe(
        k,
        () => ((json[k] as Map?) ?? const {}).map(
          (key, v) => MapEntry(key.toString(), List<String>.from(v as List)),
        ),
        <String, List<String>>{},
      );
      _programMoveChecks = listMap('programMoveChecks');
      _lastProgramDayDate = asStr(json['lastProgramDayDate']);
      _nutritionChecks = listMap('nutritionChecks');
      _reviewShownOnce = asBool(json['reviewShownOnce']);
      _lastReviewRequestDate = json['lastReviewRequestDate'] is String
          ? json['lastReviewRequestDate'] as String
          : null;
      _lastReviewRequestVersion = json['lastReviewRequestVersion'] is String
          ? json['lastReviewRequestVersion'] as String
          : null;
      _reviewMoments = _safe(
        'reviewMoments',
        () => Set<String>.from((json['reviewMoments'] as List?) ?? const []),
        <String>{},
      );
      // Missing means this blob predates the v3 tour: anyone with a profile
      // has not seen it yet.
      _seenV3Tour = asBool(json['seenV3Tour']);
      _lastAutoPaywallDate = json['lastAutoPaywallDate'] is String
          ? json['lastAutoPaywallDate'] as String
          : null;
      // Anyone who already answered the questionnaire has step one behind
      // them, even if they installed before the journey existed.
      _announcedAchievements = _safe(
        'announcedAchievements',
        () => Set<String>.from(
          (json['announcedAchievements'] as List?) ?? const [],
        ),
        <String>{},
      );
      final storedReminders = maps('reminders')
          .map(
            (e) =>
                _safe<Reminder?>('reminder', () => Reminder.fromJson(e), null),
          )
          .whereType<Reminder>()
          .toList();
      if (storedReminders.isNotEmpty) _reminders = storedReminders;
      _routineHistory = _safe(
        'routineHistory',
        () => ((json['routineHistory'] as Map?) ?? const {}).map(
          (k, v) => MapEntry(k.toString(), List<String>.from(v as List)),
        ),
        <String, List<String>>{},
      );
      Map<String, double> doubleMap(String k) => _safe(
        k,
        () => ((json[k] as Map?) ?? const {}).map(
          (key, v) => MapEntry(key.toString(), (v as num).toDouble()),
        ),
        <String, double>{},
      );
      _sleepLog = doubleMap('sleepLog');
      _waterLog = doubleMap('waterLog');
      _scoreHistory = intMap('scoreHistory');
      _potentialAnchor = json['potentialAnchor'] is num
          ? (json['potentialAnchor'] as num).toDouble()
          : null;
      _onboardingAnswers = json['onboardingAnswers'] is Map
          ? Map<String, dynamic>.from(json['onboardingAnswers'] as Map)
          : {};
      _journeyProgress = asInt(
        json['journeyProgress'],
        _profile != null ? 1 : 0,
      );

      // Free tier. A blob without these predates metering: an existing user
      // starts counting today, with today's half-done day still free.
      _freeUses = intMap('freeUses');
      _freeItems = listMap('freeItems');
      _freeOutSeen = _safe(
        'freeOutSeen',
        () => Set<String>.from((json['freeOutSeen'] as List?) ?? const []),
        <String>{},
      );
      _installDate = asStr(json['installDate']);
      _freeTierStart = asStr(json['freeTierStart']);
      if (_profile != null && _freeTierStart.isEmpty) {
        _freeTierStart = _today;
        if (_installDate.isEmpty) {
          final earliest = _earliestDataDate();
          _installDate = earliest.isEmpty ? _today : earliest;
        }
        meteringStartedNow = true;
      }
    }

    _raisePotentialAnchor();
    _initRoutines();
    _checkDailyReset();
    checkNewAchievements();
    _setDailyQuote();
    _checkAndGenerateChallenges();
    // Pin the day metering started, so a launch tomorrow cannot move it.
    if (meteringStartedNow) await _saveData();
    notifyListeners();
    // Premium is synced from main() once the billing SDK is up. Asking here
    // ran before Purchases.configure, so the answer was always "no" and a
    // paying user on a new install never got their subscription back.
  }

  /// Brings the stored premium flag in line with RevenueCat. Call after
  /// [PurchaseService.init]; before it the SDK answers nothing.
  Future<void> syncPremiumStatus() async {
    // On Android we don't have a valid RevenueCat key, so skip the
    // entitlement sync — the value stored in SharedPreferences is the
    // source of truth (e.g. tester bypass sets it to true and it stays).
    if (!Platform.isIOS) return;

    final info = await PurchaseService().customerInfo();
    // Unreachable — keep whatever is in SharedPreferences.
    if (info != null) applyCustomerInfo(info);
  }

  /// Upgrades on any sign of premium; downgrades only when RevenueCat says the
  /// entitlement existed and has run out. A missing entitlement proves
  /// nothing (network, sandbox, cache miss), but an expired one does — and
  /// without this a trial cancelled on day two stayed premium for good.
  void applyCustomerInfo(CustomerInfo info) {
    // A trial whose renewal was switched off will not be charged, so the
    // "your trial ends tomorrow, then it costs X" notice no longer applies.
    final e = info.entitlements.all[PurchaseService.entitlementId];
    if (e != null && e.isActive && !e.willRenew) {
      NotificationService().cancelTrialNotices();
    }
    final next = PurchaseService.hasPremium(info)
        ? true
        : PurchaseService.hasLapsed(info)
        ? false
        : _isPremium;
    if (next == _isPremium) return;
    _isPremium = next;
    _saveData();
    notifyListeners();
  }

  void _initRoutines() {
    final allRoutineMaps = [...defaultRoutines, ..._customRoutines];
    _routines = allRoutineMaps
        .where(
          (r) => _safe('routine', () {
            Routine.fromJson(r);
            return true;
          }, false),
        )
        .map((r) {
          final routine = Routine.fromJson(r);
          if (_lastRoutineDate == _today &&
              _completedRoutineIds.contains(routine.id)) {
            routine.completed = true;
          }
          return routine;
        })
        .toList();
  }

  void _checkDailyReset() {
    if (_lastRoutineDate != _today && _lastRoutineDate.isNotEmpty) {
      final lastDate = DateTime.tryParse(_lastRoutineDate);
      if (lastDate != null) {
        final diff = DateTime.now().difference(lastDate).inDays;
        if (diff > 1 && _lastAllCompletedDate != _lastRoutineDate) {
          _streak = 0;
        }
      }
      _completedRoutineIds = [];
      for (var r in _routines) {
        r.completed = false;
      }
    }
  }

  void _setDailyQuote() {
    final dayOfYear = DateTime.now()
        .difference(DateTime(DateTime.now().year, 1, 1))
        .inDays;
    _todayQuote = motivationalQuotes[dayOfYear % motivationalQuotes.length];
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = {
      'profile': _profile?.toJson(),
      'heightRecords': _heightRecords.map((e) => e.toJson()).toList(),
      'streak': _streak,
      'bestStreak': _bestStreak,
      'lastRoutineDate': _lastRoutineDate,
      'lastAllCompletedDate': _lastAllCompletedDate,
      'completedRoutineIds': _completedRoutineIds,
      'hiddenRoutineIds': _hiddenRoutineIds.toList(),
      'todayWater': _todayWater,
      'todaySleep': _todaySleep,
      'lastWaterDate': _today,
      'lastSleepDate': _today,
      'analysisCompleted': _analysisCompleted,
      'pastHeights': _pastHeights.map((k, v) => MapEntry(k.toString(), v)),
      'isPremium': _isPremium,
      'useImperial': _useImperial,
      'locale': _locale?.languageCode ?? '',
      'totalXP': _totalXP,
      'activeChallenges': _activeChallenges,
      'lastChallengeDate': _lastChallengeDate,
      'dailyChallengeProgress': _dailyChallengeProgress,
      // v5
      'progressPhotos': _progressPhotos,
      'postureAnalyses': _postureAnalyses,
      'customRoutines': _customRoutines,
      'caffeineByDate': _caffeineByDate,
      'stressByDate': _stressByDate,
      'journalByDate': _journalByDate,
      'completedProgramDays': _completedProgramDays.toList(),
      'programMoveChecks': _programMoveChecks,
      'lastProgramDayDate': _lastProgramDayDate,
      'nutritionChecks': _nutritionChecks,
      'reviewShownOnce': _reviewShownOnce,
      'lastReviewRequestDate': _lastReviewRequestDate,
      'lastReviewRequestVersion': _lastReviewRequestVersion,
      'reviewMoments': _reviewMoments.toList(),
      'seenV3Tour': _seenV3Tour,
      'lastAutoPaywallDate': _lastAutoPaywallDate,
      'announcedAchievements': _announcedAchievements.toList(),
      'reminders': _reminders.map((r) => r.toJson()).toList(),
      'routineHistory': _routineHistory,
      'journeyProgress': _journeyProgress,
      'potentialAnchor': _potentialAnchor,
      'onboardingAnswers': _onboardingAnswers,
      'sleepLog': _sleepLog,
      'waterLog': _waterLog,
      'scoreHistory': _scoreHistory,
      'freeUses': _freeUses,
      'freeItems': _freeItems,
      'freeOutSeen': _freeOutSeen.toList(),
      'installDate': _installDate,
      'freeTierStart': _freeTierStart,
    };
    // Start from what was stored, so keys this build does not write survive.
    final out = <String, dynamic>{
      ..._rawBlob,
      ...data,
      'schemaVersion': schemaVersion,
    };
    _rawBlob = out;
    await prefs.setString('glowup_app_data', jsonEncode(out));
  }

  /// Brings an older blob up to [schemaVersion]. Only ever adds: no field is
  /// renamed or removed, so a user who goes back to an older build still
  /// finds everything. Must stay idempotent.
  Future<Map<String, dynamic>> _migrate(Map<String, dynamic> json) async {
    try {
      _docsPath = (await getApplicationDocumentsDirectory()).path;
    } catch (_) {
      _docsPath = null; // tests, or a platform without the plugin
    }
    return Map<String, dynamic>.from(json);
  }

  /// The app's Documents folder for this launch. iOS may move the app's
  /// container on update or restore, so stored absolute paths go stale while
  /// the files themselves are still there.
  String? _docsPath;

  /// "progress_photos/photo_1.jpg" from an absolute path under Documents.
  static String? relFromAbsolute(String path) {
    final i = path.indexOf('/Documents/');
    return i == -1 ? null : path.substring(i + '/Documents/'.length);
  }

  /// Re-points photo records at this launch's Documents folder, keeping the
  /// relative path alongside so it survives the next container move.
  List<Map<String, dynamic>> _withLivePaths(List<Map<String, dynamic>> items) {
    final docs = _docsPath;
    if (docs == null) return items;
    for (final m in items) {
      final rel =
          m['relPath'] as String? ??
          relFromAbsolute(m['path'] as String? ?? '');
      if (rel == null) continue;
      m['relPath'] = rel;
      m['path'] = '$docs/$rel';
    }
    return items;
  }

  void setProfile(UserProfile profile) {
    final isNew = _profile == null;
    _profile = profile;
    if (isNew) {
      _heightRecords.add(
        HeightRecord(date: _today, height: profile.currentHeight),
      );
      // First time through: the onboarding just asked when this person sleeps,
      // trains and eats, so the suggested reminders are built around those
      // hours rather than a generic day. Only on a new profile — after that
      // the times are the user's to set, and an edit elsewhere must not
      // silently move reminders they have already adjusted.
      _applyProfileReminderTimes(profile);
      // A new install: metering starts today, the first day is free.
      if (_installDate.isEmpty) _installDate = _today;
      if (_freeTierStart.isEmpty) _freeTierStart = _today;
    }
    _raisePotentialAnchor();
    _saveData();
    notifyListeners();
  }

  /// Re-times the built-in reminders against the profile's daily rhythm, then
  /// reschedules whatever is enabled.
  void _applyProfileReminderTimes(UserProfile profile) {
    final suggested = remindersForProfile(
      bedtime: profile.bedtime,
      workoutTime: profile.workoutTime,
      mealTimes: profile.mealTimes,
    );
    // Custom reminders are the user's own and are left exactly as they are.
    final custom = _reminders.where((r) => r.isCustom).toList();
    _reminders = [...suggested, ...custom];
    // Putting them on the clock needs the user's language, which lives in the
    // widget tree — the onboarding schedules them the moment it finishes.
  }

  void updateProfile(UserProfile profile) {
    _profile = profile;
    _saveData();
    notifyListeners();
  }

  void addHeightRecord(HeightRecord record) {
    Haptics.success();
    _heightRecords.removeWhere((r) => r.date == record.date);
    _heightRecords.add(record);
    _heightRecords.sort((a, b) => a.date.compareTo(b.date));
    addXP(xpRewards['height_logged'] ?? 50);
    updateChallengeProgress('weekly_measure', 1);
    // The onboarding wrote the first record; this one is the user's own.
    if (_heightRecords.length >= 2) {
      noteReviewMoment(ReviewMoment.firstMeasurement);
    }
    // a measurement can unlock both counting and growth badges
    checkNewAchievements();
    _raisePotentialAnchor();
    _saveData();
    notifyListeners();
  }

  void deleteHeightRecord(String date) {
    _heightRecords.removeWhere((r) => r.date == date);
    // Adding a measurement syncs the profile's own currentHeight to it (see
    // the add-measurement sheet); deleting one has to undo that the same
    // way, or the profile is left pointing at a height that no longer has
    // a record behind it — showing stale numbers everywhere that reads
    // currentHeight instead of the height history directly.
    if (_profile != null && _heightRecords.isNotEmpty) {
      _profile = _profile!.copyWith(currentHeight: _heightRecords.last.height);
    }
    _saveData();
    notifyListeners();
  }

  void toggleRoutine(String id) {
    final routine = _routines.firstWhere((r) => r.id == id);
    routine.completed = !routine.completed;
    if (routine.completed) {
      // The last item of the day gets the bigger moment.
      final dayDone = todayRoutines.isNotEmpty &&
          todayRoutines.every((r) => r.completed);
      dayDone ? Haptics.celebrate() : Haptics.success();
    } else {
      Haptics.select();
    }

    if (routine.completed) {
      if (!_completedRoutineIds.contains(id)) _completedRoutineIds.add(id);
    } else {
      _completedRoutineIds.remove(id);
    }
    // The same move in today's program day counts there too, so "Complete
    // the day" opens whichever tab the moves were done from.
    _syncProgramMove(id, routine.completed);

    _lastRoutineDate = _today;
    _recordHistory();
    checkNewAchievements();

    // Award XP for completing a routine
    if (routine.completed) {
      addXP(xpRewards['routine_complete']!);
      // Running a routine on their own is what closes the journey's last step
      completeJourneyStep(2);
      // Track exercise routine completions for challenges
      if (routine.category == 'exercise') {
        final exerciseCount = _routines
            .where((r) => r.category == 'exercise' && r.completed)
            .length;
        updateChallengeProgress('daily_exercise_3', exerciseCount);
      }
      // Check morning stretch challenge
      if (routine.id == 'morning_stretch' && DateTime.now().hour < 9) {
        updateChallengeProgress('daily_stretch', 1);
      }
    }

    if (allRoutinesCompleted && _lastAllCompletedDate != _today) {
      if (_lastAllCompletedDate.isNotEmpty) {
        final lastDate = DateTime.tryParse(_lastAllCompletedDate);
        if (lastDate != null) {
          final yesterday = DateTime.now().subtract(const Duration(days: 1));
          if (lastDate.year == yesterday.year &&
              lastDate.month == yesterday.month &&
              lastDate.day == yesterday.day) {
            _streak++;
          } else {
            _streak = 1;
          }
        } else {
          _streak = 1;
        }
      } else {
        _streak = 1;
      }
      _lastAllCompletedDate = _today;
      if (_streak > _bestStreak) _bestStreak = _streak;

      // Award bonus XP for all routines done + streak bonus
      addXP(xpRewards['all_routines_done']!);
      addXP(xpRewards['streak_day']! * _streak);
      updateChallengeProgress('daily_all_routines', 1);
      updateChallengeProgress('weekly_streak_7', _streak);

      // Send milestone notification + cancel streak risk
      final l = lookupAppLocalizations(effectiveLocale);
      NotificationService().sendStreakNotification(_streak, l);
      NotificationService().cancelStreakRiskNotification();
    }

    // Three full days in a row is the first streak worth a rating.
    if (routine.completed &&
        allRoutinesCompleted &&
        _streak >= 3 &&
        _lastAllCompletedDate == _today) {
      noteReviewMoment(ReviewMoment.streak3);
    }

    // Schedule streak-at-risk if routines not all done yet
    if (!allRoutinesCompleted && _streak >= 2) {
      final l = lookupAppLocalizations(effectiveLocale);
      NotificationService().scheduleStreakRiskNotification(_streak, l);
    }

    _saveData();
    notifyListeners();
  }

  // ── Paywall the app opens by itself ──
  // At most once a calendar day, for a user who is not premium. Only the tap
  // on a locked feature used to open it, so most people never saw a price.
  String? _lastAutoPaywallDate;

  /// True — and the day marked as used — if the app may open the paywall on
  /// its own today.
  bool takeDailyPaywallSlot() {
    if (_isPremium || _lastAutoPaywallDate == _today) return false;
    _lastAutoPaywallDate = _today;
    _saveData();
    return true;
  }

  // ── Metered free tier ──
  // See lib/utils/free_tier.dart for the rules. Premium is never metered.

  /// Feature name -> free uses spent. Only counted features are counted.
  Map<String, int> _freeUses = {};

  /// Feature name -> the items a free use was spent on (the article read,
  /// the photo pair compared), so that one stays open afterwards.
  Map<String, List<String>> _freeItems = {};

  /// [FreeFeature.noticeKey]s whose "you've used it" sheet was shown.
  Set<String> _freeOutSeen = {};

  /// yyyy-MM-dd the app was installed: today for a new install, the
  /// earliest saved date for someone who had data before metering existed.
  String _installDate = '';

  /// yyyy-MM-dd metering started: the install day for a new install, the
  /// day of the update for everyone else, so an update never takes away a
  /// day that was already under way.
  String _freeTierStart = '';

  /// Counted features opened in this run of the app. A free use lasts for
  /// the visit it was spent on: leaving the screen and coming back in the
  /// same session does not lock it again.
  final Set<FreeFeature> _freeSession = {};

  Map<String, int> get freeUses => Map.unmodifiable(_freeUses);
  String get installDate => _installDate;
  String get freeTierStart => _freeTierStart;

  /// Whether this user is on the metered free tier.
  bool get isMetered => !_isPremium;

  /// Today is the free first day. Before onboarding there is no start yet,
  /// and the day in progress counts as the first.
  bool get isFreeDay => _freeTierStart.isEmpty || _freeTierStart == _today;

  /// Whether [f] may be used right now.
  bool canUseFree(FreeFeature f) {
    if (_isPremium) return true;
    if (f.firstDayOnly) return isFreeDay;
    return _freeSession.contains(f) || (_freeUses[f.name] ?? 0) < f.limit;
  }

  /// Free uses of [f] left: 1 or 0 for a first-day feature (today or not),
  /// the uses not spent yet for a counted one. Premium has no limit and
  /// reports -1.
  int freeLeft(FreeFeature f) {
    if (_isPremium) return -1;
    if (f.firstDayOnly) return isFreeDay ? 1 : 0;
    return max(0, f.limit - (_freeUses[f.name] ?? 0));
  }

  /// Whether this run of the app already spent [f]'s free use, so it is open
  /// until the app restarts.
  bool freeOpenThisSession(FreeFeature f) => _freeSession.contains(f);

  /// Spends one free use of [f] (on [item], if given) and returns whether
  /// the action may go ahead. Premium always may and spends nothing. A
  /// first-day feature spends nothing either; it is simply free today.
  bool consumeFree(FreeFeature f, {String? item}) {
    if (_isPremium) return true;
    if (f.firstDayOnly) return isFreeDay;
    if (item != null && isFreeItem(f, item)) return true;
    final used = _freeUses[f.name] ?? 0;
    if (used >= f.limit) return false;
    _freeUses = {..._freeUses, f.name: used + 1};
    if (item != null) {
      _freeItems = {
        ..._freeItems,
        f.name: [...?_freeItems[f.name], item],
      };
    }
    _saveData();
    notifyListeners();
    return true;
  }

  /// Opens a counted feature to look at for this run of the app: true when
  /// premium, already opened this session, or a free use was left (and is
  /// now spent). For things that are read, like the weekly report; an action
  /// such as a workout spends with [consumeFree] instead, every time.
  bool openFree(FreeFeature f) {
    if (_isPremium || _freeSession.contains(f)) return true;
    if (!consumeFree(f)) return false;
    _freeSession.add(f);
    return true;
  }

  /// Whether [item] is the one [f]'s free use was spent on.
  bool isFreeItem(FreeFeature f, String item) =>
      _freeItems[f.name]?.contains(item) ?? false;

  /// Whether [f] is usable for [item]: premium, its own free item, or a free
  /// use still left.
  bool canUseFreeFor(FreeFeature f, String item) =>
      _isPremium || isFreeItem(f, item) || canUseFree(f);

  /// Whether the "you've used your free ..." sheet for [f] was shown.
  bool freeOutNoticed(FreeFeature f) => _freeOutSeen.contains(f.noticeKey);

  void markFreeOutNoticed(FreeFeature f) {
    if (_freeOutSeen.contains(f.noticeKey)) return;
    _freeOutSeen = {..._freeOutSeen, f.noticeKey};
    _saveData();
  }

  /// The earliest date anything was saved on, or '' when there is nothing.
  String _earliestDataDate() {
    final dates = <String>[
      if (_profile != null) freeDateKey(_profile!.createdAt),
      for (final r in _heightRecords) r.date,
      ..._routineHistory.keys,
      ..._sleepLog.keys,
      ..._waterLog.keys,
      ..._journalByDate.keys,
      for (final p in _progressPhotos) p['date'] as String? ?? '',
      for (final p in _postureAnalyses) p['date'] as String? ?? '',
    ].where((d) => d.length >= 10 && DateTime.tryParse(d) != null).map(
      (d) => d.substring(0, 10),
    );
    if (dates.isEmpty) return '';
    return dates.reduce((a, b) => a.compareTo(b) <= 0 ? a : b);
  }

  /// Developer menu: back to a fresh free tier, on its first day or (with
  /// [dayTwo]) the day after it, so the locked states can be seen.
  void debugResetFreeTier({bool dayTwo = false}) {
    if (!kDevTools) return;
    _freeUses = {};
    _freeItems = {};
    _freeOutSeen = {};
    _freeSession.clear();
    _freeTierStart = freeDateKey(
      dayTwo ? DateTime.now().subtract(const Duration(days: 1)) : DateTime.now(),
    );
    _saveData();
    notifyListeners();
  }

  // ── App Review ──
  // The system rating prompt (SKStoreReviewController through in_app_review),
  // asked for right after a positive moment instead of at random. Apple caps
  // the real prompt at three a year; these limits keep the app from spending
  // those on a bad moment.

  /// At least this long between two requests.
  static const reviewMinGap = Duration(days: 30);

  /// No request this soon after the paywall was on screen.
  static const reviewPaywallQuiet = Duration(minutes: 10);

  bool _shouldRequestReview = false;

  /// Kept for older builds, which read it as "never ask again". Set again
  /// whenever a request is made.
  bool _reviewShownOnce = false;

  /// yyyy-MM-dd of the last request, null if none was ever recorded.
  String? _lastReviewRequestDate;

  /// App version the last request was made in.
  String? _lastReviewRequestVersion;

  /// [ReviewMoment] names already seen, so each one counts only the first
  /// time it happens.
  Set<String> _reviewMoments = {};

  /// True for the launch that started from an empty install.
  bool _firstSession = false;

  /// When the paywall last opened in this session.
  DateTime? _paywallShownAt;

  /// The running app's version (CFBundleShortVersionString), set from main.
  String _appVersion = '';

  bool get shouldRequestReview => _shouldRequestReview;
  String? get lastReviewRequestDate => _lastReviewRequestDate;
  String? get lastReviewRequestVersion => _lastReviewRequestVersion;
  Set<String> get reviewMoments => Set.unmodifiable(_reviewMoments);
  bool get isFirstSession => _firstSession;

  void setAppVersion(String version) => _appVersion = version;

  @visibleForTesting
  set firstSessionForTest(bool value) => _firstSession = value;

  /// The paywall calls this as it opens.
  void notePaywallShown([DateTime? at]) => _paywallShownAt = at ?? DateTime.now();

  /// The rate limits, as a pure function so they can be tested on their own.
  static bool reviewAllowed({
    required DateTime now,
    required String appVersion,
    required bool firstSession,
    String? lastRequestDate,
    String? lastRequestVersion,
    DateTime? paywallShownAt,
  }) {
    if (firstSession) return false;
    if (paywallShownAt != null &&
        now.difference(paywallShownAt) < reviewPaywallQuiet) {
      return false;
    }
    if (lastRequestVersion != null && lastRequestVersion == appVersion) {
      return false;
    }
    final last = lastRequestDate == null
        ? null
        : DateTime.tryParse(lastRequestDate);
    if (last != null && now.difference(last) < reviewMinGap) return false;
    return true;
  }

  /// Whether a request may go out right now.
  bool canRequestReview([DateTime? now]) => reviewAllowed(
    now: now ?? DateTime.now(),
    appVersion: _appVersion,
    firstSession: _firstSession,
    lastRequestDate: _lastReviewRequestDate,
    lastRequestVersion: _lastReviewRequestVersion,
    paywallShownAt: _paywallShownAt,
  );

  /// Records [moment] and, if it is the first of its kind and the limits
  /// allow, queues a review request for MainScreen to make.
  void noteReviewMoment(ReviewMoment moment, [DateTime? now]) {
    if (_reviewMoments.contains(moment.name)) return;
    _reviewMoments = {..._reviewMoments, moment.name};
    _saveData();
    if (_shouldRequestReview || !canRequestReview(now)) return;
    _shouldRequestReview = true;
    notifyListeners();
  }

  /// MainScreen takes the queued request; it re-checks the limits after its
  /// short delay and calls [markReviewRequested] if it really asks.
  void clearReviewFlag() {
    _shouldRequestReview = false;
  }

  /// The request went out: start the 30 day and per-version limits.
  void markReviewRequested([DateTime? now]) {
    final d = now ?? DateTime.now();
    _lastReviewRequestDate =
        '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
    _lastReviewRequestVersion = _appVersion;
    _reviewShownOnce = true;
    _saveData();
  }

  // ── v3 tour ──
  // The walkthrough of the v3 screens. New users get it right after
  // onboarding; people who update from 1.6.x already have a profile and skip
  // onboarding, so they get it once as a "what's new" tour.
  bool _seenV3Tour = false;
  bool get seenV3Tour => _seenV3Tour;

  /// This launch read a blob an older build wrote (1.6.x has no
  /// schemaVersion): the tour opens with its "what's new" card.
  bool _updatedThisLaunch = false;
  bool get updatedThisLaunch => _updatedThisLaunch;

  /// Has a profile, has never seen the v3 tour and is not on the first-run
  /// path (which shows the same tour itself).
  bool get shouldShowWhatsNewTour =>
      _profile != null && !_seenV3Tour && _journeyProgress != 1;

  void markV3TourSeen() {
    if (_seenV3Tour) return;
    _seenV3Tour = true;
    _saveData();
  }

  // ── Getting-started journey ────────────────────────────────────────────────
  // Number of completed steps: data collection, app tour, then daily use.
  // date -> routine ids finished that day, kept for the last 60 days so the
  // week and month views have something to count.
  Map<String, List<String>> _routineHistory = {};
  Map<String, List<String>> get routineHistory => _routineHistory;

  // Reminders the user can switch on, retime, or write themselves.
  List<Reminder> _reminders = List<Reminder>.from(kDefaultReminders);
  List<Reminder> get reminders => List.unmodifiable(_reminders);

  // Achievements already announced, so one is celebrated exactly once.
  Set<String> _announcedAchievements = {};
  List<Map<String, dynamic>> _pendingAchievementNotices = [];
  List<Map<String, dynamic>> get pendingAchievementNotices =>
      List.unmodifiable(_pendingAchievementNotices);
  void clearAchievementNotices() => _pendingAchievementNotices = [];

  int _journeyProgress = 0;
  int get journeyProgress => _journeyProgress;
  bool get journeyComplete => _journeyProgress >= 3;

  /// Marks [step] (0-based) finished. Steps only ever move forward, and a step
  /// cannot complete before the ones in front of it.
  /// Replaces one reminder and saves. The caller re-schedules, since only the
  /// UI layer holds the localisations the scheduler needs.
  void updateReminder(Reminder reminder) {
    final i = _reminders.indexWhere((r) => r.id == reminder.id);
    if (i == -1) {
      _reminders = [..._reminders, reminder];
    } else {
      _reminders = [..._reminders]..[i] = reminder;
    }
    _sortReminders();
    _saveData();
    notifyListeners();
  }

  void addReminder(Reminder reminder) {
    _reminders = [..._reminders, reminder];
    _sortReminders();
    _saveData();
    notifyListeners();
  }

  void deleteReminder(String id) {
    _reminders = _reminders.where((r) => r.id != id).toList();
    _saveData();
    notifyListeners();
  }

  void _sortReminders() {
    _reminders.sort((a, b) {
      final at = a.hour * 60 + a.minute;
      final bt = b.hour * 60 + b.minute;
      return at.compareTo(bt);
    });
  }

  void _recordHistory() {
    _routineHistory[_today] = List<String>.from(_completedRoutineIds);
    if (_routineHistory.length > 60) {
      final keys = _routineHistory.keys.toList()..sort();
      for (final k in keys.take(_routineHistory.length - 60)) {
        _routineHistory.remove(k);
      }
    }
  }

  /// How much of [date]'s plan was finished, 0-1.
  double dayCompletionRatio(DateTime date) {
    final key =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    final plan = _planIds(date);
    if (plan.isEmpty) return 0;
    final ids = key == _today
        ? _completedRoutineIds
        : (_routineHistory[key] ?? const <String>[]);
    return plan.where(ids.contains).length / plan.length;
  }

  /// Days in [key]'s week where the whole plan was finished.
  int perfectDaysInWeek([String? key]) {
    final target = key ?? weekKey();
    var count = 0;
    _routineHistory.forEach((date, ids) {
      final d = DateTime.tryParse(date);
      if (d == null || weekKey(d) != target) return;
      final plan = _planIds(d);
      if (plan.every(ids.contains)) count++;
    });
    return count;
  }

  /// Training routines finished in [key]'s week.
  int workoutsInWeek([String? key]) {
    final target = key ?? weekKey();
    final exerciseIds = _routines
        .where((r) => r.category == 'exercise')
        .map((r) => r.id)
        .toSet();
    var count = 0;
    _routineHistory.forEach((date, ids) {
      final d = DateTime.tryParse(date);
      if (d == null || weekKey(d) != target) return;
      count += ids.where(exerciseIds.contains).length;
    });
    return count;
  }

  int measurementsInWeek([String? key]) {
    final target = key ?? weekKey();
    return _heightRecords.where((r) {
      final d = DateTime.tryParse(r.date);
      return d != null && weekKey(d) == target;
    }).length;
  }

  int measurementsInMonth([String? key]) {
    final target = key ?? monthKey();
    return _heightRecords.where((r) {
      final d = DateTime.tryParse(r.date);
      return d != null && monthKey(d) == target;
    }).length;
  }

  int photosInMonth([String? key]) {
    final target = key ?? monthKey();
    return _progressPhotos.where((p) {
      final d = DateTime.tryParse(p['date'] as String? ?? '');
      return d != null && monthKey(d) == target;
    }).length;
  }

  int postureChecksInMonth([String? key]) {
    final target = key ?? monthKey();
    return _postureAnalyses.where((p) {
      final d = DateTime.tryParse(p['date'] as String? ?? '');
      return d != null && monthKey(d) == target;
    }).length;
  }

  void completeJourneyStep(int step) {
    if (step != _journeyProgress) return;
    _journeyProgress = (step + 1).clamp(0, 3);
    _saveData();
    notifyListeners();
  }

  /// Called when the app walkthrough finishes or is skipped. Closes the
  /// journey's second step and hands out the "Kararlılık" badge right away.
  ///
  /// This is meant to be the very first achievement most players ever see —
  /// [checkNewAchievements]'s passive scan silently swallows whatever is
  /// already earned the first time it ever runs for an account (so an
  /// existing user picking up new badge definitions isn't hit with a burst
  /// of notifications), and for a brand-new player that "first pass" would
  /// otherwise be this exact moment. Granting it directly here skips that
  /// guard so the badge actually pops instead of unlocking silently.
  void completeTour() {
    completeJourneyStep(1);
    const id = 'commitment';
    if (_announcedAchievements.contains(id)) return;
    _announcedAchievements = {..._announcedAchievements, id};
    final def = achievementDefinitions.firstWhere((a) => a['id'] == id);
    _pendingAchievementNotices = [..._pendingAchievementNotices, def];
    _saveData();
    notifyListeners();
  }

  void setPremium(bool value) {
    _isPremium = value;
    _saveData();
    notifyListeners();
  }

  /// The language the app is actually running in.
  ///
  /// A null [_locale] means "follow the device", which the UI does through
  /// localeResolutionCallback. Background work has no context, so it has to
  /// resolve the same way instead of defaulting to English.
  Locale get effectiveLocale {
    if (_locale != null) return _locale!;
    const supported = {'en', 'tr', 'de', 'fr', 'hi', 'pt', 'es', 'it'};
    final device = PlatformDispatcher.instance.locale.languageCode;
    return Locale(supported.contains(device) ? device : 'en');
  }

  void setLocale(Locale newLocale) {
    _locale = newLocale;
    _saveData();
    notifyListeners();
  }

  void setUseImperial(bool value) {
    _useImperial = value;
    _saveData();
    notifyListeners();
  }

  /// Height/weight are always stored in cm/kg — this is the one place that
  /// guesses a first-run display unit before the user has ever chosen one.
  /// Everywhere else in the world (Europe included) reads a height in cm.
  static bool _detectImperialDefault() {
    final country = PlatformDispatcher.instance.locale.countryCode;
    return country == 'US' || country == 'CA';
  }

  /// Short unit suffix for the current preference — "cm"/"in", used by the
  /// growth chart, stat cards and anywhere showing a bare height number.
  String get heightUnit => _useImperial ? 'in' : 'cm';

  /// Short unit suffix for weight — "kg"/"lbs".
  String get weightUnit => _useImperial ? 'lbs' : 'kg';

  /// A stored cm value, converted to the unit the user reads in. Height is
  /// always stored in cm regardless of this preference.
  double heightNumber(double cm) => _useImperial ? cm / 2.54 : cm;

  /// The inverse of [heightNumber] — a value the user typed in their own
  /// unit, converted back to the cm the app stores.
  double heightFromInput(double value) => _useImperial ? value * 2.54 : value;

  /// A stored kg value, converted to the unit the user reads in.
  double weightNumber(double kg) => _useImperial ? kg * 2.20462 : kg;

  /// The inverse of [weightNumber] — a value the user typed in their own
  /// unit, converted back to the kg the app stores.
  double weightFromInput(double value) =>
      _useImperial ? value / 2.20462 : value;

  /// A single height value, formatted for display: "175.0 cm" or "5'11\"".
  String formatHeight(double cm) {
    if (!_useImperial) return '${cm.fixedL(1)} cm';
    final totalInches = cm / 2.54;
    var feet = totalInches ~/ 12;
    var inches = (totalInches % 12).round();
    // Rounding up can hit 12 (e.g. 182cm → 5'12"), carry into next foot.
    if (inches == 12) {
      feet += 1;
      inches = 0;
    }
    return "$feet'$inches\"";
  }

  /// A height difference (can be negative), e.g. "+2.5 cm" or "+1.0 in".
  String formatHeightDelta(double deltaCm) {
    final sign = deltaCm > 0 ? '+' : '';
    if (!_useImperial) return '$sign${deltaCm.fixedL(1)} cm';
    return '$sign${(deltaCm / 2.54).fixedL(1)} in';
  }

  /// Convert kg to display string based on unit preference
  String formatWeight(double kg) {
    if (!_useImperial) return '${kg.fixedL(1)} kg';
    return '${(kg * 2.20462).fixedL(1)} lbs';
  }

  void addWater(double amount) {
    final waterGoal = this.waterGoal;
    final wasUnderGoal = _todayWater < waterGoal;
    _todayWater = double.parse(
      (_todayWater + amount).clamp(0.0, 99.0).toStringAsFixed(1),
    );
    _waterLog[_today] = _todayWater;
    _trimLog(_waterLog);
    if (wasUnderGoal && _todayWater >= waterGoal) {
      addXP(xpRewards['water_goal']!);
      updateChallengeProgress('daily_water', 1);
      // Track weekly water days via dailyChallengeProgress
      final weeklyWaterKey = 'weekly_water_days_${_today.substring(0, 7)}';
      _dailyChallengeProgress[weeklyWaterKey] =
          (_dailyChallengeProgress[weeklyWaterKey] ?? 0) + 1;
      updateChallengeProgress(
        'weekly_water_5',
        _dailyChallengeProgress[weeklyWaterKey]!,
      );
      noteReviewMoment(ReviewMoment.waterGoal);
    }
    _saveData();
    notifyListeners();
  }

  void updateSleep(double hours) {
    final wasUnderGoal = _todaySleep < 8.0;
    _todaySleep = hours;
    _sleepLog[_today] = hours;
    _trimLog(_sleepLog);
    if (wasUnderGoal && _todaySleep >= 8.0) {
      addXP(xpRewards['sleep_goal']!);
      updateChallengeProgress('daily_sleep_early', hours.round());
      // Track weekly sleep days
      final weeklySleepKey = 'weekly_sleep_days_${_today.substring(0, 7)}';
      _dailyChallengeProgress[weeklySleepKey] =
          (_dailyChallengeProgress[weeklySleepKey] ?? 0) + 1;
      updateChallengeProgress(
        'weekly_sleep_5',
        _dailyChallengeProgress[weeklySleepKey]!,
      );
    }
    _saveData();
    notifyListeners();
  }

  void savePastHeights(Map<int, double> heights) {
    _pastHeights = heights;
    _analysisCompleted = true;
    _saveData();
    notifyListeners();
  }

  void resetAnalysis() {
    _pastHeights = {};
    _analysisCompleted = false;
    _saveData();
    notifyListeners();
  }

  // ── Gamification Methods ──────────────────────────────────────────

  int _calculateLevel() {
    for (int i = levelThresholds.length - 1; i >= 0; i--) {
      if (_totalXP >= levelThresholds[i]) return i + 1;
    }
    return 1;
  }

  void addXP(int amount) {
    if (amount <= 0) return;
    _totalXP += amount;
    _saveData();
  }

  void _checkAndGenerateChallenges() {
    if (_lastChallengeDate == _today && _activeChallenges.isNotEmpty) return;

    // Generate new daily challenges (pick 3 random from daily templates)
    final dailyTemplates = challengeTemplates
        .where((c) => c['type'] == 'daily')
        .toList();
    final rng = Random();
    final shuffled = List<Map<String, dynamic>>.from(dailyTemplates)
      ..shuffle(rng);
    final pickedDaily = shuffled.take(3).toList();

    // Keep active weekly challenges that aren't completed, or generate new ones
    final existingWeekly = _activeChallenges
        .where((c) => c['type'] == 'weekly' && c['completed'] != true)
        .toList();

    if (existingWeekly.isEmpty) {
      // Pick 2 random weekly challenges
      final weeklyTemplates = challengeTemplates
          .where((c) => c['type'] == 'weekly')
          .toList();
      final shuffledWeekly = List<Map<String, dynamic>>.from(weeklyTemplates)
        ..shuffle(rng);
      final pickedWeekly = shuffledWeekly.take(2).toList();
      existingWeekly.addAll(
        pickedWeekly.map((c) => {...c, 'progress': 0, 'completed': false}),
      );
    }

    _activeChallenges = [
      ...pickedDaily.map((c) => {...c, 'progress': 0, 'completed': false}),
      ...existingWeekly,
    ];

    _lastChallengeDate = _today;
    _saveData();
  }

  void updateChallengeProgress(String challengeId, int progress) {
    for (int i = 0; i < _activeChallenges.length; i++) {
      final challenge = _activeChallenges[i];
      if (challenge['id'] == challengeId && challenge['completed'] != true) {
        _activeChallenges[i] = {...challenge, 'progress': progress};
        // Check if target reached
        final target = challenge['target'] as int;
        if (progress >= target) {
          _activeChallenges[i]['completed'] = true;
          _awardChallengeXP(challengeId);
        }
        _saveData();
        notifyListeners();
        return;
      }
    }
  }

  void _awardChallengeXP(String challengeId) {
    for (final challenge in _activeChallenges) {
      if (challenge['id'] == challengeId) {
        final reward =
            challenge['xpReward'] as int? ?? xpRewards['challenge_complete']!;
        addXP(reward);
        return;
      }
    }
  }

  // ── Reset ────────────────────────────────────────────────────────

  void resetAllData() async {
    _profile = null;
    _heightRecords = [];
    _completedRoutineIds = [];
    _lastRoutineDate = '';
    _lastAllCompletedDate = '';
    _streak = 0;
    _bestStreak = 0;
    _todayWater = 0;
    _todaySleep = 0;
    _pastHeights = {};
    _analysisCompleted = false;
    _totalXP = 0;
    _activeChallenges = [];
    _lastChallengeDate = '';
    _dailyChallengeProgress = {};
    _reviewShownOnce = false;
    // The rating limits stay: they track what Apple has already shown. So
    // does the free tier: a reset is not a second round of free uses.
    _reviewMoments = {};
    _seenV3Tour = false;
    _announcedAchievements = {};
    _pendingAchievementNotices = [];
    _routineHistory = {};
    _reminders = List<Reminder>.from(kDefaultReminders);
    _journeyProgress = 0;
    // v5 state — without these a reset leaves the old journal, tracker and
    // program history behind, which reads as a half-wiped account.
    _progressPhotos = [];
    _postureAnalyses = [];
    _customRoutines = [];
    _caffeineByDate = {};
    _stressByDate = {};
    _journalByDate = {};
    _completedProgramDays = {};
    _programMoveChecks = {};
    _lastProgramDayDate = '';
    _nutritionChecks = {};
    _hiddenRoutineIds = {};

    _potentialAnchor = null;
    _onboardingAnswers = {};
    _sleepLog = {};
    _waterLog = {};
    _scoreHistory = {};
    _rawBlob = {};
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('glowup_app_data');

    _initRoutines();
    notifyListeners();
  }

  // ── Demo data ────────────────────────────────────────────────────
  // Debug-only. Fills the account with a plausible history so store and
  // paywall screenshots have something to show instead of empty states.

  String _dateKey(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  /// Rewrites the account as if the app had been used for [days] days:
  /// height measurements, routine history, streak, program progress, XP,
  /// wellness logs and challenges. Keeps the profile and premium flag.
  /// No-op outside debug builds.
  /// Everything the app owns lives under one key, so the real data can be
  /// set aside whole and put back when the demo is switched off.
  static const _dataKey = 'glowup_app_data';
  static const _demoBackupKey = 'glowup_demo_backup';

  bool _demoDataActive = false;

  /// Whether the demo history is the one currently on screen.
  bool get demoDataActive => _demoDataActive;

  Future<void> seedDemoData({int days = 46}) async {
    if (!kDevTools) return;

    // Put the real history somewhere safe first. Guarded, so seeding twice
    // cannot overwrite the backup with demo data.
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(_demoBackupKey)) {
      final real = prefs.getString(_dataKey);
      if (real != null) await prefs.setString(_demoBackupKey, real);
    }
    _demoDataActive = true;

    final today = DateTime.now();
    final startedAt = today.subtract(Duration(days: days - 1));

    // ── Profile stays, but the join date has to fit the history ──
    if (_profile != null) {
      _profile = UserProfile.fromJson({
        ..._profile!.toJson(),
        'createdAt': startedAt.toIso8601String(),
      });
    }

    // ── Height measurements: ten readings, +1.1 cm over the window ──
    final endHeight = _profile?.currentHeight ?? 170.0;
    const cumulativeGain = [0.0, 0.1, 0.3, 0.4, 0.5, 0.6, 0.8, 0.9, 1.0, 1.1];
    _heightRecords = [
      for (var i = 0; i < cumulativeGain.length; i++)
        HeightRecord(
          date: _dateKey(
            startedAt.add(
              Duration(
                days: ((days - 1) * i / (cumulativeGain.length - 1)).round(),
              ),
            ),
          ),
          height: double.parse(
            (endHeight - cumulativeGain.last + cumulativeGain[i])
                .toStringAsFixed(1),
          ),
        ),
    ];

    // ── Routine history: mostly complete, with a few off days early on ──
    _routineHistory = {};
    for (var back = days - 1; back >= 1; back--) {
      final date = today.subtract(Duration(days: back));
      final plan = _planIds(date);
      // The last ten days run clean so the streak on screen is believable.
      final double ratio;
      if (back <= 10) {
        ratio = 1.0;
      } else if (back % 11 == 3) {
        ratio = 0.5;
      } else if (back % 7 == 5) {
        ratio = 0.75;
      } else {
        ratio = 1.0;
      }
      _routineHistory[_dateKey(date)] = plan
          .take((plan.length * ratio).round())
          .toList();
    }

    // ── 70-day discipline program: everything but today's step. Set before
    // today's plan, which follows the program day. ──
    _completedProgramDays = {for (var i = 0; i < days - 1; i++) i};

    // ── Today: one item left open, so the ring reads as in progress ──
    final todayPlan = _planIds(today);
    _completedRoutineIds = todayPlan.take(todayPlan.length - 1).toList();
    _lastRoutineDate = _dateKey(today);
    _lastAllCompletedDate = _dateKey(today.subtract(const Duration(days: 1)));

    // ── Streak: count the unbroken run of full days ending yesterday ──
    var streak = 0;
    for (var back = 1; back < days; back++) {
      final date = today.subtract(Duration(days: back));
      final plan = _planIds(date);
      final done = _routineHistory[_dateKey(date)] ?? const <String>[];
      if (plan.isNotEmpty && done.length >= plan.length) {
        streak++;
      } else {
        break;
      }
    }
    _streak = streak;
    _bestStreak = streak > 21 ? streak : 21;

    // ── Wellness logs ──
    _caffeineByDate = {};
    _stressByDate = {};
    _journalByDate = {};
    for (var back = days - 1; back >= 0; back--) {
      final key = _dateKey(today.subtract(Duration(days: back)));
      _caffeineByDate[key] = 30 + (back * 17) % 70;
      _stressByDate[key] = 1 + back % 3;
      // Note left blank on purpose: a canned sentence would be in the wrong
      // language the moment the screenshots are taken in another locale.
      _journalByDate[key] = {'mood': 3 + back % 3, 'note': '', 'date': key};
    }

    final waterGoal = this.waterGoal;
    // Water goal met, sleep just over target: both bars read as done.
    _todayWater = double.parse(waterGoal.toStringAsFixed(1));
    _todaySleep = 8.2;
    // Two weeks of logs behind today's, a little under target on some days.
    _sleepLog = {};
    _waterLog = {};
    for (var back = 13; back >= 0; back--) {
      final key = _dateKey(today.subtract(Duration(days: back)));
      _sleepLog[key] = back == 0 ? 8.2 : 7.0 + (back * 7) % 15 / 10;
      _waterLog[key] = back == 0
          ? _todayWater
          : double.parse((waterGoal * (0.7 + (back * 3) % 4 / 10)).toStringAsFixed(1));
    }

    // Breakfast and lunch ticked on the nutrition checklist, so the
    // protein and calcium rows show grams eaten rather than zero.
    _nutritionChecks = {_today: ['meal0', 'meal1']};

    // ── Level 9 of 20 — earned-looking without maxing the bar out ──
    _totalXP = 4200;

    _analysisCompleted = true;
    _journeyProgress = 3;
    _reviewShownOnce = true;
    // A demo neither replays the tour nor asks for a rating.
    _seenV3Tour = true;
    _reviewMoments = {for (final m in ReviewMoment.values) m.name};

    // Badges the history already earned are marked as seen, so seeding does
    // not fire a burst of congratulation notifications.
    _announcedAchievements = {
      for (final a in unlockedAchievements)
        if (a['earned'] == true) a['id'] as String,
    };
    _pendingAchievementNotices = [];

    // ── Challenges: fresh set for today, the first two already claimed and
    // the rest one step short, so the card shows both states at once ──
    _activeChallenges = [];
    _lastChallengeDate = '';
    _dailyChallengeProgress = {};
    _checkAndGenerateChallenges();
    _activeChallenges = [
      for (var i = 0; i < _activeChallenges.length; i++)
        if (i < 2)
          {
            ..._activeChallenges[i],
            'progress': _activeChallenges[i]['target'],
            'completed': true,
          }
        else
          {
            ..._activeChallenges[i],
            'progress': (_activeChallenges[i]['target'] as int) > 1
                ? (_activeChallenges[i]['target'] as int) - 1
                : 0,
          },
    ];

    // ── Progress photos: a before/after pair from bundled stand-ins ──
    await _seedDemoPhotos(startedAt, today);

    _initRoutines();
    await _saveData();
    notifyListeners();
  }

  /// Copies the bundled demo shots into the same folder the camera flow writes
  /// to, then registers them, so the gallery and the before/after comparison
  /// have real files to read. Leaves the list untouched if the copy fails.
  /// Puts the real history back and forgets the demo.
  ///
  /// The demo's photo files are left on disk — they are a handful of copies of
  /// a bundled asset, and the restored record no longer points at them.
  Future<void> clearDemoData() async {
    final prefs = await SharedPreferences.getInstance();
    final backup = prefs.getString(_demoBackupKey);
    if (backup == null) {
      _demoDataActive = false;
      notifyListeners();
      return;
    }
    await prefs.setString(_dataKey, backup);
    await prefs.remove(_demoBackupKey);
    _demoDataActive = false;
    await loadData();
    notifyListeners();
  }

  Future<void> _seedDemoPhotos(DateTime startedAt, DateTime today) async {
    const sources = [
      ('assets/demo/posture_before.png', 0),
      ('assets/demo/posture_after.png', 1),
    ];
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final photosDir = Directory('${appDir.path}/progress_photos');
      if (!photosDir.existsSync()) photosDir.createSync(recursive: true);

      final first = _heightRecords.isNotEmpty
          ? _heightRecords.first.height
          : (_profile?.currentHeight ?? 170.0);
      final last = _heightRecords.isNotEmpty
          ? _heightRecords.last.height
          : (_profile?.currentHeight ?? 170.0);

      final photos = <Map<String, dynamic>>[];
      for (final (asset, index) in sources) {
        final bytes = await rootBundle.load(asset);
        final file = File('${photosDir.path}/demo_$index.jpg');
        await file.writeAsBytes(
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
          flush: true,
        );
        final date = index == 0 ? startedAt : today;
        photos.add({
          'id': 'demo_$index',
          'date': _dateKey(date),
          'path': file.path,
          'height': index == 0 ? first : last,
        });
      }
      _progressPhotos = photos;
    } catch (_) {
      // Asset missing or storage unavailable — better an empty gallery than
      // rows pointing at files that are not there.
      _progressPhotos = [];
    }
  }
}
