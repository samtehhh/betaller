import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/daily_plan.dart';
import '../utils/localized_data.dart';
import '../widgets/discipline_widgets.dart';

/// The week, actually measured over the week: every day is scored against the
/// plan that day asked for, and the goals match the ones on the Disiplin tab.
class WeeklyReportScreen extends StatelessWidget {
  const WeeklyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;

    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final weekStart = today.subtract(Duration(days: today.weekday - 1));
        final days = List.generate(7, (i) => weekStart.add(Duration(days: i)));

        final ratios = [
          for (final d in days)
            d.isAfter(today) ? null : provider.dayCompletionRatio(d)
        ];
        final scored = ratios.whereType<double>().toList();
        final weekScore = scored.isEmpty
            ? 0.0
            : scored.reduce((a, b) => a + b) / scored.length;

        // height change inside this week
        final weekRecords = provider.heightRecords.where((r) {
          final d = DateTime.tryParse(r.date);
          return d != null && !d.isBefore(weekStart) && !d.isAfter(today);
        }).toList()
          ..sort((a, b) => a.date.compareTo(b.date));
        double? heightChange;
        if (weekRecords.length >= 2) {
          heightChange = double.parse(
            (weekRecords.last.height - weekRecords.first.height)
                .toStringAsFixed(1),
          );
        }

        final challenges = provider.activeChallenges;
        final completedChallenges =
            challenges.where((c) => c['completed'] == true).length;

        final fmt = DateFormat('d MMM', locale);

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
                  onPressed: () => Navigator.pop(context),
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
                    // ── The week at a glance ──────────────────────────────
                    _WeekHeader(
                      score: weekScore,
                      range: '${fmt.format(weekStart)} – ${fmt.format(days.last)}',
                      streak: provider.streak,
                      heightChange: heightChange,
                    ),
                    const SizedBox(height: 20),

                    // ── Day by day ────────────────────────────────────────
                    SectionHeader(
                      icon: CupertinoIcons.calendar,
                      title: l.weeklyDailyCompletion,
                    ),
                    const SizedBox(height: 12),
                    _DayStrip(
                      days: days,
                      ratios: ratios,
                      today: today,
                      locale: locale,
                    ),
                    const SizedBox(height: 22),

                    // ── The same goals the Disiplin tab tracks ────────────
                    SectionHeader(
                      icon: CupertinoIcons.checkmark_seal_fill,
                      title: l.disciplineWeek,
                      iconColor: AppColors.lime,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 2),
                      decoration: BoxDecoration(
                        color: AppColors.cardFill,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.06)),
                      ),
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
                    const SizedBox(height: 22),

                    // ── Habits, averaged over the days that have happened ──
                    SectionHeader(
                      icon: CupertinoIcons.drop_fill,
                      title: l.weeklyHabits,
                      iconColor: AppColors.water,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 2),
                      decoration: BoxDecoration(
                        color: AppColors.cardFill,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.06)),
                      ),
                      child: Column(
                        children: [
                          _HabitRow(
                            icon: CupertinoIcons.drop_fill,
                            label: l.waterToday2,
                            value: '${provider.todayWater.toStringAsFixed(1)} L',
                            progress:
                                (provider.todayWater / 2.5).clamp(0.0, 1.0),
                            color: AppColors.water,
                          ),
                          _HabitRow(
                            icon: CupertinoIcons.moon_fill,
                            label: l.sleepToday,
                            value:
                                '${provider.todaySleep.toStringAsFixed(1)} ${l.hoursShort}',
                            progress:
                                (provider.todaySleep / 9.0).clamp(0.0, 1.0),
                            color: AppColors.sleep,
                          ),
                          _HabitRow(
                            icon: CupertinoIcons.checkmark_seal_fill,
                            label: l.routineCompletion,
                            value:
                                '${(provider.routineProgress * 100).round()}%',
                            progress: provider.routineProgress,
                            color: AppColors.lime,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),

                    // ── Level ─────────────────────────────────────────────
                    SectionHeader(
                      icon: CupertinoIcons.bolt_fill,
                      title: l.xpAndLevel,
                      iconColor: AppColors.cyan,
                    ),
                    const SizedBox(height: 12),
                    _LevelStrip(provider: provider),

                    // ── Challenges ────────────────────────────────────────
                    if (challenges.isNotEmpty) ...[
                      const SizedBox(height: 22),
                      SectionHeader(
                        icon: CupertinoIcons.flag_fill,
                        title: l.activeChallenges,
                        iconColor: AppColors.pink,
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
                        decoration: BoxDecoration(
                          color: AppColors.cardFill,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.06)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l.nOfMCompleted(
                                  '$completedChallenges', '${challenges.length}'),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withValues(alpha: 0.40),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 14),
                            ...challenges.map((c) {
                              final target = (c['target'] as num?) ?? 1;
                              final progress = (c['progress'] as num?) ?? 0;
                              final completed = c['completed'] == true;
                              return GoalBar(
                                icon: completed
                                    ? CupertinoIcons.checkmark_alt_circle_fill
                                    : CupertinoIcons.flag_fill,
                                label: localizedChallengeTitle(
                                    l, c['id'] as String? ?? ''),
                                done: progress.toInt(),
                                target: target.toInt(),
                                color: AppColors.pink,
                              );
                            }),
                          ],
                        ),
                      ),
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
}

