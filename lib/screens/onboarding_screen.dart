import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/user_profile.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import 'main_screen.dart';
import '../widgets/journey_steps.dart';

// ─── Page index constants ─────────────────────────────────────────────────────
const int _kGenderPage      = 2;
const int _kWorkoutPage     = 6;
const int _kEthnicityPage   = 7;
const int _kPastHeightsPage = 11;
const int _kAnalyzingPage   = 15;
const int _kLastQuestion    = 14; // last page that shows the Next button

// ─────────────────────────────────────────────────────────────────────────────

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {

  // ── Controllers ─────────────────────────────────────────────────────────────
  final _pageController  = PageController();
  int _currentPage = 0;

  // ── Basic profile ────────────────────────────────────────────────────────────
  String   _gender    = 'male';
  DateTime _birthDate = DateTime(2008, 1, 1);

  // ── Height / Weight (metric stored internally) ───────────────────────────────
  bool _heightImperial = false;
  int  _selectedHeight = 170; // cm
  int  _selectedWeight = 65;  // kg
  int  _heightFt = 5;
  int  _heightIn = 7;
  int  _weightLbs = 150;

  // ── Parents ──────────────────────────────────────────────────────────────────
  int _selectedFatherHeight = 175; // cm
  int _selectedMotherHeight = 162; // cm
  int _dadFt = 5, _dadIn = 9;
  int _momFt = 5, _momIn = 4;

  // ── Lifestyle questions ──────────────────────────────────────────────────────
  String _weeklyWorkout = '';
  String _ethnicity     = '';


  // ── Foot size ────────────────────────────────────────────────────────────────
  double _footSize   = 8.5;   // US equivalent of EU 41
  bool   _footSizeEU = true;

  // ── Dream height ─────────────────────────────────────────────────────────────
  bool _dreamImperial  = false;
  int  _dreamHeightCm  = 183;
  int  _dreamFt = 6, _dreamIn = 0;

  // ── Sleep ────────────────────────────────────────────────────────────────────
  double _sleepHours = 7.5;

  // ── Past heights — onboarding picker ─────────────────────────────────────────
  final _obPastHeightValues = <int, double?>{};
  List<int> _obAges = [];
  int _obCurrentAgeIndex = 0;
  final PageController _obAgePageController = PageController(viewportFraction: 0.50);
  FixedExtentScrollController _obHeightPickerController = FixedExtentScrollController(initialItem: 60);
  static const int _kObMinH = 100;
  static const int _kObMaxH = 220;

  // ── Animation controllers ────────────────────────────────────────────────────

  // ─── Unit conversion helpers ──────────────────────────────────────────────
  static int    _ftInToCm(int ft, int inches) => ((ft * 12 + inches) * 2.54).round();
  static int    _cmToFt(int cm)    => (cm / 30.48).floor();
  static int    _cmToIn(int cm)    => ((cm / 2.54).round()) % 12;
  static int    _lbsToKg(int lbs)  => (lbs * 0.453592).round();
  static int    _kgToLbs(int kg)   => (kg * 2.20462).round();
  static double _usToEU(double us) => us + 32.5;
  static double _euToUS(double eu) => eu - 32.5;

  // ─────────────────────────────────────────────────────────────────────────────
  // Lifecycle
  // ─────────────────────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    // Sync ft/in with metric defaults
    _heightFt = _cmToFt(_selectedHeight);
    _heightIn = _cmToIn(_selectedHeight);
    _weightLbs = _kgToLbs(_selectedWeight);
    _dadFt = _cmToFt(_selectedFatherHeight);
    _dadIn = _cmToIn(_selectedFatherHeight);
    _momFt = _cmToFt(_selectedMotherHeight);
    _momIn = _cmToIn(_selectedMotherHeight);
    _dreamFt = _cmToFt(_dreamHeightCm);
    _dreamIn = _cmToIn(_dreamHeightCm);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _obAgePageController.dispose();
    _obHeightPickerController.dispose();
    super.dispose();
  }

  int get _userAge {
    final now = DateTime.now();
    int a = now.year - _birthDate.year;
    if (now.month < _birthDate.month ||
        (now.month == _birthDate.month && now.day < _birthDate.day)) { a--; }
    return a;
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Navigation
  // ─────────────────────────────────────────────────────────────────────────────

  void _nextPage() {
    FocusScope.of(context).unfocus();
    final page = _currentPage;
    if (page >= _kLastQuestion) {
      // Pre-compute profile & predictions before showing analyzing page
      _computeAnalysisResults();
      setState(() => _currentPage = _kAnalyzingPage);
      _pageController.jumpToPage(_kAnalyzingPage);
    } else {
      // Geçmiş boylar sayfasına girerken picker'ı hazırla
      if (page == _kPastHeightsPage - 1) _initObPastHeights();
      setState(() => _currentPage = page + 1);
      _pageController.animateToPage(
        page + 1,
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeInOut,
      );
    }
  }

  void _initObPastHeights() {
    final lastPastAge = _userAge - 1;
    _obAges = lastPastAge >= 10
        ? List.generate(lastPastAge - 9, (i) => lastPastAge - i)
        : [];
    _obCurrentAgeIndex = 0;
    _obHeightPickerController.dispose();
    final initialItem = (_selectedHeight - 5 - _kObMinH).clamp(0, _kObMaxH - _kObMinH);
    _obHeightPickerController = FixedExtentScrollController(initialItem: initialItem);
  }

  void _computeAnalysisResults() {
    final profile = UserProfile(
      name: 'User',
      gender: _gender,
      birthDate: _birthDate.toIso8601String().substring(0, 10),
      currentHeight: _selectedHeight.toDouble(),
      weight: _selectedWeight.toDouble(),
      fatherHeight: _selectedFatherHeight.toDouble(),
      motherHeight: _selectedMotherHeight.toDouble(),
    );
    final pastHeights = <int, double>{};
    for (final e in _obPastHeightValues.entries) {
      final val = e.value;
      if (val != null && e.key <= _userAge && val > 50 && val < 250) {
        pastHeights[e.key] = val;
      }
    }
    pastHeights[_userAge] = profile.currentHeight;
  }

  void _prevPage() {
    FocusScope.of(context).unfocus();
    if (_currentPage >= _kGenderPage && _currentPage <= _kLastQuestion) {
      setState(() => _currentPage = _currentPage - 1);
      _pageController.previousPage(
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeInOut,
      );
    }
  }

  bool _canProceed() {
    switch (_currentPage) {
      case _kWorkoutPage:   return _weeklyWorkout.isNotEmpty;
      case _kEthnicityPage: return _ethnicity.isNotEmpty;
      default:              return true;
    }
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Analysis
  // ─────────────────────────────────────────────────────────────────────────────

  void _saveProfile() {
    final profile = UserProfile(
      name: 'User',
      gender: _gender,
      birthDate: _birthDate.toIso8601String().substring(0, 10),
      currentHeight: _selectedHeight.toDouble(),
      weight: _selectedWeight.toDouble(),
      fatherHeight: _selectedFatherHeight.toDouble(),
      motherHeight: _selectedMotherHeight.toDouble(),
      ethnicity: _ethnicity,
    );
    final past = <int, double>{};
    for (final e in _obPastHeightValues.entries) {
      final val = e.value;
      if (val != null && e.key <= _userAge && val > 50 && val < 250) past[e.key] = val;
    }
    final p = context.read<AppProvider>();
    p.savePastHeights(past);
    p.setProfile(profile);
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // LANGUAGE PICKER
  // ─────────────────────────────────────────────────────────────────────────────

  static const _langs = [
    (locale: Locale('tr'), flag: '🇹🇷', name: 'TR'),
    (locale: Locale('en'), flag: '🇬🇧', name: 'EN'),
    (locale: Locale('de'), flag: '🇩🇪', name: 'DE'),
    (locale: Locale('fr'), flag: '🇫🇷', name: 'FR'),
    (locale: Locale('es'), flag: '🇪🇸', name: 'ES'),
    (locale: Locale('it'), flag: '🇮🇹', name: 'IT'),
    (locale: Locale('pt'), flag: '🇧🇷', name: 'PT'),
    (locale: Locale('hi'), flag: '🇮🇳', name: 'HI'),
  ];

  Widget _buildLanguageButton(BuildContext context) {
    final provider = context.read<AppProvider>();
    final currentCode = Localizations.localeOf(context).languageCode.toUpperCase();
    final currentFlag = _langs.firstWhere(
      (l) => l.name == currentCode,
      orElse: () => _langs[0],
    ).flag;

    return GestureDetector(
      onTap: () => _showLanguageSheet(context, provider),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(currentFlag, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 4),
            Icon(CupertinoIcons.chevron_down, size: 10, color: Colors.white.withValues(alpha: 0.50)),
          ],
        ),
      ),
    );
  }

  void _showLanguageSheet(BuildContext context, AppProvider provider) {
    final currentCode = Localizations.localeOf(context).languageCode;
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.70),
      builder: (ctx) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 260,
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0C0A16),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.15)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  blurRadius: 32,
                  spreadRadius: -4,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _langs.map((lang) {
                final selected = lang.locale.languageCode == currentCode;
                return GestureDetector(
                  onTap: () {
                    provider.setLocale(lang.locale);
                    Navigator.pop(ctx);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primary.withValues(alpha: 0.12)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      border: selected
                          ? Border.all(color: AppColors.primary.withValues(alpha: 0.30))
                          : null,
                    ),
                    child: Row(
                      children: [
                        Text(lang.flag, style: const TextStyle(fontSize: 20)),
                        const SizedBox(width: 12),
                        Text(
                          lang.name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        if (selected)
                          const Icon(CupertinoIcons.checkmark_circle_fill, color: AppColors.primary, size: 20),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // BUILD
  // ─────────────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final showNav    = _currentPage >= _kGenderPage && _currentPage <= _kLastQuestion;
    final showButton = _currentPage <= _kLastQuestion && _currentPage != _kPastHeightsPage;
    final progress   = _currentPage <= _kGenderPage
        ? 0.0
        : (_currentPage - 1) / (_kLastQuestion - 1).toDouble();

    final isAnalyzing = _currentPage == _kAnalyzingPage;

    return Scaffold(
      backgroundColor: const Color(0xFF080608),
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A0E2E), Color(0xFF0A0812), Color(0xFF060406)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // ── Main question flow ──────────────────────────────────────
              Column(
                children: [
                  // ── Top navigation bar ────────────────────────────────
                  if (showNav)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: _prevPage,
                            child: Container(
                              width: 40, height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.10),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(CupertinoIcons.arrow_left, color: Colors.white, size: 18),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: TweenAnimationBuilder<double>(
                                tween: Tween(begin: 0, end: progress),
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeOut,
                                builder: (ctx, v, _) => LinearProgressIndicator(
                                  value: v,
                                  minHeight: 4,
                                  backgroundColor: Colors.white.withValues(alpha: 0.10),
                                  valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          _buildLanguageButton(context),
                        ],
                      ),
                    ),

                  // ── Pages ──────────────────────────────────────────────
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildIntroPage(),        // 0
                        _buildPainHookPage(),      // 1 NEW
                        _buildGenderPage(),        // 2
                        _buildBirthDatePage(),     // 3
                        _buildHeightWeightPage(),  // 4
                        _buildParentsPage(),       // 5
                        _buildWorkoutPage(),       // 6
                        _buildEthnicityPage(),     // 7
                        _buildFootSizePage(),      // 8
                        _buildDreamHeightPage(),   // 9
                        _buildSleepPage(),                    // 10
                        _buildOnboardingPastHeightsPage(),    // 11
                        _buildReviewsPage(),                  // 12
                        _buildChartPage(),                    // 13
                        _buildJourneyPage(),                  // 14
                        const SizedBox(),                     // 15 placeholder for analyzing
                      ],
                    ),
                  ),

                  // ── Bottom button ───────────────────────────────────────
                  if (showButton)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
                      child: _TallerButton(
                        label: _currentPage == 0
                            ? l.letsStart
                            : _currentPage == _kLastQuestion
                                ? l.analyzeBtn
                                : l.continueBtn,
                        enabled: _canProceed(),
                        onTap: _nextPage,
                      ),
                    )
                  else
                    const SizedBox(height: 70),
                ],
              ),

              // ── Analyzing overlay — shown on top when analyzing ─────────
              if (isAnalyzing)
                Container(
                  color: const Color(0xFF0A0812),
                  child: _AnalyzingPage(onComplete: _onAnalysisComplete),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 0 — Intro slides (premium Taller-style)
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildIntroPage() {
    return Stack(
      children: [
        _buildIntroContent(),
        Positioned(
          top: 8,
          right: 16,
          child: _buildLanguageButton(context),
        ),
      ],
    );
  }

  Widget _buildIntroContent() {
    final l = AppLocalizations.of(context)!;
    final progress = context.watch<AppProvider>().journeyProgress;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(26, 8, 26, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 46),

            // ── Wordmark ────────────────────────────────────────────────
            ShaderMask(
              shaderCallback: (r) => const LinearGradient(
                colors: [Colors.white, Color(0xFFB39DFF)],
              ).createShader(r),
              child: const Text(
                'BeTaller',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -1.2,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.primary.withValues(alpha: 0.35)),
              ),
              child: Text(
                l.journeyProgressLabel.toUpperCase(),
                style: const TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4,
                  color: AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 22),
            Text(
              l.journeyIntroTitle,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1.12,
                letterSpacing: -1.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l.journeyIntroSubtitle,
              style: TextStyle(
                fontSize: 14.5,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: Colors.white.withValues(alpha: 0.58),
              ),
            ),

            const SizedBox(height: 34),
            JourneySteps(completed: progress),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 1 — Pain hook
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildPainHookPage() {
    final l = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Urgency header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEF4444).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFEF4444).withValues(alpha: 0.30)),
            ),
            child: Text('\u26a0\ufe0f  ${l.criticalWindow}', style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 1.0,
              color: Color(0xFFEF4444),
            )),
          ),
          const SizedBox(height: 18),
          Text(l.heightPotentialFading,
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1.2, height: 1.05),
          ),
          RichText(text: TextSpan(children: [
            TextSpan(text: l.fadingAway,
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Color(0xFFEF4444), letterSpacing: -1.2)),
          ])),
          const SizedBox(height: 16),
          Text(l.painHookDesc,
            style: TextStyle(fontSize: 15.5, color: Colors.white.withValues(alpha: 0.65), height: 1.55)),
          const SizedBox(height: 28),
          // Fact cards
          ...[
            (
              '🧬', const Color(0xFF8B5CF6),
              l.painGeneticTitle,
              l.painGeneticDesc,
              l.painGeneticTag,
            ),
            (
              '😴', const Color(0xFF6366F1),
              l.painSleepTitle,
              l.painSleepDesc,
              l.painSleepTag,
            ),
            (
              '🦴', const Color(0xFF00C6FF),
              l.painPostureTitle,
              l.painPostureDesc,
              l.painPostureTag,
            ),
            (
              '💪', const Color(0xFF22FF88),
              l.painExerciseTitle,
              l.painExerciseDesc,
              l.painExerciseTag,
            ),
            (
              '🥗', const Color(0xFFFF8A00),
              l.painNutritionTitle,
              l.painNutritionDesc,
              l.painNutritionTag,
            ),
            (
              '📈', const Color(0xFFFFD700),
              l.painTrackingTitle,
              l.painTrackingDesc,
              l.painTrackingTag,
            ),
          ].map((item) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF161220),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: item.$2.withValues(alpha: 0.15)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.$1, style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 14),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(child: Text(item.$3, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: Colors.white))),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
                          color: item.$2.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(item.$5, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: item.$2, letterSpacing: 0.5)),
                      ),
                    ]),
                    const SizedBox(height: 5),
                    Text(item.$4, style: TextStyle(fontSize: 12.5, color: Colors.white.withValues(alpha: 0.55), height: 1.45)),
                  ],
                )),
              ],
            ),
          )),
          const SizedBox(height: 8),
          // Bottom credibility
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary.withValues(alpha: 0.12), AppColors.primary.withValues(alpha: 0.04)],
                begin: Alignment.topLeft, end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.20)),
            ),
            child: Row(
              children: [
                Container(
                  width: 44, height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withValues(alpha: 0.20),
                  ),
                  child: ClipOval(child: Image.asset('assets/icon.png', width: 44, height: 44, fit: BoxFit.cover)),
                ),
                const SizedBox(width: 14),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.designedForYou, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white)),
                    const SizedBox(height: 3),
                    Text(l.designedForYouDesc,
                      style: TextStyle(fontSize: 12.5, color: Colors.white.withValues(alpha: 0.60), height: 1.4)),
                  ],
                )),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 1 — Gender
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildGenderPage() {
    final l = AppLocalizations.of(context)!;
    return _RadioListPage(
      title: l.selectYourGender,
      subtitle: l.onboardingPredictSubtitle,
      options: [('male', l.male), ('female', l.female), ('other', l.other)],
      selected: _gender,
      onSelect: (v) => setState(() => _gender = v),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 2 — Birth date
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildBirthDatePage() {
    final l = AppLocalizations.of(context)!;
    return _ScrollPickerPage(
      title: l.whenWereYouBorn,
      subtitle: l.onboardingPredictSubtitle,
      child: _BirthDatePickers(
        initialDate: _birthDate,
        onChanged: (date) => setState(() => _birthDate = date),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 3 — Height & Weight
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildHeightWeightPage() {
    final l = AppLocalizations.of(context)!;
    final unitKey = _heightImperial ? 'imp' : 'met';
    return _ScrollPickerPage(
      title: l.heightAndWeight,
      subtitle: l.onboardingPredictSubtitle,
      unitToggle: _UnitToggle(
        left: l.imperialShort, right: l.metricShort,
        isRight: !_heightImperial,
        onToggle: (isMetric) => setState(() {
          _heightImperial = !isMetric;
          if (_heightImperial) {
            _heightFt  = _cmToFt(_selectedHeight);
            _heightIn  = _cmToIn(_selectedHeight);
            _weightLbs = _kgToLbs(_selectedWeight);
          }
        }),
      ),
      headerRow: _pickerHeaders(_heightImperial
          ? [l.heightLabel, '', l.weightLabel]
          : [l.heightLabel, l.weightLabel],
        flex: _heightImperial ? [1, 1, 1] : [1, 1]),
      child: _heightImperial
          ? Row(children: [
              Expanded(child: _PickerBox(
                key: ValueKey('hft_$unitKey'),
                initialItem: (_heightFt - 3).clamp(0, 5),
                items: List.generate(6, (i) => '${i + 3} ft'),
                onChanged: (i) => setState(() {
                  _heightFt = i + 3;
                  _selectedHeight = _ftInToCm(_heightFt, _heightIn);
                }),
              )),
              const SizedBox(width: 8),
              Expanded(child: _PickerBox(
                key: ValueKey('hin_$unitKey'),
                initialItem: _heightIn.clamp(0, 11),
                items: List.generate(12, (i) => '$i in'),
                onChanged: (i) => setState(() {
                  _heightIn = i;
                  _selectedHeight = _ftInToCm(_heightFt, _heightIn);
                }),
              )),
              const SizedBox(width: 8),
              Expanded(child: _PickerBox(
                key: ValueKey('wlbs_$unitKey'),
                initialItem: (_weightLbs - 66).clamp(0, 264),
                items: List.generate(265, (i) => '${i + 66} lb'),
                onChanged: (i) => setState(() {
                  _weightLbs = i + 66;
                  _selectedWeight = _lbsToKg(_weightLbs);
                }),
              )),
            ])
          : Row(children: [
              Expanded(child: _PickerBox(
                key: ValueKey('hcm_$unitKey'),
                initialItem: (_selectedHeight - 100).clamp(0, 120),
                items: List.generate(121, (i) => '${i + 100} cm'),
                onChanged: (i) => setState(() {
                  _selectedHeight = i + 100;
                  _heightFt = _cmToFt(_selectedHeight);
                  _heightIn = _cmToIn(_selectedHeight);
                }),
              )),
              const SizedBox(width: 8),
              Expanded(child: _PickerBox(
                key: ValueKey('wkg_$unitKey'),
                initialItem: (_selectedWeight - 30).clamp(0, 120),
                items: List.generate(121, (i) => '${i + 30} kg'),
                onChanged: (i) => setState(() {
                  _selectedWeight = i + 30;
                  _weightLbs = _kgToLbs(_selectedWeight);
                }),
              )),
            ]),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 4 — Parents height
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildParentsPage() {
    final l = AppLocalizations.of(context)!;
    final unitKey = _heightImperial ? 'imp' : 'met';
    return _ScrollPickerPage(
      title: l.parentsHeight,
      subtitle: l.onboardingPredictSubtitle,
      unitToggle: _UnitToggle(
        left: l.imperialShort, right: l.metricShort,
        isRight: !_heightImperial,
        onToggle: (isMetric) => setState(() => _heightImperial = !isMetric),
      ),
      headerRow: _pickerHeaders(_heightImperial
          ? [l.dadLabel, '', l.motherLabel, '']
          : [l.dadLabel, l.motherLabel],
        flex: _heightImperial ? [1, 1, 1, 1] : [1, 1]),
      child: _heightImperial
          ? Row(children: [
              Expanded(child: _PickerBox(
                key: ValueKey('dft_$unitKey'),
                initialItem: (_dadFt - 4).clamp(0, 4),
                items: List.generate(5, (i) => '${i + 4} ft'),
                onChanged: (i) => setState(() { _dadFt = i + 4; _selectedFatherHeight = _ftInToCm(_dadFt, _dadIn); }),
              )),
              const SizedBox(width: 8),
              Expanded(child: _PickerBox(
                key: ValueKey('din_$unitKey'),
                initialItem: _dadIn.clamp(0, 11),
                items: List.generate(12, (i) => '$i in'),
                onChanged: (i) => setState(() { _dadIn = i; _selectedFatherHeight = _ftInToCm(_dadFt, _dadIn); }),
              )),
              const SizedBox(width: 8),
              Expanded(child: _PickerBox(
                key: ValueKey('mft_$unitKey'),
                initialItem: (_momFt - 4).clamp(0, 4),
                items: List.generate(5, (i) => '${i + 4} ft'),
                onChanged: (i) => setState(() { _momFt = i + 4; _selectedMotherHeight = _ftInToCm(_momFt, _momIn); }),
              )),
              const SizedBox(width: 8),
              Expanded(child: _PickerBox(
                key: ValueKey('min_$unitKey'),
                initialItem: _momIn.clamp(0, 11),
                items: List.generate(12, (i) => '$i in'),
                onChanged: (i) => setState(() { _momIn = i; _selectedMotherHeight = _ftInToCm(_momFt, _momIn); }),
              )),
            ])
          : Row(children: [
              Expanded(child: _PickerBox(
                key: ValueKey('dcm_$unitKey'),
                initialItem: (_selectedFatherHeight - 100).clamp(0, 120),
                items: List.generate(121, (i) => '${i + 100} cm'),
                onChanged: (i) => setState(() {
                  _selectedFatherHeight = i + 100;
                  _dadFt = _cmToFt(_selectedFatherHeight);
                  _dadIn = _cmToIn(_selectedFatherHeight);
                }),
              )),
              const SizedBox(width: 8),
              Expanded(child: _PickerBox(
                key: ValueKey('mcm_$unitKey'),
                initialItem: (_selectedMotherHeight - 100).clamp(0, 120),
                items: List.generate(121, (i) => '${i + 100} cm'),
                onChanged: (i) => setState(() {
                  _selectedMotherHeight = i + 100;
                  _momFt = _cmToFt(_selectedMotherHeight);
                  _momIn = _cmToIn(_selectedMotherHeight);
                }),
              )),
            ]),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 5 — Weekly workout
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildWorkoutPage() {
    final l = AppLocalizations.of(context)!;
    final options = [
      ('0-2', '0-2', l.workoutsPerWeek),
      ('3-5', '3-5', l.workoutsPerWeek),
      ('6+',  '6+',  l.workoutsPerWeek),
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PageTitle(l.weeklyWorkout),
          const SizedBox(height: 8),
          _PageSubtitle(l.onboardingPredictSubtitle),
          const SizedBox(height: 24),
          ...options.map((opt) {
            final selected = _weeklyWorkout == opt.$1;
            return GestureDetector(
              onTap: () => setState(() => _weeklyWorkout = opt.$1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                decoration: BoxDecoration(
                  color: selected ? AppColors.primary.withValues(alpha: 0.15) : const Color(0xFF161220),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: selected ? AppColors.primary : Colors.white.withValues(alpha: 0.08),
                    width: selected ? 1.5 : 1.0,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(opt.$2, style: TextStyle(
                            color: selected ? Colors.white : Colors.white.withValues(alpha: 0.9),
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          )),
                          const SizedBox(height: 2),
                          Text(opt.$3, style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.55),
                            fontSize: 14,
                          )),
                        ],
                      ),
                    ),
                    _RadioDot(selected: selected),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 6 — Ethnicity
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildEthnicityPage() {
    final l = AppLocalizations.of(context)!;
    return _RadioListPage(
      title: l.whatsYourEthnicity,
      subtitle: l.onboardingPredictSubtitle,
      options: [
        ('white',          l.whiteCaucasian),
        ('black',          l.blackAfricanAmerican),
        ('hispanic',       l.hispanicLatino),
        ('asian',          l.asian),
        ('middle_eastern', l.middleEasternIndigenous),
        ('no_answer',      l.dontWantToAnswer),
      ],
      selected: _ethnicity,
      onSelect: (v) => setState(() => _ethnicity = v),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 8 — Foot size
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildFootSizePage() {
    final l = AppLocalizations.of(context)!;
    final unitKey = _footSizeEU ? 'eu' : 'us';
    final items = _footSizeEU
        ? List.generate(21, (i) => (36.0 + i).toStringAsFixed(0))
        : List.generate(21, (i) => (5.0 + i * 0.5).toStringAsFixed(1));
    final currentEU = _usToEU(_footSize);
    final initIdx   = _footSizeEU
        ? (currentEU - 36).clamp(0, 20).round()
        : ((_footSize - 5.0) * 2).clamp(0, 20).round();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PageTitle(l.footSizeLabel),
          const SizedBox(height: 8),
          _PageSubtitle(l.onboardingPredictSubtitle),
          const SizedBox(height: 20),
          Text(l.selectYourSize,
            style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Expanded(
            child: _PickerBox(
              key: ValueKey('foot_$unitKey'),
              initialItem: initIdx,
              items: items,
              onChanged: (i) => setState(() {
                _footSize = _footSizeEU ? _euToUS(36.0 + i) : 5.0 + i * 0.5;
              }),
            ),
          ),
          const SizedBox(height: 16),
          _UnitToggle(left: 'US', right: 'EU', isRight: _footSizeEU,
            onToggle: (isEU) => setState(() => _footSizeEU = isEU)),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 9 — Dream height
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildDreamHeightPage() {
    final l = AppLocalizations.of(context)!;
    final unitKey = _dreamImperial ? 'imp' : 'met';
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PageTitle(l.whatsYourDreamHeight),
          const SizedBox(height: 8),
          _PageSubtitle(l.dreamHeightCalcSubtitle),
          const SizedBox(height: 20),
          Text(l.dreamHeightLabel,
            style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Expanded(
            child: _dreamImperial
                ? Row(children: [
                    Expanded(child: _PickerBox(
                      key: ValueKey('dft_$unitKey'),
                      initialItem: (_dreamFt - 3).clamp(0, 5),
                      items: List.generate(6, (i) => '${i + 3} ft'),
                      onChanged: (i) => setState(() { _dreamFt = i + 3; _dreamHeightCm = _ftInToCm(_dreamFt, _dreamIn); }),
                    )),
                    const SizedBox(width: 8),
                    Expanded(child: _PickerBox(
                      key: ValueKey('din_$unitKey'),
                      initialItem: _dreamIn.clamp(0, 11),
                      items: List.generate(12, (i) => '$i in'),
                      onChanged: (i) => setState(() { _dreamIn = i; _dreamHeightCm = _ftInToCm(_dreamFt, _dreamIn); }),
                    )),
                  ])
                : _PickerBox(
                    key: ValueKey('dcm_$unitKey'),
                    initialItem: (_dreamHeightCm - 140).clamp(0, 80),
                    items: List.generate(81, (i) => '${i + 140} cm'),
                    onChanged: (i) => setState(() {
                      _dreamHeightCm = i + 140;
                      _dreamFt = _cmToFt(_dreamHeightCm);
                      _dreamIn = _cmToIn(_dreamHeightCm);
                    }),
                  ),
          ),
          const SizedBox(height: 16),
          _UnitToggle(left: l.imperialShort, right: l.metricShort, isRight: !_dreamImperial,
            onToggle: (isMetric) => setState(() => _dreamImperial = !isMetric)),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 10 — Sleep (circular dial)
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildSleepPage() {
    final l = AppLocalizations.of(context)!;
    return Padding(
    padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PageTitle(l.sleepQuestion),
        const SizedBox(height: 8),
        _PageSubtitle(l.onboardingPredictSubtitle),
        Expanded(
          child: Center(
            child: _CircularSleepDial(
              value: _sleepHours,
              onChanged: (v) => setState(() => _sleepHours = v),
            ),
          ),
        ),
      ],
    ),
  );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 11 — Geçmiş Boylar (onboarding picker)
  // ─────────────────────────────────────────────────────────────────────────────

  double _obDefaultHeightForAge(int age) {
    final ageRange = (_userAge - 10).clamp(1, 100);
    final fraction = ((age - 10) / ageRange).clamp(0.0, 1.0);
    return (120 + (_selectedHeight - 120) * fraction).roundToDouble();
  }

  int _obHeightToItem(double h) => (h.round() - _kObMinH).clamp(0, _kObMaxH - _kObMinH);

  void _obJumpPickerToAge(int age) {
    final val = _obPastHeightValues[age] ?? _obDefaultHeightForAge(age);
    final item = _obHeightToItem(val);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_obHeightPickerController.hasClients) {
        _obHeightPickerController.jumpToItem(item);
      }
    });
  }

  void _obOnAgePageChanged(int newIndex) {
    setState(() => _obCurrentAgeIndex = newIndex);
    _obJumpPickerToAge(_obAges[newIndex]);
  }

  void _obPrevAge() {
    if (_obCurrentAgeIndex > 0) {
      _obAgePageController.previousPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeInOut,
      );
    }
  }

  void _obConfirmAndAdvance() {
    final currentAge = _obAges[_obCurrentAgeIndex];
    final item = _obHeightPickerController.hasClients
        ? _obHeightPickerController.selectedItem
        : _obHeightToItem(_obDefaultHeightForAge(currentAge));
    _obPastHeightValues[currentAge] = (_kObMinH + item).toDouble();

    if (_obCurrentAgeIndex < _obAges.length - 1) {
      _obAgePageController.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeInOut,
      );
    } else {
      _nextPage();
    }
  }

  void _obSkipAge() {
    _obPastHeightValues[_obAges[_obCurrentAgeIndex]] = null;
    if (_obCurrentAgeIndex < _obAges.length - 1) {
      _obAgePageController.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeInOut,
      );
    } else {
      _nextPage();
    }
  }

  Widget _buildObAgeSlot(int age, bool isSelected) {
    final hasSaved = _obPastHeightValues[age] != null;
    return AnimatedOpacity(
      opacity: isSelected ? 1.0 : 0.25,
      duration: const Duration(milliseconds: 300),
      child: AnimatedScale(
        scale: isSelected ? 1.0 : 0.70,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFF3D1A78), Color(0xFF1C0A3E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: isSelected ? null : const Color(0xFF110D22),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF8B5CF6).withValues(alpha: 0.60)
                  : Colors.white.withValues(alpha: 0.07),
              width: isSelected ? 1.5 : 1,
            ),
            boxShadow: isSelected
                ? [BoxShadow(color: const Color(0xFF8B5CF6).withValues(alpha: 0.32), blurRadius: 28, offset: const Offset(0, 10))]
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$age',
                style: TextStyle(
                  fontSize: isSelected ? 46 : 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -2,
                  height: 1,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'yaş',
                style: TextStyle(
                  fontSize: isSelected ? 11 : 9,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? const Color(0xFFB794F4) : Colors.white.withValues(alpha: 0.28),
                  letterSpacing: 0.8,
                ),
              ),
              if (hasSaved && isSelected) ...[
                const SizedBox(height: 8),
                Container(
                  width: 22, height: 3,
                  decoration: BoxDecoration(color: AppColors.lime, borderRadius: BorderRadius.circular(2)),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingPastHeightsPage() {
    if (_obAges.isEmpty) return const SizedBox();

    final currentAge = _obAges[_obCurrentAgeIndex];
    final l = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Başlık
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l.obPastHeightsTitle,
                style: const TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w900,
                  color: Colors.white, letterSpacing: -1.3, height: 1.05,
                ),
              ),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.52), height: 1.45),
                  children: [
                    TextSpan(text: l.obPastHeightsSubPart1),
                    TextSpan(
                      text: '97%',
                      style: TextStyle(fontWeight: FontWeight.w800, color: const Color(0xFF22FF88).withValues(alpha: 0.90)),
                    ),
                    TextSpan(text: l.obPastHeightsSubPart2),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Yaş carousel
        SizedBox(
          height: 118,
          child: PageView.builder(
            controller: _obAgePageController,
            itemCount: _obAges.length,
            onPageChanged: _obOnAgePageChanged,
            itemBuilder: (context, index) => _buildObAgeSlot(_obAges[index], index == _obCurrentAgeIndex),
          ),
        ),
        const SizedBox(height: 14),

        // Soru metni
        Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, anim) => FadeTransition(opacity: anim, child: child),
            child: Text(
              key: ValueKey(_obCurrentAgeIndex),
              l.obHowTallAtAge(currentAge.toString()),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.48), letterSpacing: -0.2),
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Boy picker
        Expanded(
          child: Stack(
            children: [
              CupertinoPicker(
                scrollController: _obHeightPickerController,
                itemExtent: 56,
                backgroundColor: Colors.transparent,
                useMagnifier: true,
                magnification: 1.12,
                squeeze: 1.15,
                onSelectedItemChanged: (index) {
                  _obPastHeightValues[currentAge] = (_kObMinH + index).toDouble();
                },
                selectionOverlay: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [const Color(0xFF7C3AED).withValues(alpha: 0.20), const Color(0xFF4C1D95).withValues(alpha: 0.20)]),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF8B5CF6).withValues(alpha: 0.55), width: 1.5),
                  ),
                ),
                children: List.generate(
                  _kObMaxH - _kObMinH + 1,
                  (i) => Center(
                    child: Text('${_kObMinH + i} cm',
                      style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.8)),
                  ),
                ),
              ),
              Positioned(top: 0, left: 0, right: 0, height: 100,
                child: IgnorePointer(child: Container(decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF09070F), Colors.transparent]))))),
              Positioned(bottom: 0, left: 0, right: 0, height: 100,
                child: IgnorePointer(child: Container(decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Color(0xFF09070F), Colors.transparent]))))),
            ],
          ),
        ),

        // Butonlar
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Row(
            children: [
              if (_obCurrentAgeIndex > 0) ...[
                GestureDetector(
                  onTap: _obPrevAge,
                  child: Container(
                    width: 58, height: 64,
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.06), borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white.withValues(alpha: 0.08))),
                    child: const Icon(CupertinoIcons.chevron_left, color: Colors.white60, size: 20),
                  ),
                ),
                const SizedBox(width: 10),
              ],
              GestureDetector(
                onTap: _obSkipAge,
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white.withValues(alpha: 0.07))),
                  child: Center(child: Text(l.obSkip, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.38)))),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: _obConfirmAndAdvance,
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFFA78BFA), Color(0xFF7C3AED)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [BoxShadow(color: const Color(0xFF8B5CF6).withValues(alpha: 0.42), blurRadius: 20, offset: const Offset(0, 8))],
                    ),
                    child: Center(
                      child: Text(
                        _obCurrentAgeIndex == _obAges.length - 1 ? l.continueBtn : l.obNext,
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.3),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // PAGE 12 — Social proof "Binlerce Kişi Başardı"
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildReviewsPage() {
    final l = AppLocalizations.of(context)!;
    final testimonials = [
      _Testimonial(
        name: 'Ertuğ E.', age: 23, emoji: '💪',
        quote: l.testimonial1,
        gain: '+2.6 cm', duration: l.testimonialDuration1,
        verified: true,
        photoPath: 'assets/testimonials/ertug.jpg',
      ),
      _Testimonial(
        name: 'Ahmet', age: 20, emoji: '🔥',
        quote: l.testimonial2,
        gain: '+2.5 cm', duration: l.testimonialDuration2,
        verified: true,
        photoPath: 'assets/testimonials/ahmet2.jpg',
      ),
      _Testimonial(
        name: 'Gökdeniz', age: 22, emoji: '🌟',
        quote: l.testimonial3,
        gain: '+2.3 cm', duration: l.testimonialDuration3,
        verified: true,
        photoPath: 'assets/testimonials/gokdeniz.jpg',
      ),
      _Testimonial(
        name: 'Mert', age: 19, emoji: '📈',
        quote: l.testimonial4,
        gain: '+3.3 cm', duration: l.testimonialDuration4,
        verified: true,
        photoPath: 'assets/testimonials/mert.jpg',
      ),
      _Testimonial(
        name: 'Aydın', age: 18, emoji: '🎯',
        quote: l.testimonial5,
        gain: '+3.1 cm', duration: l.testimonialDuration5,
        verified: true,
        photoPath: 'assets/testimonials/aydin.jpg',
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('🏆', style: TextStyle(fontSize: 44)),
          const SizedBox(height: 14),
          Text(l.thousandsSucceeded,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1.0, height: 1.12)),
          const SizedBox(height: 8),
          Text(l.youCanToo,
            style: TextStyle(fontSize: 15, color: Colors.white.withValues(alpha: 0.50))),
          const SizedBox(height: 24),
          ...testimonials.map((t) => _TestimonialCard(t: t)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 13 — Growth chart ("Uzun vadeli sonuçlar")
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildChartPage() {
    final l = AppLocalizations.of(context)!;
    return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.30)),
          ),
          child: Text(l.scientificData, style: const TextStyle(
            fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.2, color: AppColors.primary,
          )),
        ),
        const SizedBox(height: 14),
        _PageTitle(l.longTermResults),
        const SizedBox(height: 8),
        _PageSubtitle(l.longTermResultsSubtitle),
        const SizedBox(height: 22),
        // Chart card
        Container(
          width: double.infinity,
          height: 210,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF100D1A),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
          ),
          child: Column(
            children: [
              Text(l.yourFinalHeight,
                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              Expanded(child: CustomPaint(size: Size.infinite, painter: _GrowthChartPainter())),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LegendDot(color: const Color(0xFFFF6B4A), label: l.badHabitsLegend),
                  const SizedBox(width: 22),
                  _LegendDot(color: AppColors.primary, label: l.optimizedLegend),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        // Fact cards row
        Row(children: [
          Expanded(child: _ChartFactCard(
            emoji: '🧬',
            pct: l.chartFact1Pct,
            desc: l.chartFact1Desc,
            color: AppColors.primary,
          )),
          const SizedBox(width: 10),
          Expanded(child: _ChartFactCard(
            emoji: '😴',
            pct: l.chartFact2Pct,
            desc: l.chartFact2Desc,
            color: AppColors.cyan,
          )),
          const SizedBox(width: 10),
          Expanded(child: _ChartFactCard(
            emoji: '🦴',
            pct: l.chartFact3Pct,
            desc: l.chartFact3Desc,
            color: const Color(0xFF22C55E),
          )),
        ]),
        const SizedBox(height: 20),
        // "What being short really costs" hook
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF1A0A2E), const Color(0xFF0F0820)],
              begin: Alignment.topLeft, end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\ud83d\udca1  ${l.didYouKnow}',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.primary)),
              const SizedBox(height: 10),
              ...[l.didYouKnowFact1, l.didYouKnowFact2, l.didYouKnowFact3]
                .map((fact) => Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Row(children: [
                    Container(width: 6, height: 6,
                      decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                    const SizedBox(width: 10),
                    Expanded(child: Text(fact,
                      style: TextStyle(fontSize: 13.5, color: Colors.white.withValues(alpha: 0.75)))),
                  ]),
                )),
            ],
          ),
        ),
      ],
    ),
  );
  }


  // Called by _AnalyzingPage when its animation finishes. The questionnaire is
  // over, so we save and hand straight over to the journey screen.
  void _onAnalysisComplete() {
    if (!mounted) return;
    _saveProfile();
    _goToMain();
  }

  void _goToMain() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (_, __, ___) => const _WelcomeScreen(),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
  }


  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 14 — Journey roadmap
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildJourneyPage() {
    final l = AppLocalizations.of(context)!;
    final milestones = [
      _JourneyMilestone(
        label: l.week1Label,
        title: l.week1Title,
        desc: l.week1Desc,
        icon: '🌱',
        color: const Color(0xFF22C55E),
        isActive: false,
      ),
      _JourneyMilestone(
        label: l.month1Label,
        title: l.month1Title,
        desc: l.month1Desc,
        icon: '💪',
        color: AppColors.cyan,
        isActive: false,
      ),
      _JourneyMilestone(
        label: l.month3Label,
        title: l.month3Title,
        desc: l.month3Desc,
        icon: '⚡',
        color: AppColors.primary,
        isActive: false,
      ),
      _JourneyMilestone(
        label: l.month6Label,
        title: l.month6Title,
        desc: l.month6Desc,
        icon: '🏆',
        color: const Color(0xFFFFD700),
        isActive: true,
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 36, 24, 0),
      child: Column(
        children: [
          const Text('✨', style: TextStyle(fontSize: 40)),
          const SizedBox(height: 16),
          Text(l.transformJourneyBegins,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1.2, height: 1.12)),
          const SizedBox(height: 10),
          Text(l.transformJourneySubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.5, color: Colors.white.withValues(alpha: 0.58), height: 1.5)),
          const SizedBox(height: 32),
          // Timeline row
          Row(
            children: milestones.asMap().entries.map((e) {
              final i = e.key;
              final m = e.value;
              return Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          // Circle
                          Container(
                            width: 52, height: 52,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: m.isActive ? m.color : m.color.withValues(alpha: 0.15),
                              border: Border.all(color: m.color, width: m.isActive ? 2.5 : 1.5),
                              boxShadow: m.isActive ? [BoxShadow(color: m.color.withValues(alpha: 0.40), blurRadius: 14)] : null,
                            ),
                            child: Center(
                              child: Text(m.label, style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w900,
                                color: m.isActive ? Colors.black : m.color,
                              )),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(m.title, style: TextStyle(
                            fontSize: 10.5, fontWeight: FontWeight.w700,
                            color: m.isActive ? m.color : Colors.white.withValues(alpha: 0.50),
                          )),
                        ],
                      ),
                    ),
                    if (i < milestones.length - 1)
                      Container(
                        width: 24, height: 2,
                        color: Colors.white.withValues(alpha: 0.15),
                        margin: const EdgeInsets.only(bottom: 20),
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          // Active milestone detail card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xFFFFD700).withValues(alpha: 0.10), const Color(0xFFFFD700).withValues(alpha: 0.04)],
                begin: Alignment.topLeft, end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFFFD700).withValues(alpha: 0.30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Text('🏆', style: TextStyle(fontSize: 22)),
                  const SizedBox(width: 10),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(l.month6Title, style: TextStyle(fontSize: 12, color: const Color(0xFFFFD700).withValues(alpha: 0.80))),
                    Text(l.reachYourGoal, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white)),
                  ]),
                ]),
                const SizedBox(height: 14),
                Divider(color: Colors.white.withValues(alpha: 0.08)),
                const SizedBox(height: 10),
                ...[l.journeyBullet1, l.journeyBullet2, l.journeyBullet3].asMap().entries.map((e) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(children: [
                      Container(
                        width: 18, height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: e.key == 0 ? const Color(0xFF22C55E) : Colors.white.withValues(alpha: 0.06),
                          border: Border.all(color: e.key == 0 ? Colors.transparent : Colors.white.withValues(alpha: 0.15)),
                        ),
                        child: e.key == 0 ? const Icon(Icons.check, color: Colors.white, size: 10) : null,
                      ),
                      const SizedBox(width: 10),
                      Text(e.value, style: TextStyle(
                        fontSize: 14, color: e.key == 0 ? Colors.white : Colors.white.withValues(alpha: 0.45),
                        fontWeight: e.key == 0 ? FontWeight.w600 : FontWeight.w400,
                      )),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 16 — Result (kept from original design)
  // ─────────────────────────────────────────────────────────────────────────────
  // Helpers
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _pickerHeaders(List<String> labels, {required List<int> flex}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: List.generate(labels.length, (i) {
          final f = i < flex.length ? flex[i] : 1;
          return Expanded(
            flex: f,
            child: Padding(
              padding: EdgeInsets.only(left: i > 0 ? 8 : 0),
              child: Text(labels[i], textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
            ),
          );
        }),
      ),
    );
  }
}

