import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'height_silhouette.dart' show CensoredText;
import '../l10n/app_localizations.dart';
import '../services/notification_service.dart';
import '../utils/haptics.dart';
import '../providers/app_provider.dart';
import '../services/analytics.dart';
import '../services/purchase_service.dart';
import '../utils/constants.dart';
import '../utils/daily_targets.dart' show programText;
import '../utils/design_tokens.dart';
import '../utils/localized_data.dart';
import 'achievement_medal.dart';
import 'height_silhouette.dart' show BodyFigure;
import 'paywall_previews.dart';
import 'phone_mockup.dart';
import 'plan_widgets.dart' show MoveThumb;

/// Opens the paywall. [closeDelay] holds the close button back for a moment,
/// for the placements the app opens on its own (end of onboarding, first
/// launch of the day) — long enough to read the offer, not a trap: the button
/// always arrives.
///
/// [reason] is one short line saying what the tap that led here needs ("Logging
/// water is part of Pro"), shown above the plans.
///
/// [personal] puts the user's own result above the tour: the end of the
/// onboarding opens the sheet with it. Everything else (plans, purchase,
/// restore, legal) is the same sheet.
///
/// Only one paywall is ever on screen: a call while one is open returns null
/// and opens nothing.
Future<bool?> showPremiumPaywall(
  BuildContext context, {
  Duration closeDelay = Duration.zero,
  String? reason,
  PaywallPersonal? personal,
  String source = 'other',
}) async {
  if (!context.mounted) return false;
  if (isPaywallOpen) return null;
  Analytics.track('paywall_view', {'source': source});
  // Keeps the rating prompt out of the minutes after a sales screen.
  try {
    context.read<AppProvider>().notePaywallShown();
  } catch (_) {}
  final route = CupertinoPageRoute<bool>(
    fullscreenDialog: true,
    builder: (_) => PremiumPaywallScreen(
      closeDelay: closeDelay,
      reason: reason,
      personal: personal,
    ),
  );
  _openPaywall = route;
  try {
    final bought = await Navigator.push<bool>(context, route);
    Analytics.track('paywall_close', {
      'source': source,
      'bought': bought == true,
    });
    return bought;
  } finally {
    if (identical(_openPaywall, route)) _openPaywall = null;
  }
}

/// Tests walk through the paywall without the exit question.
@visibleForTesting
bool paywallAsksOnExit = true;

/// The paywall route on screen, if any.
Route<bool>? _openPaywall;

/// Whether a paywall is on screen now. A route whose navigator went away
/// without popping it (a torn-down tree) does not count.
bool get isPaywallOpen => _openPaywall?.isActive ?? false;

// ═════════════════════════════════════════════════════════════════════════════
//  Paywall Screen
//
//  Two halves that never trade places: the tour on top, the purchase below.
//  The tour advances itself every few seconds so a user who reads rather than
//  swipes still sees all seven screens, and the plan pills and the CTA stay
//  exactly where they were on the first frame — the earlier build slid the
//  buttons around with the pages, which cost the tap as often as it earned it.
// ═════════════════════════════════════════════════════════════════════════════

/// How long each screen holds before the tour moves on.
const Duration _kSlideDuration = Duration(milliseconds: 2800);

/// After a manual swipe the tour waits this long before taking over again, so
/// it never yanks a screen away from someone who is still looking at it.
const Duration _kResumeDelay = Duration(seconds: 7);

/// The sheet's chrome (page, plan rows, button, dots) in the brand purple of
/// the app tabs, whatever preview is showing; each preview keeps its own
/// colours inside the phone. Until Oct 2026 the whole screen took on the
/// preview's accent (green, cyan, amber, orange, indigo, pink) with a glow
/// behind it, so the paywall looked like a different app on every slide.
/// False brings that back.
const bool _kPaywallBrandChrome = true;

/// The Nov 2026 sheet: above the plans, three overlapping cards made of the
/// app's own best pieces (a workout still, the locked potential, a streak
/// medal) and under them what Pro holds, named in six short lines, in place
/// of the phone mock-up tour; and the three plans side by side on one line
/// instead of stacked rows. False brings the tour and the rows back.
const bool _kPaywallV4 = true;

/// The sheet as a page to read (Nov 2026): the three plans pinned under the
/// top bar, the buy button pinned at the bottom, and between them a column
/// that scrolls through what Pro holds, one drawn picture per feature.
/// False puts the plans back in the bottom sheet under a fixed hero.
const bool _kPaywallScroll = true;

/// Which part of the purchase sheet an instance draws.
enum _SheetPart { all, plans, action }

// ── Debug-only demo prices ───────────────────────────────────────────────
//
// Never reach a real user: every use below is gated on [kDebugMode], so a
// release build always falls through to the real store price or "—" —
// never a number nobody is actually being charged. These exist purely so
// the sheet is reviewable on a device before the store products are
// approved/configured (App Store Connect, RevenueCat), matching the plan
// names discussed for BeTaller (weekly/monthly/lifetime).
const double _kDemoWeekly = 2.99;
const double _kDemoMonthly = 4.99;
const double _kDemoLifetime = 11.99;
const String _kDemoCurrency = 'USD';
// The monthly plan's free trial in App Store Connect since 2026-11-06.
const int _kDemoMonthlyTrialDays = 7;

String? _demoPrice(double amount) {
  if (!kDebugMode) return null;
  return NumberFormat.simpleCurrency(name: _kDemoCurrency).format(amount);
}

/// One plan as the sheet needs it: what the store charges, and how many days
/// it gives away first.
class _PlanOffer {
  /// The store's own price string, or null when the offering has not loaded.
  /// Never a hardcoded stand-in — see the note where this is built.
  final String? price;

  /// The store's raw numeric price, in the store's own currency. Only used to
  /// compute the yearly-vs-monthly savings percentage and the per-week
  /// equivalent — never shown directly, since a bare number carries no
  /// currency and [price] already has one.
  final double? rawPrice;

  /// ISO 4217 code for [rawPrice], needed to format a derived amount (the
  /// per-week equivalent) in the store's own currency rather than guessing
  /// one from the device locale.
  final String? currencyCode;

  /// Free days up front, or null for a plan that starts billing immediately.
  final int? trialDays;

  const _PlanOffer({
    required this.price,
    this.rawPrice,
    this.currencyCode,
    required this.trialDays,
  });

  bool get hasTrial => trialDays != null && trialDays! > 0;
}

/// The free trial the store is actually offering on this product, in days, or
/// null when it offers none. An introductory price above zero is a discount,
/// not a trial, and is not advertised as one. Onboarding's budget page uses it
/// too, so both screens advertise the same trial or none.
int? freeTrialDays(StoreProduct? product) {
  final intro = product?.introductoryPrice;
  if (intro == null || intro.price > 0) return null;
  final n = intro.periodNumberOfUnits;
  switch (intro.periodUnit) {
    case PeriodUnit.day:
      return n;
    case PeriodUnit.week:
      return n * 7;
    case PeriodUnit.month:
      return n * 30;
    case PeriodUnit.year:
      return n * 365;
    case PeriodUnit.unknown:
      return null;
  }
}

/// The user's own result, for the paywall that closes the onboarding: a
/// headline with the height their plan aims at, a line saying that height is
/// an estimate, and up to three lines taken from their answers.
class PaywallPersonal {
  final String headline;

  /// Says a number in [headline] is an estimate. Empty when none is shown.
  final String estimateNote;

  /// Icon and text, at most three are shown.
  final List<(IconData, String)> lines;

  const PaywallPersonal({
    required this.headline,
    required this.estimateNote,
    this.lines = const [],
  });
}

class PremiumPaywallScreen extends StatefulWidget {
  final bool dismissible;
  final Duration closeDelay;

  /// What the tap that opened the sheet needs, in one short line.
  final String? reason;

  /// The user's result above the tour, or null for the usual sheet.
  final PaywallPersonal? personal;
  const PremiumPaywallScreen({
    super.key,
    this.dismissible = true,
    this.closeDelay = Duration.zero,
    this.reason,
    this.personal,
  });
  @override
  State<PremiumPaywallScreen> createState() => _PremiumPaywallScreenState();
}

class _PremiumPaywallScreenState extends State<PremiumPaywallScreen> {
  Offerings? _offerings;
  List<StoreProduct> _directProducts = [];

  /// Product id -> may this Apple ID still take the free trial. Missing means
  /// unknown, and the store's own offer stands.
  Map<String, bool> _trialEligible = const {};
  bool _loading = true;
  bool _purchasing = false;

  /// When this screen opened. A tap in the first moments is the same finger
  /// still pressing "next" on the screen before, not a decision to pay:
  /// 16 of 17 buy taps ended on Apple's sheet within seconds.
  final _openedAt = DateTime.now();

  /// 0 monthly, 1 lifetime, 2 weekly. Settled by [_defaultPlan] once the store
  /// answers, unless the user has already tapped a plan themselves.
  int _selectedPlan = 1;
  bool _userPicked = false;

  late bool _closeVisible = widget.closeDelay == Duration.zero;
  Timer? _closeTimer;

  /// Index into the endless page list; the slide shown is this modulo the
  /// number of previews.
  int _rawPage = 0;
  final PageController _pageCtrl = PageController();
  Timer? _advance;
  Timer? _resume;

  int get _slide => _rawPage % kPaywallPreviews.length;
  PaywallPreview get _preview => kPaywallPreviews[_slide];

