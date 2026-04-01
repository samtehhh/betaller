import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../models/height_record.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final records = provider.heightRecords;

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // ── Header ──────────────────────────────
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1E1B4B), Color(0xFF0A0A1A)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                      child: const Text(
                        'İlerleme Takibi',
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
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // ── Stats Row ─────────────────────
                    GlassCard(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                      child: Row(
                        children: [
                          _StatItem(
                            label: 'Toplam',
                            value: '${provider.totalGrowth > 0 ? '+' : ''}${provider.totalGrowth}',
                            unit: 'cm',
                            color: provider.totalGrowth > 0 ? AppColors.success : AppColors.textSecondary,
                          ),
                          Container(width: 1, height: 36, color: Colors.white.withValues(alpha: 0.08)),
                          _StatItem(
                            label: 'Son Fark',
                            value: '${provider.lastGrowth > 0 ? '+' : ''}${provider.lastGrowth}',
                            unit: 'cm',
                            color: provider.lastGrowth > 0 ? AppColors.success : AppColors.textSecondary,
                          ),
                          Container(width: 1, height: 36, color: Colors.white.withValues(alpha: 0.08)),
                          _StatItem(
                            label: 'Ölçüm',
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
                            SectionHeader(icon: CupertinoIcons.graph_square_fill, title: 'Boy Grafiği'),
                            const SizedBox(height: 18),
                            SizedBox(
                              height: 200,
                              child: _buildChart(records),
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
                              'Grafik için en az 2 ölçüm gerekli',
                              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Yeni ölçüm ekleyerek ilerleme grafiğini gör!',
                              style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 14),

                    // ── Add Measurement Button ────────
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        onPressed: () => _showAddMeasurementSheet(context, provider),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(CupertinoIcons.add, size: 18, color: Colors.white),
                            const SizedBox(width: 8),
                            const Text(
                              'Yeni Ölçüm Ekle',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.3),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ── Measurement History ───────────
                    if (records.isNotEmpty) ...[
                      SectionHeader(icon: CupertinoIcons.clock, title: 'Ölçüm Geçmişi'),
                      const SizedBox(height: 14),
                      ...List.generate(records.length, (i) {
                        final index = records.length - 1 - i;
                        final record = records[index];
                        final diff = index > 0 ? record.height - records[index - 1].height : 0.0;
                        final diffStr = diff != 0 ? '${diff > 0 ? '+' : ''}${diff.toStringAsFixed(1)} cm' : '';

                        DateTime? parsedDate;
                        try { parsedDate = DateTime.parse(record.date); } catch (_) {}
                        final dateStr = parsedDate != null
                            ? DateFormat('d MMM yyyy', 'tr').format(parsedDate)
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
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(CupertinoIcons.delete, color: AppColors.error, size: 20),
                            ),
                            confirmDismiss: (direction) async {
                              return await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: AppColors.surfaceDark,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  title: Text('Ölçümü Sil', style: TextStyle(color: Colors.white)),
                                  content: Text('Bu ölçümü silmek istediğine emin misin?', style: TextStyle(color: AppColors.textSecondary)),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(context, false), child: Text('İptal', style: TextStyle(color: AppColors.textSecondary))),
                                    TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Sil', style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w600))),
                                  ],
                                ),
                              );
                            },
                            onDismissed: (_) => provider.deleteHeightRecord(record.date),
                            child: GlassCard(
                              padding: const EdgeInsets.all(20),
                              borderRadius: 16,
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

  Widget _buildChart(List<HeightRecord> records) {
    final spots = records.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.height);
    }).toList();

    final heights = records.map((r) => r.height).toList();
    final minH = heights.reduce((a, b) => a < b ? a : b);
    final maxH = heights.reduce((a, b) => a > b ? a : b);
    final range = maxH - minH;
    final minY = minH - (range < 2 ? 2 : range * 0.3);
    final maxY = maxH + (range < 2 ? 2 : range * 0.3);

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: range < 3 ? 0.5 : 1,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.white.withValues(alpha: 0.04),
            strokeWidth: 1,
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
                  style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.3), fontWeight: FontWeight.w500),
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
                // Show first, last, and middle labels to avoid clutter
                if (records.length > 5 && index != 0 && index != records.length - 1 && index != records.length ~/ 2) {
                  return const SizedBox();
                }
                final date = DateTime.tryParse(records[index].date);
                if (date == null) return const SizedBox();
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    DateFormat('d MMM', 'tr').format(date),
                    style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.4), fontWeight: FontWeight.w500),
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
            curveSmoothness: 0.3,
            color: AppColors.primary,
            barWidth: 2.5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                radius: 4,
                color: AppColors.scaffold,
                strokeWidth: 2.5,
                strokeColor: AppColors.primaryLight,
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.18),
                  AppColors.primary.withValues(alpha: 0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            tooltipMargin: 16,
            tooltipRoundedRadius: 12,
            getTooltipColor: (_) => const Color(0xFF2D1B69),
            getTooltipItems: (touchedSpots) => touchedSpots.map((spot) {
              final index = spot.x.toInt();
              String dateLabel = '';
              if (index >= 0 && index < records.length) {
                final date = DateTime.tryParse(records[index].date);
                if (date != null) {
                  dateLabel = '${DateFormat('d MMMM', 'tr').format(date)}\n';
                }
              }
              return LineTooltipItem(
                '$dateLabel${spot.y.toStringAsFixed(1)} cm',
                const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15, height: 1.4),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _showAddMeasurementSheet(BuildContext context, AppProvider provider) {
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
              borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
              border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.08))),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 36, height: 4,
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(2)),
                ),
                const SizedBox(height: 24),
                const Icon(CupertinoIcons.resize_v, color: AppColors.primaryLight, size: 28),
                const SizedBox(height: 12),
                const Text(
                  'Yeni Boy Ölçümü',
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
                      locale: const Locale('tr', 'TR'),
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
                          DateFormat('d MMMM yyyy', 'tr').format(selectedDate),
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
                    fillColor: Colors.white.withValues(alpha: 0.06),
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
                    child: const Text('Kaydet', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white, letterSpacing: -0.3)),
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
          Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.4), letterSpacing: -0.1)),
        ],
      ),
    );
  }
}
