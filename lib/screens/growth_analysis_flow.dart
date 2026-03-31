import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/height_record.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/calculations.dart';

class GrowthAnalysisFlow extends StatefulWidget {
  const GrowthAnalysisFlow({super.key});

  @override
  State<GrowthAnalysisFlow> createState() => _GrowthAnalysisFlowState();
}

class _GrowthAnalysisFlowState extends State<GrowthAnalysisFlow> {
  final _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 3; // Geçmiş boylar, Alışkanlıklar, Sonuç

  // Page 1: Geçmiş boylar
  final _pastHeightControllers = <int, TextEditingController>{};

  // Page 2: Alışkanlıklar
  double _exerciseHours = 3;
  double _sleepHours = 8;
  int _nutritionScore = 3; // 1-5

  // Page 3: Sonuç
  PredictionResult? _prediction;
  GlowUpScore? _score;

  @override
  void initState() {
    super.initState();
    final provider = context.read<AppProvider>();
    final profile = provider.profile;
    if (profile != null) {
      // Geçmiş yaşlar için controller'lar oluştur
      for (int age = 10; age <= profile.age; age++) {
        _pastHeightControllers[age] = TextEditingController(
          text: provider.pastHeights[age]?.toStringAsFixed(1) ?? '',
        );
      }
      // Mevcut yaş otomatik doldur
      _pastHeightControllers[profile.age]?.text = profile.currentHeight.toStringAsFixed(1);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (final c in _pastHeightControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      if (_currentPage == 1) {
        _calculateResult();
      }
      _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      _saveAndClose();
    }
  }

  void _calculateResult() {
    final provider = context.read<AppProvider>();
    final profile = provider.profile;
    if (profile == null) return;

    // Geçmiş boyları topla
    final pastHeights = <int, double>{};
    for (final entry in _pastHeightControllers.entries) {
      final val = double.tryParse(entry.value.text.replaceAll(',', '.'));
      if (val != null && val > 50 && val < 250) {
        pastHeights[entry.key] = val;
      }
    }

    // Geçmiş boyları HeightRecord'a çevir (tahmin için)
    final records = pastHeights.entries.map((e) {
      final year = DateTime.now().year - (profile.age - e.key);
      return HeightRecord(date: '$year-06-15', height: e.value);
    }).toList()
      ..sort((a, b) => a.date.compareTo(b.date));

    // Alışkanlık faktörleriyle tahmin
    _prediction = Calculations.predictFinalHeight(profile, records.isEmpty ? provider.heightRecords : records);

    // Alışkanlık bazlı skor
    final exerciseProgress = (_exerciseHours / 5).clamp(0.0, 1.0);

    _score = Calculations.calculateGlowUpScore(
      profile: profile,
      records: records.isEmpty ? provider.heightRecords : records,
      routineProgress: exerciseProgress,
      waterProgress: (_nutritionScore / 5).clamp(0.0, 1.0),
      sleepHours: _sleepHours,
      streak: provider.streak,
    );

    // Geçmiş boyları kaydet
    provider.savePastHeights(pastHeights);
  }

  void _saveAndClose() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E1B4B), Color(0xFF0A0A14)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40, height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(CupertinoIcons.xmark, color: Colors.white, size: 18),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        children: List.generate(_totalPages, (i) => Expanded(
                          child: Container(
                            height: 4,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: i <= _currentPage ? AppColors.primary : Colors.white.withValues(alpha: 0.12),
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
                    _buildPastHeightsPage(),
                    _buildHabitsPage(),
                    _buildResultPage(),
                  ],
                ),
              ),
              // Bottom button
              if (_currentPage < _totalPages - 1)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(18),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      onPressed: _nextPage,
                      child: Text(
                        _currentPage == 0 ? 'Devam' : 'Analiz Et',
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.3),
                      ),
                    ),
                  ),
                )
              else if (_currentPage == _totalPages - 1)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppColors.lime,
                      borderRadius: BorderRadius.circular(18),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      onPressed: _saveAndClose,
                      child: const Text(
                        'Tamam',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF0A0A14), letterSpacing: -0.3),
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

  // ── Page 1: Geçmiş Boylar ────────────────────────────────────────

  Widget _buildPastHeightsPage() {
    final provider = context.watch<AppProvider>();
    final profile = provider.profile;
    if (profile == null) return const SizedBox();

    final ages = _pastHeightControllers.keys.toList()..sort();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Geçmiş Boyların',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.2),
          ),
          const SizedBox(height: 8),
          Text(
            'Hatırladığın yaşlardaki boylarını gir. Ne kadar çok veri, o kadar doğru tahmin.',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white.withValues(alpha: 0.68), height: 1.4, letterSpacing: -0.1),
          ),
          const SizedBox(height: 28),
          ...ages.map((age) {
            final isCurrentAge = age == profile.age;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isCurrentAge ? AppColors.primary.withValues(alpha: 0.18) : Colors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(12),
                      border: isCurrentAge ? Border.all(color: AppColors.primary.withValues(alpha: 0.4)) : null,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '$age',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: isCurrentAge ? AppColors.primary : Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          'yaş',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: isCurrentAge ? AppColors.primary.withValues(alpha: 0.7) : Colors.white.withValues(alpha: 0.5),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _pastHeightControllers[age],
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: -0.3),
                      cursorColor: AppColors.primary,
                      readOnly: isCurrentAge,
                      decoration: InputDecoration(
                        hintText: isCurrentAge ? '${profile.currentHeight.toStringAsFixed(1)} (mevcut)' : 'Boy gir...',
                        hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.3), fontWeight: FontWeight.w400),
                        suffixText: 'cm',
                        suffixStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontWeight: FontWeight.w500),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.06),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Icon(CupertinoIcons.lightbulb, color: AppColors.primary.withValues(alpha: 0.7), size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Hatırlamadığın yaşları boş bırakabilirsin. En az 1-2 geçmiş boy girmen yeterli.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.6), height: 1.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Page 2: Alışkanlıklar ────────────────────────────────────────

  Widget _buildHabitsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alışkanlıkların',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.2),
          ),
          const SizedBox(height: 8),
          Text(
            'Bu alışkanlıkları düzenli yaparsan tahminini buna göre hesaplayacağız.',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white.withValues(alpha: 0.68), height: 1.4, letterSpacing: -0.1),
          ),
          const SizedBox(height: 32),

          // Egzersiz
          _HabitSlider(
            icon: CupertinoIcons.flame_fill,
            title: 'Haftalık Egzersiz',
            value: _exerciseHours,
            min: 0,
            max: 10,
            divisions: 20,
            unit: 'saat',
            color: AppColors.primary,
            onChanged: (v) => setState(() => _exerciseHours = v),
          ),
          const SizedBox(height: 28),

          // Uyku
          _HabitSlider(
            icon: CupertinoIcons.moon_fill,
            title: 'Günlük Uyku',
            value: _sleepHours,
            min: 4,
            max: 12,
            divisions: 16,
            unit: 'saat',
            color: AppColors.sleep,
            onChanged: (v) => setState(() => _sleepHours = v),
          ),
          const SizedBox(height: 28),

          // Beslenme
          Text('Beslenme Kalitesi', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.3)),
          const SizedBox(height: 6),
          Text('Protein, süt, sebze, meyve tüketimin', style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.6))),
          const SizedBox(height: 14),
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
                  width: 58,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.orange.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: selected ? AppColors.orange : Colors.white.withValues(alpha: 0.08),
                      width: selected ? 1.5 : 0.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$level',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: selected ? AppColors.orange : Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        labels[i],
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: selected ? AppColors.orange.withValues(alpha: 0.8) : Colors.white.withValues(alpha: 0.4),
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  // ── Page 3: Sonuç ────────────────────────────────────────────────

  Widget _buildResultPage() {
    if (_prediction == null || _score == null) return const SizedBox();

    final provider = context.watch<AppProvider>();
    final profile = provider.profile;
    if (profile == null) return const SizedBox();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      child: Column(
        children: [
          // Hero prediction
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2D1B69), Color(0xFF1A1145)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            ),
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                Text(
                  'Tahmini Boyun',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.7)),
                ),
                const SizedBox(height: 4),
                Text(
                  '21 yaşında',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.5)),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      _prediction!.finalHeight.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -3,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'cm',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.5)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '${_prediction!.minHeight} - ${_prediction!.maxHeight} cm aralığında',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.55)),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.cyan.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '%${_prediction!.confidence} güven oranı',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.cyan),
                  ),
                ),
                const SizedBox(height: 24),
                // Growth from current
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ResultMini(label: 'ŞU AN', value: '${profile.currentHeight.toStringAsFixed(1)} cm', color: Colors.white),
                    const SizedBox(width: 16),
                    Icon(CupertinoIcons.arrow_right, color: AppColors.primary.withValues(alpha: 0.6), size: 18),
                    const SizedBox(width: 16),
                    _ResultMini(label: 'TAHMİN', value: '${_prediction!.finalHeight.toStringAsFixed(1)} cm', color: AppColors.cyan),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '+${(_prediction!.finalHeight - profile.currentHeight).toStringAsFixed(1)} cm büyüme potansiyeli',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.lime, letterSpacing: -0.2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // GlowUp Score
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
                      child: Text(
                        _score!.grade,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: _gradeColor(_score!.grade)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Score bars
                _ScoreBar(label: 'Genetik', value: _score!.genetic, color: AppColors.primary),
                const SizedBox(height: 10),
                _ScoreBar(label: 'Büyüme Hızı', value: _score!.velocity, color: AppColors.cyan),
                const SizedBox(height: 10),
                _ScoreBar(label: 'Beslenme', value: _score!.nutrition, color: AppColors.orange),
                const SizedBox(height: 10),
                _ScoreBar(label: 'Uyku', value: _score!.sleep, color: AppColors.sleep),
                const SizedBox(height: 10),
                _ScoreBar(label: 'Disiplin', value: _score!.discipline, color: AppColors.lime),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _gradeColor(_score!.grade).withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    _score!.summary,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: _gradeColor(_score!.grade), height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Year-by-year
          if (_prediction!.yearlyPredictions.isNotEmpty)
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Yıllık Tahmin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.5)),
                  const SizedBox(height: 16),
                  ..._prediction!.yearlyPredictions.entries.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Text('${e.key} yaş', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.7))),
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: LinearProgressIndicator(
                                value: (e.value / _prediction!.finalHeight).clamp(0.0, 1.0),
                                minHeight: 8,
                                backgroundColor: Colors.white.withValues(alpha: 0.06),
                                valueColor: AlwaysStoppedAnimation(AppColors.cyan),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              '${e.value} cm',
                              textAlign: TextAlign.right,
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.cyan, letterSpacing: -0.3),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Color _gradeColor(String grade) {
    switch (grade) {
      case 'S': return const Color(0xFFFFD700);
      case 'A': return AppColors.lime;
      case 'B': return AppColors.cyan;
      case 'C': return AppColors.orange;
      case 'D': return AppColors.warning;
      default: return AppColors.error;
    }
  }
}

