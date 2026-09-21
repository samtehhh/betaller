import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../models/routine.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/localized_data.dart';


/// Parsed set/rep info from setsReps string.
class _SetInfo {
  final int totalSets;
  final int? perSetSeconds;
  final int? perSetReps;

  const _SetInfo({
    required this.totalSets,
    this.perSetSeconds,
    this.perSetReps,
  });
}

class ExerciseDetailScreen extends StatefulWidget {
  final Routine routine;

  const ExerciseDetailScreen({super.key, required this.routine});

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen>
    with SingleTickerProviderStateMixin {
  // Set tracking state
  int _currentSet = 0;
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

  // Scientifically optimal rest for HGH-maximizing exercise:
  // 60s for hypertrophy/HGH, 90s for power. We use 60s default.
  static const int _restDuration = 60;

  // Animation for pulsing timer
  late AnimationController _pulseController;

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
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

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
      _useFallbackTimer = true;
      _totalSets = 1;
    }
  }

  static _SetInfo? _parseSetsRepsString(String raw) {
    final s = raw.trim().toLowerCase();

    final rxTimedBasic = RegExp(r'(\d+)\s*[x×]\s*(\d+)\s*(?:second|sec|s)\b');
    var m = rxTimedBasic.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!),
      );
    }

    final rxMinute = RegExp(r'(\d+)\s*[x×]\s*(\d+)\s*min');
    m = rxMinute.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!) * 60,
      );
    }

    final rxReps = RegExp(r'(\d+)\s*[x×]\s*(\d+)\s*(?:reps?|each\b|tekrar)');
    m = rxReps.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetReps: int.parse(m.group(2)!),
      );
    }

    final rxMinSets = RegExp(r'(\d+)\s*min\s*[x×]\s*(\d+)\s*set');
    m = rxMinSets.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(2)!),
        perSetSeconds: int.parse(m.group(1)!) * 60,
      );
    }

    final rxDirHold = RegExp(r'(\d+)[\s\w-]*[x×]\s*(\d+)\s*s\s*hold');
    m = rxDirHold.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!),
      );
    }

    final rxExMin = RegExp(r'(\d+)[\s\w-]*[x×]\s*(\d+)\s*min\s*(?:each|hold)?');
    m = rxExMin.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!) * 60,
      );
    }

    final rxPosesHold = RegExp(r'(\d+)[\s\w-]*[x×]\s*(\d+)\s*(?:sec|s)?\s*hold');
    m = rxPosesHold.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!),
      );
    }

    final rxRounds = RegExp(r'(\d+)\s*rounds?\s*(?:of\s+)?(\d+)\s*s\s*work');
    m = rxRounds.firstMatch(s);
    if (m != null) {
      return _SetInfo(
        totalSets: int.parse(m.group(1)!),
        perSetSeconds: int.parse(m.group(2)!),
      );
    }
    return null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  // ── Timer helpers ──────────────────────────────────────────────

  void _startTimer() {
    if (_isRunning) return; // already running — ignore duplicate taps
    if (_remainingSeconds <= 0) return;
    _timer?.cancel(); // always cancel any lingering timer first
    HapticFeedback.mediumImpact();
    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) { timer.cancel(); return; }
      if (_remainingSeconds <= 1) {
        timer.cancel();
        HapticFeedback.heavyImpact();
        setState(() {
          _remainingSeconds = 0;
          _isRunning = false;
        });
        if (!_useFallbackTimer) {
          _onSetTimerComplete();
        }
      } else {
        if (_remainingSeconds <= 4) HapticFeedback.lightImpact();
        setState(() => _remainingSeconds--);
      }
    });
  }

  void _pauseTimer() {
    HapticFeedback.lightImpact();
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    HapticFeedback.lightImpact();
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

  void _onSetTimerComplete() {
    if (_isResting) {
      setState(() {
        _isResting = false;
        _remainingSeconds = _perSetSeconds ?? 0;
      });
      return;
    }

    final nextSet = _currentSet + 1;
    if (nextSet >= _totalSets) {
      HapticFeedback.heavyImpact();
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
      _startTimer();
    }
  }

  void _markRepSetDone() {
    HapticFeedback.mediumImpact();
    final nextSet = _currentSet + 1;
    if (nextSet >= _totalSets) {
      HapticFeedback.heavyImpact();
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
      _startTimer();
    }
  }

  void _resetAllSets() {
    HapticFeedback.lightImpact();
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

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final routine = widget.routine;
    final diffColor = _difficultyColor(routine.difficulty);
    final catColor = _categoryColor(routine.category);
    final localized = localizedRoutine(l, routine.id);
    final displayTitle = localized['title'] ?? routine.title;
    final displayDesc = localized['description'] ?? routine.description;
    final displayForm = localized['form']?.isNotEmpty == true ? localized['form']! : routine.formDescription;
    final displayScience = localized['science']?.isNotEmpty == true ? localized['science']! : routine.scientificBasis;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // ── Top compact bar (stays fixed) ──
            _buildTopBar(displayTitle, diffColor, l),

            // ── Everything scrolls as one unit ──
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ── HERO TIMER ──
                    if (!_useFallbackTimer)
                      _buildHeroTracker(catColor, l)
                    else if (widget.routine.timerSeconds != null && widget.routine.timerSeconds! > 0)
                      _buildHeroFallbackTimer(catColor, l)
                    else
                      _buildSimpleHero(routine, catColor, displayDesc),

                    // ── Details ──
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_useFallbackTimer || (widget.routine.timerSeconds != null && widget.routine.timerSeconds! > 0))
                            _buildShortDescription(displayDesc),

                          // Form description
                          if (displayForm.isNotEmpty)
                            _buildSection(
                              icon: CupertinoIcons.text_badge_checkmark,
                              title: l.howToDoIt,
                              iconColor: AppColors.primary,
                              child: Text(
                                displayForm,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withValues(alpha: 0.85),
                                  height: 1.6,
                                ),
                              ),
                            ),
                          if (displayForm.isNotEmpty) const SizedBox(height: 12),

                          // Muscles
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
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: AppColors.cyan.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColors.cyan.withValues(alpha: 0.30)),
                                    ),
                                    child: Text(
                                      localizedMuscle(l, muscle),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.cyan,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          if (routine.musclesTargeted.isNotEmpty) const SizedBox(height: 12),

                          // Scientific basis
                          if (displayScience.isNotEmpty)
                            _buildSection(
                              icon: CupertinoIcons.lab_flask,
                              title: l.scientificBasis,
                              iconColor: AppColors.lime,
                              child: Text(
                                displayScience,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withValues(alpha: 0.78),
                                  height: 1.55,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Mark Complete Button (stays fixed at bottom) ──
            _buildCompleteButton(l),
          ],
        ),
      ),
    );
  }

  // ── TOP BAR ─────────────────────────────────────────────────────

  Widget _buildTopBar(String title, Color diffColor, AppLocalizations l) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 6, 16, 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        border: Border(
          bottom: BorderSide(color: AppColors.cardBorder),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.white),
            onPressed: () {
              HapticFeedback.lightImpact();
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.3,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: diffColor.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: diffColor.withValues(alpha: 0.4)),
            ),
            child: Text(
              _difficultyLabel(widget.routine.difficulty, l).toUpperCase(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: diffColor,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── HERO TRACKER (the always-visible main control panel) ────

  Widget _buildHeroTracker(Color catColor, AppLocalizations l) {
    final isTimed = _perSetSeconds != null && _perSetSeconds! > 0;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _allSetsComplete
              ? [
                  AppColors.success.withValues(alpha: 0.18),
                  AppColors.success.withValues(alpha: 0.04),
                ]
              : _isResting
                  ? [
                      AppColors.orange.withValues(alpha: 0.16),
                      AppColors.orange.withValues(alpha: 0.04),
                    ]
                  : [
                      catColor.withValues(alpha: 0.18),
                      catColor.withValues(alpha: 0.04),
                    ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: _allSetsComplete
              ? AppColors.success.withValues(alpha: 0.45)
              : _isResting
                  ? AppColors.orange.withValues(alpha: 0.40)
                  : catColor.withValues(alpha: 0.40),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: (_isResting ? AppColors.orange : catColor).withValues(alpha: 0.20),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // ── Status label + set counter ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Status badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.30),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _allSetsComplete
                          ? CupertinoIcons.checkmark_seal_fill
                          : _isResting
                              ? CupertinoIcons.pause_circle_fill
                              : isTimed
                                  ? CupertinoIcons.timer
                                  : CupertinoIcons.flame_fill,
                      color: _allSetsComplete
                          ? AppColors.success
                          : _isResting
                              ? AppColors.orange
                              : catColor,
                      size: 14,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _allSetsComplete
                          ? l.allSetsComplete.toUpperCase()
                          : _isResting
                              ? l.rest.toUpperCase()
                              : isTimed
                                  ? l.setTimer.toUpperCase()
                                  : l.setTracker.toUpperCase(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: _allSetsComplete
                            ? AppColors.success
                            : _isResting
                                ? AppColors.orange
                                : catColor,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              // Set counter
              Text(
                _allSetsComplete
                    ? '$_totalSets / $_totalSets'
                    : '${_currentSet + 1} / $_totalSets',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.white.withValues(alpha: 0.75),
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ── Big number display ──
          if (_allSetsComplete)
            _buildCompleteHero(l)
          else if (_isResting)
            _buildBigNumber(
              value: _formatTime(_remainingSeconds),
              label: l.restBeforeSet('${_currentSet + 1}').toUpperCase(),
              color: AppColors.orange,
            )
          else if (isTimed)
            _buildBigNumber(
              value: _formatTime(_remainingSeconds),
              label: l.perSet.toUpperCase(),
              color: catColor,
            )
          else
            _buildBigNumber(
              value: '${_perSetReps ?? 0}',
              label: l.reps.toUpperCase(),
              color: catColor,
            ),

          const SizedBox(height: 18),

          // ── Set progress dots ──
          _buildSetDots(catColor),

          const SizedBox(height: 18),

          // ── Action buttons ──
          if (!_allSetsComplete) _buildActionButtons(isTimed, catColor, l),
          if (_allSetsComplete) _buildResetButton(l),
        ],
      ),
    );
  }

  Widget _buildBigNumber({
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            final pulse = _isRunning ? 1.0 + (_pulseController.value * 0.03) : 1.0;
            return Transform.scale(scale: pulse, child: child);
          },
          child: Text(
            value,
            style: TextStyle(
              fontSize: 84,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -3,
              height: 1,
              shadows: [
                Shadow(
                  color: color.withValues(alpha: 0.5),
                  blurRadius: 24,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.white.withValues(alpha: 0.65),
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildCompleteHero(AppLocalizations l) {
    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.success.withValues(alpha: 0.20),
            border: Border.all(color: AppColors.success.withValues(alpha: 0.5), width: 2),
            boxShadow: [
              BoxShadow(
                color: AppColors.success.withValues(alpha: 0.4),
                blurRadius: 24,
              ),
            ],
          ),
          child: const Icon(
            CupertinoIcons.checkmark_alt,
            color: AppColors.success,
            size: 56,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          l.allSetsComplete.toUpperCase(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: AppColors.success,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSetDots(Color catColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_totalSets, (i) {
        final isCompleted = i < _currentSet;
        final isCurrent = i == _currentSet && !_allSetsComplete;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isCurrent ? 28 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: isCompleted
                ? AppColors.success
                : isCurrent
                    ? (_isResting ? AppColors.orange : catColor)
                    : Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
            boxShadow: isCurrent
                ? [
                    BoxShadow(
                      color: (_isResting ? AppColors.orange : catColor).withValues(alpha: 0.6),
                      blurRadius: 8,
                    ),
                  ]
                : null,
          ),
        );
      }),
    );
  }

  Widget _buildActionButtons(bool isTimed, Color catColor, AppLocalizations l) {
    if (_isResting) {
      return _bigActionButton(
        icon: CupertinoIcons.forward_fill,
        label: l.skipRest.toUpperCase(),
        color: AppColors.orange,
        onTap: () {
          HapticFeedback.mediumImpact();
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
        children: [
          Expanded(
            flex: 1,
            child: _smallActionButton(
              icon: CupertinoIcons.arrow_counterclockwise,
              color: Colors.white.withValues(alpha: 0.7),
              onTap: _resetTimer,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: _bigActionButton(
              icon: _isRunning ? CupertinoIcons.pause_fill : CupertinoIcons.play_fill,
              label: (_isRunning ? l.pause : l.start).toUpperCase(),
              color: catColor,
              onTap: _isRunning ? _pauseTimer : _startTimer,
            ),
          ),
        ],
      );
    }

    // Rep-based
    return _bigActionButton(
      icon: CupertinoIcons.checkmark_alt,
      label: l.done.toUpperCase(),
      color: AppColors.success,
      onTap: _markRepSetDone,
    );
  }

  Widget _buildResetButton(AppLocalizations l) {
    return _bigActionButton(
      icon: CupertinoIcons.arrow_counterclockwise,
      label: l.restart.toUpperCase(),
      color: Colors.white.withValues(alpha: 0.65),
      onTap: _resetAllSets,
    );
  }

  Widget _bigActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withValues(alpha: 0.75)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.45),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _smallActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
        ),
        child: Center(
          child: Icon(icon, color: color, size: 22),
        ),
      ),
    );
  }

  // ── Hero fallback timer (single countdown — no sets) ──

  Widget _buildHeroFallbackTimer(Color catColor, AppLocalizations l) {
    final totalSeconds = widget.routine.timerSeconds!;
    final isComplete = _remainingSeconds == 0;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isComplete
              ? [AppColors.success.withValues(alpha: 0.18), AppColors.success.withValues(alpha: 0.04)]
              : [catColor.withValues(alpha: 0.18), catColor.withValues(alpha: 0.04)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: (isComplete ? AppColors.success : catColor).withValues(alpha: 0.40),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: (isComplete ? AppColors.success : catColor).withValues(alpha: 0.20),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.30),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(CupertinoIcons.timer, color: catColor, size: 14),
                const SizedBox(width: 6),
                Text(
                  l.builtInTimer.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: catColor,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildBigNumber(
            value: _formatTime(_remainingSeconds),
            label: isComplete ? l.doneExclamation.toUpperCase() : '${(totalSeconds / 60).round()} MIN',
            color: isComplete ? AppColors.success : catColor,
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: _smallActionButton(
                  icon: CupertinoIcons.arrow_counterclockwise,
                  color: Colors.white.withValues(alpha: 0.7),
                  onTap: _resetTimer,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 3,
                child: _bigActionButton(
                  icon: _isRunning ? CupertinoIcons.pause_fill : CupertinoIcons.play_fill,
                  label: (_isRunning ? l.pause : l.start).toUpperCase(),
                  color: catColor,
                  onTap: _isRunning ? _pauseTimer : _startTimer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Simple hero (no timer/sets at all) ──

  Widget _buildSimpleHero(Routine routine, Color catColor, String desc) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [catColor.withValues(alpha: 0.18), catColor.withValues(alpha: 0.04)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: catColor.withValues(alpha: 0.40)),
      ),
      child: Column(
        children: [
          Text(routine.icon, style: const TextStyle(fontSize: 64)),
          const SizedBox(height: 12),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.85),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShortDescription(String desc) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 14, 4, 4),
      child: Text(
        desc,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Colors.white.withValues(alpha: 0.65),
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required Widget child,
    Color? iconColor,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(icon: icon, title: title, iconColor: iconColor),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildCompleteButton(AppLocalizations l) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final isCompleted = widget.routine.completed;
        final isFullyActive = isCompleted || _allSetsComplete || _useFallbackTimer;

        return Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            border: Border(
              top: BorderSide(color: AppColors.primary.withValues(alpha: 0.10)),
            ),
          ),
          child: SafeArea(
            top: false,
            child: GestureDetector(
              onTap: () {
                HapticFeedback.mediumImpact();
                provider.toggleRoutine(widget.routine.id);
                Navigator.of(context).pop();
              },
              child: Opacity(
                opacity: isFullyActive ? 1.0 : 0.55,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: isCompleted ? null : AppColors.gradientPrimary,
                    color: isCompleted ? AppColors.success.withValues(alpha: 0.18) : null,
                    borderRadius: BorderRadius.circular(16),
                    border: isCompleted
                        ? Border.all(color: AppColors.success.withValues(alpha: 0.4))
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
                          fontWeight: FontWeight.w800,
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

}
