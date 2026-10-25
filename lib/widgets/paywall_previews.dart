import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/user_profile.dart';
import '../providers/app_provider.dart';
import '../utils/betaller_score.dart';
import '../utils/calculations.dart';
import '../utils/constants.dart';
import '../utils/daily_targets.dart';
import '../utils/num_format.dart';
import '../utils/text_case.dart';
import 'discipline_widgets.dart' show kProgramLevelMeta;
import 'height_silhouette.dart';
import 'plan_widgets.dart';
import 'potential_chart.dart';
import 'program_widgets.dart';
import 'score_ring.dart';
import 'today_targets_card.dart';

// ═════════════════════════════════════════════════════════════════════════════
//  Paywall tour screens
//
//  Built from the app's own v3 widgets (the silhouette, the height chart, the
//  targets grid, the program header, the score ring) so the tour is the
//  product, not a drawing of it. The first screens are the user's own: the
//  paywall opens right after onboarding, so their profile already exists.
//  Anything that is not theirs is plausible demo data, and says "Example".
//
//  Each screen is authored against a fixed design box and scaled into the
//  phone mockup like a screenshot. On a small phone the mockup shows only the
//  top 190 or so design points, so every screen puts its hero first.
//
//  The tour advances every 2.8 s, so the screens are cheap: still posters,
//  no video, and nothing that animates when a page comes back.
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

/// One slide: the screen it shows, the accent that lights the paywall around
/// it, and the headline the slide is sold under.
class PaywallPreview {
  final String id;
  final Color accent;
  const PaywallPreview({required this.id, required this.accent});

  String title(AppLocalizations l) => switch (id) {
        'potential' => l.pwSlidePotentialTitle,
        'today' => l.pwSlideTodayTitle,
        'program' => l.pwSlideProgramTitle,
        'nutrition' => l.pwSlideNutritionTitle,
        'chart' => l.pwSlideChartTitle,
        'score' => l.pwSlideScoreTitle,
        _ => l.pwSlidePostureTitle,
      };

  String caption(AppLocalizations l) => switch (id) {
        'potential' => l.pwSlidePotentialCaption,
        'today' => l.pwSlideTodayCaption,
        'program' => l.pwSlideProgramCaption,
        'nutrition' => l.pwSlideNutritionCaption,
        'chart' => l.pwSlideChartCaption,
        'score' => l.pwSlideScoreCaption,
        _ => l.pwSlidePostureCaption,
      };

  /// The screen itself, authored at [kPreviewDesignSize].
  Widget screen(AppLocalizations l) => switch (id) {
        'potential' => _PotentialPreview(l: l),
        'today' => _TodayPreview(l: l),
        'program' => _ProgramPreview(l: l),
        'nutrition' => _NutritionPreview(l: l),
        'chart' => _ChartPreview(l: l),
        'score' => _ScorePreview(l: l),
        _ => _PosturePreview(l: l),
      };
}

/// The pitch, in order: the user's own potential first, then the daily plan
/// and the program that work towards it, then the tools that measure it.
/// Every slide keeps a colour of its own, which the CTA tweens to.
const List<PaywallPreview> kPaywallPreviews = [
  PaywallPreview(id: 'potential', accent: AppColors.lime),
  PaywallPreview(id: 'today', accent: AppColors.cyan),
  PaywallPreview(id: 'program', accent: AppColors.warning),
  PaywallPreview(id: 'nutrition', accent: AppColors.orange),
  PaywallPreview(id: 'chart', accent: Color(0xFF6366F1)),
  PaywallPreview(id: 'score', accent: AppColors.primaryBright),
  PaywallPreview(id: 'posture', accent: AppColors.pink),
];

// ═════════════════════════════════════════════════════════════════════════════
//  The user, when there is one
// ═════════════════════════════════════════════════════════════════════════════

/// The demo person every "Example" screen shows: 15, 164 cm, the same person
/// the store screenshots use.
const double _kDemoNow = 164.0;
const double _kDemoPotential = 175.3;
const double _kDemoDream = 182.0;

