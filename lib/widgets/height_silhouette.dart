import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/haptics.dart';
import '../utils/num_format.dart';

/// One person, growing: today's figure in front and, right behind it, the
/// same figure at the potential height, glowing. The extra centimetres sit
/// above the head as a band next to a ruler. It reads as "this is me,
/// taller", not as two different people.
class HeightSilhouette extends StatelessWidget {
  final double current;
  final double potential;

  /// Drawn as a thin goal line when set.
  final double? dream;

  final String Function(double cm) format;
  final double height;
  final bool animate;

  /// Which figure to draw; read from the profile when not given.
  final bool? female;

  /// The tag over the taller figure. "Potential" unless the taller figure is
  /// something else, such as the goal the user picked in the onboarding.
  final String? potentialLabel;

  const HeightSilhouette({
    super.key,
    required this.current,
    required this.potential,
    required this.format,
    this.dream,
    this.height = 220,
    this.animate = true,
    this.female,
    this.potentialLabel,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final still = MediaQuery.of(context).disableAnimations || !animate;
    AppProvider? provider;
    try {
      provider = Provider.of<AppProvider>(context, listen: false);
    } catch (_) {}
    final isFemale = female ?? provider?.profile?.gender == 'female';
    final pot = potential < current ? current : potential;
    final gapText = provider != null
        ? provider.formatHeightDelta(pot - current)
        : '+${(pot - current).fixedL(1)} cm';

    return SizedBox(
      height: height,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: still ? 1 : 0, end: 1),
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeOutCubic,
        onEnd: still ? null : Haptics.select,
        builder: (context, t, _) => LayoutBuilder(
          builder: (context, box) => _Scene(
            size: Size(box.maxWidth, box.maxHeight),
            current: current,
            potential: current + (pot - current) * t,
            finalPotential: pot,
            dream: dream,
            female: isFemale,
            glow: t,
            format: format,
            gapText: gapText,
            nowLabel: l.silNow,
            potentialLabel: potentialLabel ?? l.silPotential,
          ),
        ),
      ),
    );
  }
}

class _Scene extends StatelessWidget {
  final Size size;
  final double current;
  final double potential;
  final double finalPotential;
  final double? dream;
  final bool female;
  final double glow;
  final String Function(double) format;
  final String gapText;
  final String nowLabel;
  final String potentialLabel;

  const _Scene({
    required this.size,
    required this.current,
    required this.potential,
    required this.finalPotential,
    required this.dream,
    required this.female,
    required this.glow,
    required this.format,
    required this.gapText,
    required this.nowLabel,
    required this.potentialLabel,
  });

  @override
  Widget build(BuildContext context) {
    final w = size.width;
    final h = size.height;
    final ground = h - 2;
    final top = [finalPotential, dream ?? 0, current]
        .reduce((a, b) => a > b ? a : b);
    // Heights are drawn against a floor below the user's height, so a few
    // centimetres read as a visible difference.
    final floor = current - ((top - current).clamp(8.0, 40.0)) * 2.4;
    final usable = h - 26; // room above the tallest head
    double yFor(double cm) =>
        ground - usable * ((cm - floor) / (top - floor)).clamp(0.02, 1.0);
    final nowHead = yFor(current);
    final potHead = yFor(potential);
    final cx = w * 0.40;
    // Both figures share today's width: the potential self is the same
    // person, only taller.
    final bodyWidth = (ground - nowHead) * 0.29;

    final gap = finalPotential - current;
    final potTagTop = (potHead - 38).clamp(0.0, h - 40);
    final labelX = cx + bodyWidth * 0.62 + 10;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _RulerPainter(
              ground: ground,
              yFor: yFor,
              floor: floor,
              top: top,
              nowHead: nowHead,
              potHead: potHead,
              dream: dream,
              glow: glow,
            ),
          ),
        ),
        // The potential self behind, today in front.
        Positioned.fill(
          child: CustomPaint(
            painter: _BodyPainter(
              cx: cx,
              ground: ground,
              width: bodyWidth,
              nowHead: nowHead,
              potHead: potHead,
              female: female,
              glow: glow,
            ),
          ),
        ),
        Positioned(
          left: labelX,
          right: 0,
          top: potTagTop,
          child: _Tag(
            title: potentialLabel,
            value: format(potential),
            color: AppColors.lime,
          ),
        ),
        Positioned(
          left: labelX,
          right: 0,
          // Below the potential tag wherever that one landed: pinned to the
          // top edge, it used to sit on today's value.
          top: (nowHead - 38).clamp(
            math.min(math.max(potHead + 2, potTagTop + 36), h - 40),
            h - 40,
          ),
          child: _Tag(
            title: nowLabel,
            value: format(current),
            color: Colors.white,
          ),
        ),
        if (gap >= 0.5)
          Positioned(
            left: w * 0.06 + 16,
            top: ((potHead + nowHead) / 2 - 11).clamp(0.0, h - 22),
            child: Opacity(
              opacity: glow,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.scaffold.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: AppColors.lime.withValues(alpha: 0.6),
                  ),
                ),
                child: Text(
                  gapText.startsWith('+') ? gapText : '+$gapText',
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w900,
                    color: AppColors.lime,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  const _Tag({required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.6,
            color: color.withValues(alpha: 0.8),
          ),
        ),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: color,
          ),
        ),
      ],
    );
  }
}

