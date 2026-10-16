import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/daily_targets.dart';
import '../utils/free_tier.dart';
import '../utils/haptics.dart';
import '../widgets/exercise_media.dart';
import '../widgets/free_tier_widgets.dart';
import '../widgets/plan_widgets.dart';

enum _Phase { ready, work, rest, moveDone, locked, finished }

/// Walks through a list of dosed moves one after another: the clip, the
/// dose, a timer for holds and timed sets, rests between sets, and next.
/// [onMoveDone] fires once per move as its last set is finished.
///
/// On the free tier the first workout played to the end is free. A free user
/// who opens the player with that used up gets the first move as a preview,
/// not counted anywhere, and then a card that shows what comes next and
/// offers Pro.
class WorkoutPlayerScreen extends StatefulWidget {
  final List<MoveDose> moves;
  final String title;
  final Color color;
  final Set<String> alreadyDone;
  final ValueChanged<String> onMoveDone;

  const WorkoutPlayerScreen({
    super.key,
    required this.moves,
    required this.title,
    required this.onMoveDone,
    this.color = AppColors.primary,
    this.alreadyDone = const {},
  });

  @override
  State<WorkoutPlayerScreen> createState() => _WorkoutPlayerScreenState();
}

class _WorkoutPlayerScreenState extends State<WorkoutPlayerScreen> {
  late int _index;
  int _set = 0;
  _Phase _phase = _Phase.ready;
  int _remaining = 0;
  int _phaseLength = 1;
  Timer? _timer;
  late final Set<String> _done = {...widget.alreadyDone};
  final _started = DateTime.now();

  /// The free workout is used up: one move as a preview, then the Pro card.
  late bool _preview;

  /// Moves finished in this sitting, as opposed to [WorkoutPlayerScreen
  /// .alreadyDone]. Only a sitting that did something spends the free use.
  int _doneHere = 0;

  /// This sitting spent the free workout; the end screen says so.
  bool _spentFree = false;

  MoveDose get _move => widget.moves[_index];