class _JourneyMilestone {
  final String label, title, desc, icon;
  final Color color;
  final bool isActive;
  const _JourneyMilestone({
    required this.label,
    required this.title,
    required this.desc,
    required this.icon,
    required this.color,
    required this.isActive,
  });
}

// ─────────────────────────────────────────────────────────────────────────────

class _Testimonial {
  final String name, emoji, quote, gain, duration;
  final int age;
  final bool verified;
  final String? photoPath;
  const _Testimonial({
    required this.name, required this.age, required this.emoji,
    required this.quote, required this.gain, required this.duration,
    required this.verified, this.photoPath,
  });
}

class _TestimonialCard extends StatelessWidget {
  final _Testimonial t;
  const _TestimonialCard({required this.t});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF161220),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          // Avatar
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.15),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
            ),
            child: ClipOval(
              child: t.photoPath != null
                  ? Image.asset(t.photoPath!, fit: BoxFit.cover, width: 44, height: 44,
                      errorBuilder: (context, error, stack) => Center(child: Text(t.emoji, style: const TextStyle(fontSize: 20))))
                  : Center(child: Text(t.emoji, style: const TextStyle(fontSize: 20))),
            ),
          ),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${t.name}, ${t.age}',
              style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
            Text(l.yearsOld, style: TextStyle(fontSize: 12, color: Colors.white.withValues(alpha: 0.40))),
          ]),
          const Spacer(),
          if (t.verified)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF22C55E).withValues(alpha: 0.30)),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.verified, color: Color(0xFF22C55E), size: 12),
                const SizedBox(width: 4),
                Text(l.verifiedLabel, style: const TextStyle(color: Color(0xFF22C55E), fontSize: 10, fontWeight: FontWeight.w700)),
              ]),
            ),
        ]),
        const SizedBox(height: 12),
        Text('"${t.quote}"',
          style: TextStyle(fontSize: 13.5, color: Colors.white.withValues(alpha: 0.80), height: 1.5)),
        const SizedBox(height: 12),
        Divider(color: Colors.white.withValues(alpha: 0.07)),
        const SizedBox(height: 8),
        Row(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF22C55E).withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Text('↗', style: TextStyle(color: Color(0xFF22C55E), fontSize: 13, fontWeight: FontWeight.w800)),
              const SizedBox(width: 4),
              Text(t.gain, style: const TextStyle(color: Color(0xFF22C55E), fontSize: 13, fontWeight: FontWeight.w800)),
            ]),
          ),
          const SizedBox(width: 10),
          Icon(CupertinoIcons.clock, size: 13, color: Colors.white.withValues(alpha: 0.35)),
          const SizedBox(width: 4),
          Text(t.duration, style: TextStyle(fontSize: 12, color: Colors.white.withValues(alpha: 0.40))),
        ]),
      ],
    ),
  );
  }
}