  @override
  void initState() {
    super.initState();
    _startAutoAdvance();
    _loadOfferings();
    if (!_closeVisible) {
      _closeTimer = Timer(widget.closeDelay, () {
        if (mounted) setState(() => _closeVisible = true);
      });
    }
  }

  @override
  void dispose() {
    _advance?.cancel();
    _resume?.cancel();
    _closeTimer?.cancel();
    _pageCtrl.dispose();
    super.dispose();
  }

  void _startAutoAdvance() {
    _advance?.cancel();
    // One-shot and re-armed after each move, not periodic: a tick that arrives
    // while the last one is still animating would otherwise stack up.
    _advance = Timer(_kSlideDuration, _advanceOnce);
  }

  Future<void> _advanceOnce() async {
    if (!mounted) return;
    if (_pageCtrl.hasClients) {
      await _pageCtrl.animateToPage(
        _rawPage + 1,
        duration: const Duration(milliseconds: 620),
        curve: Curves.easeInOutCubic,
      );
    }
    if (mounted) _startAutoAdvance();
  }

  /// The user took the wheel. Stop advancing, and hand it back only after they
  /// have gone quiet.
  void _pauseAutoAdvance() {
    _advance?.cancel();
    _resume?.cancel();
    _resume = Timer(_kResumeDelay, () {
      if (mounted) _startAutoAdvance();
    });
  }

  Future<void> _loadOfferings() async {
    final service = PurchaseService();
    final o = await service.getOfferings();
    final direct = await service.getProducts();
    final eligible = await service.trialEligibility(const [
      PurchaseService.monthlyProductId,
      PurchaseService.weeklyProductId,
    ]);
    if (mounted) {
      setState(() {
        _offerings = o;
        _directProducts = direct;
        _trialEligible = eligible;
        _loading = false;
        if (!_userPicked) _selectedPlan = _defaultPlan();
      });
    }
  }

  /// [id] as the store sells it, from the offering or the direct fetch.
  StoreProduct? _storeProduct(String id) {
    for (final p in _offerings?.current?.availablePackages ?? const []) {
      if (p.storeProduct.identifier == id) return p.storeProduct;
    }
    for (final p in _directProducts) {
      if (p.identifier == id) return p;
    }
    return null;
  }

  /// Free days this user can actually get on [product]: the store's offer,
  /// unless RevenueCat says this Apple ID has already used it.
  int? _trialFor(StoreProduct? product) {
    if (product == null) return null;
    if (_trialEligible[product.identifier] == false) return null;
    return freeTrialDays(product);
  }

  /// The monthly plan's trial; in debug builds without store products, the
  /// demo trial, so the sheet is reviewable before the store answers.
  int? _monthlyTrial(StoreProduct? product) {
    if (product == null) return kDebugMode ? _kDemoMonthlyTrialDays : null;
    return _trialFor(product);
  }

  /// The plan the sheet opens on: the first plan that starts with a free
  /// trial this user can still get (monthly, then weekly; the monthly trial
  /// came back on 2026-11-06, after all nine buy taps since 1.7.3 turned back
  /// at Apple's sheet); otherwise weekly, the smallest commitment; then
  /// lifetime.
  int _defaultPlan() {
    final weekly = _storeProduct(PurchaseService.weeklyProductId);
    final monthly = _storeProduct(PurchaseService.monthlyProductId);
    if ((_monthlyTrial(monthly) ?? 0) > 0) return 0;
    if ((_trialFor(weekly) ?? 0) > 0) return 2;
    if (weekly != null) return 2;
    if (_storeProduct(PurchaseService.lifetimeProductId) != null) return 1;
    return 1;
  }

  Future<void> _purchase(
    Package? pkg, {
    StoreProduct? product,
    _PlanOffer? offer,
    String? billed,
  }) async {
    if (_purchasing) return;
    if (DateTime.now().difference(_openedAt) <
        const Duration(milliseconds: 1200)) {
      return;
    }
    HapticFeedback.mediumImpact();
    setState(() => _purchasing = true);
    var outcome = PurchaseOutcome.failed;
    if (pkg != null) {
      outcome = await PurchaseService().purchasePackage(pkg);
    } else if (product != null) {
      outcome = await PurchaseService().purchaseProduct(product);
    }
    if (!mounted) return;
    setState(() => _purchasing = false);
    switch (outcome) {
      case PurchaseOutcome.success:
        final provider = context.read<AppProvider>();
        Haptics.celebrate();
        provider.setPremium(true);
        _rescheduleReminders();
        if (offer != null && offer.hasTrial && billed != null) {
          final now = DateTime.now();
          unawaited(
            NotificationService().scheduleTrialNotices(
              started: now,
              l: AppLocalizations.of(context)!,
              context: provider.reminderContext,
            ),
          );
        }
        if (widget.dismissible) Navigator.pop(context, true);
      case PurchaseOutcome.cancelled:
        // The user closed the store sheet on purpose. Telling them the
        // purchase could not be completed reads as an error they caused.
        break;
      case PurchaseOutcome.failed:
        _showStoreUnavailable();
    }
  }

