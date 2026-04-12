import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/user_profile.dart';
import '../models/height_record.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/calculations.dart';
import 'main_screen.dart';
import '../widgets/premium_paywall.dart';

// ─── Page index constants ─────────────────────────────────────────────────────
const int _kGenderPage   = 2;
const int _kWorkoutPage  = 7;
const int _kAnalyzingPage = 14;
const int _kLastQuestion = 13; // last page that shows the Next button

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
  final _introController = PageController();
  int _currentPage = 0;
  int _introSlide  = 0;

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
  double _footSize   = 8.5;
  bool   _footSizeEU = false;

  // ── Dream height ─────────────────────────────────────────────────────────────
  bool _dreamImperial  = false;
  int  _dreamHeightCm  = 183;
  int  _dreamFt = 6, _dreamIn = 0;

  // ── Sleep ────────────────────────────────────────────────────────────────────
  double _sleepHours = 7.5;

  // ── Legacy – past heights (kept for compatibility) ───────────────────────────
  final _pastHeightValues = <int, int>{};

  // ── Analysis ─────────────────────────────────────────────────────────────────
  PredictionResult? _prediction;
  GlowUpScore?      _score;

  // ── Animation controllers ────────────────────────────────────────────────────
  late AnimationController _resultAnim;

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
    _resultAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
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
    _introController.dispose();
    _resultAnim.dispose();
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
      setState(() => _currentPage = page + 1);
      _pageController.animateToPage(
        page + 1,
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeInOut,
      );
    }
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
    for (final e in _pastHeightValues.entries) {
      if (e.key <= _userAge && e.value > 50 && e.value < 250) {
        pastHeights[e.key] = e.value.toDouble();
      }
    }
    pastHeights[_userAge] = profile.currentHeight;
    final records = pastHeights.entries.map((e) {
      final year = DateTime.now().year - (_userAge - e.key);
      return HeightRecord(date: '$year-06-15', height: e.value);
    }).toList()..sort((a, b) => a.date.compareTo(b.date));
    _prediction = Calculations.predictFinalHeight(profile, records);
    _score = Calculations.calculateGlowUpScore(
      profile: profile,
      records: records,
      routineProgress: (_weeklyWorkout == '6+' ? 0.9 : _weeklyWorkout == '3-5' ? 0.6 : 0.2).clamp(0.0, 1.0),
      waterProgress: 0.7,
      sleepHours: _sleepHours,
      streak: 0,
    );
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
      case _kWorkoutPage: return _weeklyWorkout.isNotEmpty;
      default:           return true;
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
    for (final e in _pastHeightValues.entries) {
      if (e.key <= _userAge && e.value > 50 && e.value < 250) past[e.key] = e.value.toDouble();
    }
    final p = context.read<AppProvider>();
    p.savePastHeights(past);
    p.setProfile(profile);
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // BUILD
  // ─────────────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final showNav    = _currentPage >= _kGenderPage && _currentPage <= _kLastQuestion;
    final showButton = _currentPage <= _kLastQuestion;
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
                        _buildSleepPage(),         // 10
                        _buildReviewsPage(),       // 11
                        _buildChartPage(),         // 12
                        _buildJourneyPage(),       // 13 NEW
                        const SizedBox(),          // 14 placeholder for analyzing
                        _buildResultPage(),        // 15
                      ],
                    ),
                  ),

                  // ── Bottom button ───────────────────────────────────────
                  if (showButton)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
                      child: _TallerButton(
                        label: _currentPage == 0
                            ? "Let's start"
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
    final slides = [
      _IntroSlideData(
        tag: 'TAHMIN',
        tagColor: AppColors.primary,
        title: 'Boy potansiyelini\nkeşfet',
        subtitle: 'Genetik, yaş ve yaşam tarzına göre\ntam potansiyelini hesaplayalım.',
        child: _IntroMockupHeight(),
      ),
      _IntroSlideData(
        tag: 'BÜYÜME',
        tagColor: const Color(0xFF22C55E),
        title: 'Her gün 1 adım\ndaha uzun',
        subtitle: 'Kişiselleştirilmiş egzersiz ve beslenme\nplanıyla potansiyelini zorla.',
        child: _IntroMockupTrain(),
      ),
      _IntroSlideData(
        tag: 'TAKİP',
        tagColor: AppColors.cyan,
        title: 'Her santimetreyi\ntakip et',
        subtitle: 'Aylık ölçümlerle gerçek ilerlemenin\nnasıl geliştiğini izle.',
        child: _IntroMockupProgress(),
      ),
      _IntroSlideData(
        tag: 'GAMİFİKASYON',
        tagColor: AppColors.orange,
        title: 'Seviyeleri aş,\nödülleri kazan',
        subtitle: '70 günlük programları tamamla,\nXP kazan ve yeni seviyeleri aç.',
        child: _IntroMockupLevels(),
      ),
      _IntroSlideData(
        tag: 'TOPLULUK',
        tagColor: const Color(0xFFFFD700),
        title: 'Binlerce kişi\nzaten büyüdü',
        subtitle: 'Hedefine ulaşan kullanıcı topluluğuna\nsen de katıl.',
        child: _IntroMockupReviews(),
      ),
    ];

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _introController,
            onPageChanged: (i) => setState(() => _introSlide = i),
            itemCount: slides.length,
            itemBuilder: (ctx, i) {
              final s = slides[i];
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Expanded(child: s.child),
                  const SizedBox(height: 18),
                  // Tag pill
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: s.tagColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: s.tagColor.withValues(alpha: 0.35)),
                    ),
                    child: Text(s.tag, style: TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.2,
                      color: s.tagColor,
                    )),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Text(s.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1.0, height: 1.12),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(s.subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.5, color: Colors.white.withValues(alpha: 0.58), height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              );
            },
          ),
        ),
        // Dot indicators
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(slides.length, (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 280),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: _introSlide == i ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _introSlide == i ? AppColors.primary : Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(4),
              ),
            )),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 1 — Pain hook
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildPainHookPage() {
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
            child: const Text('⚠️  KRİTİK PENCERE', style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w800, letterSpacing: 1.0,
              color: Color(0xFFEF4444),
            )),
          ),
          const SizedBox(height: 18),
          const Text('Boy potansiyelin',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1.2, height: 1.05),
          ),
          RichText(text: const TextSpan(children: [
            TextSpan(text: 'kaybolup gidiyor!',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Color(0xFFEF4444), letterSpacing: -1.2)),
          ])),
          const SizedBox(height: 16),
          Text('Her geçen gün, doğru alışkanlıklar olmadan santimler kalıcı olarak kayboluyor. Ama bu hâlâ tersine çevrilebilir.',
            style: TextStyle(fontSize: 15.5, color: Colors.white.withValues(alpha: 0.65), height: 1.55)),
          const SizedBox(height: 28),
          // Fact cards
          ...[
            (
              '🧬', const Color(0xFF8B5CF6),
              'Genetiğin her şeyi değil',
              'Genetiğin %60\'ını belirliyor — ama yaptıkların geri kalan %40\'ı belirliyor. BeTaller tam da bu %40 için burada.',
              'Analiz',
            ),
            (
              '😴', const Color(0xFF6366F1),
              'Uyku rutinini optimize et',
              'Her gece doğru uyku büyüme hormonu üretimini %70 artırabilir. BeTaller uyku takibini otomatik yapar, sen sadece uyu.',
              'Takip',
            ),
            (
              '🦴', const Color(0xFF00C6FF),
              'Postürünle şu an santim kazan',
              'Doğru duruş sana anında 1.5–3 cm katabilir. BeTaller\'ın günlük postür rutini bunu birkaç haftada yerleştirir.',
              'Postür',
            ),
            (
              '💪', const Color(0xFF22FF88),
              'Sana özel egzersiz planın hazır',
              'Sabah germe, asılma, omurga rutinleri — BeTaller bunları senin için hazırladı ve planladı. Her gün 8–12 dakika yeter.',
              'Rutinler',
            ),
            (
              '🥗', const Color(0xFFFF8A00),
              'Beslenmen büyümeni doğrudan etkiler',
              'Protein, kalsiyum, D vitamini — BeTaller hangi besinleri ne zaman almanı gerektiğini her gün hatırlatır.',
              'Beslenme',
            ),
            (
              '📈', const Color(0xFFFFD700),
              'Büyümeni gözlerinle takip et',
              'Aylık ölçümlerle santim santim ilerlediğini görmek, seni devam ettiren şeydir. BeTaller her değişimi grafikle gösterir.',
              'İlerleme',
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
                    const Text('Senin için tasarlandı', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white)),
                    const SizedBox(height: 3),
                    Text('BeTaller, genetik limitine ulaşman — hatta onu aşman — için sana özel kuruldu. Her özellik, sen için.',
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

  Widget _buildGenderPage() => _RadioListPage(
    title: 'Select your gender',
    subtitle: 'This will be used to predict your height potential & create your custom plan.',
    options: const [('male', 'Male'), ('female', 'Female'), ('other', 'Other')],
    selected: _gender,
    onSelect: (v) => setState(() => _gender = v),
  );

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 2 — Birth date
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildBirthDatePage() {
    return _ScrollPickerPage(
      title: 'When were you born?',
      subtitle: 'This will be used to predict your height potential & create your custom plan.',
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
    final unitKey = _heightImperial ? 'imp' : 'met';
    return _ScrollPickerPage(
      title: 'Height & weight',
      subtitle: 'This will be used to predict your height potential & create your custom plan.',
      unitToggle: _UnitToggle(
        left: 'Imperial', right: 'Metric',
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
          ? ['Height', '', 'Weight']
          : ['Height', 'Weight'],
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
    final unitKey = _heightImperial ? 'imp' : 'met';
    return _ScrollPickerPage(
      title: 'Parents height',
      subtitle: 'This will be used to predict your height potential & create your custom plan.',
      unitToggle: _UnitToggle(
        left: 'Imperial', right: 'Metric',
        isRight: !_heightImperial,
        onToggle: (isMetric) => setState(() => _heightImperial = !isMetric),
      ),
      headerRow: _pickerHeaders(_heightImperial
          ? ['Dad', '', 'Mother', '']
          : ['Dad', 'Mother'],
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
    final options = [
      ('0-2', '0-2', 'Workouts per week'),
      ('3-5', '3-5', 'Workouts per week'),
      ('6+',  '6+',  'Workouts per week'),
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _PageTitle('Weekly workout'),
          const SizedBox(height: 8),
          _PageSubtitle('This will be used to predict your height potential & create your custom plan.'),
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

  Widget _buildEthnicityPage() => _RadioListPage(
    title: "What's your ethnicity?",
    subtitle: 'This will be used to predict your height potential & create your custom plan.',
    options: const [
      ('white',          'White / Caucasian'),
      ('black',          'Black / African American'),
      ('hispanic',       'Hispanic / Latino'),
      ('asian',          'Asian'),
      ('middle_eastern', 'Middle Eastern / Indigenous'),
      ('no_answer',      "I don't want to answer"),
    ],
    selected: _ethnicity,
    onSelect: (v) => setState(() => _ethnicity = v),
  );

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 8 — Foot size
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildFootSizePage() {
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
          const _PageTitle('Foot size'),
          const SizedBox(height: 8),
          _PageSubtitle('This will be used to predict your height potential & create your custom plan.'),
          const SizedBox(height: 20),
          const Text('Select your size',
            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
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
    final unitKey = _dreamImperial ? 'imp' : 'met';
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _PageTitle("What's your dream height?"),
          const SizedBox(height: 8),
          _PageSubtitle("Based on your input, we'll calculate the likelihood of achieving this height."),
          const SizedBox(height: 20),
          const Text('Dream height',
            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
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
          _UnitToggle(left: 'Imperial', right: 'Metric', isRight: !_dreamImperial,
            onToggle: (isMetric) => setState(() => _dreamImperial = !isMetric)),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 10 — Sleep (circular dial)
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildSleepPage() => Padding(
    padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _PageTitle('How many hours do\nyou sleep each night?'),
        const SizedBox(height: 8),
        _PageSubtitle('This will be used to predict your height potential & create your custom plan.'),
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

  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 12 — Social proof "Binlerce Kişi Başardı"
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildReviewsPage() {
    final testimonials = [
      _Testimonial(
        name: 'Ertuğ E.', age: 23, emoji: '💪',
        quote: 'Yaşım büyük olduğu için umudum yoktu ama BeTaller ile uzadım. Özgüvenim hiç bu kadar yüksek olmamıştı.',
        gain: '+2.6 cm', duration: '4 ay',
        verified: true,
        photoPath: 'assets/testimonials/ertug.jpg',
      ),
      _Testimonial(
        name: 'Ahmet', age: 20, emoji: '🔥',
        quote: 'Herkes "artık büyüyemezsin" dedi. BeTaller\'ı kullandım ve herkesi şaşırttım.',
        gain: '+2.5 cm', duration: '3 ay',
        verified: true,
        photoPath: 'assets/testimonials/ahmet2.jpg',
      ),
      _Testimonial(
        name: 'Gökdeniz', age: 22, emoji: '🌟',
        quote: 'Rutinlere başladıktan sonra hem boyum uzadı hem duruşum düzeldi. Çevremdekiler farkı hemen fark etti.',
        gain: '+2.3 cm', duration: '6 ay',
        verified: true,
        photoPath: 'assets/testimonials/gokdeniz.jpg',
      ),
      _Testimonial(
        name: 'Mert', age: 19, emoji: '📈',
        quote: 'Hâlâ büyüme çağındayım ama BeTaller\'ın etkisi inanılmaz. Hem daha uzun hem daha güçlü hissediyorum.',
        gain: '+3.3 cm', duration: '3 ay',
        verified: true,
        photoPath: 'assets/testimonials/mert.jpg',
      ),
      _Testimonial(
        name: 'Aydın', age: 18, emoji: '🎯',
        quote: 'BeTaller\'ı denemedim desem yalan olur. Kısa sürede ciddi fark hissettim, kesinlikle tavsiye ederim.',
        gain: '+3.1 cm', duration: '4 ay',
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
          const Text('Binlerce Kişi\nBaşardı',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1.0, height: 1.12)),
          const SizedBox(height: 8),
          Text('Sen de başarabilirsin',
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

  Widget _buildChartPage() => SingleChildScrollView(
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
          child: const Text('BİLİMSEL VERİ', style: TextStyle(
            fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.2, color: AppColors.primary,
          )),
        ),
        const SizedBox(height: 14),
        const _PageTitle('BeTaller uzun vadeli\nsonuçlar yaratır'),
        const SizedBox(height: 8),
        _PageSubtitle("Pek çok kişi yanlış alışkanlıklar yüzünden nihai boyuna ulaşamıyor."),
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
              const Text('Nihai boyun',
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              Expanded(child: CustomPaint(size: Size.infinite, painter: _GrowthChartPainter())),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LegendDot(color: const Color(0xFFFF6B4A), label: 'Kötü alışkanlıklar'),
                  const SizedBox(width: 22),
                  _LegendDot(color: AppColors.primary, label: 'Optimize edilmiş'),
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
            pct: '%30',
            desc: 'Boy alışkanlıklarla\ndeğiştirilebilir',
            color: AppColors.primary,
          )),
          const SizedBox(width: 10),
          Expanded(child: _ChartFactCard(
            emoji: '😴',
            pct: '9-10s',
            desc: 'İdeal uyku büyüme\nhormonunu artırır',
            color: AppColors.cyan,
          )),
          const SizedBox(width: 10),
          Expanded(child: _ChartFactCard(
            emoji: '🦴',
            pct: '3 cm',
            desc: 'Postür iyileştirmeyle\nkazanılabilir',
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
              Text('💡  Biliyor muydun?',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.primary)),
              const SizedBox(height: 10),
              ...['Günlük alışkanlıklar boyun %30\'unu etkiler', 'Omurga kasılması 1.5-3 cm boyunu çalar', 'Uyku eksikliği HGH\'ı %70 düşürür']
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


  // Called by _AnalyzingPage when animation finishes — show result page
  void _onAnalysisComplete() {
    if (!mounted) return;
    _saveProfile();
    setState(() => _currentPage = _kAnalyzingPage + 1);
    _pageController.jumpToPage(_kAnalyzingPage + 1);
    _resultAnim.forward();
  }

  // Called by result page CTA button
  void _onResultContinue() async {
    if (!mounted) return;
    final provider = context.read<AppProvider>();
    if (provider.isPremium) {
      _goToMain();
      return;
    }
    final purchased = await Navigator.push<bool>(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (_) => const PremiumPaywallScreen(),
      ),
    );
    if (mounted && purchased == true) {
      _goToMain();
    }
  }

  void _goToMain() {
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(builder: (_) => const MainScreen()),
    );
  }


  // ─────────────────────────────────────────────────────────────────────────────
  // PAGE 14 — Journey roadmap
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildJourneyPage() {
    final milestones = [
      _JourneyMilestone(
        label: '1H',
        title: '1. Hafta',
        desc: 'Omurga düzelir, duruş pozisyonu iyileşir',
        icon: '🌱',
        color: const Color(0xFF22C55E),
        isActive: false,
      ),
      _JourneyMilestone(
        label: '1A',
        title: '1. Ay',
        desc: 'İlk görünür santimler, uyku kalitesi artar',
        icon: '💪',
        color: AppColors.cyan,
        isActive: false,
      ),
      _JourneyMilestone(
        label: '3A',
        title: '3. Ay',
        desc: 'Ortalama +1.5–2.5 cm kazanım, kas gelişimi',
        icon: '⚡',
        color: AppColors.primary,
        isActive: false,
      ),
      _JourneyMilestone(
        label: '6A',
        title: '6. Ay',
        desc: 'Maksimum potansiyeline ulaş, yeni boyunla yaşa',
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
          const Text('Dönüşüm\nYolculuğun Başlıyor',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1.2, height: 1.12)),
          const SizedBox(height: 10),
          Text('Bilimsel olarak kanıtlanmış program seni\nhedefine adım adım taşır.',
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
                    Text('6. Ay', style: TextStyle(fontSize: 12, color: const Color(0xFFFFD700).withValues(alpha: 0.80))),
                    const Text('Hedefine Ulaş', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white)),
                  ]),
                ]),
                const SizedBox(height: 14),
                Divider(color: Colors.white.withValues(alpha: 0.08)),
                const SizedBox(height: 10),
                ...['Maksimum potansiyelini ortaya çıkar', 'Yeni boyunla yaşamaya başla', 'Başarı hikayeni yaz'].asMap().entries.map((e) =>
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

  Widget _buildResultPage() {
    if (_prediction == null || _score == null) return const SizedBox();
    final l = AppLocalizations.of(context)!;
    final currentHeight = _selectedHeight.toDouble();
    final growth = _prediction!.finalHeight - currentHeight;

    return AnimatedBuilder(
      animation: _resultAnim,
      builder: (context, _) {
        final predFade  = CurvedAnimation(parent: _resultAnim, curve: const Interval(0.0, 0.35, curve: Curves.easeOut));
        final predSlide = CurvedAnimation(parent: _resultAnim, curve: const Interval(0.0, 0.45, curve: Curves.easeOutCubic));
        final scoreFade  = CurvedAnimation(parent: _resultAnim, curve: const Interval(0.2, 0.5, curve: Curves.easeOut));
        final scoreSlide = CurvedAnimation(parent: _resultAnim, curve: const Interval(0.2, 0.6, curve: Curves.easeOutCubic));

        final counterAnim = CurvedAnimation(parent: _resultAnim, curve: const Interval(0.1, 0.55, curve: Curves.easeOutCubic));
        final barFill     = CurvedAnimation(parent: _resultAnim, curve: const Interval(0.35, 0.8, curve: Curves.easeOutCubic));
        final displayHeight = currentHeight + (growth > 0 ? growth * counterAnim.value : 0);

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: Column(
                  children: [
              // Prediction card
              Transform.translate(
                offset: Offset(0, 40 * (1 - predSlide.value)),
                child: Opacity(
                  opacity: predFade.value,
                  child: PremiumLockedOverlay(
                    onTap: () => showPremiumPaywall(context),
                    borderRadius: 28,
                    blurAmount: 18,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF2D1B69), Color(0xFF1A1145)],
                          begin: Alignment.topLeft, end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                        boxShadow: [BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.15 * predFade.value),
                          blurRadius: 30,
                        )],
                      ),
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        children: [
                          Text(l.predictedHeightAt21, style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.75),
                          )),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(displayHeight.toStringAsFixed(1),
                                style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -3, height: 1)),
                              const SizedBox(width: 4),
                              Text('cm', style: TextStyle(fontSize: 20, color: Colors.white.withValues(alpha: 0.82))),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.lime.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(l.growthPotential(growth.toStringAsFixed(1)),
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.lime)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Score card
              Transform.translate(
                offset: Offset(0, 50 * (1 - scoreSlide.value)),
                child: Opacity(
                  opacity: scoreFade.value,
                  child: PremiumLockedOverlay(
                    onTap: () => showPremiumPaywall(context),
                    child: GlassCard(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(l.yourScore, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: _gradeColor(_score!.grade).withValues(alpha: 0.18),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: _gradeColor(_score!.grade).withValues(alpha: 0.4)),
                                ),
                                child: Text(_score!.grade, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: _gradeColor(_score!.grade))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _AnimatedScoreRow(label: l.genetic,    value: _score!.genetic,    color: AppColors.primary, fill: barFill.value),
                          const SizedBox(height: 8),
                          _AnimatedScoreRow(label: l.growth,     value: _score!.velocity,   color: AppColors.cyan,    fill: barFill.value),
                          const SizedBox(height: 8),
                          _AnimatedScoreRow(label: l.nutrition,  value: _score!.nutrition,  color: AppColors.orange,  fill: barFill.value),
                          const SizedBox(height: 8),
                          _AnimatedScoreRow(label: l.sleepLabel, value: _score!.sleep,      color: AppColors.sleep,   fill: barFill.value),
                          const SizedBox(height: 8),
                          _AnimatedScoreRow(label: l.discipline, value: _score!.discipline, color: AppColors.lime,    fill: barFill.value),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              // Peer comparison locked card
              Transform.translate(
                offset: Offset(0, 50 * (1 - scoreSlide.value)),
                child: Opacity(
                  opacity: scoreFade.value,
                  child: PremiumLockedOverlay(
                    onTap: () => showPremiumPaywall(context),
                    child: GlassCard(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(CupertinoIcons.globe, color: AppColors.cyan, size: 18),
                            const SizedBox(width: 8),
                            const Text('Yaşıtlarına Göre Konumun', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                          ]),
                          const SizedBox(height: 14),
                          Container(
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: const LinearGradient(colors: [Color(0xFFFF6B35), Color(0xFFFFD700), Color(0xFF22FF88)]),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Kısa', style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.4))),
                              Text('Ortalama', style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.4))),
                              Text('Uzun', style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.4))),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.cyan.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.cyan.withValues(alpha: 0.15)),
                            ),
                            child: Row(children: [
                              const Icon(CupertinoIcons.person_2_fill, color: AppColors.cyan, size: 14),
                              const SizedBox(width: 8),
                              Text('Küresel sıralamanda tam konumunu gör', style: TextStyle(fontSize: 12, color: Colors.white.withValues(alpha: 0.7))),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Routine preview locked card
              Transform.translate(
                offset: Offset(0, 60 * (1 - scoreSlide.value)),
                child: Opacity(
                  opacity: scoreFade.value,
                  child: PremiumLockedOverlay(
                    onTap: () => showPremiumPaywall(context),
                    child: GlassCard(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(CupertinoIcons.bolt_fill, color: AppColors.lime, size: 18),
                            const SizedBox(width: 8),
                            const Text('Senin İçin Hazırlanan Plan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                          ]),
                          const SizedBox(height: 14),
                          ...['🌅  Sabah Omurga Açılımı  •  8 dk', '💪  Asılma & Germe Serisi  •  12 dk', '🥗  Büyüme Besinleri Listesi  •  Günlük', '🌙  Uyku Optimizasyon Rutini  •  Gece'].map((item) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(children: [
                              Expanded(child: Text(item, style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.75)))),
                              Container(
                                width: 8, height: 8,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.lime.withValues(alpha: 0.4)),
                              ),
                            ]),
                          )),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.lime.withValues(alpha: 0.07),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.lime.withValues(alpha: 0.15)),
                            ),
                            child: Row(children: [
                              const Icon(CupertinoIcons.lock_fill, color: AppColors.lime, size: 13),
                              const SizedBox(width: 8),
                              Text('Premium ile tüm planına eriş', style: TextStyle(fontSize: 12, color: Colors.white.withValues(alpha: 0.7))),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
                ),
              ),
            ),
            // Fixed CTA
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Container(
                width: double.infinity, height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF22FF88), Color(0xFF00CC66)],
                    begin: Alignment.topLeft, end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(color: AppColors.lime.withValues(alpha: 0.35), blurRadius: 20, offset: const Offset(0, 6)),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: _onResultContinue,
                    child: const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.lock_open_fill, color: Color(0xFF0A0A14), size: 20),
                          SizedBox(width: 10),
                          Text('Kilitleri Aç', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF0A0A14))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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

  Color _gradeColor(String grade) {
    switch (grade) {
      case 'S': return const Color(0xFFFFD700);
      case 'A': return AppColors.lime;
      case 'B': return AppColors.cyan;
      case 'C': return AppColors.orange;
      default:  return AppColors.error;
    }
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// Data models for new pages
// ═════════════════════════════════════════════════════════════════════════════

class _IntroSlideData {
  final String tag;
  final Color tagColor;
  final String title;
  final String subtitle;
  final Widget child;
  const _IntroSlideData({
    required this.tag,
    required this.tagColor,
    required this.title,
    required this.subtitle,
    required this.child,
  });
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
  Widget build(BuildContext context) => Container(
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
            Text('yaşında', style: TextStyle(fontSize: 12, color: Colors.white.withValues(alpha: 0.40))),
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
                const Text('Doğrulanmış', style: TextStyle(color: Color(0xFF22C55E), fontSize: 10, fontWeight: FontWeight.w700)),
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

          // Glowing person circle
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 170, height: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.35 + _progress * 0.35),
                  AppColors.primary.withValues(alpha: 0.10),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.55, 1.0],
              ),
            ),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 96, height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.80 + _progress * 0.20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: _progress * 0.55),
                      blurRadius: 28 + _progress * 16,
                      spreadRadius: 2 + _progress * 4,
                    ),
                  ],
                ),
                child: const Icon(CupertinoIcons.person_fill, color: Colors.white, size: 46),
              ),
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
  static const _months = [
    'January','February','March','April','May','June',
    'July','August','September','October','November','December',
  ];
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
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _RawPicker(
            controller: _mCtrl,
            items: _months,
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

class _CircularSleepDialState extends State<_CircularSleepDial> {
  Offset? _center;

  double _angleToValue(double angle) {
    // Map full circle (0..2π) to 4..12 hours
    final norm = (angle + math.pi) % (2 * math.pi); // 0..2π starting from bottom
    return 4.0 + (norm / (2 * math.pi)) * 8.0;
  }

  void _handlePan(Offset global) {
    if (_center == null) return;
    final local = global - _center!;
    final angle = math.atan2(local.dy, local.dx);
    final v = _angleToValue(angle).clamp(4.0, 12.0);
    // Round to nearest 0.5
    widget.onChanged((v * 2).round() / 2.0);
  }

  @override
  Widget build(BuildContext context) {
    final hours   = widget.value.floor();
    final minutes = ((widget.value - hours) * 60).round();
    final minStr  = minutes == 0 ? '' : minutes.toString().padLeft(2, '0');
    final label   = minStr.isEmpty ? '${hours}h' : '${hours}h$minStr';

    return LayoutBuilder(builder: (ctx, constraints) {
      final size   = math.min(constraints.maxWidth, constraints.maxHeight).clamp(0.0, 280.0);
      final center = Offset(size / 2, size / 2);

      return GestureDetector(
        onPanStart: (_) {
          final box = ctx.findRenderObject() as RenderBox?;
          _center = box?.localToGlobal(center);
        },
        onPanUpdate: (d) => _handlePan(d.globalPosition),
        onTapDown: (d) {
          final box = ctx.findRenderObject() as RenderBox?;
          _center = box?.localToGlobal(center);
          _handlePan(d.globalPosition);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size, height: size,
              child: CustomPaint(
                painter: _SleepDialPainter(value: widget.value),
                child: Center(
                  child: Text(label, style: const TextStyle(
                    fontSize: 48, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.5,
                  )),
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
                    final v = (widget.value - 0.5).clamp(4.0, 12.0);
                    widget.onChanged((v * 2).round() / 2.0);
                  },
                ),
                const SizedBox(width: 48),
                _DialButton(
                  icon: Icons.add_rounded,
                  onTap: () {
                    final v = (widget.value + 0.5).clamp(4.0, 12.0);
                    widget.onChanged((v * 2).round() / 2.0);
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class _SleepDialPainter extends CustomPainter {
  final double value; // 4..12
  const _SleepDialPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r  = math.min(cx, cy) - 14;

    const totalTicks = 36;
    const startAngle = -math.pi / 2; // start at top
    const sweep      = 2 * math.pi;
    const gap        = sweep / totalTicks;

    // How many ticks are "active" based on value (4..12 mapped to 0..totalTicks)
    final activeFraction = (value - 4.0) / 8.0;
    final activeTicks    = (activeFraction * totalTicks).round();

    for (int i = 0; i < totalTicks; i++) {
      final angle  = startAngle + i * gap;
      final active = i < activeTicks;

      final tickLen   = active ? 14.0 : 9.0;
      final tickWidth = active ? 4.5  : 3.0;
      final tickColor = active
          ? AppColors.primary.withValues(alpha: 0.9 - (i / totalTicks) * 0.2)
          : Colors.white.withValues(alpha: 0.12);

      final x1 = cx + (r - tickLen) * math.cos(angle);
      final y1 = cy + (r - tickLen) * math.sin(angle);
      final x2 = cx + r             * math.cos(angle);
      final y2 = cy + r             * math.sin(angle);

      final paint = Paint()
        ..color       = tickColor
        ..strokeWidth = tickWidth
        ..strokeCap   = StrokeCap.round;

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }

    // Glowing dot at the current position
    final dotAngle = startAngle + activeTicks * gap;
    final dotX     = cx + (r - 7) * math.cos(dotAngle);
    final dotY     = cy + (r - 7) * math.sin(dotAngle);

    canvas.drawCircle(Offset(dotX, dotY), 8,
      Paint()..color = AppColors.primary.withValues(alpha: 0.35)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8));
    canvas.drawCircle(Offset(dotX, dotY), 5,
      Paint()..color = AppColors.primary);
    canvas.drawCircle(Offset(dotX, dotY), 3,
      Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_SleepDialPainter old) => old.value != value;
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

// ═════════════════════════════════════════════════════════════════════════════
// Intro mockup widgets
// ═════════════════════════════════════════════════════════════════════════════

class _PhoneMockup extends StatelessWidget {
  final Widget child;
  const _PhoneMockup({required this.child});

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final h = (screenH * 0.42).clamp(270.0, 380.0);
    final w = h * 0.59;
    return Center(
      child: Container(
        width: w, height: h,
        decoration: BoxDecoration(
          color: const Color(0xFF150F22),
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: Colors.white.withValues(alpha: 0.12), width: 1.5),
          boxShadow: [
            BoxShadow(color: AppColors.primary.withValues(alpha: 0.22), blurRadius: 60, spreadRadius: 4),
            BoxShadow(color: Colors.black.withValues(alpha: 0.40), blurRadius: 20),
          ],
        ),
        child: ClipRRect(borderRadius: BorderRadius.circular(24), child: child),
      ),
    );
  }
}

class _IntroMockupHeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _PhoneMockup(
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: Text('Last report', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700))),
              Icon(CupertinoIcons.gear, color: Colors.white.withValues(alpha: 0.5), size: 14),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _MiniStatTile('Current height', "5'11", Colors.white.withValues(alpha: 0.15))),
              const SizedBox(width: 6),
              Expanded(child: _MiniStatTile('Predicted height', "6'2 ²⁄₁₀", AppColors.primary.withValues(alpha: 0.35))),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.07), borderRadius: BorderRadius.circular(7)),
            child: const Text('Optimize up to 1.1 inches 📈', style: TextStyle(color: Colors.white, fontSize: 8)),
          ),
          const SizedBox(height: 8),
          Container(
            height: 55,
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.04), borderRadius: BorderRadius.circular(8)),
            child: CustomPaint(size: const Size(double.infinity, 55), painter: _MiniChartPainter()),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.06), borderRadius: BorderRadius.circular(8)),
            child: Text('Taller than 76.7% of your age 🌍', style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 8)),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(child: _MiniInfoTile('68%', 'Dream height\nodds')),
              const SizedBox(width: 6),
              Expanded(child: _MiniInfoTile('89.8%', 'Growth\ncomplete')),
            ],
          ),
        ],
      ),
    ),
  );
}