class _ChartFactCard extends StatelessWidget {
  final String emoji, pct, desc;
  final Color color;
  const _ChartFactCard({required this.emoji, required this.pct, required this.desc, required this.color});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.07),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: color.withValues(alpha: 0.18)),
    ),
    child: Column(children: [
      Text(emoji, style: const TextStyle(fontSize: 22)),
      const SizedBox(height: 6),
      Text(pct, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: color)),
      const SizedBox(height: 4),
      Text(desc, textAlign: TextAlign.center,
        style: TextStyle(fontSize: 10.5, color: Colors.white.withValues(alpha: 0.55), height: 1.4)),
    ]),
  );
}

// ═════════════════════════════════════════════════════════════════════════════
// Reusable page scaffolds
// ═════════════════════════════════════════════════════════════════════════════

class _RadioListPage extends StatelessWidget {
  final String title, subtitle;
  final List<(String, String)> options;
  final String selected;
  final ValueChanged<String> onSelect;

  const _RadioListPage({
    required this.title,
    required this.subtitle,
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PageTitle(title),
          const SizedBox(height: 8),
          _PageSubtitle(subtitle),
          const SizedBox(height: 24),
          ...options.map((opt) {
            final sel = selected == opt.$1;
            return GestureDetector(
              onTap: () => onSelect(opt.$1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                decoration: BoxDecoration(
                  color: sel ? AppColors.primary.withValues(alpha: 0.15) : const Color(0xFF161220),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: sel ? AppColors.primary : Colors.white.withValues(alpha: 0.08),
                    width: sel ? 1.5 : 1.0,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(opt.$2, style: TextStyle(
                        color: sel ? Colors.white : Colors.white.withValues(alpha: 0.85),
                        fontSize: 16,
                        fontWeight: sel ? FontWeight.w700 : FontWeight.w500,
                      )),
                    ),
                    const SizedBox(width: 12),
                    _RadioDot(selected: sel),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ScrollPickerPage extends StatelessWidget {
  final String title, subtitle;
  final Widget child;
  final Widget? unitToggle;
  final Widget? headerRow;

  const _ScrollPickerPage({
    required this.title,
    required this.subtitle,
    required this.child,
    this.unitToggle,
    this.headerRow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PageTitle(title),
          const SizedBox(height: 8),
          _PageSubtitle(subtitle),
          if (unitToggle != null) ...[const SizedBox(height: 16), unitToggle!],
          if (headerRow != null) ...[const SizedBox(height: 12), headerRow!]
          else const SizedBox(height: 12),
          Expanded(child: child),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// Small reusable widgets
// ═════════════════════════════════════════════════════════════════════════════

class _PageTitle extends StatelessWidget {
  final String text;
  const _PageTitle(this.text);
  @override
  Widget build(BuildContext context) => Text(text,
    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.0, height: 1.15));
}

class _PageSubtitle extends StatelessWidget {
  final String text;
  const _PageSubtitle(this.text);
  @override
  Widget build(BuildContext context) => Text(text,
    style: TextStyle(fontSize: 15, color: Colors.white.withValues(alpha: 0.55), height: 1.45));
}

class _RadioDot extends StatelessWidget {
  final bool selected;
  const _RadioDot({required this.selected});
  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    width: 24, height: 24,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: selected ? AppColors.primary : Colors.transparent,
      border: Border.all(
        color: selected ? AppColors.primary : Colors.white.withValues(alpha: 0.28),
        width: 1.5,
      ),
    ),
    child: selected ? const Icon(Icons.check, color: Colors.white, size: 14) : null,
  );
}

class _TallerButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback onTap;
  const _TallerButton({required this.label, required this.enabled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity, height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: enabled
              ? const LinearGradient(
                  colors: [Color(0xFF9E6CF8), Color(0xFF7B3CF6)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                )
              : null,
          color: enabled ? null : Colors.white.withValues(alpha: 0.07),
          boxShadow: enabled
              ? [BoxShadow(color: AppColors.primary.withValues(alpha: 0.35), blurRadius: 22, offset: const Offset(0, 7))]
              : null,
        ),
        child: Center(
          child: Text(label, style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.w700, letterSpacing: -0.2,
            color: enabled ? Colors.white : Colors.white.withValues(alpha: 0.35),
          )),
        ),
      ),
    );
  }
}

class _UnitToggle extends StatelessWidget {
  final String left, right;
  final bool isRight;
  final ValueChanged<bool> onToggle;
  const _UnitToggle({required this.left, required this.right, required this.isRight, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _label(left, !isRight),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () => onToggle(!isRight),
          child: Container(
            width: 52, height: 28,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 24, height: 24,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        _label(right, isRight),
      ],
    );
  }

  Widget _label(String text, bool active) => Text(text, style: TextStyle(
    color: active ? Colors.white : Colors.white.withValues(alpha: 0.38),
    fontSize: 15, fontWeight: active ? FontWeight.w700 : FontWeight.w400,
  ));
}

class _PickerBox extends StatefulWidget {
  final int initialItem;
  final List<String> items;
  final ValueChanged<int> onChanged;

  const _PickerBox({
    super.key,
    required this.initialItem,
    required this.items,
    required this.onChanged,
  });

  @override
  State<_PickerBox> createState() => _PickerBoxState();
}

class _PickerBoxState extends State<_PickerBox> {
  late FixedExtentScrollController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = FixedExtentScrollController(initialItem: widget.initialItem);
  }

  @override
  void didUpdateWidget(_PickerBox old) {
    super.didUpdateWidget(old);
    // Only jump if the items list itself changed (unit toggle), not just a callback rebuild
    if (old.items.length != widget.items.length || old.items.first != widget.items.first) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_ctrl.hasClients) {
          _ctrl.jumpToItem(widget.initialItem.clamp(0, widget.items.length - 1));
        }
      });
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF120E1C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: CupertinoPicker(
        itemExtent: 50,
        scrollController: _ctrl,
        selectionOverlay: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onSelectedItemChanged: widget.onChanged,
        children: widget.items.map((item) => Center(
          child: Text(item, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
        )).toList(),
      ),
    );
  }
}