  /// The store said no — a cancelled sheet, an unreachable billing service, or
  /// a build whose RevenueCat key is not configured. Either way the user needs
  /// to see that nothing was bought.
  void _showStoreUnavailable() {
    if (!mounted) return;
    final l = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l.purchaseUnavailable),
        backgroundColor: AppColors.surfaceDark,
      ),
    );
  }

  Future<void> _redeemPromoCode() async {
    if (!Platform.isIOS) return;
    await Purchases.presentCodeRedemptionSheet();
    if (!mounted) return;
    final ok = await PurchaseService().checkEntitlement();
    if (!mounted) return;
    if (ok) {
      context.read<AppProvider>().setPremium(true);
      _rescheduleReminders();
      if (widget.dismissible) Navigator.pop(context, true);
    }
  }

  Future<void> _restore() async {
    setState(() => _purchasing = true);
    final ok = await PurchaseService().restore();
    if (!mounted) return;
    setState(() => _purchasing = false);
    if (ok) {
      context.read<AppProvider>().setPremium(true);
      _rescheduleReminders();
      if (widget.dismissible) Navigator.pop(context, true);
    } else {
      final l = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.paywallRestore),
          backgroundColor: AppColors.surfaceDark,
        ),
      );
    }
  }

  /// Reminders with the user's own numbers come with Pro: the moment it is
  /// unlocked they are rescheduled with those figures, without waiting for
  /// the next launch.
  void _rescheduleReminders() {
    final provider = context.read<AppProvider>();
    unawaited(
      NotificationService().scheduleReminders(
        provider.reminders,
        AppLocalizations.of(context)!,
        context: provider.reminderContext,
      ),
    );
  }

  /// The calendar day the exit question was last asked: once a day at most,
  /// and leaving stays one tap away.
  static String? _exitAskedOn;

  Future<void> _onClose() async {
    final today = DateTime.now().toIso8601String().substring(0, 10);
    if (!paywallAsksOnExit || _exitAskedOn == today) {
      Navigator.pop(context, false);
      return;
    }
    _exitAskedOn = today;
    final l = AppLocalizations.of(context)!;
    final leave = await showCupertinoDialog<bool>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(l.hkLeaveTitle),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l.ftNotNow),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l.hkLeaveOpen),
          ),
        ],
      ),
    );
    Analytics.track('paywall_exit_prompt', {'left': leave == true});
    if (leave == true && mounted) Navigator.pop(context, false);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final media = MediaQuery.of(context);
    final topPad = media.padding.top;
    final bottomPad = media.padding.bottom;
    // The personal result alone, without the tour, where both would not fit:
    // below about 840 pt the device left between them is a sliver.
    final personalOnly = widget.personal != null && media.size.height < 840;

    final current = _offerings?.current;
    final packages = current?.availablePackages ?? [];
    Package? findPkg(String productId) {
      try {
        return packages.firstWhere(
          (p) => p.storeProduct.identifier == productId,
        );
      } catch (_) {
        return null;
      }
    }

    final monthly =
        current?.monthly ?? findPkg(PurchaseService.monthlyProductId);
    final annual =
        current?.lifetime ?? findPkg(PurchaseService.lifetimeProductId);
    final weekly = current?.weekly ?? findPkg(PurchaseService.weeklyProductId);
    StoreProduct? directMonthly;
    StoreProduct? directAnnual;
    StoreProduct? directWeekly;
    if (monthly == null || annual == null || weekly == null) {
      for (final p in _directProducts) {
        if (p.identifier == PurchaseService.monthlyProductId) directMonthly = p;
        if (p.identifier == PurchaseService.lifetimeProductId) directAnnual = p;
        if (p.identifier == PurchaseService.weeklyProductId) directWeekly = p;
      }
    }

    final monthlyProduct = monthly?.storeProduct ?? directMonthly;
    final annualProduct = annual?.storeProduct ?? directAnnual;
    final weeklyProduct = weekly?.storeProduct ?? directWeekly;
    final monthlyOffer = _PlanOffer(
      price: monthlyProduct?.priceString ?? _demoPrice(_kDemoMonthly),
      rawPrice: monthlyProduct?.price ?? (kDebugMode ? _kDemoMonthly : null),
      currencyCode:
          monthlyProduct?.currencyCode ?? (kDebugMode ? _kDemoCurrency : null),
      // The store is the only authority, eligibility included: no product
      // loaded, or no free trial configured in App Store Connect, means no
      // trial is advertised. The free trials were removed on 2026-10-21;
      // a 7-day one came back on the monthly plan on 2026-11-06.
      trialDays: _monthlyTrial(monthlyProduct),
    );
    // Slot 1 is the lifetime purchase (the yearly plan's old place): no
    // trial, nothing renews.
    final annualOffer = _PlanOffer(
      price: annualProduct?.priceString ?? _demoPrice(_kDemoLifetime),
      rawPrice: annualProduct?.price ?? (kDebugMode ? _kDemoLifetime : null),
      currencyCode:
          annualProduct?.currencyCode ?? (kDebugMode ? _kDemoCurrency : null),
      trialDays: null,
    );
    final weeklyOffer = _PlanOffer(
      price: weeklyProduct?.priceString ?? _demoPrice(_kDemoWeekly),
      rawPrice: weeklyProduct?.price ?? (kDebugMode ? _kDemoWeekly : null),
      currencyCode:
          weeklyProduct?.currencyCode ?? (kDebugMode ? _kDemoCurrency : null),
      trialDays: _trialFor(weeklyProduct),
    );

    return PopScope(
      canPop: widget.dismissible && _closeVisible,
      child: Scaffold(
        backgroundColor: _kPaywallBrandChrome
            ? BtColors.page
            : const Color(0xFF07050F),
        body: TweenAnimationBuilder<Color?>(
          tween: ColorTween(
            begin: kPaywallPreviews.first.accent,
            end: _preview.accent,
          ),
          duration: const Duration(milliseconds: 520),
          curve: Curves.easeInOut,
          builder: (context, tweened, _) {
            final accent = _kPaywallBrandChrome
                ? AppColors.primary
                : tweened ?? _preview.accent;
            // Bright accents (green, amber, cyan) need dark text on the CTA.
            final onAccent = accent.computeLuminance() > 0.5
                ? const Color(0xFF07050F)
                : Colors.white;

            Widget sheet(_SheetPart part) => _PurchaseSheet(
              part: part,
              accent: accent,
              onAccent: onAccent,
              loading: _loading,
              purchasing: _purchasing,
              selectedPlan: _selectedPlan,
              bottomPad: bottomPad,
              monthlyOffer: monthlyOffer,
              annualOffer: annualOffer,
              weeklyOffer: weeklyOffer,
              onSelectPlan: (i) => setState(() {
                if (i != _selectedPlan) {
                  Haptics.select();
                  Analytics.track('paywall_plan', {
                    'plan': const ['monthly', 'lifetime', 'weekly'][i],
                  });
                }
                _selectedPlan = i;
                _userPicked = true;
              }),
              onRedeemPromo: _redeemPromoCode,
              onBuy: () {
                final pkg = switch (_selectedPlan) {
                  0 => monthly,
                  2 => weekly,
                  _ => annual,
                };
                final direct = switch (_selectedPlan) {
                  0 => directMonthly,
                  2 => directWeekly,
                  _ => directAnnual,
                };
                final offer = switch (_selectedPlan) {
                  0 => monthlyOffer,
                  2 => weeklyOffer,
                  _ => annualOffer,
                };
                final billed = offer.price == null
                    ? null
                    : switch (_selectedPlan) {
                        0 => l.paywallPerMonth(offer.price!),
                        2 => l.paywallPerWeek(offer.price!),
                        _ => l.paywallOnce(offer.price!),
                      };
                if (pkg != null || direct != null) {
                  _purchase(pkg, product: direct, offer: offer, billed: billed);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l.paywallLoadError),
                      backgroundColor: AppColors.surfaceDark,
                    ),
                  );
                }
              },
            );

            return Stack(
              children: [
                if (_kPaywallBrandChrome)
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment(-0.9, -1.08),
                        radius: 1.1,
                        colors: [Color(0xFF231A4A), BtColors.page],
                      ),
                    ),
                    child: SizedBox.expand(),
                  ),
                // ── Accent glow behind the device ─────────────────────────
                if (!_kPaywallBrandChrome)
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(0.0, -0.75),
                        radius: 1.05,
                        colors: [
                          accent.withValues(alpha: 0.30),
                          const Color(0xFF07050F),
                        ],
                      ),
                    ),
                    child: const SizedBox.expand(),
                  ),

                if (_kPaywallScroll)
                  Column(
                    children: [
                      // Room for the floating top bar.
                      SizedBox(height: topPad + 52),
                      sheet(_SheetPart.plans),
                      Expanded(
                        child: _PaywallScroll(
                          personal: widget.personal,
                          reason: widget.reason,
                        ),
                      ),
                      sheet(_SheetPart.action),
                    ],
                  )
                else
                  Column(
                    children: [
                      // ── The user's own result, above the tour ─────────────
                      if (widget.personal != null && !personalOnly)
                        Padding(
                          padding: EdgeInsets.fromLTRB(22, topPad + 54, 22, 4),
                          child: _PersonalHeader(personal: widget.personal!),
                        ),

                      // ── On a short phone the result takes the tour's place:
                      // squeezed under it, the device shrank to a sliver.
                      if (personalOnly)
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, c) => SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: c.maxHeight,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    22,
                                    topPad + 54,
                                    22,
                                    18,
                                  ),
                                  child: Center(
                                    child: _PersonalHeader(
                                      personal: widget.personal!,
                                      hero: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      else ...[
                        // ── The tour ────────────────────────────────────────
                        Expanded(
                          child: _kPaywallV4
                              ? const SizedBox()
                              : _Tour(
                                  controller: _pageCtrl,
                                  // Clear of the floating top bar, or of the result
                                  // that already sits below it.
                                  topInset: widget.personal != null
                                      ? 6
                                      : topPad + 44,
                                  onPageChanged: (i) =>
                                      setState(() => _rawPage = i),
                                  onUserInteraction: _pauseAutoAdvance,
                                ),
                        ),

                        // ── Why this opened, when a locked tap opened it ──────
                        if (widget.reason != null)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 4, 20, 2),
                            child: _ReasonPill(text: widget.reason!),
                          ),

                        // ── Page dots ─────────────────────────────────────────
                        if (!_kPaywallV4)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 2, 20, 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(kPaywallPreviews.length, (
                                i,
                              ) {
                                final active = i == _slide;
                                // Only the width is animated here. The colour is
                                // already being tweened above, and animating it a
                                // second time left the dot a whole slide behind the
                                // CTA mid-change — two different accents on screen
                                // at once.
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 280),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  width: active ? 18 : 6,
                                  height: 6,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: active
                                          ? accent
                                          : Colors.white.withValues(
                                              alpha: 0.15,
                                            ),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                      ],

                      // ── The purchase sheet, which never moves ─────────────
                      sheet(_SheetPart.all),
                    ],
                  ),

                // ── Top bar, floating over the device panel ───────────────
                Positioned(
                  top: topPad + 6,
                  left: 18,
                  right: 18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.dismissible)
                        IgnorePointer(
                          ignoring: !_closeVisible,
                          child: AnimatedOpacity(
                            opacity: _closeVisible ? 1 : 0,
                            duration: const Duration(milliseconds: 400),
                            child: GestureDetector(
                              onTap: _onClose,
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withValues(alpha: 0.10),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.10),
                                  ),
                                ),
                                child: const Icon(
                                  CupertinoIcons.xmark,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      // "Restore Purchases" runs long in several languages and
                      // sat next to the close button with nothing to give.
                      Flexible(
                        child: GestureDetector(
                          onTap: _restore,
                          child: Text(
                            l.paywallRestoreLabel,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withValues(alpha: 0.35),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// The end of the onboarding: the height the plan aims at, said to be an
/// estimate, and what the plan does about the user's own answers. Compact on
/// purpose: the tour and the plans below keep their room on a small phone.
class _PersonalHeader extends StatelessWidget {
  final PaywallPersonal personal;

  /// Standing in for the tour on a short phone: larger, with more air.
  final bool hero;
  const _PersonalHeader({required this.personal, this.hero = false});

  @override
  Widget build(BuildContext context) {
    final lines = personal.lines.take(3).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          personal.headline,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: hero ? 29 : 25,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: -0.8,
            height: 1.12,
          ),
        ),
        if (personal.estimateNote.isNotEmpty) ...[
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.auto_graph_rounded,
                size: 13,
                color: AppColors.lime,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  personal.estimateNote,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
                ),
              ),
            ],
          ),
        ],
        if (lines.isNotEmpty) ...[
          SizedBox(height: hero ? 16 : 10),
          Container(
            width: double.infinity,
            padding: hero
                ? const EdgeInsets.fromLTRB(14, 14, 14, 6)
                : const EdgeInsets.fromLTRB(12, 10, 12, 4),
            decoration: BoxDecoration(
              color: BtColors.card,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: BtColors.stroke),
            ),
            child: Column(
              children: [
                for (final (icon, text) in lines)
                  Padding(
                    padding: EdgeInsets.only(bottom: hero ? 9 : 6),
                    child: Row(
                      children: [
                        Icon(icon, size: hero ? 17 : 15, color: AppColors.lime),
                        SizedBox(width: hero ? 11 : 9),
                        Expanded(
                          child: CensoredText(
                            text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: hero ? 14 : 12.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

/// One line saying what the locked tap needed: a lock and the reason.
class _ReasonPill extends StatelessWidget {
  final String text;
  const _ReasonPill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.warning.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppColors.warning.withValues(alpha: 0.35)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              CupertinoIcons.lock_fill,
              size: 13,
              color: AppColors.warning,
            ),
            const SizedBox(width: 7),
            Flexible(
              child: Text(
                text,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  The tour — an endless carousel of app screens
// ═════════════════════════════════════════════════════════════════════════════

class _Tour extends StatelessWidget {
  final PageController controller;
  final double topInset;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onUserInteraction;

  const _Tour({
    required this.controller,
    required this.topInset,
    required this.onPageChanged,
    required this.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Listener(
      onPointerDown: (_) => onUserInteraction(),
      child: PageView.builder(
        controller: controller,
        onPageChanged: onPageChanged,
        // No itemCount: the tour wraps from the last screen back to the first
        // without a rewind animation across every slide in between.
        itemBuilder: (_, i) {
          final preview = kPaywallPreviews[i % kPaywallPreviews.length];
          return _Slide(preview: preview, topInset: topInset, l: l);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final PaywallPreview preview;
  final double topInset;
  final AppLocalizations l;
  const _Slide({
    required this.preview,
    required this.topInset,
    required this.l,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PhoneMockup(
            accent: preview.accent,
            screen: preview.screen(l),
            topInset: topInset,
          ),
        ),
        const SizedBox(height: 16),
        // The headline is the whole pitch. The redesigned screen above says
        // what the feature is far better than a paragraph would, so the copy
        // stays at a line and a half and never has to scroll.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              Text(
                preview.title(l),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -0.6,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 6),
              // Nudged up a hair, purely visually (Transform, not layout), so
              // the caption sits centered between the headline and the page
              // dots rather than reading as glued to the dots below it.
              Transform.translate(
                offset: const Offset(0, -3),
                child: Text(
                  preview.caption(l),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    height: 1.35,
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  The purchase sheet — fixed for the life of the screen
// ═════════════════════════════════════════════════════════════════════════════

class _PurchaseSheet extends StatefulWidget {
  final _SheetPart part;
  final Color accent;
  final Color onAccent;
  final bool loading;
  final bool purchasing;
  final int selectedPlan;
  final double bottomPad;
  final _PlanOffer monthlyOffer;
  final _PlanOffer annualOffer;
  final _PlanOffer weeklyOffer;
  final ValueChanged<int> onSelectPlan;
  final VoidCallback onBuy;
  final VoidCallback onRedeemPromo;

  const _PurchaseSheet({
    this.part = _SheetPart.all,
    required this.accent,
    required this.onAccent,
    required this.loading,
    required this.purchasing,
    required this.selectedPlan,
    required this.bottomPad,
    required this.monthlyOffer,
    required this.annualOffer,
    required this.weeklyOffer,
    required this.onSelectPlan,
    required this.onBuy,
    required this.onRedeemPromo,
  });

  @override
  State<_PurchaseSheet> createState() => _PurchaseSheetState();
}

class _PurchaseSheetState extends State<_PurchaseSheet>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctaPulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _ctaPulse.dispose();
    super.dispose();
  }

  /// The offer the sheet is currently pointing at — 0 monthly, 2 weekly,
  /// anything else (1) lifetime.
  _PlanOffer _offerFor(int plan) => switch (plan) {
    0 => widget.monthlyOffer,
    2 => widget.weeklyOffer,
    _ => widget.annualOffer,
  };

  /// The store's price with its billing period ("$39.99/year"), or a dash
  /// until the offering loads.
  /// The three plans on one line: weekly, monthly, lifetime.
  Widget _planTiles(AppLocalizations l, Color accent) {
    // What follows the price in the billed string ("/week", "one-time"), so
    // the tile can set the price large and the period small under it.
    String period(String? price, String Function(String) perPeriod) =>
        price == null ? '' : perPeriod(price).replaceFirst(price, '').trim();
    Widget tile(
      int plan,
      String label,
      _PlanOffer offer,
      String Function(String) perPeriod,
      String? badge,
    ) => Expanded(
      child: _PlanTile(
        selected: widget.selectedPlan == plan,
        label: label,
        price: offer.price ?? '—',
        period: period(offer.price, perPeriod),
        badgeText: badge,
        accent: accent,
        onTap: () => widget.onSelectPlan(plan),
      ),
    );

    String? trial(_PlanOffer o) =>
        o.hasTrial ? l.paywallTrialHeadline('${o.trialDays}') : null;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          tile(
            2,
            l.paywallWeekly,
            widget.weeklyOffer,
            l.paywallPerWeek,
            trial(widget.weeklyOffer),
          ),
          const SizedBox(width: 8),
          tile(
            0,
            l.paywallMonthly,
            widget.monthlyOffer,
            l.paywallPerMonth,
            trial(widget.monthlyOffer),
          ),
          const SizedBox(width: 8),
          tile(
            1,
            l.paywallLifetime,
            widget.annualOffer,
            l.paywallOnce,
            l.paywallLifetimeBadge,
          ),
        ],
      ),
    );
  }

  String _billed(String? price, String Function(String) perPeriod) =>
      price == null ? '—' : perPeriod(price);

  /// What the tap commits to, for the plan actually selected: the trial and
  /// the price it turns into, or how often it renews. The old line promised
  /// "renews yearly" under the weekly and monthly plans too, and never named
  /// the price after the trial — the disclosure App Review reads first.
  String _disclaimer(AppLocalizations l, _PlanOffer offer) {
    final days = '${offer.trialDays ?? 0}';
    final price = offer.price ?? '—';
    return switch (widget.selectedPlan) {
      0 =>
        offer.hasTrial
            ? l.paywallTrialThenMonthly(days, price)
            : l.paywallRenewsMonthly,
      2 =>
        offer.hasTrial
            ? l.paywallTrialThenWeekly(days, price)
            : l.paywallRenewsWeekly,
      _ => l.paywallLifetimeDisclaimer,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final offer = _offerFor(widget.selectedPlan);
    final accent = widget.accent;
    final onAccent = widget.onAccent;

    // Pinned under the top bar: the plans alone, on the page itself.
    if (widget.part == _SheetPart.plans) {
      _ctaPulse.stop();
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 2, 20, 12),
        child: widget.loading
            ? SizedBox(
                height: 132,
                child: Center(
                  child: CircularProgressIndicator(
                    color: accent,
                    strokeWidth: 2,
                  ),
                ),
              )
            : _planTiles(l, accent),
      );
    }

    // The pulse is a nudge, not a nag: off entirely once the user has
    // committed (purchasing) or the system says to keep motion still.
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final wantsPulse = !reduceMotion && !widget.purchasing && !widget.loading;
    if (wantsPulse && !_ctaPulse.isAnimating) {
      _ctaPulse.repeat(reverse: true);
    } else if (!wantsPulse && _ctaPulse.isAnimating) {
      _ctaPulse.stop();
      _ctaPulse.value = 0;
    }

    // Bounded, not just min-sized: three plan rows plus the terms below can
    // outgrow a small phone's remaining height once the tour above has
    // taken its share. Capping the sheet and scrolling its
    // contents keeps the tour's height stable instead of it being squeezed
    // out — the carousel keeps auto-advancing underneath untouched.
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.62,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: _kPaywallBrandChrome
              ? BtColors.raised
              : const Color(0xFF0D0920),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(widget.part == _SheetPart.action ? 26 : 34),
          ),
          border: Border(
            top: BorderSide(
              color: _kPaywallBrandChrome
                  ? BtColors.stroke
                  : accent.withValues(alpha: 0.30),
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.55),
              blurRadius: 34,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: widget.part == _SheetPart.action ? 4 : 18,
            bottom: math.max(widget.bottomPad, 10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── The plans ─────────────────────────────────────────────────
              //
              // App Review rule (3.1.2(c), rejected on 1.6.3): the amount the
              // user is billed must be the most clear and conspicuous pricing
              // element. Trials, savings and any calculated figure ("$0.77 a
              // week") have to sit below it in size, colour and position. So
              // each row leads with its billed price and period, the trial and
              // savings ride along as small tinted badges, and nothing about
              // the trial is promoted above the plans — the 1.6.3 build lost
              // review over a per-week headline and a trial banner up here.
              //
              // Prices come from the store or not at all. Falling back to a
              // hardcoded figure showed a Turkish lira amount to every locale
              // whenever the offering failed to load — the wrong currency and,
              // after any price change, the wrong number. Both stores treat that
              // as misleading pricing.
              if (widget.part == _SheetPart.action)
                const SizedBox.shrink()
              else if (!widget.loading)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _kPaywallV4
                      ? _planTiles(l, accent)
                      : Column(
                          children: [
                            _PlanRow(
                              selected: widget.selectedPlan == 2,
                              label: l.paywallWeekly,
                              price: _billed(
                                widget.weeklyOffer.price,
                                l.paywallPerWeek,
                              ),
                              badgeText: widget.weeklyOffer.hasTrial
                                  ? l.paywallTrialHeadline(
                                      '${widget.weeklyOffer.trialDays}',
                                    )
                                  : null,
                              accent: accent,
                              onTap: () => widget.onSelectPlan(2),
                            ),
                            const SizedBox(height: 10),
                            _PlanRow(
                              selected: widget.selectedPlan == 0,
                              label: l.paywallMonthly,
                              price: _billed(
                                widget.monthlyOffer.price,
                                l.paywallPerMonth,
                              ),
                              badgeText: widget.monthlyOffer.hasTrial
                                  ? l.paywallTrialHeadline(
                                      '${widget.monthlyOffer.trialDays}',
                                    )
                                  : null,
                              accent: accent,
                              onTap: () => widget.onSelectPlan(0),
                            ),
                            const SizedBox(height: 10),
                            _PlanRow(
                              selected: widget.selectedPlan == 1,
                              label: l.paywallLifetime,
                              price: _billed(
                                widget.annualOffer.price,
                                l.paywallOnce,
                              ),
                              badgeText: l.paywallLifetimeBadge,
                              accent: accent,
                              onTap: () => widget.onSelectPlan(1),
                            ),
                          ],
                        ),
                )
              else
                SizedBox(
                  height: 106,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: accent,
                      strokeWidth: 2,
                    ),
                  ),
                ),

              const SizedBox(height: 12),

              // ── CTA ───────────────────────────────────────────────────────
              //
              // A slow, subtle breathing scale — never bigger than 3.5%, never
              // faster than 1.4s a cycle — draws the eye to the one button that
              // matters without reading as nagging or broken. Off entirely
              // under reduced motion, and while a purchase is in flight.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 1.0, end: 1.035).animate(
                    CurvedAnimation(parent: _ctaPulse, curve: Curves.easeInOut),
                  ),
                  child: GestureDetector(
                    onTap: widget.purchasing ? null : widget.onBuy,
                    child: Container(
                      height: 58,
                      decoration: _kPaywallBrandChrome
                          ? BoxDecoration(
                              color: accent,
                              borderRadius: BorderRadius.circular(BtRadius.md),
                            )
                          : BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  accent,
                                  accent.withValues(alpha: 0.65),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(17),
                              boxShadow: [
                                BoxShadow(
                                  color: accent.withValues(alpha: 0.45),
                                  blurRadius: 26,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                      child: Center(
                        child: widget.purchasing
                            ? SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  color: onAccent,
                                  strokeWidth: 2.5,
                                ),
                              )
                            // On a plan with a trial the button names it
                            // ("Start 7 days free"), at 16pt so it never
                            // outranks the 17pt billed price in the rows above
                            // (3.1.2(c)); the price after the trial is spelled
                            // out right under it. Otherwise it says what the
                            // tap buys: "Continue" read as the next
                            // onboarding step and sent people to Apple's sheet.
                            : Text(
                                offer.hasTrial
                                    ? l.paywallStartTrial('${offer.trialDays}')
                                    : switch (widget.selectedPlan) {
                                        0 => l.pwBuyMonthly,
                                        2 => l.pwBuyWeekly,
                                        _ => l.pwBuyLifetime,
                                      },
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: onAccent,
                                  letterSpacing: 0.1,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // What the tap commits to. Readable, not fine print: at 10pt and
              // 25% white this was the faintest text on the sheet, yet it is
              // the only place the price after the trial is spelled out.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  _disclaimer(l, offer),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.72),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              if (Platform.isIOS) ...[
                GestureDetector(
                  onTap: widget.onRedeemPromo,
                  child: Text(
                    l.paywallPromoCode,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.45),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
              ],
              // Wrap, not Row: these two links are required on the purchase
              // screen, and in German on a 320pt phone they do not fit side by
              // side. Better a second line than a clipped one.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => launchUrl(
                        Uri.parse(
                          'https://samtehhh.github.io/betaller/privacy.html',
                        ),
                      ),
                      child: Text(
                        l.privacyPolicy,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white.withValues(alpha: 0.40),
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white.withValues(alpha: 0.40),
                        ),
                      ),
                    ),
                    Text(
                      '  ·  ',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white.withValues(alpha: 0.25),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => launchUrl(
                        Uri.parse(
                          'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
                        ),
                      ),
                      child: Text(
                        l.termsOfService,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white.withValues(alpha: 0.40),
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white.withValues(alpha: 0.40),
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
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Plan row
// ═════════════════════════════════════════════════════════════════════════════

/// One plan, full width: what it is called, what it is billed, and one small
/// note about it.
class _PlanRow extends StatelessWidget {
  final bool selected;
  final String label;

  /// The billed amount with its period ("$39.99/year"), built from the
  /// store's own price string — never a hardcoded stand-in, see the note
  /// where this is built. The largest pricing text in the row by design.
  final String price;

  /// Best value, savings, or the free days. Null on a plan with none. Always
  /// a small tinted label: anything louder competes with [price].
  final String? badgeText;

  final Color accent;
  final VoidCallback onTap;

  const _PlanRow({
    required this.selected,
    required this.label,
    required this.price,
    required this.badgeText,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Bright accents (green, amber, cyan) need dark text on the filled radio.
    final onAccent = accent.computeLuminance() > 0.5
        ? const Color(0xFF07050F)
        : Colors.white;

    return GestureDetector(
      onTap: onTap,
      // Not animated: the accent already arrives tweened, and animating it
      // again here left the row trailing the CTA by most of a slide. Selecting
      // a plan lands instantly, which is the right feel for a tap anyway.
      child: Container(
        padding: const EdgeInsets.fromLTRB(13, 13, 13, 13),
        decoration: BoxDecoration(
          color: selected
              ? accent.withValues(alpha: 0.16)
              : _kPaywallBrandChrome
              ? BtColors.card
              : Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected
                ? accent.withValues(alpha: 0.70)
                : Colors.white.withValues(alpha: 0.08),
            width: 1.5,
          ),
          boxShadow: selected && !_kPaywallBrandChrome
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.18),
                    blurRadius: 16,
                    spreadRadius: -4,
                  ),
                ]
              : null,
        ),
        child: LayoutBuilder(
          builder: (context, box) => Row(
            children: [
              // The radio, so it is obvious these are a choice of one.
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? accent : Colors.transparent,
                  border: Border.all(
                    color: selected
                        ? accent
                        : Colors.white.withValues(alpha: 0.26),
                    width: 1.5,
                  ),
                ),
                child: selected
                    ? Icon(Icons.check_rounded, size: 15, color: onAccent)
                    : null,
              ),
              const SizedBox(width: 10),
              // Everything in this row competes for a 320pt screen's width, so
              // the order of who gives way matters. The price and the offer never
              // shorten — a clipped "₺399,…" is worse than no price at all, and
              // both stores treat a misstated price as grounds for rejection — so
              // the plan's name is the only thing here that may ellipsize.
              // The plan's name with its badge stacked underneath, not beside
              // it: side by side, "3 TAGE GRATIS" plus "11,99 €/Monat" left a
              // 320pt phone no room for "Monatlich" at all.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Shrinks rather than ellipsizes: "Hebdomad…" or
                    // "Settimana…" hid which plan the row was.
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        label,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: selected
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.60),
                        ),
                      ),
                    ),
                    if (badgeText != null) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: accent.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          badgeText!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            color: accent.withValues(alpha: 0.90),
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // The billed price sits last, right-aligned, at the largest size
              // on the sheet's pricing — the "most clear and conspicuous" spot.
              // A long local price ("₺999,99", "34,99 €") in a narrow row scales
              // down as a whole instead of overflowing: never clipped, never
              // ellipsized, and the plan name keeps at least 40% of the row.
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: box.maxWidth * 0.6),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    price,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: selected
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.80),
                      letterSpacing: -0.3,
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
//  Premium locked overlay (used throughout the app)
// ═════════════════════════════════════════════════════════════════════════════

class PremiumLockedOverlay extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double blurAmount;
  final double borderRadius;
  final bool unlocked;
  const PremiumLockedOverlay({
    super.key,
    required this.child,
    required this.onTap,
    this.blurAmount = 8,
    this.borderRadius = 22,
    this.unlocked = false,
  });

  @override
  Widget build(BuildContext context) {
    if (unlocked) return child;
    // No padlock: the blur alone says "there is more here," and the PRO tag
    // says what unlocks it. A lock glyph reads as a wall; this reads as a
    // preview.
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          children: [
            child,
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurAmount,
                  sigmaY: blurAmount,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.scaffold.withValues(alpha: 0.3),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD700).withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: const Color(
                            0xFFFFD700,
                          ).withValues(alpha: 0.45),
                        ),
                      ),
                      child: const Text(
                        'PRO',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFFFD700),
                          letterSpacing: 1.2,
                          shadows: [
                            Shadow(color: Colors.black54, blurRadius: 10),
                          ],
                        ),
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

// ═════════════════════════════════════════════════════════════════════════════
//  The Nov 2026 hero and plan tiles
// ═════════════════════════════════════════════════════════════════════════════

/// Three cards held like a hand: a workout still on the left, the locked
/// potential in the middle and on top, a streak medal on the right.
class _CardFan extends StatelessWidget {
  const _CardFan();

  @override
  Widget build(BuildContext context) {
    final female = context.watch<AppProvider>().profile?.gender == 'female';
    Widget card({
      required double width,
      required double height,
      required Widget child,
      Color color = BtColors.card,
    }) => Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 26,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: child,
    );

    final still = card(
      width: 118,
      height: 156,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const MoveThumb(
            routineId: 'dead_hang_active',
            width: 118,
            height: 156,
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x00000000), Color(0x99000000)],
                stops: [0.5, 1],
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.play_fill,
                size: 13,
                color: Color(0xFF14112A),
              ),
            ),
          ),
        ],
      ),
    );

    final medal = card(
      width: 118,
      height: 156,
      child: const Align(
        alignment: Alignment(0.55, 0),
        child: AchievementMedal(
          type: 'streak',
          value: 7,
          earned: true,
          size: 78,
        ),
      ),
    );

    final potential = card(
      width: 142,
      height: 196,
      color: const Color(0xFF16122E),
      child: Stack(
        children: [
          // Where the figure could reach: a green line above its head, and
          // the number that goes with it kept behind the lock.
          Positioned(
            left: 16,
            right: 16,
            top: 48,
            child: CustomPaint(
              size: const Size(double.infinity, 2),
              painter: _DashRulePainter(),
            ),
          ),
          Positioned(
            right: 12,
            top: 12,
            child: Container(
              padding: const EdgeInsets.fromLTRB(7, 5, 9, 5),
              decoration: BoxDecoration(
                color: AppColors.lime.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    CupertinoIcons.lock_fill,
                    size: 11,
                    color: AppColors.lime,
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 26,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.lime.withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 14,
            child: Center(child: BodyFigure(female: female, height: 118)),
          ),
        ],
      ),
    );

    return SizedBox(
      height: 204,
      width: 330,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 8,
            top: 30,
            child: Transform.rotate(angle: -0.13, child: still),
          ),
          Positioned(
            right: 8,
            top: 30,
            child: Transform.rotate(angle: 0.13, child: medal),
          ),
          Positioned(top: 0, child: potential),
        ],
      ),
    );
  }
}

