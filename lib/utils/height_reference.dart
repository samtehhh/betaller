import 'dart:math' as math;

/// WHO 2007 Growth Reference — global median height by age & sex
/// Source: WHO Multicentre Growth Reference Study Group (2007)
/// https://www.who.int/tools/growth-reference-data-for-5to19-years
/// Adults (18+): NCD-RisC 2016 pooled global estimates
class HeightReference {
  HeightReference._();

  // ── Median heights (cm) by age ───────────────────────────────────

  static const Map<int, double> _maleMean = {
    5: 110.0, 6: 116.0, 7: 121.7, 8: 127.3, 9: 132.6,
    10: 137.8, 11: 143.5, 12: 149.8, 13: 156.4, 14: 162.4,
    15: 166.4, 16: 169.0, 17: 170.8, 18: 172.0, 19: 173.0,
    20: 174.0, 21: 174.5, 22: 175.0, 23: 175.0, 24: 175.0,
    25: 175.5,
  };

  static const Map<int, double> _femaleMean = {
    5: 109.4, 6: 115.1, 7: 120.8, 8: 126.4, 9: 131.9,
    10: 137.6, 11: 143.8, 12: 149.8, 13: 154.2, 14: 157.3,
    15: 158.9, 16: 160.2, 17: 161.0, 18: 161.3, 19: 161.6,
    20: 161.8, 21: 162.0, 22: 162.0, 23: 162.0, 24: 162.0,
    25: 162.0,
  };

  // ── Population standard deviations (cm) ─────────────────────────

  static const Map<int, double> _maleSd = {
    5: 4.5, 6: 4.8, 7: 5.0, 8: 5.2, 9: 5.4,
    10: 5.7, 11: 6.2, 12: 7.0, 13: 7.5, 14: 7.5,
    15: 7.0, 16: 6.8, 17: 6.7, 18: 6.7, 19: 6.7,
    20: 7.0, 21: 7.0, 22: 7.0, 23: 7.0, 24: 7.0,
    25: 7.0,
  };

  static const Map<int, double> _femaleSd = {
    5: 4.4, 6: 4.7, 7: 4.9, 8: 5.1, 9: 5.3,
    10: 5.8, 11: 6.3, 12: 6.6, 13: 6.5, 14: 6.5,
    15: 6.4, 16: 6.4, 17: 6.4, 18: 6.4, 19: 6.4,
    20: 6.5, 21: 6.5, 22: 6.5, 23: 6.5, 24: 6.5,
    25: 6.5,
  };

  // ── Ethnicity-based adult mean offsets (NCD-RisC 2016, age 18+ cm delta vs global) ──
  // Male offsets from global mean (175.5 cm)
  static const Map<String, double> _maleEthnicityOffset = {
    'white':          2.5,
    'black':          0.5,
    'hispanic':       -2.5,
    'asian':          -4.5,
    'middle_eastern': 0.0,
    'no_answer':      0.0,
  };
  static const Map<String, double> _femaleEthnicityOffset = {
    'white':          2.0,
    'black':          0.5,
    'hispanic':       -2.0,
    'asian':          -3.5,
    'middle_eastern': -0.5,
    'no_answer':      0.0,
  };

  // ── Public API ───────────────────────────────────────────────────

  /// Global median height (cm) for given age and sex.
  static double getMean(int age, bool isMale, {String ethnicity = ''}) {
    final a = age.clamp(5, 25);
    final base = (isMale ? _maleMean : _femaleMean)[a] ?? (isMale ? 175.5 : 162.0);
    // Apply ethnicity offset only for age 16+ (where adult patterns dominate)
    if (age >= 16 && ethnicity.isNotEmpty) {
      final offset = (isMale ? _maleEthnicityOffset : _femaleEthnicityOffset)[ethnicity] ?? 0.0;
      // Scale offset: full at 21+, partial at 16-20
      final scale = age >= 21 ? 1.0 : (age - 15) / 6.0;
      return base + offset * scale;
    }
    return base;
  }

  /// Population standard deviation (cm) for given age and sex.
  static double getSd(int age, bool isMale) {
    final a = age.clamp(5, 25);
    return (isMale ? _maleSd : _femaleSd)[a] ?? (isMale ? 7.0 : 6.5);
  }

  /// Height percentile (0–100) for a given height, age, and sex.
  /// Uses normal distribution approximation.
  static double percentile({
    required double heightCm,
    required int age,
    required bool isMale,
    String ethnicity = '',
  }) {
    final mean = getMean(age, isMale, ethnicity: ethnicity);
    final z = (heightCm - mean) / getSd(age, isMale);
    return (_normCdf(z) * 100).clamp(0.1, 99.9);
  }

  /// Returns standard global reference heights at key percentiles.
  /// Keys: 'p5', 'p25', 'p50', 'p75', 'p95'
  static Map<String, double> referenceHeights(int age, bool isMale, {String ethnicity = ''}) {
    final mean = getMean(age, isMale, ethnicity: ethnicity);
    final sd = getSd(age, isMale);
    // z-scores for standard percentiles (exact values)
    return {
      'p5': mean - 1.6449 * sd,
      'p25': mean - 0.6745 * sd,
      'p50': mean,
      'p75': mean + 0.6745 * sd,
      'p95': mean + 1.6449 * sd,
    };
  }

  // ── Internal math ────────────────────────────────────────────────

  static double _normCdf(double z) =>
      0.5 * (1.0 + _erf(z / math.sqrt(2.0)));

  /// Error function — Abramowitz & Stegun approximation (max error < 1.5e-7)
  static double _erf(double x) {
    const p = 0.3275911;
    final sign = x < 0 ? -1.0 : 1.0;
    final t = 1.0 / (1.0 + p * x.abs());
    final y = 1.0 -
        (((((1.061405429 * t - 1.453152027) * t + 1.421413741) * t -
                    0.284496736) *
                t +
            0.254829592) *
            t *
            math.exp(-(x * x)));
    return sign * y;
  }
}
