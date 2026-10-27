import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/models/user_profile.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/screens/routines_screen.dart';
import 'package:boyuzatma_app/screens/workout_player_screen.dart';
import 'package:boyuzatma_app/utils/daily_plan.dart';
import 'package:boyuzatma_app/utils/free_tier.dart';
import 'package:boyuzatma_app/widgets/free_tier_widgets.dart';
import 'package:boyuzatma_app/widgets/premium_paywall.dart';
import 'package:boyuzatma_app/widgets/water_sheet.dart';

String _key(DateTime d) => freeDateKey(d);
final _today = _key(DateTime.now());
final _yesterday = _key(DateTime.now().subtract(const Duration(days: 1)));

/// A user who onboarded in May. [extra] lands on top, so a test can say
/// which build wrote the blob (with or without the free tier fields).
Map<String, dynamic> _blob([Map<String, dynamic> extra = const {}]) => {
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
    {'date': '2026-04-28', 'height': 156.0},
    {'date': '2026-08-01', 'height': 158.0},
  ],
  'journeyProgress': 3,
  'seenV3Tour': true,
  'isPremium': false,
  ...extra,
};

Future<AppProvider> _load(Map<String, dynamic> blob) async {
  SharedPreferences.setMockInitialValues({'glowup_app_data': jsonEncode(blob)});
  final p = AppProvider();
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

  late Directory docs;
  setUp(() {
    // These tests cover the metered rules, which ship switched off.
    FreeTier.enabled = true;
    docs = Directory.systemTemp.createTempSync('betaller_free');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (call) async => docs.path,
        );
  });
  tearDown(() {
    FreeTier.enabled = false;
    try {
      docs.deleteSync(recursive: true);
    } catch (_) {}
  });

  group('allowance off (shipped)', () {
    test('a free user gets nothing free, a premium user everything', () async {
      FreeTier.enabled = false;
      final p = await _load(_blob({'freeTierStart': _today}));
      for (final f in FreeFeature.values) {
        expect(p.canUseFree(f), isFalse, reason: f.name);
        expect(p.freeLeft(f), 0, reason: f.name);
        expect(p.consumeFree(f), isFalse, reason: f.name);
        expect(p.openFree(f), isFalse, reason: f.name);
      }
      expect(p.freeUses, isEmpty);

      final pro = await _load(_blob({'isPremium': true}));
      for (final f in FreeFeature.values) {
        expect(pro.canUseFree(f), isTrue, reason: f.name);
      }
    });

    test('an item opened under the old allowance locks again', () async {
      FreeTier.enabled = false;
      final p = await _load(
        _blob({
          'freeUses': {'article': 1},
          'freeItems': {
            'article': ['a1'],
          },
        }),
      );
      expect(p.isFreeItem(FreeFeature.article, 'a1'), isFalse);
      expect(p.canUseFreeFor(FreeFeature.article, 'a1'), isFalse);
    });
  });

  group('quota', () {
    test('a counted feature is free once, then stops', () async {
      final p = await _load(_blob({'freeTierStart': _today}));
      expect(p.isMetered, isTrue);
      expect(p.canUseFree(FreeFeature.posture), isTrue);
      expect(p.freeLeft(FreeFeature.posture), 1);

      expect(p.consumeFree(FreeFeature.posture), isTrue);
      expect(p.freeLeft(FreeFeature.posture), 0);
      expect(p.canUseFree(FreeFeature.posture), isFalse);
      expect(p.consumeFree(FreeFeature.posture), isFalse);
      // Each feature has its own allowance.
      expect(p.canUseFree(FreeFeature.workout), isTrue);

      // Stored, and still spent after a relaunch.
      await Future<void>.delayed(Duration.zero);
      expect((await _stored())['freeUses'], {'posture': 1});
      final again = AppProvider();
      await again.loadData();
      expect(again.canUseFree(FreeFeature.posture), isFalse);
      expect(again.canUseFree(FreeFeature.workout), isTrue);
    });

    test('a free item stays open after its use is spent', () async {
      final p = await _load(_blob({'freeTierStart': _today}));
      expect(p.consumeFree(FreeFeature.article, item: 'a1'), isTrue);
      expect(p.consumeFree(FreeFeature.article, item: 'a1'), isTrue);
      expect(p.canUseFreeFor(FreeFeature.article, 'a1'), isTrue);
      expect(p.consumeFree(FreeFeature.article, item: 'a2'), isFalse);
      expect(p.canUseFreeFor(FreeFeature.article, 'a2'), isFalse);
    });

    test('opening a report keeps it open for the session only', () async {
      final p = await _load(_blob({'freeTierStart': _today}));
      expect(p.openFree(FreeFeature.weeklyReport), isTrue);
      expect(p.openFree(FreeFeature.weeklyReport), isTrue);
      expect(p.canUseFree(FreeFeature.weeklyReport), isTrue);
      final nextLaunch = AppProvider();
      await nextLaunch.loadData();
      expect(nextLaunch.canUseFree(FreeFeature.weeklyReport), isFalse);
      expect(nextLaunch.openFree(FreeFeature.weeklyReport), isFalse);
    });

    test('a finished workout is not a session pass for more', () async {
      final p = await _load(_blob({'freeTierStart': _today}));
      expect(p.consumeFree(FreeFeature.workout), isTrue);
      expect(p.canUseFree(FreeFeature.workout), isFalse);
    });

    test('premium is never metered', () async {
      final p = await _load(
        _blob({
          'isPremium': true,
          'freeTierStart': _yesterday,
          'freeUses': {for (final f in FreeFeature.values) f.name: 9},
        }),
      );
      for (final f in FreeFeature.values) {
        expect(p.canUseFree(f), isTrue, reason: f.name);
        expect(p.consumeFree(f), isTrue, reason: f.name);
        expect(p.freeLeft(f), -1, reason: f.name);
      }
      expect(p.freeUses, {for (final f in FreeFeature.values) f.name: 9});
      // Toggling premium off (the developer switch) brings the meter back.
      p.setPremium(false);
      expect(p.canUseFree(FreeFeature.water), isFalse);
      expect(p.canUseFree(FreeFeature.posture), isFalse);
    });
  });

  group('first day', () {
    test('the daily loop is free on the first day, Pro after it', () async {
      final day1 = await _load(_blob({'freeTierStart': _today}));
      for (final f in FreeFeature.values.where((f) => f.firstDayOnly)) {
        expect(day1.canUseFree(f), isTrue, reason: f.name);
        expect(day1.freeLeft(f), 1, reason: f.name);
      }
      final day2 = await _load(_blob({'freeTierStart': _yesterday}));
      for (final f in FreeFeature.values.where((f) => f.firstDayOnly)) {
        expect(day2.canUseFree(f), isFalse, reason: f.name);
        expect(day2.consumeFree(f), isFalse, reason: f.name);
      }
      // The counted ones do not run out with the day.
      expect(day2.canUseFree(FreeFeature.workout), isTrue);
    });

    test('a new install starts metering when the profile is made', () async {
      SharedPreferences.setMockInitialValues({});
      final p = AppProvider();
      await p.loadData();
      expect(p.freeTierStart, '');
      expect(p.canUseFree(FreeFeature.planTicks), isTrue);
      p.setProfile(
        UserProfile(
          name: 'New',
          gender: 'male',
          birthDate: '2009-01-01',
          currentHeight: 165,
          weight: 55,
          fatherHeight: 175,
          motherHeight: 162,
        ),
      );
      expect(p.freeTierStart, _today);
      expect(p.installDate, _today);
      expect(p.canUseFree(FreeFeature.water), isTrue);
    });
  });

  group('existing users updating', () {
    test('keep today, start counting from the update', () async {
      final plan = dailyPlanIds(DateTime.now(), '');
      final half = plan.take(plan.length ~/ 2).toList();
      final p = await _load(
        _blob({
          // A build before metering: none of the free tier fields.
          'lastRoutineDate': _today,
          'completedRoutineIds': half,
          'todayWater': 1.2,
          'lastWaterDate': _today,
        }),
      );
      // Today's half-done day is still there and still theirs to finish.
      expect(p.completedRoutineCount, half.length);
      expect(p.todayWater, 1.2);
      expect(p.freeTierStart, _today);
      expect(p.canUseFree(FreeFeature.planTicks), isTrue);
      expect(p.canUseFree(FreeFeature.water), isTrue);
      // Every counted feature has its free use, from the update on.
      for (final f in FreeFeature.values.where((f) => !f.firstDayOnly)) {
        expect(p.freeLeft(f), 1, reason: f.name);
      }
      // Installed back when their first data was saved.
      expect(p.installDate, '2026-04-28');

      // The start is stored right away, so tomorrow it has really passed.
      final stored = await _stored();
      expect(stored['freeTierStart'], _today);
      expect(stored['installDate'], '2026-04-28');
      expect(stored['completedRoutineIds'], half);

      final tomorrow = await _load({...stored, 'freeTierStart': _yesterday});
      expect(tomorrow.canUseFree(FreeFeature.planTicks), isFalse);
      expect(tomorrow.installDate, '2026-04-28');
    });

    test('someone who never finished onboarding is not started', () async {
      final p = await _load({'schemaVersion': AppProvider.schemaVersion});
      expect(p.profile, isNull);
      expect(p.freeTierStart, '');
    });
  });

  group('screens', () {
    setUpAll(() async {
      final loader = FontLoader('Inter');
      for (final w in [
        'Regular',
        'Medium',
        'SemiBold',
        'Bold',
        'ExtraBold',
        'Black',
      ]) {
        final bytes = File('assets/fonts/Inter-$w.ttf').readAsBytesSync();
        loader.addFont(Future.value(ByteData.view(bytes.buffer)));
      }
      await loader.load();
    });

    Future<AppProvider> pump(
      WidgetTester t,
      Map<String, dynamic> blob,
      Widget home,
    ) async {
      t.view.physicalSize = const Size(440, 956) * 3;
      t.view.devicePixelRatio = 3;
      t.platformDispatcher.accessibilityFeaturesTestValue =
          const FakeAccessibilityFeatures(disableAnimations: true);
      addTearDown(() {
        t.view.reset();
        t.platformDispatcher.clearAccessibilityFeaturesTestValue();
      });
      final p = (await t.runAsync(() => _load(blob)))!;
      await t.pumpWidget(
        ChangeNotifierProvider.value(
          value: p,
          child: MaterialApp(
            theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Inter'),
            locale: const Locale('en'),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            home: home,
          ),
        ),
      );
      await t.pump(const Duration(milliseconds: 300));
      return p;
    }

    Future<void> settle(WidgetTester t, [int ms = 1200]) async {
      for (var i = 0; i < ms ~/ 100; i++) {
        await t.pump(const Duration(milliseconds: 100));
      }
    }

    Future<void> tearDownTree(WidgetTester t) async {
      await t.pumpWidget(const SizedBox());
      await t.pump(const Duration(seconds: 5));
    }

    /// The Discipline tab's day card: a program day always has moves, where
    /// today's plan can be a rest day.
    Future<void> openDiscipline(WidgetTester t) async {
      t.state<RoutinesScreenState>(find.byType(RoutinesScreen)).goToSubTab(1);
      await settle(t, 600);
    }

    Finder startButton(AppLocalizations l) => find.text(l.plStartWorkout);

    /// Brings the day card's start button to the middle of the list (the
    /// bottom 80 pt are kept free for the nav bar) and taps it.
    Future<void> tapStart(WidgetTester t, AppLocalizations l) async {
      final f = startButton(l).last;
      await Scrollable.ensureVisible(t.element(f), alignment: 0.5);
      await t.pump(const Duration(milliseconds: 100));
      await t.tap(f);
    }

    testWidgets('the first workout start opens the player, with a chip', (
      t,
    ) async {
      final l = await AppLocalizations.delegate.load(const Locale('en'));
      await pump(t, _blob({'freeTierStart': _today}), const RoutinesScreen());
      await openDiscipline(t);
      expect(find.text(l.ftOneFree), findsWidgets);
      await tapStart(t, l);
      await settle(t);
      expect(find.byType(WorkoutPlayerScreen), findsOneWidget);
      expect(find.byType(PremiumPaywallScreen), findsNothing);
      expect(find.text(l.ftPreviewTag), findsNothing);
      await tearDownTree(t);
    });

    testWidgets('the second workout start opens the paywall', (t) async {
      final l = await AppLocalizations.delegate.load(const Locale('en'));
      final p = await pump(
        t,
        _blob({
          'freeTierStart': _yesterday,
          'freeUses': {'workout': 1},
        }),
        const RoutinesScreen(),
      );
      await openDiscipline(t);
      // The moves stay readable, with their doses.
      expect(find.text(l.ftOneFree), findsNothing);
      expect(find.byType(FreeLockBanner), findsOneWidget);

      // The first time: the friendly sheet, not a sales screen.
      await tapStart(t, l);
      await settle(t);
      expect(find.byType(WorkoutPlayerScreen), findsNothing);
      expect(find.byType(FreeLimitSheet), findsOneWidget);
      expect(find.text(l.ftOutWorkoutTitle), findsOneWidget);
      expect(p.freeOutNoticed(FreeFeature.workout), isTrue);
      await t.tap(find.descendant(
        of: find.byType(FreeLimitSheet),
        matching: find.text(l.ftContinuePro),
      ));
      await settle(t);
      expect(find.byType(PremiumPaywallScreen), findsOneWidget);
      expect(find.text(l.ftWhyWorkout), findsOneWidget);
      // One paywall at a time.
      expect(
        await showPremiumPaywall(t.element(find.byType(PremiumPaywallScreen))),
        isNull,
      );
      await settle(t, 300);
      expect(find.byType(PremiumPaywallScreen), findsOneWidget);
      await tearDownTree(t);
    });

    testWidgets('after the sheet, a locked start goes straight to the '
        'paywall', (t) async {
      final l = await AppLocalizations.delegate.load(const Locale('en'));
      await pump(
        t,
        _blob({
          'freeTierStart': _yesterday,
          'freeUses': {'workout': 1},
          'freeOutSeen': ['workout'],
        }),
        const RoutinesScreen(),
      );
      await openDiscipline(t);
      await tapStart(t, l);
      await settle(t);
      expect(find.byType(FreeLimitSheet), findsNothing);
      expect(find.byType(WorkoutPlayerScreen), findsNothing);
      expect(find.byType(PremiumPaywallScreen), findsOneWidget);
      await tearDownTree(t);
    });

    testWidgets('the player itself previews one move, then offers Pro', (
      t,
    ) async {
      final l = await AppLocalizations.delegate.load(const Locale('en'));
      final p = await pump(
        t,
        _blob({
          'freeTierStart': _yesterday,
          'freeUses': {'workout': 1},
        }),
        Builder(
          builder: (context) {
            final moves = context
                .read<AppProvider>()
                .weeklyPlan
                .programDay(0)
                .moves;
            return WorkoutPlayerScreen(
              moves: moves,
              title: 'Day 1',
              onMoveDone: (_) => fail('a preview move counts nowhere'),
            );
          },
        ),
      );
      expect(find.text(l.ftPreviewTag), findsOneWidget);
      await t.tap(find.text(l.plSkipMove));
      await settle(t, 300);
      expect(find.text(l.ftPreviewTitle), findsOneWidget);
      expect(find.text(l.ftContinuePro), findsOneWidget);
      await t.tap(find.text(l.ftContinuePro));
      await settle(t);
      expect(find.byType(PremiumPaywallScreen), findsOneWidget);
      expect(p.freeUses['workout'], 1);
      await tearDownTree(t);
    });

    testWidgets('water on day 2: the add is gated, the log untouched', (
      t,
    ) async {
      final l = await AppLocalizations.delegate.load(const Locale('en'));
      final p = await pump(
        t,
        _blob({'freeTierStart': _yesterday}),
        Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: TextButton(
                onPressed: () =>
                    showWaterSheet(context, context.read<AppProvider>(), 2.5),
                child: const Text('add water'),
              ),
            ),
          ),
        ),
      );
      await t.tap(find.text('add water'));
      await settle(t, 600);
      expect(find.byType(FreeLimitSheet), findsOneWidget);
      expect(find.text(l.ftOutDayTitle), findsOneWidget);
      await t.tap(find.text(l.ftNotNow));
      await settle(t, 600);
      expect(find.byType(FreeLimitSheet), findsNothing);

      // The second tap: the paywall, saying why.
      await t.tap(find.text('add water'));
      await settle(t);
      expect(find.byType(PremiumPaywallScreen), findsOneWidget);
      expect(find.text(l.ftWhyWater), findsOneWidget);
      expect(p.todayWater, 0);
      await tearDownTree(t);
    });

    testWidgets('water on day 1 opens the sheet', (t) async {
      await pump(
        t,
        _blob({'freeTierStart': _today}),
        Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: TextButton(
                onPressed: () =>
                    showWaterSheet(context, context.read<AppProvider>(), 2.5),
                child: const Text('add water'),
              ),
            ),
          ),
        ),
      );
      await t.tap(find.text('add water'));
      await settle(t, 600);
      expect(find.byType(FreeLimitSheet), findsNothing);
      expect(find.byType(PremiumPaywallScreen), findsNothing);
      expect(find.byType(BottomSheet), findsOneWidget);
      await tearDownTree(t);
    });
  });
}
