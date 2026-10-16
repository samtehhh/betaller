import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';
import '../utils/haptics.dart';
import '../utils/text_case.dart';
import 'tour_keys.dart';

/// One stop on the tour: the bottom-nav tab it lives on, the real widget to
/// spotlight (see [TourKeys]) and the one thing to say about it.
class TourStep {
  final int tab;

  /// Null for a card with nothing to point at (the "what's new" opener).
  final GlobalKey? target;
  final String eyebrow;
  final String title;
  final String desc;
  final IconData icon;
  final Color color;

  /// Runs before the target is measured, for targets inside My Plan's own
  /// Today / Discipline / Nutrition tabs, which the bottom-nav switch does
  /// not reach.
  final VoidCallback? beforeMeasure;

  const TourStep({
    required this.tab,
    required this.target,
    required this.eyebrow,
    required this.title,
    required this.desc,
    required this.icon,
    required this.color,
    this.beforeMeasure,
  });
}

/// The v3 tour: six stops that cover the daily loop, from where you are
/// going (the potential) to what you do today (plan, program, food) to how
/// you see it working (curve, score). [whatsNew] opens with a card for
/// people who updated from an older version.
///
/// [goToSubTab] switches My Plan's in-screen tabs (0 Today, 1 Discipline,
/// 2 Nutrition).
List<TourStep> tourStepsFor(
  AppLocalizations l, {
  required ValueChanged<int> goToSubTab,
  bool whatsNew = false,
  bool premium = false,
}) {
  final lang = l.localeName;
  String up(String s) => upperFor(s, lang);
  String plan(String tab) => up('${l.navRoutines} · $tab');
  return [
    if (whatsNew)
      TourStep(
        tab: 0,
        target: null,
        eyebrow: up(l.tv3NewEyebrow),
        title: l.tv3NewTitle,
        desc: l.tv3NewDesc,
        icon: CupertinoIcons.sparkles,
        color: AppColors.primaryBright,
      ),
    TourStep(
      tab: 0,
      target: TourKeys.homePotential,
      eyebrow: up(l.navHome),
      title: l.tv3PotentialTitle,
      desc: l.tv3PotentialDesc,
      icon: CupertinoIcons.arrow_up_right_circle_fill,
      color: AppColors.lime,
    ),
    TourStep(
      tab: 1,
      target: TourKeys.planTodayHero,
      eyebrow: plan(l.disciplineToday),
      title: l.tv3TodayTitle,
      desc: l.tv3TodayDesc(l.plStartWorkout),
      icon: CupertinoIcons.play_circle_fill,
      color: AppColors.primaryBright,
      beforeMeasure: () => goToSubTab(0),
    ),
    TourStep(
      tab: 1,
      // Free users see the program's day card blurred; the ring is what
      // they can read.
      target: premium ? TourKeys.planProgramDay : TourKeys.planProgramHeader,
      eyebrow: plan(l.disciplineTitle),
      title: l.tv3ProgramTitle,
      desc: l.tv3ProgramDesc,
      icon: CupertinoIcons.flag_fill,
      color: AppColors.warning,
      beforeMeasure: () => goToSubTab(1),
    ),
    TourStep(
      tab: 1,
      target: TourKeys.planNutritionTargets,
      eyebrow: plan(l.nutrition),
      title: l.tv3NutritionTitle,
      desc: l.tv3NutritionDesc,
      icon: CupertinoIcons.flame_fill,
      color: AppColors.orange,
      beforeMeasure: () => goToSubTab(2),
    ),
    TourStep(
      tab: 2,
      target: TourKeys.progressChart,
      eyebrow: up(l.navProgress),
      title: l.tv3ChartTitle,
      desc: l.tv3ChartDesc,
      icon: CupertinoIcons.graph_circle_fill,
      color: AppColors.lime,
    ),
    TourStep(
      tab: 3,
      target: TourKeys.analysisScore,
      eyebrow: up(l.navAnalysis),
      title: l.tv3ScoreTitle,
      desc: l.tv3ScoreDesc,
      icon: CupertinoIcons.chart_bar_alt_fill,
      color: AppColors.primaryBright,
    ),
  ];
}

const _scrimColor = Color(0xFF07050F);
const _scrimAlpha = 0.84;