// ═════════════════════════════════════════════════════════════════════════════

class _WeekHeader extends StatelessWidget {
  final double score;
  final String range;
  final int streak;
  final double? heightChange;

  const _WeekHeader({
    required this.score,
    required this.range,
    required this.streak,
    required this.heightChange,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final color = score >= 0.8
        ? AppColors.success
        : score >= 0.5
            ? AppColors.primary
            : AppColors.orange;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: color.withValues(alpha: 0.22)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.14),
            blurRadius: 28,
            offset: const Offset(0, 8),
            spreadRadius: -8,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 92,
            height: 92,
            child: CustomPaint(
              painter: DisciplineRingPainter(
                  progress: score, color: color, segments: 28),
              child: Center(
                child: Text(
                  '${(score * 100).round()}%',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                    color: color,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.weeklyScoreLabel.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.3,
                    color: Colors.white.withValues(alpha: 0.40),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  range,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _MiniStat(
                      icon: CupertinoIcons.flame_fill,
                      color: AppColors.orange,
                      value: '$streak',
                      label: l.streakLabel,
                    ),
                    const SizedBox(width: 16),
                    _MiniStat(
                      icon: CupertinoIcons.arrow_up,
                      color: AppColors.cyan,
                      value: heightChange == null
                          ? '—'
                          : '${heightChange! > 0 ? '+' : ''}$heightChange',
                      label: l.heightLabel,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;
  final String label;
  const _MiniStat({
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.40),
            ),
          ),
        ),
      ],
    );
  }
}

/// Seven columns, one per day, each as tall as that day's completion.
class _DayStrip extends StatelessWidget {
  final List<DateTime> days;
  final List<double?> ratios;
  final DateTime today;
  final String locale;

  const _DayStrip({
    required this.days,
    required this.ratios,
    required this.today,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final label = DateFormat('E', locale);
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 0; i < days.length; i++)
            Expanded(
              child: _DayColumn(
                label: label.format(days[i]),
                ratio: ratios[i],
                isToday: days[i] == today,
                isFuture: days[i].isAfter(today),
              ),
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
  final bool isFuture;

  const _DayColumn({
    required this.label,
    required this.ratio,
    required this.isToday,
    required this.isFuture,
  });

  @override
  Widget build(BuildContext context) {
    const barHeight = 84.0;
    final value = ratio ?? 0;
    final full = value >= 0.999;
    final color = full
        ? AppColors.success
        : isToday
            ? AppColors.primary
            : AppColors.primary.withValues(alpha: 0.7);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            ratio == null ? '' : '${(value * 100).round()}',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: color.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: barHeight,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(9),
              border: isToday
                  ? Border.all(color: AppColors.primary.withValues(alpha: 0.5))
                  : null,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: value),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutCubic,
                builder: (context, v, _) => FractionallySizedBox(
                  heightFactor: math.max(v, 0.02),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [color, color.withValues(alpha: 0.55)],
                      ),
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: v > 0.05
                          ? [
                              BoxShadow(
                                  color: color.withValues(alpha: 0.35),
                                  blurRadius: 10)
                            ]
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: isToday ? FontWeight.w800 : FontWeight.w600,
              color: isFuture
                  ? Colors.white.withValues(alpha: 0.22)
                  : isToday
                      ? AppColors.primary
                      : Colors.white.withValues(alpha: 0.45),
            ),
          ),
        ],
      ),
    );
  }
}

class _HabitRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final double progress;
  final Color color;

  const _HabitRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.72),
                  ),
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Colors.white.withValues(alpha: 0.07),
              valueColor: AlwaysStoppedAnimation<Color>(color),
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

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  gradient: AppColors.gradientCyan,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  l.lvl('${provider.level}'),
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
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
                    fontSize: 14.5,
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
                  color: Colors.white.withValues(alpha: 0.45),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 7,
              backgroundColor: Colors.white.withValues(alpha: 0.07),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.cyan),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              l.xpToNextLevel('${provider.xpForNextLevel - provider.totalXP}'),
              style: TextStyle(
                fontSize: 11.5,
                color: Colors.white.withValues(alpha: 0.40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
