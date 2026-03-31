import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user_profile.dart';
import '../models/height_record.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/calculations.dart';
import 'main_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with TickerProviderStateMixin {
  final _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 8; // Welcome, Info, Body, Parents, PastHeights, Habits, Analyzing, Result

  // Data
  final _nameController = TextEditingController();
  String _gender = 'male';
  DateTime _birthDate = DateTime(2008, 1, 1);
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _fatherHeightController = TextEditingController();
  final _motherHeightController = TextEditingController();
  final _pastHeightControllers = <int, TextEditingController>{};

  // Habits
  double _exerciseHours = 3;
  double _sleepHours = 8;
  int _nutritionScore = 3;

  // Analysis result
  PredictionResult? _prediction;
  GlowUpScore? _score;
  bool _analysisComplete = false;

  // Animation
  late AnimationController _progressAnim;
  double _analysisProgress = 0;
  final _analysisSteps = [
    'Genetik veriler analiz ediliyor...',
    'Büyüme hızı hesaplanıyor...',
    'Beslenme ve uyku verileri işleniyor...',
    'Boy tahmini oluşturuluyor...',
    'BeTaller skoru hesaplanıyor...',
  ];
  int _currentAnalysisStep = 0;

  @override
  void initState() {
    super.initState();
    _progressAnim = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    // Past height controllers for ages 10-current
    for (int age = 10; age <= 20; age++) {
      _pastHeightControllers[age] = TextEditingController();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _fatherHeightController.dispose();
    _motherHeightController.dispose();
    _progressAnim.dispose();
    for (final c in _pastHeightControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  int get _userAge {
    final now = DateTime.now();
    int a = now.year - _birthDate.year;
    if (now.month < _birthDate.month || (now.month == _birthDate.month && now.day < _birthDate.day)) a--;
    return a;
  }

  void _nextPage() {
    if (_currentPage == 5) {
      // After habits → go to analyzing
      _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      _runAnalysis();
    } else if (_currentPage == 6) {
      // Analyzing → already auto-advances
    } else if (_currentPage == 7) {
      // Result → save & go to main
      _saveAndStart();
    } else if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  void _prevPage() {
    if (_currentPage > 1 && _currentPage <= 5) {
      _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  bool _canProceed() {
    switch (_currentPage) {
      case 0: return true;
      case 1: return _nameController.text.trim().isNotEmpty;
      case 2: return _heightController.text.isNotEmpty && _weightController.text.isNotEmpty;
      case 3: return _fatherHeightController.text.isNotEmpty && _motherHeightController.text.isNotEmpty;
      case 4: return true; // Past heights optional
      case 5: return true; // Habits always valid
      default: return false;
    }
  }

  void _runAnalysis() async {
    setState(() {
      _analysisComplete = false;
      _analysisProgress = 0;
      _currentAnalysisStep = 0;
    });

    // Animate through steps
    for (int i = 0; i < _analysisSteps.length; i++) {
      await Future.delayed(const Duration(milliseconds: 700));
      if (!mounted) return;
      setState(() {
        _currentAnalysisStep = i;
        _analysisProgress = (i + 1) / _analysisSteps.length;
      });
    }

    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;

    // Calculate
    final profile = UserProfile(
      name: _nameController.text.trim(),
      gender: _gender,
      birthDate: _birthDate.toIso8601String().substring(0, 10),
      currentHeight: double.tryParse(_heightController.text) ?? 170,
      weight: double.tryParse(_weightController.text) ?? 60,
      fatherHeight: double.tryParse(_fatherHeightController.text) ?? 175,
      motherHeight: double.tryParse(_motherHeightController.text) ?? 162,
    );

    // Collect past heights as records
    final pastHeights = <int, double>{};
    for (final entry in _pastHeightControllers.entries) {
      if (entry.key <= _userAge) {
        final val = double.tryParse(entry.value.text.replaceAll(',', '.'));
        if (val != null && val > 50 && val < 250) {
          pastHeights[entry.key] = val;
        }
      }
    }
    pastHeights[_userAge] = profile.currentHeight;

    final records = pastHeights.entries.map((e) {
      final year = DateTime.now().year - (_userAge - e.key);
      return HeightRecord(date: '$year-06-15', height: e.value);
    }).toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    _prediction = Calculations.predictFinalHeight(profile, records);
    _score = Calculations.calculateGlowUpScore(
      profile: profile,
      records: records,
      routineProgress: (_exerciseHours / 5).clamp(0.0, 1.0),
      waterProgress: (_nutritionScore / 5).clamp(0.0, 1.0),
      sleepHours: _sleepHours,
      streak: 0,
    );

    setState(() => _analysisComplete = true);

    await Future.delayed(const Duration(milliseconds: 400));
    if (!mounted) return;
    _pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
  }

  void _saveAndStart() {
    final profile = UserProfile(
      name: _nameController.text.trim(),
      gender: _gender,
      birthDate: _birthDate.toIso8601String().substring(0, 10),
      currentHeight: double.tryParse(_heightController.text) ?? 170,
      weight: double.tryParse(_weightController.text) ?? 60,
      fatherHeight: double.tryParse(_fatherHeightController.text) ?? 175,
      motherHeight: double.tryParse(_motherHeightController.text) ?? 162,
    );

    final provider = context.read<AppProvider>();
    provider.setProfile(profile);

    // Save past heights
    final pastHeights = <int, double>{};
    for (final entry in _pastHeightControllers.entries) {
      if (entry.key <= _userAge) {
        final val = double.tryParse(entry.value.text.replaceAll(',', '.'));
        if (val != null && val > 50 && val < 250) {
          pastHeights[entry.key] = val;
        }
      }
    }
    provider.savePastHeights(pastHeights);

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E1B4B), Color(0xFF0F0A2E), Color(0xFF0A0A14)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Progress bar (only pages 1-5)
              if (_currentPage >= 1 && _currentPage <= 5)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Row(
                    children: [
                      if (_currentPage > 1)
                        GestureDetector(
                          onTap: _prevPage,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Icon(CupertinoIcons.chevron_back, color: Colors.white.withValues(alpha: 0.6), size: 20),
                          ),
                        ),
                      Expanded(
                        child: Row(
                          children: List.generate(5, (i) => Expanded(
                            child: Container(
                              height: 4,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                color: i < _currentPage ? AppColors.primary : Colors.white.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              // Pages
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (p) => setState(() => _currentPage = p),
                  children: [
                    _buildWelcomePage(),
                    _buildInfoPage(),
                    _buildBodyPage(),
                    _buildParentsPage(),
                    _buildPastHeightsPage(),
                    _buildHabitsPage(),
                    _buildAnalyzingPage(),
                    _buildResultPage(),
                  ],
                ),
              ),
              // Bottom button (pages 0-5 only)
              if (_currentPage <= 5)
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: _canProceed() ? AppColors.primary : AppColors.primary.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(18),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      onPressed: _canProceed() ? _nextPage : null,
                      child: Text(
                        _currentPage == 0
                            ? 'Analizi Başlat'
                            : _currentPage == 5
                                ? 'Analiz Et'
                                : 'Devam',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: _canProceed() ? Colors.white : Colors.white.withValues(alpha: 0.4),
                          letterSpacing: -0.3,
                        ),
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

  // ── Page 0: Welcome ──────────────────────────────────────────────

  Widget _buildWelcomePage() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100, height: 100,
            decoration: BoxDecoration(
              gradient: AppColors.gradientPrimary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: AppColors.primary.withValues(alpha: 0.4), blurRadius: 40),
              ],
            ),
            child: const Center(child: Icon(CupertinoIcons.arrow_up_circle_fill, color: Colors.white, size: 48)),
          ),
          const SizedBox(height: 36),
          const Text('BeTaller', style: TextStyle(fontSize: 52, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -2)),
          const SizedBox(height: 8),
          Text(
            'Büyüme potansiyelini keşfet',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.65), letterSpacing: 0.3),
          ),
          const SizedBox(height: 40),
          // Analysis steps preview
          GlassCard(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                _StepPreview(number: '1', text: 'Kişisel bilgilerini gir', color: AppColors.primary),
                const SizedBox(height: 16),
                _StepPreview(number: '2', text: 'Geçmiş boylarını paylaş', color: AppColors.cyan),
                const SizedBox(height: 16),
                _StepPreview(number: '3', text: 'Alışkanlıklarını değerlendir', color: AppColors.orange),
                const SizedBox(height: 16),
                _StepPreview(number: '4', text: 'Tahminini ve skorunu gör', color: AppColors.lime),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Page 1: Info ─────────────────────────────────────────────────

  Widget _buildInfoPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Seni Tanıyalım', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.2)),
        const SizedBox(height: 6),
        Text('Analiz için temel bilgilerin gerekli.', style: TextStyle(fontSize: 15, color: Colors.white.withValues(alpha: 0.65), letterSpacing: -0.1)),
        const SizedBox(height: 32),
        _buildInput(_nameController, 'Adın', CupertinoIcons.person),
        const SizedBox(height: 18),
        Text('CİNSİYET', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white.withValues(alpha: 0.5), letterSpacing: 1.0)),
        const SizedBox(height: 10),
        Row(children: [
          Expanded(child: _GenderCard(label: 'Erkek', selected: _gender == 'male', onTap: () => setState(() => _gender = 'male'))),
          const SizedBox(width: 12),
          Expanded(child: _GenderCard(label: 'Kadın', selected: _gender == 'female', onTap: () => setState(() => _gender = 'female'))),
        ]),
        const SizedBox(height: 18),
        Text('DOĞUM TARİHİ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white.withValues(alpha: 0.5), letterSpacing: 1.0)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context, initialDate: _birthDate, firstDate: DateTime(1990), lastDate: DateTime.now(),
              locale: const Locale('tr', 'TR'),
              builder: (context, child) => Theme(data: ThemeData.dark().copyWith(colorScheme: const ColorScheme.dark(primary: AppColors.primary, surface: AppColors.surfaceDark)), child: child!),
            );
            if (picked != null) setState(() => _birthDate = picked);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.06), borderRadius: BorderRadius.circular(14)),
            child: Row(children: [
              Icon(CupertinoIcons.calendar, color: Colors.white.withValues(alpha: 0.5), size: 18),
              const SizedBox(width: 12),
              Text('${_birthDate.day.toString().padLeft(2, '0')}.${_birthDate.month.toString().padLeft(2, '0')}.${_birthDate.year}', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.2)),
            ]),
          ),
        ),
      ]),
    );
  }

  // ── Page 2: Body ─────────────────────────────────────────────────

  Widget _buildBodyPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Vücut Ölçülerin', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.2)),
        const SizedBox(height: 6),
        Text('Mevcut boyun ve kilon analiz için gerekli.', style: TextStyle(fontSize: 15, color: Colors.white.withValues(alpha: 0.65))),
        const SizedBox(height: 32),
        _buildInput(_heightController, 'Boyun (cm)', CupertinoIcons.resize_v, isNumber: true),
        const SizedBox(height: 18),
        _buildInput(_weightController, 'Kilon (kg)', CupertinoIcons.gauge, isNumber: true),
      ]),
    );
  }

  // ── Page 3: Parents ──────────────────────────────────────────────

  Widget _buildParentsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Genetik Verilerin', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.2)),
        const SizedBox(height: 6),
        Text('Anne ve baba boyu genetik potansiyelini belirler.', style: TextStyle(fontSize: 15, color: Colors.white.withValues(alpha: 0.65))),
        const SizedBox(height: 32),
        _buildInput(_fatherHeightController, 'Baba Boyu (cm)', CupertinoIcons.person, isNumber: true),
        const SizedBox(height: 18),
        _buildInput(_motherHeightController, 'Anne Boyu (cm)', CupertinoIcons.person, isNumber: true),
      ]),
    );
  }

  // ── Page 4: Past Heights ─────────────────────────────────────────

  Widget _buildPastHeightsPage() {
    final age = _userAge;
    final relevantAges = <int>[];
    for (int a = 10; a < age; a += 2) {
      if (a >= 10) relevantAges.add(a);
    }
    if (!relevantAges.contains(age - 1) && age - 1 >= 10) relevantAges.add(age - 1);
    relevantAges.sort();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Geçmiş Boyların', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.2)),
        const SizedBox(height: 6),
        Text('Hatırladığın yaşlardaki boylarını gir. Boş bırakabilirsin.', style: TextStyle(fontSize: 15, color: Colors.white.withValues(alpha: 0.65), height: 1.4)),
        const SizedBox(height: 28),
        ...relevantAges.map((a) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Container(
                width: 56, padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(12)),
                child: Column(children: [
                  Text('$a', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.primary, letterSpacing: -0.5)),
                  Text('yaş', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.primary.withValues(alpha: 0.7), letterSpacing: 0.5)),
                ]),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _pastHeightControllers[a],
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: -0.3),
                  cursorColor: AppColors.primary,
                  decoration: InputDecoration(
                    hintText: 'Boy gir...', hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.3), fontWeight: FontWeight.w400),
                    suffixText: 'cm', suffixStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                    filled: true, fillColor: Colors.white.withValues(alpha: 0.06),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        )),
      ]),
    );
  }

  // ── Page 5: Habits ───────────────────────────────────────────────

  Widget _buildHabitsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Alışkanlıkların', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.2)),
        const SizedBox(height: 6),
        Text('Yaşam tarzın tahminini doğrudan etkiler.', style: TextStyle(fontSize: 15, color: Colors.white.withValues(alpha: 0.65))),
        const SizedBox(height: 28),
        _SliderInput(
          icon: CupertinoIcons.flame_fill, title: 'Haftalık Egzersiz',
          value: _exerciseHours, min: 0, max: 10, divisions: 20, unit: 'saat',
          color: AppColors.primary, onChanged: (v) => setState(() => _exerciseHours = v),
        ),
        const SizedBox(height: 24),
        _SliderInput(
          icon: CupertinoIcons.moon_fill, title: 'Günlük Uyku',
          value: _sleepHours, min: 4, max: 12, divisions: 16, unit: 'saat',
          color: AppColors.sleep, onChanged: (v) => setState(() => _sleepHours = v),
        ),
        const SizedBox(height: 24),
        Text('BESLENME KALİTESİ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white.withValues(alpha: 0.5), letterSpacing: 1.0)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (i) {
            final level = i + 1;
            final selected = _nutritionScore == level;
            final labels = ['Kötü', 'Zayıf', 'Orta', 'İyi', 'Harika'];
            return GestureDetector(
              onTap: () => setState(() => _nutritionScore = level),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 56, padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selected ? AppColors.orange.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: selected ? AppColors.orange : Colors.white.withValues(alpha: 0.08), width: selected ? 1.5 : 0.5),
                ),
                child: Column(children: [
                  Text('$level', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: selected ? AppColors.orange : Colors.white.withValues(alpha: 0.5))),
                  const SizedBox(height: 2),
                  Text(labels[i], style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: selected ? AppColors.orange.withValues(alpha: 0.8) : Colors.white.withValues(alpha: 0.4))),
                ]),
              ),
            );
          }),
        ),
      ]),
    );
  }

  // ── Page 6: Analyzing ────────────────────────────────────────────

  Widget _buildAnalyzingPage() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated ring
          SizedBox(
            width: 140, height: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 140, height: 140,
                  child: CircularProgressIndicator(
                    value: _analysisProgress,
                    strokeWidth: 6,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.12),
                    valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Text(
                  '${(_analysisProgress * 100).toInt()}%',
                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Analiz Ediliyor',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.8),
          ),
          const SizedBox(height: 16),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              _currentAnalysisStep < _analysisSteps.length ? _analysisSteps[_currentAnalysisStep] : 'Tamamlandı!',
              key: ValueKey(_currentAnalysisStep),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.65)),
              textAlign: TextAlign.center,
            ),
          ),
          if (_analysisComplete) ...[
            const SizedBox(height: 32),
            const Icon(CupertinoIcons.checkmark_circle_fill, color: AppColors.lime, size: 40),
          ],
        ],
      ),
    );
  }

  // ── Page 7: Result ───────────────────────────────────────────────

  Widget _buildResultPage() {
    if (_prediction == null || _score == null) return const SizedBox();

    final currentHeight = double.tryParse(_heightController.text) ?? 170;
    final growth = _prediction!.finalHeight - currentHeight;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      child: Column(
        children: [
          // Hero prediction card
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF2D1B69), Color(0xFF1A1145)], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            ),
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                Text('21 yaşında tahmini boyun', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.6))),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      _prediction!.finalHeight.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -3, height: 1),
                    ),
                    const SizedBox(width: 4),
                    Text('cm', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.5))),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(color: AppColors.lime.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    '+${growth.toStringAsFixed(1)} cm büyüme potansiyeli',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.lime, letterSpacing: -0.2),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '%${_prediction!.confidence} güven · ${_prediction!.minHeight}-${_prediction!.maxHeight} cm',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.5)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Score card
          GlassCard(
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('BeTaller Skorun', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.5)),
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
                _ScoreRow(label: 'Genetik', value: _score!.genetic, color: AppColors.primary),
                const SizedBox(height: 8),
                _ScoreRow(label: 'Büyüme', value: _score!.velocity, color: AppColors.cyan),
                const SizedBox(height: 8),
                _ScoreRow(label: 'Beslenme', value: _score!.nutrition, color: AppColors.orange),
                const SizedBox(height: 8),
                _ScoreRow(label: 'Uyku', value: _score!.sleep, color: AppColors.sleep),
                const SizedBox(height: 8),
                _ScoreRow(label: 'Disiplin', value: _score!.discipline, color: AppColors.lime),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // CTA
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(18),
              padding: const EdgeInsets.symmetric(vertical: 18),
              onPressed: _saveAndStart,
              child: const Text('Hadi Başlayalım', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.3)),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Burada premium reklam alanı olacak',
            style: TextStyle(fontSize: 12, color: Colors.white.withValues(alpha: 0.3)),
          ),
        ],
      ),
    );
  }

  // ── Helpers ──────────────────────────────────────────────────────

  Widget _buildInput(TextEditingController controller, String label, IconData icon, {bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
      onChanged: (_) => setState(() {}),
      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.2),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontWeight: FontWeight.w500),
        prefixIcon: Icon(icon, color: Colors.white.withValues(alpha: 0.5), size: 18),
        filled: true, fillColor: Colors.white.withValues(alpha: 0.06),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
      ),
    );
  }

  Color _gradeColor(String grade) {
    switch (grade) {
      case 'S': return const Color(0xFFFFD700);
      case 'A': return AppColors.lime;
      case 'B': return AppColors.cyan;
      case 'C': return AppColors.orange;
      default: return AppColors.error;
    }
  }
}

