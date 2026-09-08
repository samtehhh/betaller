import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/education_data.dart';
import '../utils/localized_data.dart';
import 'exercise_detail_screen.dart';
import '../widgets/premium_paywall.dart';

// ── Category theming ─────────────────────────────────────────────

const List<String> _categoryKeys = [
  'all',
  'science',
  'nutrition',
  'exercise',
  'sleep',
  'myths',
];

/// Accent colour per article category — drives icons, chips and hero glows.
Color _categoryColor(String category) {
  switch (category) {
    case 'science':
      return AppColors.cyan;
    case 'nutrition':
      return AppColors.nutritionColor;
    case 'exercise':
      return AppColors.primary;
    case 'sleep':
      return AppColors.sleepColor;
    case 'myths':
      return AppColors.pink;
    default:
      return AppColors.primary;
  }
}

IconData _categoryIcon(String category) {
  switch (category) {
    case 'science':
      return CupertinoIcons.lab_flask_solid;
    case 'nutrition':
      return CupertinoIcons.leaf_arrow_circlepath;
    case 'exercise':
      return CupertinoIcons.flame_fill;
    case 'sleep':
      return CupertinoIcons.moon_stars_fill;
    case 'myths':
      return CupertinoIcons.question_circle_fill;
    default:
      return CupertinoIcons.square_grid_2x2_fill;
  }
}

/// Rough reading time in minutes, based on ~200 words per minute.
int _readMinutes(Map<String, dynamic> article) {
  final sections =
      (article['sections'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ??
      const [];
  var words = 0;
  for (final s in sections) {
    words += ((s['header'] as String?) ?? '').split(RegExp(r'\s+')).length;
    words += ((s['body'] as String?) ?? '').split(RegExp(r'\s+')).length;
  }
  return (words / 200).ceil().clamp(1, 60);
}

// ══════════════════════════════════════════════════════════════════
//  EducationScreen — article library
// ══════════════════════════════════════════════════════════════════

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  String _selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final lang = Localizations.localeOf(context).languageCode;
    final all = getEducationArticles(lang);
    final articles = _selectedCategory == 'all'
        ? all
        : all.where((a) => a['category'] == _selectedCategory).toList();
    final isPremium = context.watch<AppProvider>().isPremium;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          // ── Header ─────────────────────────────────
          SliverToBoxAdapter(
            child: _LibraryHeader(
              title: l.learnTitle,
              subtitle: l.learnSubtitle,
              count: all.length,
            ),
          ),

          // ── Category filter ────────────────────────
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _categoryKeys.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final key = _categoryKeys[index];
                  return _CategoryPill(
                    label: localizedEducationCategory(l, key),
                    icon: _categoryIcon(key),
                    color: _categoryColor(key),
                    selected: _selectedCategory == key,
                    onTap: () => setState(() => _selectedCategory = key),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 18)),

          // ── Article list ───────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 110),
            sliver: SliverList.separated(
              itemCount: articles.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) => _ArticleCard(
                article: articles[index],
                locked: !isPremium,
                onTap: () => _open(articles, index, isPremium),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _open(List<Map<String, dynamic>> articles, int index, bool isPremium) {
    if (!isPremium) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => PremiumPaywallScreen(),
      );
      return;
    }
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => ArticleDetailScreen(
          article: articles[index],
          siblings: articles,
          index: index,
        ),
      ),
    );
  }
}

// ── Library header ───────────────────────────────────────────────

class _LibraryHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final int count;

  const _LibraryHeader({
    required this.title,
    required this.subtitle,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF191338), Color(0xFF0F0D1C)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (canPop) ...[
                    _CircleButton(
                      icon: CupertinoIcons.chevron_left,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: AppColors.cardBorderLight),
                    ),
                    child: Text(
                      '$count',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.only(left: canPop ? 52 : 0),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: AppColors.textTertiary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.06),
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.cardBorder),
        ),
        alignment: Alignment.center,
        child: Icon(icon, size: 20, color: Colors.white),
      ),
    );
  }
}

// ── Category pill ────────────────────────────────────────────────

