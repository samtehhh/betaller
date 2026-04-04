import 'dart:ui';
import 'dart:math' as math;

import '../models/user_profile.dart';
import '../models/height_record.dart';
import 'constants.dart';

class Calculations {
  // ── Temel Hesaplamalar ──────────────────────────────────────────

  static double geneticPotentialHeight(UserProfile profile) {
    if (profile.gender == 'male') {
      return (profile.motherHeight + profile.fatherHeight + 13) / 2;
    } else {
      return (profile.motherHeight + profile.fatherHeight - 13) / 2;
    }
  }

  static double calculateBMI(double heightCm, double weightKg) {
    final heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
  }

  static String bmiCategory(double bmi) {
    if (bmi < 18.5) return 'underweight';
    if (bmi < 25) return 'normal';
    if (bmi < 30) return 'overweight';
    return 'obese';
  }

  static Color bmiColor(double bmi) {
    if (bmi < 18.5) return const Color(0xFFFBBF24);
    if (bmi < 25) return const Color(0xFF4ADE80);
    if (bmi < 30) return const Color(0xFFFBBF24);
    return const Color(0xFFFF6B6B);
  }

  static double dailyWaterNeed(double weightKg) {
    return double.parse((weightKg * 0.033).toStringAsFixed(1));
  }

  static double dailySleepNeed(int age) {
    if (age <= 12) return 10;
    if (age <= 15) return 9;
    if (age <= 18) return 8.5;
    return 8;
  }

  static double growthPercentage(int age, String gender) {
    if (age < 8) return gender == 'male' ? 70.0 : 74.0;
    if (age > 20) return 100.0;
    return growthPercentageByAge[age]?[gender] ?? 100.0;
  }

  static double remainingGrowthCm(UserProfile profile) {
    final potential = geneticPotentialHeight(profile);
    final remaining = potential - profile.currentHeight;
    return remaining > 0 ? double.parse(remaining.toStringAsFixed(1)) : 0;
  }

  static int dailyCalorieNeed(UserProfile profile) {
    double bmr;
    if (profile.gender == 'male') {
      bmr =
          88.362 +
          (13.397 * profile.weight) +
          (4.799 * profile.currentHeight) -
          (5.677 * profile.age);
    } else {
      bmr =
          447.593 +
          (9.247 * profile.weight) +
          (3.098 * profile.currentHeight) -
          (4.330 * profile.age);
    }
    return (bmr * 1.55).round();
  }

  static double dailyProteinNeed(double weightKg) {
    return double.parse((weightKg * 1.5).toStringAsFixed(0));
  }

  // ── Gelişmiş Tahmin Sistemi ─────────────────────────────────────

  /// Büyüme hızı (cm/yıl) - son ölçümlere göre
  static double? growthVelocity(List<HeightRecord> records) {
    if (records.length < 2) return null;
    final first = records.first;
    final last = records.last;
    final firstDate = DateTime.tryParse(first.date);
    final lastDate = DateTime.tryParse(last.date);
    if (firstDate == null || lastDate == null) return null;
    final days = lastDate.difference(firstDate).inDays;
    if (days < 30) return null; // En az 1 ay veri lazım (kısa aralık abartılı sonuç veriyor)
    final heightDiff = last.height - first.height;
    final velocity = (heightDiff / days) * 365; // cm/yıl
    // Negatif veya mantıksız yüksek değerleri sınırla
    return velocity.clamp(0.0, 15.0);
  }

  /// Büyüme hızı değerlendirmesi
  static String growthVelocityRating(double velocity, int age, String gender) {
    final avgVelocity = _averageGrowthVelocity(age, gender);
    if (velocity >= avgVelocity * 0.9) return 'excellent';
    if (velocity >= avgVelocity * 0.6) return 'normal';
    if (velocity >= avgVelocity * 0.3) return 'slow';
    return 'very_low';
  }

  /// Yaşa uygun gerçekçi mock büyüme hızı (ortalamanın biraz üstü)
  static double mockVelocity(int age, String gender) {
    return _averageGrowthVelocity(age, gender) * 0.95;
  }

  static double _averageGrowthVelocity(int age, String gender) {
    if (gender == 'male') {
      if (age <= 10) return 5.5;
      if (age <= 12) return 6.0;
      if (age <= 14) return 8.5; // Ergenlik hızlanması
      if (age <= 16) return 6.0;
      if (age <= 18) return 3.0;
      return 1.0;
    } else {
      if (age <= 9) return 5.5;
      if (age <= 11) return 7.5; // Ergenlik hızlanması
      if (age <= 13) return 6.0;
      if (age <= 15) return 3.0;
      if (age <= 17) return 1.5;
      return 0.5;
    }
  }