// ── Sub-widgets ───────────────────────────────────────────────────

class _StepPreview extends StatelessWidget {
  final String number;
  final String text;
  final Color color;
  const _StepPreview({required this.number, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 32, height: 32,
        decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(number, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: color))),
      ),
      const SizedBox(width: 14),
      Expanded(child: Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.85), letterSpacing: -0.2))),
    ]);
  }
}

class _GenderCard extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _GenderCard({required this.label, required this.selected, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: selected ? AppColors.primary : Colors.white.withValues(alpha: 0.1), width: selected ? 1.5 : 0.5),
        ),
        child: Center(
          child: Text(label, style: TextStyle(
            color: selected ? Colors.white : Colors.white.withValues(alpha: 0.6),
            fontSize: 16, fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          )),
        ),
      ),
    );
  }
}

class _SliderInput extends StatelessWidget {
  final IconData icon;
  final String title;
  final double value;
  final double min, max;
  final int divisions;
  final String unit;
  final Color color;
  final ValueChanged<double> onChanged;
  const _SliderInput({required this.icon, required this.title, required this.value, required this.min, required this.max, required this.divisions, required this.unit, required this.color, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.3)),
        const Spacer(),
        Text('${value.toStringAsFixed(1)} $unit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: color, letterSpacing: -0.5)),
      ]),
      const SizedBox(height: 10),
      SliderTheme(
        data: SliderThemeData(activeTrackColor: color, inactiveTrackColor: color.withValues(alpha: 0.15), thumbColor: Colors.white, overlayColor: color.withValues(alpha: 0.1), trackHeight: 5),
        child: Slider(value: value, min: min, max: max, divisions: divisions, onChanged: onChanged),
      ),
    ]);
  }
}

class _ScoreRow extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  const _ScoreRow({required this.label, required this.value, required this.color});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(width: 72, child: Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.7)))),
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(value: value / 100, minHeight: 10, backgroundColor: Colors.white.withValues(alpha: 0.06), valueColor: AlwaysStoppedAnimation(color)),
        ),
      ),
      SizedBox(width: 36, child: Text('$value', textAlign: TextAlign.right, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: color))),
    ]);
  }
}
