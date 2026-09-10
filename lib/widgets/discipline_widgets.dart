import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';

// ═════════════════════════════════════════════════════════════════════════════
//  Discipline level — earned by keeping the streak, not by spending time
// ═════════════════════════════════════════════════════════════════════════════

class DisciplineTier {
  final String key;
  final int days;
  final Color color;
  const DisciplineTier(this.key, this.days, this.color);
}

/// Tiers are cut by streak length: the ladder is deliberately steep at the top
/// so the last rungs mean something.
const List<DisciplineTier> kDisciplineTiers = [
  DisciplineTier('spark', 0, Color(0xFF8B5CF6)),
  DisciplineTier('steady', 3, Color(0xFF6366F1)),
  DisciplineTier('sharp', 7, Color(0xFF00E5FF)),
  DisciplineTier('solid', 14, Color(0xFF22E06A)),
  DisciplineTier('relentless', 30, Color(0xFFF5C542)),
  DisciplineTier('unbroken', 60, Color(0xFFFF8A00)),
  DisciplineTier('legend', 100, Color(0xFFFF4DB8)),
];

int disciplineTierIndex(int streak) {
  var idx = 0;
  for (var i = 0; i < kDisciplineTiers.length; i++) {
    if (streak >= kDisciplineTiers[i].days) idx = i;
  }
  return idx;
}

/// The tier's name in the user's language. Keyed off [DisciplineTier.key] so a
/// caller cannot pair one tier's colour with another's name.
String disciplineTierName(AppLocalizations l, String key) {
  switch (key) {
    case 'steady':
      return l.disciplineTierSteady;
    case 'sharp':
      return l.disciplineTierSharp;
    case 'solid':
      return l.disciplineTierSolid;
    case 'relentless':
      return l.disciplineTierRelentless;
    case 'unbroken':
      return l.disciplineTierUnbroken;
    case 'legend':
      return l.disciplineTierLegend;
    default:
      return l.disciplineTierSpark;
  }
}

/// 0-1 progress from the current tier toward the next one.
double disciplineTierProgress(int streak) {
  final i = disciplineTierIndex(streak);
  if (i >= kDisciplineTiers.length - 1) return 1;
  final from = kDisciplineTiers[i].days;
  final to = kDisciplineTiers[i + 1].days;
  return ((streak - from) / (to - from)).clamp(0.0, 1.0);
}

// ═════════════════════════════════════════════════════════════════════════════
//  A goal with a bar: used for the week and the month
// ═════════════════════════════════════════════════════════════════════════════

class GoalBar extends StatelessWidget {
  final IconData icon;
  final String label;
  final int done;
  final int target;
  final Color color;

  const GoalBar({
    super.key,
    required this.icon,
    required this.label,
    required this.done,
    required this.target,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = target <= 0 ? 0.0 : (done / target).clamp(0.0, 1.0);
    final complete = done >= target && target > 0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: complete ? AppColors.success : color),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.72),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$done/$target',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: complete ? AppColors.success : Colors.white,
                ),
              ),
              if (complete) ...[
                const SizedBox(width: 6),
                const Icon(
                  CupertinoIcons.checkmark_alt_circle_fill,
                  size: 14,
                  color: AppColors.success,
                ),
              ],
            ],
          ),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 6,
              backgroundColor: Colors.white.withValues(alpha: 0.07),
              valueColor: AlwaysStoppedAnimation<Color>(
                complete ? AppColors.success : color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  The ring behind the discipline level
// ═════════════════════════════════════════════════════════════════════════════

class DisciplineRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final int segments;

  const DisciplineRingPainter({
    required this.progress,
    required this.color,
    this.segments = 24,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;
    const gap = 0.055;
    final step = (2 * math.pi) / segments;
    final filled = (progress * segments).round();

    for (var i = 0; i < segments; i++) {
      final start = -math.pi / 2 + i * step + gap / 2;
      final active = i < filled;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        start,
        step - gap,
        false,
        Paint()
          ..color = active ? color : Colors.white.withValues(alpha: 0.07)
          ..style = PaintingStyle.stroke
          ..strokeWidth = active ? 6 : 4
          ..strokeCap = StrokeCap.round
          ..maskFilter = active
              ? const MaskFilter.blur(BlurStyle.solid, 2)
              : null,
      );
    }
  }

  @override
  bool shouldRepaint(DisciplineRingPainter old) =>
      old.progress != progress || old.color != color;
}
