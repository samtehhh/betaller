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
// ═════════════════════════════════════════════════════════════════════════════

class PremiumPaywallScreen extends StatefulWidget {
  final bool dismissible;
  const PremiumPaywallScreen({super.key, this.dismissible = true});
  @override
  State<PremiumPaywallScreen> createState() => _PremiumPaywallScreenState();
}

class _PremiumPaywallScreenState extends State<PremiumPaywallScreen>
    with SingleTickerProviderStateMixin {
  Offerings? _offerings;
  List<StoreProduct> _directProducts = [];
  bool _loading = true;
  bool _purchasing = false;
  int _selectedPlan = 1;
  int _page = 0;
  final PageController _pageCtrl = PageController();
  late final AnimationController _entryAnim;

  static List<_Feature> _features(AppLocalizations l) => [
    _Feature(
      gradient: const [Color(0xFF6D28D9), Color(0xFF1E0A3C)],
      glowColor: const Color(0xFF8B5CF6),
      heroIcon: CupertinoIcons.chart_bar_fill,
      stat: '??',
      statLabel: l.paywallStat1,
      title: l.paywallTitle1,
      bullets: [l.paywallBullet1a, l.paywallBullet1b, l.paywallBullet1c],
    ),
    _Feature(
      gradient: const [Color(0xFF065F46), Color(0xFF071A10)],
      glowColor: const Color(0xFF22FF88),
      heroIcon: CupertinoIcons.flame_fill,
      stat: '29+',
      statLabel: l.paywallStat2,
      title: l.paywallTitle2,
      bullets: [l.paywallBullet2a, l.paywallBullet2b, l.paywallBullet2c],
    ),
    _Feature(
      gradient: const [Color(0xFF0C4A6E), Color(0xFF050E1A)],
      glowColor: const Color(0xFF00C6FF),
      heroIcon: CupertinoIcons.graph_square_fill,
      stat: '📊',
      statLabel: l.paywallStat3,
      title: l.paywallTitle3,
      bullets: [l.paywallBullet3a, l.paywallBullet3b, l.paywallBullet3c],
    ),
    _Feature(
      gradient: const [Color(0xFF7C2D12), Color(0xFF180A04)],
      glowColor: const Color(0xFFFF8A00),
      heroIcon: CupertinoIcons.bolt_fill,
      stat: '70',
      statLabel: l.paywallStat4,
      title: l.paywallTitle4,
      bullets: [l.paywallBullet4a, l.paywallBullet4b, l.paywallBullet4c],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _entryAnim = AnimationController(vsync: this, duration: const Duration(milliseconds: 600))..forward();
    _loadOfferings();
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    _entryAnim.dispose();
    super.dispose();
  }

  Future<void> _loadOfferings() async {
    final o = await PurchaseService().getOfferings();
    final direct = await PurchaseService().getProducts();
    if (mounted) setState(() { _offerings = o; _directProducts = direct; _loading = false; });
  }

  Future<void> _purchase(Package? pkg, {StoreProduct? product}) async {
    if (_purchasing) return;
    HapticFeedback.mediumImpact();
    if (Platform.isAndroid) {
      context.read<AppProvider>().setPremium(true);
      if (widget.dismissible && context.mounted) Navigator.pop(context, true);
      return;
    }
    setState(() => _purchasing = true);
    bool ok = false;
    if (pkg != null) {
      ok = await PurchaseService().purchasePackage(pkg);
    } else if (product != null) {
      ok = await PurchaseService().purchaseProduct(product);
    }
    if (mounted) {
      setState(() => _purchasing = false);
      if (ok) {
        context.read<AppProvider>().setPremium(true);
        if (widget.dismissible && context.mounted) Navigator.pop(context, true);
      }
    }
  }

  Future<void> _redeemPromoCode() async {
    if (!Platform.isIOS) return;
    await Purchases.presentCodeRedemptionSheet();
    if (!mounted) return;
    final ok = await PurchaseService().checkEntitlement();
    if (ok) {
      context.read<AppProvider>().setPremium(true);
      if (widget.dismissible && context.mounted) Navigator.pop(context, true);
    }
  }

  Future<void> _restore() async {
    // Android test mode: bypass restore flow
    if (Platform.isAndroid) {
      context.read<AppProvider>().setPremium(true);
      if (widget.dismissible && context.mounted) Navigator.pop(context, true);
      return;
    }
    setState(() => _purchasing = true);
    final ok = await PurchaseService().restore();
    if (mounted) {
      setState(() => _purchasing = false);
      if (ok) {
        context.read<AppProvider>().setPremium(true);
        if (widget.dismissible && context.mounted) Navigator.pop(context, true);
      } else {
        final l = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l.paywallRestore), backgroundColor: AppColors.surfaceDark),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final bottom = MediaQuery.of(context).padding.bottom;
    final features = _features(l);
    final f = features[_page];
    final current = _offerings?.current;
    final packages = current?.availablePackages ?? [];
    Package? findPkg(String productId) {
      try { return packages.firstWhere((p) => p.storeProduct.identifier == productId); }
      catch (_) { return null; }
    }
    final monthly = current?.monthly ?? findPkg(PurchaseService.monthlyProductId);
    final annual = current?.annual ?? findPkg(PurchaseService.yearlyProductId);
    StoreProduct? directMonthly;
    StoreProduct? directAnnual;
    if (monthly == null || annual == null) {
      for (final p in _directProducts) {
        if (p.identifier == PurchaseService.monthlyProductId) directMonthly = p;
        if (p.identifier == PurchaseService.yearlyProductId) directAnnual = p;
      }
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
      backgroundColor: const Color(0xFF07050F),
      body: Stack(
        children: [
          // ── Animated background glow ──────────────────────────────────────
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.0, -0.5),
                radius: 1.1,
                colors: [f.glowColor.withValues(alpha: 0.22), const Color(0xFF07050F)],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // ── Top bar ───────────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  child: Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: _restore,
                        child: Text(l.paywallRestoreLabel, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.30))),
                      ),
                    ],
                  ),
                ),

                // ── Swipeable feature pages ───────────────────────────────
                Expanded(
                  child: PageView.builder(
                    controller: _pageCtrl,
                    onPageChanged: (i) {
                      setState(() => _page = i);
                      _entryAnim.forward(from: 0);
                    },
                    itemCount: features.length,
                    itemBuilder: (_, i) => _FeaturePage(feature: features[i], entryAnim: _entryAnim),
                  ),
                ),

                // ── Page dots ────────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(features.length, (i) {
                      final active = i == _page;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 280),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: active ? 22 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: active ? f.glowColor : Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: active ? [BoxShadow(color: f.glowColor.withValues(alpha: 0.7), blurRadius: 8)] : null,
                        ),
                      );
                    }),
                  ),
                ),

                // ── Plan pills ───────────────────────────────────────────
                if (!_loading)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(child: _PlanPill(
                          selected: _selectedPlan == 1,
                          label: l.paywallYearly,
                          price: annual?.storeProduct.priceString ?? directAnnual?.priceString ?? '–',
                          note: l.paywallBestValue,
                          glowColor: f.glowColor,
                          showBadge: true,
                          badgeText: l.paywallBestValue,
                          onTap: () => setState(() => _selectedPlan = 1),
                        )),
                        const SizedBox(width: 10),
                        Expanded(child: _PlanPill(
                          selected: _selectedPlan == 0,
                          label: l.paywallMonthly,
                          price: monthly?.storeProduct.priceString ?? directMonthly?.priceString ?? '–',
                          note: l.paywallFreeTrial,
                          glowColor: f.glowColor,
                          onTap: () => setState(() => _selectedPlan = 0),
                        )),
                      ],
                    ),
                  )
                else
                  SizedBox(height: 76, child: Center(child: CircularProgressIndicator(color: f.glowColor, strokeWidth: 2))),

                const SizedBox(height: 14),

                // ── CTA ───────────────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: _purchasing ? null : () {
                      final pkg = _selectedPlan == 0 ? monthly : annual;
                      final direct = _selectedPlan == 0 ? directMonthly : directAnnual;
                      if (pkg != null || direct != null) {
                        _purchase(pkg, product: direct);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l.paywallLoadError), backgroundColor: const Color(0xFF1A1145)),
                        );
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [f.glowColor, f.glowColor.withValues(alpha: 0.65)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: [BoxShadow(color: f.glowColor.withValues(alpha: 0.40), blurRadius: 22, offset: const Offset(0, 6))],
                      ),
                      child: Center(
                        child: _purchasing
                            ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                            : Text(
                                _selectedPlan == 0 ? l.paywallCta : l.paywallCtaAlt,
                                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 0.1),
                              ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: math.max(bottom + 6, 16)),

                Text(
                  _selectedPlan == 0 ? l.paywallTrialDisclaimer : l.paywallYearlyDisclaimer,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.25)),
                ),
                const SizedBox(height: 8),
                if (Platform.isIOS)
                  GestureDetector(
                    onTap: _redeemPromoCode,
                    child: Text(
                      'Promo kodun var mı?',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.45)),
                    ),
                  ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse('https://samtehhh.github.io/betaller/privacy.html')),
                      child: Text('Privacy Policy', style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.40), decoration: TextDecoration.underline, decorationColor: Colors.white.withValues(alpha: 0.40))),
                    ),
                    Text('  ·  ', style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.25))),
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse('https://www.apple.com/legal/internet-services/itunes/dev/stdeula/')),
                      child: Text('Terms of Use', style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.40), decoration: TextDecoration.underline, decorationColor: Colors.white.withValues(alpha: 0.40))),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
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
//  Feature page — one per swipe
// ═════════════════════════════════════════════════════════════════════════════

