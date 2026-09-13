import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart' hide RadarChart;
import 'package:intl/intl.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';
import 'discipline_widgets.dart';
import 'height_bell_curve.dart';
import 'radar_chart.dart';

// ═════════════════════════════════════════════════════════════════════════════
//  Paywall hero screens
//
//  These are drawn, not photographed. The paywall used to ship a folder of
//  webp screenshots per language — 8 locales x 7 shots — which meant every
//  redesign silently dated the sales pitch, and a new screen could not be sold
//  until somebody re-shot it in eight languages. Building the heroes out of the
//  app's own widgets and its own strings keeps them honest for free: the radar,
//  the bell curve and the discipline ring below are the very same classes the
//  real screens use.
//
//  Everything is laid out against a fixed design width so a panel can be scaled
//  into the phone mockup like a screenshot would be — see [PaywallPreview].
// ═════════════════════════════════════════════════════════════════════════════

const double kPreviewDesignWidth = 360;

/// The box a preview screen is authored in, and the exact area the phone
/// mockup has to show it in.
///
/// The height is not a round number by choice. The mockup's display area below
/// the status bar works out at 1.849w, and the box is scaled to the screen's
/// 0.94w width, so exactly 1.849 * 360 / 0.94 = 708 design points fit.
/// Authoring taller than that silently crops the bottom of every screen.
const Size kPreviewDesignSize = Size(kPreviewDesignWidth, 708);

/// The streak every preview quotes. It sits in the "relentless" tier, whose
/// gold is the accent the discipline slide is lit in — one number, so the ring,
/// the tier name and the slide's colour can never drift apart.
const int kPreviewStreak = 34;

/// One slide: the screen it shows, the accent that lights the paywall around
/// it, and the headline the slide is sold under.
class PaywallPreview {
  final String id;
  final Color accent;
  const PaywallPreview({required this.id, required this.accent});

  String title(AppLocalizations l) {
    switch (id) {
      case 'home':
        return l.paywallSlideHomeTitle;
      case 'progress':
        return l.paywallSlideProgressTitle;
      case 'analysis':
        return l.paywallSlideAnalysisTitle;
      case 'potential':
        return l.paywallSlidePotentialTitle;
      case 'discipline':
        return l.paywallSlideDisciplineTitle;
      case 'reminders':
        return l.paywallSlideRemindersTitle;
      case 'posture':
      default:
        return l.paywallSlidePostureTitle;
    }
  }

  String caption(AppLocalizations l) {
    switch (id) {
      case 'home':
        return l.paywallSlideHomeCaption;
      case 'progress':
        return l.paywallSlideProgressCaption;
      case 'analysis':
        return l.paywallSlideAnalysisCaption;
      case 'potential':
        return l.paywallSlidePotentialCaption;
      case 'discipline':
        return l.paywallSlideDisciplineCaption;
      case 'reminders':
        return l.paywallSlideRemindersCaption;
      case 'posture':
      default:
        return l.paywallSlidePostureCaption;
    }
  }

  /// The screen itself, authored at [kPreviewDesignWidth].
  Widget screen(AppLocalizations l) {
    switch (id) {
      case 'home':
        return _HomePreview(l: l);
      case 'progress':
        return _ProgressPreview(l: l);
      case 'analysis':
        return _AnalysisPreview(l: l);
      case 'potential':
        return _PotentialPreview(l: l);
      case 'discipline':
        return _DisciplinePreview(l: l);
      case 'reminders':
        return _RemindersPreview(l: l);
      case 'posture':
      default:
        return _PosturePreview(l: l);
    }
  }
}

/// The pitch, in order. Home first because it is what the user just came from,
/// then the three screens that carry the subscription, then the habit loop.
const List<PaywallPreview> kPaywallPreviews = [
  PaywallPreview(id: 'home', accent: AppColors.cyan),
  PaywallPreview(id: 'progress', accent: AppColors.lime),
  PaywallPreview(id: 'analysis', accent: AppColors.primaryBright),
  PaywallPreview(id: 'potential', accent: Color(0xFF6366F1)),
  PaywallPreview(id: 'discipline', accent: AppColors.warning),
  PaywallPreview(id: 'reminders', accent: AppColors.orange),
  PaywallPreview(id: 'posture', accent: AppColors.pink),
];

// ═════════════════════════════════════════════════════════════════════════════
//  Shared chrome
// ═════════════════════════════════════════════════════════════════════════════

/// The frame every preview sits in: the screen's title and its cards. There is
/// deliberately no tab bar — an earlier draft drew one, and a nav bar that
/// cannot be tapped is a lie about the product, not a frame for it.
class _Screen extends StatelessWidget {
  /// The screen's title, for the screens that head themselves with one.
  final String? title;

  /// Home heads itself with a greeting and an XP bar instead of a title, so it
  /// supplies its own header rather than being forced into the common one.
  final Widget? header;
  final List<Widget> children;

  const _Screen({this.title, this.header, required this.children})
    : assert(title != null || header != null);

  @override
  Widget build(BuildContext context) {
    // Laid out unbounded and cropped by the phone's own frame, so no
    // translation can make a card overflow the design box.
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null)
            header!
          else
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -0.8,
                      ),
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.07),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Icon(
                      CupertinoIcons.person_fill,
                      size: 14,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// The app's card, minus the expensive blur shadows — a preview is drawn at a
/// third of its authored size, where a 32px shadow is just mud.
class _Card extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? glow;
  const _Card({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.glow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color:
              glow?.withValues(alpha: 0.22) ??
              Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: child,
    );
  }
}