/// Ground, a centimetre ruler on the left, the two head lines with the band
/// between them, and the goal line.
class _RulerPainter extends CustomPainter {
  final double ground;
  final double Function(double cm) yFor;
  final double floor;
  final double top;
  final double nowHead;
  final double potHead;
  final double? dream;
  final double glow;

  _RulerPainter({
    required this.ground,
    required this.yFor,
    required this.floor,
    required this.top,
    required this.nowHead,
    required this.potHead,
    required this.dream,
    required this.glow,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    canvas.drawLine(
      Offset(0, ground),
      Offset(w, ground),
      Paint()
        ..color = Colors.white.withValues(alpha: 0.12)
        ..strokeWidth = 1,
    );

    // Ruler: a tick per centimetre, longer every five.
    final rulerX = w * 0.06;
    final tick = Paint()
      ..color = Colors.white.withValues(alpha: 0.26)
      ..strokeWidth = 1;
    final to = top.floor() + 2;
    canvas.drawLine(
      Offset(rulerX, yFor(to.toDouble())),
      Offset(rulerX, ground),
      tick,
    );
    for (var cm = floor.ceil(); cm <= to; cm++) {
      final y = yFor(cm.toDouble());
      final long = cm % 5 == 0;
      canvas.drawLine(Offset(rulerX, y), Offset(rulerX + (long ? 9 : 4), y), tick);
    }

    if (potHead < nowHead - 2) {
      final band = Rect.fromLTRB(rulerX, potHead, w * 0.98, nowHead);
      canvas.drawRect(
        band,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.lime.withValues(alpha: 0.16 * glow),
              AppColors.lime.withValues(alpha: 0.0),
            ],
          ).createShader(band),
      );
      _dashed(
        canvas,
        Offset(rulerX, potHead),
        w * 0.98,
        Paint()
          ..color = AppColors.lime.withValues(alpha: 0.7)
          ..strokeWidth = 1.2,
      );
      _dashed(
        canvas,
        Offset(rulerX, nowHead),
        w * 0.98,
        Paint()
          ..color = Colors.white.withValues(alpha: 0.3)
          ..strokeWidth = 1,
      );
    }

    final d = dream;
    if (d != null) {
      _dashed(
        canvas,
        Offset(rulerX, yFor(d)),
        w * 0.98,
        Paint()
          ..color = AppColors.warning.withValues(alpha: 0.5)
          ..strokeWidth = 1,
        dash: 3,
        gap: 5,
      );
    }
  }

  void _dashed(
    Canvas c,
    Offset from,
    double toX,
    Paint p, {
    double dash = 6,
    double gap = 4,
  }) {
    for (var x = from.dx; x < toX; x += dash + gap) {
      final end = x + dash > toX ? toX : x + dash;
      c.drawLine(Offset(x, from.dy), Offset(end, from.dy), p);
    }
  }

  @override
  bool shouldRepaint(covariant _RulerPainter old) =>
      old.potHead != potHead ||
      old.nowHead != nowHead ||
      old.glow != glow ||
      old.dream != dream;
}

