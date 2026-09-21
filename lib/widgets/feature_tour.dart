import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';
import 'tour_keys.dart';

/// One stop on the walkthrough: which bottom-nav tab it lives on, the real
/// widget to spotlight (see [TourKeys]), and what to say about it.
class TourStep {
  final int tab;
  final GlobalKey target;
  final String title;
  final String desc;
  final Color color;

  /// Run right before the target is measured — e.g. switching a screen's
  /// own internal tab (My Plan's Discipline/Nutrition tabs sit inside a
  /// second, in-screen [TabController] the outer bottom-nav tab switch
  /// never touches) so the target is actually on screen by the time the
  /// tour tries to find it.
  final VoidCallback? beforeMeasure;

  const TourStep({
    required this.tab,
    required this.target,
    required this.title,
    required this.desc,
    required this.color,
    this.beforeMeasure,
  });
}

/// The walkthrough, stop by stop — every target is a real widget already on
/// screen, so this never drifts out of sync with what the app looks like.
///
/// [goToProgramTab] and [goToNutritionTab] switch My Plan's own in-screen
/// tabs; the walkthrough only controls the bottom-nav tab on its own.
List<TourStep> tourStepsFor(
  AppLocalizations l, {
  required VoidCallback goToTrainTab,
  required VoidCallback goToProgramTab,
  required VoidCallback goToNutritionTab,
}) => [
  // ── Home ───────────────────────────────────────────────────────────
  TourStep(
    tab: 0,
    target: TourKeys.homeStreak,
    title: l.tourHomeStreakTitle,
    desc: l.tourHomeStreakDesc,
    color: AppColors.orange,
  ),
  TourStep(
    tab: 0,
    target: TourKeys.homeXp,
    title: l.tourHomeXpTitle,
    desc: l.tourHomeXpDesc,
    color: AppColors.cyan,
  ),
  TourStep(
    tab: 0,
    target: TourKeys.homeGoals,
    title: l.tourHomeGoalsTitle,
    desc: l.tourHomeGoalsDesc,
    color: AppColors.primary,
  ),
  TourStep(
    tab: 0,
    target: TourKeys.homeGoalsRoutines,
    title: l.tourHomeGoalsRoutinesTitle,
    desc: l.tourHomeGoalsRoutinesDesc,
    color: AppColors.primary,
  ),
  TourStep(
    tab: 0,
    target: TourKeys.homeGoalsChallenges,
    title: l.tourHomeGoalsChallengesTitle,
    desc: l.tourHomeGoalsChallengesDesc,
    color: AppColors.warning,
  ),
  TourStep(
    tab: 0,
    target: TourKeys.homeGoalsWater,
    title: l.tourHomeGoalsWaterTitle,
    desc: l.tourHomeGoalsWaterDesc,
    color: AppColors.water,
  ),
  TourStep(
    tab: 0,
    target: TourKeys.homeTrack,
    title: l.tourHomeTrackTitle,
    desc: l.tourHomeTrackDesc,
    color: AppColors.water,
  ),
  TourStep(
    tab: 0,
    target: TourKeys.homeReminder,
    title: l.tourHomeReminderTitle,
    desc: l.tourHomeReminderDesc,
    color: AppColors.sleep,
  ),
  TourStep(
    tab: 0,
    target: TourKeys.homeChallenges,
    title: l.tourHomeChallengesTitle,
    desc: l.tourHomeChallengesDesc,
    color: AppColors.warning,
  ),
  TourStep(
    tab: 0,
    target: TourKeys.homeGrowth,
    title: l.tourHomeGrowthTitle,
    desc: l.tourHomeGrowthDesc,
    color: AppColors.lime,
  ),
  TourStep(
    tab: 0,
    target: TourKeys.homeExplore,
    title: l.tourHomeExploreTitle,
    desc: l.tourHomeExploreDesc,
    color: AppColors.primary,
  ),

  // ── My Plan ──────────────────────────────────────────────────────────
  TourStep(
    tab: 1,
    target: TourKeys.planTabs,
    title: l.tourPlanTabsTitle,
    desc: l.tourPlanTabsDesc,
    color: AppColors.warning,
    beforeMeasure: goToTrainTab,
  ),
  TourStep(
    tab: 1,
    target: TourKeys.planLevel,
    title: l.tourPlanLevelTitle,
    desc: l.tourPlanLevelDesc,
    color: AppColors.warning,
    beforeMeasure: goToTrainTab,
  ),
  TourStep(
    tab: 1,
    target: TourKeys.planToday,
    title: l.tourPlanTodayTitle,
    desc: l.tourPlanTodayDesc,
    color: AppColors.primary,
    beforeMeasure: goToTrainTab,
  ),
  TourStep(
    tab: 1,
    target: TourKeys.planTodayList,
    title: l.tourPlanTodayListTitle,
    desc: l.tourPlanTodayListDesc,
    color: AppColors.primary,
    beforeMeasure: goToTrainTab,
  ),
  TourStep(
    tab: 1,
    target: TourKeys.planWeekGoals,
    title: l.tourPlanWeekGoalsTitle,
    desc: l.tourPlanWeekGoalsDesc,
    color: AppColors.cyan,
    beforeMeasure: goToTrainTab,
  ),
  TourStep(
    tab: 1,
    target: TourKeys.planMonthGoals,
    title: l.tourPlanMonthGoalsTitle,
    desc: l.tourPlanMonthGoalsDesc,
    color: AppColors.pink,
    beforeMeasure: goToTrainTab,
  ),
  TourStep(
    tab: 1,
    target: TourKeys.planProgramHeader,
    title: l.tourPlanProgramHeaderTitle,
    desc: l.tourPlanProgramHeaderDesc,
    color: AppColors.orange,
    beforeMeasure: goToProgramTab,
  ),
  TourStep(
    tab: 1,
    target: TourKeys.planProgramLevels,
    title: l.tourPlanProgramLevelsTitle,
    desc: l.tourPlanProgramLevelsDesc,
    color: AppColors.orange,
    beforeMeasure: goToProgramTab,
  ),
  TourStep(
    tab: 1,
    target: TourKeys.planNutritionHeader,
    title: l.tourPlanNutritionHeaderTitle,
    desc: l.tourPlanNutritionHeaderDesc,
    color: AppColors.nutritionColor,
    beforeMeasure: goToNutritionTab,
  ),
  TourStep(
    tab: 1,
    target: TourKeys.planNutritionFirst,
    title: l.tourPlanNutritionFirstTitle,
    desc: l.tourPlanNutritionFirstDesc,
    color: AppColors.nutritionColor,
    beforeMeasure: goToNutritionTab,
  ),

  // ── Progress ─────────────────────────────────────────────────────────
  TourStep(
    tab: 2,
    target: TourKeys.progressHeight,
    title: l.tourProgressHeightTitle,
    desc: l.tourProgressHeightDesc,
    color: AppColors.lime,
  ),
  TourStep(
    tab: 2,
    target: TourKeys.progressChart,
    title: l.tourProgressChartTitle,
    desc: l.tourProgressChartDesc,
    color: AppColors.lime,
  ),
  TourStep(
    tab: 2,
    target: TourKeys.progressPhotos,
    title: l.tourProgressPhotosTitle,
    desc: l.tourProgressPhotosDesc,
    color: AppColors.cyan,
  ),
  TourStep(
    tab: 2,
    target: TourKeys.progressPosture,
    title: l.tourProgressPostureTitle,
    desc: l.tourProgressPostureDesc,
    color: AppColors.lime,
  ),
  TourStep(
    tab: 2,
    target: TourKeys.progressReport,
    title: l.tourProgressReportTitle,
    desc: l.tourProgressReportDesc,
    color: AppColors.orange,
  ),
  TourStep(
    tab: 2,
    target: TourKeys.progressHistory,
    title: l.tourProgressHistoryTitle,
    desc: l.tourProgressHistoryDesc,
    color: AppColors.primaryLight,
  ),

  // ── Analysis ─────────────────────────────────────────────────────────
  TourStep(
    tab: 3,
    target: TourKeys.analysisScore,
    title: l.tourAnalysisScoreTitle,
    desc: l.tourAnalysisScoreDesc,
    color: AppColors.primaryBright,
  ),
  TourStep(
    tab: 3,
    target: TourKeys.analysisRadar,
    title: l.tourAnalysisRadarTitle,
    desc: l.tourAnalysisRadarDesc,
    color: AppColors.primary,
  ),
  TourStep(
    tab: 3,
    target: TourKeys.analysisPrediction,
    title: l.tourAnalysisPredictionTitle,
    desc: l.tourAnalysisPredictionDesc,
    color: AppColors.cyan,
  ),
  TourStep(
    tab: 3,
    target: TourKeys.analysisPeer,
    title: l.tourAnalysisPeerTitle,
    desc: l.tourAnalysisPeerDesc,
    color: AppColors.warning,
  ),
  TourStep(
    tab: 3,
    target: TourKeys.analysisDailyNeeds,
    title: l.tourAnalysisDailyNeedsTitle,
    desc: l.tourAnalysisDailyNeedsDesc,
    color: AppColors.lime,
  ),
];

