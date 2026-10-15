import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/daily_targets.dart';
import '../utils/localized_data.dart';

/// "Today, for you": the day's concrete numbers (protein in grams, calcium,
/// vitamin D, water, sleep, movement) and what today's training is. Every
/// number comes from the user's own profile.
class TodayTargetsCard extends StatelessWidget {
  final AppProvider provider;
  const TodayTargetsCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final profile = provider.profile;
    if (profile == null) return const SizedBox.shrink();
    final workout = provider.onboardingAnswers['weeklyWorkout'] as String? ?? '';
    final plan = WeeklyPlan.forAnswers(weeklyWorkout: workout, age: profile.age);
    final today = plan.today;
    final t = DailyTargets.forProfile(
      profile,
      weeklyWorkout: workout,
      meals: profile.mealTimes.length,
      trainingDay: today.kind != PlanDayKind.rest,
    );
    final nf = NumberFormat.decimalPattern(
      Localizations.localeOf(context).languageCode,
    );

    final tiles = [
      _Tile(CupertinoIcons.flame_fill, AppColors.orange, '${t.proteinG}', 'g',
          l.targetProtein,
          '${profile.mealTimes.length.clamp(2, 6)} × ${t.proteinPerMealG} g'),
      _Tile(Icons.egg_alt_rounded, Colors.white, nf.format(t.calciumMg), 'mg',
          l.targetCalcium, ' '),
      _Tile(CupertinoIcons.sun_max_fill, AppColors.warning,
          nf.format(t.vitaminDIu), 'IU', l.targetVitaminD, ' '),
      _Tile(CupertinoIcons.drop_fill, AppColors.cyan,
          t.waterL.toStringAsFixed(1), 'L', l.targetWater, ' '),
      _Tile(CupertinoIcons.moon_fill, AppColors.sleepColor,
          t.sleepH.toStringAsFixed(t.sleepH % 1 == 0 ? 0 : 1), l.unitHours,
          l.targetSleep, ' '),
      _Tile(CupertinoIcons.bolt_fill, AppColors.lime, '${today.minutes}',
          l.unitMinutes, l.targetMove, planKindLabel(l, today.kind)),
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.targetsTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l.targetsSubtitle,
            style: TextStyle(
              fontSize: 12.5,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 14),
          LayoutBuilder(
            builder: (context, box) {
              final w = (box.maxWidth - 16) / 3;
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final tile in tiles) SizedBox(width: w, child: tile),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          WeeklyPlanStrip(plan: plan),
        ],
      ),
    );
  }
}

IconData planKindIcon(PlanDayKind k) => switch (k) {
      PlanDayKind.strength => Icons.fitness_center_rounded,
      PlanDayKind.jump => Icons.directions_run_rounded,
      PlanDayKind.mobility => Icons.self_improvement_rounded,
      PlanDayKind.sport => Icons.sports_basketball_rounded,
      PlanDayKind.posture => Icons.accessibility_new_rounded,
      PlanDayKind.rest => Icons.bedtime_rounded,
    };

class _Tile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;
  final String unit;
  final String label;
  final String? note;
  const _Tile(this.icon, this.color, this.value, this.unit, this.label,
      this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.4,
                  ),
                ),
                TextSpan(
                  text: ' $unit',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
                ),
              ]),
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 2),
          // Shrinks a long label ("Entraînement", "Vitamina D") on a 320 pt
          // phone instead of cutting it to "Entraîne...".
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              label,
              maxLines: 1,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color.withValues(alpha: 0.9),
              ),
            ),
          ),
          if (note != null)
            Text(
              note!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white.withValues(alpha: 0.45),
              ),
            ),
        ],
      ),
    );
  }
}

/// Seven days, today lit up; tap a day to see what it holds.
class WeeklyPlanStrip extends StatefulWidget {
  final WeeklyPlan plan;
  const WeeklyPlanStrip({super.key, required this.plan});

  @override
  State<WeeklyPlanStrip> createState() => _WeeklyPlanStripState();
}

class _WeeklyPlanStripState extends State<WeeklyPlanStrip> {
  late int _selected = DateTime.now().weekday - 1;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final todayIdx = DateTime.now().weekday - 1;
    final monday = DateTime.now().subtract(Duration(days: todayIdx));
    final day = widget.plan.days[_selected];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.planWeekTitle(widget.plan.trainingDays),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: Colors.white.withValues(alpha: 0.85),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            for (var i = 0; i < 7; i++)
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selected = i),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: i == _selected
                          ? AppColors.lime.withValues(alpha: 0.16)
                          : Colors.white.withValues(alpha: 0.04),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: i == todayIdx
                            ? AppColors.lime.withValues(alpha: 0.7)
                            : Colors.transparent,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          DateFormat.E(locale)
                              .format(monday.add(Duration(days: i))),
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withValues(alpha: 0.6),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Icon(
                          planKindIcon(widget.plan.days[i].kind),
                          size: 16,
                          color: widget.plan.days[i].kind == PlanDayKind.rest
                              ? Colors.white.withValues(alpha: 0.35)
                              : AppColors.lime,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          '${planKindLabel(l, day.kind)} · ${day.minutes} ${l.unitMinutes}',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          day.routineIds
              .map((id) => localizedRoutine(l, id)['title'] ?? id)
              .join(', '),
          style: TextStyle(
            fontSize: 12,
            height: 1.4,
            color: Colors.white.withValues(alpha: 0.55),
          ),
        ),
      ],
    );
  }
}