class _FeaturePage extends StatelessWidget {
  final _Feature feature;
  final AnimationController entryAnim;
  const _FeaturePage({required this.feature, required this.entryAnim});

  @override
  Widget build(BuildContext context) {
    final f = feature;
    final fadeSlide = CurvedAnimation(parent: entryAnim, curve: Curves.easeOutCubic);

    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 8, 28, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Hero visual ────────────────────────────────────────────────
          Expanded(
            flex: 5,
            child: Center(
              child: AnimatedBuilder(
                animation: fadeSlide,
                builder: (_, child) => Opacity(
                  opacity: fadeSlide.value,
                  child: Transform.translate(
                    offset: Offset(0, 24 * (1 - fadeSlide.value)),
                    child: child,
                  ),
                ),
                child: _HeroVisual(feature: f),
              ),
            ),
          ),

          // ── Stat ───────────────────────────────────────────────────────
          AnimatedBuilder(
            animation: fadeSlide,
            builder: (_, child) => Opacity(
              opacity: fadeSlide.value.clamp(0.0, 1.0),
              child: child,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Big stat
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      f.stat,
                      style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.w900,
                        color: f.glowColor,
                        letterSpacing: -2.0,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Text(
                          f.statLabel,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.45),
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Title
                Text(
                  f.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.8,
                    height: 1.12,
                  ),
                ),

                const SizedBox(height: 16),

                // Bullets
                ...f.bullets.map((b) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 5, height: 5,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: f.glowColor),
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Text(b, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.60)))),
                    ],
                  ),
                )),

                const SizedBox(height: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Hero visual — abstract glowing orb with icon
// ═════════════════════════════════════════════════════════════════════════════

class _HeroVisual extends StatelessWidget {
  final _Feature feature;
  const _HeroVisual({required this.feature});

  @override
  Widget build(BuildContext context) {
    final c = feature.glowColor;

    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer glow
          Container(
            width: 200, height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [c.withValues(alpha: 0.18), c.withValues(alpha: 0.05), Colors.transparent],
                stops: const [0.0, 0.55, 1.0],
              ),
            ),
          ),
          // Mid ring
          Container(
            width: 140, height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: c.withValues(alpha: 0.15), width: 1),
            ),
          ),
          // Inner circle
          Container(
            width: 96, height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [c.withValues(alpha: 0.30), c.withValues(alpha: 0.10)],
              ),
              boxShadow: [
                BoxShadow(color: c.withValues(alpha: 0.45), blurRadius: 32, spreadRadius: 2),
              ],
            ),
            child: Center(
              child: Icon(feature.heroIcon, color: Colors.white, size: 40),
            ),
          ),
          // Orbiting dot
          CustomPaint(
            size: const Size(160, 160),
            painter: _OrbitPainter(color: c),
          ),
        ],
      ),
    );
  }
}

