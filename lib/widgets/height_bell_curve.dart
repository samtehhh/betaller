import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../utils/constants.dart';

/// Where the user stands in the height distribution for their age and sex.
///
/// The bell is the population, the shaded part is everyone shorter, and the
/// line is the user. A percentile number alone never showed how close the
/// crowd is packed around the mean.
class HeightBellCurve extends StatelessWidget {
  final double heightCm;
  final double mean;
  final double sd;
  final double percentile;
  final Color color;
  final double progress;

  const HeightBellCurve({
    super.key,
    required this.heightCm,
    required this.mean,
    required this.sd,
    required this.percentile,
    this.color = AppColors.primary,
    this.progress = 1,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BellPainter(
        heightCm: heightCm,
        mean: mean,
        sd: sd,
        percentile: percentile,
        color: color,
        progress: progress,
        textDirection: Directionality.of(context),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _BellPainter extends CustomPainter {
  final double heightCm;
  final double mean;
  final double sd;
  final double percentile;
  final Color color;
  final double progress;
  final TextDirection textDirection;

  const _BellPainter({
    required this.heightCm,
    required this.mean,
    required this.sd,
    required this.percentile,
    required this.color,
    required this.progress,
    required this.textDirection,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const labelSpace = 22.0;
    final chartH = size.height - labelSpace;
    // three standard deviations either side covers the population
    final minX = mean - 3 * sd;
    final maxX = mean + 3 * sd;
    final span = maxX - minX;

    double xFor(double cm) => ((cm - minX) / span) * size.width;
    double yFor(double cm) {
      final z = (cm - mean) / sd;
      final density = math.exp(-0.5 * z * z);
      return chartH - density * (chartH - 12) - 4;
    }

    // ── The curve ───────────────────────────────────────────────────────
    final curve = Path();
    for (var i = 0; i <= 120; i++) {
      final cm = minX + span * (i / 120);
      final p = Offset(xFor(cm), yFor(cm));
      if (i == 0) {
        curve.moveTo(p.dx, p.dy);
      } else {
        curve.lineTo(p.dx, p.dy);
      }
    }

    final userX = xFor(heightCm.clamp(minX, maxX));

    // shade everyone shorter than the user
    final shaded = Path.from(curve)
      ..lineTo(size.width, chartH)
      ..lineTo(0, chartH)
      ..close();
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, userX * progress, chartH));
    canvas.drawPath(
      shaded,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.55), color.withValues(alpha: 0.10)],
        ).createShader(Rect.fromLTWH(0, 0, size.width, chartH)),
    );
    canvas.restore();

    // the rest of the population, faint
    canvas.save();
    canvas.clipRect(
        Rect.fromLTWH(userX * progress, 0, size.width, chartH));
    canvas.drawPath(
      shaded,
      Paint()..color = Colors.white.withValues(alpha: 0.045),
    );
    canvas.restore();

    canvas.drawPath(
      curve,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6,
    );

    // ── Baseline and its ticks ──────────────────────────────────────────
    canvas.drawLine(
      Offset(0, chartH),
      Offset(size.width, chartH),
      Paint()..color = Colors.white.withValues(alpha: 0.10),
    );

    for (final z in [-2.0, -1.0, 0.0, 1.0, 2.0]) {
      final cm = mean + z * sd;
      final x = xFor(cm);
      canvas.drawLine(
        Offset(x, chartH),
        Offset(x, chartH + 4),
        Paint()..color = Colors.white.withValues(alpha: 0.15),
      );
      final tp = TextPainter(
        text: TextSpan(
          text: cm.round().toString(),
          style: TextStyle(
            fontSize: 9.5,
            fontWeight: z == 0 ? FontWeight.w800 : FontWeight.w600,
            color: Colors.white.withValues(alpha: z == 0 ? 0.55 : 0.30),
          ),
        ),
        textDirection: textDirection,
      )..layout();
      tp.paint(canvas, Offset(x - tp.width / 2, chartH + 6));
    }

    // ── The user's line ─────────────────────────────────────────────────
    final lineX = userX * progress;
    canvas.drawLine(
      Offset(lineX, yFor(heightCm.clamp(minX, maxX)) - 6),
      Offset(lineX, chartH),
      Paint()
        ..color = color
        ..strokeWidth = 2.4,
    );
    canvas.drawCircle(
      Offset(lineX, yFor(heightCm.clamp(minX, maxX)) - 6),
      7,
      Paint()
        ..color = color.withValues(alpha: 0.35)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );
    canvas.drawCircle(
        Offset(lineX, yFor(heightCm.clamp(minX, maxX)) - 6),
        3.6,
        Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_BellPainter old) =>
      old.heightCm != heightCm ||
      old.mean != mean ||
      old.progress != progress ||
      old.color != color;
}
