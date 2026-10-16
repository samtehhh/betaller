import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/routine.dart';
import '../models/user_profile.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/daily_plan.dart';
import '../utils/daily_targets.dart';
import '../utils/free_tier.dart';
import '../utils/haptics.dart';
import '../utils/localized_data.dart';
import '../utils/meal_plan.dart';
import '../widgets/discipline_widgets.dart';
import '../widgets/free_tier_widgets.dart';
import '../widgets/meal_plan_view.dart';
import '../widgets/plan_widgets.dart';
import '../widgets/program_widgets.dart';
import '../widgets/premium_paywall.dart';
import '../widgets/today_targets_card.dart' show planKindIcon;
import '../widgets/tour_keys.dart';
import 'custom_routine_builder_screen.dart';
import 'exercise_detail_screen.dart';
import 'nutrition_screen.dart';
import 'recipe_generator_screen.dart';
import 'workout_player_screen.dart';
import '../utils/text_case.dart';
import '../utils/num_format.dart';

/// My Plan: today's plan, the 70-day program and nutrition built around the
/// user's own daily targets. Everything here is readable on the free tier;
/// ticking it off is free on the first day, the guided workout once (see
/// lib/utils/free_tier.dart).
class RoutinesScreen extends StatefulWidget {
  const RoutinesScreen({super.key});

  @override
  State<RoutinesScreen> createState() => RoutinesScreenState();
}

