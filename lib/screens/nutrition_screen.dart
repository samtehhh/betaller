import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../l10n/app_localizations.dart';
import '../utils/constants.dart';
import '../utils/nutrition_data.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  int _selectedSection = 0;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'all';
  final Set<int> _expandedNutrients = {};

  static const _sectionIcons = [
    CupertinoIcons.calendar,
    CupertinoIcons.bolt_fill,
    CupertinoIcons.search,
  ];

  List<String> _sectionLabels(AppLocalizations l) => [l.sectionMealPlan, l.sectionNutrients, l.sectionFoods];

  Map<String, String> _foodCategories(AppLocalizations l) => {
    'all': l.categoryAll,
    'dairy': l.categoryDairy,
    'meat': l.categoryMeatFish,
    'vegetable': l.categoryVegetables,
    'fruit': l.categoryFruits,
    'grain': l.categoryGrains,
    'nuts': l.categoryNutsSeeds,
  };

  static const _nutrientChipColors = <String, Color>{
    'Calcium': Color(0xFF40C4FF),
    'Protein': Color(0xFFFF9100),
    'Zinc': Color(0xFFFFD740),
    'Vitamin D': Color(0xFFF0A0E5),
    'Iron': Color(0xFFFF5252),
    'Magnesium': Color(0xFF69F0AE),
    'Phosphorus': Color(0xFF8C9EFF),
    'Vitamin A': Color(0xFFFF4DB8),
    'L-Arginine': Color(0xFFB388FF),
  };

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final lang = Localizations.localeOf(context).languageCode;
    final sectionLabels = _sectionLabels(l);
    final foodCats = _foodCategories(l);
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          // ── Purple Gradient Header ──
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E1B4B), Color(0xFF0A0A14)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 8, 22, 16),
                  child: Text(
                    l.nutritionTitle,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                      letterSpacing: -1.2,
                      shadows: [
                        Shadow(
                          color: AppColors.primary.withValues(alpha: 0.2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── Section Toggle ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: GlassCard(
                padding: const EdgeInsets.all(4),
                borderRadius: 16,
                child: Row(
                  children: List.generate(3, (i) {
                    final selected = _selectedSection == i;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedSection = i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOut,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: selected
                                ? AppColors.primaryDark.withValues(alpha: 0.5)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(13),
                            border: selected
                                ? Border.all(
                                    color: AppColors.primary.withValues(alpha: 0.3),
                                  )
                                : null,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _sectionIcons[i],
                                size: 15,
                                color: selected
                                    ? AppColors.primary
                                    : AppColors.textTertiary,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                sectionLabels[i],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight:
                                      selected ? FontWeight.w700 : FontWeight.w500,
                                  color: selected
                                      ? AppColors.textPrimary
                                      : AppColors.textTertiary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),

          // ── Section Content ──
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 110),
            sliver: _buildSectionContent(l, foodCats, lang),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionContent(AppLocalizations l, Map<String, String> foodCats, String lang) {
    switch (_selectedSection) {
      case 0:
        return _buildMealPlanSection(l, lang);
      case 1:
        return _buildNutrientsSection(l, lang);
      case 2:
        return _buildFoodDatabaseSection(l, foodCats);
      default:
        return const SliverToBoxAdapter(child: SizedBox());
    }
  }

  // ════════════════════════════════════════════════════════════════
  // SECTION 1: Daily Meal Plan
  // ════════════════════════════════════════════════════════════════

  SliverList _buildMealPlanSection(AppLocalizations l, String lang) {
    final dayIndex = DateTime.now().weekday - 1; // 0=Mon ... 6=Sun
    final plans = getMealPlanSuggestions(lang);
    final today = plans[dayIndex % plans.length];
    final dayName = today['day'] as String;
    final breakfast = today['breakfast'] as Map<String, dynamic>;
    final lunch = today['lunch'] as Map<String, dynamic>;
    final dinner = today['dinner'] as Map<String, dynamic>;
    final snacks = today['snacks'] as List<dynamic>;

    return SliverList(
      delegate: SliverChildListDelegate([
        // Day header
        GlassCard(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          fillColor: AppColors.primaryDark.withValues(alpha: 0.25),
          child: Row(
            children: [
              const Icon(CupertinoIcons.calendar_today, color: AppColors.primary, size: 20),
              const SizedBox(width: 10),
              Text(
                l.todaysPlan(dayName),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),

        _buildMealCard(l.breakfast, '🌅', breakfast),
        _buildMealCard(l.lunch, '☀️', lunch),
        _buildMealCard(l.dinner, '🌙', dinner),

        // Snacks header
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: SectionHeader(
            icon: CupertinoIcons.heart_fill,
            title: l.snacks,
            iconColor: AppColors.orange,
          ),
        ),

        ...snacks.map((s) {
          final snack = s as Map<String, dynamic>;
          return _buildMealCard(
            snack['name'] as String,
            '🍎',
            snack,
            compact: true,
          );
        }),
      ]),
    );
  }

  Widget _buildMealCard(
    String label,
    String emoji,
    Map<String, dynamic> meal, {
    bool compact = false,
  }) {
    final name = meal['name'] as String;
    final desc = meal['description'] as String;
    final nutrients = (meal['keyNutrients'] as List<dynamic>).cast<String>();

    return GlassCard(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!compact) ...[
            Row(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textTertiary,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textTertiary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: nutrients.map((n) {
              final color = _nutrientChipColors[n] ?? AppColors.primary;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: color.withValues(alpha: 0.3)),
                ),
                child: Text(
                  n,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════════════════
  // SECTION 2: Growth Nutrients
  // ════════════════════════════════════════════════════════════════

  SliverList _buildNutrientsSection(AppLocalizations l, String lang) {
    final nutrients = getGrowthNutrients(lang);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => _buildNutrientCard(index, l, nutrients),
        childCount: nutrients.length,
      ),
    );
  }

  Widget _buildNutrientCard(int index, AppLocalizations l, List<Map<String, dynamic>> nutrients) {
    final nutrient = nutrients[index];
    final name = nutrient['name'] as String;
    final icon = nutrient['icon'] as String;
    final role = nutrient['role'] as String;
    final dailyNeedByAge =
        nutrient['dailyNeedByAge'] as Map<String, dynamic>;
    final topFoods = nutrient['topFoods'] as List<dynamic>;
    final isExpanded = _expandedNutrients.contains(index);

    // Pick a reasonable default age range
    final dailyNeed = dailyNeedByAge['14-18'] as String? ??
        dailyNeedByAge.values.first as String;

    return GlassCard(
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          // Header - always visible
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              setState(() {
                if (isExpanded) {
                  _expandedNutrients.remove(index);
                } else {
                  _expandedNutrients.add(index);
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Icon circle
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark.withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: Text(icon, style: const TextStyle(fontSize: 22)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          l.dailyLabel(dailyNeed),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      CupertinoIcons.chevron_down,
                      size: 16,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Role description - always visible
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Text(
              role,
              maxLines: isExpanded ? null : 2,
              overflow: isExpanded ? null : TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textTertiary,
                height: 1.45,
              ),
            ),
          ),

          // Daily need by age + top foods - expanded
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: _buildExpandedNutrientContent(dailyNeedByAge, topFoods, l),
            crossFadeState:
                isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedNutrientContent(
    Map<String, dynamic> dailyNeedByAge,
    List<dynamic> topFoods,
    AppLocalizations l,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Age-based needs
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryDark.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.dailyNeedByAge,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textTertiary,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                ...dailyNeedByAge.entries.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l.agePrefix(e.key),
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textTertiary,
                          ),
                        ),
                        Text(
                          e.value as String,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Top food sources
          Text(
            l.topFoodSources,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.textTertiary,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          ...topFoods.map((f) {
            final food = f as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      food['name'] as String,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ),
                  Text(
                    food['amount'] as String,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════════════════
  // SECTION 3: Food Database
  // ════════════════════════════════════════════════════════════════

  SliverList _buildFoodDatabaseSection(AppLocalizations l, Map<String, String> foodCats) {
    // Filter foods
    final filtered = foodDatabase.where((food) {
      final name = (food['name'] as String).toLowerCase();
      final matchesSearch =
          _searchQuery.isEmpty || name.contains(_searchQuery.toLowerCase());
      final matchesCategory =
          _selectedCategory == 'all' || food['category'] == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    return SliverList(
      delegate: SliverChildListDelegate([
        // Search bar
        GlassCard(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          borderRadius: 16,
          child: Row(
            children: [
              Icon(CupertinoIcons.search, size: 18, color: AppColors.textTertiary),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: (v) => setState(() => _searchQuery = v),
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: l.searchFoods,
                    hintStyle: TextStyle(color: AppColors.textTertiary, fontSize: 14),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              if (_searchQuery.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    _searchController.clear();
                    setState(() => _searchQuery = '');
                  },
                  child: Icon(
                    CupertinoIcons.xmark_circle_fill,
                    size: 18,
                    color: AppColors.textTertiary,
                  ),
                ),
            ],
          ),
        ),

        // Category filters
        SizedBox(
          height: 38,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: foodCats.entries.map((entry) {
              final selected = _selectedCategory == entry.key;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () => setState(() => _selectedCategory = entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primaryDark.withValues(alpha: 0.5)
                          : AppColors.cardFill,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: selected
                            ? AppColors.primary.withValues(alpha: 0.4)
                            : AppColors.cardBorder,
                      ),
                    ),
                    child: Text(
                      entry.value,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                        color: selected
                            ? AppColors.primary
                            : AppColors.textTertiary,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 12),

        // Results count
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            l.nFoods('${filtered.length}'),
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textTertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Food list
        ...filtered.map((food) => _buildFoodItem(food)),
      ]),
    );
  }

  Widget _buildFoodItem(Map<String, dynamic> food) {
    final name = food['name'] as String;
    final icon = food['icon'] as String;
    final protein = food['protein'] as num;
    final calcium = food['calcium'] as num;
    final calories = food['caloriesPer100g'] as num;

    return GlassCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          // Food icon
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primaryDark.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(icon, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 12),

          // Name + calories
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$calories kcal / 100g',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),

          // Protein badge
          _buildNutrientBadge(
            '${protein.toStringAsFixed(1)}g',
            'Protein',
            AppColors.orange,
          ),
          const SizedBox(width: 8),

          // Calcium badge
          _buildNutrientBadge(
            '${calcium}mg',
            'Ca',
            const Color(0xFF40C4FF),
          ),
        ],
      ),
    );
  }

  Widget _buildNutrientBadge(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            color: color.withValues(alpha: 0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
