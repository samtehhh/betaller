import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../widgets/premium_paywall.dart';

class AdService {
  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  int _actionCount = 0;

  /// Tracks user action and occasionally triggers interstitial/paywall popup
  void recordAction(BuildContext context) {
    final provider = context.read<AppProvider>();
    if (provider.hasPaidPremium) return;

    _actionCount++;
    // Trigger every 3 actions
    if (_actionCount % 3 == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showInterstitialAdOrPaywall(context);
      });
    }
  }

  void _showInterstitialAdOrPaywall(BuildContext context) {
    if (!context.mounted) return;
    
    // Show a beautiful simulated interstitial ad, or show the paywall screen.
    // 50% chance for an Ad popup, 50% chance for the premium upsell screen.
    final bool showPaywall = DateTime.now().millisecond % 2 == 0;
    
    if (showPaywall) {
      showPremiumPaywall(context);
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const _InterstitialAdDialog(),
      );
    }
  }
}

class _InterstitialAdDialog extends StatefulWidget {
  const _InterstitialAdDialog();

  @override
  State<_InterstitialAdDialog> createState() => _InterstitialAdDialogState();
}

class _InterstitialAdDialogState extends State<_InterstitialAdDialog> {
  int _secondsLeft = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 1) {
        setState(() {
          _secondsLeft--;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _secondsLeft = 0;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: double.infinity,
        height: 480,
        decoration: BoxDecoration(
          color: const Color(0xFF0F0E17),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFF2C2A3E), width: 1.5),
        ),
        child: Stack(
          children: [
            // Ad content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  // Premium partner mock ad
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1B30),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(CupertinoIcons.bolt_horizontal_circle_fill, color: Color(0xFF8B5CF6), size: 48),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'BeTaller Premium',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.extrabold, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Boy uzatma yolculuğunu reklamsız ve kesintisiz sürdür. Premium ile daha hızlı odaklan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.white60, height: 1.4),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showPremiumPaywall(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B5CF6),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 54),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Premium\'a Geç ve Reklamları Kaldır',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            // Close button on top-right
            Positioned(
              top: 16,
              right: 16,
              child: GestureDetector(
                onTap: _secondsLeft == 0 ? () => Navigator.pop(context) : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    _secondsLeft > 0 ? 'Reklamı Kapat ($_secondsLeft)' : 'Kapat',
                    style: TextStyle(
                      color: _secondsLeft > 0 ? Colors.white54 : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
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

class AdBannerWidget extends StatelessWidget {
  const AdBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    if (provider.hasPaidPremium) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF13111E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05), width: 1),
      ),
      child: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xFF8B5CF6).withValues(alpha: 0.4), width: 0.5),
                  ),
                  child: const Text(
                    'SPONSOR',
                    style: TextStyle(color: Color(0xFF8B5CF6), fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                  ),
                ),
                const SizedBox(width: 10),
                const Flexible(
                  child: Text(
                    'Boy uzatma formüllerini keşfetmek için Premium\'a geç!',
                    style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                icon: const Icon(CupertinoIcons.right_chevron, size: 14, color: Colors.white38),
                onPressed: () => showPremiumPaywall(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
