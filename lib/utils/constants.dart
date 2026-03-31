import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ── Premium Dark Theme Design Tokens ──────────────────────────────

class AppColors {
  AppColors._();

  // Core backgrounds
  static const scaffold = Color(0xFF0A0A14);
  static const surfaceDark = Color(0xFF12121E);

  // Glass card fills - more visible like U Max
  static final cardFill = Colors.white.withValues(alpha: 0.11);
  static final cardFillHover = Colors.white.withValues(alpha: 0.16);
  static final cardBorder = Colors.white.withValues(alpha: 0.16);
  static final cardBorderLight = Colors.white.withValues(alpha: 0.24);

  // Primary accent - MORE VIBRANT purple like U Max
  static const primary = Color(0xFFA78BFA);
  static const primaryLight = Color(0xFFC4B5FD);
  static const primaryDark = Color(0xFF7C3AED);
  static const primaryBright = Color(0xFFB794F6);

  // Secondary accents - more saturated
  static const cyan = Color(0xFF22D3EE);
  static const orange = Color(0xFFFF8A4C);
  static const pink = Color(0xFFFF5CAD);
  static const lime = Color(0xFF4ADE80);

  // Semantic
  static const success = Color(0xFF4ADE80);
  static const error = Color(0xFFFF5C5C);
  static const warning = Color(0xFFFBBF24);

  // Text hierarchy - U Max level brightness
  static const textPrimary = Color(0xFFFFFFFF);
  static final textSecondary = Colors.white.withValues(alpha: 0.82);
  static final textTertiary = Colors.white.withValues(alpha: 0.62);

  // Category palette - more vibrant
  static const exerciseColor = Color(0xFFA78BFA);
  static const nutritionColor = Color(0xFFFF8A4C);
  static const sleepColor = Color(0xFF818CF8);
  static const postureColor = Color(0xFFFF5CAD);

  // Water & Sleep
  static const water = Color(0xFF60A5FA);
  static const sleep = Color(0xFF818CF8);

