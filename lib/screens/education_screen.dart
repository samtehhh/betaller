import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/constants.dart';
import '../utils/education_data.dart';

// ── Category filter definitions ──────────────────────────────────

const _categories = <String, String>{
  'all': 'All',
  'science': 'Science',
  'nutrition': 'Nutrition',
  'exercise': 'Exercise',
  'sleep': 'Sleep',
  'myths': 'Myths',
};

// ══════════════════════════════════════════════════════════════════
//  EducationScreen — article list with category filter
// ══════════════════════════════════════════════════════════════════

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  String _selectedCategory = 'all';

  List<Map<String, dynamic>> get _filteredArticles {
    if (_selectedCategory == 'all') return educationArticles;
    return educationArticles
        .where((a) => a['category'] == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          // ── Gradient header ────────────────────────
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E1B4B), Color(0xFF0A0A1A)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Learn',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Science-backed knowledge for growth',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── Category filter chips ──────────────────
          SliverToBoxAdapter(
            child: SizedBox(
              height: 46,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _categories.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final key = _categories.keys.elementAt(index);
                  final label = _categories.values.elementAt(index);
                  final selected = _selectedCategory == key;
                  return ChoiceChip(
                    label: Text(label),
                    selected: selected,
                    onSelected: (_) =>
                        setState(() => _selectedCategory = key),
                    selectedColor: AppColors.primaryDark,
                    backgroundColor: AppColors.cardFill,
                    side: BorderSide(
                      color: selected
                          ? AppColors.primary
                          : AppColors.cardBorder,
                      width: 0.5,
                    ),
                    labelStyle: TextStyle(
                      color: selected
                          ? Colors.white
                          : AppColors.textTertiary,
                      fontWeight:
                          selected ? FontWeight.w600 : FontWeight.w400,
                      fontSize: 13,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // ── Article list ───────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final article = _filteredArticles[index];
                  return _ArticleCard(
                    article: article,
                    onTap: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (_) =>
                            ArticleDetailScreen(article: article),
                      ),
                    ),
                  );
                },
                childCount: _filteredArticles.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Article card widget ──────────────────────────────────────────

class _ArticleCard extends StatelessWidget {
  final Map<String, dynamic> article;
  final VoidCallback onTap;

  const _ArticleCard({required this.article, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final category = (article['category'] as String?) ?? '';
    final categoryLabel =
        category[0].toUpperCase() + category.substring(1);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        padding: EdgeInsets.zero,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.cardFillLight,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    article['icon'] as String? ?? '',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(width: 14),
                // Title + category
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article['title'] as String? ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color:
                              AppColors.primaryDark.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          categoryLabel,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_right,
                  size: 16,
                  color: AppColors.textTertiary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  ArticleDetailScreen — full article view
// ══════════════════════════════════════════════════════════════════

class ArticleDetailScreen extends StatelessWidget {
  final Map<String, dynamic> article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final sections =
        (article['sections'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ??
            [];
    final references =
        (article['references'] as List<dynamic>?)?.cast<String>() ?? [];
    final relatedRoutineIds =
        (article['relatedRoutineIds'] as List<dynamic>?)?.cast<String>() ?? [];

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceDark,
        title: Text(
          article['title'] as String? ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: AppColors.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Article icon + title hero ─────────────
            Center(
              child: Text(
                article['icon'] as String? ?? '',
                style: const TextStyle(fontSize: 48),
              ),
            ),
            const SizedBox(height: 20),

            // ── Sections ─────────────────────────────
            for (int i = 0; i < sections.length; i++) ...[
              if (i > 0)
                Divider(
                  color: AppColors.cardBorder,
                  height: 32,
                ),
              Text(
                sections[i]['header'] as String? ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                sections[i]['body'] as String? ?? '',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.65,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
            ],

            // ── Scientific References ────────────────
            if (references.isNotEmpty) ...[
              const SizedBox(height: 28),
              Divider(color: AppColors.cardBorder, height: 1),
              const SizedBox(height: 20),
              SectionHeader(
                icon: CupertinoIcons.book_fill,
                title: 'Scientific References',
              ),
              const SizedBox(height: 12),
              GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < references.length; i++) ...[
                      if (i > 0) const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${i + 1}. ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              references[i],
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.5,
                                color: Colors.white.withValues(alpha: 0.6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],

            // ── Related Routines ─────────────────────
            if (relatedRoutineIds.isNotEmpty) ...[
              const SizedBox(height: 24),
              SectionHeader(
                icon: CupertinoIcons.bolt_fill,
                title: 'Related Routines',
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: relatedRoutineIds.map((id) {
                  final label = id.replaceAll('routine_', '').replaceAll('_', ' ');
                  final displayLabel =
                      label[0].toUpperCase() + label.substring(1);
                  return ActionChip(
                    label: Text(displayLabel),
                    avatar: Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    backgroundColor: AppColors.cardFill,
                    side: BorderSide(
                      color: AppColors.cardBorder,
                      width: 0.5,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onPressed: () {
                      // TODO: Navigate to routine detail
                    },
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
