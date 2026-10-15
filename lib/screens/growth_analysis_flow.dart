import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../services/notification_service.dart';
import '../utils/constants.dart';
import '../utils/haptics.dart';
import '../widgets/height_silhouette.dart';
import '../widgets/potential_chart.dart';

/// Fills in the heights the user remembers from past years, then shows them
/// on the same chart as their measurements and their potential. The score
/// and the full breakdown live in the Analysis tab; this flow only collects
/// what the app cannot measure, and never works out a prediction of its own.
class GrowthAnalysisFlow extends StatefulWidget {
  const GrowthAnalysisFlow({super.key});

  @override
  State<GrowthAnalysisFlow> createState() => _GrowthAnalysisFlowState();
}

class _GrowthAnalysisFlowState extends State<GrowthAnalysisFlow> {
  final _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 2; // past heights, result

  final _pastHeightControllers = <int, TextEditingController>{};

  /// Imperial: "4'8\""  |  Metric: "142.2"
  String _fmtForField(double cm, AppProvider provider) {
    if (!provider.useImperial) return cm.toStringAsFixed(1);
    final totalIn = cm / 2.54;
    var ft = totalIn ~/ 12;
    var inches = (totalIn % 12).round();
    if (inches == 12) {
      ft += 1;
      inches = 0;
    }
    return "$ft'$inches\"";
  }

  /// Parse "4'8\"" or plain inch/cm number → cm (null if invalid).
  double? _parseField(String text, AppProvider provider) {
    final t = text.trim();
    if (t.isEmpty) return null;
    if (provider.useImperial) {
      final re = RegExp(r"""^(\d+)'(\d+)["']?\s*$""");
      final m = re.firstMatch(t);
      if (m != null) {
        final ft = int.parse(m.group(1)!);
        final inches = int.parse(m.group(2)!);
        return (ft * 12 + inches) * 2.54;
      }
      final v = double.tryParse(t.replaceAll(',', '.'));
      return v == null ? null : v * 2.54; // plain total inches
    } else {
      return double.tryParse(t.replaceAll(',', '.'));
    }
  }

  @override
  void initState() {
    super.initState();
    final provider = context.read<AppProvider>();
    final profile = provider.profile;
    if (profile != null) {
      // Geçmiş yaşlar için controller'lar oluştur
      for (int age = 10; age <= profile.age; age++) {
        final saved = provider.pastHeights[age];
        _pastHeightControllers[age] = TextEditingController(
          text: saved == null ? '' : _fmtForField(saved, provider),
        );
      }
      // Mevcut yaş otomatik doldur
      _pastHeightControllers[profile.age]?.text = _fmtForField(
        profile.currentHeight,
        provider,
      );
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
    FocusScope.of(context).unfocus();
    if (_currentPage == 0) {
      _savePastHeights();
      Haptics.success();
      _pageController.nextPage(
        duration: MediaQuery.of(context).disableAnimations
            ? const Duration(milliseconds: 1)
            : const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
      );
    } else {
      Haptics.tap();
      _openAnalysis();
    }
  }

  void _savePastHeights() {
    final provider = context.read<AppProvider>();
    final pastHeights = <int, double>{};
    for (final entry in _pastHeightControllers.entries) {
      final val = _parseField(entry.value.text, provider);
      if (val != null && val > 50 && val < 250) pastHeights[entry.key] = val;
    }
    provider.savePastHeights(pastHeights);
  }

  /// Back to the tabs, on Analysis.
  void _openAnalysis() {
    NotificationService.tappedPayload.value = 'tab:3';
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          CupertinoIcons.xmark,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        children: List.generate(
                          _totalPages,
                          (i) => Expanded(
                            child: Container(
                              height: 4,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                color: i <= _currentPage
                                    ? AppColors.primary
                                    : Colors.white.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (p) => setState(() => _currentPage = p),
                  children: [_buildPastHeightsPage(), _buildResultPage()],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    color: _currentPage == 0
                        ? AppColors.primary
                        : AppColors.lime,
                    borderRadius: BorderRadius.circular(16),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    onPressed: _nextPage,
                    child: Text(
                      _currentPage == 0 ? l.continueBtn : l.anFlowOpenAnalysis,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: _currentPage == 0
                            ? Colors.white
                            : const Color(0xFF0A0A14),
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

  // ── Page 1: Geçmiş Boylar ────────────────────────────────────────

  Widget _buildPastHeightsPage() {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    final profile = provider.profile;
    if (profile == null) return const SizedBox();

    final ages = _pastHeightControllers.keys.toList()..sort();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.pastHeights,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.pastHeightsInfo,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.white.withValues(alpha: 0.82),
              height: 1.4,
              letterSpacing: -0.1,
            ),
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
                      color: isCurrentAge
                          ? AppColors.primary.withValues(alpha: 0.18)
                          : Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                      border: isCurrentAge
                          ? Border.all(
                              color: AppColors.primary.withValues(alpha: 0.4),
                            )
                          : null,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '$age',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: isCurrentAge
                                ? AppColors.primary
                                : Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        Text(
                          l.ageLabel,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: isCurrentAge
                                ? AppColors.primary.withValues(alpha: 0.7)
                                : Colors.white.withValues(alpha: 0.82),
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
                      // Imperial needs apostrophe+quote → text keyboard
                      keyboardType: provider.useImperial
                          ? TextInputType.text
                          : const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.3,
                      ),
                      cursorColor: AppColors.primary,
                      readOnly: isCurrentAge,
                      // Auto-format on submit (imperial only)
                      onEditingComplete: () {
                        if (!isCurrentAge && provider.useImperial) {
                          final ctrl = _pastHeightControllers[age]!;
                          final cm = _parseField(ctrl.text, provider);
                          if (cm != null) {
                            setState(
                              () => ctrl.text = _fmtForField(cm, provider),
                            );
                          }
                        }
                        FocusScope.of(context).nextFocus();
                      },
                      decoration: InputDecoration(
                        hintText: isCurrentAge
                            ? '${_fmtForField(profile.currentHeight, provider)} ${l.currentSuffix}'
                            : (provider.useImperial
                                  ? "e.g. 4'8\""
                                  : l.heightHint),
                        hintStyle: TextStyle(
                          color: Colors.white.withValues(alpha: 0.45),
                          fontWeight: FontWeight.w400,
                        ),
                        // Unit is embedded in value for imperial
                        suffixText: provider.useImperial
                            ? null
                            : provider.heightUnit,
                        suffixStyle: TextStyle(
                          color: Colors.white.withValues(alpha: 0.82),
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
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

  // ── Page 2: the same potential the rest of the app shows ──────────

  Widget _buildResultPage() {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    if (provider.profile == null) return const SizedBox();
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.anFlowResultTitle,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.anFlowResultBody,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withValues(alpha: 0.72),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            decoration: BoxDecoration(
              color: AppColors.cardFill,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Localizations.localeOf(context).languageCode == 'tr'
                      ? l.anPotentialLabel.replaceAll('i', 'İ').toUpperCase()
                      : l.anPotentialLabel.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.3,
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  provider.formatHeight(provider.potentialHeight),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: AppColors.lime,
                    letterSpacing: -1.5,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 18),
                PotentialChart(provider: provider, height: 190),
                const SizedBox(height: 14),
                HeightSilhouette(
                  current: provider.latestHeight,
                  potential: provider.potentialHeight,
                  dream: provider.dreamHeight,
                  format: provider.formatHeight,
                  height: 170,
                ),
                const SizedBox(height: 10),
                Text(
                  l.anPctValue(provider.peerPercentile.clamp(1, 99)),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withValues(alpha: 0.7),
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
