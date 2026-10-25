import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

/// Everything the height chart draws, without the provider: past heights,
/// measurements, the projected path and the lines it is measured against.
class PotentialChartData {
  /// Every known height in date order; the first [pastCount] are the ones
  /// remembered at onboarding, drawn faded.
  final List<MapEntry<DateTime, double>> history;
  final int pastCount;

  /// The path from the last height to [potential], month by month.
  final List<MapEntry<DateTime, double>> curve;
  final double potential;
  final double? dream;

  /// Height formatting for the legend and tooltips ("175,3 cm", 5'9").
  final String Function(double cm) format;

  /// Axis labels; null shows the bare centimetre value.
  final String Function(double cm)? axisFormat;

  const PotentialChartData({
    required this.history,
    required this.pastCount,
    required this.curve,
    required this.potential,
    required this.format,
    this.dream,
    this.axisFormat,
  });

  /// The user's own chart, or null before there is a profile or a height.
  static PotentialChartData? fromProvider(AppProvider provider) {
    final profile = provider.profile;
    if (profile == null) return null;
    final birth = DateTime.tryParse(profile.birthDate);
    final history = <MapEntry<DateTime, double>>[];
    var pastCount = 0;
    if (birth != null) {
      final ages = provider.pastHeights.keys.toList()..sort();
      for (final age in ages) {
        history.add(MapEntry(
          DateTime(birth.year + age, birth.month, birth.day),
          provider.pastHeights[age]!,
        ));
      }
      pastCount = history.length;
    }
    for (final r in provider.heightRecords) {
      final d = DateTime.tryParse(r.date);
      if (d != null) history.add(MapEntry(d, r.height));
    }
    if (history.isEmpty) return null;
    history.sort((a, b) => a.key.compareTo(b.key));
    return PotentialChartData(
      history: history,
      pastCount: pastCount,
      curve: provider.potentialCurve,
      potential: provider.potentialHeight,
      dream: provider.dreamHeight,
      format: provider.formatHeight,
      axisFormat: provider.useImperial ? provider.formatHeightCompact : null,
    );
  }
}

/// The height chart with a future: past heights from the onboarding, every
/// measurement, and a shaded band rising from today's height to the user's
/// potential. Works from the first measurement — a single point plus the
/// path ahead is already a chart worth looking at.
class PotentialChart extends StatelessWidget {
  final AppProvider provider;

  /// 0..1, reveals the projection left to right.
  final double reveal;
  final double height;

  const PotentialChart({
    super.key,
    required this.provider,
    this.reveal = 1,
    this.height = 210,
  });

  @override
  Widget build(BuildContext context) {
    final data = PotentialChartData.fromProvider(provider);
    if (data == null) return const SizedBox.shrink();
    return PotentialChartView(data: data, reveal: reveal, height: height);
  }
}

/// [PotentialChart] drawn from plain data, for places that show a chart that
/// is not (or not yet) the user's own.
class PotentialChartView extends StatelessWidget {
  final PotentialChartData data;
  final double reveal;
  final double height;

  const PotentialChartView({
    super.key,
    required this.data,
    this.reveal = 1,
    this.height = 210,
  });

  static const _measured = Color(0xFFB57BFF);

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final history = data.history;
    if (history.isEmpty) return const SizedBox.shrink();
    final pastCount = data.pastCount;
    final curve = data.curve;
    final potential = data.potential;
    final dream = data.dream;
    final origin = history.first.key;
    double xOf(DateTime d) => d.difference(origin).inDays / 30.44;

    final measuredSpots = [
      for (final e in history) FlSpot(xOf(e.key), e.value),
    ];
    // The projection starts at the last real point and is revealed with the
    // chart animation.
    final last = history.last;
    final shown = curve.isEmpty
        ? <MapEntry<DateTime, double>>[]
        : curve.take(math.max(2, (curve.length * reveal).ceil())).toList();
    final projection = [
      FlSpot(xOf(last.key), last.value),
      for (final e in shown.skip(1)) FlSpot(xOf(e.key), e.value),
    ];
    final floor = [
      for (final s in projection) FlSpot(s.x, last.value),
    ];

