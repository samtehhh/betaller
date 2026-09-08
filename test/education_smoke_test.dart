import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/screens/education_screen.dart';
import 'package:boyuzatma_app/utils/education_data.dart';

Widget _wrap(Widget child, Locale locale) => ChangeNotifierProvider(
  create: (_) => AppProvider(),
  child: MaterialApp(
    locale: locale,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: child,
  ),
);

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<void> phone(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(320, 640));
    addTearDown(() => tester.binding.setSurfaceSize(null));
  }

  testWidgets('education list renders', (tester) async {
    await phone(tester);
    await tester.pumpWidget(_wrap(const EducationScreen(), const Locale('tr')));
    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.takeException(), isNull);
  });

  testWidgets('every article detail renders in every language', (tester) async {
    await phone(tester);
    for (final lang in ['tr', 'en', 'de', 'fr', 'es', 'pt', 'it', 'hi']) {
      final articles = getEducationArticles(lang);
      for (var i = 0; i < articles.length; i++) {
        await tester.pumpWidget(
          _wrap(
            ArticleDetailScreen(
              article: articles[i],
              siblings: articles,
              index: i,
            ),
            Locale(lang),
          ),
        );
        await tester.pump(const Duration(milliseconds: 300));
        expect(
          tester.takeException(),
          isNull,
          reason: '$lang / ${articles[i]['id']}',
        );
      }
    }
  });
}
