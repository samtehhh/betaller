import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../models/routine.dart';
import '../utils/constants.dart';
import '../utils/daily_plan.dart';
import '../widgets/discipline_widgets.dart';
import '../utils/localized_data.dart';
import '../widgets/premium_paywall.dart';
import 'exercise_detail_screen.dart';
import 'custom_routine_builder_screen.dart';

// ── Free routine IDs (no paywall) ─────────────────────────────────
const _freeRoutineIds = {'morning_stretch', 'protein', 'quality_sleep', 'posture_check'};

// ── Program structure ─────────────────────────────────────────────
// 10 levels × 7 days = 70 program days total
const _totalLevels = 10;
const _daysPerLevel = 7;

// Level metadata: emoji, color, intensity badge (non-localizable parts)
const _levelMeta = [
  ('🌱', Color(0xFF4CAF50), '◦◦◦◦◦◦◦◦◦◦'),
  ('⚡', Color(0xFF8B5CF6), '█◦◦◦◦◦◦◦◦◦'),
  ('🔥', Color(0xFFFF8A00), '██◦◦◦◦◦◦◦◦'),
  ('💪', Color(0xFF00E5FF), '███◦◦◦◦◦◦◦'),
  ('⚔️', Color(0xFFFF4DB8), '████◦◦◦◦◦◦'),
  ('🏆', Color(0xFFF5C542), '█████◦◦◦◦◦'),
  ('🌟', Color(0xFF8B5CF6), '██████◦◦◦◦'),
  ('👑', Color(0xFFFF8A00), '███████◦◦◦'),
  ('🦅', Color(0xFF00E5FF), '████████◦◦'),
  ('🚀', Color(0xFFFF4DB8), '██████████'),
];

String _localizedLevelName(AppLocalizations l, int index) {
  switch (index) {
    case 0: return l.levelStarter;
    case 1: return l.levelNovice;
    case 2: return l.levelBuilder;
    case 3: return l.levelGrinder;
    case 4: return l.levelWarrior;
    case 5: return l.levelChampion;
    case 6: return l.levelElite;
    case 7: return l.levelMaster;
    case 8: return l.levelLegend;
    case 9: return l.levelGodTier;
    default: return 'Level ${index + 1}';
  }
}

String _localizedLevelDesc(AppLocalizations l, int index) {
  switch (index) {
    case 0: return l.levelDesc0;
    case 1: return l.levelDesc1;
    case 2: return l.levelDesc2;
    case 3: return l.levelDesc3;
    case 4: return l.levelDesc4;
    case 5: return l.levelDesc5;
    case 6: return l.levelDesc6;
    case 7: return l.levelDesc7;
    case 8: return l.levelDesc8;
    case 9: return l.levelDesc9;
    default: return '';
  }
}

class RoutinesScreen extends StatefulWidget {
  const RoutinesScreen({super.key});

  @override
  State<RoutinesScreen> createState() => _RoutinesScreenState();
}