class _OrbitPainter extends CustomPainter {
  final Color color;
  const _OrbitPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Dashed arc
    final paint = Paint()
      ..color = color.withValues(alpha: 0.20)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, paint);

    // Bright dot on the arc
    const angle = -math.pi / 5;
    final dotX = center.dx + radius * math.cos(angle);
    final dotY = center.dy + radius * math.sin(angle);
    canvas.drawCircle(Offset(dotX, dotY), 5, Paint()..color = color..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4));
    canvas.drawCircle(Offset(dotX, dotY), 3, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

// ═════════════════════════════════════════════════════════════════════════════
//  Data model
// ═════════════════════════════════════════════════════════════════════════════

class _Feature {
  final List<Color> gradient;
  final Color glowColor;
  final IconData heroIcon;
  final String stat;
  final String statLabel;
  final String title;
  final List<String> bullets;
  const _Feature({
    required this.gradient,
    required this.glowColor,
    required this.heroIcon,
    required this.stat,
    required this.statLabel,
    required this.title,
    required this.bullets,
  });
}

// ═════════════════════════════════════════════════════════════════════════════
//  Plan pill
// ═════════════════════════════════════════════════════════════════════════════

class _PlanPill extends StatelessWidget {
  final bool selected;
  final String label;
  final String price;
  final String note;
  final Color glowColor;
  final VoidCallback onTap;
  final bool showBadge;
  final String? badgeText;
  const _PlanPill({required this.selected, required this.label, required this.price, required this.note, required this.glowColor, required this.onTap, this.showBadge = false, this.badgeText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: selected ? glowColor.withValues(alpha: 0.12) : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? glowColor.withValues(alpha: 0.60) : Colors.white.withValues(alpha: 0.10),
            width: selected ? 1.5 : 1,
          ),
          boxShadow: selected ? [BoxShadow(color: glowColor.withValues(alpha: 0.18), blurRadius: 14)] : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: selected ? Colors.white : Colors.white.withValues(alpha: 0.45))),
                if (showBadge) ...[
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: glowColor.withValues(alpha: 0.20), borderRadius: BorderRadius.circular(5)),
                    child: Text(badgeText ?? '', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w800, color: glowColor, letterSpacing: 0.5)),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 4),
            Text(price, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: selected ? Colors.white : Colors.white.withValues(alpha: 0.45), letterSpacing: -0.5, height: 1.0)),
            const SizedBox(height: 3),
            Text(note, style: TextStyle(fontSize: 9.5, color: selected ? glowColor.withValues(alpha: 0.80) : Colors.white.withValues(alpha: 0.30), fontWeight: FontWeight.w500)),
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
        child: Stack(children: [
          child,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
              child: Container(
                decoration: BoxDecoration(color: AppColors.scaffold.withValues(alpha: 0.3)),
                child: Center(
                  child: Icon(
                    CupertinoIcons.lock_fill,
                    color: Colors.white.withValues(alpha: 0.85),
                    size: 36,
                    shadows: const [Shadow(color: Colors.black54, blurRadius: 12)],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