// ── Slide 2: Daily Train mockup ───────────────────────────────────
class _IntroMockupTrain extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _PhoneMockup(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text('Your Plan', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
          const SizedBox(height: 6),
          // Tab bar
          Row(children: [
            _MiniTab('TRAIN', true),
            const SizedBox(width: 8),
            _MiniTab('PROGRAM', false),
            const SizedBox(width: 8),
            _MiniTab('NUTRITION', false),
          ]),
          const SizedBox(height: 8),
          // Day selector  M T W T F S S
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['M','T','W','T','F','S','S'].asMap().entries.map((e) {
                final sel = e.key == 2; // Wednesday selected
                return Container(
                  width: 20, height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: sel ? AppColors.primary : Colors.transparent,
                  ),
                  child: Center(child: Text(e.value,
                    style: TextStyle(fontSize: 7, fontWeight: FontWeight.w700,
                      color: sel ? Colors.white : Colors.white.withValues(alpha: 0.4)))),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          // Optimal daily routine banner
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
            ),
            child: Row(children: [
              const Text('⚡', style: TextStyle(fontSize: 9)),
              const SizedBox(width: 4),
              Text('OPTIMAL DAILY ROUTINE', style: TextStyle(fontSize: 6, fontWeight: FontWeight.w800, color: AppColors.primaryLight, letterSpacing: 0.5)),
              const Spacer(),
              Text('3/6', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: AppColors.primaryBright)),
            ]),
          ),
          const SizedBox(height: 7),
          // Exercise cards
          ...[
            ('🌅', 'Morning Stretch', '10 min', true),
            ('💪', 'Bar Hanging', '5 min', true),
            ('🦘', 'Jump Training', '10 min', false),
          ].map((ex) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ex.$4
                  ? AppColors.lime.withValues(alpha: 0.35)
                  : Colors.white.withValues(alpha: 0.08)),
              ),
              child: Row(children: [
                Text(ex.$1, style: const TextStyle(fontSize: 13)),
                const SizedBox(width: 6),
                Expanded(child: Text(ex.$2, style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600,
                  color: ex.$4 ? Colors.white.withValues(alpha: 0.45) : Colors.white))),
                Text(ex.$3, style: TextStyle(fontSize: 7, color: Colors.white.withValues(alpha: 0.35))),
                const SizedBox(width: 5),
                Container(
                  width: 14, height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ex.$4 ? AppColors.lime : Colors.white.withValues(alpha: 0.08),
                  ),
                  child: Icon(CupertinoIcons.checkmark_alt, size: 8,
                    color: ex.$4 ? Colors.black : Colors.white.withValues(alpha: 0.3)),
                ),
              ]),
            ),
          )),
        ],
      ),
    ),
  );
}

