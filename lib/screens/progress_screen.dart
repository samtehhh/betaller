import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../l10n/app_localizations.dart';
import '../models/height_record.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../widgets/premium_paywall.dart';
import 'weekly_report_screen.dart';
import 'posture_analysis_screen.dart';
import 'progress_photos_screen.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => ProgressScreenState();
}

class ProgressScreenState extends State<ProgressScreen> with SingleTickerProviderStateMixin {
  late AnimationController _chartAnim;
  late Animation<double> _chartCurve;

  @override
  void initState() {
    super.initState();
    _chartAnim = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _chartCurve = CurvedAnimation(parent: _chartAnim, curve: Curves.easeOutCubic);
    // İlk açılışta animasyon
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _chartAnim.forward(from: 0);
    });
  }

  void replayAnimation() {
    _chartAnim.forward(from: 0);
  }

  @override
  void dispose() {
    _chartAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;

    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final records = provider.heightRecords;
        final current = records.isNotEmpty
            ? records.last.height
            : provider.profile?.currentHeight ?? 0;
        final start = records.isNotEmpty ? records.first.height : current;
        final gained = double.parse((current - start).toStringAsFixed(1));

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 14),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        l.progressTitle,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                          letterSpacing: -1.1,
                          shadows: [
                            Shadow(
                                color: AppColors.primary.withValues(alpha: 0.25),
                                blurRadius: 10)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // ── Where you stand ───────────────────────────────────
                    _HeightHero(
                      current: current,
                      gained: gained,
                      records: records,
                      onAdd: provider.isPremium
                          ? () => _showAddMeasurementSheet(context, provider)
                          : () => showPremiumPaywall(context),
                      locked: !provider.isPremium,
                    ),
                    const SizedBox(height: 16),

                    // ── The curve, with its numbers underneath ────────────
                    if (records.length >= 2)
                      Container(
                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                        decoration: BoxDecoration(
                          color: AppColors.cardFill,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.06)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionHeader(
                                icon: CupertinoIcons.graph_square_fill,
                                title: l.heightChart),
                            const SizedBox(height: 18),
                            SizedBox(
                              height: 190,
                              child: AnimatedBuilder(
                                animation: _chartAnim,
                                builder: (context, _) => _buildChart(
                                    context, records, _chartCurve.value),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Divider(
                                color: Colors.white.withValues(alpha: 0.06),
                                height: 1),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                _StatItem(
                                  label: l.totalGrowth,
                                  value:
                                      '${provider.totalGrowth > 0 ? '+' : ''}${provider.totalGrowth}',
                                  unit: 'cm',
                                  color: provider.totalGrowth > 0
                                      ? AppColors.success
                                      : AppColors.textSecondary,
                                ),
                                Container(
                                    width: 1,
                                    height: 32,
                                    color:
                                        Colors.white.withValues(alpha: 0.10)),
                                _StatItem(
                                  label: l.lastDiff,
                                  value:
                                      '${provider.lastGrowth > 0 ? '+' : ''}${provider.lastGrowth}',
                                  unit: 'cm',
                                  color: provider.lastGrowth > 0
                                      ? AppColors.success
                                      : AppColors.textSecondary,
                                ),
                                Container(
                                    width: 1,
                                    height: 32,
                                    color:
                                        Colors.white.withValues(alpha: 0.10)),
                                _StatItem(
                                  label: l.measurementCount,
                                  value: '${records.length}',
                                  unit: '',
                                  color: AppColors.primaryLight,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    else
                      Container(
                        padding: const EdgeInsets.all(26),
                        decoration: BoxDecoration(
                          color: AppColors.cardFill,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.06)),
                        ),
                        child: Column(
                          children: [
                            Icon(CupertinoIcons.graph_square,
                                color: Colors.white.withValues(alpha: 0.25),
                                size: 34),
                            const SizedBox(height: 12),
                            Text(
                              l.chartMinData,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withValues(alpha: 0.62),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              l.chartInstruction,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withValues(alpha: 0.35),
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 22),

                    // ── Tracking tools ────────────────────────────────────
                    SectionHeader(
                      icon: CupertinoIcons.square_stack_3d_down_right_fill,
                      title: l.trackingSection,
                    ),
                    const SizedBox(height: 12),
                    _ToolCard(
                      color: AppColors.cyan,
                      icon: CupertinoIcons.photo_fill_on_rectangle_fill,
                      title: l.progressPhotosTitle,
                      benefit: l.photosBenefit,
                      state: provider.progressPhotos.isEmpty
                          ? l.photosSummaryEmpty
                          : l.photosSummaryCount(provider.progressPhotos.length),
                      cta: l.photosCta,
                      visual: _PhotoStrip(
                        paths: provider.progressPhotos
                            .map((p) => p['path'] as String?)
                            .whereType<String>()
                            .toList(),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const ProgressPhotosScreen()),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _ToolCard(
                      color: AppColors.lime,
                      icon: Icons.accessibility_new_rounded,
                      title: l.explorePosture,
                      benefit: l.postureBenefit,
                      state: provider.postureAnalyses.isEmpty
                          ? l.postureSummaryEmpty
                          : l.postureSummaryScore(
                              (provider.postureAnalyses.last['totalScore']
                                          as num?)
                                      ?.toInt() ??
                                  0),
                      cta: l.postureCta,
                      visual: _PostureDial(
                        score: provider.postureAnalyses.isEmpty
                            ? null
                            : (provider.postureAnalyses.last['totalScore']
                                    as num?)
                                ?.toInt(),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const PostureAnalysisScreen()),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _ToolCard(
                      color: AppColors.orange,
                      icon: CupertinoIcons.doc_chart_fill,
                      title: l.weeklyReportMenu,
                      benefit: l.reportBenefit,
                      state: l.toolStateReady,
                      cta: l.reportCta,
                      visual: _WeekSpark(provider: provider),
                      onTap: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const WeeklyReportScreen()),
                      ),
                    ),

                    // ── History as a timeline ─────────────────────────────
                    if (records.isNotEmpty) ...[
                      const SizedBox(height: 22),
                      SectionHeader(
                          icon: CupertinoIcons.clock,
                          title: l.measurementHistory),
                      const SizedBox(height: 12),
                      ...List.generate(records.length, (i) {
                        final index = records.length - 1 - i;
                        final record = records[index];
                        final diff = index > 0
                            ? double.parse((record.height -
                                    records[index - 1].height)
                                .toStringAsFixed(1))
                            : 0.0;

                        DateTime? parsed;
                        try {
                          parsed = DateTime.parse(record.date);
                        } catch (_) {}
                        final dateStr = parsed != null
                            ? DateFormat('d MMM yyyy', locale).format(parsed)
                            : record.date;

                        return Dismissible(
                          key: Key(record.date),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(bottom: 2),
                            padding: const EdgeInsets.only(right: 22),
                            decoration: BoxDecoration(
                              color: AppColors.error.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(CupertinoIcons.delete,
                                color: AppColors.error, size: 20),
                          ),
                          confirmDismiss: (_) async {
                            return await showCupertinoDialog<bool>(
                                  context: context,
                                  builder: (context) => CupertinoAlertDialog(
                                    title: Text(l.deleteTitle),
                                    content: Text(l.deleteMessage),
                                    actions: [
                                      CupertinoDialogAction(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: Text(l.dismiss),
                                      ),
                                      CupertinoDialogAction(
                                        isDestructiveAction: true,
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: Text(l.delete),
                                      ),
                                    ],
                                  ),
                                ) ??
                                false;
                          },
                          onDismissed: (_) =>
                              provider.deleteHeightRecord(record.date),
                          child: _TimelineEntry(
                            date: dateStr,
                            height: record.height,
                            diff: diff,
                            isFirst: i == 0,
                            isLast: i == records.length - 1,
                          ),
                        );
                      }),
                    ],
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChart(BuildContext context, List<HeightRecord> records, double animValue) {
    final locale = Localizations.localeOf(context).languageCode;

    final heights = records.map((r) => r.height).toList();
    final minH = heights.reduce((a, b) => a < b ? a : b);
    final maxH = heights.reduce((a, b) => a > b ? a : b);
    final range = maxH - minH;
    final minY = minH - (range < 2 ? 2 : range * 0.3);
    final maxY = maxH + (range < 2 ? 2 : range * 0.3);

    // Noktalar grafiğin tam dibinden (minY) gerçek konumlarına yükseliyor
    // Her nokta kademeli gecikmeyle çıkıyor (soldan sağa dalga efekti)
    final spots = records.asMap().entries.map((e) {
      final i = e.key;
      final count = records.length;
      // Her noktaya kademeli gecikme: ilk nokta hemen, son nokta en geç
      final stagger = count > 1 ? i / (count - 1) * 0.3 : 0.0;
      final localAnim = ((animValue - stagger) / (1.0 - stagger)).clamp(0.0, 1.0);
      final targetY = e.value.height;
      final animatedY = minY + (targetY - minY) * localAnim;
      return FlSpot(i.toDouble(), animatedY);
    }).toList();

    return LineChart(
      duration: Duration.zero,
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: range < 3 ? 0.5 : 1,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.white.withValues(alpha: 0.06),
            strokeWidth: 0.5,
            dashArray: [6, 4],
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 42,
              interval: range < 3 ? 1 : null,
              getTitlesWidget: (value, meta) {
                if (value == meta.min || value == meta.max) return const SizedBox();
                return Text(
                  value.toStringAsFixed(1),
                  style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.35), fontWeight: FontWeight.w500),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= records.length) return const SizedBox();
                if (records.length > 5 && index != 0 && index != records.length - 1 && index != records.length ~/ 2) {
                  return const SizedBox();
                }
                final date = DateTime.tryParse(records[index].date);
                if (date == null) return const SizedBox();
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    DateFormat('d MMM', locale).format(date),
                    style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.5), fontWeight: FontWeight.w600),
                  ),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        minY: minY,
        maxY: maxY,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            curveSmoothness: 0.35,
            gradient: const LinearGradient(
              colors: [Color(0xFF9C6ADE), Color(0xFFB57BFF), Color(0xFFCE93D8)],
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            shadow: Shadow(
              color: AppColors.primary.withValues(alpha: 0.4 * animValue),
              blurRadius: 16 * animValue,
              offset: const Offset(0, 6),
            ),
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                final isLast = index == spots.length - 1;
                return FlDotCirclePainter(
                  radius: isLast ? 5.5 : 3.5,
                  color: isLast ? const Color(0xFFCE93D8) : AppColors.scaffold,
                  strokeWidth: isLast ? 3 : 2,
                  strokeColor: isLast ? Colors.white : const Color(0xFFB57BFF),
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFB57BFF).withValues(alpha: 0.20 * animValue),
                  AppColors.primary.withValues(alpha: 0.06 * animValue),
                  AppColors.primary.withValues(alpha: 0.0),
                ],
                stops: const [0.0, 0.6, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            tooltipMargin: 16,
            tooltipRoundedRadius: 14,
            getTooltipColor: (_) => const Color(0xFF2D1B69).withValues(alpha: 0.95),
            tooltipBorder: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
            getTooltipItems: (touchedSpots) => touchedSpots.map((spot) {
              final index = spot.x.toInt();
              String dateLabel = '';
              if (index >= 0 && index < records.length) {
                final date = DateTime.tryParse(records[index].date);
                if (date != null) {
                  dateLabel = '${DateFormat('d MMMM', locale).format(date)}\n';
                }
              }
              return LineTooltipItem(
                '$dateLabel${spot.y.toStringAsFixed(1)} cm',
                const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15, height: 1.4),
              );
            }).toList(),
          ),
          getTouchedSpotIndicator: (barData, spotIndexes) => spotIndexes.map((i) {
            return TouchedSpotIndicatorData(
              FlLine(color: const Color(0xFFB57BFF).withValues(alpha: 0.3), strokeWidth: 1, dashArray: [4, 4]),
              FlDotData(
                show: true,
                getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
                  radius: 6,
                  color: const Color(0xFFB57BFF),
                  strokeWidth: 2.5,
                  strokeColor: Colors.white,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showAddMeasurementSheet(BuildContext context, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    final controller = TextEditingController();
    final profile = provider.profile;
    if (profile != null) {
      controller.text = profile.currentHeight.toStringAsFixed(1);
    }
    DateTime selectedDate = DateTime.now();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surfaceDark,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
              border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.14))),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 36, height: 4,
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.50), borderRadius: BorderRadius.circular(2)),
                ),
                const SizedBox(height: 24),
                const Icon(CupertinoIcons.resize_v, color: AppColors.primaryLight, size: 28),
                const SizedBox(height: 12),
                Text(
                  l.newMeasurement,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1),
                ),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                      locale: Localizations.localeOf(context),
                      builder: (context, child) => Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: const ColorScheme.dark(primary: AppColors.primary, surface: AppColors.surfaceDark),
                        ),
                        child: child!,
                      ),
                    );
                    if (picked != null) {
                      setSheetState(() => selectedDate = picked);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.calendar, color: AppColors.primary, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          DateFormat('d MMMM yyyy', Localizations.localeOf(context).languageCode).format(selectedDate),
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.primary),
                        ),
                        const SizedBox(width: 4),
                        Icon(CupertinoIcons.chevron_down, color: AppColors.primary.withValues(alpha: 0.6), size: 14),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: controller,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1),
                  textAlign: TextAlign.center,
                  cursorColor: AppColors.primary,
                  decoration: InputDecoration(
                    suffixText: 'cm',
                    suffixStyle: TextStyle(fontSize: 16, color: AppColors.textSecondary),
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: 0.12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(14),
                    onPressed: () {
                      final height = double.tryParse(controller.text.replaceAll(',', '.'));
                      if (height != null && height > 50 && height < 250) {
                        final dateStr = selectedDate.toIso8601String().substring(0, 10);
                        provider.addHeightRecord(HeightRecord(date: dateStr, height: height));
                        if (profile != null) {
                          provider.updateProfile(profile.copyWith(currentHeight: height));
                        }
                        Navigator.pop(context);
                      }
                    },
                    child: Text(l.save, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white, letterSpacing: -0.3)),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Stat Card ─────────────────────────────────────────────────────

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _StatItem({required this.label, required this.value, required this.unit, required this.color});

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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: color, letterSpacing: -0.8),
              ),
              if (unit.isNotEmpty)
                Text(
                  ' $unit',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color.withValues(alpha: 0.6)),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.72), letterSpacing: -0.1)),
        ],
      ),
    );
  }
}


