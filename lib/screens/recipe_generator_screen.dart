import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

// ── Recipe database ────────────────────────────────────────────
const _recipes = [
  {
    'id': 'high_protein_breakfast',
    'name': 'Power Protein Oatmeal',
    'category': 'breakfast',
    'goal': 'high_protein',
    'icon': '🥣',
    'protein': 32,
    'calories': 480,
    'time': 10, // minutes
    'difficulty': 'easy',
    'ingredients': [
      '1 cup oats',
      '1 cup milk',
      '2 scoops whey protein',
      '1 banana',
      '20g almonds',
      '1 tbsp honey',
    ],
    'instructions':
        'Cook oats with milk. Mix in protein powder. Top with banana, almonds, and honey.',
  },
  {
    'id': 'salmon_quinoa_bowl',
    'name': 'Salmon Quinoa Bowl',
    'category': 'lunch',
    'goal': 'omega3',
    'icon': '🍣',
    'protein': 38,
    'calories': 620,
    'time': 25,
    'difficulty': 'medium',
    'ingredients': [
      '150g salmon fillet',
      '1 cup quinoa',
      'Mixed greens',
      '1/2 avocado',
      'Lemon-olive oil dressing',
    ],
    'instructions':
        'Pan-sear salmon. Cook quinoa. Combine with greens and avocado. Drizzle dressing.',
  },
  {
    'id': 'greek_yogurt_parfait',
    'name': 'Greek Yogurt Parfait',
    'category': 'snack',
    'goal': 'calcium',
    'icon': '🥛',
    'protein': 20,
    'calories': 280,
    'time': 5,
    'difficulty': 'easy',
    'ingredients': [
      '1 cup Greek yogurt',
      '1/4 cup granola',
      '1/2 cup berries',
      '1 tbsp honey',
    ],
    'instructions':
        'Layer yogurt, granola, and berries in a glass. Drizzle with honey.',
  },
  {
    'id': 'chicken_sweet_potato',
    'name': 'Grilled Chicken & Sweet Potato',
    'category': 'dinner',
    'goal': 'high_protein',
    'icon': '🍗',
    'protein': 45,
    'calories': 580,
    'time': 30,
    'difficulty': 'medium',
    'ingredients': [
      '200g chicken breast',
      '1 large sweet potato',
      'Broccoli',
      'Olive oil, herbs',
    ],
    'instructions':
        'Grill chicken. Roast sweet potato. Steam broccoli. Season with herbs.',
  },
  {
    'id': 'spinach_omelet',
    'name': 'Spinach & Cheese Omelet',
    'category': 'breakfast',
    'goal': 'iron',
    'icon': '🍳',
    'protein': 28,
    'calories': 380,
    'time': 8,
    'difficulty': 'easy',
    'ingredients': [
      '3 eggs',
      '1 cup spinach',
      '30g cheese',
      'Olive oil',
    ],
    'instructions':
        'Whisk eggs. Sauté spinach. Pour eggs over spinach, add cheese, fold.',
  },
  {
    'id': 'lentil_soup',
    'name': 'Hearty Lentil Soup',
    'category': 'lunch',
    'goal': 'iron',
    'icon': '🍲',
    'protein': 22,
    'calories': 420,
    'time': 35,
    'difficulty': 'easy',
    'ingredients': [
      '1 cup red lentils',
      '1 onion',
      '2 carrots',
      'Tomato paste',
      'Cumin, paprika',
    ],
    'instructions':
        'Sauté onion and carrots. Add lentils, water, tomato paste, spices. Simmer 25 min.',
  },
  {
    'id': 'tuna_avocado_toast',
    'name': 'Tuna Avocado Toast',
    'category': 'snack',
    'goal': 'omega3',
    'icon': '🥑',
    'protein': 26,
    'calories': 340,
    'time': 5,
    'difficulty': 'easy',
    'ingredients': [
      '2 slices whole grain bread',
      '1 can tuna',
      '1/2 avocado',
      'Lemon, salt, pepper',
    ],
    'instructions':
        'Toast bread. Mash avocado. Mix tuna with lemon. Layer on toast.',
  },
  {
    'id': 'turkey_quinoa_bowl',
    'name': 'Turkey Quinoa Power Bowl',
    'category': 'dinner',
    'goal': 'high_protein',
    'icon': '🦃',
    'protein': 42,
    'calories': 550,
    'time': 25,
    'difficulty': 'medium',
    'ingredients': [
      '180g turkey breast',
      '1 cup cooked quinoa',
      'Mixed vegetables',
      'Tahini dressing',
    ],
    'instructions':
        'Grill turkey. Combine with quinoa and vegetables. Drizzle tahini.',
  },
];