/// A dashed green rule.
class _DashRulePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = AppColors.lime.withValues(alpha: 0.75)
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;
    for (var x = 0.0; x < size.width; x += 9) {
      canvas.drawLine(Offset(x, 1), Offset(x + 4.5, 1), p);
    }
  }

  @override
  bool shouldRepaint(covariant _DashRulePainter old) => false;
}

/// One plan as a tile: its note on top, its name, the price large and what
/// the price buys small under it, and the mark that says it is the one
/// picked. Three of these share a line.
class _PlanTile extends StatelessWidget {
  final bool selected;
  final String label;
  final String price;
  final String period;
  final String? badgeText;
  final Color accent;
  final VoidCallback onTap;

  const _PlanTile({
    required this.selected,
    required this.label,
    required this.price,
    required this.period,
    required this.badgeText,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 12),
          decoration: BoxDecoration(
            color: selected ? accent.withValues(alpha: 0.16) : BtColors.card,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected
                  ? accent.withValues(alpha: 0.75)
                  : Colors.white.withValues(alpha: 0.08),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              // The note keeps its line on every tile, so the three names
              // and prices sit level whether or not a tile has one.
              SizedBox(
                height: 20,
                child: badgeText == null
                    ? null
                    : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: accent.withValues(alpha: 0.22),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            badgeText!,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primaryLight,
                            ),
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: selected ? Colors.white : BtColors.textSoft,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  price,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  period,
                  maxLines: 1,
                  style: TextStyle(fontSize: 12, color: BtColors.textMute),
                ),
              ),
              const Spacer(),
              const SizedBox(height: 8),
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? accent : Colors.transparent,
                  border: Border.all(
                    color: selected
                        ? accent
                        : Colors.white.withValues(alpha: 0.26),
                    width: 1.5,
                  ),
                ),
                child: selected
                    ? const Icon(
                        Icons.check_rounded,
                        size: 15,
                        color: Colors.white,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  The scrolling page between the plans and the buy button
// ═════════════════════════════════════════════════════════════════════════════

/// What Pro holds, as a page to scroll: the card fan, then one picture per
/// feature drawn for this sheet (the growth curve, the day's moves, the ten
/// levels, the day's targets, the score, the posture check). Nothing in the
/// pictures gives away a figure the app works out: where a number would be,
/// there is a lock.
class _PaywallScroll extends StatelessWidget {
  final PaywallPersonal? personal;
  final String? reason;
  const _PaywallScroll({required this.personal, required this.reason});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    final profile = provider.profile;
    final female = profile?.gender == 'female';
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      // The page dissolves under the plans and into the buy bar, which also
      // says there is more below.
      shaderCallback: (r) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0x00FFFFFF),
          Colors.white,
          Colors.white,
          Color(0x00FFFFFF),
        ],
        stops: [0.0, 0.035, 0.94, 1.0],
      ).createShader(r),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 14, 22, 36),
        children: [
          if (reason != null) ...[
            _ReasonPill(text: reason!),
            const SizedBox(height: 16),
          ],
          if (personal != null) ...[
            _PersonalHeader(personal: personal!, hero: true),
            const SizedBox(height: 26),
          ],
          const SizedBox(
            height: 216,
            child: FittedBox(fit: BoxFit.scaleDown, child: _CardFan()),
          ),
          const SizedBox(height: 18),
          _ShowcaseText(
            title: l.pwSlidePotentialTitle,
            caption: l.pwSlidePotentialCaption,
            centered: true,
          ),
          _Showcase(
            title: l.pwSlideChartTitle,
            caption: l.pwSlideChartCaption,
            child: Column(
              children: [
                _Reveal(
                  builder: (t) => _CurveGraphic(
                    t: t,
                    nowLabel: profile == null
                        ? null
                        : provider.formatHeight(profile.currentHeight),
                  ),
                ),
                const SizedBox(height: 16),
                _GrowthStrip(
                  title: l.growth,
                  labels: [l.totalGrowth, l.last, l.measurementCount],
                ),
              ],
            ),
          ),
          _Showcase(
            title: l.progressPhotosTitle,
            caption: l.photosBenefit,
            child: const _PhotosGraphic(),
          ),
          _Showcase(
            title: l.pwSlideTodayTitle,
            caption: l.pwSlideTodayCaption,
            child: const _StillsGraphic(),
          ),
          _Showcase(
            title: l.plHabits,
            child: _Reveal(
              builder: (t) => _HabitsGraphic(
                t: t,
                habits: [
                  for (final id in const [
                    'water',
                    'protein',
                    'quality_sleep',
                    'posture_check',
                  ])
                    localizedRoutine(l, id)['title'] ?? id,
                ],
              ),
            ),
          ),
          _Showcase(
            title: programText(l.pwSlideProgramTitle),
            caption: l.pwSlideProgramCaption,
            child: _Reveal(builder: (t) => _LevelsGraphic(t: t)),
          ),
          _Showcase(
            title: l.pwSlideNutritionTitle,
            caption: l.pwSlideNutritionCaption,
            child: _Reveal(
              builder: (t) => _RingsGraphic(
                t: t,
                labels: [l.targetProtein, l.targetCalcium, l.targetVitaminD],
              ),
            ),
          ),
          _Showcase(
            title: l.reminderMasterTitle,
            child: _Reveal(
              builder: (t) => _RemindersGraphic(
                t: t,
                everyDay: l.reminderEveryDay,
                rows: [
                  for (final (category, icon, color, name) in [
                    (
                      'exercise',
                      CupertinoIcons.bolt_fill,
                      AppColors.primaryBright,
                      l.reminderExercise,
                    ),
                    (
                      'nutrition',
                      CupertinoIcons.leaf_arrow_circlepath,
                      AppColors.lime,
                      l.reminderNutrition,
                    ),
                    (
                      'water',
                      CupertinoIcons.drop_fill,
                      AppColors.water,
                      l.reminderWater,
                    ),
                    (
                      'sleep',
                      CupertinoIcons.moon_fill,
                      AppColors.sleep,
                      l.reminderSleep,
                    ),
                  ])
                    (
                      icon,
                      color,
                      name,
                      // The user's own hours, as set in the onboarding.
                      provider.reminders
                              .where((r) => r.category == category)
                              .firstOrNull
                              ?.timeLabel ??
                          '',
                    ),
                ],
              ),
            ),
          ),
          _Showcase(
            title: l.pwSlideScoreTitle,
            caption: l.pwSlideScoreCaption,
            child: _Reveal(builder: (t) => _GaugeGraphic(t: t)),
          ),
          _Showcase(
            title: l.pwSlidePostureTitle,
            caption: l.pwSlidePostureCaption,
            child: _Reveal(
              millis: 2200,
              builder: (t) => _PostureGraphic(
                t: t,
                female: female,
                areas: [l.pgAreaHead, l.pgAreaShoulders, l.pgAreaLowerBack],
                outOf: l.pgOutOf100,
              ),
            ),
          ),
          const SizedBox(height: 46),
          Center(
            child: Text(
              l.pwMoreFeatures,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.2,
                color: BtColors.textSoft,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A feature: its picture, then its headline and the line under it.
class _Showcase extends StatelessWidget {
  final String title;
  final String? caption;
  final Widget child;
  const _Showcase({required this.title, required this.child, this.caption});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 44),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        const SizedBox(height: 18),
        _ShowcaseText(title: title, caption: caption),
      ],
    ),
  );
}

