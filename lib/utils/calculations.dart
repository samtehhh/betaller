import 'dart:ui';
import 'dart:math' as math;

import '../models/user_profile.dart';
import '../models/height_record.dart';
import 'constants.dart';
import 'growth_data.dart';

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

  // ── WHO Percentile & Growth Plate Analysis ─────────────────────

  /// Returns which WHO percentile the user falls into based on height, age, gender.
  /// Returns the closest percentile from: 3, 5, 10, 25, 50, 75, 90, 95, 97.
  static int calculatePercentile(double height, int age, String gender) {
    final genderData = whoHeightPercentiles[gender];
    if (genderData == null) return 50;
    final clampedAge = age.clamp(2, 20);
    final ageData = genderData[clampedAge];
    if (ageData == null) return 50;

    const percentiles = [3, 5, 10, 25, 50, 75, 90, 95, 97];

    // If below the lowest percentile
    if (height <= ageData[3]!) return 3;
    // If above the highest percentile
    if (height >= ageData[97]!) return 97;

    // Find the closest percentile
    int closest = 50;
    double minDiff = double.infinity;
    for (final p in percentiles) {
      final pHeight = ageData[p]!;
      final diff = (height - pHeight).abs();
      if (diff < minDiff) {
        minDiff = diff;
        closest = p;
      }
    }
    return closest;
  }

  /// Returns growth plate status info for the given age and gender.
  static Map<String, dynamic> growthPlateStatus(int age, String gender) {
    final info = growthPlateInfo[gender] ?? growthPlateInfo['male']!;
    final typicalClosure = info['typicalClosureAge']!;
    final completeClosure = info['completeClosureAge']!;

    String status;
    int remainingYears;
    String description;
    double percentage;

    if (age < typicalClosure) {
      status = 'open';
      remainingYears = completeClosure - age;
      description = 'Growth plates are open. You have significant growth potential remaining.';
      // percentage: how much of the growth window (from age 2 to completeClosure) is used
      final totalWindow = completeClosure - 2;
      final used = (age - 2).clamp(0, totalWindow);
      percentage = (used / totalWindow * 100).clamp(0, 100);
    } else if (age < completeClosure) {
      status = 'closing';
      remainingYears = completeClosure - age;
      description = 'Growth plates are beginning to close. Some growth is still possible.';
      final totalWindow = completeClosure - 2;
      final used = (age - 2).clamp(0, totalWindow);
      percentage = (used / totalWindow * 100).clamp(0, 100);
    } else {
      status = 'closed';
      remainingYears = 0;
      description = 'Growth plates are fully closed. Natural height growth has completed.';
      percentage = 100.0;
    }

    return {
      'status': status,
      'remainingYears': remainingYears,
      'description': description,
      'percentage': double.parse(percentage.toStringAsFixed(1)),
    };
  }

  /// Returns weekly growth trend (cm/week) for the last 4 weeks.
  /// Keys are week labels like 'week1', 'week2', etc. (most recent = highest number).
  static Map<String, double> weeklyTrend(List<HeightRecord> records) {
    final result = <String, double>{};
    if (records.length < 2) return result;

    // Sort records by date ascending
    final sorted = List<HeightRecord>.from(records)
      ..sort((a, b) {
        final da = DateTime.tryParse(a.date);
        final db = DateTime.tryParse(b.date);
        if (da == null || db == null) return 0;
        return da.compareTo(db);
      });

    final now = DateTime.now();
    for (int week = 4; week >= 1; week--) {
      final weekEnd = now.subtract(Duration(days: (week - 1) * 7));
      final weekStart = weekEnd.subtract(const Duration(days: 7));

      // Find records in this week range
      final weekRecords = sorted.where((r) {
        final d = DateTime.tryParse(r.date);
        if (d == null) return false;
        return d.isAfter(weekStart) && !d.isAfter(weekEnd);
      }).toList();

      // Also find the latest record before this week for comparison
      HeightRecord? before;
      for (final r in sorted) {
        final d = DateTime.tryParse(r.date);
        if (d == null) continue;
        if (!d.isAfter(weekStart)) before = r;
      }

      if (weekRecords.isNotEmpty && before != null) {
        final growth = weekRecords.last.height - before.height;
        result['week${5 - week}'] = double.parse(growth.toStringAsFixed(3));
      }
    }
    return result;
  }

  /// Returns monthly growth trend (cm/month) for the last 6 months.
  /// Keys are 'month1' (oldest) through 'month6' (most recent).
  static Map<String, double> monthlyTrend(List<HeightRecord> records) {
    final result = <String, double>{};
    if (records.length < 2) return result;

    // Sort records by date ascending
    final sorted = List<HeightRecord>.from(records)
      ..sort((a, b) {
        final da = DateTime.tryParse(a.date);
        final db = DateTime.tryParse(b.date);
        if (da == null || db == null) return 0;
        return da.compareTo(db);
      });

    final now = DateTime.now();
    for (int month = 6; month >= 1; month--) {
      final monthEnd = DateTime(now.year, now.month - (month - 1), now.day);
      final monthStart = DateTime(now.year, now.month - month, now.day);

      HeightRecord? endRecord;
      HeightRecord? startRecord;

      // Find the closest record to monthEnd and monthStart
      for (final r in sorted) {
        final d = DateTime.tryParse(r.date);
        if (d == null) continue;
        if (!d.isAfter(monthEnd)) endRecord = r;
        if (!d.isAfter(monthStart)) startRecord = r;
      }

      if (endRecord != null && startRecord != null && endRecord != startRecord) {
        final growth = endRecord.height - startRecord.height;
        result['month${7 - month}'] = double.parse(growth.toStringAsFixed(2));
      }
    }
    return result;
  }

  /// Scenario analysis: predicts final height based on different compliance rates.
  /// Returns {'optimistic': height at 100%, 'current': height at given rate, 'pessimistic': height at 0%}.
  static Map<String, double> scenarioAnalysis(
    UserProfile profile,
    List<HeightRecord> records,
    double complianceRate,
  ) {
    final geneticPotential = geneticPotentialHeight(profile);
    final velocity = growthVelocity(records);

    // Base remaining growth from genetic potential
    final baseRemaining = math.max(0.0, geneticPotential - profile.currentHeight);

    // Velocity adjustment: if we have real data, adjust the base prediction
    final velocityFactor = velocity != null
        ? (velocity / math.max(0.1, _averageGrowthVelocity(profile.age, profile.gender))).clamp(0.5, 1.5)
        : 1.0;
    final adjustedRemaining = baseRemaining * velocityFactor;

    // Growth velocity bonus factor: good habits can add up to ~3 cm over years
    const maxBonus = 3.0;

    // At 100% compliance: adjusted remaining growth + max bonus
    final optimistic = profile.currentHeight + adjustedRemaining + maxBonus;

    // At 0% compliance: reduced growth (lose up to 3 cm from poor habits)
    const penalty = 3.0;
    final pessimistic = math.max(
      profile.currentHeight,
      profile.currentHeight + adjustedRemaining - penalty,
    );

    // At given compliance: interpolate between pessimistic and optimistic
    final clampedRate = complianceRate.clamp(0.0, 1.0);
    final current = pessimistic + (optimistic - pessimistic) * clampedRate;

    return {
      'optimistic': double.parse(optimistic.toStringAsFixed(1)),
      'current': double.parse(current.toStringAsFixed(1)),
      'pessimistic': double.parse(pessimistic.toStringAsFixed(1)),
    };
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
