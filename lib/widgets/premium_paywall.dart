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

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../services/purchase_service.dart';
import '../utils/constants.dart';
import 'paywall_previews.dart';
import 'phone_mockup.dart';

/// Opens the paywall. [closeDelay] holds the close button back for a moment,
/// for the placements the app opens on its own (end of onboarding, first
/// launch of the day) — long enough to read the offer, not a trap: the button
/// always arrives.
Future<bool?> showPremiumPaywall(
  BuildContext context, {
  Duration closeDelay = Duration.zero,
}) async {
  if (!context.mounted) return false;
  return Navigator.push<bool>(
    context,
    CupertinoPageRoute(
      fullscreenDialog: true,
      builder: (_) => PremiumPaywallScreen(closeDelay: closeDelay),
    ),
  );
}

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

/// The trial length to advertise on the monthly plan when the store has not
/// told us one.
///
/// The store is the authority: [_freeTrialDays] reads the real introductory
/// offer, so a user who has already burned their trial is not promised another,
/// and a change made in App Store Connect needs no app release. This constant
/// only covers the window before the offering resolves — and the sheet is a
/// spinner then anyway — plus Android builds whose trial is expressed as an
/// offer the plugin does not surface as an introductory price. Keep it in step
/// with what the stores are actually configured to give.
const int _kAssumedTrialDays = 3;

