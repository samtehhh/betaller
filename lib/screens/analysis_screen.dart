import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/calculations.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final profile = provider.profile;
        if (profile == null) return const SizedBox();

        final prediction = Calculations.predictFinalHeight(profile, provider.heightRecords);
        final bmi = Calculations.calculateBMI(profile.currentHeight, profile.weight);
        final bmiCat = Calculations.bmiCategory(bmi);
        final bmiCol = Calculations.bmiColor(bmi);
        final growthPct = Calculations.growthPercentage(profile.age, profile.gender);
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

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
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
                      child: const Text(
                        'Analiz',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                          letterSpacing: -1.2,
                        ),
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
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF2D1B69), Color(0xFF1A1145)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'BeTaller Skor',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.5),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: _gradeColor(glowScore.grade).withValues(alpha: 0.18),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: _gradeColor(glowScore.grade).withValues(alpha: 0.4)),
                                ),
                                child: Text(
                                  glowScore.grade,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: _gradeColor(glowScore.grade),
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Big score circle
                          SizedBox(
                            height: 160,
                            width: 160,
                            child: CustomPaint(
                              painter: _ScoreRingPainter(
                                progress: glowScore.total / 100,
                                color: _gradeColor(glowScore.grade),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${glowScore.total}',
                                      style: const TextStyle(
                                        fontSize: 52,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        letterSpacing: -2,
                                        height: 1,
                                      ),
                                    ),
                                    Text(
                                      '/ 100',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.82)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            glowScore.summary,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.88), height: 1.4, letterSpacing: -0.1),
                          ),
                          const SizedBox(height: 20),
                          // Score breakdown
                          Row(
                            children: [
                              _ScorePill(label: 'Genetik', value: glowScore.genetic, color: AppColors.primary),
                              const SizedBox(width: 6),
                              _ScorePill(label: 'Büyüme', value: glowScore.velocity, color: AppColors.cyan),
                              const SizedBox(width: 6),
                              _ScorePill(label: 'Beslenme', value: glowScore.nutrition, color: AppColors.orange),
                              const SizedBox(width: 6),
                              _ScorePill(label: 'Uyku', value: glowScore.sleep, color: AppColors.sleep),
                              const SizedBox(width: 6),
                              _ScorePill(label: 'Disiplin', value: glowScore.discipline, color: AppColors.lime),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── İyileştirme Önerileri ────────────
                    if (_getImprovements(glowScore, provider).isNotEmpty) ...[
                      GlassCard(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(CupertinoIcons.arrow_up_right_circle_fill, color: AppColors.lime, size: 20),
                                const SizedBox(width: 8),
                                const Text(
                                  'Skorunu Yükselt',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.3),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.lime.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '${glowScore.grade} → ${_nextGrade(glowScore.grade)}',
                                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: AppColors.lime, letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ..._getImprovements(glowScore, provider).map((tip) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [(tip['color'] as Color).withValues(alpha: 0.14), (tip['color'] as Color).withValues(alpha: 0.03)],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
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
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(CupertinoIcons.sparkles, color: AppColors.cyan, size: 20),
                              const SizedBox(width: 8),
                              const Text(
                                'Boy Tahminin',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.5),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Final height prediction
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  '21 yaşında tahmini boyun',
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
                              'YILLIK TAHMİN',
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
                                        '${e.key} yaş',
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
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.info_circle, color: Colors.white.withValues(alpha: 0.72), size: 16),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    'Genetik (anne-baba), büyüme hızı, BMI ve yaş verileri birleştirilerek hesaplanır.',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white.withValues(alpha: 0.82), height: 1.4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Growth Status + Velocity ──────────
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Büyüme Durumu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.5)),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Expanded(
                                child: _StatBlock(
                                  label: 'TAMAMLANMA',
                                  value: '%${growthPct.toStringAsFixed(0)}',
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _StatBlock(
                                  label: 'BÜYÜME HIZI',
                                  value: velocity != null ? '${velocity.toStringAsFixed(1)} cm/yıl' : 'Veri yok',
                                  color: AppColors.cyan,
                                ),
                              ),
                            ],
                          ),
                          if (velocity != null) ...[
                            const SizedBox(height: 14),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: _velocityColor(velocity, profile.age, profile.gender).withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.arrow_up_right, size: 14, color: _velocityColor(velocity, profile.age, profile.gender)),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Büyüme hızın: ${Calculations.growthVelocityRating(velocity, profile.age, profile.gender)}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: _velocityColor(velocity, profile.age, profile.gender),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          const SizedBox(height: 14),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: LinearProgressIndicator(
                              value: growthPct / 100,
                              minHeight: 8,
                              backgroundColor: Colors.white.withValues(alpha: 0.14),
                              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Score Detail Cards ────────────────
                    Row(
                      children: [
                        Expanded(child: _ScoreCard(icon: CupertinoIcons.heart_fill, title: 'BMI', value: bmi.toStringAsFixed(1), subtitle: bmiCat, color: bmiCol)),
                        const SizedBox(width: 12),
                        Expanded(child: _ScoreCard(icon: CupertinoIcons.flame_fill, title: 'Kalori', value: '$calorieNeed', subtitle: 'kcal/gün', color: AppColors.orange)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _ScoreCard(icon: CupertinoIcons.drop_fill, title: 'Su', value: '${waterNeed.toStringAsFixed(1)}L', subtitle: 'günlük', color: AppColors.water)),
                        const SizedBox(width: 12),
                        Expanded(child: _ScoreCard(icon: CupertinoIcons.bolt_fill, title: 'Protein', value: '${proteinNeed.toStringAsFixed(0)}g', subtitle: 'günlük', color: AppColors.lime)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _ScoreCard(icon: CupertinoIcons.moon_fill, title: 'Uyku', value: '${sleepNeed.toStringAsFixed(0)}sa', subtitle: 'minimum', color: AppColors.sleep)),
                        const SizedBox(width: 12),
                        Expanded(child: _ScoreCard(icon: CupertinoIcons.person_fill, title: 'Yaş', value: '${profile.age}', subtitle: profile.gender == 'male' ? 'Erkek' : 'Kadın', color: AppColors.pink)),
                      ],
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

  Color _gradeColor(String grade) {
    switch (grade) {
      case 'S': return const Color(0xFFFFD700);
      case 'A': return AppColors.lime;
      case 'B': return AppColors.cyan;
      case 'C': return AppColors.orange;
      case 'D': return AppColors.warning;
      default: return AppColors.error;
    }
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

  List<Map<String, dynamic>> _getImprovements(GlowUpScore score, AppProvider provider) {
    final tips = <Map<String, dynamic>>[];

    // En düşük skorlardan başla — en çok kazanç sağlayacak olanlar
    final categories = [
      {'key': 'nutrition', 'score': score.nutrition, 'color': AppColors.orange, 'icon': '🥗',
        'title': 'Beslenmeyi İyileştir',
        'desc': 'Günlük su hedefini tamamla ve protein alımını artır. BMI\'ını normal aralığa getir.',
        'points': ((90 - score.nutrition) * 0.20).round()},
      {'key': 'sleep', 'score': score.sleep, 'color': AppColors.sleep, 'icon': '😴',
        'title': 'Uyku Düzenini Kur',
        'desc': 'Her gece en az ${Calculations.dailySleepNeed(provider.profile!.age).toStringAsFixed(0)} saat uyu. Büyüme hormonu uykuda salgılanır.',
        'points': ((90 - score.sleep) * 0.15).round()},
      {'key': 'discipline', 'score': score.discipline, 'color': AppColors.lime, 'icon': '🔥',
        'title': 'Rutinlere Devam Et',
        'desc': 'Günlük egzersizleri tamamla ve streak\'ini koru. Düzen her şeyi değiştirir.',
        'points': ((90 - score.discipline) * 0.15).round()},
      {'key': 'velocity', 'score': score.velocity, 'color': AppColors.cyan, 'icon': '📏',
        'title': 'Boy Ölçümü Ekle',
        'desc': 'Düzenli boy ölçümleri gir. Daha fazla veri = daha doğru tahmin ve skor.',
        'points': ((90 - score.velocity) * 0.25).round()},
    ];

    // Skoru 80'in altında olanları göster, en düşükten başla
    categories.sort((a, b) => (a['score'] as int).compareTo(b['score'] as int));
    for (final cat in categories) {
      if ((cat['score'] as int) < 80 && (cat['points'] as int) > 0) {
        tips.add(cat);
      }
      if (tips.length >= 3) break; // Max 3 öneri
    }

    return tips;
  }

  Color _velocityColor(double velocity, int age, String gender) {
    final rating = Calculations.growthVelocityRating(velocity, age, gender);
    switch (rating) {
      case 'Mükemmel': return AppColors.lime;
      case 'Normal': return AppColors.cyan;
      case 'Yavaş': return AppColors.warning;
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

class _ScorePill extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _ScorePill({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text('$value', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: color, letterSpacing: -0.3)),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: color.withValues(alpha: 0.7), letterSpacing: 0.3)),
          ],
        ),
      ),
    );
  }
}

class _StatBlock extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatBlock({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.16), color.withValues(alpha: 0.04)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.20), width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color.withValues(alpha: 0.7), letterSpacing: 1.0)),
          const SizedBox(height: 6),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: color, letterSpacing: -0.5)),
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
        borderRadius: BorderRadius.circular(20),
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
          Text(value, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: color, letterSpacing: -1)),
          const SizedBox(height: 2),
          Text(subtitle, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.82))),
        ],
      ),
    );
  }
}
