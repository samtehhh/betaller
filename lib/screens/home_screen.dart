import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/calculations.dart';
import '../utils/localized_data.dart';
import 'growth_analysis_flow.dart';
import 'education_screen.dart';
import 'nutrition_screen.dart';
import 'progress_photos_screen.dart';
import 'posture_analysis_screen.dart';
import 'wellness_tracker_screen.dart';
import 'recipe_generator_screen.dart';
import 'leaderboard_screen.dart';
import 'progress_screen.dart';
import '../widgets/premium_paywall.dart';

// ── Greeting model ────────────────────────────────────────────────

class _GreetingData {
  final String title;
  final String? subtitle;
  final Color? subtitleColor;
  const _GreetingData({
    required this.title,
    this.subtitle,
    this.subtitleColor,
  });
}

// ═══════════════════════════════════════════════════════════════════
//  HOME SCREEN
// ═══════════════════════════════════════════════════════════════════

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _anim;
  late Animation<double> _curve;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _curve = CurvedAnimation(parent: _anim, curve: Curves.easeOut);
    _anim.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _anim.forward();
    });
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  _GreetingData _buildGreeting({
    required String name,
    required int streak,
    required bool allDone,
    required bool hasRoutines,
    required int hour,
  }) {
    if (allDone && hasRoutines) {
      return _GreetingData(
        title: 'Harika iş, $name! 🎯',
        subtitle: 'Bugünkü görevlerini tamamladın.',
        subtitleColor: AppColors.success,
      );
    }
    if (streak >= 30) {
      return _GreetingData(
        title: 'Merhaba, $name',
        subtitle: '$streak günlük seri — efsane seviyedesin.',
        subtitleColor: AppColors.warning,
      );
    }
    if (streak >= 7) {
      return _GreetingData(
        title: 'Merhaba, $name',
        subtitle: '$streak günlük seri — yoluna devam et.',
        subtitleColor: AppColors.orange,
      );
    }
    if (streak >= 3) {
      return _GreetingData(
        title: 'Merhaba, $name',
        subtitle: '$streak gün art arda. Çoğu kişi bıraktı. Sen bırakmadın.',
        subtitleColor: AppColors.primaryLight,
      );
    }
    if (streak == 0) {
      if (hour < 12) {
        return _GreetingData(
          title: 'Günaydın, $name',
          subtitle: 'Yeni bir gün, yeni bir fırsat.',
        );
      } else if (hour < 18) {
        return _GreetingData(
          title: 'Merhaba, $name',
          subtitle: 'Serine başlamak için bugün harika bir gün.',
        );
      } else {
        return _GreetingData(
          title: 'İyi akşamlar, $name',
          subtitle: 'Görevleri tamamla, serine başla.',
        );
      }
    }
    // streak 1–2
    return _GreetingData(
      title: 'Merhaba, $name',
      subtitle: DateFormat(
        'EEEE, d MMMM',
        'tr',
      ).format(DateTime.now()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final profile = provider.profile;
        if (profile == null) return const SizedBox();

        final prediction = Calculations.predictFinalHeight(
          profile,
          provider.heightRecords,
        );
        final potential = prediction.finalHeight;
        final remaining =
            (potential - profile.currentHeight).clamp(0.0, 100.0);
        final waterNeed = Calculations.dailyWaterNeed(profile.weight);
        final sleepNeed = Calculations.dailySleepNeed(profile.age);

        final hour = DateTime.now().hour;
        final isEvening = hour >= 18;
        final challenges = provider.activeChallenges;
        final incompleteChallenges =
            challenges.where((c) => c['completed'] != true).length;
        final completedChallenges = challenges.length - incompleteChallenges;

        final greeting = _buildGreeting(
          name: profile.name,
          streak: provider.streak,
          allDone: provider.allRoutinesCompleted,
          hasRoutines: provider.routines.isNotEmpty,
          hour: hour,
        );

        final allTodayDone = provider.allRoutinesCompleted &&
            provider.routines.isNotEmpty &&
            incompleteChallenges == 0 &&
            challenges.isNotEmpty &&
            provider.todayWater >= waterNeed;

        return Scaffold(
          backgroundColor: const Color(0xFF08060F),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // ── Header ───────────────────────────────────────────
              SliverToBoxAdapter(
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    greeting.title,
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      letterSpacing: -0.7,
                                      height: 1.1,
                                    ),
                                  ),
                                  if (greeting.subtitle != null) ...[
                                    const SizedBox(height: 4),
                                    Text(
                                      greeting.subtitle!,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: greeting.subtitleColor ??
                                            Colors.white.withValues(alpha: 0.45),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            _StreakBadge(streak: provider.streak),
                          ],
                        ),
                        const SizedBox(height: 14),
                        _InlineXpBar(
                          level: provider.level,
                          levelTitle: localizedLevelTitle(
                            l,
                            provider.levelTitle,
                          ),
                          totalXP: provider.totalXP,
                          xpForNextLevel: provider.xpForNextLevel,
                          progress: provider.levelProgress,
                          xpToNext:
                              (provider.xpForNextLevel - provider.totalXP)
                                  .clamp(0, 999999),
                          isMaxLevel: provider.level >= 20,
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 110),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([

                    // ── 1. TODAY'S MISSION ────────────────────────────────
                    _TodayMissionCard(
                      routineCompleted: provider.completedRoutineCount,
                      routineTotal: provider.routines.length,
                      challengeCompleted: completedChallenges,
                      challengeTotal: challenges.length,
                      waterCurrent: provider.todayWater,
                      waterTarget: waterNeed,
                      allDone: allTodayDone,
                      animValue: _curve.value,
                    ),
                    const SizedBox(height: 14),

                    // ── 2. HERO HEIGHT CARD ───────────────────────────────
                    _HeroHeightCard(
                      currentHeight: profile.currentHeight,
                      potential: potential,
                      remaining: remaining,
                      isPremium: provider.isPremium,
                      routineProgress: provider.routineProgress,
                      completedCount: provider.completedRoutineCount,
                      totalCount: provider.routines.length,
                      allDone: provider.allRoutinesCompleted,
                      animValue: _curve.value,
                      startHeight: provider.heightRecords.length >= 2
                          ? provider.heightRecords.first.height
                          : null,
                      l: l,
                      onPremiumTap: () => showPremiumPaywall(context),
                    ),
                    const SizedBox(height: 14),

                    // ── 3. PEER RANK CARD ─────────────────────────────────
                    _LeaderboardCard(
                      percentile: provider.peerPercentile.toDouble(),
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => const LeaderboardScreen(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── 4. ACTIVE CHALLENGES ──────────────────────────────
                    _ChallengesSection(
                      challenges: challenges,
                      isEvening: isEvening,
                      l: l,
                    ),
                    const SizedBox(height: 14),

                    // ── 5. WATER + SLEEP ──────────────────────────────────
                    Row(
                      children: [
                        Expanded(
                          child: _TrackCard(
                            icon: CupertinoIcons.drop_fill,
                            label: 'Su',
                            value: provider.todayWater.toStringAsFixed(1),
                            target: waterNeed.toStringAsFixed(1),
                            unit: 'L',
                            color: AppColors.water,
                            progress: (provider.todayWater / waterNeed)
                                .clamp(0.0, 1.0),
                            isUrgent: isEvening &&
                                provider.todayWater < waterNeed * 0.6,
                            onTap: provider.isPremium
                                ? () => _showWaterSheet(context, provider)
                                : () => showPremiumPaywall(context),
                            onAdd: provider.isPremium
                                ? () => provider.addWater(0.3)
                                : () => showPremiumPaywall(context),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _TrackCard(
                            icon: CupertinoIcons.moon_fill,
                            label: 'Uyku',
                            value: provider.todaySleep.toStringAsFixed(1),
                            target: sleepNeed.toStringAsFixed(1),
                            unit: l.hoursShort,
                            color: AppColors.sleep,
                            progress: (provider.todaySleep / sleepNeed)
                                .clamp(0.0, 1.0),
                            isUrgent: isEvening &&
                                provider.todaySleep < sleepNeed * 0.5,
                            onTap: provider.isPremium
                                ? () => _showSleepSheet(
                                    context, provider, sleepNeed)
                                : () => showPremiumPaywall(context),
                            onAdd: provider.isPremium
                                ? () => _showSleepSheet(
                                    context, provider, sleepNeed)
                                : () => showPremiumPaywall(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // ── 6. GROWTH STATS (only with 2+ records) ────────────
                    if (provider.heightRecords.length >= 2) ...[
                      _GrowthStatsCard(
                        totalGrowth: provider.totalGrowth,
                        lastGrowth: provider.lastGrowth,
                        measurementCount: provider.heightRecords.length,
                        hasData: true,
                        l: l,
                      ),
                      const SizedBox(height: 14),
                    ],

                    // ── 7. AI ANALYSIS (only before first completion) ─────
                    if (!provider.analysisCompleted) ...[
                      _BannerCard(
                        label: 'AI ANALİZ',
                        title: l.startAnalysis,
                        subtitle: l.analysisSubtitle,
                        accentColor: AppColors.primary,
                        gradientColors: const [
                          Color(0xFF3B1F8C),
                          Color(0xFF1A0D45),
                        ],
                        icon: CupertinoIcons.sparkles,
                        locked: !provider.isPremium,
                        onTap: provider.isPremium
                            ? () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => const GrowthAnalysisFlow(),
                                ))
                            : () => showPremiumPaywall(context),
                      ),
                      const SizedBox(height: 14),
                    ],

                    // ── 8. KEŞFET COMPACT ROW ─────────────────────────────
                    const _ExploreRow(),
                    const SizedBox(height: 14),

                    // ── AI ANALYSIS UPDATE (after first completion) ──────
                    if (provider.analysisCompleted) ...[
                      _BannerCard(
                        label: 'AI ANALİZ',
                        title: l.updateAnalysis,
                        subtitle: l.analysisSubtitle,
                        accentColor: AppColors.primary,
                        gradientColors: const [
                          Color(0xFF3B1F8C),
                          Color(0xFF1A0D45),
                        ],
                        icon: CupertinoIcons.sparkles,
                        locked: !provider.isPremium,
                        onTap: provider.isPremium
                            ? () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => const GrowthAnalysisFlow(),
                                ))
                            : () => showPremiumPaywall(context),
                      ),
                      const SizedBox(height: 14),
                    ],

                    // ── 9. EDUCATION BANNER ───────────────────────────────
                    _BannerCard(
                      label: 'EĞİTİM',
                      title: 'Boy uzatma\nbilimi',
                      subtitle: 'Uzman içerikler, araştırmalar ve rehberler',
                      accentColor: AppColors.cyan,
                      gradientColors: const [
                        Color(0xFF062533),
                        Color(0xFF030E18),
                      ],
                      icon: CupertinoIcons.book_fill,
                      locked: false,
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => const EducationScreen(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── 10. DAILY TIP ─────────────────────────────────────
                    _DailyTipCard(
                      tip: localizedTip(
                        l,
                        DateTime.now()
                            .difference(DateTime(DateTime.now().year, 1, 1))
                            .inDays,
                      ),
                      l: l,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showWaterSheet(BuildContext context, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          border: Border(
            top: BorderSide(color: Colors.white.withValues(alpha: 0.14)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.40),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              l.waterTracking,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.8,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l.waterToday(provider.todayWater.toStringAsFixed(1)),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _WaterButton(
                  label: '0.2L',
                  onTap: () {
                    provider.addWater(0.2);
                    Navigator.pop(context);
                  },
                ),
                _WaterButton(
                  label: '0.3L',
                  onTap: () {
                    provider.addWater(0.3);
                    Navigator.pop(context);
                  },
                ),
                _WaterButton(
                  label: '0.5L',
                  onTap: () {
                    provider.addWater(0.5);
                    Navigator.pop(context);
                  },
                ),
                _WaterButton(
                  label: '1.0L',
                  onTap: () {
                    provider.addWater(1.0);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showSleepSheet(
    BuildContext context,
    AppProvider provider,
    double sleepNeed,
  ) {
    final l = AppLocalizations.of(context)!;
    double selectedHours =
        provider.todaySleep > 0 ? provider.todaySleep : sleepNeed;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(28)),
            border: Border(
              top: BorderSide(color: Colors.white.withValues(alpha: 0.14)),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.40),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                l.sleepTracking,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l.sleepTarget(sleepNeed.toStringAsFixed(1)),
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                selectedHours.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w800,
                  color: AppColors.sleep,
                  letterSpacing: -2,
                  shadows: [
                    Shadow(
                      color: AppColors.sleep.withValues(alpha: 0.2),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
              Text(
                l.hours,
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 8),
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: AppColors.sleep,
                  inactiveTrackColor: AppColors.sleep.withValues(alpha: 0.15),
                  thumbColor: Colors.white,
                  overlayColor: AppColors.sleep.withValues(alpha: 0.1),
                  trackHeight: 5,
                ),
                child: Slider(
                  value: selectedHours,
                  min: 0,
                  max: 14,
                  divisions: 28,
                  onChanged: (v) => setState(() => selectedHours = v),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: AppColors.sleep,
                  borderRadius: BorderRadius.circular(16),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  onPressed: () {
                    provider.updateSleep(selectedHours);
                    Navigator.pop(context);
                  },
                  child: Text(
                    l.save,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  STREAK BADGE — always visible
// ═══════════════════════════════════════════════════════════════════

class _StreakBadge extends StatelessWidget {
  final int streak;
  const _StreakBadge({required this.streak});

  @override
  Widget build(BuildContext context) {
    final active = streak > 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: active
            ? AppColors.orange.withValues(alpha: 0.14)
            : Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: active
              ? AppColors.orange.withValues(alpha: 0.28)
              : Colors.white.withValues(alpha: 0.09),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '🔥',
            style: TextStyle(
              fontSize: 15,
              color: active ? null : const Color(0x55FFFFFF),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '$streak',
            style: TextStyle(
              color: active
                  ? AppColors.orange
                  : Colors.white.withValues(alpha: 0.30),
              fontWeight: FontWeight.w800,
              fontSize: 16,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  INLINE XP BAR — compact header level/xp display
// ═══════════════════════════════════════════════════════════════════

class _InlineXpBar extends StatelessWidget {
  final int level;
  final String levelTitle;
  final int totalXP;
  final int xpForNextLevel;
  final double progress;
  final int xpToNext;
  final bool isMaxLevel;

  const _InlineXpBar({
    required this.level,
    required this.levelTitle,
    required this.totalXP,
    required this.xpForNextLevel,
    required this.progress,
    required this.xpToNext,
    required this.isMaxLevel,
  });

  @override
  Widget build(BuildContext context) {
    final isNearLevelUp = !isMaxLevel && xpToNext <= 50;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  gradient: AppColors.gradientCyan,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'LVL $level',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                levelTitle,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.70),
                ),
              ),
              const Spacer(),
              if (isMaxLevel)
                Text(
                  'MAX ✦',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppColors.warning,
                  ),
                )
              else if (isNearLevelUp)
                Text(
                  '⚡ $xpToNext XP kaldı',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.warning,
                  ),
                )
              else
                Text(
                  '$totalXP / $xpForNextLevel XP',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withValues(alpha: 0.38),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              height: 5,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: isMaxLevel ? 1.0 : progress),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeOutCubic,
                builder: (context, value, _) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(4),
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
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  TODAY'S MISSION CARD — consolidated daily overview
// ═══════════════════════════════════════════════════════════════════

class _TodayMissionCard extends StatelessWidget {
  final int routineCompleted;
  final int routineTotal;
  final int challengeCompleted;
  final int challengeTotal;
  final double waterCurrent;
  final double waterTarget;
  final bool allDone;
  final double animValue;

  const _TodayMissionCard({
    required this.routineCompleted,
    required this.routineTotal,
    required this.challengeCompleted,
    required this.challengeTotal,
    required this.waterCurrent,
    required this.waterTarget,
    required this.allDone,
    required this.animValue,
  });

  @override
  Widget build(BuildContext context) {
    final routineRatio =
        routineTotal > 0 ? routineCompleted / routineTotal : 0.0;
    final challengeRatio =
        challengeTotal > 0 ? challengeCompleted / challengeTotal : 0.0;
    final waterRatio =
        waterTarget > 0 ? (waterCurrent / waterTarget).clamp(0.0, 1.0) : 0.0;
    final overall = ((routineRatio + challengeRatio + waterRatio) / 3 *
            animValue)
        .clamp(0.0, 1.0);
    final overallPct = (overall * 100).toInt();

    final ringColor = allDone ? AppColors.success : AppColors.primary;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: allDone
            ? LinearGradient(
                colors: [
                  AppColors.success.withValues(alpha: 0.10),
                  AppColors.success.withValues(alpha: 0.03),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: allDone ? null : Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: allDone
              ? AppColors.success.withValues(alpha: 0.22)
              : Colors.white.withValues(alpha: 0.07),
        ),
      ),
      child: Row(
        children: [
          // Progress ring
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: CircularProgressIndicator(
                      value: overall,
                      strokeWidth: 5.5,
                      backgroundColor: Colors.white.withValues(alpha: 0.08),
                      valueColor: AlwaysStoppedAnimation<Color>(ringColor),
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$overallPct%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: allDone ? AppColors.success : Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 18),
          // Status rows
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allDone ? 'Bugün tamamlandı ✓' : 'Bugünkü hedefler',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                    color: allDone
                        ? AppColors.success
                        : Colors.white.withValues(alpha: 0.50),
                  ),
                ),
                const SizedBox(height: 10),
                _MissionRow(
                  icon: CupertinoIcons.checkmark_circle_fill,
                  iconColor: AppColors.primary,
                  label: 'Rutinler',
                  value: '$routineCompleted/${routineTotal > 0 ? routineTotal : "—"}',
                  done:
                      routineCompleted >= routineTotal && routineTotal > 0,
                ),
                const SizedBox(height: 7),
                _MissionRow(
                  icon: CupertinoIcons.bolt_fill,
                  iconColor: AppColors.warning,
                  label: 'Görevler',
                  value:
                      '$challengeCompleted/${challengeTotal > 0 ? challengeTotal : "—"}',
                  done: challengeCompleted >= challengeTotal &&
                      challengeTotal > 0,
                ),
                const SizedBox(height: 7),
                _MissionRow(
                  icon: CupertinoIcons.drop_fill,
                  iconColor: AppColors.water,
                  label: 'Su',
                  value:
                      '${waterCurrent.toStringAsFixed(1)}/${waterTarget.toStringAsFixed(1)}L',
                  done: waterCurrent >= waterTarget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MissionRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final bool done;

  const _MissionRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 13,
          color: done ? AppColors.success : iconColor.withValues(alpha: 0.65),
        ),
        const SizedBox(width: 7),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withValues(alpha: 0.48),
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: done
                ? AppColors.success
                : Colors.white.withValues(alpha: 0.80),
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  HERO HEIGHT CARD
// ═══════════════════════════════════════════════════════════════════

class _HeroHeightCard extends StatelessWidget {
  final double currentHeight;
  final double potential;
  final double remaining;
  final bool isPremium;
  final double routineProgress;
  final int completedCount;
  final int totalCount;
  final bool allDone;
  final double animValue;
  final double? startHeight;
  final AppLocalizations l;
  final VoidCallback onPremiumTap;

  const _HeroHeightCard({
    required this.currentHeight,
    required this.potential,
    required this.remaining,
    required this.isPremium,
    required this.routineProgress,
    required this.completedCount,
    required this.totalCount,
    required this.allDone,
    required this.animValue,
    required this.startHeight,
    required this.l,
    required this.onPremiumTap,
  });

  @override
  Widget build(BuildContext context) {
    final delta = startHeight != null
        ? double.parse(
            (currentHeight - startHeight!).toStringAsFixed(1),
          )
        : null;
    final hasDelta = delta != null && delta > 0.05;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C0F3A), Color(0xFF0D0820)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.22)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.12),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l.heightLabel.toUpperCase(),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary.withValues(alpha: 0.80),
                  letterSpacing: 2.5,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: (allDone ? AppColors.success : AppColors.primary)
                      .withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color:
                        (allDone ? AppColors.success : AppColors.primary)
                            .withValues(alpha: 0.30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      allDone
                          ? CupertinoIcons.checkmark_circle_fill
                          : CupertinoIcons.circle,
                      size: 12,
                      color: allDone
                          ? AppColors.success
                          : AppColors.primaryLight,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$completedCount/$totalCount',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: allDone
                            ? AppColors.success
                            : AppColors.primaryLight,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                currentHeight.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -3,
                  height: 1.0,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'CM',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.40),
                  letterSpacing: 1,
                ),
              ),
              if (hasDelta) ...[
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.success.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Text(
                    '+${delta.toStringAsFixed(1)} cm',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: AppColors.success,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10),

          Row(
            children: [
              Text(
                '${l.target}: ${potential.toStringAsFixed(1)} cm',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.45),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              isPremium
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.30),
                        ),
                      ),
                      child: Text(
                        l.remaining(remaining.toStringAsFixed(1)),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryLight,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: onPremiumTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD700).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color:
                                const Color(0xFFFFD700).withValues(alpha: 0.28),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.lock_fill,
                              size: 11,
                              color: Color(0xFFFFD700),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              l.premiumBadge,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFD700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          const SizedBox(height: 18),

          GlowProgressBar(
            value: (potential > currentHeight + 0.1)
                ? ((currentHeight - 140) / (potential - 140)).clamp(0.0, 1.0) *
                    animValue
                : animValue,
            gradient: AppColors.gradientGrowth,
            glowColor: AppColors.primary,
            height: 7,
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Text(
                l.dailyRoutines,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.50),
                ),
              ),
              const Spacer(),
              Text(
                allDone
                    ? l.allRoutinesDone
                    : '${(routineProgress * 100 * animValue).toInt()}%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: allDone ? AppColors.success : AppColors.primaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          GlowProgressBar(
            value: routineProgress * animValue,
            gradient: allDone
                ? const LinearGradient(
                    colors: [AppColors.success, AppColors.lime],
                  )
                : AppColors.gradientPrimary,
            glowColor: allDone ? AppColors.success : AppColors.primary,
            height: 5,
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  BANNER CARD — large feature card
// ═══════════════════════════════════════════════════════════════════

class _BannerCard extends StatefulWidget {
  final String label;
  final String title;
  final String subtitle;
  final Color accentColor;
  final List<Color> gradientColors;
  final IconData icon;
  final bool locked;
  final VoidCallback onTap;

  const _BannerCard({
    required this.label,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.gradientColors,
    required this.icon,
    required this.locked,
    required this.onTap,
  });

  @override
  State<_BannerCard> createState() => _BannerCardState();
}

class _BannerCardState extends State<_BannerCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: widget.accentColor.withValues(alpha: 0.25),
            ),
            boxShadow: [
              BoxShadow(
                color: widget.accentColor.withValues(alpha: 0.10),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: widget.accentColor.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.locked)
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Icon(
                                CupertinoIcons.lock_fill,
                                size: 9,
                                color: widget.accentColor,
                              ),
                            ),
                          Text(
                            widget.label,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: widget.accentColor,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.5,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withValues(alpha: 0.60),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.accentColor.withValues(alpha: 0.12),
                  border: Border.all(
                    color: widget.accentColor.withValues(alpha: 0.25),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.accentColor.withValues(alpha: 0.25),
                      blurRadius: 18,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Icon(widget.icon, color: widget.accentColor, size: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  TRACK CARD — Water / Sleep with urgency state
// ═══════════════════════════════════════════════════════════════════

class _TrackCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String target;
  final String unit;
  final Color color;
  final double progress;
  final bool isUrgent;
  final VoidCallback onTap;
  final VoidCallback onAdd;

  const _TrackCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.target,
    required this.unit,
    required this.color,
    required this.progress,
    required this.isUrgent,
    required this.onTap,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final displayColor = isUrgent ? AppColors.error : color;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
        decoration: BoxDecoration(
          color: displayColor.withValues(alpha: isUrgent ? 0.10 : 0.07),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: displayColor.withValues(alpha: isUrgent ? 0.30 : 0.18),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: displayColor, size: 18),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: displayColor,
                    letterSpacing: 0.2,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: displayColor.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Icon(
                      CupertinoIcons.plus,
                      color: displayColor,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
            if (isUrgent) ...[
              const SizedBox(height: 4),
              Text(
                'Geride kalıyorsun',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.error.withValues(alpha: 0.80),
                ),
              ),
            ],
            SizedBox(height: isUrgent ? 6 : 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(width: 3),
                Text(
                  '/ $target$unit',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.40),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 4,
                backgroundColor: displayColor.withValues(alpha: 0.12),
                valueColor: AlwaysStoppedAnimation<Color>(displayColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  LEADERBOARD CARD
// ═══════════════════════════════════════════════════════════════════

class _LeaderboardCard extends StatefulWidget {
  final double percentile;
  final VoidCallback onTap;
  const _LeaderboardCard({required this.percentile, required this.onTap});

  @override
  State<_LeaderboardCard> createState() => _LeaderboardCardState();
}

class _LeaderboardCardState extends State<_LeaderboardCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final topPct = (100 - widget.percentile).clamp(1, 99).toInt();
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        HapticFeedback.lightImpact();
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 110),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.warning.withValues(alpha: 0.14),
                AppColors.warning.withValues(alpha: 0.04),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.warning.withValues(alpha: 0.25),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.warning.withValues(alpha: 0.28),
                  ),
                ),
                child: const Icon(
                  CupertinoIcons.rosette,
                  color: AppColors.warning,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'AKRANLARLA KARŞILAŞTIR',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.warning,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Akranlarının Top $topPct%\'ündesin',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.warning.withValues(alpha: 0.30),
                  ),
                ),
                child: Text(
                  'TOP\n$topPct%',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: AppColors.warning,
                    letterSpacing: -0.5,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  CHALLENGES SECTION — always visible, urgency-aware
// ═══════════════════════════════════════════════════════════════════

class _ChallengesSection extends StatelessWidget {
  final List<Map<String, dynamic>> challenges;
  final bool isEvening;
  final AppLocalizations l;

  const _ChallengesSection({
    required this.challenges,
    required this.isEvening,
    required this.l,
  });

  @override
  Widget build(BuildContext context) {
    if (challenges.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(
                CupertinoIcons.bolt_fill,
                color: AppColors.warning,
                size: 18,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Günlük görevler',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Yeni görevler yakında yükleniyor.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.40),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    final incomplete =
        challenges.where((c) => c['completed'] != true).toList();
    final completed =
        challenges.where((c) => c['completed'] == true).toList();
    final toShow = [...incomplete, ...completed].take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'GÜNLÜK GÖREVLER',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.white.withValues(alpha: 0.35),
                letterSpacing: 2.0,
              ),
            ),
            const Spacer(),
            if (isEvening && incomplete.isNotEmpty)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.error.withValues(alpha: 0.22),
                  ),
                ),
                child: const Text(
                  'Bu gece bitiyor',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.error,
                  ),
                ),
              )
            else if (incomplete.isEmpty)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Hepsi tamamlandı ✓',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.success,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 10),
        ...toShow.map((challenge) {
          final progress = (challenge['progress'] as int? ?? 0);
          final target = (challenge['target'] as int? ?? 1);
          final ratio = (progress / target).clamp(0.0, 1.0);
          final isCompleted = challenge['completed'] == true;
          final xp = challenge['xpReward'] as int? ?? 20;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _ChallengeCard(
              icon: challenge['icon'] as String? ?? '🎯',
              title: localizedChallengeTitle(
                l,
                challenge['id'] as String? ?? '',
              ),
              progress: ratio,
              progressLabel: '$progress/$target',
              xpReward: xp,
              isCompleted: isCompleted,
            ),
          );
        }),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  CHALLENGE CARD — with XP reward + completed state
// ═══════════════════════════════════════════════════════════════════

class _ChallengeCard extends StatelessWidget {
  final String icon;
  final String title;
  final double progress;
  final String progressLabel;
  final int xpReward;
  final bool isCompleted;

  const _ChallengeCard({
    required this.icon,
    required this.title,
    required this.progress,
    required this.progressLabel,
    this.xpReward = 20,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isCompleted
            ? AppColors.success.withValues(alpha: 0.06)
            : AppColors.cardFill,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isCompleted
              ? AppColors.success.withValues(alpha: 0.18)
              : Colors.white.withValues(alpha: 0.08),
        ),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: isCompleted
                        ? Colors.white.withValues(alpha: 0.45)
                        : Colors.white,
                    letterSpacing: -0.2,
                    decoration:
                        isCompleted ? TextDecoration.lineThrough : null,
                    decorationColor: Colors.white.withValues(alpha: 0.30),
                  ),
                ),
                if (!isCompleted) ...[
                  const SizedBox(height: 6),
                  GlowProgressBar(
                    value: progress,
                    gradient: AppColors.gradientPrimary,
                    glowColor: AppColors.primary,
                    height: 4,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isCompleted)
                const Icon(
                  CupertinoIcons.checkmark_circle_fill,
                  color: AppColors.success,
                  size: 20,
                )
              else
                Text(
                  progressLabel,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryLight,
                    letterSpacing: -0.2,
                  ),
                ),
              const SizedBox(height: 4),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '+$xpReward XP',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColors.warning,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  EXPLORE ROW — compact horizontal scroll of feature tiles
// ═══════════════════════════════════════════════════════════════════

class _ExploreRow extends StatefulWidget {
  const _ExploreRow();

  @override
  State<_ExploreRow> createState() => _ExploreRowState();
}

class _ExploreRowState extends State<_ExploreRow> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.82);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      _ExploreItemData(
        icon: CupertinoIcons.leaf_arrow_circlepath,
        label: 'Beslenme',
        subtitle: 'Protein, kalsiyum ve vitamin rehberi',
        color: const Color(0xFF4ADE80),
        gradientColors: const [Color(0xFF064E3B), Color(0xFF0A3D2F)],
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(builder: (_) => const NutritionScreen()),
        ),
      ),
      _ExploreItemData(
        icon: Icons.accessibility_new_rounded,
        label: 'Postür Analizi',
        subtitle: 'Duruş analizi ve düzeltme önerileri',
        color: const Color(0xFFFBBF24),
        gradientColors: const [Color(0xFF422006), Color(0xFF3B1E04)],
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => const PostureAnalysisScreen(),
          ),
        ),
      ),
      _ExploreItemData(
        icon: CupertinoIcons.photo_fill_on_rectangle_fill,
        label: 'İlerleme Fotoğrafları',
        subtitle: 'Değişimi fotoğraflarla takip et',
        color: const Color(0xFF38BDF8),
        gradientColors: const [Color(0xFF0C2D48), Color(0xFF0A2440)],
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(builder: (_) => const ProgressPhotosScreen()),
        ),
      ),
      _ExploreItemData(
        icon: CupertinoIcons.heart_circle_fill,
        label: 'Sağlık Takibi',
        subtitle: 'Stres, kafein ve wellness takibi',
        color: const Color(0xFFF472B6),
        gradientColors: const [Color(0xFF4A1942), Color(0xFF3D1338)],
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => const WellnessTrackerScreen(),
          ),
        ),
      ),
      _ExploreItemData(
        icon: Icons.restaurant_rounded,
        label: 'Büyüme Tarifleri',
        subtitle: 'Büyümeyi destekleyen yemek tarifleri',
        color: const Color(0xFFFB923C),
        gradientColors: const [Color(0xFF431407), Color(0xFF3B1106)],
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(builder: (_) => const RecipeGeneratorScreen()),
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            'KEŞFET',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.35),
              letterSpacing: 2.0,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            padEnds: false,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double scale = 1.0;
                  if (_pageController.position.haveDimensions) {
                    final page = _pageController.page ?? 0.0;
                    final diff = (page - index).abs();
                    scale = (1 - diff * 0.08).clamp(0.9, 1.0);
                  }
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: _ExploreHeroCard(item: items[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ExploreItemData {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const _ExploreItemData({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
    required this.gradientColors,
    required this.onTap,
  });
}

class _ExploreHeroCard extends StatefulWidget {
  final _ExploreItemData item;
  const _ExploreHeroCard({required this.item});

  @override
  State<_ExploreHeroCard> createState() => _ExploreHeroCardState();
}

class _ExploreHeroCardState extends State<_ExploreHeroCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        HapticFeedback.lightImpact();
        item.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: item.color.withValues(alpha: 0.22),
                  blurRadius: 28,
                  offset: const Offset(0, 10),
                  spreadRadius: -2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        item.gradientColors[0],
                        item.gradientColors[1],
                        item.gradientColors[1].withValues(alpha: 0.6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: item.color.withValues(alpha: 0.18),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Large background icon — cinematic depth
                      Positioned(
                        right: -12,
                        bottom: -16,
                        child: Icon(
                          item.icon,
                          size: 110,
                          color: item.color.withValues(alpha: 0.06),
                        ),
                      ),
                      // Soft glow orb — top right
                      Positioned(
                        right: 20,
                        top: -20,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                item.color.withValues(alpha: 0.12),
                                item.color.withValues(alpha: 0.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Content
                      Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon badge
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: item.color.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: item.color.withValues(alpha: 0.28),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: item.color.withValues(alpha: 0.18),
                                    blurRadius: 12,
                                    spreadRadius: -2,
                                  ),
                                ],
                              ),
                              child: Icon(
                                item.icon,
                                color: item.color,
                                size: 21,
                              ),
                            ),
                            const Spacer(),
                            // Title
                            Text(
                              item.label,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: -0.3,
                                height: 1.15,
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Subtitle
                            Text(
                              item.subtitle,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withValues(alpha: 0.50),
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // Arrow indicator — bottom right
                      Positioned(
                        right: 18,
                        bottom: 18,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: item.color.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: item.color.withValues(alpha: 0.22),
                            ),
                          ),
                          child: Icon(
                            CupertinoIcons.arrow_right,
                            color: item.color,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  GROWTH STATS CARD — always visible, with empty state
// ═══════════════════════════════════════════════════════════════════

class _GrowthStatsCard extends StatelessWidget {
  final double totalGrowth;
  final double lastGrowth;
  final int measurementCount;
  final bool hasData;
  final AppLocalizations l;

  const _GrowthStatsCard({
    required this.totalGrowth,
    required this.lastGrowth,
    required this.measurementCount,
    required this.hasData,
    required this.l,
  });

  @override
  Widget build(BuildContext context) {
    if (!hasData) {
      return GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (_) => const ProgressScreen()),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.cardFill,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.20),
                  ),
                ),
                child: const Icon(
                  CupertinoIcons.chart_bar_fill,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Büyüme takibi',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      measurementCount == 0
                          ? 'İlk boyunu kaydet, büyümeni takip et.'
                          : 'İkinci ölçümünü kaydet, grafiğini gör.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.40),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                size: 14,
                color: Colors.white.withValues(alpha: 0.20),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BÜYÜME',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.35),
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _GrowthStat(
                label: l.total,
                value: '${totalGrowth > 0 ? '+' : ''}$totalGrowth',
                unit: 'cm',
                color: totalGrowth > 0 ? AppColors.success : AppColors.error,
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.white.withValues(alpha: 0.10),
              ),
              _GrowthStat(
                label: l.last,
                value: '${lastGrowth > 0 ? '+' : ''}$lastGrowth',
                unit: 'cm',
                color: lastGrowth > 0
                    ? AppColors.success
                    : AppColors.textSecondary,
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.white.withValues(alpha: 0.10),
              ),
              _GrowthStat(
                label: l.measurement,
                value: '$measurementCount',
                unit: '',
                color: AppColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  DAILY TIP CARD
// ═══════════════════════════════════════════════════════════════════

class _DailyTipCard extends StatelessWidget {
  final String tip;
  final AppLocalizations l;
  const _DailyTipCard({required this.tip, required this.l});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: const BoxDecoration(
        gradient: AppColors.gradientAccent,
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('💡', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Text(
                l.dailyTip.toUpperCase(),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.70),
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            tip,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.55,
              letterSpacing: -0.1,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  GROWTH STAT widget
// ═══════════════════════════════════════════════════════════════════

class _GrowthStat extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _GrowthStat({
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: color,
                  letterSpacing: -0.8,
                  shadows: [
                    Shadow(
                      color: color.withValues(alpha: 0.4),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
              if (unit.isNotEmpty)
                Text(
                  ' $unit',
                  style: TextStyle(
                    fontSize: 13,
                    color: color.withValues(alpha: 0.6),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textTertiary,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  WATER BUTTON
// ═══════════════════════════════════════════════════════════════════

class _WaterButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _WaterButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.water.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.water,
          ),
        ),
      ),
    );
  }
}
