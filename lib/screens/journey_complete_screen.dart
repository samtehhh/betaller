import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../widgets/journey_steps.dart';
import '../widgets/premium_paywall.dart';

/// The hand-off out of the getting-started journey and into daily use.
///
/// Shown the moment the app tour finishes or is skipped: the third and last
/// step ticks off in front of the user, exactly the way the first step did on
/// the onboarding welcome screen, and the one door it opens leads straight to
/// the plan they're meant to start running.
class JourneyCompleteScreen extends StatefulWidget {
  const JourneyCompleteScreen({super.key});

  @override
  State<JourneyCompleteScreen> createState() => _JourneyCompleteScreenState();
}

class _JourneyCompleteScreenState extends State<JourneyCompleteScreen>
    with TickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final AnimationController _halo;
  late final Animation<double> _badge;
  late final Animation<double> _ring;
  late final Animation<double> _headOpacity;
  late final Animation<Offset> _headSlide;
  late final Animation<double> _btnOpacity;
  late final Animation<Offset> _btnSlide;

  int _from = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    );
    _halo = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat();

    _badge = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.0, 0.30, curve: Curves.easeOutBack),
    );
    _ring = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.10, 0.55, curve: Curves.easeOutCubic),
    );
    _headOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.25, 0.5, curve: Curves.easeOut),
      ),
    );
    _headSlide = Tween(begin: const Offset(0, 0.22), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.25, 0.55, curve: Curves.easeOutCubic),
      ),
    );
    _btnOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
      ),
    );
    _btnSlide = Tween(begin: const Offset(0, 0.35), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOutCubic),
      ),
    );
    _ctrl.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final provider = context.read<AppProvider>();
      setState(() => _from = provider.journeyProgress);
      // The tour is behind us — this closes the journey's last step.
      provider.completeJourneyStep(2);
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _halo.dispose();
    super.dispose();
  }

  Future<void> _viewPlans() async {
    HapticFeedback.mediumImpact();
    await showPremiumPaywall(context);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF07050F),
      body: Stack(
        children: [
          // ── Ground: a cool wash leaning toward the step's own colour ──────
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0B2415),
                  Color(0xFF0A0718),
                  Color(0xFF07050F),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _ring,
            builder: (context, _) => Positioned(
              top: -120,
              left: -60,
              right: -60,
              height: 420,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        AppColors.lime.withValues(alpha: 0.16 * _ring.value),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(26, 26, 26, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Badge: the last step landing ──────────────────
                        Center(
                          child: AnimatedBuilder(
                            animation: Listenable.merge([_ctrl, _halo]),
                            builder: (context, _) => SizedBox(
                              width: 128,
                              height: 128,
                              child: CustomPaint(
                                painter: _CompletionRingPainter(
                                  sweep: _ring.value,
                                  halo: _halo.value,
                                  color: AppColors.lime,
                                ),
                                child: Center(
                                  child: Transform.scale(
                                    scale: _badge.value.clamp(0.0, 1.4),
                                    child: Container(
                                      width: 78,
                                      height: 78,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            AppColors.lime,
                                            AppColors.lime.withValues(
                                              alpha: 0.72,
                                            ),
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.lime.withValues(
                                              alpha: 0.45,
                                            ),
                                            blurRadius: 30,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.check_rounded,
                                        size: 40,
                                        color: Color(0xFF06210F),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 22),

                        FadeTransition(
                          opacity: _headOpacity,
                          child: SlideTransition(
                            position: _headSlide,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  l.journeyTourDoneTitle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    height: 1.1,
                                    letterSpacing: -1.0,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  l.journeyTourDoneSubtitle,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.5,
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withValues(alpha: 0.58),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // ── The journey, with the last step ticking off ────
                        Container(
                          padding: const EdgeInsets.fromLTRB(18, 22, 18, 22),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.035),
                            borderRadius: BorderRadius.circular(26),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.07),
                            ),
                          ),
                          child: JourneySteps(completed: 3, animateFrom: _from),
                        ),

                        const SizedBox(height: 18),
                      ],
                    ),
                  ),
                ),

                // ── The one door out: straight into the plan ───────────────
                FadeTransition(
                  opacity: _btnOpacity,
                  child: SlideTransition(
                    position: _btnSlide,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 4, 24, 20),
                      child: _JourneyButton(
                        label: l.journeyViewPlansButton,
                        onTap: _viewPlans,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The primary CTA, styled like the onboarding welcome screen's own button —
/// same gradient, same weight — with a trailing arrow since this one is
/// handing the user off somewhere rather than just moving them forward.
class _JourneyButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _JourneyButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFF9E6CF8), Color(0xFF7B3CF6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.35),
              blurRadius: 22,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.2,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                CupertinoIcons.arrow_right,
                size: 18,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The ring that draws itself around the completion badge, plus a halo that
/// keeps breathing once the ring has closed — the same painter the onboarding
/// welcome screen uses for its own first-step badge, so both "step just
/// landed" moments in the app feel like the same moment.
class _CompletionRingPainter extends CustomPainter {
  final double sweep;
  final double halo;
  final Color color;
  const _CompletionRingPainter({
    required this.sweep,
    required this.halo,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.42;

    // breathing halo
    final pulse = (math.sin(halo * math.pi * 2) + 1) / 2;
    canvas.drawCircle(
      center,
      radius * (1.02 + 0.10 * pulse),
      Paint()
        ..color = color.withValues(alpha: 0.10 * (1 - pulse) * sweep)
        ..style = PaintingStyle.fill,
    );

    // track
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.07)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );

    // the arc closing as the step completes
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2 * sweep,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 3),
    );
  }

  @override
  bool shouldRepaint(covariant _CompletionRingPainter old) =>
      old.sweep != sweep || old.halo != halo || old.color != color;
}