/// Sits on top of [MainScreen]'s tab stack. Dims everything but the current
/// target, asks the host to switch tabs when a step lives on another one,
/// and glides the spotlight and the coach card from stop to stop.
class FeatureTourOverlay extends StatefulWidget {
  final List<TourStep> steps;
  final int currentTab;
  final ValueChanged<int> onRequestTab;

  /// Called once, when the last step is done or the tour is skipped.
  final VoidCallback onFinished;
  final String nextLabel;
  final String finishLabel;
  final String skipLabel;

  /// Button label on a card without a target (the "what's new" opener).
  final String? introLabel;

  const FeatureTourOverlay({
    super.key,
    required this.steps,
    required this.currentTab,
    required this.onRequestTab,
    required this.onFinished,
    required this.nextLabel,
    required this.finishLabel,
    required this.skipLabel,
    this.introLabel,
  });

  @override
  State<FeatureTourOverlay> createState() => FeatureTourOverlayState();
}

@visibleForTesting
class FeatureTourOverlayState extends State<FeatureTourOverlay>
    with TickerProviderStateMixin {
  /// The step on screen. Only changes once the next target is measured, so
  /// the card, the spotlight and the text always move together.
  int _index = 0;
  Rect? _rect;
  bool _busy = true;
  bool _done = false;

  /// False until the first step is measured; the card waits for it.
  bool _ready = false;

  late final AnimationController _enter = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 380),
  );
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  );

  int get index => _index;
  bool get busy => _busy;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      final reduce = MediaQuery.of(context).disableAnimations;
      if (reduce) {
        _enter.value = 1;
      } else {
        _enter.forward();
        _pulse.repeat();
      }
      Haptics.impact();
      await _show(0);
    });
  }

  @override
  void dispose() {
    _enter.dispose();
    _pulse.dispose();
    super.dispose();
  }

  bool get _reduce => MediaQuery.of(context).disableAnimations;

  Duration _d(int ms) => _reduce ? Duration.zero : Duration(milliseconds: ms);

  /// Brings step [i] on screen: switches tabs, scrolls the target into view,
  /// measures it, then shows card and spotlight in one move. A target that
  /// is not on screen (a conditional card) is skipped.
  Future<void> _show(int i) async {
    while (i < widget.steps.length) {
      if (!mounted) return;
      final rect = await _locate(widget.steps[i]);
      if (!mounted) return;
      if (rect != null || widget.steps[i].target == null) {
        setState(() {
          _index = i;
          _rect = rect;
          _busy = false;
          _ready = true;
        });
        return;
      }
      i++;
    }
    _finish();
  }

  Future<Rect?> _locate(TourStep step) async {
    if (widget.currentTab != step.tab) {
      widget.onRequestTab(step.tab);
      // MainScreen's setState and the new tab's first frame.
      await Future.delayed(const Duration(milliseconds: 240));
      if (!mounted) return null;
    }
    if (step.beforeMeasure != null) {
      step.beforeMeasure!();
      // The in-screen TabBarView slides to the tab.
      await Future.delayed(const Duration(milliseconds: 360));
      if (!mounted) return null;
    }
    final target = step.target;
    if (target == null) return null;
    final ctx = target.currentContext;
    if (ctx == null || !ctx.mounted) return null;
    try {
      await Scrollable.ensureVisible(
        ctx,
        duration: _d(420),
        curve: Curves.easeInOutCubic,
        // Upper part of the screen, so the card fits underneath.
        alignment: 0.12,
      );
    } catch (_) {
      // Not inside a Scrollable: measured where it is.
    }
    // Measure only after the scroll has been laid out: before that frame,
    // localToGlobal still reports the old position.
    await Future.delayed(const Duration(milliseconds: 40));
    await WidgetsBinding.instance.endOfFrame;
    if (!mounted || !ctx.mounted) return null;
    final box = ctx.findRenderObject();
    if (box is! RenderBox || !box.hasSize || !box.attached) return null;
    return (box.localToGlobal(Offset.zero) & box.size).inflate(6);
  }

  void _next() {
    if (_busy) return;
    final next = _index + 1;
    if (next >= widget.steps.length) {
      Haptics.success();
      _finish();
      return;
    }
    Haptics.select();
    setState(() => _busy = true);
    _show(next);
  }

  void _skip() {
    Haptics.tap();
    _finish();
  }

  Future<void> _finish() async {
    if (_done) return;
    _done = true;
    _pulse.stop();
    if (!_reduce && mounted) await _enter.reverse();
    widget.onFinished();
  }

  @override
  Widget build(BuildContext context) {
    final step = widget.steps[_index];
    final rect = _rect;
    final isLast = _index == widget.steps.length - 1;
    final media = MediaQuery.of(context);

    final label = step.target == null && widget.introLabel != null
        ? widget.introLabel!
        : isLast
        ? widget.finishLabel
        : widget.nextLabel;

    return Positioned.fill(
      child: FadeTransition(
        opacity: CurvedAnimation(parent: _enter, curve: Curves.easeOutCubic),
        child: Stack(
          children: [
            // Opaque on purpose, over the whole overlay including the hole:
            // the cutout is paint only, and a tap on the card being shown
            // must never reach the real card underneath.
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: _AnimatedSpotlight(
                  rect: rect ?? _collapsed(media.size),
                  color: step.color,
                  pulse: _pulse,
                  duration: _d(520),
                ),
              ),
            ),
            if (_ready)
              _CoachCard(
                step: step,
                index: _index,
                total: widget.steps.length,
                target: rect,
                buttonLabel: label,
                skipLabel: isLast ? null : widget.skipLabel,
                onNext: _next,
                onSkip: _skip,
                duration: _d(520),
              ),
          ],
        ),
      ),
    );
  }

  /// A spotlight with nothing to show shrinks to a point in the middle of
  /// the screen, so the next real target grows out of it.
  Rect _collapsed(Size size) =>
      Rect.fromCenter(center: size.center(Offset.zero), width: 0, height: 0);
}

