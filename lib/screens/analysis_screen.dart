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

        final potential = Calculations.geneticPotentialHeight(profile);
        final remaining = Calculations.remainingGrowthCm(profile);
        final bmi = Calculations.calculateBMI(profile.currentHeight, profile.weight);
        final bmiCat = Calculations.bmiCategory(bmi);
        final bmiCol = Calculations.bmiColor(bmi);
        final growthPct = Calculations.growthPercentage(profile.age, profile.gender);
        final waterNeed = Calculations.dailyWaterNeed(profile.weight);
        final sleepNeed = Calculations.dailySleepNeed(profile.age);
        final calorieNeed = Calculations.dailyCalorieNeed(profile);
        final proteinNeed = Calculations.dailyProteinNeed(profile.weight);

        final progressToGoal = potential > 0
            ? (profile.currentHeight / potential).clamp(0.0, 1.0)
            : 0.0;

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
                      padding: const EdgeInsets.fromLTRB(22, 14, 22, 20),
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
                    // ── Genetic Potential ──────────────
                    GlassCard(
                      child: Column(
                        children: [
                          SectionHeader(icon: CupertinoIcons.lab_flask, title: 'Genetik Potansiyel'),
                          const SizedBox(height: 24),
                          SizedBox(
                            height: 160,
                            width: 160,
                            child: CustomPaint(
                              painter: _CircularProgressPainter(
                                progress: progressToGoal,
                                color: AppColors.primary,
                                backgroundColor: AppColors.primary.withValues(alpha: 0.12),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      potential.toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 38,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.primary,
                                        letterSpacing: -1.5,
                                      ),
                                    ),
                                    Text(
                                      'cm',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 22),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _AnalysisMini(label: 'Şu an', value: '${profile.currentHeight.toStringAsFixed(1)} cm'),
                              _AnalysisMini(label: 'Hedef', value: '${potential.toStringAsFixed(1)} cm'),
                              _AnalysisMini(label: 'Kalan', value: '${remaining.toStringAsFixed(1)} cm'),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Text(
                            'Anne: ${profile.motherHeight.toStringAsFixed(0)} cm  ·  Baba: ${profile.fatherHeight.toStringAsFixed(0)} cm',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textTertiary),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Growth Status ─────────────────
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionHeader(icon: CupertinoIcons.arrow_up_right, title: 'Büyüme Durumu'),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '%${growthPct.toStringAsFixed(1)}',
                                      style: const TextStyle(
                                        fontSize: 44,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.primary,
                                        letterSpacing: -1.5,
                                      ),
                                    ),
                                    Text('Büyüme Tamamlanma', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textSecondary, letterSpacing: -0.1)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                                decoration: BoxDecoration(
                                  color: (growthPct < 95 ? AppColors.success : AppColors.warning).withValues(alpha: 0.14),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  growthPct < 95 ? 'Devam ediyor' : 'Yavaşlıyor',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: growthPct < 95 ? AppColors.success : AppColors.warning,
                                    letterSpacing: -0.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: LinearProgressIndicator(
                              value: growthPct / 100,
                              minHeight: 8,
                              backgroundColor: Colors.white.withValues(alpha: 0.08),
                              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Kalan büyüme potansiyeli: %${(100 - growthPct).toStringAsFixed(1)}',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textTertiary),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── BMI Card ──────────────────────
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionHeader(icon: CupertinoIcons.heart_fill, title: 'Vücut Kitle İndeksi'),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Container(
                                width: 76,
                                height: 76,
                                decoration: BoxDecoration(
                                  color: bmiCol.withValues(alpha: 0.14),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    bmi.toStringAsFixed(1),
                                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: bmiCol, letterSpacing: -0.8),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 18),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: bmiCol.withValues(alpha: 0.14),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(bmiCat, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: bmiCol, letterSpacing: -0.2)),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Boy: ${profile.currentHeight.toStringAsFixed(1)} cm\nKilo: ${profile.weight.toStringAsFixed(1)} kg',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textSecondary, height: 1.5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Text(_bmiAdvice(bmiCat), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textSecondary, height: 1.5)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Daily Needs ───────────────────
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionHeader(icon: CupertinoIcons.scope, title: 'Günlük İhtiyaçların'),
                          const SizedBox(height: 18),
                          _NeedRow(icon: CupertinoIcons.drop_fill, title: 'Su', value: '${waterNeed.toStringAsFixed(1)} L', color: AppColors.water),
                          const SizedBox(height: 14),
                          _NeedRow(icon: CupertinoIcons.moon_fill, title: 'Uyku', value: '${sleepNeed.toStringAsFixed(1)} saat', color: AppColors.sleep),
                          const SizedBox(height: 14),
                          _NeedRow(icon: CupertinoIcons.flame_fill, title: 'Kalori', value: '$calorieNeed kcal', color: AppColors.error),
                          const SizedBox(height: 14),
                          _NeedRow(icon: CupertinoIcons.bolt_fill, title: 'Protein', value: '${proteinNeed.toStringAsFixed(0)} g', color: AppColors.orange),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Science Tips ──────────────────
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionHeader(icon: CupertinoIcons.book_fill, title: 'Bilimsel Bilgiler'),
                          const SizedBox(height: 18),
                          _TipItem(icon: CupertinoIcons.bandage, title: 'Büyüme Plakları', description: 'Büyüme plakları (epifiz plakları) kemiklerin uçlarındaki kıkırdak dokudur. Ergenlik sonrası kapanır. Yaşın: ${profile.age}', color: AppColors.primary),
                          const SizedBox(height: 16),
                          _TipItem(icon: CupertinoIcons.lab_flask, title: 'Büyüme Hormonu (GH)', description: 'GH hipofiz bezinden salgılanır. Derin uyku sırasında en yüksek seviyededir. Egzersiz de GH salgısını artırır.', color: AppColors.sleep),
                          const SizedBox(height: 16),
                          _TipItem(icon: CupertinoIcons.drop, title: 'Kalsiyum & D Vitamini', description: 'Kalsiyum kemik yoğunluğu için, D vitamini ise kalsiyum emilimi için gereklidir. Günde 15 dk güneşlenme önerilir.', color: AppColors.orange),
                          const SizedBox(height: 16),
                          _TipItem(icon: CupertinoIcons.sportscourt, title: 'Spor & Egzersiz', description: 'Yüzme, basketbol, voleybol ve germe egzersizleri boy uzamayı destekler. Ağır halter genç yaşta önerilmez.', color: AppColors.cyan),
                          const SizedBox(height: 16),
                          _TipItem(icon: CupertinoIcons.lab_flask, title: 'Genetik Faktör', description: 'Boy uzunluğunun %60-80\'i genetik faktörlere bağlıdır. Ancak beslenme, uyku ve egzersiz ile potansiyelin maksimuma çıkarılabilir.', color: AppColors.pink),
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

  String _bmiAdvice(String category) {
    switch (category) {
      case 'Zayıf':
        return 'BMI değerin normalin altında. Sağlıklı kilo almak için protein ve karbonhidrat alımını artır.';
      case 'Normal':
        return 'BMI değerin normal aralıkta. Harika! Dengeli beslenmeye ve egzersize devam et.';
      case 'Kilolu':
        return 'BMI değerin normalin üzerinde. Dengeli beslenme ve düzenli egzersiz ile ideal kilona ulaşabilirsin.';
      default:
        return 'BMI değerin yüksek. Bir sağlık uzmanına danışmanı öneriyoruz.';
    }
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color backgroundColor;

  _CircularProgressPainter({required this.progress, required this.color, required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final fgPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -math.pi / 2, 2 * math.pi * progress, false, fgPaint);
  }

  @override
  bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) => oldDelegate.progress != progress;
}

class _AnalysisMini extends StatelessWidget {
  final String label;
  final String value;

  const _AnalysisMini({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white.withValues(alpha: 0.90), letterSpacing: -0.3)),
        const SizedBox(height: 3),
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textTertiary, letterSpacing: 0.8)),
      ],
    );
  }
}

class _NeedRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _NeedRow({required this.icon, required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(color: color.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(14)),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(child: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.85), letterSpacing: -0.2))),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: color, letterSpacing: -0.5)),
      ],
    );
  }
}

class _TipItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _TipItem({required this.icon, required this.title, required this.description, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: color.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white.withValues(alpha: 0.90), letterSpacing: -0.3)),
              const SizedBox(height: 4),
              Text(description, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.textSecondary, height: 1.5, letterSpacing: -0.1)),
            ],
          ),
        ),
      ],
    );
  }
}
