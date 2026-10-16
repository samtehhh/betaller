import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/models/height_record.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';

String _day(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

/// A returning user: a profile, one onboarding measurement, saved on the
/// current schema. Loading it is not a first launch.
Map<String, dynamic> _blob({Map<String, dynamic> extra = const {}}) => {
  'schemaVersion': AppProvider.schemaVersion,
  'profile': {
    'name': 'Ece',
    'gender': 'female',
    'birthDate': '2010-04-02',
    'currentHeight': 158.0,
    'weight': 47.0,
    'fatherHeight': 180.0,
    'motherHeight': 165.0,
    'createdAt': '2026-05-01T10:00:00.000',
  },
  'heightRecords': [
    {'date': '2026-05-01', 'height': 158.0},
  ],
  'journeyProgress': 3,
  'seenV3Tour': true,
  ...extra,
};

Future<AppProvider> _load([Map<String, dynamic>? blob]) async {
  SharedPreferences.setMockInitialValues({
    'glowup_app_data': jsonEncode(blob ?? _blob()),
  });
  final p = AppProvider()..setAppVersion('1.7.0');
  await p.loadData();
  return p;
}

Future<Map<String, dynamic>> _stored() async {
  final prefs = await SharedPreferences.getInstance();
  return jsonDecode(prefs.getString('glowup_app_data')!)
      as Map<String, dynamic>;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    final docs = Directory.systemTemp.createTempSync('betaller_review');
    addTearDown(() {
      if (docs.existsSync()) docs.deleteSync(recursive: true);
    });
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (call) async => docs.path,
    );
    // Notifications fire from some of the same code paths; answer them.
    messenger.setMockMethodCallHandler(
      const MethodChannel('dexterous.com/flutter/local_notifications'),
      (call) async => null,
    );
  });

  group('rate limits', () {
    final now = DateTime(2026, 10, 16, 12);

    bool allowed({
      String version = '1.7.0',
      bool firstSession = false,
      String? lastDate,
      String? lastVersion,
      DateTime? paywall,
    }) => AppProvider.reviewAllowed(
      now: now,
      appVersion: version,
      firstSession: firstSession,
      lastRequestDate: lastDate,
      lastRequestVersion: lastVersion,
      paywallShownAt: paywall,
    );

    test('never asked before: allowed', () => expect(allowed(), isTrue));

    test('never on the first launch', () {
      expect(allowed(firstSession: true), isFalse);
    });

    test('at most once per app version', () {
      expect(allowed(lastVersion: '1.7.0', lastDate: '2026-01-01'), isFalse);
      expect(allowed(lastVersion: '1.6.3', lastDate: '2026-01-01'), isTrue);
    });

    test('at least 30 days apart, even across versions', () {
      expect(allowed(lastVersion: '1.6.3', lastDate: '2026-09-20'), isFalse);
      expect(allowed(lastVersion: '1.6.3', lastDate: '2026-09-16'), isTrue);
    });

    test('not within minutes of the paywall', () {
      expect(
        allowed(paywall: now.subtract(const Duration(minutes: 3))),
        isFalse,
      );
      expect(
        allowed(paywall: now.subtract(const Duration(minutes: 11))),
        isTrue,
      );
    });
  });

  group('moments', () {
    test('the first moment queues a request; a repeat does not', () async {
      final p = await _load();
      expect(p.shouldRequestReview, isFalse);
      p.noteReviewMoment(ReviewMoment.waterGoal);
      expect(p.shouldRequestReview, isTrue);
      p.clearReviewFlag();
      p.noteReviewMoment(ReviewMoment.waterGoal);
      expect(p.shouldRequestReview, isFalse);
      expect((await _stored())['reviewMoments'], ['waterGoal']);
    });

    test('a first launch records the moment but does not ask', () async {
      SharedPreferences.setMockInitialValues({});
      final p = AppProvider()..setAppVersion('1.7.0');
      await p.loadData();
      expect(p.isFirstSession, isTrue);
      p.noteReviewMoment(ReviewMoment.workout);
      expect(p.shouldRequestReview, isFalse);
      expect(p.reviewMoments, contains('workout'));
    });

    test('no request right after the paywall', () async {
      final p = await _load();
      p.notePaywallShown();
      p.noteReviewMoment(ReviewMoment.programDay);
      expect(p.shouldRequestReview, isFalse);
    });

    test(
      'a request made blocks the rest of this version and is stored',
      () async {
        final p = await _load();
        p.noteReviewMoment(ReviewMoment.firstMeasurement);
        expect(p.shouldRequestReview, isTrue);
        p.clearReviewFlag();
        p.markReviewRequested(DateTime(2026, 10, 16));
        await Future<void>.delayed(Duration.zero);

        final out = await _stored();
        expect(out['lastReviewRequestDate'], '2026-10-16');
        expect(out['lastReviewRequestVersion'], '1.7.0');

        p.noteReviewMoment(ReviewMoment.streak3);
        expect(p.shouldRequestReview, isFalse);

        // A later version, more than 30 days on, may ask again.
        final next = AppProvider()..setAppVersion('1.8.0');
        await next.loadData();
        expect(next.lastReviewRequestVersion, '1.7.0');
        expect(next.canRequestReview(DateTime(2026, 11, 20)), isTrue);
        expect(next.canRequestReview(DateTime(2026, 11, 1)), isFalse);
      },
    );

    test('a demo never asks', () async {
      final p = await _load();
      await p.seedDemoData();
      for (final m in ReviewMoment.values) {
        p.noteReviewMoment(m);
      }
      expect(p.shouldRequestReview, isFalse);
    });
  });

  group('triggers', () {
    test('the first height logged after onboarding', () async {
      final p = await _load();
      p.addHeightRecord(HeightRecord(date: _day(DateTime.now()), height: 159));
      expect(p.reviewMoments, contains('firstMeasurement'));
      expect(p.shouldRequestReview, isTrue);
    });

    test('the first day the water goal is reached', () async {
      final p = await _load();
      p.addWater(0.5);
      expect(p.reviewMoments, isNot(contains('waterGoal')));
      p.addWater(5);
      expect(p.reviewMoments, contains('waterGoal'));
      expect(p.shouldRequestReview, isTrue);
    });

    test('the first completed program day', () async {
      final p = await _load(_blob(extra: {'isPremium': true}));
      final day = p.weeklyPlan.programDay(0);
      for (final m in day.moves) {
        p.checkProgramMove(0, m.routineId);
      }
      expect(p.markProgramDayComplete(0), isTrue);
      expect(p.reviewMoments, contains('programDay'));
      expect(p.shouldRequestReview, isTrue);
    });

    test('a three day streak', () async {
      final yesterday = _day(DateTime.now().subtract(const Duration(days: 1)));
      final p = await _load(
        _blob(
          extra: {
            'streak': 2,
            'bestStreak': 2,
            'lastAllCompletedDate': yesterday,
            'lastRoutineDate': yesterday,
          },
        ),
      );
      final ids = p.todayRoutines.map((r) => r.id).toList();
      expect(ids, isNotEmpty);
      // toggleRoutine also schedules streak notifications, whose plugin has
      // no platform side in a unit test; those async failures are not what
      // this test is about.
      final unrelated = <Object>[];
      runZonedGuarded(() {
        for (final id in ids.take(ids.length - 1)) {
          p.toggleRoutine(id);
        }
        expect(p.reviewMoments, isNot(contains('streak3')));
        p.toggleRoutine(ids.last);
      }, (e, _) => unrelated.add(e));
      await Future<void>.delayed(const Duration(milliseconds: 10));
      expect(
        unrelated.where((e) => !e.toString().contains('_instance')),
        isEmpty,
      );
      expect(p.streak, 3);
      expect(p.reviewMoments, contains('streak3'));
      expect(p.shouldRequestReview, isTrue);
    });
  });
}
