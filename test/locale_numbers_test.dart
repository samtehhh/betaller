// Every paywall preview builds in languages whose decimal mark is a comma.
//
// The app formats display numbers with the app language
// (lib/utils/num_format.dart). A value formatted that way and then parsed
// back with double.parse throws on "1,7"; a release build shows that as a
// grey box. English alone never catches it, so this test runs the previews
// under tr and de with Intl.defaultLocale set the way MaterialApp's builder
// sets it in the app.
//
// Each preview runs twice: without a provider (the demo numbers, labelled as
// an example) and with a user who has just finished onboarding (their own
// height, potential, targets and chart).
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show Intl;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/models/user_profile.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/widgets/paywall_previews.dart';

Future<AppProvider> _onboardedUser({required bool imperial}) async {
  SharedPreferences.setMockInitialValues({});
  final p = AppProvider();
  await p.loadData();
  final now = DateTime.now();
  final birth = DateTime(now.year - 15, 3, 10).toIso8601String();
  p.setUseImperial(imperial);
  p.savePastHeights({12: 147.5, 13: 153.2, 14: 158.9});
  p.setOnboardingAnswers({'weeklyWorkout': '3-5', 'dreamHeight': 181.5});
  p.setProfile(UserProfile(
    name: 'Test',
    gender: 'female',
    birthDate: birth.substring(0, 10),
    currentHeight: 163.7,
    weight: 52.4,
    fatherHeight: 180.5,
    motherHeight: 165.5,
  ));
  return p;
}

Widget _app(String lang, PaywallPreview preview) => MaterialApp(
      locale: Locale(lang),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(builder: (c) {
        final l = AppLocalizations.of(c)!;
        return Scaffold(body: preview.screen(l));
      }),
    );

void main() {
  setUpAll(() async => initializeDateFormatting());
  tearDown(() => Intl.defaultLocale = null);

  for (final lang in ['tr', 'de', 'fr', 'en']) {
    for (final preview in kPaywallPreviews) {
      testWidgets('preview ${preview.id} builds in $lang', (t) async {
        t.view.physicalSize = const Size(375, 760);
        t.view.devicePixelRatio = 1;
        addTearDown(t.view.reset);
        Intl.defaultLocale = lang;
        await t.pumpWidget(_app(lang, preview));
        await t.pump(const Duration(seconds: 2));
        expect(t.takeException(), isNull);
      });

      for (final imperial in [false, true]) {
        testWidgets(
            'preview ${preview.id} builds for an onboarded user in $lang'
            '${imperial ? ' (imperial)' : ''}', (t) async {
          t.view.physicalSize = const Size(375, 760);
          t.view.devicePixelRatio = 1;
          addTearDown(t.view.reset);
          final p = (await t.runAsync(() => _onboardedUser(imperial: imperial)))!;
          Intl.defaultLocale = lang;
          await t.pumpWidget(ChangeNotifierProvider.value(
            value: p,
            child: _app(lang, preview),
          ));
          await t.pump(const Duration(seconds: 2));
          expect(t.takeException(), isNull);
        });
      }
    }
  }

  testWidgets('the potential preview shows the user\'s own numbers', (t) async {
    final p = (await t.runAsync(() => _onboardedUser(imperial: false)))!;
    Intl.defaultLocale = 'de';
    await t.pumpWidget(ChangeNotifierProvider.value(
      value: p,
      child: _app('de', kPaywallPreviews.first),
    ));
    await t.pump();
    expect(kPaywallPreviews.first.id, 'potential');
    // The value keeps its unit with a no-break space.
    expect(find.textContaining('Du: 163,7 cm'), findsOneWidget);
    expect(find.textContaining('Beispiel'), findsNothing);
  });

  testWidgets('without a profile the potential preview says it is an example',
      (t) async {
    Intl.defaultLocale = 'en';
    await t.pumpWidget(_app('en', kPaywallPreviews.first));
    await t.pump();
    expect(find.textContaining('Example: 164.0 cm'), findsOneWidget);
  });
}
