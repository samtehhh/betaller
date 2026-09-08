import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
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

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  for (final entry in _devices.entries) {
    for (final lang in _locales) {
      testWidgets('paywall fits ${entry.key} in $lang', (tester) async {
        await tester.binding.setSurfaceSize(entry.value);
        addTearDown(() => tester.binding.setSurfaceSize(null));
        tester.view.physicalSize = entry.value;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          ChangeNotifierProvider(
            create: (_) => AppProvider(),
            child: MaterialApp(
              locale: Locale(lang),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: PremiumPaywallScreen(),
            ),
          ),
        );
        await tester.pump(const Duration(milliseconds: 600));

        expect(
          tester.takeException(),
          isNull,
          reason: '${entry.key} @ ${entry.value.width}x${entry.value.height} '
              '($lang) overflows',
        );
      });
    }
  }
}