/// Lives on top of [MainScreen]'s own tab stack. Dims everything but the
/// current target, asks the host to switch tabs when a step lives on a
/// different one, and steps itself out of the way once it's done.
class FeatureTourOverlay extends StatefulWidget {
  final List<TourStep> steps;
  final int currentTab;
  final ValueChanged<int> onRequestTab;
  final VoidCallback onFinished;
  final String nextLabel;
  final String finishLabel;
  final String skipLabel;

  const FeatureTourOverlay({
    super.key,
    required this.steps,
    required this.currentTab,
    required this.onRequestTab,
    required this.onFinished,
    required this.nextLabel,
    required this.finishLabel,
    required this.skipLabel,
  });

  @override
  State<FeatureTourOverlay> createState() => _FeatureTourOverlayState();
}

class _FeatureTourOverlayState extends State<FeatureTourOverlay> {
  int _index = 0;
  Rect? _targetRect;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _goToStep(0));
  }

  Future<void> _goToStep(int index) async {
    if (index >= widget.steps.length) {
      widget.onFinished();
      return;
    }
    if (!mounted) return;
    final step = widget.steps[index];
    final tabChanging = widget.currentTab != step.tab;
    setState(() {
      _index = index;
      // A tab switch means the previous rect belongs to a screen that is no
      // longer visible — starting the next reveal from it would glide the
      // spotlight across content the target has nothing to do with. Null it
      // so the reveal restarts from the centre instead.
      if (tabChanging) _targetRect = null;
    });
    if (tabChanging) {
      HapticFeedback.selectionClick();
      widget.onRequestTab(step.tab);
      // Give MainScreen's setState and the newly-visible tab's first frame
      // time to land before anything tries to measure it.
      await Future.delayed(const Duration(milliseconds: 260));
      if (!mounted) return;
    }
    if (step.beforeMeasure != null) {
      step.beforeMeasure!();
      // The in-screen tab it just switched has its own build/animation to
      // settle before the target can be found or scrolled to.
      await Future.delayed(const Duration(milliseconds: 220));
      if (!mounted) return;
    }
    await _measure();
  }

  Future<void> _measure() async {
    // One more beat so a same-tab step change — and any scroll animation it
    // triggers — has actually finished before measuring.
    await Future.delayed(const Duration(milliseconds: 60));
    if (!mounted) return;
    final step = widget.steps[_index];
    final ctx = step.target.currentContext;
    if (ctx == null) {
      // Not on screen right now (a conditional card, an empty state) —
      // skip it rather than spotlight nothing.
      _goToStep(_index + 1);
      return;
    }
    try {
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeInOutCubic,
        alignment: 0.5,
      );
    } catch (_) {
      // Not inside a Scrollable, or it couldn't comply — the target is
      // measured in place either way.
    }
    if (!mounted) return;
    final box = ctx.findRenderObject();
    if (box is! RenderBox || !box.hasSize) {
      _goToStep(_index + 1);
      return;
    }
    final rect = (box.localToGlobal(Offset.zero) & box.size).inflate(8);
    if (_targetRect == null) {
      // First reveal on this screen: start the spotlight as a point at the
      // centre so it visibly zooms in onto the target, rather than just
      // appearing there.
      final center = MediaQuery.of(context).size.center(Offset.zero);
      setState(
        () =>
            _targetRect = Rect.fromCenter(center: center, width: 4, height: 4),
      );
      await Future.delayed(const Duration(milliseconds: 16));
      if (!mounted) return;
    }
    setState(() => _targetRect = rect);
  }

  void _next() {
    HapticFeedback.selectionClick();
    _goToStep(_index + 1);
  }

  void _prev() {
    if (_index == 0) return;
    HapticFeedback.selectionClick();
    _goToStep(_index - 1);
  }

  @override
  Widget build(BuildContext context) {
    final step = widget.steps[_index];
    final rect = _targetRect;
    final isLast = _index == widget.steps.length - 1;

    return Positioned.fill(
      child: Stack(
        children: [
          // ── Scrim with the cutout, or a plain dim while mid-transition ──
          //
          // Opaque on purpose, over the whole overlay — including the
          // "hole" the spotlight cuts out. The cutout is a paint effect
          // only; without a real hit-test barrier here, a tap on the very
          // card being explained reaches straight through to it and
          // navigates for real, which is exactly what a walkthrough must
          // never do underneath itself.
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: rect == null
                  ? Container(
                      color: const Color(0xFF07050F).withValues(alpha: 0.86),
                    )
                  : _AnimatedSpotlight(rect: rect, color: step.color),
            ),
          ),

          // ── The caption, gliding to sit by whatever is lit up ───────────
          if (rect != null)
            _CaptionCard(
              key: ValueKey(_index),
              rect: rect,
              step: step,
              index: _index,
              total: widget.steps.length,
              buttonLabel: isLast ? widget.finishLabel : widget.nextLabel,
              onNext: _next,
              onBack: _index > 0 ? _prev : null,
            ),

          // ── Skip, always reachable ───────────────────────────────────
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 18,
            child: GestureDetector(
              onTap: widget.onFinished,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.skipLabel,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      CupertinoIcons.xmark,
                      size: 11,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Tweens the spotlight's cutout from wherever it was to wherever it needs
/// to be, the same way [AnimatedContainer] tweens a size or a colour.
class _AnimatedSpotlight extends ImplicitlyAnimatedWidget {
  final Rect rect;
  final Color color;
  const _AnimatedSpotlight({required this.rect, required this.color})
    : super(
        duration: const Duration(milliseconds: 420),
        curve: Curves.easeInOutCubic,
      );

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
    return CustomPaint(
      size: Size.infinite,
      painter: _SpotlightPainter(
        rect: _rect!.evaluate(animation)!,
        color: _color!.evaluate(animation)!,
      ),
    );
  }
}

class _SpotlightPainter extends CustomPainter {
  final Rect rect;
  final Color color;
  const _SpotlightPainter({required this.rect, required this.color});

  static const _radius = Radius.circular(20);

  @override
  void paint(Canvas canvas, Size size) {
    final full = Path()..addRect(Offset.zero & size);
    final hole = Path()..addRRect(RRect.fromRectAndRadius(rect, _radius));
    final scrim = Path.combine(PathOperation.difference, full, hole);
    canvas.drawPath(
      scrim,
      Paint()..color = const Color(0xFF07050F).withValues(alpha: 0.86),
    );

    // A soft glow behind the ring, then the ring itself.
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, _radius),
      Paint()
        ..color = color.withValues(alpha: 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, _radius),
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.4,
    );
  }

  @override
  bool shouldRepaint(covariant _SpotlightPainter old) =>
      old.rect != rect || old.color != color;
}