/// Tweens the cutout from wherever it was to wherever it needs to be.
class _AnimatedSpotlight extends ImplicitlyAnimatedWidget {
  final Rect rect;
  final Color color;
  final Animation<double> pulse;

  const _AnimatedSpotlight({
    required this.rect,
    required this.color,
    required this.pulse,
    required super.duration,
  }) : super(curve: Curves.easeInOutCubic);

  @override
  AnimatedWidgetBaseState<_AnimatedSpotlight> createState() =>
      _AnimatedSpotlightState();
}

class _AnimatedSpotlightState
    extends AnimatedWidgetBaseState<_AnimatedSpotlight> {
  RectTween? _rect;
  ColorTween? _color;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rect =
        visitor(_rect, widget.rect, (v) => RectTween(begin: v as Rect))
            as RectTween?;
    _color =
        visitor(_color, widget.color, (v) => ColorTween(begin: v as Color))
            as ColorTween?;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.pulse,
      builder: (context, _) => CustomPaint(
        size: Size.infinite,
        painter: _SpotlightPainter(
          rect: _rect!.evaluate(animation)!,
          color: _color!.evaluate(animation)!,
          pulse: widget.pulse.value,
        ),
      ),
    );
  }
}

class _SpotlightPainter extends CustomPainter {
  final Rect rect;
  final Color color;

  /// 0..1, one breath of the outer ring. Stays 0 with reduced motion.
  final double pulse;

  const _SpotlightPainter({
    required this.rect,
    required this.color,
    required this.pulse,
  });

  static const _radius = 24.0;