  // Gradients
  static const gradientPrimary = LinearGradient(
    colors: [Color(0xFFA78BFA), Color(0xFF7C3AED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientHeader = LinearGradient(
    colors: [Color(0xFF1A1A3E), Color(0xFF0A0A14)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientAccent = LinearGradient(
    colors: [Color(0xFFFF8A4C), Color(0xFFFF5C5C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientCyan = LinearGradient(
    colors: [Color(0xFF22D3EE), Color(0xFFA78BFA)],
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

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 20,
    this.fillColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: fillColor ?? AppColors.cardFill,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? AppColors.cardBorder,
          width: 0.5,
        ),
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
  {
    'id': 'morning_stretch',
    'title': 'Sabah Germe Egzersizi',
    'description': 'Uyanır uyanmaz 10 dakika germe hareketleri yap. Omurga ve bacak kaslarını esnet.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '🌅',
  },
  {
    'id': 'bar_hanging',
    'title': 'Barfiks Barına Asılma',
    'description': 'Barfiks barına asılarak omurgayı uzat. 3 set x 30 saniye tut.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '💪',
  },
  {
    'id': 'cobra_stretch',
    'title': 'Kobra Germe',
    'description': 'Yüzüstü yatıp üst vücudu yukarı kaldır. Omurgayı esnet. 3 set x 15 saniye.',
    'category': 'exercise',
    'duration': '5 dk',
    'icon': '🐍',
  },
  {
    'id': 'jumping',
    'title': 'Zıplama Egzersizleri',
    'description': 'İp atlama veya squat jump. Büyüme plakalarını uyarır. 3 set x 20 tekrar.',
    'category': 'exercise',
    'duration': '10 dk',
    'icon': '🦘',
  },
  {
    'id': 'swimming_basketball',
    'title': 'Yüzme veya Basketbol',
    'description': 'Boy uzamasını destekleyen sporlardan birini yap. En az 30 dakika.',
    'category': 'exercise',
    'duration': '30 dk',
    'icon': '🏀',
  },
  {
    'id': 'evening_yoga',
    'title': 'Akşam Yoga & Esneme',
    'description': 'Yatmadan önce yoga ve esneme rutini. Günün stresini at, kasları gevşet.',
    'category': 'exercise',
    'duration': '15 dk',
    'icon': '🧘',
  },
  {
    'id': 'protein',
    'title': 'Protein Alımı',
    'description': 'Yumurta, tavuk, balık, süt ürünleri. Günde en az 1.5g/kg protein al.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🥚',
  },
  {
    'id': 'calcium_vitamin_d',
    'title': 'Kalsiyum & D Vitamini',
    'description': 'Süt, peynir, yoğurt tüket. 15 dk güneşlen. Kemik gelişimi için kritik.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🥛',
  },
  {
    'id': 'water',
    'title': 'Su İçme Hedefi',
    'description': 'Günde en az 2-3 litre su iç. Metabolizma ve büyüme için şart.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '💧',
  },
  {
    'id': 'avoid_junk',
    'title': 'Zararlı Gıdalardan Kaçın',
    'description': 'Fast food, şekerli içecekler ve işlenmiş gıdalardan uzak dur.',
    'category': 'nutrition',
    'duration': 'Gün boyu',
    'icon': '🚫',
  },
  {
    'id': 'quality_sleep',
    'title': 'Kaliteli Uyku (8-10 saat)',
    'description': 'Büyüme hormonu uyku sırasında salgılanır. 22:00-06:00 arası altın saatler.',
    'category': 'sleep',
    'duration': '8-10 saat',
    'icon': '😴',
  },
  {
    'id': 'no_screen',
    'title': 'Yatmadan Önce Ekran Molası',
    'description': 'Yatmadan 1 saat önce telefon ve bilgisayarı bırak. Melatonin üretimini engelleme.',
    'category': 'sleep',
    'duration': '1 saat',
    'icon': '📵',
  },
  {
    'id': 'posture_check',
    'title': 'Duruş Kontrolü',
    'description': 'Sırtını dik tut, omuzlarını geri çek. Saatte bir kontrol et. Doğru duruş = 2-3 cm fark.',
    'category': 'posture',
    'duration': 'Gün boyu',
    'icon': '🧍',
  },
  {
    'id': 'wall_stand',
    'title': 'Duvara Yaslanma Egzersizi',
    'description': 'Sırtını duvara yasla: topuklar, kalça, omuz, baş duvara değsin. 5 dk tut.',
    'category': 'posture',
    'duration': '5 dk',
    'icon': '🏛️',
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
  {'id': 'first_day', 'title': 'İlk Adım', 'description': 'İlk gününü tamamla', 'icon': '🌟', 'type': 'streak', 'value': 1},
  {'id': 'week_streak', 'title': '7 Gün Seri', 'description': '7 gün üst üste rutinleri tamamla', 'icon': '🔥', 'type': 'streak', 'value': 7},
  {'id': 'two_week_streak', 'title': '14 Gün Seri', 'description': '14 gün üst üste devam et', 'icon': '⚡', 'type': 'streak', 'value': 14},
  {'id': 'month_streak', 'title': '30 Gün Seri', 'description': '30 gün üst üste tamamla', 'icon': '💎', 'type': 'streak', 'value': 30},
  {'id': 'first_measure', 'title': 'İlk Ölçüm', 'description': 'İlk boy ölçümünü kaydet', 'icon': '📐', 'type': 'measures', 'value': 1},
  {'id': 'five_measures', 'title': 'Düzenli Takip', 'description': '5 boy ölçümü kaydet', 'icon': '📊', 'type': 'measures', 'value': 5},
  {'id': 'ten_measures', 'title': 'Veri Avcısı', 'description': '10 boy ölçümü kaydet', 'icon': '📈', 'type': 'measures', 'value': 10},
  {'id': 'first_cm', 'title': 'İlk Santim', 'description': 'Toplam 1 cm uzama kaydet', 'icon': '📏', 'type': 'growth', 'value': 1},
  {'id': 'three_cm', 'title': '3 cm Büyüme', 'description': 'Toplam 3 cm uzama kaydet', 'icon': '🌱', 'type': 'growth', 'value': 3},
  {'id': 'five_cm', 'title': '5 cm Büyüme', 'description': 'Toplam 5 cm uzama kaydet', 'icon': '🚀', 'type': 'growth', 'value': 5},
];