class _ShowcaseText extends StatelessWidget {
  final String title;
  final String? caption;
  final bool centered;
  const _ShowcaseText({
    required this.title,
    this.caption,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: centered
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start,
    children: [
      Text(
        title,
        textAlign: centered ? TextAlign.center : TextAlign.start,
        style: TextStyle(
          fontSize: centered ? 26 : 22,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.6,
          height: 1.15,
          color: Colors.white,
        ),
      ),
      if (caption != null) ...[
        const SizedBox(height: 6),
        Text(
          caption!,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: 14.5,
            height: 1.4,
            color: BtColors.textMute,
          ),
        ),
      ],
    ],
  );
}

/// Draws its child in over a moment, once, when it is first built (which, in
/// a list, is as it scrolls into view). At rest under reduced motion.
class _Reveal extends StatelessWidget {
  final Widget Function(double t) builder;
  final int millis;
  const _Reveal({required this.builder, this.millis = 1100});

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.of(context).disableAnimations;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: still ? 1 : 0, end: 1),
      duration: Duration(milliseconds: millis),
      curve: millis > 1100 ? Curves.easeInOut : Curves.easeOutCubic,
      builder: (_, t, _) => builder(t),
    );
  }
}

/// A lock and a blurred bar where a figure would be.
class _LockPill extends StatelessWidget {
  final Color color;
  const _LockPill({this.color = AppColors.lime});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(7, 5, 9, 5),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.16),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(CupertinoIcons.lock_fill, size: 11, color: color),
        const SizedBox(width: 5),
        Container(
          width: 26,
          height: 8,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.55),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    ),
  );
}

