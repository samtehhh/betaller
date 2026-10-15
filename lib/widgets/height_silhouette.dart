import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';

/// Two figures side by side, scaled to real height: the user today, and the
/// user at their potential. The second one grows into place, so the gap
/// between "now" and "possible" is something you see, not a number you read.
class HeightSilhouette extends StatelessWidget {
  final double current;
  final double potential;

  /// Drawn as a thin goal line across both figures when set.
  final double? dream;

  final String Function(double cm) format;
  final double height;
  final bool animate;

  const HeightSilhouette({
    super.key,
    required this.current,
    required this.potential,
    required this.format,
    this.dream,
    this.height = 220,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final top = [potential, dream ?? 0, current].reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: height,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: animate && !reduceMotion ? 0 : 1, end: 1),
        duration: const Duration(milliseconds: 1600),
        curve: Curves.easeOutCubic,
        builder: (context, t, _) {
          final grown = current + (potential - current) * t;
          return CustomPaint(
            painter: _SilhouettePainter(
              current: current,
              potential: grown,
              dream: dream,
              top: top,
              glow: t,
            ),
            child: _Labels(
              current: current,
              potential: grown,
              top: top,
              nowLabel: l.silNow,
              potentialLabel: l.silPotential,
              format: format,
            ),
          );
        },
      ),
    );
  }
}

class _Labels extends StatelessWidget {
  final double current;
  final double potential;
  final double top;
  final String nowLabel;
  final String potentialLabel;
  final String Function(double) format;

  const _Labels({
    required this.current,
    required this.potential,
    required this.top,
    required this.nowLabel,
    required this.potentialLabel,
    required this.format,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, box) {
        final h = box.maxHeight;
        double yFor(double cm) => _SilhouettePainter.figureTop(h, cm, top);
        Widget tag(String title, String value, Color color, double x, double y) {
          return Positioned(
            left: x,
            top: (y - 44).clamp(0.0, h - 44),
            width: box.maxWidth * 0.34,
            child: Column(
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: color.withValues(alpha: 0.85),
                    letterSpacing: 0.4,
                  ),
                ),
                Text(
                  value,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
                ),
              ],
            ),
          );
        }

        return Stack(
          children: [
            tag(nowLabel, format(current), Colors.white, box.maxWidth * 0.10,
                yFor(current)),
            tag(potentialLabel, format(potential), AppColors.lime,
                box.maxWidth * 0.56, yFor(potential)),
          ],
        );
      },
    );
  }
}

class _SilhouettePainter extends CustomPainter {
  final double current;
  final double potential;
  final double? dream;
  final double top;
  final double glow;

  _SilhouettePainter({
    required this.current,
    required this.potential,
    required this.dream,
    required this.top,
    required this.glow,
  });

  /// Room above the tallest figure for its label.
  static const _headroom = 46.0;

  /// Figures are scaled against a floor well below the shortest height, so a
  /// 7 cm difference reads as a difference and not as two equal people.
  static double _scaleFloor(double top) => top * 0.62;

