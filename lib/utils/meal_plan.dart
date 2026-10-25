/// Meals with real foods and gram amounts that add up to the day's protein
/// and calcium targets ([DailyTargets]).
///
/// Every meal is a template of everyday foods. One item per meal is the
/// protein anchor: its portion is sized so the meal hits its share of the
/// day's protein. Dairy portions grow, within sensible limits, until the
/// day reaches its calcium target. Nutrient values are per 100 g (or
/// 100 ml for drinks), rounded from the USDA FoodData Central entries.
library;

import 'daily_targets.dart';

/// How a food's amount is shown.
enum FoodUnit { grams, millilitres, pieces }

class Food {
  final String id;
  final double protein; // g per 100
  final double calcium; // mg per 100
  final double vitaminD; // IU per 100
  final double zinc; // mg per 100
  final double magnesium; // mg per 100
  final double kcal; // per 100
  final FoodUnit unit;

  /// Grams in one piece, for [FoodUnit.pieces].
  final int pieceGrams;

  const Food(
    this.id,
    this.protein,
    this.calcium,
    this.vitaminD,
    this.zinc,
    this.magnesium,
    this.kcal, {
    this.unit = FoodUnit.grams,
    this.pieceGrams = 0,
  });
}

/// The foods the planner uses. Keys match the `plFood*` strings.
const Map<String, Food> kFoods = {
  'oats': Food('oats', 13.2, 52, 0, 3.6, 138, 379),
  'milk': Food('milk', 3.3, 120, 0, 0.4, 11, 61, unit: FoodUnit.millilitres),
  'banana': Food('banana', 1.1, 5, 0, 0.2, 27, 89,
      unit: FoodUnit.pieces, pieceGrams: 120),
  'walnuts': Food('walnuts', 15.2, 98, 0, 3.1, 158, 654),
  'greekYogurt': Food('greekYogurt', 10, 110, 0, 0.5, 11, 73),
  'yogurt': Food('yogurt', 3.5, 121, 2, 0.6, 12, 61),
  'eggs': Food('eggs', 12.6, 56, 82, 1.3, 12, 143,
      unit: FoodUnit.pieces, pieceGrams: 50),
  'bread': Food('bread', 12.5, 110, 0, 1.8, 76, 252),
  'whiteCheese': Food('whiteCheese', 14.2, 493, 16, 2.9, 19, 264),
  'hardCheese': Food('hardCheese', 24.9, 720, 24, 3.6, 27, 403),
  'salad': Food('salad', 0.8, 14, 0, 0.2, 12, 17),
  'orange': Food('orange', 0.9, 40, 0, 0.1, 10, 47,
      unit: FoodUnit.pieces, pieceGrams: 150),
  'peanutButter': Food('peanutButter', 22.5, 49, 0, 2.5, 168, 588),
  'spinach': Food('spinach', 3.0, 136, 0, 0.8, 87, 23),
  'cottageCheese': Food('cottageCheese', 11.1, 83, 0, 0.4, 8, 98),
  'chicken': Food('chicken', 31, 15, 5, 1.0, 29, 165),
  'bulgur': Food('bulgur', 3.1, 10, 0, 0.6, 32, 83),
  'ayran': Food('ayran', 1.7, 60, 0, 0.3, 6, 36, unit: FoodUnit.millilitres),
  'tuna': Food('tuna', 25.5, 14, 48, 0.8, 27, 116),
  'pasta': Food('pasta', 5.8, 7, 0, 0.5, 18, 158),
  'beef': Food('beef', 26, 18, 7, 6.3, 21, 250),
  'rice': Food('rice', 2.7, 10, 0, 0.5, 12, 130),
  'brownRice': Food('brownRice', 2.6, 10, 0, 0.6, 43, 112),
  'chickpeas': Food('chickpeas', 8.9, 49, 0, 1.5, 48, 164),
  'salmon': Food('salmon', 25.4, 15, 526, 0.4, 30, 206),
  'broccoli': Food('broccoli', 2.4, 40, 0, 0.5, 21, 35),
  'potato': Food('potato', 1.9, 8, 0, 0.3, 22, 87),
  'lentils': Food('lentils', 9.0, 19, 0, 1.3, 36, 116),
  'sardines': Food('sardines', 24.6, 382, 193, 1.3, 39, 208),
  'almonds': Food('almonds', 21.2, 269, 0, 3.1, 270, 579),
  'kefir': Food('kefir', 3.6, 125, 0, 0.4, 12, 55, unit: FoodUnit.millilitres),
  'pumpkinSeeds': Food('pumpkinSeeds', 30, 46, 0, 7.8, 550, 559),
};