/// The small all-caps label the redesigned screens head their cards with.
class _CardHead extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Widget? trailing;
  const _CardHead({
    required this.icon,
    required this.label,
    required this.color,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 7),
        Expanded(
          child: Text(
            label.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.1,
              color: Colors.white.withValues(alpha: 0.45),
            ),
          ),
        ),
        ?trailing,
      ],
    );
  }
}

/// The icon-tile-plus-two-lines row the redesigned screens list their tools,
/// tips and tasks with.
class _RowCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final Widget? trailing;
  const _RowCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return _Card(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withValues(alpha: 0.42),
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) ...[const SizedBox(width: 10), trailing!],
        ],
      ),
    );
  }
}

/// The improvement tip, as the analysis screen draws it: an emoji tile, a
/// coloured headline, the reason underneath, and the points it is worth.
class _TipCard extends StatelessWidget {
  final String emoji;
  final Color color;
  final String title;
  final String desc;
  final int points;
  const _TipCard({
    required this.emoji,
    required this.color,
    required this.title,
    required this.desc,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withValues(alpha: 0.14),
              color.withValues(alpha: 0.03),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: color.withValues(alpha: 0.18), width: 0.5),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.20),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 17)),
              ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: color,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      height: 1.35,
                      color: Colors.white.withValues(alpha: 0.78),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '+$points',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The weakest of the five metrics, called out the way the analysis screen
