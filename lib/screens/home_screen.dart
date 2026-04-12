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
        final remaining = (potential - profile.currentHeight).clamp(0.0, 100.0);
        final waterNeed = Calculations.dailyWaterNeed(profile.weight);
        final sleepNeed = Calculations.dailySleepNeed(profile.age);

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
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l.greeting(profile.name),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: -0.8,
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                DateFormat(
                                  'EEEE, d MMMM',
                                  Localizations.localeOf(context).languageCode,
                                ).format(DateTime.now()),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withValues(alpha: 0.45),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (provider.streak > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 9,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.orange.withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColors.orange.withValues(alpha: 0.28),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('🔥', style: TextStyle(fontSize: 17)),
                                const SizedBox(width: 5),
                                Text(
                                  '${provider.streak}',
                                  style: const TextStyle(
                                    color: AppColors.orange,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 17,
                                    letterSpacing: -0.3,
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

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 110),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([

                    // ── HERO CARD: Height ────────────────────────────────
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
                      l: l,
                      onPremiumTap: () => showPremiumPaywall(context),
                    ),
                    const SizedBox(height: 14),

                    // ── BANNER CARD: Growth Analysis ─────────────────────
                    _BannerCard(
                      label: 'AI ANALİZ',
                      title: provider.analysisCompleted
                          ? l.updateAnalysis
                          : l.startAnalysis,
                      subtitle: l.analysisSubtitle,
                      accentColor: AppColors.primary,
                      gradientColors: const [Color(0xFF3B1F8C), Color(0xFF1A0D45)],
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
                    const SizedBox(height: 10),

                    // ── TWO-COLUMN ROW: Water + Sleep ────────────────────
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
                            progress: (provider.todayWater / waterNeed).clamp(0.0, 1.0),
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
                            progress: (provider.todaySleep / sleepNeed).clamp(0.0, 1.0),
                            onTap: provider.isPremium
                                ? () => _showSleepSheet(context, provider, sleepNeed)
                                : () => showPremiumPaywall(context),
                            onAdd: provider.isPremium
                                ? () => _showSleepSheet(context, provider, sleepNeed)
                                : () => showPremiumPaywall(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // ── SECTION: Keşfet ──────────────────────────────────
                    const _SectionLabel(text: 'KEŞFET'),
                    const SizedBox(height: 10),

                    // ── LARGE BANNER: Beslenme ───────────────────────────
                    _BannerCard(
                      label: 'BESLENME',
                      title: 'Büyüme için\ndoğru beslenme',
                      subtitle: 'Protein, kalsiyum ve vitamin rehberi',
                      accentColor: AppColors.nutritionColor,
                      gradientColors: const [Color(0xFF1A3A1A), Color(0xFF0A1A0A)],
                      icon: CupertinoIcons.leaf_arrow_circlepath,
                      locked: false,
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (_) => const NutritionScreen()),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ── TWO MEDIUM CARDS: Postür + Fotoğraflar ───────────
                    Row(
                      children: [
                        Expanded(
                          child: _MediumCard(
                            label: 'POSTÜr',
                            title: 'Duruş\nAnalizi',
                            icon: Icons.accessibility_new_rounded,
                            color: AppColors.warning,
                            bgColor: const Color(0xFF1F1800),
                            onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => const PostureAnalysisScreen(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _MediumCard(
                            label: 'FOTOĞRAF',
                            title: 'İlerleme\nFotoğrafları',
                            icon: CupertinoIcons.photo_fill_on_rectangle_fill,
                            color: AppColors.lime,
                            bgColor: const Color(0xFF0F1F0A),
                            onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => const ProgressPhotosScreen(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // ── TWO MEDIUM CARDS: Sağlık + Tarifler ─────────────
                    Row(
                      children: [
                        Expanded(
                          child: _MediumCard(
                            label: 'WELLNESS',
                            title: 'Sağlık\nTakibi',
                            icon: CupertinoIcons.heart_circle_fill,
                            color: AppColors.pink,
                            bgColor: const Color(0xFF1F0A14),
                            onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => const WellnessTrackerScreen(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _MediumCard(
                            label: 'TARİFLER',
                            title: 'Büyüme\nTarifleri',
                            icon: Icons.restaurant_rounded,
                            color: AppColors.orange,
                            bgColor: const Color(0xFF1F0F00),
                            onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => const RecipeGeneratorScreen(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // ── SECTION: Öğren ───────────────────────────────────
                    const _SectionLabel(text: 'ÖĞREN'),
                    const SizedBox(height: 10),

                    // ── BANNER CARD: Eğitim ──────────────────────────────
                    _BannerCard(
                      label: 'EĞİTİM',
                      title: 'Boy uzatma\nbilimi',
                      subtitle: 'Uzman içerikler, araştırmalar ve rehberler',
                      accentColor: AppColors.cyan,
                      gradientColors: const [Color(0xFF062533), Color(0xFF030E18)],
                      icon: CupertinoIcons.book_fill,
                      locked: false,
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (_) => const EducationScreen()),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ── LEADERBOARD CARD ─────────────────────────────────
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

                    // ── Active Challenges ────────────────────────────────
                    if (provider.activeChallenges
                        .where((c) => c['completed'] != true)
                        .isNotEmpty) ...[
                      const _SectionLabel(text: 'AKTİF GÖREVLER'),
                      const SizedBox(height: 10),
                      ...provider.activeChallenges
                          .where((c) => c['completed'] != true)
                          .take(2)
                          .map((challenge) {
                        final progress = (challenge['progress'] as int? ?? 0);
                        final target = (challenge['target'] as int? ?? 1);
                        final ratio = (progress / target).clamp(0.0, 1.0);
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
                          ),
                        );
                      }),
                      const SizedBox(height: 14),
                    ],

                    // ── Growth Stats ─────────────────────────────────────
                    if (provider.heightRecords.length >= 2) ...[
                      const _SectionLabel(text: 'BÜYÜME'),
                      const SizedBox(height: 10),
                      _GrowthStatsCard(
                        totalGrowth: provider.totalGrowth,
                        lastGrowth: provider.lastGrowth,
                        measurementCount: provider.heightRecords.length,
                        l: l,
                      ),
                      const SizedBox(height: 14),
                    ],

                    // ── Daily Tip ────────────────────────────────────────
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
              width: 36, height: 5,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.40),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              l.waterTracking,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.8),
            ),
            const SizedBox(height: 8),
            Text(
              l.waterToday(provider.todayWater.toStringAsFixed(1)),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: AppColors.textSecondary, letterSpacing: -0.2),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _WaterButton(label: '0.2L', onTap: () { provider.addWater(0.2); Navigator.pop(context); }),
                _WaterButton(label: '0.3L', onTap: () { provider.addWater(0.3); Navigator.pop(context); }),
                _WaterButton(label: '0.5L', onTap: () { provider.addWater(0.5); Navigator.pop(context); }),
                _WaterButton(label: '1.0L', onTap: () { provider.addWater(1.0); Navigator.pop(context); }),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showSleepSheet(BuildContext context, AppProvider provider, double sleepNeed) {
    final l = AppLocalizations.of(context)!;
    double selectedHours = provider.todaySleep > 0 ? provider.todaySleep : sleepNeed;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.14))),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 36, height: 5, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.40), borderRadius: BorderRadius.circular(3))),
              const SizedBox(height: 28),
              Text(l.sleepTracking, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.8)),
              const SizedBox(height: 6),
              Text(l.sleepTarget(sleepNeed.toStringAsFixed(1)), style: TextStyle(fontSize: 14, color: AppColors.textSecondary)),
              const SizedBox(height: 24),
              Text(
                selectedHours.toStringAsFixed(1),
                style: TextStyle(fontSize: 52, fontWeight: FontWeight.w800, color: AppColors.sleep, letterSpacing: -2,
                  shadows: [Shadow(color: AppColors.sleep.withValues(alpha: 0.2), blurRadius: 8)]),
              ),
              Text(l.hours, style: TextStyle(fontSize: 14, color: AppColors.textSecondary)),
              const SizedBox(height: 8),
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: AppColors.sleep,
                  inactiveTrackColor: AppColors.sleep.withValues(alpha: 0.15),
                  thumbColor: Colors.white,
                  overlayColor: AppColors.sleep.withValues(alpha: 0.1),
                  trackHeight: 5,
                ),
                child: Slider(value: selectedHours, min: 0, max: 14, divisions: 28, onChanged: (v) => setState(() => selectedHours = v)),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: AppColors.sleep,
                  borderRadius: BorderRadius.circular(16),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  onPressed: () { provider.updateSleep(selectedHours); Navigator.pop(context); },
                  child: Text(l.save, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white, letterSpacing: -0.3)),
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
    required this.l,
    required this.onPremiumTap,
  });

  @override
  Widget build(BuildContext context) {
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
          // Top row: label + routine badge
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
              // Routine progress pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: (allDone ? AppColors.success : AppColors.primary).withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: (allDone ? AppColors.success : AppColors.primary).withValues(alpha: 0.30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      allDone ? CupertinoIcons.checkmark_circle_fill : CupertinoIcons.circle,
                      size: 12,
                      color: allDone ? AppColors.success : AppColors.primaryLight,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$completedCount/$totalCount',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: allDone ? AppColors.success : AppColors.primaryLight,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // BIG height number
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currentHeight.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -3,
                  height: 0.95,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 6),
                child: Text(
                  'CM',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withValues(alpha: 0.45),
                    letterSpacing: 1,
                  ),
                ),
              ),
              const Spacer(),
              // Target & remaining
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${l.target}: ${potential.toStringAsFixed(1)} cm',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.45),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  isPremium
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.primary.withValues(alpha: 0.30)),
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
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFD700).withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFFFFD700).withValues(alpha: 0.28)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(CupertinoIcons.lock_fill, size: 11, color: Color(0xFFFFD700)),
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
            ],
          ),
          const SizedBox(height: 18),

          // Progress bar
          GlowProgressBar(
            value: (potential > currentHeight + 0.1)
                ? ((currentHeight - 140) / (potential - 140)).clamp(0.0, 1.0) * animValue
                : animValue,
            gradient: AppColors.gradientGrowth,
            glowColor: AppColors.primary,
            height: 7,
          ),
          const SizedBox(height: 14),

          // Routine progress bar
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
                allDone ? l.allRoutinesDone : '${(routineProgress * 100 * animValue).toInt()}%',
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
                ? LinearGradient(colors: [AppColors.success, AppColors.lime])
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
//  BANNER CARD — Umax style large feature card
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
      onTapUp: (_) { setState(() => _pressed = false); widget.onTap(); },
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
              // Left: text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category pill
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
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
                              child: Icon(CupertinoIcons.lock_fill, size: 9, color: widget.accentColor),
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
              // Right: icon orb
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
//  MEDIUM CARD — 2-col grid card
// ═══════════════════════════════════════════════════════════════════

