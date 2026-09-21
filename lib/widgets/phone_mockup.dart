import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'paywall_previews.dart' show kPreviewDesignSize;

// ═════════════════════════════════════════════════════════════════════════════
//  Hero visual — the app's own screens, drawn inside a device
//
//  Shared by the paywall and the app walkthrough: both sell a feature by
//  showing the actual screen, not a paraphrase of it, so the frame it's shown
//  in lives here once instead of twice.
// ═════════════════════════════════════════════════════════════════════════════

/// The design box a preview screen is authored in. Its aspect matches the
/// mockup's display area below the status bar, so a screen scales in without
/// letterboxing or a squeeze.
const Size kScreenDesign = kPreviewDesignSize;

class PhoneMockup extends StatelessWidget {
  final Widget screen;
  final Color accent;

  /// How far down the slot the device starts, clearing whatever chrome sits
  /// above it. The slot itself still reaches the top of the screen so the
  /// glow has somewhere to spill.
  final double topInset;
  const PhoneMockup({
    super.key,
    required this.screen,
    required this.accent,
    required this.topInset,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        // iPhone form factor: 71.6 x 147.6 mm => 0.485 aspect. The device wants
        // to fit its slot outright — a tour changes screens every few
        // seconds, so the whole screen should be there the moment it lands.
        const aspect = 0.485;
        // The device keeps a margin of its own now that the slot runs edge to
        // edge; only the glow is allowed past it.
        final slotW = math.max(c.maxWidth - 40, 1.0);
        final slotH = math.max(c.maxHeight - topInset, 1.0);
        double h = slotH;
        double w = h * aspect;
        if (w > slotW * 0.86) {
          w = slotW * 0.86;
          h = w / aspect;
        }

        // On a short phone, though, fitting by height leaves a device barely
        // wider than a finger, and the screen inside it unreadable — which
        // defeats the point of showing it at all. Past that floor the device is
        // sized by width instead and bleeds off the bottom of the slot, the way
        // App Store shots do: a large, legible top half beats a complete but
        // illegible whole.
        final byHeight = w >= slotW * 0.58;
        if (!byHeight) {
          w = slotW * 0.74;
          h = w / aspect;
        }

        final radius = w * 0.155;
        final bezel = w * 0.030;
        final screenRadius = radius - bezel;
        final btnW = w * 0.013;

        final device = SizedBox(
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
                      BoxShadow(
                        color: accent.withValues(alpha: 0.42),
                        blurRadius: w * 0.62,
                        spreadRadius: w * 0.03,
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.60),
                        blurRadius: w * 0.22,
                        offset: Offset(0, w * 0.10),
                      ),
                    ],
                  ),
                ),
              ),

              // Side buttons (behind the frame)
              Positioned(
                left: -btnW * 0.7,
                top: h * 0.150,
                child: _SideButton(width: btnW, height: h * 0.030),
              ),
              Positioned(
                left: -btnW * 0.7,
                top: h * 0.215,
                child: _SideButton(width: btnW, height: h * 0.055),
              ),
              Positioned(
                left: -btnW * 0.7,
                top: h * 0.285,
                child: _SideButton(width: btnW, height: h * 0.055),
              ),
              Positioned(
                right: -btnW * 0.7,
                top: h * 0.245,
                child: _SideButton(width: btnW, height: h * 0.080),
              ),

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
                    colors: [
                      Color(0xFFA6A6B2),
                      Color(0xFF3A3A44),
                      Color(0xFF74747F),
                      Color(0xFF23232B),
                      Color(0xFF9295A0),
                    ],
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
                            SizedBox(height: w * 0.045),
                            Expanded(
                              child: ClipRect(
                                // The screen is authored at a fixed size and
                                // scaled down like a screenshot, so a phone
                                // three inches tall shows the same layout as
                                // the real one and no text reflows.
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    width: kScreenDesign.width,
                                    height: kScreenDesign.height,
                                    // The preview must not inherit the user's
                                    // text scale: at 200% a fake screen turns
                                    // into a wall of clipped labels.
                                    child: MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                        textScaler: TextScaler.noScaling,
                                      ),
                                      child: screen,
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

              // Earpiece slot, milled into the top edge of the frame
              Positioned(
                top: bezel * 0.28,
                child: Container(
                  width: w * 0.22,
                  height: math.max(bezel * 0.34, 1.2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF15151A),
                    borderRadius: BorderRadius.circular(bezel),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.14),
                        blurRadius: 0,
                        offset: const Offset(0, 0.6),
                      ),
                    ],
                  ),
                ),
              ),

              // Dynamic Island
              Positioned(
                top: bezel + w * 0.032,
                child: Container(
                  width: w * 0.305,
                  height: w * 0.088,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(w * 0.05),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: w * 0.024),
                      child: Container(
                        width: w * 0.030,
                        height: w * 0.030,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            center: Alignment(-0.3, -0.4),
                            radius: 0.9,
                            colors: [Color(0xFF2A3350), Color(0xFF0B0B12)],
                          ),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                            width: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

        // Fits: no clip at all, so the glow bleeds into the copy below the
        // way a light source should.
        if (byHeight) {
          return Padding(
            padding: EdgeInsets.only(top: topInset),
            child: Center(child: device),
          );
        }

        // Sized by width: hang the device from the top and let the frame run
        // off the bottom, fading out rather than ending on a cut. The clip is
        // the whole slot — full width, and up to the very top of the screen —
        // so the only hard edges it can make are ones the screen already has.
        return ClipRect(
          child: Padding(
            padding: EdgeInsets.only(top: topInset),
            child: ShaderMask(
              blendMode: BlendMode.dstIn,
              shaderCallback: (rect) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white, Colors.transparent],
                stops: [0.0, 0.86, 1.0],
              ).createShader(rect),
              child: OverflowBox(
                alignment: Alignment.topCenter,
                minHeight: 0,
                maxHeight: h,
                child: device,
              ),
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
    // iOS keeps these icons small: about 11pt tall on a 393pt screen, with the
    // cluster ending roughly 14pt from the edge, well clear of the island.
    final iconH = w * 0.032;
    return Padding(
      padding: EdgeInsets.fromLTRB(w * 0.10, w * 0.058, w * 0.062, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '9:41',
            style: TextStyle(
              fontSize: w * 0.042,
              fontWeight: FontWeight.w600,
              letterSpacing: -w * 0.001,
              color: Colors.white,
            ),
          ),
          CustomPaint(
            size: Size(iconH * 5.35, iconH),
            painter: _StatusIconsPainter(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

/// Signal, Wi-Fi and battery, drawn to iOS proportions: bars share a baseline,
/// the Wi-Fi arcs share a centre, and the battery keeps its terminal nub.
class _StatusIconsPainter extends CustomPainter {
  final Color color;
  const _StatusIconsPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final fill = Paint()
      ..color = color
      ..isAntiAlias = true;
    double x = 0;

    // ── Signal: four bars on one baseline ────────────────────────────────
    final barW = h * 0.28;
    final gap = h * 0.17;
    for (var i = 0; i < 4; i++) {
      final barH = h * (0.38 + i * 0.207);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, h - barH, barW, barH),
          Radius.circular(barW * 0.35),
        ),
        fill,
      );
      x += barW + gap;
    }

    // ── Wi-Fi: three arcs plus the dot, all about one centre ─────────────
    x += h * 0.34;
    final wifiW = h * 1.36;
    final cx = x + wifiW / 2;
    final cy = h * 0.97;
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = h * 0.155
      ..isAntiAlias = true;
    for (final r in [wifiW * 0.50, wifiW * 0.31]) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: r),
        math.pi * 1.25,
        math.pi * 0.5,
        false,
        stroke,
      );
    }
    canvas.drawCircle(Offset(cx, cy - h * 0.07), h * 0.115, fill);
    x += wifiW;

    // ── Battery: outline, terminal nub, charge level ─────────────────────
    x += h * 0.40;
    final bodyW = h * 1.95;
    final bodyH = h * 0.92;
    final top = (h - bodyH) / 2;
    final line = h * 0.09;
    final body = RRect.fromRectAndRadius(
      Rect.fromLTWH(x + line / 2, top + line / 2, bodyW - line, bodyH - line),
      Radius.circular(bodyH * 0.32),
    );
    canvas.drawRRect(
      body,
      Paint()
        ..color = color.withValues(alpha: 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = line
        ..isAntiAlias = true,
    );
    // terminal nub
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          x + bodyW + h * 0.03,
          h / 2 - bodyH * 0.19,
          h * 0.13,
          bodyH * 0.38,
        ),
        Radius.circular(h * 0.06),
      ),
      Paint()
        ..color = color.withValues(alpha: 0.55)
        ..isAntiAlias = true,
    );
    // charge level
    final inset = line * 2.4;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          x + inset,
          top + inset,
          (bodyW - inset * 2) * 0.82,
          bodyH - inset * 2,
        ),
        Radius.circular(bodyH * 0.16),
      ),
      fill,
    );
  }

  @override
  bool shouldRepaint(covariant _StatusIconsPainter old) => old.color != color;
}