// ── Birth date picker — fully isolated StatefulWidget so parent setState
//    never rebuilds these pickers and scrolls remain free ──────────────────────

// ═════════════════════════════════════════════════════════════════════════════
// Analyzing Page — fully isolated, runs its own animation timer
// ═════════════════════════════════════════════════════════════════════════════

class _AnalyzingPage extends StatefulWidget {
  final VoidCallback onComplete;
  const _AnalyzingPage({required this.onComplete});

  @override
  State<_AnalyzingPage> createState() => _AnalyzingPageState();
}

class _AnalyzingPageState extends State<_AnalyzingPage> {
  double _progress = 0;
  int _step = 0;
  bool _done = false;

  static const _stepDurationMs = 900; // ms per step
  static const _tickMs = 30;          // timer tick

  @override
  void initState() {
    super.initState();
    _runAnimation();
  }

  Future<void> _runAnimation() async {
    const totalSteps = 5;
    for (int i = 0; i < totalSteps; i++) {
      if (!mounted) return;
      setState(() => _step = i);
      final start = i / totalSteps;
      final end = (i + 1) / totalSteps;
      final ticks = (_stepDurationMs / _tickMs).round();
      for (int t = 0; t <= ticks; t++) {
        await Future.delayed(const Duration(milliseconds: _tickMs));
        if (!mounted) return;
        setState(() => _progress = start + (end - start) * (t / ticks));
      }
      await Future.delayed(const Duration(milliseconds: 120));
    }
    if (!mounted) return;
    setState(() { _done = true; _progress = 1.0; });
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) widget.onComplete();
  }

  /// Returns a 5×4 colour-filter matrix that desaturates the image when
  /// [t] = 0 (grayscale) and shows full colour when [t] = 1.
  List<double> _buildSaturationMatrix(double t) {
    // Luminance weights (Rec. 601)
    const lr = 0.2126, lg = 0.7152, lb = 0.0722;
    final s = t.clamp(0.0, 1.0);
    final inv = 1.0 - s;
    return [
      lr + s * (1 - lr), lg * inv,          lb * inv,          0, 0,
      lr * inv,          lg + s * (1 - lg), lb * inv,          0, 0,
      lr * inv,          lg * inv,          lb + s * (1 - lb), 0, 0,
      0,                 0,                 0,                  1, 0,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final steps = [
      l.analysisStep1,
      l.analysisStep2,
      l.analysisStep3,
      l.analysisStep4,
      l.analysisStep5,
    ];
    final stepIcons = [
      CupertinoIcons.chart_bar_fill,
      CupertinoIcons.wand_stars,
      CupertinoIcons.chart_bar_circle_fill,
      CupertinoIcons.moon_stars_fill,
      CupertinoIcons.checkmark_seal_fill,
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      child: Column(
        children: [
          // Title
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 400),
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: _done ? AppColors.primary : Colors.white,
              letterSpacing: -0.8,
            ),
            child: Text(_done ? l.analysisComplete : l.analyzing),
          ),
          const SizedBox(height: 28),

          // App logo — grayscale → purple glow, edges softly faded
          SizedBox(
            width: 200, height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // ── Animated glow halo behind the logo ──
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 200, height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: _progress * 0.65),
                        blurRadius: 30 + _progress * 50,
                        spreadRadius: _progress * 10,
                      ),
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: _progress * 0.25),
                        blurRadius: 80 + _progress * 40,
                        spreadRadius: _progress * 4,
                      ),
                    ],
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: _progress * 0.30),
                        AppColors.primary.withValues(alpha: _progress * 0.08),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),

                // ── Logo: icon_2.png (proper transparent-bg version) ──
                ColorFiltered(
                  colorFilter: ColorFilter.matrix(_buildSaturationMatrix(_progress)),
                  child: Image.asset(
                    'assets/icon_2.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      CupertinoIcons.person_fill,
                      color: Colors.white,
                      size: 56,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Progress bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('progression',
                style: TextStyle(color: Colors.white.withValues(alpha: 0.45), fontSize: 13)),
              Text('${(_progress * 100).toInt()}%',
                style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: _progress,
              minHeight: 9,
              backgroundColor: Colors.white.withValues(alpha: 0.10),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
          const SizedBox(height: 24),

          // Step list
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: steps.length,
              itemBuilder: (_, i) {
                final isDone    = i < _step || _done;
                final isCurrent = i == _step && !_done;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: isDone
                          ? AppColors.primary.withValues(alpha: 0.12)
                          : isCurrent
                              ? Colors.white.withValues(alpha: 0.05)
                              : Colors.white.withValues(alpha: 0.025),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isCurrent
                            ? AppColors.primary.withValues(alpha: 0.35)
                            : Colors.transparent,
                      ),
                    ),
                    child: Row(
                      children: [
                        // Icon circle
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 350),
                          width: 36, height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDone
                                ? AppColors.primary.withValues(alpha: 0.25)
                                : isCurrent
                                    ? AppColors.primary.withValues(alpha: 0.15)
                                    : Colors.white.withValues(alpha: 0.06),
                          ),
                          child: Center(
                            child: isDone
                                ? const Icon(CupertinoIcons.checkmark, color: AppColors.primary, size: 16)
                                : isCurrent
                                    ? const SizedBox(
                                        width: 16, height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation(AppColors.primary),
                                        ))
                                    : Icon(stepIcons[i],
                                        color: Colors.white.withValues(alpha: 0.20), size: 16),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(steps[i],
                            style: TextStyle(
                              color: isDone
                                  ? Colors.white
                                  : isCurrent
                                      ? Colors.white.withValues(alpha: 0.90)
                                      : Colors.white.withValues(alpha: 0.30),
                              fontSize: 15,
                              fontWeight: (isDone || isCurrent) ? FontWeight.w600 : FontWeight.w400,
                            )),
                        ),
                        if (isDone)
                          Container(
                            width: 22, height: 22,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.4),
                                blurRadius: 8,
                              )],
                            ),
                            child: const Icon(CupertinoIcons.checkmark, color: Colors.white, size: 12),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _BirthDatePickers extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onChanged;
  const _BirthDatePickers({required this.initialDate, required this.onChanged});

  @override
  State<_BirthDatePickers> createState() => _BirthDatePickersState();
}

