part of 'onboarding_screen.dart';

// ─── Onboarding, third pass (Nov 2026) ────────────────────────────────────────
//
// The second pass put the flow in the tabs' design language, and left it
// reading as a form: the same icon chip over every question, the same line
// under every title, answers in identical boxes, numbers picked from boxed
// wheels. This pass keeps the colours and the type and changes what each page
// is made of:
//
//  * a page answers back. Pick something and BeTaller says a line about that
//    choice ([_ObReply]), so the flow reads as a conversation;
//  * a number is shown as the thing it measures: a figure that grows with the
//    height wheel, a shoe that lengthens with the size, the age a birth month
//    comes to;
//  * wheels look like the system's own (no box, one soft band on the picked
//    row, the unit set small beside the number).
//
// Everything here sits behind [_kObDesignV3]; false brings the second pass
// back untouched.
const _kObDesignV3 = true;

const _ob3Title = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w800,
  letterSpacing: -0.8,
  height: 1.12,
  color: Colors.white,
);

/// A question and the line under it. No mark above the title: the page's own
/// picture says which question this is.
class _ObHeader3 extends StatelessWidget {
  final String title;
  final String subtitle;
  const _ObHeader3({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: _ob3Title),
      const SizedBox(height: BtSpace.s8),
      Text(subtitle, style: BtType.body.copyWith(fontSize: 15.5)),
    ],
  );
}

/// The mark on the right of an answer: an empty ring, filled with a tick that
/// pops in when the answer is picked. Square for questions with several.
class _Check3 extends StatelessWidget {
  final bool selected;
  final bool square;
  const _Check3({required this.selected, this.square = false});

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.of(context).disableAnimations;
    return AnimatedContainer(
      duration: still ? Duration.zero : BtMotion.quick,
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: selected ? BtColors.brand : Colors.transparent,
        borderRadius: BorderRadius.circular(square ? 8 : 13),
        border: Border.all(
          color: selected
              ? BtColors.brand
              : Colors.white.withValues(alpha: 0.26),
          width: 1.5,
        ),
      ),
      child: AnimatedScale(
        scale: selected ? 1 : 0.4,
        duration: still ? Duration.zero : const Duration(milliseconds: 260),
        curve: Curves.easeOutBack,
        child: AnimatedOpacity(
          opacity: selected ? 1 : 0,
          duration: still ? Duration.zero : BtMotion.quick,
          child: const Icon(Icons.check_rounded, color: Colors.white, size: 17),
        ),
      ),
    );
  }
}

/// One answer: a tall row that gives under the finger, lights in the brand
/// purple when picked and ticks itself.
class _Choice3 extends StatelessWidget {
  final bool selected;
  final String title;
  final String? subtitle;
  final IconData? leading;
  final bool multi;
  final VoidCallback onTap;

  const _Choice3({
    required this.selected,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.leading,
    this.multi = false,
  });

