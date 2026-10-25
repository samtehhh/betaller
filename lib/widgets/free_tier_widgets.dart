import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../services/analytics.dart';
import '../utils/constants.dart';
import '../utils/free_tier.dart';
import '../utils/haptics.dart';
import 'premium_paywall.dart';

// The free tier as the user sees it, in three states that look the same on
// every screen:
//
//   before use   a small lime chip ("1 free", "Free today") on the action;
//   after use    the content still on screen, a gold lock, one unlock button;
//   the moment   the first tap after a quota ran out opens a short sheet
//                saying so, once; later taps go straight to the paywall with
//                a line saying what the tap needed.

/// The paywall's one-line reason for [f].
String freeReason(AppLocalizations l, FreeFeature f) => switch (f) {
  FreeFeature.workout => l.ftWhyWorkout,
  FreeFeature.planTicks => l.ftWhyPlan,
  FreeFeature.program => l.ftWhyProgram,
  FreeFeature.water => l.ftWhyWater,
  FreeFeature.sleep => l.ftWhySleep,
  FreeFeature.nutrition => l.ftWhyNutrition,
  FreeFeature.posture => l.ftWhyPosture,
  FreeFeature.photoCompare => l.ftWhyPhotos,
  FreeFeature.weeklyReport => l.ftWhyReport,
  FreeFeature.scoreBreakdown => l.ftWhyScore,
  FreeFeature.article => l.ftWhyArticle,
};

/// The chip text while [f] still has a free use: "Free today" for the
/// first-day features, "1 free" for the counted ones.
String freeChipLabel(AppLocalizations l, FreeFeature f) =>
    f.firstDayOnly ? l.ftFreeToday : l.ftOneFree;

(String, String) _outCopy(AppLocalizations l, FreeFeature f) => switch (f) {
  FreeFeature.workout => (l.ftOutWorkoutTitle, l.ftOutWorkoutBody),
  FreeFeature.posture => (l.ftOutPostureTitle, l.ftOutPostureBody),
  FreeFeature.photoCompare => (l.ftOutPhotosTitle, l.ftOutPhotosBody),
  FreeFeature.weeklyReport => (l.ftOutReportTitle, l.ftOutReportBody),
  FreeFeature.scoreBreakdown => (l.ftOutScoreTitle, l.ftOutScoreBody),
  FreeFeature.article => (l.ftOutArticleTitle, l.ftOutArticleBody),
  _ => (l.ftOutDayTitle, l.ftOutDayBody),
};

/// Opens the paywall for a locked tap on [f], with its reason line.
Future<bool?> showPaywallFor(BuildContext context, FreeFeature f) {
  final l = AppLocalizations.of(context)!;
  return showPremiumPaywall(
    context,
    reason: freeReason(l, f),
    source: 'feature_${f.name}',
  );
}

/// The limit sheet on screen, if any. Like the paywall's guard, a route
/// whose navigator went away without popping it does not count.
Route<bool>? _openSheet;

bool get _sheetOpen => _openSheet?.isActive ?? false;

/// A tap on [f] that its quota no longer covers. The first time for this
/// quota: the friendly "you've used it" sheet. After that: the paywall,
/// saying why. Never more than one of either on screen.
Future<void> showFreeLimit(BuildContext context, FreeFeature f) async {
  final provider = context.read<AppProvider>();
  if (!provider.isMetered || _sheetOpen || isPaywallOpen) return;
  Haptics.tap();
  Analytics.track('free_limit', {
    'feature': f.name,
    'first': !provider.freeOutNoticed(f),
  });
  if (provider.freeOutNoticed(f)) {
    await showPaywallFor(context, f);
    return;
  }
  provider.markFreeOutNoticed(f);
  final navigator = Navigator.of(context);
  final route = ModalBottomSheetRoute<bool>(
    builder: (_) => FreeLimitSheet(feature: f),
    capturedThemes: InheritedTheme.capture(
      from: context,
      to: navigator.context,
    ),
    barrierLabel: MaterialLocalizations.of(
      context,
    ).scrimOnTapHint(MaterialLocalizations.of(context).bottomSheetLabel),
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
  );
  _openSheet = route;
  bool? wantsPro;
  try {
    wantsPro = await navigator.push(route);
  } finally {
    if (identical(_openSheet, route)) _openSheet = null;
  }
  if (wantsPro == true && context.mounted) await showPaywallFor(context, f);
}