UserProfile _demoProfile() {
  final now = DateTime.now();
  final birth = DateTime(now.year - 15, 3, 10);
  return UserProfile(
    name: '',
    gender: 'male',
    birthDate: '${birth.year}-03-10',
    currentHeight: _kDemoNow,
    weight: 54,
    fatherHeight: 181,
    motherHeight: 166,
  );
}

/// The app's provider, or null where the preview is built without one (tests,
/// the walkthrough).
AppProvider? _providerOf(BuildContext context) {
  try {
    return Provider.of<AppProvider>(context, listen: false);
  } catch (_) {
    return null;
  }
}

bool _plausibleHeight(double cm) => cm.isFinite && cm >= 100 && cm <= 230;

/// The user's profile when every number on it is one a person can have;
/// otherwise null, and the screen shows the example instead of a number that
/// looks wrong.
UserProfile? _validProfile(AppProvider? p) {
  final profile = p?.profile;
  if (profile == null) return null;
  if (DateTime.tryParse(profile.birthDate) == null) return null;
  final age = profile.age;
  if (age < 5 || age > 80) return null;
  if (!_plausibleHeight(profile.currentHeight)) return null;
  if (!profile.weight.isFinite || profile.weight < 20 || profile.weight > 250) {
    return null;
  }
  return profile;
}

String _formatHeight(AppProvider? p, double cm) =>
    p?.formatHeight(cm) ?? '${cm.fixedL(1)} cm';

// ═════════════════════════════════════════════════════════════════════════════
//  Shared chrome
// ═════════════════════════════════════════════════════════════════════════════

/// The frame every preview sits in: cards from the top, no title bar and no
/// tab bar. The slide's own headline names the screen, and a small phone only
/// has room for the hero.
class _Screen extends StatelessWidget {
  final List<Widget> children;
  const _Screen({required this.children});

