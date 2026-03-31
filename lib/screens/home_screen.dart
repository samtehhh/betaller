import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/calculations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final profile = provider.profile;
        if (profile == null) return const SizedBox();

        final potential = Calculations.geneticPotentialHeight(profile);
        final remaining = Calculations.remainingGrowthCm(profile);
        final waterNeed = Calculations.dailyWaterNeed(profile.weight);
        final sleepNeed = Calculations.dailySleepNeed(profile.age);

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // ── Header ──────────────────────────────────
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
                      padding: const EdgeInsets.fromLTRB(22, 8, 22, 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Merhaba, ${profile.name}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 34,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: -1.2,
                                        height: 1.1,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      DateFormat('d MMMM yyyy, EEEE', 'tr').format(DateTime.now()),
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.68),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (provider.streak > 0)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.orange.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: AppColors.orange.withValues(alpha: 0.3)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(CupertinoIcons.flame_fill, color: AppColors.orange, size: 16),
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
                          const SizedBox(height: 26),
                          // Stats row - BIG numbers, tiny labels
                          Row(
                            children: [
                              _HeaderStat(label: 'Boy', value: profile.currentHeight.toStringAsFixed(1), unit: 'cm', color: AppColors.primary),
                              const SizedBox(width: 10),
                              _HeaderStat(label: 'Hedef', value: potential.toStringAsFixed(1), unit: 'cm', color: AppColors.cyan),
                              const SizedBox(width: 10),
                              _HeaderStat(label: 'Kalan', value: remaining.toStringAsFixed(1), unit: 'cm', color: AppColors.lime),
                            ],
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
                    // ── Motivational Quote ──────────────────
                    GlassCard(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              gradient: AppColors.gradientPrimary,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: const Icon(CupertinoIcons.quote_bubble_fill, color: Colors.white, size: 18),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              provider.todayQuote,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: Colors.white.withValues(alpha: 0.88),
                                height: 1.5,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Daily Routine Progress ──────────────
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Günlük Rutinler',
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
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: provider.allRoutinesCompleted ? AppColors.success : AppColors.primary,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: LinearProgressIndicator(
                              value: provider.routineProgress,
                              minHeight: 8,
                              backgroundColor: Colors.white.withValues(alpha: 0.08),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                provider.allRoutinesCompleted ? AppColors.success : AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            provider.allRoutinesCompleted
                                ? 'Tüm rutinleri tamamladın!'
                                : '%${(provider.routineProgress * 100).toInt()} tamamlandı',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: provider.allRoutinesCompleted
                                  ? AppColors.success
                                  : AppColors.textSecondary,
                              letterSpacing: -0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Water & Sleep Trackers ───────────────
                    Row(
                      children: [
                        Expanded(
                          child: _TrackerCard(
                            title: 'Su',
                            icon: CupertinoIcons.drop_fill,
                            current: provider.todayWater,
                            target: waterNeed,
                            unit: 'L',
                            color: AppColors.water,
                            onTap: () => _showWaterSheet(context, provider),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _TrackerCard(
                            title: 'Uyku',
                            icon: CupertinoIcons.moon_fill,
                            current: provider.todaySleep,
                            target: sleepNeed,
                            unit: 'sa',
                            color: AppColors.sleep,
                            onTap: () => _showSleepSheet(context, provider, sleepNeed),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // ── Growth Summary ───────────────────────
                    if (provider.heightRecords.length >= 2) ...[
                      GlassCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Büyüme Özeti',
                              style: TextStyle(
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
                                  label: 'TOPLAM',
                                  value: '${provider.totalGrowth > 0 ? '+' : ''}${provider.totalGrowth}',
                                  unit: 'cm',
                                  color: provider.totalGrowth > 0 ? AppColors.success : AppColors.error,
                                ),
                                const SizedBox(width: 16),
                                _GrowthStat(
                                  label: 'SON',
                                  value: '${provider.lastGrowth > 0 ? '+' : ''}${provider.lastGrowth}',
                                  unit: 'cm',
                                  color: provider.lastGrowth > 0 ? AppColors.success : AppColors.textSecondary,
                                ),
                                const SizedBox(width: 16),
                                _GrowthStat(
                                  label: 'ÖLÇÜM',
                                  value: '${provider.heightRecords.length}',
                                  unit: '',
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],

                    // ── Daily Tip ────────────────────────────
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
                            'Günün İpucu',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _getDailyTip(),
                            style: TextStyle(
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
        );
      },
    );
  }

  String _getDailyTip() {
    final tips = [
      'Sabah kalktığında boy ölç - gün içinde disk basıncı nedeniyle boy kısalır. En doğru ölçüm sabah yapılır.',
      'Protein alımını öğünlere eşit dağıt. Tek seferde değil, her öğünde protein al.',
      'Uyku sırasında büyüme hormonu en yüksek seviyede salgılanır. 22:00-02:00 arası uyuyor ol!',
      'Günlük 15 dakika güneşlenme D vitamini üretimini artırır. D vitamini kalsiyum emilimi için şart.',
      'Barfiks barına asılma omurgayı dekomprese eder. Her gün 3x30 saniye dene.',
      'Yüzme, tüm vücudu çalıştıran ve boy uzamayı destekleyen en iyi spordur.',
      'Stres büyüme hormonunu baskılar. Meditasyon ve yoga ile stresi azalt.',
    ];
    final dayOfYear = DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays;
    return tips[dayOfYear % tips.length];
  }

  void _showWaterSheet(BuildContext context, AppProvider provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.08))),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36, height: 5,
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.25), borderRadius: BorderRadius.circular(3)),
            ),
            const SizedBox(height: 28),
            const Text('Su Takibi', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.8)),
            const SizedBox(height: 8),
            Text(
              'Bugün: ${provider.todayWater.toStringAsFixed(1)} L',
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
            border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.08))),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36, height: 5,
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.25), borderRadius: BorderRadius.circular(3)),
              ),
              const SizedBox(height: 28),
              const Text('Uyku Takibi', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.8)),
              const SizedBox(height: 6),
              Text(
                'Hedef: ${sleepNeed.toStringAsFixed(1)} saat',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textSecondary, letterSpacing: -0.2),
              ),
              const SizedBox(height: 24),
              Text(
                '${selectedHours.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 52, fontWeight: FontWeight.w800, color: AppColors.sleep, letterSpacing: -2),
              ),
              Text('saat', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textSecondary)),
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
                  child: const Text('Kaydet', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white, letterSpacing: -0.3)),
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

// ── Header Stat Card - BIG number, tiny label ─────────────────────

class _HeaderStat extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _HeaderStat({required this.label, required this.value, required this.unit, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        borderRadius: 18,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: TextStyle(
                color: color.withValues(alpha: 0.7),
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      color: color,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.8,
                      height: 1,
                    ),
                  ),
                  Text(
                    ' $unit',
                    style: TextStyle(
                      color: color.withValues(alpha: 0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Tracker Card - BIG current value ──────────────────────────────

class _TrackerCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final double current;
  final double target;
  final String unit;
  final Color color;
  final VoidCallback onTap;

  const _TrackerCard({
    required this.title,
    required this.icon,
    required this.current,
    required this.target,
    required this.unit,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final progress = target > 0 ? (current / target).clamp(0.0, 1.0) : 0.0;
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 18),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.95),
                    letterSpacing: -0.2,
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
                  current.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: color,
                    letterSpacing: -1.2,
                    height: 1,
                  ),
                ),
                Text(
                  ' / ${target.toStringAsFixed(1)} $unit',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.58),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
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

// ── Growth Stat - BIG number, tiny uppercase label ────────────────

class _GrowthStat extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _GrowthStat({required this.label, required this.value, required this.unit, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
