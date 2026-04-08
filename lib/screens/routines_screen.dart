import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../models/routine.dart';
import '../utils/constants.dart';
import '../utils/calculations.dart';
import '../utils/localized_data.dart';
import '../widgets/premium_paywall.dart';
import 'exercise_detail_screen.dart';

class RoutinesScreen extends StatefulWidget {
  const RoutinesScreen({super.key});

  @override
  State<RoutinesScreen> createState() => _RoutinesScreenState();
}

const _freeRoutineIds = {'morning_stretch', 'protein', 'quality_sleep', 'posture_check'};

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
                      colors: [Color(0xFF0F0B24), Color(0xFF070B1A)],
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
                                letterSpacing: 2.0,
                                shadows: [
                                  Shadow(
                                    color: AppColors.primary.withValues(alpha: 0.3),
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (provider.streak > 0) ...[
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
                            const SizedBox(width: 8),
                          ],
                          // Manage routines button
                          GestureDetector(
                            onTap: () => _showManageSheet(context, provider, l),
                            child: Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: AppColors.primary.withValues(alpha: 0.30), width: 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withValues(alpha: 0.18),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                CupertinoIcons.slider_horizontal_3,
                                color: AppColors.primary,
                                size: 20,
                              ),
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
                          GlowProgressBar(
                            value: provider.routineProgress,
                            gradient: provider.allRoutinesCompleted
                                ? const LinearGradient(colors: [AppColors.success, AppColors.success])
                                : AppColors.gradientGrowth,
                            glowColor: provider.allRoutinesCompleted ? AppColors.success : AppColors.primary,
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
                      final isFree = _freeRoutineIds.contains(routine.id);
                      final isLocked = !provider.isPremium && !isFree;

                      Widget routineCard = GestureDetector(
                        onTap: isLocked
                            ? () => showPremiumPaywall(context)
                            : () => Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (_) => ExerciseDetailScreen(routine: routine)),
                              ),
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
                              if (isLocked)
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFD700).withValues(alpha: 0.12),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: const Color(0xFFFFD700).withValues(alpha: 0.4), width: 1.5),
                                  ),
                                  child: const Icon(CupertinoIcons.lock_fill, color: Color(0xFFFFD700), size: 12),
                                )
                              else
                                GestureDetector(
                                  onTap: provider.isPremium
                                      ? () => provider.toggleRoutine(routine.id)
                                      : isFree
                                          ? () => provider.toggleRoutine(routine.id)
                                          : () => showPremiumPaywall(context),
                                  child: AnimatedContainer(
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
                                ),
                            ],
                          ),
                        ),
                      );

                      // Blur locked routine cards
                      if (isLocked) {
                        routineCard = PremiumLockedOverlay(
                          onTap: () => showPremiumPaywall(context),
                          borderRadius: 20,
                          blurAmount: 5,
                          child: routineCard,
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: routineCard,
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

  void _showManageSheet(BuildContext context, AppProvider provider, AppLocalizations l) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (_, scrollController) {
            return Consumer<AppProvider>(
              builder: (context, p, __) {
                final all = p.allRoutines;
                final hidden = p.hiddenRoutineIds;
                final visibleCount = all.length - hidden.length;
                return Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1A1535), Color(0xFF0F0B24)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                    border: Border(
                      top: BorderSide(color: Color(0xFF8B5CF6), width: 0.6),
                    ),
                  ),
                  child: Column(
                    children: [
                      // ── Drag handle ──
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      // ── Header ──
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 18, 22, 8),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.16),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                              ),
                              child: const Icon(CupertinoIcons.slider_horizontal_3, color: AppColors.primary, size: 22),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l.manageRoutines,
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      letterSpacing: -0.4,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    l.nVisibleOfTotal('$visibleCount', '${all.length}'),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                      letterSpacing: -0.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(sheetContext).pop(),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.08),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(CupertinoIcons.xmark, color: Colors.white.withValues(alpha: 0.7), size: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
                        child: Text(
                          l.manageRoutinesSubtitle,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withValues(alpha: 0.55),
                            letterSpacing: -0.1,
                          ),
                        ),
                      ),
                      // ── Routine list ──
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                          itemCount: all.length,
                          itemBuilder: (_, i) {
                            final r = all[i];
                            final catInfo = categoryInfo[r.category];
                            final catColor = catInfo?['color'] as Color? ?? AppColors.primary;
                            final localized = localizedRoutine(l, r.id);
                            final title = localized['title'] ?? r.title;
                            final isVisible = !hidden.contains(r.id);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: GestureDetector(
                                onTap: () => p.toggleRoutineVisibility(r.id),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: isVisible
                                        ? catColor.withValues(alpha: 0.10)
                                        : Colors.white.withValues(alpha: 0.03),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: isVisible
                                          ? catColor.withValues(alpha: 0.30)
                                          : Colors.white.withValues(alpha: 0.06),
                                      width: 0.8,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 38,
                                        height: 38,
                                        decoration: BoxDecoration(
                                          color: isVisible
                                              ? catColor.withValues(alpha: 0.16)
                                              : Colors.white.withValues(alpha: 0.05),
                                          borderRadius: BorderRadius.circular(11),
                                        ),
                                        child: Center(
                                          child: Text(
                                            r.icon,
                                            style: TextStyle(
                                              fontSize: 19,
                                              color: isVisible ? null : Colors.white.withValues(alpha: 0.35),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          title,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: isVisible
                                                ? Colors.white
                                                : Colors.white.withValues(alpha: 0.40),
                                            letterSpacing: -0.2,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      // Toggle switch
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 200),
                                        width: 44,
                                        height: 26,
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: isVisible
                                              ? AppColors.primary.withValues(alpha: 0.85)
                                              : Colors.white.withValues(alpha: 0.10),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: AnimatedAlign(
                                          duration: const Duration(milliseconds: 200),
                                          curve: Curves.easeOutCubic,
                                          alignment: isVisible ? Alignment.centerRight : Alignment.centerLeft,
                                          child: Container(
                                            width: 22,
                                            height: 22,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
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