/// A standing figure, front view, filled like a photo silhouette: short
/// hair, broad shoulders and a V-shaped torso for the male figure; long hair,
/// narrower shoulders, waist and hips for the female one. Arms hang a little
/// away from the body, legs slightly apart. Each outline is a closed
/// Catmull-Rom curve through body landmarks, mirrored left to right.
class _BodyPainter extends CustomPainter {
  final double cx;
  final double ground;
  final double width;
  final double nowHead;
  final double potHead;
  final bool female;
  final double glow;

  _BodyPainter({
    required this.cx,
    required this.ground,
    required this.width,
    required this.nowHead,
    required this.potHead,
    required this.female,
    required this.glow,
  });

  // Right half of each outline on a unit box: x from the centre line (0)
  // outwards, y from the top of the head (0) to the soles (1).
  static const _maleBody = [
    // neck, trapezius, shoulder
    Offset(0.11, 0.118), Offset(0.15, 0.142), Offset(0.34, 0.160),
    Offset(0.60, 0.172), Offset(0.82, 0.188),
    // deltoid, upper arm, above the elbow
    Offset(0.98, 0.212), Offset(1.07, 0.250), Offset(1.08, 0.298),
    Offset(1.06, 0.345),
    // elbow, forearm bulge, wrist
    Offset(1.07, 0.392), Offset(1.075, 0.425), Offset(1.05, 0.465),
    Offset(1.00, 0.505), Offset(0.99, 0.520),
    // hand: little-finger side, fingertips, thumb
    Offset(1.02, 0.542), Offset(1.04, 0.575), Offset(1.02, 0.608),
    Offset(0.97, 0.620), Offset(0.92, 0.610), Offset(0.89, 0.588),
    Offset(0.85, 0.574), Offset(0.84, 0.556), Offset(0.88, 0.532),
    // inner wrist, forearm, inner elbow, biceps, armpit
    Offset(0.88, 0.505), Offset(0.86, 0.462), Offset(0.84, 0.430),
    Offset(0.85, 0.395), Offset(0.83, 0.345), Offset(0.80, 0.298),
    Offset(0.74, 0.262),
    // lat, waist, hip
    Offset(0.66, 0.290), Offset(0.60, 0.350), Offset(0.55, 0.420),
    Offset(0.61, 0.470), Offset(0.60, 0.540),
    // outer leg, knee, calf, ankle, foot
    Offset(0.56, 0.622), Offset(0.51, 0.702), Offset(0.50, 0.762),
    Offset(0.47, 0.862), Offset(0.40, 0.945), Offset(0.44, 0.985),
    Offset(0.35, 1.000), Offset(0.21, 0.998),
    // inner leg up to the crotch
    Offset(0.20, 0.960), Offset(0.18, 0.880), Offset(0.17, 0.780),
    Offset(0.15, 0.700), Offset(0.12, 0.600), Offset(0.04, 0.522),
  ];
  static const _maleHead = [
    Offset(0.00, 0.000), Offset(0.09, 0.003), Offset(0.155, 0.022),
    Offset(0.17, 0.052), Offset(0.165, 0.080), Offset(0.13, 0.104),
    Offset(0.07, 0.117), Offset(0.00, 0.121),
  ];
  static const _femaleBody = [
    Offset(0.11, 0.122), Offset(0.32, 0.166), Offset(0.57, 0.180),
    Offset(0.74, 0.198),
    // shoulder cap, upper arm, above the elbow
    Offset(0.84, 0.226), Offset(0.88, 0.268), Offset(0.89, 0.312),
    Offset(0.88, 0.355),
    // elbow, forearm, wrist
    Offset(0.89, 0.398), Offset(0.90, 0.432), Offset(0.90, 0.470),
    Offset(0.89, 0.508), Offset(0.88, 0.522),
    // hand
    Offset(0.91, 0.544), Offset(0.925, 0.574), Offset(0.905, 0.605),
    Offset(0.86, 0.615), Offset(0.815, 0.604), Offset(0.79, 0.584),
    Offset(0.755, 0.572), Offset(0.745, 0.554), Offset(0.78, 0.532),
    // inner wrist, forearm, inner elbow, upper arm, armpit
    Offset(0.78, 0.508), Offset(0.76, 0.468), Offset(0.74, 0.435),
    Offset(0.74, 0.400), Offset(0.72, 0.350), Offset(0.69, 0.300),
    Offset(0.64, 0.262),
    // waist, hip
    Offset(0.57, 0.298), Offset(0.49, 0.382), Offset(0.59, 0.452),
    Offset(0.64, 0.502), Offset(0.62, 0.582),
    // legs
    Offset(0.55, 0.682), Offset(0.51, 0.782), Offset(0.44, 0.902),
    Offset(0.38, 0.955), Offset(0.42, 0.990), Offset(0.30, 1.000),
    Offset(0.20, 0.990), Offset(0.20, 0.940), Offset(0.18, 0.850),
    Offset(0.17, 0.760), Offset(0.15, 0.682), Offset(0.10, 0.582),
    Offset(0.03, 0.517),
  ];
  static const _femaleHead = [
    Offset(0.00, 0.000), Offset(0.11, 0.005), Offset(0.18, 0.032),
    Offset(0.20, 0.078), Offset(0.22, 0.138), Offset(0.25, 0.196),
    Offset(0.22, 0.228), Offset(0.10, 0.222), Offset(0.00, 0.215),
  ];