  /// Çok faktörlü boy tahmini (21 yaşında)
  static PredictionResult predictFinalHeight(
    UserProfile profile,
    List<HeightRecord> records,
  ) {
    final geneticPotential = geneticPotentialHeight(profile);
    final velocity = growthVelocity(records);
    final growthPct = growthPercentage(profile.age, profile.gender);
    final bmi = calculateBMI(profile.currentHeight, profile.weight);

    // 1. Genetik tahmin (Khamis-Roche)
    double geneticEstimate = geneticPotential;

    // 2. Büyüme hızı bazlı tahmin
    double velocityEstimate = geneticPotential;
    if (velocity != null && profile.age < 20) {
      double projected = profile.currentHeight;
      for (int futureAge = profile.age + 1; futureAge <= 21; futureAge++) {
        final yearlyGrowth = _averageGrowthVelocity(futureAge, profile.gender);
        // Mevcut büyüme hızını ortalama ile karşılaştır
        final avgVelocity = _averageGrowthVelocity(profile.age, profile.gender);
        final velocityFactor = avgVelocity > 0
            ? (velocity / avgVelocity).clamp(0.5, 1.8)
            : 1.0;
        projected += yearlyGrowth * velocityFactor;
      }
      velocityEstimate = projected;
    }

    // 3. Yüzdelik bazlı tahmin
    double percentileEstimate = geneticPotential;
    if (growthPct > 0 && growthPct < 100) {
      percentileEstimate = profile.currentHeight / (growthPct / 100);
    }

    // 4. BMI düzeltmesi
    double bmiAdjustment = 0;
    if (bmi < 16) {
      bmiAdjustment = -1.5; // Aşırı zayıf: potansiyeli düşürür
    } else if (bmi < 18.5)
      bmiAdjustment = -0.5;
    else if (bmi > 28)
      bmiAdjustment = -1.0; // Obezite erken kapanma riski
    else if (bmi > 25)
      bmiAdjustment = -0.5;

    // Ağırlıklı ortalama
    double finalEstimate;
    final bool geneticBelowCurrent = geneticEstimate < profile.currentHeight;

    // Genetik potansiyeli aşmış kişiler için aralık (postür + egzersiz)
    double? bonusMin;
    double? bonusMax;

    if (geneticBelowCurrent) {
      if (profile.age <= 14) {
        bonusMin = 3.5; bonusMax = 4.5;
      } else if (profile.age <= 16) {
        bonusMin = 3.0; bonusMax = 4.0;
      } else if (profile.age <= 18) {
        bonusMin = 2.5; bonusMax = 3.5;
      } else if (profile.age <= 20) {
        bonusMin = 2.0; bonusMax = 3.0;
      } else {
        bonusMin = 2.0; bonusMax = 2.5;
      }
      // Aralığın ortasını ana tahmin olarak kullan
      finalEstimate = profile.currentHeight + (bonusMin + bonusMax) / 2;
    } else if (velocity != null && records.length >= 3) {
      finalEstimate =
          geneticEstimate * 0.30 +
          velocityEstimate * 0.40 +
          percentileEstimate * 0.30;
    } else {
      finalEstimate = geneticEstimate * 0.50 + percentileEstimate * 0.50;
    }

    finalEstimate += bmiAdjustment;

    // Son güvenlik: tahmin asla mevcut boydan düşük olamaz
    if (finalEstimate < profile.currentHeight) {
      finalEstimate = profile.currentHeight;
    }

    // Güven aralığı
    final confidence = _calculateConfidence(records, profile.age);
    final margin = (100 - confidence) * 0.08; // Düşük güven = geniş aralık

    // Yıllık tahmin
    final yearlyPredictions = <int, double>{};
    if (profile.age < 21) {
      double current = profile.currentHeight;
      final totalRemaining = finalEstimate - current;
      final yearsRemaining = 21 - profile.age;
      for (int age = profile.age + 1; age <= 21; age++) {
        final yearVelocity = _averageGrowthVelocity(age, profile.gender);
        final totalAvgVelocity = List.generate(
          yearsRemaining,
          (i) => _averageGrowthVelocity(profile.age + 1 + i, profile.gender),
        ).fold(0.0, (a, b) => a + b);
        final proportion = totalAvgVelocity > 0
            ? yearVelocity / totalAvgVelocity
            : 1.0 / yearsRemaining;
        current += totalRemaining * proportion;
        yearlyPredictions[age] = double.parse(current.toStringAsFixed(1));
      }
    }

    // Genetik aşılmışsa min/max bonus aralığından, değilse güven aralığından
    final double resultMin = bonusMin != null
        ? profile.currentHeight + bonusMin
        : math.max(finalEstimate - margin, profile.currentHeight);
    final double resultMax = bonusMax != null
        ? profile.currentHeight + bonusMax
        : finalEstimate + margin;

    return PredictionResult(
      finalHeight: double.parse(finalEstimate.toStringAsFixed(1)),
      minHeight: double.parse(resultMin.toStringAsFixed(1)),
      maxHeight: double.parse(resultMax.toStringAsFixed(1)),
      confidence: confidence.round(),
      yearlyPredictions: yearlyPredictions,
      geneticEstimate: double.parse(geneticEstimate.toStringAsFixed(1)),
      velocityEstimate: velocity != null
          ? double.parse(velocityEstimate.toStringAsFixed(1))
          : null,
    );
  }

