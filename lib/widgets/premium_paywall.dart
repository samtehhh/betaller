import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../services/purchase_service.dart';
import '../utils/constants.dart';
import 'paywall_previews.dart';

Future<bool?> showPremiumPaywall(BuildContext context) async {
  if (!context.mounted) return false;
  return Navigator.push<bool>(
    context,
    CupertinoPageRoute(
      fullscreenDialog: true,
      builder: (_) => const PremiumPaywallScreen(),
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

/// One plan as the sheet needs it: what the store charges, and how many days
/// it gives away first.
class _PlanOffer {
  /// The store's own price string, or null when the offering has not loaded.
  /// Never a hardcoded stand-in — see the note where this is built.
  final String? price;

  /// Free days up front, or null for a plan that starts billing immediately.
  final int? trialDays;

  const _PlanOffer({required this.price, required this.trialDays});

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
  const PremiumPaywallScreen({super.key, this.dismissible = true});
  @override
  State<PremiumPaywallScreen> createState() => _PremiumPaywallScreenState();
}

class _PremiumPaywallScreenState extends State<PremiumPaywallScreen> {
  Offerings? _offerings;
  List<StoreProduct> _directProducts = [];
  bool _loading = true;
  bool _purchasing = false;
  int _selectedPlan = 1;

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
  }

  @override
  void dispose() {
    _advance?.cancel();
    _resume?.cancel();
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
    final o = await PurchaseService().getOfferings();
    final direct = await PurchaseService().getProducts();
    if (mounted) {
      setState(() {
        _offerings = o;
        _directProducts = direct;
        _loading = false;
      });
    }
  }

  Future<void> _purchase(Package? pkg, {StoreProduct? product}) async {
    if (_purchasing) return;
    HapticFeedback.mediumImpact();
    setState(() => _purchasing = true);
    bool ok = false;
    if (pkg != null) {
      ok = await PurchaseService().purchasePackage(pkg);
    } else if (product != null) {
      ok = await PurchaseService().purchaseProduct(product);
    }
    if (!mounted) return;
    setState(() => _purchasing = false);
    if (ok) {
      context.read<AppProvider>().setPremium(true);
      if (widget.dismissible) Navigator.pop(context, true);
    } else {
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
    StoreProduct? directMonthly;
    StoreProduct? directAnnual;
    if (monthly == null || annual == null) {
      for (final p in _directProducts) {
        if (p.identifier == PurchaseService.monthlyProductId) directMonthly = p;
        if (p.identifier == PurchaseService.yearlyProductId) directAnnual = p;
      }
    }

    final monthlyProduct = monthly?.storeProduct ?? directMonthly;
    final annualProduct = annual?.storeProduct ?? directAnnual;
    final monthlyOffer = _PlanOffer(
      price: monthlyProduct?.priceString,
      trialDays: _freeTrialDays(monthlyProduct) ?? _kAssumedTrialDays,
    );
    final annualOffer = _PlanOffer(
      price: annualProduct?.priceString,
      trialDays: _freeTrialDays(annualProduct),
    );

    return PopScope(
      canPop: widget.dismissible,
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
                      onSelectPlan: (i) => setState(() => _selectedPlan = i),
                      onRedeemPromo: _redeemPromoCode,
                      onBuy: () {
                        final pkg = _selectedPlan == 0 ? monthly : annual;
                        final direct = _selectedPlan == 0
                            ? directMonthly
                            : directAnnual;
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
                        GestureDetector(
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
          child: _PhoneMockup(
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
              Text(
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

class _PurchaseSheet extends StatelessWidget {
  final Color accent;
  final Color onAccent;
  final bool loading;
  final bool purchasing;
  final int selectedPlan;
  final double bottomPad;
  final _PlanOffer monthlyOffer;
  final _PlanOffer annualOffer;
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
    required this.onSelectPlan,
    required this.onBuy,
    required this.onRedeemPromo,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0D0920),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
        border: Border(top: BorderSide(color: accent.withValues(alpha: 0.30))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.55),
            blurRadius: 34,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 18, bottom: math.max(bottomPad, 10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── The plans ─────────────────────────────────────────────────
            //
            // Full-width rows, not two narrow pills. The trial used to be
            // nine-point grey type under a price — the place offers go to die —
            // and the moment it was promoted to a badge the pill was too narrow
            // to spell it: "3 gün ücre…". A row has the width to say it, and
            // says it in filled accent so it is the loudest thing in the sheet.
            //
            // Prices come from the store or not at all. Falling back to a
            // hardcoded figure showed a Turkish lira amount to every locale
            // whenever the offering failed to load — the wrong currency and,
            // after any price change, the wrong number. Both stores treat that
            // as misleading pricing.
            if (!loading)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _PlanRow(
                      selected: selectedPlan == 1,
                      label: l.paywallYearly,
                      price: annualOffer.price,
                      badgeText: l.paywallBestValue,
                      badgeFilled: false,
                      accent: accent,
                      onTap: () => onSelectPlan(1),
                    ),
                    const SizedBox(height: 10),
                    _PlanRow(
                      selected: selectedPlan == 0,
                      label: l.paywallMonthly,
                      price: monthlyOffer.price,
                      badgeText: monthlyOffer.hasTrial
                          ? l.paywallTrialHeadline('${monthlyOffer.trialDays}')
                          : null,
                      badgeFilled: true,
                      accent: accent,
                      onTap: () => onSelectPlan(0),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: purchasing ? null : onBuy,
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [accent, accent.withValues(alpha: 0.65)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(17),
                    boxShadow: [
                      BoxShadow(
                        color: accent.withValues(alpha: 0.40),
                        blurRadius: 22,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: purchasing
                        ? SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              color: onAccent,
                              strokeWidth: 2.5,
                            ),
                          )
                        : Text(
                            (selectedPlan == 0 ? monthlyOffer : annualOffer)
                                    .hasTrial
                                ? l.paywallCta
                                : l.paywallCtaAlt,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: onAccent,
                              letterSpacing: 0.1,
                            ),
                          ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                (selectedPlan == 0 ? monthlyOffer : annualOffer).hasTrial
                    ? l.paywallTrialDisclaimer
                    : l.paywallYearlyDisclaimer,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withValues(alpha: 0.25),
                ),
              ),
            ),
            const SizedBox(height: 6),
            if (Platform.isIOS) ...[
              GestureDetector(
                onTap: onRedeemPromo,
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
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Hero visual — the app's own screens, drawn inside a device
// ═════════════════════════════════════════════════════════════════════════════

/// The design box a preview screen is authored in. Its aspect matches the
/// mockup's display area below the status bar, so a screen scales in without
/// letterboxing or a squeeze.
const Size _kScreenDesign = kPreviewDesignSize;

class _PhoneMockup extends StatelessWidget {
  final Widget screen;
  final Color accent;

  /// How far down the slot the device starts, clearing the close button and
  /// the status bar. The slot itself still reaches the top of the screen so
  /// the glow has somewhere to spill.
  final double topInset;
  const _PhoneMockup({
    required this.screen,
    required this.accent,
    required this.topInset,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        // iPhone form factor: 71.6 x 147.6 mm => 0.485 aspect. The device wants
        // to fit its slot outright — the tour changes screens every few
        // seconds, so the whole screen should be there the moment it lands.
        const aspect = 0.485;
        // The device keeps a margin of its own now that the slot runs edge to
        // edge; only the glow is allowed past it.
        final slotW = math.max(c.maxWidth - 40, 1.0);
        final slotH = math.max(c.maxHeight - topInset, 1.0);
        double h = slotH;
        double w = h * aspect;
        if (w > slotW * 0.86) {
          w = slotW * 0.86;
          h = w / aspect;
        }

        // On a short phone, though, fitting by height leaves a device barely
        // wider than a finger, and the screen inside it unreadable — which
        // defeats the point of showing it at all. Past that floor the device is
        // sized by width instead and bleeds off the bottom of the slot, the way
        // App Store shots do: a large, legible top half beats a complete but
        // illegible whole.
        final byHeight = w >= slotW * 0.58;
        if (!byHeight) {
          w = slotW * 0.74;
          h = w / aspect;
        }

        final radius = w * 0.155;
        final bezel = w * 0.030;
        final screenRadius = radius - bezel;
        final btnW = w * 0.013;

        final device = SizedBox(
          width: w,
          height: h,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Ambient glow behind the device
              Center(
                child: Container(
                  width: w * 0.88,
                  height: h * 0.80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    boxShadow: [
                      BoxShadow(
                        color: accent.withValues(alpha: 0.42),
                        blurRadius: w * 0.62,
                        spreadRadius: w * 0.03,
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.60),
                        blurRadius: w * 0.22,
                        offset: Offset(0, w * 0.10),
                      ),
                    ],
                  ),
                ),
              ),

              // Side buttons (behind the frame)
              Positioned(
                left: -btnW * 0.7,
                top: h * 0.150,
                child: _SideButton(width: btnW, height: h * 0.030),
              ),
              Positioned(
                left: -btnW * 0.7,
                top: h * 0.215,
                child: _SideButton(width: btnW, height: h * 0.055),
              ),
              Positioned(
                left: -btnW * 0.7,
                top: h * 0.285,
                child: _SideButton(width: btnW, height: h * 0.055),
              ),
              Positioned(
                right: -btnW * 0.7,
                top: h * 0.245,
                child: _SideButton(width: btnW, height: h * 0.080),
              ),

              // Titanium frame
              Container(
                width: w,
                height: h,
                padding: EdgeInsets.all(bezel),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFA6A6B2),
                      Color(0xFF3A3A44),
                      Color(0xFF74747F),
                      Color(0xFF23232B),
                      Color(0xFF9295A0),
                    ],
                    stops: [0.0, 0.20, 0.5, 0.80, 1.0],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenRadius),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF130B2B), Color(0xFF090515)],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _StatusBar(width: w),
                            SizedBox(height: w * 0.045),
                            Expanded(
                              child: ClipRect(
                                // The screen is authored at a fixed size and
                                // scaled down like a screenshot, so a phone
                                // three inches tall shows the same layout as
                                // the real one and no text reflows.
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    width: _kScreenDesign.width,
                                    height: _kScreenDesign.height,
                                    // The preview must not inherit the user's
                                    // text scale: at 200% a fake screen turns
                                    // into a wall of clipped labels.
                                    child: MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                        textScaler: TextScaler.noScaling,
                                      ),
                                      child: screen,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Glass reflection
                        Positioned.fill(
                          child: IgnorePointer(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withValues(alpha: 0.10),
                                    Colors.white.withValues(alpha: 0.02),
                                    Colors.transparent,
                                    Colors.transparent,
                                  ],
                                  stops: const [0.0, 0.14, 0.38, 1.0],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Earpiece slot, milled into the top edge of the frame
              Positioned(
                top: bezel * 0.28,
                child: Container(
                  width: w * 0.22,
                  height: math.max(bezel * 0.34, 1.2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF15151A),
                    borderRadius: BorderRadius.circular(bezel),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.14),
                        blurRadius: 0,
                        offset: const Offset(0, 0.6),
                      ),
                    ],
                  ),
                ),
              ),

              // Dynamic Island
              Positioned(
                top: bezel + w * 0.032,
                child: Container(
                  width: w * 0.305,
                  height: w * 0.088,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(w * 0.05),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: w * 0.024),
                      child: Container(
                        width: w * 0.030,
                        height: w * 0.030,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            center: Alignment(-0.3, -0.4),
                            radius: 0.9,
                            colors: [Color(0xFF2A3350), Color(0xFF0B0B12)],
                          ),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

        // Fits: no clip at all, so the glow bleeds into the copy below the
        // way a light source should.
        if (byHeight) {
          return Padding(
            padding: EdgeInsets.only(top: topInset),
            child: Center(child: device),
          );
        }

        // Sized by width: hang the device from the top and let the frame run
        // off the bottom, fading out rather than ending on a cut. The clip is
        // the whole slot — full width, and up to the very top of the screen —
        // so the only hard edges it can make are ones the screen already has.
        return ClipRect(
          child: Padding(
            padding: EdgeInsets.only(top: topInset),
            child: ShaderMask(
              blendMode: BlendMode.dstIn,
              shaderCallback: (rect) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white, Colors.transparent],
                stops: [0.0, 0.86, 1.0],
              ).createShader(rect),
              child: OverflowBox(
                alignment: Alignment.topCenter,
                minHeight: 0,
                maxHeight: h,
                child: device,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SideButton extends StatelessWidget {
  final double width;
  final double height;
  const _SideButton({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF8C8C99), Color(0xFF3A3A44)],
        ),
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  final double width;
  const _StatusBar({required this.width});

  @override
  Widget build(BuildContext context) {
    final w = width;
    // iOS keeps these icons small: about 11pt tall on a 393pt screen, with the
    // cluster ending roughly 14pt from the edge, well clear of the island.
    final iconH = w * 0.032;
    return Padding(
      padding: EdgeInsets.fromLTRB(w * 0.10, w * 0.058, w * 0.062, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '9:41',
            style: TextStyle(
              fontSize: w * 0.042,
              fontWeight: FontWeight.w600,
              letterSpacing: -w * 0.001,
              color: Colors.white,
            ),
          ),
          CustomPaint(
            size: Size(iconH * 5.35, iconH),
            painter: _StatusIconsPainter(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

/// Signal, Wi-Fi and battery, drawn to iOS proportions: bars share a baseline,
/// the Wi-Fi arcs share a centre, and the battery keeps its terminal nub.
class _StatusIconsPainter extends CustomPainter {
  final Color color;
  const _StatusIconsPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final fill = Paint()
      ..color = color
      ..isAntiAlias = true;
    double x = 0;

    // ── Signal: four bars on one baseline ────────────────────────────────
    final barW = h * 0.28;
    final gap = h * 0.17;
    for (var i = 0; i < 4; i++) {
      final barH = h * (0.38 + i * 0.207);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, h - barH, barW, barH),
          Radius.circular(barW * 0.35),
        ),
        fill,
      );
      x += barW + gap;
    }

    // ── Wi-Fi: three arcs plus the dot, all about one centre ─────────────
    x += h * 0.34;
    final wifiW = h * 1.36;
    final cx = x + wifiW / 2;
    final cy = h * 0.97;
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = h * 0.155
      ..isAntiAlias = true;
    for (final r in [wifiW * 0.50, wifiW * 0.31]) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: r),
        math.pi * 1.25,
        math.pi * 0.5,
        false,
        stroke,
      );
    }
    canvas.drawCircle(Offset(cx, cy - h * 0.07), h * 0.115, fill);
    x += wifiW;

    // ── Battery: outline, terminal nub, charge level ─────────────────────
    x += h * 0.40;
    final bodyW = h * 1.95;
    final bodyH = h * 0.92;
    final top = (h - bodyH) / 2;
    final line = h * 0.09;
    final body = RRect.fromRectAndRadius(
      Rect.fromLTWH(x + line / 2, top + line / 2, bodyW - line, bodyH - line),
      Radius.circular(bodyH * 0.32),
    );
    canvas.drawRRect(
      body,
      Paint()
        ..color = color.withValues(alpha: 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = line
        ..isAntiAlias = true,
    );
    // terminal nub
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          x + bodyW + h * 0.03,
          h / 2 - bodyH * 0.19,
          h * 0.13,
          bodyH * 0.38,
        ),
        Radius.circular(h * 0.06),
      ),
      Paint()
        ..color = color.withValues(alpha: 0.55)
        ..isAntiAlias = true,
    );
    // charge level
    final inset = line * 2.4;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          x + inset,
          top + inset,
          (bodyW - inset * 2) * 0.82,
          bodyH - inset * 2,
        ),
        Radius.circular(bodyH * 0.16),
      ),
      fill,
    );
  }

  @override
  bool shouldRepaint(covariant _StatusIconsPainter old) => old.color != color;
}

// ═════════════════════════════════════════════════════════════════════════════
//  Plan row
// ═════════════════════════════════════════════════════════════════════════════

/// One plan, full width: what it is called, what it costs, and the one thing
/// worth shouting about it.
class _PlanRow extends StatelessWidget {
  final bool selected;
  final String label;

  /// The store's own price string, or null when the offering has not loaded.
  /// Never a hardcoded stand-in — see the note where this is built.
  final String? price;

  /// Best value, or the free days. Null on a plan with neither.
  final String? badgeText;

  /// Filled badges read as an offer, tinted ones as a label. The free trial
  /// gets the filled one — it is the thing this sheet is selling.
  final bool badgeFilled;

  final Color accent;
  final VoidCallback onTap;

  const _PlanRow({
    required this.selected,
    required this.label,
    required this.price,
    required this.badgeText,
    required this.badgeFilled,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Bright accents (green, amber, cyan) need dark text on a filled badge.
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
            Flexible(
              child: Text(
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
            ),
            const SizedBox(width: 8),
            Text(
              price ?? '—',
              maxLines: 1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: selected
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.60),
                letterSpacing: -0.4,
              ),
            ),
            if (badgeText != null) ...[
              const SizedBox(width: 8),
              // Capped only as a last resort, for a translation long enough to
              // crowd out the price on the narrowest phone.
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 132),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: badgeFilled
                        ? accent
                        : accent.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: badgeFilled
                        ? [
                            BoxShadow(
                              color: accent.withValues(alpha: 0.45),
                              blurRadius: 12,
                              spreadRadius: -2,
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    badgeText!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w900,
                      color: badgeFilled ? onAccent : accent,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
            ],
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
                    child: Icon(
                      CupertinoIcons.lock_fill,
                      color: Colors.white.withValues(alpha: 0.85),
                      size: 36,
                      shadows: const [
                        Shadow(color: Colors.black54, blurRadius: 12),
                      ],
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
