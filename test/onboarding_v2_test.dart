import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/screens/main_screen.dart';
import 'package:boyuzatma_app/screens/onboarding_screen.dart';
import 'package:boyuzatma_app/widgets/feature_tour.dart';
import 'package:boyuzatma_app/widgets/plan_widgets.dart';
import 'package:boyuzatma_app/widgets/premium_paywall.dart';

/// The phones the onboarding has to survive on: the smallest one still sold
/// in numbers, and the largest current iPhone.
const kOnboardingSizes = <String, Size>{
  '375x667': Size(375, 667),
  '440x956': Size(440, 956),
};

/// Answers flutter_local_notifications' platform calls, so the reminders the
/// onboarding schedules at the end do not fail for want of a phone.
void mockNotificationsChannel() {
  // The test host has no plugin registrant; stand the Android side in, over
  // the mocked channel below.
  AndroidFlutterLocalNotificationsPlugin.registerWith();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
        const MethodChannel('dexterous.com/flutter/local_notifications'),
        (call) async => switch (call.method) {
          'pendingNotificationRequests' => <Object?>[],
          'getActiveNotifications' => <Object?>[],
          _ => null,
        },
      );
}

/// The app's own typeface, so line breaks are the ones a phone makes. The
/// test font draws every glyph a full em wide and would wrap, and overflow,
/// where no device does.
Future<void> loadInter() async {
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
}

Widget onboardingApp(
  AppProvider p,
  String lang, {
  ThemeData? theme,
}) => ChangeNotifierProvider.value(
  value: p,
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: theme ?? ThemeData(brightness: Brightness.dark, fontFamily: 'Inter'),
    locale: Locale(lang),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: const OnboardingScreen(),
  ),
);