  @override
  void initState() {
    super.initState();
    // Start at the first move not done yet.
    final open = widget.moves.indexWhere((m) => !_done.contains(m.routineId));
    _index = open < 0 ? 0 : open;
    _preview = !context.read<AppProvider>().canUseFree(FreeFeature.workout);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _countdown(_Phase phase, int seconds) {
    _timer?.cancel();
    setState(() {
      _phase = phase;
      _remaining = seconds;
      _phaseLength = seconds < 1 ? 1 : seconds;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (_remaining <= 1) {
        t.cancel();
        if (phase == _Phase.work) {
          _finishSet();
        } else {
          Haptics.tap();
          setState(() => _phase = _Phase.ready);
        }
        return;
      }
      if (_remaining <= 4) Haptics.select();
      setState(() => _remaining--);
    });
  }

  void _startSet() {
    Haptics.tap();
    final m = _move;
    if (m.kind == DoseKind.hold || m.kind == DoseKind.timed) {
      _countdown(_Phase.work, m.workSeconds);
    } else {
      _finishSet();
    }
  }

  void _finishSet() {
    _timer?.cancel();
    final m = _move;
    if (m.kind != DoseKind.session && _set < m.sets - 1) {
      Haptics.success();
      _set++;
      _countdown(_Phase.rest, m.restSeconds);
      return;
    }
    _markDone();
  }

  void _markDone() {
    _timer?.cancel();
    if (_preview) {
      // The preview move counts nowhere: it is a taste, not a workout.
      Haptics.success();
      setState(() => _phase = _Phase.locked);
      return;
    }
    final id = _move.routineId;
    if (!_done.contains(id)) {
      _done.add(id);
      _doneHere++;
      widget.onMoveDone(id);
    }
    Haptics.success();
    if (_done.length >= widget.moves.length) {
      _finish();
    } else {
      setState(() => _phase = _Phase.moveDone);
    }
  }

  void _next() {
    _timer?.cancel();
    Haptics.tap();
    if (_preview) {
      setState(() => _phase = _Phase.locked);
      return;
    }
    // Next move not done yet, after this one; wrap to any skipped earlier.
    int? target;
    for (var i = _index + 1; i < widget.moves.length; i++) {
      if (!_done.contains(widget.moves[i].routineId)) {
        target = i;
        break;
      }
    }
    // Then any skipped earlier, but never the one being skipped now.
    if (target == null) {
      for (var i = 0; i < _index; i++) {
        if (!_done.contains(widget.moves[i].routineId)) {
          target = i;
          break;
        }
      }
    }
    if (target == null) {
      _finish();
      return;
    }
    setState(() {
      _index = target!;
      _set = 0;
      _phase = _Phase.ready;
    });
  }

  void _finish() {
    _timer?.cancel();
    Haptics.celebrate();
    final provider = context.read<AppProvider>();
    // The free workout is the first one finished with something done in it.
    if (provider.isMetered && _doneHere > 0) {
      _spentFree = provider.consumeFree(FreeFeature.workout);
    }
    setState(() => _phase = _Phase.finished);
    // Played through to the end, not skipped: a moment worth a rating.
    if (_done.length >= widget.moves.length) {
      provider.noteReviewMoment(ReviewMoment.workout);
    }
  }

  /// The Pro card's button. Bought: the rest of the workout plays on.
  Future<void> _continueWithPro() async {
    final bought = await showPaywallFor(context, FreeFeature.workout);
    if (!mounted) return;
    if (bought == true || context.read<AppProvider>().isPremium) {
      setState(() {
        _preview = false;
        _phase = _Phase.ready;
      });
      _next();
    }
  }

  String _clock(int s) =>
      '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        child: switch (_phase) {
          _Phase.finished => _buildFinished(l),
          _Phase.locked => _buildLocked(l),
          _ => _buildMove(context, l),
        },
      ),
    );
  }

  Widget _buildTopBar(AppLocalizations l) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 4, 16, 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.xmark, color: Colors.white),
            onPressed: () {
              Haptics.tap();
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Row(
              children: [
                for (var i = 0; i < widget.moves.length; i++)
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: _done.contains(widget.moves[i].routineId)
                            ? widget.color
                            : i == _index
                                ? widget.color.withValues(alpha: 0.45)
                                : Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          if (_preview) ...[
            FreeChip(label: l.ftPreviewTag),
            const SizedBox(width: 8),
          ],
          Text(
            '${_index + 1}/${widget.moves.length}',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMove(BuildContext context, AppLocalizations l) {
    final m = _move;
    final h = MediaQuery.of(context).size.height;
    final title = moveTitle(l, m.routineId);
    final nextName = _index < widget.moves.length - 1
        ? moveTitle(l, widget.moves[_index + 1].routineId)
        : null;
    final timed = m.kind == DoseKind.hold || m.kind == DoseKind.timed;

    Widget centre;
    switch (_phase) {
      case _Phase.work:
      case _Phase.rest:
        final resting = _phase == _Phase.rest;
        final c = resting ? AppColors.cyan : widget.color;
        centre = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 116,
              height: 116,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: _remaining / _phaseLength,
                    strokeWidth: 7,
                    backgroundColor: Colors.white.withValues(alpha: 0.08),
                    valueColor: AlwaysStoppedAnimation(c),
                  ),
                  Center(
                    child: Text(
                      _clock(_remaining),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1,
                        color: c,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              resting ? l.plRest : (m.perSide ? l.plEachSide : ' '),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: c,
              ),
            ),
          ],
        );
      case _Phase.moveDone:
        centre = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(CupertinoIcons.checkmark_seal_fill,
                size: 56, color: AppColors.success),
            const SizedBox(height: 8),
            Text(
              l.plMoveDone,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ],
        );
      case _Phase.ready:
      case _Phase.locked:
      case _Phase.finished:
        centre = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                m.kind == DoseKind.reps
                    ? l.plRepsBig(m.amount)
                    : m.kind == DoseKind.session
                        ? l.plDoseMinutes(m.amount)
                        : _clock(m.amount),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.2,
                  color: widget.color,
                ),
              ),
            ),
            if (m.perSide || m.kind == DoseKind.session)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  m.kind == DoseKind.session ? l.plSessionHint : l.plEachSide,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.3,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ),
              ),
          ],
        );
    }

    final String primaryLabel;
    final VoidCallback? primaryAction;
    switch (_phase) {
      case _Phase.ready:
        primaryLabel = timed
            ? l.plStartSet
            : (m.kind == DoseKind.session ? l.plMoveDone : l.plSetDone);
        primaryAction = m.kind == DoseKind.session ? _markDone : _startSet;
      case _Phase.work:
        primaryLabel = l.plSetDone;
        primaryAction = () {
          Haptics.tap();
          _finishSet();
        };
      case _Phase.rest:
        primaryLabel = l.plSkipRest;
        primaryAction = () {
          _timer?.cancel();
          Haptics.tap();
          setState(() => _phase = _Phase.ready);
        };
      case _Phase.moveDone:
        primaryLabel = l.plNextMove;
        primaryAction = _next;
      case _Phase.locked:
      case _Phase.finished:
        primaryLabel = l.done;
        primaryAction = () => Navigator.pop(context);
    }

    return Column(
      children: [
        _buildTopBar(l),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ExerciseMedia(
            key: ValueKey(m.routineId),
            routineId: m.routineId,
            color: widget.color,
            height: (h * 0.34).clamp(170.0, 330.0),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(22, 16, 22, 8),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  doseLabel(l, m),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ),
                if (m.kind != DoseKind.session) ...[
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var s = 0; s < m.sets; s++)
                        Container(
                          width: 26,
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: s < _set ||
                                    _phase == _Phase.moveDone
                                ? widget.color
                                : s == _set
                                    ? widget.color.withValues(alpha: 0.4)
                                    : Colors.white.withValues(alpha: 0.1),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l.plSetOf(
                        (_set + 1).clamp(1, m.sets), m.sets),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.45),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                centre,
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 14),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: PlanButton(
                  label: primaryLabel,
                  color: widget.color,
                  onTap: primaryAction,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      nextName == null
                          ? l.plLastMove
                          : l.plUpNext(nextName),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.45),
                      ),
                    ),
                  ),
                  if (_phase != _Phase.moveDone)
                    TextButton(
                      onPressed: _next,
                      child: Text(
                        l.plSkipMove,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// After the preview move: what is left, and one way on.
  Widget _buildLocked(AppLocalizations l) {
    final rest = [
      for (var i = 0; i < widget.moves.length; i++)
        if (i != _index && !_done.contains(widget.moves[i].routineId))
          widget.moves[i],
    ];
    return Column(
      children: [
        _buildTopBar(l),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            children: [
              Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.warning.withValues(alpha: 0.12),
                    border: Border.all(
                      color: AppColors.warning.withValues(alpha: 0.5),
                    ),
                  ),
                  child: const Icon(
                    CupertinoIcons.lock_fill,
                    size: 28,
                    color: AppColors.warning,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l.ftPreviewTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.6,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l.ftPreviewBody,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.5,
                  height: 1.4,
                  color: Colors.white.withValues(alpha: 0.65),
                ),
              ),
              const SizedBox(height: 16),
              PlanCard(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                child: Column(
                  children: [
                    for (final m in rest)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            MoveThumb(
                              routineId: m.routineId,
                              width: 40,
                              height: 50,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    moveTitle(l, m.routineId),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    doseLabel(l, m),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              CupertinoIcons.lock_fill,
                              size: 14,
                              color: Colors.white.withValues(alpha: 0.35),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 14),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: PlanButton(
                  label: l.ftContinuePro,
                  icon: CupertinoIcons.lock_open_fill,
                  color: AppColors.primary,
                  onTap: _continueWithPro,
                ),
              ),
              TextButton(
                onPressed: () {
                  Haptics.tap();
                  Navigator.pop(context);
                },
                child: Text(
                  l.ftNotNow,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFinished(AppLocalizations l) {
    final minutes = widget.moves.fold<int>(0, (s, m) => s + m.minutes);
    final elapsed = DateTime.now().difference(_started).inMinutes;
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 20),
      child: Column(
        children: [
          const Spacer(),
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.warning.withValues(alpha: 0.12),
              border: Border.all(
                color: AppColors.warning.withValues(alpha: 0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.warning.withValues(alpha: 0.3),
                  blurRadius: 30,
                ),
              ],
            ),
            child: const Icon(Icons.emoji_events_rounded,
                size: 46, color: AppColors.warning),
          ),
          const SizedBox(height: 22),
          Text(
            l.plWorkoutComplete,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.8,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.plWorkoutSummary(
                _done.length, elapsed > 0 ? elapsed : minutes),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              height: 1.4,
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
          if (_spentFree) ...[
            const SizedBox(height: 18),
            Text(
              l.ftFreeWorkoutUsed,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13.5,
                height: 1.4,
                fontWeight: FontWeight.w700,
                color: AppColors.lime,
              ),
            ),
          ],
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: PlanButton(
              label: l.done,
              color: widget.color,
              onTap: () {
                Haptics.tap();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
