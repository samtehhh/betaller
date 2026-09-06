import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

/// The water sheet: a glass that fills as you log, quick amounts that stay put
/// so several sips can be added in a row, and an undo for the last one.
Future<void> showWaterSheet(
  BuildContext context,
  AppProvider provider,
  double target,
) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => ChangeNotifierProvider.value(
      value: provider,
      child: _WaterSheet(target: target),
    ),
  );
}

class _WaterSheet extends StatefulWidget {
  final double target;
  const _WaterSheet({required this.target});

  @override
  State<_WaterSheet> createState() => _WaterSheetState();
}

class _WaterSheetState extends State<_WaterSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _wave;
  final List<double> _added = [];

  @override
  void initState() {
    super.initState();
    _wave = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _wave.dispose();
    super.dispose();
  }

  void _add(double amount) {
    HapticFeedback.lightImpact();
    context.read<AppProvider>().addWater(amount);
    setState(() => _added.add(amount));
  }

  void _undo() {
    if (_added.isEmpty) return;
    HapticFeedback.selectionClick();
    final last = _added.removeLast();
    context.read<AppProvider>().addWater(-last);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    final current = provider.todayWater;
    final ratio = widget.target <= 0
        ? 0.0
        : (current / widget.target).clamp(0.0, 1.0);
    final reached = current >= widget.target;
    final remaining = (widget.target - current).clamp(0.0, widget.target);

    return Container(
      padding: EdgeInsets.fromLTRB(
          24, 14, 24, 22 + MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0A16),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
        border: Border(
          top: BorderSide(color: AppColors.water.withValues(alpha: 0.25)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 22),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ── The glass ────────────────────────────────────────────
              AnimatedBuilder(
                animation: _wave,
                builder: (context, _) => SizedBox(
                  width: 92,
                  height: 132,
                  child: CustomPaint(
                    painter: _GlassPainter(
                      fill: ratio,
                      phase: _wave.value,
                      reached: reached,
                    ),
                    child: Center(
                      child: Text(
                        '${(ratio * 100).round()}%',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.8,
                          color: Colors.white.withValues(alpha: 0.92),
                          shadows: const [
                            Shadow(color: Colors.black54, blurRadius: 8),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 22),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.waterTracking,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -0.9,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          current.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            color: AppColors.water,
                            letterSpacing: -1.4,
                            height: 1,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '/ ${widget.target.toStringAsFixed(1)} L',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withValues(alpha: 0.42),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: (reached ? AppColors.success : AppColors.water)
                            .withValues(alpha: 0.13),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: (reached ? AppColors.success : AppColors.water)
                              .withValues(alpha: 0.30),
                        ),
                      ),
                      child: Text(
                        reached
                            ? l.waterGoalReached
                            : l.waterRemaining(remaining.toStringAsFixed(1)),
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: reached ? AppColors.success : AppColors.water,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // ── Quick amounts; the sheet stays open so sips can stack ────
          Row(
            children: [
              for (final amount in const [0.2, 0.3, 0.5, 1.0]) ...[
                Expanded(child: _AmountButton(amount: amount, onTap: () => _add(amount))),
                if (amount != 1.0) const SizedBox(width: 10),
              ],
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _added.isEmpty ? null : _undo,
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.08)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.arrow_uturn_left,
                              size: 15,
                              color: Colors.white
                                  .withValues(alpha: _added.isEmpty ? 0.22 : 0.65)),
                          const SizedBox(width: 8),
                          Text(
                            l.undo,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(
                                  alpha: _added.isEmpty ? 0.22 : 0.65),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.water,
                          AppColors.water.withValues(alpha: 0.7)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.water.withValues(alpha: 0.35),
                          blurRadius: 16,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        l.done,
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF05202B),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AmountButton extends StatelessWidget {
  final double amount;
  final VoidCallback onTap;
  const _AmountButton({required this.amount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.water.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.water.withValues(alpha: 0.25)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.drop_fill,
                size: 13, color: AppColors.water.withValues(alpha: 0.75)),
            const SizedBox(height: 4),
            Text(
              '+${amount.toStringAsFixed(1)}L',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: AppColors.water,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A glass with two offset waves, so the surface moves rather than sitting flat.
class _GlassPainter extends CustomPainter {
  final double fill;
  final double phase;
  final bool reached;

  const _GlassPainter({
    required this.fill,
    required this.phase,
    required this.reached,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final glass = RRect.fromRectAndCorners(
      Rect.fromLTWH(6, 4, size.width - 12, size.height - 8),
      topLeft: const Radius.circular(14),
      topRight: const Radius.circular(14),
      bottomLeft: const Radius.circular(26),
      bottomRight: const Radius.circular(26),
    );

    canvas.drawRRect(
      glass,
      Paint()..color = Colors.white.withValues(alpha: 0.035),
    );

    canvas.save();
    canvas.clipRRect(glass);

    final color = reached ? AppColors.success : AppColors.water;
    final level = glass.bottom - glass.height * fill.clamp(0.0, 1.0);

    for (var i = 0; i < 2; i++) {
      final amplitude = i == 0 ? 5.0 : 3.5;
      final speed = i == 0 ? 1.0 : -1.4;
      final alpha = i == 0 ? 0.75 : 0.45;
      final path = Path()..moveTo(glass.left, size.height);
      for (double x = glass.left; x <= glass.right; x += 2) {
        final t = (x / glass.width) * 2 * math.pi;
        final y = level +
            math.sin(t + phase * 2 * math.pi * speed + i) * amplitude;
        if (x == glass.left) {
          path.lineTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path
        ..lineTo(glass.right, size.height)
        ..close();
      canvas.drawPath(
        path,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color.withValues(alpha: alpha),
              color.withValues(alpha: alpha * 0.55),
            ],
          ).createShader(Rect.fromLTWH(0, level, size.width, size.height)),
      );
    }

    // a couple of bubbles so the water reads as alive
    for (var i = 0; i < 3; i++) {
      final bubblePhase = (phase + i * 0.33) % 1;
      final by = glass.bottom - (glass.bottom - level) * bubblePhase;
      if (by < level) continue;
      canvas.drawCircle(
        Offset(glass.left + glass.width * (0.3 + i * 0.2), by),
        2.0 + i * 0.6,
        Paint()..color = Colors.white.withValues(alpha: 0.16 * (1 - bubblePhase)),
      );
    }

    canvas.restore();

    canvas.drawRRect(
      glass,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.12)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6,
    );
  }

  @override
  bool shouldRepaint(_GlassPainter old) =>
      old.fill != fill || old.phase != phase || old.reached != reached;
}
