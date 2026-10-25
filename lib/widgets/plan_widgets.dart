import 'dart:ui' show ImageFilter;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';
import '../utils/daily_targets.dart';
import '../utils/free_tier.dart';
import '../utils/haptics.dart';
import '../utils/localized_data.dart';
import '../utils/meal_plan.dart';
import 'exercise_media.dart';
import 'free_tier_widgets.dart';
import 'premium_paywall.dart';
import '../utils/text_case.dart';

// ═════════════════════════════════════════════════════════════════════════
//  Labels
// ═════════════════════════════════════════════════════════════════════════

/// "3 x 12 reps", "3 x 30 s", "2 x 30 s each side", "10 min".
String doseLabel(AppLocalizations l, MoveDose d) => switch (d.kind) {
      DoseKind.reps => l.plDoseReps(d.sets, d.amount),
      DoseKind.hold || DoseKind.timed => d.perSide
          ? l.plDoseSecondsSide(d.sets, d.amount)
          : l.plDoseSeconds(d.sets, d.amount),
      DoseKind.session => l.plDoseMinutes(d.amount),
    };

String moveTitle(AppLocalizations l, String routineId) {
  final t = localizedRoutine(l, routineId)['title'];
  return (t == null || t.isEmpty) ? routineId : t;
}

String foodLabel(AppLocalizations l, String id) => switch (id) {
      'oats' => l.plFoodOats,
      'milk' => l.plFoodMilk,
      'banana' => l.plFoodBanana,
      'walnuts' => l.plFoodWalnuts,
      'greekYogurt' => l.plFoodGreekYogurt,
      'yogurt' => l.plFoodYogurt,
      'eggs' => l.plFoodEggs,
      'bread' => l.plFoodBread,
      'whiteCheese' => l.plFoodWhiteCheese,
      'hardCheese' => l.plFoodHardCheese,
      'salad' => l.plFoodSalad,
      'orange' => l.plFoodOrange,
      'peanutButter' => l.plFoodPeanutButter,
      'spinach' => l.plFoodSpinach,
      'cottageCheese' => l.plFoodCottageCheese,
      'chicken' => l.plFoodChicken,
      'bulgur' => l.plFoodBulgur,
      'ayran' => l.plFoodAyran,
      'tuna' => l.plFoodTuna,
      'pasta' => l.plFoodPasta,
      'beef' => l.plFoodBeef,
      'rice' => l.plFoodRice,
      'brownRice' => l.plFoodBrownRice,
      'chickpeas' => l.plFoodChickpeas,
      'salmon' => l.plFoodSalmon,
      'broccoli' => l.plFoodBroccoli,
      'potato' => l.plFoodPotato,
      'lentils' => l.plFoodLentils,
      'sardines' => l.plFoodSardines,
      'almonds' => l.plFoodAlmonds,
      'kefir' => l.plFoodKefir,
      'pumpkinSeeds' => l.plFoodPumpkinSeeds,
      _ => id,
    };

/// "60 g", "250 ml", "2 pcs".
String amountLabel(AppLocalizations l, MealItem i) => switch (i.food.unit) {
      FoodUnit.grams => '${i.amount} g',
      FoodUnit.millilitres => '${i.amount} ml',
      FoodUnit.pieces => l.plPieces(i.amount),
    };

String mealSlotLabel(AppLocalizations l, MealSlot s) => switch (s) {
      MealSlot.breakfast => l.breakfast,
      MealSlot.lunch => l.lunch,
      MealSlot.dinner => l.dinner,
      MealSlot.snack => l.plSnack,
    };

IconData mealSlotIcon(MealSlot s) => switch (s) {
      MealSlot.breakfast => CupertinoIcons.sunrise_fill,
      MealSlot.lunch => CupertinoIcons.sun_max_fill,
      MealSlot.dinner => CupertinoIcons.moon_fill,
      MealSlot.snack => Icons.apple_rounded,
    };

