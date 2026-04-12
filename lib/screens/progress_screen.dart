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
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final records = provider.heightRecords;

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              // ── Header ──────────────────────────────
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
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                      child: Text(
                        l.progressTitle,
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                          letterSpacing: -1.2,
                          shadows: [Shadow(color: AppColors.primary.withValues(alpha: 0.2), blurRadius: 8)],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // ── Stats Row ─────────────────────
                    GlassCard(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                      child: Row(
                        children: [
                          _StatItem(
                            label: l.totalGrowth,
                            value: '${provider.totalGrowth > 0 ? '+' : ''}${provider.totalGrowth}',
                            unit: 'cm',
                            color: provider.totalGrowth > 0 ? AppColors.success : AppColors.textSecondary,
                          ),
                          Container(width: 1, height: 36, color: Colors.white.withValues(alpha: 0.14)),
                          _StatItem(
                            label: l.lastDiff,
                            value: '${provider.lastGrowth > 0 ? '+' : ''}${provider.lastGrowth}',
                            unit: 'cm',
                            color: provider.lastGrowth > 0 ? AppColors.success : AppColors.textSecondary,
                          ),
                          Container(width: 1, height: 36, color: Colors.white.withValues(alpha: 0.14)),
                          _StatItem(
                            label: l.measurementCount,
                            value: '${records.length}',
                            unit: '',
                            color: AppColors.primaryLight,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Chart ─────────────────────────
                    if (records.length >= 2)
                      GlassCard(
                        padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionHeader(icon: CupertinoIcons.graph_square_fill, title: l.heightChart),
                            const SizedBox(height: 18),
                            SizedBox(
                              height: 200,
                              child: AnimatedBuilder(
                                animation: _chartAnim,
                                builder: (context, _) => _buildChart(context, records, _chartCurve.value),
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      GlassCard(
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          children: [
                            Icon(CupertinoIcons.graph_square, color: AppColors.textTertiary, size: 36),
                            const SizedBox(height: 14),
                            Text(
                              l.chartMinData,
                              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              l.chartInstruction,
                              style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 14),

                    // ── Add Measurement Button ────────
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.25), blurRadius: 14, offset: const Offset(0, 4))],
                      ),
                      child: CupertinoButton(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        onPressed: provider.isPremium
                            ? () => _showAddMeasurementSheet(context, provider)
                            : () => showPremiumPaywall(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              provider.isPremium ? CupertinoIcons.add : CupertinoIcons.lock_fill,
                              size: 18,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              l.addMeasurementButton,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 1.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ── Measurement History ───────────
                    if (records.isNotEmpty) ...[
                      SectionHeader(icon: CupertinoIcons.clock, title: l.measurementHistory),
                      const SizedBox(height: 14),
                      ...List.generate(records.length, (i) {
                        final index = records.length - 1 - i;
                        final record = records[index];
                        final diff = index > 0 ? record.height - records[index - 1].height : 0.0;
                        final diffStr = diff != 0 ? '${diff > 0 ? '+' : ''}${diff.toStringAsFixed(1)} cm' : '';

                        DateTime? parsedDate;
                        try { parsedDate = DateTime.parse(record.date); } catch (_) {}
                        final dateStr = parsedDate != null
                            ? DateFormat('d MMM yyyy', Localizations.localeOf(context).languageCode).format(parsedDate)
                            : record.date;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Dismissible(
                            key: Key(record.date),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: AppColors.error.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: const Icon(CupertinoIcons.delete, color: AppColors.error, size: 20),
                            ),
                            confirmDismiss: (direction) async {
                              return await showCupertinoDialog<bool>(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                  title: Text(l.deleteTitle),
                                  content: Text(l.deleteMessage),
                                  actions: [
                                    CupertinoDialogAction(
                                      onPressed: () => Navigator.pop(context, false),
                                      child: Text(l.dismiss),
                                    ),
                                    CupertinoDialogAction(
                                      isDestructiveAction: true,
                                      onPressed: () => Navigator.pop(context, true),
                                      child: Text(l.delete),
                                    ),
                                  ],
                                ),
                              );
                            },
                            onDismissed: (_) => provider.deleteHeightRecord(record.date),
                            child: GlassCard(
                              padding: const EdgeInsets.all(20),
                              borderRadius: 22,
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(CupertinoIcons.resize_v, color: AppColors.primaryLight, size: 16),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dateStr,
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.3),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          '${record.height.toStringAsFixed(1)} cm',
                                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textSecondary, letterSpacing: -0.1),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (diffStr.isNotEmpty)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: (diff > 0 ? AppColors.success : AppColors.error).withValues(alpha: 0.12),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        diffStr,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          color: diff > 0 ? AppColors.success : AppColors.error,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),

                    // ── Weekly Report ──────────────────
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => const WeeklyReportScreen())),
                      child: GlassCard(
                        glowColor: AppColors.orange.withValues(alpha: 0.15),
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [AppColors.orange.withValues(alpha: 0.25), AppColors.warning.withValues(alpha: 0.12)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: AppColors.orange.withValues(alpha: 0.35)),
                              ),
                              child: const Icon(CupertinoIcons.doc_chart_fill, color: AppColors.orange, size: 22),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l.weeklyReportMenu,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    l.weeklyReportMenuSubtitle,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(CupertinoIcons.chevron_right, color: AppColors.orange.withValues(alpha: 0.7), size: 18),
                          ],
                        ),
                      ),
                    ),
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