class _CategoryPill extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryPill({
    required this.label,
    required this.icon,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: selected
              ? color.withValues(alpha: 0.18)
              : Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected
                ? color.withValues(alpha: 0.55)
                : AppColors.cardBorder,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.25),
                    blurRadius: 16,
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 14,
              color: selected ? color : AppColors.textTertiary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected ? Colors.white : AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Article card ─────────────────────────────────────────────────

class _ArticleCard extends StatelessWidget {
  final Map<String, dynamic> article;
  final bool locked;
  final VoidCallback onTap;

  const _ArticleCard({
    required this.article,
    required this.locked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final category = (article['category'] as String?) ?? '';
    final color = _categoryColor(category);

    return GlassCard(
      padding: EdgeInsets.zero,
      borderRadius: 22,
      glowColor: color.withValues(alpha: 0.08),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(22),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Emoji tile with category tint
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color.withValues(alpha: 0.22),
                        color.withValues(alpha: 0.06),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: color.withValues(alpha: 0.22)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    article['icon'] as String? ?? '',
                    style: const TextStyle(fontSize: 26),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article['title'] as String? ?? '',
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              localizedEducationCategory(l, category),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w600,
                                color: color.withValues(alpha: 0.9),
                              ),
                            ),
                          ),
                          Text(
                            '  ·  ',
                            style: TextStyle(
                              fontSize: 11.5,
                              color: AppColors.textTertiary,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              l.readTimeMinutes(_readMinutes(article)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11.5,
                                color: AppColors.textTertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  locked
                      ? CupertinoIcons.lock_fill
                      : CupertinoIcons.chevron_right,
                  size: locked ? 15 : 16,
                  color: locked ? AppColors.warning : AppColors.textTertiary,
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

class ArticleDetailScreen extends StatefulWidget {
  final Map<String, dynamic> article;

  /// Full list the article came from, used for the "next article" footer.
  final List<Map<String, dynamic>>? siblings;
  final int? index;

  const ArticleDetailScreen({
    super.key,
    required this.article,
    this.siblings,
    this.index,
  });

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  final _scrollController = ScrollController();
  final _sectionKeys = <GlobalKey>[];
  double _progress = 0;
  bool _referencesOpen = false;

  List<Map<String, dynamic>> get _sections =>
      (widget.article['sections'] as List<dynamic>?)
          ?.cast<Map<String, dynamic>>() ??
      const [];

  @override
  void initState() {
    super.initState();
    _sectionKeys.addAll(List.generate(_sections.length, (_) => GlobalKey()));
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final max = _scrollController.position.maxScrollExtent;
    final next = max <= 0
        ? 0.0
        : (_scrollController.offset / max).clamp(0.0, 1.0);
    if ((next - _progress).abs() > 0.005) {
      setState(() => _progress = next);
    }
  }

  void _scrollToSection(int i) {
    final ctx = _sectionKeys[i].currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final article = widget.article;
    final category = (article['category'] as String?) ?? '';
    final color = _categoryColor(category);
    final references =
        (article['references'] as List<dynamic>?)?.cast<String>() ?? const [];
    final relatedRoutineIds =
        (article['relatedRoutineIds'] as List<dynamic>?)?.cast<String>() ??
        const [];

    final siblings = widget.siblings;
    final index = widget.index;
    final next =
        (siblings != null && index != null && index + 1 < siblings.length)
        ? siblings[index + 1]
        : null;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              // ── Hero app bar ─────────────────────────
              SliverAppBar(
                pinned: true,
                expandedHeight: MediaQuery.of(context).padding.top + 262,
                backgroundColor: AppColors.scaffold,
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                leadingWidth: 60,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: _CircleButton(
                    icon: CupertinoIcons.chevron_left,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1.0,
                  titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
                  title: _CollapsedTitle(
                    title: article['title'] as String? ?? '',
                  ),
                  background: _ArticleHero(
                    emoji: article['icon'] as String? ?? '',
                    title: article['title'] as String? ?? '',
                    categoryLabel: localizedEducationCategory(l, category),
                    categoryIcon: _categoryIcon(category),
                    readLabel: l.readTimeMinutes(_readMinutes(article)),
                    color: color,
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // ── Table of contents ────────────────
                    if (_sections.length > 1) ...[
                      _TableOfContents(
                        label: l.inThisArticle,
                        headers: [
                          for (final s in _sections)
                            (s['header'] as String?) ?? '',
                        ],
                        color: color,
                        onTap: _scrollToSection,
                      ),
                      const SizedBox(height: 22),
                    ],

                    // ── Sections ─────────────────────────
                    for (int i = 0; i < _sections.length; i++) ...[
                      if (i > 0) const SizedBox(height: 14),
                      _SectionCard(
                        key: _sectionKeys[i],
                        number: i + 1,
                        header: (_sections[i]['header'] as String?) ?? '',
                        body: (_sections[i]['body'] as String?) ?? '',
                        color: color,
                      ),
                    ],

                    // ── References ───────────────────────
                    if (references.isNotEmpty) ...[
                      const SizedBox(height: 22),
                      _ReferencesCard(
                        title: l.scientificReferences,
                        references: references,
                        expanded: _referencesOpen,
                        onToggle: () =>
                            setState(() => _referencesOpen = !_referencesOpen),
                      ),
                    ],

                    // ── Related routines ─────────────────
                    if (relatedRoutineIds.isNotEmpty) ...[
                      const SizedBox(height: 26),
                      SectionHeader(
                        icon: CupertinoIcons.bolt_fill,
                        title: l.relatedRoutines,
                      ),
                      const SizedBox(height: 12),
                      for (final id in relatedRoutineIds) ...[
                        _RelatedRoutineTile(routineId: id),
                        const SizedBox(height: 10),
                      ],
                    ],

                    // ── Next article ─────────────────────
                    if (next != null) ...[
                      const SizedBox(height: 20),
                      _NextArticleCard(
                        label: l.nextArticle,
                        article: next,
                        onTap: () => Navigator.of(context).pushReplacement(
                          CupertinoPageRoute(
                            builder: (_) => ArticleDetailScreen(
                              article: next,
                              siblings: siblings,
                              index: index! + 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ]),
                ),
              ),
            ],
          ),

          // ── Reading progress bar ───────────────────
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).padding.top + kToolbarHeight - 3,
            child: _ProgressBar(value: _progress, color: color),
          ),
        ],
      ),
    );
  }
}

// ── Hero ─────────────────────────────────────────────────────────

class _ArticleHero extends StatelessWidget {
  final String emoji;
  final String title;
  final String categoryLabel;
  final IconData categoryIcon;
  final String readLabel;
  final Color color;

  const _ArticleHero({
    required this.emoji,
    required this.title,
    required this.categoryLabel,
    required this.categoryIcon,
    required this.readLabel,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.22), AppColors.scaffold],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          MediaQuery.of(context).padding.top + kToolbarHeight + 8,
          20,
          18,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emoji badge with glow
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withValues(alpha: 0.28),
                    color.withValues(alpha: 0.06),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: color.withValues(alpha: 0.3)),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.28),
                    blurRadius: 30,
                    spreadRadius: -4,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(emoji, style: const TextStyle(fontSize: 34)),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Flexible(
                  child: _MetaChip(
                    icon: categoryIcon,
                    label: categoryLabel,
                    color: color,
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: _MetaChip(
                    icon: CupertinoIcons.clock,
                    label: readLabel,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                height: 1.2,
                letterSpacing: -0.6,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _MetaChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Title that only becomes visible once the hero has collapsed away.
class _CollapsedTitle extends StatelessWidget {
  final String title;

  const _CollapsedTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final settings = context
        .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    double opacity = 1;
    if (settings != null) {
      final delta = settings.maxExtent - settings.minExtent;
      final collapsed = delta <= 0
          ? 1.0
          : 1 - ((settings.currentExtent - settings.minExtent) / delta);
      opacity = ((collapsed - 0.75) / 0.25).clamp(0.0, 1.0);
    }
    return Opacity(
      opacity: opacity,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ── Reading progress ─────────────────────────────────────────────

class _ProgressBar extends StatelessWidget {
  final double value;
  final Color color;

  const _ProgressBar({required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3,
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(color: Colors.white.withValues(alpha: 0.05)),
            Container(
              width: constraints.maxWidth * value,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color.withValues(alpha: 0.4), color],
                ),
                boxShadow: [
                  BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Table of contents ────────────────────────────────────────────

class _TableOfContents extends StatelessWidget {
  final String label;
  final List<String> headers;
  final Color color;
  final ValueChanged<int> onTap;

  const _TableOfContents({
    required this.label,
    required this.headers,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 8),
      glowColor: color.withValues(alpha: 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: AppColors.textTertiary,
            ),
          ),
          const SizedBox(height: 6),
          for (int i = 0; i < headers.length; i++)
            InkWell(
              onTap: () => onTap(i),
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Row(
                  children: [
                    SizedBox(
                      width: 22,
                      child: Text(
                        '${i + 1}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: color,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        headers[i],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    Icon(
                      CupertinoIcons.arrow_down_right,
                      size: 12,
                      color: AppColors.textTertiary,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Section card ─────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final int number;
  final String header;
  final String body;
  final Color color;

  const _SectionCard({
    super.key,
    required this.number,
    required this.header,
    required this.body,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
      glowColor: color.withValues(alpha: 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: color.withValues(alpha: 0.28)),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$number',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    header,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                      letterSpacing: -0.3,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _ArticleBody(text: body, color: color),
        ],
      ),
    );
  }
}

/// Renders article body text, turning "• " and "1." lines into real list rows.
class _ArticleBody extends StatelessWidget {
  final String text;
  final Color color;

  const _ArticleBody({required this.text, required this.color});

  static final _numbered = RegExp(r'^(\d+)[.)]\s+');

  @override
  Widget build(BuildContext context) {
    final bodyStyle = TextStyle(
      fontSize: 14.5,
      height: 1.7,
      letterSpacing: 0.1,
      color: Colors.white.withValues(alpha: 0.74),
    );

    final children = <Widget>[];
    final lines = text.split('\n');

    for (var raw in lines) {
      final line = raw.trim();
      if (line.isEmpty) {
        children.add(const SizedBox(height: 12));
        continue;
      }
      if (children.isNotEmpty && children.last is! SizedBox) {
        children.add(const SizedBox(height: 6));
      }

      if (line.startsWith('•') || line.startsWith('-')) {
        children.add(
          _bullet(
            marker: Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 9),
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            text: line.substring(1).trim(),
            style: bodyStyle,
          ),
        );
        continue;
      }

      final match = _numbered.firstMatch(line);
      if (match != null) {
        children.add(
          _bullet(
            marker: SizedBox(
              width: 18,
              child: Text(
                '${match.group(1)}.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  height: 1.9,
                  color: color,
                ),
              ),
            ),
            text: line.substring(match.end).trim(),
            style: bodyStyle,
          ),
        );
        continue;
      }

      children.add(Text(line, style: bodyStyle));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget _bullet({
    required Widget marker,
    required String text,
    required TextStyle style,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          marker,
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: style)),
        ],
      ),
    );
  }
}

// ── References ───────────────────────────────────────────────────

class _ReferencesCard extends StatelessWidget {
  final String title;
  final List<String> references;
  final bool expanded;
  final VoidCallback onToggle;

  const _ReferencesCard({
    required this.title,
    required this.references,
    required this.expanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                children: [
                  const Icon(
                    CupertinoIcons.book_fill,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.1,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  Text(
                    '${references.length}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      CupertinoIcons.chevron_down,
                      size: 14,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 220),
            crossFadeState: expanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < references.length; i++) ...[
                    if (i > 0) const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${i + 1}.',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            references[i],
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.55,
                              color: Colors.white.withValues(alpha: 0.55),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            secondChild: const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}

// ── Related routine tile ─────────────────────────────────────────

class _RelatedRoutineTile extends StatelessWidget {
  final String routineId;

  const _RelatedRoutineTile({required this.routineId});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.read<AppProvider>();
    final matches = provider.allRoutines.where((r) => r.id == routineId);
    if (matches.isEmpty) return const SizedBox.shrink();
    final routine = matches.first;

    final info = localizedRoutine(l, routineId);
    final category = routine.category;
    final color =
        (categoryInfo[category]?['color'] as Color?) ?? AppColors.primary;

    return GlassCard(
      padding: EdgeInsets.zero,
      borderRadius: 18,
      glowColor: color.withValues(alpha: 0.06),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => ExerciseDetailScreen(routine: routine),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: color.withValues(alpha: 0.22)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    routine.icon,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        info['title'] ?? routineId,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        localizedCategory(l, category),
                        style: TextStyle(
                          fontSize: 11.5,
                          color: color.withValues(alpha: 0.85),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_right,
                  size: 15,
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

// ── Next article footer ──────────────────────────────────────────

class _NextArticleCard extends StatelessWidget {
  final String label;
  final Map<String, dynamic> article;
  final VoidCallback onTap;

  const _NextArticleCard({
    required this.label,
    required this.article,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = _categoryColor((article['category'] as String?) ?? '');
    return GlassCard(
      padding: EdgeInsets.zero,
      borderRadius: 20,
      glowColor: color.withValues(alpha: 0.08),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        article['title'] as String? ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 1.3,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  article['icon'] as String? ?? '',
                  style: const TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
