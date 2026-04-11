import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ── Premium Dark Theme Design Tokens ──────────────────────────────

class AppColors {
  AppColors._();

  // Core backgrounds
  static const scaffold = Color(0xFF070B1A);       // Dark Navy
  static const surfaceDark = Color(0xFF0F0B24);    // Secondary bg

  // Card fills — deep layered cyber look
  static const cardFill = Color(0xFF141432);
  static const cardFillLight = Color(0xFF1A1845);
  static final cardBorder = const Color(0xFFFFFFFF).withValues(alpha: 0.06);
  static final cardBorderLight = const Color(0xFF8B5CF6).withValues(alpha: 0.20);

  // Primary accent — #8B5CF6 Purple
  static const primary = Color(0xFF8B5CF6);
  static const primaryLight = Color(0xFFBB9FFD);
  static const primaryDark = Color(0xFF4C1D95);
  static const primaryBright = Color(0xFFA78BFA);

  // Secondary accents
  static const cyan = Color(0xFF00E5FF);
  static const orange = Color(0xFFFF8A00);    // Energy Orange
  static const pink = Color(0xFFFF4DB8);
  static const lime = Color(0xFF22FF88);      // Neon Growth Green — KEY COLOR

  // Semantic
  static const success = Color(0xFF22FF88);   // Neon green for success/growth
  static const error = Color(0xFFFF5252);
  static const warning = Color(0xFFF5C542);   // Premium Gold

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
    colors: [Color(0xFF0F0B24), Color(0xFF070B1A)],
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
  final Color? glowColor;  // NEW

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 18,  // Changed from 20 to 18
    this.fillColor,
    this.borderColor,
    this.glowColor,  // NEW
  });

  @override
  Widget build(BuildContext context) {
    final glow = glowColor ?? AppColors.primary.withValues(alpha: 0.12);
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        gradient: fillColor == null ? const LinearGradient(
          colors: [Color(0xFF141432), Color(0xFF0B0B22)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(2.53),  // ~145deg
        ) : null,
        color: fillColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? const Color(0xFFFFFFFF).withValues(alpha: 0.06),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.60),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: glow,
            blurRadius: 24,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(20),
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
    return LayoutBuilder(builder: (context, constraints) {
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
    });
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
            label.toUpperCase(),
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
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.textSecondary,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

// ── Default Routines ──────────────────────────────────────────────

const List<Map<String, dynamic>> defaultRoutines = [
  // ── Existing Exercise Routines ──
  {
    'id': 'morning_stretch',
    'title': 'Sabah Germe Egzersizi',
    'description': 'Uyanır uyanmaz 10 dakika germe hareketleri yap. Omurga ve bacak kaslarını esnet.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '🌅',
    'musclesTargeted': ['spine', 'legs', 'back'],
    'scientificBasis': 'Morning stretching decompresses spinal discs that were rehydrated overnight, maximizing height retention. (Spine Journal, 2014)',
    'formDescription': 'Start with neck rolls, then move to full body stretches. Hold each stretch for 20-30 seconds without bouncing.',
    'setsReps': '5-6 stretches x 30s hold',
    'timerSeconds': 600,
    'difficulty': 'beginner',
  },
  {
    'id': 'bar_hanging',
    'title': 'Barfiks Barına Asılma',
    'description': 'Barfiks barına asılarak omurgayı uzat. 3 set x 30 saniye tut.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '💪',
    'musclesTargeted': ['spine', 'shoulders', 'arms'],
    'scientificBasis': 'Hanging decompresses vertebral discs by using gravity to stretch the spine, potentially adding temporary height. (J Orthopedic Research, 2012)',
    'formDescription': 'Grip the bar shoulder-width apart, relax your body completely, let gravity stretch your spine. Avoid swinging.',
    'setsReps': '3x30 seconds',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
  {
    'id': 'cobra_stretch',
    'title': 'Kobra Germe',
    'description': 'Yüzüstü yatıp üst vücudu yukarı kaldır. Omurgayı esnet. 3 set x 15 saniye.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🐍',
    'musclesTargeted': ['spine', 'core', 'chest'],
    'scientificBasis': 'Cobra stretch extends the spine and opens the chest, counteracting spinal compression from sitting',
    'formDescription': 'Lie face down, place hands under shoulders, slowly push upper body up while keeping hips on the floor. Look upward.',
    'setsReps': '3x15 seconds',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
  {
    'id': 'jumping',
    'title': 'Zıplama Egzersizleri',
    'description': 'İp atlama veya squat jump. Büyüme plakalarını uyarır. 3 set x 20 tekrar.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '🦘',
    'musclesTargeted': ['legs', 'calves', 'core'],
    'scientificBasis': 'High-impact loading stimulates bone modeling and triggers growth hormone release through mechanical stress. (J Bone Mineral Research, 2016)',
    'formDescription': 'Perform squat jumps or jump rope. Land softly on the balls of your feet. Rest 30 seconds between sets.',
    'setsReps': '3x20 reps',
    'timerSeconds': 600,
    'difficulty': 'intermediate',
  },
  {
    'id': 'swimming_basketball',
    'title': 'Yüzme veya Basketbol',
    'description': 'Boy uzamasını destekleyen sporlardan birini yap. En az 30 dakika.',
    'category': 'exercise',
    'duration': '30 dk',
    'icon': '🏀',
    'musclesTargeted': ['full_body', 'legs', 'spine'],
    'scientificBasis': 'Swimming and basketball involve full-body stretching, jumping, and reaching that stimulate growth plate activity',
    'formDescription': 'Choose swimming (freestyle/backstroke) or basketball. Focus on jumping, reaching, and full range of motion.',
    'setsReps': '30 min continuous',
    'timerSeconds': 1800,
    'difficulty': 'intermediate',
  },
  {
    'id': 'evening_yoga',
    'title': 'Akşam Yoga & Esneme',
    'description': 'Yatmadan önce yoga ve esneme rutini. Günün stresini at, kasları gevşet.',
    'category': 'exercise',
    'duration': '15 dk',
    'icon': '🧘',
    'musclesTargeted': ['spine', 'legs', 'hips', 'back'],
    'scientificBasis': 'Evening yoga reduces cortisol which inhibits growth hormone, and stretches muscles for overnight recovery. (J Clinical Endocrinology, 2017)',
    'formDescription': 'Perform gentle poses: cat-cow, child pose, downward dog, forward fold. Breathe deeply and hold each pose 30-60 seconds.',
    'setsReps': '6-8 poses x 60s hold',
    'timerSeconds': 900,
    'difficulty': 'beginner',
  },
  // ── New Exercise Routines ──
  {
    'id': 'sprint_intervals',
    'title': 'Sprint Interval Training',
    'description': 'Sprint interval training triggers significant growth hormone release through high-intensity bursts.',
    'category': 'exercise',
    'duration': '20 dk',
    'icon': '🏃',
    'musclesTargeted': ['legs', 'core'],
    'scientificBasis': 'Sprinting triggers significant growth hormone release',
    'formDescription': 'Warm up for 5 minutes, then sprint at maximum effort for 30 seconds. Walk or jog for 90 seconds to recover. Repeat.',
    'setsReps': '3x30 second sprints',
    'timerSeconds': 1200,
    'difficulty': 'advanced',
  },
  {
    'id': 'hiit_workout',
    'title': 'HIIT Workout',
    'description': 'High intensity interval training to maximize growth hormone release.',
    'category': 'exercise',
    'duration': '15 dk',
    'icon': '💥',
    'musclesTargeted': ['full_body'],
    'scientificBasis': 'High intensity exercise increases HGH secretion by up to 450% through lactate accumulation. (Sports Medicine, 2003)',
    'formDescription': 'Perform exercises like burpees, mountain climbers, and jump squats at maximum intensity for 45 seconds, rest 15 seconds.',
    'setsReps': '4 rounds of 45s work/15s rest',
    'timerSeconds': 900,
    'difficulty': 'advanced',
  },
  {
    'id': 'squats',
    'title': 'Bodyweight Squats',
    'description': 'Bodyweight squats stimulate growth plates in legs and spine.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '🦵',
    'musclesTargeted': ['legs', 'spine'],
    'scientificBasis': 'Squats stimulate growth plates in legs and spine',
    'formDescription': 'Stand with feet shoulder-width apart. Lower your body until thighs are parallel to ground. Keep back straight and knees behind toes.',
    'setsReps': '3x20 reps',
    'timerSeconds': 600,
    'difficulty': 'beginner',
  },
  {
    'id': 'deadlift_stretch',
    'title': 'Deadlift Stretch',
    'description': 'Deadlift stretch for spinal decompression and vertebral disc health.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '🏋️',
    'musclesTargeted': ['back', 'legs', 'spine'],
    'scientificBasis': 'Spinal decompression promotes vertebral disc health',
    'formDescription': 'Stand with feet hip-width apart, hinge at hips keeping back flat. Reach toward toes, feel the stretch in hamstrings and back.',
    'setsReps': '3x12 reps',
    'timerSeconds': 600,
    'difficulty': 'intermediate',
  },
  {
    'id': 'overhead_press',
    'title': 'Overhead Press',
    'description': 'Overhead pressing stretches the spine and strengthens posture muscles.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '💪',
    'musclesTargeted': ['shoulders', 'spine'],
    'scientificBasis': 'Overhead pressing stretches the spine and strengthens posture muscles',
    'formDescription': 'Stand tall, press arms overhead fully extending. Use light weights or bodyweight. Keep core tight and avoid arching back.',
    'setsReps': '3x10 reps',
    'timerSeconds': 600,
    'difficulty': 'intermediate',
  },
  {
    'id': 'skipping_rope',
    'title': 'Skipping Rope',
    'description': 'Repetitive jumping with a skipping rope stimulates growth plates in lower extremities.',
    'category': 'exercise',
    'duration': '15 dk',
    'icon': '⏭️',
    'musclesTargeted': ['legs', 'calves'],
    'scientificBasis': 'Repetitive jumping stimulates growth plates in lower extremities',
    'formDescription': 'Jump with both feet, landing softly on the balls of your feet. Keep jumps low and consistent. Rest between sets.',
    'setsReps': '5 min x 3 sets',
    'timerSeconds': 900,
    'difficulty': 'intermediate',
  },
  {
    'id': 'pilates_core',
    'title': 'Pilates Core',
    'description': 'Pilates core exercises support spinal alignment and posture.',
    'category': 'exercise',
    'duration': '15 dk',
    'icon': '🧘',
    'musclesTargeted': ['core', 'spine'],
    'scientificBasis': 'Core strength supports spinal alignment and posture',
    'formDescription': 'Perform plank, dead bug, bird dog, bridge, and leg raises. Focus on controlled movement and breathing.',
    'setsReps': '5 exercises x 1 min each',
    'timerSeconds': 900,
    'difficulty': 'intermediate',
  },
  {
    'id': 'inversion_hang',
    'title': 'Inversion Hanging',
    'description': 'Inversion decompresses spinal discs, can temporarily add 1-2cm.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🔄',
    'musclesTargeted': ['spine', 'back'],
    'scientificBasis': 'Inversion decompresses spinal discs, can temporarily add 1-2cm',
    'formDescription': 'Use an inversion table or gravity boots. Start with a slight incline and gradually increase. Keep sessions short.',
    'setsReps': '3x1 minute',
    'timerSeconds': 300,
    'difficulty': 'intermediate',
  },
  // ── Existing Nutrition Routines ──
  {
    'id': 'protein',
    'title': 'Protein Alımı',
    'description': 'Yumurta, tavuk, balık, süt ürünleri. Günde en az 1.5g/kg protein al.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🥚',
    'musclesTargeted': ['bones', 'muscles'],
    'scientificBasis': 'Protein provides amino acids essential for bone and muscle growth, especially during growth spurts. (Am J Clinical Nutrition, 2015)',
    'formDescription': 'Spread protein intake across 3-4 meals. Include eggs, chicken, fish, dairy, and legumes.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'calcium_vitamin_d',
    'title': 'Kalsiyum & D Vitamini',
    'description': 'Süt, peynir, yoğurt tüket. 15 dk güneşlen. Kemik gelişimi için kritik.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🥛',
    'musclesTargeted': ['bones'],
    'scientificBasis': 'Calcium and Vitamin D are the primary building blocks for bone density and linear bone growth. (Osteoporosis International, 2018)',
    'formDescription': 'Consume 3 servings of dairy daily and get 15 minutes of sunlight for natural Vitamin D synthesis.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'water',
    'title': 'Su İçme Hedefi',
    'description': 'Günde en az 2-3 litre su iç. Metabolizma ve büyüme için şart.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '💧',
    'musclesTargeted': [],
    'scientificBasis': 'Hydration is essential for nutrient transport to growth plates and joint cartilage health',
    'formDescription': 'Drink water consistently throughout the day. Carry a water bottle and set hourly reminders.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'avoid_junk',
    'title': 'Zararlı Gıdalardan Kaçın',
    'description': 'Fast food, şekerli içecekler ve işlenmiş gıdalardan uzak dur.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🚫',
    'musclesTargeted': [],
    'scientificBasis': 'Processed foods and sugar cause inflammation and insulin spikes that suppress growth hormone secretion',
    'formDescription': 'Replace fast food with whole foods. Swap sugary drinks for water. Read labels and avoid processed ingredients.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  // ── New Nutrition Routines ──
  {
    'id': 'zinc_intake',
    'title': 'Zinc Rich Foods',
    'description': 'Consume zinc-rich foods throughout the day for growth hormone production.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🥩',
    'musclesTargeted': [],
    'scientificBasis': 'Zinc is essential for growth hormone production',
    'formDescription': 'Include red meat, pumpkin seeds, chickpeas, cashews, and oysters in your diet. Aim for 8-11mg daily.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'vitamin_d_sunlight',
    'title': 'Vitamin D & Sunlight',
    'description': 'Get at least 15 minutes of direct sunlight for Vitamin D synthesis and bone growth.',
    'category': 'nutrition',
    'duration': '15 dk',
    'icon': '☀️',
    'musclesTargeted': ['bones'],
    'scientificBasis': 'Vitamin D is crucial for calcium absorption and bone growth',
    'formDescription': 'Expose arms and face to direct sunlight for 15 minutes, preferably before noon. No sunscreen needed for this duration.',
    'setsReps': '',
    'timerSeconds': 900,
    'difficulty': 'beginner',
  },
  {
    'id': 'arginine_foods',
    'title': 'Arginine Rich Foods',
    'description': 'Eat arginine-rich foods to stimulate growth hormone secretion.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🥜',
    'musclesTargeted': [],
    'scientificBasis': 'L-Arginine stimulates growth hormone secretion',
    'formDescription': 'Include nuts, seeds, turkey, chicken, soybeans, and dairy in your meals. Best consumed before sleep.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  // ── Existing Sleep Routines ──
  {
    'id': 'quality_sleep',
    'title': 'Kaliteli Uyku (8-10 saat)',
    'description': 'Büyüme hormonu uyku sırasında salgılanır. 22:00-06:00 arası altın saatler.',
    'category': 'sleep',
    'duration': '8-10 saat',
    'icon': '😴',
    'musclesTargeted': [],
    'scientificBasis': '70-80% of daily growth hormone is released during deep sleep stages, especially between 10 PM and 2 AM. (Endocrine Reviews, 1991)',
    'formDescription': 'Go to bed by 10 PM. Keep the room dark and cool. Avoid caffeine after 2 PM.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'no_screen',
    'title': 'Yatmadan Önce Ekran Molası',
    'description': 'Yatmadan 1 saat önce telefon ve bilgisayarı bırak. Melatonin üretimini engelleme.',
    'category': 'sleep',
    'duration': '1 saat',
    'icon': '📵',
    'musclesTargeted': [],
    'scientificBasis': 'Blue light from screens suppresses melatonin production, delaying sleep onset and reducing deep sleep quality. (PNAS, 2014)',
    'formDescription': 'Set an alarm 1 hour before bedtime. Put all screens away. Read a book or do gentle stretching instead.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  // ── New Sleep Routines ──
  {
    'id': 'sleep_environment',
    'title': 'Optimize Sleep Environment',
    'description': 'Create a dark, cool sleeping environment to maximize melatonin and growth hormone release.',
    'category': 'sleep',
    'duration': 'Gece',
    'icon': '🌙',
    'musclesTargeted': [],
    'scientificBasis': 'Dark, cool environment maximizes melatonin and growth hormone',
    'formDescription': 'Use blackout curtains, keep room at 18-20C, remove all light sources. Use a comfortable mattress and pillow.',
    'setsReps': '',
    'difficulty': 'beginner',
  },
  {
    'id': 'pre_sleep_routine',
    'title': 'Pre-Sleep Wind Down',
    'description': 'A consistent pre-sleep routine improves deep sleep quality by 23%.',
    'category': 'sleep',
    'duration': '30 dk',
    'icon': '📖',
    'musclesTargeted': [],
    'scientificBasis': 'Consistent pre-sleep routine improves deep sleep quality by 23%',
    'formDescription': 'Start 30 minutes before bed: dim lights, read a book, do breathing exercises, avoid stimulating activities.',
    'setsReps': '',
    'timerSeconds': 1800,
    'difficulty': 'beginner',
  },
  // ── Existing Posture Routines ──
  {
    'id': 'posture_check',
    'title': 'Duruş Kontrolü',
    'description': 'Sırtını dik tut, omuzlarını geri çek. Saatte bir kontrol et. Doğru duruş = 2-3 cm fark.',
    'category': 'posture',
    'duration': 'Gün boyu',
    'icon': '🧍',
    'musclesTargeted': ['spine', 'core', 'shoulders'],
    'scientificBasis': 'Correct posture alignment can improve apparent height by 2-3 cm and prevents spinal compression over time. (Physical Therapy Reviews, 2019)',
    'formDescription': 'Stand tall with shoulders back and down. Engage core slightly. Imagine a string pulling you up from the crown of your head.',
    'setsReps': 'Check every hour',
    'difficulty': 'beginner',
  },
  {
    'id': 'wall_stand',
    'title': 'Duvara Yaslanma Egzersizi',
    'description': 'Sırtını duvara yasla: topuklar, kalça, omuz, baş duvara değsin. 5 dk tut.',
    'category': 'posture',
    'duration': '5 dk',
    'icon': '🏛️',
    'musclesTargeted': ['spine', 'back', 'shoulders'],
    'scientificBasis': 'Wall stands train postural muscle memory, helping maintain proper spinal alignment throughout the day',
    'formDescription': 'Stand with heels, buttocks, shoulder blades, and head touching the wall. Hold for 5 minutes. Breathe normally.',
    'setsReps': '5 min hold',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
  // ── New Posture Routines ──
  {
    'id': 'neck_stretches',
    'title': 'Neck Stretches',
    'description': 'Neck stretches relieve compression and improve cervical alignment.',
    'category': 'posture',
    'duration': '5 dk',
    'icon': '🦒',
    'musclesTargeted': ['neck', 'upper_spine'],
    'scientificBasis': 'Neck stretches relieve compression and improve cervical alignment',
    'formDescription': 'Tilt head slowly to each side, forward, and backward. Hold each direction for 30 seconds. Do not force the stretch.',
    'setsReps': '3 directions x 30s hold',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
  {
    'id': 'shoulder_rolls',
    'title': 'Shoulder Rolls & Opens',
    'description': 'Opening shoulders corrects forward posture, can add 1-2cm in appearance.',
    'category': 'posture',
    'duration': '5 dk',
    'icon': '🔄',
    'musclesTargeted': ['shoulders', 'upper_back'],
    'scientificBasis': 'Opening shoulders corrects forward posture, can add 1-2cm appearance',
    'formDescription': 'Roll shoulders forward 15 times, then backward 15 times. Follow with chest-opening stretches holding for 20 seconds.',
    'setsReps': '3x15 each direction',
    'timerSeconds': 300,
    'difficulty': 'beginner',
  },
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
  // Seri
  {'id': 'first_day', 'title': 'İlk Adım', 'description': 'İlk gününü tamamla', 'icon': '🌟', 'type': 'streak', 'value': 1},
  {'id': 'three_streak', 'title': '3 Gün Seri', 'description': '3 gün üst üste rutinleri tamamla', 'icon': '✊', 'type': 'streak', 'value': 3},
  {'id': 'week_streak', 'title': '7 Gün Seri', 'description': '7 gün üst üste rutinleri tamamla', 'icon': '🔥', 'type': 'streak', 'value': 7},
  {'id': 'two_week_streak', 'title': '14 Gün Seri', 'description': '14 gün üst üste devam et', 'icon': '⚡', 'type': 'streak', 'value': 14},
  {'id': 'month_streak', 'title': '30 Gün Seri', 'description': '30 gün üst üste tamamla', 'icon': '💎', 'type': 'streak', 'value': 30},
  {'id': 'two_month_streak', 'title': '60 Gün Seri', 'description': '60 gün üst üste tamamla', 'icon': '👑', 'type': 'streak', 'value': 60},
  {'id': 'hundred_streak', 'title': '100 Gün Seri', 'description': '100 gün üst üste tamamla', 'icon': '🏆', 'type': 'streak', 'value': 100},
  // Ölçüm
  {'id': 'first_measure', 'title': 'İlk Ölçüm', 'description': 'İlk boy ölçümünü kaydet', 'icon': '📐', 'type': 'measures', 'value': 1},
  {'id': 'three_measures', 'title': 'Takipçi', 'description': '3 boy ölçümü kaydet', 'icon': '📋', 'type': 'measures', 'value': 3},
  {'id': 'five_measures', 'title': 'Düzenli Takip', 'description': '5 boy ölçümü kaydet', 'icon': '📊', 'type': 'measures', 'value': 5},
  {'id': 'ten_measures', 'title': 'Veri Avcısı', 'description': '10 boy ölçümü kaydet', 'icon': '📈', 'type': 'measures', 'value': 10},
  // Büyüme
  {'id': 'first_cm', 'title': 'İlk Santim', 'description': 'Toplam 1 cm uzama kaydet', 'icon': '📏', 'type': 'growth', 'value': 1},
  {'id': 'three_cm', 'title': '3 cm Büyüme', 'description': 'Toplam 3 cm uzama kaydet', 'icon': '🌱', 'type': 'growth', 'value': 3},
  {'id': 'five_cm', 'title': '5 cm Büyüme', 'description': 'Toplam 5 cm uzama kaydet', 'icon': '🚀', 'type': 'growth', 'value': 5},
  {'id': 'ten_cm', 'title': '10 cm Büyüme', 'description': 'Toplam 10 cm uzama kaydet', 'icon': '🗼', 'type': 'growth', 'value': 10},
];

/// XP rewards for actions
const xpRewards = {
  'routine_complete': 5,
  'all_routines_done': 25,
  'height_logged': 15,
  'streak_day': 10,  // multiplied by streak count
  'challenge_complete': 50,
  'water_goal': 10,
  'sleep_goal': 10,
  'first_login_today': 5,
};

/// Level thresholds
const levelThresholds = [
  0,     // Level 1
  100,   // Level 2
  250,   // Level 3
  500,   // Level 4
  850,   // Level 5
  1300,  // Level 6
  1900,  // Level 7
  2700,  // Level 8
  3700,  // Level 9
  5000,  // Level 10
  6500,  // Level 11
  8500,  // Level 12
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
  'Beginner',       // 1
  'Starter',        // 2
  'Committed',      // 3
  'Dedicated',      // 4
  'Consistent',     // 5
  'Focused',        // 6
  'Determined',     // 7
  'Disciplined',    // 8
  'Strong',         // 9
  'Advanced',       // 10
  'Expert',         // 11
  'Master',         // 12
  'Elite',          // 13
  'Champion',       // 14
  'Legend',         // 15
  'Titan',          // 16
  'Mythic',         // 17
  'Immortal',       // 18
  'Transcendent',   // 19
  'Ultimate',       // 20
];

/// Challenge templates
const challengeTemplates = [
  // Daily challenges
  {'id': 'daily_all_routines', 'type': 'daily', 'title': 'Complete All Routines', 'description': 'Finish every routine today', 'target': 1, 'xpReward': 30, 'icon': '🔥'},
  {'id': 'daily_water', 'type': 'daily', 'title': 'Hydration Hero', 'description': 'Reach your daily water goal', 'target': 1, 'xpReward': 20, 'icon': '💧'},
  {'id': 'daily_sleep_early', 'type': 'daily', 'title': 'Early Sleeper', 'description': 'Log 8+ hours of sleep', 'target': 8, 'xpReward': 20, 'icon': '😴'},
  {'id': 'daily_exercise_3', 'type': 'daily', 'title': 'Exercise Trio', 'description': 'Complete 3 exercise routines', 'target': 3, 'xpReward': 25, 'icon': '💪'},
  {'id': 'daily_stretch', 'type': 'daily', 'title': 'Morning Stretch', 'description': 'Do morning stretching before 9 AM', 'target': 1, 'xpReward': 15, 'icon': '🌅'},
  // Weekly challenges
  {'id': 'weekly_streak_7', 'type': 'weekly', 'title': '7-Day Warrior', 'description': 'Complete all routines for 7 consecutive days', 'target': 7, 'xpReward': 100, 'icon': '⚡'},
  {'id': 'weekly_measure', 'type': 'weekly', 'title': 'Growth Tracker', 'description': 'Log a height measurement this week', 'target': 1, 'xpReward': 30, 'icon': '📏'},
  {'id': 'weekly_water_5', 'type': 'weekly', 'title': 'Hydration Week', 'description': 'Hit water goal 5 days this week', 'target': 5, 'xpReward': 60, 'icon': '🌊'},
  {'id': 'weekly_exercise_15', 'type': 'weekly', 'title': 'Fitness Champion', 'description': 'Complete 15 exercise routines this week', 'target': 15, 'xpReward': 80, 'icon': '🏆'},
  {'id': 'weekly_sleep_5', 'type': 'weekly', 'title': 'Sleep Master', 'description': 'Log 8+ hours of sleep for 5 days', 'target': 5, 'xpReward': 60, 'icon': '🌙'},
];