  static double _calculateConfidence(List<HeightRecord> records, int age) {
    double confidence = 50; // Temel güven
    if (records.length >= 2) confidence += 10;
    if (records.length >= 5) confidence += 10;
    if (records.length >= 10) confidence += 10;
    if (age >= 16) confidence += 10; // Daha az büyüme = daha kesin
    if (age >= 18) confidence += 10;
    return confidence.clamp(30, 95);
  }

  // ── GlowUp Skor Sistemi ────────────────────────────────────────

  static GlowUpScore calculateGlowUpScore({
    required UserProfile profile,
    required List<HeightRecord> records,
    required double routineProgress,
    required double waterProgress,
    required double sleepHours,
    required int streak,
  }) {
    // 1. Genetik Skor (0-100)
    final geneticPotential = geneticPotentialHeight(profile);
    final geneticProgress = geneticPotential > 0
        ? (profile.currentHeight / geneticPotential * 100).clamp(0, 100)
        : 50.0;
    // Genetik potansiyele yakınlık skoru
    final geneticScore = (geneticProgress * 0.6 + 40).clamp(0, 100).round();

    // 2. Büyüme Hızı Skoru (0-100)
    int velocityScore = 50;
    final velocity = growthVelocity(records);
    if (velocity != null) {
      final avgV = _averageGrowthVelocity(profile.age, profile.gender);
      if (avgV > 0) {
        final ratio = velocity / avgV;
        velocityScore = (ratio * 70 + 15).clamp(0, 100).round();
      }
    }

    // 3. Beslenme Skoru (0-100)
    final bmi = calculateBMI(profile.currentHeight, profile.weight);
    int nutritionScore = 50;
    if (bmi >= 18.5 && bmi < 25) {
      nutritionScore = 90;
    } else if (bmi >= 17 && bmi < 27)
      nutritionScore = 70;
    else if (bmi >= 15 && bmi < 30)
      nutritionScore = 50;
    else
      nutritionScore = 30;
    // Su takibi bonusu
    nutritionScore = ((nutritionScore * 0.7) + (waterProgress.clamp(0, 1) * 30))
        .round();

    // 4. Uyku Skoru (0-100)
    final sleepNeed = dailySleepNeed(profile.age);
    final sleepRatio = sleepHours > 0
        ? (sleepHours / sleepNeed).clamp(0, 1.2)
        : 0.0;
    final sleepScore = (sleepRatio * 85 + 5).clamp(0, 100).round();

    // 5. Disiplin Skoru (0-100)
    final disciplineScore = math.min(
      100,
      (routineProgress * 60 + streak * 2 + 10).round(),
    );

    // Toplam GlowUp Skoru (ağırlıklı ortalama)
    final totalScore =
        (geneticScore * 0.25 +
                velocityScore * 0.25 +
                nutritionScore * 0.20 +
                sleepScore * 0.15 +
                disciplineScore * 0.15)
            .round()
            .clamp(0, 100);

    return GlowUpScore(
      total: totalScore,
      genetic: geneticScore,
      velocity: velocityScore,
      nutrition: nutritionScore,
      sleep: sleepScore,
      discipline: disciplineScore,
      grade: _scoreToGrade(totalScore),
      summary: _scoreSummary(totalScore),
    );
  }

  static String _scoreToGrade(int score) {
    if (score >= 90) return 'S';
    if (score >= 80) return 'A';
    if (score >= 70) return 'B';
    if (score >= 60) return 'C';
    if (score >= 50) return 'D';
    return 'F';
  }

  static String _scoreSummary(int score) {
    if (score >= 90) return 'score_s';
    if (score >= 80) return 'score_a';
    if (score >= 70) return 'score_b';
    if (score >= 60) return 'score_c';
    if (score >= 50) return 'score_d';
    return 'score_f';
  }
}

// ── Veri Modelleri ────────────────────────────────────────────────

class PredictionResult {
  final double finalHeight;
  final double minHeight;
  final double maxHeight;
  final int confidence;
  final Map<int, double> yearlyPredictions;
  final double geneticEstimate;
  final double? velocityEstimate;

  PredictionResult({
    required this.finalHeight,
    required this.minHeight,
    required this.maxHeight,
    required this.confidence,
    required this.yearlyPredictions,
    required this.geneticEstimate,
    this.velocityEstimate,
  });
}

class GlowUpScore {
  final int total;
  final int genetic;
  final int velocity;
  final int nutrition;
  final int sleep;
  final int discipline;
  final String grade;
  final String summary;

  GlowUpScore({
    required this.total,
    required this.genetic,
    required this.velocity,
    required this.nutrition,
    required this.sleep,
    required this.discipline,
    required this.grade,
    required this.summary,
  });
}
