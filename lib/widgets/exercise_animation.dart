import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../l10n/app_localizations.dart';

// ─────────────────────────────────────────────────────────────────
//  Animation types (fallback when no GIF exists)
// ─────────────────────────────────────────────────────────────────

enum _AnimType { hang, bounce, sway, pulse, spin, press, run, sleep }

class _Cfg {
  final _AnimType type;
  final String Function(AppLocalizations l) hint;
  _Cfg(this.type, this.hint);
}

final Map<String, _Cfg> _cfgMap = {
  'bar_hanging': _Cfg(_AnimType.hang, (l) => l.animHintSpinalDecomp),
  'inversion_hang': _Cfg(_AnimType.hang, (l) => l.animHintGravityReversal),
  'jumping': _Cfg(_AnimType.bounce, (l) => l.animHintImpactBones),
  'skipping_rope': _Cfg(_AnimType.bounce, (l) => l.animHintHighImpact),
  'hiit_workout': _Cfg(_AnimType.bounce, (l) => l.animHintMetabolicBurst),
  'morning_stretch': _Cfg(_AnimType.sway, (l) => l.animHintFullBodyStretch),
  'cobra_stretch': _Cfg(_AnimType.sway, (l) => l.animHintSpinalExtension),
  'neck_stretches': _Cfg(_AnimType.sway, (l) => l.animHintCervicalDecomp),
  'shoulder_rolls': _Cfg(_AnimType.sway, (l) => l.animHintShoulderMobility),
  'swimming_basketball': _Cfg(_AnimType.sway, (l) => l.animHintFullBodyMotion),
  'deadlift_stretch': _Cfg(_AnimType.sway, (l) => l.animHintPosteriorChain),
  'protein': _Cfg(_AnimType.pulse, (l) => l.animHintMuscleGrowth),
  'calcium_vitamin_d': _Cfg(_AnimType.pulse, (l) => l.animHintBoneDensity),
  'water': _Cfg(_AnimType.pulse, (l) => l.animHintSpinalDisc),
  'avoid_junk': _Cfg(_AnimType.pulse, (l) => l.animHintCleanNutrition),
  'zinc_intake': _Cfg(_AnimType.pulse, (l) => l.animHintIgf1),
  'arginine_foods': _Cfg(_AnimType.pulse, (l) => l.animHintHghAmino),
  'vitamin_d_sunlight': _Cfg(_AnimType.pulse, (l) => l.animHintCalciumAbsorption),
  'posture_check': _Cfg(_AnimType.pulse, (l) => l.animHintSpinalAlignment),
  'wall_stand': _Cfg(_AnimType.pulse, (l) => l.animHintPostureCorrection),
  'evening_yoga': _Cfg(_AnimType.spin, (l) => l.animHintMindBody),
  'pilates_core': _Cfg(_AnimType.spin, (l) => l.animHintCoreStability),
  'squats': _Cfg(_AnimType.press, (l) => l.animHintLegPower),
  'overhead_press': _Cfg(_AnimType.press, (l) => l.animHintVerticalPower),
  'sprint_intervals': _Cfg(_AnimType.run, (l) => l.animHintHghSurge),
  'quality_sleep': _Cfg(_AnimType.sleep, (l) => l.animHintPeakHgh),
  'no_screen': _Cfg(_AnimType.sleep, (l) => l.animHintMelatonin),
  'sleep_environment': _Cfg(_AnimType.sleep, (l) => l.animHintDeepSleep),
  'pre_sleep_routine': _Cfg(_AnimType.sleep, (l) => l.animHintSleepOpt),
};

// ─────────────────────────────────────────────────────────────────
//  GIF asset cache — avoids re-checking asset existence per frame
// ─────────────────────────────────────────────────────────────────

final Map<String, bool> _gifExistsCache = {};

