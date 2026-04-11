import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

/// Wellness Tracker — caffeine, stress, and growth journal in one screen.
///
/// Each section influences HGH / growth outcomes. The screen reads and
/// writes directly through [AppProvider] and surfaces a weekly insight
/// computed from the last 7 days of logs.
class WellnessTrackerScreen extends StatefulWidget {
  const WellnessTrackerScreen({super.key});

  @override
  State<WellnessTrackerScreen> createState() => _WellnessTrackerScreenState();
}

class _WellnessTrackerScreenState extends State<WellnessTrackerScreen>
    with TickerProviderStateMixin {
  // ── Caffeine sources (emoji + label + mg per serving) ──
  static const List<Map<String, Object>> _caffeineSources = [
    {'emoji': '☕', 'name': 'Coffee', 'mg': 95},
    {'emoji': '🍵', 'name': 'Tea', 'mg': 40},
    {'emoji': '🥤', 'name': 'Cola', 'mg': 35},
    {'emoji': '⚡', 'name': 'Energy', 'mg': 80},
  ];

  // Stress emoji levels (index 0 = level 1)
  static const List<String> _stressEmojis = ['😌', '😊', '😐', '😟', '😰'];

  // Journal mood emojis (index 0 = mood 1)
  static const List<String> _moodEmojis = ['😢', '😕', '😐', '🙂', '😄'];

  late final TextEditingController _noteController;
  int _selectedMood = 0; // 0 = none, 1-5 otherwise
  bool _editingJournal = false;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
    // Pre-fill from today's saved journal if any.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AppProvider>();
      final todayJ = provider.todayJournal;
      if (todayJ != null) {
        _noteController.text = (todayJ['note'] as String?) ?? '';
        _selectedMood = (todayJ['mood'] as int?) ?? 0;
      }
    });
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  // ── Helpers ────────────────────────────────────────────────

  /// Compute caffeine status band for current intake.
  _CaffeineBand _caffeineBand(int current, int limit) {
    if (limit <= 0) return _CaffeineBand.healthy;
    final ratio = current / limit;
    if (ratio < 0.5) return _CaffeineBand.healthy;
    if (ratio < 0.9) return _CaffeineBand.approaching;
    return _CaffeineBand.over;
  }

  String _stressLabel(int level, AppLocalizations l) {
    switch (level) {
      case 1:
        return l.stressVeryCalmLabel;
      case 2:
        return l.stressCalmLabel;
      case 3:
        return l.stressNeutralLabel;
      case 4:
        return l.stressStressedLabel;
      case 5:
        return l.stressVeryStressedLabel;
      default:
        return l.stressTapToLog;
    }
  }

  Color _stressColor(int level) {
    switch (level) {
      case 1:
      case 2:
        return AppColors.lime;
      case 3:
        return AppColors.primary;
      case 4:
        return AppColors.orange;
      case 5:
        return AppColors.error;
      default:
        return AppColors.textTertiary;
    }
  }

  /// Compute the weekly insight sentence from the last 7 days of data.
  String _weeklyInsight(AppProvider provider, AppLocalizations l) {
    final now = DateTime.now();
    final dates = List<String>.generate(7, (i) {
      final d = now.subtract(Duration(days: i));
      return d.toIso8601String().substring(0, 10);
    });

    // Caffeine average (only across days we have data on)
    final caffValues = dates
        .map((d) => provider.caffeineByDate[d])
        .whereType<int>()
        .toList();
    final stressValues = dates
        .map((d) => provider.stressByDate[d])
        .whereType<int>()
        .where((v) => v > 0)
        .toList();
    final moodValues = dates
        .map((d) => provider.journalByDate[d])
        .whereType<Map<String, dynamic>>()
        .map((m) => (m['mood'] as int?) ?? 0)
        .where((v) => v > 0)
        .toList();

    final totalLogs = caffValues.length + stressValues.length + moodValues.length;
    if (totalLogs < 3) {
      return l.insightNeedMoreData;
    }

    final limit = provider.caffeineLimit;
    final avgCaff = caffValues.isEmpty
        ? 0.0
        : caffValues.reduce((a, b) => a + b) / caffValues.length;
    final avgStress = stressValues.isEmpty
        ? 0.0
        : stressValues.reduce((a, b) => a + b) / stressValues.length;
    final avgMood = moodValues.isEmpty
        ? 0.0
        : moodValues.reduce((a, b) => a + b) / moodValues.length;

    // Priority 1: caffeine over limit
    if (avgCaff > limit * 0.9) {
      return l.insightCaffeineHigh;
    }
    // Priority 2: high stress
    if (avgStress >= 4) {
      return l.insightStressHigh;
    }
    // Priority 3: low mood
    if (avgMood > 0 && avgMood <= 2.5) {
      return l.insightMoodLow;
    }
    // Priority 4: all good
    if (avgCaff < limit * 0.5 && (avgStress == 0 || avgStress <= 2) && (avgMood == 0 || avgMood >= 4)) {
      return l.insightGreat;
    }
    // Default: neutral
    return l.insightDefault;
  }

  // ── Build ──────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Consumer<AppProvider>(
        builder: (context, provider, _) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildHeader(context),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildCaffeineSection(context, provider),
                    const SizedBox(height: 16),
                    _buildStressSection(context, provider),
                    const SizedBox(height: 16),
                    _buildJournalSection(context, provider),
                    const SizedBox(height: 16),
                    _buildInsightSection(context, provider),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ── Header ─────────────────────────────────────────────────

  Widget _buildHeader(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar: back, title, info
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Text(
                        l.wellnessTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.info_circle,
                        color: AppColors.textTertiary,
                      ),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        _showInfoSheet(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Big title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    l.wellnessHeader,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                      letterSpacing: 2.0,
                      shadows: [
                        Shadow(
                          color: AppColors.primary.withValues(alpha: 0.4),
                          blurRadius: 14,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    l.wellnessSubtitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textTertiary,
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

  void _showInfoSheet(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surfaceDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.info_circle_fill,
                        color: AppColors.primary, size: 22),
                    const SizedBox(width: 8),
                    Text(
                      l.wellnessInfoTitle,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  l.wellnessInfoBody,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 18),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: Text(
                      l.wellnessInfoGotIt,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ── SECTION 1: Caffeine Tracker ────────────────────────────

  Widget _buildCaffeineSection(BuildContext context, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    final current = provider.todayCaffeine;
    final limit = provider.caffeineLimit;
    final ratio = limit <= 0 ? 0.0 : (current / limit).clamp(0.0, 1.0);
    final band = _caffeineBand(current, limit);

    Color statusColor;
    String statusText;
    switch (band) {
      case _CaffeineBand.healthy:
        statusColor = AppColors.success;
        statusText = l.withinLimits;
        break;
      case _CaffeineBand.approaching:
        statusColor = AppColors.warning;
        statusText = l.approachingLimit;
        break;
      case _CaffeineBand.over:
        statusColor = AppColors.error;
        statusText = l.overLimit;
        break;
    }

    return GlassCard(
      glowColor: AppColors.orange.withValues(alpha: 0.14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.bolt_circle,
            title: l.caffeineToday,
            iconColor: AppColors.orange,
          ),
          const SizedBox(height: 14),
          // Big number
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '$current',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  color: AppColors.orange,
                  letterSpacing: 0.5,
                  shadows: [
                    Shadow(
                      color: AppColors.orange.withValues(alpha: 0.55),
                      blurRadius: 14,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '/ $limit mg',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GlowProgressBar(
            value: ratio,
            gradient: AppColors.gradientEnergy,
            glowColor: AppColors.orange,
            height: 10,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: statusColor.withValues(alpha: 0.6),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          // Quick add chips
          Row(
            children: [
              for (int i = 0; i < _caffeineSources.length; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                Expanded(
                  child: _CaffeineChip(
                    emoji: _caffeineSources[i]['emoji'] as String,
                    label: _caffeineSources[i]['name'] as String,
                    mg: _caffeineSources[i]['mg'] as int,
                    onTap: () {
                      HapticFeedback.lightImpact();
                      provider.addCaffeine(
                          _caffeineSources[i]['mg'] as int);
                    },
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: current == 0
                  ? null
                  : () {
                      HapticFeedback.mediumImpact();
                      provider.resetTodayCaffeine();
                    },
              icon: Icon(
                CupertinoIcons.refresh,
                size: 14,
                color: current == 0
                    ? AppColors.textTertiary
                    : AppColors.textSecondary,
              ),
              label: Text(
                l.resetToday,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: current == 0
                      ? AppColors.textTertiary
                      : AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── SECTION 2: Stress Level ────────────────────────────────

  Widget _buildStressSection(BuildContext context, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    final currentStress = provider.todayStress; // 0 if not set
    final isLogged = currentStress > 0;

    return GlassCard(
      glowColor: AppColors.pink.withValues(alpha: 0.14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.heart_circle,
            title: l.stressToday,
            iconColor: AppColors.pink,
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (i) {
              final level = i + 1;
              final selected = currentStress == level;
              return _StressEmojiButton(
                emoji: _stressEmojis[i],
                selected: selected,
                accent: _stressColor(level),
                onTap: () {
                  HapticFeedback.lightImpact();
                  provider.setTodayStress(level);
                },
              );
            }),
          ),
          const SizedBox(height: 16),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Text(
              isLogged
                  ? _stressLabel(currentStress, l)
                  : l.stressTapToLog,
              key: ValueKey('stress-$currentStress'),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: _stressColor(currentStress),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── SECTION 3: Growth Journal ──────────────────────────────

  Widget _buildJournalSection(BuildContext context, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    final todayJournal = provider.todayJournal;
    final alreadySaved = todayJournal != null && !_editingJournal;

    return GlassCard(
      glowColor: AppColors.lime.withValues(alpha: 0.12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.book_circle,
            title: l.todaysJournal,
            iconColor: AppColors.lime,
          ),
          const SizedBox(height: 18),
          if (alreadySaved)
            _buildSavedJournal(context, todayJournal)
          else
            _buildJournalEditor(context, provider),
        ],
      ),
    );
  }

  Widget _buildSavedJournal(
      BuildContext context, Map<String, dynamic> journal) {
    final l = AppLocalizations.of(context)!;
    final mood = (journal['mood'] as int?) ?? 0;
    final note = (journal['note'] as String?) ?? '';
    final moodEmoji =
        (mood >= 1 && mood <= 5) ? _moodEmojis[mood - 1] : '•';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              moodEmoji,
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                note.isEmpty ? l.journalNoNote : note,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                  fontStyle: note.isEmpty ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () {
              HapticFeedback.lightImpact();
              setState(() {
                _editingJournal = true;
                _selectedMood = mood;
                _noteController.text = note;
              });
            },
            icon: Icon(
              CupertinoIcons.pencil,
              size: 14,
              color: AppColors.lime,
            ),
            label: Text(
              l.journalEdit,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.lime,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJournalEditor(BuildContext context, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (i) {
            final mood = i + 1;
            final selected = _selectedMood == mood;
            return _MoodEmojiButton(
              emoji: _moodEmojis[i],
              selected: selected,
              onTap: () {
                HapticFeedback.lightImpact();
                setState(() => _selectedMood = mood);
              },
            );
          }),
        ),
        const SizedBox(height: 18),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.lime.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: TextField(
            controller: _noteController,
            maxLines: 1,
            maxLength: 140,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: AppColors.lime,
            decoration: InputDecoration(
              hintText: l.journalHowWasToday,
              hintStyle: TextStyle(
                color: AppColors.textTertiary,
                fontSize: 14,
              ),
              counterText: '',
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 12),
            ),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _selectedMood == 0
                ? null
                : () {
                    HapticFeedback.mediumImpact();
                    provider.setTodayJournal(
                      mood: _selectedMood,
                      note: _noteController.text.trim(),
                    );
                    setState(() => _editingJournal = false);
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.lime.withValues(alpha: 0.9),
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                        content: Text(
                          l.journalSaved,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lime,
              foregroundColor: Colors.black,
              disabledBackgroundColor:
                  AppColors.lime.withValues(alpha: 0.25),
              disabledForegroundColor: Colors.black54,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Text(
              l.journalSaveEntry,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── SECTION 4: Weekly Insight ──────────────────────────────

  Widget _buildInsightSection(BuildContext context, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    final sentence = _weeklyInsight(provider, l);

    // Compute display averages for subtitle.
    final now = DateTime.now();
    final dates = List<String>.generate(7, (i) {
      final d = now.subtract(Duration(days: i));
      return d.toIso8601String().substring(0, 10);
    });
    final caffValues = dates
        .map((d) => provider.caffeineByDate[d])
        .whereType<int>()
        .toList();
    final stressValues = dates
        .map((d) => provider.stressByDate[d])
        .whereType<int>()
        .where((v) => v > 0)
        .toList();
    final moodValues = dates
        .map((d) => provider.journalByDate[d])
        .whereType<Map<String, dynamic>>()
        .map((m) => (m['mood'] as int?) ?? 0)
        .where((v) => v > 0)
        .toList();

    final avgCaff = caffValues.isEmpty
        ? null
        : (caffValues.reduce((a, b) => a + b) / caffValues.length).round();
    final avgStress = stressValues.isEmpty
        ? null
        : (stressValues.reduce((a, b) => a + b) / stressValues.length);
    final avgMood = moodValues.isEmpty
        ? null
        : (moodValues.reduce((a, b) => a + b) / moodValues.length);

    return GlassCard(
      glowColor: AppColors.lime.withValues(alpha: 0.18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.sparkles,
            title: l.weeklyInsight,
            iconColor: AppColors.lime,
          ),
          const SizedBox(height: 14),
          Text(
            sentence,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _InsightStat(
                  label: l.weeklyInsightCaffeine,
                  value: avgCaff == null ? '—' : '$avgCaff',
                  unit: avgCaff == null ? '' : 'mg',
                  color: AppColors.orange,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _InsightStat(
                  label: l.weeklyInsightStress,
                  value: avgStress == null
                      ? '—'
                      : avgStress.toStringAsFixed(1),
                  unit: avgStress == null ? '' : '/5',
                  color: AppColors.pink,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _InsightStat(
                  label: l.weeklyInsightMood,
                  value: avgMood == null
                      ? '—'
                      : avgMood.toStringAsFixed(1),
                  unit: avgMood == null ? '' : '/5',
                  color: AppColors.lime,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum _CaffeineBand { healthy, approaching, over }

// ── Sub-widgets ──────────────────────────────────────────────

class _CaffeineChip extends StatefulWidget {
  final String emoji;
  final String label;
  final int mg;
  final VoidCallback onTap;

  const _CaffeineChip({
    required this.emoji,
    required this.label,
    required this.mg,
    required this.onTap,
  });

  @override
  State<_CaffeineChip> createState() => _CaffeineChipState();
}

class _CaffeineChipState extends State<_CaffeineChip> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        decoration: BoxDecoration(
          color: _pressed
              ? AppColors.orange.withValues(alpha: 0.22)
              : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.orange.withValues(alpha: _pressed ? 0.7 : 0.3),
            width: 1,
          ),
          boxShadow: _pressed
              ? [
                  BoxShadow(
                    color: AppColors.orange.withValues(alpha: 0.45),
                    blurRadius: 10,
                  ),
                ]
              : const [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 4),
            Text(
              widget.label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '+${widget.mg}mg',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StressEmojiButton extends StatelessWidget {
  final String emoji;
  final bool selected;
  final Color accent;
  final VoidCallback onTap;

  const _StressEmojiButton({
    required this.emoji,
    required this.selected,
    required this.accent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutBack,
        width: selected ? 56 : 46,
        height: selected ? 56 : 46,
        decoration: BoxDecoration(
          color: selected
              ? accent.withValues(alpha: 0.18)
              : Colors.white.withValues(alpha: 0.04),
          shape: BoxShape.circle,
          border: Border.all(
            color: selected
                ? accent.withValues(alpha: 0.9)
                : Colors.white.withValues(alpha: 0.08),
            width: selected ? 2 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.55),
                    blurRadius: 14,
                  ),
                ]
              : const [],
        ),
        alignment: Alignment.center,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 220),
          scale: selected ? 1.2 : 1.0,
          child: Text(
            emoji,
            style: const TextStyle(fontSize: 26),
          ),
        ),
      ),
    );
  }
}

class _MoodEmojiButton extends StatelessWidget {
  final String emoji;
  final bool selected;
  final VoidCallback onTap;

  const _MoodEmojiButton({
    required this.emoji,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutBack,
        width: selected ? 54 : 44,
        height: selected ? 54 : 44,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.lime.withValues(alpha: 0.18)
              : Colors.white.withValues(alpha: 0.04),
          shape: BoxShape.circle,
          border: Border.all(
            color: selected
                ? AppColors.lime.withValues(alpha: 0.9)
                : Colors.white.withValues(alpha: 0.08),
            width: selected ? 2 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.lime.withValues(alpha: 0.55),
                    blurRadius: 14,
                  ),
                ]
              : const [],
        ),
        alignment: Alignment.center,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 220),
          scale: selected ? 1.2 : 1.0,
          child: Text(
            emoji,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class _InsightStat extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _InsightStat({
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: AppColors.textTertiary,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: color,
                  shadows: [
                    Shadow(
                      color: color.withValues(alpha: 0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 2),
                Text(
                  unit,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: color.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
