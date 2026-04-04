// Nutrition data for the BeTaller app.
// Contains growth-critical nutrients, a food database, and weekly meal plans.

// ══════════════════════════════════════════════════════════════════════
// A) Growth-Critical Nutrients
// ══════════════════════════════════════════════════════════════════════

const List<Map<String, dynamic>> growthNutrients = [
  {
    'id': 'nutrient_calcium',
    'name': 'Calcium',
    'icon': '🦴',
    'dailyNeedByAge': {
      '6-8': '1,000 mg',
      '9-13': '1,300 mg',
      '14-18': '1,300 mg',
      '19-25': '1,000 mg',
    },
    'role':
        'Calcium is the primary structural mineral in bones and teeth. About '
        '99% of your body\'s calcium is stored in your skeleton. During growth '
        'spurts, your bones need large amounts of calcium to build new bone '
        'tissue. Insufficient calcium forces the body to pull from existing '
        'bone, weakening your skeleton.',
    'topFoods': [
      {'name': 'Milk (1 cup / 240 ml)', 'amount': '300 mg'},
      {'name': 'Yogurt (1 cup / 245 g)', 'amount': '275 mg'},
      {'name': 'Cheddar cheese (30 g)', 'amount': '200 mg'},
      {'name': 'Sardines with bones (85 g)', 'amount': '325 mg'},
      {'name': 'Fortified orange juice (1 cup)', 'amount': '350 mg'},
    ],
  },
  {
    'id': 'nutrient_protein',
    'name': 'Protein',
    'icon': '🥩',
    'dailyNeedByAge': {
      '6-8': '20 g',
      '9-13': '35-45 g',
      '14-18': '50-65 g',
      '19-25': '55-70 g',
    },
    'role':
        'Protein supplies the amino acids that build and repair every tissue '
        'in your body — bones, muscles, cartilage, and skin. During '
        'adolescence, protein needs increase significantly to support rapid '
        'growth. Amino acids like arginine and lysine also directly stimulate '
        'growth hormone release.',
    'topFoods': [
      {'name': 'Chicken breast (100 g)', 'amount': '31 g'},
      {'name': 'Eggs (2 large)', 'amount': '12 g'},
      {'name': 'Greek yogurt (170 g)', 'amount': '17 g'},
      {'name': 'Lentils, cooked (1 cup)', 'amount': '18 g'},
      {'name': 'Salmon fillet (100 g)', 'amount': '25 g'},
    ],
  },
  {
    'id': 'nutrient_zinc',
    'name': 'Zinc',
    'icon': '⚡',
    'dailyNeedByAge': {
      '6-8': '5 mg',
      '9-13': '8 mg',
      '14-18': '11 mg',
      '19-25': '11 mg',
    },
    'role':
        'Zinc is essential for cell division, DNA synthesis, and immune '
        'function — all critical during growth. Zinc deficiency is one of the '
        'most common causes of growth retardation worldwide. It also plays a '
        'role in growth hormone signaling and bone mineralization.',
    'topFoods': [
      {'name': 'Oysters (6 medium)', 'amount': '32 mg'},
      {'name': 'Beef steak (100 g)', 'amount': '5.5 mg'},
      {'name': 'Pumpkin seeds (30 g)', 'amount': '2.5 mg'},
      {'name': 'Chickpeas, cooked (1 cup)', 'amount': '2.5 mg'},
      {'name': 'Cashews (30 g)', 'amount': '1.6 mg'},
    ],
  },
  {
    'id': 'nutrient_vitamin_d',
    'name': 'Vitamin D',
    'icon': '☀️',
    'dailyNeedByAge': {
      '6-8': '600 IU',
      '9-13': '600 IU',
      '14-18': '600 IU',
      '19-25': '600-1,000 IU',
    },
    'role':
        'Vitamin D is critical for calcium absorption — without it, your body '
        'absorbs only 10-15% of dietary calcium (vs. 30-40% with adequate '
        'vitamin D). It also directly influences growth plate chondrocyte '
        'activity and bone mineralization. Many teens are deficient, '
        'especially those who spend most of their time indoors.',
    'topFoods': [
      {'name': 'Salmon (100 g)', 'amount': '570 IU'},
      {'name': 'Fortified milk (1 cup)', 'amount': '120 IU'},
      {'name': 'Egg yolk (1 large)', 'amount': '44 IU'},
      {'name': 'Fortified cereal (1 serving)', 'amount': '80 IU'},
      {'name': 'Sunlight (15 min, midday)', 'amount': '~1,000 IU'},
    ],
  },
  {
    'id': 'nutrient_vitamin_a',
    'name': 'Vitamin A',
    'icon': '🥕',
    'dailyNeedByAge': {
      '6-8': '400 mcg RAE',
      '9-13': '600 mcg RAE',
      '14-18': '700-900 mcg RAE',
      '19-25': '700-900 mcg RAE',
    },
    'role':
        'Vitamin A plays a key role in bone remodeling — the process where '
        'old bone is broken down and replaced with new, stronger tissue. It '
        'is also essential for growth plate function and cell differentiation. '
        'Both deficiency and excess can impair growth, so balance is important.',
    'topFoods': [
      {'name': 'Sweet potato (1 medium)', 'amount': '1,100 mcg RAE'},
      {'name': 'Carrots (1 medium)', 'amount': '509 mcg RAE'},
      {'name': 'Spinach, cooked (1/2 cup)', 'amount': '472 mcg RAE'},
      {'name': 'Beef liver (85 g)', 'amount': '6,582 mcg RAE'},
      {'name': 'Red bell pepper (1 medium)', 'amount': '187 mcg RAE'},
    ],
  },
  {
    'id': 'nutrient_iron',
    'name': 'Iron',
    'icon': '🩸',
    'dailyNeedByAge': {
      '6-8': '10 mg',
      '9-13': '8 mg',
      '14-18': '11-15 mg',
      '19-25': '8-18 mg',
    },
    'role':
        'Iron carries oxygen in your blood to every cell in your body, '
        'including growing bone and muscle tissue. During puberty, iron '
        'needs increase sharply — especially for girls after the onset of '
        'menstruation. Iron deficiency anemia is linked to stunted growth '
        'and delayed development.',
    'topFoods': [
      {'name': 'Beef steak (100 g)', 'amount': '2.6 mg'},
      {'name': 'Spinach, cooked (1/2 cup)', 'amount': '3.2 mg'},
      {'name': 'Lentils, cooked (1 cup)', 'amount': '6.6 mg'},
      {'name': 'Fortified cereal (1 serving)', 'amount': '8.0 mg'},
      {'name': 'Dark chocolate (30 g)', 'amount': '3.4 mg'},
    ],
  },
  {
    'id': 'nutrient_phosphorus',
    'name': 'Phosphorus',
    'icon': '🔬',
    'dailyNeedByAge': {
      '6-8': '500 mg',
      '9-13': '1,250 mg',
      '14-18': '1,250 mg',
      '19-25': '700 mg',
    },
    'role':
        'Phosphorus is the second most abundant mineral in your body after '
        'calcium, and about 85% of it is in your bones and teeth. It works '
        'together with calcium to form hydroxyapatite, the mineral crystal '
        'that gives bones their hardness and strength. It is also essential '
        'for energy production (ATP) in growing cells.',
    'topFoods': [
      {'name': 'Chicken breast (100 g)', 'amount': '228 mg'},
      {'name': 'Salmon (100 g)', 'amount': '252 mg'},
      {'name': 'Lentils, cooked (1 cup)', 'amount': '356 mg'},
      {'name': 'Milk (1 cup)', 'amount': '247 mg'},
      {'name': 'Sunflower seeds (30 g)', 'amount': '206 mg'},
    ],
  },
  {
    'id': 'nutrient_magnesium',
    'name': 'Magnesium',
    'icon': '🌿',
    'dailyNeedByAge': {
      '6-8': '130 mg',
      '9-13': '240 mg',
      '14-18': '360-410 mg',
      '19-25': '310-400 mg',
    },
    'role':
        'Magnesium is involved in over 300 enzymatic reactions, including '
        'bone formation and calcium metabolism. It helps convert vitamin D '
        'into its active form, which is needed for calcium absorption. '
        'Magnesium deficiency can impair bone growth and reduce bone density. '
        'It also supports muscle relaxation and sleep quality.',
    'topFoods': [
      {'name': 'Pumpkin seeds (30 g)', 'amount': '156 mg'},
      {'name': 'Almonds (30 g)', 'amount': '80 mg'},
      {'name': 'Spinach, cooked (1/2 cup)', 'amount': '78 mg'},
      {'name': 'Dark chocolate (30 g)', 'amount': '65 mg'},
      {'name': 'Banana (1 medium)', 'amount': '32 mg'},
    ],
  },
  {
    'id': 'nutrient_l_arginine',
    'name': 'L-Arginine',
    'icon': '💪',
    'dailyNeedByAge': {
      '6-8': '2-3 g',
      '9-13': '3-4 g',
      '14-18': '4-5 g',
      '19-25': '4-6 g',
    },
    'role':
        'L-Arginine is an amino acid that directly stimulates the release of '
        'growth hormone from the pituitary gland. It is also a precursor to '
        'nitric oxide, which improves blood flow to growing tissues. Studies '
        'show that arginine supplementation can increase HGH secretion, '
        'especially when combined with exercise.',
    'topFoods': [
      {'name': 'Turkey breast (100 g)', 'amount': '1.6 g'},
      {'name': 'Pumpkin seeds (30 g)', 'amount': '1.4 g'},
      {'name': 'Soybeans, cooked (1 cup)', 'amount': '2.5 g'},
      {'name': 'Chicken breast (100 g)', 'amount': '1.4 g'},
      {'name': 'Peanuts (30 g)', 'amount': '1.0 g'},
    ],
  },
];

