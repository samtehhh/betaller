import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'text_case.dart';

// ── Premium Dark Theme Design Tokens ──────────────────────────────

class AppColors {
  AppColors._();

  // Core backgrounds — deep navy-indigo dark
  static const scaffold = Color(0xFF0F0D1C);
  static const surfaceDark = Color(0xFF161428);

  // Card fills — premium dark surfaces
  static const cardFill = Color(0xFF0C0A16);
  static const cardFillLight = Color(0xFF110E1E);
  static final cardBorder = const Color(0xFFFFFFFF).withValues(alpha: 0.05);
  static final cardBorderLight = const Color(
    0xFF8B5CF6,
  ).withValues(alpha: 0.12);

  // Primary accent — #8B5CF6 Purple
  static const primary = Color(0xFF8B5CF6);
  static const primaryLight = Color(0xFFBB9FFD);
  static const primaryDark = Color(0xFF4C1D95);
  static const primaryBright = Color(0xFFA78BFA);

  // Secondary accents
  static const cyan = Color(0xFF00E5FF);
  static const orange = Color(0xFFFF8A00); // Energy Orange
  static const pink = Color(0xFFFF4DB8);
  static const lime = Color(0xFF22FF88); // Neon Growth Green — KEY COLOR

  // Semantic
  static const success = Color(0xFF22FF88); // Neon green for success/growth
  static const error = Color(0xFFFF5252);
  static const warning = Color(0xFFF5C542); // Premium Gold

  // Text hierarchy
  static const textPrimary = Color(0xFFFFFFFF);
  static final textSecondary = Colors.white.withValues(alpha: 0.85);
  static final textTertiary = Colors.white.withValues(alpha: 0.50);

  // Category palette
  static const exerciseColor = Color(0xFF8B5CF6);
  static const nutritionColor = Color(0xFFFF8A00);
  static const sleepColor = Color(0xFF6366F1);
  static const postureColor = Color(0xFFFF4DB8);

  // Water & Sleep
  static const water = Color(0xFF00E5FF);
  static const sleep = Color(0xFF6366F1);