// ── Slide 3: Progress / Growth tracking mockup ────────────────────
class _IntroMockupProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _PhoneMockup(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(children: [
            const Text('Progress', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.orange.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.orange.withValues(alpha: 0.3)),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Text('🔥', style: TextStyle(fontSize: 8)),
                const SizedBox(width: 2),
                const Text('12', style: TextStyle(color: AppColors.orange, fontSize: 9, fontWeight: FontWeight.w800)),
              ]),
            ),
          ]),
          const SizedBox(height: 8),
          // Stat cards row
          Row(children: [
            Expanded(child: _MiniMetricCard('HEIGHT', "5'11\"", AppColors.primary)),
            const SizedBox(width: 5),
            Expanded(child: _MiniMetricCard('GAINED', '+1.2"', AppColors.lime)),
            const SizedBox(width: 5),
            Expanded(child: _MiniMetricCard('XP', '840', AppColors.warning)),
          ]),
          const SizedBox(height: 8),
          // Growth chart
          Container(
            height: 70,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
            ),
            child: CustomPaint(
              size: const Size(double.infinity, 58),
              painter: _MiniProgressChartPainter(),
            ),
          ),
          const SizedBox(height: 8),
          // XP / Level bar
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.20)),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                const Text('⚡', style: TextStyle(fontSize: 9)),
                const SizedBox(width: 4),
                Text('Level 3  •  Builder', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.white.withValues(alpha: 0.9))),
                const Spacer(),
                Text('840 / 1200 XP', style: TextStyle(fontSize: 7, color: Colors.white.withValues(alpha: 0.5))),
              ]),
              const SizedBox(height: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: LinearProgressIndicator(
                  value: 840/1200, minHeight: 4,
                  backgroundColor: Colors.white.withValues(alpha: 0.08),
                  valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 8),
          // Height records list
          ...[
            ('Jan 2025', "5'10.5\"", '+0.5"'),
            ('Feb 2025', "5'11\"",   '+0.5"'),
          ].map((r) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(children: [
              Container(width: 5, height: 5, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
              const SizedBox(width: 6),
              Text(r.$1, style: TextStyle(fontSize: 7, color: Colors.white.withValues(alpha: 0.45))),
              const Spacer(),
              Text(r.$2, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.white)),
              const SizedBox(width: 6),
              Text(r.$3, style: const TextStyle(fontSize: 7, fontWeight: FontWeight.w700, color: AppColors.lime)),
            ]),
          )),
        ],
      ),
    ),
  );
}