// ═════════════════════════════════════════════════════════════════════════
//  Building blocks
// ═════════════════════════════════════════════════════════════════════════

/// The standard card: dark fill, 1 px white border at 6 %, radius 24.
class PlanCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? borderColor;
  const PlanCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
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

/// Small caps section title with an optional trailing note.
class PlanSectionLabel extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final Color color;
  final Color? trailingColor;

  /// A small widget before [trailing], such as the free tier's chip.
  final Widget? badge;
  const PlanSectionLabel({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.color = AppColors.primary,
    this.trailingColor,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Row(
        children: [
          Icon(icon, size: 15, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title.upperIn(context),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
                color: Colors.white.withValues(alpha: 0.62),
              ),
            ),
          ),
          if (badge != null) ...[const SizedBox(width: 8), badge!],
          if (trailing != null) ...[
            const SizedBox(width: 8),
            Text(
              trailing!,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: trailingColor ?? Colors.white.withValues(alpha: 0.45),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// The tick box every list in My Plan uses.
class PlanCheck extends StatelessWidget {
  final bool done;
  final Color color;
  final VoidCallback? onTap;
  final double size;

  /// An open box that is not the user's to tick now (the free tier ran
  /// out): it carries a small lock.
  final bool locked;
  const PlanCheck({
    super.key,
    required this.done,
    this.color = AppColors.success,
    this.onTap,
    this.size = 28,
    this.locked = false,
  });

  @override
  Widget build(BuildContext context) {
    final box = AnimatedContainer(
      duration: MediaQuery.of(context).disableAnimations
          ? Duration.zero
          : const Duration(milliseconds: 200),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: done ? color : Colors.transparent,
        borderRadius: BorderRadius.circular(size * 0.34),
        border: Border.all(
          color: done ? color : Colors.white.withValues(alpha: 0.24),
          width: 1.6,
        ),
      ),
      child: done
          ? Icon(
              Icons.check_rounded,
              size: size * 0.66,
              color: color.computeLuminance() > 0.5
                  ? const Color(0xFF07050F)
                  : Colors.white,
            )
          : locked
          ? Icon(
              CupertinoIcons.lock_fill,
              size: size * 0.42,
              color: AppColors.warning.withValues(alpha: 0.8),
            )
          : null,
    );
    if (onTap == null) return box;
    // A 44 pt target around the visible box.
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(padding: const EdgeInsets.all(8), child: box),
    );
  }
}

/// A move's still, or a tinted icon when it has no clip.
class MoveThumb extends StatelessWidget {
  final String routineId;
  final String icon;
  final double width;
  final double height;
  const MoveThumb({
    super.key,
    required this.routineId,
    this.icon = '',
    this.width = 48,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    if (ExerciseMedia.hasClip(routineId)) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(
          ExerciseMedia.posterFor(routineId),
          width: width,
          height: height,
          fit: BoxFit.cover,
          cacheWidth: (width * 3).round(),
          errorBuilder: (_, _, _) => _fallback(),
        ),
      );
    }
    return _fallback();
  }

  Widget _fallback() => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: icon.isNotEmpty
              ? Text(icon, style: const TextStyle(fontSize: 22))
              : const Icon(Icons.accessibility_new_rounded,
                  color: AppColors.primaryLight, size: 22),
        ),
      );
}

/// One line of a plan: tick, still, title, dose, chevron to the detail.
class PlanItemRow extends StatelessWidget {
  final String routineId;
  final String title;
  final String subtitle;
  final String icon;
  final bool done;
  final bool showThumb;
  final Color accent;
  final VoidCallback? onToggle;
  final VoidCallback? onOpen;
  final VoidCallback? onLongPress;

