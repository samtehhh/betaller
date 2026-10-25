import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/height_record.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/daily_plan.dart';
import '../utils/free_tier.dart';
import '../utils/haptics.dart';
import '../utils/localized_data.dart';
import '../widgets/discipline_widgets.dart';
import '../widgets/progress_locked_preview.dart';
import '../utils/text_case.dart';
import '../utils/num_format.dart';

/// The week as a recap: every day scored against the plan that day asked for,
/// the goals from the Discipline tab, the height against the potential, and
/// one thing to do better next week. Everything on it is measured.
class WeeklyReportScreen extends StatelessWidget {
  const WeeklyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;

    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final week = _WeekStats.of(provider, DateTime.now());
        // Opened from the Progress tab, which spends the free use. Once it is
        // spent the recap stays on top and the rest is a preview.
        final open = provider.canUseFree(FreeFeature.weeklyReport);
        final fmt = DateFormat('d MMM', locale);
        final dayName = DateFormat('EEEE', locale);

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: AppColors.scaffold,
                surfaceTintColor: Colors.transparent,
                leading: IconButton(
                  icon: const Icon(CupertinoIcons.back, color: Colors.white),
                  onPressed: () {
                    Haptics.tap();
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  l.weeklyReportTitle,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 40),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _RecapHero(
                      week: week,
                      range: l.pgWeekRange(
                        fmt.format(week.start),
                        fmt.format(week.days.last),
                      ),
                      streak: provider.streak,
                    ),
                    const SizedBox(height: 12),
                    if (!open)
                      ProgressLockedPreview(
                        title: l.ftReportLockedTitle,
                        body: l.ftReportLockedBody,
                        feature: FreeFeature.weeklyReport,
                        preview: _DaysCard(
                          week: week,
                          locale: locale,
                          bestDayName: week.bestDay == null
                              ? null
                              : dayName.format(week.days[week.bestDay!]),
                        ),
                      )
                    else ...[
                      _DaysCard(
                        week: week,
                        locale: locale,
                        bestDayName: week.bestDay == null
                            ? null
                            : dayName.format(week.days[week.bestDay!]),
                      ),
                      const SizedBox(height: 12),
                      _FocusCard(text: _focusLine(l, provider, week, dayName)),
                      const SizedBox(height: 12),
                      _HeightCard(provider: provider, week: week),
                      const SizedBox(height: 24),

                      // ── The same goals the Discipline tab tracks ──────────
                      SectionHeader(
                        icon: CupertinoIcons.checkmark_seal_fill,
                        title: l.disciplineWeek,
                        iconColor: AppColors.lime,
                      ),
                      const SizedBox(height: 12),
                      _Box(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 2),
                        child: Column(
                          children: [
                            GoalBar(
                              icon: CupertinoIcons.checkmark_seal_fill,
                              label: l.goalPerfectDays,
                              done: provider.perfectDaysInWeek(),
                              target: kWeeklyPerfectDays,
                              color: AppColors.primary,
                            ),
                            GoalBar(
                              icon: CupertinoIcons.bolt_fill,
                              label: l.goalWorkouts,
                              done: provider.workoutsInWeek(),
                              target: kWeeklyWorkouts,
                              color: AppColors.orange,
                            ),
                            GoalBar(
                              icon: CupertinoIcons.arrow_up_right_circle_fill,
                              label: l.goalMeasurement,
                              done: provider.measurementsInWeek(),
                              target: kWeeklyMeasurements,
                              color: AppColors.cyan,
                            ),
                          ],
                        ),
                      ),

                      // ── Habits: only what is logged, labelled as today ────
                      if (provider.todayWater > 0 ||
                          provider.todaySleep > 0) ...[
                        const SizedBox(height: 24),
                        SectionHeader(
                          icon: CupertinoIcons.drop_fill,
                          title: l.pgHabitsToday,
                          iconColor: AppColors.water,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            if (provider.todayWater > 0)
                              Expanded(
                                child: _HabitTile(
                                  icon: CupertinoIcons.drop_fill,
                                  color: AppColors.cyan,
                                  value: provider.units.waterValue(
                                    provider.todayWater,
                                  ),
                                  unit: provider.units.waterUnit,
                                  label: l.waterToday2,
                                ),
                              ),
                            if (provider.todayWater > 0 &&
                                provider.todaySleep > 0)
                              const SizedBox(width: 10),
                            if (provider.todaySleep > 0)
                              Expanded(
                                child: _HabitTile(
                                  icon: CupertinoIcons.moon_fill,
                                  color: AppColors.sleepColor,
                                  value: provider.todaySleep.fixedL(1),
                                  unit: l.hoursShort,
                                  label: l.sleepToday,
                                ),
                              ),
                          ],
                        ),
                      ],

