import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_profile.dart';
import '../models/height_record.dart';
import '../models/routine.dart';
import '../utils/constants.dart';
import '../utils/height_reference.dart';
import '../services/purchase_service.dart';
import '../services/notification_service.dart';

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
  bool _useImperial = false; // false = metric (cm/kg), true = imperial (ft-in/lbs)

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

  UserProfile? get profile => _profile;
  List<HeightRecord> get heightRecords => _heightRecords;
  List<Routine> get routines => _routines.where((r) => !_hiddenRoutineIds.contains(r.id)).toList();
  List<Routine> get allRoutines => _routines;
  Set<String> get hiddenRoutineIds => _hiddenRoutineIds;

  void toggleRoutineVisibility(String id) {
    if (_hiddenRoutineIds.contains(id)) {
      _hiddenRoutineIds.remove(id);
    } else {
      _hiddenRoutineIds.add(id);
      // If hiding a completed routine, also remove its completed flag from persistence
      _completedRoutineIds.remove(id);
      final r = _routines.firstWhere((x) => x.id == id, orElse: () => Routine.fromJson(const {'id': '', 'title': '', 'description': '', 'category': '', 'duration': '', 'icon': ''}));
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
  bool get useImperial => _useImperial;

  // Gamification getters
  int get totalXP => _totalXP;
  int get level => _calculateLevel();
  String get levelTitle => levelTitles[(_calculateLevel() - 1).clamp(0, levelTitles.length - 1)];
  int get xpForCurrentLevel => levelThresholds[(_calculateLevel() - 1).clamp(0, levelThresholds.length - 1)];
  int get xpForNextLevel => _calculateLevel() < levelThresholds.length
      ? levelThresholds[_calculateLevel()]
      : levelThresholds.last;
  double get levelProgress {
    final currentLevelXP = xpForCurrentLevel;
    final nextLevelXP = xpForNextLevel;
    if (nextLevelXP == currentLevelXP) return 1.0;
    return ((_totalXP - currentLevelXP) / (nextLevelXP - currentLevelXP)).clamp(0.0, 1.0);
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
    _progressPhotos.sort((a, b) => (a['date'] as String).compareTo(b['date'] as String));
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
    _postureAnalyses.sort((a, b) => (a['date'] as String).compareTo(b['date'] as String));
    addXP(20);
    _maybeRequestReview();
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

  // ── Program Day Progression ──
  void markProgramDayComplete(int day) {
    if (_completedProgramDays.contains(day)) return;
    _completedProgramDays = {..._completedProgramDays, day};
    addXP(30);
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

  // ── Real WHO-based height percentile ──
  /// Returns the user's height percentile (0–100) vs global population
  /// using WHO 2007 growth reference data embedded in HeightReference.
  int get peerPercentile {
    final h = _profile?.currentHeight;
    final age = _profile?.age;
    final isMale = (_profile?.gender ?? 'male') == 'male';
    if (h == null || age == null) return 50;
    return HeightReference.percentile(
      heightCm: h,
      age: age,
      isMale: isMale,
    ).round();
  }

  String get _today => DateTime.now().toIso8601String().substring(0, 10);

  int get completedRoutineCount => _routines.where((r) => r.completed).length;
  double get routineProgress =>
      _routines.isEmpty ? 0 : completedRoutineCount / _routines.length;
  bool get allRoutinesCompleted =>
      _routines.isNotEmpty && completedRoutineCount == _routines.length;

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
      }
      unlocked.add({...a, 'earned': earned});
    }
    return unlocked;
  }

  int get earnedAchievementCount =>
      unlockedAchievements.where((a) => a['earned'] == true).length;

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('glowup_app_data');

    if (data != null) {
      final json = jsonDecode(data) as Map<String, dynamic>;

      if (json['profile'] != null) {
        _profile = UserProfile.fromJson(json['profile']);
      }

      _heightRecords = (json['heightRecords'] as List? ?? [])
          .map((e) => HeightRecord.fromJson(e as Map<String, dynamic>))
          .toList();

      _streak = json['streak'] ?? 0;
      _bestStreak = json['bestStreak'] ?? 0;
      _lastRoutineDate = json['lastRoutineDate'] ?? '';
      _lastAllCompletedDate = json['lastAllCompletedDate'] ?? '';
      _completedRoutineIds = List<String>.from(
        json['completedRoutineIds'] ?? [],
      );
      _hiddenRoutineIds = Set<String>.from(json['hiddenRoutineIds'] ?? []);
      _todayWater = (json['todayWater'] ?? 0).toDouble();
      _todaySleep = (json['todaySleep'] ?? 0).toDouble();
      _analysisCompleted = json['analysisCompleted'] ?? false;
      _isPremium = json['isPremium'] ?? false;
      _useImperial = json['useImperial'] ?? false;
      if (json['pastHeights'] != null) {
        _pastHeights = (json['pastHeights'] as Map<String, dynamic>)
            .map((k, v) => MapEntry(int.parse(k), (v as num).toDouble()));
      }

      final lastWaterDate = json['lastWaterDate'] ?? '';
      final lastSleepDate = json['lastSleepDate'] ?? '';
      if (lastWaterDate != _today) _todayWater = 0;
      if (lastSleepDate != _today) _todaySleep = 0;

      final savedLocale = json['locale'] as String?;
      if (savedLocale != null && savedLocale.isNotEmpty) {
        _locale = Locale(savedLocale);
      }

      // Load gamification data
      _totalXP = json['totalXP'] ?? 0;
      _activeChallenges = (json['activeChallenges'] as List? ?? [])
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList();
      _lastChallengeDate = json['lastChallengeDate'] ?? '';
      _dailyChallengeProgress = (json['dailyChallengeProgress'] as Map<String, dynamic>? ?? {})
          .map((k, v) => MapEntry(k, (v as num).toInt()));

      // v5 features
      _progressPhotos = ((json['progressPhotos'] as List?) ?? [])
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList();
      _postureAnalyses = ((json['postureAnalyses'] as List?) ?? [])
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList();
      _customRoutines = ((json['customRoutines'] as List?) ?? [])
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList();
      _caffeineByDate = ((json['caffeineByDate'] as Map?) ?? {})
          .map((k, v) => MapEntry(k.toString(), (v as num).toInt()));
      _stressByDate = ((json['stressByDate'] as Map?) ?? {})
          .map((k, v) => MapEntry(k.toString(), (v as num).toInt()));
      _journalByDate = ((json['journalByDate'] as Map?) ?? {})
          .map((k, v) => MapEntry(k.toString(), Map<String, dynamic>.from(v as Map)));
      _completedProgramDays = Set<int>.from(
        (json['completedProgramDays'] as List? ?? []).map((e) => (e as num).toInt()),
      );
      _reviewShownOnce = json['reviewShownOnce'] ?? false;
    }

    _initRoutines();
    _checkDailyReset();
    _setDailyQuote();
    _checkAndGenerateChallenges();
    notifyListeners();

    // Sync premium status with RevenueCat entitlement
    _syncPremiumStatus();
  }

  Future<void> _syncPremiumStatus() async {
    final hasEntitlement = await PurchaseService().checkEntitlement();
    if (hasEntitlement != _isPremium) {
      _isPremium = hasEntitlement;
      _saveData();
      notifyListeners();
    }
  }

  void _initRoutines() {
    final allRoutineMaps = [...defaultRoutines, ..._customRoutines];
    _routines = allRoutineMaps.map((r) {
      final routine = Routine.fromJson(r);
      if (_lastRoutineDate == _today &&
          _completedRoutineIds.contains(routine.id)) {
        routine.completed = true;
      }
      return routine;
    }).toList();
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
      'reviewShownOnce': _reviewShownOnce,
    };
    await prefs.setString('glowup_app_data', jsonEncode(data));
  }

  void setProfile(UserProfile profile) {
    final isNew = _profile == null;
    _profile = profile;
    if (isNew) {
      _heightRecords.add(
        HeightRecord(date: _today, height: profile.currentHeight),
      );
    }
    _saveData();
    notifyListeners();
  }

  void updateProfile(UserProfile profile) {
    _profile = profile;
    _saveData();
    notifyListeners();
  }

  void addHeightRecord(HeightRecord record) {
    _heightRecords.removeWhere((r) => r.date == record.date);
    _heightRecords.add(record);
    _heightRecords.sort((a, b) => a.date.compareTo(b.date));
    addXP(xpRewards['height_logged']!);
    updateChallengeProgress('weekly_measure', 1);
    _maybeRequestReview();
    _saveData();
    notifyListeners();
  }

  void deleteHeightRecord(String date) {
    _heightRecords.removeWhere((r) => r.date == date);
    _saveData();
    notifyListeners();
  }

  void toggleRoutine(String id) {
    final routine = _routines.firstWhere((r) => r.id == id);
    routine.completed = !routine.completed;

    if (routine.completed) {
      if (!_completedRoutineIds.contains(id)) _completedRoutineIds.add(id);
    } else {
      _completedRoutineIds.remove(id);
    }

    _lastRoutineDate = _today;

    // Award XP for completing a routine
    if (routine.completed) {
      addXP(xpRewards['routine_complete']!);
      // Track exercise routine completions for challenges
      if (routine.category == 'exercise') {
        final exerciseCount = _routines.where((r) => r.category == 'exercise' && r.completed).length;
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
      NotificationService().sendStreakNotification(_streak);
      NotificationService().cancelStreakRiskNotification();
    }

    // Trigger review at key milestones
    if (_streak == 3 || _streak == 7 || _streak == 14 || _streak == 30) {
      _maybeRequestReview();
    }

    // Schedule streak-at-risk if routines not all done yet
    if (!allRoutinesCompleted && _streak >= 2) {
      NotificationService().scheduleStreakRiskNotification(_streak);
    }

    _saveData();
    notifyListeners();
  }

  // ── App Review ──
  bool _shouldRequestReview = false;
  bool _reviewShownOnce = false; // persisted — never show again after first time

  bool get shouldRequestReview => _shouldRequestReview;

  /// Triggers the review dialog — no-op if already shown once this install
  /// or if another trigger already queued it this session.
  void _maybeRequestReview() {
    if (_reviewShownOnce) return;
    if (_shouldRequestReview) return;
    _shouldRequestReview = true;
    notifyListeners();
  }

  /// Called by MainScreen after showing the dialog.
  /// Marks as shown-once so it never fires again.
  void clearReviewFlag() {
    _shouldRequestReview = false;
    _reviewShownOnce = true;
    _saveData();
  }

  void setPremium(bool value) {
    _isPremium = value;
    _saveData();
    notifyListeners();
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

  /// Convert cm to display string based on unit preference
  String formatHeight(double cm) {
    if (!_useImperial) return '${cm.toStringAsFixed(1)} cm';
    final totalInches = cm / 2.54;
    final feet = totalInches ~/ 12;
    final inches = (totalInches % 12).round();
    return '$feet\'$inches"';
  }

  /// Convert kg to display string based on unit preference
  String formatWeight(double kg) {
    if (!_useImperial) return '${kg.toStringAsFixed(1)} kg';
    return '${(kg * 2.20462).toStringAsFixed(1)} lbs';
  }

  void addWater(double amount) {
    final wasUnderGoal = _todayWater < 2.5;
    _todayWater = double.parse((_todayWater + amount).toStringAsFixed(1));
    if (wasUnderGoal && _todayWater >= 2.5) {
      addXP(xpRewards['water_goal']!);
      updateChallengeProgress('daily_water', 1);
      // Track weekly water days via dailyChallengeProgress
      final weeklyWaterKey = 'weekly_water_days_${_today.substring(0, 7)}';
      _dailyChallengeProgress[weeklyWaterKey] = (_dailyChallengeProgress[weeklyWaterKey] ?? 0) + 1;
      updateChallengeProgress('weekly_water_5', _dailyChallengeProgress[weeklyWaterKey]!);
    }
    _saveData();
    notifyListeners();
  }

  void updateSleep(double hours) {
    final wasUnderGoal = _todaySleep < 8.0;
    _todaySleep = hours;
    if (wasUnderGoal && _todaySleep >= 8.0) {
      addXP(xpRewards['sleep_goal']!);
      updateChallengeProgress('daily_sleep_early', hours.round());
      // Track weekly sleep days
      final weeklySleepKey = 'weekly_sleep_days_${_today.substring(0, 7)}';
      _dailyChallengeProgress[weeklySleepKey] = (_dailyChallengeProgress[weeklySleepKey] ?? 0) + 1;
      updateChallengeProgress('weekly_sleep_5', _dailyChallengeProgress[weeklySleepKey]!);
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
    if (_lastChallengeDate == _today) return;

    // Generate new daily challenges (pick 3 random from daily templates)
    final dailyTemplates = challengeTemplates
        .where((c) => c['type'] == 'daily')
        .toList();
    final rng = Random();
    final shuffled = List<Map<String, dynamic>>.from(dailyTemplates)..shuffle(rng);
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
      final shuffledWeekly = List<Map<String, dynamic>>.from(weeklyTemplates)..shuffle(rng);
      final pickedWeekly = shuffledWeekly.take(2).toList();
      existingWeekly.addAll(pickedWeekly.map((c) => {
        ...c,
        'progress': 0,
        'completed': false,
      }));
    }

    _activeChallenges = [
      ...pickedDaily.map((c) => {
        ...c,
        'progress': 0,
        'completed': false,
      }),
      ...existingWeekly,
    ];

    _lastChallengeDate = _today;
    _saveData();
  }

  void updateChallengeProgress(String challengeId, int progress) {
    for (int i = 0; i < _activeChallenges.length; i++) {
      final challenge = _activeChallenges[i];
      if (challenge['id'] == challengeId && challenge['completed'] != true) {
        _activeChallenges[i] = {
          ...challenge,
          'progress': progress,
        };
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
        final reward = challenge['xpReward'] as int? ?? xpRewards['challenge_complete']!;
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

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('glowup_app_data');

    _initRoutines();
    notifyListeners();
  }
}
