import 'package:intl/intl.dart';

/// Display numbers in the app's language: "2,3" in Turkish and German, where
/// the point already groups thousands ("1.300 mg"), and "2.3" in English.
/// MaterialApp's builder keeps [Intl.defaultLocale] on the app language.
///
/// For text the user reads only. Values parsed back with double.parse (text
/// field defaults, rounding helpers) keep [num.toStringAsFixed].
extension LocalFixed on num {
  String fixedL(int digits) {
    final f = NumberFormat.decimalPattern(Intl.defaultLocale ?? 'en')
      ..minimumFractionDigits = digits
      ..maximumFractionDigits = digits;
    return f.format(this);
  }
}