    final ys = [
      ...history.map((e) => e.value),
      potential,
      ?dream,
    ];
    final minY = ((ys.reduce(math.min) - 3) / 5).floor() * 5.0;
    final maxY = ((ys.reduce(math.max) + 3) / 5).ceil() * 5.0;
    final maxX = projection.isNotEmpty
        ? math.max(projection.last.x, measuredSpots.last.x)
        : measuredSpots.last.x;
    final yearStep = maxX > 60 ? 24.0 : (maxX > 24 ? 12.0 : 6.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          child: LineChart(
            duration: Duration.zero,
            LineChartData(
              minX: 0,
              maxX: maxX <= 0 ? 1 : maxX,
              minY: minY,
              maxY: maxY,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: maxY - minY > 40 ? 10 : 5,
                getDrawingHorizontalLine: (_) => FlLine(
                  color: Colors.white.withValues(alpha: 0.06),
                  strokeWidth: 0.5,
                  dashArray: [6, 4],
                ),
              ),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: maxY - minY > 40 ? 10 : 5,
                    getTitlesWidget: (v, meta) => v == meta.min || v == meta.max
                        ? const SizedBox.shrink()
                        : Text(
                            data.axisFormat != null
                                ? data.axisFormat!(v)
                                : v.toStringAsFixed(0),
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white.withValues(alpha: 0.35),
                            ),
                          ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 26,
                    interval: yearStep,
                    getTitlesWidget: (v, meta) {
                      // fl_chart also labels the axis end; drop it when it
                      // would sit on top of the last regular label.
                      final aligned = (v / yearStep - (v / yearStep).round())
                              .abs() <
                          0.01;
                      if (!aligned) return const SizedBox.shrink();
                      final d = origin.add(Duration(days: (v * 30.44).round()));
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          yearStep >= 12
                              ? DateFormat('yyyy', locale).format(d)
                              : DateFormat('MMM yy', locale).format(d),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white.withValues(alpha: 0.45),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              extraLinesData: ExtraLinesData(
                horizontalLines: [
                  if (dream != null)
                    HorizontalLine(
                      y: dream,
                      color: AppColors.warning.withValues(alpha: 0.55),
                      strokeWidth: 1.2,
                      dashArray: [3, 5],
                    ),
                ],
              ),
              betweenBarsData: [
                if (projection.length > 1)
                  BetweenBarsData(
                    fromIndex: 2,
                    toIndex: 1,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.lime.withValues(alpha: 0.28),
                        AppColors.lime.withValues(alpha: 0.04),
                      ],
                    ),
                  ),
              ],
              lineBarsData: [
                // 0: what was measured (past heights faded).
                LineChartBarData(
                  spots: measuredSpots,
                  isCurved: true,
                  curveSmoothness: 0.25,
                  preventCurveOverShooting: true,
                  color: _measured,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, _, _, i) {
                      final isPast = i < pastCount;
                      final isLast = i == measuredSpots.length - 1;
                      return FlDotCirclePainter(
                        radius: isLast ? 5.5 : 3.2,
                        color: isLast
                            ? Colors.white
                            : isPast
                                ? _measured.withValues(alpha: 0.35)
                                : AppColors.scaffold,
                        strokeWidth: isLast ? 3 : 1.8,
                        strokeColor: isPast
                            ? _measured.withValues(alpha: 0.5)
                            : _measured,
                      );
                    },
                  ),
                ),
                // 1: the potential path.
                LineChartBarData(
                  spots: projection.length > 1 ? projection : [measuredSpots.last],
                  isCurved: true,
                  curveSmoothness: 0.3,
                  preventCurveOverShooting: true,
                  color: AppColors.lime,
                  barWidth: 2.4,
                  dashArray: [7, 5],
                  dotData: FlDotData(
                    show: true,
                    checkToShowDot: (s, bar) => s == bar.spots.last && reveal >= 1,
                    getDotPainter: (_, _, _, _) => FlDotCirclePainter(
                      radius: 6,
                      color: AppColors.lime,
                      strokeWidth: 3,
                      strokeColor: AppColors.scaffold,
                    ),
                  ),
                ),
                // 2: today's height held flat, the band's floor (invisible).
                LineChartBarData(
                  spots: floor.length > 1 ? floor : [measuredSpots.last],
                  color: Colors.transparent,
                  barWidth: 0,
                  dotData: const FlDotData(show: false),
                ),
              ],
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (_) =>
                      const Color(0xFF2D1B69).withValues(alpha: 0.95),
                  tooltipRoundedRadius: 12,
                  getTooltipItems: (spots) => spots.map((s) {
                    if (s.barIndex == 2) return null;
                    final d = origin.add(Duration(days: (s.x * 30.44).round()));
                    return LineTooltipItem(
                      '${DateFormat('MMM yyyy', locale).format(d)}\n'
                      '${data.format(s.y)}',
                      TextStyle(
                        color: s.barIndex == 1 ? AppColors.lime : Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 14,
          runSpacing: 6,
          children: [
            _Legend(color: _measured, label: l.chartMeasured),
            _Legend(
              color: AppColors.lime,
              dashed: true,
              label: l.chartPotential(data.format(potential)),
            ),
            if (dream != null)
              _Legend(
                color: AppColors.warning,
                dashed: true,
                label: l.chartDream(data.format(dream)),
              ),
          ],
        ),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;
  final bool dashed;
  const _Legend({required this.color, required this.label, this.dashed = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 16,
          height: 3,
          child: dashed
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (_) => Container(width: 4, height: 3, color: color),
                  ),
                )
              : DecoratedBox(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w700,
            color: Colors.white.withValues(alpha: 0.75),
          ),
        ),
      ],
    );
  }
}
