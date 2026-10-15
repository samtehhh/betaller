import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants.dart';

/// The moment a badge is earned: a trophy that lands with a burst of
/// confetti, the badge's name, and one tap to carry on. Shown in the app,
/// not only as a system notification nobody sees while the app is open.
Future<void> showTrophyCelebration(
  BuildContext context, {
  required String icon,
  required String title,
  required String subtitle,
  required String buttonLabel,
}) {
  HapticFeedback.heavyImpact();
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: title,
    barrierColor: Colors.black.withValues(alpha: 0.72),
    transitionDuration: const Duration(milliseconds: 380),
    pageBuilder: (_, _, _) => _TrophyDialog(
      icon: icon,
      title: title,
      subtitle: subtitle,
      buttonLabel: buttonLabel,
    ),
    transitionBuilder: (_, anim, _, child) => FadeTransition(
      opacity: anim,
      child: ScaleTransition(
        scale: Tween(begin: 0.86, end: 1.0)
            .animate(CurvedAnimation(parent: anim, curve: Curves.easeOutBack)),
        child: child,
      ),
    ),
  );
}

class _TrophyDialog extends StatefulWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String buttonLabel;
  const _TrophyDialog({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
  });

  @override
  State<_TrophyDialog> createState() => _TrophyDialogState();
}

class _TrophyDialogState extends State<_TrophyDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..forward();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.of(context).disableAnimations;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 300,
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
          decoration: BoxDecoration(
            color: const Color(0xFF15102A),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.warning.withValues(alpha: 0.4)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 180,
                height: 150,
                child: AnimatedBuilder(
                  animation: _c,
                  builder: (context, _) {
                    final t = still ? 1.0 : _c.value;
                    final land = Curves.elasticOut.transform(
                      (t / 0.6).clamp(0.0, 1.0),
                    );
                    return CustomPaint(
                      painter: _ConfettiPainter(still ? 0 : t),
                      child: Center(
                        child: Transform.scale(
                          scale: 0.4 + 0.6 * land,
                          child: Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const RadialGradient(
                                colors: [Color(0xFFFFE08A), AppColors.warning],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.warning
                                      .withValues(alpha: 0.5 * t),
                                  blurRadius: 30,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                widget.icon,
                                style: const TextStyle(fontSize: 46),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: Colors.white.withValues(alpha: 0.65),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.warning,
                    foregroundColor: const Color(0xFF2A1C00),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    widget.buttonLabel,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
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
}

class _ConfettiPainter extends CustomPainter {
  final double t;
  _ConfettiPainter(this.t);

  static const _colors = [
    AppColors.warning,
    AppColors.lime,
    AppColors.cyan,
    AppColors.pink,
    AppColors.primaryLight,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    if (t <= 0) return;
    final c = size.center(Offset.zero);
    final rnd = math.Random(7);
    for (var i = 0; i < 28; i++) {
      final angle = rnd.nextDouble() * math.pi * 2;
      final speed = 50 + rnd.nextDouble() * 60;
      final p = Curves.easeOut.transform(t);
      final pos = c +
          Offset(math.cos(angle), math.sin(angle)) * speed * p +
          Offset(0, 40 * t * t);
      final fade = (1 - t).clamp(0.0, 1.0);
      canvas.save();
      canvas.translate(pos.dx, pos.dy);
      canvas.rotate(angle + t * 6);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          const Rect.fromLTWH(-3, -1.5, 6, 3),
          const Radius.circular(1),
        ),
        Paint()..color = _colors[i % _colors.length].withValues(alpha: fade),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter old) => old.t != t;
}
