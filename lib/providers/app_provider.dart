import 'dart:convert';

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

  UserProfile? get profile => _profile;
  List<HeightRecord> get heightRecords => _heightRecords;
  List<Routine> get routines => _routines;
  int get streak => _streak;
  int get bestStreak => _bestStreak;
  double get todayWater => _todayWater;
  double get todaySleep => _todaySleep;
  String get todayQuote => _todayQuote;

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

      final lastWaterDate = json['lastWaterDate'] ?? '';
      final lastSleepDate = json['lastSleepDate'] ?? '';
      if (lastWaterDate != _today) _todayWater = 0;
      if (lastSleepDate != _today) _todaySleep = 0;
    }

    _initRoutines();
    _checkDailyReset();
    _setDailyQuote();
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
    }

    _saveData();
    notifyListeners();
  }

  void addWater(double amount) {
    _todayWater = double.parse((_todayWater + amount).toStringAsFixed(1));
    _saveData();
    notifyListeners();
  }

  void updateSleep(double hours) {
    _todaySleep = hours;
    _saveData();
    notifyListeners();
  }

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

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('glowup_app_data');

    _initRoutines();
    notifyListeners();
  }
}
