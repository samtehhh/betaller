import 'dart:math' as math;

import 'package:flutter/material.dart';

/// One axis of the radar: what it measures, how it scores, and its colour.
class RadarAxis {
  final String label;
  final int value; // 0-100
  final Color color;
  const RadarAxis({
    required this.label,
    required this.value,
    required this.color,
  });
}

/// A five-sided radar. The shape says at a glance whether the user is balanced
/// or leaning on one strength, which a stack of bars never shows.
class RadarChart extends StatelessWidget {
  final List<RadarAxis> axes;
  final double progress; // 0-1, for the entry animation
  final Color gridColor;

  const RadarChart({
    super.key,
    required this.axes,
    this.progress = 1,
    this.gridColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final size = math.min(c.maxWidth, c.maxHeight);
        return SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: _RadarPainter(
              axes: axes,
              progress: progress,
              gridColor: gridColor,
              textDirection: Directionality.of(context),
            ),
          ),
        );
      },
    );
  }
}

class _RadarPainter extends CustomPainter {
  final List<RadarAxis> axes;
  final double progress;
  final Color gridColor;
  final TextDirection textDirection;

  const _RadarPainter({
    required this.axes,
    required this.progress,
    required this.gridColor,
    required this.textDirection,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (axes.isEmpty) return;
    final center = Offset(size.width / 2, size.height / 2);
    // room for the labels that sit outside the shape
    final radius = size.width / 2 - 34;
    final count = axes.length;
    final step = 2 * math.pi / count;

    Offset point(int i, double t) {
      final angle = -math.pi / 2 + i * step;
      return Offset(
        center.dx + radius * t * math.cos(angle),
        center.dy + radius * t * math.sin(angle),
      );
    }

    // ── Grid: four rings plus the spokes ────────────────────────────────
    final gridPaint = Paint()
      ..color = gridColor.withValues(alpha: 0.07)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (var ring = 1; ring <= 4; ring++) {
      final t = ring / 4;
      final path = Path();
      for (var i = 0; i < count; i++) {
        final p = point(i, t);
        if (i == 0) {
          path.moveTo(p.dx, p.dy);
        } else {
          path.lineTo(p.dx, p.dy);
        }
      }
      path.close();
      canvas.drawPath(path, gridPaint);
    }

    for (var i = 0; i < count; i++) {
      canvas.drawLine(center, point(i, 1), gridPaint);
    }

    // ── The shape itself ────────────────────────────────────────────────
    final valuePath = Path();
    for (var i = 0; i < count; i++) {
      final t = (axes[i].value / 100).clamp(0.0, 1.0) * progress;
      final p = point(i, t);
      if (i == 0) {
        valuePath.moveTo(p.dx, p.dy);
      } else {
        valuePath.lineTo(p.dx, p.dy);
      }
    }
    valuePath.close();

    canvas.drawPath(
      valuePath,
      Paint()
        ..shader = SweepGradient(
          colors: [
            ...axes.map((a) => a.color.withValues(alpha: 0.34)),
            axes.first.color.withValues(alpha: 0.34),
          ],
          transform: const GradientRotation(-math.pi / 2),
        ).createShader(Rect.fromCircle(center: center, radius: radius)),
    );

    canvas.drawPath(
      valuePath,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..strokeJoin = StrokeJoin.round,
    );

    // ── Vertices and labels ─────────────────────────────────────────────
    for (var i = 0; i < count; i++) {
      final axis = axes[i];
      final t = (axis.value / 100).clamp(0.0, 1.0) * progress;
      final p = point(i, t);

      canvas.drawCircle(
        p,
        6,
        Paint()
          ..color = axis.color.withValues(alpha: 0.35)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5),
      );
      canvas.drawCircle(p, 3.2, Paint()..color = axis.color);

      // label just outside the outer ring
      final labelPos = point(i, 1.0);
      final angle = -math.pi / 2 + i * step;
      final dx = math.cos(angle);
      final dy = math.sin(angle);

      final painter = TextPainter(
        text: TextSpan(children: [
          TextSpan(
            text: axis.label.toUpperCase(),
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
              color: Colors.white.withValues(alpha: 0.45),
            ),
          ),
          TextSpan(
            text: '\n${axis.value}',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: axis.color,
            ),
          ),
        ]),
        textAlign: TextAlign.center,
        textDirection: textDirection,
      )..layout();

      final offset = Offset(
        labelPos.dx + dx * 16 - painter.width / 2,
        labelPos.dy + dy * 16 - painter.height / 2,
      );
      painter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(_RadarPainter old) =>
      old.progress != progress || old.axes != axes;
}
