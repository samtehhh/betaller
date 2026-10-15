import 'package:flutter/services.dart';

/// One vocabulary for touch feedback, so every screen feels the same:
///
/// - [tap]: any button or card press.
/// - [select]: a choice changes (tabs, chips, wheel pickers, toggles),
///   and each detent while scrolling a picker.
/// - [success]: something was completed or saved (routine done, height
///   logged, purchase, badge).
/// - [warning]: a destructive or blocked action.
/// - [impact]: a big moment (reveal, level up, streak milestone).
abstract final class Haptics {
  static void tap() => _run(HapticFeedback.lightImpact);
  static void select() => _run(HapticFeedback.selectionClick);
  static void success() => _run(HapticFeedback.mediumImpact);
  static void warning() => _run(HapticFeedback.heavyImpact);
  static void impact() => _run(HapticFeedback.heavyImpact);

  /// A short double tap for "done": medium, then light.
  static Future<void> celebrate() async {
    _run(HapticFeedback.mediumImpact);
    await Future<void>.delayed(const Duration(milliseconds: 90));
    _run(HapticFeedback.lightImpact);
  }

  /// Feedback is never worth a crash: provider code calls these too, and
  /// outside a running app (unit tests, a background isolate) there is no
  /// platform channel to answer.
  static void _run(Future<void> Function() f) {
    try {
      f().catchError((_) {});
    } catch (_) {}
  }
}