  // Gradients
  static const gradientPrimary = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFF4C1D95)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientHeader = LinearGradient(
    colors: [Color(0xFF161428), Color(0xFF0F0D1C)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientAccent = LinearGradient(
    colors: [Color(0xFFFF8A00), Color(0xFFF5C542)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientCyan = LinearGradient(
    colors: [Color(0xFF00E5FF), Color(0xFF8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // NEW gradients for v4
  static const gradientGrowth = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFF00E5FF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const gradientEnergy = LinearGradient(
    colors: [Color(0xFFFF8A00), Color(0xFFF5C542)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

// ── Glass Card Widget ─────────────────────────────────────────────

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? glowColor; // NEW

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 26,
    this.fillColor,
    this.borderColor,
    this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    final glow = glowColor ?? AppColors.primary.withValues(alpha: 0.10);
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        gradient: fillColor == null
            ? const LinearGradient(
                colors: [Color(0xFF0C0A16), Color(0xFF080614)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(2.53),
              )
            : null,
        color: fillColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? const Color(0xFFFFFFFF).withValues(alpha: 0.05),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.50),
            blurRadius: 32,
            offset: const Offset(0, 10),
            spreadRadius: -6,
          ),
          BoxShadow(color: glow, blurRadius: 28),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(22),
            child: child,
          ),
        ),
      ),
    );
  }
}

// ── Glow Progress Bar Widget ──────────────────────────────────────

/// Animated gradient progress bar with edge glow — v4 design system
class GlowProgressBar extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final Gradient gradient;
  final Color glowColor;
  final double height;
  final double borderRadius;

  const GlowProgressBar({
    super.key,
    required this.value,
    this.gradient = AppColors.gradientGrowth,
    this.glowColor = AppColors.primary,
    this.height = 8,
    this.borderRadius = 999,
  });

  @override
  Widget build(BuildContext context) {
    final clampedValue = value.clamp(0.0, 1.0);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            // Background track
            Container(
              height: height,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            // Filled portion
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOutCubic,
              width: constraints.maxWidth * clampedValue,
              height: height,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: glowColor.withValues(alpha: 0.50),
                    blurRadius: 8,
                    offset: Offset.zero,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// ── Cyber Metric Card Widget ──────────────────────────────────────

/// Premium metric display card — v4 design
class CyberMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String? unit;
  final Color valueColor;
  final Color? glowColor;
  final Widget? leading;

  const CyberMetricCard({
    super.key,
    required this.label,
    required this.value,
    this.unit,
    this.valueColor = AppColors.primary,
    this.glowColor,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      glowColor: glowColor ?? valueColor.withValues(alpha: 0.12),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leading != null) ...[leading!, const SizedBox(height: 8)],
          Text(
            label.upperIn(context),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.textTertiary,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: valueColor,
                  letterSpacing: 0.5,
                  shadows: [
                    Shadow(
                      color: (glowColor ?? valueColor).withValues(alpha: 0.5),
                      blurRadius: 12,
                    ),
                  ],
                ),
              ),
              if (unit != null) ...[
                const SizedBox(width: 4),
                Text(
                  unit!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: valueColor.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// ── Section Header ────────────────────────────────────────────────

class SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? iconColor;

  const SectionHeader({
    super.key,
    required this.icon,
    required this.title,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor ?? AppColors.primary, size: 20),
        const SizedBox(width: 8),
        // Long headers ("BEANSPRUCHTE MUSKELN & KNOCHEN") wrap instead of
        // running off the card on a narrow phone.
        Flexible(
          child: Text(
            title.upperIn(context),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Default Routines ──────────────────────────────────────────────

const List<Map<String, dynamic>> defaultRoutines = [
  // ── v4 moves ── titles/descriptions per language: kNewMoveText.
  {
    'id': 'masai_jumps',
    'title': 'Masai Jumps',
    'description': 'Stay tall and make small springy jumps on the spot.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🦘',
  },
  {
    'id': 'calf_pulses',
    'title': 'Calf Pulses',
    'description': 'Small quick bounces on your toes for strong calves.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🦶',
  },
  {
    'id': 'toe_touch',
    'title': 'Toe Touch',
    'description': 'Fold forward from the hips to free up your hamstrings.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🙇',
  },
  {
    'id': 'downward_dog',
    'title': 'Downward Dog',
    'description': 'Hips high and spine long to stretch your whole back line.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🐕',
  },
  {
    'id': 'wall_angels',
    'title': 'Wall Angels',
    'description': 'Slide your arms up a wall to open the chest and fix rounded shoulders.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '👼',
  },
  {
    'id': 'superman',
    'title': 'Superman',
    'description': 'Lift arms and legs from the floor to strengthen your back.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🦸',
  },
  {
    'id': 'knee_circles',
    'title': 'Knee Circles',
    'description': 'Small circles to warm up your knees.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🔄',
  },
  {
    'id': 'upward_salute',
    'title': 'Upward Salute',
    'description': 'Reach tall overhead and open up your posture.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🙌',
  },
  {
    'id': 'wall_dog',
    'title': 'Wall Dog',
    'description': 'Hands on the wall, hinge back and stretch your back.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧱',
  },
  {
    'id': 'chin_tucks',
    'title': 'Chin Tucks',
    'description': 'Slide your chin straight back to undo forward head posture.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧍',
  },
  // ── v3 moves ── titles/descriptions per language: kNewMoveText.
  {
    'id': 'plank',
    'title': 'Plank',
    'description': 'Hold a straight-body plank to build a strong core that supports upright posture.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧱',
    'musclesTargeted': ['core', 'spine'],
    'scientificBasis': '',
    'formDescription': 'Place your forearms on the floor, elbows under your shoulders. Step your feet back so your body forms one straight line. Squeeze your glutes, pull your belly button in and hold 30 seconds. Rest 30 seconds and repeat for 3 sets.',
    'setsReps': '3 x 30 s',
    'timerSeconds': 30,
    'difficulty': 'beginner',
  },
  {
    'id': 'glute_bridge',
    'title': 'Glute Bridge',
    'description': 'Lift your hips to strengthen your glutes and open up hips that feel tight from sitting.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🌉',
    'musclesTargeted': ['legs', 'core'],
    'scientificBasis': '',
    'formDescription': 'Lie on your back, knees bent, feet flat and hip-width apart. Press through your heels and lift your hips toward the ceiling. Squeeze your glutes at the top for 2 seconds. Lower slowly, 12 reps per set, 3 sets in total.',
    'setsReps': '3 x 12',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
  {
    'id': 'calf_raise',
    'title': 'Calf Raise',
    'description': 'Rise onto your toes to build strong calves and ankles for jumping and running.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🦶',
    'musclesTargeted': ['legs'],
    'scientificBasis': '',
    'formDescription': 'Stand tall next to a wall, fingertips touching it for balance. Rise slowly onto the balls of your feet as high as you can. Hold 1 second at the top, then lower your heels slowly. Do 15 reps per set, 3 sets in total.',
    'setsReps': '3 x 15',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
  {
    'id': 'dead_hang_active',
    'title': 'Active Hang',
    'description': 'Hang from a bar with engaged shoulders to build grip and shoulder control.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧗',
    'musclesTargeted': ['spine', 'shoulders'],
    'scientificBasis': '',
    'formDescription': 'Grip the bar overhand, hands slightly wider than your shoulders. Hang with straight arms, then pull your shoulder blades down and back. Keep your legs together and core tight, and hold for 20 seconds. Step down gently and rest 40 seconds between sets.',
    'setsReps': '3 x 20 s',
    'timerSeconds': 20,
    'difficulty': 'intermediate',
  },
  {
    'id': 'cat_cow',
    'title': 'Cat-Cow',
    'description': 'Flow between arching and rounding your back to move your whole spine.',
    'category': 'posture',
    'duration': '3 dk',
    'icon': '🐈',
    'musclesTargeted': ['spine'],
    'scientificBasis': '',
    'formDescription': 'Start on hands and knees, wrists under shoulders, knees under hips. Breathe in, drop your belly and lift your chest and gaze (cow). Breathe out, round your back and tuck your chin (cat). Move slowly with your breath for 10 rounds, 2 sets.',
    'setsReps': '2 x 10',
    'timerSeconds': 180,
    'difficulty': 'beginner',
  },
  {
    'id': 'hip_flexor_stretch',
    'title': 'Hip Flexor Stretch',
    'description': 'Open the front of your hips to ease the tightness from long hours of sitting.',
    'category': 'posture',
    'duration': '4 dk',
    'icon': '🧘',
    'musclesTargeted': ['legs', 'spine'],
    'scientificBasis': '',
    'formDescription': 'Kneel on one knee with the other foot flat in front of you. Tuck your hips under slightly and squeeze the glute of your back leg. Shift forward gently until you feel a stretch at the front of your hip. Hold 30 seconds, breathing slowly, then switch sides.',
    'setsReps': '2 x 30 s',
    'timerSeconds': 240,
    'difficulty': 'beginner',
  },
  // ── Existing Exercise Routines ──
  {
    'id': 'morning_stretch',
    'title': 'Sabah Germe Egzersizi',
    'description':
        'Uyanır uyanmaz 10 dakika germe hareketleri yap. Omurga ve bacak kaslarını esnet.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '🌅',
    'musclesTargeted': ['spine', 'legs', 'back'],
    'scientificBasis':
        'Morning stretching eases overnight stiffness and gets your muscles moving',
    'formDescription':
        'Start with neck rolls, then move to full body stretches. Hold each stretch for 20-30 seconds without bouncing.',
    'setsReps': '5-6 stretches x 30s hold',
    'timerSeconds': 600,
    'difficulty': 'beginner',
  },
  {
    'id': 'bar_hanging',
    'title': 'Barfiks Barına Asılma',
    'description':
        'Omuzlarını ve sırtını esnetmek için barfiks çubuğuna asıl. 3 set x 30 saniye.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '💪',
    'musclesTargeted': ['spine', 'shoulders', 'arms'],
    'scientificBasis':
        'Hanging stretches your shoulders and back and trains grip strength. Any height change is temporary',
    'formDescription':
        'Grip the bar shoulder-width apart, relax your body and feel the stretch in your shoulders and back. Avoid swinging.',
    'setsReps': '3x30 seconds',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
  {
    'id': 'cobra_stretch',
    'title': 'Kobra Germe',
    'description':
        'Yüzüstü yatıp üst vücudu yukarı kaldır. Omurgayı esnet. 3 set x 15 saniye.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🐍',
    'musclesTargeted': ['spine', 'core', 'chest'],
    'scientificBasis':
        'Cobra stretch opens the chest and eases stiffness from long periods of sitting',
    'formDescription':
        'Lie face down, place hands under shoulders, slowly push upper body up while keeping hips on the floor. Look upward.',
    'setsReps': '3x15 seconds',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
  {
    'id': 'jumping',
    'title': 'Zıplama Egzersizleri',
    'description':
        'İp atla ya da squat jump yap. Kemiklerinin güçlenmesine yardım eder. 3 set x 20 tekrar.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '🦘',
    'musclesTargeted': ['legs', 'calves', 'core'],
    'scientificBasis':
        'High-impact jumping loads your bones and helps make them stronger during the teen years',
    'formDescription':
        'Perform squat jumps or jump rope. Land softly on the balls of your feet. Rest 30 seconds between sets.',
    'setsReps': '3x20 reps',
    'timerSeconds': 600,
    'difficulty': 'intermediate',
  },
  {
    'id': 'swimming_basketball',
    'title': 'Yüzme veya Basketbol',
    'description':
        'Kondisyonunu ve gücünü artırmak için sevdiğin bir sporu yap. En az 30 dakika.',
    'category': 'exercise',
    'duration': '30 dk',
    'icon': '🏀',
    'musclesTargeted': ['full_body', 'legs', 'spine'],
    'scientificBasis':
        'Swimming and basketball build fitness, coordination and strength, and the jumping in basketball helps make bones stronger',
    'formDescription':
        'Choose swimming (freestyle/backstroke) or basketball. Focus on jumping, reaching, and full range of motion.',
    'setsReps': '30 min continuous',
    'timerSeconds': 1800,
    'difficulty': 'intermediate',
  },
  {
    'id': 'evening_yoga',
    'title': 'Akşam Yoga & Esneme',
    'description':
        'Yatmadan önce yoga ve esneme rutini. Günün stresini at, kasları gevşet.',
    'category': 'exercise',
    'duration': '15 dk',
    'icon': '🧘',
    'musclesTargeted': ['spine', 'legs', 'hips', 'back'],
    'scientificBasis':
        'Evening yoga helps you unwind and relaxes your muscles before sleep',
    'formDescription':
        'Perform gentle poses: cat-cow, child pose, downward dog, forward fold. Breathe deeply and hold each pose 30-60 seconds.',
    'setsReps': '6-8 poses x 60s hold',
    'timerSeconds': 900,
    'difficulty': 'beginner',
  },
  // ── New Exercise Routines ──
  {
    'id': 'sprint_intervals',
    'title': 'Sprint Interval Training',
    'description':
        'Short sprints with recovery walks build fitness and leg strength.',
    'category': 'exercise',
    'duration': '20 dk',
    'icon': '🏃',
    'musclesTargeted': ['legs', 'core'],
    'scientificBasis': 'Short sprints with recovery walks build fitness and leg strength',
    'formDescription':
        'Warm up for 5 minutes, then sprint at maximum effort for 30 seconds. Walk or jog for 90 seconds to recover. Repeat.',
    'setsReps': '3x30 second sprints',
    'timerSeconds': 1200,
    'difficulty': 'advanced',
  },
  {
    'id': 'hiit_workout',
    'title': 'HIIT Workout',
    'description':
        'High intensity interval training builds fitness and strength.',
    'category': 'exercise',
    'duration': '15 dk',
    'icon': '💥',
    'musclesTargeted': ['full_body'],
    'scientificBasis':
        'High intensity interval training builds fitness and strength',
    'formDescription':
        'Perform exercises like burpees, mountain climbers, and jump squats at maximum intensity for 45 seconds, rest 15 seconds.',
    'setsReps': '4 rounds of 45s work/15s rest',
    'timerSeconds': 900,
    'difficulty': 'advanced',
  },
  {
    'id': 'squats',
    'title': 'Bodyweight Squats',
    'description':
        'Bodyweight squats strengthen your legs and the muscles that support posture.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '🦵',
    'musclesTargeted': ['legs', 'spine'],
    'scientificBasis': 'Bodyweight squats strengthen your legs and the muscles that support posture',
    'formDescription':
        'Stand with feet shoulder-width apart. Lower your body until thighs are parallel to ground. Keep back straight and knees behind toes.',
    'setsReps': '3x20 reps',
    'timerSeconds': 600,
    'difficulty': 'beginner',
  },
  {
    'id': 'deadlift_stretch',
    'title': 'Deadlift Stretch',
    'description':
        'Deadlift stretch for flexible hamstrings and a stronger back.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '🏋️',
    'musclesTargeted': ['back', 'legs', 'spine'],
    'scientificBasis': 'Deadlift stretch for flexible hamstrings and a stronger back',
    'formDescription':
        'Stand with feet hip-width apart, hinge at hips keeping back flat. Reach toward toes, feel the stretch in hamstrings and back.',
    'setsReps': '3x12 reps',
    'timerSeconds': 600,
    'difficulty': 'intermediate',
  },
  {
    'id': 'overhead_press',
    'title': 'Overhead Press',
    'description':
        'Overhead pressing strengthens your shoulders and posture muscles.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '💪',
    'musclesTargeted': ['shoulders', 'spine'],
    'scientificBasis':
        'Overhead pressing strengthens your shoulders and posture muscles',
    'formDescription':
        'Stand tall, press arms overhead fully extending. Use light weights or bodyweight. Keep core tight and avoid arching back.',
    'setsReps': '3x10 reps',
    'timerSeconds': 600,
    'difficulty': 'intermediate',
  },
  {
    'id': 'skipping_rope',
    'title': 'Skipping Rope',
    'description':
        'Repetitive jumping with a rope loads your leg bones and helps make them stronger.',
    'category': 'exercise',
    'duration': '15 dk',
    'icon': '⏭️',
    'musclesTargeted': ['legs', 'calves'],
    'scientificBasis':
        'Repetitive jumping with a rope loads your leg bones and helps make them stronger',
    'formDescription':
        'Jump with both feet, landing softly on the balls of your feet. Keep jumps low and consistent. Rest between sets.',
    'setsReps': '5 min x 3 sets',
    'timerSeconds': 900,
    'difficulty': 'intermediate',
  },
  {
    'id': 'pilates_core',
    'title': 'Pilates Core',
    'description':
        'Pilates core exercises support spinal alignment and posture.',
    'category': 'exercise',
    'duration': '15 dk',
    'icon': '🧘',
    'musclesTargeted': ['core', 'spine'],
    'scientificBasis': 'Core strength supports spinal alignment and posture',
    'formDescription':
        'Perform plank, dead bug, bird dog, bridge, and leg raises. Focus on controlled movement and breathing.',
    'setsReps': '5 exercises x 1 min each',
    'timerSeconds': 900,
    'difficulty': 'intermediate',
  },
  {
    'id': 'inversion_hang',
    'title': 'Inversion Hanging',
    'description':
        'Inversion can relax your back muscles. Any height change is temporary.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🔄',
    'musclesTargeted': ['spine', 'back'],
    'scientificBasis':
        'Inversion can relax your back muscles. Any height change is temporary',
    'formDescription':
        'Use an inversion table or gravity boots. Start with a slight incline and gradually increase. Keep sessions short.',
    'setsReps': '3x1 minute',
    'timerSeconds': 300,
    'difficulty': 'intermediate',
  },
  // ── Existing Nutrition Routines ──
  {
    'id': 'protein',
    'title': 'Protein Alımı',
    'description':
        'Yumurta, tavuk, balık, süt ürünleri. Günde en az 1.5g/kg protein al.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🥚',
    'musclesTargeted': ['bones', 'muscles'],
    'scientificBasis':
        'Protein provides amino acids essential for bone and muscle growth, especially during growth spurts. (Am J Clinical Nutrition, 2015)',
    'formDescription':
        'Spread protein intake across 3-4 meals. Include eggs, chicken, fish, dairy, and legumes.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'calcium_vitamin_d',
    'title': 'Kalsiyum & D Vitamini',
    'description':
        'Süt, peynir, yoğurt tüket. 15 dk güneşlen. Kemik gelişimi için kritik.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🥛',
    'musclesTargeted': ['bones'],
    'scientificBasis':
        'Calcium and Vitamin D are the primary building blocks for bone density and linear bone growth. (Osteoporosis International, 2018)',
    'formDescription':
        'Consume 3 servings of dairy daily and get 15 minutes of sunlight for natural Vitamin D synthesis.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'water',
    'title': 'Su İçme Hedefi',
    'description':
        'Günde en az 2-3 litre su iç. Metabolizma ve büyüme için şart.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '💧',
    'musclesTargeted': [],
    'scientificBasis':
        'Hydration is essential for nutrient transport to growth plates and joint cartilage health',
    'formDescription':
        'Drink water consistently throughout the day. Carry a water bottle and set hourly reminders.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'avoid_junk',
    'title': 'Zararlı Gıdalardan Kaçın',
    'description':
        'Fast food, şekerli içecekler ve işlenmiş gıdalardan uzak dur.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🚫',
    'musclesTargeted': [],
    'scientificBasis':
        'Processed foods and sugar cause inflammation and insulin spikes that suppress growth hormone secretion',
    'formDescription':
        'Replace fast food with whole foods. Swap sugary drinks for water. Read labels and avoid processed ingredients.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  // ── New Nutrition Routines ──
  {
    'id': 'zinc_intake',
    'title': 'Zinc Rich Foods',
    'description':
        'Consume zinc-rich foods throughout the day for growth hormone production.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🥩',
    'musclesTargeted': [],
    'scientificBasis': 'Zinc is essential for growth hormone production',
    'formDescription':
        'Include red meat, pumpkin seeds, chickpeas, cashews, and oysters in your diet. Aim for 8-11mg daily.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'vitamin_d_sunlight',
    'title': 'Vitamin D & Sunlight',
    'description':
        'Get at least 15 minutes of direct sunlight for Vitamin D synthesis and bone growth.',
    'category': 'nutrition',
    'duration': '15 dk',
    'icon': '☀️',
    'musclesTargeted': ['bones'],
    'scientificBasis':
        'Vitamin D is crucial for calcium absorption and bone growth',
    'formDescription':
        'Expose arms and face to direct sunlight for 15 minutes, preferably before noon. No sunscreen needed for this duration.',
    'setsReps': '',
    'timerSeconds': 900,
    'difficulty': 'beginner',
  },
  {
    'id': 'arginine_foods',
    'title': 'Arginine Rich Foods',
    'description':
        'Eat arginine-rich foods to stimulate growth hormone secretion.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🥜',
    'musclesTargeted': [],
    'scientificBasis': 'L-Arginine stimulates growth hormone secretion',
    'formDescription':
        'Include nuts, seeds, turkey, chicken, soybeans, and dairy in your meals. Best consumed before sleep.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'daily_calories',
    'title': 'Daily Calorie Target',
    'description': 'Hit your daily calorie target — undereating slows growth.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🔥',
    'musclesTargeted': [],
    'scientificBasis':
        'A sustained calorie deficit lowers IGF-1 and blunts growth hormone pulses, directly slowing linear growth during adolescence. (Horm Res Paediatr, 2016)',
    'formDescription':
        "Spread your calories across 3-5 meals and don't skip breakfast. Prioritize whole foods over empty calories.",
    'setsReps': '',
    'difficulty': 'beginner',
  },
  // ── Existing Sleep Routines ──
  {
    'id': 'quality_sleep',
    'title': 'Kaliteli Uyku (8-10 saat)',
    'description':
        'Büyüme hormonu uyku sırasında salgılanır. 22:00-06:00 arası altın saatler.',
    'category': 'sleep',
    'duration': '8-10 saat',
    'icon': '😴',
    'musclesTargeted': [],
    'scientificBasis':
        '70-80% of daily growth hormone is released during deep sleep stages, especially between 10 PM and 2 AM. (Endocrine Reviews, 1991)',
    'formDescription':
        'Go to bed by 10 PM. Keep the room dark and cool. Avoid caffeine after 2 PM.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'no_screen',
    'title': 'Yatmadan Önce Ekran Molası',
    'description':
        'Yatmadan 1 saat önce telefon ve bilgisayarı bırak. Melatonin üretimini engelleme.',
    'category': 'sleep',
    'duration': '1 saat',
    'icon': '📵',
    'musclesTargeted': [],
    'scientificBasis':
        'Blue light from screens suppresses melatonin production, delaying sleep onset and reducing deep sleep quality. (PNAS, 2014)',
    'formDescription':
        'Set an alarm 1 hour before bedtime. Put all screens away. Read a book or do gentle stretching instead.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  // ── New Sleep Routines ──
  {
    'id': 'sleep_environment',
    'title': 'Optimize Sleep Environment',
    'description':
        'Create a dark, cool sleeping environment to maximize melatonin and growth hormone release.',
    'category': 'sleep',
    'duration': 'Gece',
    'icon': '🌙',
    'musclesTargeted': [],
    'scientificBasis':
        'Dark, cool environment maximizes melatonin and growth hormone',
    'formDescription':
        'Use blackout curtains, keep room at 18-20C, remove all light sources. Use a comfortable mattress and pillow.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'pre_sleep_routine',
    'title': 'Pre-Sleep Wind Down',
    'description':
        'A consistent pre-sleep routine improves deep sleep quality by 23%.',
    'category': 'sleep',
    'duration': '30 dk',
    'icon': '📖',
    'musclesTargeted': [],
    'scientificBasis':
        'Consistent pre-sleep routine improves deep sleep quality by 23%',
    'formDescription':
        'Start 30 minutes before bed: dim lights, read a book, do breathing exercises, avoid stimulating activities.',
    'setsReps': '',
    'timerSeconds': 1800,
    'difficulty': 'beginner',
  },
  // ── Existing Posture Routines ──
  {
    'id': 'posture_check',
    'title': 'Duruş Kontrolü',
    'description':
        'Sırtını dik tut, omuzlarını geri çek. Saatte bir kontrol et. Doğru duruş = 2-3 cm fark.',
    'category': 'posture',
    'duration': 'Gün boyu',
    'icon': '🧍',
    'musclesTargeted': ['spine', 'core', 'shoulders'],
    'scientificBasis':
        'Correct posture alignment can improve apparent height by 2-3 cm and prevents spinal compression over time. (Physical Therapy Reviews, 2019)',
    'formDescription':
        'Stand tall with shoulders back and down. Engage core slightly. Imagine a string pulling you up from the crown of your head.',
    'setsReps': 'Check every hour',
    'difficulty': 'beginner',
  },
  {
    'id': 'wall_stand',
    'title': 'Duvara Yaslanma Egzersizi',
    'description':
        'Sırtını duvara yasla: topuklar, kalça, omuz, baş duvara değsin. 5 dk tut.',
    'category': 'posture',
    'duration': '5 dk',
    'icon': '🏛️',
    'musclesTargeted': ['spine', 'back', 'shoulders'],
    'scientificBasis':
        'Wall stands train postural muscle memory, helping maintain proper spinal alignment throughout the day',
    'formDescription':
        'Stand with heels, buttocks, shoulder blades, and head touching the wall. Hold for 5 minutes. Breathe normally.',
    'setsReps': '5 min hold',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
  // ── New Posture Routines ──
  {
    'id': 'neck_stretches',
    'title': 'Neck Stretches',
    'description':
        'Neck stretches relieve compression and improve cervical alignment.',
    'category': 'posture',
    'duration': '5 dk',
    'icon': '🦒',
    'musclesTargeted': ['neck', 'upper_spine'],
    'scientificBasis':
        'Neck stretches relieve compression and improve cervical alignment',
    'formDescription':
        'Tilt head slowly to each side, forward, and backward. Hold each direction for 30 seconds. Do not force the stretch.',
    'setsReps': '3 directions x 30s hold',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
  {
    'id': 'shoulder_rolls',
    'title': 'Shoulder Rolls & Opens',
    'description':
        'Opening shoulders corrects forward posture, can add 1-2cm in appearance.',
    'category': 'posture',
    'duration': '5 dk',
    'icon': '🔄',
    'musclesTargeted': ['shoulders', 'upper_back'],
    'scientificBasis':
        'Opening shoulders corrects forward posture, can add 1-2cm appearance',
    'formDescription':
        'Roll shoulders forward 15 times, then backward 15 times. Follow with chest-opening stretches holding for 20 seconds.',
    'setsReps': '3x15 each direction',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
  // ── v5 moves (generated by tool/moves_v2_gen.py) ──
  {
    'id': 'pogo_jumps',
    'title': 'Pogo Jumps',
    'description':
        'Quick, stiff-ankle bounces load your shin and foot bones and build springy, powerful calves.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🦘',
  },
  {
    'id': 'jump_squats',
    'title': 'Jump Squats',
    'description':
        'Squat and jump for leg power, the hard big-muscle work your body answers with growth hormone afterwards.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🏋️',
  },
  {
    'id': 'tuck_jumps',
    'title': 'Tuck Jumps',
    'description':
        'Jump and pull your knees up for explosive power, the hard effort your body answers with growth hormone afterwards.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🦘',
  },
  {
    'id': 'broad_jumps',
    'title': 'Broad Jumps',
    'description':
        'Jump forward off two feet and stick the landing to build hip power and strong leg bones.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🏃',
  },
  {
    'id': 'single_leg_hops',
    'title': 'Single-Leg Hops',
    'description':
        'Small hops on one leg strengthen your ankles and bones and even out your two sides.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🦶',
  },
  {
    'id': 'high_knees',
    'title': 'High Knees',
    'description':
        'Run on the spot with your knees at hip height to warm up fast and load your legs.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🏃',
  },
  {
    'id': 'mountain_pose',
    'title': 'Mountain Pose on Toes',
    'description':
        'Rise onto your toes and reach up to lengthen your spine and practise standing at your full height.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧍',
  },
  {
    'id': 'pelvic_shift',
    'title': 'Pelvic Shift',
    'description':
        'Lift and lower your hips one vertebra at a time to loosen your spine and wake up your glutes.',
    'category': 'posture',
    'duration': '5 dk',
    'icon': '🧘',
  },
  {
    'id': 'table_top',
    'title': 'Reverse Table Top',
    'description':
        'Lift your hips into a flat table to open your chest and shoulders and strengthen your back side.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧘',
  },
  {
    'id': 'childs_pose',
    'title': 'Child\'s Pose',
    'description':
        'Sit back on your heels with long arms to gently stretch your back and let your spine relax.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧘',
  },
  {
    'id': 'puppy_pose',
    'title': 'Puppy Pose',
    'description':
        'Melt your chest toward the floor to open tight shoulders and stretch your upper back.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧘',
  },
  {
    'id': 'seated_forward_fold',
    'title': 'Seated Forward Fold',
    'description':
        'Hinge forward over straight legs to stretch your hamstrings and the whole length of your back.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧘',
  },
  {
    'id': 'standing_side_stretch',
    'title': 'Standing Side Stretch',
    'description':
        'Lean to each side with your arms overhead to stretch your waist and free up your ribs.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧍',
  },
  {
    'id': 'low_lunge_arch',
    'title': 'Low Lunge with Reach',
    'description':
        'Sink your hips forward and reach up to open the front of your hips and your chest.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧘',
  },
  {
    'id': 'bow_pose',
    'title': 'Bow Pose',
    'description':
        'Hold your ankles and lift your chest and thighs to open your whole front and strengthen your back.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧘',
  },
  {
    'id': 'pilates_roll_over',
    'title': 'Pilates Roll Over',
    'description':
        'Roll your legs overhead and back with control to stretch your spine and train deep core strength.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧘',
  },
  {
    'id': 'legs_up_wall',
    'title': 'Legs Up the Wall',
    'description':
        'Rest your legs up a wall to take the load off your spine and unwind after a long day.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧱',
  },
  {
    'id': 'spinal_twist',
    'title': 'Lying Spinal Twist',
    'description':
        'Drop one knee across your body to gently rotate your spine and release a stiff lower back.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧘',
  },
  {
    'id': 'chest_stretch',
    'title': 'Doorway Chest Stretch',
    'description':
        'Step through a doorway with your forearm on the frame to open a chest rounded by screens.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🚪',
  },
  {
    'id': 'scapular_retraction',
    'title': 'Shoulder Blade Squeeze',
    'description':
        'Squeeze your shoulder blades back and down to train the muscles that keep your shoulders from rounding.',
    'category': 'posture',
    'duration': '5 dk',
    'icon': '🧍',
  },
  {
    'id': 'thoracic_extension',
    'title': 'Chair Upper-Back Extension',
    'description':
        'Lean your upper back over a chair to undo the slouch from sitting and open your chest.',
    'category': 'posture',
    'duration': '5 dk',
    'icon': '🪑',
  },
  {
    'id': 'hanging_knee_raise',
    'title': 'Hanging Knee Raise',
    'description':
        'Lift your knees while you hang to build a strong core as the hang decompresses your spine.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🤸',
  },
  {
    'id': 'scapular_pull',
    'title': 'Scapular Pull',
    'description':
        'Pull your shoulders down from a hang with straight arms to build the base for strong pull-ups.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🤸',
  },
  {
    'id': 'pull_ups',
    'title': 'Pull-Ups',
    'description':
        'Pull your chin over the bar to build your back, hard work the body answers with growth hormone afterwards.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '💪',
  },
  {
    'id': 'bird_dog',
    'title': 'Bird Dog',
    'description':
        'Reach your opposite arm and leg long to train the deep muscles that keep your spine steady.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '💪',
  },
  {
    'id': 'dead_bug',
    'title': 'Dead Bug',
    'description':
        'Lower your opposite arm and leg with your back flat to build core control that protects your spine.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '💪',
  },
  {
    'id': 'side_plank',
    'title': 'Side Plank',
    'description':
        'Hold a straight line on one forearm to strengthen the side muscles that keep your posture even.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '💪',
  },
  {
    'id': 'wall_sit',
    'title': 'Wall Sit',
    'description':
        'Sit against a wall with your thighs level to build leg strength with your back held straight.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🧱',
  },
  {
    'id': 'lunges',
    'title': 'Lunges',
    'description':
        'Step forward and bend both knees to build strong legs and hips, one side at a time.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🦵',
  },
  {
    'id': 'step_ups',
    'title': 'Step-Ups',
    'description':
        'Step up and stand tall, then lower slowly, to build single-leg strength and balance.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🦵',
  },
  {
    'id': 'push_ups',
    'title': 'Push-Ups',
    'description':
        'Lower your chest to the floor with a straight body to build your chest, arms and core.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '💪',
  },
  {
    'id': 'single_leg_calf_raise',
    'title': 'Single-Leg Calf Raise',
    'description':
        'Rise on one foot from the edge of a step to build strong calves and ankles for jumping.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🦶',
  },
  {
    'id': 'goblet_squat',
    'title': 'Goblet Squat',
    'description':
        'Squat with a weight at your chest, the big-muscle effort your body answers with growth hormone afterwards.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🏋️',
  },
  {
    'id': 'dumbbell_deadlift',
    'title': 'Dumbbell Romanian Deadlift',
    'description':
        'Hinge at your hips with a flat back, hard big-muscle work your body answers with growth hormone afterwards.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🏋️',
  },
  {
    'id': 'dumbbell_row',
    'title': 'Dumbbell Row',
    'description':
        'Pull a dumbbell to your hip to build the upper-back muscles that draw your shoulders back.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🏋️',
  },
  {
    'id': 'farmer_carry',
    'title': 'Farmer\'s Carry',
    'description':
        'Walk tall with a weight in each hand, whole-body work the body answers with growth hormone afterwards.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🏋️',
  },
  {
    'id': 'band_pull_apart',
    'title': 'Band Pull-Apart',
    'description':
        'Pull a band apart to your chest to strengthen your upper back and keep your shoulders open.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '💪',
  },
  {
    'id': 'burpees',
    'title': 'Burpees',
    'description':
        'Squat, plank and jump in one move, whole-body work your body answers with growth hormone afterwards.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🔥',
  },
  // ── end v5 moves ──
];

const List<String> motivationalQuotes = [
  "Her gün bir öncekinden daha iyi ol.",
  "Büyüme bir gece olmaz, ama her gece seni oraya yaklaştırır.",
  "Büyüme sabır ister, devam et!",
  "Bugün attığın adım, yarının temelini kurar.",
  "Disiplin, motivasyonun bittiği yerde başlar.",
  "Vücudun sana teşekkür edecek, devam et!",
  "Potansiyelinin sınırını sen belirlersin.",
  "Küçük adımlar, büyük değişimler yaratır.",
  "En iyi yatırım kendine yaptığındır.",
  "Hedefine her gün biraz daha yaklaşıyorsun.",
  "Değişim zor, ama pişmanlık daha zor.",
  "Bedenin bir tapınak, ona iyi bak.",
  "Rakibin dünkü kendin. Bugün onu geç!",
  "BeTaller = Sabır + Disiplin + İnanç",
  "Kendine inan, süreç seni şekillendirecek.",
  "Bugün yapamam deme, yarın pişman olma.",
  "1% bile olsa her gün gelişim göster.",
  "Ayna sana gelişimini gösterecek, sabırlı ol.",
];

const Map<int, Map<String, double>> growthPercentageByAge = {
  8: {'male': 72.0, 'female': 77.0},
  9: {'male': 75.0, 'female': 81.0},
  10: {'male': 78.0, 'female': 84.4},
  11: {'male': 81.1, 'female': 88.4},
  12: {'male': 84.2, 'female': 92.9},
  13: {'male': 87.3, 'female': 96.5},
  14: {'male': 91.5, 'female': 98.3},
  15: {'male': 95.0, 'female': 99.1},
  16: {'male': 97.3, 'female': 99.6},
  17: {'male': 98.9, 'female': 99.8},
  18: {'male': 99.5, 'female': 100.0},
  19: {'male': 99.8, 'female': 100.0},
  20: {'male': 100.0, 'female': 100.0},
};

const Map<String, Map<String, dynamic>> categoryInfo = {
  'exercise': {
    'title': 'Egzersiz',
    'icon': CupertinoIcons.flame,
    'color': AppColors.exerciseColor,
  },
  'nutrition': {
    'title': 'Beslenme',
    'icon': CupertinoIcons.leaf_arrow_circlepath,
    'color': AppColors.nutritionColor,
  },
  'sleep': {
    'title': 'Uyku',
    'icon': CupertinoIcons.moon_fill,
    'color': AppColors.sleepColor,
  },
  'posture': {
    'title': 'Duruş',
    'icon': CupertinoIcons.person_fill,
    'color': AppColors.postureColor,
  },
};

const List<Map<String, dynamic>> achievementDefinitions = [
  // Kararlılık — earned by finishing the app walkthrough, so it's the
  // first badge most players ever see, ahead of any streak or measurement.
  {
    'id': 'commitment',
    'title': 'Kararlılık',
    'description':
        'Tüm verileri gir ve uygulamayı tamamen keşfet, kullanıma başla',
    'icon': '🎯',
    'type': 'tour',
    'value': 2,
  },
  // Seri
  {
    'id': 'first_day',
    'title': 'İlk Adım',
    'description': 'İlk gününü tamamla',
    'icon': '🌟',
    'type': 'streak',
    'value': 1,
  },
  {
    'id': 'three_streak',
    'title': '3 Gün Seri',
    'description': '3 gün üst üste rutinleri tamamla',
    'icon': '✊',
    'type': 'streak',
    'value': 3,
  },
  {
    'id': 'week_streak',
    'title': '7 Gün Seri',
    'description': '7 gün üst üste rutinleri tamamla',
    'icon': '🔥',
    'type': 'streak',
    'value': 7,
  },
  {
    'id': 'two_week_streak',
    'title': '14 Gün Seri',
    'description': '14 gün üst üste devam et',
    'icon': '⚡',
    'type': 'streak',
    'value': 14,
  },
  {
    'id': 'month_streak',
    'title': '30 Gün Seri',
    'description': '30 gün üst üste tamamla',
    'icon': '💎',
    'type': 'streak',
    'value': 30,
  },
  {
    'id': 'two_month_streak',
    'title': '60 Gün Seri',
    'description': '60 gün üst üste tamamla',
    'icon': '👑',
    'type': 'streak',
    'value': 60,
  },
  {
    'id': 'hundred_streak',
    'title': '100 Gün Seri',
    'description': '100 gün üst üste tamamla',
    'icon': '🏆',
    'type': 'streak',
    'value': 100,
  },
  // Ölçüm
  {
    'id': 'first_measure',
    'title': 'İlk Ölçüm',
    'description': 'İlk boy ölçümünü kaydet',
    'icon': '📐',
    'type': 'measures',
    'value': 1,
  },
  {
    'id': 'three_measures',
    'title': 'Takipçi',
    'description': '3 boy ölçümü kaydet',
    'icon': '📋',
    'type': 'measures',
    'value': 3,
  },
  {
    'id': 'five_measures',
    'title': 'Düzenli Takip',
    'description': '5 boy ölçümü kaydet',
    'icon': '📊',
    'type': 'measures',
    'value': 5,
  },
  {
    'id': 'ten_measures',
    'title': 'Veri Avcısı',
    'description': '10 boy ölçümü kaydet',
    'icon': '📈',
    'type': 'measures',
    'value': 10,
  },
  // Büyüme
  {
    'id': 'first_cm',
    'title': 'İlk Santim',
    'description': 'Toplam 1 cm uzama kaydet',
    'icon': '📏',
    'type': 'growth',
    'value': 1,
  },
  {
    'id': 'three_cm',
    'title': '3 cm Büyüme',
    'description': 'Toplam 3 cm uzama kaydet',
    'icon': '🌱',
    'type': 'growth',
    'value': 3,
  },
  {
    'id': 'five_cm',
    'title': '5 cm Büyüme',
    'description': 'Toplam 5 cm uzama kaydet',
    'icon': '🚀',
    'type': 'growth',
    'value': 5,
  },
  {
    'id': 'ten_cm',
    'title': '10 cm Büyüme',
    'description': 'Toplam 10 cm uzama kaydet',
    'icon': '🗼',
    'type': 'growth',
    'value': 10,
  },
];

/// XP rewards for actions
const xpRewards = {
  'routine_complete': 5,
  'all_routines_done': 25,
  'height_logged': 15,
  'streak_day': 10, // multiplied by streak count
  'challenge_complete': 50,
  'water_goal': 10,
  'sleep_goal': 10,
  'first_login_today': 5,
};

/// Level thresholds
const levelThresholds = [
  0, // Level 1
  100, // Level 2
  250, // Level 3
  500, // Level 4
  850, // Level 5
  1300, // Level 6
  1900, // Level 7
  2700, // Level 8
  3700, // Level 9
  5000, // Level 10
  6500, // Level 11
  8500, // Level 12
  11000, // Level 13
  14000, // Level 14
  18000, // Level 15
  23000, // Level 16
  29000, // Level 17
  36000, // Level 18
  44000, // Level 19
  55000, // Level 20
];

/// Level titles
const levelTitles = [
  'Beginner', // 1
  'Starter', // 2
  'Committed', // 3
  'Dedicated', // 4
  'Consistent', // 5
  'Focused', // 6
  'Determined', // 7
  'Disciplined', // 8
  'Strong', // 9
  'Advanced', // 10
  'Expert', // 11
  'Master', // 12
  'Elite', // 13
  'Champion', // 14
  'Legend', // 15
  'Titan', // 16
  'Mythic', // 17
  'Immortal', // 18
  'Transcendent', // 19
  'Ultimate', // 20
];

/// Challenge templates
const challengeTemplates = [
  // Daily challenges
  {
    'id': 'daily_all_routines',
    'type': 'daily',
    'title': 'Complete All Routines',
    'description': 'Finish every routine today',
    'target': 1,
    'xpReward': 30,
    'icon': '🔥',
  },
  {
    'id': 'daily_water',
    'type': 'daily',
    'title': 'Hydration Hero',
    'description': 'Reach your daily water goal',
    'target': 1,
    'xpReward': 20,
    'icon': '💧',
  },
  {
    'id': 'daily_sleep_early',
    'type': 'daily',
    'title': 'Early Sleeper',
    'description': 'Log 8+ hours of sleep',
    'target': 8,
    'xpReward': 20,
    'icon': '😴',
  },
  {
    'id': 'daily_exercise_3',
    'type': 'daily',
    'title': 'Exercise Trio',
    'description': 'Complete 3 exercise routines',
    'target': 3,
    'xpReward': 25,
    'icon': '💪',
  },
  {
    'id': 'daily_stretch',
    'type': 'daily',
    'title': 'Morning Stretch',
    'description': 'Do morning stretching before 9 AM',
    'target': 1,
    'xpReward': 15,
    'icon': '🌅',
  },
  // Weekly challenges
  {
    'id': 'weekly_streak_7',
    'type': 'weekly',
    'title': '7-Day Warrior',
    'description': 'Complete all routines for 7 consecutive days',
    'target': 7,
    'xpReward': 100,
    'icon': '⚡',
  },
  {
    'id': 'weekly_measure',
    'type': 'weekly',
    'title': 'Growth Tracker',
    'description': 'Log a height measurement this week',
    'target': 1,
    'xpReward': 30,
    'icon': '📏',
  },
  {
    'id': 'weekly_water_5',
    'type': 'weekly',
    'title': 'Hydration Week',
    'description': 'Hit water goal 5 days this week',
    'target': 5,
    'xpReward': 60,
    'icon': '🌊',
  },
  {
    'id': 'weekly_exercise_15',
    'type': 'weekly',
    'title': 'Fitness Champion',
    'description': 'Complete 15 exercise routines this week',
    'target': 15,
    'xpReward': 80,
    'icon': '🏆',
  },
  {
    'id': 'weekly_sleep_5',
    'type': 'weekly',
    'title': 'Sleep Master',
    'description': 'Log 8+ hours of sleep for 5 days',
    'target': 5,
    'xpReward': 60,
    'icon': '🌙',
  },
];