// ── Sub-widgets ───────────────────────────────────────────────────

class _HabitSlider extends StatelessWidget {
  final IconData icon;
  final String title;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final String unit;
  final Color color;
  final ValueChanged<double> onChanged;

  const _HabitSlider({
    required this.icon,
    required this.title,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.unit,
    required this.color,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.3)),
            const Spacer(),
            Text(
              '${value.toStringAsFixed(1)} $unit',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: color, letterSpacing: -0.5),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: color,
            inactiveTrackColor: color.withValues(alpha: 0.15),
            thumbColor: Colors.white,
            overlayColor: color.withValues(alpha: 0.1),
            trackHeight: 6,
          ),
          child: Slider(value: value, min: min, max: max, divisions: divisions, onChanged: onChanged),
        ),
      ],
    );
  }
}

class _ScoreBar extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _ScoreBar({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.7))),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value / 100,
              minHeight: 10,
              backgroundColor: Colors.white.withValues(alpha: 0.06),
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ),
        SizedBox(
          width: 40,
          child: Text(
            '$value',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: color, letterSpacing: -0.3),
          ),
        ),
      ],
    );
  }
}

class _ResultMini extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ResultMini({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color.withValues(alpha: 0.5), letterSpacing: 1.0)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: color, letterSpacing: -0.3)),
      ],
    );
  }
}
