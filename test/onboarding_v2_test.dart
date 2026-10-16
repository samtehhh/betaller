import 'dart:io';

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
Future<void> walkOnboarding(
  WidgetTester t,
  AppLocalizations l, {
  Future<void> Function(String page)? onPage,
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
  await tapText(l.obTriedStopped);
  await tapText(l.continueBtn);
  await page('triedAppsAnswer');
  await t.pump(const Duration(milliseconds: 1500));
  await page('triedAppsAnswer_done');
  await tapText(l.continueBtn);

  await page('heightWeight');
  await tapText(l.continueBtn);
  await page('parents');
  await tapText(l.continueBtn);
  await page('ethnicity');
  await tapText(l.dontWantToAnswer);
  await tapText(l.continueBtn);
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

          // The result goes straight into the app: no paywall in between.
          await t.tap(find.text(l.journeyContinue));
          for (var i = 0; i < 6; i++) {
            await t.pump(const Duration(milliseconds: 200));
          }
          expect(find.byType(PremiumPaywallScreen), findsNothing);
          expect(find.byType(MainScreen), findsOneWidget);
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
}
