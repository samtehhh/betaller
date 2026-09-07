import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:in_app_review/in_app_review.dart';

import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/localized_data.dart';
import '../services/notification_service.dart';
import '../l10n/app_localizations.dart';
import 'home_screen.dart';
import '../widgets/premium_paywall.dart';
import 'analysis_screen.dart';
import 'routines_screen.dart';
import 'progress_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final _progressKey = GlobalKey<ProgressScreenState>();
  final _analysisKey = GlobalKey<AnalysisScreenState>();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeScreen(),
      const RoutinesScreen(),
      ProgressScreen(key: _progressKey),
      AnalysisScreen(key: _analysisKey),
      const ProfileScreen(),
    ];

    // Show dismissible paywall after 3.5 seconds if not premium
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AppProvider>();
      if (!provider.isPremium) {
        Future.delayed(const Duration(milliseconds: 3500), () {
          if (mounted) {
            final currentProvider = context.read<AppProvider>();
            if (!currentProvider.isPremium) {
              showPremiumPaywall(context);
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    // Check if provider wants to show review prompt
    final provider = context.watch<AppProvider>();

    // Announce any badge earned since the last frame.
    final notices = provider.pendingAchievementNotices;
    if (notices.isNotEmpty) {
      provider.clearAchievementNotices();
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        for (final a in notices) {
          final copy = localizedAchievement(l, a['id'] as String? ?? '');
          await NotificationService().sendAchievementNotification(
            l.achievementUnlockedTitle,
            copy['title'] ?? '',
            l,
          );
        }
      });
    }
    if (provider.shouldRequestReview) {
      provider.clearReviewFlag();
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final review = InAppReview.instance;
        if (await review.isAvailable()) {
          await review.requestReview();
        }
      });
    }

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      extendBody: true,
      bottomNavigationBar: _NavBar(
        currentIndex: _currentIndex,
        onSelect: (i) {
          setState(() => _currentIndex = i);
          if (i == 2) _progressKey.currentState?.replayAnimation();
          if (i == 3) _analysisKey.currentState?.replayAnimation();
        },
      ),
    );
  }
}

/// Floating glass bar. Only the selected tab carries its label, inside a
/// tinted pill that grows into place, so the bar stays quiet until you look.
class _NavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onSelect;
  const _NavBar({required this.currentIndex, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final items = <(IconData, String)>[
      (CupertinoIcons.house_fill, l.navHome),
      (CupertinoIcons.bolt_fill, l.navRoutines),
      (CupertinoIcons.graph_square_fill, l.navProgress),
      (CupertinoIcons.chart_bar_fill, l.navAnalysis),
      (CupertinoIcons.person_fill, l.navProfile),
    ];

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
            child: Container(
              height: 62,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF0E0B1C).withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.45),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < items.length; i++)
                    _NavItem(
                      icon: items[i].$1,
                      label: items[i].$2,
                      selected: currentIndex == i,
                      onTap: () {
                        if (currentIndex != i) HapticFeedback.selectionClick();
                        onSelect(i);
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutCubic,
        height: 44,
        padding: EdgeInsets.symmetric(horizontal: selected ? 14 : 12),
        decoration: BoxDecoration(
          gradient: selected
              ? LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.30),
                    AppColors.primary.withValues(alpha: 0.14),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.circular(22),
          border: selected
              ? Border.all(color: AppColors.primary.withValues(alpha: 0.35))
              : null,
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.28),
                    blurRadius: 18,
                  )
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: selected ? 1.0 : 0.94,
              duration: const Duration(milliseconds: 320),
              curve: Curves.easeOutBack,
              child: Icon(
                icon,
                size: 21,
                color: selected
                    ? AppColors.primary
                    : Colors.white.withValues(alpha: 0.45),
              ),
            ),
            // The label rides in with the pill rather than sitting under every
            // icon, which keeps five tabs from crowding the bar.
            ClipRect(
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 320),
                curve: Curves.easeOutCubic,
                alignment: Alignment.centerLeft,
                widthFactor: selected ? 1.0 : 0.0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 220),
                  opacity: selected ? 1 : 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.2,
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