// ── Screen ─────────────────────────────────────────────────────
class RecipeGeneratorScreen extends StatefulWidget {
  const RecipeGeneratorScreen({super.key});

  @override
  State<RecipeGeneratorScreen> createState() => _RecipeGeneratorScreenState();
}

class _RecipeGeneratorScreenState extends State<RecipeGeneratorScreen> {
  String _categoryFilter = 'all';
  String _goalFilter = 'all';

  static List<Map<String, String>> _categories(AppLocalizations l) => [
        {'key': 'all', 'label': l.recipesCategoryAll},
        {'key': 'breakfast', 'label': l.recipesCategoryBreakfast},
        {'key': 'lunch', 'label': l.recipesCategoryLunch},
        {'key': 'dinner', 'label': l.recipesCategoryDinner},
        {'key': 'snack', 'label': l.recipesCategorySnack},
      ];

  static List<Map<String, String>> _goals(AppLocalizations l) => [
        {'key': 'all', 'label': l.recipesGoalAll},
        {'key': 'high_protein', 'label': l.recipesGoalProtein},
        {'key': 'calcium', 'label': l.recipesGoalCalcium},
        {'key': 'omega3', 'label': l.recipesGoalOmega3},
        {'key': 'iron', 'label': l.recipesGoalIron},
      ];

  List<Map<String, dynamic>> get _filteredRecipes {
    return _recipes.where((r) {
      final catOk =
          _categoryFilter == 'all' || r['category'] == _categoryFilter;
      final goalOk = _goalFilter == 'all' || r['goal'] == _goalFilter;
      return catOk && goalOk;
    }).toList();
  }

  Color _difficultyColor(String diff) {
    switch (diff) {
      case 'easy':
        return AppColors.success;
      case 'medium':
        return AppColors.orange;
      case 'hard':
        return AppColors.error;
      default:
        return AppColors.primary;
    }
  }

  Color _categoryColor(String category) {
    switch (category) {
      case 'breakfast':
        return AppColors.orange;
      case 'lunch':
        return AppColors.success;
      case 'dinner':
        return AppColors.primary;
      case 'snack':
        return AppColors.cyan;
      default:
        return AppColors.primary;
    }
  }

