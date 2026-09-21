import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/widgets/paywall_previews.dart';
import 'package:boyuzatma_app/widgets/premium_paywall.dart';

/// Logical sizes of the phones the app actually has to survive on.
const _devices = <String, Size>{
  'iPhone SE 1st gen / 5s': Size(320, 568),
  'iPhone SE 2020 / 8': Size(375, 667),
  'iPhone 11': Size(414, 896),
  'iPhone 15': Size(393, 852),
  'Samsung A06': Size(360, 800),
};

/// The longest UI languages, where the copy wraps onto extra lines.
const _locales = ['tr', 'en', 'de', 'fr'];

/// Every language the paywall ships in. The preview screens are laid out in a
/// fixed design box, so the device makes no difference to them — the language
/// is the only thing that can burst one.
const _allLocales = ['tr', 'en', 'de', 'fr', 'es', 'it', 'pt', 'hi'];

Widget _app({required String lang, required Widget home}) =>
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MaterialApp(
        locale: Locale(lang),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: home,
      ),
    );

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  // ── The paywall as a whole ────────────────────────────────────────────────
  for (final entry in _devices.entries) {
    for (final lang in _locales) {
      testWidgets('paywall fits ${entry.key} in $lang', (tester) async {
        await tester.binding.setSurfaceSize(entry.value);
        addTearDown(() => tester.binding.setSurfaceSize(null));
        tester.view.physicalSize = entry.value;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          _app(lang: lang, home: const PremiumPaywallScreen()),
        );
        await tester.pump(const Duration(milliseconds: 600));

        // Walk the whole tour rather than judging it by its first slide: the
        // carousel advances on its own, and a screen that only overflows on
        // slide five is still a screen that overflows.
        for (var i = 0; i < kPaywallPreviews.length; i++) {
          await tester.pump(const Duration(milliseconds: 2800));
          await tester.pump(const Duration(milliseconds: 700));
          expect(
            tester.takeException(),
            isNull,
            reason:
                '${entry.key} @ ${entry.value.width}x${entry.value.height} '
                '($lang) overflows on slide $i',
          );
        }
      });
    }
  }

  // ── Each preview screen on its own ────────────────────────────────────────
  //
  // Rendered at the size it is authored for, so an overflow here is a real one
  // and not an artefact of the mockup scaling it down.
  for (final preview in kPaywallPreviews) {
    for (final lang in _allLocales) {
      testWidgets('preview "${preview.id}" fits its design box in $lang', (
        tester,
      ) async {
        const design = kPreviewDesignSize;
        await tester.binding.setSurfaceSize(design);
        addTearDown(() => tester.binding.setSurfaceSize(null));

        await tester.pumpWidget(
          _app(
            lang: lang,
            home: Builder(
              builder: (context) => SizedBox(
                width: design.width,
                height: design.height,
                child: preview.screen(AppLocalizations.of(context)!),
              ),
            ),
          ),
        );
        await tester.pump(const Duration(milliseconds: 400));

        expect(
          tester.takeException(),
          isNull,
          reason: 'preview "${preview.id}" overflows in $lang',
        );
      });
    }
  }
}
