import 'dart:ui';

import '../models/user_profile.dart';
import 'constants.dart';

class Calculations {
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
    if (bmi < 18.5) return 'Zayıf';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Kilolu';
    return 'Obez';
  }

  static Color bmiColor(double bmi) {
    if (bmi < 18.5) return const Color(0xFFFBBF24);
    if (bmi < 25) return const Color(0xFF34D399);
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
      bmr = 88.362 +
          (13.397 * profile.weight) +
          (4.799 * profile.currentHeight) -
          (5.677 * profile.age);
    } else {
      bmr = 447.593 +
          (9.247 * profile.weight) +
          (3.098 * profile.currentHeight) -
          (4.330 * profile.age);
    }
    return (bmr * 1.55).round();
  }

  static double dailyProteinNeed(double weightKg) {
    return double.parse((weightKg * 1.5).toStringAsFixed(0));
  }
}
