import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../models/height_record.dart';
import '../providers/app_provider.dart';
import '../utils/calculations.dart';
import '../utils/constants.dart';
import '../utils/height_reference.dart';

// ─────────────────────────────────────────────────────────────────
//  Leaderboard Screen — Real WHO/NCD-RisC Height Analysis
//  No synthetic peer data. Shows user's height vs. real global
//  population averages by age and sex using WHO 2007 + NCD-RisC.
// ─────────────────────────────────────────────────────────────────

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final l = AppLocalizations.of(context)!;

    final age = provider.profile?.age ?? 18;
    final isMale = (provider.profile?.gender ?? 'male') == 'male';
    final height = provider.profile?.currentHeight ?? 170.0;
    final ethnicity = provider.profile?.ethnicity ?? '';

    final mean = HeightReference.getMean(age, isMale, ethnicity: ethnicity);
    final pct = HeightReference.percentile(
      heightCm: height,
      age: age,
      isMale: isMale,
      ethnicity: ethnicity,
    );
    final refs = HeightReference.referenceHeights(age, isMale, ethnicity: ethnicity);
    final prediction = provider.profile != null
        ? Calculations.predictFinalHeight(provider.profile!, provider.heightRecords)
        : null;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(context, l),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // ── Hero percentile card ──
                _HeroPercentileCard(
                  heightCm: height,
                  pct: pct,
                  mean: mean,
                  age: age,
                  isMale: isMale,
                ),
                const SizedBox(height: 24),

                // ── Position on population curve ──
                SectionHeader(
                  icon: CupertinoIcons.chart_bar_fill,
                  title: l.heightVsPopulation,
                  iconColor: AppColors.primary,
                ),
                const SizedBox(height: 12),
                _PopulationBarChart(
                  heightCm: height,
                  refs: refs,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 24),

                // ── Reference table ──
                SectionHeader(
                  icon: CupertinoIcons.table,
                  title: l.globalAveragesTable,
                  iconColor: AppColors.cyan,
                ),
                const SizedBox(height: 12),
                _ReferenceTable(
                  age: age,
                  isMale: isMale,
                  userHeight: height,
                  records: provider.heightRecords,
                  yearlyPredictions: prediction?.yearlyPredictions ?? {},
                  ethnicity: ethnicity,
                ),
                const SizedBox(height: 24),

                // ── Scientific source note ──
                _SourceNote(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, AppLocalizations l) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.surfaceDark,
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back, color: Colors.white),
        onPressed: () {
          HapticFeedback.lightImpact();
          Navigator.pop(context);
        },
      ),
      title: Text(
        l.heightAnalysis,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0F0B24), Color(0xFF070B1A)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────
//  Hero Percentile Card
// ─────────────────────────────────────────────────────────────────

class _HeroPercentileCard extends StatelessWidget {
  final double heightCm;
  final double pct;
  final double mean;
  final int age;
  final bool isMale;

  const _HeroPercentileCard({
    required this.heightCm,
    required this.pct,
    required this.mean,
    required this.age,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final diff = heightCm - mean;
    final isAbove = diff >= 0;
    final diffAbs = diff.abs();
    final diffStr = '${isAbove ? '+' : '-'}${diffAbs.toStringAsFixed(1)} cm';

    // Pick accent color by percentile
    Color accent;
    String standing;
    if (pct >= 75) {
      accent = AppColors.lime;
      standing = l.standingTall;
    } else if (pct >= 50) {
      accent = AppColors.cyan;
      standing = l.standingAboveAverage;
    } else if (pct >= 25) {
      accent = AppColors.warning;
      standing = l.standingBelowAverage;
    } else {
      accent = AppColors.orange;
      standing = l.standingShort;
    }

    return GlassCard(
      glowColor: accent.withValues(alpha: 0.28),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      child: Column(
        children: [
          // Label
          Text(
            l.yourHeightStanding.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.textTertiary,
              letterSpacing: 1.8,
            ),
          ),
          const SizedBox(height: 14),

          // Big percentile number
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => LinearGradient(
              colors: [accent, accent.withValues(alpha: 0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              'TOP ${(100 - pct).clamp(1, 99).toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: accent.withValues(alpha: 0.55),
                    blurRadius: 24,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),

          // Standing badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  accent.withValues(alpha: 0.22),
                  accent.withValues(alpha: 0.12),
                ],
              ),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: accent.withValues(alpha: 0.45),
                width: 1,
              ),
            ),
            child: Text(
              standing,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: accent,
                letterSpacing: 0.4,
              ),
            ),
          ),
          const SizedBox(height: 22),