  void _showInfoDialog() {
    final l = AppLocalizations.of(context)!;
    HapticFeedback.lightImpact();
    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.72),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: GlassCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                icon: CupertinoIcons.info_circle_fill,
                title: l.recipesAboutTitle,
              ),
              const SizedBox(height: 14),
              Text(
                l.recipesAboutBody,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    l.recipesClose,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    // Ensure provider wiring exists (for future personalization hooks).
    // ignore: unused_local_variable
    final provider = context.watch<AppProvider>();

    final recipes = _filteredRecipes;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          // ── Top bar + header ──
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0F0B24), Color(0xFF070B1A)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    // Top bar
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 6, 8, 0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(CupertinoIcons.back,
                                color: Colors.white),
                            onPressed: () {
                              HapticFeedback.lightImpact();
                              Navigator.of(context).pop();
                            },
                          ),
                          Expanded(
                            child: Text(
                              l.recipesTitle,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              CupertinoIcons.info_circle,
                              color: Colors.white,
                            ),
                            onPressed: _showInfoDialog,
                          ),
                        ],
                      ),
                    ),
                    // Title header
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 4, 22, 22),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l.recipesHeader,
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primary,
                                    letterSpacing: 2.0,
                                    shadows: [
                                      Shadow(
                                        color: AppColors.primary
                                            .withValues(alpha: 0.3),
                                        blurRadius: 12,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  l.recipesSubtitle,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textSecondary,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              gradient: AppColors.gradientAccent,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.orange
                                      .withValues(alpha: 0.45),
                                  blurRadius: 18,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text('🍽️',
                                  style: TextStyle(fontSize: 28)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Filters ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 6),
              child: _buildChipRow(
                items: _categories(l),
                selected: _categoryFilter,
                onSelect: (k) => setState(() => _categoryFilter = k),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 12),
              child: _buildChipRow(
                items: _goals(l),
                selected: _goalFilter,
                onSelect: (k) => setState(() => _goalFilter = k),
                accent: AppColors.cyan,
              ),
            ),
          ),

          // ── Recipe list ──
          if (recipes.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('🍽️', style: TextStyle(fontSize: 56)),
                      const SizedBox(height: 14),
                      Text(
                        l.recipesNoMatch,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final recipe = recipes[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: _buildRecipeCard(recipe),
                    );
                  },
                  childCount: recipes.length,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ── Chip row ──────────────────────────────────────────────
  Widget _buildChipRow({
    required List<Map<String, String>> items,
    required String selected,
    required ValueChanged<String> onSelect,
    Color accent = AppColors.primary,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: items.map((item) {
          final key = item['key']!;
          final label = item['label']!;
          final isSelected = selected == key;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                onSelect(key);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? accent.withValues(alpha: 0.20)
                      : Colors.white.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected
                        ? accent
                        : Colors.white.withValues(alpha: 0.10),
                    width: isSelected ? 1.5 : 1,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: accent.withValues(alpha: 0.28),
                            blurRadius: 12,
                          )
                        ]
                      : null,
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: isSelected ? accent : Colors.white,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ── Recipe card ──────────────────────────────────────────
  Widget _buildRecipeCard(Map<String, dynamic> recipe) {
    final category = recipe['category'] as String;
    final catColor = _categoryColor(category);
    final diff = recipe['difficulty'] as String;
    final diffColor = _difficultyColor(diff);
    final calories = recipe['calories'] as int;
    final protein = recipe['protein'] as int;
    final time = recipe['time'] as int;
    final icon = recipe['icon'] as String;

    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        _showRecipeDetail(recipe);
      },
      child: GlassCard(
        glowColor: catColor.withValues(alpha: 0.14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emoji circle
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    catColor.withValues(alpha: 0.28),
                    catColor.withValues(alpha: 0.08),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: catColor.withValues(alpha: 0.45),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: catColor.withValues(alpha: 0.30),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(icon, style: const TextStyle(fontSize: 30)),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe['name'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildCategoryBadge(category, catColor),
                      const SizedBox(width: 6),
                      _buildDifficultyBadge(diff, diffColor),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildStat('🔥', '$calories'),
                      const SizedBox(width: 14),
                      _buildStat('💪', '${protein}g'),
                      const SizedBox(width: 14),
                      _buildStat('⏱️', '${time}m'),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_right,
              color: Colors.white38,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBadge(String category, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        category.toUpperCase(),
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w800,
          color: color,
          letterSpacing: 0.6,
        ),
      ),
    );
  }

  Widget _buildDifficultyBadge(String diff, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        diff.toUpperCase(),
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w800,
          color: color,
          letterSpacing: 0.6,
        ),
      ),
    );
  }

  Widget _buildStat(String emoji, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 13)),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }

  // ── Detail dialog ────────────────────────────────────────
  void _showRecipeDetail(Map<String, dynamic> recipe) {
    final l = AppLocalizations.of(context)!;
    final category = recipe['category'] as String;
    final catColor = _categoryColor(category);
    final diff = recipe['difficulty'] as String;
    final diffColor = _difficultyColor(diff);
    final icon = recipe['icon'] as String;
    final name = recipe['name'] as String;
    final calories = recipe['calories'] as int;
    final protein = recipe['protein'] as int;
    final time = recipe['time'] as int;
    final ingredients =
        (recipe['ingredients'] as List).cast<String>();
    final instructions = recipe['instructions'] as String;

    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.78),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 640),
          child: GlassCard(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            glowColor: catColor.withValues(alpha: 0.24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            catColor.withValues(alpha: 0.32),
                            catColor.withValues(alpha: 0.08),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: catColor.withValues(alpha: 0.5),
                          width: 1.4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: catColor.withValues(alpha: 0.45),
                            blurRadius: 22,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child:
                            Text(icon, style: const TextStyle(fontSize: 44)),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.4,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              _buildCategoryBadge(category, catColor),
                              const SizedBox(width: 6),
                              _buildDifficultyBadge(diff, diffColor),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                // Stats row
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDetailStat('🔥', '$calories', 'kcal'),
                      _buildDetailStat('💪', '${protein}g', 'protein'),
                      _buildDetailStat('⏱️', '${time}m', 'time'),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                // Scrollable content
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(
                          icon: CupertinoIcons.square_list_fill,
                          title: l.recipesIngredients,
                        ),
                        const SizedBox(height: 10),
                        ...ingredients.map(
                          (ing) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: catColor,
                                      borderRadius:
                                          BorderRadius.circular(999),
                                      boxShadow: [
                                        BoxShadow(
                                          color: catColor
                                              .withValues(alpha: 0.6),
                                          blurRadius: 6,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    ing,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        SectionHeader(
                          icon: CupertinoIcons.book_fill,
                          title: l.recipesInstructions,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          instructions,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.55,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                // Close button
                GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientPrimary,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.42),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        l.recipesClose,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailStat(String emoji, String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: AppColors.textTertiary,
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }
}
