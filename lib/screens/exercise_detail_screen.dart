import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/routine.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final Routine routine;

  const ExerciseDetailScreen({super.key, required this.routine});

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  // Timer state
  late int _remainingSeconds;
  Timer? _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.routine.timerSeconds ?? 0;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
    setState(() {
      _remainingSeconds = widget.routine.timerSeconds ?? 0;
      _isRunning = false;
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

  String _difficultyLabel(String difficulty) {
    switch (difficulty) {
      case 'beginner':
        return 'Beginner';
      case 'intermediate':
        return 'Intermediate';
      case 'advanced':
        return 'Advanced';
      default:
        return difficulty;
    }
  }

  Color _categoryColor(String category) {
    final catInfo = categoryInfo[category];
    return catInfo?['color'] as Color? ?? AppColors.primary;
  }

  String _categoryLabel(String category) {
    final catInfo = categoryInfo[category];
    return catInfo?['title'] as String? ?? category;
  }

  @override
  Widget build(BuildContext context) {
    final routine = widget.routine;
    final diffColor = _difficultyColor(routine.difficulty);
    final catColor = _categoryColor(routine.category);

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
          routine.title,
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
              _difficultyLabel(routine.difficulty),
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
                              routine.duration,
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
                          routine.description,
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
                      title: 'How to Do It',
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
                      title: 'Muscles & Bones Targeted',
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
                      title: 'Scientific Basis',
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

                  // ── Built-in Timer ───────────────────────
                  if (widget.routine.timerSeconds != null &&
                      widget.routine.timerSeconds! > 0)
                    _buildTimerSection(),
                ],
              ),
            ),
          ),

          // ── Mark Complete Button ──────────────────
          _buildCompleteButton(),
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

  Widget _buildTimerSection() {
    final totalSeconds = widget.routine.timerSeconds!;
    final progress = totalSeconds > 0 ? _remainingSeconds / totalSeconds : 0.0;

    return GlassCard(
      child: Column(
        children: [
          const SectionHeader(
              icon: CupertinoIcons.timer, title: 'Built-in Timer'),
          const SizedBox(height: 20),
          // Circular timer
          SizedBox(
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
                    color: AppColors.primary.withValues(alpha: 0.12),
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
                    color: _remainingSeconds == 0
                        ? AppColors.success
                        : AppColors.primary,
                    backgroundColor: Colors.transparent,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                // Time text
                Column(
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
                        'Done!',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.success,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Control buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Reset
              _timerButton(
                icon: CupertinoIcons.arrow_counterclockwise,
                label: 'Reset',
                color: Colors.white.withValues(alpha: 0.6),
                onTap: _resetTimer,
              ),
              const SizedBox(width: 20),
              // Start / Pause
              _timerButton(
                icon: _isRunning
                    ? CupertinoIcons.pause_fill
                    : CupertinoIcons.play_fill,
                label: _isRunning ? 'Pause' : 'Start',
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

  Widget _buildCompleteButton() {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final isCompleted = widget.routine.completed;
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
                      isCompleted ? 'Mark Incomplete' : 'Mark Complete',
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
