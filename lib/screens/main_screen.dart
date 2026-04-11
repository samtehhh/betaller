import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:in_app_review/in_app_review.dart';

import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../l10n/app_localizations.dart';
import 'home_screen.dart';
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
      AnalysisScreen(key: _analysisKey),
      const RoutinesScreen(),
      ProgressScreen(key: _progressKey),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Check if provider wants to show review prompt
    final provider = context.watch<AppProvider>();
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
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1A0F1E).withValues(alpha: 0.95),
              border: Border(
                top: BorderSide(
                  color: const Color(0xFFCE93D8).withValues(alpha: 0.08),
                  width: 0.5,
                ),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _NavItem(
                      icon: CupertinoIcons.house_fill,
                      label: AppLocalizations.of(context)!.navHome,
                      selected: _currentIndex == 0,
                      onTap: () => setState(() => _currentIndex = 0),
                    ),
                    _NavItem(
                      icon: CupertinoIcons.chart_bar_fill,
                      label: AppLocalizations.of(context)!.navAnalysis,
                      selected: _currentIndex == 1,
                      onTap: () {
                        setState(() => _currentIndex = 1);
                        _analysisKey.currentState?.replayAnimation();
                      },
                    ),
                    _NavItem(
                      icon: CupertinoIcons.bolt_fill,
                      label: AppLocalizations.of(context)!.navRoutines,
                      selected: _currentIndex == 2,
                      onTap: () => setState(() => _currentIndex = 2),
                    ),
                    _NavItem(
                      icon: CupertinoIcons.graph_square_fill,
                      label: AppLocalizations.of(context)!.navProgress,
                      selected: _currentIndex == 3,
                      onTap: () {
                        setState(() => _currentIndex = 3);
                        _progressKey.currentState?.replayAnimation();
                      },
                    ),
                    _NavItem(
                      icon: CupertinoIcons.person_fill,
                      label: AppLocalizations.of(context)!.navProfile,
                      selected: _currentIndex == 4,
                      onTap: () => setState(() => _currentIndex = 4),
                    ),
                  ],
                ),
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
      child: SizedBox(
        width: 68,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: selected ? const EdgeInsets.all(8) : EdgeInsets.zero,
              decoration: selected
                  ? BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 12,
                        ),
                      ],
                    )
                  : null,
              child: Transform.scale(
                scale: selected ? 1.1 : 1.0,
                child: Icon(
                  icon,
                  color: selected
                      ? AppColors.primary
                      : Colors.white.withValues(alpha: 0.82),
                  size: 24,
                  shadows: selected ? [Shadow(color: AppColors.primary.withValues(alpha: 0.35), blurRadius: 10)] : null,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: selected
                    ? AppColors.primary
                    : Colors.white.withValues(alpha: 0.82),
                shadows: selected ? [Shadow(color: AppColors.primary.withValues(alpha: 0.2), blurRadius: 8)] : null,
                fontSize: 11,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