/// One of the tracking tools that live under İlerleme.
/// A tracking tool, sized like it matters: its own live visual, what it is
/// for, and where the user currently stands with it.
class _ToolCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String benefit;
  final String state;
  final String cta;
  final Widget visual;
  final VoidCallback onTap;

  const _ToolCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.benefit,
    required this.state,
    required this.cta,
    required this.visual,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withValues(alpha: 0.11),
              AppColors.cardFill,
            ],
            stops: const [0.0, 0.62],
          ),
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: color.withValues(alpha: 0.28)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.14),
              blurRadius: 26,
              offset: const Offset(0, 8),
              spreadRadius: -10,
            ),
          ],
        ),
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
                      Row(
                        children: [
                          Icon(icon, size: 16, color: color),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        benefit,
                        style: TextStyle(
                          fontSize: 12.5,
                          height: 1.42,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.55),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                SizedBox(width: 78, height: 78, child: visual),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: color.withValues(alpha: 0.30)),
                  ),
                  child: Text(
                    state,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: color,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  cta,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(CupertinoIcons.chevron_right, size: 13, color: color),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Two photos stacked like a before/after, or empty frames inviting the first.
class _PhotoStrip extends StatelessWidget {
  final List<String> paths;
  const _PhotoStrip({required this.paths});

  @override
  Widget build(BuildContext context) {
    final first = paths.isNotEmpty ? paths.first : null;
    final last = paths.length > 1 ? paths.last : null;

    Widget frame(String? path, {required bool highlight}) {
      final border = highlight ? AppColors.lime : AppColors.cyan;
      return Container(
        width: 46,
        height: 62,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: border.withValues(alpha: 0.55), width: 1.4),
          boxShadow: [
            BoxShadow(color: border.withValues(alpha: 0.22), blurRadius: 10),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: path != null && File(path).existsSync()
            ? Image.file(File(path), fit: BoxFit.cover)
            : Icon(CupertinoIcons.person_fill,
                size: 20, color: border.withValues(alpha: 0.35)),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          child: Transform.rotate(
            angle: -0.10,
            child: frame(first, highlight: false),
          ),
        ),
        Positioned(
          right: 0,
          child: Transform.rotate(
            angle: 0.10,
            child: frame(last ?? first, highlight: true),
          ),
        ),
      ],
    );
  }
}