class _BirthDatePickersState extends State<_BirthDatePickers> {
  static final _days  = List.generate(31, (i) => '${i + 1}');
  static final _years = List.generate(36, (i) => '${2024 - i}');

  late FixedExtentScrollController _mCtrl;
  late FixedExtentScrollController _dCtrl;
  late FixedExtentScrollController _yCtrl;

  late int _month; // 1–12
  late int _day;   // 1–31
  late int _year;

  @override
  void initState() {
    super.initState();
    _month = widget.initialDate.month;
    _day   = widget.initialDate.day;
    _year  = widget.initialDate.year;
    _mCtrl = FixedExtentScrollController(initialItem: _month - 1);
    _dCtrl = FixedExtentScrollController(initialItem: _day - 1);
    _yCtrl = FixedExtentScrollController(initialItem: (2024 - _year).clamp(0, 35));
  }

  @override
  void dispose() {
    _mCtrl.dispose();
    _dCtrl.dispose();
    _yCtrl.dispose();
    super.dispose();
  }

  void _notify() {
    final safeDay = _day.clamp(1, 28); // safe for all months
    widget.onChanged(DateTime(_year, _month, safeDay));
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final months = List.generate(12, (i) => DateFormat('MMMM', locale).format(DateTime(2000, i + 1)));
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _RawPicker(
            controller: _mCtrl,
            items: months,
            onChanged: (i) { _month = i + 1; _notify(); },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: _RawPicker(
            controller: _dCtrl,
            items: _days,
            onChanged: (i) { _day = i + 1; _notify(); },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: _RawPicker(
            controller: _yCtrl,
            items: _years,
            onChanged: (i) { _year = 2024 - i; _notify(); },
          ),
        ),
      ],
    );
  }
}

