import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../models/routine.dart';
import '../utils/constants.dart';
import '../utils/calculations.dart';
import '../utils/localized_data.dart';

class RoutinesScreen extends StatefulWidget {
  const RoutinesScreen({super.key});

  @override
  State<RoutinesScreen> createState() => _RoutinesScreenState();
}

class _RoutinesScreenState extends State<RoutinesScreen> {
  String _selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final routines = _selectedCategory == 'all'
            ? provider.routines
            : provider.routines.where((r) => r.category == _selectedCategory).toList();

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              // ── Header ──────────────────────────────
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1E1B4B), Color(0xFF0A0A14)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22, 8, 22, 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              l.routines,
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primary,
                                letterSpacing: -1.2,
                                shadows: [Shadow(color: AppColors.primary.withValues(alpha: 0.2), blurRadius: 8)],
                              ),
                            ),
                          ),
                          if (provider.streak > 0)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.orange.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: AppColors.orange.withValues(alpha: 0.3)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(CupertinoIcons.flame_fill, color: AppColors.orange, size: 16),
                                  const SizedBox(width: 5),
                                  Text(
                                    l.streakDays(provider.streak),
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.orange, letterSpacing: -0.3),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // ── Progress Card ──────────────────
                    GlassCard(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                provider.allRoutinesCompleted
                                    ? l.completedLabel
                                    : l.progressStatus,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                                decoration: BoxDecoration(
                                  color: (provider.allRoutinesCompleted ? AppColors.success : AppColors.primary).withValues(alpha: 0.18),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '${provider.completedRoutineCount}/${provider.routines.length}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: provider.allRoutinesCompleted ? AppColors.success : AppColors.primary,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: LinearProgressIndicator(
                              value: provider.routineProgress,
                              minHeight: 8,
                              backgroundColor: Colors.white.withValues(alpha: 0.14),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                provider.allRoutinesCompleted ? AppColors.success : AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                l.completed('${(provider.routineProgress * 100).toInt()}'),
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textSecondary, letterSpacing: -0.1),
                              ),
                              if (provider.bestStreak > 0)
                                Text(
                                  l.bestStreak(provider.bestStreak),
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textSecondary, letterSpacing: -0.1),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ── Category Filter ───────────────
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _CategoryChip(label: l.all, icon: CupertinoIcons.square_grid_2x2_fill, selected: _selectedCategory == 'all', onTap: () => setState(() => _selectedCategory = 'all')),
                          const SizedBox(width: 8),
                          _CategoryChip(label: l.exercise, icon: CupertinoIcons.flame_fill, selected: _selectedCategory == 'exercise', color: AppColors.exerciseColor, onTap: () => setState(() => _selectedCategory = 'exercise')),
                          const SizedBox(width: 8),
                          _CategoryChip(label: l.nutrition, icon: CupertinoIcons.leaf_arrow_circlepath, selected: _selectedCategory == 'nutrition', color: AppColors.nutritionColor, onTap: () => setState(() => _selectedCategory = 'nutrition')),
                          const SizedBox(width: 8),
                          _CategoryChip(label: l.sleepLabel, icon: CupertinoIcons.moon_fill, selected: _selectedCategory == 'sleep', color: AppColors.sleepColor, onTap: () => setState(() => _selectedCategory = 'sleep')),
                          const SizedBox(width: 8),
                          _CategoryChip(label: l.posture, icon: CupertinoIcons.person_fill, selected: _selectedCategory == 'posture', color: AppColors.postureColor, onTap: () => setState(() => _selectedCategory = 'posture')),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ]),
                ),
              ),

              // ── Routine Cards ─────────────────────
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final routine = routines[index];
                      final catInfo = categoryInfo[routine.category];
                      final catColor = catInfo?['color'] as Color? ?? AppColors.primary;
                      final catTitle = localizedCategory(l, routine.category);
                      final localized = localizedRoutine(l, routine.id);

                      // Personalized description based on analysis
                      final desc = _personalizedDescription(routine, provider);
                      final displayTitle = localized['title'] ?? routine.title;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () => provider.toggleRoutine(routine.id),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: routine.completed
                                    ? [AppColors.success.withValues(alpha: 0.12), AppColors.success.withValues(alpha: 0.04)]
                                    : [catColor.withValues(alpha: 0.15), catColor.withValues(alpha: 0.03)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: routine.completed
                                    ? AppColors.success.withValues(alpha: 0.30)
                                    : catColor.withValues(alpha: 0.18),
                                width: routine.completed ? 1 : 0.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: routine.completed
                                        ? AppColors.success.withValues(alpha: 0.12)
                                        : catColor.withValues(alpha: 0.14),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Center(child: Text(routine.icon, style: const TextStyle(fontSize: 24))),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        displayTitle,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: routine.completed
                                              ? Colors.white.withValues(alpha: 0.72)
                                              : Colors.white,
                                          decoration: routine.completed ? TextDecoration.lineThrough : null,
                                          decorationColor: Colors.white.withValues(alpha: 0.45),
                                          letterSpacing: -0.3,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        desc,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white.withValues(alpha: 0.72),
                                          height: 1.35,
                                          letterSpacing: -0.1,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                            decoration: BoxDecoration(
                                              color: catColor.withValues(alpha: 0.14),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            child: Text(catTitle, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: catColor, letterSpacing: 0.2)),
                                          ),
                                          const SizedBox(width: 8),
                                          Icon(CupertinoIcons.clock, size: 11, color: Colors.white.withValues(alpha: 0.50)),
                                          const SizedBox(width: 3),
                                          Text(localizedDuration(l, routine.duration), style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.50), letterSpacing: -0.1)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: routine.completed ? AppColors.success : Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: routine.completed ? AppColors.success : Colors.white.withValues(alpha: 0.50),
                                      width: 2,
                                    ),
                                  ),
                                  child: routine.completed
                                      ? const Icon(CupertinoIcons.checkmark, color: Colors.white, size: 14)
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: routines.length,
                  ),
                ),
              ),

              const SliverPadding(padding: EdgeInsets.only(bottom: 110)),
            ],
          ),
        );
      },
    );
  }

  String _personalizedDescription(Routine routine, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    final profile = provider.profile;
    final locDesc = localizedRoutine(l, routine.id)['description'] ?? routine.description;
    if (profile == null) return locDesc;

    switch (routine.id) {
      case 'protein':
        final protein = Calculations.dailyProteinNeed(profile.weight).toStringAsFixed(0);
        return l.personalizedProtein(protein);
      case 'water':
        final water = Calculations.dailyWaterNeed(profile.weight).toStringAsFixed(1);
        return l.personalizedWater(water);
      case 'quality_sleep':
        final sleep = Calculations.dailySleepNeed(profile.age).toStringAsFixed(0);
        return l.personalizedSleep(sleep);
      case 'calcium_vitamin_d':
        final calorie = Calculations.dailyCalorieNeed(profile);
        return l.personalizedCalcium('$calorie');
      default:
        return locDesc;
    }
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final Color? color;
  final VoidCallback onTap;

  const _CategoryChip({required this.label, required this.icon, required this.selected, this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.primary;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? chipColor.withValues(alpha: 0.22) : Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? chipColor.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.14),
            width: selected ? 1 : 0.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: selected ? chipColor : Colors.white.withValues(alpha: 0.88)),
            const SizedBox(width: 7),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: selected ? chipColor : Colors.white.withValues(alpha: 0.82),
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
