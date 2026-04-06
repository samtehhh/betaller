import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../models/routine.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/localized_data.dart';

/// Parsed set/rep info from setsReps string.
class _SetInfo {
  final int totalSets;
  final int? perSetSeconds; // non-null → timed
  final int? perSetReps; // non-null → rep-based

  const _SetInfo({
    required this.totalSets,
    this.perSetSeconds,
    this.perSetReps,
  });

  bool get isTimed => perSetSeconds != null && perSetSeconds! > 0;
  bool get isRepBased => perSetReps != null && perSetReps! > 0;
}

class ExerciseDetailScreen extends StatefulWidget {
  final Routine routine;

  const ExerciseDetailScreen({super.key, required this.routine});

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  // Set tracking state
  int _currentSet = 0; // 0-indexed
  late int _totalSets;
  int? _perSetSeconds;
  int? _perSetReps;
  bool _isResting = false;
  bool _allSetsComplete = false;
  bool _useFallbackTimer = false;

  // Timer state
  late int _remainingSeconds;
  Timer? _timer;
  bool _isRunning = false;

  static const int _restDuration = 10;

  @override
  void initState() {
    super.initState();
    _parseSetsReps();
    if (_useFallbackTimer) {
      _remainingSeconds = widget.routine.timerSeconds ?? 0;
    } else if (_perSetSeconds != null) {
      _remainingSeconds = _perSetSeconds!;
    } else {
      _remainingSeconds = 0;
    }
  }

  /// Parse the setsReps string into structured data.
  void _parseSetsReps() {
    final raw = widget.routine.setsReps;
    if (raw.isEmpty) {
      _useFallbackTimer = true;
      _totalSets = 1;
      return;
    }

    final info = _parseSetsRepsString(raw);
    if (info != null) {
      _totalSets = info.totalSets;
      _perSetSeconds = info.perSetSeconds;
      _perSetReps = info.perSetReps;
      _useFallbackTimer = false;
    } else {
      // Parsing failed → fall back to single timer
      _useFallbackTimer = true;
      _totalSets = 1;
    }
  }

