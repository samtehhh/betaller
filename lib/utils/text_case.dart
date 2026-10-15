import 'package:flutter/widgets.dart';

/// Upper-cases [text] the way the given language does.
///
/// Dart's [String.toUpperCase] is not locale aware: in Turkish (and
/// Azerbaijani) the dotted i has its own capital, so "hedeflerin" must become
/// "HEDEFLERİN", not "HEDEFLERIN". The dotless ı already maps to I.
String upperFor(String text, String languageCode) {
  if (languageCode == 'tr' || languageCode == 'az') {
    return text.replaceAll('i', 'İ').toUpperCase();
  }
  return text.toUpperCase();
}

extension LocaleUpperCase on String {
  /// [upperFor] with the language of the nearest [Localizations].
  String upperIn(BuildContext context) =>
      upperFor(this, Localizations.localeOf(context).languageCode);
}
