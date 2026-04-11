import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../services/purchase_service.dart';
import '../utils/constants.dart';

Future<bool?> showPremiumPaywall(BuildContext context) async {
  try {
    final purchased = await PurchaseService().presentPaywall();
    if (purchased) {
      if (context.mounted) context.read<AppProvider>().setPremium(true);
      return true;
    }
    return false;
  } catch (_) {}

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
  const PremiumPaywallScreen({super.key});
  @override
  State<PremiumPaywallScreen> createState() => _PremiumPaywallScreenState();
}

class _PremiumPaywallScreenState extends State<PremiumPaywallScreen>
    with SingleTickerProviderStateMixin {
  Offerings? _offerings;
  bool _loading = true;
  bool _purchasing = false;
  int _selectedPlan = 1;
  int _page = 0;
  final PageController _pageCtrl = PageController();
  late final AnimationController _entryAnim;

  static const _features = [
    _Feature(
      gradient: [Color(0xFF6D28D9), Color(0xFF1E0A3C)],
      glowColor: Color(0xFF8B5CF6),
      heroIcon: CupertinoIcons.chart_bar_fill,
      stat: '+2.8 cm',
      statLabel: 'average predicted growth',
      title: 'Know Your\nPotential',
      bullets: ['AI height prediction', 'Genetic & lifestyle score', 'Personalized roadmap'],
    ),
    _Feature(
      gradient: [Color(0xFF065F46), Color(0xFF071A10)],
      glowColor: Color(0xFF22FF88),
      heroIcon: CupertinoIcons.flame_fill,
      stat: '29+',
      statLabel: 'expert-designed routines',
      title: 'Train Like\nYou Mean It',
      bullets: ['Daily stretch & exercise plans', 'Nutrition & sleep protocols', 'Streak-based motivation'],
    ),
    _Feature(
      gradient: [Color(0xFF0C4A6E), Color(0xFF050E1A)],
      glowColor: Color(0xFF00C6FF),
      heroIcon: CupertinoIcons.graph_square_fill,
      stat: '100%',
      statLabel: 'progress visibility',
      title: 'See Every\nCentimeter',
      bullets: ['Monthly height tracking', 'Progress photos & posture', 'Visual growth charts'],
    ),
    _Feature(
      gradient: [Color(0xFF7C2D12), Color(0xFF180A04)],
      glowColor: Color(0xFFFF8A00),
      heroIcon: CupertinoIcons.bolt_fill,
      stat: '70',
      statLabel: 'days to the next level',
      title: 'Level Up,\nEvery Day',
      bullets: ['10-level unlock system', 'XP & milestone rewards', 'Long-term habit building'],
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
    if (mounted) setState(() { _offerings = o; _loading = false; });
  }

  Future<void> _purchase(Package pkg) async {
    if (_purchasing) return;
    HapticFeedback.mediumImpact();
    setState(() => _purchasing = true);
    final ok = await PurchaseService().purchasePackage(pkg);
    if (mounted) {
      setState(() => _purchasing = false);
      if (ok) {
        context.read<AppProvider>().setPremium(true);
        Navigator.pop(context, true);
      }
    }
  }

  Future<void> _restore() async {
    setState(() => _purchasing = true);
    final ok = await PurchaseService().restore();
    if (mounted) {
      setState(() => _purchasing = false);
      if (ok) {
        context.read<AppProvider>().setPremium(true);
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('No previous purchases found'), backgroundColor: AppColors.surfaceDark),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;
    final f = _features[_page];
    final current = _offerings?.current;
    final monthly = current?.monthly;
    final annual = current?.annual;

    return Scaffold(
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
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 34, height: 34,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.07)),
                          child: Icon(CupertinoIcons.xmark, color: Colors.white.withValues(alpha: 0.4), size: 13),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: _restore,
                        child: Text('Restore', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.30))),
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
                    itemCount: _features.length,
                    itemBuilder: (_, i) => _FeaturePage(feature: _features[i], entryAnim: _entryAnim),
                  ),
                ),

                // ── Page dots ────────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_features.length, (i) {
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
                          label: 'Yearly',
                          price: annual?.storeProduct.priceString ?? '\$39.99',
                          note: 'Best value',
                          glowColor: f.glowColor,
                          onTap: () => setState(() => _selectedPlan = 1),
                        )),
                        const SizedBox(width: 10),
                        Expanded(child: _PlanPill(
                          selected: _selectedPlan == 0,
                          label: 'Monthly',
                          price: monthly?.storeProduct.priceString ?? '\$11.99',
                          note: '3-day free trial',
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
                      if (pkg != null) _purchase(pkg);
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
                                _selectedPlan == 0 ? 'Start Free Trial' : 'Continue',
                                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 0.1),
                              ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: math.max(bottom + 6, 16)),

                Text(
                  _selectedPlan == 0 ? 'Free for 3 days · then auto-renews · cancel anytime' : 'Auto-renews yearly · cancel anytime',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.25)),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
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
  const _PlanPill({required this.selected, required this.label, required this.price, required this.note, required this.glowColor, required this.onTap});

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
                if (label == 'Yearly') ...[
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: glowColor.withValues(alpha: 0.20), borderRadius: BorderRadius.circular(5)),
                    child: Text('BEST', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w800, color: glowColor, letterSpacing: 0.5)),
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
  const PremiumLockedOverlay({
    super.key,
    required this.child,
    required this.onTap,
    this.blurAmount = 8,
    this.borderRadius = 22,
  });

  @override
  Widget build(BuildContext context) {
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
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.primary.withValues(alpha: 0.35)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(CupertinoIcons.lock_fill, color: AppColors.primaryLight, size: 15),
                        const SizedBox(width: 8),
                        Text(
                          AppLocalizations.of(context)?.premiumLabel ?? 'Premium',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primaryLight),
                        ),
                      ],
                    ),
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
