import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

class WeeklyReportScreen extends StatelessWidget {
  const WeeklyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final now = DateTime.now();
        final weekStart = now.subtract(Duration(days: now.weekday - 1));
        final weekEnd = weekStart.add(const Duration(days: 6));

        String fmt(DateTime d) =>
            '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}';

        // Height change in last 7 days
        final recentRecords = provider.heightRecords.where((r) {
          final d = DateTime.tryParse(r.date);
          return d != null && now.difference(d).inDays <= 7;
        }).toList();
        double? heightChange;
        if (recentRecords.length >= 2) {
          recentRecords.sort((a, b) => a.date.compareTo(b.date));
          heightChange = double.parse(
            (recentRecords.last.height - recentRecords.first.height)
                .toStringAsFixed(1),
          );
        }

        // Active challenges
        final challenges = provider.activeChallenges;
        final completedChallenges =
            challenges.where((c) => c['completed'] == true).length;

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // ── App Bar ──
              SliverAppBar(
                expandedHeight: 100,
                pinned: true,
                backgroundColor: AppColors.surfaceDark,
                leading: IconButton(
                  icon: const Icon(CupertinoIcons.back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    'Weekly Report',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: AppColors.gradientHeader,
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Week range
                    Center(
                      child: Text(
                        '${fmt(weekStart)} – ${fmt(weekEnd)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ── 1. Overview Stats ──
                    SectionHeader(
                      icon: CupertinoIcons.chart_bar_alt_fill,
                      title: 'Overview',
                    ),
                    const SizedBox(height: 10),
                    GlassCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _StatColumn(
                            label: 'Routines',
                            value: '${provider.completedRoutineCount}/${provider.routines.length}',
                            icon: CupertinoIcons.checkmark_circle_fill,
                            color: AppColors.lime,
                          ),
                          _StatColumn(
                            label: 'Streak',
                            value: '${provider.streak}',
                            icon: CupertinoIcons.flame_fill,
                            color: AppColors.orange,
                          ),
                          _StatColumn(
                            label: 'Height',
                            value: heightChange != null
                                ? '${heightChange > 0 ? '+' : ''}$heightChange cm'
                                : '—',
                            icon: CupertinoIcons.arrow_up,
                            color: AppColors.cyan,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ── 2. Score Breakdown ──
                    SectionHeader(
                      icon: CupertinoIcons.star_fill,
                      title: 'Daily Scores',
                      iconColor: AppColors.warning,
                    ),
                    const SizedBox(height: 10),
                    GlassCard(
                      child: Column(
                        children: [
                          _ScoreRow(
                            icon: CupertinoIcons.drop_fill,
                            label: 'Water Today',
                            value: '${provider.todayWater} L',
                            progress: (provider.todayWater / 2.5).clamp(0.0, 1.0),
                            color: AppColors.water,
                          ),
                          const SizedBox(height: 14),
                          _ScoreRow(
                            icon: CupertinoIcons.moon_fill,
                            label: 'Sleep Today',
                            value: '${provider.todaySleep} hrs',
                            progress: (provider.todaySleep / 9.0).clamp(0.0, 1.0),
                            color: AppColors.sleep,
                          ),
                          const SizedBox(height: 14),
                          _ScoreRow(
                            icon: CupertinoIcons.checkmark_seal_fill,
                            label: 'Routine Completion',
                            value: '${(provider.routineProgress * 100).toInt()}%',
                            progress: provider.routineProgress,
                            color: AppColors.lime,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ── 3. XP & Level ──
                    SectionHeader(
                      icon: CupertinoIcons.bolt_fill,
                      title: 'XP & Level',
                      iconColor: AppColors.cyan,
                    ),
                    const SizedBox(height: 10),
                    GlassCard(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: AppColors.gradientCyan,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'LVL ${provider.level}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    provider.levelTitle,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${provider.totalXP} XP',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textTertiary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          // Progress bar
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: SizedBox(
                              height: 10,
                              child: TweenAnimationBuilder<double>(
                                tween: Tween(
                                  begin: 0.0,
                                  end: provider.levelProgress,
                                ),
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.easeOutCubic,
                                builder: (context, value, _) {
                                  return Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.cardFillLight,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                      FractionallySizedBox(
                                        widthFactor: value.clamp(0.0, 1.0),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            gradient: AppColors.gradientCyan,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${provider.xpForNextLevel - provider.totalXP} XP to next level',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textTertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ── 4. Active Challenges ──
                    if (challenges.isNotEmpty) ...[
                      SectionHeader(
                        icon: CupertinoIcons.flag_fill,
                        title: 'Active Challenges',
                        iconColor: AppColors.pink,
                      ),
                      const SizedBox(height: 10),
                      GlassCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$completedChallenges/${challenges.length} completed',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textTertiary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ...challenges.map((c) {
                              final target = (c['target'] as num?) ?? 1;
                              final progress = (c['progress'] as num?) ?? 0;
                              final completed = c['completed'] == true;
                              final ratio =
                                  (progress / target).clamp(0.0, 1.0);

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            (c['title'] as String?) ??
                                                (c['id'] as String? ?? ''),
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: completed
                                                  ? AppColors.lime
                                                  : Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        if (completed)
                                          const Icon(
                                            CupertinoIcons
                                                .checkmark_circle_fill,
                                            size: 16,
                                            color: AppColors.lime,
                                          )
                                        else
                                          Text(
                                            '$progress/$target',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.textTertiary,
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: LinearProgressIndicator(
                                        value: ratio.toDouble(),
                                        backgroundColor:
                                            AppColors.cardFillLight,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          completed
                                              ? AppColors.lime
                                              : AppColors.primary,
                                        ),
                                        minHeight: 5,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // ── 5. Share Button ──
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: AppColors.gradientPrimary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Share feature coming soon!'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          icon: const Icon(CupertinoIcons.share,
                              color: Colors.white),
                          label: const Text(
                            'Share Your Progress',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
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

// ── Helper Widgets ──────────────────────────────────────────────────

class _StatColumn extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatColumn({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: AppColors.textTertiary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _ScoreRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final double progress;
  final Color color;

  const _ScoreRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.cardFillLight,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 5,
          ),
        ),
      ],
    );
  }
}
