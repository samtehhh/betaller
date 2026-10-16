import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';
import '../utils/free_tier.dart';
import '../utils/haptics.dart';
import 'free_tier_widgets.dart';
import 'premium_paywall.dart';

/// A premium area seen from the outside: the real content, blurred, with a
/// lock on it, and below it one line of what it does and one unlock button.
/// Used by the progress tools (photos, posture, the weekly report, the score
/// breakdown) so a free user sees what is inside before being asked to pay
/// for it, and after a free use has run out.
class ProgressLockedPreview extends StatelessWidget {
  final Widget preview;
  final String title;
  final String body;

  /// The free tier feature this locks, for the paywall's reason line.
  final FreeFeature? feature;

  /// A tall preview is cut to this height, so the unlock button stays on
  /// screen.
  final double? maxHeight;

  const ProgressLockedPreview({
    super.key,
    required this.preview,
    required this.title,
    required this.body,
    this.feature,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              // The preview sets the size; it is never interactive.
              IgnorePointer(
                child: ExcludeSemantics(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Opacity(
                      opacity: 0.85,
                      child: maxHeight == null
                          ? preview
                          : SizedBox(
                              height: maxHeight,
                              child: ClipRect(
                                child: OverflowBox(
                                  alignment: Alignment.topCenter,
                                  minHeight: 0,
                                  maxHeight: double.infinity,
                                  child: preview,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.6, 1.0],
                      colors: [
                        AppColors.cardFill.withValues(alpha: 0.0),
                        AppColors.cardFill.withValues(alpha: 0.35),
                        AppColors.cardFill,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.scaffold.withValues(alpha: 0.8),
                      border: Border.all(
                        color: AppColors.warning.withValues(alpha: 0.6),
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.lock_fill,
                      color: AppColors.warning,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.45,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 18),
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
                    onPressed: () {
                      Haptics.tap();
                      final f = feature;
                      f == null
                          ? showPremiumPaywall(context)
                          : showPaywallFor(context, f);
                    },
                    icon: const Icon(CupertinoIcons.lock_open_fill, size: 18),
                    label: Text(
                      l.pgUnlockPro,
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
        ],
      ),
    );
  }
}
