import 'package:flutter/material.dart';

import 'constants.dart';

// ── BeTaller design language (Oct 2026) ──────────────────────────────
//
// One set of measures for the app tabs, the onboarding and the paywall, so
// a screen reads as BeTaller wherever it sits. They are taken from the app
// tabs as they are (My Plan, Analysis, Progress), which set the bar:
// a flat deep-indigo page, dark cards with a hairline edge, one purple for
// everything you can press, and colour elsewhere only where it means
// something (growth green, score gold, nutrition orange, water cyan).

/// Corner radii. Cards and option rows share one; small marks another.
class BtRadius {
  BtRadius._();
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 26;
}

/// The 4-point spacing steps everything sits on.
class BtSpace {
  BtSpace._();
  static const double s4 = 4;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s32 = 32;
}

/// Surfaces and strokes, on top of [AppColors].
class BtColors {
  BtColors._();

  /// The page.
  static const page = AppColors.scaffold;

  /// A card or an answer row: a step darker than the page, as in the tabs.
  static const card = AppColors.cardFill;

  /// Something raised above a card (a sheet, a picked segment's track).
  static const raised = AppColors.surfaceDark;

  /// The hairline round a card.
  static final stroke = Colors.white.withValues(alpha: 0.07);

  /// A neutral fill for an icon tile or an unpicked track.
  static final tint = Colors.white.withValues(alpha: 0.06);

  /// What is picked or pressable.
  static const brand = AppColors.primary;
  static final brandWash = AppColors.primary.withValues(alpha: 0.13);
  static final brandEdge = AppColors.primary.withValues(alpha: 0.70);

  static const text = Colors.white;
  static final textSoft = Colors.white.withValues(alpha: 0.78);
  static final textMute = Colors.white.withValues(alpha: 0.55);
  static final textFaint = Colors.white.withValues(alpha: 0.35);
}

/// The type ramp. Sizes follow the tabs: a big screen title, a question-sized
/// title, then body, label and the spaced small caps of section headers.
class BtType {
  BtType._();

  static const screenTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.9,
    height: 1.1,
    color: Colors.white,
  );

  static const title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.7,
    height: 1.14,
    color: Colors.white,
  );

  static const headline = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    height: 1.25,
    color: Colors.white,
  );

  static final body = TextStyle(
    fontSize: 15,
    height: 1.45,
    color: BtColors.textMute,
  );

  static const option = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.1,
    height: 1.25,
  );

  static final overline = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.1,
    color: AppColors.textSecondary,
  );

  static const button = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
  );
}

/// Motion: one short step for a state change, one for a page.
class BtMotion {
  BtMotion._();
  static const quick = Duration(milliseconds: 180);
  static const page = Duration(milliseconds: 320);
  static const curve = Curves.easeOutCubic;
}