  static double figureTop(double h, double cm, double top) {
    final floor = _scaleFloor(top);
    final usable = h - _headroom;
    final f = ((cm - floor) / (top - floor)).clamp(0.05, 1.0);
    return h - usable * f;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;

    // Ground line.
    canvas.drawLine(
      Offset(w * 0.04, h - 1),
      Offset(w * 0.96, h - 1),
      Paint()
        ..color = Colors.white.withValues(alpha: 0.10)
        ..strokeWidth = 1,
    );

    // Goal line for the dream height.
    final d = dream;
    if (d != null) {
      final y = figureTop(h, d, top);
      final paint = Paint()
        ..color = AppColors.warning.withValues(alpha: 0.55)
        ..strokeWidth = 1.2;
      for (var x = w * 0.04; x < w * 0.96; x += 9) {
        canvas.drawLine(Offset(x, y), Offset(x + 4.5, y), paint);
      }
    }

    final nowTop = figureTop(h, current, top);
    final potTop = figureTop(h, potential, top);

    _figure(
      canvas,
      centerX: w * 0.27,
      topY: nowTop,
      bottomY: h - 1,
      paint: Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withValues(alpha: 0.85),
            AppColors.primaryLight.withValues(alpha: 0.55),
          ],
        ).createShader(Rect.fromLTWH(0, nowTop, w, h - nowTop)),
    );

    // The potential self: glowing, a step ahead.
    final glowPaint = Paint()
      ..color = AppColors.lime.withValues(alpha: 0.22 * glow)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 14);
    _figure(canvas,
        centerX: w * 0.73, topY: potTop, bottomY: h - 1, paint: glowPaint);
    _figure(
      canvas,
      centerX: w * 0.73,
      topY: potTop,
      bottomY: h - 1,
      paint: Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.lime,
            AppColors.lime.withValues(alpha: 0.45),
          ],
        ).createShader(Rect.fromLTWH(0, potTop, w, h - potTop)),
    );

    // The difference, marked between them.
    if (potTop < nowTop - 4) {
      final x = w * 0.5;
      final p = Paint()
        ..color = AppColors.lime.withValues(alpha: 0.7)
        ..strokeWidth = 1.6
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(Offset(x, nowTop), Offset(x, potTop), p);
      canvas.drawLine(Offset(x - 5, potTop + 6), Offset(x, potTop), p);
      canvas.drawLine(Offset(x + 5, potTop + 6), Offset(x, potTop), p);
    }
  }

  /// A standing figure filling [topY]..[bottomY], proportioned at roughly
  /// 7.5 heads tall: head, tapered torso, arms held slightly away from the
  /// body, two legs.
  void _figure(
    Canvas canvas, {
    required double centerX,
    required double topY,
    required double bottomY,
    required Paint paint,
  }) {
    final u = (bottomY - topY) / 7.5; // one head
    // One path for the whole body: drawing the parts separately leaves a
    // visible antialiased seam wherever they overlap.
    var body = Path();
    void add(Path p) => body = Path.combine(PathOperation.union, body, p);
    final cx = centerX;
    final shoulderY = topY + u * 1.25;
    final waistY = topY + u * 2.85;
    final hipY = topY + u * 3.7;

    // Head and neck.
    add(Path()
      ..addOval(Rect.fromCenter(
        center: Offset(cx, topY + u * 0.5),
        width: u * 0.74,
        height: u * 0.96,
      )));
    add(Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, topY + u * 1.08),
          width: u * 0.3,
          height: u * 0.36,
        ),
        Radius.circular(u * 0.12),
      )));

    // Torso: rounded shoulders, a waist, then hips.
    final torso = Path()
      ..moveTo(cx - u * 0.42, shoulderY - u * 0.08)
      ..quadraticBezierTo(cx - u * 0.92, shoulderY - u * 0.06, cx - u * 0.92,
          shoulderY + u * 0.32)
      ..quadraticBezierTo(
          cx - u * 0.82, waistY - u * 0.4, cx - u * 0.58, waistY)
      ..quadraticBezierTo(cx - u * 0.66, hipY - u * 0.3, cx - u * 0.66, hipY)
      ..lineTo(cx + u * 0.66, hipY)
      ..quadraticBezierTo(cx + u * 0.66, hipY - u * 0.3, cx + u * 0.58, waistY)
      ..quadraticBezierTo(cx + u * 0.82, waistY - u * 0.4, cx + u * 0.92,
          shoulderY + u * 0.32)
      ..quadraticBezierTo(cx + u * 0.92, shoulderY - u * 0.06, cx + u * 0.42,
          shoulderY - u * 0.08)
      ..close();
    add(torso);

    // Arms, angled a little away from the body so the outline reads.
    for (final side in [-1.0, 1.0]) {
      final m = Matrix4.identity()
        ..translate(cx + side * u * 0.93, shoulderY + u * 0.18)
        ..rotateZ(-side * 0.11);
      add((Path()
            ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTWH(-u * 0.15, 0, u * 0.3, u * 2.85),
              Radius.circular(u * 0.15),
            )))
          .transform(m.storage));
    }

    // Legs.
    for (final side in [-1.0, 1.0]) {
      final leg = Path()
        ..moveTo(cx + side * u * 0.05, hipY - u * 0.1)
        ..lineTo(cx + side * u * 0.66, hipY - u * 0.1)
        ..quadraticBezierTo(cx + side * u * 0.6, hipY + u * 1.6,
            cx + side * u * 0.46, bottomY - u * 0.2)
        ..quadraticBezierTo(
            cx + side * u * 0.5, bottomY, cx + side * u * 0.28, bottomY)
        ..lineTo(cx + side * u * 0.14, bottomY)
        ..quadraticBezierTo(cx + side * u * 0.1, hipY + u * 1.4,
            cx + side * u * 0.05, hipY + u * 0.3)
        ..close();
      add(leg);
    }
    canvas.drawPath(body, paint);
  }

  @override
  bool shouldRepaint(covariant _SilhouettePainter old) =>
      old.current != current ||
      old.potential != potential ||
      old.dream != dream ||
      old.glow != glow ||
      old.top != top;
}