/// calls it out: a tinted box, the metric named beside its score, and the line
/// that says what to do about it.
class _WeakLink extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final int score;
  final String hint;
  const _WeakLink({
    required this.icon,
    required this.color,
    required this.label,
    required this.score,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, size: 17, color: color),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$score',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: color,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  hint,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    height: 1.35,
                    color: Colors.white.withValues(alpha: 0.52),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// One level on the 70-day program, drawn as its own row the way the Program
/// tab draws it collapsed: an emoji badge, the level's name and what it
/// asks of you, and a checkmark once its week is behind you.
class _ProgramLevelRow extends StatelessWidget {
  final AppLocalizations l;
  final int levelIndex;
  final bool isCurrent;
  final int doneDays;
  const _ProgramLevelRow({
    required this.l,
    required this.levelIndex,
    required this.isCurrent,
    required this.doneDays,
  });

  @override
  Widget build(BuildContext context) {
    final meta = kProgramLevelMeta[levelIndex];
    final color = meta.$2;
    final isDone = doneDays >= kProgramDaysPerLevel;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.cardFill,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isCurrent
                ? color.withValues(alpha: 0.45)
                : color.withValues(alpha: 0.16),
            width: isCurrent ? 1.4 : 1,
          ),
          boxShadow: isCurrent
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.16),
                    blurRadius: 22,
                    spreadRadius: -6,
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withValues(alpha: 0.14),
                border: Border.all(color: color.withValues(alpha: 0.45)),
              ),
              alignment: Alignment.center,
              child: Text(meta.$1, style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.levelLabel(levelIndex + 1).toUpperCase(),
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.1,
                      color: Colors.white.withValues(alpha: 0.35),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    programLevelName(l, levelIndex),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.2,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    programLevelDesc(l, levelIndex),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withValues(alpha: 0.42),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (isDone)
              const Icon(
                CupertinoIcons.checkmark_seal_fill,
                size: 19,
                color: AppColors.success,
              )
            else
              Text(
                '$doneDays/$kProgramDaysPerLevel',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// A recommended exercise, as the posture screen lists them: a large emoji
/// tile, the move, and what it fixes.
class _ExerciseRow extends StatelessWidget {
  final String emoji;
  final String title;
  final String desc;
  final bool divided;
  const _ExerciseRow({
    required this.emoji,
    required this.title,
    required this.desc,
    this.divided = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (divided) const SizedBox(height: 14),
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.22),
                ),
              ),
              alignment: Alignment.center,
              child: Text(emoji, style: const TextStyle(fontSize: 20)),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;
  final Color color;
  const _Pill({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withValues(alpha: 0.30)),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w900,
          color: color,
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  1. Home — today's mission
// ═════════════════════════════════════════════════════════════════════════════

class _HomePreview extends StatelessWidget {
  final AppLocalizations l;
  const _HomePreview({required this.l});

  @override
  Widget build(BuildContext context) {
    return _Screen(
      // Home does not title itself. It greets, badges the streak and carries
      // the XP bar in its header — so the preview heads itself the same way.
      header: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'BeTaller',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -1.0,
                          height: 1.08,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        l.greetingStreak30(kPreviewStreak),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          color: AppColors.warning,
                          letterSpacing: -0.1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // The streak badge, as the header wears it.
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.orange.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.orange.withValues(alpha: 0.20),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('🔥', style: TextStyle(fontSize: 13)),
                      SizedBox(width: 5),
                      Text(
                        '$kPreviewStreak',
                        style: TextStyle(
                          color: AppColors.orange,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            // The inline XP bar: a violet glass strip, not a card.
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.10),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          gradient: AppColors.gradientCyan,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: const Text(
                          'LVL 9',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          l.levelDisciplined,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withValues(alpha: 0.65),
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                      Text(
                        '2340 / 2500 XP',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.32),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: SizedBox(
                      height: 4,
                      child: Stack(
                        children: [
                          Container(color: const Color(0x0FFFFFFF)),
                          FractionallySizedBox(
                            widthFactor: 0.68,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: AppColors.gradientCyan,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      children: [
        // ── Today's mission ─────────────────────────────────────────────
        _Card(
          glow: AppColors.cyan,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.sun_max_fill,
                    size: 15,
                    color: AppColors.cyan,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l.todayGoals,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const _Pill(text: '2/3', color: AppColors.cyan),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 76,
                    height: 76,
                    child: CustomPaint(
                      painter: const _RingPainter(
                        progress: 0.72,
                        color: AppColors.cyan,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              '72',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w900,
                                height: 1,
                                color: Colors.white,
                                letterSpacing: -1.2,
                              ),
                            ),
                            Text(
                              '%',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                                color: Colors.white.withValues(alpha: 0.40),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        _MiniGoal(
                          icon: CupertinoIcons.checkmark_circle_fill,
                          color: AppColors.primary,
                          label: l.routinesLabel,
                          value: '4/4',
                          progress: 1,
                          done: true,
                        ),
                        const SizedBox(height: 11),
                        _MiniGoal(
                          icon: CupertinoIcons.bolt_fill,
                          color: AppColors.warning,
                          label: l.challengesLabel,
                          value: '2/3',
                          progress: 0.66,
                        ),
                        const SizedBox(height: 11),
                        _MiniGoal(
                          icon: CupertinoIcons.drop_fill,
                          color: AppColors.water,
                          label: l.water,
                          value: '1.8/2.5L',
                          progress: 0.72,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // ── Water and sleep, the two the day is tracked on ──────────────
        Row(
          children: [
            Expanded(
              child: _TrackCard(
                icon: CupertinoIcons.drop_fill,
                label: l.water,
                value: '1.8',
                target: '2.5',
                unit: 'L',
                color: AppColors.water,
                progress: 0.72,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _TrackCard(
                icon: CupertinoIcons.moon_fill,
                label: l.sleepLabel,
                value: '8.2',
                target: '9.0',
                unit: l.hoursShort,
                color: AppColors.sleep,
                progress: 0.91,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // ── The hero: the number the whole app is about ─────────────────
        Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF18103A), Color(0xFF0A0720)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      l.heightLabel.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary.withValues(alpha: 0.70),
                        letterSpacing: 3.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.success.withValues(alpha: 0.22),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.checkmark_circle_fill,
                          size: 11,
                          color: AppColors.success,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '4/4',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: AppColors.success,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text(
                      '174.2',
                      style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -3,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        'CM',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withValues(alpha: 0.30),
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.success.withValues(alpha: 0.20),
                          ),
                        ),
                        child: const Text(
                          '+6.1',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w800,
                            color: AppColors.success,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      '${l.target}: 180.3 cm',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.38),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.22),
                      ),
                    ),
                    child: Text(
                      l.remaining('6.1'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              const GlowProgressBar(value: 0.85, height: 7),
            ],
          ),
        ),
      ],
    );
  }
}

/// Water and sleep, as the home screen tracks them: the label with its own add
/// button, the running total against the target, and the day's progress.
class _TrackCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String target;
  final String unit;
  final Color color;
  final double progress;

  const _TrackCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.target,
    required this.unit,
    required this.color,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: color.withValues(alpha: 0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: color,
                    letterSpacing: -0.1,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(CupertinoIcons.plus, color: color, size: 12),
              ),
            ],
          ),
          const SizedBox(height: 11),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -1.2,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '/ $target$unit',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withValues(alpha: 0.32),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 11),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5,
              backgroundColor: Colors.white.withValues(alpha: 0.06),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniGoal extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;
  final double progress;
  final bool done;
  const _MiniGoal({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
    required this.progress,
    this.done = false,
  });

  @override
  Widget build(BuildContext context) {
    final c = done ? AppColors.success : color;
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 12, color: c),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.70),
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: done ? AppColors.success : Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 4,
            backgroundColor: Colors.white.withValues(alpha: 0.07),
            valueColor: AlwaysStoppedAnimation<Color>(c),
          ),
        ),
      ],
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final Color color;
  const _RingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 5;
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.07)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      Paint()
        ..shader = SweepGradient(
          startAngle: -math.pi / 2,
          endAngle: 3 * math.pi / 2,
          colors: [color.withValues(alpha: 0.55), color],
        ).createShader(Rect.fromCircle(center: center, radius: radius))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.progress != progress || old.color != color;
}

// ═════════════════════════════════════════════════════════════════════════════
//  2. Progress — the height curve
// ═════════════════════════════════════════════════════════════════════════════

class _ProgressPreview extends StatelessWidget {
  final AppLocalizations l;
  const _ProgressPreview({required this.l});

  static const _points = <double>[168.1, 169.4, 170.2, 171.6, 172.5, 174.2];

  /// One demo record per point, dated backwards from today so the chart
  /// always reads as a recent, live-looking history.
  static final _dates = List.generate(
    _points.length,
    (i) =>
        DateTime.now().subtract(Duration(days: (_points.length - 1 - i) * 9)),
  );

  @override
  Widget build(BuildContext context) {
    return _Screen(
      title: l.progressTitle,
      children: [
        // ── The hero, drawn exactly as _HeightHero draws it on the real
        // Progress screen: the trend sparkline beside the number, the gain
        // pill with its own label underneath, then the add-measurement CTA.
        Container(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1A1240), Color(0xFF0C0A1C)],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.22),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.18),
                blurRadius: 24,
                offset: const Offset(0, 7),
                spreadRadius: -8,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l.currentHeight.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.3,
                            color: Colors.white.withValues(alpha: 0.40),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text(
                              '174.2',
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: -1.6,
                                height: 1,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withValues(alpha: 0.45),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 66,
                    height: 32,
                    child: CustomPaint(
                      painter: const _ProgressSparklinePainter(
                        values: _points,
                        color: AppColors.cyan,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: AppColors.success.withValues(alpha: 0.28),
                      ),
                    ),
                    child: const Text(
                      '+6.1 cm',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: AppColors.success,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      l.totalGrowth,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withValues(alpha: 0.42),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Container(
                height: 32,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, Color(0xFF6D28D9)],
                  ),
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.35),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.add,
                      size: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        l.addMeasurementButton,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 7),
        _Card(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardHead(
                icon: CupertinoIcons.graph_square_fill,
                label: l.heightChart,
                color: AppColors.lime,
              ),
              const SizedBox(height: 5),
              SizedBox(height: 80, child: _buildDemoChart(context)),
              const SizedBox(height: 4),
              Divider(color: Colors.white.withValues(alpha: 0.07), height: 1),
              const SizedBox(height: 5),
              Row(
                children: [
                  _MiniStat(
                    label: l.totalGrowth,
                    value: '+6.1',
                    unit: 'cm',
                    color: AppColors.success,
                  ),
                  _StatDivider(),
                  _MiniStat(
                    label: l.lastDiff,
                    value: '+1.7',
                    unit: 'cm',
                    color: AppColors.success,
                  ),
                  _StatDivider(),
                  _MiniStat(
                    label: l.measurementCount,
                    value: '6',
                    unit: '',
                    color: AppColors.primaryLight,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 5),
          child: _CardHead(
            icon: CupertinoIcons.square_stack_3d_down_right_fill,
            label: l.trackingSection,
            color: AppColors.lime,
          ),
        ),
        _ToolCard(
          color: AppColors.cyan,
          icon: CupertinoIcons.photo_fill_on_rectangle_fill,
          title: l.progressPhotosTitle,
          benefit: l.photosBenefit,
          state: l.photosSummaryCount(8),
          cta: l.photosCta,
          visual: const _PhotoStrip(),
        ),
        const SizedBox(height: 5),
        _ToolCard(
          color: AppColors.lime,
          icon: Icons.accessibility_new_rounded,
          title: l.explorePosture,
          benefit: l.postureBenefit,
          state: l.postureSummaryEmpty,
          cta: l.postureCta,
          visual: const _PosturePreviewDial(),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 5),
          child: _CardHead(
            icon: CupertinoIcons.clock,
            label: l.measurementHistory,
            color: AppColors.primaryLight,
          ),
        ),
        ..._buildHistory(context),
        const SizedBox(height: 4),
        _ToolCard(
          color: AppColors.orange,
          icon: CupertinoIcons.doc_chart_fill,
          title: l.weeklyReportMenu,
          benefit: l.reportBenefit,
          state: l.toolStateReady,
          cta: l.reportCta,
          visual: const _WeekSpark(),
        ),
      ],
    );
  }

  /// The most recent readings, newest first — the same three-column layout
  /// (dot rail, height, date, diff badge) the real history timeline uses.
  List<Widget> _buildHistory(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    const shown = 3;
    return List.generate(shown, (i) {
      final index = _points.length - 1 - i;
      final diff = index > 0
          ? double.parse(
              (_points[index] - _points[index - 1]).toStringAsFixed(1),
            )
          : 0.0;
      return _HistoryEntry(
        date: DateFormat('d MMM yyyy', locale).format(_dates[index]),
        height: _points[index],
        diff: diff,
        isFirst: i == 0,
        isLast: i == shown - 1,
      );
    });
  }

  /// The exact chart the real Progress screen draws: a gradient line over a
  /// dashed grid, with the height axis on the left and a date on the right
  /// dates, so the pitch never runs a different chart than the product does.
  Widget _buildDemoChart(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final minH = _points.reduce(math.min);
    final maxH = _points.reduce(math.max);
    final range = maxH - minH;
    final minY = minH - (range < 2 ? 2 : range * 0.3);
    final maxY = maxH + (range < 2 ? 2 : range * 0.3);
    final spots = List.generate(
      _points.length,
      (i) => FlSpot(i.toDouble(), _points[i]),
    );

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: range < 3 ? 0.5 : 1,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.white.withValues(alpha: 0.06),
            strokeWidth: 0.5,
            dashArray: [6, 4],
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: range < 3 ? 1 : null,
              getTitlesWidget: (value, meta) {
                if (value == meta.min || value == meta.max) {
                  return const SizedBox();
                }
                return Text(
                  value.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 8.5,
                    color: Colors.white.withValues(alpha: 0.35),
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 18,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= _dates.length) {
                  return const SizedBox();
                }
                if (_dates.length > 5 &&
                    index != 0 &&
                    index != _dates.length - 1 &&
                    index != _dates.length ~/ 2) {
                  return const SizedBox();
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    DateFormat('d MMM', locale).format(_dates[index]),
                    style: TextStyle(
                      fontSize: 8.5,
                      color: Colors.white.withValues(alpha: 0.5),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        minY: minY,
        maxY: maxY,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            curveSmoothness: 0.35,
            gradient: const LinearGradient(
              colors: [Color(0xFF9C6ADE), Color(0xFFB57BFF), Color(0xFFCE93D8)],
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                final isLast = index == spots.length - 1;
                return FlDotCirclePainter(
                  radius: isLast ? 5 : 3,
                  color: isLast ? const Color(0xFFCE93D8) : AppColors.scaffold,
                  strokeWidth: isLast ? 3 : 2,
                  strokeColor: isLast ? Colors.white : const Color(0xFFB57BFF),
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFB57BFF).withValues(alpha: 0.20),
                  AppColors.primary.withValues(alpha: 0.06),
                  AppColors.primary.withValues(alpha: 0.0),
                ],
                stops: const [0.0, 0.6, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        lineTouchData: const LineTouchData(enabled: false),
      ),
    );
  }
}

/// The posture tool's visual before a first analysis exists — an empty ring
/// around the same icon the real _PostureDial falls back to.
class _PosturePreviewDial extends StatelessWidget {
  const _PosturePreviewDial();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const _PostureRingPainter(progress: 0, color: AppColors.lime),
      child: Center(
        child: Icon(
          Icons.accessibility_new_rounded,
          size: 26,
          color: AppColors.lime.withValues(alpha: 0.55),
        ),
      ),
    );
  }
}

