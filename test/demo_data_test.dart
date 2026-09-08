import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/models/user_profile.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/utils/daily_plan.dart';

String _key(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppProvider provider;
  late Directory docsDir;

  setUp(() async {
    // path_provider has no implementation under `flutter test`, so stand in
    // for it with a real temp directory and let the photo copy actually run.
    docsDir = Directory.systemTemp.createTempSync('betaller_demo_docs');
    addTearDown(() {
      if (docsDir.existsSync()) docsDir.deleteSync(recursive: true);
    });
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (call) async => call.method == 'getApplicationDocumentsDirectory'
          ? docsDir.path
          : null,
    );

    SharedPreferences.setMockInitialValues({});
    provider = AppProvider();
    provider.setProfile(
      UserProfile(
        name: 'User',
        gender: 'male',
        birthDate: '2008-01-01',
        currentHeight: 170,
        weight: 65,
        fatherHeight: 175,
        motherHeight: 162,
        createdAt: DateTime.now(),
      ),
    );
    await provider.seedDemoData();
  });

  test('fills a 46 day history', () {
    expect(provider.routineHistory.length, 45);
    expect(provider.completedProgramDays.length, 45);
    expect(provider.journalByDate.length, 46);
    expect(provider.caffeineByDate.length, 46);
    expect(provider.stressByDate.length, 46);
  });

  test('height chart has enough points and rises', () {
    final records = provider.heightRecords;
    expect(records.length, 10);
    expect(records.first.height, lessThan(records.last.height));
    expect(records.last.height, 170.0);
    expect(provider.totalGrowth, 1.1);
    // Sorted oldest first, so the chart draws left to right.
    for (var i = 1; i < records.length; i++) {
      expect(records[i - 1].date.compareTo(records[i].date), lessThan(0));
    }
  });

  test('streak is real — it matches the seeded history', () {
    expect(provider.streak, greaterThanOrEqualTo(10));
    expect(provider.bestStreak, greaterThanOrEqualTo(provider.streak));

    final today = DateTime.now();
    for (var back = 1; back <= provider.streak; back++) {
      final date = today.subtract(Duration(days: back));
      final done = provider.routineHistory[_key(date)] ?? const <String>[];
      expect(done.length, dailyPlanIds(date).length, reason: 'day -$back');
    }
  });

  test('today is in progress, not finished', () {
    expect(provider.completedRoutineCount, provider.todayRoutineTotal - 1);
    expect(provider.allRoutinesCompleted, isFalse);
    expect(provider.routineProgress, greaterThan(0.5));
  });

  test('level and badges look earned', () {
    expect(provider.level, 9);
    expect(provider.earnedAchievementCount, greaterThan(4));
    // Seeding must not queue a burst of congratulation popups.
    expect(provider.pendingAchievementNotices, isEmpty);
  });

  test('challenges show both a claimed and an in-progress state', () {
    final challenges = provider.activeChallenges;
    expect(challenges.length, greaterThan(2));

    final done = challenges.where((c) => c['completed'] == true).toList();
    expect(done.length, 2);
    for (final c in done) {
      expect(c['progress'], c['target']);
    }
    for (final c in challenges.where((c) => c['completed'] != true)) {
      expect(c['progress'], lessThan(c['target'] as int));
    }
  });

  test('progress photos are written to disk, oldest first', () {
    final photos = provider.progressPhotos;
    expect(photos.length, 2);

    for (final p in photos) {
      final file = File(p['path'] as String);
      expect(file.existsSync(), isTrue, reason: p['path'] as String);
      expect(file.lengthSync(), greaterThan(0));
      expect(p['height'], isA<double>());
    }
    // The pair has to read as before → after for the comparison view.
    expect(
      (photos.first['date'] as String).compareTo(photos.last['date'] as String),
      lessThan(0),
    );
    expect(photos.first['height'], lessThan(photos.last['height'] as double));
  });

  test('water goal is met so the ring is not stuck short', () {
    expect(provider.todayWater, greaterThan(0));
    expect(provider.todaySleep, greaterThanOrEqualTo(8.0));
  });

  test('survives a save and reload', () async {
    final reloaded = AppProvider();
    await reloaded.loadData();
    expect(reloaded.heightRecords.length, 10);
    expect(reloaded.completedProgramDays.length, 45);
    expect(reloaded.streak, provider.streak);
    expect(reloaded.totalXP, provider.totalXP);
  });

  test('reset clears the seeded v5 state too', () async {
    provider.resetAllData();
    await Future<void>.delayed(Duration.zero);
    expect(provider.completedProgramDays, isEmpty);
    expect(provider.journalByDate, isEmpty);
    expect(provider.caffeineByDate, isEmpty);
    expect(provider.stressByDate, isEmpty);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('glowup_app_data'), anyOf(isNull, isNot(contains('"mood"'))));
    // Keeps the JSON import used above meaningful if the key survives.
    final raw = prefs.getString('glowup_app_data');
    if (raw != null) {
      expect((jsonDecode(raw) as Map)['completedProgramDays'], isEmpty);
    }
  });
}