enum MealSlot { breakfast, lunch, dinner, snack }

/// What an item does in its meal.
enum _Role {
  /// Sized to hit the meal's protein.
  anchor,

  /// Grown to reach the day's calcium.
  dairy,

  /// Stays as written.
  fixed,
}

class _Spec {
  final String food;
  final int amount; // g, ml or pieces
  final _Role role;
  final int min, max, step;
  const _Spec(this.food, this.amount,
      {this.role = _Role.fixed, this.min = 0, this.max = 0, this.step = 10});
}

const _a = _Role.anchor;
const _d = _Role.dairy;

/// A glass of milk (or a bowl of yogurt, if the meal already has milk)
/// alongside any meal, for days the meal's own dairy cannot reach the
/// calcium target.
const _sides = [
  _Spec('milk', 0, role: _d, max: 300, step: 100),
  _Spec('yogurt', 0, role: _d, max: 200, step: 100),
  _Spec('kefir', 0, role: _d, max: 300, step: 100),
];

/// Seven days of templates per slot. Day `i` uses entry `i % length`.
const Map<MealSlot, List<List<_Spec>>> _templates = {
  MealSlot.breakfast: [
    [
      _Spec('oats', 60),
      _Spec('milk', 250, role: _d, max: 400, step: 50),
      _Spec('greekYogurt', 100, role: _a, min: 0, max: 250, step: 25),
      _Spec('banana', 1),
      _Spec('walnuts', 15),
    ],
    [
      _Spec('eggs', 2, role: _a, min: 1, max: 4, step: 1),
      _Spec('bread', 60),
      _Spec('whiteCheese', 40, role: _d, max: 80, step: 10),
      _Spec('salad', 100),
    ],
    [
      _Spec('greekYogurt', 200, role: _a, min: 100, max: 350, step: 25),
      _Spec('oats', 40),
      _Spec('almonds', 15),
      _Spec('orange', 1),
      _Spec('milk', 150, role: _d, max: 300, step: 50),
    ],
    [
      _Spec('eggs', 2, role: _a, min: 1, max: 4, step: 1),
      _Spec('bread', 60),
      _Spec('hardCheese', 30, role: _d, max: 50, step: 10),
      _Spec('orange', 1),
    ],
    [
      _Spec('oats', 50),
      _Spec('milk', 300, role: _d, max: 400, step: 50),
      _Spec('peanutButter', 15),
      _Spec('eggs', 1, role: _a, min: 0, max: 3, step: 1),
      _Spec('banana', 1),
    ],
    [
      _Spec('eggs', 2, role: _a, min: 1, max: 4, step: 1),
      _Spec('spinach', 60),
      _Spec('bread', 60),
      _Spec('whiteCheese', 30, role: _d, max: 80, step: 10),
    ],
    [
      _Spec('cottageCheese', 150, role: _a, min: 50, max: 250, step: 25),
      _Spec('bread', 60),
      _Spec('walnuts', 15),
      _Spec('milk', 200, role: _d, max: 350, step: 50),
    ],
  ],
  MealSlot.lunch: [
    [
      _Spec('chicken', 120, role: _a, min: 30, max: 220),
      _Spec('bulgur', 150),
      _Spec('salad', 150),
      _Spec('ayran', 250, role: _d, max: 400, step: 50),
    ],
    [
      _Spec('tuna', 100, role: _a, min: 30, max: 180),
      _Spec('pasta', 180),
      _Spec('salad', 150),
      _Spec('yogurt', 150, role: _d, max: 250, step: 50),
    ],
    [
      _Spec('beef', 120, role: _a, min: 30, max: 200),
      _Spec('rice', 150),
      _Spec('salad', 150),
      _Spec('ayran', 250, role: _d, max: 400, step: 50),
    ],
    [
      _Spec('chickpeas', 150),
      _Spec('rice', 120),
      _Spec('chicken', 80, role: _a, min: 0, max: 200),
      _Spec('yogurt', 150, role: _d, max: 250, step: 50),
    ],
    [
      _Spec('lentils', 200),
      _Spec('bread', 60),
      _Spec('chicken', 80, role: _a, min: 0, max: 200),
      _Spec('ayran', 250, role: _d, max: 400, step: 50),
    ],
    [
      _Spec('tuna', 100, role: _a, min: 30, max: 180),
      _Spec('bulgur', 150),
      _Spec('spinach', 100),
      _Spec('yogurt', 150, role: _d, max: 250, step: 50),
    ],
    [
      _Spec('beef', 120, role: _a, min: 30, max: 200),
      _Spec('pasta', 180),
      _Spec('salad', 150),
      _Spec('hardCheese', 20, role: _d, max: 40, step: 10),
    ],
  ],
  MealSlot.dinner: [
    [
      _Spec('salmon', 120, role: _a, min: 30, max: 200),
      _Spec('rice', 150),
      _Spec('broccoli', 150),
      _Spec('yogurt', 150, role: _d, max: 250, step: 50),
    ],
    [
      _Spec('chicken', 120, role: _a, min: 30, max: 220),
      _Spec('potato', 200),
      _Spec('spinach', 150),
      _Spec('yogurt', 150, role: _d, max: 250, step: 50),
    ],
    [
      _Spec('beef', 120, role: _a, min: 30, max: 200),
      _Spec('bulgur', 150),
      _Spec('broccoli', 150),
      _Spec('yogurt', 150, role: _d, max: 250, step: 50),
    ],
    [
      _Spec('sardines', 100, role: _a, min: 30, max: 180),
      _Spec('bread', 60),
      _Spec('salad', 150),
      _Spec('ayran', 250, role: _d, max: 400, step: 50),
    ],
    [
      _Spec('chicken', 120, role: _a, min: 30, max: 220),
      _Spec('pasta', 180),
      _Spec('broccoli', 150),
      _Spec('hardCheese', 20, role: _d, max: 40, step: 10),
    ],
    [
      _Spec('salmon', 120, role: _a, min: 30, max: 200),
      _Spec('potato', 200),
      _Spec('salad', 150),
      _Spec('yogurt', 150, role: _d, max: 250, step: 50),
    ],
    [
      _Spec('chickpeas', 150),
      _Spec('rice', 120),
      _Spec('beef', 90, role: _a, min: 0, max: 200),
      _Spec('yogurt', 150, role: _d, max: 250, step: 50),
    ],
  ],
  MealSlot.snack: [
    [
      _Spec('greekYogurt', 150, role: _a, min: 100, max: 300, step: 25),
      _Spec('almonds', 20),
    ],
    [
      _Spec('kefir', 250, role: _a, min: 150, max: 500, step: 50),
      _Spec('banana', 1),
      _Spec('pumpkinSeeds', 15),
    ],
    [
      _Spec('whiteCheese', 40, role: _a, min: 30, max: 100, step: 10),
      _Spec('bread', 30),
      _Spec('walnuts', 15),
    ],
  ],
};