class _PostureRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  const _PostureRingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.07)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );
    if (progress <= 0) return;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 2),
    );
  }

  @override
  bool shouldRepaint(_PostureRingPainter old) =>
      old.progress != progress || old.color != color;
}

/// One reading on the measurement-history rail, drawn exactly as
/// _TimelineEntry draws it on the real Progress screen: a dot-and-line rail,
/// the height and date, and the change badge.
class _HistoryEntry extends StatelessWidget {
  final String date;
  final double height;
  final double diff;
  final bool isFirst;
  final bool isLast;

  const _HistoryEntry({
    required this.date,
    required this.height,
    required this.diff,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final up = diff > 0;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 26,
            child: Column(
              children: [
                Container(
                  width: 2,
                  height: 8,
                  color: isFirst
                      ? Colors.transparent
                      : Colors.white.withValues(alpha: 0.08),
                ),
                Container(
                  width: 11,
                  height: 11,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isFirst ? AppColors.primary : AppColors.cardFill,
                    border: Border.all(
                      color: isFirst
                          ? AppColors.primary
                          : Colors.white.withValues(alpha: 0.20),
                      width: 2,
                    ),
                    boxShadow: isFirst
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.5),
                              blurRadius: 9,
                            ),
                          ]
                        : null,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    color: isLast
                        ? Colors.transparent
                        : Colors.white.withValues(alpha: 0.08),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 9, 10, 9),
                decoration: BoxDecoration(
                  color: AppColors.cardFill,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${height.toStringAsFixed(1)} cm',
                            style: const TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withValues(alpha: 0.42),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (diff != 0)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: (up ? AppColors.success : AppColors.error)
                              .withValues(alpha: 0.13),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              up
                                  ? CupertinoIcons.arrow_up_right
                                  : CupertinoIcons.arrow_down_right,
                              size: 10,
                              color: up ? AppColors.success : AppColors.error,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '${up ? '+' : ''}${diff.toStringAsFixed(1)}',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w800,
                                color: up ? AppColors.success : AppColors.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The tracking tool, as the progress screen sells it: what it is, why it is
/// worth opening, where it stands, and a glance at what is inside.
class _ToolCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String benefit;
  final String state;
  final String cta;
  final Widget visual;

  const _ToolCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.benefit,
    required this.state,
    required this.cta,
    required this.visual,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 9),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withValues(alpha: 0.11), AppColors.cardFill],
          stops: const [0.0, 0.62],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(icon, size: 14, color: color),
                        const SizedBox(width: 7),
                        Flexible(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      benefit,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.5,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withValues(alpha: 0.55),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(width: 58, height: 56, child: visual),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: color.withValues(alpha: 0.30)),
                ),
                child: Text(
                  state,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  cta,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Icon(CupertinoIcons.chevron_right, size: 12, color: color),
            ],
          ),
        ],
      ),
    );
  }
}

