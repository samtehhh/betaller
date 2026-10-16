import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';
import '../utils/daily_targets.dart';
import 'discipline_widgets.dart';
import 'plan_widgets.dart';

// The Discipline program's building blocks, shared by the Program tab and the
// paywall's preview of it.

class PlanChip extends StatelessWidget {
  final String text;
  final Color color;
  const PlanChip({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      // Shrinks to fit rather than clipping "4 jours avant le niveau 8"
      // mid-word on a 320 pt phone.
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          maxLines: 1,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
      ),
    );
  }
}

/// The 70 days at a glance: level, day, what unlocks next.
class ProgramJourneyHeader extends StatelessWidget {
  final Set<int> completed;
  final int current;
  final int level;
  const ProgramJourneyHeader({
    super.key,
    required this.completed,
    required this.current,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final meta = kProgramLevelMeta[level];
    final color = meta.$2;
    final done = completed.length.clamp(0, kProgramDays);
    final finished = current >= kProgramDays;
    final toNextLevel = kProgramLevelDays - (current % kProgramLevelDays);

    return PlanCard(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      borderColor: color.withValues(alpha: 0.3),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 86,
                height: 86,
                child: CustomPaint(
                  painter: DisciplineRingPainter(
                    progress: done / kProgramDays,
                    color: color,
                    segments: 35,
                  ),
                  child: Center(
                    child: Text(meta.$1, style: const TextStyle(fontSize: 28)),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.levelLabel(level + 1),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.3,
                        color: Colors.white.withValues(alpha: 0.42),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      programLevelName(l, level),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.7,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l.plProgramDayOf(
                          (current + 1).clamp(1, kProgramDays), kProgramDays),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 8),
                    PlanChip(
                      text: finished
                          ? l.plProgramFinished
                          : level < kProgramLevelCount - 1
                              ? l.plNextLevelIn(toNextLevel, level + 2)
                              : l.daysLeftProgram(kProgramDays - done),
                      color: AppColors.warning,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: List.generate(kProgramLevelCount, (i) {
              final inLevel = List.generate(
                kProgramLevelDays,
                (d) => i * kProgramLevelDays + d,
              ).where(completed.contains).length;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: i == kProgramLevelCount - 1 ? 0 : 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: LinearProgressIndicator(
                      value: inLevel / kProgramLevelDays,
                      minHeight: 5,
                      backgroundColor: Colors.white.withValues(alpha: 0.07),
                      valueColor:
                          AlwaysStoppedAnimation(kProgramLevelMeta[i].$2),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

/// Level 1, now, level 10 for the moves that grow the most.
class ProgressionTable extends StatelessWidget {
  final int level;
  const ProgressionTable({super.key, required this.level, this.ids = defaultIds});

  /// The moves listed, in order.
  final List<String> ids;

  static const defaultIds = [
    'plank',
    'dead_hang_active',
    'squats',
    'jumping',
    'skipping_rope',
  ];

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    Widget cell(String head, MoveDose d, Color color, {bool strong = false}) =>
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: color.withValues(alpha: strong ? 0.14 : 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  head,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: color.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 2),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    doseLabel(l, d),
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: strong
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

    return PlanCard(
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 8),
      child: Column(
        children: [
          for (final id in ids)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 5),
                    child: Text(
                      moveTitle(l, id),
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      cell(l.plLevelN(1), moveDose(id, level: 0)!,
                          Colors.white),
                      cell(l.plNow, moveDose(id, level: level)!,
                          AppColors.lime,
                          strong: true),
                      cell(l.plLevelN(kProgramLevelCount),
                          moveDose(id, level: kProgramLevelCount - 1)!,
                          AppColors.warning),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