class _MediumCard extends StatefulWidget {
  final String label;
  final String title;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final VoidCallback onTap;

  const _MediumCard({
    required this.label,
    required this.title,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.onTap,
  });

  @override
  State<_MediumCard> createState() => _MediumCardState();
}

class _MediumCardState extends State<_MediumCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) { setState(() => _pressed = false); HapticFeedback.lightImpact(); widget.onTap(); },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 110),
        child: Container(
          height: 148,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: widget.color.withValues(alpha: 0.20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: widget.color.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: widget.color,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.3,
                  height: 1.2,
                ),
              ),
              const Spacer(),
              // Icon bottom right
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 36, height: 36,
                  decoration: BoxDecoration(
                    color: widget.color.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(widget.icon, color: widget.color, size: 18),
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
//  TRACK CARD — Water / Sleep
// ═══════════════════════════════════════════════════════════════════

class _TrackCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String target;
  final String unit;
  final Color color;
  final double progress;
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
    required this.onTap,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.18)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 18),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: color,
                    letterSpacing: 0.2,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onAdd,
                  child: Container(
                    width: 28, height: 28,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Icon(CupertinoIcons.plus, color: color, size: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: TextStyle(
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
                backgroundColor: color.withValues(alpha: 0.12),
                valueColor: AlwaysStoppedAnimation<Color>(color),
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
      onTapUp: (_) { setState(() => _pressed = false); widget.onTap(); },
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
            border: Border.all(color: AppColors.warning.withValues(alpha: 0.25)),
          ),
          child: Row(
            children: [
              Container(
                width: 52, height: 52,
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.warning.withValues(alpha: 0.28)),
                ),
                child: const Icon(CupertinoIcons.rosette, color: AppColors.warning, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'LIDERBOARD',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.warning,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Akranların arasında Top $topPct%',
                      style: const TextStyle(
                        fontSize: 16,
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
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.warning.withValues(alpha: 0.30)),
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
//  CHALLENGE CARD
// ═══════════════════════════════════════════════════════════════════

class _ChallengeCard extends StatelessWidget {
  final String icon;
  final String title;
  final double progress;
  final String progressLabel;

  const _ChallengeCard({
    required this.icon,
    required this.title,
    required this.progress,
    required this.progressLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.2),
                ),
                const SizedBox(height: 6),
                GlowProgressBar(
                  value: progress,
                  gradient: AppColors.gradientPrimary,
                  glowColor: AppColors.primary,
                  height: 5,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            progressLabel,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.primaryLight, letterSpacing: -0.2),
          ),
        ],
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
  final AppLocalizations l;

  const _GrowthStatsCard({
    required this.totalGrowth,
    required this.lastGrowth,
    required this.measurementCount,
    required this.l,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: [
          _GrowthStat(
            label: l.total,
            value: '${totalGrowth > 0 ? '+' : ''}$totalGrowth',
            unit: 'cm',
            color: totalGrowth > 0 ? AppColors.success : AppColors.error,
          ),
          Container(width: 1, height: 40, color: Colors.white.withValues(alpha: 0.10)),
          _GrowthStat(
            label: l.last,
            value: '${lastGrowth > 0 ? '+' : ''}$lastGrowth',
            unit: 'cm',
            color: lastGrowth > 0 ? AppColors.success : AppColors.textSecondary,
          ),
          Container(width: 1, height: 40, color: Colors.white.withValues(alpha: 0.10)),
          _GrowthStat(
            label: l.measurement,
            value: '$measurementCount',
            unit: '',
            color: AppColors.primary,
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
      decoration: BoxDecoration(
        gradient: AppColors.gradientAccent,
        borderRadius: BorderRadius.circular(22),
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
//  SECTION LABEL
// ═══════════════════════════════════════════════════════════════════

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Colors.white.withValues(alpha: 0.35),
        letterSpacing: 2.0,
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
                  shadows: [Shadow(color: color.withValues(alpha: 0.4), blurRadius: 8)],
                ),
              ),
              if (unit.isNotEmpty)
                Text(' $unit', style: TextStyle(fontSize: 13, color: color.withValues(alpha: 0.6))),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textTertiary, letterSpacing: 1.0),
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
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.water),
        ),
      ),
    );
  }
}
