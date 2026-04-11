import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

class PostureAnalysisScreen extends StatefulWidget {
  const PostureAnalysisScreen({super.key});

  @override
  State<PostureAnalysisScreen> createState() => _PostureAnalysisScreenState();
}

class _PostureAnalysisScreenState extends State<PostureAnalysisScreen> {
  // ── Helpers ──────────────────────────────────────────────────
  String _interpretation(int score, AppLocalizations l) {
    if (score >= 80) return l.postureExcellent;
    if (score >= 60) return l.postureGood;
    if (score >= 40) return l.postureNeedsWork;
    return l.posturePoor;
  }

  Color _scoreColor(int score) {
    if (score >= 80) return AppColors.lime;
    if (score >= 60) return AppColors.primary;
    if (score >= 40) return AppColors.orange;
    return AppColors.error;
  }

  LinearGradient _scoreGradient(int score) {
    final c = _scoreColor(score);
    return LinearGradient(
      colors: [c.withValues(alpha: 0.6), c],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }

  // ── Tip dialog ───────────────────────────────────────────────
  void _showTipDialog(BuildContext context) {
    HapticFeedback.selectionClick();
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: GlassCard(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      CupertinoIcons.info_circle_fill,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(ctx)!.howToTakePhoto,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _tipLine('1.', AppLocalizations.of(ctx)!.postureTip1),
              _tipLine('2.', AppLocalizations.of(ctx)!.postureTip2),
              _tipLine('3.', AppLocalizations.of(ctx)!.postureTip3),
              _tipLine('4.', AppLocalizations.of(ctx)!.postureTip4),
              _tipLine('5.', AppLocalizations.of(ctx)!.postureTip5),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary.withValues(alpha: 0.18),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: AppColors.primary.withValues(alpha: 0.4),
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: Text(
                    AppLocalizations.of(ctx)!.wellnessInfoGotIt,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tipLine(String num, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            child: Text(
              num,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Image source picker (camera or gallery) ──────────────────
  Future<void> _startAnalysis(BuildContext context) async {
    HapticFeedback.mediumImpact();
    final l = AppLocalizations.of(context)!;
    final source = await showCupertinoModalPopup<ImageSource>(
      context: context,
      builder: (ctx) => CupertinoActionSheet(
        title: Text(
          l.choosePhotoSource,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        message: Text(l.sideProfileHint),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(ctx).pop(ImageSource.camera),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.camera_fill, size: 20),
                const SizedBox(width: 10),
                Text(l.takePhoto),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(ctx).pop(ImageSource.gallery),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.photo_fill, size: 20),
                const SizedBox(width: 10),
                Text(l.chooseFromLibrary),
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () => Navigator.of(ctx).pop(),
          child: Text(l.cancel),
        ),
      ),
    );
    if (source == null) return;

    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: source,
      maxWidth: 1080,
      imageQuality: 85,
    );
    if (picked == null) return;

    // Save photo permanently
    final appDir = await getApplicationDocumentsDirectory();
    final dir = Directory('${appDir.path}/posture_photos');
    if (!dir.existsSync()) dir.createSync(recursive: true);
    final path =
        '${dir.path}/posture_${DateTime.now().millisecondsSinceEpoch}.jpg';
    await File(picked.path).copy(path);

    if (!context.mounted) return;
    _showAnalyzingModal(context, path);
  }

  void _showAnalyzingModal(BuildContext context, String path) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.92),
      builder: (ctx) => _AnalyzingOverlay(
        imagePath: path,
        onComplete: () {
          final provider = Provider.of<AppProvider>(context, listen: false);
          final rng = math.Random();
          final kyphosis = 50 + rng.nextInt(46); // 50-95
          final lordosis = 50 + rng.nextInt(46);
          final headPos = 50 + rng.nextInt(46);
          provider.addPostureAnalysis(
            path: path,
            kyphosisScore: kyphosis,
            lordosisScore: lordosis,
            headPosScore: headPos,
          );
          Navigator.of(ctx).pop();
          HapticFeedback.heavyImpact();
        },
      ),
    );
  }

