import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/routine.dart';
import '../providers/app_provider.dart';
import '../utils/camera_utils.dart';
import '../utils/constants.dart';
import '../utils/haptics.dart';
import '../utils/localized_data.dart';
import '../widgets/photo_source_sheet.dart';
import '../widgets/premium_paywall.dart';
import '../widgets/progress_locked_preview.dart';
import 'exercise_detail_screen.dart';

/// Days between two checks. Posture work needs about a week to show.
const int _kRetakeDays = 7;

/// A posture self-check: three wall-test questions, scored from the user's own
/// answers. No image analysis and no invented numbers; the side photo is kept
/// only so the user can look back at it.
///
/// Starting a check is premium (as it always was); past results stay visible.
class PostureAnalysisScreen extends StatefulWidget {
  const PostureAnalysisScreen({super.key});

  @override
  State<PostureAnalysisScreen> createState() => _PostureAnalysisScreenState();
}

class _PostureAnalysisScreenState extends State<PostureAnalysisScreen> {
  // ── Starting a check ────────────────────────────────────────────────────
  Future<void> _startCheck() async {
    Haptics.tap();
    final provider = context.read<AppProvider>();
    if (!provider.isPremium) {
      await showPremiumPaywall(context);
      return;
    }
    final l = AppLocalizations.of(context)!;
    final source = await showPhotoSourceSheet(
      context,
      title: l.choosePhotoSource,
      subtitle: l.sideProfileHint,
    );
    if (source == null || !mounted) return;

    final picked = await pickImageWithCountdown(context, source);
    if (picked == null) return;

    final appDir = await getApplicationDocumentsDirectory();
    final dir = Directory('${appDir.path}/posture_photos');
    if (!dir.existsSync()) dir.createSync(recursive: true);
    final path =
        '${dir.path}/posture_${DateTime.now().millisecondsSinceEpoch}.jpg';
    await File(picked.path).copy(path);

    if (!mounted) return;
    await _showSelfCheck(path);
  }

