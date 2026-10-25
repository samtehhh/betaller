import 'num_format.dart';

/// How a height is shown: centimetres, or feet and inches.
enum HeightUnit { cm, ftIn }

/// How a body weight is shown: kilograms, pounds, or stones and pounds.
enum WeightUnit { kg, lb, stLb }

/// How water is shown: litres (ml/L), or US fluid ounces.
enum VolumeUnit { ml, flOz }

/// The user's three display units. Everything is stored metric (cm, kg,
/// litres); these only decide what the user reads and types.
class UnitPrefs {
  final HeightUnit height;
  final WeightUnit weight;
  final VolumeUnit volume;

  const UnitPrefs(this.height, this.weight, this.volume);

  static const metric = UnitPrefs(HeightUnit.cm, WeightUnit.kg, VolumeUnit.ml);

  /// The units the app shows right now. AppProvider keeps this in sync with
  /// the saved preference, the same way MaterialApp keeps
  /// Intl.defaultLocale, so copy built from AppLocalizations alone (routine
  /// texts, achievements, notifications) can follow it without a provider.
  static UnitPrefs current = metric;

  static const double cmPerInch = 2.54;
  static const double lbPerKg = 2.2046226218;
  static const double mlPerFlOz = 29.5735;

  /// First-run units by device region. The US reads everything imperial;
  /// Canada reads its height in ft-in and weight in lb but buys water in
  /// ml; the UK and Ireland read height in ft-in and weight in stones.
  /// Everyone else is metric.
  factory UnitPrefs.forRegion(String? country) {
    switch (country?.toUpperCase()) {
      case 'US':
        return const UnitPrefs(HeightUnit.ftIn, WeightUnit.lb, VolumeUnit.flOz);
      case 'CA':
        return const UnitPrefs(HeightUnit.ftIn, WeightUnit.lb, VolumeUnit.ml);
      case 'GB':
      case 'IE':
        return const UnitPrefs(
          HeightUnit.ftIn,
          WeightUnit.stLb,
          VolumeUnit.ml,
        );
      default:
        return metric;
    }
  }

  /// Saves from before the three settings had one useImperial flag.
  /// Imperial meant ft-in and lb; water follows the US only.
  factory UnitPrefs.fromLegacy(bool useImperial, String? country) =>
      useImperial
      ? UnitPrefs(
          HeightUnit.ftIn,
          WeightUnit.lb,
          country?.toUpperCase() == 'US' ? VolumeUnit.flOz : VolumeUnit.ml,
        )
      : metric;

  /// Reads the stored names back; anything unknown keeps [fallback].
  factory UnitPrefs.fromNames(
    Object? height,
    Object? weight,
    Object? volume, {
    UnitPrefs fallback = metric,
  }) {
    T pick<T extends Enum>(List<T> values, Object? name, T orElse) {
      for (final v in values) {
        if (v.name == name) return v;
      }
      return orElse;
    }

    return UnitPrefs(
      pick(HeightUnit.values, height, fallback.height),
      pick(WeightUnit.values, weight, fallback.weight),
      pick(VolumeUnit.values, volume, fallback.volume),
    );
  }

  UnitPrefs copyWith({
    HeightUnit? height,
    WeightUnit? weight,
    VolumeUnit? volume,
  }) => UnitPrefs(
    height ?? this.height,
    weight ?? this.weight,
    volume ?? this.volume,
  );

  bool get imperialHeight => height == HeightUnit.ftIn;

  // ── Height ────────────────────────────────────────────────────────────

  /// Short unit for a bare height number: "cm" or "in".
  String get heightLabel => imperialHeight ? 'in' : 'cm';

  /// A stored cm value in the unit the user reads (cm or total inches).
  double heightNumber(double cm) => imperialHeight ? cm / cmPerInch : cm;

  /// The inverse of [heightNumber].
  double heightFromNumber(double value) =>
      imperialHeight ? value * cmPerInch : value;

  /// A height where growth matters: "173.4 cm" or 5'8½". Half inches,
  /// because a whole-inch display hides months of real growth.
  String formatHeight(double cm) =>
      imperialHeight ? feetInches(cm) : '${cm.fixedL(1)} cm';

