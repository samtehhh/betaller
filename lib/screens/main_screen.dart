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
import '../widgets/feature_tour.dart';
import 'analysis_screen.dart';
import 'routines_screen.dart';
import 'progress_screen.dart';
import 'profile_screen.dart';
import 'journey_complete_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool _tourActive = false;

  final _progressKey = GlobalKey<ProgressScreenState>();
  final _analysisKey = GlobalKey<AnalysisScreenState>();
  final _routinesKey = GlobalKey<RoutinesScreenState>();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(onOpenTour: _startTour),
      RoutinesScreen(key: _routinesKey),
      ProgressScreen(key: _progressKey),
      AnalysisScreen(key: _analysisKey),
      ProfileScreen(onOpenTour: _startTour),
    ];

    // Once onboarding is behind them and the tour hasn't run yet, give the
    // home screen a beat to land, then spotlight the app's own features one
    // by one. Finishing or skipping it always closes this journey step, so
    // it never fires again after the first time.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AppProvider>();
      if (provider.journeyProgress != 1) return;
      Future.delayed(const Duration(seconds: 3), () {
        if (!mounted) return;
        if (context.read<AppProvider>().journeyProgress != 1) return;
        _startTour();
      });
    });
  }

  void _startTour() {
    if (_tourActive) return;
    setState(() => _tourActive = true);
  }

  void _finishTour() {
    if (!mounted) return;
    setState(() => _tourActive = false);
    context.read<AppProvider>().completeTour();
    // The journey's last step lands here too — finishing or skipping the
    // tour is what tells the user they're actually ready to use the app.
    // The screen itself opens the paywall from its CTA and pops when done.
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, _, _) => const JourneyCompleteScreen(),
        transitionsBuilder: (_, anim, _, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
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
      body: Stack(
        children: [
          IndexedStack(index: _currentIndex, children: _screens),
          if (_tourActive)
            FeatureTourOverlay(
              steps: tourStepsFor(
                l,
                goToTrainTab: () => _routinesKey.currentState?.goToSubTab(0),
                goToProgramTab: () => _routinesKey.currentState?.goToSubTab(1),
                goToNutritionTab: () =>
                    _routinesKey.currentState?.goToSubTab(2),
              ),
              currentTab: _currentIndex,
              onRequestTab: (i) => setState(() => _currentIndex = i),
              onFinished: _finishTour,
              nextLabel: l.continueBtn,
              finishLabel: l.letsStart,
              skipLabel: l.obSkip,
            ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: _NavBar(
        currentIndex: _currentIndex,
        // Switching tabs by hand mid-tour would leave the tour highlighting
        // a target on a screen that's no longer showing, so the bar goes
        // inert rather than fighting the tour for which tab is active.
        onSelect: _tourActive
            ? (_) {}
            : (i) {
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
                  ),
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
