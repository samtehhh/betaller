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
  static void tap() => HapticFeedback.lightImpact();
  static void select() => HapticFeedback.selectionClick();
  static void success() => HapticFeedback.mediumImpact();
  static void warning() => HapticFeedback.heavyImpact();
  static void impact() => HapticFeedback.heavyImpact();

  /// A short double tap for "done": medium, then light.
  static Future<void> celebrate() async {
    HapticFeedback.mediumImpact();
    await Future<void>.delayed(const Duration(milliseconds: 90));
    HapticFeedback.lightImpact();
  }
}
