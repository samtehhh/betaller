import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';

/// The three steps of getting started with BeTaller.
///
/// [JourneyStep.data] is the onboarding questionnaire, [JourneyStep.tour] is
/// the guided walkthrough of every feature, and [JourneyStep.usage] is the
/// user running their own routine. Progress is stored as the number of
/// completed steps, so 0 means nothing done and 3 means the journey is over.
enum JourneyStep { data, tour, usage }

const int kJourneyStepCount = 3;

class JourneyStepInfo {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  const JourneyStepInfo({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}

List<JourneyStepInfo> journeySteps(AppLocalizations l) => [
      JourneyStepInfo(
        title: l.journeyStep1Title,
        description: l.journeyStep1Desc,
        icon: CupertinoIconsCompat.personCrop,
        color: AppColors.primary,
      ),
      JourneyStepInfo(
        title: l.journeyStep2Title,
        description: l.journeyStep2Desc,
        icon: CupertinoIconsCompat.sparkles,
        color: AppColors.cyan,
      ),
      JourneyStepInfo(
        title: l.journeyStep3Title,
        description: l.journeyStep3Desc,
        icon: CupertinoIconsCompat.flame,
        color: AppColors.lime,
      ),
    ];

/// Material icons that read the same as their Cupertino cousins, kept in one
/// place so the three steps stay visually consistent wherever they appear.
class CupertinoIconsCompat {
  static const IconData personCrop = Icons.assignment_ind_rounded;
  static const IconData sparkles = Icons.auto_awesome_rounded;
  static const IconData flame = Icons.local_fire_department_rounded;
}

// ═════════════════════════════════════════════════════════════════════════════
//  Full stepper — used on the getting-started screens
// ═════════════════════════════════════════════════════════════════════════════

class JourneySteps extends StatefulWidget {
  /// Number of steps already completed (0-3).
  final int completed;

  /// Where the animation starts from. Pass a lower number than [completed] to
  /// play the "this step just finished" animation on entry.
  final int? animateFrom;

  /// Called once the completion animation has settled.
  final VoidCallback? onCompletionShown;

  const JourneySteps({
    super.key,
    required this.completed,
    this.animateFrom,
    this.onCompletionShown,
  });

  @override
  State<JourneySteps> createState() => _JourneyStepsState();
}

class _JourneyStepsState extends State<JourneySteps>
    with TickerProviderStateMixin {
  late final AnimationController _entry;
  late final AnimationController _fill;
  late final AnimationController _pulse;
  late Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _entry = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fill = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();

    final from = (widget.animateFrom ?? widget.completed).toDouble();
    _progress = Tween<double>(begin: from, end: widget.completed.toDouble())
        .animate(CurvedAnimation(parent: _fill, curve: Curves.easeInOutCubic));

    _entry.forward();
    if (from != widget.completed) {
      Future.delayed(const Duration(milliseconds: 620), () {
        if (!mounted) return;
        _fill.forward().whenComplete(() {
          HapticFeedback.mediumImpact();
          widget.onCompletionShown?.call();
        });
      });
    } else {
      _fill.value = 1;
    }
  }

  @override
  void didUpdateWidget(covariant JourneySteps old) {
    super.didUpdateWidget(old);
    if (old.completed != widget.completed) {
      _progress = Tween<double>(
        begin: old.completed.toDouble(),
        end: widget.completed.toDouble(),
      ).animate(CurvedAnimation(parent: _fill, curve: Curves.easeInOutCubic));
      _fill
        ..reset()
        ..forward().whenComplete(() {
          HapticFeedback.mediumImpact();
          widget.onCompletionShown?.call();
        });
    }
  }

  @override
  void dispose() {
    _entry.dispose();
    _fill.dispose();
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final steps = journeySteps(l);

    return AnimatedBuilder(
      animation: Listenable.merge([_entry, _fill, _pulse]),
      builder: (context, _) {
        final progress = _progress.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(steps.length, (i) {
            final t = Curves.easeOutCubic.transform(
              ((_entry.value - i * 0.16) / 0.55).clamp(0.0, 1.0),
            );
            return Opacity(
              opacity: t,
              child: Transform.translate(
                offset: Offset(0, 22 * (1 - t)),
                child: _StepRow(
                  index: i,
                  info: steps[i],
                  progress: progress,
                  pulse: _pulse.value,
                  isLast: i == steps.length - 1,
                  label: _labelFor(i, progress, l),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  String? _labelFor(int i, double progress, AppLocalizations l) {
    if (progress >= i + 1) return l.journeyDone;
    if (progress.floor() == i) return l.journeyNow;
    return null;
  }
}

class _StepRow extends StatelessWidget {
  final int index;
  final JourneyStepInfo info;
  final double progress;
  final double pulse;
  final bool isLast;
  final String? label;

  static const double _railWidth = 52;
  static const double _circle = 46;
  static const double _gapBelow = 26;

  const _StepRow({
    required this.index,
    required this.info,
    required this.progress,
    required this.pulse,
    required this.isLast,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // 0 → untouched, 1 → fully completed
    final fill = (progress - index).clamp(0.0, 1.0);
    final done = fill >= 1;
    final active = !done && progress.floor() == index;
    final color = info.color;
    final halo = math.sin(pulse * math.pi * 2).abs();

    final circleColor = done
        ? color
        : active
            ? color.withValues(alpha: 0.16)
            : Colors.white.withValues(alpha: 0.05);
    final borderColor = done
        ? color
        : active
            ? color.withValues(alpha: 0.75)
            : Colors.white.withValues(alpha: 0.10);

    // A Stack keeps the connector between the circles without asking the row
    // for its intrinsic height, which a scrollable parent cannot provide.
    return Stack(
      children: [
        if (!isLast)
          Positioned(
            left: _railWidth / 2 - 1.5,
            top: _circle + 6,
            bottom: 6,
            width: 3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  heightFactor: fill,
                  widthFactor: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: _railWidth,
              height: _circle,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (active)
                    Container(
                      width: _circle + 10 * halo,
                      height: _circle + 10 * halo,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color.withValues(alpha: 0.10 * (1 - halo)),
                      ),
                    ),
                  Container(
                    width: _circle,
                    height: _circle,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: circleColor,
                      border: Border.all(color: borderColor, width: done ? 0 : 1.6),
                      boxShadow: done || active
                          ? [
                              BoxShadow(
                                color: color.withValues(alpha: done ? 0.45 : 0.22),
                                blurRadius: 18,
                              )
                            ]
                          : null,
                    ),
                    child: Center(
                      child: done
                          ? Transform.scale(
                              // pops in as the step lands
                              scale: 0.6 +
                                  0.4 *
                                      Curves.easeOutBack.transform(
                                        ((fill - 0.55) / 0.45).clamp(0.0, 1.0),
                                      ),
                              child: const Icon(Icons.check_rounded,
                                  size: 24, color: Colors.white),
                            )
                          : Icon(
                              info.icon,
                              size: 21,
                              color: active
                                  ? color
                                  : Colors.white.withValues(alpha: 0.35),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 14, top: 4, bottom: isLast ? 0 : _gapBelow),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            info.title,
                            style: TextStyle(
                              fontSize: 16.5,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.3,
                              color: done || active
                                  ? Colors.white
                                  : Colors.white.withValues(alpha: 0.55),
                            ),
                          ),
                        ),
                        if (label != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: done ? 0.18 : 0.14),
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(color: color.withValues(alpha: 0.35)),
                            ),
                            child: Text(
                              label!,
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.8,
                                color: color,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      info.description,
                      style: TextStyle(
                        fontSize: 13.5,
                        height: 1.45,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                            .withValues(alpha: done || active ? 0.58 : 0.38),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Compact strip — used on the home screen while the journey is unfinished
// ═════════════════════════════════════════════════════════════════════════════

class JourneyStrip extends StatelessWidget {
  final int completed;
  final VoidCallback? onTap;
  const JourneyStrip({super.key, required this.completed, this.onTap});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final steps = journeySteps(l);
    final current = completed.clamp(0, kJourneyStepCount - 1);
    final info = steps[current];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: info.color.withValues(alpha: 0.22)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(info.icon, size: 16, color: info.color),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    info.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '$completed/$kJourneyStepCount',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: info.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: List.generate(kJourneyStepCount, (i) {
                final done = i < completed;
                final active = i == completed;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: i == kJourneyStepCount - 1 ? 0 : 6),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 5,
                      decoration: BoxDecoration(
                        color: done
                            ? steps[i].color
                            : active
                                ? steps[i].color.withValues(alpha: 0.35)
                                : Colors.white.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