  /// Shows the tick box locked (see [PlanCheck.locked]).
  final bool locked;
  const PlanItemRow({
    super.key,
    required this.routineId,
    required this.title,
    required this.subtitle,
    this.icon = '',
    required this.done,
    this.showThumb = true,
    this.accent = AppColors.success,
    this.onToggle,
    this.onOpen,
    this.onLongPress,
    this.locked = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onOpen,
      onLongPress: onLongPress,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            PlanCheck(
              done: done,
              color: accent,
              onTap: onToggle,
              locked: locked,
            ),
            const SizedBox(width: 4),
            if (showThumb) ...[
              MoveThumb(routineId: routineId, icon: icon),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.5,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: done
                          ? Colors.white.withValues(alpha: 0.5)
                          : Colors.white,
                      decoration: done ? TextDecoration.lineThrough : null,
                      decorationColor: Colors.white.withValues(alpha: 0.4),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            if (onOpen != null) ...[
              const SizedBox(width: 6),
              Icon(
                CupertinoIcons.chevron_right,
                size: 14,
                color: Colors.white.withValues(alpha: 0.25),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// The real content, blurred, with one unlock button over it.
class LockedPreview extends StatelessWidget {
  final Widget child;
  final String title;
  final String? body;

  /// The free-tier feature behind the lock, so the paywall can say why.
  final FreeFeature? feature;
  const LockedPreview({
    super.key,
    required this.child,
    required this.title,
    this.body,
    this.feature,
  });

  void _unlock(BuildContext context) {
    Haptics.tap();
    final f = feature;
    if (f != null) {
      showPaywallFor(context, f);
    } else {
      showPremiumPaywall(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    // A tap anywhere on the blurred preview opens the paywall, not only the
    // button: people tap the thing they want.
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _unlock(context),
      child: ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          // Tall enough for the lock, the line and the button even over a
          // short strip such as the level week.
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: body == null ? 150 : 200),
            child: IgnorePointer(
              child: ExcludeSemantics(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: child,
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
                  colors: [
                    AppColors.scaffold.withValues(alpha: 0.15),
                    AppColors.scaffold.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width - 72,
                    ),
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.warning.withValues(alpha: 0.14),
                        border: Border.all(
                          color: AppColors.warning.withValues(alpha: 0.5),
                        ),
                      ),
                      child: const Icon(CupertinoIcons.lock_fill,
                          size: 19, color: AppColors.warning),
                    ),
                    if (body != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        body!,
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.35,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    PlanButton(
                      label: title,
                      color: AppColors.warning,
                      icon: CupertinoIcons.lock_open_fill,
                      onTap: () => _unlock(context),
                    ),
                  ],
                ),
                  ),
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

/// A full-width button, filled with [color].
class PlanButton extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool outlined;

  /// A small widget after the label, such as the free tier's "1 free" chip.
  final Widget? badge;
  const PlanButton({
    super.key,
    required this.label,
    this.color = AppColors.primary,
    this.icon,
    this.onTap,
    this.outlined = false,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    final dark = color.computeLuminance() > 0.5;
    final fg = outlined
        ? color
        : enabled
            ? (dark ? const Color(0xFF07050F) : Colors.white)
            : Colors.white.withValues(alpha: 0.4);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: outlined
              ? color.withValues(alpha: 0.10)
              : enabled
                  ? color
                  : Colors.white.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(16),
          border: outlined
              ? Border.all(color: color.withValues(alpha: 0.4))
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 17, color: fg),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: fg,
                ),
              ),
            ),
            if (badge != null) ...[const SizedBox(width: 8), badge!],
          ],
        ),
      ),
    );
  }
}

/// A number with its unit small and dimmed: "98 g".
class PlanNumber extends StatelessWidget {
  final String value;
  final String unit;
  final double size;
  final Color color;
  const PlanNumber(
    this.value,
    this.unit, {
    super.key,
    this.size = 22,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: value,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.6,
            height: 1.05,
            color: color,
          ),
        ),
        if (unit.isNotEmpty)
          TextSpan(
            text: ' $unit',
            style: TextStyle(
              fontSize: size * 0.5,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
      ]),
      maxLines: 1,
      overflow: TextOverflow.fade,
      softWrap: false,
    );
  }
}