class RoutinesScreenState extends State<RoutinesScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _lastTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        if (_tabController.index != _lastTab) {
          _lastTab = _tabController.index;
          Haptics.select();
        }
      });
  }

  /// Jumps straight to one of the three in-screen tabs (0=Today,
  /// 1=Discipline, 2=Nutrition) without the sliding animation. Used by the
  /// app walkthrough, which switches tabs itself rather than a tap.
  void goToSubTab(int index) {
    _lastTab = index;
    _tabController.index = index;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: Column(
            children: [
              _buildHeader(context, provider),
              _buildTabBar(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _TodayTab(provider: provider),
                    _ProgramTab(provider: provider),
                    _NutritionTab(provider: provider),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                l.navRoutines,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -1.0,
                ),
              ),
            ),
            if (provider.streak > 0)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: AppColors.warning.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('🔥', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 4),
                    Text(
                      '${provider.streak}',
                      style: const TextStyle(
                        color: AppColors.warning,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    final l = AppLocalizations.of(context)!;
    final labels = [l.disciplineToday, l.disciplineTitle, l.nutrition];
    final colors = [AppColors.primary, AppColors.primary, AppColors.orange];
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      child: AnimatedBuilder(
        animation: _tabController,
        builder: (_, _) {
          final selected = _tabController.index;
          return Container(
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.cardFill,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
            ),
            child: Row(
              children: List.generate(labels.length, (i) {
                final active = i == selected;
                return Expanded(
                  child: Semantics(
                    selected: active,
                    button: true,
                    child: GestureDetector(
                      onTap: () => _tabController.animateTo(i),
                      child: AnimatedContainer(
                        duration: MediaQuery.of(context).disableAnimations
                            ? Duration.zero
                            : const Duration(milliseconds: 200),
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: active ? colors[i] : Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                labels[i],
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 13.5,
                                  fontWeight:
                                      active ? FontWeight.w800 : FontWeight.w600,
                                  color: active
                                      ? Colors.white
                                      : Colors.white.withValues(alpha: 0.45),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════
//  Shared helpers
// ══════════════════════════════════════════════════════════════════════════

/// Who the numbers are for. Onboarding always sets a profile; this only
/// keeps a screen from going blank if it was ever missing.
UserProfile _profileOf(AppProvider p) =>
    p.profile ??
    UserProfile(
      name: '',
      gender: 'male',
      birthDate: '2009-01-01',
      currentHeight: 165,
      weight: 55,
      fatherHeight: 175,
      motherHeight: 162,
    );

DailyTargets _targetsOf(AppProvider p) {
  final profile = _profileOf(p);
  return DailyTargets.forProfile(
    profile,
    weeklyWorkout: p.weeklyWorkout,
    meals: profile.mealTimes.length,
    trainingDay: p.todayPlanDay.kind != PlanDayKind.rest,
  );
}

void _tick(BuildContext context, AppProvider p, String id) {
  final r = p.allRoutines.where((x) => x.id == id).firstOrNull;
  if (r == null) return;
  // Unticking is always allowed; ticking is the metered action.
  if (!r.completed && !guardFree(context, FreeFeature.planTicks)) return;
  final wasAllDone = p.allRoutinesCompleted;
  if (r.completed) {
    Haptics.select();
  } else {
    Haptics.success();
  }
  p.toggleRoutine(id);
  if (!wasAllDone && p.allRoutinesCompleted) Haptics.celebrate();
}

void _openDetail(BuildContext context, Routine r) {
  Haptics.tap();
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (_) => ExerciseDetailScreen(routine: r)),
  );
}

/// Shows a day's moves in a sheet: what a day of the plan really holds.
void _showDaySheet(
  BuildContext context, {
  required String title,
  required String subtitle,
  required List<MoveDose> moves,
}) {
  Haptics.tap();
  final l = AppLocalizations.of(context)!;
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.surfaceDark,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (ctx) => SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(ctx).size.height * 0.8,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.55),
                ),
              ),
              const SizedBox(height: 12),
              for (final m in moves)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      MoveThumb(routineId: m.routineId, width: 42, height: 52),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              moveTitle(l, m.routineId),
                              style: const TextStyle(
                                fontSize: 14.5,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${doseLabel(l, m)} · ${l.plDoseMinutes(m.minutes)}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
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
  );
}

// ══════════════════════════════════════════════════════════════════════════
//  TODAY
// ══════════════════════════════════════════════════════════════════════════

class _TodayTab extends StatelessWidget {
  final AppProvider provider;
  const _TodayTab({required this.provider});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    // Today is the program's day: the same moves and doses the Discipline
    // tab shows, so there is one workout a day, not two.
    final plan = provider.weeklyPlan;
    final level = currentProgramLevel(provider.completedProgramDays);
    final day = provider.todayPlanDay;
    final doses = {for (final m in provider.todayMoves) m.routineId: m};
    final today = provider.todayRoutines;
    final training = today.where((r) => doses.containsKey(r.id)).toList();
    final habits = today.where((r) => !doses.containsKey(r.id)).toList();
    final moves = [for (final r in training) doses[r.id]!];
    final minutes = moves.fold<int>(0, (s, m) => s + m.minutes);
    final t = _targetsOf(provider);
    final ticksLocked = !provider.canUseFree(FreeFeature.planTicks);

    void startWorkout() {
      if (!guardFree(context, FreeFeature.workout)) return;
      Haptics.tap();
      Navigator.push(
        context,
        CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) => WorkoutPlayerScreen(
            moves: moves,
            title: planKindLabel(l, day.kind),
            color: AppColors.primary,
            alreadyDone: {
              for (final r in training)
                if (r.completed) r.id,
            },
            onMoveDone: (id) {
              final r = provider.todayRoutines
                  .where((x) => x.id == id)
                  .firstOrNull;
              if (r != null && !r.completed) provider.toggleRoutine(id);
            },
          ),
        ),
      );
    }

    String habitNote(Routine r) => switch (r.id) {
          'protein' => l.plHabitProtein(t.proteinG),
          'water' => l.plHabitWater(t.waterL.fixedL(1)),
          'quality_sleep' => l.plHabitSleep(
              t.sleepH.fixedL(t.sleepH % 1 == 0 ? 0 : 1)),
          _ => localizedRoutine(l, r.id)['description'] ?? r.description,
        };

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
      children: [
        KeyedSubtree(
          key: TourKeys.planTodayHero,
          child: _TodayHero(
            provider: provider,
            day: day,
            moves: moves,
            minutes: minutes,
            trainingDone: training.where((r) => r.completed).length,
            onStart: moves.isEmpty ? null : startWorkout,
            onCompleteDay:
                provider.canCompleteProgramDay(provider.currentProgramDay)
                    ? () => completeProgramDay(context, provider)
                    : null,
          ),
        ),
        const SizedBox(height: 20),
        PlanSectionLabel(
          icon: planKindIcon(day.kind),
          title: '${l.plTraining} · ${planKindLabel(l, day.kind)}',
          trailing: l.plDoneCount(
            training.where((r) => r.completed).length,
            training.length,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            _lockedIf(
              ticksLocked,
              title: l.ftContinuePro,
              body: l.ftPlanLocked,
              feature: FreeFeature.planTicks,
              child: PlanCard(
              padding: const EdgeInsets.fromLTRB(6, 8, 14, 8),
              child: Column(
                children: [
                  for (final r in training)
                    PlanItemRow(
                      routineId: r.id,
                      title: moveTitle(l, r.id),
                      subtitle:
                          '${doseLabel(l, doses[r.id]!)} · ${l.plDoseMinutes(doses[r.id]!.minutes)}',
                      icon: r.icon,
                      done: r.completed,
                      locked: ticksLocked,
                      onToggle: () => _tick(context, provider, r.id),
                      onOpen: () => _openDetail(context, r),
                    ),
                ],
              ),
            ),
            ),
            const SizedBox(height: 20),
            PlanSectionLabel(
              icon: CupertinoIcons.heart_fill,
              color: AppColors.lime,
              title: l.plHabits,
              trailing: l.plDoneCount(
                habits.where((r) => r.completed).length,
                habits.length,
              ),
            ),
            const SizedBox(height: 10),
            _lockedIf(
              ticksLocked,
              title: l.ftContinuePro,
              body: l.ftPlanLocked,
              feature: FreeFeature.planTicks,
              child: PlanCard(
              padding: const EdgeInsets.fromLTRB(6, 8, 14, 8),
              child: Column(
                children: [
                  for (final r in habits)
                    PlanItemRow(
                      routineId: r.id,
                      title: moveTitle(l, r.id),
                      subtitle: habitNote(r),
                      icon: r.icon,
                      done: r.completed,
                      showThumb: false,
                      accent: AppColors.lime,
                      locked: ticksLocked,
                      onToggle: () => _tick(context, provider, r.id),
                      onOpen: () => _openDetail(context, r),
                    ),
                ],
              ),
            ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _CustomRoutines(provider: provider),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlanSectionLabel(
              icon: CupertinoIcons.calendar,
              title: l.disciplineWeek,
            ),
            const SizedBox(height: 10),
            _WeekCalendar(provider: provider, plan: plan, level: level),
            const SizedBox(height: 10),
            _GoalGroup(
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
          ],
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlanSectionLabel(
              icon: CupertinoIcons.calendar_circle_fill,
              title: l.disciplineMonth,
            ),
            const SizedBox(height: 10),
            _GoalGroup(
              children: [
                GoalBar(
                  icon: CupertinoIcons.camera_fill,
                  label: l.goalPhoto,
                  done: provider.photosInMonth(),
                  target: kMonthlyPhotos,
                  color: AppColors.lime,
                ),
                GoalBar(
                  icon: CupertinoIcons.person_crop_rectangle,
                  label: l.goalPostureCheck,
                  done: provider.postureChecksInMonth(),
                  target: kMonthlyPostureChecks,
                  color: AppColors.pink,
                ),
                GoalBar(
                  icon: CupertinoIcons.chart_bar_alt_fill,
                  label: l.goalMeasurement,
                  done: provider.measurementsInMonth(),
                  target: kMonthlyMeasurements,
                  color: AppColors.sleep,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

/// x/y done, the day's minutes, the streak, and the button that starts it.
class _TodayHero extends StatelessWidget {
  final AppProvider provider;
  final PlanDay day;
  final List<MoveDose> moves;
  final int minutes;
  final int trainingDone;
  final VoidCallback? onStart;

  /// Set when every move of today's program day is ticked and the day can
  /// be completed; the hero's button then completes it.
  final VoidCallback? onCompleteDay;

  const _TodayHero({
    required this.provider,
    required this.day,
    required this.moves,
    required this.minutes,
    required this.trainingDone,
    required this.onStart,
    this.onCompleteDay,
  });

  static const _tierKeys = [
    'spark',
    'steady',
    'sharp',
    'solid',
    'relentless',
    'unbroken',
    'legend',
  ];

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final done = provider.completedRoutineCount;
    final total = provider.todayRoutineTotal;
    final streak = provider.streak;
    final tierIdx = disciplineTierIndex(streak);
    final tier = kDisciplineTiers[tierIdx];
    final allMovesDone = moves.isNotEmpty && trainingDone >= moves.length;
    final locale = Localizations.localeOf(context).languageCode;

    final startLabel = allMovesDone
        ? l.plWorkoutDoneToday
        : trainingDone > 0
            ? l.plContinueWorkout
            : l.plStartWorkout;
    final workoutLocked = !provider.canUseFree(FreeFeature.workout);
    final dayChip = FreeChip.forFeature(context, FreeFeature.planTicks);

    return PlanCard(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      borderColor: AppColors.primary.withValues(alpha: 0.28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 86,
                height: 86,
                child: CustomPaint(
                  painter: DisciplineRingPainter(
                    progress: total == 0 ? 0 : done / total,
                    color: AppColors.lime,
                    segments: total.clamp(4, 24),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$done/$total',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.8,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Icon(
                          done >= total && total > 0
                              ? CupertinoIcons.checkmark_alt
                              : CupertinoIcons.sun_max_fill,
                          size: 13,
                          color: AppColors.lime,
                        ),
                      ],
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
                      (DateFormat.EEEE(locale).format(DateTime.now()))
                          .upperIn(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.3,
                        color: Colors.white.withValues(alpha: 0.42),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      planKindLabel(l, day.kind),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.8,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l.plWorkoutMeta(moves.length, minutes),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        PlanChip(
                          text: '🔥 ${l.disciplineStreakDays(streak)}',
                          color: AppColors.warning,
                        ),
                        PlanChip(
                          text: disciplineTierName(l, _tierKeys[tierIdx]),
                          color: tier.color,
                        ),
                        ?dayChip,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (day.kind == PlanDayKind.rest) ...[
            const SizedBox(height: 12),
            Text(
              l.plRestDayNote,
              style: TextStyle(
                fontSize: 13,
                height: 1.35,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ],
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: allMovesDone && onCompleteDay != null
                ? PlanButton(
                    label: l.disciplineCompleteDay,
                    icon: CupertinoIcons.checkmark_seal_fill,
                    color: AppColors.success,
                    onTap: onCompleteDay,
                  )
                : PlanButton(
                    label: startLabel,
                    icon: allMovesDone
                        ? CupertinoIcons.checkmark_seal_fill
                        : workoutLocked
                        ? CupertinoIcons.lock_fill
                        : CupertinoIcons.play_fill,
                    color: allMovesDone ? AppColors.success : AppColors.primary,
                    outlined: allMovesDone,
                    badge: allMovesDone
                        ? null
                        : FreeChip.forFeature(
                            context,
                            FreeFeature.workout,
                            onFill: true,
                          ),
                    // Everything done: nothing left to start.
                    onTap: allMovesDone ? null : onStart,
                  ),
          ),
        ],
      ),
    );
  }
}

/// Seven days of the plan: what each day is, and how much of it was done.
class _WeekCalendar extends StatelessWidget {
  final AppProvider provider;
  final WeeklyPlan plan;
  final int level;
  const _WeekCalendar({
    required this.provider,
    required this.plan,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final now = DateTime.now();
    final todayIdx = now.weekday - 1;
    final monday =
        DateTime(now.year, now.month, now.day).subtract(Duration(days: todayIdx));
    return PlanCard(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
      child: Row(
        children: [
          for (var i = 0; i < 7; i++)
            Expanded(
              child: Builder(builder: (context) {
                final date = monday.add(Duration(days: i));
                final pd = plan.days[i];
                final ratio =
                    i <= todayIdx ? provider.dayCompletionRatio(date) : 0.0;
                final isToday = i == todayIdx;
                final full = ratio >= 1;
                final color = full ? AppColors.lime : AppColors.primary;
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _showDaySheet(
                    context,
                    title: toBeginningOfSentenceCase(
                            DateFormat.EEEE(locale).format(date)) ??
                        '',
                    subtitle:
                        '${planKindLabel(l, pd.kind)} · ${l.plDoseMinutes(pd.minutesAt(level))}',
                    moves: pd.movesAt(level),
                  ),
                  child: Column(
                    children: [
                      Text(
                        DateFormat.E(locale).format(date),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w800,
                          color: isToday
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 34,
                        height: 34,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CircularProgressIndicator(
                              value: ratio,
                              strokeWidth: 3,
                              backgroundColor: isToday
                                  ? AppColors.primary.withValues(alpha: 0.35)
                                  : Colors.white.withValues(alpha: 0.08),
                              valueColor: AlwaysStoppedAnimation(color),
                            ),
                            Center(
                              child: Icon(
                                full
                                    ? Icons.check_rounded
                                    : planKindIcon(pd.kind),
                                size: 15,
                                color: full
                                    ? AppColors.lime
                                    : pd.kind == PlanDayKind.rest
                                        ? Colors.white.withValues(alpha: 0.35)
                                        : isToday
                                            ? Colors.white
                                            : Colors.white
                                                .withValues(alpha: 0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          l.plDoseMinutes(pd.minutesAt(level)),
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withValues(alpha: 0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
        ],
      ),
    );
  }
}

class _GoalGroup extends StatelessWidget {
  final List<Widget> children;
  const _GoalGroup({required this.children});

  @override
  Widget build(BuildContext context) {
    return PlanCard(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 2),
      child: Column(children: children),
    );
  }
}

/// The user's own routines, built in the routine builder (premium).
class _CustomRoutines extends StatelessWidget {
  final AppProvider provider;
  const _CustomRoutines({required this.provider});

  void _create(BuildContext context) {
    Haptics.tap();
    if (!provider.isPremium) {
      showPremiumPaywall(context);
      return;
    }
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => const CustomRoutineBuilderScreen()),
    );
  }

  Future<void> _confirmDelete(BuildContext context, Routine r) async {
    Haptics.warning();
    final l = AppLocalizations.of(context)!;
    final ok = await showCupertinoDialog<bool>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(l.plDeleteRoutineQ(r.title)),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l.cancel),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l.delete),
          ),
        ],
      ),
    );
    if (ok == true) provider.deleteCustomRoutine(r.id);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final ids = provider.customRoutines.map((m) => m['id']).toSet();
    final mine = provider.allRoutines.where((r) => ids.contains(r.id)).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: PlanSectionLabel(
                icon: CupertinoIcons.person_crop_circle_fill,
                title: l.plYourRoutines,
                trailing: mine.isEmpty
                    ? null
                    : l.plDoneCount(
                        mine.where((r) => r.completed).length, mine.length),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        PlanCard(
          padding: EdgeInsets.fromLTRB(mine.isEmpty ? 16 : 6, 8, 14, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (mine.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 12),
                  child: Text(
                    l.plCustomEmpty,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.35,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              for (final r in mine)
                PlanItemRow(
                  routineId: r.id,
                  title: r.title,
                  subtitle: [
                    localizedDuration(l, r.duration),
                    if (r.setsReps.isNotEmpty) r.setsReps,
                  ].join(' · '),
                  icon: r.icon,
                  done: r.completed,
                  accent: AppColors.primaryLight,
                  locked: !provider.canUseFree(FreeFeature.planTicks),
                  onToggle: () => _tick(context, provider, r.id),
                  onOpen: () => _openDetail(context, r),
                  onLongPress: () => _confirmDelete(context, r),
                ),
              if (mine.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 0, 10),
                  child: Text(
                    l.plHoldToDelete,
                    style: TextStyle(
                      fontSize: 11.5,
                      color: Colors.white.withValues(alpha: 0.38),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(left: mine.isEmpty ? 0 : 10),
                child: SizedBox(
                  width: double.infinity,
                  child: PlanButton(
                    label: l.plNewRoutine,
                    icon: provider.isPremium
                        ? CupertinoIcons.add
                        : CupertinoIcons.lock_fill,
                    color: provider.isPremium
                        ? AppColors.primaryLight
                        : AppColors.warning,
                    outlined: true,
                    onTap: () => _create(context),
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

// ══════════════════════════════════════════════════════════════════════════
//  DISCIPLINE: the 70-day program
// ══════════════════════════════════════════════════════════════════════════

class _ProgramTab extends StatelessWidget {
  final AppProvider provider;
  const _ProgramTab({required this.provider});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final plan = provider.weeklyPlan;
    final completed = provider.completedProgramDays;
    final current = provider.currentProgramDay;
    final finished = current >= kProgramDays;
    final level = currentProgramLevel(completed);
    final day = plan.programDay(current.clamp(0, kProgramDays - 1));

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlanSectionLabel(
          icon: CupertinoIcons.calendar_today,
          title: l.plLevelWeek,
          trailing: l.levelLabel(level + 1),
          color: kProgramLevelMeta[level].$2,
        ),
        const SizedBox(height: 10),
        _lockedIf(
          !provider.isPremium,
          title: l.ftContinuePro,
          feature: FreeFeature.program,
          child: _LevelWeek(
            plan: plan,
            level: level,
            current: current,
            completed: completed,
          ),
        ),
        const SizedBox(height: 20),
        PlanSectionLabel(
          icon: CupertinoIcons.flag_fill,
          title: l.plTodayStep,
          color: kProgramLevelMeta[level].$2,
        ),
        const SizedBox(height: 10),
        KeyedSubtree(
          key: TourKeys.planProgramDay,
          child: finished
              ? PlanCard(
                  child: Text(
                    l.plProgramFinished,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppColors.warning,
                    ),
                  ),
                )
              : _ProgramDayCard(provider: provider, day: day),
        ),
        const SizedBox(height: 20),
        PlanSectionLabel(
          icon: CupertinoIcons.chart_bar_alt_fill,
          title: l.plProgressionTitle,
        ),
        const SizedBox(height: 10),
        ProgressionTable(level: level),
      ],
    );

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
      children: [
        KeyedSubtree(
          key: TourKeys.planProgramHeader,
          child: ProgramJourneyHeader(
            completed: completed,
            current: current,
            level: level,
          ),
        ),
        const SizedBox(height: 20),
        // Readable on the free tier; the day card locks its ticks itself.
        body,
        const SizedBox(height: 22),
        PlanSectionLabel(
          icon: CupertinoIcons.square_stack_3d_up_fill,
          title: l.disciplineLevels,
        ),
        const SizedBox(height: 10),
        for (var i = 0; i < kProgramLevelCount; i++)
          _LevelCard(
            plan: plan,
            levelIndex: i,
            currentLevel: level,
            completed: completed,
            premium: provider.isPremium,
          ),
      ],
    );
  }
}

/// The current level's seven days: done, today, locked.
class _LevelWeek extends StatelessWidget {
  final WeeklyPlan plan;
  final int level;
  final int current;
  final Set<int> completed;
  const _LevelWeek({
    required this.plan,
    required this.level,
    required this.current,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final color = kProgramLevelMeta[level].$2;
    return PlanCard(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
      child: Row(
        children: [
          for (var d = 0; d < kProgramLevelDays; d++)
            Expanded(
              child: Builder(builder: (context) {
                final index = level * kProgramLevelDays + d;
                final pd = plan.programDay(index);
                final done = completed.contains(index);
                final isCurrent = index == current;
                final locked = index > current;
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _showDaySheet(
                    context,
                    title: '${l.plCurrentDay(index + 1)} · ${planKindLabel(l, pd.kind)}',
                    subtitle: locked
                        ? l.plDayLocked(current + 1)
                        : l.plDoseMinutes(pd.minutes),
                    moves: pd.moves,
                  ),
                  child: Column(
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
                                      : planKindIcon(pd.kind),
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
                  ),
                );
              }),
            ),
        ],
      ),
    );
  }
}

/// The day's moves to tick, the player, and the gated "complete" button.
class _ProgramDayCard extends StatelessWidget {
  final AppProvider provider;
  final ProgramDay day;
  const _ProgramDayCard({required this.provider, required this.day});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final color = kProgramLevelMeta[day.level].$2;
    final checks = provider.programChecksFor(day.index);
    final doneToday = provider.programDayDoneToday;
    final allTicked = day.moves.every((m) => checks.contains(m.routineId));
    final ticksLocked = !provider.canUseFree(FreeFeature.program);
    final canComplete =
        !ticksLocked && provider.canCompleteProgramDay(day.index);
    final byId = {for (final r in provider.allRoutines) r.id: r};

    void toggle(String id) {
      if (!checks.contains(id) && !guardFree(context, FreeFeature.program)) {
        return;
      }
      if (checks.contains(id)) {
        Haptics.select();
      } else {
        Haptics.success();
      }
      provider.toggleProgramMove(day.index, id);
      // Keep today's plan in step with the program day.
      final r = provider.todayRoutines.where((x) => x.id == id).firstOrNull;
      final ticked = provider.programChecksFor(day.index).contains(id);
      if (r != null && r.completed != ticked) provider.toggleRoutine(id);
    }

    void start() {
      if (!guardFree(context, FreeFeature.workout)) return;
      Haptics.tap();
      Navigator.push(
        context,
        CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) => WorkoutPlayerScreen(
            moves: day.moves,
            title: l.plCurrentDay(day.index + 1),
            color: color,
            alreadyDone: checks,
            onMoveDone: (id) {
              provider.checkProgramMove(day.index, id);
              // The same move in today's plan counts there too.
              final r =
                  provider.todayRoutines.where((x) => x.id == id).firstOrNull;
              if (r != null && !r.completed) provider.toggleRoutine(id);
            },
          ),
        ),
      );
    }

    void complete() => completeProgramDay(context, provider);

    return PlanCard(
      padding: const EdgeInsets.fromLTRB(6, 14, 14, 16),
      borderColor: color.withValues(alpha: 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${l.plCurrentDay(day.index + 1)} · ${planKindLabel(l, day.kind)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l.plWorkoutMeta(day.moves.length, day.minutes),
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withValues(alpha: 0.55),
                        ),
                      ),
                    ],
                  ),
                ),
                ?FreeChip.forFeature(context, FreeFeature.program),
                const SizedBox(width: 8),
                Text(
                  l.plDoneCount(
                    day.moves.where((m) => checks.contains(m.routineId)).length,
                    day.moves.length,
                  ),
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          for (final m in day.moves)
            PlanItemRow(
              routineId: m.routineId,
              title: moveTitle(l, m.routineId),
              subtitle: '${doseLabel(l, m)} · ${l.plDoseMinutes(m.minutes)}',
              icon: byId[m.routineId]?.icon ?? '',
              done: checks.contains(m.routineId),
              accent: color,
              locked: ticksLocked && !doneToday,
              onToggle: doneToday ? null : () => toggle(m.routineId),
              onOpen: byId[m.routineId] == null
                  ? null
                  : () => _openDetail(context, byId[m.routineId]!),
            ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: doneToday
                ? Row(
                    children: [
                      const Icon(CupertinoIcons.checkmark_seal_fill,
                          size: 18, color: AppColors.success),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          l.plNextDayTomorrow(day.index + 1),
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.35,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withValues(alpha: 0.75),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: PlanButton(
                          label: checks.isEmpty
                              ? l.plStartWorkout
                              : l.plContinueWorkout,
                          icon: provider.canUseFree(FreeFeature.workout)
                              ? CupertinoIcons.play_fill
                              : CupertinoIcons.lock_fill,
                          color: color,
                          badge: allTicked
                              ? null
                              : FreeChip.forFeature(
                                  context,
                                  FreeFeature.workout,
                                  onFill: true,
                                ),
                          onTap: allTicked ? null : start,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: PlanButton(
                          label: l.disciplineCompleteDay,
                          icon: CupertinoIcons.checkmark_seal_fill,
                          color: AppColors.success,
                          outlined: !canComplete,
                          onTap: ticksLocked
                              ? () => guardFree(context, FreeFeature.program)
                              : canComplete
                              ? complete
                              : null,
                        ),
                      ),
                      if (ticksLocked) ...[
                        const SizedBox(height: 10),
                        FreeLockBanner(
                          feature: FreeFeature.program,
                          body: l.ftPlanLocked,
                        ),
                      ] else if (!allTicked) ...[
                        const SizedBox(height: 8),
                        Text(
                          l.plTickToComplete,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.45),
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _LevelCard extends StatefulWidget {
  final WeeklyPlan plan;
  final int levelIndex;
  final int currentLevel;
  final Set<int> completed;

  /// Free users open a level to a blurred preview of its seven days, with
  /// the way to Pro on top.
  final bool premium;
  const _LevelCard({
    required this.plan,
    required this.levelIndex,
    required this.currentLevel,
    required this.completed,
    this.premium = true,
  });

  @override
  State<_LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<_LevelCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final i = widget.levelIndex;
    final meta = kProgramLevelMeta[i];
    final color = meta.$2;
    final days =
        List.generate(kProgramLevelDays, (d) => i * kProgramLevelDays + d);
    final doneCount = days.where(widget.completed.contains).length;
    final isDone = doneCount == kProgramLevelDays;
    final isCurrent = i == widget.currentLevel;
    final reached = i <= widget.currentLevel;
    final plank = moveDose('plank', level: i)!;
    final hang = moveDose('dead_hang_active', level: i)!;
    final jumps = moveDose('jumping', level: i)!;
    final highlight = [
      '${moveTitle(l, 'plank')} ${doseLabel(l, plank)}',
      '${moveTitle(l, 'dead_hang_active')} ${doseLabel(l, hang)}',
      '${moveTitle(l, 'jumping')} ${doseLabel(l, jumps)}',
    ].join(' · ');

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // Reading the levels is never locked; doing the days is.
          Haptics.select();
          setState(() => _expanded = !_expanded);
        },
        child: PlanCard(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          borderColor: isCurrent
              ? color.withValues(alpha: 0.5)
              : reached
                  ? color.withValues(alpha: 0.18)
                  : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: reached
                          ? color.withValues(alpha: 0.14)
                          : Colors.white.withValues(alpha: 0.04),
                      border: Border.all(
                        color: reached
                            ? color.withValues(alpha: 0.45)
                            : Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Center(
                      child: reached
                          ? Text(meta.$1, style: const TextStyle(fontSize: 19))
                          : Icon(CupertinoIcons.lock_fill,
                              size: 16,
                              color: Colors.white.withValues(alpha: 0.35)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l.levelLabel(i + 1),
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                            color: Colors.white.withValues(alpha: 0.38),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          programLevelName(l, i),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.3,
                            color: reached
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (isDone)
                    const Icon(CupertinoIcons.checkmark_seal_fill,
                        size: 20, color: AppColors.success)
                  else
                    Text(
                      '$doneCount/$kProgramLevelDays',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: reached
                            ? color
                            : Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                highlight,
                maxLines: _expanded ? 4 : 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.35,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
              if (_expanded) ...[
                const SizedBox(height: 10),
                _lockedIf(
                  !widget.premium,
                  title: l.ftContinuePro,
                  body: l.ftWhyProgram,
                  feature: FreeFeature.program,
                  child: Column(
                    children: [
                      for (final d in days)
                        Builder(builder: (context) {
                          final pd = widget.plan.programDay(d);
                          final done = widget.completed.contains(d);
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => _showDaySheet(
                              context,
                              title:
                                  '${l.plCurrentDay(d + 1)} · ${planKindLabel(l, pd.kind)}',
                              subtitle: l.plWorkoutMeta(pd.moves.length, pd.minutes),
                              moves: pd.moves,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                children: [
                                  Icon(
                                    done
                                        ? CupertinoIcons.checkmark_circle_fill
                                        : planKindIcon(pd.kind),
                                    size: 16,
                                    color: done
                                        ? AppColors.success
                                        : color.withValues(alpha: 0.8),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      '${l.plCurrentDay(d + 1)} · ${planKindLabel(l, pd.kind)}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    l.plWorkoutMeta(pd.moves.length, pd.minutes),
                                    style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withValues(alpha: 0.45),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════
//  NUTRITION
// ══════════════════════════════════════════════════════════════════════════

class _NutritionTab extends StatelessWidget {
  final AppProvider provider;
  const _NutritionTab({required this.provider});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final profile = _profileOf(provider);
    final t = _targetsOf(provider);
    final week = buildWeekMenu(t, profile.mealTimes);
    final todayIdx = DateTime.now().weekday - 1;
    final menu = week[todayIdx];
    final checks = provider.todayNutritionChecks;
    final nutritionOpen = provider.canUseFree(FreeFeature.nutrition);

    void toggle(String key) {
      if (!provider.nutritionCheckDone(key) &&
          !guardFree(context, FreeFeature.nutrition)) {
        return;
      }
      if (provider.nutritionCheckDone(key)) {
        Haptics.select();
      } else {
        Haptics.success();
      }
      provider.toggleNutritionCheck(key);
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
      children: [
        KeyedSubtree(
          key: TourKeys.planNutritionTargets,
          child: NutritionTargetsHeader(
            targets: t,
            meals: profile.mealTimes.length.clamp(2, 6),
          ),
        ),
        const SizedBox(height: 20),
        if (!nutritionOpen) ...[
          FreeLockBanner(
            feature: FreeFeature.nutrition,
            body: l.ftNutritionLocked,
          ),
          const SizedBox(height: 16),
        ],
        PlanSectionLabel(
          icon: CupertinoIcons.checkmark_square_fill,
          title: l.plChecklist,
          color: AppColors.orange,
          badge: FreeChip.forFeature(context, FreeFeature.nutrition),
          trailing: l.plDoneCount(
            ['protein', 'calcium', 'vitaminD', 'water']
                .where(provider.nutritionCheckDone)
                .length,
            4,
          ),
        ),
        const SizedBox(height: 10),
        _Checklist(
          provider: provider,
          targets: t,
          menu: menu,
          checks: checks,
          locked: !nutritionOpen,
          onToggle: toggle,
        ),
        const SizedBox(height: 20),
        PlanSectionLabel(
          icon: CupertinoIcons.square_list_fill,
          title: l.plMealPlan,
          color: AppColors.orange,
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            l.plMealPlanSub,
            style: TextStyle(
              fontSize: 12.5,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ),
        const SizedBox(height: 10),
        for (var i = 0; i < menu.meals.length; i++) ...[
          MealCard(
            meal: menu.meals[i],
            eaten: checks.contains('meal$i'),
            onToggleEaten: () => toggle('meal$i'),
          ),
          const SizedBox(height: 10),
        ],
        DayTotalCard(menu: menu, targets: t),
        const SizedBox(height: 20),
        // The weekly menu: Premium sees the week, free users a blurred
        // preview of it with the way to Pro.
        ...[
          PlanSectionLabel(
            icon: CupertinoIcons.calendar,
            title: l.plWeeklyMenu,
            color: AppColors.orange,
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              l.plWeeklyMenuSub,
              style: TextStyle(
                fontSize: 12.5,
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (provider.isPremium)
            WeekMenuView(week: week)
          else
            LockedPreview(
              title: l.plUnlockMenu,
              feature: FreeFeature.nutrition,
              child: WeekMenuView(week: week.take(3).toList()),
            ),
          const SizedBox(height: 20),
        ],
        _LinkTile(
          icon: CupertinoIcons.book_fill,
          color: AppColors.orange,
          title: l.plRecipes,
          subtitle: l.plRecipesSub,
          onTap: () {
            Haptics.tap();
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (_) => const RecipeGeneratorScreen()),
            );
          },
        ),
        const SizedBox(height: 10),
        _LinkTile(
          icon: Icons.menu_book_rounded,
          color: AppColors.primaryLight,
          title: l.plNutritionGuide,
          subtitle: l.plNutritionGuideSub,
          onTap: () {
            Haptics.tap();
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (_) => const NutritionScreen()),
            );
          },
        ),
      ],
    );
  }
}

/// Protein, calcium, vitamin D and water: tick each when it is covered.
class _Checklist extends StatelessWidget {
  final AppProvider provider;
  final DailyTargets targets;
  final DayMenu menu;
  final Set<String> checks;
  final bool locked;
  final ValueChanged<String> onToggle;
  const _Checklist({
    required this.provider,
    required this.targets,
    required this.menu,
    required this.checks,
    required this.onToggle,
    this.locked = false,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final nf = NumberFormat.decimalPattern(
      Localizations.localeOf(context).languageCode,
    );
    var protein = 0.0;
    var calcium = 0.0;
    for (var i = 0; i < menu.meals.length; i++) {
      if (checks.contains('meal$i')) {
        protein += menu.meals[i].protein;
        calcium += menu.meals[i].calcium;
      }
    }
    final rows = <(String, String, String, Color, double?)>[
      (
        'protein',
        l.plCheckProtein(targets.proteinG),
        l.plFromMeals('${protein.round()} g'),
        AppColors.orange,
        protein / targets.proteinG,
      ),
      (
        'calcium',
        l.plCheckCalcium(nf.format(targets.calciumMg)),
        l.plFromMeals('${nf.format(calcium.round())} mg'),
        AppColors.primaryLight,
        calcium / targets.calciumMg,
      ),
      (
        'vitaminD',
        l.plCheckVitaminD(nf.format(targets.vitaminDIu)),
        l.plVitaminDNote,
        AppColors.warning,
        null,
      ),
      (
        'water',
        l.plCheckWater(targets.waterL.fixedL(1)),
        l.plWaterLogged(provider.todayWater.fixedL(1)),
        AppColors.cyan,
        provider.todayWater / targets.waterL,
      ),
    ];
    return PlanCard(
      padding: const EdgeInsets.fromLTRB(6, 8, 16, 8),
      child: Column(
        children: [
          for (final (key, title, note, color, ratio) in rows)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onToggle(key),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    PlanCheck(
                      done: provider.nutritionCheckDone(key),
                      color: color,
                      locked: locked,
                      onTap: () => onToggle(key),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            note,
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.3,
                              color: Colors.white.withValues(alpha: 0.5),
                            ),
                          ),
                          if (ratio != null) ...[
                            const SizedBox(height: 6),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: LinearProgressIndicator(
                                value: ratio.clamp(0.0, 1.0),
                                minHeight: 4,
                                backgroundColor:
                                    Colors.white.withValues(alpha: 0.07),
                                valueColor: AlwaysStoppedAnimation(color),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _LinkTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _LinkTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: PlanCard(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, size: 21, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              CupertinoIcons.chevron_right,
              size: 15,
              color: Colors.white.withValues(alpha: 0.3),
            ),
          ],
        ),
      ),
    );
  }
}

/// Completes today's program day, with the free-tier gate, the celebration
/// and the toast. Shared by the Discipline card, the Today hero and the
/// workout player's finish screen. Returns whether the day was completed.
bool completeProgramDay(BuildContext context, AppProvider provider) {
  final l = AppLocalizations.of(context)!;
  final day = provider.currentProgramDay;
  if (!guardFree(context, FreeFeature.program)) return false;
  if (!provider.markProgramDayComplete(day)) return false;
  Haptics.celebrate();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.surfaceDark,
      content: Text(
        l.plDayCompleteToast(day + 1),
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
  );
  return true;
}

/// [child] as is, or behind a blurred [LockedPreview] when [locked].
Widget _lockedIf(
  bool locked, {
  required Widget child,
  required String title,
  String? body,
  FreeFeature? feature,
}) =>
    locked
        ? LockedPreview(
            title: title,
            body: body,
            feature: feature,
            child: child,
          )
        : child;
