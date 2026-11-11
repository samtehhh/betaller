import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/widgets/program_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final premium in [false, true]) {
    testWidgets('difficulty table, premium: $premium', (t) async {
      SharedPreferences.setMockInitialValues({});
      final p = AppProvider();
      await t.runAsync(p.loadData);
      p.setPremium(premium);
      t.view.physicalSize = const Size(400, 2000);
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.reset);
      await t.pumpWidget(ChangeNotifierProvider<AppProvider>.value(
        value: p,
        child: const MaterialApp(
          locale: Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: ProgressionTable(level: 0)),
        ),
      ));
      await t.pump();
      final l = lookupAppLocalizations(const Locale('en'));
      expect(
        find.text(l.rsStagePeak),
        premium ? findsNothing : findsWidgets,
      );
      expect(
        find.textContaining(RegExp(r'^\d')),
        premium ? findsWidgets : findsNothing,
      );
    });
  }
}
