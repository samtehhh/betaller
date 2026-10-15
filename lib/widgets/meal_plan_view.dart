import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';
import '../utils/daily_targets.dart';
import '../utils/meal_plan.dart';
import 'plan_widgets.dart';
import '../utils/text_case.dart';

String _fmt(BuildContext context, num v) => NumberFormat.decimalPattern(
  Localizations.localeOf(context).languageCode,
).format(v.round());

/// The day's numbers: protein big, then calcium, vitamin D, water, zinc,
/// magnesium and energy, each with its unit.
class NutritionTargetsHeader extends StatelessWidget {
  final DailyTargets targets;
  final int meals;
  const NutritionTargetsHeader({
    super.key,
    required this.targets,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final t = targets;
    final tiles = <(IconData, Color, String, String, String)>[
      (
        Icons.egg_alt_rounded,
        AppColors.primaryLight,
        _fmt(context, t.calciumMg),
        'mg',
        l.targetCalcium,
      ),
      (
        CupertinoIcons.sun_max_fill,
        AppColors.warning,
        _fmt(context, t.vitaminDIu),
        'IU',
        l.targetVitaminD,
      ),
      (
        CupertinoIcons.drop_fill,
        AppColors.cyan,
        t.waterL.toStringAsFixed(1),
        'L',
        l.targetWater,
      ),
      (Icons.shield_rounded, AppColors.lime, '${t.zincMg}', 'mg', l.plZinc),
      (
        Icons.bolt_rounded,
        AppColors.pink,
        '${t.magnesiumMg}',
        'mg',
        l.plMagnesium,
      ),
      (
        CupertinoIcons.flame_fill,
        AppColors.orange,
        _fmt(context, t.kcal),
        'kcal',
        l.plEnergy,
      ),
    ];
    return PlanCard(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      borderColor: AppColors.orange.withValues(alpha: 0.22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.plTodaysTargets,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            l.plTargetsBasis,
            style: TextStyle(
              fontSize: 12.5,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.targetProtein.upperIn(context),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1,
                        color: AppColors.orange.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(height: 4),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: PlanNumber(
                        '${t.proteinG}',
                        'g',
                        size: 40,
                        color: AppColors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: AppColors.orange.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  l.plProteinSplit(meals, t.proteinPerMealG),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: AppColors.orange,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          LayoutBuilder(
            builder: (context, box) {
              final w = (box.maxWidth - 16) / 3;
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final (icon, color, value, unit, label) in tiles)
                    SizedBox(
                      width: w,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 8, 10),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.07),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(icon, size: 15, color: color),
                            const SizedBox(height: 6),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: PlanNumber(value, unit, size: 17),
                            ),
                            const SizedBox(height: 2),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                label,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w700,
                                  color: color.withValues(alpha: 0.9),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

/// One meal: what to eat, how much, and what it adds up to.
class MealCard extends StatelessWidget {
  final Meal meal;
  final bool eaten;
  final VoidCallback? onToggleEaten;
  const MealCard({
    super.key,
    required this.meal,
    this.eaten = false,
    this.onToggleEaten,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return PlanCard(
      padding: const EdgeInsets.fromLTRB(16, 12, 8, 14),
      borderColor: eaten
          ? AppColors.success.withValues(alpha: 0.35)
          : Colors.white.withValues(alpha: 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.orange.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  mealSlotIcon(meal.slot),
                  size: 18,
                  color: AppColors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mealSlotLabel(l, meal.slot),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      '${meal.time} · ${l.plMealGoal(meal.proteinTarget)}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ),
              ),
              if (onToggleEaten != null)
                Semantics(
                  label: eaten ? l.plEaten : l.plMarkEaten,
                  button: true,
                  child: PlanCheck(done: eaten, onTap: onToggleEaten),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              children: [
                for (final item in meal.items)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: foodLabel(l, item.food.id),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: '  ${amountLabel(l, item)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white.withValues(alpha: 0.5),
                                  ),
                                ),
                              ],
                            ),
                            style: const TextStyle(fontSize: 13.5, height: 1.3),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${item.protein.round()} g',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w800,
                            color: AppColors.orange.withValues(alpha: 0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 6),
                Divider(height: 1, color: Colors.white.withValues(alpha: 0.07)),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '= ${l.plMealSum(meal.protein.round(), _fmt(context, meal.calcium), _fmt(context, meal.kcal))}',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.35,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
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

/// The day's sums against the targets, and what to do about energy.
class DayTotalCard extends StatelessWidget {
  final DayMenu menu;
  final DailyTargets targets;
  const DayTotalCard({super.key, required this.menu, required this.targets});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    Widget bar(
      String label,
      double value,
      int target,
      Color color,
      String unit,
    ) {
      final ratio = target == 0 ? 0.0 : (value / target).clamp(0.0, 1.0);
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.75),
                    ),
                  ),
                ),
                Text(
                  '${_fmt(context, value)} / ${_fmt(context, target)} $unit',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: ratio,
                minHeight: 6,
                backgroundColor: Colors.white.withValues(alpha: 0.07),
                valueColor: AlwaysStoppedAnimation(color),
              ),
            ),
          ],
        ),
      );
    }

    return PlanCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.plPlanTotal,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          bar(
            l.targetProtein,
            menu.protein,
            targets.proteinG,
            AppColors.orange,
            'g',
          ),
          bar(
            l.targetCalcium,
            menu.calcium,
            targets.calciumMg,
            AppColors.primaryLight,
            'mg',
          ),
          bar(l.plZinc, menu.zinc, targets.zincMg, AppColors.lime, 'mg'),
          bar(
            l.plMagnesium,
            menu.magnesium,
            targets.magnesiumMg,
            AppColors.pink,
            'mg',
          ),
          const SizedBox(height: 2),
          Text(
            l.plFillEnergy(
              _fmt(context, menu.kcal),
              _fmt(context, targets.kcal),
            ),
            style: TextStyle(
              fontSize: 12,
              height: 1.4,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}

/// Monday to Sunday, one block per day, today outlined.
class WeekMenuView extends StatelessWidget {
  final List<DayMenu> week;
  const WeekMenuView({super.key, required this.week});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final todayIdx = DateTime.now().weekday - 1;
    final monday = DateTime.now().subtract(Duration(days: todayIdx));
    return Column(
      children: [
        for (var d = 0; d < week.length; d++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: PlanCard(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              borderColor: d == todayIdx
                  ? AppColors.orange.withValues(alpha: 0.5)
                  : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          toBeginningOfSentenceCase(
                                DateFormat.EEEE(
                                  locale,
                                ).format(monday.add(Duration(days: d))),
                              ) ??
                              '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '${week[d].protein.round()} g · ${_fmt(context, week[d].calcium)} mg',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  for (final m in week[d].meals)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${mealSlotLabel(l, m.slot)}: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ),
                            TextSpan(
                              text: m.items
                                  .map(
                                    (i) =>
                                        '${foodLabel(l, i.food.id)} ${amountLabel(l, i)}',
                                  )
                                  .join(', '),
                            ),
                          ],
                        ),
                        style: TextStyle(
                          fontSize: 12.5,
                          height: 1.35,
                          color: Colors.white.withValues(alpha: 0.55),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
