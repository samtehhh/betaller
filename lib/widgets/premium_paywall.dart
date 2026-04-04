import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

Future<bool?> showPremiumPaywall(BuildContext context) {
  return Navigator.push<bool>(
    context,
    CupertinoPageRoute(fullscreenDialog: true, builder: (_) => const PremiumPaywallScreen()),
  );
}

class PremiumPaywallScreen extends StatefulWidget {
  const PremiumPaywallScreen({super.key});
  @override
  State<PremiumPaywallScreen> createState() => _PremiumPaywallScreenState();
}

class _PremiumPaywallScreenState extends State<PremiumPaywallScreen> {

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    final bottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: DefaultTextStyle(
        style: const TextStyle(decoration: TextDecoration.none, fontFamily: 'Inter', color: Colors.white),
        child: Column(
          children: [
            SizedBox(height: top),
            // Close button
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 34, height: 34,
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.08), shape: BoxShape.circle),
                    child: Icon(CupertinoIcons.xmark, color: Colors.white.withValues(alpha: 0.6), size: 15),
                  ),
                ),
              ),
            ),
            // ── Scrollable content ──
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    // App logo
                    Container(
                      width: 80, height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 24, offset: const Offset(0, 6))],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Image.asset('assets/icon.png', fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Unlock your full growth potential', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.7))),
                    const SizedBox(height: 32),
                    // ── Features list ──
                    _featureRow(CupertinoIcons.chart_bar_fill, 'Growth analysis & score', AppColors.primary),
                    _featureRow(CupertinoIcons.sparkles, 'Height prediction & forecast', AppColors.cyan),
                    _featureRow(CupertinoIcons.bolt_fill, 'All 14 daily routines', AppColors.lime),
                    _featureRow(CupertinoIcons.drop_fill, 'Water & sleep tracking', AppColors.water),
                    _featureRow(CupertinoIcons.graph_square_fill, 'Progress & measurements', AppColors.orange),
                    _featureRow(CupertinoIcons.star_fill, 'Achievements & streaks', AppColors.pink),
                    const SizedBox(height: 28),
                    // ── Plans (tap to purchase directly) ──
                    _planRow(label: 'Monthly', price: '\$11.99', per: '/mo', onTap: () {
                      // TODO: replace with actual in-app purchase
                      context.read<AppProvider>().setPremium(true);
                      Navigator.pop(context, true);
                    }),
                    const SizedBox(height: 10),
                    _planRow(label: 'Yearly', price: '\$39.99', per: '/yr', badge: 'BEST VALUE', onTap: () {
                      // TODO: replace with actual in-app purchase
                      context.read<AppProvider>().setPremium(true);
                      Navigator.pop(context, true);
                    }),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: bottom + 8),
          ],
        ),
      ),
    );
  }

  Widget _featureRow(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 38, height: 38,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 14),
          Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.85))),
        ],
      ),
    );
  }

  Widget _planRow({
    required String label,
    required String price,
    required String per,
    required VoidCallback onTap,
    String? badge,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary.withValues(alpha: 0.15), AppColors.primaryDark.withValues(alpha: 0.08)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.4), width: 1.5),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(label, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white)),
                  if (badge != null) ...[
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(gradient: AppColors.gradientPrimary, borderRadius: BorderRadius.circular(6)),
                      child: Text(badge, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 0.3)),
                    ),
                  ],
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontFamily: 'Inter', decoration: TextDecoration.none),
                children: [
                  TextSpan(text: price, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5)),
                  TextSpan(text: per, style: TextStyle(fontSize: 12, color: Colors.white.withValues(alpha: 0.4))),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(CupertinoIcons.chevron_right, color: Colors.white.withValues(alpha: 0.4), size: 16),
          ],
        ),
      ),
    );
  }
}

// ── Lock overlay ────────────────────────────────────────────────

class PremiumLockedOverlay extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double blurAmount;
  final double borderRadius;
  const PremiumLockedOverlay({super.key, required this.child, required this.onTap, this.blurAmount = 8, this.borderRadius = 22});

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
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.lock_fill, color: AppColors.primaryLight, size: 15),
                        SizedBox(width: 8),
                        Text('Premium', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primaryLight)),
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