// ══════════════════════════════════════════════════════════════════════
// B) Food Database (40+ growth-friendly foods)
// ══════════════════════════════════════════════════════════════════════

const List<Map<String, dynamic>> foodDatabase = [
  // ── Dairy ──────────────────────────────────────────────────────
  {'name': 'Whole Milk', 'icon': '🥛', 'category': 'dairy', 'caloriesPer100g': 61, 'protein': 3.2, 'calcium': 125, 'zinc': 0.4, 'vitaminD': 50},
  {'name': 'Greek Yogurt', 'icon': '🥛', 'category': 'dairy', 'caloriesPer100g': 97, 'protein': 9.0, 'calcium': 110, 'zinc': 0.5, 'vitaminD': 0},
  {'name': 'Cheddar Cheese', 'icon': '🧀', 'category': 'dairy', 'caloriesPer100g': 403, 'protein': 24.9, 'calcium': 721, 'zinc': 3.1, 'vitaminD': 24},
  {'name': 'Cottage Cheese', 'icon': '🧀', 'category': 'dairy', 'caloriesPer100g': 98, 'protein': 11.1, 'calcium': 83, 'zinc': 0.4, 'vitaminD': 3},
  {'name': 'Mozzarella', 'icon': '🧀', 'category': 'dairy', 'caloriesPer100g': 280, 'protein': 28.0, 'calcium': 505, 'zinc': 2.9, 'vitaminD': 16},

  // ── Meat & Poultry ─────────────────────────────────────────────
  {'name': 'Chicken Breast', 'icon': '🍗', 'category': 'meat', 'caloriesPer100g': 165, 'protein': 31.0, 'calcium': 15, 'zinc': 1.0, 'vitaminD': 5},
  {'name': 'Turkey Breast', 'icon': '🦃', 'category': 'meat', 'caloriesPer100g': 135, 'protein': 30.0, 'calcium': 11, 'zinc': 1.7, 'vitaminD': 6},
  {'name': 'Beef Steak (Sirloin)', 'icon': '🥩', 'category': 'meat', 'caloriesPer100g': 271, 'protein': 26.0, 'calcium': 18, 'zinc': 5.5, 'vitaminD': 7},
  {'name': 'Lean Ground Beef', 'icon': '🥩', 'category': 'meat', 'caloriesPer100g': 250, 'protein': 26.1, 'calcium': 18, 'zinc': 5.3, 'vitaminD': 6},
  {'name': 'Lamb Chop', 'icon': '🍖', 'category': 'meat', 'caloriesPer100g': 282, 'protein': 25.5, 'calcium': 17, 'zinc': 4.5, 'vitaminD': 2},
  {'name': 'Beef Liver', 'icon': '🥩', 'category': 'meat', 'caloriesPer100g': 135, 'protein': 20.4, 'calcium': 5, 'zinc': 4.0, 'vitaminD': 49},

  // ── Fish & Seafood ─────────────────────────────────────────────
  {'name': 'Salmon', 'icon': '🐟', 'category': 'meat', 'caloriesPer100g': 208, 'protein': 25.4, 'calcium': 12, 'zinc': 0.6, 'vitaminD': 570},
  {'name': 'Sardines (canned)', 'icon': '🐟', 'category': 'meat', 'caloriesPer100g': 208, 'protein': 24.6, 'calcium': 382, 'zinc': 1.3, 'vitaminD': 193},
  {'name': 'Tuna (canned in water)', 'icon': '🐟', 'category': 'meat', 'caloriesPer100g': 116, 'protein': 25.5, 'calcium': 11, 'zinc': 0.8, 'vitaminD': 68},
  {'name': 'Shrimp', 'icon': '🦐', 'category': 'meat', 'caloriesPer100g': 99, 'protein': 24.0, 'calcium': 52, 'zinc': 1.6, 'vitaminD': 3},
  {'name': 'Mackerel', 'icon': '🐟', 'category': 'meat', 'caloriesPer100g': 205, 'protein': 18.6, 'calcium': 12, 'zinc': 0.6, 'vitaminD': 360},

  // ── Eggs ───────────────────────────────────────────────────────
  {'name': 'Whole Egg', 'icon': '🥚', 'category': 'meat', 'caloriesPer100g': 155, 'protein': 12.6, 'calcium': 56, 'zinc': 1.3, 'vitaminD': 87},

  // ── Legumes ────────────────────────────────────────────────────
  {'name': 'Lentils (cooked)', 'icon': '🫘', 'category': 'grain', 'caloriesPer100g': 116, 'protein': 9.0, 'calcium': 19, 'zinc': 1.3, 'vitaminD': 0},
  {'name': 'Chickpeas (cooked)', 'icon': '🫘', 'category': 'grain', 'caloriesPer100g': 164, 'protein': 8.9, 'calcium': 49, 'zinc': 1.5, 'vitaminD': 0},
  {'name': 'Black Beans (cooked)', 'icon': '🫘', 'category': 'grain', 'caloriesPer100g': 132, 'protein': 8.9, 'calcium': 27, 'zinc': 1.1, 'vitaminD': 0},
  {'name': 'Soybeans (cooked)', 'icon': '🫘', 'category': 'grain', 'caloriesPer100g': 173, 'protein': 16.6, 'calcium': 102, 'zinc': 1.2, 'vitaminD': 0},
  {'name': 'Tofu (firm)', 'icon': '🧊', 'category': 'grain', 'caloriesPer100g': 144, 'protein': 15.5, 'calcium': 350, 'zinc': 1.0, 'vitaminD': 0},

  // ── Vegetables ─────────────────────────────────────────────────
  {'name': 'Spinach (cooked)', 'icon': '🥬', 'category': 'vegetable', 'caloriesPer100g': 23, 'protein': 2.9, 'calcium': 136, 'zinc': 0.8, 'vitaminD': 0},
  {'name': 'Broccoli', 'icon': '🥦', 'category': 'vegetable', 'caloriesPer100g': 34, 'protein': 2.8, 'calcium': 47, 'zinc': 0.4, 'vitaminD': 0},
  {'name': 'Kale (cooked)', 'icon': '🥬', 'category': 'vegetable', 'caloriesPer100g': 28, 'protein': 1.9, 'calcium': 150, 'zinc': 0.3, 'vitaminD': 0},
  {'name': 'Sweet Potato', 'icon': '🍠', 'category': 'vegetable', 'caloriesPer100g': 86, 'protein': 1.6, 'calcium': 30, 'zinc': 0.3, 'vitaminD': 0},
  {'name': 'Carrots', 'icon': '🥕', 'category': 'vegetable', 'caloriesPer100g': 41, 'protein': 0.9, 'calcium': 33, 'zinc': 0.2, 'vitaminD': 0},
  {'name': 'Red Bell Pepper', 'icon': '🫑', 'category': 'vegetable', 'caloriesPer100g': 31, 'protein': 1.0, 'calcium': 7, 'zinc': 0.3, 'vitaminD': 0},
  {'name': 'Edamame', 'icon': '🫛', 'category': 'vegetable', 'caloriesPer100g': 121, 'protein': 11.9, 'calcium': 63, 'zinc': 1.4, 'vitaminD': 0},

  // ── Fruits ─────────────────────────────────────────────────────
  {'name': 'Banana', 'icon': '🍌', 'category': 'fruit', 'caloriesPer100g': 89, 'protein': 1.1, 'calcium': 5, 'zinc': 0.2, 'vitaminD': 0},
  {'name': 'Orange', 'icon': '🍊', 'category': 'fruit', 'caloriesPer100g': 47, 'protein': 0.9, 'calcium': 40, 'zinc': 0.1, 'vitaminD': 0},
  {'name': 'Avocado', 'icon': '🥑', 'category': 'fruit', 'caloriesPer100g': 160, 'protein': 2.0, 'calcium': 12, 'zinc': 0.6, 'vitaminD': 0},
  {'name': 'Blueberries', 'icon': '🫐', 'category': 'fruit', 'caloriesPer100g': 57, 'protein': 0.7, 'calcium': 6, 'zinc': 0.2, 'vitaminD': 0},
  {'name': 'Strawberries', 'icon': '🍓', 'category': 'fruit', 'caloriesPer100g': 32, 'protein': 0.7, 'calcium': 16, 'zinc': 0.1, 'vitaminD': 0},
  {'name': 'Kiwi', 'icon': '🥝', 'category': 'fruit', 'caloriesPer100g': 61, 'protein': 1.1, 'calcium': 34, 'zinc': 0.1, 'vitaminD': 0},

  // ── Grains ─────────────────────────────────────────────────────
  {'name': 'Oats (dry)', 'icon': '🌾', 'category': 'grain', 'caloriesPer100g': 389, 'protein': 16.9, 'calcium': 54, 'zinc': 3.6, 'vitaminD': 0},
  {'name': 'Quinoa (cooked)', 'icon': '🌾', 'category': 'grain', 'caloriesPer100g': 120, 'protein': 4.4, 'calcium': 17, 'zinc': 1.1, 'vitaminD': 0},
  {'name': 'Brown Rice (cooked)', 'icon': '🍚', 'category': 'grain', 'caloriesPer100g': 123, 'protein': 2.7, 'calcium': 10, 'zinc': 0.6, 'vitaminD': 0},
  {'name': 'Whole Wheat Bread', 'icon': '🍞', 'category': 'grain', 'caloriesPer100g': 247, 'protein': 12.9, 'calcium': 107, 'zinc': 1.8, 'vitaminD': 0},

  // ── Nuts & Seeds ───────────────────────────────────────────────
  {'name': 'Almonds', 'icon': '🌰', 'category': 'nuts', 'caloriesPer100g': 579, 'protein': 21.2, 'calcium': 269, 'zinc': 3.1, 'vitaminD': 0},
  {'name': 'Pumpkin Seeds', 'icon': '🎃', 'category': 'nuts', 'caloriesPer100g': 559, 'protein': 30.2, 'calcium': 46, 'zinc': 7.8, 'vitaminD': 0},
  {'name': 'Peanuts', 'icon': '🥜', 'category': 'nuts', 'caloriesPer100g': 567, 'protein': 25.8, 'calcium': 92, 'zinc': 3.3, 'vitaminD': 0},
  {'name': 'Cashews', 'icon': '🥜', 'category': 'nuts', 'caloriesPer100g': 553, 'protein': 18.2, 'calcium': 37, 'zinc': 5.8, 'vitaminD': 0},
  {'name': 'Sunflower Seeds', 'icon': '🌻', 'category': 'nuts', 'caloriesPer100g': 584, 'protein': 20.8, 'calcium': 78, 'zinc': 5.0, 'vitaminD': 0},
  {'name': 'Chia Seeds', 'icon': '🌱', 'category': 'nuts', 'caloriesPer100g': 486, 'protein': 16.5, 'calcium': 631, 'zinc': 4.6, 'vitaminD': 0},
  {'name': 'Walnuts', 'icon': '🌰', 'category': 'nuts', 'caloriesPer100g': 654, 'protein': 15.2, 'calcium': 98, 'zinc': 3.1, 'vitaminD': 0},
];