// ── Debug-only demo prices ───────────────────────────────────────────────
//
// Never reach a real user: every use below is gated on [kDebugMode], so a
// release build always falls through to the real store price or "—" —
// never a number nobody is actually being charged. These exist purely so
// the sheet is reviewable on a device before the store products are
// approved/configured (App Store Connect, RevenueCat), matching the plan
// names discussed for BeTaller (weekly/monthly/yearly).
const double _kDemoWeekly = 4.99;
const double _kDemoMonthly = 9.99;
const double _kDemoYearly = 39.99;
const String _kDemoCurrency = 'USD';

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
/// not a trial, and is not advertised as one.
int? _freeTrialDays(StoreProduct? product) {
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

class PremiumPaywallScreen extends StatefulWidget {
  final bool dismissible;
  final Duration closeDelay;
  const PremiumPaywallScreen({
    super.key,
    this.dismissible = true,
    this.closeDelay = Duration.zero,
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

  /// 0 monthly, 1 yearly, 2 weekly. Settled by [_defaultPlan] once the store
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
      PurchaseService.yearlyProductId,
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
    return _freeTrialDays(product);
  }

  /// The plan the sheet opens on: the first one that starts with a free trial
  /// this user can still get — yearly, then monthly, then weekly — else
  /// yearly. Opening on a plan that bills on day one hid the only trial behind
  /// a tap, and a trial is what an app nobody has heard of has to sell.
  int _defaultPlan() {
    for (final (plan, id) in const [
      (1, PurchaseService.yearlyProductId),
      (0, PurchaseService.monthlyProductId),
      (2, PurchaseService.weeklyProductId),
    ]) {
      if ((_trialFor(_storeProduct(id)) ?? 0) > 0) return plan;
    }
    return 1;
  }

  Future<void> _purchase(Package? pkg, {StoreProduct? product}) async {
    if (_purchasing) return;
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
        context.read<AppProvider>().setPremium(true);
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

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final media = MediaQuery.of(context);
    final topPad = media.padding.top;
    final bottomPad = media.padding.bottom;

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
    final annual = current?.annual ?? findPkg(PurchaseService.yearlyProductId);
    final weekly = current?.weekly ?? findPkg(PurchaseService.weeklyProductId);
    StoreProduct? directMonthly;
    StoreProduct? directAnnual;
    StoreProduct? directWeekly;
    if (monthly == null || annual == null || weekly == null) {
      for (final p in _directProducts) {
        if (p.identifier == PurchaseService.monthlyProductId) directMonthly = p;
        if (p.identifier == PurchaseService.yearlyProductId) directAnnual = p;
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
      // On iOS a loaded product is the authority, eligibility included. The
      // assumed trial only covers the window before it loads, and Android,
      // whose trial the plugin does not surface as an introductory price.
      trialDays: Platform.isIOS && monthlyProduct != null
          ? _trialFor(monthlyProduct)
          : _freeTrialDays(monthlyProduct) ?? _kAssumedTrialDays,
    );
    final annualOffer = _PlanOffer(
      price: annualProduct?.priceString ?? _demoPrice(_kDemoYearly),
      rawPrice: annualProduct?.price ?? (kDebugMode ? _kDemoYearly : null),
      currencyCode:
          annualProduct?.currencyCode ?? (kDebugMode ? _kDemoCurrency : null),
      trialDays: _trialFor(annualProduct),
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
        backgroundColor: const Color(0xFF07050F),
        body: TweenAnimationBuilder<Color?>(
          tween: ColorTween(
            begin: kPaywallPreviews.first.accent,
            end: _preview.accent,
          ),
          duration: const Duration(milliseconds: 520),
          curve: Curves.easeInOut,
          builder: (context, tweened, _) {
            final accent = tweened ?? _preview.accent;
            // Bright accents (green, amber, cyan) need dark text on the CTA.
            final onAccent = accent.computeLuminance() > 0.5
                ? const Color(0xFF07050F)
                : Colors.white;

            return Stack(
              children: [
                // ── Accent glow behind the device ─────────────────────────
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

                Column(
                  children: [
                    // ── The tour ──────────────────────────────────────────
                    Expanded(
                      child: _Tour(
                        controller: _pageCtrl,
                        topInset: topPad,
                        onPageChanged: (i) => setState(() => _rawPage = i),
                        onUserInteraction: _pauseAutoAdvance,
                      ),
                    ),

                    // ── Page dots ─────────────────────────────────────────
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 2, 20, 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(kPaywallPreviews.length, (i) {
                          final active = i == _slide;
                          // Only the width is animated here. The colour is
                          // already being tweened above, and animating it a
                          // second time left the dot a whole slide behind the
                          // CTA mid-change — two different accents on screen
                          // at once.
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 280),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: active ? 18 : 6,
                            height: 6,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: active
                                    ? accent
                                    : Colors.white.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    // ── The purchase sheet, which never moves ─────────────
                    _PurchaseSheet(
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
                        if (pkg != null || direct != null) {
                          _purchase(pkg, product: direct);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(l.paywallLoadError),
                              backgroundColor: AppColors.surfaceDark,
                            ),
                          );
                        }
                      },
                    ),
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
                              onTap: () => Navigator.pop(context, false),
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
            topInset: topInset + 44,
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
  /// anything else (1) annual.
  _PlanOffer _offerFor(int plan) => switch (plan) {
    0 => widget.monthlyOffer,
    2 => widget.weeklyOffer,
    _ => widget.annualOffer,
  };

  /// How much cheaper the annual plan is than paying monthly for a year,
  /// rounded to a whole percent — or null until both raw prices are in.
  /// Never derived from the formatted price strings: those carry a currency
  /// symbol and locale-specific grouping, not a number to do math on.
  int? get _yearlySavePercent {
    final monthly = widget.monthlyOffer.rawPrice;
    final annual = widget.annualOffer.rawPrice;
    if (monthly == null || annual == null || monthly <= 0) return null;
    final percent = (1 - (annual / 12) / monthly) * 100;
    if (percent <= 0) return null;
    return percent.round();
  }

  /// The store's price with its billing period ("$39.99/year"), or a dash
  /// until the offering loads.
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
      _ =>
        offer.hasTrial
            ? l.paywallTrialThenYearly(days, price)
            : l.paywallYearlyDisclaimer,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final offer = _offerFor(widget.selectedPlan);
    final accent = widget.accent;
    final onAccent = widget.onAccent;

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
          color: const Color(0xFF0D0920),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
          border: Border(
            top: BorderSide(color: accent.withValues(alpha: 0.30)),
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
            top: 18,
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
              if (!widget.loading)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _PlanRow(
                        selected: widget.selectedPlan == 2,
                        label: l.paywallWeekly,
                        price: _billed(widget.weeklyOffer.price, l.paywallPerWeek),
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
                        label: l.paywallYearly,
                        price: _billed(
                          widget.annualOffer.price,
                          l.paywallPerYear,
                        ),
                        badgeText: _yearlySavePercent != null
                            ? l.paywallSavePercent('$_yearlySavePercent')
                            : l.paywallBestValue,
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [accent, accent.withValues(alpha: 0.65)],
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
                            // "Continue", never "Try Free": an 18pt trial
                            // promise on the button outranks the billed
                            // price in the rows above, which is what 3.1.2(c)
                            // forbids. The trial terms sit right under it.
                            : Text(
                                l.paywallCtaAlt,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
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
        padding: const EdgeInsets.fromLTRB(13, 12, 13, 12),
        decoration: BoxDecoration(
          color: selected
              ? accent.withValues(alpha: 0.12)
              : Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected
                ? accent.withValues(alpha: 0.65)
                : Colors.white.withValues(alpha: 0.10),
            width: selected ? 1.5 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.18),
                    blurRadius: 16,
                    spreadRadius: -4,
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            // The radio, so it is obvious these are a choice of one.
            Container(
              width: 19,
              height: 19,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? accent : Colors.transparent,
                border: Border.all(
                  color: selected
                      ? accent
                      : Colors.white.withValues(alpha: 0.28),
                  width: 1.6,
                ),
              ),
              child: selected
                  ? Icon(Icons.check_rounded, size: 13, color: onAccent)
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
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: selected
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.60),
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
            Text(
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
          ],
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