/// The two glowing frames the photos tool shows instead of an icon.
class _PhotoStrip extends StatelessWidget {
  const _PhotoStrip();

  @override
  Widget build(BuildContext context) {
    Widget frame(String asset, Color border) => Container(
      width: 26,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border.withValues(alpha: 0.55), width: 1.1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(asset, fit: BoxFit.cover),
    );

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          frame('assets/demo/posture_before.png', AppColors.cyan),
          const SizedBox(width: 4),
          frame('assets/demo/posture_after.png', AppColors.lime),
        ],
      ),
    );
  }
}

/// Seven bars, one per day — the week the report is about.
class _WeekSpark extends StatelessWidget {
  const _WeekSpark();

  static const _week = <double>[0.5, 0.8, 0.65, 1.0, 0.9, 0.45, 0.75];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (final v in _week) ...[
            Container(
              width: 5,
              height: 9 + 34 * v,
              decoration: BoxDecoration(
                color: AppColors.orange.withValues(alpha: v >= 0.9 ? 1 : 0.45),
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(width: 2),
          ],
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: 1,
    height: 26,
    color: Colors.white.withValues(alpha: 0.09),
  );
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;
  const _MiniStat({
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: color,
                  letterSpacing: -0.5,
                ),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 2),
                Text(
                  unit,
                  style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w700,
                    color: color.withValues(alpha: 0.60),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 3),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.38),
            ),
          ),
        ],
      ),
    );
  }
}