// ══════════════════════════════════════════════════════════════════════
// C) Weekly Meal Plan Suggestions
// ══════════════════════════════════════════════════════════════════════

const List<Map<String, dynamic>> mealPlanSuggestions = [
  // ── Day 1: Monday ──────────────────────────────────────────────
  {
    'day': 'Monday',
    'breakfast': {
      'name': 'Power Oatmeal Bowl',
      'description':
          'Oats cooked with milk, topped with banana slices, almonds, '
          'chia seeds, and a drizzle of honey.',
      'keyNutrients': ['Calcium', 'Protein', 'Magnesium'],
    },
    'lunch': {
      'name': 'Grilled Chicken & Quinoa Salad',
      'description':
          'Grilled chicken breast over quinoa with spinach, cherry '
          'tomatoes, red bell pepper, and lemon-olive oil dressing.',
      'keyNutrients': ['Protein', 'Zinc', 'Iron'],
    },
    'dinner': {
      'name': 'Salmon with Sweet Potato & Broccoli',
      'description':
          'Baked salmon fillet served with roasted sweet potato wedges '
          'and steamed broccoli.',
      'keyNutrients': ['Vitamin D', 'Protein', 'Calcium'],
    },
    'snacks': [
      {
        'name': 'Greek Yogurt & Berries',
        'description': 'Plain Greek yogurt with blueberries and a handful of walnuts.',
        'keyNutrients': ['Calcium', 'Protein'],
      },
      {
        'name': 'Pumpkin Seed Mix',
        'description': 'A small handful of pumpkin seeds and dark chocolate chips.',
        'keyNutrients': ['Zinc', 'Magnesium'],
      },
    ],
  },

  // ── Day 2: Tuesday ─────────────────────────────────────────────
  {
    'day': 'Tuesday',
    'breakfast': {
      'name': 'Scrambled Eggs on Whole Wheat Toast',
      'description':
          'Three scrambled eggs on two slices of whole wheat toast, '
          'served with a glass of fortified orange juice.',
      'keyNutrients': ['Protein', 'Vitamin D', 'Calcium'],
    },
    'lunch': {
      'name': 'Turkey & Black Bean Wrap',
      'description':
          'Whole wheat wrap filled with sliced turkey breast, black '
          'beans, avocado, lettuce, and salsa.',
      'keyNutrients': ['Protein', 'L-Arginine', 'Iron'],
    },
    'dinner': {
      'name': 'Beef Stir-Fry with Brown Rice',
      'description':
          'Lean beef strips stir-fried with broccoli, bell peppers, '
          'and carrots, served over brown rice.',
      'keyNutrients': ['Zinc', 'Protein', 'Vitamin A'],
    },
    'snacks': [
      {
        'name': 'Banana & Peanut Butter',
        'description': 'One banana with two tablespoons of natural peanut butter.',
        'keyNutrients': ['Magnesium', 'Protein'],
      },
      {
        'name': 'Cheese & Crackers',
        'description': 'Cheddar cheese slices with whole grain crackers.',
        'keyNutrients': ['Calcium', 'Phosphorus'],
      },
    ],
  },

  // ── Day 3: Wednesday ───────────────────────────────────────────
  {
    'day': 'Wednesday',
    'breakfast': {
      'name': 'Smoothie Bowl',
      'description':
          'Blended spinach, banana, Greek yogurt, and milk, topped with '
          'granola, strawberries, and sunflower seeds.',
      'keyNutrients': ['Calcium', 'Iron', 'Protein'],
    },
    'lunch': {
      'name': 'Lentil Soup with Whole Wheat Bread',
      'description':
          'Hearty red lentil soup with carrots, celery, and cumin, '
          'served with a slice of whole wheat bread.',
      'keyNutrients': ['Iron', 'Protein', 'Phosphorus'],
    },
    'dinner': {
      'name': 'Grilled Chicken with Kale & Potatoes',
      'description':
          'Herb-grilled chicken thighs with sauteed kale and roasted '
          'baby potatoes.',
      'keyNutrients': ['Protein', 'Calcium', 'Zinc'],
    },
    'snacks': [
      {
        'name': 'Hard-Boiled Eggs',
        'description': 'Two hard-boiled eggs with a pinch of salt and pepper.',
        'keyNutrients': ['Protein', 'Vitamin D'],
      },
      {
        'name': 'Trail Mix',
        'description': 'Almonds, cashews, pumpkin seeds, and dried cranberries.',
        'keyNutrients': ['Zinc', 'Magnesium'],
      },
    ],
  },

  // ── Day 4: Thursday ────────────────────────────────────────────
  {
    'day': 'Thursday',
    'breakfast': {
      'name': 'Cottage Cheese Pancakes',
      'description':
          'Pancakes made with cottage cheese, oats, and eggs, topped '
          'with fresh berries and a drizzle of maple syrup.',
      'keyNutrients': ['Protein', 'Calcium', 'Phosphorus'],
    },
    'lunch': {
      'name': 'Tuna Salad Sandwich',
      'description':
          'Canned tuna mixed with Greek yogurt, celery, and mustard '
          'on whole wheat bread, with a side of carrot sticks.',
      'keyNutrients': ['Protein', 'Vitamin D', 'Vitamin A'],
    },
    'dinner': {
      'name': 'Lamb Chops with Quinoa & Spinach',
      'description':
          'Pan-seared lamb chops served with quinoa pilaf and garlic '
          'sauteed spinach.',
      'keyNutrients': ['Zinc', 'Iron', 'Calcium'],
    },
    'snacks': [
      {
        'name': 'Edamame',
        'description': 'Steamed edamame pods lightly salted.',
        'keyNutrients': ['Protein', 'L-Arginine'],
      },
      {
        'name': 'Milk & Dark Chocolate',
        'description': 'A glass of warm milk with a small square of dark chocolate.',
        'keyNutrients': ['Calcium', 'Magnesium'],
      },
    ],
  },

  // ── Day 5: Friday ──────────────────────────────────────────────
  {
    'day': 'Friday',
    'breakfast': {
      'name': 'Avocado Toast with Eggs',
      'description':
          'Two slices of whole wheat toast with mashed avocado, a '
          'poached egg on each, and a sprinkle of chia seeds.',
      'keyNutrients': ['Protein', 'Vitamin D', 'Magnesium'],
    },
    'lunch': {
      'name': 'Chickpea & Vegetable Curry',
      'description':
          'Chickpeas cooked in a tomato-coconut curry sauce with sweet '
          'potato and spinach, served with brown rice.',
      'keyNutrients': ['Iron', 'Zinc', 'Vitamin A'],
    },
    'dinner': {
      'name': 'Baked Mackerel with Roasted Vegetables',
      'description':
          'Whole baked mackerel seasoned with lemon and herbs, served '
          'with roasted broccoli, carrots, and red onion.',
      'keyNutrients': ['Vitamin D', 'Protein', 'Calcium'],
    },
    'snacks': [
      {
        'name': 'Yogurt Parfait',
        'description': 'Layered Greek yogurt, granola, and kiwi slices.',
        'keyNutrients': ['Calcium', 'Protein'],
      },
      {
        'name': 'Almond Butter on Apple Slices',
        'description': 'Sliced apple with a tablespoon of almond butter.',
        'keyNutrients': ['Magnesium', 'Vitamin A'],
      },
    ],
  },

  // ── Day 6: Saturday ────────────────────────────────────────────
  {
    'day': 'Saturday',
    'breakfast': {
      'name': 'Protein Omelet',
      'description':
          'Three-egg omelet filled with mozzarella, spinach, and '
          'mushrooms, served with a glass of milk.',
      'keyNutrients': ['Protein', 'Calcium', 'Vitamin D'],
    },
    'lunch': {
      'name': 'Grilled Shrimp Tacos',
      'description':
          'Corn tortillas with grilled shrimp, avocado, cabbage slaw, '
          'and lime-cilantro sauce.',
      'keyNutrients': ['Protein', 'Zinc', 'Calcium'],
    },
    'dinner': {
      'name': 'Chicken & Lentil Stew',
      'description':
          'Slow-cooked chicken thighs with lentils, carrots, celery, '
          'and tomatoes, served with whole wheat bread.',
      'keyNutrients': ['Iron', 'Protein', 'Phosphorus'],
    },
    'snacks': [
      {
        'name': 'Sardines on Toast',
        'description': 'Canned sardines on a slice of whole wheat toast with lemon.',
        'keyNutrients': ['Calcium', 'Vitamin D'],
      },
      {
        'name': 'Mixed Nuts',
        'description': 'A handful of almonds, cashews, and walnuts.',
        'keyNutrients': ['Zinc', 'Magnesium'],
      },
    ],
  },

  // ── Day 7: Sunday ──────────────────────────────────────────────
  {
    'day': 'Sunday',
    'breakfast': {
      'name': 'French Toast with Berries',
      'description':
          'Whole wheat French toast dipped in egg and milk, topped with '
          'strawberries, blueberries, and a dollop of Greek yogurt.',
      'keyNutrients': ['Protein', 'Calcium', 'Vitamin A'],
    },
    'lunch': {
      'name': 'Beef Burger with Sweet Potato Fries',
      'description':
          'Homemade lean beef patty on a whole wheat bun with lettuce, '
          'tomato, and cheese, with baked sweet potato fries on the side.',
      'keyNutrients': ['Zinc', 'Protein', 'Vitamin A'],
    },
    'dinner': {
      'name': 'Baked Salmon with Quinoa & Edamame',
      'description':
          'Teriyaki-glazed baked salmon over quinoa, with steamed '
          'edamame and a side of sauteed spinach.',
      'keyNutrients': ['Vitamin D', 'Protein', 'L-Arginine'],
    },
    'snacks': [
      {
        'name': 'Cottage Cheese & Pineapple',
        'description': 'Cottage cheese with pineapple chunks and a drizzle of honey.',
        'keyNutrients': ['Protein', 'Calcium'],
      },
      {
        'name': 'Peanut Butter Banana Bites',
        'description': 'Banana slices with peanut butter, topped with chia seeds.',
        'keyNutrients': ['Magnesium', 'L-Arginine'],
      },
    ],
  },
];
