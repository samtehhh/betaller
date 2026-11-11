import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

/// A badge drawn as a medal: a ringed disc on a two-tailed ribbon, with the
/// number it stands for (a 7-day streak, 3 measurements, 5 cm) set large in
/// the middle under the mark of its family. Earned, it is in its family's
/// colour; not yet earned, it is the same medal in grey with a small gold
/// lock, so the cabinet shows what there is to win rather than a row of
/// identical padlocks.
///
/// Colours follow the app's roles: gold for streaks, purple for measured
/// data, green for growth.
class AchievementMedal extends StatelessWidget {
  /// The achievement's `type`: 'streak', 'measures', 'growth' or 'tour'.
  final String type;

  /// The achievement's `value` (days, measurements, centimetres).
  final int value;
  final bool earned;
  final double size;

  const AchievementMedal({
    super.key,
    required this.type,
    required this.value,
    required this.earned,
    this.size = 60,
  });

  static Color colorFor(String type) => switch (type) {
    'streak' => AppColors.warning,
    'measures' => AppColors.primaryBright,
    'growth' => AppColors.lime,
    _ => AppColors.primaryLight,
  };

  static IconData iconFor(String type) => switch (type) {
    'streak' => CupertinoIcons.flame_fill,
    'measures' => CupertinoIcons.arrow_up_arrow_down,
    'growth' => CupertinoIcons.arrow_up,
    _ => CupertinoIcons.flag_fill,
  };

  @override
  Widget build(BuildContext context) {
    final color = earned ? colorFor(type) : const Color(0xFF6E6A82);
    // A lone "1" says little; the first of each family shows its mark alone.
    final showNumber = value > 1 && type != 'tour';
    final disc = size * 0.82;
    return SizedBox(
      width: size,
      height: size * 1.12,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _MedalPainter(color: color, earned: earned, disc: disc),
            ),
          ),
          SizedBox(
            width: disc,
            height: disc,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconFor(type),
                  size: showNumber ? disc * 0.24 : disc * 0.40,
                  color: earned ? color : Colors.white.withValues(alpha: 0.35),
                ),
                if (showNumber)
                  Text(
                    '$value',
                    style: TextStyle(
                      fontSize: disc * (value >= 100 ? 0.30 : 0.36),
                      height: 1.05,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                      color: earned
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.38),
                    ),
                  ),
              ],
            ),
          ),
          if (!earned)
            Positioned(
              right: size * 0.04,
              top: disc * 0.62,
              child: Container(
                width: size * 0.32,
                height: size * 0.32,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B1830),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.scaffold, width: 1.5),
                ),
                child: Icon(
                  CupertinoIcons.lock_fill,
                  size: size * 0.16,
                  color: AppColors.warning,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _MedalPainter extends CustomPainter {
  final Color color;
  final bool earned;
  final double disc;
  _MedalPainter({
    required this.color,
    required this.earned,
    required this.disc,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final r = disc / 2;
    final centre = Offset(cx, r);

    // The ribbon's two tails, behind the disc.
    final tail = Paint()..color = color.withValues(alpha: earned ? 0.85 : 0.40);
    for (final side in const [-1.0, 1.0]) {
      final x0 = cx + side * r * 0.10;
      final x1 = cx + side * r * 0.62;
      final top = r * 1.45;
      final bottom = size.height;
      canvas.drawPath(
        Path()
          ..moveTo(x0, top)
          ..lineTo(x1, top)
          ..lineTo(x1 + side * r * 0.10, bottom)
          ..lineTo((x0 + x1) / 2 + side * r * 0.05, bottom - r * 0.22)
          ..lineTo(x0 + side * r * 0.02, bottom)
          ..close(),
        tail,
      );
    }

    // The disc: a dark face inside a ring of the family colour, with a
    // thin inner line and small notches round the edge like a struck coin.
    canvas.drawCircle(centre, r, Paint()..color = const Color(0xFF14112A));
    canvas.drawCircle(
      centre,
      r * 0.86,
      Paint()..color = color.withValues(alpha: earned ? 0.20 : 0.08),
    );
    canvas.drawCircle(
      centre,
      r - r * 0.06,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = r * 0.12
        ..color = color.withValues(alpha: earned ? 1 : 0.55),
    );
    canvas.drawCircle(
      centre,
      r * 0.76,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = color.withValues(alpha: earned ? 0.55 : 0.25),
    );
    final notch = Paint()
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xFF14112A).withValues(alpha: 0.55);
    for (var i = 0; i < 24; i++) {
      final a = i * math.pi / 12;
      canvas.drawLine(
        centre + Offset(math.cos(a), math.sin(a)) * (r * 0.89),
        centre + Offset(math.cos(a), math.sin(a)) * (r * 0.99),
        notch,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _MedalPainter old) =>
      old.color != color || old.earned != earned || old.disc != disc;
}