// ── Mini helpers ──────────────────────────────────────────────────

class _MiniTab extends StatelessWidget {
  final String label;
  final bool active;
  const _MiniTab(this.label, this.active);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(
        color: active ? AppColors.primary : Colors.transparent,
        width: 1.5,
      )),
    ),
    child: Text(label, style: TextStyle(
      fontSize: 7, fontWeight: FontWeight.w700,
      color: active ? AppColors.primary : Colors.white.withValues(alpha: 0.35),
    )),
  );
}

class _MiniMetricCard extends StatelessWidget {
  final String label, value;
  final Color color;
  const _MiniMetricCard(this.label, this.value, this.color);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.10),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: color.withValues(alpha: 0.20)),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: TextStyle(fontSize: 5.5, fontWeight: FontWeight.w700, letterSpacing: 0.5, color: Colors.white.withValues(alpha: 0.45))),
      const SizedBox(height: 2),
      Text(value, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: color)),
    ]),
  );
}

class _MiniProgressChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Baseline (faded)
    final basePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.12)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final basePath = Path()
      ..moveTo(0, size.height * 0.85)
      ..lineTo(size.width, size.height * 0.85);
    canvas.drawPath(basePath, basePaint);

    // Growth line
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 1.8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(0, size.height * 0.80)
      ..cubicTo(size.width * 0.25, size.height * 0.75,
                size.width * 0.50, size.height * 0.50,
                size.width * 0.75, size.height * 0.35)
      ..lineTo(size.width, size.height * 0.20);
    canvas.drawPath(path, paint);

    // Fill under line
    final fillPath = Path()
      ..moveTo(0, size.height * 0.80)
      ..cubicTo(size.width * 0.25, size.height * 0.75,
                size.width * 0.50, size.height * 0.50,
                size.width * 0.75, size.height * 0.35)
      ..lineTo(size.width, size.height * 0.20)
      ..lineTo(size.width, size.height * 0.85)
      ..lineTo(0, size.height * 0.85)
      ..close();
    canvas.drawPath(fillPath, Paint()
      ..shader = LinearGradient(
        colors: [AppColors.primary.withValues(alpha: 0.25), Colors.transparent],
        begin: Alignment.topCenter, end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));

    // Dots at data points
    for (final pt in [
      Offset(0, size.height * 0.80),
      Offset(size.width * 0.35, size.height * 0.60),
      Offset(size.width * 0.65, size.height * 0.38),
      Offset(size.width, size.height * 0.20),
    ]) {
      canvas.drawCircle(pt, 3, Paint()..color = AppColors.primary);
      canvas.drawCircle(pt, 3, Paint()..color = Colors.white..style = PaintingStyle.stroke..strokeWidth = 1);
    }
  }
  @override
  bool shouldRepaint(_MiniProgressChartPainter old) => false;
}