class _RoutinesScreenState extends State<RoutinesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // Train tab
  int _selectedDayIndex = DateTime.now().weekday - 1; // 0=Mon

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
                    _TrainTab(
                      selectedDayIndex: _selectedDayIndex,
                      onDaySelected: (i) => setState(() => _selectedDayIndex = i),
                      provider: provider,
                    ),
                    _ProgramTab(provider: provider),
                    _NutritionTab(provider: provider),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
          floatingActionButton: _buildFAB(context, provider),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    return Container(
      color: AppColors.scaffold,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.navRoutines,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                        letterSpacing: -1.0,
                        shadows: [
                          Shadow(
                            color: AppColors.primary.withValues(alpha: 0.35),
                            blurRadius: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Streak badge
              if (provider.streak > 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.orange.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AppColors.orange.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('🔥', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 4),
                      Text(
                        '${provider.streak}',
                        style: const TextStyle(
                          color: AppColors.orange,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    final l = AppLocalizations.of(context)!;
    final labels = [l.disciplineToday, l.program, l.nutrition];
    return Container(
      color: AppColors.scaffold,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 14),
      child: AnimatedBuilder(
        animation: _tabController,
        builder: (_, _) {
          final selected = _tabController.index;
          return Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.cardFill,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: List.generate(labels.length, (i) {
                final isActive = i == selected;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => _tabController.animateTo(i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: isActive ? AppColors.primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: isActive ? [BoxShadow(color: AppColors.primary.withValues(alpha: 0.35), blurRadius: 10)] : null,
                      ),
                      child: Center(
                        child: Text(
                          labels[i],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                            color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.40),
                            letterSpacing: 0.1,
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

  Widget _buildFAB(BuildContext context, AppProvider provider) {
    if (!provider.isPremium) return const SizedBox.shrink();
    // clears the floating nav bar
    return Padding(
      padding: const EdgeInsets.only(bottom: 76),
      child: FloatingActionButton(
      backgroundColor: AppColors.primary,
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CustomRoutineBuilderScreen()),
      ),
        child: const Icon(CupertinoIcons.add, color: Colors.white, size: 28),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// TRAIN TAB
// ══════════════════════════════════════════════════════════════════

class _TrainTab extends StatelessWidget {
  final int selectedDayIndex;
  final ValueChanged<int> onDaySelected;
  final AppProvider provider;

  const _TrainTab({
    required this.selectedDayIndex,
    required this.onDaySelected,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final today = provider.todayRoutines;
    final done = provider.completedRoutineCount;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 130),
      children: [
        _DisciplineLevelCard(provider: provider),
        const SizedBox(height: 18),

        // ── Today ───────────────────────────────────────────────────────
        _SectionLabel(
          icon: CupertinoIcons.sun_max_fill,
          title: l.disciplineTodayPlan,
          trailing: done >= today.length && today.isNotEmpty
              ? l.disciplineAllDone
              : l.disciplineDayProgress(done, today.length),
          trailingColor: done >= today.length && today.isNotEmpty
              ? AppColors.success
              : Colors.white.withValues(alpha: 0.45),
        ),
        const SizedBox(height: 10),
        ...today.map((r) => _PlanRow(
              routine: r,
              locked: !_freeRoutineIds.contains(r.id) && !provider.isPremium,
              onToggle: () {
                if (!_freeRoutineIds.contains(r.id) && !provider.isPremium) {
                  showPremiumPaywall(context);
                  return;
                }
                HapticFeedback.selectionClick();
                provider.toggleRoutine(r.id);
              },
              onOpen: () {
                if (!_freeRoutineIds.contains(r.id) && !provider.isPremium) {
                  showPremiumPaywall(context);
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExerciseDetailScreen(routine: r),
                  ),
                );
              },
            )),

        const SizedBox(height: 22),

        // ── This week ───────────────────────────────────────────────────
        _SectionLabel(
          icon: CupertinoIcons.calendar,
          title: l.disciplineWeek,
        ),
        const SizedBox(height: 12),
        _GoalGroup(children: [
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
        ]),

        const SizedBox(height: 22),

        // ── This month ──────────────────────────────────────────────────
        _SectionLabel(
          icon: CupertinoIcons.calendar_circle_fill,
          title: l.disciplineMonth,
        ),
        const SizedBox(height: 12),
        _GoalGroup(children: [
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
        ]),
      ],
    );
  }
}

/// Level, streak and how far the next tier is.
class _DisciplineLevelCard extends StatelessWidget {
  final AppProvider provider;
  const _DisciplineLevelCard({required this.provider});

  static const _tierKeys = [
    'spark', 'steady', 'sharp', 'solid', 'relentless', 'unbroken', 'legend',
  ];

  String _tierName(AppLocalizations l, String key) {
    switch (key) {
      case 'steady':
        return l.disciplineTierSteady;
      case 'sharp':
        return l.disciplineTierSharp;
      case 'solid':
        return l.disciplineTierSolid;
      case 'relentless':
        return l.disciplineTierRelentless;
      case 'unbroken':
        return l.disciplineTierUnbroken;
      case 'legend':
        return l.disciplineTierLegend;
      default:
        return l.disciplineTierSpark;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final streak = provider.streak;
    final idx = disciplineTierIndex(streak);
    final tier = kDisciplineTiers[idx];
    final progress = disciplineTierProgress(streak);
    final isMax = idx >= kDisciplineTiers.length - 1;
    final toNext = isMax ? 0 : kDisciplineTiers[idx + 1].days - streak;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: tier.color.withValues(alpha: 0.22)),
        boxShadow: [
          BoxShadow(
            color: tier.color.withValues(alpha: 0.16),
            blurRadius: 30,
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
                progress: isMax ? 1 : progress,
                color: tier.color,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$streak',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        height: 1,
                        color: tier.color,
                        letterSpacing: -1.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '🔥',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
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
                  l.disciplineLevel.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.3,
                    color: Colors.white.withValues(alpha: 0.40),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _tierName(l, _tierKeys[idx]),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                    color: tier.color,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  l.disciplineStreakDays(streak),
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: tier.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(color: tier.color.withValues(alpha: 0.28)),
                  ),
                  child: Text(
                    isMax ? l.disciplineMaxTier : l.disciplineToNext(toNext),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: tier.color,
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

class _SectionLabel extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final Color? trailingColor;
  const _SectionLabel({
    required this.icon,
    required this.title,
    this.trailing,
    this.trailingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
              color: Colors.white.withValues(alpha: 0.62),
            ),
          ),
        ),
        if (trailing != null)
          Text(
            trailing!,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: trailingColor ?? Colors.white.withValues(alpha: 0.45),
            ),
          ),
      ],
    );
  }
}

class _GoalGroup extends StatelessWidget {
  final List<Widget> children;
  const _GoalGroup({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 2),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(children: children),
    );
  }
}

/// One line of today's plan: tap the box to tick it, tap the row to read it.
class _PlanRow extends StatelessWidget {
  final Routine routine;
  final bool locked;
  final VoidCallback onToggle;
  final VoidCallback onOpen;

  const _PlanRow({
    required this.routine,
    required this.locked,
    required this.onToggle,
    required this.onOpen,
  });

  Color get _categoryColor {
    switch (routine.category) {
      case 'nutrition':
        return AppColors.lime;
      case 'sleep':
        return AppColors.sleep;
      case 'posture':
        return AppColors.pink;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final copy = localizedRoutine(l, routine.id);
    final title = copy['title']!.isEmpty ? routine.title : copy['title']!;
    final done = routine.completed;
    final color = _categoryColor;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onOpen,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          decoration: BoxDecoration(
            color: done
                ? AppColors.success.withValues(alpha: 0.07)
                : AppColors.cardFill,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: done
                  ? AppColors.success.withValues(alpha: 0.30)
                  : Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: onToggle,
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: done ? AppColors.success : Colors.transparent,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: done
                          ? AppColors.success
                          : Colors.white.withValues(alpha: 0.22),
                      width: 1.6,
                    ),
                  ),
                  child: done
                      ? const Icon(Icons.check_rounded,
                          size: 17, color: Colors.white)
                      : null,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w700,
                        color: done
                            ? Colors.white.withValues(alpha: 0.55)
                            : Colors.white,
                        decoration:
                            done ? TextDecoration.lineThrough : null,
                        decorationColor: Colors.white.withValues(alpha: 0.4),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color.withValues(alpha: 0.9),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          routine.duration,
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.42),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (locked)
                Icon(CupertinoIcons.lock_fill,
                    size: 15, color: Colors.white.withValues(alpha: 0.35))
              else
                Icon(CupertinoIcons.chevron_right,
                    size: 15, color: Colors.white.withValues(alpha: 0.25)),
            ],
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// PROGRAM TAB  — snake-path level progression
// ══════════════════════════════════════════════════════════════════

class _ProgramTab extends StatelessWidget {
  final AppProvider provider;
  const _ProgramTab({required this.provider});

  @override
  Widget build(BuildContext context) {
    final completed = provider.completedProgramDays;
    // Current day = first incomplete day
    int currentDay = 0;
    for (int i = 0; i < _totalLevels * _daysPerLevel; i++) {
      if (!completed.contains(i)) {
        currentDay = i;
        break;
      }
      currentDay = i + 1;
    }
    final currentLevel = (currentDay ~/ _daysPerLevel).clamp(0, _totalLevels - 1);
    final daysLeft = (_totalLevels * _daysPerLevel) - completed.length;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Days left banner
        SliverToBoxAdapter(
          child: _DaysLeftBanner(daysLeft: daysLeft),
        ),
        // Level cards
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, levelIndex) {
              final isUnlocked = levelIndex <= currentLevel;
              return _LevelCard(
                levelIndex: levelIndex,
                isUnlocked: isUnlocked,
                isCurrent: levelIndex == currentLevel,
                currentDay: currentDay,
                completedDays: completed,
                provider: provider,
              );
            },
            childCount: _totalLevels,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 120)),
      ],
    );
  }
}

class _DaysLeftBanner extends StatelessWidget {
  final int daysLeft;
  const _DaysLeftBanner({required this.daysLeft});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 16, 18, 8),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.orange.withValues(alpha: 0.2),
            AppColors.warning.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.orange.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Text('🏁', style: TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Text(
            l.daysLeftProgram(daysLeft),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.warning,
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelCard extends StatefulWidget {
  final int levelIndex;
  final bool isUnlocked;
  final bool isCurrent;
  final int currentDay;
  final Set<int> completedDays;
  final AppProvider provider;

  const _LevelCard({
    required this.levelIndex,
    required this.isUnlocked,
    required this.isCurrent,
    required this.currentDay,
    required this.completedDays,
    required this.provider,
  });

  @override
  State<_LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<_LevelCard> {
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _expanded = widget.isCurrent;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final meta = _levelMeta[widget.levelIndex];
    final emoji = meta.$1;
    final color = meta.$2;
    final intensityBar = meta.$3;
    final title = _localizedLevelName(l, widget.levelIndex);
    final desc = _localizedLevelDesc(l, widget.levelIndex);

    final levelStartDay = widget.levelIndex * _daysPerLevel;
    final isCompleted = widget.completedDays.contains(levelStartDay) &&
        widget.completedDays.contains(levelStartDay + _daysPerLevel - 1);
    // Count completed within this level
    final levelCompletedCount = List.generate(_daysPerLevel, (d) => levelStartDay + d)
        .where((d) => widget.completedDays.contains(d))
        .length;

    return Container(
      margin: const EdgeInsets.fromLTRB(18, 0, 18, 14),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: widget.isCurrent
              ? color.withValues(alpha: 0.5)
              : widget.isUnlocked
                  ? color.withValues(alpha: 0.15)
                  : Colors.white.withValues(alpha: 0.06),
          width: widget.isCurrent ? 1.5 : 1,
        ),
        boxShadow: widget.isCurrent
            ? [BoxShadow(
                color: color.withValues(alpha: 0.12),
                blurRadius: 20,
              )]
            : null,
      ),
      child: Column(
        children: [
          // Level header
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Level circle
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: widget.isUnlocked
                            ? [color, color.withValues(alpha: 0.5)]
                            : [
                                Colors.white.withValues(alpha: 0.08),
                                Colors.white.withValues(alpha: 0.04),
                              ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: widget.isUnlocked
                          ? [BoxShadow(
                              color: color.withValues(alpha: 0.35),
                              blurRadius: 10,
                            )]
                          : null,
                    ),
                    child: Center(
                      child: widget.isUnlocked
                          ? Text(emoji, style: const TextStyle(fontSize: 22))
                          : const Icon(
                              CupertinoIcons.lock_fill,
                              color: Colors.white38,
                              size: 20,
                            ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              l.levelLabel(widget.levelIndex + 1),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                                color: widget.isUnlocked
                                    ? color
                                    : Colors.white.withValues(alpha: 0.3),
                              ),
                            ),
                            const SizedBox(width: 8),
                            _IntensityBar(
                              pattern: intensityBar,
                              color: color,
                              isUnlocked: widget.isUnlocked,
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: widget.isUnlocked
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                        if (widget.isUnlocked)
                          Text(
                            desc,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withValues(alpha: 0.45),
                            ),
                          ),
                      ],
                    ),
                  ),
                  // Progress or lock
                  if (widget.isUnlocked) ...[
                    Column(
                      children: [
                        Text(
                          '$levelCompletedCount/$_daysPerLevel',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: isCompleted ? AppColors.lime : color,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Icon(
                          _expanded
                              ? CupertinoIcons.chevron_up
                              : CupertinoIcons.chevron_down,
                          size: 14,
                          color: Colors.white.withValues(alpha: 0.4),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          // Snake-path days (expanded)
          if (_expanded && widget.isUnlocked) ...[
            const Divider(color: Colors.white12, height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: _SnakePath(
                levelIndex: widget.levelIndex,
                currentDay: widget.currentDay,
                completedDays: widget.completedDays,
                color: color,
                provider: widget.provider,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ── Snake-path day visualization ──────────────────────────────────

class _SnakePath extends StatelessWidget {
  final int levelIndex;
  final int currentDay;
  final Set<int> completedDays;
  final Color color;
  final AppProvider provider;

  const _SnakePath({
    required this.levelIndex,
    required this.currentDay,
    required this.completedDays,
    required this.color,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final startDay = levelIndex * _daysPerLevel;
    final days = List.generate(_daysPerLevel, (i) => startDay + i);

    // Arrange in rows of 4, 3 (snake)
    // Row 0: days 0-3 (left→right)
    // Row 1: days 4-6 (right←left)
    final row0 = days.sublist(0, 4);
    final row1 = days.sublist(4).reversed.toList();

    return Column(
      children: [
        _buildRow(context, row0, false),
        const SizedBox(height: 8),
        _buildConnector(true),
        const SizedBox(height: 8),
        _buildRow(context, row1, true),
      ],
    );
  }

  Widget _buildRow(BuildContext context, List<int> days, bool reversed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: days.map((day) => _DayNode(
        dayIndex: day,
        isCompleted: completedDays.contains(day),
        isCurrent: day == currentDay,
        isLocked: day > currentDay,
        color: color,
        onTap: day == currentDay
            ? () => provider.markProgramDayComplete(day)
            : null,
      )).toList(),
    );
  }

  Widget _buildConnector(bool rightToLeft) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 32),
          child: Icon(
            CupertinoIcons.arrow_down,
            size: 16,
            color: color.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }
}

// ── Intensity bar — e.g. "███◦◦◦◦◦◦◦" ──────────────────────────

class _IntensityBar extends StatelessWidget {
  final String pattern;
  final Color color;
  final bool isUnlocked;

  const _IntensityBar({
    required this.pattern,
    required this.color,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context) {
    final filled = pattern.split('').where((c) => c == '█').length;
    final total = pattern.replaceAll(' ', '').length;
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 2,
      children: List.generate(total, (i) {
        final isFilled = i < filled;
        return Container(
          width: 5,
          height: 9,
          decoration: BoxDecoration(
            color: isUnlocked
                ? (isFilled ? color : color.withValues(alpha: 0.15))
                : Colors.white.withValues(alpha: isFilled ? 0.12 : 0.05),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
}

class _DayNode extends StatelessWidget {
  final int dayIndex;
  final bool isCompleted;
  final bool isCurrent;
  final bool isLocked;
  final Color color;
  final VoidCallback? onTap;

  const _DayNode({
    required this.dayIndex,
    required this.isCompleted,
    required this.isCurrent,
    required this.isLocked,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final dayNum = (dayIndex % _daysPerLevel) + 1;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted
                  ? color
                  : isCurrent
                      ? color.withValues(alpha: 0.2)
                      : Colors.white.withValues(alpha: 0.05),
              border: isLocked
                  ? Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                      style: BorderStyle.solid,
                    )
                  : isCurrent
                      ? Border.all(
                          color: color,
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        )
                      : Border.all(
                          color: color.withValues(alpha: 0.3),
                        ),
              boxShadow: isCompleted
                  ? [BoxShadow(
                      color: color.withValues(alpha: 0.4),
                      blurRadius: 12,
                    )]
                  : isCurrent
                      ? [BoxShadow(
                          color: color.withValues(alpha: 0.25),
                          blurRadius: 16,
                        )]
                      : null,
            ),
            child: Center(
              child: isCompleted
                  ? const Text('🔥', style: TextStyle(fontSize: 22))
                  : isCurrent
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              l.dayShort,
                              style: TextStyle(
                                fontSize: 9,
                                color: color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '$dayNum',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: color,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          '$dayNum',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isLocked
                                ? Colors.white.withValues(alpha: 0.2)
                                : Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
            ),
          ),
          if (isCurrent) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                l.tapLabel,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: color,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
// NUTRITION TAB
// ══════════════════════════════════════════════════════════════════

class _NutritionTab extends StatelessWidget {
  final AppProvider provider;

  const _NutritionTab({required this.provider});

  static const _nutritionIds = [
    'protein',
    'calcium_vitamin_d',
    'water',
    'avoid_junk',
    'zinc_intake',
    'vitamin_d_sunlight',
    'arginine_foods',
  ];

  @override
  Widget build(BuildContext context) {
    final completedCount = _nutritionIds
        .where((id) => provider.allRoutines.any((r) => r.id == id && r.completed))
        .length;
    final total = _nutritionIds.length;
    final progress = total == 0 ? 0.0 : completedCount / total;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Header summary
        SliverToBoxAdapter(
          child: _NutritionHeader(
            completed: completedCount,
            total: total,
            progress: progress,
          ),
        ),
        // Nutrition routine cards
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              final id = _nutritionIds[i];
              Routine? routine;
              try {
                routine = provider.allRoutines.firstWhere((r) => r.id == id);
              } catch (_) {
                return const SizedBox.shrink();
              }
              final isFree = _freeRoutineIds.contains(id);
              final isPremiumLocked = !isFree && !provider.isPremium;
              return _NutritionCard(
                routine: routine,
                isPremiumLocked: isPremiumLocked,
                onToggle: () {
                  if (isPremiumLocked) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const PremiumPaywallScreen(),
                    );
                  } else {
                    provider.toggleRoutine(id);
                  }
                },
                onTap: () {
                  if (isPremiumLocked) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const PremiumPaywallScreen(),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExerciseDetailScreen(routine: routine!),
                      ),
                    );
                  }
                },
              );
            },
            childCount: _nutritionIds.length,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 120)),
      ],
    );
  }
}

class _NutritionHeader extends StatelessWidget {
  final int completed;
  final int total;
  final double progress;

  const _NutritionHeader({
    required this.completed,
    required this.total,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.nutritionColor.withValues(alpha: 0.18),
            AppColors.warning.withValues(alpha: 0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.nutritionColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('🥗', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  l.dailyNutritionPlan,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    color: AppColors.orange,
                  ),
                ),
              ),
              Text(
                '$completed/$total',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppColors.warning,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white.withValues(alpha: 0.08),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.nutritionColor),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            progress == 1.0
                ? '🎉 All nutrition goals complete!'
                : 'Complete your nutrition goals for optimal growth',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _NutritionCard extends StatelessWidget {
  final Routine routine;
  final bool isPremiumLocked;
  final VoidCallback? onToggle;
  final VoidCallback onTap;

  const _NutritionCard({
    required this.routine,
    required this.isPremiumLocked,
    this.onToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final loc = localizedRoutine(l, routine.id);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(18, 0, 18, 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardFill,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: routine.completed
                ? AppColors.lime.withValues(alpha: 0.4)
                : AppColors.nutritionColor.withValues(alpha: 0.15),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.nutritionColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  isPremiumLocked ? '🔒' : routine.icon,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc['title'] ?? routine.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: isPremiumLocked
                          ? Colors.white.withValues(alpha: 0.35)
                          : Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    loc['description'] ?? routine.description,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withValues(alpha: 0.4),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (isPremiumLocked)
              GestureDetector(
                onTap: onToggle, // onToggle has been mapped to show paywall in page code!
                child: Icon(
                  CupertinoIcons.lock_fill,
                  size: 18,
                  color: Colors.white.withValues(alpha: 0.25),
                ),
              )
            else
              GestureDetector(
                onTap: onToggle,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: routine.completed
                        ? AppColors.lime
                        : Colors.white.withValues(alpha: 0.08),
                    border: Border.all(
                      color: routine.completed
                          ? AppColors.lime
                          : Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Icon(
                    CupertinoIcons.checkmark_alt,
                    size: 16,
                    color: routine.completed
                        ? Colors.black
                        : Colors.white.withValues(alpha: 0.35),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
