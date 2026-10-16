// Every paywall preview builds in languages whose decimal mark is a comma.
//
// The app formats display numbers with the app language
// (lib/utils/num_format.dart). A value formatted that way and then parsed
// back with double.parse throws on "1,7"; a release build shows that as a
// grey box. English alone never catches it, so this test runs the previews
// under tr and de with Intl.defaultLocale set the way MaterialApp's builder
// sets it in the app.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show Intl;

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/widgets/paywall_previews.dart';

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
        await t.pumpWidget(MaterialApp(
          locale: Locale(lang),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(builder: (c) {
            final l = AppLocalizations.of(c)!;
            return Scaffold(body: preview.screen(l));
          }),
        ));
        await t.pump(const Duration(seconds: 2));
        expect(t.takeException(), isNull);
      });
    }
  }
}