class _IntroMockupLevels extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _PhoneMockup(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with days left
          Row(children: [
            const Text('Your Plan', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.orange.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.orange.withValues(alpha: 0.3)),
              ),
              child: const Text('63 days left', style: TextStyle(color: AppColors.orange, fontSize: 6.5, fontWeight: FontWeight.w700)),
            ),
          ]),
          const SizedBox(height: 8),
          // Level 1 card — current (expanded)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF13102A),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.45), width: 1.2),
              boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.10), blurRadius: 10)],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(
                  width: 28, height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)]),
                    boxShadow: [BoxShadow(color: const Color(0xFF4CAF50).withValues(alpha: 0.4), blurRadius: 6)],
                  ),
                  child: const Center(child: Text('🌱', style: TextStyle(fontSize: 13))),
                ),
                const SizedBox(width: 7),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Text('LEVEL 1', style: TextStyle(fontSize: 7, fontWeight: FontWeight.w800, letterSpacing: 1, color: const Color(0xFF4CAF50))),
                    const SizedBox(width: 5),
                    // intensity bar
                    ...List.generate(10, (i) => Container(
                      margin: const EdgeInsets.only(right: 1.5),
                      width: 4, height: 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.5),
                        color: i == 0 ? const Color(0xFF4CAF50) : const Color(0xFF4CAF50).withValues(alpha: 0.15),
                      ),
                    )),
                  ]),
                  const Text('Starter', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800)),
                ]),
                const Spacer(),
                Text('7/7', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: AppColors.lime)),
              ]),
              const SizedBox(height: 8),
              // Snake path — row of 7 day nodes
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (i) => Container(
                  width: 22, height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                    boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.5), blurRadius: 6)],
                  ),
                  child: const Center(child: Text('🔥', style: TextStyle(fontSize: 10))),
                )),
              ),
            ]),
          ),
          const SizedBox(height: 6),
          // Level 2 card — current active
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF13102A),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.5), width: 1.4),
              boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.12), blurRadius: 12)],
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(
                  width: 28, height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0.5)]),
                    boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.4), blurRadius: 6)],
                  ),
                  child: const Center(child: Text('⚡', style: TextStyle(fontSize: 13))),
                ),
                const SizedBox(width: 7),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Text('LEVEL 2', style: TextStyle(fontSize: 7, fontWeight: FontWeight.w800, letterSpacing: 1, color: AppColors.primary)),
                    const SizedBox(width: 5),
                    ...List.generate(10, (i) => Container(
                      margin: const EdgeInsets.only(right: 1.5),
                      width: 4, height: 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.5),
                        color: i < 2 ? AppColors.primary : AppColors.primary.withValues(alpha: 0.15),
                      ),
                    )),
                  ]),
                  const Text('Novice', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800)),
                ]),
                const Spacer(),
                Text('2/7', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: AppColors.primaryBright)),
              ]),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (i) {
                  if (i < 2) {
                    return Container(width: 22, height: 22,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primary,
                        boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.5), blurRadius: 6)]),
                      child: const Center(child: Text('🔥', style: TextStyle(fontSize: 10))));
                  }
                  if (i == 2) {
                    return Container(width: 22, height: 22,
                      decoration: BoxDecoration(shape: BoxShape.circle,
                        color: AppColors.primary.withValues(alpha: 0.15),
                        border: Border.all(color: AppColors.primary, width: 1.5)),
                      child: Center(child: Text('${i+1}', style: TextStyle(fontSize: 7, fontWeight: FontWeight.w800, color: AppColors.primary))));
                  }
                  return Container(width: 22, height: 22,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.05)),
                    child: Center(child: Text('${i+1}', style: TextStyle(fontSize: 7, color: Colors.white.withValues(alpha: 0.2)))));
                }),
              ),
            ]),
          ),
          const SizedBox(height: 6),
          // Level 3 — locked
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF13102A),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
            ),
            child: Row(children: [
              Container(
                width: 28, height: 28,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.06)),
                child: const Icon(CupertinoIcons.lock_fill, size: 13, color: Colors.white38),
              ),
              const SizedBox(width: 7),
              Text('LEVEL 3  ·  Builder', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.white.withValues(alpha: 0.25))),
            ]),
          ),
        ],
      ),
    ),
  );
}