  @override
  void paint(Canvas canvas, Size size) {
    final r = math.min(_radius, math.min(rect.width, rect.height) / 2);
    final hole = RRect.fromRectAndRadius(rect, Radius.circular(r));
    final scrim = Path.combine(
      PathOperation.difference,
      Path()..addRect(Offset.zero & size),
      Path()..addRRect(hole),
    );
    canvas.drawPath(
      scrim,
      Paint()..color = _scrimColor.withValues(alpha: _scrimAlpha),
    );
    if (rect.width < 2 || rect.height < 2) return;

    // A soft glow, the ring, and one ring breathing outward.
    canvas.drawRRect(
      hole,
      Paint()
        ..color = color.withValues(alpha: 0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );
    canvas.drawRRect(
      hole,
      Paint()
        ..color = color.withValues(alpha: 0.95)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
    if (pulse > 0) {
      final grow = 3 + 9 * Curves.easeOut.transform(pulse);
      canvas.drawRRect(
        hole.inflate(grow),
        Paint()
          ..color = color.withValues(alpha: 0.45 * (1 - pulse))
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _SpotlightPainter old) =>
      old.rect != rect || old.color != color || old.pulse != pulse;
}

/// The glass coach card: where you are, one title, one line, progress, and
/// Skip / Next. Parked under the target, or over it when there is no room,
/// and centred on a step without a target.
class _CoachCard extends StatelessWidget {
  final TourStep step;
  final int index;
  final int total;
  final Rect? target;
  final String buttonLabel;

  /// Null on the last step.
  final String? skipLabel;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final Duration duration;

  /// Close to the real height; only used to decide where the card fits.
  static const _estimatedHeight = 232.0;

  const _CoachCard({
    required this.step,
    required this.index,
    required this.total,
    required this.target,
    required this.buttonLabel,
    required this.skipLabel,
    required this.onNext,
    required this.onSkip,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final h = media.size.height;
    final usableTop = media.padding.top + 12;
    // Clear of the floating tab bar.
    final usableBottom = h - media.padding.bottom - 92;
    final maxTop = math.max(usableTop, usableBottom - _estimatedHeight);

    final double top;
    final rect = target;
    if (rect == null) {
      top = ((h - _estimatedHeight) / 2).clamp(usableTop, maxTop);
    } else {
      final below = rect.bottom + 16;
      final above = rect.top - 16 - _estimatedHeight;
      final fitsBelow = below + _estimatedHeight <= usableBottom;
      final fitsAbove = above >= usableTop;
      // Too tall for either: the end of the screen where the card covers
      // the least of it.
      double overlap(double t) => math.max(
        0,
        math.min(rect.bottom, t + _estimatedHeight) - math.max(rect.top, t),
      );
      final desired = fitsBelow
          ? below
          : fitsAbove
          ? above
          : overlap(usableTop) <= overlap(maxTop)
          ? usableTop
          : maxTop;
      top = desired.clamp(usableTop, maxTop);
    }

    return AnimatedPositioned(
      duration: duration,
      curve: Curves.easeInOutCubic,
      left: 16,
      right: 16,
      top: top,
      child: AnimatedSwitcher(
        duration: duration,
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        layoutBuilder: (current, previous) => Stack(
          alignment: Alignment.topCenter,
          children: [...previous, ?current],
        ),
        transitionBuilder: (child, anim) => FadeTransition(
          opacity: anim,
          child: SlideTransition(
            position: Tween(
              begin: const Offset(0.08, 0),
              end: Offset.zero,
            ).animate(anim),
            child: child,
          ),
        ),
        child: KeyedSubtree(key: ValueKey(index), child: _card(context)),
      ),
    );
  }

  Widget _card(BuildContext context) {
    final color = step.color;
    return Semantics(
      container: true,
      label: '${step.eyebrow}. ${step.title}',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
          child: Container(
            padding: const EdgeInsets.fromLTRB(18, 16, 16, 14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1C1733).withValues(alpha: 0.82),
                  const Color(0xFF0E0B1C).withValues(alpha: 0.90),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color.withValues(alpha: 0.16),
                        border: Border.all(
                          color: color.withValues(alpha: 0.45),
                        ),
                      ),
                      child: Icon(step.icon, size: 15, color: color),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        step.eyebrow,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.0,
                          color: color.withValues(alpha: 0.95),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${index + 1}/$total',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.40),
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  step.title,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.6,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  step.desc,
                  style: TextStyle(
                    fontSize: 14.5,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withValues(alpha: 0.68),
                  ),
                ),
                const SizedBox(height: 14),
                _Progress(index: index, total: total, color: color),
                const SizedBox(height: 12),
                Row(
                  children: [
                    if (skipLabel != null)
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: onSkip,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 12,
                          ),
                          child: Text(
                            skipLabel!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(alpha: 0.55),
                            ),
                          ),
                        ),
                      ),
                    const Spacer(),
                    _NextButton(label: buttonLabel, onTap: onNext),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// One segment per step; done ones filled, the current one in its colour.
class _Progress extends StatelessWidget {
  final int index;
  final int total;
  final Color color;
  const _Progress({
    required this.index,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < total; i++) ...[
          if (i > 0) const SizedBox(width: 5),
          Expanded(
            flex: i == index ? 3 : 2,
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: i == index
                    ? color
                    : i < index
                    ? Colors.white.withValues(alpha: 0.55)
                    : Colors.white.withValues(alpha: 0.12),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NextButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        constraints: const BoxConstraints(minWidth: 120),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0E0B1C),
                  letterSpacing: -0.2,
                ),
              ),
            ),
            const SizedBox(width: 6),
            const Icon(
              CupertinoIcons.arrow_right,
              size: 16,
              color: Color(0xFF0E0B1C),
            ),
          ],
        ),
      ),
    );
  }
}