/// The growth curve: measured so far in white, where it could go dashed in
/// green, ending at a lock.
class _CurveGraphic extends StatelessWidget {
  final double t;
  final String? nowLabel;
  const _CurveGraphic({required this.t, required this.nowLabel});

  static const _now = 0.56;
  static double _y(double x) => 0.84 - 0.66 * (1 - math.pow(1 - x, 2.2));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 178,
      child: LayoutBuilder(
        builder: (context, c) => Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(child: CustomPaint(painter: _CurvePainter(t))),
            if (nowLabel != null)
              Positioned(
                left: (c.maxWidth * _now - 96).clamp(0.0, c.maxWidth),
                top: 178 * _y(_now) - 38,
                width: 90,
                child: Opacity(
                  opacity: ((t - 0.45) / 0.2).clamp(0.0, 1.0),
                  child: Text(
                    nowLabel!,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            Positioned(
              right: 0,
              top: 0,
              child: Opacity(
                opacity: ((t - 0.8) / 0.2).clamp(0.0, 1.0),
                child: const _LockPill(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurvePainter extends CustomPainter {
  final double t;
  _CurvePainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    Offset at(double x) => Offset(x * w, _CurveGraphic._y(x) * h);
    final grid = Paint()
      ..color = Colors.white.withValues(alpha: 0.06)
      ..strokeWidth = 1;
    for (final gy in const [0.2, 0.5, 0.8]) {
      canvas.drawLine(Offset(0, h * gy), Offset(w, h * gy), grid);
    }

    const now = _CurveGraphic._now;
    final past = (t / 0.55).clamp(0.0, 1.0) * now;
    final line = Path()..moveTo(at(0).dx, at(0).dy);
    for (var x = 0.0; x <= past; x += 0.01) {
      line.lineTo(at(x).dx, at(x).dy);
    }
    final end = at(past);
    line.lineTo(end.dx, end.dy);
    // The ground under what has been measured.
    canvas.drawPath(
      Path.from(line)
        ..lineTo(end.dx, h)
        ..lineTo(0, h)
        ..close(),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary.withValues(alpha: 0.26),
            AppColors.primary.withValues(alpha: 0.0),
          ],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      line,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.2
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..shader = const LinearGradient(
          colors: [AppColors.primaryLight, Colors.white],
        ).createShader(Offset.zero & size),
    );

    // Where it could go: dashes in the growth green.
    final ahead = ((t - 0.5) / 0.5).clamp(0.0, 1.0);
    if (ahead > 0) {
      final dash = Paint()
        ..color = AppColors.lime
        ..strokeWidth = 2.6
        ..strokeCap = StrokeCap.round;
      final stop = now + (1 - now) * ahead;
      for (var x = now + 0.02; x < stop; x += 0.04) {
        canvas.drawLine(at(x), at(math.min(x + 0.018, stop)), dash);
      }
    }
    if (t > 0.5) {
      canvas.drawCircle(at(now), 9, Paint()..color = const Color(0xFF14112A));
      canvas.drawCircle(at(now), 6, Paint()..color = Colors.white);
    }
  }

  @override
  bool shouldRepaint(covariant _CurvePainter old) => old.t != t;
}

/// Three of the real moves, as their stills.
class _StillsGraphic extends StatelessWidget {
  const _StillsGraphic();

  static const _ids = ['downward_dog', 'dead_hang_active', 'upward_salute'];

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, c) {
      final w = (c.maxWidth - 20) / 3;
      final h = w * 1.3;
      return Row(
        children: [
          for (var i = 0; i < _ids.length; i++) ...[
            if (i > 0) const SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: w,
                height: h,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    MoveThumb(routineId: _ids[i], width: w, height: h),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0x00000000), Color(0x8C000000)],
                          stops: [0.55, 1],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 9,
                      bottom: 9,
                      child: Container(
                        width: 26,
                        height: 26,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          CupertinoIcons.play_fill,
                          size: 11,
                          color: Color(0xFF14112A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      );
    },
  );
}

/// The ten levels as steps, each in its own colour, and the streak medals
/// that come with keeping at them.
class _LevelsGraphic extends StatelessWidget {
  final double t;
  const _LevelsGraphic({required this.t});

  static const _steps = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 112,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (var i = 0; i < _steps; i++) ...[
                if (i > 0) const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    // Each step rises a beat after the one before it.
                    height:
                        (22 + 90 * i / (_steps - 1)) *
                        Curves.easeOutBack.transform(
                          ((t - i * 0.05) / 0.5).clamp(0.0, 1.0),
                        ),
                    decoration: BoxDecoration(
                      // One hue that brightens step by step; the last step
                      // is where it leads, in the growth green.
                      color: i == _steps - 1
                          ? AppColors.lime
                          : Color.lerp(
                              AppColors.primary.withValues(alpha: 0.38),
                              AppColors.primaryLight,
                              i / (_steps - 2),
                            ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final days in const [3, 7, 14, 30])
              AchievementMedal(
                type: 'streak',
                value: days,
                earned: true,
                size: 58,
              ),
          ],
        ),
      ],
    );
  }
}

/// The day's three targets as rings that close, each named, each with its
/// figure behind a lock.
class _RingsGraphic extends StatelessWidget {
  final double t;
  final List<String> labels;
  const _RingsGraphic({required this.t, required this.labels});

  static const _colors = [
    AppColors.orange,
    AppColors.primaryBright,
    AppColors.warning,
  ];
  static const _icons = [
    CupertinoIcons.flame_fill,
    Icons.opacity_rounded,
    CupertinoIcons.sun_max_fill,
  ];

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var i = 0; i < 3; i++)
        Expanded(
          child: Column(
            children: [
              SizedBox(
                width: 86,
                height: 86,
                child: CustomPaint(
                  painter: _RingPainter(
                    color: _colors[i],
                    sweep: ((t - i * 0.12) / 0.7).clamp(0.0, 1.0),
                  ),
                  child: Icon(_icons[i], size: 26, color: _colors[i]),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                labels[i],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                  color: BtColors.textSoft,
                ),
              ),
              const SizedBox(height: 7),
              _LockPill(color: _colors[i]),
            ],
          ),
        ),
    ],
  );
}