/// The last posture score as a dial, or an empty dial waiting for one.
class _PostureDial extends StatelessWidget {
  final int? score;
  const _PostureDial({required this.score});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ScoreRingPainter(
        progress: score == null ? 0 : (score! / 100).clamp(0.0, 1.0),
        color: AppColors.lime,
      ),
      child: Center(
        child: score == null
            ? Icon(Icons.accessibility_new_rounded,
                size: 26, color: AppColors.lime.withValues(alpha: 0.55))
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$score',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppColors.lime,
                      height: 1,
                      letterSpacing: -1,
                    ),
                  ),
                  Text(
                    '/100',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.35),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

/// Seven bars, one per day of the current week.
class _WeekSpark extends StatelessWidget {
  final AppProvider provider;
  const _WeekSpark({required this.provider});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final start = today.subtract(Duration(days: today.weekday - 1));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (i) {
        final day = start.add(Duration(days: i));
        final future = day.isAfter(today);
        final ratio = future ? 0.0 : provider.dayCompletionRatio(day);
        final isToday = day == today;
        return Container(
          width: 7,
          height: 20 + 48 * ratio,
          decoration: BoxDecoration(
            color: future
                ? Colors.white.withValues(alpha: 0.05)
                : AppColors.orange
                    .withValues(alpha: ratio > 0 ? 0.95 : 0.16),
            borderRadius: BorderRadius.circular(4),
            border: isToday
                ? Border.all(
                    color: AppColors.orange.withValues(alpha: 0.8), width: 1)
                : null,
            boxShadow: ratio > 0.05
                ? [
                    BoxShadow(
                        color: AppColors.orange.withValues(alpha: 0.35),
                        blurRadius: 8)
                  ]
                : null,
          ),
        );
      }),
    );
  }
}

