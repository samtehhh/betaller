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

  static const List<_Feature> _features = [
    _Feature(
      glowColor: Color(0xFF8B5CF6),
      asset: 'assets/paywall/genetik_potansiyel.png',
      mockupCaption: 'Boy Tahmini',
      stat: '174.9',
      statLabel: "cm'ye kadar birlikte ulaşabiliriz",
      title: 'Kaç Cm Daha\nUzayabilirsin?',
      bullets: [
        'Genetiğini, yaşam tarzını ve duruşunu birlikte analiz edip senin tavanını çıkarıyoruz',
        'Yıl yıl tahminini görüyorsun — bu bir sır değil, birlikte takip ettiğimiz bir yolculuk',
        'Sonuç sabit değil: attığın her adımla birlikte güncelliyoruz',
      ],
    ),
    _Feature(
      glowColor: Color(0xFF6366F1),
      asset: 'assets/paywall/buyume_grafigi.png',
      mockupCaption: 'Büyüme Grafiği',
      stat: '+6.0',
      statLabel: 'cm bu yıl kaydettin, birlikte devam ediyoruz',
      title: 'Büyümeni\nBirlikte Takip Ediyoruz',
      bullets: [
        'Her ölçümün anında gerçek zamanlı grafiğe işleniyor',
        'Postür analizin bu grafiği doğrudan etkiliyor — hepsi bağlantılı',
        'İlerlemeni ay ay, santim santim seninle birlikte görüyoruz',
      ],
    ),
    _Feature(
      glowColor: Color(0xFFFF4DB8),
      asset: 'assets/paywall/postur_analizi.png',
      mockupCaption: 'Postür Analizi',
      stat: '86/100',
      statLabel: 'duruş puanın — yapay zeka anında ölçüyor',
      title: 'Duruşun,\nRutinlerinin Anahtarı',
      bullets: [
        'Tek fotoğraftan kifoz, lordoz ve baş pozisyonunu yapay zeka ile ölçüyoruz',
        'Sonuca göre sana özel düzeltme rutinleri öneriyoruz',
        'Doğru duruş tek başına 2-3 cm fark yaratabilir',
      ],
    ),
    _Feature(
      glowColor: Color(0xFF00E5FF),
      asset: 'assets/paywall/haftalik_rapor.png',
      mockupCaption: 'Haftalık Rapor',
      stat: '%82',
      statLabel: 'rutin tamamlama oranın bu hafta',
      title: 'Her Hafta\nSeni Değerlendiriyoruz',
      bullets: [
        'Su, uyku, rutin ve serin tek ekranda — nerede olduğunu net gör',
        'Güçlü ve eksik yönlerini her hafta birlikte belirliyoruz',
        'Küçük iyileştirmeler, haftalar içinde büyük sonuçlara dönüşüyor',
      ],
    ),
    _Feature(
      glowColor: Color(0xFFFF8A00),
      asset: 'assets/paywall/beslenme_programi.png',
      mockupCaption: 'Beslenme Programı',
      stat: '3',
      statLabel: 'öğün, onlarca kişiye özel besin önerisi',
      title: 'Komple Beslenme\nProgramın Hazır',
      bullets: [
        'Kahvaltıdan akşam yemeğine, boy uzatan besinlerle dolu tam bir plan',
        'Protein, kalsiyum, çinko, D vitamini — hepsi hesaplanmış',
        'Sadece bir rehber değil, her gün uygulayabileceğin bir program',
      ],
    ),
    _Feature(
      glowColor: Color(0xFF22FF88),
      asset: 'assets/paywall/betaller_puani.png',
      mockupCaption: 'BeTaller Puanı',
      stat: '97/100',
      statLabel: 'BeTaller Puanın — seni daima daha iyiye taşıyor',
      title: 'Seni Sürekli\nDaha İyiye Taşıyan Sistem',
      bullets: [
        'Genetik, büyüme, beslenme, uyku ve disiplinin tek puanda birleşiyor',
        'Puanın düştüğü an nerede gelişmen gerektiğini birlikte görüyoruz',
        'Hedefin sabit değil — seninle birlikte sürekli güncelleniyor',
      ],
    ),
    _Feature(
      glowColor: Color(0xFFF5C542),
      asset: 'assets/paywall/ilerleme_fotolari.png',
      mockupCaption: 'İlerleme Fotoğrafları',
      stat: '+2.0',
      statLabel: "cm'lik değişimini kendi gözünle gör",
      title: 'Değişimini\nFotoğraflarla Kanıtla',
      bullets: [
        'Öncesi/sonrası karşılaştırmalarını otomatik oluşturuyoruz',
        'Zaman çizelgende her ayın fotoğrafı bir arada duruyor',
        'Rakamlar değil, gözle görülen fark seni motive eder',
      ],
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
    final features = _features;
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
      canPop: widget.dismissible,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.dismissible)
                        GestureDetector(
                          onTap: () => Navigator.pop(context, false),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                            child: const Icon(
                              CupertinoIcons.xmark,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
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
                  Builder(
                    builder: (context) {
                      final isTr = Localizations.localeOf(context).languageCode == 'tr';
                      final defaultMonthlyPrice = isTr ? '₺149,99' : '\$11.99';
                      final defaultAnnualPrice = isTr ? '₺999,99' : '\$49.99';

                      final monthlyPriceString = monthly?.storeProduct.priceString ?? directMonthly?.priceString ?? defaultMonthlyPrice;
                      final annualPriceString = annual?.storeProduct.priceString ?? directAnnual?.priceString ?? defaultAnnualPrice;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(child: _PlanPill(
                              selected: _selectedPlan == 1,
                              label: l.paywallYearly,
                              price: annualPriceString,
                              note: '',
                              glowColor: f.glowColor,
                              showBadge: true,
                              badgeText: l.paywallBestValue,
                              onTap: () => setState(() => _selectedPlan = 1),
                            )),
                            const SizedBox(width: 10),
                            Expanded(child: _PlanPill(
                              selected: _selectedPlan == 0,
                              label: l.paywallMonthly,
                              price: monthlyPriceString,
                              note: l.paywallFreeTrial,
                              glowColor: f.glowColor,
                              onTap: () => setState(() => _selectedPlan = 0),
                            )),
                          ],
                        ),
                      );
                    }
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
          // ── Hero visual — a real in-app preview card ────────────────────
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
                child: SizedBox(
                  width: double.infinity,
                  child: _PhoneMockup(
                    asset: f.asset,
                    glowColor: f.glowColor,
                    caption: f.mockupCaption,
                  ),
                ),
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
                        fontSize: 46,
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
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.8,
                    height: 1.12,
                  ),
                ),

                const SizedBox(height: 16),

                // Bullets
                ...f.bullets.map((b) => Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 18, height: 18,
                        margin: const EdgeInsets.only(top: 1),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: f.glowColor.withValues(alpha: 0.16),
                          border: Border.all(color: f.glowColor.withValues(alpha: 0.35), width: 0.8),
                        ),
                        child: Icon(CupertinoIcons.check_mark, size: 10, color: f.glowColor),
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Text(b, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.35, color: Colors.white.withValues(alpha: 0.62)))),
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
//  Hero visual — real in-app preview cards, one per feature page
// ═════════════════════════════════════════════════════════════════════════════