  @override
  Widget build(BuildContext context) {
    final speed = MediaQuery.of(context).disableAnimations
        ? Duration.zero
        : BtMotion.quick;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Semantics(
        selected: selected,
        child: _PressScale(
          onTap: () {
            Haptics.select();
            onTap();
          },
          child: AnimatedContainer(
            duration: speed,
            curve: BtMotion.curve,
            constraints: const BoxConstraints(minHeight: 64),
            padding: EdgeInsets.fromLTRB(leading != null ? 12 : 18, 12, 16, 12),
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.primary.withValues(alpha: 0.16)
                  : BtColors.card,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: selected ? BtColors.brandEdge : BtColors.stroke,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                if (leading != null) ...[
                  AnimatedContainer(
                    duration: speed,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primary.withValues(alpha: 0.30)
                          : BtColors.tint,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      leading,
                      size: 19,
                      color: selected
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.72),
                    ),
                  ),
                  const SizedBox(width: 14),
                ],
                Expanded(
                  child: subtitle == null
                      ? Text(
                          title,
                          style: BtType.option.copyWith(
                            fontSize: 16.5,
                            color: selected ? Colors.white : BtColors.textSoft,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: BtType.headline.copyWith(fontSize: 21),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              subtitle!,
                              style: TextStyle(
                                fontSize: 13.5,
                                color: BtColors.textMute,
                              ),
                            ),
                          ],
                        ),
                ),
                const SizedBox(width: BtSpace.s12),
                _Check3(selected: selected, square: multi),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// What BeTaller says back to an answer: the app's own icon and a message
/// bubble that slides in under the choices. Null or empty shows nothing and
/// takes no room.
class _ObReply extends StatelessWidget {
  final String? text;
  const _ObReply({this.text});

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.of(context).disableAnimations;
    final speed = still ? Duration.zero : const Duration(milliseconds: 260);
    final t = text;
    final Widget bubble = t == null || t.isEmpty
        ? const SizedBox(width: double.infinity, key: ValueKey('ob-reply'))
        : Padding(
            key: ValueKey(t),
            padding: const EdgeInsets.only(top: 6, bottom: 4),
            child: Semantics(
              liveRegion: true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.asset(
                      'assets/icon.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        width: 30,
                        height: 30,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(14, 10, 14, 11),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D1938),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                        border: Border.all(color: BtColors.stroke),
                      ),
                      child: Text(
                        t,
                        style: TextStyle(
                          fontSize: 14.5,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.92),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
    // A list that fills a short screen leaves the reply under the fold: once
    // it is laid out, the page scrolls just far enough to show it.
    if (t != null && t.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        Scrollable.ensureVisible(
          context,
          duration: speed,
          curve: Curves.easeOutCubic,
          alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
        );
      });
    }
    // With reduced motion the bubble is simply there.
    if (still) return bubble;
    return AnimatedSwitcher(
      duration: speed,
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeIn,
      layoutBuilder: (current, previous) => Stack(
        alignment: Alignment.topLeft,
        children: [...previous, ?current],
      ),
      transitionBuilder: (child, a) => FadeTransition(
        opacity: a,
        child: SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.18),
            end: Offset.zero,
          ).animate(a),
          child: child,
        ),
      ),
      child: bubble,
    );
  }
}

/// A wheel as the system draws one: no box, the rows fading out above and
/// below, one soft band behind the picked row. A value with a unit ("170 cm")
/// sets the number large and the unit small beside it.
class _Wheel3 extends StatelessWidget {
  final FixedExtentScrollController controller;
  final List<String> items;
  final ValueChanged<int> onChanged;

  /// Past the last row comes the first again, as on a clock.
  final bool looping;

  const _Wheel3({
    required this.controller,
    required this.items,
    required this.onChanged,
    this.looping = false,
  });

  static final _valueUnit = RegExp(r'^(\d[\d.,]*)\s+(\S.*)$');

  Widget _label(String item, String? family) {
    final m = _valueUnit.firstMatch(item);
    final child = m == null
        ? Text(
            item,
            maxLines: 1,
            style: TextStyle(
              fontFamily: family,
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2,
            ),
          )
        : Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: m.group(1),
                  style: TextStyle(
                    fontFamily: family,
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
                TextSpan(
                  text: ' ${m.group(2)}',
                  style: TextStyle(
                    fontFamily: family,
                    color: Colors.white.withValues(alpha: 0.55),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            maxLines: 1,
          );
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: FittedBox(fit: BoxFit.scaleDown, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // The picker would otherwise set its rows in the Cupertino default face,
    // which on Android is not the app's.
    final family = Theme.of(context).textTheme.bodyMedium?.fontFamily;
    // Seven rows at most: a wheel stretched down a tall page fades most of
    // itself away and leaves the picked row adrift.
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 300),
        child: _wheel(family),
      ),
    );
  }

  Widget _wheel(String? family) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (r) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0x00FFFFFF),
          Colors.white,
          Colors.white,
          Color(0x00FFFFFF),
        ],
        stops: [0.0, 0.30, 0.70, 1.0],
      ).createShader(r),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 46,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ),
          CupertinoPicker(
            itemExtent: 46,
            scrollController: controller,
            diameterRatio: 1.5,
            squeeze: 1.1,
            looping: looping,
            selectionOverlay: const SizedBox.shrink(),
            onSelectedItemChanged: (i) {
              HapticFeedback.selectionClick();
              onChanged(i);
            },
            children: [for (final item in items) _label(item, family)],
          ),
        ],
      ),
    );
  }
}