/// Outside Turkey the Turkish staples become what a US or European kitchen
/// has: ayran a glass of milk, bulgur brown rice. Every total is summed from
/// [kFoods], so protein, calcium and kcal follow the swapped food and the
/// anchors and dairy are sized for it as usual. Milk carries twice ayran's
/// protein and calcium, so its glass is a little smaller (200 ml, at most
/// 250) and the rest of the day's calcium comes from the other meals.
const Map<String, _Spec> _internationalSwaps = {
  'ayran': _Spec('milk', 200, role: _d, max: 250, step: 50),
  'bulgur': _Spec('brownRice', 150),
};

/// Whole meals that only make sense in Turkey, and what is served instead.
const Map<(MealSlot, int), List<_Spec>> _internationalMeals = {
  // Eggs, bread, feta, tomato and cucumber: eggs on whole-wheat toast with
  // cheese.
  (MealSlot.breakfast, 1): [
    _Spec('eggs', 2, role: _a, min: 1, max: 4, step: 1),
    _Spec('bread', 60),
    _Spec('hardCheese', 30, role: _d, max: 50, step: 10),
    _Spec('banana', 1),
  ],
  // Lentil soup, bread and ayran: a chicken sandwich and a glass of milk.
  // The soup's lentils fill lunch's protein on their own, so the milk that
  // replaces ayran would overshoot it; in a sandwich the chicken (the
  // anchor) shrinks to make room for the milk the day's calcium needs.
  (MealSlot.lunch, 4): [
    _Spec('chicken', 100, role: _a, min: 0, max: 220),
    _Spec('bread', 90),
    _Spec('salad', 150),
    _Spec('milk', 200, role: _d, max: 250, step: 50),
  ],
};