class _ScoreRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  const _ScoreRingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.07)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );
    if (progress <= 0) return;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 2),
    );
  }

  @override
  bool shouldRepaint(_ScoreRingPainter old) =>
      old.progress != progress || old.color != color;
}

/// The hero: current height, what has been gained, and the way to add more.
class _HeightHero extends StatelessWidget {
  final double current;
  final double gained;
  final List<HeightRecord> records;
  final VoidCallback onAdd;
  final bool locked;

  const _HeightHero({
    required this.current,
    required this.gained,
    required this.records,
    required this.onAdd,
    required this.locked,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A1240), Color(0xFF0C0A1C)],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.22)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 32,
            offset: const Offset(0, 10),
            spreadRadius: -10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.currentHeight.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.4,
                        color: Colors.white.withValues(alpha: 0.40),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          current.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 46,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: -2.2,
                            height: 1,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withValues(alpha: 0.45),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (records.length >= 2)
                SizedBox(
                  width: 96,
                  height: 46,
                  child: CustomPaint(
                    painter: _SparklinePainter(
                      values: records.map((r) => r.height).toList(),
                      color: AppColors.cyan,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: (gained > 0 ? AppColors.success : Colors.white)
                      .withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: (gained > 0 ? AppColors.success : Colors.white)
                        .withValues(alpha: 0.28),
                  ),
                ),
                child: Text(
                  '${gained > 0 ? '+' : ''}$gained cm',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    color: gained > 0
                        ? AppColors.success
                        : Colors.white.withValues(alpha: 0.6),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l.totalGrowth,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withValues(alpha: 0.42),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: onAdd,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, Color(0xFF6D28D9)],
                ),
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.35),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    locked ? CupertinoIcons.lock_fill : CupertinoIcons.add,
                    size: 17,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      l.addMeasurementButton,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> values;
  final Color color;
  const _SparklinePainter({required this.values, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (values.length < 2) return;
    final minV = values.reduce(math.min);
    final maxV = values.reduce(math.max);
    final span = (maxV - minV).abs() < 0.01 ? 1.0 : maxV - minV;

    final path = Path();
    for (var i = 0; i < values.length; i++) {
      final x = size.width * (i / (values.length - 1));
      final y = size.height - ((values[i] - minV) / span) * (size.height - 6) - 3;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final fill = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.28), color.withValues(alpha: 0)],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.2
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    final lastX = size.width;
    final lastY =
        size.height - ((values.last - minV) / span) * (size.height - 6) - 3;
    canvas.drawCircle(Offset(lastX, lastY), 3.4, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_SparklinePainter old) => old.values != values;
}