  /// A closed Catmull-Rom spline through [pts], as cubic Béziers.
  static Path _spline(List<Offset> pts) {
    final path = Path()..moveTo(pts[0].dx, pts[0].dy);
    final n = pts.length;
    for (var i = 0; i < n; i++) {
      final p0 = pts[(i - 1 + n) % n];
      final p1 = pts[i];
      final p2 = pts[(i + 1) % n];
      final p3 = pts[(i + 2) % n];
      final c1 = p1 + (p2 - p0) / 6;
      final c2 = p2 - (p3 - p1) / 6;
      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, p2.dx, p2.dy);
    }
    return path..close();
  }

  Path _body(double head) {
    final hgt = ground - head;
    // Shoulder half-width about an eighth of the height.
    final half = width / 2 * (female ? 1.12 : 1.0);
    List<Offset> mirror(List<Offset> right, [double sx = 1]) => [
          for (final u in right)
            Offset(cx + u.dx * half * sx, head + u.dy * hgt),
          for (final u in right.reversed)
            if (u.dx > 0) Offset(cx - u.dx * half * sx, head + u.dy * hgt),
        ];
    final body = _spline(mirror(female ? _femaleBody : _maleBody));
    // Head points are drawn on the same box but a head is about three
    // eighths of the shoulder width, so they are widened here.
    final headPath = _spline(mirror(female ? _femaleHead : _maleHead, 2.15));
    return Path.combine(PathOperation.union, body, headPath);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final pot = _body(potHead);
    if (potHead < nowHead - 1) {
      canvas.drawPath(
        pot,
        Paint()
          ..color = AppColors.lime.withValues(alpha: 0.28 * glow)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
      );
      canvas.drawPath(
        pot,
        Paint()
          ..color = AppColors.lime.withValues(alpha: 0.10 + 0.14 * glow),
      );
      canvas.drawPath(
        pot,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.6
          ..color = AppColors.lime.withValues(alpha: 0.35 + 0.5 * glow),
      );
    }
    final now = _body(nowHead);
    final bounds = now.getBounds();
    canvas.drawPath(
      now,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, AppColors.primaryLight],
        ).createShader(bounds),
    );
  }

  @override
  bool shouldRepaint(covariant _BodyPainter old) =>
      old.potHead != potHead ||
      old.nowHead != nowHead ||
      old.glow != glow ||
      old.female != female ||
      old.width != width;
}
