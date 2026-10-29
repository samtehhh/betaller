import 'package:flutter/widgets.dart';

/// One UI language the app ships: its locale, the name in its own language
/// and the flag the language pickers show.
class AppLanguage {
  const AppLanguage(this.locale, this.nativeName, this.flag, this.short);

  final Locale locale;
  final String nativeName;
  final String flag;

  /// The code on the onboarding language button ("EN", "繁").
  final String short;
}

/// Every UI language, in the order the pickers list them. MaterialApp's
/// supportedLocales, the saved-language parser and background work all read
/// this list, so a new language is added here and in lib/l10n only.
const appLanguages = <AppLanguage>[
  AppLanguage(Locale('en'), 'English', '🇬🇧', 'EN'),
  AppLanguage(Locale('tr'), 'Türkçe', '🇹🇷', 'TR'),
  AppLanguage(Locale('de'), 'Deutsch', '🇩🇪', 'DE'),
  AppLanguage(Locale('fr'), 'Français', '🇫🇷', 'FR'),
  AppLanguage(Locale('es'), 'Español', '🇪🇸', 'ES'),
  AppLanguage(Locale('it'), 'Italiano', '🇮🇹', 'IT'),
  AppLanguage(Locale('pt'), 'Português', '🇧🇷', 'PT'),
  AppLanguage(Locale('nl'), 'Nederlands', '🇳🇱', 'NL'),
  AppLanguage(Locale('pl'), 'Polski', '🇵🇱', 'PL'),
  AppLanguage(Locale('sv'), 'Svenska', '🇸🇪', 'SV'),
  AppLanguage(Locale('ru'), 'Русский', '🇷🇺', 'RU'),
  AppLanguage(Locale('ar'), 'العربية', '🇸🇦', 'AR'),
  AppLanguage(Locale('hi'), 'हिन्दी', '🇮🇳', 'HI'),
  AppLanguage(Locale('id'), 'Bahasa Indonesia', '🇮🇩', 'ID'),
  AppLanguage(Locale('ms'), 'Bahasa Melayu', '🇲🇾', 'MS'),
  AppLanguage(Locale('vi'), 'Tiếng Việt', '🇻🇳', 'VI'),
  AppLanguage(Locale('th'), 'ไทย', '🇹🇭', 'TH'),
  AppLanguage(Locale('ja'), '日本語', '🇯🇵', 'JA'),
  AppLanguage(Locale('ko'), '한국어', '🇰🇷', 'KO'),
  AppLanguage(Locale('zh'), '简体中文', '🇨🇳', '简'),
  AppLanguage(
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    '繁體中文',
    '🇹🇼',
    '繁',
  ),
];

final supportedAppLocales = [for (final l in appLanguages) l.locale];

/// The shipped language for a device or saved locale, or null when the app
/// has none for it. Chinese picks Traditional for a Hant script or for
/// Taiwan, Hong Kong and Macau, Simplified otherwise.
Locale? matchAppLocale(Locale locale) {
  if (locale.languageCode == 'zh') {
    final hant = locale.scriptCode == 'Hant' ||
        const {'TW', 'HK', 'MO'}.contains(locale.countryCode);
    return hant
        ? const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
        : const Locale('zh');
  }
  for (final l in appLanguages) {
    if (l.locale.languageCode == locale.languageCode) return l.locale;
  }
  return null;
}

/// The saved form of a chosen language ("en", "zh-Hant").
String localeTag(Locale locale) => locale.toLanguageTag();

/// Reads [localeTag]'s output back, and the bare language codes older
/// versions saved.
Locale? parseLocaleTag(String tag) {
  if (tag.isEmpty) return null;
  final parts = tag.split(RegExp('[-_]'));
  return matchAppLocale(
    Locale.fromSubtags(
      languageCode: parts.first,
      scriptCode: parts.length > 1 && parts[1].length == 4 ? parts[1] : null,
    ),
  );
}

/// The language picker entry for [locale], if it is a shipped one.
AppLanguage? appLanguageFor(Locale locale) {
  final match = matchAppLocale(locale);
  if (match == null) return null;
  for (final l in appLanguages) {
    if (l.locale == match) return l;
  }
  return null;
}
