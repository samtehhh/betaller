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

// ── Design Tokens (reference AppColors for consistency) ───────────
const double _radiusXL = 30.0;
const double _radiusL = 26.0;
const double _radiusM = 20.0;
const double _radiusS = 14.0;
const double _sectionGap = 20.0;

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
    required int streak,
    required bool allDone,
    required bool hasRoutines,
    required int hour,
    required AppLocalizations l,
  }) {
    if (allDone && hasRoutines) {
      return _GreetingData(
        title: l.greetingAllDone,
        subtitle: l.greetingAllDoneSub,
        subtitleColor: AppColors.success,
      );
    }
    if (streak >= 30) {
      return _GreetingData(
        title: 'BeTaller',
        subtitle: l.greetingStreak30(streak),
        subtitleColor: AppColors.warning,
      );
    }
    if (streak >= 7) {
      return _GreetingData(
        title: 'BeTaller',
        subtitle: l.greetingStreak7(streak),
        subtitleColor: AppColors.orange,
      );
    }
    if (streak >= 3) {
      return _GreetingData(
        title: 'BeTaller',
        subtitle: l.greetingStreak3(streak),
        subtitleColor: AppColors.primaryLight,
      );
    }
    if (streak == 0) {
      if (hour < 12) {
        return _GreetingData(
          title: 'BeTaller',
          subtitle: l.greetingMorning,
        );
      } else if (hour < 18) {
        return _GreetingData(
          title: 'BeTaller',
          subtitle: l.greetingAfternoon,
        );
      } else {
        return _GreetingData(
          title: 'BeTaller',
          subtitle: l.greetingEvening,
        );
      }
    }
    return _GreetingData(
      title: 'BeTaller',
      subtitle: DateFormat('EEEE, d MMMM', 'tr').format(DateTime.now()),
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
          streak: provider.streak,
          allDone: provider.allRoutinesCompleted,
          hasRoutines: provider.routines.isNotEmpty,
          hour: hour,
          l: l,
        );

        final allTodayDone = provider.allRoutinesCompleted &&
            provider.routines.isNotEmpty &&
            incompleteChallenges == 0 &&
            challenges.isNotEmpty &&
            provider.todayWater >= waterNeed;

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // ── Header ───────────────────────────────────────────
              SliverToBoxAdapter(
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 24, 22, 0),
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
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      letterSpacing: -1.0,
                                      height: 1.08,
                                    ),
                                  ),
                                  if (greeting.subtitle != null) ...[
                                    const SizedBox(height: 6),
                                    Text(
                                      greeting.subtitle!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: greeting.subtitleColor ??
                                            Colors.white.withValues(
                                                alpha: 0.40),
                                        letterSpacing: -0.1,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(width: 14),
                            _StreakBadge(streak: provider.streak),
                          ],
                        ),
                        const SizedBox(height: 16),
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
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(18, 10, 18, 120),
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
                    const SizedBox(height: _sectionGap),

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
                    const SizedBox(height: _sectionGap),

                    // ── 3. PEER RANK ──────────────────────────────────────
                    _LeaderboardCard(
                      percentile: provider.peerPercentile.toDouble(),
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => const LeaderboardScreen(),
                        ),
                      ),
                    ),
                    const SizedBox(height: _sectionGap),

                    // ── 4. ACTIVE CHALLENGES ──────────────────────────────
                    _ChallengesSection(
                      challenges: challenges,
                      isEvening: isEvening,
                      l: l,
                    ),
                    const SizedBox(height: _sectionGap),

                    // ── 5. WATER + SLEEP ──────────────────────────────────
                    Row(
                      children: [
                        Expanded(
                          child: _TrackCard(
                            icon: CupertinoIcons.drop_fill,
                            label: l.water,
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
                        const SizedBox(width: 12),
                        Expanded(
                          child: _TrackCard(
                            icon: CupertinoIcons.moon_fill,
                            label: l.sleepLabel,
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
                    const SizedBox(height: _sectionGap),

                    // ── 6. GROWTH STATS ───────────────────────────────────
                    if (provider.heightRecords.length >= 2) ...[
                      _GrowthStatsCard(
                        totalGrowth: provider.totalGrowth,
                        lastGrowth: provider.lastGrowth,
                        measurementCount: provider.heightRecords.length,
                        hasData: true,
                        l: l,
                      ),
                      const SizedBox(height: _sectionGap),
                    ],

                    // ── 7. AI ANALYSIS (first time) ───────────────────────
                    if (!provider.analysisCompleted) ...[
                      _BannerCard(
                        label: l.aiAnalysisLabel,
                        title: l.startAnalysis,
                        subtitle: l.analysisSubtitle,
                        accentColor: AppColors.primary,
                        gradientColors: const [
                          Color(0xFF2A1668),
                          Color(0xFF120A30),
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
                      const SizedBox(height: _sectionGap),
                    ],

                    // ── 8. KEŞFET CAROUSEL ────────────────────────────────
                    const _ExploreRow(),
                    const SizedBox(height: _sectionGap),

                    // ── AI ANALYSIS UPDATE (after completion) ─────────────
                    if (provider.analysisCompleted) ...[
                      _BannerCard(
                        label: l.aiAnalysisLabel,
                        title: l.updateAnalysis,
                        subtitle: l.analysisSubtitle,
                        accentColor: AppColors.primary,
                        gradientColors: const [
                          Color(0xFF2A1668),
                          Color(0xFF120A30),
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
                      const SizedBox(height: _sectionGap),
                    ],

                    // ── 9. EDUCATION BANNER ───────────────────────────────
                    _BannerCard(
                      label: l.educationLabel,
                      title: l.educationTitle,
                      subtitle:
                          l.educationSubtitle,
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
                    const SizedBox(height: _sectionGap),

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
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.cardFill,
          borderRadius:
              const BorderRadius.vertical(top: Radius.circular(32)),
          border: Border(
            top: BorderSide(
              color: AppColors.primary.withValues(alpha: 0.12),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.20),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              l.waterTracking,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: -1.0,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l.waterToday(provider.todayWater.toStringAsFixed(1)),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white.withValues(alpha: 0.50),
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(height: 32),
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
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: AppColors.cardFill,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(32)),
            border: Border(
              top: BorderSide(
                color: AppColors.primary.withValues(alpha: 0.12),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.20),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                l.sleepTracking,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l.sleepTarget(sleepNeed.toStringAsFixed(1)),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.45),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                selectedHours.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w900,
                  color: AppColors.sleep,
                  letterSpacing: -2,
                  shadows: [
                    Shadow(
                      color: AppColors.sleep.withValues(alpha: 0.3),
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),
              Text(
                l.hours,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.40),
                ),
              ),
              const SizedBox(height: 8),
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: AppColors.sleep,
                  inactiveTrackColor:
                      AppColors.sleep.withValues(alpha: 0.12),
                  thumbColor: Colors.white,
                  overlayColor: AppColors.sleep.withValues(alpha: 0.08),
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
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: AppColors.sleep,
                  borderRadius: BorderRadius.circular(_radiusM),
                  padding: const EdgeInsets.symmetric(vertical: 17),
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
//  STREAK BADGE — always visible, soft glow
// ═══════════════════════════════════════════════════════════════════

class _StreakBadge extends StatelessWidget {
  final int streak;
  const _StreakBadge({required this.streak});

  @override
  Widget build(BuildContext context) {
    final active = streak > 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: active
            ? AppColors.orange.withValues(alpha: 0.10)
            : Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: active
              ? AppColors.orange.withValues(alpha: 0.20)
              : Colors.white.withValues(alpha: 0.06),
        ),
        boxShadow: active
            ? [
                BoxShadow(
                  color: AppColors.orange.withValues(alpha: 0.15),
                  blurRadius: 20,
                  spreadRadius: -4,
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '🔥',
            style: TextStyle(
              fontSize: 15,
              color: active ? null : const Color(0x44FFFFFF),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$streak',
            style: TextStyle(
              color: active
                  ? AppColors.orange
                  : Colors.white.withValues(alpha: 0.25),
              fontWeight: FontWeight.w800,
              fontSize: 17,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  INLINE XP BAR — glass morphism header element
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

    return ClipRRect(
      borderRadius: BorderRadius.circular(_radiusM),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(_radiusM),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.10),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientCyan,
                      borderRadius: BorderRadius.circular(10),
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
                  const SizedBox(width: 10),
                  Text(
                    levelTitle,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.65),
                      letterSpacing: -0.2,
                    ),
                  ),
                  const Spacer(),
                  if (isMaxLevel)
                    const Text(
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
                        color: Colors.white.withValues(alpha: 0.32),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: 4,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(
                        begin: 0.0, end: isMaxLevel ? 1.0 : progress),
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeOutCubic,
                    builder: (context, value, _) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.06),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: value.clamp(0.0, 1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: AppColors.gradientCyan,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.cyan
                                        .withValues(alpha: 0.40),
                                    blurRadius: 6,
                                  ),
                                ],
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
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  TODAY'S MISSION CARD — premium glass card
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
    final l = AppLocalizations.of(context)!;
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

    final accentColor = allDone ? AppColors.success : AppColors.primary;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(_radiusXL),
        border: Border.all(
          color: accentColor.withValues(alpha: allDone ? 0.18 : 0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.12),
            blurRadius: 32,
            offset: const Offset(0, 8),
            spreadRadius: -4,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 78,
            height: 78,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: CircularProgressIndicator(
                      value: overall,
                      strokeWidth: 5,
                      backgroundColor: Colors.white.withValues(alpha: 0.06),
                      valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                ),
                Text(
                  '$overallPct%',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: allDone ? AppColors.success : Colors.white,
                    letterSpacing: -0.8,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allDone ? l.todayCompleted : l.todayGoals,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.1,
                    color: allDone
                        ? AppColors.success
                        : Colors.white.withValues(alpha: 0.45),
                  ),
                ),
                const SizedBox(height: 14),
                _MissionRow(
                  icon: CupertinoIcons.checkmark_circle_fill,
                  iconColor: AppColors.primary,
                  label: l.routinesLabel,
                  value:
                      '$routineCompleted/${routineTotal > 0 ? routineTotal : "—"}',
                  done: routineCompleted >= routineTotal &&
                      routineTotal > 0,
                ),
                const SizedBox(height: 9),
                _MissionRow(
                  icon: CupertinoIcons.bolt_fill,
                  iconColor: AppColors.warning,
                  label: l.challengesLabel,
                  value:
                      '$challengeCompleted/${challengeTotal > 0 ? challengeTotal : "—"}',
                  done: challengeCompleted >= challengeTotal &&
                      challengeTotal > 0,
                ),
                const SizedBox(height: 9),
                _MissionRow(
                  icon: CupertinoIcons.drop_fill,
                  iconColor: AppColors.water,
                  label: l.water,
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
          size: 14,
          color: done ? AppColors.success : iconColor.withValues(alpha: 0.55),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.white.withValues(alpha: 0.42),
            fontWeight: FontWeight.w500,
            letterSpacing: -0.1,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
            color: done
                ? AppColors.success
                : Colors.white.withValues(alpha: 0.78),
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  HERO HEIGHT CARD — cinematic with purple glow
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
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF18103A), Color(0xFF0A0720)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(_radiusXL),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.15),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 40,
            offset: const Offset(0, 12),
            spreadRadius: -8,
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
                  color: AppColors.primary.withValues(alpha: 0.70),
                  letterSpacing: 3.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: (allDone ? AppColors.success : AppColors.primary)
                      .withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color:
                        (allDone ? AppColors.success : AppColors.primary)
                            .withValues(alpha: 0.22),
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
          const SizedBox(height: 20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                currentHeight.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 78,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -4,
                  height: 1.0,
                  shadows: [
                    Shadow(
                      color: AppColors.primary.withValues(alpha: 0.20),
                      blurRadius: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'CM',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withValues(alpha: 0.30),
                    letterSpacing: 2,
                  ),
                ),
              ),
              if (hasDelta) ...[
                const SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.success.withValues(alpha: 0.20),
                      ),
                    ),
                    child: Text(
                      '+${delta.toStringAsFixed(1)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AppColors.success,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Text(
                '${l.target}: ${potential.toStringAsFixed(1)} cm',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.38),
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.2,
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
                        color: AppColors.primary.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color:
                              AppColors.primary.withValues(alpha: 0.22),
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
                          color: const Color(0xFFFFD700)
                              .withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0xFFFFD700)
                                .withValues(alpha: 0.20),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              CupertinoIcons.lock_fill,
                              size: 11,
                              color: Color(0xFFFFD700),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'PRO',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFFFFD700),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          const SizedBox(height: 22),

          GlowProgressBar(
            value: (potential > currentHeight + 0.1)
                ? ((currentHeight - 140) / (potential - 140))
                        .clamp(0.0, 1.0) *
                    animValue
                : animValue,
            gradient: AppColors.gradientGrowth,
            glowColor: AppColors.primary,
            height: 6,
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Text(
                l.dailyRoutines,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.40),
                  letterSpacing: -0.1,
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
                  color:
                      allDone ? AppColors.success : AppColors.primaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          GlowProgressBar(
            value: routineProgress * animValue,
            gradient: allDone
                ? const LinearGradient(
                    colors: [AppColors.success, AppColors.lime],
                  )
                : AppColors.gradientPrimary,
            glowColor: allDone ? AppColors.success : AppColors.primary,
            height: 4,
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  BANNER CARD — cinematic feature card
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
        HapticFeedback.lightImpact();
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(_radiusL),
            border: Border.all(
              color: widget.accentColor.withValues(alpha: 0.18),
            ),
            boxShadow: [
              BoxShadow(
                color: widget.accentColor.withValues(alpha: 0.12),
                blurRadius: 28,
                offset: const Offset(0, 8),
                spreadRadius: -4,
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
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: widget.accentColor.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(8),
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
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -0.6,
                        height: 1.12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withValues(alpha: 0.50),
                        height: 1.4,
                        letterSpacing: -0.1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.accentColor.withValues(alpha: 0.10),
                  border: Border.all(
                    color: widget.accentColor.withValues(alpha: 0.18),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.accentColor.withValues(alpha: 0.20),
                      blurRadius: 24,
                      spreadRadius: -2,
                    ),
                  ],
                ),
                child: Icon(
                  widget.icon,
                  color: widget.accentColor,
                  size: 30,
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
//  TRACK CARD — Water / Sleep with urgency
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
    final l = AppLocalizations.of(context)!;
    final displayColor = isUrgent ? AppColors.error : color;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 14, 18),
        decoration: BoxDecoration(
          color: AppColors.cardFill,
          borderRadius: BorderRadius.circular(_radiusL),
          border: Border.all(
            color: displayColor.withValues(alpha: isUrgent ? 0.22 : 0.10),
          ),
          boxShadow: [
            BoxShadow(
              color: displayColor.withValues(alpha: 0.08),
              blurRadius: 20,
              spreadRadius: -4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: displayColor, size: 18),
                const SizedBox(width: 7),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: displayColor,
                    letterSpacing: -0.1,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: displayColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
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
              const SizedBox(height: 5),
              Text(
                l.fallingBehind,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.error.withValues(alpha: 0.75),
                ),
              ),
            ],
            SizedBox(height: isUrgent ? 6 : 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -1.2,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '/ $target$unit',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.32),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 3,
                backgroundColor: displayColor.withValues(alpha: 0.08),
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
//  LEADERBOARD CARD — refined with haptic
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
    final l = AppLocalizations.of(context)!;
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
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: AppColors.cardFill,
            borderRadius: BorderRadius.circular(_radiusL),
            border: Border.all(
              color: AppColors.warning.withValues(alpha: 0.12),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.warning.withValues(alpha: 0.08),
                blurRadius: 24,
                spreadRadius: -6,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(
                    color: AppColors.warning.withValues(alpha: 0.18),
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
                    Text(
                      l.peerCompareLabel,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.warning.withValues(alpha: 0.80),
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l.peerCompareText(topPct),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.warning.withValues(alpha: 0.20),
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
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppColors.cardFill,
          borderRadius: BorderRadius.circular(_radiusL),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(_radiusS),
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
                  Text(
                    l.challengesLoadingTitle,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    l.challengesLoading,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.35),
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
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            children: [
              Text(
                l.dailyChallengesLabel,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.30),
                  letterSpacing: 2.5,
                ),
              ),
              const Spacer(),
              if (isEvening && incomplete.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.error.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.error.withValues(alpha: 0.18),
                    ),
                  ),
                  child: Text(
                    l.expiresTonight,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.error,
                    ),
                  ),
                )
              else if (incomplete.isEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    l.allChallengesCompleted,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.success,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ...toShow.map((challenge) {
          final progress = (challenge['progress'] as int? ?? 0);
          final target = (challenge['target'] as int? ?? 1);
          final ratio = (progress / target).clamp(0.0, 1.0);
          final isCompleted = challenge['completed'] == true;
          final xp = challenge['xpReward'] as int? ?? 20;
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
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
//  CHALLENGE CARD — with XP + completed state
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
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: isCompleted
            ? AppColors.success.withValues(alpha: 0.04)
            : AppColors.cardFill,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isCompleted
              ? AppColors.success.withValues(alpha: 0.14)
              : Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isCompleted
                        ? Colors.white.withValues(alpha: 0.40)
                        : Colors.white,
                    letterSpacing: -0.2,
                    decoration:
                        isCompleted ? TextDecoration.lineThrough : null,
                    decorationColor: Colors.white.withValues(alpha: 0.25),
                  ),
                ),
                if (!isCompleted) ...[
                  const SizedBox(height: 8),
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
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isCompleted)
                const Icon(
                  CupertinoIcons.checkmark_circle_fill,
                  color: AppColors.success,
                  size: 22,
                )
              else
                Text(
                  progressLabel,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryLight,
                    letterSpacing: -0.3,
                  ),
                ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(8),
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
//  EXPLORE CAROUSEL — cinematic glassmorphism hero cards
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
    final l = AppLocalizations.of(context)!;
    final items = [
      _ExploreItemData(
        icon: Icons.accessibility_new_rounded,
        label: l.explorePosture,
        subtitle: l.explorePostureSub,
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
        label: l.explorePhotos,
        subtitle: l.explorePhotosSub,
        color: const Color(0xFF38BDF8),
        gradientColors: const [Color(0xFF0C2D48), Color(0xFF0A2440)],
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (_) => const ProgressPhotosScreen()),
        ),
      ),
      _ExploreItemData(
        icon: CupertinoIcons.leaf_arrow_circlepath,
        label: l.exploreNutrition,
        subtitle: l.exploreNutritionSub,
        color: const Color(0xFF4ADE80),
        gradientColors: const [Color(0xFF064E3B), Color(0xFF0A3D2F)],
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(builder: (_) => const NutritionScreen()),
        ),
      ),
      _ExploreItemData(
        icon: CupertinoIcons.heart_circle_fill,
        label: l.exploreHealth,
        subtitle: l.exploreHealthSub,
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
        label: l.exploreRecipes,
        subtitle: l.exploreRecipesSub,
        color: const Color(0xFFFB923C),
        gradientColors: const [Color(0xFF431407), Color(0xFF3B1106)],
        onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (_) => const RecipeGeneratorScreen()),
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            l.exploreLabel,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.30),
              letterSpacing: 2.5,
            ),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 190,
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
                    scale = (1 - diff * 0.06).clamp(0.92, 1.0);
                  }
                  return Transform.scale(scale: scale, child: child);
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
              borderRadius: BorderRadius.circular(_radiusL),
              boxShadow: [
                BoxShadow(
                  color: item.color.withValues(alpha: 0.18),
                  blurRadius: 32,
                  offset: const Offset(0, 12),
                  spreadRadius: -6,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_radiusL),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        item.gradientColors[0],
                        item.gradientColors[1],
                        item.gradientColors[1].withValues(alpha: 0.5),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(_radiusL),
                    border: Border.all(
                      color: item.color.withValues(alpha: 0.14),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Large faded icon
                      Positioned(
                        right: -14,
                        bottom: -18,
                        child: Icon(
                          item.icon,
                          size: 120,
                          color: item.color.withValues(alpha: 0.05),
                        ),
                      ),
                      // Soft glow
                      Positioned(
                        right: 16,
                        top: -24,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                item.color.withValues(alpha: 0.10),
                                item.color.withValues(alpha: 0.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Content
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color:
                                    item.color.withValues(alpha: 0.12),
                                borderRadius:
                                    BorderRadius.circular(_radiusS),
                                border: Border.all(
                                  color: item.color
                                      .withValues(alpha: 0.22),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: item.color
                                        .withValues(alpha: 0.15),
                                    blurRadius: 14,
                                    spreadRadius: -3,
                                  ),
                                ],
                              ),
                              child: Icon(
                                item.icon,
                                color: item.color,
                                size: 22,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              item.label,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: -0.4,
                                height: 1.12,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              item.subtitle,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                                    .withValues(alpha: 0.45),
                                height: 1.3,
                                letterSpacing: -0.1,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // Arrow
                      Positioned(
                        right: 18,
                        bottom: 18,
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: item.color.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(
                              color:
                                  item.color.withValues(alpha: 0.18),
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
//  GROWTH STATS CARD
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
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: AppColors.cardFill,
            borderRadius: BorderRadius.circular(_radiusL),
            border: Border.all(
                color: Colors.white.withValues(alpha: 0.05)),
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(_radiusS),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.15),
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
                    Text(
                      l.growthTracking,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      measurementCount == 0
                          ? l.growthEmptyFirst
                          : l.growthEmptySecond,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.35),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                size: 14,
                color: Colors.white.withValues(alpha: 0.18),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(_radiusL),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.growthSectionLabel,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.30),
              letterSpacing: 2.5,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _GrowthStat(
                label: l.total,
                value: '${totalGrowth > 0 ? '+' : ''}$totalGrowth',
                unit: 'cm',
                color: totalGrowth > 0
                    ? AppColors.success
                    : AppColors.error,
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.white.withValues(alpha: 0.06),
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
                color: Colors.white.withValues(alpha: 0.06),
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
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2A1800), Color(0xFF1A0F00)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(_radiusL),
        border: Border.all(
          color: AppColors.orange.withValues(alpha: 0.14),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.orange.withValues(alpha: 0.08),
            blurRadius: 24,
            spreadRadius: -6,
          ),
        ],
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
                  color: AppColors.orange.withValues(alpha: 0.70),
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            tip,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.85),
              height: 1.6,
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
                      color: color.withValues(alpha: 0.35),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              if (unit.isNotEmpty)
                Text(
                  ' $unit',
                  style: TextStyle(
                    fontSize: 13,
                    color: color.withValues(alpha: 0.5),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.30),
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
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.water.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.water.withValues(alpha: 0.15),
          ),
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
