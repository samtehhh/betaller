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
                    Row(
                      children: [
                        _StatCard(
                          icon: CupertinoIcons.chart_bar_alt_fill,
                          label: 'Toplam',
                          value: '${provider.totalGrowth > 0 ? '+' : ''}${provider.totalGrowth} cm',
                          color: provider.totalGrowth > 0 ? AppColors.success : AppColors.textSecondary,
                        ),
                        const SizedBox(width: 8),
                        _StatCard(
                          icon: CupertinoIcons.arrow_up_right,
                          label: 'Son',
                          value: '${provider.lastGrowth > 0 ? '+' : ''}${provider.lastGrowth} cm',
                          color: provider.lastGrowth > 0 ? AppColors.success : AppColors.textSecondary,
                        ),
                        const SizedBox(width: 8),
                        _StatCard(
                          icon: CupertinoIcons.doc_text,
                          label: 'Ölçüm',
                          value: '${records.length}',
                          color: AppColors.primaryLight,
                        ),
                      ],
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

    final minY = records.map((r) => r.height).reduce((a, b) => a < b ? a : b) - 1;
    final maxY = records.map((r) => r.height).reduce((a, b) => a > b ? a : b) + 1;

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.white.withValues(alpha: 0.05),
            strokeWidth: 1,
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 45,
              getTitlesWidget: (value, meta) => Text(
                value.toStringAsFixed(0),
                style: TextStyle(fontSize: 11, color: AppColors.textTertiary),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= records.length) return const SizedBox();
                final date = DateTime.tryParse(records[index].date);
                if (date == null) return const SizedBox();
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    DateFormat('d/M', 'tr').format(date),
                    style: TextStyle(fontSize: 10, color: AppColors.textTertiary),
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
            color: AppColors.primary,
            barWidth: 2.5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                radius: 3.5,
                color: AppColors.scaffold,
                strokeWidth: 2,
                strokeColor: AppColors.primaryLight,
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.2),
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
            getTooltipColor: (_) => AppColors.surfaceDark,
            getTooltipItems: (touchedSpots) => touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toStringAsFixed(1)} cm',
                const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13),
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

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
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
              Text(
                'Tarih: ${DateFormat('d MMMM yyyy', 'tr').format(DateTime.now())}',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
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
                      final today = DateTime.now().toIso8601String().substring(0, 10);
                      provider.addHeightRecord(HeightRecord(date: today, height: height));
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
    );
  }
}

// ── Stat Card ─────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GlassCard(
        padding: const EdgeInsets.all(20),
        borderRadius: 16,
        child: Column(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: color, letterSpacing: -0.5),
            ),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textTertiary, letterSpacing: 0.8)),
          ],
        ),
      ),
    );
  }
}