  /// The three questions produce the score. Closing the sheet keeps nothing.
  Future<void> _showSelfCheck(String path) async {
    final answers = await showModalBottomSheet<_PostureAnswers>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _PostureSelfCheckSheet(imagePath: path),
    );
    if (answers == null) {
      try {
        await File(path).delete();
      } catch (_) {}
      return;
    }
    if (!mounted) return;
    context.read<AppProvider>().addPostureAnalysis(
      path: path,
      kyphosisScore: answers.shoulders,
      lordosisScore: answers.lowerBack,
      headPosScore: answers.head,
    );
    Haptics.impact();
  }

  void _showHowItWorks() {
    Haptics.tap();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _HowItWorksSheet(),
    );
  }

  // ── Build ───────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final analyses = provider.postureAnalyses;
        final latest = analyses.isNotEmpty ? analyses.last : null;
        final previous = analyses.length >= 2
            ? analyses[analyses.length - 2]
            : null;

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                _TopBar(onInfo: _showHowItWorks),
                Expanded(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
                    children: [
                      if (latest == null)
                        provider.isPremium
                            ? _IntroCard(onStart: _startCheck)
                            : ProgressLockedPreview(
                                title: l.pgPostureLockedTitle,
                                body: l.pgPostureLockedBody,
                                preview: const _PreviewSkeleton(),
                              )
                      else ...[
                        _ScoreCard(latest: latest, previous: previous),
                        const SizedBox(height: 12),
                        for (final area in _Area.values) ...[
                          _AreaCard(area: area, check: latest),
                          const SizedBox(height: 12),
                        ],
                        _RetakeCard(latest: latest, onStart: _startCheck),
                        const SizedBox(height: 12),
                        _HistoryCard(analyses: analyses),
                      ],
                      const SizedBox(height: 16),
                      Text(
                        l.postureCheckNote,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  The model behind the card
// ═════════════════════════════════════════════════════════════════════════════

enum _Area { head, shoulders, lowerBack }

extension on _Area {
  /// The stored field for this area. The names come from an older version
  /// and are kept for the saved data: kyphosis is the shoulders answer,
  /// lordosis the lower back answer.
  String get field => switch (this) {
    _Area.head => 'headPosScore',
    _Area.shoulders => 'kyphosisScore',
    _Area.lowerBack => 'lordosisScore',
  };

  /// Score per answer, in the order the sheet shows the options.
  List<int> get answerScores => switch (this) {
    _Area.head => _PostureSelfCheckSheetState._headScores,
    _Area.shoulders => _PostureSelfCheckSheetState._shoulderScores,
    _Area.lowerBack => _PostureSelfCheckSheetState._lowerBackScores,
  };

  IconData get icon => switch (this) {
    _Area.head => CupertinoIcons.person_crop_circle,
    _Area.shoulders => Icons.accessibility_new_rounded,
    _Area.lowerBack => CupertinoIcons.arrow_up_down,
  };

  String title(AppLocalizations l) => switch (this) {
    _Area.head => l.pgAreaHead,
    _Area.shoulders => l.pgAreaShoulders,
    _Area.lowerBack => l.pgAreaLowerBack,
  };

  /// The answer behind a stored score, or null for checks saved before the
  /// questions existed (those held numbers no answer produces).
  int? answerFor(int score) {
    final i = answerScores.indexOf(score);
    return i == -1 ? null : i;
  }

  String meaning(AppLocalizations l, int? answer) => switch ((this, answer)) {
    (_Area.head, 0) => l.pgHeadMeaning0,
    (_Area.head, 1) => l.pgHeadMeaning1,
    (_Area.head, 2) => l.pgHeadMeaning2,
    (_Area.shoulders, 0) => l.pgShouldersMeaning0,
    (_Area.shoulders, 1) => l.pgShouldersMeaning1,
    (_Area.shoulders, 2) => l.pgShouldersMeaning2,
    (_Area.lowerBack, 0) => l.pgLowerBackMeaning0,
    (_Area.lowerBack, 1) => l.pgLowerBackMeaning1,
    (_Area.lowerBack, 2) => l.pgLowerBackMeaning2,
    _ => l.pgLegacyMeaning,
  };

  /// The two routines that work on this area for this answer.
  List<String> exercises(int? answer) => switch ((this, answer)) {
    (_Area.head, _) => const ['neck_stretches', 'wall_stand'],
    (_Area.shoulders, _) => const ['shoulder_rolls', 'cobra_stretch'],
    // A flat lower back needs extension and mobility, a strong arch needs
    // the hip flexors released and the core switched on.
    (_Area.lowerBack, 1) => const ['cat_cow', 'cobra_stretch'],
    (_Area.lowerBack, 2) => const ['hip_flexor_stretch', 'plank'],
    (_Area.lowerBack, _) => const ['cat_cow', 'plank'],
  };
}

int _score(Map<String, dynamic> check, String field) =>
    (check[field] as num?)?.toInt() ?? 0;

Color _scoreColor(int score) {
  if (score >= 80) return AppColors.lime;
  if (score >= 60) return AppColors.primaryLight;
  if (score >= 45) return AppColors.orange;
  return AppColors.error;
}

String _interpretation(AppLocalizations l, int score) {
  if (score >= 80) return l.postureExcellent;
  if (score >= 60) return l.postureGood;
  if (score >= 40) return l.postureNeedsWork;
  return l.posturePoor;
}

DateTime? _checkDate(Map<String, dynamic> check) =>
    DateTime.tryParse(check['date'] as String? ?? '');

DateTime _today() {
  final n = DateTime.now();
  return DateTime(n.year, n.month, n.day);
}

String _fmt(BuildContext context, DateTime? d, String pattern) => d == null
    ? ''
    : DateFormat(
        pattern,
        Localizations.localeOf(context).languageCode,
      ).format(d);

class _Card extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? borderColor;
  const _Card({
    required this.child,
    this.padding = const EdgeInsets.all(18),
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: borderColor ?? Colors.white.withValues(alpha: 0.06),
        ),
      ),
      child: child,
    );
  }
}

