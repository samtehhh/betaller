import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/services/notification_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'the first week has seven different notifications in every language',
    () {
      for (final locale in AppLocalizations.supportedLocales) {
        final l = lookupAppLocalizations(locale);
        final copies = [
          for (var day = 1; day <= 7; day++)
            NotificationService.firstWeekCopy(day, l),
        ];
        for (final (title, body) in copies) {
          expect(title.trim(), isNotEmpty, reason: '$locale');
          expect(body.trim(), isNotEmpty, reason: '$locale');
          // Nothing the paywall keeps locked: no figures of the user's own.
          expect(title.contains('{') || body.contains('{'), isFalse);
        }
        expect(copies.map((c) => c.$1).toSet().length, 7, reason: '$locale');
        expect(copies.map((c) => c.$2).toSet().length, 7, reason: '$locale');
      }
    },
  );

  test('the first week is counted from the first call only', () async {
    SharedPreferences.setMockInitialValues({});
    await NotificationService().startFirstWeek();
    final prefs = await SharedPreferences.getInstance();
    final first = prefs.getString('betaller_first_week_start');
    expect(first, isNotNull);
    await prefs.setString(
      'betaller_first_week_start',
      '2026-01-01T00:00:00.000',
    );
    await NotificationService().startFirstWeek();
    expect(
      prefs.getString('betaller_first_week_start'),
      '2026-01-01T00:00:00.000',
    );
  });
}