/// The hero's trend sparkline, painted exactly as _SparklinePainter paints it
/// on the real Progress screen: a gradient-filled line rising to a lit dot on
/// the latest reading.
class _ProgressSparklinePainter extends CustomPainter {
  final List<double> values;
  final Color color;
  const _ProgressSparklinePainter({required this.values, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.length < 2) return;
    final minV = values.reduce(math.min);
    final maxV = values.reduce(math.max);
    final span = (maxV - minV).abs() < 0.01 ? 1.0 : maxV - minV;

    final path = Path();
    for (var i = 0; i < values.length; i++) {
      final x = size.width * (i / (values.length - 1));
      final y =
          size.height - ((values[i] - minV) / span) * (size.height - 6) - 3;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final fill = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.28), color.withValues(alpha: 0)],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.2
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    final lastX = size.width;
    final lastY =
        size.height - ((values.last - minV) / span) * (size.height - 6) - 3;
    canvas.drawCircle(Offset(lastX, lastY), 3.4, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_ProgressSparklinePainter old) => old.values != values;
}

// ═════════════════════════════════════════════════════════════════════════════
//  3. Analysis — the radar and the weak link
// ═════════════════════════════════════════════════════════════════════════════

class _AnalysisPreview extends StatelessWidget {
  final AppLocalizations l;
  const _AnalysisPreview({required this.l});