/// The card explaining whatever is currently lit up — parked above it, or
/// below it if there isn't room, and gliding along with the spotlight.
class _CaptionCard extends StatelessWidget {
  final Rect rect;
  final TourStep step;
  final int index;
  final int total;
  final String buttonLabel;
  final VoidCallback onNext;

  /// Null on the first step — there is nowhere to go back to.
  final VoidCallback? onBack;

  /// A rough card height, used only to decide where it fits — the card
  /// still sizes itself to its real content underneath.
  static const _estimatedHeight = 210.0;

  const _CaptionCard({
    super.key,
    required this.rect,
    required this.step,
    required this.index,
    required this.total,
    required this.buttonLabel,
    required this.onNext,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenH = media.size.height;
    final usableTop = media.padding.top + 64;
    final usableBottom = screenH - media.padding.bottom - 110;

    // Prefer whichever side of the target has more room; a target close to
    // the top goes below it, one close to the bottom goes above it. When
    // the target itself is taller than the screen (nothing above or below
    // it fits), this still resolves to a definite, on-screen position
    // instead of the geometry going negative and pinning the card off in a
    // corner.
    final spaceBelow = usableBottom - (rect.bottom + 18);
    final spaceAbove = rect.top - 18 - usableTop;
    final desiredTop = spaceBelow >= spaceAbove
        ? rect.bottom + 18
        : rect.top - 18 - _estimatedHeight;
    final maxTop = math.max(usableTop, usableBottom - _estimatedHeight);
    final top = desiredTop.clamp(usableTop, maxTop);

    final card = Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
      decoration: BoxDecoration(
        color: const Color(0xFF12101E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: step.color.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: step.color.withValues(alpha: 0.22),
            blurRadius: 28,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: (index + 1) / total,
                    minHeight: 3,
                    backgroundColor: Colors.white.withValues(alpha: 0.10),
                    valueColor: AlwaysStoppedAnimation(step.color),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${index + 1}/$total',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.40),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            step.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -0.4,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            step.desc,
            style: TextStyle(
              fontSize: 13.5,
              height: 1.42,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.62),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              if (onBack != null) ...[
                GestureDetector(
                  onTap: onBack,
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.10),
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.chevron_left,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: GestureDetector(
                  onTap: onNext,
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          step.color,
                          step.color.withValues(alpha: 0.78),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        buttonLabel,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.2,
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

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeInOutCubic,
      left: 20,
      right: 20,
      top: top,
      child: card,
    );
  }
}