/// [pick], the template for [slot] at [index], as served to a user whose
/// app is not in Turkish.
List<_Spec> _international(MealSlot slot, int index, List<_Spec> pick) =>
    _internationalMeals[(slot, index)] ??
    [for (final x in pick) _internationalSwaps[x.food] ?? x];

/// One food in a meal, with its amount in [Food.unit].
class MealItem {
  final Food food;
  final int amount;
  const MealItem(this.food, this.amount);

  double get grams => food.unit == FoodUnit.pieces
      ? (amount * food.pieceGrams).toDouble()
      : amount.toDouble();
  double _per(double v) => v * grams / 100;
  double get protein => _per(food.protein);
  double get calcium => _per(food.calcium);
  double get vitaminD => _per(food.vitaminD);
  double get zinc => _per(food.zinc);
  double get magnesium => _per(food.magnesium);
  double get kcal => _per(food.kcal);
}

mixin _Totals {
  List<MealItem> get items;
  double _sum(double Function(MealItem) f) =>
      items.fold(0.0, (s, i) => s + f(i));
  double get protein => _sum((i) => i.protein);
  double get calcium => _sum((i) => i.calcium);
  double get vitaminD => _sum((i) => i.vitaminD);
  double get zinc => _sum((i) => i.zinc);
  double get magnesium => _sum((i) => i.magnesium);
  double get kcal => _sum((i) => i.kcal);
}

class Meal with _Totals {
  final MealSlot slot;

  /// "HH:mm", from the user's own meal times.
  final String time;

  /// The protein this meal is sized for.
  final int proteinTarget;
  @override
  final List<MealItem> items;
  const Meal(this.slot, this.time, this.proteinTarget, this.items);
}

class DayMenu with _Totals {
  final int variant;
  final List<Meal> meals;
  const DayMenu(this.variant, this.meals);

  @override
  List<MealItem> get items => [for (final m in meals) ...m.items];
}

/// Labels each meal time as breakfast, lunch, dinner or snack. The last
/// meal is dinner, a first meal before 11:00 is breakfast, the middle meal
/// nearest 13:00 is lunch and the rest are snacks.
List<MealSlot> slotsForTimes(List<String> times) {
  final n = times.length;
  if (n == 0) return const [];
  int minutes(String t) {
    final p = t.split(':');
    final h = int.tryParse(p.first) ?? 12;
    final m = p.length > 1 ? int.tryParse(p[1]) ?? 0 : 0;
    return h * 60 + m;
  }

  final slots = List<MealSlot>.filled(n, MealSlot.snack);
  if (n == 1) return [MealSlot.lunch];
  slots[n - 1] = MealSlot.dinner;
  final hasBreakfast = minutes(times.first) < 11 * 60;
  if (hasBreakfast) slots[0] = MealSlot.breakfast;
  final middle = [for (var i = hasBreakfast ? 1 : 0; i < n - 1; i++) i];
  if (middle.isNotEmpty) {
    middle.sort((a, b) => (minutes(times[a]) - 13 * 60)
        .abs()
        .compareTo((minutes(times[b]) - 13 * 60).abs()));
    slots[middle.first] = MealSlot.lunch;
  } else if (!hasBreakfast) {
    slots[0] = MealSlot.lunch;
  }
  return slots;
}

double _weight(MealSlot s) => s == MealSlot.snack ? 0.6 : 1.0;

/// The protein each meal is sized for: an even share for main meals, a
/// little over half of that for snacks.
List<int> proteinSplit(int totalProtein, List<MealSlot> slots) {
  if (slots.isEmpty) return const [];
  final w = slots.fold(0.0, (s, x) => s + _weight(x));
  return [for (final s in slots) (totalProtein * _weight(s) / w).round()];
}

