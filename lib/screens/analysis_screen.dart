import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../services/notification_service.dart';
import '../utils/betaller_score.dart';
import '../utils/calculations.dart';
import '../utils/constants.dart';
import '../utils/haptics.dart';
import '../utils/localized_data.dart';
import '../utils/text_case.dart';
import '../widgets/height_silhouette.dart';
import '../widgets/potential_chart.dart';
import '../widgets/premium_paywall.dart';
import '../widgets/tour_keys.dart';
import '../widgets/water_sheet.dart';
import 'leaderboard_screen.dart';
import 'posture_analysis_screen.dart';

/// The Analysis tab: the BeTaller Score and the nine signals behind it, the
/// one potential the whole app shows, height for age, and the day's targets.
class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => AnalysisScreenState();
}

class AnalysisScreenState extends State<AnalysisScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ring = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );
  late final Animation<double> _ringCurve = CurvedAnimation(
    parent: _ring,
    curve: Curves.easeOutCubic,
  );
  final _potentialKey = GlobalKey();
  int? _recorded;

  @override
  void initState() {
    super.initState();
    // The tab is built at launch behind the home screen, so this first run
    // is silent; opening the tab replays it.
    Future.delayed(const Duration(milliseconds: 200), () {
      if (!mounted) return;
      if (MediaQuery.of(context).disableAnimations) {
        _ring.value = 1;
      } else {
        _ring.forward(from: 0);
      }
    });
  }

  /// Called by MainScreen when the tab is opened: count the score up again
  /// and mark the moment it lands.
  void replayAnimation() {
    if (!mounted) return;
    if (MediaQuery.of(context).disableAnimations) {
      _ring.value = 1;
      return;
    }
    _ring.forward(from: 0).then((_) {
      if (mounted && context.read<AppProvider>().isPremium) Haptics.impact();
    });
  }

  @override
  void dispose() {
    _ring.dispose();
    super.dispose();
  }

  void _goToTab(int tab) =>
      NotificationService.tappedPayload.value = 'tab:$tab';

  void _act(ScoreFactor f, AppProvider provider) {
    Haptics.tap();
    switch (f) {
      case ScoreFactor.training:
      case ScoreFactor.consistency:
      case ScoreFactor.nutrition:
        _goToTab(1);
      case ScoreFactor.sleep:
        _goToTab(0);
      case ScoreFactor.hydration:
        showWaterSheet(context, provider, provider.dailyTargets!.waterL);
      case ScoreFactor.posture:
        final p = provider.betallerScore?.factor(ScoreFactor.posture);
        if (p != null &&
            (p.score ?? 0) >= 80 &&
            (p.facts['daysAgo'] ?? 99) < 30) {
          _goToTab(1);
        } else {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (_) => const PostureAnalysisScreen()),
          );
        }
      case ScoreFactor.measuring:
      case ScoreFactor.growth:
        _goToTab(2);
      case ScoreFactor.headroom:
        final ctx = _potentialKey.currentContext;
        if (ctx != null) {
          Scrollable.ensureVisible(
            ctx,
            duration: MediaQuery.of(context).disableAnimations
                ? Duration.zero
                : const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final profile = provider.profile;
        final score = provider.betallerScore;
        if (profile == null || score == null) return const SizedBox();

        final total = score.total;
        if (total != null && _recorded != total) {
          _recorded = total;
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => provider.recordScoreSnapshot(total),
          );
        }

        final scoreBlock = Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            KeyedSubtree(
              key: TourKeys.analysisScore,
              child: _ScoreHero(
                score: score,
                lastWeek: provider.lastWeekScore,
                ring: _ringCurve,
                onAct: (f) => _act(f, provider),
              ),
            ),
            const SizedBox(height: 26),
            KeyedSubtree(
              key: TourKeys.analysisRadar,
              child: _Breakdown(
                score: score,
                provider: provider,
                onAct: (f) => _act(f, provider),
              ),
            ),
          ],
        );

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l.analysis,
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: -1,
                            height: 1.05,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          l.anSubtitle,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.55),
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 120),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // ── 1. The score and what builds it ──
                    if (provider.isPremium)
                      scoreBlock
                    else
                      _LockedPreview(
                        maxHeight: 600,
                        title: l.anUnlockScoreTitle,
                        body: l.anUnlockScoreBody,
                        child: scoreBlock,
                      ),
                    const SizedBox(height: 30),

                    // ── 2. The one potential ──
                    SectionHeader(
                      icon: CupertinoIcons.arrow_up_right_circle_fill,
                      title: _up(context, l.anPotentialTitle),
                      iconColor: AppColors.lime,
                    ),
                    const SizedBox(height: 12),
                    KeyedSubtree(
                      key: TourKeys.analysisPrediction,
                      child: Container(
                        key: _potentialKey,
                        child: _PotentialCard(provider: provider),
                      ),
                    ),
                    const SizedBox(height: 14),
                    KeyedSubtree(
                      key: TourKeys.analysisPeer,
                      child: _PercentileCard(provider: provider),
                    ),
                    const SizedBox(height: 30),

                    // ── 3. Daily needs ──
                    KeyedSubtree(
                      key: TourKeys.analysisDailyNeeds,
                      child: SectionHeader(
                        icon: CupertinoIcons.checkmark_seal_fill,
                        title: _up(context, l.anNeedsTitle),
                        iconColor: AppColors.orange,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l.anNeedsBasis,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.white.withValues(alpha: 0.45),
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (provider.isPremium)
                      _DailyNeeds(provider: provider)
                    else
                      _LockedPreview(
                        title: l.anUnlockNeedsTitle,
                        child: _DailyNeeds(provider: provider),
                      ),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ── Look and feel shared by the cards ────────────────────────────────

BoxDecoration _card({Color? glow}) => BoxDecoration(
  color: AppColors.cardFill,
  borderRadius: BorderRadius.circular(24),
  border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
  boxShadow: glow == null
      ? null
      : [
          BoxShadow(
            color: glow.withValues(alpha: 0.18),
            blurRadius: 40,
            spreadRadius: -12,
            offset: const Offset(0, 14),
          ),
        ],
);

/// Upper case that keeps the Turkish dotted capital I.
String _up(BuildContext context, String s) => s.upperIn(context);

TextStyle _label() => TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w700,
  letterSpacing: 1.3,
  color: Colors.white.withValues(alpha: 0.45),
);

String _tierName(AppLocalizations l, ScoreTier t) => switch (t) {
  ScoreTier.starting => l.anTierStarting,
  ScoreTier.building => l.anTierBuilding,
  ScoreTier.rising => l.anTierRising,
  ScoreTier.strong => l.anTierStrong,
  ScoreTier.peak => l.anTierPeak,
};

Color _tierColor(ScoreTier? t) => switch (t) {
  null || ScoreTier.starting => const Color(0xFF94A3B8),
  ScoreTier.building => AppColors.primaryLight,
  ScoreTier.rising || ScoreTier.strong => AppColors.lime,
  ScoreTier.peak => AppColors.warning,
};

Color _factorColor(ScoreFactor f) => switch (f) {
  ScoreFactor.training => AppColors.primaryLight,
  ScoreFactor.consistency => AppColors.warning,
  ScoreFactor.sleep => AppColors.sleepColor,
  ScoreFactor.hydration => AppColors.cyan,
  ScoreFactor.nutrition => AppColors.orange,
  ScoreFactor.posture => AppColors.postureColor,
  ScoreFactor.measuring => AppColors.primary,
  ScoreFactor.growth || ScoreFactor.headroom => AppColors.lime,
};

IconData _factorIcon(ScoreFactor f) => switch (f) {
  ScoreFactor.training => CupertinoIcons.bolt_fill,
  ScoreFactor.consistency => CupertinoIcons.flame_fill,
  ScoreFactor.sleep => CupertinoIcons.moon_fill,
  ScoreFactor.hydration => CupertinoIcons.drop_fill,
  ScoreFactor.nutrition => CupertinoIcons.leaf_arrow_circlepath,
  ScoreFactor.posture => CupertinoIcons.person_fill,
  ScoreFactor.measuring => CupertinoIcons.resize_v,
  ScoreFactor.growth => CupertinoIcons.arrow_up_right,
  ScoreFactor.headroom => CupertinoIcons.arrow_up_to_line,
};

String _factorName(AppLocalizations l, ScoreFactor f) => switch (f) {
  ScoreFactor.training => l.anFTraining,
  ScoreFactor.consistency => l.anFConsistency,
  ScoreFactor.sleep => l.anFSleep,
  ScoreFactor.hydration => l.anFHydration,
  ScoreFactor.nutrition => l.anFNutrition,
  ScoreFactor.posture => l.anFPosture,
  ScoreFactor.measuring => l.anFMeasuring,
  ScoreFactor.growth => l.anFGrowth,
  ScoreFactor.headroom => l.anFHeadroom,
};

String _num(num v, [int digits = 1]) {
  final s = v.toStringAsFixed(digits);
  return s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
}

/// What a signal is based on, in words.
String _basedOn(AppLocalizations l, FactorResult r, AppProvider p) {
  final f = r.facts;
  int i(String k) => (f[k] ?? 0).toInt();
  if (!r.counted) return l.anBGrowthAdult;
  switch (r.factor) {
    case ScoreFactor.training:
      return r.hasData
          ? l.anBTraining(i('done'), i('planned'))
          : l.anBTrainingNone;
    case ScoreFactor.consistency:
      return r.hasData
          ? l.anBConsistency(i('streak'), i('active'), i('days'))
          : l.anBConsistencyNone;
    case ScoreFactor.sleep:
      return r.hasData
          ? l.anBSleep(_num(f['avg']!), _num(f['target']!), i('days'))
          : l.anBSleepNone;
    case ScoreFactor.hydration:
      return r.hasData
          ? l.anBHydration(_num(f['avg']!), _num(f['target']!), i('days'))
          : l.anBHydrationNone;
    case ScoreFactor.nutrition:
      return r.hasData
          ? l.anBNutrition(i('done'), i('planned'))
          : l.anBNutritionNone;
    case ScoreFactor.posture:
      if (!r.hasData) return l.anBPostureNone;
      return i('daysAgo') == 0
          ? l.anBPostureToday(i('raw'))
          : l.anBPosture(i('raw'), i('daysAgo'));
    case ScoreFactor.measuring:
      if (!r.hasData) return l.anBMeasuringNone;
      return i('daysAgo') == 0
          ? l.anBMeasuringToday
          : l.anBMeasuring(i('daysAgo'));
    case ScoreFactor.growth:
      return r.hasData
          ? l.anBGrowth(_num(f['velocity']!), _num(f['expected']!))
          : l.anBGrowthNone;
    case ScoreFactor.headroom:
      return l.anBHeadroom(
        p.formatHeightDelta(f['cm']!.toDouble()).replaceFirst('+', ''),
      );
  }
}

/// The one concrete thing that raises a signal, or null when there is none.
String? _action(AppLocalizations l, FactorResult r, AppProvider p) {
  final f = r.facts;
  if (!r.counted) return null;
  switch (r.factor) {
    case ScoreFactor.training:
      return l.anATraining;
    case ScoreFactor.consistency:
      return l.anAConsistency;
    case ScoreFactor.sleep:
      return r.hasData
          ? l.anASleep(_num(p.dailyTargets!.sleepH))
          : l.anASleepLog;
    case ScoreFactor.hydration:
      if (!r.hasData) return l.anAHydrationLog;
      final left = (f['target']! - (f['today'] ?? 0)).toDouble();
      return left <= 0.05 ? l.anAHydrationDone : l.anAHydration(_num(left));
    case ScoreFactor.nutrition:
      return l.anANutrition;
    case ScoreFactor.posture:
      if (!r.hasData) return l.anAPostureFirst;
      return (r.score! >= 80 && (f['daysAgo'] ?? 99) < 30)
          ? l.anAPostureKeep
          : l.anAPostureRedo;
    case ScoreFactor.measuring:
      return (f['daysAgo'] ?? 99) <= 7 ? l.anAMeasureKeep : l.anAMeasure;
    case ScoreFactor.growth:
      if (r.hasData) return l.anAGrowth;
      final wait = (f['wait'] ?? 0).toInt();
      return wait > 0 ? l.anAGrowthWait(wait) : l.anAMeasure;
    case ScoreFactor.headroom:
      return l.anAHeadroom;
  }
}

// ── 1. Hero: ring, tier, trend ───────────────────────────────────────

class _ScoreHero extends StatelessWidget {
  final BetallerScore score;
  final int? lastWeek;
  final Animation<double> ring;
  final ValueChanged<ScoreFactor> onAct;

  const _ScoreHero({
    required this.score,
    required this.lastWeek,
    required this.ring,
    required this.onAct,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.read<AppProvider>();
    final total = score.total;
    final tier = score.tier;
    final color = _tierColor(tier);
    final win = score.fastestWin;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: _card(),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  _up(context, l.anScoreLabel),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: _label(),
                ),
              ),
              if (tier != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: color.withValues(alpha: 0.4)),
                  ),
                  child: Text(
                    _tierName(l, tier),
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w800,
                      color: color,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          AnimatedBuilder(
            animation: ring,
            builder: (context, _) {
              final t = ring.value;
              return SizedBox(
                width: 188,
                height: 188,
                child: CustomPaint(
                  painter: _ScoreRingPainter(
                    progress: total == null ? 0 : total / 100 * t,
                    color: color,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          total == null ? '--' : '${(total * t).round()}',
                          style: const TextStyle(
                            fontSize: 66,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: -2.5,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '/ 100',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withValues(alpha: 0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          if (total == null) ...[
            Text(
              l.anNoScoreTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l.anNoScoreBody,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.5,
                height: 1.4,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ] else ...[
            _TrendChip(total: total, lastWeek: lastWeek),
            const SizedBox(height: 10),
            Text(
              BetallerScore.nextTierAt(total) == null
                  ? l.anTopTier
                  : l.anNextTier(
                      BetallerScore.nextTierAt(total)! - total,
                      _tierName(
                        l,
                        BetallerScore.tierFor(BetallerScore.nextTierAt(total)!),
                      ),
                    ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
          const SizedBox(height: 4),
          Text(
            l.anCoverage(score.signalsWithData, score.signalsCounted),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withValues(alpha: 0.42),
            ),
          ),
          if (win != null) ...[
            const SizedBox(height: 18),
            _FastestWin(
              result: win,
              action: _action(l, win, provider),
              onTap: () => onAct(win.factor),
            ),
          ],
        ],
      ),
    );
  }
}

class _TrendChip extends StatelessWidget {
  final int total;
  final int? lastWeek;
  const _TrendChip({required this.total, required this.lastWeek});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final delta = lastWeek == null ? null : total - lastWeek!;
    final (IconData? icon, Color color, String text) = switch (delta) {
      null => (null, Colors.white.withValues(alpha: 0.55), l.anTrendFirst),
      0 => (
        CupertinoIcons.minus,
        Colors.white.withValues(alpha: 0.7),
        l.anTrendFlat,
      ),
      > 0 => (CupertinoIcons.arrow_up, AppColors.lime, l.anTrendUp(delta)),
      _ => (CupertinoIcons.arrow_down, AppColors.orange, l.anTrendDown(-delta)),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: color),
            const SizedBox(width: 5),
          ],
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FastestWin extends StatelessWidget {
  final FactorResult result;
  final String? action;
  final VoidCallback onTap;
  const _FastestWin({
    required this.result,
    required this.action,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final color = _factorColor(result.factor);
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Row(
          children: [
            Icon(_factorIcon(result.factor), size: 18, color: color),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${l.anFastestWin} · ${_factorName(l, result.factor)}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ),
                  if (action != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      action!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              CupertinoIcons.chevron_right,
              size: 16,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}

// ── 1b. The nine signals ─────────────────────────────────────────────

class _Breakdown extends StatelessWidget {
  final BetallerScore score;
  final AppProvider provider;
  final ValueChanged<ScoreFactor> onAct;
  const _Breakdown({
    required this.score,
    required this.provider,
    required this.onAct,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          icon: CupertinoIcons.square_stack_3d_up_fill,
          title: _up(context, l.anBreakdownTitle),
          iconColor: AppColors.primaryLight,
        ),
        const SizedBox(height: 6),
        Text(
          l.anBreakdownHint,
          style: TextStyle(
            fontSize: 12.5,
            height: 1.4,
            color: Colors.white.withValues(alpha: 0.45),
          ),
        ),
        const SizedBox(height: 12),
        for (final f in score.factors) ...[
          _FactorTile(
            result: f,
            basedOn: _basedOn(l, f, provider),
            action: _action(l, f, provider),
            onTap: () => onAct(f.factor),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _FactorTile extends StatelessWidget {
  final FactorResult result;
  final String basedOn;
  final String? action;
  final VoidCallback onTap;

  const _FactorTile({
    required this.result,
    required this.basedOn,
    required this.action,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final color = _factorColor(result.factor);
    final muted = !result.counted || !result.hasData;

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: muted ? 0.08 : 0.16),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(
                  _factorIcon(result.factor),
                  size: 16,
                  color: muted ? color.withValues(alpha: 0.55) : color,
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 2,
                  children: [
                    Text(
                      _factorName(l, result.factor),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      result.counted
                          ? l.anWeight(result.weight)
                          : l.anNotCounted,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.38),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (result.hasData)
                Text(
                  '${result.score}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.8,
                    height: 1,
                  ),
                )
              else
                Text(
                  result.counted ? l.anNoData : '',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withValues(alpha: 0.4),
                  ),
                ),
            ],
          ),
          if (result.counted) ...[
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: LinearProgressIndicator(
                value: (result.score ?? 0) / 100,
                minHeight: 4,
                backgroundColor: Colors.white.withValues(alpha: 0.07),
                valueColor: AlwaysStoppedAnimation(color),
              ),
            ),
          ],
          const SizedBox(height: 9),
          Text(
            basedOn,
            style: TextStyle(
              fontSize: 12.5,
              height: 1.35,
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
          if (action != null) ...[
            const SizedBox(height: 10),
            GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        action!,
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w800,
                          color: color,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(CupertinoIcons.chevron_right, size: 12, color: color),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ── 2. Potential ─────────────────────────────────────────────────────

class _PotentialCard extends StatelessWidget {
  final AppProvider provider;
  const _PotentialCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final potential = provider.potentialHeight;
    final latest = provider.latestHeight;
    final toGo = math.max(0.0, potential - latest);
    final dream = provider.dreamHeight;

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      decoration: _card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_up(context, l.anPotentialLabel), style: _label()),
          const SizedBox(height: 8),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 8,
            children: [
              _HeightNumber(provider: provider, cm: potential),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lime.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  toGo < 0.05
                      ? l.anPotentialReached
                      : l.anPotentialToGo(
                          provider
                              .formatHeightDelta(toGo)
                              .replaceFirst('+', ''),
                        ),
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: AppColors.lime,
                  ),
                ),
              ),
            ],
          ),
          if (dream != null) ...[
            const SizedBox(height: 6),
            Text(
              l.anDreamLine(provider.formatHeight(dream)),
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: Colors.white.withValues(alpha: 0.55),
              ),
            ),
          ],
          const SizedBox(height: 18),
          PotentialChart(provider: provider, height: 190),
          const SizedBox(height: 14),
          HeightSilhouette(
            current: latest,
            potential: potential,
            dream: dream,
            format: provider.formatHeight,
            height: 180,
          ),
          const SizedBox(height: 10),
          Text(
            l.anPotentialNote,
            style: TextStyle(
              fontSize: 12,
              height: 1.35,
              color: Colors.white.withValues(alpha: 0.42),
            ),
          ),
          if (toGo >= 0.05) ...[
            const SizedBox(height: 16),
            Divider(color: Colors.white.withValues(alpha: 0.06), height: 1),
            const SizedBox(height: 16),
            provider.isPremium
                ? _Sources(provider: provider, toGo: toGo)
                : _LockedPreview(
                    title: l.anUnlockSourcesTitle,
                    compact: true,
                    child: _Sources(provider: provider, toGo: toGo),
                  ),
          ],
        ],
      ),
    );
  }
}

class _HeightNumber extends StatelessWidget {
  final AppProvider provider;
  final double cm;
  const _HeightNumber({required this.provider, required this.cm});

  @override
  Widget build(BuildContext context) {
    const big = TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.w900,
      color: AppColors.lime,
      letterSpacing: -1.6,
      height: 1,
    );
    if (provider.useImperial) {
      return FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(provider.formatHeight(cm), style: big),
      );
    }
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(cm.toStringAsFixed(1), style: big),
          const SizedBox(width: 4),
          Text(
            'cm',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.45),
            ),
          ),
        ],
      ),
    );
  }
}