class _IntroMockupReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      ('GabrielBhatt', 'Crazy how accurate the height prediction is 💀'),
      ('Arslan T.', 'The app makes it super easy to track progress.'),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.map((r) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF161220),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 34, height: 34,
                  decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.20), shape: BoxShape.circle),
                  child: const Icon(CupertinoIcons.person_fill, size: 18, color: AppColors.primary),
                ),
                const SizedBox(width: 8),
                Expanded(child: Text(r.$1, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700))),
                Row(children: List.generate(5, (_) => const Icon(CupertinoIcons.star_fill, color: AppColors.primary, size: 12))),
              ],
            ),
            const SizedBox(height: 8),
            Text(r.$2, style: TextStyle(color: Colors.white.withValues(alpha: 0.80), fontSize: 13, height: 1.4)),
          ],
        ),
      )).toList(),
    );
  }
}

// ─── Mini helpers for intro mockups ──────────────────────────────────────────

class _MiniStatTile extends StatelessWidget {
  final String label, value;
  final Color bg;
  const _MiniStatTile(this.label, this.value, this.bg);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(7),
    decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white.withValues(alpha: 0.65), fontSize: 7)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800)),
      ],
    ),
  );
}

class _MiniInfoTile extends StatelessWidget {
  final String value, label;
  const _MiniInfoTile(this.value, this.label);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.06), borderRadius: BorderRadius.circular(7)),
    child: Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800)),
        const SizedBox(height: 1),
        Text(label, textAlign: TextAlign.center, style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 7)),
      ],
    ),
  );
}

class _MiniChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height * 0.9)
      ..cubicTo(size.width * 0.3, size.height * 0.7, size.width * 0.6, size.height * 0.4, size.width, size.height * 0.2);
    canvas.drawPath(path, Paint()
      ..color = AppColors.primary..strokeWidth = 2..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    // Dot at end
    canvas.drawCircle(Offset(size.width, size.height * 0.2), 4, Paint()..color = AppColors.primary);
  }
  @override
  bool shouldRepaint(_MiniChartPainter old) => false;
}

// ═════════════════════════════════════════════════════════════════════════════
// Existing sub-widgets (kept for result page compatibility)
// ═════════════════════════════════════════════════════════════════════════════

class _AnimatedScoreRow extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  final double fill;
  const _AnimatedScoreRow({required this.label, required this.value, required this.color, required this.fill});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      SizedBox(width: 72,
        child: Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.82)))),
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: (value / 100) * fill, minHeight: 10,
            backgroundColor: Colors.white.withValues(alpha: 0.12),
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      ),
      SizedBox(width: 36,
        child: Text('${(value * fill).round()}', textAlign: TextAlign.right,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: color))),
    ],
  );
}