/// The day's menu for [mealTimes], sized to [targets]. [variant] picks the
/// day of the weekly rotation (0 = Monday). [turkish] keeps the Turkish
/// staples (ayran, bulgur, the feta breakfast); pass it when the app
/// language is Turkish, everyone else gets the international swaps.
DayMenu buildDayMenu(
  DailyTargets targets,
  List<String> mealTimes, {
  int variant = 0,
  bool turkish = false,
}) {
  final times = mealTimes.isEmpty
      ? const ['08:00', '13:00', '19:00']
      : (List<String>.from(mealTimes)..sort());
  final slots = slotsForTimes(times);
  final shares = proteinSplit(targets.proteinG, slots);

  // Working copy: amounts per meal, per spec. Every meal can take a glass
  // of milk on the side, used only once its own dairy is at its limit.
  var snackIndex = 0;
  final specs = <List<_Spec>>[];
  for (final slot in slots) {
    final list = _templates[slot]!;
    final index = slot == MealSlot.snack
        ? (variant + snackIndex++) % list.length
        : variant % list.length;
    final pick = turkish
        ? list[index]
        : _international(slot, index, list[index]);
    final side = _sides.firstWhere(
      (x) => !pick.any((p) => p.food == x.food),
      orElse: () => _sides.first,
    );
    specs.add([...pick, side]);
  }
  // Grains, vegetables and nuts follow the day's energy need, so a 40 kg
  // 13-year-old is not served an 80 kg athlete's plate.
  final scale = (targets.kcal / 2400).clamp(0.7, 1.3);
  int scaled(_Spec x) {
    if (x.role != _Role.fixed) return x.amount;
    final food = kFoods[x.food]!;
    if (food.unit == FoodUnit.pieces) return x.amount;
    final step = x.amount <= 30 ? 5 : 10;
    return ((x.amount * scale / step).round() * step).clamp(step, 400);
  }

  final amounts = [
    for (final s in specs) [for (final x in s) scaled(x)],
  ];

  double nutrient(int m, int i, double Function(Food) f) {
    final food = kFoods[specs[m][i].food]!;
    final g = food.unit == FoodUnit.pieces
        ? amounts[m][i] * food.pieceGrams
        : amounts[m][i];
    return f(food) * g / 100;
  }

  void sizeAnchors() {
    for (var m = 0; m < specs.length; m++) {
      final a = specs[m].indexWhere((x) => x.role == _Role.anchor);
      if (a < 0) continue;
      var other = 0.0;
      for (var i = 0; i < specs[m].length; i++) {
        if (i != a) other += nutrient(m, i, (f) => f.protein);
      }
      final spec = specs[m][a];
      final food = kFoods[spec.food]!;
      final perUnit = food.unit == FoodUnit.pieces
          ? food.protein * food.pieceGrams / 100
          : food.protein / 100;
      final need = (shares[m] - other) / perUnit;
      final stepped = (need / spec.step).round() * spec.step;
      amounts[m][a] = stepped.clamp(spec.min, spec.max);
    }
  }

  double dayCalcium() {
    var c = 0.0;
    for (var m = 0; m < specs.length; m++) {
      for (var i = 0; i < specs[m].length; i++) {
        c += nutrient(m, i, (f) => f.calcium);
      }
    }
    return c;
  }

  sizeAnchors();
  // Grow dairy one step at a time, breakfast first, until calcium is met.
  for (var guard = 0; guard < 40 && dayCalcium() < targets.calciumMg; guard++) {
    var grew = false;
    for (var m = 0; m < specs.length && dayCalcium() < targets.calciumMg; m++) {
      for (var i = 0; i < specs[m].length; i++) {
        final s = specs[m][i];
        if (s.role != _Role.dairy || amounts[m][i] >= s.max) continue;
        amounts[m][i] = (amounts[m][i] + s.step).clamp(0, s.max);
        grew = true;
        break;
      }
    }
    if (!grew) break;
    // Dairy brings protein too; let the anchors give some back.
    sizeAnchors();
  }

  final meals = <Meal>[];
  for (var m = 0; m < specs.length; m++) {
    meals.add(Meal(slots[m], times[m], shares[m], [
      for (var i = 0; i < specs[m].length; i++)
        if (amounts[m][i] > 0) MealItem(kFoods[specs[m][i].food]!, amounts[m][i]),
    ]));
  }
  return DayMenu(variant % 7, meals);
}

/// Monday to Sunday.
List<DayMenu> buildWeekMenu(
  DailyTargets targets,
  List<String> mealTimes, {
  bool turkish = false,
}) =>
    [
      for (var d = 0; d < 7; d++)
        buildDayMenu(targets, mealTimes, variant: d, turkish: turkish),
    ];