  /// A height where space is tight: "173 cm" or 5'8".
  String formatHeightCompact(double cm) =>
      imperialHeight ? feetInches(cm, half: false) : '${cm.round()} cm';

  /// A chart or scale label: "173" or 5'8".
  String formatHeightAxis(double cm) =>
      imperialHeight ? feetInches(cm, half: false) : '${cm.round()}';

  /// A length of growth, "2.5 cm" or "1.0 in"; [signed] adds a leading
  /// "+" to positive values.
  String formatHeightAmount(double cm, {bool signed = false}) {
    final sign = signed && cm > 0 ? '+' : '';
    return '$sign${heightNumber(cm).fixedL(1)} $heightLabel';
  }

  /// 5'8½" (half inches) or 5'9" (whole inches, [half] false).
  static String feetInches(double cm, {bool half = true}) {
    final steps = half ? 2 : 1;
    final total = (cm / cmPerInch * steps).round();
    final feet = total ~/ (12 * steps);
    final rest = total % (12 * steps);
    final inches = rest ~/ steps;
    final frac = half && rest.isOdd ? '½' : '';
    return "$feet'$inches$frac\"";
  }

  // ── Weight ────────────────────────────────────────────────────────────

  /// "52.4 kg", "115.5 lb" or "8 st 3 lb".
  String formatWeight(double kg) => switch (weight) {
    WeightUnit.kg => '${kg.fixedL(1)} kg',
    WeightUnit.lb => '${(kg * lbPerKg).fixedL(1)} lb',
    WeightUnit.stLb => stonesPounds(kg),
  };

  /// "8 st 3 lb", rounded to the pound.
  static String stonesPounds(double kg) {
    final lb = (kg * lbPerKg).round();
    return '${lb ~/ 14} st ${lb % 14} lb';
  }

  // ── Water ─────────────────────────────────────────────────────────────

  bool get flOz => volume == VolumeUnit.flOz;

  static double litresToFlOz(double litres) => litres * 1000 / mlPerFlOz;
  static double flOzToLitres(double oz) => oz * mlPerFlOz / 1000;

  /// Fluid ounces logged so far, to the whole ounce.
  static int flOzRounded(double litres) => litresToFlOz(litres).round();

  /// A water target in fluid ounces, to the nearest 4 oz (half a cup).
  static int flOzTarget(double litres) =>
      (litresToFlOz(litres) / 4).round() * 4;

  /// Short water unit: "L" or "fl oz".
  String get waterUnit => flOz ? 'fl oz' : 'L';

  /// The unit glued to a number where space is tight: "2.5L", "84 fl oz".
  String get waterUnitTight => flOz ? ' fl oz' : 'L';

  /// Logged against target in one short label: "1.2/2.5L", "40/84 fl oz".
  String waterProgress(double litres, double target) =>
      '${waterValue(litres)}/${waterTargetValue(target)}$waterUnitTight';

  /// An amount logged, number only: "1.2" or "40".
  String waterValue(double litres) =>
      flOz ? '${flOzRounded(litres)}' : litres.fixedL(1);

  /// A daily target, number only: "2.5" or "84".
  String waterTargetValue(double litres) =>
      flOz ? '${flOzTarget(litres)}' : litres.fixedL(1);

  /// "1.2 L" or "40 fl oz".
  String formatWater(double litres) => '${waterValue(litres)} $waterUnit';

  /// "2.5 L" or "84 fl oz".
  String formatWaterTarget(double litres) =>
      '${waterTargetValue(litres)} $waterUnit';

  /// The target the user reads, back in litres: in fl oz, the goal is the
  /// rounded number on screen, so logging "84 of 84" really reaches it.
  double snapWaterTarget(double litres) =>
      flOz ? flOzToLitres(flOzTarget(litres).toDouble()) : litres;

  /// The quick amounts in the water sheet, in litres: 0.2/0.3/0.5/1 L, or a
  /// cup, a can, a bottle and a quart in fl oz.
  List<double> get waterQuickAmounts => flOz
      ? [for (final oz in const [8, 12, 16, 32]) flOzToLitres(oz.toDouble())]
      : const [0.2, 0.3, 0.5, 1.0];

  // ── Rates ─────────────────────────────────────────────────────────────

  /// Whether nutrition copy should talk per pound of body weight.
  bool get perPound => weight != WeightUnit.kg;
}
