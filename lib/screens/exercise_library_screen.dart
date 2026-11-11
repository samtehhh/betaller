import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/routine.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/daily_targets.dart';
import '../utils/design_tokens.dart';
import '../utils/haptics.dart';
import '../utils/localized_data.dart';
import '../utils/move_catalog.dart';
import '../widgets/plan_widgets.dart';
import 'exercise_detail_screen.dart';

/// Every move the app knows, by group: jumps, hanging, stretches, strength,
/// posture and, for those who have the gear, weights. The weekly plan draws
/// from the first five; this is where all of them can be browsed and opened.
class ExerciseLibraryScreen extends StatefulWidget {
  const ExerciseLibraryScreen({super.key});

  @override
  State<ExerciseLibraryScreen> createState() => _ExerciseLibraryScreenState();
}

class _ExerciseLibraryScreenState extends State<ExerciseLibraryScreen> {
  MoveGroup _group = MoveGroup.jump;

  static String groupLabel(AppLocalizations l, MoveGroup g) => switch (g) {
    MoveGroup.jump => l.libJump,
    MoveGroup.hang => l.libHang,
    MoveGroup.stretch => l.libStretch,
    MoveGroup.strength => l.libStrength,
    MoveGroup.posture => l.libPosture,
    MoveGroup.weights => l.libWeights,
  };

  static IconData groupIcon(MoveGroup g) => switch (g) {
    MoveGroup.jump => Icons.directions_run_rounded,
    MoveGroup.hang => CupertinoIcons.arrow_up_to_line,
    MoveGroup.stretch => Icons.self_improvement_rounded,
    MoveGroup.strength => Icons.fitness_center_rounded,
    MoveGroup.posture => Icons.accessibility_new_rounded,
    MoveGroup.weights => CupertinoIcons.cube_box_fill,
  };

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    final byId = {for (final r in provider.allRoutines) r.id: r};
    // Only moves the app really has an entry for.
    final ids = [
      for (final id in kMoveGroups[_group]!)
        if (byId.containsKey(id)) id,
    ];
    final total = kLibraryMoves.where(byId.containsKey).length;

    return Scaffold(
      backgroundColor: BtColors.page,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 20, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      CupertinoIcons.chevron_left,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    l.libCount(total),
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: BtColors.textMute,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 6, 20, 14),
              child: Text(l.libTitle, style: BtType.screenTitle),
            ),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  for (final g in MoveGroup.values)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _GroupChip(
                        label: groupLabel(l, g),
                        icon: groupIcon(g),
                        count: kMoveGroups[g]!.where(byId.containsKey).length,
                        selected: g == _group,
                        onTap: () {
                          Haptics.select();
                          setState(() => _group = g);
                        },
                      ),
                    ),
                ],
              ),
            ),
            if (_group == MoveGroup.weights)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                child: Text(
                  l.libWeightsNote,
                  style: TextStyle(
                    fontSize: 13.5,
                    height: 1.4,
                    color: BtColors.textMute,
                  ),
                ),
              ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.fromLTRB(
                  20,
                  16,
                  20,
                  24 + MediaQuery.of(context).padding.bottom,
                ),
                itemCount: ids.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, i) =>
                    _MoveRow(routine: byId[ids[i]]!, l: l),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final int count;
  final bool selected;
  final VoidCallback onTap;
  const _GroupChip({
    required this.label,
    required this.icon,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    selected: selected,
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: BtMotion.quick,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? BtColors.brand : BtColors.card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? BtColors.brand : BtColors.stroke,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: selected ? Colors.white : BtColors.textSoft,
            ),
            const SizedBox(width: 7),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : BtColors.textSoft,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: selected
                    ? Colors.white.withValues(alpha: 0.7)
                    : BtColors.textFaint,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/// One move: its still (or the drawn stand-in when it has none), its name and
/// its starting dose.
class _MoveRow extends StatelessWidget {
  final Routine routine;
  final AppLocalizations l;
  const _MoveRow({required this.routine, required this.l});

  @override
  Widget build(BuildContext context) {
    final text = localizedRoutine(l, routine.id);
    final dose = moveDose(routine.id);
    return Semantics(
      button: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Haptics.tap();
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => ExerciseDetailScreen(routine: routine),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 12, 10),
          decoration: BoxDecoration(
            color: BtColors.card,
            borderRadius: BorderRadius.circular(BtRadius.lg),
            border: Border.all(color: BtColors.stroke),
          ),
          child: Row(
            children: [
              MoveThumb(
                routineId: routine.id,
                icon: routine.icon,
                width: 54,
                height: 66,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text['title'] ?? routine.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: BtType.headline.copyWith(fontSize: 16),
                    ),
                    if (dose != null) ...[
                      const SizedBox(height: 3),
                      Text(
                        '${dose.minutes} ${l.unitMinutes}',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                size: 15,
                color: BtColors.textFaint,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