                      // ── Level ─────────────────────────────────────────────
                      const SizedBox(height: 24),
                      SectionHeader(
                        icon: CupertinoIcons.bolt_fill,
                        title: l.xpAndLevel,
                        iconColor: AppColors.warning,
                      ),
                      const SizedBox(height: 12),
                      _LevelStrip(provider: provider),

                      // ── Challenges ────────────────────────────────────────
                      if (provider.activeChallenges.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        SectionHeader(
                          icon: CupertinoIcons.flag_fill,
                          title: l.activeChallenges,
                          iconColor: AppColors.pink,
                        ),
                        const SizedBox(height: 12),
                        _ChallengesBox(challenges: provider.activeChallenges),
                      ],
                    ],
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// One concrete thing for next week, from the goal that is furthest behind.
  static String _focusLine(
    AppLocalizations l,
    AppProvider provider,
    _WeekStats week,
    DateFormat dayName,
  ) {
    final perfect = provider.perfectDaysInWeek();
    final workouts = provider.workoutsInWeek();
    final measured = provider.measurementsInWeek();
    final gaps = <(double, String)>[
      (
        perfect / kWeeklyPerfectDays,
        l.pgFocusPlan(kWeeklyPerfectDays, perfect),
      ),
      (
        workouts / kWeeklyWorkouts,
        l.pgFocusWorkouts(kWeeklyWorkouts, workouts),
      ),
      (measured / kWeeklyMeasurements, l.pgFocusMeasure),
    ]..sort((a, b) => a.$1.compareTo(b.$1));
    if (gaps.first.$1 < 1) return gaps.first.$2;

    // Every goal met: point at the one day that was not full, if any.
    final weak = week.weakestDay;
    if (weak != null) return l.pgFocusKeepDay(dayName.format(week.days[weak]));
    return l.pgFocusKeep;
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  The numbers
// ═════════════════════════════════════════════════════════════════════════════

class _WeekStats {
  final DateTime start;
  final DateTime today;
  final List<DateTime> days;

  /// Completion per day, null for days still ahead.
  final List<double?> ratios;
  final double score;
  final int fullDays;
  final int? bestDay;
  final int? weakestDay;

  /// Last week's score, or null when there is no history for it.
  final double? lastWeekScore;

  const _WeekStats({
    required this.start,
    required this.today,
    required this.days,
    required this.ratios,
    required this.score,
    required this.fullDays,
    required this.bestDay,
    required this.weakestDay,
    required this.lastWeekScore,
  });

  static String _key(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  factory _WeekStats.of(AppProvider p, DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    final start = today.subtract(Duration(days: today.weekday - 1));
    final days = List.generate(7, (i) => start.add(Duration(days: i)));
    final ratios = [
      for (final d in days) d.isAfter(today) ? null : p.dayCompletionRatio(d),
    ];
    final scored = ratios.whereType<double>().toList();
    final score = scored.isEmpty
        ? 0.0
        : scored.reduce((a, b) => a + b) / scored.length;
    final fullDays = scored.where((r) => r >= 0.999).length;

    int? best;
    int? weakest;
    for (var i = 0; i < ratios.length; i++) {
      final r = ratios[i];
      if (r == null) continue;
      if (r > 0 && (best == null || r > ratios[best]!)) best = i;
      // Today is still in progress; it is not a weak day yet.
      if (days[i] != today &&
          r < 0.999 &&
          (weakest == null || r < ratios[weakest]!)) {
        weakest = i;
      }
    }

    final lastStart = start.subtract(const Duration(days: 7));
    final lastDays = List.generate(7, (i) => lastStart.add(Duration(days: i)));
    final hadHistory = lastDays.any(
      (d) => p.routineHistory.containsKey(_key(d)),
    );
    final lastWeekScore = hadHistory
        ? lastDays.map(p.dayCompletionRatio).reduce((a, b) => a + b) / 7
        : null;

    return _WeekStats(
      start: start,
      today: today,
      days: days,
      ratios: ratios,
      score: score,
      fullDays: fullDays,
      bestDay: best,
      weakestDay: weakest,
      lastWeekScore: lastWeekScore,
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Building blocks
// ═════════════════════════════════════════════════════════════════════════════

class _Box extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? borderColor;
  const _Box({
    required this.child,
    this.padding = const EdgeInsets.all(18),
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: borderColor ?? Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: child,
    );
  }
}

class _Eyebrow extends StatelessWidget {
  final String text;
  final Color? color;
  const _Eyebrow(this.text, {this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.upperIn(context),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.2,
        color: color ?? Colors.white.withValues(alpha: 0.5),
      ),
    );
  }
}

class _BigNumber extends StatelessWidget {
  final String value;
  final String unit;
  final double size;
  final Color color;
  const _BigNumber({
    required this.value,
    this.unit = '',
    this.size = 28,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: size,
              height: 1.05,
              fontWeight: FontWeight.w900,
              letterSpacing: size > 40 ? -2 : -1,
              color: color,
            ),
          ),
          if (unit.isNotEmpty) ...[
            const SizedBox(width: 3),
            Text(
              unit,
              style: TextStyle(
                fontSize: size * 0.42,
                fontWeight: FontWeight.w700,
                color: Colors.white.withValues(alpha: 0.45),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Hero
// ═════════════════════════════════════════════════════════════════════════════

class _RecapHero extends StatelessWidget {
  final _WeekStats week;
  final String range;
  final int streak;

  const _RecapHero({
    required this.week,
    required this.range,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pct = (week.score * 100).round();
    final champion = week.score >= 0.8;
    final color = champion
        ? AppColors.lime
        : week.score >= 0.5
        ? AppColors.primaryLight
        : AppColors.orange;
    final grade = week.score >= 0.8
        ? l.pgGradeGreat
        : week.score >= 0.6
        ? l.pgGradeGood
        : week.score >= 0.3
        ? l.pgGradeOk
        : l.pgGradeStart;
    final last = week.lastWeekScore;
    final delta = last == null ? null : ((week.score - last) * 100).round();

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: (champion ? AppColors.warning : color).withValues(alpha: 0.28),
        ),
        boxShadow: [
          // The one glow on this screen.
          BoxShadow(
            color: (champion ? AppColors.warning : color).withValues(
              alpha: 0.16,
            ),
            blurRadius: 32,
            offset: const Offset(0, 10),
            spreadRadius: -10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: _Eyebrow(range)),
              if (champion)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.emoji_events_rounded,
                        size: 14,
                        color: AppColors.warning,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        l.pgTopWeek,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: AppColors.warning,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 96,
                height: 96,
                child: CustomPaint(
                  painter: DisciplineRingPainter(
                    progress: week.score,
                    color: color,
                    segments: 28,
                  ),
                  child: Center(
                    child: Icon(
                      champion
                          ? Icons.emoji_events_rounded
                          : CupertinoIcons.chart_bar_alt_fill,
                      size: 34,
                      color: champion ? AppColors.warning : color,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BigNumber(
                      value: '$pct',
                      unit: '%',
                      size: 54,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l.weeklyScoreLabel,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.55),
                      ),
                    ),
                    if (delta != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        l.pgVsLastWeek('${delta > 0 ? '+' : ''}$delta%'),
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w800,
                          color: delta > 0
                              ? AppColors.lime
                              : delta < 0
                              ? AppColors.orange
                              : Colors.white.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            grade,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.6,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _HeroStat(
                  icon: CupertinoIcons.checkmark_seal_fill,
                  iconColor: AppColors.lime,
                  value: '${week.fullDays}',
                  unit: '/7',
                  label: l.pgDaysCompleted,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _HeroStat(
                  icon: CupertinoIcons.flame_fill,
                  iconColor: AppColors.orange,
                  value: '$streak',
                  unit: '',
                  label: l.pgDayStreak,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String unit;
  final String label;

  const _HeroStat({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.unit,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(height: 6),
          _BigNumber(value: value, unit: unit, size: 30),
          const SizedBox(height: 2),
          Text(
            label,
            maxLines: 3,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Day by day
// ═════════════════════════════════════════════════════════════════════════════

class _DaysCard extends StatelessWidget {
  final _WeekStats week;
  final String locale;
  final String? bestDayName;

  const _DaysCard({
    required this.week,
    required this.locale,
    required this.bestDayName,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final label = DateFormat('E', locale);
    final reduce = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    return _Box(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: _Eyebrow(l.weeklyDailyCompletion)),
              if (bestDayName != null)
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        CupertinoIcons.star_fill,
                        size: 12,
                        color: AppColors.warning,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          l.pgBestDay(bestDayName!),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
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
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (var i = 0; i < week.days.length; i++)
                Expanded(
                  child: _DayColumn(
                    label: label.format(week.days[i]),
                    ratio: week.ratios[i],
                    isToday: week.days[i] == week.today,
                    isBest: week.bestDay == i,
                    animate: !reduce,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DayColumn extends StatelessWidget {
  final String label;
  final double? ratio;
  final bool isToday;
  final bool isBest;
  final bool animate;

  const _DayColumn({
    required this.label,
    required this.ratio,
    required this.isToday,
    required this.isBest,
    required this.animate,
  });

  @override
  Widget build(BuildContext context) {
    const barHeight = 96.0;
    final future = ratio == null;
    final value = ratio ?? 0;
    final full = value >= 0.999;
    final color = full ? AppColors.lime : AppColors.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
            child: isBest
                ? const Icon(
                    CupertinoIcons.star_fill,
                    size: 12,
                    color: AppColors.warning,
                  )
                : full
                ? const Icon(
                    CupertinoIcons.checkmark_alt,
                    size: 13,
                    color: AppColors.lime,
                  )
                : null,
          ),
          const SizedBox(height: 4),
          Container(
            height: barHeight,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: future ? 0.03 : 0.06),
              borderRadius: BorderRadius.circular(10),
              border: isToday
                  ? Border.all(
                      color: AppColors.primaryLight.withValues(alpha: 0.6),
                    )
                  : null,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: animate ? 0 : value, end: value),
                duration: animate
                    ? const Duration(milliseconds: 700)
                    : Duration.zero,
                curve: Curves.easeOutCubic,
                builder: (context, v, _) => FractionallySizedBox(
                  heightFactor: future ? 0 : math.max(v, 0.03),
                  widthFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: full ? 0.9 : 0.75),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            future ? ' ' : '${(value * 100).round()}%',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.clip,
            softWrap: false,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isToday ? FontWeight.w800 : FontWeight.w600,
              color: future
                  ? Colors.white.withValues(alpha: 0.25)
                  : isToday
                  ? AppColors.primaryLight
                  : Colors.white.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Next week focus
// ═════════════════════════════════════════════════════════════════════════════

class _FocusCard extends StatelessWidget {
  final String text;
  const _FocusCard({required this.text});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return _Box(
      borderColor: AppColors.primary.withValues(alpha: 0.35),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              CupertinoIcons.scope,
              size: 20,
              color: AppColors.primaryLight,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Eyebrow(l.pgNextWeekFocus, color: AppColors.primaryLight),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.4,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
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
//  Height against the potential
// ═════════════════════════════════════════════════════════════════════════════

class _HeightCard extends StatelessWidget {
  final AppProvider provider;
  final _WeekStats week;
  const _HeightCard({required this.provider, required this.week});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final records = [...provider.heightRecords]
      ..sort((a, b) => a.date.compareTo(b.date));
    bool inWeek(HeightRecord r) {
      final d = DateTime.tryParse(r.date);
      return d != null && !d.isBefore(week.start) && !d.isAfter(week.today);
    }

    final thisWeek = records.where(inWeek).toList();
    final before = records.where((r) {
      final d = DateTime.tryParse(r.date);
      return d != null && d.isBefore(week.start);
    }).toList();

    // This week's change: the latest reading this week against the last one
    // before it (or the first one this week, for a brand-new user).
    double? change;
    if (thisWeek.isNotEmpty) {
      final base = before.isNotEmpty
          ? before.last.height
          : (thisWeek.length >= 2 ? thisWeek.first.height : null);
      if (base != null) change = thisWeek.last.height - base;
    }

    final latest = provider.latestHeight;
    final potential = provider.potentialHeight;
    final start = records.isNotEmpty ? records.first.height : latest;
    final toGo = potential - latest;
    final span = potential - start;
    final progress = span <= 0
        ? 1.0
        : ((latest - start) / span).clamp(0.0, 1.0);

    final unit = provider.heightUnit;
    String num1(double cm) => provider.heightNumber(cm).fixedL(1);

    return _Box(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Eyebrow(l.pgHeightThisWeek),
          const SizedBox(height: 8),
          if (change != null) ...[
            _BigNumber(
              value: '${change > 0.04 ? '+' : ''}${num1(change)}',
              unit: unit,
              size: 40,
              color: change > 0.04 ? AppColors.lime : Colors.white,
            ),
            const SizedBox(height: 2),
            Text(
              l.pgHeightNow(provider.formatHeight(latest)),
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ] else ...[
            Text(
              thisWeek.isEmpty ? l.pgNoMeasurementWeek : l.pgFirstMeasurement,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              l.pgHeightNow(provider.formatHeight(latest)),
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ],
          if (provider.profile != null) ...[
            const SizedBox(height: 18),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: Colors.white.withValues(alpha: 0.07),
                valueColor: const AlwaysStoppedAnimation(AppColors.lime),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    l.pgStartedAt(provider.formatHeight(start)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.5,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    l.pgPotentialAt(provider.formatHeight(potential)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.lime,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              toGo > 0.04
                  ? l.pgToPotential('${num1(toGo)} $unit')
                  : l.pgPotentialReached,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Habits, level, challenges
// ═════════════════════════════════════════════════════════════════════════════

class _HabitTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;
  final String unit;
  final String label;

  const _HabitTile({
    required this.icon,
    required this.color,
    required this.value,
    required this.unit,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return _Box(
      padding: const EdgeInsets.fromLTRB(16, 14, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(height: 6),
          _BigNumber(value: value, unit: unit, size: 28),
          const SizedBox(height: 2),
          Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelStrip extends StatelessWidget {
  final AppProvider provider;
  const _LevelStrip({required this.provider});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final ratio = provider.xpForNextLevel == 0
        ? 0.0
        : (provider.totalXP / provider.xpForNextLevel).clamp(0.0, 1.0);

    return _Box(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  l.lvl('${provider.level}'),
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w900,
                    color: AppColors.warning,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  localizedLevelTitle(l, provider.levelTitle),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${provider.totalXP} XP',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 7,
              backgroundColor: Colors.white.withValues(alpha: 0.07),
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.warning,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              l.xpToNextLevel('${provider.xpForNextLevel - provider.totalXP}'),
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(alpha: 0.45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChallengesBox extends StatelessWidget {
  final List<Map<String, dynamic>> challenges;
  const _ChallengesBox({required this.challenges});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final completed = challenges.where((c) => c['completed'] == true).length;
    return _Box(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.nOfMCompleted('$completed', '${challenges.length}'),
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withValues(alpha: 0.45),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 14),
          for (final c in challenges)
            GoalBar(
              icon: c['completed'] == true
                  ? CupertinoIcons.checkmark_alt_circle_fill
                  : CupertinoIcons.flag_fill,
              label: localizedChallengeTitle(l, c['id'] as String? ?? ''),
              done: ((c['progress'] as num?) ?? 0).toInt(),
              target: ((c['target'] as num?) ?? 1).toInt(),
              color: AppColors.pink,
            ),
        ],
      ),
    );
  }
}
