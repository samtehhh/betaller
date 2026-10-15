import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/haptics.dart';

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

  const HeightSilhouette({
    super.key,
    required this.current,
    required this.potential,
    required this.format,
    this.dream,
    this.height = 220,
    this.animate = true,
    this.female,
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
        : '+${(pot - current).toStringAsFixed(1)} cm';

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
            potentialLabel: l.silPotential,
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
    final bodyWidth = (ground - nowHead) * 0.36;

    final gap = finalPotential - current;
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
          top: (potHead - 38).clamp(0.0, h - 40),
          child: _Tag(
            title: potentialLabel,
            value: format(potential),
            color: AppColors.lime,
          ),
        ),
        Positioned(
          left: labelX,
          right: 0,
          top: (nowHead - 38).clamp(potHead + 2, h - 40),
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

/// A standing figure, front view, drawn as one smooth outline through a set
/// of body landmarks (shoulders, arms held a little away, waist, hips, two
/// legs). Proportions differ for the female figure.
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

  /// Right half of the outline on a unit box: x from the centre line (0) to
  /// the edge (1 = half the body width), y from the top of the head (0) to
  /// the soles (1).
  List<Offset> get _half => female
      ? const [
          Offset(0.17, 0.140), // neck
          Offset(0.20, 0.168),
          Offset(0.62, 0.190), // shoulder
          Offset(0.80, 0.215),
          Offset(0.86, 0.300), // upper arm
          Offset(0.90, 0.400), // elbow
          Offset(0.96, 0.505), // wrist
          Offset(0.94, 0.545), // hand
          Offset(0.80, 0.540),
          Offset(0.76, 0.430),
          Offset(0.66, 0.300), // armpit
          Offset(0.52, 0.375), // waist
          Offset(0.70, 0.470), // hip
          Offset(0.66, 0.560),
          Offset(0.50, 0.720), // knee
          Offset(0.38, 0.930), // ankle
          Offset(0.46, 0.985), // foot
          Offset(0.30, 1.000),
          Offset(0.10, 0.990),
          Offset(0.10, 0.720),
          Offset(0.05, 0.520), // crotch
        ]
      : const [
          Offset(0.19, 0.135), // neck
          Offset(0.22, 0.165),
          Offset(0.72, 0.185), // shoulder
          Offset(0.92, 0.215),
          Offset(0.97, 0.300), // upper arm
          Offset(0.99, 0.400), // elbow
          Offset(1.00, 0.500), // wrist
          Offset(0.97, 0.540), // hand
          Offset(0.83, 0.535),
          Offset(0.82, 0.420),
          Offset(0.74, 0.300), // armpit
          Offset(0.64, 0.400), // waist
          Offset(0.66, 0.480), // hip
          Offset(0.62, 0.560),
          Offset(0.52, 0.720), // knee
          Offset(0.42, 0.930), // ankle
          Offset(0.50, 0.985), // foot
          Offset(0.32, 1.000),
          Offset(0.10, 0.990),
          Offset(0.10, 0.720),
          Offset(0.05, 0.510), // crotch
        ];

  Path _body(double head) {
    final hgt = ground - head;
    final half = width / 2;
    Offset at(Offset u, double side) =>
        Offset(cx + side * u.dx * half, head + u.dy * hgt);

    final right = [for (final u in _half) at(u, 1)];
    final left = [for (final u in _half.reversed) at(u, -1)];
    final pts = [...right, ...left];

    // A smooth closed curve through the landmarks: quadratic segments that
    // pass through the midpoints, using each landmark as the control point.
    final path = Path();
    Offset mid(Offset a, Offset b) => Offset((a.dx + b.dx) / 2, (a.dy + b.dy) / 2);
    final first = mid(pts.last, pts.first);
    path.moveTo(first.dx, first.dy);
    for (var i = 0; i < pts.length; i++) {
      final p = pts[i];
      final next = pts[(i + 1) % pts.length];
      final m = mid(p, next);
      path.quadraticBezierTo(p.dx, p.dy, m.dx, m.dy);
    }
    path.close();

    // Head (and hair for the female figure), merged into one outline so
    // the glowing contour has no seams inside it.
    final headH = hgt * 0.125;
    var shape = Path.combine(
      PathOperation.union,
      path,
      Path()
        ..addOval(Rect.fromCenter(
          center: Offset(cx, head + headH / 2),
          width: headH * (female ? 0.80 : 0.82),
          height: headH,
        )),
    );
    if (female) {
      shape = Path.combine(
        PathOperation.union,
        shape,
        Path()
          ..addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(cx - headH * 0.46, head + headH * 0.25,
                headH * 0.92, headH * 0.95),
            Radius.circular(headH * 0.35),
          )),
      );
    }
    return shape;
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