          // Divider
          Container(height: 1, color: Colors.white.withValues(alpha: 0.06)),
          const SizedBox(height: 18),

          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatCol(
                label: l.yourHeight,
                value: '${heightCm.toStringAsFixed(1)} cm',
                color: Colors.white,
                icon: CupertinoIcons.person_fill,
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.white.withValues(alpha: 0.08),
              ),
              _StatCol(
                label: l.peerAvg(age),
                value: '${mean.toStringAsFixed(1)} cm',
                color: AppColors.textTertiary,
                icon: CupertinoIcons.group_solid,
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.white.withValues(alpha: 0.08),
              ),
              _StatCol(
                label: isAbove ? l.aboveAvg : l.belowAvg,
                value: diffStr,
                color: isAbove ? AppColors.lime : AppColors.orange,
                icon: isAbove
                    ? CupertinoIcons.arrow_up_circle_fill
                    : CupertinoIcons.arrow_down_circle_fill,
              ),
            ],
          ),

          const SizedBox(height: 18),
          // Source line
          Text(
            l.whoDataSource,
            style: TextStyle(
              fontSize: 10,
              color: AppColors.textTertiary.withValues(alpha: 0.6),
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _StatCol extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;

  const _StatCol({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 14),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.textTertiary,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────
//  Population Bar Chart
// ─────────────────────────────────────────────────────────────────

class _PopulationBarChart extends StatelessWidget {
  final double heightCm;
  final Map<String, double> refs;
  final Color color;

  const _PopulationBarChart({
    required this.heightCm,
    required this.refs,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Build 5 bands between consecutive percentile values
    final bands = [
      (label: 'Alt 5%', pct: 5, cm: refs['p5']!),
      (label: 'Alt 25%', pct: 25, cm: refs['p25']!),
      (label: 'Ortalama', pct: 50, cm: refs['p50']!),
      (label: 'Üst 25%', pct: 75, cm: refs['p75']!),
      (label: 'Üst 5%', pct: 95, cm: refs['p95']!),
    ];

    final minH = bands.first.cm - 4;
    final maxH = bands.last.cm + 4;
    final span = maxH - minH;

    // User marker fraction along the bar
    final userFrac = ((heightCm - minH) / span).clamp(0.0, 1.0);

    return GlassCard(
      glowColor: color.withValues(alpha: 0.15),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gradient bar
          LayoutBuilder(
            builder: (ctx, constraints) {
              final totalWidth = constraints.maxWidth;
              final markerX = userFrac * totalWidth;

              return SizedBox(
                height: 78,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Gradient bar (full width)
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 22,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.orange.withValues(alpha: 0.80),
                              AppColors.warning.withValues(alpha: 0.80),
                              AppColors.lime.withValues(alpha: 0.80),
                              AppColors.cyan.withValues(alpha: 0.80),
                              color.withValues(alpha: 0.80),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: color.withValues(alpha: 0.20),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Percentile tick marks + labels
                    ...bands.map((b) {
                      final x =
                          ((b.cm - minH) / span).clamp(0.0, 1.0) * totalWidth;
                      return Positioned(
                        left: x - 1,
                        top: 18,
                        child: Container(
                          width: 2,
                          height: 28,
                          color: Colors.black.withValues(alpha: 0.30),
                        ),
                      );
                    }),

                    // User arrow + dot marker
                    Positioned(
                      left: (markerX - 12).clamp(0, totalWidth - 24),
                      top: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: color.withValues(alpha: 0.50),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: Text(
                              heightCm.toStringAsFixed(0),
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                color: AppColors.scaffold,
                              ),
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 6,
                            color: Colors.white,
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: color.withValues(alpha: 0.60),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Bottom labels for percentile anchors
                    ...bands.map((b) {
                      final x =
                          ((b.cm - minH) / span).clamp(0.0, 1.0) * totalWidth;
                      return Positioned(
                        left: (x - 16).clamp(0, totalWidth - 32),
                        bottom: 0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              b.cm.toStringAsFixed(0),
                              style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          // Legend row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _LegendDot(color: AppColors.orange,  label: 'Kısa'),
              _LegendDot(color: AppColors.warning, label: 'Orta altı'),
              _LegendDot(color: AppColors.lime,    label: 'Ortalama'),
              _LegendDot(color: AppColors.cyan,    label: 'Uzun'),
              _LegendDot(color: color,             label: 'Çok uzun'),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────
//  Reference Table — age groups around user's age
// ─────────────────────────────────────────────────────────────────

class _ReferenceTable extends StatelessWidget {
  final int age;
  final bool isMale;
  final double userHeight;
  final List<HeightRecord> records;
  final Map<int, double> yearlyPredictions;
  final String ethnicity;

  const _ReferenceTable({
    required this.age,
    required this.isMale,
    required this.userHeight,
    required this.records,
    required this.yearlyPredictions,
    this.ethnicity = '',
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    // Show ages ±4 around user, clamped to 10–25
    final ages = List.generate(
      8,
      (i) => (age - 3 + i).clamp(10, 25),
    ).toSet().toList()..sort();

    return GlassCard(
      glowColor: AppColors.cyan.withValues(alpha: 0.12),
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          // Header row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Row(
              children: [
                _TableHeader(l.ageLabel, flex: 2),
                _TableHeader(l.avgHeightLabel, flex: 3),
                _TableHeader('Sen', flex: 3),
                _TableHeader('%', flex: 3, align: TextAlign.right),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.white.withValues(alpha: 0.06),
          ),
          // Rows
          ...ages.map((a) {
            final isUserAge = a == age;
            final m = HeightReference.getMean(a, isMale, ethnicity: ethnicity);

            // Geçmiş yaş: height records içinde o yıla ait kayıt var mı?
            double? rowHeight;
            bool isFuture = false;

            if (a == age) {
              rowHeight = userHeight;
            } else if (a < age) {
              // Geçmiş — kayıtlardan bul
              final targetYear = DateTime.now().year - (age - a);
              HeightRecord? best;
              int bestDiff = 9999;
              for (final r in records) {
                final d = DateTime.tryParse(r.date);
                if (d == null) continue;
                final diff = (d.year - targetYear).abs();
                if (diff < bestDiff) { bestDiff = diff; best = r; }
              }
              if (best != null && bestDiff <= 1) {
                rowHeight = best.height;
              }
            } else {
              // Gelecek — yearlyPredictions'dan
              if (yearlyPredictions.containsKey(a)) {
                rowHeight = yearlyPredictions[a];
                isFuture = true;
              }
            }

            final p = rowHeight != null
                ? HeightReference.percentile(heightCm: rowHeight, age: a, isMale: isMale, ethnicity: ethnicity)
                : null;

            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isUserAge
                        ? AppColors.primary.withValues(alpha: 0.12)
                        : Colors.transparent,
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Row(
                    children: [
                      // Age
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            if (isUserAge)
                              Container(
                                width: 5,
                                height: 5,
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primary
                                          .withValues(alpha: 0.6),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                              ),
                            Text(
                              '$a',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: isUserAge
                                    ? FontWeight.w800
                                    : FontWeight.w500,
                                color: isUserAge
                                    ? AppColors.primaryBright
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Average
                      Expanded(
                        flex: 3,
                        child: Text(
                          '${m.toStringAsFixed(1)} cm',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: isUserAge ? Colors.white : AppColors.textSecondary,
                          ),
                        ),
                      ),
                      // Sen
                      Expanded(
                        flex: 3,
                        child: rowHeight != null
                            ? Text(
                                '${rowHeight.toStringAsFixed(1)} cm',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: isUserAge
                                      ? AppColors.primaryBright
                                      : isFuture
                                          ? AppColors.cyan.withValues(alpha: 0.6)
                                          : AppColors.textSecondary,
                                  fontStyle: isFuture ? FontStyle.italic : FontStyle.normal,
                                ),
                              )
                            : Text(
                                '—',
                                style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.2)),
                              ),
                      ),
                      // Yüzde
                      Expanded(
                        flex: 3,
                        child: p != null
                            ? Text(
                                '%${(100 - p).clamp(1, 99).toStringAsFixed(0)}',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: isFuture
                                      ? _pctColor(p).withValues(alpha: 0.55)
                                      : _pctColor(p),
                                  fontStyle: isFuture ? FontStyle.italic : FontStyle.normal,
                                ),
                              )
                            : Text(
                                '—',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 12, color: Colors.white.withValues(alpha: 0.2)),
                              ),
                      ),
                    ],
                  ),
                ),
                if (a != ages.last)
                  Container(
                    height: 1,
                    color: Colors.white.withValues(alpha: 0.04),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }

  // p = raw percentile (nüfusun kaçı senden kısa)
  // düşük topPct (100-p) = daha uzun = daha iyi renk
  Color _pctColor(double p) {
    final top = 100 - p; // gösterilen değer
    if (top <= 25) return AppColors.lime;    // üst %25 = yeşil
    if (top <= 50) return AppColors.cyan;    // üst %50 = mavi
    if (top <= 75) return AppColors.warning; // orta = sarı
    return AppColors.orange;                 // alt çeyrek = turuncu
  }

}

class _TableHeader extends StatelessWidget {
  final String text;
  final int flex;
  final TextAlign align;

  const _TableHeader(this.text, {required this.flex, this.align = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: AppColors.textTertiary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────
//  Source note
// ─────────────────────────────────────────────────────────────────

class _SourceNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return GlassCard(
      glowColor: Colors.transparent,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.info_circle,
            size: 18,
            color: AppColors.textTertiary,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l.whoSourceNote,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.textTertiary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
