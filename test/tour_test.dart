import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/screens/main_screen.dart';
import 'package:boyuzatma_app/screens/onboarding_screen.dart';
import 'package:boyuzatma_app/screens/splash_screen.dart';
import 'package:boyuzatma_app/widgets/feature_tour.dart';
import 'package:boyuzatma_app/widgets/premium_paywall.dart';
import 'package:boyuzatma_app/widgets/tour_keys.dart';

/// The real MainScreen walked through the tour, so a target that stops
/// being attached (a screen redesign, a removed tab) fails here instead of
/// being skipped silently on a phone.
Map<String, dynamic> _blob({
  int journey = 1,
  bool premium = false,
  bool legacy = false,
}) => {
  if (!legacy) 'schemaVersion': AppProvider.schemaVersion,
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
    {'date': '2026-05-01', 'height': 156.0},
    {'date': '2026-08-01', 'height': 158.0},
  ],
  'journeyProgress': journey,
  'isPremium': premium,
};

const _targets = [
  'tour.homePotential',
  'tour.planTodayHero',
  'tour.planProgramDay',
  'tour.planNutritionTargets',
  'tour.progressChart',
  'tour.analysisScore',
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Real Inter metrics: the test font is wider and overflows the cards.
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

  late Directory docs;
  setUp(() {
    docs = Directory.systemTemp.createTempSync('betaller_tour');
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (call) async => docs.path,
    );
  });
  tearDown(() {
    try {
      docs.deleteSync(recursive: true);
    } catch (_) {}
  });

  Future<AppProvider> pumpMain(
    WidgetTester t,
    Map<String, dynamic> blob,
  ) async {
    t.view.physicalSize = const Size(440, 956) * 3;
    t.view.devicePixelRatio = 3;
    t.platformDispatcher.accessibilityFeaturesTestValue =
        const FakeAccessibilityFeatures(disableAnimations: true);
    addTearDown(() {
      t.view.reset();
      t.platformDispatcher.clearAccessibilityFeaturesTestValue();
    });
    SharedPreferences.setMockInitialValues({
      'glowup_app_data': jsonEncode(blob),
    });
    final p = (await t.runAsync(() async {
      final p = AppProvider();
      await p.loadData();
      return p;
    }))!;
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
          home: const MainScreen(),
        ),
      ),
    );
    return p;
  }

  Future<void> settle(WidgetTester t, [int ms = 1200]) async {
    for (var i = 0; i < ms ~/ 100; i++) {
      await t.pump(const Duration(milliseconds: 100));
    }
  }

  FeatureTourOverlayState tour(WidgetTester t) =>
      t.state<FeatureTourOverlayState>(find.byType(FeatureTourOverlay));

  /// Steps through the whole tour with Next, checking that each step's
  /// target is really there and on screen.
  Future<void> walk(
    WidgetTester t, {
    required bool intro,
    required bool premium,
  }) async {
    final l = await AppLocalizations.delegate.load(const Locale('en'));
    final expected = [
      if (intro) null,
      for (final k in _targets)
        k == 'tour.planProgramDay' && !premium ? 'tour.planProgramHeader' : k,
    ];
    for (var i = 0; i < expected.length; i++) {
      await settle(t);
      final s = tour(t);
      expect(s.busy, isFalse, reason: 'step $i still measuring');
      expect(s.index, i, reason: 'step ${expected[i]} was skipped');
      final label = expected[i];
      if (label == null) {
        expect(find.text(l.tv3NewTitle), findsOneWidget);
      } else {
        final key = _keys[label]!;
        final box = key.currentContext?.findRenderObject() as RenderBox?;
        expect(box, isNotNull, reason: '$label is not attached');
        final rect = box!.localToGlobal(Offset.zero) & box.size;
        expect(
          rect.overlaps(Offset.zero & const Size(440, 956)),
          isTrue,
          reason: '$label is off screen: $rect',
        );
      }
      final last = i == expected.length - 1;
      final button = last
          ? l.tv3Done
          : (label == null ? l.tv3ShowMe : l.tv3Next);
      await t.tap(find.text(button));
    }
  }

  testWidgets('first run: six real targets, then the paywall', (t) async {
    final p = await pumpMain(t, _blob());
    expect(find.byType(FeatureTourOverlay), findsNothing);
    await t.pump(const Duration(milliseconds: 900));
    expect(find.byType(FeatureTourOverlay), findsOneWidget);
    await walk(t, intro: false, premium: false);
    await settle(t, 1500);
    expect(find.byType(FeatureTourOverlay), findsNothing);
    expect(find.byType(PremiumPaywallScreen), findsOneWidget);
    expect(p.seenV3Tour, isTrue);
    expect(p.journeyProgress, 2);
    await t.pumpWidget(const SizedBox());
    await t.pump(const Duration(seconds: 5));
  });

  testWidgets('skipping also leads to the paywall, once', (t) async {
    final l = await AppLocalizations.delegate.load(const Locale('en'));
    await pumpMain(t, _blob());
    await t.pump(const Duration(milliseconds: 900));
    await settle(t);
    await t.tap(find.text(l.obSkip));
    await settle(t, 1500);
    expect(find.byType(PremiumPaywallScreen), findsOneWidget);
    await t.pumpWidget(const SizedBox());
    await t.pump(const Duration(seconds: 5));
  });

  testWidgets('a premium 1.6.x user: what\'s new first, no paywall after', (
    t,
  ) async {
    final p = await pumpMain(t, _blob(journey: 3, premium: true, legacy: true));
    expect(p.shouldShowWhatsNewTour, isTrue);
    await t.pump(const Duration(milliseconds: 900));
    expect(find.byType(FeatureTourOverlay), findsOneWidget);
    await walk(t, intro: true, premium: true);
    await settle(t, 1500);
    expect(find.byType(FeatureTourOverlay), findsNothing);
    expect(find.byType(PremiumPaywallScreen), findsNothing);
    expect(p.seenV3Tour, isTrue);
    expect(p.isPremium, isTrue);
    await t.pumpWidget(const SizedBox());
    await t.pump(const Duration(seconds: 5));
  });

  testWidgets('after the onboarding paywall, the tour ends without one', (
    t,
  ) async {
    // The paywall at the end of the onboarding took today's slot.
    final p = await pumpMain(
      t,
      _blob()
        ..['lastAutoPaywallDate'] = DateTime.now().toIso8601String().substring(
          0,
          10,
        ),
    );
    await t.pump(const Duration(milliseconds: 900));
    expect(find.byType(FeatureTourOverlay), findsOneWidget);
    await walk(t, intro: false, premium: false);
    await settle(t, 1500);
    expect(find.byType(FeatureTourOverlay), findsNothing);
    expect(find.byType(PremiumPaywallScreen), findsNothing);
    expect(p.seenV3Tour, isTrue);
    expect(p.journeyProgress, 2);
    await t.pumpWidget(const SizedBox());
    await t.pump(const Duration(seconds: 5));
  });

  testWidgets('an updater with a profile goes into the app, not onboarding', (
    t,
  ) async {
    t.view.physicalSize = const Size(440, 956) * 3;
    t.view.devicePixelRatio = 3;
    addTearDown(t.view.reset);
    // A 1.6.x install: no schema version, journey never started.
    SharedPreferences.setMockInitialValues({
      'glowup_app_data': jsonEncode(_blob(journey: 0, legacy: true)),
    });
    final p = (await t.runAsync(() async {
      final p = AppProvider();
      await p.loadData();
      return p;
    }))!;
    expect(p.updatedThisLaunch, isTrue);
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
          home: const SplashScreen(),
        ),
      ),
    );
    await settle(t, 3500);
    expect(find.byType(OnboardingScreen), findsNothing);
    expect(find.byType(MainScreen), findsOneWidget);
    // and no onboarding paywall: what's new runs first, as before.
    expect(find.byType(PremiumPaywallScreen), findsNothing);
    await t.pumpWidget(const SizedBox());
    await t.pump(const Duration(seconds: 5));
  });

  testWidgets('no tour for someone who has seen it', (t) async {
    await pumpMain(t, _blob(journey: 3)..['seenV3Tour'] = true);
    await settle(t, 1500);
    expect(find.byType(FeatureTourOverlay), findsNothing);
    await t.pumpWidget(const SizedBox());
    await t.pump(const Duration(seconds: 5));
  });
}

final _keys = <String, GlobalKey>{
  'tour.homePotential': TourKeys.homePotential,
  'tour.planTodayHero': TourKeys.planTodayHero,
  'tour.planProgramDay': TourKeys.planProgramDay,
  'tour.planProgramHeader': TourKeys.planProgramHeader,
  'tour.planNutritionTargets': TourKeys.planNutritionTargets,
  'tour.progressChart': TourKeys.progressChart,
  'tour.analysisScore': TourKeys.analysisScore,
};