/// A page whose answer is turned on wheels, with the thing being measured
/// drawn above them when the screen has the room.
class _WheelPage3 extends StatelessWidget {
  final String title, subtitle;
  final Widget child;
  final Widget? hero;
  final Widget? unitToggle;
  final Widget? headerRow;

  const _WheelPage3({
    required this.title,
    required this.subtitle,
    required this.child,
    this.hero,
    this.unitToggle,
    this.headerRow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 0),
      child: LayoutBuilder(
        builder: (context, c) {
          // The picture gives way first on a short screen or a long title:
          // the wheels are the answer and keep their room.
          final roomy = c.maxHeight >= 480;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ObHeader3(title: title, subtitle: subtitle),
              if (hero != null && roomy) ...[const SizedBox(height: 18), hero!],
              if (unitToggle != null) ...[
                const SizedBox(height: 16),
                unitToggle!,
              ],
              SizedBox(height: headerRow != null ? 14 : 8),
              ?headerRow,
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: child,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Height and weight as they are being picked: a figure that stands taller as
/// the wheel turns, and the two numbers beside it.
class _HeightHero3 extends StatelessWidget {
  final int cm;
  final bool female;
  final String heightText;
  final String heightUnit;
  final String weightText;

  const _HeightHero3({
    required this.cm,
    required this.female,
    required this.heightText,
    required this.heightUnit,
    required this.weightText,
  });

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.of(context).disableAnimations;
    final t = ((cm - 100) / 120).clamp(0.0, 1.0);
    final target = 72 + 56 * t;
    return SizedBox(
      height: 132,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 60,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TweenAnimationBuilder<double>(
                tween: Tween(end: target),
                duration: still
                    ? Duration.zero
                    : const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                builder: (_, h, _) => BodyFigure(female: female, height: h),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.bottomLeft,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: heightText,
                          style: const TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -1.6,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                        if (heightUnit.isNotEmpty)
                          TextSpan(
                            text: ' $heightUnit',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: BtColors.textMute,
                            ),
                          ),
                      ],
                    ),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  weightText,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: BtColors.textSoft,
                  ),
                ),
                const SizedBox(height: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Two figures to pick between, and a plain row for neither.
class _GenderPage3 extends StatelessWidget {
  final String title, subtitle;
  final String maleLabel, femaleLabel, otherLabel;
  final String selected;
  final ValueChanged<String> onSelect;

  const _GenderPage3({
    required this.title,
    required this.subtitle,
    required this.maleLabel,
    required this.femaleLabel,
    required this.otherLabel,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        // Shorter cards on a short phone, so "Other" stays on screen.
        final cardHeight = (c.maxHeight - 250).clamp(150.0, 280.0);
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ObHeader3(title: title, subtitle: subtitle),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: _GenderCard3(
                      label: maleLabel,
                      female: false,
                      height: cardHeight,
                      selected: selected == 'male',
                      onTap: () => onSelect('male'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _GenderCard3(
                      label: femaleLabel,
                      female: true,
                      height: cardHeight,
                      selected: selected == 'female',
                      onTap: () => onSelect('female'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _Choice3(
                selected: selected == 'other',
                title: otherLabel,
                onTap: () => onSelect('other'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GenderCard3 extends StatelessWidget {
  final String label;
  final bool female;
  final double height;
  final bool selected;
  final VoidCallback onTap;

  const _GenderCard3({
    required this.label,
    required this.female,
    required this.height,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.of(context).disableAnimations;
    final speed = still ? Duration.zero : const Duration(milliseconds: 240);
    return Semantics(
      selected: selected,
      label: label,
      child: _PressScale(
        onTap: () {
          Haptics.select();
          onTap();
        },
        child: AnimatedContainer(
          duration: speed,
          curve: BtMotion.curve,
          height: height,
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primary.withValues(alpha: 0.16)
                : BtColors.card,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: selected ? BtColors.brandEdge : BtColors.stroke,
              width: 1.5,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 12,
                right: 12,
                child: _Check3(selected: selected),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 18, 8, 14),
                  child: Column(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, c) => Align(
                            alignment: Alignment.bottomCenter,
                            child: AnimatedOpacity(
                              duration: speed,
                              opacity: selected ? 1 : 0.42,
                              child: AnimatedScale(
                                duration: speed,
                                curve: Curves.easeOutBack,
                                alignment: Alignment.bottomCenter,
                                scale: selected ? 1 : 0.92,
                                child: BodyFigure(
                                  female: female,
                                  height: c.maxHeight,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: BtType.headline.copyWith(
                          color: selected ? Colors.white : BtColors.textSoft,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The name, typed large, and under it the reminder it will appear in.
class _NamePage3 extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;
  final VoidCallback onChanged;

  const _NamePage3({
    required this.controller,
    required this.onSubmit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final name = controller.text.trim();
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ObHeader3(title: l.obNameTitle, subtitle: l.obNameSubtitle),
          const SizedBox(height: 22),
          Container(
            height: 62,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: BtColors.card,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: name.isEmpty ? BtColors.stroke : BtColors.brandEdge,
                width: 1.5,
              ),
            ),
            child: TextField(
              controller: controller,
              maxLength: 24,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => onSubmit(),
              onChanged: (_) => onChanged(),
              cursorColor: AppColors.primaryLight,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.2,
              ),
              decoration: InputDecoration(
                hintText: l.obNameHint,
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.30),
                  fontWeight: FontWeight.w500,
                ),
                counterText: '',
                filled: false,
                isCollapsed: true,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 26),
          Text(
            l.obNamePreviewLabel,
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              color: BtColors.textMute,
            ),
          ),
          const SizedBox(height: 10),
          _NotificationPreview(
            title: name.isEmpty ? l.obNameNotifAnon : l.obNameNotif(name),
            body: l.obNameNotifBody,
            when: l.obNotifNow,
          ),
        ],
      ),
    );
  }
}

/// Month and year on two wheels, with the age they come to said above them
/// and a line about what that age means for growing.
class _BirthPage3 extends StatelessWidget {
  final String title, subtitle;
  final String ageLine;
  final String reply;
  final Widget pickers;

  const _BirthPage3({
    required this.title,
    required this.subtitle,
    required this.ageLine,
    required this.reply,
    required this.pickers,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 0),
      child: LayoutBuilder(
        builder: (context, c) {
          final roomy = c.maxHeight >= 480;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ObHeader3(title: title, subtitle: subtitle),
              const SizedBox(height: 18),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  ageLine,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.1,
                    height: 1.05,
                    color: AppColors.primaryLight,
                  ),
                ),
              ),
              if (roomy) ...[const SizedBox(height: 8), _ObReply(text: reply)],
              const SizedBox(height: 6),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: pickers,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// A trainer seen from the side that lengthens as the size goes up, with its
/// length marked under it the way a drawing marks a dimension.
class _ShoeHero3 extends StatelessWidget {
  /// The size on the EU scale, 36 to 56.
  final double eu;

  /// The foot length that size stands for, already in the user's unit.
  final String lengthLabel;

  const _ShoeHero3({required this.eu, required this.lengthLabel});

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.of(context).disableAnimations;
    final t = ((eu - 36) / 20).clamp(0.0, 1.0);
    return SizedBox(
      height: 132,
      child: LayoutBuilder(
        builder: (context, c) {
          final full = math.min(c.maxWidth, 300.0);
          return TweenAnimationBuilder<double>(
            tween: Tween(end: 0.62 + 0.38 * t),
            duration: still ? Duration.zero : const Duration(milliseconds: 240),
            curve: Curves.easeOutCubic,
            builder: (_, f, _) {
              final w = full * f;
              final h = 88 * (0.80 + 0.20 * f);
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPaint(size: Size(w, h), painter: _ShoePainter()),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: w,
                    height: 26,
                    child: CustomPaint(
                      painter: _DimensionPainter(
                        color: Colors.white.withValues(alpha: 0.30),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          lengthLabel,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: BtColors.textMute,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

/// A line with a tick at each end, across the top of its box.
class _DimensionPainter extends CustomPainter {
  final Color color;
  _DimensionPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(const Offset(1, 4), Offset(size.width - 1, 4), p);
    canvas.drawLine(const Offset(1, 0), const Offset(1, 8), p);
    canvas.drawLine(Offset(size.width - 1, 0), Offset(size.width - 1, 8), p);
  }

  @override
  bool shouldRepaint(covariant _DimensionPainter old) => old.color != color;
}

/// The trainer: an upper filled the way the body silhouettes are (white into
/// the light purple), a pale sole under it, and lace and panel lines cut out
/// in the page colour. Toe to the right. Drawn on a unit box, so it stretches
/// with the size given to it.
class _ShoePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    Offset p(double x, double y) => Offset(x * w, y * h);

    final upper = Path()
      ..moveTo(p(0.035, 0.80).dx, p(0.035, 0.80).dy)
      // heel counter, up to the pull tab
      ..cubicTo(
        p(0.00, 0.62).dx,
        p(0.00, 0.62).dy,
        p(0.005, 0.34).dx,
        p(0.005, 0.34).dy,
        p(0.055, 0.16).dx,
        p(0.055, 0.16).dy,
      )
      ..cubicTo(
        p(0.075, 0.07).dx,
        p(0.075, 0.07).dy,
        p(0.135, 0.07).dx,
        p(0.135, 0.07).dy,
        p(0.165, 0.17).dx,
        p(0.165, 0.17).dy,
      )
      // the collar, dipping where the ankle goes in
      ..cubicTo(
        p(0.205, 0.33).dx,
        p(0.205, 0.33).dy,
        p(0.300, 0.36).dx,
        p(0.300, 0.36).dy,
        p(0.365, 0.20).dx,
        p(0.365, 0.20).dy,
      )
      // tongue
      ..cubicTo(
        p(0.385, 0.10).dx,
        p(0.385, 0.10).dy,
        p(0.440, 0.07).dx,
        p(0.440, 0.07).dy,
        p(0.475, 0.15).dx,
        p(0.475, 0.15).dy,
      )
      // down the laces to the toe box
      ..cubicTo(
        p(0.560, 0.33).dx,
        p(0.560, 0.33).dy,
        p(0.660, 0.47).dx,
        p(0.660, 0.47).dy,
        p(0.790, 0.53).dx,
        p(0.790, 0.53).dy,
      )
      ..cubicTo(
        p(0.900, 0.57).dx,
        p(0.900, 0.57).dy,
        p(0.985, 0.64).dx,
        p(0.985, 0.64).dy,
        p(0.992, 0.80).dx,
        p(0.992, 0.80).dy,
      )
      ..close();

    final sole = Path()
      ..moveTo(p(0.022, 0.78).dx, p(0.022, 0.78).dy)
      ..lineTo(p(0.995, 0.78).dx, p(0.995, 0.78).dy)
      ..cubicTo(
        p(1.005, 0.88).dx,
        p(1.005, 0.88).dy,
        p(0.985, 0.95).dx,
        p(0.985, 0.95).dy,
        p(0.930, 0.955).dx,
        p(0.930, 0.955).dy,
      )
      ..lineTo(p(0.085, 0.985).dx, p(0.085, 0.985).dy)
      ..cubicTo(
        p(0.030, 0.985).dx,
        p(0.030, 0.985).dy,
        p(0.010, 0.90).dx,
        p(0.010, 0.90).dy,
        p(0.022, 0.78).dx,
        p(0.022, 0.78).dy,
      )
      ..close();

    canvas.drawPath(
      upper,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, AppColors.primaryLight],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(sole, Paint()..color = const Color(0xFFE9E3FF));

    final cut = Paint()
      ..color = BtColors.page
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = math.max(1.6, h * 0.030);

    // Where the sole meets the upper.
    canvas.drawLine(p(0.03, 0.78), p(0.99, 0.78), cut);
    // Laces, across the slope from the tongue to the toe box.
    for (var i = 0; i < 4; i++) {
      final x = 0.50 + i * 0.062;
      final y = 0.215 + i * 0.082;
      canvas.drawLine(p(x - 0.012, y + 0.11), p(x + 0.050, y - 0.02), cut);
    }
    // Toe cap and heel panel.
    canvas.drawPath(
      Path()
        ..moveTo(p(0.800, 0.535).dx, p(0.800, 0.535).dy)
        ..quadraticBezierTo(
          p(0.775, 0.66).dx,
          p(0.775, 0.66).dy,
          p(0.800, 0.78).dx,
          p(0.800, 0.78).dy,
        ),
      cut,
    );
    canvas.drawPath(
      Path()
        ..moveTo(p(0.165, 0.19).dx, p(0.165, 0.19).dy)
        ..quadraticBezierTo(
          p(0.215, 0.50).dx,
          p(0.215, 0.50).dy,
          p(0.185, 0.78).dx,
          p(0.185, 0.78).dy,
        ),
      cut,
    );
  }

  @override
  bool shouldRepaint(covariant _ShoePainter old) => false;
}

/// The seam between the hour wheel and the minute wheel: a short dashed line
/// that fades at both ends, so the two read as one dial with two rings.
class _DashSeam extends StatelessWidget {
  const _DashSeam();

  @override
  Widget build(BuildContext context) => const SizedBox(
    width: 20,
    height: 190,
    child: CustomPaint(painter: _DashSeamPainter()),
  );
}

class _DashSeamPainter extends CustomPainter {
  const _DashSeamPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final x = size.width / 2;
    final mid = size.height / 2;
    for (var y = 3.0; y < size.height - 3; y += 9) {
      final far = ((y + 2 - mid).abs() / mid).clamp(0.0, 1.0);
      canvas.drawLine(
        Offset(x, y),
        Offset(x, y + 4),
        Paint()
          ..strokeWidth = 1.6
          ..strokeCap = StrokeCap.round
          ..color = Colors.white.withValues(alpha: 0.34 * (1 - far * far)),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _DashSeamPainter old) => false;
}

/// "Your answers are in": the tick lands, then one mark for each kind of
/// thing that was asked lights in turn, before the analysis takes over.
class _ReceivedView3 extends StatelessWidget {
  final String title;
  final String subtitle;
  const _ReceivedView3({
    super.key,
    required this.title,
    required this.subtitle,
  });

  static const _marks = [
    CupertinoIcons.person_fill,
    CupertinoIcons.arrow_up_circle_fill,
    CupertinoIcons.moon_fill,
    CupertinoIcons.flame_fill,
    CupertinoIcons.bolt_fill,
  ];

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.of(context).disableAnimations;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: still ? 1 : 0, end: 1),
      duration: const Duration(milliseconds: 1500),
      builder: (context, t, _) {
        // The tick over the first third, the marks over the rest.
        final tick = Curves.easeOutBack.transform((t / 0.3).clamp(0.0, 1.0));
        double lit(int i) => ((t - 0.3 - i * 0.12) / 0.14).clamp(0.0, 1.0);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 0.6 + 0.4 * tick,
              child: Opacity(
                opacity: (t / 0.15).clamp(0.0, 1.0),
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lime,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 50,
                    color: Color(0xFF06210F),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(title, textAlign: TextAlign.center, style: _ob3Title),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: BtType.body.copyWith(fontSize: 15.5),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < _marks.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Color.lerp(
                          BtColors.tint,
                          AppColors.primary.withValues(alpha: 0.30),
                          lit(i),
                        ),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Icon(
                        _marks[i],
                        size: 20,
                        color: Color.lerp(
                          Colors.white.withValues(alpha: 0.30),
                          Colors.white,
                          lit(i),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