/// True when [f] may go ahead now. Otherwise shows [showFreeLimit] and
/// returns false.
bool guardFree(BuildContext context, FreeFeature f) {
  if (context.read<AppProvider>().canUseFree(f)) return true;
  showFreeLimit(context, f);
  return false;
}

/// The sheet shown the first time a quota runs out.
class FreeLimitSheet extends StatelessWidget {
  final FreeFeature feature;
  const FreeLimitSheet({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final (title, body) = _outCopy(l, feature);
    return Container(
      padding: EdgeInsets.fromLTRB(
        24,
        14,
        24,
        18 + MediaQuery.of(context).viewPadding.bottom,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        border: Border(
          top: BorderSide(color: AppColors.warning.withValues(alpha: 0.25)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 22),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.warning.withValues(alpha: 0.12),
              border: Border.all(
                color: AppColors.warning.withValues(alpha: 0.5),
              ),
            ),
            child: const Icon(
              CupertinoIcons.lock_fill,
              size: 26,
              color: AppColors.warning,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.6,
              height: 1.2,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.5,
              height: 1.45,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                Haptics.tap();
                Navigator.pop(context, true);
              },
              icon: const Icon(CupertinoIcons.lock_open_fill, size: 18),
              label: Text(
                l.ftContinuePro,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          TextButton(
            onPressed: () {
              Haptics.tap();
              Navigator.pop(context, false);
            },
            child: Text(
              l.ftNotNow,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The small lime "1 free" / "Free today" pill.
class FreeChip extends StatelessWidget {
  final String label;

  /// Sits on a filled button: a dark fill keeps the lime readable on colour.
  final bool onFill;
  const FreeChip({super.key, required this.label, this.onFill = false});

  /// The chip for [f], or nothing when [f] has no free use to show: premium,
  /// or the quota is gone.
  static Widget? forFeature(
    BuildContext context,
    FreeFeature f, {
    bool onFill = false,
  }) {
    final p = context.watch<AppProvider>();
    if (!p.isMetered || p.freeLeft(f) <= 0) return null;
    // A counted feature already opened this session shows no chip: its use
    // is the one on screen.
    if (!f.firstDayOnly && p.freeOpenThisSession(f)) return null;
    return FreeChip(
      label: freeChipLabel(AppLocalizations.of(context)!, f),
      onFill: onFill,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: onFill
            ? const Color(0xFF07050F).withValues(alpha: 0.55)
            : AppColors.lime.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: AppColors.lime.withValues(alpha: onFill ? 0.6 : 0.4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(CupertinoIcons.gift_fill, size: 11, color: AppColors.lime),
          const SizedBox(width: 4),
          Text(
            label,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: AppColors.lime,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

/// The locked state inside a list that stays readable: a gold lock, one
/// line, one unlock button.
class FreeLockBanner extends StatelessWidget {
  final FreeFeature feature;
  final String body;
  const FreeLockBanner({super.key, required this.feature, required this.body});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.warning.withValues(alpha: 0.14),
            ),
            child: const Icon(
              CupertinoIcons.lock_fill,
              size: 16,
              color: AppColors.warning,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              body,
              style: TextStyle(
                fontSize: 12.5,
                height: 1.35,
                fontWeight: FontWeight.w600,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Haptics.tap();
              showPaywallFor(context, feature);
            },
            child: Container(
              constraints: const BoxConstraints(minHeight: 40, maxWidth: 130),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.warning,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                widthFactor: 1,
                child: Text(
                  l.pgUnlockPro,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                    color: Color(0xFF07050F),
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