class _Eyebrow extends StatelessWidget {
  final String text;
  const _Eyebrow(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.2,
        color: Colors.white.withValues(alpha: 0.5),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Top bar
// ═════════════════════════════════════════════════════════════════════════════

class _TopBar extends StatelessWidget {
  final VoidCallback onInfo;
  const _TopBar({required this.onInfo});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.white),
            onPressed: () {
              Haptics.tap();
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Text(
              l.pgPostureTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.3,
              ),
            ),
          ),
          IconButton(
            tooltip: l.pgHowItWorks,
            icon: Icon(
              CupertinoIcons.info_circle,
              color: Colors.white.withValues(alpha: 0.7),
            ),
            onPressed: onInfo,
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Score card (the hero)
// ═════════════════════════════════════════════════════════════════════════════

class _ScoreCard extends StatelessWidget {
  final Map<String, dynamic> latest;
  final Map<String, dynamic>? previous;
  const _ScoreCard({required this.latest, required this.previous});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final total = _score(latest, 'totalScore');
    final color = _scoreColor(total);
    final trend = previous == null
        ? null
        : total - _score(previous!, 'totalScore');

    // The weakest area is where to start.
    final weakest = _Area.values.reduce(
      (a, b) => _score(latest, a.field) <= _score(latest, b.field) ? a : b,
    );
    final allGood = _Area.values.every((a) => _score(latest, a.field) >= 80);

    return _Card(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _Eyebrow(l.pgYourPosture)),
              Text(
                l.pgCheckedOn(_fmt(context, _checkDate(latest), 'd MMM')),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 168,
            height: 168,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: total / 100),
                    duration:
                        (MediaQuery.maybeDisableAnimationsOf(context) ?? false)
                        ? Duration.zero
                        : const Duration(milliseconds: 900),
                    curve: Curves.easeOutCubic,
                    builder: (context, v, _) => CustomPaint(
                      painter: _ScoreRingPainter(progress: v, color: color),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$total',
                      style: TextStyle(
                        fontSize: 56,
                        height: 1,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -2,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l.pgOutOf100,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(
            _interpretation(l, total),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.6,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            allGood ? l.pgAllAreasGood : l.pgStartWith(weakest.title(l)),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
          if (trend != null) ...[
            const SizedBox(height: 12),
            _TrendPill(trend: trend),
          ],
          const SizedBox(height: 16),
          Row(
            children: [
              for (final a in _Area.values) ...[
                if (a != _Area.head) const SizedBox(width: 8),
                Expanded(
                  child: _AreaMini(area: a, score: _score(latest, a.field)),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _AreaMini extends StatelessWidget {
  final _Area area;
  final int score;
  const _AreaMini({required this.area, required this.score});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final color = _scoreColor(score);
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            area.title(l),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$score',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.8,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: score / 100,
              minHeight: 4,
              backgroundColor: Colors.white.withValues(alpha: 0.07),
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrendPill extends StatelessWidget {
  final int trend;
  const _TrendPill({required this.trend});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final up = trend > 0;
    final flat = trend == 0;
    final color = flat
        ? Colors.white.withValues(alpha: 0.7)
        : up
        ? AppColors.lime
        : AppColors.orange;
    final text = flat ? '0' : '${up ? '+' : ''}$trend';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            flat
                ? CupertinoIcons.minus
                : up
                ? CupertinoIcons.arrow_up
                : CupertinoIcons.arrow_down,
            size: 13,
            color: color,
          ),
          const SizedBox(width: 5),
          Text(
            l.pgVsLastCheck(text),
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  One card per area: what the answer means, and the two exercises for it
// ═════════════════════════════════════════════════════════════════════════════

class _AreaCard extends StatelessWidget {
  final _Area area;
  final Map<String, dynamic> check;
  const _AreaCard({required this.area, required this.check});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final score = _score(check, area.field);
    final answer = area.answerFor(score);
    final color = _scoreColor(score);
    final good = score >= 80;
    final status = good
        ? l.pgStatusGood
        : score >= 60
        ? l.pgStatusFair
        : l.pgStatusFix;

    return _Card(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(area.icon, size: 19, color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  area.title(l),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            area.meaning(l, answer),
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: Colors.white.withValues(alpha: 0.75),
            ),
          ),
          const SizedBox(height: 14),
          _Eyebrow(good ? l.pgKeepItWith : l.pgFixItWith),
          const SizedBox(height: 4),
          for (final id in area.exercises(answer)) _ExerciseRow(routineId: id),
        ],
      ),
    );
  }
}

class _ExerciseRow extends StatelessWidget {
  final String routineId;
  const _ExerciseRow({required this.routineId});

  Map<String, dynamic>? get _data {
    for (final r in defaultRoutines) {
      if (r['id'] == routineId) return r;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final data = _data;
    if (data == null) return const SizedBox.shrink();
    final title = localizedRoutine(l, routineId)['title'] ?? routineId;
    final duration = localizedDuration(l, data['duration'] as String? ?? '');

    return Semantics(
      button: true,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Haptics.tap();
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (_) => ExerciseDetailScreen(
                routine: Routine.fromJson(
                  defaultRoutines.firstWhere((r) => r['id'] == routineId),
                ),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  data['icon'] as String? ?? '',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
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
                      duration,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                CupertinoIcons.play_circle_fill,
                size: 28,
                color: AppColors.primaryLight.withValues(alpha: 0.9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Retake nudge
// ═════════════════════════════════════════════════════════════════════════════

class _RetakeCard extends StatelessWidget {
  final Map<String, dynamic> latest;
  final VoidCallback onStart;
  const _RetakeCard({required this.latest, required this.onStart});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final last = _checkDate(latest) ?? _today();
    final since = _today().difference(last).inDays;
    final left = _kRetakeDays - since;
    final due = left <= 0;

    return _Card(
      borderColor: due ? AppColors.lime.withValues(alpha: 0.35) : null,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                due ? CupertinoIcons.bell_fill : CupertinoIcons.calendar,
                size: 18,
                color: due ? AppColors.lime : AppColors.primaryLight,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  due ? l.pgRetakeNow : l.pgRetakeIn(left),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            due
                ? l.pgRetakeBodyDue
                : l.pgRetakeBodyWait(
                    _fmt(
                      context,
                      last.add(const Duration(days: _kRetakeDays)),
                      'EEEE d MMM',
                    ),
                  ),
            style: TextStyle(
              fontSize: 13.5,
              height: 1.45,
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 50,
            child: due
                ? FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: onStart,
                    icon: const Icon(CupertinoIcons.camera_fill, size: 18),
                    label: Text(
                      l.pgRetakeCheck,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )
                : OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(
                        color: Colors.white.withValues(alpha: 0.14),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: onStart,
                    child: Text(
                      l.pgRetakeAnyway,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  History
// ═════════════════════════════════════════════════════════════════════════════

class _HistoryCard extends StatelessWidget {
  final List<Map<String, dynamic>> analyses;
  const _HistoryCard({required this.analyses});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final recent = analyses.length > 8
        ? analyses.sublist(analyses.length - 8)
        : analyses;
    final scores = [for (final a in recent) _score(a, 'totalScore')];
    final diff = scores.last - scores.first;

    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: _Eyebrow(l.pgHistoryTitle)),
              if (scores.length >= 2)
                Text(
                  l.pgSinceFirst('${diff > 0 ? '+' : ''}$diff'),
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: diff > 0
                        ? AppColors.lime
                        : Colors.white.withValues(alpha: 0.6),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 14),
          if (scores.length < 2)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                l.pgHistoryOne,
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.45,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),
            )
          else ...[
            SizedBox(
              height: 130,
              child: CustomPaint(
                size: Size.infinite,
                painter: _HistoryPainter(scores: scores),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  _fmt(context, _checkDate(recent.first), 'd MMM'),
                  style: TextStyle(
                    fontSize: 11.5,
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                ),
                const Spacer(),
                Text(
                  _fmt(context, _checkDate(recent.last), 'd MMM'),
                  style: TextStyle(
                    fontSize: 11.5,
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _HistoryPainter extends CustomPainter {
  final List<int> scores;
  _HistoryPainter({required this.scores});

  @override
  void paint(Canvas canvas, Size size) {
    const top = 14.0;
    const bottom = 6.0;
    const labelW = 24.0;
    final chartW = size.width - labelW;
    final chartH = size.height - top - bottom;
    double yFor(num v) => top + chartH * (1 - v / 100);

    // Bands: 80 and 60 are where the label changes.
    final grid = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..strokeWidth = 1;
    for (final v in const [100, 80, 60, 40]) {
      final y = yFor(v);
      canvas.drawLine(Offset(labelW, y), Offset(size.width, y), grid);
      final tp = TextPainter(
        text: TextSpan(
          text: '$v',
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withValues(alpha: 0.35),
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(0, y - tp.height / 2));
    }

    final step = scores.length > 1 ? chartW / (scores.length - 1) : 0.0;
    final pts = [
      for (var i = 0; i < scores.length; i++)
        Offset(labelW + step * i, yFor(scores[i])),
    ];

    final fill = Path()..moveTo(pts.first.dx, yFor(0) - 0);
    for (final p in pts) {
      fill.lineTo(p.dx, p.dy);
    }
    fill
      ..lineTo(pts.last.dx, size.height - bottom)
      ..lineTo(pts.first.dx, size.height - bottom)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary.withValues(alpha: 0.28),
            AppColors.primary.withValues(alpha: 0.0),
          ],
        ).createShader(Offset.zero & size),
    );

    final line = Path()..moveTo(pts.first.dx, pts.first.dy);
    for (final p in pts.skip(1)) {
      line.lineTo(p.dx, p.dy);
    }
    canvas.drawPath(
      line,
      Paint()
        ..color = AppColors.primaryLight
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round,
    );

    for (var i = 0; i < pts.length; i++) {
      final last = i == pts.length - 1;
      canvas.drawCircle(
        pts[i],
        last ? 5.5 : 3.5,
        Paint()..color = last ? _scoreColor(scores[i]) : AppColors.primaryLight,
      );
      if (last) {
        canvas.drawCircle(
          pts[i],
          5.5,
          Paint()
            ..color = AppColors.cardFill
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _HistoryPainter old) =>
      !_sameList(old.scores, scores);

  static bool _sameList(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

class _ScoreRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  _ScoreRingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = math.min(size.width, size.height) / 2 - 10;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final sweep = 2 * math.pi * progress.clamp(0.0, 1.0);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.07)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12,
    );
    // The one glow on this screen.
    canvas.drawArc(
      rect,
      -math.pi / 2,
      sweep,
      false,
      Paint()
        ..color = color.withValues(alpha: 0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 14
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );
    canvas.drawArc(
      rect,
      -math.pi / 2,
      sweep,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _ScoreRingPainter old) =>
      old.progress != progress || old.color != color;
}

// ═════════════════════════════════════════════════════════════════════════════
//  Before the first check
// ═════════════════════════════════════════════════════════════════════════════

class _IntroCard extends StatelessWidget {
  final VoidCallback onStart;
  const _IntroCard({required this.onStart});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return _Card(
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l.pgPostureIntroTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.8,
              height: 1.15,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.pgPostureIntroBody,
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              for (final a in _Area.values) ...[
                if (a != _Area.head) const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.04),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Icon(a.icon, size: 22, color: AppColors.lime),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            a.title(l),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 18),
          _Step(n: 1, text: l.pgPostureStep1),
          _Step(n: 2, text: l.pgPostureStep2),
          _Step(n: 3, text: l.pgPostureStep3),
          const SizedBox(height: 8),
          SizedBox(
            height: 52,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: onStart,
              icon: const Icon(CupertinoIcons.camera_fill, size: 18),
              label: Text(
                l.pgStartCheck,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final int n;
  final String text;
  const _Step({required this.n, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.18),
            ),
            child: Text(
              '$n',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryLight,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Colors.white.withValues(alpha: 0.85),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The result card's shape with no result in it: the three areas and the
/// exercises each one leads to. Shown blurred to free users.
class _PreviewSkeleton extends StatelessWidget {
  const _PreviewSkeleton();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
      child: Column(
        children: [
          SizedBox(
            width: 140,
            height: 140,
            child: CustomPaint(
              painter: _ScoreRingPainter(
                progress: 0.75,
                color: AppColors.primaryLight,
              ),
              child: const Center(
                child: Text(
                  '?',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          for (final a in _Area.values)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Icon(a.icon, size: 20, color: AppColors.lime),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      a.title(l),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    localizedRoutine(l, a.exercises(null).first)['title'] ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _HowItWorksSheet extends StatelessWidget {
  const _HowItWorksSheet();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 38,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l.pgHowItWorks,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.6,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              _Step(n: 1, text: l.pgPostureStep1),
              _Step(n: 2, text: l.pgPostureStep2),
              _Step(n: 3, text: l.pgPostureStep3),
              _Step(n: 4, text: l.pgPostureStep4),
              const SizedBox(height: 4),
              Text(
                l.postureCheckNote,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.45),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.08),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Haptics.tap();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    l.wellnessInfoGotIt,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  The self-check sheet
//
//  The score comes from the user's own answers to three wall-test questions.
//  It used to be three random numbers presented as a photo analysis; the photo
//  is still kept beside the questions, for looking back.
// ═════════════════════════════════════════════════════════════════════════════

/// Head position, shoulders and lower back, each scored from one answer.
class _PostureAnswers {
  final int head;
  final int shoulders;
  final int lowerBack;
  const _PostureAnswers(this.head, this.shoulders, this.lowerBack);
}

class _PostureSelfCheckSheet extends StatefulWidget {
  final String imagePath;
  const _PostureSelfCheckSheet({required this.imagePath});

  @override
  State<_PostureSelfCheckSheet> createState() => _PostureSelfCheckSheetState();
}

class _PostureSelfCheckSheetState extends State<_PostureSelfCheckSheet> {
  // Score per answer, in the order the options are shown.
  static const _headScores = [90, 65, 40];
  static const _shoulderScores = [90, 65, 40];
  // Flat hand = neutral curve; no space = flattened; fist = increased curve.
  static const _lowerBackScores = [90, 70, 50];

  int? _head;
  int? _shoulders;
  int? _lowerBack;

  bool get _complete =>
      _head != null && _shoulders != null && _lowerBack != null;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final media = MediaQuery.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: media.size.height * 0.92),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 38,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        File(widget.imagePath),
                        width: 84,
                        height: 112,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) =>
                            const SizedBox(width: 84, height: 112),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.postureCheckTitle,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            l.postureCheckIntro,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.4,
                              color: Colors.white.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                _Question(
                  question: l.postureQHead,
                  options: [
                    l.postureQHeadA1,
                    l.postureQHeadA2,
                    l.postureQHeadA3,
                  ],
                  selected: _head,
                  onSelect: (i) => setState(() => _head = i),
                ),
                _Question(
                  question: l.postureQShoulders,
                  options: [
                    l.postureQShouldersA1,
                    l.postureQShouldersA2,
                    l.postureQShouldersA3,
                  ],
                  selected: _shoulders,
                  onSelect: (i) => setState(() => _shoulders = i),
                ),
                _Question(
                  question: l.postureQLowerBack,
                  options: [
                    l.postureQLowerBackA1,
                    l.postureQLowerBackA2,
                    l.postureQLowerBackA3,
                  ],
                  selected: _lowerBack,
                  onSelect: (i) => setState(() => _lowerBack = i),
                ),
                const SizedBox(height: 4),
                Text(
                  l.postureCheckNote,
                  style: TextStyle(
                    fontSize: 11.5,
                    color: Colors.white.withValues(alpha: 0.4),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor: Colors.white.withValues(
                        alpha: 0.08,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: _complete
                        ? () {
                            Haptics.success();
                            Navigator.of(context).pop(
                              _PostureAnswers(
                                _headScores[_head!],
                                _shoulderScores[_shoulders!],
                                _lowerBackScores[_lowerBack!],
                              ),
                            );
                          }
                        : null,
                    child: Text(
                      l.postureCheckSave,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Question extends StatelessWidget {
  final String question;
  final List<String> options;
  final int? selected;
  final ValueChanged<int> onSelect;

  const _Question({
    required this.question,
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 15,
              height: 1.35,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          for (var i = 0; i < options.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: GestureDetector(
                onTap: () {
                  Haptics.select();
                  onSelect(i);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: selected == i
                        ? AppColors.primary.withValues(alpha: 0.16)
                        : Colors.white.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selected == i
                          ? AppColors.primary.withValues(alpha: 0.7)
                          : Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Text(
                    options[i],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: selected == i
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