  /// Try various patterns to extract set count and per-set time/reps.
  static _SetInfo? _parseSetsRepsString(String raw) {
    final s = raw.trim().toLowerCase();

    // "NxM seconds" / "NxM second sprints" / "N×M seconds"
    final rxTimedBasic =
        RegExp(r'(\d+)\s*[x×]\s*(\d+)\s*(?:second|sec|s)\b');
    var m = rxTimedBasic.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!),
      );
    }

    // "NxM minute(s)"
    final rxMinute = RegExp(r'(\d+)\s*[x×]\s*(\d+)\s*min');
    m = rxMinute.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!) * 60,
      );
    }

    // "NxM reps" / "NxM each direction"
    final rxReps =
        RegExp(r'(\d+)\s*[x×]\s*(\d+)\s*(?:reps?|each\b|tekrar)');
    m = rxReps.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetReps: int.parse(m.group(2)!),
      );
    }

    // "N min x M sets"
    final rxMinSets =
        RegExp(r'(\d+)\s*min\s*[x×]\s*(\d+)\s*set');
    m = rxMinSets.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(2)!),
        perSetSeconds: int.parse(m.group(1)!) * 60,
      );
    }

    // "N directions x Ms hold" / "N-M stretches x Ns hold"
    final rxDirHold =
        RegExp(r'(\d+)[\s\w-]*[x×]\s*(\d+)\s*s\s*hold');
    m = rxDirHold.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!),
      );
    }

    // "N exercises/stretches x M min each" / "N poses x Ms hold"
    final rxExMin =
        RegExp(r'(\d+)[\s\w-]*[x×]\s*(\d+)\s*min\s*(?:each|hold)?');
    m = rxExMin.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!) * 60,
      );
    }

    // "N poses/stretches x Ns hold" with explicit 'hold' at end
    final rxPosesHold =
        RegExp(r'(\d+)[\s\w-]*[x×]\s*(\d+)\s*(?:sec|s)?\s*hold');
    m = rxPosesHold.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!),
      );
    }

    // "N rounds of Ms work/Ns rest"
    final rxRounds =
        RegExp(r'(\d+)\s*rounds?\s*(?:of\s+)?(\d+)\s*s\s*work');
    m = rxRounds.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!),
      );
    }

    return null; // could not parse
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // ── Timer helpers ──────────────────────────────────────────────

  void _startTimer() {
    if (_remainingSeconds <= 0) return;
    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 1) {
        timer.cancel();
        setState(() {
          _remainingSeconds = 0;
          _isRunning = false;
        });
        if (!_useFallbackTimer) {
          _onSetTimerComplete();
        }
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    _timer?.cancel();
    if (_useFallbackTimer) {
      setState(() {
        _remainingSeconds = widget.routine.timerSeconds ?? 0;
        _isRunning = false;
      });
    } else {
      setState(() {
        _remainingSeconds = _isResting ? _restDuration : (_perSetSeconds ?? 0);
        _isRunning = false;
      });
    }
  }

  /// Called when a timed set's countdown reaches zero.
  void _onSetTimerComplete() {
    if (_isResting) {
      // Rest done → advance to next set
      setState(() {
        _isResting = false;
        _remainingSeconds = _perSetSeconds ?? 0;
      });
      return;
    }

    // Set complete
    final nextSet = _currentSet + 1;
    if (nextSet >= _totalSets) {
      setState(() {
        _currentSet = nextSet;
        _allSetsComplete = true;
      });
    } else {
      // Start rest period
      setState(() {
        _currentSet = nextSet;
        _isResting = true;
        _remainingSeconds = _restDuration;
      });
      _startTimer(); // auto-start rest countdown
    }
  }

  /// Mark a rep-based set as done.
  void _markRepSetDone() {
    final nextSet = _currentSet + 1;
    if (nextSet >= _totalSets) {
      setState(() {
        _currentSet = nextSet;
        _allSetsComplete = true;
      });
    } else {
      setState(() {
        _currentSet = nextSet;
        _isResting = true;
        _remainingSeconds = _restDuration;
      });
      _startTimer(); // auto-start rest countdown
    }
  }

  void _resetAllSets() {
    _timer?.cancel();
    setState(() {
      _currentSet = 0;
      _isResting = false;
      _allSetsComplete = false;
      _isRunning = false;
      _remainingSeconds = _perSetSeconds ?? _perSetReps ?? 0;
    });
  }

  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  Color _difficultyColor(String difficulty) {
    switch (difficulty) {
      case 'beginner':
        return AppColors.success;
      case 'intermediate':
        return AppColors.orange;
      case 'advanced':
        return AppColors.error;
      default:
        return AppColors.primary;
    }
  }

  String _difficultyLabel(String difficulty, AppLocalizations l) {
    switch (difficulty) {
      case 'beginner':
        return l.difficultyBeginner;
      case 'intermediate':
        return l.difficultyIntermediate;
      case 'advanced':
        return l.difficultyAdvanced;
      default:
        return difficulty;
    }
  }

  Color _categoryColor(String category) {
    final catInfo = categoryInfo[category];
    return catInfo?['color'] as Color? ?? AppColors.primary;
  }

  String _categoryLabel(String category) {
    final l = AppLocalizations.of(context)!;
    return localizedCategory(l, category);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final routine = widget.routine;
    final diffColor = _difficultyColor(routine.difficulty);
    final catColor = _categoryColor(routine.category);
    final localized = localizedRoutine(l, routine.id);
    final displayTitle = localized['title'] ?? routine.title;
    final displayDesc = localized['description'] ?? routine.description;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          displayTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: -0.3,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: diffColor.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: diffColor.withValues(alpha: 0.4)),
            ),
            child: Text(
              _difficultyLabel(routine.difficulty, l),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: diffColor,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Hero Section ─────────────────────────
                  GlassCard(
                    child: Column(
                      children: [
                        // Icon
                        Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            color: catColor.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Text(
                              routine.icon,
                              style: const TextStyle(fontSize: 48),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Category badge + duration row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                color: catColor.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: catColor.withValues(alpha: 0.35)),
                              ),
                              child: Text(
                                _categoryLabel(routine.category),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: catColor,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Icon(CupertinoIcons.clock,
                                size: 14,
                                color: Colors.white.withValues(alpha: 0.6)),
                            const SizedBox(width: 4),
                            Text(
                              localizedDuration(l, routine.duration),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Description
                        Text(
                          displayDesc,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withValues(alpha: 0.75),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // ── How to Do It ─────────────────────────
                  if (routine.formDescription.isNotEmpty ||
                      routine.setsReps.isNotEmpty)
                    _buildSection(
                      icon: CupertinoIcons.text_badge_checkmark,
                      title: l.howToDoIt,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (routine.formDescription.isNotEmpty)
                            Text(
                              routine.formDescription,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withValues(alpha: 0.85),
                                height: 1.6,
                              ),
                            ),
                          if (routine.formDescription.isNotEmpty &&
                              routine.setsReps.isNotEmpty)
                            const SizedBox(height: 14),
                          if (routine.setsReps.isNotEmpty)
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.10),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color:
                                        AppColors.primary.withValues(alpha: 0.25)),
                              ),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.repeat,
                                      size: 16, color: AppColors.primary),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      routine.setsReps,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  if (routine.formDescription.isNotEmpty ||
                      routine.setsReps.isNotEmpty)
                    const SizedBox(height: 14),

                  // ── Muscles & Bones Targeted ─────────────
                  if (routine.musclesTargeted.isNotEmpty)
                    _buildSection(
                      icon: CupertinoIcons.sportscourt,
                      title: l.musclesTargeted,
                      iconColor: AppColors.cyan,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: routine.musclesTargeted.map((muscle) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.cyan.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.cyan.withValues(alpha: 0.30)),
                            ),
                            child: Text(
                              _formatMuscle(muscle),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.cyan,
                                letterSpacing: 0.1,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  if (routine.musclesTargeted.isNotEmpty)
                    const SizedBox(height: 14),

                  // ── Scientific Basis ─────────────────────
                  if (routine.scientificBasis.isNotEmpty)
                    _buildSection(
                      icon: CupertinoIcons.lab_flask,
                      title: l.scientificBasis,
                      iconColor: AppColors.lime,
                      child: Text(
                        routine.scientificBasis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withValues(alpha: 0.85),
                          height: 1.6,
                        ),
                      ),
                    ),
                  if (routine.scientificBasis.isNotEmpty)
                    const SizedBox(height: 14),

                  // ── Set Tracker / Timer ───────────────────
                  if (!_useFallbackTimer)
                    _buildSetTrackerSection(l)
                  else if (widget.routine.timerSeconds != null &&
                      widget.routine.timerSeconds! > 0)
                    _buildFallbackTimerSection(l),
                ],
              ),
            ),
          ),

          // ── Mark Complete Button ──────────────────
          _buildCompleteButton(l),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required Widget child,
    Color? iconColor,
  }) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(icon: icon, title: title, iconColor: iconColor),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  // ── Set Tracker Section ──────────────────────────────────────

  Widget _buildSetTrackerSection(AppLocalizations l) {
    final isTimed = _perSetSeconds != null && _perSetSeconds! > 0;

    return GlassCard(
      child: Column(
        children: [
          SectionHeader(
            icon: CupertinoIcons.timer,
            title: _allSetsComplete
                ? l.allSetsComplete
                : isTimed
                    ? l.setTimer
                    : l.setTracker,
          ),
          const SizedBox(height: 16),

          // ── Set progress row ──
          _buildSetProgressRow(),
          const SizedBox(height: 8),

          // "Set X of Y" label
          if (!_allSetsComplete)
            Text(
              _isResting
                  ? l.restBeforeSet('${_currentSet + 1}')
                  : l.setXofY('${_currentSet + 1}', '$_totalSets'),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: _isResting ? AppColors.orange : AppColors.primary,
                letterSpacing: -0.2,
              ),
            ),
          const SizedBox(height: 16),

          // ── Center content ──
          if (_allSetsComplete)
            _buildAllSetsCompleteView(l)
          else if (_isResting)
            _buildRestTimerView(l)
          else if (isTimed)
            _buildTimedSetView(l)
          else
            _buildRepSetView(l),

          const SizedBox(height: 20),

          // ── Control buttons ──
          if (!_allSetsComplete) _buildSetControls(isTimed, l),
          if (_allSetsComplete)
            _timerButton(
              icon: CupertinoIcons.arrow_counterclockwise,
              label: l.restart,
              color: Colors.white.withValues(alpha: 0.6),
              onTap: _resetAllSets,
            ),
        ],
      ),
    );
  }

  Widget _buildSetProgressRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_totalSets, (i) {
        final isCompleted = i < _currentSet;
        final isCurrent = i == _currentSet && !_allSetsComplete;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: isCompleted
              ? const Icon(CupertinoIcons.checkmark_circle_fill,
                  color: AppColors.success, size: 24)
              : Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrent
                        ? (_isResting
                            ? AppColors.orange.withValues(alpha: 0.25)
                            : AppColors.primary.withValues(alpha: 0.25))
                        : Colors.white.withValues(alpha: 0.08),
                    border: Border.all(
                      color: isCurrent
                          ? (_isResting
                              ? AppColors.orange.withValues(alpha: 0.6)
                              : AppColors.primary.withValues(alpha: 0.6))
                          : Colors.white.withValues(alpha: 0.15),
                      width: isCurrent ? 2 : 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${i + 1}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: isCurrent
                            ? (_isResting
                                ? AppColors.orange
                                : AppColors.primary)
                            : Colors.white.withValues(alpha: 0.35),
                      ),
                    ),
                  ),
                ),
        );
      }),
    );
  }

  Widget _buildTimedSetView(AppLocalizations l) {
    final total = _perSetSeconds!;
    final progress = total > 0 ? _remainingSeconds / total : 0.0;

    return _buildCircularTimer(
      progress: progress,
      color: AppColors.primary,
      centerChild: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _formatTime(_remainingSeconds),
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          Text(
            l.perSet,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestTimerView(AppLocalizations l) {
    final progress =
        _restDuration > 0 ? _remainingSeconds / _restDuration : 0.0;

    return _buildCircularTimer(
      progress: progress,
      color: AppColors.orange,
      centerChild: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _formatTime(_remainingSeconds),
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          Text(
            l.rest,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.orange,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRepSetView(AppLocalizations l) {
    return _buildCircularTimer(
      progress: 1.0,
      color: AppColors.primary,
      centerChild: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${_perSetReps ?? 0}',
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          Text(
            l.reps,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllSetsCompleteView(AppLocalizations l) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.success.withValues(alpha: 0.15),
            border:
                Border.all(color: AppColors.success.withValues(alpha: 0.4)),
          ),
          child: const Icon(
            CupertinoIcons.checkmark_circle_fill,
            color: AppColors.success,
            size: 56,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l.allSetsComplete,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColors.success,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildCircularTimer({
    required double progress,
    required Color color,
    required Widget centerChild,
  }) {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          SizedBox(
            width: 160,
            height: 160,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: 8,
              color: color.withValues(alpha: 0.12),
              strokeCap: StrokeCap.round,
            ),
          ),
          // Progress circle
          SizedBox(
            width: 160,
            height: 160,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 8,
              color: color,
              backgroundColor: Colors.transparent,
              strokeCap: StrokeCap.round,
            ),
          ),
          centerChild,
        ],
      ),
    );
  }

  Widget _buildSetControls(bool isTimed, AppLocalizations l) {
    if (_isResting) {
      // During rest, show skip-rest button
      return _timerButton(
        icon: CupertinoIcons.forward_fill,
        label: l.skipRest,
        color: AppColors.orange,
        filled: true,
        onTap: () {
          _timer?.cancel();
          setState(() {
            _isResting = false;
            _isRunning = false;
            _remainingSeconds = _perSetSeconds ?? 0;
          });
        },
      );
    }

    if (isTimed) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _timerButton(
            icon: CupertinoIcons.arrow_counterclockwise,
            label: l.resetTimer,
            color: Colors.white.withValues(alpha: 0.6),
            onTap: _resetTimer,
          ),
          const SizedBox(width: 20),
          _timerButton(
            icon: _isRunning
                ? CupertinoIcons.pause_fill
                : CupertinoIcons.play_fill,
            label: _isRunning ? l.pause : l.start,
            color: AppColors.primary,
            filled: true,
            onTap: _isRunning ? _pauseTimer : _startTimer,
          ),
        ],
      );
    }

    // Rep-based: show Done button
    return _timerButton(
      icon: CupertinoIcons.checkmark,
      label: l.done,
      color: AppColors.success,
      filled: true,
      onTap: _markRepSetDone,
    );
  }

  // ── Fallback Timer (single countdown) ─────────────────────

  Widget _buildFallbackTimerSection(AppLocalizations l) {
    final totalSeconds = widget.routine.timerSeconds!;
    final progress = totalSeconds > 0 ? _remainingSeconds / totalSeconds : 0.0;

    return GlassCard(
      child: Column(
        children: [
          SectionHeader(
              icon: CupertinoIcons.timer, title: l.builtInTimer),
          const SizedBox(height: 20),
          _buildCircularTimer(
            progress: progress,
            color: _remainingSeconds == 0 ? AppColors.success : AppColors.primary,
            centerChild: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _formatTime(_remainingSeconds),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: -1,
                  ),
                ),
                if (_remainingSeconds == 0)
                  Text(
                    l.doneExclamation,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.success,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _timerButton(
                icon: CupertinoIcons.arrow_counterclockwise,
                label: l.resetTimer,
                color: Colors.white.withValues(alpha: 0.6),
                onTap: _resetTimer,
              ),
              const SizedBox(width: 20),
              _timerButton(
                icon: _isRunning
                    ? CupertinoIcons.pause_fill
                    : CupertinoIcons.play_fill,
                label: _isRunning ? l.pause : l.start,
                color: AppColors.primary,
                filled: true,
                onTap: _isRunning ? _pauseTimer : _startTimer,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timerButton({
    required IconData icon,
    required String label,
    required Color color,
    bool filled = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: filled
                  ? color.withValues(alpha: 0.20)
                  : Colors.white.withValues(alpha: 0.08),
              shape: BoxShape.circle,
              border: Border.all(
                color: filled
                    ? color.withValues(alpha: 0.50)
                    : Colors.white.withValues(alpha: 0.15),
              ),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompleteButton(AppLocalizations l) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final isCompleted = widget.routine.completed;
        // Button is fully active if already completed, all sets done, or fallback mode
        final isFullyActive =
            isCompleted || _allSetsComplete || _useFallbackTimer;

        return Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            border: Border(
              top: BorderSide(
                  color: AppColors.primary.withValues(alpha: 0.10)),
            ),
          ),
          child: SafeArea(
            top: false,
            child: GestureDetector(
              onTap: () {
                provider.toggleRoutine(widget.routine.id);
                Navigator.of(context).pop();
              },
              child: Opacity(
                opacity: isFullyActive ? 1.0 : 0.5,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: isCompleted
                        ? null
                        : AppColors.gradientPrimary,
                    color: isCompleted
                        ? AppColors.success.withValues(alpha: 0.18)
                        : null,
                    borderRadius: BorderRadius.circular(16),
                    border: isCompleted
                        ? Border.all(
                            color: AppColors.success.withValues(alpha: 0.4))
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isCompleted
                            ? CupertinoIcons.arrow_uturn_left
                            : CupertinoIcons.checkmark_circle_fill,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        isCompleted ? l.markIncomplete : l.markComplete,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatMuscle(String muscle) {
    return muscle
        .split('_')
        .map((w) => w.isNotEmpty
            ? '${w[0].toUpperCase()}${w.substring(1)}'
            : w)
        .join(' ');
  }
}