/// One measurement on the timeline rail.
class _TimelineEntry extends StatelessWidget {
  final String date;
  final double height;
  final double diff;
  final bool isFirst;
  final bool isLast;

  const _TimelineEntry({
    required this.date,
    required this.height,
    required this.diff,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final up = diff > 0;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 28,
            child: Column(
              children: [
                Container(
                  width: 2,
                  height: 10,
                  color: isFirst
                      ? Colors.transparent
                      : Colors.white.withValues(alpha: 0.08),
                ),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isFirst ? AppColors.primary : AppColors.cardFill,
                    border: Border.all(
                      color: isFirst
                          ? AppColors.primary
                          : Colors.white.withValues(alpha: 0.20),
                      width: 2,
                    ),
                    boxShadow: isFirst
                        ? [
                            BoxShadow(
                                color:
                                    AppColors.primary.withValues(alpha: 0.5),
                                blurRadius: 10)
                          ]
                        : null,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    color: isLast
                        ? Colors.transparent
                        : Colors.white.withValues(alpha: 0.08),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 14, 14, 14),
                decoration: BoxDecoration(
                  color: AppColors.cardFill,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: Colors.white.withValues(alpha: 0.06)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${height.toStringAsFixed(1)} cm',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: -0.4,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withValues(alpha: 0.42),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (diff != 0)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 9, vertical: 4),
                        decoration: BoxDecoration(
                          color: (up ? AppColors.success : AppColors.error)
                              .withValues(alpha: 0.13),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              up
                                  ? CupertinoIcons.arrow_up_right
                                  : CupertinoIcons.arrow_down_right,
                              size: 11,
                              color: up ? AppColors.success : AppColors.error,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${up ? '+' : ''}${diff.toStringAsFixed(1)}',
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w800,
                                color:
                                    up ? AppColors.success : AppColors.error,
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
        ],
      ),
    );
  }
}
