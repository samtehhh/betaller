import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_profile.dart';
import '../models/height_record.dart';
import '../models/routine.dart';
import '../utils/constants.dart';

class AppProvider extends ChangeNotifier {
  UserProfile? _profile;
  List<HeightRecord> _heightRecords = [];
  List<Routine> _routines = [];
  List<String> _completedRoutineIds = [];
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

  // Gamification state
  int _totalXP = 0;
  List<Map<String, dynamic>> _activeChallenges = [];
  String _lastChallengeDate = '';
  Map<String, int> _dailyChallengeProgress = {};

  UserProfile? get profile => _profile;
  List<HeightRecord> get heightRecords => _heightRecords;
  List<Routine> get routines => _routines;
  int get streak => _streak;
  int get bestStreak => _bestStreak;
  double get todayWater => _todayWater;
  double get todaySleep => _todaySleep;
  Map<int, double> get pastHeights => _pastHeights;
  bool get analysisCompleted => _analysisCompleted;
  String get todayQuote => _todayQuote;
  Locale? get locale => _locale;
  bool get isPremium => _isPremium;

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
      _todayWater = (json['todayWater'] ?? 0).toDouble();
      _todaySleep = (json['todaySleep'] ?? 0).toDouble();
      _analysisCompleted = json['analysisCompleted'] ?? false;
      _isPremium = json['isPremium'] ?? false;
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
    }

    _initRoutines();
    _checkDailyReset();
    _setDailyQuote();
    _checkAndGenerateChallenges();
    notifyListeners();
  }

  void _initRoutines() {
    _routines = defaultRoutines.map((r) {
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
      'todayWater': _todayWater,
      'todaySleep': _todaySleep,
      'lastWaterDate': _today,
      'lastSleepDate': _today,
      'analysisCompleted': _analysisCompleted,
      'pastHeights': _pastHeights.map((k, v) => MapEntry(k.toString(), v)),
      'isPremium': _isPremium,
      'locale': _locale?.languageCode ?? '',
      'totalXP': _totalXP,
      'activeChallenges': _activeChallenges,
      'lastChallengeDate': _lastChallengeDate,
      'dailyChallengeProgress': _dailyChallengeProgress,
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
    }

    _saveData();
    notifyListeners();
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

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('glowup_app_data');

    _initRoutines();
    notifyListeners();
  }
}