  @override
  Widget build(BuildContext context) {
    // Not interactive: a tap belongs to the carousel, never to a fake button.
    // Laid out unbounded and cropped by the phone's own frame, so no
    // translation can make a card overflow the design box.
    return IgnorePointer(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}

/// Marks numbers that are not the user's own.
class _ExampleTag extends StatelessWidget {
  final AppLocalizations l;
  const _ExampleTag({required this.l});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
      ),
      child: Text(
        l.pwExample,
        maxLines: 1,
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w800,
          color: Colors.white.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}

/// The small caps label a card is headed with, and what sits at its end.
class _Eyebrow extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color color;
  final Widget? trailing;
  const _Eyebrow(
    this.text, {
    this.icon,
    this.color = AppColors.primaryLight,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 15, color: color),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            text.upperIn(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
        ),
        if (trailing != null) ...[const SizedBox(width: 8), trailing!],
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  1. Your potential: the home screen's hero, with the user's own numbers
// ═════════════════════════════════════════════════════════════════════════════

class _PotentialPreview extends StatelessWidget {
  final AppLocalizations l;
  const _PotentialPreview({required this.l});

  @override
  Widget build(BuildContext context) {
    final p = _providerOf(context);
    final profile = _validProfile(p);
    var now = _kDemoNow;
    var pot = _kDemoPotential;
    double? dream = _kDemoDream;
    var mine = false;
    if (profile != null) {
      final n = p!.latestHeight;
      final t = p.potentialHeight;
      // Never a number that looks wrong: a missing measurement reads as 0,
      // and a potential under today or 40 cm above it is not one to sell.
      if (_plausibleHeight(n) && _plausibleHeight(t) && t >= n && t - n <= 40) {
        now = n;
        pot = t;
        dream = p.dreamHeight;
        mine = true;
      }
    }
    if (dream != null && !_plausibleHeight(dream)) dream = null;
    // A value never breaks from its unit ("175,3" on one line, "cm" alone
    // on the next).
    final nowText = _formatHeight(p, now).replaceAll(' ', ' ');
    final potText = _formatHeight(p, pot).replaceAll(' ', ' ');

    return _Screen(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1C1240), Color(0xFF0C0A16)],
            ),
            border: Border.all(color: AppColors.lime.withValues(alpha: 0.22)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The line first and the figures right under it: a small phone
              // shows little more than the top of this card.
              Text(
                mine
                    ? l.pwYouLine(nowText, potText)
                    : l.pwExampleLine(nowText, potText),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.2,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              HeightSilhouette(
                current: now,
                potential: pot,
                dream: dream,
                format: (cm) => _formatHeight(p, cm),
                height: 360,
                // Still: the tour comes back to this page every 20 seconds,
                // and a rise (with its haptic) on every return is noise.
                animate: false,
                female: mine ? null : false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  2. Today's plan, every move with its video poster
// ═════════════════════════════════════════════════════════════════════════════

class _TodayPreview extends StatelessWidget {
  final AppLocalizations l;
  const _TodayPreview({required this.l});

  @override
  Widget build(BuildContext context) {
    final p = _providerOf(context);
    final profile = _validProfile(p);
    final workout = profile == null
        ? ''
        : p!.onboardingAnswers['weeklyWorkout'] as String? ?? '';
    final plan = WeeklyPlan.forAnswers(
      weeklyWorkout: workout,
      age: profile?.age ?? 16,
    );
    final level =
        p == null ? 0 : currentProgramLevel(p.completedProgramDays);

    // Today's training, or the next day that has one when today is a rest
    // day: the slide sells the workouts, and a single yoga flow does not.
    final today = DateTime.now();
    var offset = 0;
    for (var i = 0; i < 7; i++) {
      final d = plan.days[(today.weekday - 1 + i) % 7];
      if (d.movesAt(level).length >= 3) {
        offset = i;
        break;
      }
    }
    final date = today.add(Duration(days: offset));
    final day = plan.days[date.weekday - 1];
    final moves = day.movesAt(level);
    final minutes = moves.fold<int>(0, (s, m) => s + m.minutes);
    final locale = Localizations.localeOf(context).languageCode;

    return _Screen(
      children: [
        PlanCard(
          padding: const EdgeInsets.fromLTRB(6, 14, 14, 16),
          borderColor: AppColors.primary.withValues(alpha: 0.28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planKindLabel(l, day.kind),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.7,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // One line for the day and the dose, so the first poster
                    // still fits on a small phone.
                    Text(
                      '${DateFormat.EEEE(locale).format(date)} · '
                      '${l.plWorkoutMeta(moves.length, minutes)}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              for (final m in moves.take(4))
                _VideoMoveRow(
                  routineId: m.routineId,
                  title: moveTitle(l, m.routineId),
                  subtitle: '${doseLabel(l, m)} · ${l.plDoseMinutes(m.minutes)}',
                ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: PlanButton(
                    label: l.plStartWorkout,
                    icon: CupertinoIcons.play_fill,
                    color: AppColors.primary,
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// A plan row as My Plan draws it, with the play mark the detail screen's
/// video opens from.
class _VideoMoveRow extends StatelessWidget {
  final String routineId;
  final String title;
  final String subtitle;
  const _VideoMoveRow({
    required this.routineId,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const PlanCheck(done: false),
          const SizedBox(width: 4),
          SizedBox(
            width: 56,
            height: 68,
            child: Stack(
              fit: StackFit.expand,
              children: [
                MoveThumb(routineId: routineId, width: 56, height: 68),
                Center(
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withValues(alpha: 0.45),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Icon(
                        CupertinoIcons.play_fill,
                        size: 11,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.5,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Icon(
            CupertinoIcons.chevron_right,
            size: 14,
            color: Colors.white.withValues(alpha: 0.25),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  3. Discipline: the 70-day program, from where the user stands
// ═════════════════════════════════════════════════════════════════════════════

class _ProgramPreview extends StatelessWidget {
  final AppLocalizations l;
  const _ProgramPreview({required this.l});

  @override
  Widget build(BuildContext context) {
    final p = _providerOf(context);
    final completed = p?.completedProgramDays ?? const <int>{};
    final current = (p?.currentProgramDay ?? 0).clamp(0, kProgramDays - 1);
    final level = currentProgramLevel(completed);
    final color = kProgramLevelMeta[level].$2;

    return _Screen(
      children: [
        ProgramJourneyHeader(
          completed: completed,
          current: current,
          level: level,
        ),
        const SizedBox(height: 18),
        PlanSectionLabel(
          icon: CupertinoIcons.calendar_today,
          title: l.plLevelWeek,
          trailing: l.levelLabel(level + 1),
          color: color,
        ),
        const SizedBox(height: 10),
        _LevelWeekStrip(level: level, current: current, completed: completed),
        const SizedBox(height: 18),
        PlanSectionLabel(
          icon: CupertinoIcons.chart_bar_alt_fill,
          title: l.plProgressionTitle,
        ),
        const SizedBox(height: 10),
        ProgressionTable(
          level: level,
          ids: const ['plank', 'dead_hang_active', 'squats'],
        ),
      ],
    );
  }
}

/// The current level's seven days, as the Program tab's week strip draws
/// them: done, today, locked.
class _LevelWeekStrip extends StatelessWidget {
  final int level;
  final int current;
  final Set<int> completed;
  const _LevelWeekStrip({
    required this.level,
    required this.current,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    final color = kProgramLevelMeta[level].$2;
    final plan = WeeklyPlan.forAnswers();
    return PlanCard(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
      child: Row(
        children: [
          for (var d = 0; d < kProgramLevelDays; d++)
            Expanded(
              child: Builder(builder: (context) {
                final index = level * kProgramLevelDays + d;
                final done = completed.contains(index);
                final isCurrent = index == current;
                final locked = index > current;
                return Column(
                  children: [
                    Container(
                      height: 38,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: done
                            ? color
                            : isCurrent
                                ? color.withValues(alpha: 0.16)
                                : Colors.white.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: done || isCurrent
                              ? color
                              : Colors.white.withValues(alpha: 0.08),
                          width: isCurrent ? 1.6 : 1,
                        ),
                      ),
                      child: Center(
                        child: done
                            ? Icon(
                                Icons.check_rounded,
                                size: 18,
                                color: color.computeLuminance() > 0.5
                                    ? const Color(0xFF07050F)
                                    : Colors.white,
                              )
                            : Icon(
                                locked
                                    ? CupertinoIcons.lock_fill
                                    : planKindIcon(plan.programDay(index).kind),
                                size: locked ? 12 : 16,
                                color: isCurrent
                                    ? color
                                    : Colors.white.withValues(alpha: 0.35),
                              ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: isCurrent
                            ? color
                            : Colors.white.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                );
              }),
            ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  4. Nutrition: the day's targets, worked out from the profile
// ═════════════════════════════════════════════════════════════════════════════

class _NutritionPreview extends StatelessWidget {
  final AppLocalizations l;
  const _NutritionPreview({required this.l});

  @override
  Widget build(BuildContext context) {
    final p = _providerOf(context);
    final own = _validProfile(p);
    final profile = own ?? _demoProfile();
    final workout = own == null
        ? '3-5'
        : p!.onboardingAnswers['weeklyWorkout'] as String? ?? '';

    return _Screen(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
          decoration: BoxDecoration(
            color: AppColors.cardFill,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: AppColors.orange.withValues(alpha: 0.22)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l.targetsTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (own == null) ...[
                    const SizedBox(width: 8),
                    _ExampleTag(l: l),
                  ],
                ],
              ),
              const SizedBox(height: 12),
              // The numbers straight under the title, where a small phone
              // still shows them; what they are worked out from goes last.
              TodayTargetsGrid(profile: profile, weeklyWorkout: workout),
              const SizedBox(height: 12),
              Text(
                l.targetsSubtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  5. The height chart, with the path to the potential
// ═════════════════════════════════════════════════════════════════════════════

class _ChartPreview extends StatelessWidget {
  final AppLocalizations l;
  const _ChartPreview({required this.l});

  /// The user's own chart when every point on it is a plausible height.
  static PotentialChartData? _own(AppProvider? p) {
    if (_validProfile(p) == null) return null;
    final data = PotentialChartData.fromProvider(p!);
    if (data == null || data.curve.isEmpty) return null;
    if (!_plausibleHeight(data.potential)) return null;
    if (!data.history.every((e) => _plausibleHeight(e.value))) return null;
    return data;
  }

  static PotentialChartData _demo(AppProvider? p) {
    final now = DateTime.now();
    final birth = DateTime(now.year - 15, 3, 10);
    const past = {11: 141.0, 12: 147.0, 13: 153.0, 14: 159.0};
    return PotentialChartData(
      history: [
        for (final e in past.entries)
          MapEntry(DateTime(birth.year + e.key, birth.month, birth.day), e.value),
        MapEntry(now, _kDemoNow),
      ],
      pastCount: past.length,
      curve: Calculations.projectPotential(
        from: now,
        startHeight: _kDemoNow,
        potential: _kDemoPotential,
        age: 15,
      ),
      potential: _kDemoPotential,
      dream: _kDemoDream,
      format: (cm) => _formatHeight(p, cm),
      axisFormat: p != null && p.useImperial ? p.formatHeightCompact : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = _providerOf(context);
    final own = _own(p);
    final data = own ?? _demo(p);

    return _Screen(
      children: [
        PlanCard(
          padding: const EdgeInsets.fromLTRB(14, 16, 16, 16),
          borderColor: const Color(0xFF6366F1).withValues(alpha: 0.28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: _Eyebrow(
                  l.heightChart,
                  icon: CupertinoIcons.graph_square_fill,
                  color: AppColors.primaryLight,
                  trailing: own == null ? _ExampleTag(l: l) : null,
                ),
              ),
              const SizedBox(height: 16),
              PotentialChartView(data: data, height: 250),
            ],
          ),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  6. The BeTaller Score: the ring, and the signals that build it
// ═════════════════════════════════════════════════════════════════════════════

class _ScorePreview extends StatelessWidget {
  final AppLocalizations l;
  const _ScorePreview({required this.l});

  /// An example week. The total is these signals' weighted mean, worked out
  /// below, so the ring and the bars cannot disagree.
  static const _example = {
    ScoreFactor.training: 80,
    ScoreFactor.consistency: 72,
    ScoreFactor.sleep: 64,
    ScoreFactor.hydration: 60,
    ScoreFactor.nutrition: 50,
  };

  @override
  Widget build(BuildContext context) {
    var sum = 0;
    var weight = 0;
    _example.forEach((f, s) {
      sum += s * kScoreWeights[f]!;
      weight += kScoreWeights[f]!;
    });
    final total = (sum / weight).round();
    final tier = BetallerScore.tierFor(total);
    final color = scoreTierColor(tier);
    final next = BetallerScore.nextTierAt(total);

    return _Screen(
      children: [
        PlanCard(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l.anScoreLabel.upperIn(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.3,
                        color: Colors.white.withValues(alpha: 0.45),
                      ),
                    ),
                  ),
                  _ExampleTag(l: l),
                  const SizedBox(width: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: color.withValues(alpha: 0.4)),
                    ),
                    child: Text(
                      scoreTierName(l, tier),
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 164,
                height: 164,
                child: CustomPaint(
                  painter: ScoreRingPainter(progress: total / 100, color: color),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$total',
                          style: const TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: -2.2,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '/ 100',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withValues(alpha: 0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                next == null
                    ? l.anTopTier
                    : l.anNextTier(
                        next - total,
                        scoreTierName(l, BetallerScore.tierFor(next)),
                      ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 14),
              for (final e in _example.entries)
                _FactorBar(l: l, factor: e.key, score: e.value),
            ],
          ),
        ),
      ],
    );
  }
}

/// One signal: its icon, name and weight, its score, and the bar.
class _FactorBar extends StatelessWidget {
  final AppLocalizations l;
  final ScoreFactor factor;
  final int score;
  const _FactorBar({
    required this.l,
    required this.factor,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final color = scoreFactorColor(factor);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(scoreFactorIcon(factor), size: 14, color: color),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: scoreFactorName(l, factor),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: '  ${l.anWeight(kScoreWeights[factor]!)}',
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(alpha: 0.38),
                            ),
                          ),
                        ]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$score',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: score / 100,
                    minHeight: 4,
                    backgroundColor: Colors.white.withValues(alpha: 0.07),
                    valueColor: AlwaysStoppedAnimation(color),
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

// ═════════════════════════════════════════════════════════════════════════════
//  7. Posture: the check's score card, and the progress photos
// ═════════════════════════════════════════════════════════════════════════════

class _PosturePreview extends StatelessWidget {
  final AppLocalizations l;
  const _PosturePreview({required this.l});

  /// The posture check's own colour scale.
  static Color _scoreColor(int s) {
    if (s >= 80) return AppColors.lime;
    if (s >= 60) return AppColors.primaryLight;
    if (s >= 45) return AppColors.orange;
    return AppColors.error;
  }

  static String _interpretation(AppLocalizations l, int s) {
    if (s >= 80) return l.postureExcellent;
    if (s >= 60) return l.postureGood;
    if (s >= 40) return l.postureNeedsWork;
    return l.posturePoor;
  }

  @override
  Widget build(BuildContext context) {
    final areas = [
      (l.pgAreaHead, 90),
      (l.pgAreaShoulders, 65),
      (l.pgAreaLowerBack, 90),
    ];
    final total =
        (areas.fold<int>(0, (s, a) => s + a.$2) / areas.length).round();
    final weakest = areas.reduce((a, b) => a.$2 <= b.$2 ? a : b);
    final color = _scoreColor(total);

    return _Screen(
      children: [
        PlanCard(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
          child: Column(
            children: [
              _Eyebrow(l.pgYourPosture, trailing: _ExampleTag(l: l)),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 124,
                    height: 124,
                    child: CustomPaint(
                      painter:
                          ScoreRingPainter(progress: total / 100, color: color),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$total',
                              style: TextStyle(
                                fontSize: 40,
                                height: 1,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -1.5,
                                color: color,
                              ),
                            ),
                            const SizedBox(height: 3),
                            // Inside the ring's inner edge in every language.
                            SizedBox(
                              width: 76,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  l.pgOutOf100,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withValues(alpha: 0.5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            _interpretation(l, total),
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.6,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l.pgStartWith(weakest.$1),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.35,
                            color: Colors.white.withValues(alpha: 0.65),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  for (var i = 0; i < areas.length; i++) ...[
                    if (i > 0) const SizedBox(width: 8),
                    Expanded(
                      child: _AreaMini(
                        label: areas[i].$1,
                        score: areas[i].$2,
                        color: _scoreColor(areas[i].$2),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        PlanCard(
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
          borderColor: AppColors.pink.withValues(alpha: 0.22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Eyebrow(
                l.beforeAfter,
                icon: CupertinoIcons.camera_viewfinder,
                color: AppColors.pink,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _PhotoFrame(
                      asset: 'assets/demo/posture_before.png',
                      label: l.beforeLabel,
                      color: Colors.white.withValues(alpha: 0.45),
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
      ],
    );
  }
}

/// One area of the posture check: its name, score and bar.
class _AreaMini extends StatelessWidget {
  final String label;
  final int score;
  final Color color;
  const _AreaMini({
    required this.label,
    required this.score,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              label,
              maxLines: 1,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$score',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.8,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: score / 100,
              minHeight: 4,
              backgroundColor: Colors.white.withValues(alpha: 0.07),
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ],
      ),
    );
  }
}

/// A progress photo, as the photos screen frames one.
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
            child: ColoredBox(
              color: const Color(0xFF15121F),
              child: Image.asset(
                asset,
                fit: BoxFit.cover,
                // Drawn at a third of its size inside the mockup.
                cacheWidth: 360,
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          label.upperIn(context),
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
