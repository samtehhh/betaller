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
import '../widgets/premium_paywall.dart';
// XpBar moved to profile screen

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
      duration: const Duration(milliseconds: 1500),
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

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final anim = _curve.value;
        final profile = provider.profile;
        if (profile == null) return const SizedBox();

        final prediction = Calculations.predictFinalHeight(
          profile,
          provider.heightRecords,
        );
        final potential = prediction.finalHeight;
        final remaining = (potential - profile.currentHeight).clamp(0.0, 100.0);
        final waterNeed = Calculations.dailyWaterNeed(profile.weight);
        final sleepNeed = Calculations.dailySleepNeed(profile.age);

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: Stack(
            children: [
              // Radial glow background
              Positioned(
                top: -100,
                left: 0,
                right: 0,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 0.8,
                      colors: [
                        Color(0xFF8B5CF6).withValues(alpha: 0.12),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Main content
              CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  // ── Header (v4 Bold Hero) ────────────────────
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
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Top row: app label + greeting + streak badge
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'BETALLER',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primary,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        l.greeting(profile.name),
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        DateFormat(
                                          'd MMMM yyyy, EEEE',
                                          Localizations.localeOf(
                                            context,
                                          ).languageCode,
                                        ).format(DateTime.now()),
                                        style: TextStyle(
                                          color: Colors.white.withValues(
                                            alpha: 0.55,
                                          ),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (provider.streak > 0)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.orange.withValues(
                                          alpha: 0.15,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: AppColors.orange.withValues(
                                            alpha: 0.3,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            CupertinoIcons.flame_fill,
                                            color: AppColors.orange,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${provider.streak}',
                                            style: const TextStyle(
                                              color: AppColors.orange,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16,
                                              letterSpacing: -0.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 28),
                              // HEIGHT HERO — centred big number
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      l.heightLabel.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textTertiary,
                                        letterSpacing: 3.0,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${profile.currentHeight.toStringAsFixed(1)} CM',
                                      style: TextStyle(
                                        fontSize: 72,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        letterSpacing: -2,
                                        height: 1.0,
                                        shadows: [
                                          Shadow(
                                            color: AppColors.primary.withValues(
                                              alpha: 0.4,
                                            ),
                                            blurRadius: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    // Target & delta row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${l.target}: ${potential.toStringAsFixed(1)} cm',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.textTertiary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        if (provider.isPremium)
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.primary
                                                  .withValues(alpha: 0.12),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: AppColors.primary
                                                    .withValues(alpha: 0.3),
                                              ),
                                            ),
                                            child: Text(
                                              l.remaining(
                                                remaining.toStringAsFixed(1),
                                              ),
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          )
                                        else
                                          GestureDetector(
                                            onTap: () =>
                                                showPremiumPaywall(context),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 4,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: AppColors.primary
                                                    .withValues(alpha: 0.08),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: AppColors.primary
                                                      .withValues(alpha: 0.2),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.lock_fill,
                                                    color: AppColors.primary
                                                        .withValues(alpha: 0.5),
                                                    size: 11,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    l.premiumBadge,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColors.primary
                                                          .withValues(
                                                            alpha: 0.6,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    // Glow progress bar
                                    GlowProgressBar(
                                      value:
                                          (potential >
                                              profile.currentHeight + 0.1)
                                          ? ((profile.currentHeight - 140) /
                                                        (potential - 140))
                                                    .clamp(0.0, 1.0) *
                                                anim
                                          : anim,
                                      gradient: AppColors.gradientGrowth,
                                      glowColor: AppColors.primary,
                                      height: 8,
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
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 110),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // ── 1. Daily Progress (compact) ─────────
                        GlassCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title row with routine count badge
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    l.dailyRoutines,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          (provider.allRoutinesCompleted
                                                  ? AppColors.success
                                                  : AppColors.primary)
                                              .withValues(alpha: 0.18),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      '${provider.completedRoutineCount}/${provider.routines.length}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                        color: provider.allRoutinesCompleted
                                            ? AppColors.success
                                            : AppColors.primary,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Routine progress bar
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: LinearProgressIndicator(
                                  value: provider.routineProgress * anim,
                                  minHeight: 7,
                                  backgroundColor: Colors.white.withValues(
                                    alpha: 0.14,
                                  ),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    provider.allRoutinesCompleted
                                        ? AppColors.success
                                        : AppColors.primary,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                provider.allRoutinesCompleted
                                    ? l.allRoutinesDone
                                    : l.completed(
                                        (provider.routineProgress * 100 * anim)
                                            .toInt()
                                            .toString(),
                                      ),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: provider.allRoutinesCompleted
                                      ? AppColors.success
                                      : AppColors.textSecondary,
                                  letterSpacing: -0.1,
                                ),
                              ),
                              const SizedBox(height: 14),
                              // Water & Sleep inline stats
                              Row(
                                children: [
                                  // Water stat
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: provider.isPremium
                                          ? () => _showWaterSheet(
                                              context,
                                              provider,
                                            )
                                          : () => showPremiumPaywall(context),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.water.withValues(
                                            alpha: 0.10,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.drop_fill,
                                              color: AppColors.water,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 6),
                                            Expanded(
                                              child: Text(
                                                '${provider.todayWater.toStringAsFixed(1)}/${waterNeed.toStringAsFixed(1)}L',
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  letterSpacing: -0.3,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            GestureDetector(
                                              onTap: provider.isPremium
                                                  ? () => provider.addWater(0.3)
                                                  : () => showPremiumPaywall(
                                                      context,
                                                    ),
                                              child: Container(
                                                width: 26,
                                                height: 26,
                                                decoration: BoxDecoration(
                                                  color: AppColors.water
                                                      .withValues(alpha: 0.25),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: const Icon(
                                                  CupertinoIcons.plus,
                                                  color: AppColors.water,
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // Sleep stat
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: provider.isPremium
                                          ? () => _showSleepSheet(
                                              context,
                                              provider,
                                              sleepNeed,
                                            )
                                          : () => showPremiumPaywall(context),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.sleep.withValues(
                                            alpha: 0.10,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.moon_fill,
                                              color: AppColors.sleep,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 6),
                                            Expanded(
                                              child: Text(
                                                '${provider.todaySleep.toStringAsFixed(1)}/${sleepNeed.toStringAsFixed(1)}${l.hoursShort}',
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  letterSpacing: -0.3,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            GestureDetector(
                                              onTap: provider.isPremium
                                                  ? () => _showSleepSheet(
                                                      context,
                                                      provider,
                                                      sleepNeed,
                                                    )
                                                  : () => showPremiumPaywall(
                                                      context,
                                                    ),
                                              child: Container(
                                                width: 26,
                                                height: 26,
                                                decoration: BoxDecoration(
                                                  color: AppColors.sleep
                                                      .withValues(alpha: 0.25),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: const Icon(
                                                  CupertinoIcons.plus,
                                                  color: AppColors.sleep,
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),

                        // ── 2. Active Challenges (max 2) ────────
                        if (provider.activeChallenges
                            .where((c) => c['completed'] != true)
                            .isNotEmpty) ...[
                          ...provider.activeChallenges
                              .where((c) => c['completed'] != true)
                              .take(2)
                              .map((challenge) {
                                final progress =
                                    (challenge['progress'] as int? ?? 0);
                                final target =
                                    (challenge['target'] as int? ?? 1);
                                final ratio = (progress / target).clamp(
                                  0.0,
                                  1.0,
                                );
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: GlassCard(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          challenge['icon'] as String? ?? '🎯',
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                localizedChallengeTitle(
                                                  l,
                                                  challenge['id'] as String? ??
                                                      '',
                                                ),
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  letterSpacing: -0.2,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: LinearProgressIndicator(
                                                  value: ratio,
                                                  minHeight: 5,
                                                  backgroundColor: Colors.white
                                                      .withValues(alpha: 0.14),
                                                  valueColor:
                                                      const AlwaysStoppedAnimation<
                                                        Color
                                                      >(AppColors.primary),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '$progress/$target',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.primaryLight,
                                            letterSpacing: -0.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          const SizedBox(height: 4),
                        ],

                        // ── 3. Quick Access Grid (3x2) ──
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final tileW =
                                (constraints.maxWidth - 20) / 3; // 2 gaps of 10
                            final tileH = tileW * 0.82;
                            return Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                SizedBox(
                                  width: tileW,
                                  height: tileH,
                                  child: _QuickTile(
                                    icon: CupertinoIcons.leaf_arrow_circlepath,
                                    label: l.nutrition,
                                    color: AppColors.primary,
                                    onTap: () => Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (_) => const NutritionScreen(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: tileW,
                                  height: tileH,
                                  child: _QuickTile(
                                    icon: CupertinoIcons.book_fill,
                                    label: l.learnTitle,
                                    color: AppColors.cyan,
                                    onTap: () => Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (_) => const EducationScreen(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: tileW,
                                  height: tileH,
                                  child: _QuickTile(
                                    icon: CupertinoIcons
                                        .photo_fill_on_rectangle_fill,
                                    label: l.quickPhotos,
                                    color: AppColors.lime,
                                    onTap: () => Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (_) =>
                                            const ProgressPhotosScreen(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: tileW,
                                  height: tileH,
                                  child: _QuickTile(
                                    icon: Icons.accessibility_new_rounded,
                                    label: l.quickPosture,
                                    color: AppColors.warning,
                                    onTap: () => Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (_) =>
                                            const PostureAnalysisScreen(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: tileW,
                                  height: tileH,
                                  child: _QuickTile(
                                    icon: CupertinoIcons.heart_circle_fill,
                                    label: l.quickWellness,
                                    color: AppColors.pink,
                                    onTap: () => Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (_) =>
                                            const WellnessTrackerScreen(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: tileW,
                                  height: tileH,
                                  child: _QuickTile(
                                    icon: Icons.restaurant_rounded,
                                    label: l.quickRecipes,
                                    color: AppColors.orange,
                                    onTap: () => Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (_) =>
                                            const RecipeGeneratorScreen(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        // Leaderboard wide tile
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => const LeaderboardScreen(),
                            ),
                          ),
                          child: GlassCard(
                            glowColor: AppColors.warning.withValues(
                              alpha: 0.10,
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: AppColors.warning.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: AppColors.warning.withValues(alpha: 0.30)),
                                  ),
                                  child: const Icon(CupertinoIcons.rosette, color: AppColors.warning, size: 22),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    l.heightAnalysis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                // TOP % badge
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [AppColors.warning.withValues(alpha: 0.25), AppColors.warning.withValues(alpha: 0.10)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColors.warning.withValues(alpha: 0.35)),
                                    boxShadow: [BoxShadow(color: AppColors.warning.withValues(alpha: 0.15), blurRadius: 8)],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'TOP',
                                        style: TextStyle(fontSize: 8, fontWeight: FontWeight.w800, color: AppColors.warning.withValues(alpha: 0.70), letterSpacing: 1.0, height: 1.0),
                                      ),
                                      const SizedBox(height: 1),
                                      Text(
                                        '${(100 - provider.peerPercentile).clamp(1, 99)}%',
                                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: AppColors.warning, letterSpacing: -0.5, height: 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(CupertinoIcons.chevron_right, color: AppColors.textTertiary, size: 16),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // ── 4. Growth Analysis Entry ────────────
                        GestureDetector(
                          onTap: provider.isPremium
                              ? () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const GrowthAnalysisFlow(),
                                  ),
                                )
                              : () => showPremiumPaywall(context),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF2D1B69), Color(0xFF1A1145)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: AppColors.primary.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    gradient: AppColors.gradientPrimary,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.sparkles,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        provider.analysisCompleted
                                            ? l.updateAnalysis
                                            : l.startAnalysis,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        l.analysisSubtitle,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white.withValues(
                                            alpha: 0.80,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  provider.isPremium
                                      ? CupertinoIcons.chevron_right
                                      : CupertinoIcons.lock_fill,
                                  color: provider.isPremium
                                      ? AppColors.primaryLight
                                      : const Color(0xFFFFD700),
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // ── 5. Growth Summary ───────────────────
                        if (provider.heightRecords.length >= 2) ...[
                          GlassCard(
                            glowColor: AppColors.primary.withValues(
                              alpha: 0.08,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l.growthSummary,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    _GrowthStat(
                                      label: l.total,
                                      value:
                                          '${provider.totalGrowth > 0 ? '+' : ''}${provider.totalGrowth}',
                                      unit: 'cm',
                                      color: provider.totalGrowth > 0
                                          ? AppColors.success
                                          : AppColors.error,
                                    ),
                                    const SizedBox(width: 16),
                                    _GrowthStat(
                                      label: l.last,
                                      value:
                                          '${provider.lastGrowth > 0 ? '+' : ''}${provider.lastGrowth}',
                                      unit: 'cm',
                                      color: provider.lastGrowth > 0
                                          ? AppColors.success
                                          : AppColors.textSecondary,
                                    ),
                                    const SizedBox(width: 16),
                                    _GrowthStat(
                                      label: l.measurement,
                                      value: '${provider.heightRecords.length}',
                                      unit: '',
                                      color: AppColors.primary,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],

                        // ── 6. Daily Tip ────────────────────────
                        Container(
                          decoration: BoxDecoration(
                            gradient: AppColors.gradientAccent,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l.dailyTip,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                localizedTip(
                                  l,
                                  DateTime.now()
                                      .difference(
                                        DateTime(DateTime.now().year, 1, 1),
                                      )
                                      .inDays,
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  height: 1.55,
                                  letterSpacing: -0.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
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
              style: TextStyle(
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
    double selectedHours = provider.todaySleep > 0
        ? provider.todaySleep
        : sleepNeed;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
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
                l.sleepTracking,
                style: TextStyle(
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
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  letterSpacing: -0.2,
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
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
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
                    style: TextStyle(
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

// ── Quick Access Tile (3-column grid) ────────────────────────────

class _QuickTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickTile({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardFill,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color.withValues(alpha: 0.20), width: 0.8),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.10),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: -0.1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}


// ── Growth Stat - BIG number, tiny uppercase label ────────────────

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
          SizedBox(
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: color,
                    letterSpacing: -0.8,
                    shadows: [
                      Shadow(
                        color: color.withValues(alpha: 0.5),
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
                      fontWeight: FontWeight.w500,
                      color: color.withValues(alpha: 0.6),
                    ),
                  ),
              ],
            ),
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

// ── Water Button ──────────────────────────────────────────────────

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
          border: Border.all(color: AppColors.water.withValues(alpha: 0.30)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.water,
            letterSpacing: -0.3,
          ),
        ),
      ),
    );
  }
}