class _PhoneMockup extends StatelessWidget {
  final String asset;
  final Color glowColor;
  final String caption;
  const _PhoneMockup({required this.asset, required this.glowColor, required this.caption});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        // iPhone form factor: 71.6 x 147.6 mm => 0.485 aspect.
        // The device is drawn taller than its slot and bleeds off the bottom,
        // the way App Store hero shots do, so the screen stays readable.
        const aspect = 0.485;
        final slotH = c.maxHeight;
        double h = slotH * 1.34;
        double w = h * aspect;
        if (w > c.maxWidth * 0.78) {
          w = c.maxWidth * 0.78;
          h = w / aspect;
        }

        final radius = w * 0.155;
        final bezel = w * 0.030;
        final screenRadius = radius - bezel;
        final btnW = w * 0.013;

        return SizedBox(
          height: slotH,
          // The device fades out into the page instead of ending on a hard cut
          child: ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (rect) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white, Colors.transparent],
              stops: [0.0, 0.66, 1.0],
            ).createShader(rect),
            child: Stack(
              children: [
                // The device, clipped by its slot
                ClipRect(
                child: OverflowBox(
                  alignment: Alignment.topCenter,
                  minHeight: 0,
                  maxHeight: h,
                  minWidth: 0,
                  maxWidth: c.maxWidth,
                  child: SizedBox(
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
                                BoxShadow(color: glowColor.withValues(alpha: 0.42), blurRadius: w * 0.62, spreadRadius: w * 0.03),
                                BoxShadow(color: Colors.black.withValues(alpha: 0.60), blurRadius: w * 0.22, offset: Offset(0, w * 0.10)),
                              ],
                            ),
                          ),
                        ),

                        // Side buttons (behind the frame)
                        Positioned(left: -btnW * 0.7, top: h * 0.150, child: _SideButton(width: btnW, height: h * 0.030)),
                        Positioned(left: -btnW * 0.7, top: h * 0.215, child: _SideButton(width: btnW, height: h * 0.055)),
                        Positioned(left: -btnW * 0.7, top: h * 0.285, child: _SideButton(width: btnW, height: h * 0.055)),
                        Positioned(right: -btnW * 0.7, top: h * 0.245, child: _SideButton(width: btnW, height: h * 0.080)),

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
                              colors: [Color(0xFFA6A6B2), Color(0xFF3A3A44), Color(0xFF74747F), Color(0xFF23232B), Color(0xFF9295A0)],
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
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(w * 0.065, w * 0.030, w * 0.065, w * 0.030),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: w * 0.020,
                                              height: w * 0.020,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: glowColor,
                                                boxShadow: [BoxShadow(color: glowColor.withValues(alpha: 0.9), blurRadius: w * 0.035)],
                                              ),
                                            ),
                                            SizedBox(width: w * 0.026),
                                            Expanded(
                                              child: Text(
                                                caption.toUpperCase(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: w * 0.040,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white.withValues(alpha: 0.60),
                                                  letterSpacing: w * 0.005,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: w * 0.045),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(w * 0.055),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              heightFactor: 1.0,
                                              child: Image.asset(
                                                asset,
                                                fit: BoxFit.fitWidth,
                                                width: double.infinity,
                                                alignment: Alignment.topCenter,
                                                filterQuality: FilterQuality.high,
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

                        // Dynamic Island
                        Positioned(
                          top: bezel + w * 0.030,
                          child: Container(
                            width: w * 0.30,
                            height: w * 0.085,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(w * 0.05),
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: w * 0.022),
                                child: Container(
                                  width: w * 0.028,
                                  height: w * 0.028,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFF14141C),
                                    border: Border.all(color: Colors.white.withValues(alpha: 0.06), width: 0.5),
                                  ),
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
              ],
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
    final s = w * 0.045;
    return Padding(
      padding: EdgeInsets.fromLTRB(w * 0.10, w * 0.055, w * 0.085, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: TextStyle(fontSize: s, fontWeight: FontWeight.w700, color: Colors.white.withValues(alpha: 0.9)),
          ),
          Row(
            children: [
              // signal bars
              ...List.generate(4, (i) {
                return Padding(
                  padding: EdgeInsets.only(right: w * 0.006),
                  child: Container(
                    width: w * 0.010,
                    height: s * (0.42 + i * 0.19),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(w * 0.005),
                    ),
                  ),
                );
              }),
              SizedBox(width: w * 0.014),
              Icon(CupertinoIcons.wifi, size: s * 1.05, color: Colors.white.withValues(alpha: 0.9)),
              SizedBox(width: w * 0.016),
              // battery
              Container(
                width: w * 0.055,
                height: s * 0.62,
                padding: EdgeInsets.all(w * 0.004),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * 0.014),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.5), width: w * 0.004),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.82,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(w * 0.008),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Data model
// ═════════════════════════════════════════════════════════════════════════════

class _Feature {
  final Color glowColor;
  final String asset;
  final String stat;
  final String statLabel;
  final String title;
  final String mockupCaption;
  final List<String> bullets;
  const _Feature({
    required this.glowColor,
    required this.asset,
    required this.stat,
    required this.statLabel,
    required this.title,
    required this.mockupCaption,
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
            if (note.isNotEmpty) ...[
              const SizedBox(height: 3),
              Text(note, style: TextStyle(fontSize: 9.5, color: selected ? glowColor.withValues(alpha: 0.80) : Colors.white.withValues(alpha: 0.30), fontWeight: FontWeight.w500)),
            ] else
              const SizedBox(height: 15),
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