/// Walks the whole first run the way a user would: taps the real answers and
/// the real buttons. [onPage] runs on arrival at each page, named after it.
///
/// [unknownParents] ('father', 'mother') are answered "I don't know", which
/// brings in the background page; [ethnicity] is the answer given there.
Future<void> walkOnboarding(
  WidgetTester t,
  AppLocalizations l, {
  Future<void> Function(String page)? onPage,
  String? triedAnswer,
  Set<String> unknownParents = const {},
  String? ethnicity,
}) async {
  Future<void> settle() async {
    for (var i = 0; i < 4; i++) {
      await t.pump(const Duration(milliseconds: 150));
    }
  }

  Future<void> tapText(String text) async {
    final f = find.text(text).last;
    await t.ensureVisible(f);
    await t.pump();
    await t.tap(f);
    await settle();
  }

  Future<void> page(String name) async {
    await settle();
    if (onPage != null) await onPage(name);
  }

  await page('intro');
  await tapText(l.letsStart);
  await page('painHook');
  await tapText(l.continueBtn);
  await page('gender');
  await tapText(l.continueBtn);
  await page('birthDate');
  await tapText(l.continueBtn);

  await page('whyTaller');
  await tapText(l.obWhyConfidence);
  await tapText(l.obWhySports);
  await tapText(l.obWhyPotential);
  await page('whyTaller_picked');
  await tapText(l.continueBtn);

  await page('triedApps');
  await tapText(triedAnswer ?? l.obTriedStopped);
  await tapText(l.continueBtn);
  await page('triedAppsAnswer');
  await t.pump(const Duration(milliseconds: 1500));
  await page('triedAppsAnswer_done');
  await tapText(l.continueBtn);

  await page('heightWeight');
  await tapText(l.continueBtn);
  await page('parents');
  for (final who in unknownParents) {
    await t.tap(find.byKey(ValueKey('parent-unknown-$who')));
    await settle();
  }
  await page('parents_answered');
  await tapText(l.continueBtn);
  // The background is asked only to estimate a parent nobody knew.
  if (unknownParents.isNotEmpty) {
    await page('ethnicity');
    await tapText(ethnicity ?? l.dontWantToAnswer);
    await tapText(l.continueBtn);
  }
  await page('footSize');
  await tapText(l.continueBtn);
  await page('pastHeights');
  await tapText(l.obSkipAll);
  await page('dreamHeight');
  await tapText(l.continueBtn);

  await page('blockers');
  await tapText(l.obBlockForget);
  await tapText(l.obBlockExercises);
  await tapText(l.obBlockMeals);
  await page('blockers_picked');
  await tapText(l.continueBtn);

  await page('workout');
  await tapText('3-5');
  await tapText(l.continueBtn);
  for (final name in [
    'sleep',
    'bedtime',
    'workoutTime',
    'meals',
    'protein',
    'calories',
  ]) {
    await page(name);
    await tapText(l.continueBtn);
  }

  await page('firstWhenTaller');
  await tapText(l.obFirstWardrobe);
  await page('firstWhenTaller_picked');
  await tapText(l.continueBtn);

  await page('builtForYou');
  await t.pump(const Duration(milliseconds: 1600));
  await page('builtForYou_done');
  await tapText(l.continueBtn);

  await page('notifications');
  await tapText(l.obNotifNotNow);

  // The analysis runs for about six seconds, then hands over to the result.
  for (var i = 0; i < 20; i++) {
    await t.pump(const Duration(milliseconds: 500));
  }
  await page('result');
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    mockNotificationsChannel();
  });

  group('onboarding v2 answers on AppProvider', () {
    test('a user from before v2 gets empty, safe defaults', () {
      final p = AppProvider();
      // What an existing install holds: the v1 answers only.
      p.setOnboardingAnswers({
        'dreamHeight': 180,
        'weeklyWorkout': '3-5',
        'sleepHours': 8.0,
        'footSize': 9.0,
      });
      expect(p.whyTaller, isEmpty);
      expect(p.mainWhyTaller, isNull);
      expect(p.triedApps, '');
      expect(p.blockers, isEmpty);
      expect(p.topBlocker, isNull);
      expect(p.firstWhenTaller, '');
      // and nothing the v1 answers drive moves
      expect(p.weeklyWorkout, '3-5');
      expect(p.dreamHeight, 180);
    });

    test('stored answers read back in the order picked', () {
      final p = AppProvider();
      p.setOnboardingAnswers({
        'whyTaller': ['sports', 'confidence'],
        'triedApps': 'still',
        'blockers': ['meals', 'forget'],
        'firstWhenTaller': 'team',
      });
      expect(p.whyTaller, ['sports', 'confidence']);
      expect(p.mainWhyTaller, 'sports');
      expect(p.triedApps, 'still');
      expect(p.blockers, ['meals', 'forget']);
      expect(p.topBlocker, 'meals');
      expect(p.firstWhenTaller, 'team');
    });

    test('anything malformed or unknown falls back instead of throwing', () {
      final p = AppProvider();
      p.setOnboardingAnswers({
        'whyTaller': 'confidence', // not a list
        'triedApps': 3, // not a string
        // JSON hands lists back as List<dynamic>, with whatever is inside
        'blockers': <dynamic>[
          'forget',
          7,
          null,
          'from-a-newer-build',
          'forget',
        ],
        'firstWhenTaller': 'fly',
      });
      expect(p.whyTaller, isEmpty);
      expect(p.triedApps, '');
      expect(p.blockers, ['forget']);
      expect(p.firstWhenTaller, '');
    });
  });

  for (final lang in ['tr', 'de']) {
    for (final size in kOnboardingSizes.entries) {
      testWidgets('onboarding runs end to end in $lang at ${size.key}', (
        t,
      ) async {
        t.view.physicalSize = size.value;
        t.view.devicePixelRatio = 1;
        addTearDown(t.view.reset);

        await loadInter();
        final errors = <FlutterErrorDetails>[];
        final previous = FlutterError.onError;
        FlutterError.onError = errors.add;
        try {
          final p = AppProvider();
          await t.pumpWidget(onboardingApp(p, lang));
          final l = lookupAppLocalizations(Locale(lang));
          final pages = <String>[];
          await walkOnboarding(
            t,
            l,
            onPage: (name) async {
              pages.add(name);
              expect(
                errors,
                isEmpty,
                reason:
                    '$lang ${size.key}: layout errors by "$name": '
                    '${errors.map((e) => e.exceptionAsString()).join('\n')}',
              );
            },
          );

          // Everything was asked and nothing hit a dead end.
          expect(pages.last, 'result');

          // The answers landed as ids, not as the words on the buttons.
          expect(p.whyTaller, ['confidence', 'sports', 'potential']);
          expect(p.triedApps, 'stopped');
          expect(p.blockers, ['forget', 'exercises', 'meals']);
          expect(p.firstWhenTaller, 'wardrobe');
          // and the v1 answers are still saved alongside them
          expect(p.weeklyWorkout, '3-5');
          expect(p.profile, isNotNull);

          // "Not now" means no reminders were switched on.
          final prefs = await SharedPreferences.getInstance();
          expect(prefs.getBool('betaller_notifications_enabled'), isNot(true));

          // Both parents were given: no background question, nothing kept.
          expect(pages, isNot(contains('ethnicity')));
          expect(p.profile!.ethnicity, '');
          expect(p.profile!.fatherHeightUnknown, isFalse);
          expect(
            find.byKey(const ValueKey('result-no-parents-note')),
            findsNothing,
          );

          // The result opens the paywall, with that result at the top of it,
          // before the app and its tour.
          final headline = l.pwPersonalTitle(p.formatHeight(p.potentialHeight));
          await t.tap(find.text(l.journeyContinue));
          for (var i = 0; i < 6; i++) {
            await t.pump(const Duration(milliseconds: 200));
          }
          expect(find.byType(PremiumPaywallScreen), findsOneWidget);
          expect(find.text(headline), findsOneWidget);
          expect(find.text(l.pwPersonalEstimate), findsOneWidget);
          expect(
            find.text(l.pwPersonalReason(l.obWhyConfidence)),
            findsOneWidget,
          );
          expect(find.byType(MainScreen), findsNothing);
          expect(
            errors,
            isEmpty,
            reason: errors.map((e) => e.exceptionAsString()).join('\n'),
          );

          // The close button is held back for three seconds, then there.
          final close = find.byIcon(CupertinoIcons.xmark);
          AnimatedOpacity closeFade() => t.widget<AnimatedOpacity>(
            find
                .ancestor(of: close, matching: find.byType(AnimatedOpacity))
                .first,
          );
          expect(closeFade().opacity, 0);
          await t.pump(const Duration(seconds: 3));
          await t.pump(const Duration(milliseconds: 500));
          expect(closeFade().opacity, 1);
          await t.tap(close);
          for (var i = 0; i < 8; i++) {
            await t.pump(const Duration(milliseconds: 200));
          }
          expect(find.byType(PremiumPaywallScreen), findsNothing);
          expect(find.byType(MainScreen), findsOneWidget);

          // Then the tour, as before; its end does not open a second
          // paywall today.
          await t.pump(const Duration(milliseconds: 1000));
          expect(find.byType(FeatureTourOverlay), findsOneWidget);
          for (var i = 0; i < 8; i++) {
            await t.pump(const Duration(milliseconds: 200));
          }
          await t.tap(find.text(l.obSkip));
          for (var i = 0; i < 10; i++) {
            await t.pump(const Duration(milliseconds: 200));
          }
          expect(find.byType(FeatureTourOverlay), findsNothing);
          expect(find.byType(PremiumPaywallScreen), findsNothing);
          expect(p.takeDailyPaywallSlot(), isFalse);
        } finally {
          FlutterError.onError = previous;
        }
        // Whatever MainScreen starts is not this test's business: drop it
        // before the next one so its timers do not leak across tests.
        await t.pumpWidget(const SizedBox());
        for (var i = 0; i < 10; i++) {
          await t.pump(const Duration(seconds: 1));
        }
      });
    }
  }

  group('"I don\'t know" for bedtime and training time', () {
    /// Selection haptics sent to the platform while [body] runs.
    Future<int> selectionClicks(Future<void> Function() body) async {
      var n = 0;
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(SystemChannels.platform, (c) async {
        if (c.method == 'HapticFeedback.vibrate' &&
            c.arguments == 'HapticFeedbackType.selectionClick') {
          n++;
        }
        return null;
      });
      try {
        await body();
      } finally {
        messenger.setMockMethodCallHandler(SystemChannels.platform, null);
      }
      return n;
    }

    testWidgets('both unknown: the suggestion is saved and flagged', (t) async {
      t.view.physicalSize = const Size(440, 956);
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.reset);
      await loadInter();
      final p = AppProvider();
      await t.pumpWidget(onboardingApp(p, 'tr'));
      final l = lookupAppLocalizations(const Locale('tr'));
      final errors = <FlutterErrorDetails>[];
      final previous = FlutterError.onError;
      FlutterError.onError = errors.add;
      // The default birth date makes the user 17: 8.5 hours of sleep before
      // a 07:00 wake-up is 22:30.
      try {
        await walkOnboarding(
          t,
          l,
          onPage: (name) async {
            if (name == 'bedtime') {
              final clicks = await selectionClicks(() async {
                await t.tap(find.text(l.obBedtimeUnknown));
                await t.pump(const Duration(milliseconds: 300));
              });
              expect(clicks, greaterThanOrEqualTo(1));
              expect(
                find.text(l.obBedtimeUnknownHint('22:30')),
                findsOneWidget,
              );
              // The wheels are dimmed and stand on the suggestion.
              final fade = t.widget<AnimatedOpacity>(
                find
                    .ancestor(
                      of: find.byType(CupertinoPicker).first,
                      matching: find.byType(AnimatedOpacity),
                    )
                    .first,
              );
              expect(fade.opacity, lessThan(1));
            }
            if (name == 'workoutTime') {
              await t.tap(find.text(l.obWorkoutTimeUnknown));
              await t.pump(const Duration(milliseconds: 300));
              expect(
                find.text(l.obWorkoutTimeUnknownHint('18:00')),
                findsOneWidget,
              );
            }
            if (name == 'notifications') {
              // Both times read as suggestions, not as the user's answers.
              expect(
                find.text(l.obNotifSleepDetailSuggested('22:30')),
                findsOneWidget,
              );
              expect(
                find.text(l.obNotifWorkoutDetailSuggested('18:00')),
                findsOneWidget,
              );
              expect(find.text('≈ 21:30'), findsOneWidget);
              expect(find.text('≈ 17:30'), findsOneWidget);
              expect(find.text(l.obNotifSubtitleSuggested), findsOneWidget);
            }
          },
        );
        expect(errors, isEmpty, reason: errors.join('\n'));
      } finally {
        FlutterError.onError = previous;
      }
      expect(p.profile!.bedtime, '22:30');
      expect(p.profile!.workoutTime, '18:00');
      expect(p.onboardingAnswers['bedtimeUnknown'], true);
      expect(p.onboardingAnswers['workoutTimeUnknown'], true);

      await t.pumpWidget(const SizedBox());
      for (var i = 0; i < 10; i++) {
        await t.pump(const Duration(seconds: 1));
      }
    });

    testWidgets('touching the dimmed wheels hands the time back to them', (
      t,
    ) async {
      t.view.physicalSize = const Size(375, 667);
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.reset);
      await loadInter();
      final p = AppProvider();
      await t.pumpWidget(onboardingApp(p, 'de'));
      final l = lookupAppLocalizations(const Locale('de'));

      Future<void> unknownThenWheels(String label) async {
        await t.tap(find.text(label));
        await t.pump(const Duration(milliseconds: 300));
        final wake = find.byKey(const ValueKey('time-wheels-wake'));
        expect(wake, findsOneWidget);
        final clicks = await selectionClicks(() async {
          await t.tap(wake);
          await t.pump(const Duration(milliseconds: 300));
        });
        expect(clicks, greaterThanOrEqualTo(1));
        expect(wake, findsNothing);
        // and the wheels turn again, later than the suggestion.
        await t.drag(find.byType(CupertinoPicker).first, const Offset(0, -100));
        for (var i = 0; i < 10; i++) {
          await t.pump(const Duration(milliseconds: 200));
        }
      }

      await walkOnboarding(
        t,
        l,
        onPage: (name) async {
          if (name == 'bedtime') await unknownThenWheels(l.obBedtimeUnknown);
          if (name == 'workoutTime') {
            await unknownThenWheels(l.obWorkoutTimeUnknown);
          }
          if (name == 'notifications') {
            expect(find.textContaining('≈'), findsNothing);
            expect(find.text(l.obNotifSubtitle), findsOneWidget);
          }
        },
      );
      expect(p.onboardingAnswers['bedtimeUnknown'], false);
      expect(p.onboardingAnswers['workoutTimeUnknown'], false);
      // The wheels moved on from the suggestions they were showing.
      expect(p.profile!.bedtime, isNot('22:30'));
      expect(p.profile!.bedtime, matches(RegExp(r'^(23|0\d):30$')));
      expect(p.profile!.workoutTime, isNot('18:00'));
      expect(p.profile!.workoutTime, matches(RegExp(r'^(19|2\d):00$')));

      await t.pumpWidget(const SizedBox());
      for (var i = 0; i < 10; i++) {
        await t.pump(const Duration(seconds: 1));
      }
    });
  });

  group('the "tried other apps" answer page', () {
    Future<void> toAnswerPage(
      WidgetTester t,
      AppLocalizations l,
      String answer,
    ) async {
      Future<void> tapText(String text) async {
        final f = find.text(text).last;
        await t.ensureVisible(f);
        await t.pump();
        await t.tap(f);
        for (var i = 0; i < 4; i++) {
          await t.pump(const Duration(milliseconds: 150));
        }
      }

      await tapText(l.letsStart);
      for (var i = 0; i < 3; i++) {
        await tapText(l.continueBtn);
      }
      await tapText(l.obWhyConfidence);
      await tapText(l.continueBtn);
      await tapText(answer);
      await tapText(l.continueBtn);
    }

    for (final lang in ['tr', 'de']) {
      for (final size in kOnboardingSizes.entries) {
        testWidgets('builds in $lang at ${size.key} with no overflow', (
          t,
        ) async {
          t.view.physicalSize = size.value;
          t.view.devicePixelRatio = 1;
          addTearDown(t.view.reset);
          await loadInter();
          final l = lookupAppLocalizations(Locale(lang));
          for (final answer in [
            (l.obTriedStopped, l.obTriedStoppedTitle),
            (l.obTriedStill, l.obTriedStillTitle),
            (l.obTriedFirst, l.obTriedFirstTitle),
          ]) {
            final errors = <FlutterErrorDetails>[];
            final previous = FlutterError.onError;
            FlutterError.onError = errors.add;
            try {
              await t.pumpWidget(const SizedBox());
              await t.pumpWidget(onboardingApp(AppProvider(), lang));
              await toAnswerPage(t, l, answer.$1);
              expect(find.text(answer.$2), findsOneWidget);
              // Three real moves with their stills, then protein and sleep.
              expect(find.byType(MoveThumb), findsNWidgets(3));
              expect(find.text(l.obTriedItem2), findsOneWidget);
              expect(find.text(l.obTriedItem3), findsOneWidget);
              expect(find.text(l.obTriedFeatStreaks), findsOneWidget);
              // The ticks land one after another, then all five are done.
              expect(find.text('5/5'), findsNothing);
              await t.pump(const Duration(milliseconds: 3000));
              expect(find.text('5/5'), findsOneWidget);
              expect(
                errors,
                isEmpty,
                reason: errors.map((e) => e.exceptionAsString()).join('\n'),
              );
            } finally {
              FlutterError.onError = previous;
            }
          }
          await t.pumpWidget(const SizedBox());
        });
      }
    }

    testWidgets('reduced motion shows the plan ticked off at once', (t) async {
      t.view.physicalSize = const Size(440, 956);
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.reset);
      t.platformDispatcher.accessibilityFeaturesTestValue =
          const FakeAccessibilityFeatures(disableAnimations: true);
      addTearDown(t.platformDispatcher.clearAccessibilityFeaturesTestValue);
      await loadInter();
      final l = lookupAppLocalizations(const Locale('tr'));
      await t.pumpWidget(onboardingApp(AppProvider(), 'tr'));
      await toAnswerPage(t, l, l.obTriedFirst);
      expect(find.text('Başlamak için iyi bir yer'), findsOneWidget);
      expect(find.text('5/5'), findsOneWidget);
      await t.pumpWidget(const SizedBox());
    });
  });
}