/// Raw CupertinoPicker that never rebuilds from outside — controller owned by caller.
class _RawPicker extends StatelessWidget {
  final FixedExtentScrollController controller;
  final List<String> items;
  final ValueChanged<int> onChanged;

  const _RawPicker({
    required this.controller,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF120E1C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: CupertinoPicker(
        itemExtent: 50,
        scrollController: controller,
        selectionOverlay: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onSelectedItemChanged: onChanged,
        children: items.map((item) => Center(
          child: Text(item,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        )).toList(),
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      const SizedBox(width: 6),
      Text(label, style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 13)),
    ],
  );
}

// ═════════════════════════════════════════════════════════════════════════════
// Circular sleep dial
// ═════════════════════════════════════════════════════════════════════════════

class _CircularSleepDial extends StatefulWidget {
  final double value; // 4.0 – 12.0
  final ValueChanged<double> onChanged;
  const _CircularSleepDial({required this.value, required this.onChanged});

  @override
  State<_CircularSleepDial> createState() => _CircularSleepDialState();
}

class _CircularSleepDialState extends State<_CircularSleepDial>
    with SingleTickerProviderStateMixin {
  // The track runs 270° clockwise from the bottom-left, leaving a 90° gap at
  // the bottom. The gap gives the drag two hard ends instead of a seam that
  // flips 12h back to 4h under the thumb.
  static const double _start = math.pi * 0.75;
  static const double _sweep = math.pi * 1.5;
  static const double _minValue = 4.0;
  static const double _maxValue = 12.0;

  late final AnimationController _anim;
  late double _display;
  late double _animFrom;
  double _knobPop = 0;
  bool _dragging = false;

  @override
  void initState() {
    super.initState();
    _display = widget.value;
    _animFrom = widget.value;
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    )..addListener(() {
        final t = Curves.easeOutCubic.transform(_anim.value);
        setState(() {
          _display = _animFrom + (widget.value - _animFrom) * t;
          // knob gives a small kick as it lands
          _knobPop = math.sin(t * math.pi) * (_dragging ? 0.0 : 1.0);
        });
      });
  }

