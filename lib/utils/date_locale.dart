import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// The locale dates are formatted in: the app's language with the device's
/// region, so English reads "Sunday, October 25" in the US and
/// "Sunday 25 October" in the UK. The app only ships language-level locales
/// ("en"), which on their own always give the US order.
///
/// Use with intl's skeletons (DateFormat.MMMMEEEEd(), yMMMd(), MMMd()), never
/// a fixed pattern like 'd MMM', so the order follows the region too.
/// main() loads the date symbols for every locale (initializeDateFormatting).
String dateLocaleOf(BuildContext context) => dateLocaleFor(
      Localizations.localeOf(context),
      WidgetsBinding.instance.platformDispatcher.locales,
    );

/// [dateLocaleOf] without a context: the first device locale in [app]'s
/// language that carries a region intl knows, else the bare language.
String dateLocaleFor(Locale app, List<Locale> deviceLocales) {
  final region = app.countryCode;
  if (region != null && region.isNotEmpty) {
    final own = '${app.languageCode}_$region';
    if (DateFormat.localeExists(own)) return own;
  }
  for (final d in deviceLocales) {
    if (d.languageCode != app.languageCode) continue;
    final r = d.countryCode;
    if (r == null || r.isEmpty) break;
    final full = '${d.languageCode}_$r';
    if (DateFormat.localeExists(full)) return full;
    break;
  }
  return app.languageCode;
}