/// The gap to the potential, split the way the prediction model splits it.
/// Scaled to the gap on screen, so the parts always add up to it.
class _Sources extends StatelessWidget {
  final AppProvider provider;
  final double toGo;
  const _Sources({required this.provider, required this.toGo});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final p = provider.prediction;
    if (p == null) return const SizedBox.shrink();
    final genes = p.geneticGain;
    final posture = math.min(p.postureGain, p.lifestyleGain);
    final habits = math.max(0.0, p.lifestyleGain - posture);
    final sum = genes + habits + posture;
    final k = sum <= 0 ? 0.0 : toGo / sum;
    final parts = [
      (l.anSourcesGenes, genes * k, AppColors.primaryLight),
      (l.anSourcesHabits, habits * k, AppColors.lime),
      (l.anSourcesPosture, posture * k, AppColors.postureColor),
    ].where((e) => e.$2 >= 0.05).toList();
    if (parts.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_up(context, l.anSourcesTitle), style: _label()),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            height: 10,
            child: Row(
              children: [
                for (var i = 0; i < parts.length; i++)
                  Expanded(
                    flex: math.max(1, (parts[i].$2 * 100).round()),
                    child: Container(
                      margin: EdgeInsets.only(
                        right: i == parts.length - 1 ? 0 : 2,
                      ),
                      color: parts[i].$3,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        for (final e in parts)
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: e.$3,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    e.$1,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.75),
                    ),
                  ),
                ),
                Text(
                  provider.formatHeightDelta(e.$2),
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w800,
                    color: e.$3,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Where the user stands among people of their age and sex. Real reference
/// data, the same number the full comparison screen shows.
class _PercentileCard extends StatelessWidget {
  final AppProvider provider;
  const _PercentileCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final profile = provider.profile!;
    final pct = provider.peerPercentile.clamp(1, 99);
    final bmi = Calculations.calculateBMI(
      provider.latestHeight,
      profile.weight,
    );

    return GestureDetector(
      onTap: () {
        Haptics.tap();
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (_) => const LeaderboardScreen()),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        decoration: _card(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_up(context, l.anPctTitle), style: _label()),
                      const SizedBox(height: 8),
                      Text(
                        l.anPctValue(pct),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.4,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '$pct',
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primaryLight,
                    letterSpacing: -1.5,
                    height: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, c) => SizedBox(
                height: 14,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 5,
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withValues(alpha: 0.08),
                              AppColors.primaryLight.withValues(alpha: 0.5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: (c.maxWidth - 14) * pct / 100,
                      top: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.cardFill,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l.anPctBasis,
              style: TextStyle(
                fontSize: 11.5,
                color: Colors.white.withValues(alpha: 0.42),
              ),
            ),
            const SizedBox(height: 12),
            Divider(color: Colors.white.withValues(alpha: 0.06), height: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${l.bmi} ${bmi.toStringAsFixed(1)} · ${localizedBmiCategory(l, Calculations.bmiCategory(bmi))}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                ),
                Text(
                  l.anPctMore,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryLight,
                  ),
                ),
                const SizedBox(width: 2),
                const Icon(
                  CupertinoIcons.chevron_right,
                  size: 12,
                  color: AppColors.primaryLight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── 3. Daily needs ───────────────────────────────────────────────────

class _DailyNeeds extends StatelessWidget {
  final AppProvider provider;
  const _DailyNeeds({required this.provider});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final t = provider.dailyTargets!;
    final tiles = [
      (l.protein, '${t.proteinG}', 'g', l.anPerDay, AppColors.orange),
      (l.calories, '${t.kcal}', 'kcal', l.anPerDay, AppColors.orange),
      (l.water, _num(t.waterL), 'L', l.anPerDay, AppColors.cyan),
      (
        l.sleepLabel,
        _num(t.sleepH),
        l.anUnitHours,
        l.anPerNight,
        AppColors.sleepColor,
      ),
      (l.anCalcium, '${t.calciumMg}', 'mg', l.anPerDay, AppColors.orange),
      (l.anVitaminD, '${t.vitaminDIu}', 'IU', l.anPerDay, AppColors.orange),
    ];
    return LayoutBuilder(
      builder: (context, c) {
        const gap = 10.0;
        final w = (c.maxWidth - gap) / 2;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final e in tiles)
              Container(
                width: w,
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 13),
                decoration: BoxDecoration(
                  color: AppColors.cardFill,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.$1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: e.$5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            e.$2,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: -1,
                              height: 1,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            e.$3,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(alpha: 0.45),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      e.$4,
                      style: TextStyle(
                        fontSize: 11.5,
                        color: Colors.white.withValues(alpha: 0.42),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

// ── Locked: the real thing, blurred, with one way in ─────────────────

class _LockedPreview extends StatelessWidget {
  final Widget child;
  final String title;
  final String? body;

  /// Taller content is cut to this height and fades out.
  final double? maxHeight;
  final bool compact;

  const _LockedPreview({
    required this.child,
    required this.title,
    this.body,
    this.maxHeight,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    void unlock() {
      Haptics.tap();
      showPremiumPaywall(context);
    }

    Widget preview = IgnorePointer(child: ExcludeSemantics(child: child));
    if (maxHeight != null) {
      preview = SizedBox(
        height: maxHeight,
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.topCenter,
            minHeight: 0,
            maxHeight: double.infinity,
            child: preview,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: unlock,
      behavior: HitTestBehavior.opaque,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(compact ? 16 : 24),
        child: Stack(
          children: [
            preview,
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.scaffold.withValues(alpha: 0.25),
                        AppColors.scaffold.withValues(alpha: 0.55),
                        AppColors.scaffold.withValues(
                          alpha: maxHeight == null ? 0.55 : 0.95,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: maxHeight == null
                    ? Alignment.center
                    : const Alignment(0, -0.35),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: compact
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            _UnlockButton(label: l.anUnlockCta, onTap: unlock),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.lock_fill,
                              size: 22,
                              color: AppColors.warning,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                            if (body != null) ...[
                              const SizedBox(height: 6),
                              Text(
                                body!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.5,
                                  height: 1.4,
                                  color: Colors.white.withValues(alpha: 0.7),
                                ),
                              ),
                            ],
                            const SizedBox(height: 14),
                            _UnlockButton(label: l.anUnlockCta, onTap: unlock),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UnlockButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _UnlockButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
        decoration: BoxDecoration(
          color: AppColors.warning,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              CupertinoIcons.lock_open_fill,
              size: 15,
              color: Color(0xFF1A1405),
            ),
            const SizedBox(width: 7),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A1405),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Score ring ───────────────────────────────────────────────────────

class _ScoreRingPainter extends CustomPainter {
  final double progress;
  final Color color;

  _ScoreRingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.07)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12,
    );
    if (progress <= 0) return;

    final sweep = 2 * math.pi * progress;
    // The one glow on the screen: under the arc.
    canvas.drawArc(
      rect,
      -math.pi / 2,
      sweep,
      false,
      Paint()
        ..color = color.withValues(alpha: 0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );
    canvas.drawArc(
      rect,
      -math.pi / 2,
      sweep,
      false,
      Paint()
        ..shader = SweepGradient(
          endAngle: 2 * math.pi * progress.clamp(0.01, 1.0),
          colors: [color.withValues(alpha: 0.55), color],
          transform: const GradientRotation(-math.pi / 2),
        ).createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _ScoreRingPainter old) =>
      old.progress != progress || old.color != color;
}