  @override
  void didUpdateWidget(covariant _CircularSleepDial old) {
    super.didUpdateWidget(old);
    if (old.value != widget.value) {
      _animFrom = _display;
      _anim
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  void _handleTouch(Offset local, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final d = local - center;
    // Ignore the middle of the dial so a stray touch cannot fling the value.
    if (d.distance < size.width * 0.18) return;

    var rel = (math.atan2(d.dy, d.dx) - _start) % (2 * math.pi);
    if (rel > _sweep) {
      // inside the bottom gap: stick to whichever end is nearer
      rel = (rel - _sweep) < (2 * math.pi - rel) ? _sweep : 0;
    }
    final raw = _minValue + (rel / _sweep) * (_maxValue - _minValue);
    final snapped = ((raw * 2).round() / 2).clamp(_minValue, _maxValue);
    if (snapped != widget.value) {
      HapticFeedback.selectionClick();
      widget.onChanged(snapped);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hours = widget.value.floor();
    final minutes = ((widget.value - hours) * 60).round();
    final minStr = minutes == 0 ? '' : minutes.toString().padLeft(2, '0');
    final label = minStr.isEmpty ? '${hours}h' : '${hours}h$minStr';

    return LayoutBuilder(builder: (ctx, constraints) {
      final size =
          math.min(constraints.maxWidth, constraints.maxHeight).clamp(0.0, 290.0);
      final box = Size(size, size);

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanDown: (d) {
                setState(() => _dragging = true);
                _handleTouch(d.localPosition, box);
              },
              onPanUpdate: (d) => _handleTouch(d.localPosition, box),
              onPanEnd: (_) {
                setState(() => _dragging = false);
                HapticFeedback.lightImpact();
              },
              onPanCancel: () => setState(() => _dragging = false),
              child: CustomPaint(
                painter: _SleepDialPainter(
                  value: _display,
                  start: _start,
                  sweep: _sweep,
                  minValue: _minValue,
                  maxValue: _maxValue,
                  knobPop: _knobPop,
                  dragging: _dragging,
                ),
                child: Center(
                  child: AnimatedScale(
                    scale: _dragging ? 1.06 : 1.0,
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOut,
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _DialButton(
                icon: Icons.remove_rounded,
                onTap: () {
                  final v = (widget.value - 0.5).clamp(_minValue, _maxValue);
                  widget.onChanged((v * 2).round() / 2.0);
                },
              ),
              const SizedBox(width: 48),
              _DialButton(
                icon: Icons.add_rounded,
                onTap: () {
                  final v = (widget.value + 0.5).clamp(_minValue, _maxValue);
                  widget.onChanged((v * 2).round() / 2.0);
                },
              ),
            ],
          ),
        ],
      );
    });
  }
}

class _SleepDialPainter extends CustomPainter {
  final double value;
  final double start;
  final double sweep;
  final double minValue;
  final double maxValue;
  final double knobPop;
  final bool dragging;

  const _SleepDialPainter({
    required this.value,
    required this.start,
    required this.sweep,
    required this.minValue,
    required this.maxValue,
    required this.knobPop,
    required this.dragging,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = math.min(center.dx, center.dy) - 18;
    final t = ((value - minValue) / (maxValue - minValue)).clamp(0.0, 1.0);
    final angle = start + t * sweep;

    // ── Ticks along the track ────────────────────────────────────────────
    const ticks = 33; // one per quarter hour
    for (var i = 0; i < ticks; i++) {
      final f = i / (ticks - 1);
      final a = start + f * sweep;
      final active = f <= t + 0.0001;
      final len = active ? 15.0 : 9.0;
      final width = active ? 4.5 : 3.0;
      final color = active
          ? Color.lerp(AppColors.primary, AppColors.cyan, f)!
              .withValues(alpha: 0.95)
          : Colors.white.withValues(alpha: 0.12);

      canvas.drawLine(
        Offset(center.dx + (r - len) * math.cos(a),
            center.dy + (r - len) * math.sin(a)),
        Offset(center.dx + r * math.cos(a), center.dy + r * math.sin(a)),
        Paint()
          ..color = color
          ..strokeWidth = width
          ..strokeCap = StrokeCap.round,
      );
    }

    // ── Glow along the filled part ───────────────────────────────────────
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: r - 7),
      start,
      t * sweep,
      false,
      Paint()
        ..color = AppColors.primary.withValues(alpha: dragging ? 0.30 : 0.18)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 16
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),
    );

    // ── Knob ─────────────────────────────────────────────────────────────
    final knob = Offset(
      center.dx + (r - 7) * math.cos(angle),
      center.dy + (r - 7) * math.sin(angle),
    );
    final grow = (dragging ? 2.5 : 0) + knobPop * 2.0;
    canvas.drawCircle(
      knob,
      13 + grow,
      Paint()
        ..color = AppColors.primary.withValues(alpha: 0.35)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );
    canvas.drawCircle(knob, 9 + grow, Paint()..color = Colors.white);
    canvas.drawCircle(knob, 4.5 + grow * 0.4,
        Paint()..color = AppColors.primary);
  }