  @override
  Widget build(BuildContext context) {
    return _Screen(
      title: l.navAnalysis,
      children: [
        _Card(
          glow: AppColors.primaryBright,
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardHead(
                icon: CupertinoIcons.sparkles,
                label: l.betallerScore,
                color: AppColors.primaryBright,
                trailing: const _Pill(text: 'A', color: AppColors.lime),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text(
                    '86',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -2,
                      height: 1,
                    ),
                  ),
                  Text(
                    '/100',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.35),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Divider(color: Colors.white.withValues(alpha: 0.07), height: 1),
              const SizedBox(height: 12),
              _CardHead(
                icon: CupertinoIcons.hexagon_fill,
                label: l.analysisBalance,
                color: AppColors.primary,
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 178,
                child: Center(
                  child: RadarChart(
                    axes: [
                      RadarAxis(
                        label: l.genetic,
                        value: 88,
                        color: AppColors.primary,
                      ),
                      RadarAxis(
                        label: l.growth,
                        value: 92,
                        color: AppColors.lime,
                      ),
                      RadarAxis(
                        label: l.nutrition,
                        value: 74,
                        color: AppColors.orange,
                      ),
                      RadarAxis(
                        label: l.sleepLabel,
                        value: 81,
                        color: AppColors.sleep,
                      ),
                      RadarAxis(
                        label: l.discipline,
                        value: 58,
                        color: AppColors.warning,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // The weakest metric, worded and shaped as the analysis screen words
        // and shapes it — the label carries the metric, not a bare heading.
        _WeakLink(
          icon: CupertinoIcons.flame_fill,
          color: AppColors.warning,
          label: '${l.analysisWeakest}: ${l.discipline}',
          score: 58,
          hint: l.analysisWeakestHint,
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: _CardHead(
            icon: CupertinoIcons.arrow_up_right_circle_fill,
            label: l.improveScore,
            color: AppColors.lime,
            trailing: const _Pill(text: 'A → S', color: AppColors.lime),
          ),
        ),
        _TipCard(
          emoji: '🔥',
          color: AppColors.lime,
          title: l.keepStreak,
          desc: l.streakContinue(kPreviewStreak),
          points: 5,
        ),
        _TipCard(
          emoji: '🥗',
          color: AppColors.orange,
          title: l.nutritionStrengthen,
          desc: l.nutritionDefault,
          points: 3,
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  4. Potential — where the user sits in the distribution
// ═════════════════════════════════════════════════════════════════════════════

class _PotentialPreview extends StatelessWidget {
  final AppLocalizations l;
  const _PotentialPreview({required this.l});

  static const _indigo = Color(0xFF6366F1);

  @override
  Widget build(BuildContext context) {
    return _Screen(
      title: l.heightPrediction,
      children: [
        _Card(
          glow: _indigo,
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardHead(
                icon: CupertinoIcons.arrow_up_right_circle_fill,
                label: l.predictedHeightAt21,
                color: _indigo,
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // As on the progress card: the headline number takes the
                  // room that is left and scales down into it, so the gain pill
                  // beside it keeps its place in every font and language.
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const Text(
                            '180.3',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: -2,
                              height: 1,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(alpha: 0.45),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const _Pill(text: '+6.1 cm', color: AppColors.lime),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                l.growthRemaining,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.40),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _Card(
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardHead(
                icon: CupertinoIcons.chart_bar_alt_fill,
                label: l.analysisComparison,
                color: _indigo,
                trailing: const _Pill(text: '%78', color: _indigo),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 150,
                child: HeightBellCurve(
                  heightCm: 174.2,
                  mean: 171.5,
                  sd: 6.4,
                  percentile: 78,
                  color: _indigo,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // The exact card the real growth-status screen shows: one bar split
        // by source, then how far that walk has carried the user toward the
        // ceiling genetics set — drawn the same way analysis_screen.dart
        // draws it, right down to the single segmented bar rather than three
        // separate ones.
        _Card(
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardHead(
                icon: CupertinoIcons.chart_pie_fill,
                label: l.growthBreakdown,
                color: AppColors.lime,
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  height: 11,
                  child: Row(
                    children: [
                      _BarSegment(flex: 56, color: AppColors.primary),
                      const SizedBox(width: 2),
                      _BarSegment(flex: 29, color: AppColors.cyan),
                      const SizedBox(width: 2),
                      _BarSegment(flex: 15, color: AppColors.orange),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 13),
              _BreakdownRow(
                label: l.geneticGainLabel,
                percent: 56,
                cm: 3.4,
                color: AppColors.primary,
              ),
              _BreakdownRow(
                label: l.lifestyleLabel,
                percent: 29,
                cm: 1.8,
                color: AppColors.cyan,
              ),
              _BreakdownRow(
                label: l.quickPosture,
                percent: 15,
                cm: 0.9,
                color: AppColors.orange,
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.fromLTRB(13, 12, 13, 13),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.035),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            l.geneticCeilingProgress,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withValues(alpha: 0.45),
                            ),
                          ),
                        ),
                        const Text(
                          '%92',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 0.92,
                        minHeight: 7,
                        backgroundColor: Color(0x14FFFFFF),
                        valueColor: AlwaysStoppedAnimation<Color>(_indigo),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '174.2 cm',
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withValues(alpha: 0.55),
                          ),
                        ),
                        Text(
                          '189.3 cm',
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                            color: _indigo.withValues(alpha: 0.85),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lime.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.arrow_up_right,
                      size: 13,
                      color: AppColors.lime,
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        '8.9 ${l.cmPerYear}  •  ${l.growthRate(l.velocityExcellent)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.lime,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// One coloured slice of the growth-breakdown bar, sized by its share.
class _BarSegment extends StatelessWidget {
  final int flex;
  final Color color;
  const _BarSegment({required this.flex, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withValues(alpha: 0.65)],
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}

/// One source of the growth gain: a dot, its label, its share of the total,
/// and the centimetres it is worth — the same row analysis_screen.dart lists
/// underneath the bar.
class _BreakdownRow extends StatelessWidget {
  final String label;
  final int percent;
  final double cm;
  final Color color;
  const _BreakdownRow({
    required this.label,
    required this.percent,
    required this.cm,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white.withValues(alpha: 0.72),
              ),
            ),
          ),
          Text(
            '$percent%',
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.35),
            ),
          ),
          const SizedBox(width: 9),
          Text(
            '+${cm.toStringAsFixed(1)} cm',
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  5. Discipline — the 70-day program, the same journey header and level
//     list the real Program tab draws
// ═════════════════════════════════════════════════════════════════════════════

class _DisciplinePreview extends StatelessWidget {
  final AppLocalizations l;
  const _DisciplinePreview({required this.l});

  /// The level the 70-day program sits on for this slide: far enough in to
  /// be worth showing off, on the tier this slide is lit in.
  static const _currentLevel = 6; // "Elit"
  static const _doneDays = 45;
  static const _totalDays = kProgramTotalLevels * kProgramDaysPerLevel;

  @override
  Widget build(BuildContext context) {
    final meta = kProgramLevelMeta[_currentLevel];
    final color = meta.$2;
    final progress = _doneDays / _totalDays;

    return _Screen(
      title: l.disciplineProgramTitle,
      children: [
        // ── The journey header — the same ring, the same level strip, the
        // same "days left" badge the real Program tab draws ───────────────
        _Card(
          glow: color,
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 84,
                    height: 84,
                    child: CustomPaint(
                      painter: DisciplineRingPainter(
                        progress: progress,
                        color: color,
                        segments: 35,
                      ),
                      child: Center(
                        child: Text(
                          meta.$1,
                          style: const TextStyle(fontSize: 26),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l.disciplineProgramTitle.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                            color: Colors.white.withValues(alpha: 0.40),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          programLevelName(l, _currentLevel),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                            color: color,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          l.disciplineJourneyDay(_doneDays, _totalDays),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withValues(alpha: 0.55),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.warning.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: AppColors.warning.withValues(alpha: 0.28),
                            ),
                          ),
                          child: Text(
                            l.daysLeftProgram(_totalDays - _doneDays),
                            style: const TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              color: AppColors.warning,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: List.generate(kProgramTotalLevels, (i) {
                  final ratio = i < _currentLevel
                      ? 1.0
                      : i == _currentLevel
                      ? (_doneDays % kProgramDaysPerLevel) /
                            kProgramDaysPerLevel
                      : 0.0;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: i == kProgramTotalLevels - 1 ? 0 : 4,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: LinearProgressIndicator(
                          value: ratio,
                          minHeight: 5,
                          backgroundColor: Colors.white.withValues(alpha: 0.07),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            kProgramLevelMeta[i].$2,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: _CardHead(
            icon: CupertinoIcons.square_stack_3d_up_fill,
            label: l.disciplineLevels,
            color: color,
          ),
        ),
        // ── Seviyeler — the levels already cleared, then the one in play ──
        for (var i = 0; i <= _currentLevel; i++)
          _ProgramLevelRow(
            l: l,
            levelIndex: i,
            isCurrent: i == _currentLevel,
            doneDays: i == _currentLevel
                ? _doneDays % kProgramDaysPerLevel
                : kProgramDaysPerLevel,
          ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  6. Reminders — the nudges the user schedules
// ═════════════════════════════════════════════════════════════════════════════

class _RemindersPreview extends StatelessWidget {
  final AppLocalizations l;
  const _RemindersPreview({required this.l});

  @override
  Widget build(BuildContext context) {
    return _Screen(
      title: l.notifications,
      children: [
        _Card(
          glow: AppColors.orange,
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: AppColors.orange.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  CupertinoIcons.bell_fill,
                  size: 17,
                  color: AppColors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.notificationsOn,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '08:30 · ${l.reminderExercise}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.42),
                      ),
                    ),
                  ],
                ),
              ),
              const _MiniSwitch(on: true, color: AppColors.orange),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _Card(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardHead(
                icon: CupertinoIcons.clock_fill,
                label: l.notifications,
                color: AppColors.orange,
              ),
              const SizedBox(height: 8),
              _ReminderRow(
                icon: CupertinoIcons.bolt_fill,
                color: AppColors.primary,
                label: l.reminderExercise,
                time: '08:30',
                on: true,
              ),
              _ReminderRow(
                icon: CupertinoIcons.drop_fill,
                color: AppColors.water,
                label: l.reminderWater,
                time: '11:00',
                on: true,
              ),
              _ReminderRow(
                icon: Icons.accessibility_new_rounded,
                color: AppColors.pink,
                label: l.reminderPosture,
                time: '15:30',
                on: true,
              ),
              _ReminderRow(
                icon: CupertinoIcons.leaf_arrow_circlepath,
                color: AppColors.lime,
                label: l.reminderNutrition,
                time: '12:30',
                on: true,
              ),
              _ReminderRow(
                icon: CupertinoIcons.checkmark_seal_fill,
                color: AppColors.warning,
                label: l.reminderRoutine,
                time: '19:00',
                on: true,
              ),
              _ReminderRow(
                icon: CupertinoIcons.arrow_up_right_circle_fill,
                color: AppColors.cyan,
                label: l.reminderMeasurement,
                time: '21:15',
                on: true,
              ),
              _ReminderRow(
                icon: CupertinoIcons.bell_fill,
                color: AppColors.pink,
                label: l.reminderCustom,
                time: '20:00',
                on: true,
              ),
              _ReminderRow(
                icon: CupertinoIcons.sun_max_fill,
                color: AppColors.primary,
                label: l.routineMorningStretch,
                time: '07:15',
                on: true,
              ),
              _ReminderRow(
                icon: CupertinoIcons.moon_fill,
                color: AppColors.sleep,
                label: l.reminderSleep,
                time: '22:45',
                on: false,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _RowCard(
          icon: CupertinoIcons.speaker_slash_fill,
          color: AppColors.primaryBright,
          title: l.notificationsOff,
          subtitle: '00:00 — 07:00',
          trailing: const _MiniSwitch(
            on: false,
            color: AppColors.primaryBright,
          ),
        ),
      ],
    );
  }
}

class _ReminderRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String time;
  final bool on;
  const _ReminderRow({
    required this.icon,
    required this.color,
    required this.label,
    required this.time,
    required this.on,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: on ? 0.14 : 0.06),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              icon,
              size: 13,
              color: on ? color : color.withValues(alpha: 0.4),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white.withValues(alpha: on ? 0.85 : 0.35),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Colors.white.withValues(alpha: on ? 0.70 : 0.28),
            ),
          ),
          const SizedBox(width: 10),
          _MiniSwitch(on: on, color: color),
        ],
      ),
    );
  }
}

class _MiniSwitch extends StatelessWidget {
  final bool on;
  final Color color;
  const _MiniSwitch({required this.on, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 19,
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        color: on
            ? color.withValues(alpha: 0.85)
            : Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Align(
        alignment: on ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 14,
          height: 14,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  7. Posture — the before and after
// ═════════════════════════════════════════════════════════════════════════════

class _PosturePreview extends StatelessWidget {
  final AppLocalizations l;
  const _PosturePreview({required this.l});

  @override
  Widget build(BuildContext context) {
    return _Screen(
      title: l.postureAnalysisTitle,
      children: [
        _Card(
          glow: AppColors.pink,
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardHead(
                icon: CupertinoIcons.camera_viewfinder,
                label: l.beforeAfter,
                color: AppColors.pink,
                trailing: const _Pill(text: '86/100', color: AppColors.lime),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: _PhotoFrame(
                      asset: 'assets/demo/posture_before.png',
                      label: l.beforeLabel,
                      color: Colors.white.withValues(alpha: 0.35),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _PhotoFrame(
                      asset: 'assets/demo/posture_after.png',
                      label: l.afterLabel,
                      color: AppColors.lime,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _Card(
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardHead(
                icon: CupertinoIcons.list_bullet,
                label: l.improveScore,
                color: AppColors.pink,
              ),
              const SizedBox(height: 14),
              GoalBar(
                icon: Icons.accessibility_new_rounded,
                label: l.headPosition,
                done: 82,
                target: 100,
                color: AppColors.pink,
              ),
              GoalBar(
                icon: Icons.airline_seat_recline_normal_rounded,
                label: l.kyphosisLabel,
                done: 91,
                target: 100,
                color: AppColors.cyan,
              ),
              GoalBar(
                icon: CupertinoIcons.arrow_up_down,
                label: l.lordosisLabel,
                done: 76,
                target: 100,
                color: AppColors.warning,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _Card(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardHead(
                icon: CupertinoIcons.list_bullet,
                label: l.recommendedExercises,
                color: AppColors.pink,
              ),
              const SizedBox(height: 14),
              _ExerciseRow(
                emoji: '🧍',
                title: l.postureWallStand,
                desc: l.postureWallStandDesc,
                divided: false,
              ),
              _ExerciseRow(
                emoji: '💪',
                title: l.postureChestOpener,
                desc: l.postureChestOpenerDesc,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PhotoFrame extends StatelessWidget {
  final String asset;
  final String label;
  final Color color;
  const _PhotoFrame({
    required this.asset,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: AspectRatio(
            aspectRatio: 0.82,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(color: const Color(0xFF15121F)),
                Image.asset(asset, fit: BoxFit.cover),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 34,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.65),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          label.toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 9.5,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
            color: color,
          ),
        ),
      ],
    );
  }
}