Future<bool> _gifAssetExists(String routineId) async {
  if (_gifExistsCache.containsKey(routineId)) return _gifExistsCache[routineId]!;
  try {
    await rootBundle.load('assets/exercises/$routineId.gif');
    _gifExistsCache[routineId] = true;
    return true;
  } catch (_) {
    _gifExistsCache[routineId] = false;
    return false;
  }
}

// ─────────────────────────────────────────────────────────────────
//  Public widget
// ─────────────────────────────────────────────────────────────────

class ExerciseAnimationWidget extends StatefulWidget {
  final String routineId;
  final Color color;

  const ExerciseAnimationWidget({
    super.key,
    required this.routineId,
    required this.color,
  });

  @override
  State<ExerciseAnimationWidget> createState() =>
      _ExerciseAnimationWidgetState();
}

class _ExerciseAnimationWidgetState extends State<ExerciseAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late _Cfg _cfg;
  bool _hasGif = false;

  @override
  void initState() {
    super.initState();
    _cfg = _cfgMap[widget.routineId] ??
        _Cfg(_AnimType.pulse, (l) => l.animHintExercise);

    _checkGif();

    Duration dur;
    bool reverse = true;

    switch (_cfg.type) {
      case _AnimType.hang:
        dur = const Duration(milliseconds: 3000);
        break;
      case _AnimType.bounce:
        dur = const Duration(milliseconds: 900);
        reverse = false;
        break;
      case _AnimType.sway:
        dur = const Duration(milliseconds: 2200);
        break;
      case _AnimType.pulse:
        dur = const Duration(milliseconds: 1400);
        break;
      case _AnimType.spin:
        dur = const Duration(milliseconds: 3500);
        reverse = false;
        break;
      case _AnimType.press:
        dur = const Duration(milliseconds: 1600);
        break;
      case _AnimType.run:
        dur = const Duration(milliseconds: 650);
        break;
      case _AnimType.sleep:
        dur = const Duration(milliseconds: 2600);
        reverse = false;
        break;
    }

    _ctrl = AnimationController(vsync: this, duration: dur)
      ..repeat(reverse: reverse);
  }

  Future<void> _checkGif() async {
    final exists = await _gifAssetExists(widget.routineId);
    if (mounted) {
      setState(() {
        _hasGif = exists;
      });
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color;

    return Container(
      height: _hasGif ? 200 : 148,
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withValues(alpha: 0.10),
            color.withValues(alpha: 0.02),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withValues(alpha: 0.20),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ── Main content: GIF or fallback ──
            if (_hasGif)
              Positioned.fill(
                child: Image.asset(
                  'assets/exercises/${widget.routineId}.gif',
                  fit: BoxFit.contain,
                  errorBuilder: (_, e, s) => _buildFallback(),
                ),
              )
            else
              _buildFallback(),

            // ── Hint label ──
            Positioned(
              bottom: 7,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.60),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: color.withValues(alpha: 0.22),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  _cfg.hint(AppLocalizations.of(context)!),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: color.withValues(alpha: 0.92),
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFallback() {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, child) => CustomPaint(
        size: const Size(160, 120),
        painter: _StickFigurePainter(
          t: _ctrl.value,
          type: _cfg.type,
          color: widget.color,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────
//  Stick-figure CustomPainter (fallback when GIF not available)
// ─────────────────────────────────────────────────────────────────

class _StickFigurePainter extends CustomPainter {
  final double t;
  final _AnimType type;
  final Color color;

  _StickFigurePainter({
    required this.t,
    required this.type,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    switch (type) {
      case _AnimType.hang:
        _paintHang(canvas, size);
      case _AnimType.bounce:
        _paintBounce(canvas, size);
      case _AnimType.sway:
        _paintSway(canvas, size);
      case _AnimType.pulse:
        _paintPulse(canvas, size);
      case _AnimType.spin:
        _paintSpin(canvas, size);
      case _AnimType.press:
        _paintPress(canvas, size);
      case _AnimType.run:
        _paintRun(canvas, size);
      case _AnimType.sleep:
        _paintSleep(canvas, size);
    }
  }

  @override
  bool shouldRepaint(_StickFigurePainter old) =>
      old.t != t || old.type != type;

  Paint _bodyPaint([double alpha = 1.0]) => Paint()
    ..color = color.withValues(alpha: alpha)
    ..strokeWidth = 3.0
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke;

  Paint _glowPaint([double alpha = 0.3]) => Paint()
    ..color = color.withValues(alpha: alpha)
    ..strokeWidth = 8.0
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

  void _drawHead(Canvas c, Offset pos, double radius, [double alpha = 1.0]) {
    c.drawCircle(pos, radius, _bodyPaint(alpha));
    c.drawCircle(pos, radius, _glowPaint(alpha * 0.25));
  }

  void _drawLimb(Canvas c, Offset a, Offset b, [double alpha = 1.0]) {
    c.drawLine(a, b, _bodyPaint(alpha));
    c.drawLine(a, b, _glowPaint(alpha * 0.2));
  }

  void _paintHang(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final stretch = t * 14.0;
    final barY = 8.0;
    canvas.drawLine(Offset(cx - 40, barY), Offset(cx + 40, barY), _bodyPaint()..strokeWidth = 5);
    final shoulderY = barY + 22 + stretch;
    _drawLimb(canvas, Offset(cx - 12, shoulderY), Offset(cx - 18, barY + 3));
    _drawLimb(canvas, Offset(cx + 12, shoulderY), Offset(cx + 18, barY + 3));
    _drawHead(canvas, Offset(cx, shoulderY - 8), 7);
    final hipY = shoulderY + 30 + stretch * 0.5;
    _drawLimb(canvas, Offset(cx, shoulderY), Offset(cx, hipY));
    final footY = hipY + 24;
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx - 8, footY));
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx + 8, footY));
    final arrowAlpha = (t * 1.5).clamp(0.0, 0.7);
    final ap = Paint()..color = color.withValues(alpha: arrowAlpha)..strokeWidth = 2.0..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(cx, footY + 6), Offset(cx, footY + 16), ap);
    canvas.drawLine(Offset(cx - 4, footY + 12), Offset(cx, footY + 16), ap);
    canvas.drawLine(Offset(cx + 4, footY + 12), Offset(cx, footY + 16), ap);
  }

  void _paintBounce(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final sinT = math.sin(t * math.pi);
    final jumpY = -sinT * 36.0;
    final baseY = size.height * 0.55;
    final headY = baseY + jumpY;
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx, baseY + 44), width: 20.0 + (1 - sinT) * 16, height: 4),
      Paint()..color = color.withValues(alpha: 0.15 + (1 - sinT) * 0.25),
    );
    _drawHead(canvas, Offset(cx, headY - 6), 7);
    final shoulderY = headY + 4;
    final hipY = shoulderY + 28;
    _drawLimb(canvas, Offset(cx, shoulderY), Offset(cx, hipY));
    final armAngle = sinT * 0.6;
    _drawLimb(canvas, Offset(cx, shoulderY + 4), Offset(cx - 20 * math.cos(armAngle), shoulderY + 4 - 20 * math.sin(armAngle)));
    _drawLimb(canvas, Offset(cx, shoulderY + 4), Offset(cx + 20 * math.cos(armAngle), shoulderY + 4 - 20 * math.sin(armAngle)));
    final legBend = sinT * 8;
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx - 10, hipY + 20 - legBend));
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx + 10, hipY + 20 - legBend));
  }

  void _paintSway(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final lean = (t * 2 - 1) * 16.0;
    final headY = 18.0;
    _drawHead(canvas, Offset(cx + lean * 0.8, headY), 7);
    final shoulderY = headY + 8;
    final hipY = shoulderY + 34;
    _drawLimb(canvas, Offset(cx + lean * 0.6, shoulderY), Offset(cx, hipY));
    _drawLimb(canvas, Offset(cx + lean * 0.6, shoulderY + 4), Offset(cx + lean * 0.6 + 22, shoulderY - 14));
    _drawLimb(canvas, Offset(cx + lean * 0.6, shoulderY + 4), Offset(cx + lean * 0.6 - 16, shoulderY + 18));
    final footY = hipY + 28;
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx - 10, footY));
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx + 10, footY));
    canvas.drawLine(Offset(cx - 24, footY + 2), Offset(cx + 24, footY + 2), _bodyPaint(0.2)..strokeWidth = 1.5);
  }

  void _paintPulse(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final ringAlpha = (1 - t) * 0.35;
    canvas.drawCircle(Offset(cx, size.height * 0.42), 28 + t * 24, Paint()..color = color.withValues(alpha: ringAlpha)..style = PaintingStyle.stroke..strokeWidth = 1.5);
    canvas.drawCircle(Offset(cx, size.height * 0.42), 16 + t * 12, Paint()..color = color.withValues(alpha: ringAlpha * 0.6)..style = PaintingStyle.stroke..strokeWidth = 1);
    final scale = 0.9 + t * 0.12;
    canvas.save();
    canvas.translate(cx, size.height * 0.42);
    canvas.scale(scale);
    canvas.translate(-cx, -size.height * 0.42);
    final headY = size.height * 0.22;
    _drawHead(canvas, Offset(cx, headY), 7);
    final shoulderY = headY + 8;
    final hipY = shoulderY + 28;
    _drawLimb(canvas, Offset(cx, shoulderY), Offset(cx, hipY));
    _drawLimb(canvas, Offset(cx, shoulderY + 3), Offset(cx - 14, shoulderY + 22));
    _drawLimb(canvas, Offset(cx, shoulderY + 3), Offset(cx + 14, shoulderY + 22));
    final footY = hipY + 24;
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx - 8, footY));
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx + 8, footY));
    canvas.restore();
  }

  void _paintSpin(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final angle = t * 2 * math.pi;
    for (int i = 0; i < 3; i++) {
      final a = angle + i * (2 * math.pi / 3);
      canvas.drawCircle(
        Offset(cx + math.cos(a) * 36, size.height * 0.40 + math.sin(a) * 14),
        4.0 - i * 0.8,
        Paint()..color = color.withValues(alpha: 0.7 - i * 0.15)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
      );
    }
    final headY = size.height * 0.25;
    _drawHead(canvas, Offset(cx, headY), 7);
    final shoulderY = headY + 8;
    final hipY = shoulderY + 22;
    _drawLimb(canvas, Offset(cx, shoulderY), Offset(cx, hipY));
    _drawLimb(canvas, Offset(cx, shoulderY + 3), Offset(cx - 18, hipY + 4));
    _drawLimb(canvas, Offset(cx, shoulderY + 3), Offset(cx + 18, hipY + 4));
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx - 16, hipY + 12));
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx + 16, hipY + 12));
    _drawLimb(canvas, Offset(cx - 16, hipY + 12), Offset(cx + 4, hipY + 16));
    _drawLimb(canvas, Offset(cx + 16, hipY + 12), Offset(cx - 4, hipY + 16));
  }

  void _paintPress(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final squat = t * 18.0;
    final headY = 16.0 + squat;
    _drawHead(canvas, Offset(cx, headY), 7);
    final shoulderY = headY + 8;
    final hipY = shoulderY + 24 - squat * 0.3;
    _drawLimb(canvas, Offset(cx, shoulderY), Offset(cx, hipY));
    final armRaise = t * 0.7;
    _drawLimb(canvas, Offset(cx, shoulderY + 2), Offset(cx - 16, shoulderY - 16 - armRaise * 10));
    _drawLimb(canvas, Offset(cx, shoulderY + 2), Offset(cx + 16, shoulderY - 16 - armRaise * 10));
    final kneeY = hipY + 14;
    final footY = kneeY + 14 + squat * 0.4;
    final ks = 12.0 + squat * 0.5;
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx - ks, kneeY + squat * 0.5));
    _drawLimb(canvas, Offset(cx - ks, kneeY + squat * 0.5), Offset(cx - 10, footY));
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx + ks, kneeY + squat * 0.5));
    _drawLimb(canvas, Offset(cx + ks, kneeY + squat * 0.5), Offset(cx + 10, footY));
    canvas.drawLine(Offset(cx - 28, footY + 2), Offset(cx + 28, footY + 2), _bodyPaint(0.2)..strokeWidth = 1.5);
  }

  void _paintRun(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final phase = t * 2 - 1;
    final headY = 20.0;
    final lean = phase * 6.0;
    _drawHead(canvas, Offset(cx + lean, headY), 7);
    final shoulderY = headY + 8;
    final hipY = shoulderY + 26;
    _drawLimb(canvas, Offset(cx + lean * 0.7, shoulderY), Offset(cx, hipY));
    _drawLimb(canvas, Offset(cx + lean * 0.7, shoulderY + 3), Offset(cx + lean * 0.7 + phase * 18, shoulderY + 16));
    _drawLimb(canvas, Offset(cx + lean * 0.7, shoulderY + 3), Offset(cx + lean * 0.7 - phase * 14, shoulderY + 10));
    final footY = hipY + 26;
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx + phase * 16, footY));
    _drawLimb(canvas, Offset(cx, hipY), Offset(cx - phase * 12, footY - 4));
    canvas.drawLine(Offset(cx - 36, footY + 2), Offset(cx + 36, footY + 2), _bodyPaint(0.15)..strokeWidth = 1);
    for (int i = 0; i < 3; i++) {
      canvas.drawLine(Offset(cx - 30.0 - i * 8, shoulderY + 6.0 + i * 8), Offset(cx - 40.0 - i * 8, shoulderY + 6.0 + i * 8), _bodyPaint(0.2 - i * 0.05)..strokeWidth = 1);
    }
  }

  void _paintSleep(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final bedY = size.height * 0.58;
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(cx, bedY + 2), width: 90, height: 6), const Radius.circular(3)), _bodyPaint(0.30)..style = PaintingStyle.fill);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(cx - 30, bedY - 4), width: 20, height: 10), const Radius.circular(5)), _bodyPaint(0.25)..style = PaintingStyle.fill);
    _drawHead(canvas, Offset(cx - 28, bedY - 8), 6);
    _drawLimb(canvas, Offset(cx - 20, bedY - 6), Offset(cx + 10, bedY - 4));
    _drawLimb(canvas, Offset(cx + 10, bedY - 4), Offset(cx + 30, bedY - 2));
    _drawLimb(canvas, Offset(cx + 30, bedY - 2), Offset(cx + 38, bedY + 1));
    _drawLimb(canvas, Offset(cx - 16, bedY - 5), Offset(cx - 8, bedY - 14));
    final zAlpha = (1 - t).clamp(0.0, 1.0);
    final t2 = (t + 0.45) % 1.0;
    final z2Alpha = (1 - t2).clamp(0.0, 1.0);
    final zPaint = TextPainter(textDirection: TextDirection.ltr);
    zPaint.text = TextSpan(text: 'Z', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: color.withValues(alpha: zAlpha * 0.85)));
    zPaint.layout();
    zPaint.paint(canvas, Offset(cx - 8 + t * 10, bedY - 24 - t * 38));
    zPaint.text = TextSpan(text: 'z', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: color.withValues(alpha: z2Alpha * 0.65)));
    zPaint.layout();
    zPaint.paint(canvas, Offset(cx + 2 + t2 * 14, bedY - 18 - t2 * 38));
  }
}