  @override
  bool shouldRepaint(_SleepDialPainter old) =>
      old.value != value || old.knobPop != knobPop || old.dragging != dragging;
}

class _DialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _DialButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        width: 56, height: 56,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.15),
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.3), width: 1.5),
        ),
        child: Icon(icon, color: AppColors.primary, size: 28),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// Growth chart painter
// ═════════════════════════════════════════════════════════════════════════════

class _GrowthChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Bad habits curve (orange/red)
    final badPath = Path();
    badPath.moveTo(0, h * 0.85);
    badPath.cubicTo(w * 0.3, h * 0.75, w * 0.6, h * 0.50, w, h * 0.40);

    final badFill = Path.from(badPath)
      ..lineTo(w, h)..lineTo(0, h)..close();

    canvas.drawPath(badFill, Paint()
      ..shader = LinearGradient(
          colors: [const Color(0xFFFF6B4A).withValues(alpha: 0.3), const Color(0xFFFF6B4A).withValues(alpha: 0.0)],
          begin: Alignment.topCenter, end: Alignment.bottomCenter,
        ).createShader(Rect.fromLTWH(0, 0, w, h))
      ..style = PaintingStyle.fill);

    canvas.drawPath(badPath, Paint()
      ..color = const Color(0xFFFF6B4A)..strokeWidth = 2.5..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);

    // Optimized habits curve (purple)
    final goodPath = Path();
    goodPath.moveTo(0, h * 0.85);
    goodPath.cubicTo(w * 0.25, h * 0.60, w * 0.55, h * 0.25, w, h * 0.05);

    final goodFill = Path.from(goodPath)
      ..lineTo(w, h)..lineTo(0, h)..close();

    canvas.drawPath(goodFill, Paint()
      ..shader = LinearGradient(
          colors: [AppColors.primary.withValues(alpha: 0.35), AppColors.primary.withValues(alpha: 0.0)],
          begin: Alignment.topCenter, end: Alignment.bottomCenter,
        ).createShader(Rect.fromLTWH(0, 0, w, h))
      ..style = PaintingStyle.fill);

    canvas.drawPath(goodPath, Paint()
      ..color = AppColors.primary..strokeWidth = 2.5..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);

    // End dots
    final endDots = <(double, double, Color)>[
      (w, h * 0.05, AppColors.primary),
      (w, h * 0.40, const Color(0xFFFF6B4A)),
    ];
    for (final dot in endDots) {
      canvas.drawCircle(Offset(dot.$1, dot.$2), 7,
        Paint()..color = dot.$3.withValues(alpha: 0.3)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6));
      canvas.drawCircle(Offset(dot.$1, dot.$2), 5, Paint()..color = dot.$3);
      canvas.drawCircle(Offset(dot.$1, dot.$2), 2.5, Paint()..color = Colors.white);
    }

    // Start dot
    canvas.drawCircle(Offset(0, h * 0.85), 5, Paint()..color = AppColors.primary);
    canvas.drawCircle(Offset(0, h * 0.85), 2.5, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_GrowthChartPainter old) => false;
}


// Welcome Screen
class _WelcomeScreen extends StatefulWidget {
  const _WelcomeScreen();
  @override
  State<_WelcomeScreen> createState() => _WelcomeScreenState();
}

/// The hand-off into step two. The questionnaire is behind the user, so the
/// first step ticks off in front of them and the tour lights up as what comes
/// next. This is also the door into the app itself.
class _WelcomeScreenState extends State<_WelcomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final AnimationController _halo;
  late final Animation<double> _badge;
  late final Animation<double> _ring;
  late final Animation<double> _headOpacity;
  late final Animation<Offset> _headSlide;
  late final Animation<double> _btnOpacity;
  late final Animation<Offset> _btnSlide;

  int _from = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1700));
    _halo = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2400))
      ..repeat();

    _badge = CurvedAnimation(
        parent: _ctrl, curve: const Interval(0.0, 0.30, curve: Curves.easeOutBack));
    _ring = CurvedAnimation(
        parent: _ctrl, curve: const Interval(0.10, 0.55, curve: Curves.easeOutCubic));
    _headOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _ctrl, curve: const Interval(0.25, 0.5, curve: Curves.easeOut)));
    _headSlide = Tween(begin: const Offset(0, 0.22), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _ctrl,
            curve: const Interval(0.25, 0.55, curve: Curves.easeOutCubic)));
    _btnOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _ctrl, curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));
    _btnSlide = Tween(begin: const Offset(0, 0.35), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _ctrl,
            curve: const Interval(0.75, 1.0, curve: Curves.easeOutCubic)));
    _ctrl.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final provider = context.read<AppProvider>();
      setState(() => _from = provider.journeyProgress);
      // The questionnaire is behind us, so step one is done.
      provider.completeJourneyStep(0);
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _halo.dispose();
    super.dispose();
  }

  void _enter() {
    HapticFeedback.mediumImpact();
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, _, _) => const MainScreen(),
        transitionsBuilder: (_, anim, _, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final progress = context.watch<AppProvider>().journeyProgress;
    final next = journeySteps(l)[1];

    return Scaffold(
      backgroundColor: const Color(0xFF07050F),
      body: Stack(
        children: [
          // ── Ground: a cool wash that leans toward the next step's colour ──
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF160B33), Color(0xFF0A0718), Color(0xFF07050F)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _ring,
            builder: (context, _) => Positioned(
              top: -120,
              left: -60,
              right: -60,
              height: 420,
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        AppColors.lime.withValues(alpha: 0.16 * _ring.value),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(26, 26, 26, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Badge: the first step landing ────────────────
                        Center(
                          child: AnimatedBuilder(
                            animation: Listenable.merge([_ctrl, _halo]),
                            builder: (context, _) => SizedBox(
                              width: 128,
                              height: 128,
                              child: CustomPaint(
                                painter: _CompletionBadgePainter(
                                  sweep: _ring.value,
                                  halo: _halo.value,
                                  color: AppColors.lime,
                                ),
                                child: Center(
                                  child: Transform.scale(
                                    scale: _badge.value.clamp(0.0, 1.4),
                                    child: Container(
                                      width: 78,
                                      height: 78,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            AppColors.lime,
                                            AppColors.lime.withValues(alpha: 0.72),
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.lime
                                                .withValues(alpha: 0.45),
                                            blurRadius: 30,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(Icons.check_rounded,
                                          size: 40, color: Color(0xFF06210F)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 22),

                        FadeTransition(
                          opacity: _headOpacity,
                          child: SlideTransition(
                            position: _headSlide,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  l.journeyDataDoneTitle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    height: 1.1,
                                    letterSpacing: -1.0,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  l.journeyDataDoneSubtitle,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.5,
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withValues(alpha: 0.58),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // ── The journey, with step one ticking off ───────
                        Container(
                          padding: const EdgeInsets.fromLTRB(18, 22, 18, 22),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.035),
                            borderRadius: BorderRadius.circular(26),
                            border: Border.all(
                                color: Colors.white.withValues(alpha: 0.07)),
                          ),
                          child: JourneySteps(
                              completed: progress, animateFrom: _from),
                        ),

                        const SizedBox(height: 18),
                      ],
                    ),
                  ),
                ),

                // ── What comes next, then the door into the app ──────────
                FadeTransition(
                  opacity: _btnOpacity,
                  child: SlideTransition(
                    position: _btnSlide,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 4, 24, 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(next.icon, size: 15, color: next.color),
                              const SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  next.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.2,
                                    color: next.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _TallerButton(
                            label: l.journeyContinue,
                            enabled: true,
                            onTap: _enter,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The ring that draws itself around the completion badge, plus a halo that
/// keeps breathing once the ring has closed.
class _CompletionBadgePainter extends CustomPainter {
  final double sweep;
  final double halo;
  final Color color;
  const _CompletionBadgePainter({
    required this.sweep,
    required this.halo,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.42;

    // breathing halo
    final pulse = (math.sin(halo * math.pi * 2) + 1) / 2;
    canvas.drawCircle(
      center,
      radius * (1.02 + 0.10 * pulse),
      Paint()
        ..color = color.withValues(alpha: 0.10 * (1 - pulse) * sweep)
        ..style = PaintingStyle.fill,
    );

    // track
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white.withValues(alpha: 0.07)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );

    // the arc closing as the step completes
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2 * sweep,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round
        ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 3),
    );
  }

  @override
  bool shouldRepaint(covariant _CompletionBadgePainter old) =>
      old.sweep != sweep || old.halo != halo || old.color != color;
}