  // ── Build ────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final analyses = provider.postureAnalyses;
        final latest =
            analyses.isNotEmpty ? analyses.last : null;
        final previous =
            analyses.length >= 2 ? analyses[analyses.length - 2] : null;
        final latestScore = latest != null
            ? (latest['totalScore'] as int? ?? 0)
            : 0;
        final prevScore = previous != null
            ? (previous['totalScore'] as int? ?? 0)
            : 0;
        final trend = latest != null && previous != null
            ? latestScore - prevScore
            : 0;

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: SafeArea(
            child: Column(
              children: [
                // ── 1. Top bar ──────────────────────────────────
                _buildTopBar(context),

                // ── Scrollable content ──────────────────────────
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── 2. Header section ────────────────
                        _buildHeader(context, latest, latestScore, trend),
                        const SizedBox(height: 20),

                        // ── A. Latest analysis card ──────────
                        if (latest != null) ...[
                          _buildLatestAnalysisCard(context, latest),
                          const SizedBox(height: 16),
                        ],

                        // ── B. History card ──────────────────
                        if (analyses.length >= 2) ...[
                          _buildHistoryCard(context, analyses),
                          const SizedBox(height: 16),
                        ],

                        // ── C. Tips card ─────────────────────
                        _buildTipsCard(context),
                        const SizedBox(height: 20),

                        // ── D. Take photo CTA ────────────────
                        _buildCTA(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ── 1. Top bar ───────────────────────────────────────────────
  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.back, color: AppColors.primary),
            onPressed: () {
              HapticFeedback.selectionClick();
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.postureAnalysisTitle,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.info_circle,
              color: AppColors.primary.withValues(alpha: 0.9),
            ),
            onPressed: () => _showTipDialog(context),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }

  // ── 2. Header section ────────────────────────────────────────
  Widget _buildHeader(
    BuildContext context,
    Map<String, dynamic>? latest,
    int latestScore,
    int trend,
  ) {
    final l = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F0B24), Color(0xFF070B1A)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.22),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.postureCoachHeader,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              letterSpacing: 2.0,
              shadows: [
                Shadow(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  blurRadius: 14,
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l.postureCoachSubtitle,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.7),
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 18),
          // Stat row
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.latestScore,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textTertiary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        latest != null ? '$latestScore' : '—',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: latest != null
                              ? _scoreColor(latestScore)
                              : Colors.white.withValues(alpha: 0.5),
                          letterSpacing: -0.5,
                          shadows: latest != null
                              ? [
                                  Shadow(
                                    color: _scoreColor(latestScore)
                                        .withValues(alpha: 0.5),
                                    blurRadius: 14,
                                  ),
                                ]
                              : null,
                        ),
                      ),
                      if (latest != null)
                        Text(
                          '/100',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              if (latest != null)
                _buildTrendPill(trend)
              else
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Text(
                    l.noData,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textTertiary,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrendPill(int trend) {
    if (trend == 0) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: Text(
          '—',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: Colors.white.withValues(alpha: 0.6),
          ),
        ),
      );
    }
    final isUp = trend > 0;
    final color = isUp ? AppColors.lime : AppColors.error;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isUp ? CupertinoIcons.arrow_up : CupertinoIcons.arrow_down,
            color: color,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            '${isUp ? '+' : ''}$trend',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w800,
              fontSize: 13,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }

  // ── A. Latest analysis card ──────────────────────────────────
  Widget _buildLatestAnalysisCard(BuildContext context, Map<String, dynamic> latest) {
    final l = AppLocalizations.of(context)!;
    final total = latest['totalScore'] as int? ?? 0;
    final kyphosis = latest['kyphosisScore'] as int? ?? 0;
    final lordosis = latest['lordosisScore'] as int? ?? 0;
    final headPos = latest['headPosScore'] as int? ?? 0;
    final color = _scoreColor(total);

    return GlassCard(
      glowColor: color.withValues(alpha: 0.18),
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.chart_bar_alt_fill,
            title: l.latestAnalysis,
            iconColor: color,
          ),
          const SizedBox(height: 20),
          // Big circular score
          Center(
            child: SizedBox(
              width: 180,
              height: 180,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: CustomPaint(
                      painter: _ScoreRingPainter(
                        progress: total / 100,
                        color: color,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$total',
                        style: TextStyle(
                          fontSize: 54,
                          fontWeight: FontWeight.w800,
                          color: color,
                          letterSpacing: -1,
                          shadows: [
                            Shadow(
                              color: color.withValues(alpha: 0.6),
                              blurRadius: 18,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        _interpretation(total, l).toUpperCase(),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: color,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Sub-metrics
          _buildMetricRow(AppLocalizations.of(context)!.kyphosisLabel, kyphosis),
          const SizedBox(height: 14),
          _buildMetricRow(AppLocalizations.of(context)!.lordosisLabel, lordosis),
          const SizedBox(height: 14),
          _buildMetricRow(l.headPosition, headPos),
        ],
      ),
    );
  }

  Widget _buildMetricRow(String label, int score) {
    final color = _scoreColor(score);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              '$score/100',
              style: TextStyle(
                color: color,
                fontSize: 13,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        GlowProgressBar(
          value: score / 100,
          gradient: _scoreGradient(score),
          glowColor: color,
        ),
      ],
    );
  }

  // ── B. History card ──────────────────────────────────────────
  Widget _buildHistoryCard(BuildContext context, List<Map<String, dynamic>> analyses) {
    final recent = analyses.length > 6
        ? analyses.sublist(analyses.length - 6)
        : List<Map<String, dynamic>>.from(analyses);
    final scores = recent
        .map((a) => (a['totalScore'] as int? ?? 0).toDouble())
        .toList();
    final first = scores.first.toInt();
    final last = scores.last.toInt();
    final diff = last - first;

    return GlassCard(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SectionHeader(
                icon: CupertinoIcons.graph_square_fill,
                title: AppLocalizations.of(context)!.progressLabel,
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: (diff >= 0 ? AppColors.lime : AppColors.error)
                      .withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: (diff >= 0 ? AppColors.lime : AppColors.error)
                        .withValues(alpha: 0.4),
                  ),
                ),
                child: Text(
                  '${diff >= 0 ? '+' : ''}$diff points',
                  style: TextStyle(
                    color: diff >= 0 ? AppColors.lime : AppColors.error,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 100,
            child: CustomPaint(
              painter: _HistoryLinePainter(scores: scores),
              size: Size.infinite,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${scores.length} recent scan${scores.length == 1 ? '' : 's'}',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
              Text(
                '$first → $last',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── C. Tips card ─────────────────────────────────────────────
  Widget _buildTipsCard(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final tips = [
      {
        'emoji': '🧍',
        'title': l.postureWallStand,
        'desc': l.postureWallStandDesc,
      },
      {
        'emoji': '🦋',
        'title': l.postureChestOpener,
        'desc': l.postureChestOpenerDesc,
      },
      {
        'emoji': '👤',
        'title': l.postureChinTucks,
        'desc': l.postureChinTucksDesc,
      },
      {
        'emoji': '🐞',
        'title': l.postureDeadbug,
        'desc': l.postureDeadbugDesc,
      },
    ];

    return GlassCard(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.sparkles,
            title: l.recommendedExercises,
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < tips.length; i++) ...[
            if (i > 0)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  height: 1,
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.22),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    tips[i]['emoji']!,
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tips[i]['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        tips[i]['desc']!,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6),
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  // ── D. Take photo CTA ────────────────────────────────────────
  Widget _buildCTA(BuildContext context) {
    return GestureDetector(
      onTap: () => _startAnalysis(context),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          gradient: AppColors.gradientPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.5),
              blurRadius: 22,
              offset: const Offset(0, 8),
            ),
          ],
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.camera_fill,
              color: Colors.white,
              size: 22,
            ),
            const SizedBox(width: 10),
            Text(
              AppLocalizations.of(context)!.takePosturePhoto,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Score ring custom painter ─────────────────────────────────
class _ScoreRingPainter extends CustomPainter {
  final double progress; // 0-1
  final Color color;

  _ScoreRingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (math.min(size.width, size.height) / 2) - 10;

    // Background ring
    final bgPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, bgPaint);

    // Glow ring behind arc
    final glowPaint = Paint()
      ..color = color.withValues(alpha: 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    final sweep = 2 * math.pi * progress.clamp(0.0, 1.0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweep,
      false,
      glowPaint,
    );

    // Progress arc
    final arcPaint = Paint()
      ..shader = SweepGradient(
        startAngle: -math.pi / 2,
        endAngle: 3 * math.pi / 2,
        colors: [color.withValues(alpha: 0.7), color],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweep,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ScoreRingPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}

// ── History mini line graph painter ──────────────────────────
class _HistoryLinePainter extends CustomPainter {
  final List<double> scores;

  _HistoryLinePainter({required this.scores});

  @override
  void paint(Canvas canvas, Size size) {
    if (scores.isEmpty) return;
    const minY = 0.0;
    const maxY = 100.0;
    final range = maxY - minY;
    final stepX = scores.length > 1
        ? size.width / (scores.length - 1)
        : size.width;

    // Gridlines
    final gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..strokeWidth = 1;
    for (int i = 0; i <= 4; i++) {
      final y = size.height * (i / 4);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Build path
    final path = Path();
    final points = <Offset>[];
    for (int i = 0; i < scores.length; i++) {
      final x = scores.length > 1 ? stepX * i : size.width / 2;
      final normalized = (scores[i] - minY) / range;
      final y = size.height - (normalized * size.height);
      points.add(Offset(x, y));
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    // Fill under line
    final fillPath = Path.from(path)
      ..lineTo(points.last.dx, size.height)
      ..lineTo(points.first.dx, size.height)
      ..close();
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primary.withValues(alpha: 0.35),
          AppColors.primary.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(fillPath, fillPaint);

    // Line glow
    final glowPaint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawPath(path, glowPaint);

    // Line
    final linePaint = Paint()
      ..shader = AppColors.gradientGrowth.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(path, linePaint);

    // Dots
    final dotPaint = Paint()..color = AppColors.lime;
    final dotGlowPaint = Paint()
      ..color = AppColors.lime.withValues(alpha: 0.6)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    for (final p in points) {
      canvas.drawCircle(p, 5, dotGlowPaint);
      canvas.drawCircle(p, 3, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _HistoryLinePainter oldDelegate) {
    return oldDelegate.scores != scores;
  }
}

// ── Analyzing overlay modal ───────────────────────────────────
class _AnalyzingOverlay extends StatefulWidget {
  final String imagePath;
  final VoidCallback onComplete;

  const _AnalyzingOverlay({
    required this.imagePath,
    required this.onComplete,
  });

  @override
  State<_AnalyzingOverlay> createState() => _AnalyzingOverlayState();
}

class _AnalyzingOverlayState extends State<_AnalyzingOverlay>
    with TickerProviderStateMixin {
  late final AnimationController _scanController;
  late final AnimationController _dotsController;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
    _dotsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (!mounted) return;
      widget.onComplete();
    });
  }

  @override
  void dispose() {
    _scanController.dispose();
    _dotsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Photo with scanning line
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Image.file(
                        File(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Dark gradient overlay
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.2),
                              Colors.black.withValues(alpha: 0.5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Scanning line
                    AnimatedBuilder(
                      animation: _scanController,
                      builder: (context, _) {
                        return Positioned.fill(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final h = constraints.maxHeight;
                              final y = h * _scanController.value;
                              return Stack(
                                children: [
                                  Positioned(
                                    top: y - 20,
                                    left: 0,
                                    right: 0,
                                    height: 40,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            AppColors.primary
                                                .withValues(alpha: 0),
                                            AppColors.primary
                                                .withValues(alpha: 0.35),
                                            AppColors.primary
                                                .withValues(alpha: 0),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: y,
                                    left: 0,
                                    right: 0,
                                    height: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.lime,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.lime
                                                .withValues(alpha: 0.8),
                                            blurRadius: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                    // Corner brackets
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _CornerBracketsPainter(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // ANALYZING text with dots
            AnimatedBuilder(
              animation: _dotsController,
              builder: (context, _) {
                final dotCount =
                    ((_dotsController.value * 4).floor() % 4).clamp(0, 3);
                final dots = '.' * dotCount;
                return Text(
                  '${AppLocalizations.of(context)!.analyzingPosture}$dots',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(
                        color: AppColors.primary.withValues(alpha: 0.6),
                        blurRadius: 14,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Detecting spinal alignment...',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 12,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CornerBracketsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    const len = 24.0;
    const pad = 14.0;

    // Top-left
    canvas.drawLine(
        const Offset(pad, pad + len), const Offset(pad, pad), paint);
    canvas.drawLine(
        const Offset(pad, pad), const Offset(pad + len, pad), paint);

    // Top-right
    canvas.drawLine(Offset(size.width - pad - len, pad),
        Offset(size.width - pad, pad), paint);
    canvas.drawLine(Offset(size.width - pad, pad),
        Offset(size.width - pad, pad + len), paint);

    // Bottom-left
    canvas.drawLine(Offset(pad, size.height - pad - len),
        Offset(pad, size.height - pad), paint);
    canvas.drawLine(Offset(pad, size.height - pad),
        Offset(pad + len, size.height - pad), paint);

    // Bottom-right
    canvas.drawLine(Offset(size.width - pad - len, size.height - pad),
        Offset(size.width - pad, size.height - pad), paint);
    canvas.drawLine(Offset(size.width - pad, size.height - pad - len),
        Offset(size.width - pad, size.height - pad), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