class _RingPainter extends CustomPainter {
  final Color color;
  final double sweep;
  _RingPainter({required this.color, required this.sweep});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = (Offset.zero & size).deflate(6);
    canvas.drawArc(
      rect,
      0,
      math.pi * 2,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 9
        ..color = color.withValues(alpha: 0.14),
    );
    canvas.drawArc(
      rect,
      -math.pi / 2,
      math.pi * 2 * sweep,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 9
        ..strokeCap = StrokeCap.round
        ..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) =>
      old.sweep != sweep || old.color != color;
}

/// One score for the habits: a dial that sweeps up, its reading locked.
class _GaugeGraphic extends StatelessWidget {
  final double t;
  const _GaugeGraphic({required this.t});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 150,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(child: CustomPaint(painter: _GaugePainter(t))),
        const Positioned(
          bottom: 22,
          child: _LockPill(color: AppColors.primaryLight),
        ),
      ],
    ),
  );
}

class _GaugePainter extends CustomPainter {
  final double t;
  _GaugePainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final r = math.min(size.width / 2, size.height) - 12;
    final centre = Offset(size.width / 2, size.height - 6);
    final rect = Rect.fromCircle(center: centre, radius: r);
    canvas.drawArc(
      rect,
      math.pi,
      math.pi,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 14
        ..strokeCap = StrokeCap.round
        ..color = Colors.white.withValues(alpha: 0.08),
    );
    canvas.drawArc(
      rect,
      math.pi,
      math.pi * t,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 14
        ..strokeCap = StrokeCap.round
        ..shader = const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryLight],
        ).createShader(rect),
    );
    // The scale: a tick every tenth, inside the arc.
    final tick = Paint()
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round
      ..color = Colors.white.withValues(alpha: 0.28);
    for (var i = 0; i <= 10; i++) {
      final a = math.pi + math.pi * i / 10;
      final dir = Offset(math.cos(a), math.sin(a));
      canvas.drawLine(
        centre + dir * (r - 18),
        centre + dir * (r - (i % 5 == 0 ? 30 : 24)),
        tick,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _GaugePainter old) => old.t != t;
}

/// The posture check as the app runs it: a scan passes down the figure,
/// and the three places the check reads (head, shoulders, lower back) light
/// up and are named as it reaches them; then the score ring closes, its
/// reading kept behind the lock.
class _PostureGraphic extends StatelessWidget {
  final double t;
  final bool female;

