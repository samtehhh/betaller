import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/calculations.dart';
import '../utils/localized_data.dart';
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
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF0E0920), Color(0xFF040309)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22, 12, 22, 22),
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
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 110),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      l.betallerScore.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white.withValues(alpha: 0.45),
                                        letterSpacing: 2.2,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      l.betallerScore,
                                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                // Tier badge
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: _tierColor(glowScore.total).withValues(alpha: 0.18),
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(color: _tierColor(glowScore.total).withValues(alpha: 0.45)),
                                    boxShadow: [BoxShadow(color: _tierColor(glowScore.total).withValues(alpha: 0.25), blurRadius: 12)],
                                  ),
                                  child: Text(
                                    _tierLabel(glowScore.total, l),
                                    style: TextStyle(
                                      fontSize: 16,
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
                            // ── Score breakdown with GlowProgressBar ──
                            _buildMetricRow(
                              label: l.genetic,
                              value: glowScore.genetic,
                              color: AppColors.primary,
                              gradient: AppColors.gradientPrimary,
                              anim: _barCurve,
                            ),
                            const SizedBox(height: 14),
                            _buildMetricRow(
                              label: l.growth,
                              value: glowScore.velocity,
                              color: AppColors.lime,
                              gradient: const LinearGradient(colors: [Color(0xFF22FF88), Color(0xFF00C853)]),
                              anim: _barCurve,
                            ),
                            const SizedBox(height: 14),
                            _buildMetricRow(
                              label: l.nutrition,
                              value: glowScore.nutrition,
                              color: AppColors.orange,
                              gradient: AppColors.gradientEnergy,
                              anim: _barCurve,
                            ),
                            const SizedBox(height: 14),
                            _buildMetricRow(
                              label: l.sleepLabel,
                              value: glowScore.sleep,
                              color: AppColors.sleep,
                              gradient: const LinearGradient(colors: [Color(0xFF6366F1), Color(0xFF4338CA)]),
                              anim: _barCurve,
                            ),
                            const SizedBox(height: 14),
                            _buildMetricRow(
                              label: l.discipline,
                              value: glowScore.discipline,
                              color: AppColors.warning,
                              gradient: const LinearGradient(colors: [Color(0xFFF5C542), Color(0xFFE5A813)]),
                              anim: _barCurve,
                            ),
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
                              final progress = profile.currentHeight > 0
                                  ? ((e.value - profile.currentHeight) / (prediction.finalHeight - profile.currentHeight)).clamp(0.0, 1.0)
                                  : 0.0;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 55,
                                      child: Text(
                                        l.ageYear(e.key),
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
                    const SizedBox(height: 14),

                    // ── Growth Status + Velocity ──────────
                    _buildPremiumGate(
                      isPremium: provider.isPremium,
                      context: context,
                      child: GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l.growthStatus, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.5)),
                          const SizedBox(height: 18),
                          // ── Büyüme Potansiyeli paneli — prediction ile tutarlı ──
                          Builder(builder: (_) {
                            // All values come from the SAME prediction object as Boy Tahmini card
                            final totalGain = prediction.finalHeight - profile.currentHeight;
                            final geneticGain   = prediction.geneticGain;
                            final lifestyleGain = prediction.lifestyleGain;
                            final postureGain   = prediction.postureGain;
                            // Use genetic ceiling as reference for the progress bar
                            final geneticCeiling = prediction.geneticEstimate;
                            final towardCeiling = geneticCeiling > profile.currentHeight
                                ? (profile.currentHeight / geneticCeiling).clamp(0.0, 1.0)
                                : 1.0;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Top 3-metric row — all from prediction
                                Row(children: [
                                  Expanded(child: _PotentialStatBox(
                                    emoji: '🧬',
                                    label: 'Genetik Kazanım',
                                    value: geneticGain > 0
                                        ? '+${geneticGain.toStringAsFixed(1)} cm'
                                        : 'Tavan',
                                    color: AppColors.primary,
                                  )),
                                  const SizedBox(width: 10),
                                  Expanded(child: _PotentialStatBox(
                                    emoji: '🏃',
                                    label: 'Yaşam Tarzı',
                                    value: lifestyleGain > 0
                                        ? '+${lifestyleGain.toStringAsFixed(1)} cm'
                                        : '+0 cm',
                                    color: AppColors.cyan,
                                  )),
                                  const SizedBox(width: 10),
                                  Expanded(child: _PotentialStatBox(
                                    emoji: '🦴',
                                    label: 'Postür',
                                    value: '+${postureGain.toStringAsFixed(1)} cm',
                                    color: AppColors.orange,
                                  )),
                                ]),
                                const SizedBox(height: 16),
                                // Banner: total reachable — same as finalHeight card above
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [AppColors.primary.withValues(alpha: 0.13), AppColors.cyan.withValues(alpha: 0.06)],
                                      begin: Alignment.topLeft, end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(26),
                                    border: Border.all(color: AppColors.primary.withValues(alpha: 0.22)),
                                  ),
                                  child: Row(children: [
                                    const Text('🎯', style: TextStyle(fontSize: 22)),
                                    const SizedBox(width: 12),
                                    Expanded(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ulaşabileceğin hedef boy',
                                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.55)),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          totalGain > 0
                                              ? '${prediction.finalHeight.toStringAsFixed(1)} cm  (+${totalGain.toStringAsFixed(1)} cm)'
                                              : '${prediction.finalHeight.toStringAsFixed(1)} cm',
                                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white),
                                        ),
                                      ],
                                    )),
                                  ]),
                                ),
                                const SizedBox(height: 14),
                                // Progress bar — toward genetic ceiling
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Genetik tavana ilerleme',
                                      style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.45))),
                                    Text('%${(towardCeiling * 100).floor()}',
                                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white)),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: LinearProgressIndicator(
                                    value: towardCeiling,
                                    minHeight: 8,
                                    backgroundColor: Colors.white.withValues(alpha: 0.10),
                                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
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

                    // ── Score Detail Cards ────────────────
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
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _ScoreCard(icon: CupertinoIcons.heart_fill, title: l.bmi, value: bmi.toStringAsFixed(1), subtitle: bmiCat, color: bmiCol)),
                        const SizedBox(width: 12),
                        Expanded(child: _ScoreCard(icon: CupertinoIcons.person_fill, title: l.age, value: '${profile.age}', subtitle: profile.gender == 'male' ? l.male : l.female, color: AppColors.pink)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // ── Health Disclaimer ────────────
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.03),
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(CupertinoIcons.info_circle, color: AppColors.textTertiary, size: 14),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              l.healthDisclaimerBody,
                              style: TextStyle(fontSize: 10, color: AppColors.textTertiary, height: 1.4),
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

  // ── Metric row with GlowProgressBar ──

  Widget _buildMetricRow({
    required String label,
    required int value,
    required Color color,
    required Gradient gradient,
    required Animation<double> anim,
  }) {
    return AnimatedBuilder(
      animation: anim,
      builder: (context, _) {
        final animatedValue = (value / 100) * anim.value;
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 78,
                  child: Text(
                    label.toUpperCase(),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.65),
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                Expanded(child: const SizedBox()),
                Text(
                  '${(value * anim.value).round()}/100',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: color,
                    letterSpacing: -0.3,
                    shadows: [Shadow(color: color.withValues(alpha: 0.35), blurRadius: 6)],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            GlowProgressBar(
              value: animatedValue,
              gradient: gradient,
              glowColor: color,
              height: 9,
            ),
          ],
        );
      },
    );
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
    final total = provider.routines.length;
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

// ── Sub-widgets ───────────────────────────────────────────────────

class _PotentialStatBox extends StatelessWidget {
  final String emoji, label, value;
  final Color color;

  const _PotentialStatBox({required this.emoji, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: color.withValues(alpha: 0.20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 6),
          Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: color, letterSpacing: -0.3)),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.45), height: 1.3)),
        ],
      ),
    );
  }
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
