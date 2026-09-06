import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/calculations.dart';
import '../utils/localized_data.dart';
import 'leaderboard_screen.dart';
import '../widgets/peer_rank_card.dart';
import '../widgets/radar_chart.dart';
import '../widgets/premium_paywall.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => AnalysisScreenState();
}

class AnalysisScreenState extends State<AnalysisScreen> with SingleTickerProviderStateMixin {
  late AnimationController _barAnim;
  late Animation<double> _barCurve;

  @override
  void initState() {
    super.initState();
    _barAnim = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _barCurve = CurvedAnimation(parent: _barAnim, curve: Curves.easeOutCubic);
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _barAnim.forward(from: 0);
    });
  }

  void replayAnimation() {
    _barAnim.forward(from: 0);
  }

  @override
  void dispose() {
    _barAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final profile = provider.profile;
        if (profile == null) return const SizedBox();

        final bmi = Calculations.calculateBMI(profile.currentHeight, profile.weight);
        final bmiCat = localizedBmiCategory(l, Calculations.bmiCategory(bmi));
        final bmiCol = Calculations.bmiColor(bmi);

        final waterNeed = Calculations.dailyWaterNeed(profile.weight);
        final sleepNeed = Calculations.dailySleepNeed(profile.age);
        final calorieNeed = Calculations.dailyCalorieNeed(profile);
        final proteinNeed = Calculations.dailyProteinNeed(profile.weight);
        final velocity = Calculations.growthVelocity(provider.heightRecords);

        final glowScore = Calculations.calculateGlowUpScore(
          profile: profile,
          records: provider.heightRecords,
          routineProgress: provider.routineProgress,
          waterProgress: waterNeed > 0 ? provider.todayWater / waterNeed : 0,
          sleepHours: provider.todaySleep,
          streak: provider.streak,
        );

        // Lifestyle compliance: average of discipline + sleep + nutrition (all 0-100 → 0.0-1.0)
        final lifestyleCompliance = (glowScore.discipline + glowScore.sleep + glowScore.nutrition) / 300.0;
        final prediction = Calculations.predictFinalHeight(
          profile,
          provider.heightRecords,
          lifestyleScore: lifestyleCompliance,
        );

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  color: AppColors.scaffold,
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22, 12, 22, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.analysis.toUpperCase(),
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary,
                              letterSpacing: 2.0,
                              shadows: [Shadow(color: AppColors.primary.withValues(alpha: 0.35), blurRadius: 14)],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            l.performanceDashboard,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(alpha: 0.45),
                              letterSpacing: 2.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 110),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([

                    // ── GlowUp Score Hero Card ────────────
                    _buildPremiumGate(
                      isPremium: provider.isPremium,
                      context: context,
                      borderRadius: 32,
                      child: GlassCard(
                        borderRadius: 32,
                        glowColor: _tierColor(glowScore.total).withValues(alpha: 0.18),
                        borderColor: _tierColor(glowScore.total).withValues(alpha: 0.30),
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            // ── Header row ──
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      l.generalPerformance,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white.withValues(alpha: 0.40),
                                        letterSpacing: 2.5,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      l.betallerScore,
                                      maxLines: 2,
                                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5),
                                    ),
                                  ],
                                ),
                                ),
                                const SizedBox(width: 12),
                                // Tier badge
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: _tierColor(glowScore.total).withValues(alpha: 0.18),
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(color: _tierColor(glowScore.total).withValues(alpha: 0.45)),
                                    boxShadow: [BoxShadow(color: _tierColor(glowScore.total).withValues(alpha: 0.25), blurRadius: 12)],
                                  ),
                                  child: Text(
                                    _tierLabel(glowScore.total, l),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: _tierColor(glowScore.total),
                                      letterSpacing: 1.5,
                                      shadows: [Shadow(color: _tierColor(glowScore.total).withValues(alpha: 0.5), blurRadius: 10)],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 28),
                            // ── Big score + ring ──
                            AnimatedBuilder(
                              animation: _barAnim,
                              builder: (context, _) {
                                final a = _barCurve.value;
                                return SizedBox(
                                  height: 180,
                                  width: 180,
                                  child: CustomPaint(
                                    painter: _ScoreRingPainter(
                                      progress: (glowScore.total / 100) * a,
                                      color: _tierColor(glowScore.total),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '${(glowScore.total * a).round()}',
                                            style: TextStyle(
                                              fontSize: 72,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.white,
                                              letterSpacing: -3,
                                              height: 1,
                                              shadows: [Shadow(color: _tierColor(glowScore.total).withValues(alpha: 0.45), blurRadius: 14)],
                                            ),
                                          ),
                                          Text(
                                            '/ 100',
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.50), letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 12),
                            // ── Next tier hint ──
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.06),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                              ),
                              child: Text(
                                _nextTierHint(glowScore.total, l),
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.65), letterSpacing: 0.3),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              localizedScoreSummary(l, glowScore.summary),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.88), height: 1.4, letterSpacing: -0.1),
                            ),
                            const SizedBox(height: 28),
                            // ── The shape of the five metrics ──
                            Divider(
                                color: Colors.white.withValues(alpha: 0.07),
                                height: 1),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                Icon(CupertinoIcons.hexagon_fill,
                                    size: 14, color: AppColors.primary),
                                const SizedBox(width: 8),
                                Text(
                                  l.analysisBalance.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.3,
                                    color: Colors.white.withValues(alpha: 0.45),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            AnimatedBuilder(
                              animation: _barAnim,
                              builder: (context, _) => SizedBox(
                                height: 250,
                                child: Center(
                                  child: RadarChart(
                                    progress: _barCurve.value,
                                    axes: [
                                      RadarAxis(
                                          label: l.genetic,
                                          value: glowScore.genetic,
                                          color: AppColors.primary),
                                      RadarAxis(
                                          label: l.growth,
                                          value: glowScore.velocity,
                                          color: AppColors.lime),
                                      RadarAxis(
                                          label: l.nutrition,
                                          value: glowScore.nutrition,
                                          color: AppColors.orange),
                                      RadarAxis(
                                          label: l.sleepLabel,
                                          value: glowScore.sleep,
                                          color: AppColors.sleep),
                                      RadarAxis(
                                          label: l.discipline,
                                          value: glowScore.discipline,
                                          color: AppColors.warning),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _WeakestLink(score: glowScore, l: l),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── İyileştirme Önerileri ────────────
                    if (_getImprovements(glowScore, provider, l).isNotEmpty && provider.isPremium) ...[
                      GlassCard(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(CupertinoIcons.arrow_up_right_circle_fill, color: AppColors.lime, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  l.improveScore,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.3),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.lime.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    l.gradeProgress(glowScore.grade, _nextGrade(glowScore.grade)),
                                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: AppColors.lime, letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ..._getImprovements(glowScore, provider, l).map((tip) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [(tip['color'] as Color).withValues(alpha: 0.14), (tip['color'] as Color).withValues(alpha: 0.03)],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(26),
                                  border: Border.all(color: (tip['color'] as Color).withValues(alpha: 0.18), width: 0.5),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: (tip['color'] as Color).withValues(alpha: 0.20),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(child: Text(tip['icon'] as String, style: const TextStyle(fontSize: 18))),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tip['title'] as String,
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: tip['color'] as Color, letterSpacing: -0.2),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            tip['desc'] as String,
                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white.withValues(alpha: 0.78), height: 1.35),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: (tip['color'] as Color).withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        '+${tip['points']}',
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: tip['color'] as Color),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],

                    // ── Boy Tahmini Hero Card ─────────────
                    SectionHeader(
                      icon: CupertinoIcons.arrow_up_right_circle_fill,
                      title: l.analysisPrediction,
                      iconColor: AppColors.cyan,
                    ),
                    const SizedBox(height: 12),
                    _buildPremiumGate(
                      isPremium: provider.isPremium,
                      context: context,
                      child: GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(CupertinoIcons.sparkles, color: AppColors.cyan, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                l.heightPrediction,
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.5),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Final height prediction
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  l.predictedHeightAt21,
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.75)),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      prediction.finalHeight.toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 52,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.cyan,
                                        letterSpacing: -2,
                                        height: 1,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'cm',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.cyan.withValues(alpha: 0.6)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Year-by-year predictions
                          if (prediction.yearlyPredictions.isNotEmpty) ...[
                            Text(
                              l.yearlyPrediction,
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white.withValues(alpha: 0.82), letterSpacing: 1.2),
                            ),
                            const SizedBox(height: 12),
                            ...prediction.yearlyPredictions.entries.map((e) {
                              final heightDelta = prediction.finalHeight - profile.currentHeight;
                              final progress = heightDelta.abs() > 0.01
                                  ? ((e.value - profile.currentHeight) / heightDelta).clamp(0.0, 1.0)
                                  : 1.0;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 74,
                                      child: Text(
                                        l.ageYear(e.key),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.82)),
                                      ),
                                    ),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(3),
                                        child: LinearProgressIndicator(
                                          value: progress,
                                          minHeight: 6,
                                          backgroundColor: Colors.white.withValues(alpha: 0.12),
                                          valueColor: AlwaysStoppedAnimation(AppColors.cyan.withValues(alpha: 0.6 + progress * 0.4)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 65,
                                      child: Text(
                                        '${e.value} cm',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.cyan, letterSpacing: -0.3),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                          const SizedBox(height: 12),
                          // Method info
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.info_circle, color: Colors.white.withValues(alpha: 0.72), size: 16),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    l.predictionMethod,
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white.withValues(alpha: 0.82), height: 1.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                    const SizedBox(height: 12),

                    // ── Peer rank, right under the prediction ──
                    SectionHeader(
                      icon: CupertinoIcons.person_2_fill,
                      title: l.analysisComparison,
                      iconColor: AppColors.warning,
                    ),
                    const SizedBox(height: 12),
                    PeerRankCard(
                      percentile: provider.peerPercentile.toDouble(),
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => const LeaderboardScreen(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Growth Status + Velocity ──────────
                    SectionHeader(
                      icon: CupertinoIcons.chart_bar_alt_fill,
                      title: l.analysisGrowth,
                      iconColor: AppColors.lime,
                    ),
                    const SizedBox(height: 12),
                    _buildPremiumGate(
                      isPremium: provider.isPremium,
                      context: context,
                      child: GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // the section header above already names this card
                          Builder(builder: (_) {
                            final totalGain =
                                prediction.finalHeight - profile.currentHeight;
                            final geneticGain = prediction.geneticGain;
                            final lifestyleGain = prediction.lifestyleGain;
                            final postureGain = prediction.postureGain;
                            final geneticCeiling = prediction.geneticEstimate;
                            final towardCeiling =
                                geneticCeiling > profile.currentHeight
                                    ? (profile.currentHeight / geneticCeiling)
                                        .clamp(0.0, 1.0)
                                    : 1.0;

                            final parts = <(String, double, Color)>[
                              (l.geneticGainLabel, geneticGain, AppColors.primary),
                              (l.lifestyleLabel, lifestyleGain, AppColors.cyan),
                              (l.quickPosture, postureGain, AppColors.orange),
                            ].where((p) => p.$2 > 0.05).toList();
                            // the three sources can add up past the net gain,
                            // so shares are of their own sum, not of the total
                            final partsSum = parts.fold<double>(
                                0, (sum, p) => sum + p.$2);

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ── What is still on the table ──────────
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          l.growthRemaining.toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: 1.3,
                                            color: Colors.white
                                                .withValues(alpha: 0.40),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline:
                                              TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              '+${totalGain.toStringAsFixed(1)}',
                                              style: const TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.w900,
                                                color: AppColors.lime,
                                                letterSpacing: -2,
                                                height: 1,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              'cm',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white
                                                    .withValues(alpha: 0.45),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 9),
                                      decoration: BoxDecoration(
                                        color: AppColors.cyan
                                            .withValues(alpha: 0.11),
                                        borderRadius:
                                            BorderRadius.circular(16),
                                        border: Border.all(
                                            color: AppColors.cyan
                                                .withValues(alpha: 0.28)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            l.reachableTargetHeight,
                                            style: TextStyle(
                                              fontSize: 9.5,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white
                                                  .withValues(alpha: 0.45),
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            '${prediction.finalHeight.toStringAsFixed(1)} cm',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900,
                                              color: AppColors.cyan,
                                              letterSpacing: -0.4,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                // ── One bar, split by source ────────────
                                Text(
                                  l.growthBreakdown,
                                  style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Colors.white.withValues(alpha: 0.45),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                if (parts.isNotEmpty) ...[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: SizedBox(
                                      height: 12,
                                      child: Row(
                                        children: [
                                          for (var i = 0; i < parts.length; i++)
                                            Expanded(
                                              flex: (parts[i].$2 * 100).round(),
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    right: i == parts.length - 1
                                                        ? 0
                                                        : 2),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      parts[i].$3,
                                                      parts[i].$3.withValues(
                                                          alpha: 0.65),
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  ...parts.map((p) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 9),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 9,
                                              height: 9,
                                              decoration: BoxDecoration(
                                                color: p.$3,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                            ),
                                            const SizedBox(width: 9),
                                            Expanded(
                                              child: Text(
                                                p.$1,
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white
                                                      .withValues(alpha: 0.72),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '${partsSum <= 0 ? 0 : (p.$2 / partsSum * 100).round()}%',
                                              style: TextStyle(
                                                fontSize: 11.5,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                                    .withValues(alpha: 0.35),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              '+${p.$2.toStringAsFixed(1)} cm',
                                              style: TextStyle(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w800,
                                                color: p.$3,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],

                                const SizedBox(height: 8),

                                // ── The walk toward the genetic ceiling ──
                                Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      14, 13, 14, 14),
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.white.withValues(alpha: 0.035),
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                        color: Colors.white
                                            .withValues(alpha: 0.06)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              l.geneticCeilingProgress,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 11.5,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white
                                                    .withValues(alpha: 0.45),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '%${(towardCeiling * 100).floor()}',
                                            style: const TextStyle(
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 9),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5),
                                        child: LinearProgressIndicator(
                                          value: towardCeiling,
                                          minHeight: 8,
                                          backgroundColor: Colors.white
                                              .withValues(alpha: 0.08),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(AppColors.primary),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${profile.currentHeight.toStringAsFixed(1)} cm',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white
                                                  .withValues(alpha: 0.55),
                                            ),
                                          ),
                                          Text(
                                            '${geneticCeiling.toStringAsFixed(1)} cm',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.primary
                                                  .withValues(alpha: 0.85),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                if (velocity != null) ...[
                                  const SizedBox(height: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: _velocityColor(velocity, profile.age, profile.gender).withValues(alpha: 0.10),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(children: [
                                      Icon(CupertinoIcons.arrow_up_right, size: 13, color: _velocityColor(velocity, profile.age, profile.gender)),
                                      const SizedBox(width: 6),
                                      Text(
                                        '${velocity.toStringAsFixed(1)} ${l.cmPerYear}  •  ${l.growthRate(localizedVelocityRating(l, Calculations.growthVelocityRating(velocity, profile.age, profile.gender)))}',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: _velocityColor(velocity, profile.age, profile.gender)),
                                      ),
                                    ]),
                                  ),
                                ],
                              ],
                            );
                          }),
                        ],
                      ),
                    )),
                    const SizedBox(height: 14),

                    // ── Daily targets ─────────────────────
                    SectionHeader(
                      icon: CupertinoIcons.checkmark_seal_fill,
                      title: l.dailyNeedsTitle,
                      iconColor: AppColors.lime,
                    ),
                    const SizedBox(height: 12),
                    _buildPremiumGate(
                      isPremium: provider.isPremium,
                      context: context,
                      borderRadius: 26,
                      child: Row(
                        children: [
                          Expanded(child: _ScoreCard(icon: CupertinoIcons.bolt_fill, title: l.protein, value: '${proteinNeed.toStringAsFixed(0)}g', subtitle: l.daily, color: AppColors.lime)),
                          const SizedBox(width: 12),
                          Expanded(child: _ScoreCard(icon: CupertinoIcons.flame_fill, title: l.calories, value: '$calorieNeed', subtitle: l.kcalDay, color: AppColors.orange)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildPremiumGate(
                      isPremium: provider.isPremium,
                      context: context,
                      borderRadius: 26,
                      child: Row(
                        children: [
                          Expanded(child: _ScoreCard(icon: CupertinoIcons.moon_fill, title: l.sleepLabel, value: '${sleepNeed.toStringAsFixed(0)}${l.hoursShort}', subtitle: l.minimum, color: AppColors.sleep)),
                          const SizedBox(width: 12),
                          Expanded(child: _ScoreCard(icon: CupertinoIcons.drop_fill, title: l.water, value: '${waterNeed.toStringAsFixed(1)}L', subtitle: l.daily, color: AppColors.water)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),

                    // ── Body facts ────────────────────────
                    SectionHeader(
                      icon: CupertinoIcons.person_crop_circle_fill,
                      title: l.bodyFactsTitle,
                      iconColor: AppColors.pink,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _ScoreCard(icon: CupertinoIcons.heart_fill, title: l.bmi, value: bmi.toStringAsFixed(1), subtitle: bmiCat, color: bmiCol)),
                        const SizedBox(width: 12),
                        Expanded(child: _ScoreCard(icon: CupertinoIcons.person_fill, title: l.age, value: '${profile.age}', subtitle: profile.gender == 'male' ? l.male : l.female, color: AppColors.pink)),
                      ],
                    ),
                    const SizedBox(height: 100),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPremiumGate({
    required bool isPremium,
    required BuildContext context,
    required Widget child,
    double borderRadius = 22,
  }) {
    if (isPremium) return child;
    return PremiumLockedOverlay(
      onTap: () => showPremiumPaywall(context),
      borderRadius: borderRadius,
      child: child,
    );
  }

  // ── Tier helpers (score-based: 0-20 E, 21-40 D, 41-60 C, 61-80 B, 81-100 A) ──

  String _tierLabel(int score, AppLocalizations l) {
    if (score >= 81) return l.tierA;
    if (score >= 61) return l.tierB;
    if (score >= 41) return l.tierC;
    if (score >= 21) return l.tierD;
    return l.tierE;
  }

  Color _tierColor(int score) {
    if (score >= 81) return const Color(0xFF22FF88);   // neon green
    if (score >= 61) return const Color(0xFF8B5CF6);   // purple
    if (score >= 41) return const Color(0xFFFF8A00);   // orange
    if (score >= 21) return const Color(0xFF6366F1);   // blue-purple
    return const Color(0xFF94A3B8);                    // gray
  }

  String _nextTierHint(int score, AppLocalizations l) {
    if (score >= 81) return '${l.tierA} · ${l.maxTierReached}';
    if (score >= 61) { final pts = 81 - score; return l.nextTierHint(l.tierA, '$pts'); }
    if (score >= 41) { final pts = 61 - score; return l.nextTierHint(l.tierB, '$pts'); }
    if (score >= 21) { final pts = 41 - score; return l.nextTierHint(l.tierC, '$pts'); }
    final pts = 21 - score;
    return l.nextTierHint(l.tierD, '$pts');
  }

  String _nextGrade(String grade) {
    switch (grade) {
      case 'F': return 'D';
      case 'D': return 'C';
      case 'C': return 'B';
      case 'B': return 'A';
      case 'A': return 'S';
      default: return 'S';
    }
  }

  List<Map<String, dynamic>> _getImprovements(GlowUpScore score, AppProvider provider, AppLocalizations l) {
    final tips = <Map<String, dynamic>>[];
    final profile = provider.profile!;
    final waterNeed = Calculations.dailyWaterNeed(profile.weight);
    final sleepNeed = Calculations.dailySleepNeed(profile.age);
    final bmi = Calculations.calculateBMI(profile.currentHeight, profile.weight);
    final completed = provider.completedRoutineCount;
    final total = provider.todayRoutineTotal;
    final remaining = total - completed;

    // ── Beslenme — gerçek veriye göre ──
    String nutritionDesc;
    if (provider.todayWater < waterNeed * 0.5) {
      final kalan = (waterNeed - provider.todayWater).toStringAsFixed(1);
      nutritionDesc = l.waterHalfNotReached(kalan);
    } else if (provider.todayWater < waterNeed) {
      final kalan = (waterNeed - provider.todayWater).toStringAsFixed(1);
      nutritionDesc = l.waterAlmostDone(kalan);
    } else if (bmi < 18.5) {
      nutritionDesc = l.bmiLow(bmi.toStringAsFixed(1));
    } else if (bmi > 25) {
      nutritionDesc = l.bmiHigh(bmi.toStringAsFixed(1));
    } else {
      nutritionDesc = l.nutritionDefault;
    }

    // ── Uyku — gerçek veriye göre ──
    String sleepDesc;
    if (provider.todaySleep == 0) {
      sleepDesc = l.sleepNoRecord(sleepNeed.toStringAsFixed(0));
    } else if (provider.todaySleep < sleepNeed - 1) {
      final eksik = (sleepNeed - provider.todaySleep).toStringAsFixed(1);
      sleepDesc = l.sleepInsufficient(provider.todaySleep.toStringAsFixed(1), eksik);
    } else if (provider.todaySleep < sleepNeed) {
      sleepDesc = l.sleepAlmost(sleepNeed.toStringAsFixed(0));
    } else {
      sleepDesc = l.sleepGood;
    }

    // ── Disiplin — gerçek veriye göre ──
    String disciplineDesc;
    if (completed == 0) {
      disciplineDesc = l.noRoutinesDone(total);
    } else if (remaining > 0) {
      disciplineDesc = l.routinesPartial(completed, total, remaining);
    } else if (provider.streak < 3) {
      disciplineDesc = l.streakBuilding(3 - provider.streak);
    } else {
      disciplineDesc = l.streakContinue(provider.streak);
    }

    // ── Boy Ölçümü — gerçek veriye göre ──
    String velocityDesc;
    if (provider.heightRecords.isEmpty) {
      velocityDesc = l.noMeasurements;
    } else if (provider.heightRecords.length < 3) {
      final kalan = 3 - provider.heightRecords.length;
      velocityDesc = l.fewMeasurements(kalan);
    } else if (provider.heightRecords.length < 5) {
      velocityDesc = l.goodMeasurements(provider.heightRecords.length);
    } else {
      velocityDesc = l.keepMeasuring;
    }

    final categories = [
      {'key': 'nutrition', 'score': score.nutrition, 'color': AppColors.orange, 'icon': '🥗',
        'title': score.nutrition < 50 ? l.nutritionCritical : l.nutritionStrengthen,
        'desc': nutritionDesc,
        'points': ((90 - score.nutrition) * 0.20).round()},
      {'key': 'sleep', 'score': score.sleep, 'color': AppColors.sleep, 'icon': '😴',
        'title': provider.todaySleep == 0 ? l.sleepRecordAdd : score.sleep < 50 ? l.sleepPoor : l.sleepImprove,
        'desc': sleepDesc,
        'points': ((90 - score.sleep) * 0.15).round()},
      {'key': 'discipline', 'score': score.discipline, 'color': AppColors.lime, 'icon': '🔥',
        'title': completed == 0 ? l.startToday : remaining > 0 ? l.routinesRemaining(remaining) : l.keepStreak,
        'desc': disciplineDesc,
        'points': ((90 - score.discipline) * 0.15).round()},
      {'key': 'velocity', 'score': score.velocity, 'color': AppColors.cyan, 'icon': '📏',
        'title': provider.heightRecords.isEmpty ? l.addFirstMeasurement : l.addMeasurement,
        'desc': velocityDesc,
        'points': ((90 - score.velocity) * 0.25).round()},
    ];

    // En düşük skordan başla, max 3 öneri
    categories.sort((a, b) => (a['score'] as int).compareTo(b['score'] as int));
    for (final cat in categories) {
      if ((cat['score'] as int) < 80 && (cat['points'] as int) > 0) {
        tips.add(cat);
      }
      if (tips.length >= 3) break;
    }

    return tips;
  }

  Color _velocityColor(double velocity, int age, String gender) {
    final rating = Calculations.growthVelocityRating(velocity, age, gender);
    switch (rating) {
      case 'excellent': return AppColors.lime;
      case 'normal': return AppColors.cyan;
      case 'slow': return AppColors.warning;
      default: return AppColors.error;
    }
  }
}

// ── Score Ring Painter ────────────────────────────────────────────

class _ScoreRingPainter extends CustomPainter {
  final double progress;
  final Color color;

  _ScoreRingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Background ring
    final bgPaint = Paint()
      ..color = color.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, bgPaint);

    // Progress ring
    final fgPaint = Paint()
      ..shader = SweepGradient(
        startAngle: -math.pi / 2,
        endAngle: 3 * math.pi / 2,
        colors: [color.withValues(alpha: 0.6), color],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      fgPaint,
    );

    // Glow dot at end
    final angle = -math.pi / 2 + 2 * math.pi * progress;
    final dotX = center.dx + radius * math.cos(angle);
    final dotY = center.dy + radius * math.sin(angle);
    final glowPaint = Paint()
      ..color = color
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawCircle(Offset(dotX, dotY), 5, glowPaint);
    canvas.drawCircle(Offset(dotX, dotY), 4, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant _ScoreRingPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}

class _ScoreCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color color;

  const _ScoreCard({required this.icon, required this.title, required this.value, required this.subtitle, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.18), color.withValues(alpha: 0.04)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: color.withValues(alpha: 0.20), width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(width: 6),
              Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.88), letterSpacing: -0.1)),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: color, letterSpacing: -1, shadows: [Shadow(color: color.withValues(alpha: 0.25), blurRadius: 8)])),
          const SizedBox(height: 2),
          Text(subtitle, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.82))),
        ],
      ),
    );
  }
}


/// Points at the lowest of the five metrics: the one place where effort moves
/// the total score fastest.
class _WeakestLink extends StatelessWidget {
  final GlowUpScore score;
  final AppLocalizations l;
  const _WeakestLink({required this.score, required this.l});

  @override
  Widget build(BuildContext context) {
    final entries = <(String, int, Color, IconData)>[
      (l.genetic, score.genetic, AppColors.primary, CupertinoIcons.wand_stars),
      (l.growth, score.velocity, AppColors.lime, CupertinoIcons.arrow_up_right),
      (l.nutrition, score.nutrition, AppColors.orange, CupertinoIcons.leaf_arrow_circlepath),
      (l.sleepLabel, score.sleep, AppColors.sleep, CupertinoIcons.moon_fill),
      (l.discipline, score.discipline, AppColors.warning, CupertinoIcons.flame_fill),
    ];
    entries.sort((a, b) => a.$2.compareTo(b.$2));
    final weakest = entries.first;

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        color: weakest.$3.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: weakest.$3.withValues(alpha: 0.28)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: weakest.$3.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(weakest.$4, size: 19, color: weakest.$3),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        '${l.analysisWeakest}: ${weakest.$1}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${weakest.$2}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: weakest.$3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  l.analysisWeakestHint,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 1.35,
                    color: Colors.white.withValues(alpha: 0.52),
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
