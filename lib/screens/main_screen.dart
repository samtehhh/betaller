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
import '../utils/haptics.dart';
import '../widgets/trophy_celebration.dart';
import '../l10n/app_localizations.dart';
import 'home_screen.dart';
import '../widgets/feature_tour.dart';
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

/// Why the tour is running: right after onboarding, once for people who
/// updated to v3, or opened again by hand.
enum _TourMode { firstRun, whatsNew, replay }

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  _TourMode? _tourMode;
  bool get _tourActive => _tourMode != null;

  /// From the end of an automatic tour until its paywall is closed. Badges
  /// and the rating prompt wait for it.
  bool _handoff = false;

  final _progressKey = GlobalKey<ProgressScreenState>();
  final _analysisKey = GlobalKey<AnalysisScreenState>();
  final _routinesKey = GlobalKey<RoutinesScreenState>();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(onOpenTour: () => _startTour(_TourMode.replay)),
      RoutinesScreen(key: _routinesKey),
      ProgressScreen(key: _progressKey),
      AnalysisScreen(key: _analysisKey),
      ProfileScreen(onOpenTour: () => _startTour(_TourMode.replay)),
    ];

    NotificationService.tappedPayload.addListener(_openFromNotification);
    WidgetsBinding.instance.addPostFrameCallback((_) => _openFromNotification());

    // Right after onboarding (journey step two open), or once for someone
    // who updated from 1.6.x and skipped onboarding: let home land, then
    // run the tour. The paywall follows the tour instead of the launch.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AppProvider>();
      final mode = provider.journeyProgress == 1
          ? _TourMode.firstRun
          : provider.shouldShowWhatsNewTour
          ? _TourMode.whatsNew
          : null;
      if (mode == null) {
        _maybeOpenDailyPaywall();
        return;
      }
      Future.delayed(const Duration(milliseconds: 800), () {
        if (!mounted) return;
        _startTour(mode);
      });
    });
  }

  /// A tapped reminder lands on the tab it is about ("tab:1" is the plan).
  void _openFromNotification() {
    final payload = NotificationService.tappedPayload.value;
    if (payload == null || !mounted) return;
    NotificationService.tappedPayload.value = null;
    final tab = int.tryParse(payload.replaceFirst('tab:', ''));
    if (tab != null && tab >= 0 && tab < _screens.length && !_tourActive) {
      setState(() => _currentIndex = tab);
    }
  }

  @override
  void dispose() {
    NotificationService.tappedPayload.removeListener(_openFromNotification);
    super.dispose();
  }

  /// The first launch of the day, for someone who is not premium, opens the
  /// offer once after the home screen has landed. Launches that start a tour
  /// show it after the tour instead.
  void _maybeOpenDailyPaywall() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted || _tourActive) return;
      if (!context.read<AppProvider>().takeDailyPaywallSlot()) return;
      showPremiumPaywall(context, closeDelay: const Duration(seconds: 2));
    });
  }

  void _startTour(_TourMode mode) {
    if (_tourActive || _handoff) return;
    setState(() => _tourMode = mode);
  }

  /// Finished or skipped, the same way: back to home, then (for a tour the
  /// app started by itself) the paywall, with today's automatic slot so it
  /// never stacks on another one. Premium users get no paywall. The old
  /// "journey complete" screen used to sit in between; its only way out was
  /// the paywall button, so it was a second sales screen in a row and is gone.
  Future<void> _finishTour() async {
    if (!mounted) return;
    final mode = _tourMode;
    final provider = context.read<AppProvider>();
    setState(() {
      _tourMode = null;
      _handoff = mode != _TourMode.replay;
      _currentIndex = 0;
    });
    _routinesKey.currentState?.goToSubTab(0);
    provider.markV3TourSeen();
    // Closes the journey's tour step and hands out its badge, which shows
    // once the hand-off below is over.
    provider.completeTour();
    if (mode != _TourMode.replay && provider.takeDailyPaywallSlot()) {
      // Let home land under the paywall's slide.
      await Future.delayed(const Duration(milliseconds: 350));
      if (mounted) {
        await showPremiumPaywall(
          context,
          closeDelay: const Duration(seconds: 3),
        );
      }
    }
    if (!mounted) return;
    setState(() => _handoff = false);
  }

  /// Asks for a rating a moment after the positive event, so its own
  /// celebration is seen first, and never over the tour or its paywall.
  Future<void> _requestReviewSoon() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    for (var i = 0; i < 120 && mounted && (_tourActive || _handoff); i++) {
      await Future.delayed(const Duration(seconds: 1));
    }
    if (!mounted || _tourActive || _handoff) return;
    final provider = context.read<AppProvider>();
    // The paywall may have opened in the meantime.
    if (!provider.canRequestReview()) return;
    final review = InAppReview.instance;
    if (!await review.isAvailable()) return;
    provider.markReviewRequested();
    await review.requestReview();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    // Check if provider wants to show review prompt
    final provider = context.watch<AppProvider>();

    // Announce any badge earned since the last frame. During the tour and
    // its paywall they wait, rather than being dropped.
    final notices = provider.pendingAchievementNotices;
    if (notices.isNotEmpty && !_tourActive && !_handoff) {
      provider.clearAchievementNotices();
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        for (final a in notices) {
          final copy = localizedAchievement(l, a['id'] as String? ?? '');
          if (!context.mounted) return;
          if (!_tourActive) {
            await showTrophyCelebration(
              context,
              icon: a['icon'] as String? ?? '🏆',
              title: copy['title'] ?? '',
              subtitle: copy['desc'] ?? copy['description'] ?? '',
              buttonLabel: l.trophyContinue,
            );
          }
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
      _requestReviewSoon();
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
                goToSubTab: (i) => _routinesKey.currentState?.goToSubTab(i),
                premium: provider.isPremium,
                whatsNew:
                    _tourMode == _TourMode.whatsNew ||
                    (_tourMode == _TourMode.firstRun &&
                        provider.updatedThisLaunch),
              ),
              currentTab: _currentIndex,
              onRequestTab: (i) => setState(() => _currentIndex = i),
              onFinished: _finishTour,
              nextLabel: l.tv3Next,
              finishLabel: l.tv3Done,
              skipLabel: l.obSkip,
              introLabel: l.tv3ShowMe,
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
                if (i != _currentIndex) Haptics.select();
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
