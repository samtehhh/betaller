import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

/// Custom Routine Builder — lets users create their own routines.
class CustomRoutineBuilderScreen extends StatefulWidget {
  const CustomRoutineBuilderScreen({super.key});

  @override
  State<CustomRoutineBuilderScreen> createState() =>
      _CustomRoutineBuilderScreenState();
}

class _CustomRoutineBuilderScreenState
    extends State<CustomRoutineBuilderScreen> {
  // ── Form controllers ──────────────────────────────────────
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _setsRepsController = TextEditingController();
  final _formController = TextEditingController();

  // ── Selected values ───────────────────────────────────────
  String _icon = '';
  String _category = '';
  String _difficulty = 'beginner';
  String _duration = '10 dk';

  static const List<String> _emojiOptions = [
    '💪', '🏃', '🧘', '🦘', '🌅', '🌙',
    '🥗', '🥛', '🍎', '🥚', '🐟', '🥜',
    '🏀', '🏊', '🚴', '🧗', '🤸', '🧠',
    '🔥', '⚡', '🌟', '🐍', '🦴', '❤️',
  ];

  static const List<String> _durationOptions = [
    '5 dk', '10 dk', '15 dk', '20 dk', '30 dk', '45 dk',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _setsRepsController.dispose();
    _formController.dispose();
    super.dispose();
  }

  bool get _isFormValid =>
      _titleController.text.trim().isNotEmpty &&
      _category.isNotEmpty &&
      _icon.isNotEmpty;

  /// Extract total timer seconds from a setsReps string.
  /// Examples:
  ///   "3x30 seconds" -> 90
  ///   "3x30 sec"     -> 90
  ///   "4x20s"        -> 80
  ///   "3x10 reps"    -> 0
  int _parseTimerSeconds(String raw) {
    final s = raw.trim().toLowerCase();
    if (s.isEmpty) return 0;
    final rx = RegExp(r'(\d+)\s*[x×]\s*(\d+)\s*(?:second|sec|s)\b');
    final m = rx.firstMatch(s);
    if (m != null) {
      final sets = int.tryParse(m.group(1) ?? '') ?? 0;
      final perSet = int.tryParse(m.group(2) ?? '') ?? 0;
      return sets * perSet;
    }
    return 0;
  }

  Color _categoryColor(String cat) {
    switch (cat) {
      case 'exercise':
        return AppColors.exerciseColor;
      case 'nutrition':
        return AppColors.nutritionColor;
      case 'sleep':
        return AppColors.sleepColor;
      case 'posture':
        return AppColors.postureColor;
      default:
        return AppColors.primary;
    }
  }

  void _onSave() {
    if (!_isFormValid) return;
    final provider = context.read<AppProvider>();
    provider.addCustomRoutine({
      'title': _titleController.text.trim(),
      'description': _descController.text.trim(),
      'category': _category,
      'duration': _duration,
      'icon': _icon,
      'difficulty': _difficulty,
      'setsReps': _setsRepsController.text.trim(),
      'formDescription': _formController.text.trim(),
      'scientificBasis': '',
      'musclesTargeted': <String>[],
      'timerSeconds': _parseTimerSeconds(_setsRepsController.text),
    });
    HapticFeedback.heavyImpact();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Column(
        children: [
          _buildTopBar(l),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildIconPicker(),
                  const SizedBox(height: 16),
                  _buildTitleSection(),
                  const SizedBox(height: 16),
                  _buildDescriptionSection(),
                  const SizedBox(height: 16),
                  _buildCategorySection(),
                  const SizedBox(height: 16),
                  _buildDifficultySection(),
                  const SizedBox(height: 16),
                  _buildDurationSection(),
                  const SizedBox(height: 16),
                  _buildSetsRepsSection(),
                  const SizedBox(height: 16),
                  _buildFormDescriptionSection(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          _buildSaveButton(),
        ],
      ),
    );
  }

  // ── Top bar ────────────────────────────────────────────────
  Widget _buildTopBar(AppLocalizations l) {
    return Container(
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
          padding: const EdgeInsets.fromLTRB(4, 6, 16, 14),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.back, color: Colors.white),
                onPressed: () {
                  HapticFeedback.lightImpact();
                  Navigator.of(context).pop();
                },
              ),
              Expanded(
                child: Text(
                  l.createRoutineTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: -0.4,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.35)),
                ),
                child: const Text(
                  'CUSTOM',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Icon picker ────────────────────────────────────────────
  Widget _buildIconPicker() {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.smiley,
            title: AppLocalizations.of(context)!.routineIcon,
          ),
          const SizedBox(height: 14),
          GridView.count(
            crossAxisCount: 6,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: _emojiOptions.map((e) {
              final selected = _icon == e;
              return GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  setState(() => _icon = e);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.primary.withValues(alpha: 0.22)
                        : Colors.white.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: selected
                          ? AppColors.primary
                          : Colors.white.withValues(alpha: 0.08),
                      width: selected ? 1.6 : 1,
                    ),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color:
                                  AppColors.primary.withValues(alpha: 0.35),
                              blurRadius: 14,
                              offset: const Offset(0, 0),
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ── Title ─────────────────────────────────────────────────
  Widget _buildTitleSection() {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.textformat,
            title: AppLocalizations.of(context)!.routineTitleField,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _titleController,
            maxLength: 40,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: AppColors.primary,
            onChanged: (_) => setState(() {}),
            decoration: _inputDecoration('e.g. Morning Power Stretch'),
          ),
        ],
      ),
    );
  }

  // ── Description ───────────────────────────────────────────
  Widget _buildDescriptionSection() {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.doc_text,
            title: AppLocalizations.of(context)!.routineDescField,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _descController,
            maxLength: 120,
            maxLines: 2,
            minLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: AppColors.primary,
            decoration: _inputDecoration(AppLocalizations.of(context)!.routineDescHint),
          ),
        ],
      ),
    );
  }

  // ── Category ──────────────────────────────────────────────
  Widget _buildCategorySection() {
    final l = AppLocalizations.of(context)!;
    final options = <Map<String, dynamic>>[
      {
        'key': 'exercise',
        'label': l.catExercise,
        'color': AppColors.exerciseColor,
        'icon': CupertinoIcons.bolt_fill,
      },
      {
        'key': 'nutrition',
        'label': l.catNutrition,
        'color': AppColors.nutritionColor,
        'icon': CupertinoIcons.leaf_arrow_circlepath,
      },
      {
        'key': 'sleep',
        'label': l.catSleep,
        'color': AppColors.sleepColor,
        'icon': CupertinoIcons.moon_stars_fill,
      },
      {
        'key': 'posture',
        'label': l.catPosture,
        'color': AppColors.postureColor,
        'icon': CupertinoIcons.person_fill,
      },
    ];

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.square_grid_2x2_fill,
            title: l.routineCategoryField,
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: options.map((opt) {
              final key = opt['key'] as String;
              final color = opt['color'] as Color;
              final selected = _category == key;
              return GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  setState(() => _category = key);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: selected
                        ? color.withValues(alpha: 0.22)
                        : Colors.white.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: selected
                          ? color
                          : Colors.white.withValues(alpha: 0.10),
                      width: selected ? 1.6 : 1,
                    ),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: color.withValues(alpha: 0.35),
                              blurRadius: 14,
                            )
                          ]
                        : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(opt['icon'] as IconData,
                          color: selected ? color : Colors.white70,
                          size: 16),
                      const SizedBox(width: 8),
                      Text(
                        opt['label'] as String,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: selected ? color : Colors.white,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ── Difficulty ────────────────────────────────────────────
  Widget _buildDifficultySection() {
    final l = AppLocalizations.of(context)!;
    final items = <Map<String, dynamic>>[
      {
        'key': 'beginner',
        'label': l.diffBeginner,
        'color': AppColors.success,
      },
      {
        'key': 'intermediate',
        'label': l.diffIntermediate,
        'color': AppColors.orange,
      },
      {
        'key': 'advanced',
        'label': l.diffAdvanced,
        'color': AppColors.error,
      },
    ];

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.flame_fill,
            title: l.routineDifficultyField,
          ),
          const SizedBox(height: 14),
          Row(
            children: items.map((item) {
              final key = item['key'] as String;
              final color = item['color'] as Color;
              final selected = _difficulty == key;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: item == items.last ? 0 : 8),
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() => _difficulty = key);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selected
                            ? color.withValues(alpha: 0.22)
                            : Colors.white.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: selected
                              ? color
                              : Colors.white.withValues(alpha: 0.10),
                          width: selected ? 1.6 : 1,
                        ),
                        boxShadow: selected
                            ? [
                                BoxShadow(
                                  color: color.withValues(alpha: 0.30),
                                  blurRadius: 12,
                                )
                              ]
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          item['label'] as String,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: selected ? color : Colors.white,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ── Duration ──────────────────────────────────────────────
  Widget _buildDurationSection() {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.clock_fill,
            title: AppLocalizations.of(context)!.routineDurationField,
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _durationOptions.map((d) {
              final selected = _duration == d;
              return GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  setState(() => _duration = d);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.cyan.withValues(alpha: 0.18)
                        : Colors.white.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: selected
                          ? AppColors.cyan
                          : Colors.white.withValues(alpha: 0.10),
                      width: selected ? 1.6 : 1,
                    ),
                    boxShadow: selected
                        ? [
                            BoxShadow(
                              color: AppColors.cyan.withValues(alpha: 0.30),
                              blurRadius: 12,
                            )
                          ]
                        : null,
                  ),
                  child: Text(
                    d,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: selected ? AppColors.cyan : Colors.white,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ── Sets x Reps ───────────────────────────────────────────
  Widget _buildSetsRepsSection() {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.number,
            title: AppLocalizations.of(context)!.routineSetsRepsField,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _setsRepsController,
            maxLength: 40,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            cursorColor: AppColors.primary,
            decoration: _inputDecoration('e.g. 3x10 reps or 3x30 seconds'),
          ),
        ],
      ),
    );
  }

  // ── Form description ─────────────────────────────────────
  Widget _buildFormDescriptionSection() {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            icon: CupertinoIcons.book_fill,
            title: AppLocalizations.of(context)!.routineFormField,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _formController,
            maxLength: 300,
            maxLines: 5,
            minLines: 3,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
            cursorColor: AppColors.primary,
            decoration:
                _inputDecoration(AppLocalizations.of(context)!.routineFormHint),
          ),
        ],
      ),
    );
  }

  // ── Save button ──────────────────────────────────────────
  Widget _buildSaveButton() {
    final enabled = _isFormValid;
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Opacity(
          opacity: enabled ? 1.0 : 0.4,
          child: GestureDetector(
            onTap: enabled ? _onSave : null,
            child: Container(
              height: 58,
              decoration: BoxDecoration(
                gradient: AppColors.gradientPrimary,
                borderRadius: BorderRadius.circular(18),
                boxShadow: enabled
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.45),
                          blurRadius: 22,
                          offset: const Offset(0, 6),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_icon.isNotEmpty) ...[
                    Text(_icon, style: const TextStyle(fontSize: 22)),
                    const SizedBox(width: 10),
                  ] else ...[
                    const Icon(CupertinoIcons.add_circled_solid,
                        color: Colors.white, size: 22),
                    const SizedBox(width: 10),
                  ],
                  Text(
                    AppLocalizations.of(context)!.createRoutine,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 0.4,
                      shadows: [
                        Shadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Shared input decoration ──────────────────────────────
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.white.withValues(alpha: 0.38),
        fontWeight: FontWeight.w500,
      ),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.04),
      counterStyle: TextStyle(
        color: Colors.white.withValues(alpha: 0.45),
        fontSize: 11,
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: Colors.white.withValues(alpha: 0.10),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: Colors.white.withValues(alpha: 0.10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: _category.isNotEmpty
              ? _categoryColor(_category)
              : AppColors.primary,
          width: 1.6,
        ),
      ),
    );
  }
}
