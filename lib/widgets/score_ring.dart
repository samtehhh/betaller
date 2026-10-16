import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../utils/betaller_score.dart';
import '../utils/constants.dart';

// The BeTaller Score's look: the ring, and the colour, icon and name of each
// tier and signal. Shared by the Analysis tab and the paywall's preview of it.

String scoreTierName(AppLocalizations l, ScoreTier t) => switch (t) {
  ScoreTier.starting => l.anTierStarting,
  ScoreTier.building => l.anTierBuilding,
  ScoreTier.rising => l.anTierRising,
  ScoreTier.strong => l.anTierStrong,
  ScoreTier.peak => l.anTierPeak,
};

Color scoreTierColor(ScoreTier? t) => switch (t) {
  null || ScoreTier.starting => const Color(0xFF94A3B8),
  ScoreTier.building => AppColors.primaryLight,
  ScoreTier.rising || ScoreTier.strong => AppColors.lime,
  ScoreTier.peak => AppColors.warning,
};

Color scoreFactorColor(ScoreFactor f) => switch (f) {
  ScoreFactor.training => AppColors.primaryLight,
  ScoreFactor.consistency => AppColors.warning,
  ScoreFactor.sleep => AppColors.sleepColor,
  ScoreFactor.hydration => AppColors.cyan,
  ScoreFactor.nutrition => AppColors.orange,
  ScoreFactor.posture => AppColors.postureColor,
  ScoreFactor.measuring => AppColors.primary,
  ScoreFactor.growth || ScoreFactor.headroom => AppColors.lime,
};

IconData scoreFactorIcon(ScoreFactor f) => switch (f) {
  ScoreFactor.training => CupertinoIcons.bolt_fill,
  ScoreFactor.consistency => CupertinoIcons.flame_fill,
  ScoreFactor.sleep => CupertinoIcons.moon_fill,
  ScoreFactor.hydration => CupertinoIcons.drop_fill,
  ScoreFactor.nutrition => CupertinoIcons.leaf_arrow_circlepath,
  ScoreFactor.posture => CupertinoIcons.person_fill,
  ScoreFactor.measuring => CupertinoIcons.resize_v,
  ScoreFactor.growth => CupertinoIcons.arrow_up_right,
  ScoreFactor.headroom => CupertinoIcons.arrow_up_to_line,
};

String scoreFactorName(AppLocalizations l, ScoreFactor f) => switch (f) {
  ScoreFactor.training => l.anFTraining,
  ScoreFactor.consistency => l.anFConsistency,
  ScoreFactor.sleep => l.anFSleep,
  ScoreFactor.hydration => l.anFHydration,
  ScoreFactor.nutrition => l.anFNutrition,
  ScoreFactor.posture => l.anFPosture,
  ScoreFactor.measuring => l.anFMeasuring,
  ScoreFactor.growth => l.anFGrowth,
  ScoreFactor.headroom => l.anFHeadroom,
};

class ScoreRingPainter extends CustomPainter {
  final double progress;
  final Color color;

  ScoreRingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.07)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12,
    );
    if (progress <= 0) return;

    final sweep = 2 * math.pi * progress;
    // The one glow on the screen: under the arc.
    canvas.drawArc(
      rect,
      -math.pi / 2,
      sweep,
      false,
      Paint()
        ..color = color.withValues(alpha: 0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );
    canvas.drawArc(
      rect,
      -math.pi / 2,
      sweep,
      false,
      Paint()
        ..shader = SweepGradient(
          endAngle: 2 * math.pi * progress.clamp(0.01, 1.0),
          colors: [color.withValues(alpha: 0.55), color],
          transform: const GradientRotation(-math.pi / 2),
        ).createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant ScoreRingPainter old) =>
      old.progress != progress || old.color != color;
}