  /// Head, shoulders, lower back, in the user's language.
  final List<String> areas;

  /// "out of 100".
  final String outOf;

  const _PostureGraphic({
    required this.t,
    required this.female,
    required this.areas,
    required this.outOf,
  });

  static const _height = 196.0;

  /// Where on the figure each area sits, as a share of its height.
  static const _levels = [0.065, 0.20, 0.42];

  /// The scan runs over the first 60% of the reveal.
  static double _scan(double t) => (t / 0.6).clamp(0.0, 1.0);

  @override
  Widget build(BuildContext context) {
    final scan = _scan(t);
    return SizedBox(
      height: _height,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, c) {
          final w = c.maxWidth;
          // The figure's centre line, where the labels start, and the ring.
          final cx = w * 0.20;
          final labelX = cx + 62;
          const ring = 84.0;
          const block = 112.0;
          final labelW = (w - labelX - block - 10).clamp(40.0, 200.0);
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: cx - _height * 0.18,
                top: 0,
                child: BodyFigure(female: female, height: _height),
              ),
              Positioned.fill(
                child: CustomPaint(
                  painter: _ScanPainter(
                    t: t,
                    cx: cx,
                    labelX: labelX,
                    ringSize: ring,
                    ringBlock: block,
                  ),
                ),
              ),
              for (var i = 0; i < 3; i++)
                Positioned(
                  left: labelX + 8,
                  top: _height * _levels[i] - 10,
                  width: labelW,
                  child: Opacity(
                    opacity: ((scan - _levels[i]) / 0.08).clamp(0.0, 1.0),
                    child: Text(
                      areas[i],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              // The score: a ring on the right, its figure locked.
              Positioned(
                right: 0,
                top: (_height - ring) / 2 - 16,
                width: block,
                child: Opacity(
                  opacity: ((t - 0.55) / 0.15).clamp(0.0, 1.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: ring,
                        height: ring,
                        child: const Center(
                          child: _LockPill(color: AppColors.lime),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        outOf,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: BtColors.textMute,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ScanPainter extends CustomPainter {
  final double t;
  final double cx;
  final double labelX;
  final double ringSize;
  final double ringBlock;
  _ScanPainter({
    required this.t,
    required this.cx,
    required this.labelX,
    required this.ringSize,
    required this.ringBlock,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final scan = _PostureGraphic._scan(t);

    // The plumb line the figure is read against, faint and dashed.
    final plumb = Paint()
      ..color = AppColors.lime.withValues(alpha: 0.45)
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;
    for (var y = 0.0; y < h * scan; y += 9) {
      canvas.drawLine(
        Offset(cx, y),
        Offset(cx, math.min(y + 4.5, h * scan)),
        plumb,
      );
    }

    // The scan itself: a bright bar with a soft wake above it, while it runs.
    if (scan < 1) {
      final y = h * scan;
      canvas.drawRect(
        Rect.fromLTRB(cx - 44, math.max(0, y - 26), cx + 44, y),
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lime.withValues(alpha: 0.0),
              AppColors.lime.withValues(alpha: 0.22),
            ],
          ).createShader(Rect.fromLTRB(cx - 44, y - 26, cx + 44, y)),
      );
      canvas.drawLine(
        Offset(cx - 46, y),
        Offset(cx + 46, y),
        Paint()
          ..color = AppColors.lime
          ..strokeWidth = 2.2
          ..strokeCap = StrokeCap.round,
      );
    }

    // Each place the check reads: a ringed dot on the figure and a leader
    // out to its name, once the scan has reached it.
    final leader = Paint()
      ..color = Colors.white.withValues(alpha: 0.30)
      ..strokeWidth = 1.2;
    for (final level in _PostureGraphic._levels) {
      final on = ((scan - level) / 0.08).clamp(0.0, 1.0);
      if (on <= 0) continue;
      final at = Offset(cx, h * level);
      canvas.drawLine(
        at + const Offset(9, 0),
        Offset(cx + 9 + (labelX - cx - 9) * on, h * level),
        leader,
      );
      canvas.drawCircle(
        at,
        9 * on,
        Paint()..color = AppColors.lime.withValues(alpha: 0.22),
      );
      canvas.drawCircle(at, 4.5 * on, Paint()..color = AppColors.lime);
    }

    // The score ring, closing after the scan.
    final ringT = ((t - 0.6) / 0.4).clamp(0.0, 1.0);
    final centre = Offset(size.width - ringBlock / 2, h / 2 - 16);
    final rect = Rect.fromCircle(center: centre, radius: ringSize / 2 - 6);
    canvas.drawArc(
      rect,
      0,
      math.pi * 2,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..color = Colors.white.withValues(alpha: ringT == 0 ? 0 : 0.08),
    );
    if (ringT > 0) {
      canvas.drawArc(
        rect,
        -math.pi / 2,
        math.pi * 2 * ringT,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8
          ..strokeCap = StrokeCap.round
          ..color = AppColors.lime,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ScanPainter old) =>
      old.t != t || old.cx != cx || old.labelX != labelX;
}

/// The Progress tab's growth card: total, since last time, how many
/// measurements. The three figures are the user's own and Pro's to show, so
/// each sits behind a lock here.
class _GrowthStrip extends StatelessWidget {
  final String title;
  final List<String> labels;
  const _GrowthStrip({required this.title, required this.labels});

  @override
  Widget build(BuildContext context) {
    const colors = [AppColors.lime, AppColors.lime, AppColors.primaryBright];
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: BtColors.card,
        borderRadius: BorderRadius.circular(BtRadius.lg),
        border: Border.all(color: BtColors.stroke),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: BtColors.textMute,
            ),
          ),
          const SizedBox(height: 14),
          IntrinsicHeight(
            child: Row(
              children: [
                for (var i = 0; i < 3; i++) ...[
                  if (i > 0)
                    VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: BtColors.stroke,
                    ),
                  Expanded(
                    child: Column(
                      children: [
                        _LockPill(color: colors[i]),
                        const SizedBox(height: 8),
                        Text(
                          labels[i],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: BtColors.textMute,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Before and after, side by side: the two posture shots the app ships.
class _PhotosGraphic extends StatelessWidget {
  const _PhotosGraphic();

  @override
  Widget build(BuildContext context) {
    Widget shot(String asset, double angle, Color edge) => Transform.rotate(
      angle: angle,
      child: Container(
        width: 122,
        height: 164,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: BtColors.card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: edge, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 22,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Image.asset(
          asset,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => const SizedBox(),
        ),
      ),
    );
    return SizedBox(
      height: 186,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 96,
            child: Center(
              child: shot(
                'assets/demo/posture_before.png',
                -0.07,
                Colors.white.withValues(alpha: 0.30),
              ),
            ),
          ),
          Positioned(
            left: 96,
            right: 0,
            child: Center(
              child: shot(
                'assets/demo/posture_after.png',
                0.06,
                AppColors.lime,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The day's habits, ticking themselves off one after another.
class _HabitsGraphic extends StatelessWidget {
  final double t;
  final List<String> habits;
  const _HabitsGraphic({required this.t, required this.habits});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: BtColors.card,
        borderRadius: BorderRadius.circular(BtRadius.lg),
        border: Border.all(color: BtColors.stroke),
      ),
      child: Column(
        children: [
          for (var i = 0; i < habits.length; i++) ...[
            if (i > 0) Divider(height: 1, thickness: 1, color: BtColors.stroke),
            Builder(
              builder: (context) {
                final done = ((t - 0.1 - i * 0.2) / 0.15).clamp(0.0, 1.0);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: done == 0
                            ? 1
                            : 0.8 + 0.2 * Curves.easeOutBack.transform(done),
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Color.lerp(
                              Colors.transparent,
                              AppColors.lime,
                              done,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color.lerp(
                                Colors.white.withValues(alpha: 0.26),
                                AppColors.lime,
                                done,
                              )!,
                              width: 1.5,
                            ),
                          ),
                          child: Opacity(
                            opacity: done,
                            child: const Icon(
                              Icons.check_rounded,
                              size: 17,
                              color: Color(0xFF07050F),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          habits[i],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.lerp(
                              Colors.white,
                              BtColors.textMute,
                              done,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

/// The reminders, each at the user's own hour, their switches turning on.
class _RemindersGraphic extends StatelessWidget {
  final double t;
  final String everyDay;
  final List<(IconData, Color, String, String)> rows;
  const _RemindersGraphic({
    required this.t,
    required this.everyDay,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          if (i > 0) const SizedBox(height: 8),
          Builder(
            builder: (context) {
              final (icon, color, name, time) = rows[i];
              final on = Curves.easeOutCubic.transform(
                ((t - 0.1 - i * 0.16) / 0.25).clamp(0.0, 1.0),
              );
              return Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                decoration: BoxDecoration(
                  color: BtColors.card,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: BtColors.stroke),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, size: 18, color: color),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            time.isEmpty ? everyDay : '$time  $everyDay',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.5,
                              color: BtColors.textMute,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // A switch, drawn: it only shows the reminder as on.
                    Container(
                      width: 46,
                      height: 28,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Color.lerp(
                          Colors.white.withValues(alpha: 0.14),
                          color,
                          on,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Align(
                        alignment: Alignment(-1 + 2 * on, 0),
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}
