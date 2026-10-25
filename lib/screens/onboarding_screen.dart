import 'dart:math' as math;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/onboarding_answers.dart';
import '../models/reminder.dart';
import '../models/user_profile.dart';
import '../providers/app_provider.dart';
import '../utils/calculations.dart';
import '../utils/constants.dart';
import 'main_screen.dart';
import '../services/notification_service.dart';
import '../widgets/journey_steps.dart';
import '../utils/daily_targets.dart';
import '../utils/haptics.dart';
import '../widgets/height_silhouette.dart';
import '../utils/text_case.dart';
import '../utils/num_format.dart';
import '../utils/exercise_guides.dart';
import '../utils/localized_data.dart';
import '../widgets/plan_widgets.dart';

// ─── The flow ─────────────────────────────────────────────────────────────────
//
// The order of this enum IS the order of the pages: a page's index in the
// PageView is its `index` here. The arc it follows:
//
//  1. Hello, then who you are (gender, birth date).
//  2. Why you are here. The reason comes before any measurement, so every
//     number asked after it is in service of something the user said they
//     want. Then whether other apps let them down, answered honestly at once.
//  3. The body: height, parents, background, feet, past heights, and last the
//     dream height, so the run of numbers ends on the one they care about.
//  4. What gets in the way, asked right after the dream while it is vivid,
//     and right before the habit questions it explains.
//  5. The day: training, sleep, bedtime, training time, meals, protein,
//     calories.
//  6. A reward after the longest stretch: the first thing they will do once
//     taller. Then everything echoed back as "built for you", which is what
//     makes the reminders that follow read as help rather than noise.
//  7. Reminders, asked only now that the times are known and the user has
//     just seen what each one is for. Then the analysis and the result.
enum _Page {
  intro,
  painHook,
  gender,
  birthDate,
  whyTaller,
  triedApps,
  triedAppsAnswer,
  heightWeight,
  parents,
  ethnicity,
  footSize,
  pastHeights,
  dreamHeight,
  blockers,
  workout,
  sleep,
  bedtime,
  workoutTime,
  meals,
  protein,
  calories,
  firstWhenTaller,
  builtForYou,
  notifications,
  analyzing,
}

/// First page with the back arrow and the progress bar.
const _kFirstQuestion = _Page.gender;

/// Last page before the analysis. It carries its own two buttons.
const _kLastQuestion = _Page.notifications;

// ─────────────────────────────────────────────────────────────────────────────

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  // ── Controllers ─────────────────────────────────────────────────────────────
  final _pageController = PageController();
  int _currentPage = 0;

  _Page get _page => _Page.values[_currentPage];

  // ── Why, and what is in the way (ids from OnboardingIds) ─────────────────────
  // The lists keep the order the user tapped them in: the first reason and the
  // first blocker are the ones "Built for you" leads with.
  final List<String> _whyTaller = [];
  String _triedApps = '';
  final List<String> _blockers = [];
  String _firstWhenTaller = '';

  /// True while the system permission prompt is up, so a second tap cannot
  /// ask twice.
  bool _askingNotifications = false;

  // ── Basic profile ────────────────────────────────────────────────────────────
  String _gender = 'male';
  // Starts mid-range rather than on a fixed year, so the wheel always opens on
  // a value the picker actually offers.
  DateTime _birthDate = DateTime(DateTime.now().year - 17, 1, 1);

  // ── Height / Weight (metric stored internally) ───────────────────────────────
  bool _heightImperial = false;
  int _selectedHeight = 170; // cm
  int _selectedWeight = 65; // kg
  int _heightFt = 5;
  int _heightIn = 7;
  int _weightLbs = 150;

  // ── Parents ──────────────────────────────────────────────────────────────────
  int _selectedFatherHeight = 175; // cm
  int _selectedMotherHeight = 162; // cm
  int _dadFt = 5, _dadIn = 9;
  int _momFt = 5, _momIn = 4;

  // ── Lifestyle questions ──────────────────────────────────────────────────────
  String _weeklyWorkout = '';
  String _ethnicity = '';

  // ── Daily rhythm ─────────────────────────────────────────────────────────────
  // What the reminders are scheduled against, so a night owl is not nudged to
  // sleep at ten and someone who trains at dawn is not told to at six in the
  // evening.
  int _bedHour = 23, _bedMin = 0;
  int _workoutHour = 18, _workoutMin = 0;

  /// "I don't know": the wheels stand aside and a suggested time is used, so
  /// the profile still gets a real time and nothing downstream has to cope
  /// with a missing one. The flags are kept in the answers, so the app can
  /// say "suggested" wherever it shows that time.
  bool _bedtimeUnknown = false;
  bool _workoutTimeUnknown = false;

  /// Bumped when a suggestion is put on the wheels, so they rebuild on it.
  int _bedWheelsRev = 0;
  int _workoutWheelsRev = 0;

  /// The training time used when there is no set one: late afternoon, after
  /// school or work for most people.
  static const _kDefaultWorkout = (18, 0);

  /// One entry per meal: how many, and when. Defaults to three, spread the way
  /// most days go.
  List<String> _mealTimes = const ['08:00', '13:00', '19:00'];

  /// Zero means "did not say" — the plan falls back to its own estimate.
  int _dailyProtein = 0;
  int _dailyCalories = 0;
  bool _proteinUnknown = false;
  bool _caloriesUnknown = false;

  // ── Foot size ────────────────────────────────────────────────────────────────
  double _footSize = 8.5; // US equivalent of EU 41
  bool _footSizeEU = true;

  // ── Dream height ─────────────────────────────────────────────────────────────
  bool _dreamImperial = false;
  int _dreamHeightCm = 183;
  int _dreamFt = 6, _dreamIn = 0;

  // ── Sleep ────────────────────────────────────────────────────────────────────
  double _sleepHours = 7.5;

  // ── Past heights — onboarding picker ─────────────────────────────────────────
  final _obPastHeightValues = <int, double?>{};
  List<int> _obAges = [];
  int _obCurrentAgeIndex = 0;
  // Rebuilt with the ages whenever the page is entered: the page can now be
  // reached going back as well as forward, and a controller that remembered
  // its old page would open on a different age than the one the picker shows.
  PageController _obAgePageController = PageController(
    viewportFraction: 0.50,
    keepPage: false,
  );
  FixedExtentScrollController _obHeightPickerController =
      FixedExtentScrollController(initialItem: 60);
  static const int _kObMinH = 100;
  static const int _kObMaxH = 220;

  // ── Animation controllers ────────────────────────────────────────────────────

  // ─── Unit conversion helpers ──────────────────────────────────────────────
  static int _ftInToCm(int ft, int inches) =>
      ((ft * 12 + inches) * 2.54).round();
  static int _cmToFt(int cm) => (cm / 30.48).floor();
  static int _cmToIn(int cm) => ((cm / 2.54).round()) % 12;
  static int _lbsToKg(int lbs) => (lbs * 0.453592).round();
  static int _kgToLbs(int kg) => (kg * 2.20462).round();
  static double _usToEU(double us) => us + 32.5;
  static double _euToUS(double eu) => eu - 32.5;

  // ─────────────────────────────────────────────────────────────────────────────
  // Lifecycle
  // ─────────────────────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    // Open the height/weight pickers in whichever unit the app already
    // defaults to (imperial for the US/Canada, metric everywhere else) —
    // the user can still flip the toggle on either page.
    final defaultsToImperial = context.read<AppProvider>().useImperial;
    _heightImperial = defaultsToImperial;
    _dreamImperial = defaultsToImperial;
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
        (now.month == _birthDate.month && now.day < _birthDate.day)) {
      a--;
    }
    return a;
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Navigation
  // ─────────────────────────────────────────────────────────────────────────────

  /// Moves the flow to [page]. With reduced motion on, the slide collapses to
  /// its end state.
  void _goTo(int page) {
    setState(() => _currentPage = page);
    if (MediaQuery.of(context).disableAnimations) {
      _pageController.jumpToPage(page);
    } else {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextPage() {
    FocusScope.of(context).unfocus();
    final page = _page;
    // The reminders page asks for permission itself, once the user has seen
    // what each reminder is for. Nothing before it does.
    if (page == _kLastQuestion) {
      // Pre-compute profile & predictions before showing analyzing page
      _computeAnalysisResults();
      setState(() => _currentPage = _Page.analyzing.index);
      _pageController.jumpToPage(_Page.analyzing.index);
      return;
    }
    var next = page.index + 1;
    if (_Page.values[next] == _Page.pastHeights) {
      _initObPastHeights();
      // Past heights start at age 10, so a 9- or 10-year-old has none to
      // give. That page then rendered blank with its button hidden: no way
      // forward.
      if (_obAges.isEmpty) next++;
    }
    _goTo(next);
  }

  void _initObPastHeights() {
    final lastPastAge = _userAge - 1;
    _obAges = lastPastAge >= 10
        ? List.generate(lastPastAge - 9, (i) => lastPastAge - i)
        : [];
    _obCurrentAgeIndex = 0;
    _obAgePageController.dispose();
    _obAgePageController = PageController(
      viewportFraction: 0.50,
      keepPage: false,
    );
    _obHeightPickerController.dispose();
    final initialItem = (_selectedHeight - 5 - _kObMinH).clamp(
      0,
      _kObMaxH - _kObMinH,
    );
    _obHeightPickerController = FixedExtentScrollController(
      initialItem: initialItem,
    );
  }

  /// A bedtime that gives the sleep this age needs before a 07:00 wake-up,
  /// on the nearest quarter hour.
  (int, int) get _suggestedBedtime {
    final need = (Calculations.dailySleepNeed(_userAge) * 60).round();
    var minutes = 7 * 60 - need;
    minutes = ((minutes / 15).round() * 15) % (24 * 60);
    return (minutes ~/ 60, minutes % 60);
  }

  /// The times the profile is saved with: the wheels, or the suggestion when
  /// the user did not know. Read when used, so a birth date changed on the
  /// way back still moves the suggested bedtime.
  String get _bedtime => _bedtimeUnknown
      ? _clock(_suggestedBedtime.$1, _suggestedBedtime.$2)
      : _clock(_bedHour, _bedMin);
  String get _workoutTime => _workoutTimeUnknown
      ? _clock(_kDefaultWorkout.$1, _kDefaultWorkout.$2)
      : _clock(_workoutHour, _workoutMin);

  void _setBedtimeUnknown(bool unknown) {
    if (unknown == _bedtimeUnknown) return;
    Haptics.select();
    setState(() {
      _bedtimeUnknown = unknown;
      if (unknown) {
        // The dimmed wheels show the time that will be used, and pick up
        // from it if the user starts turning them after all.
        final (h, m) = _suggestedBedtime;
        _bedHour = h;
        _bedMin = m;
        _bedWheelsRev++;
      }
    });
  }

  void _setWorkoutTimeUnknown(bool unknown) {
    if (unknown == _workoutTimeUnknown) return;
    Haptics.select();
    setState(() {
      _workoutTimeUnknown = unknown;
      if (unknown) {
        _workoutHour = _kDefaultWorkout.$1;
        _workoutMin = _kDefaultWorkout.$2;
        _workoutWheelsRev++;
      }
    });
  }

  /// The profile as answered so far. The reminders and "Built for you" pages
  /// use it to show real numbers before anything is saved.
  UserProfile _draftProfile() => UserProfile(
    name: 'User',
    gender: _gender,
    birthDate: _birthDate.toIso8601String().substring(0, 10),
    currentHeight: _selectedHeight.toDouble(),
    weight: _selectedWeight.toDouble(),
    fatherHeight: _selectedFatherHeight.toDouble(),
    motherHeight: _selectedMotherHeight.toDouble(),
    ethnicity: _ethnicity,
    bedtime: _bedtime,
    workoutTime: _workoutTime,
    mealTimes: _mealTimes,
    dailyProtein: _proteinUnknown ? 0 : _dailyProtein,
    dailyCalories: _caloriesUnknown ? 0 : _dailyCalories,
  );

  void _computeAnalysisResults() {
    final profile = _draftProfile();
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
    if (_currentPage < _kFirstQuestion.index ||
        _currentPage > _kLastQuestion.index) {
      return;
    }
    var prev = _currentPage - 1;
    if (_Page.values[prev] == _Page.pastHeights) {
      // Entered from the far side: start the ages over, and step past the
      // page altogether for someone too young to have any.
      _initObPastHeights();
      if (_obAges.isEmpty) prev--;
    }
    _goTo(prev);
  }

  bool _canProceed() {
    switch (_page) {
      case _Page.workout:
        return _weeklyWorkout.isNotEmpty;
      case _Page.ethnicity:
        return _ethnicity.isNotEmpty;
      case _Page.whyTaller:
        return _whyTaller.isNotEmpty;
      case _Page.triedApps:
        return _triedApps.isNotEmpty;
      case _Page.blockers:
        return _blockers.isNotEmpty;
      case _Page.firstWhenTaller:
        return _firstWhenTaller.isNotEmpty;
      default:
        return true;
    }
  }

  /// Adds [id] to [list] or takes it out, keeping the order things were
  /// picked in. The card itself gives the selection haptic.
  void _toggle(List<String> list, String id) {
    setState(() => list.contains(id) ? list.remove(id) : list.add(id));
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Analysis
  // ─────────────────────────────────────────────────────────────────────────────

  void _saveProfile() {
    final profile = _draftProfile();
    final past = <int, double>{};
    for (final e in _obPastHeightValues.entries) {
      final val = e.value;
      if (val != null && e.key <= _userAge && val > 50 && val < 250) {
        past[e.key] = val;
      }
    }
    final p = context.read<AppProvider>();
    // Whichever unit the user actually entered their height/weight in here
    // becomes the app-wide display preference, so the rest of the app
    // doesn't revert to a different unit than the one they just used.
    p.setUseImperial(_heightImperial);
    p.savePastHeights(past);
    // These were asked and then thrown away. The dream height drives the
    // goal line on the chart; workouts and sleep size the weekly plan.
    p.setOnboardingAnswers({
      'dreamHeight': _dreamHeightCm,
      'weeklyWorkout': _weeklyWorkout,
      'sleepHours': _sleepHours,
      'footSize': _footSize,
      // Stable ids from OnboardingIds, never the localized labels.
      'whyTaller': List<String>.of(_whyTaller),
      'triedApps': _triedApps,
      'blockers': List<String>.of(_blockers),
      'firstWhenTaller': _firstWhenTaller,
      // The saved bedtime and training time are then suggestions, not the
      // user's own answer.
      'bedtimeUnknown': _bedtimeUnknown,
      'workoutTimeUnknown': _workoutTimeUnknown,
    });
    p.setProfile(profile);

    // setProfile has just re-timed the reminders around the hours the user
    // gave. Putting them on the clock needs their language, which is here and
    // not in the provider. This only schedules anything when the user said
    // yes on the reminders page (scheduleReminders checks).
    unawaited(
      NotificationService().scheduleReminders(
        p.reminders,
        AppLocalizations.of(context)!,
        context: p.reminderContext,
      ),
    );
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
    final currentCode = Localizations.localeOf(
      context,
    ).languageCode.toUpperCase();
    final currentFlag = _langs
        .firstWhere((l) => l.name == currentCode, orElse: () => _langs[0])
        .flag;

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
            Icon(
              CupertinoIcons.chevron_down,
              size: 10,
              color: Colors.white.withValues(alpha: 0.50),
            ),
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
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.15),
              ),
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
                    margin: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 11,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primary.withValues(alpha: 0.12)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      border: selected
                          ? Border.all(
                              color: AppColors.primary.withValues(alpha: 0.30),
                            )
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
                            fontWeight: selected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        if (selected)
                          const Icon(
                            CupertinoIcons.checkmark_circle_fill,
                            color: AppColors.primary,
                            size: 20,
                          ),
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
    final showNav =
        _currentPage >= _kFirstQuestion.index &&
        _currentPage <= _kLastQuestion.index;
    // Past heights and the reminders page carry their own buttons.
    final showButton =
        _currentPage < _kLastQuestion.index && _page != _Page.pastHeights;
    final progress =
        ((_currentPage - _kFirstQuestion.index + 1) /
                (_kLastQuestion.index - _kFirstQuestion.index + 1))
            .clamp(0.0, 1.0);

    final isAnalyzing = _page == _Page.analyzing;

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
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.10),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                CupertinoIcons.arrow_left,
                                color: Colors.white,
                                size: 18,
                              ),
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
                                  backgroundColor: Colors.white.withValues(
                                    alpha: 0.10,
                                  ),
                                  valueColor: const AlwaysStoppedAnimation(
                                    AppColors.primary,
                                  ),
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
                      children: [for (final p in _Page.values) _buildPage(p)],
                    ),
                  ),

                  // ── Bottom button ───────────────────────────────────────
                  if (showButton)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
                      child: _TallerButton(
                        label: _currentPage == 0 ? l.letsStart : l.continueBtn,
                        enabled: _canProceed(),
                        onTap: _nextPage,
                      ),
                    ),
                  // Pages with their own buttons (past heights, reminders)
                  // put them where this one would be. A 70 pt spacer used to
                  // sit under past heights as well, and pushed that page off
                  // the bottom of a 375 x 667 phone in German.
                ],
              ),

              // ── Analyzing overlay — shown on top when analyzing ─────────
              if (isAnalyzing)
                Positioned.fill(
                  child: Container(
                    color: const Color(0xFF0A0812),
                    child: _AnalyzingPage(onComplete: _onAnalysisComplete),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(_Page page) => switch (page) {
    _Page.intro => _buildIntroPage(),
    _Page.painHook => _buildPainHookPage(),
    _Page.gender => _buildGenderPage(),
    _Page.birthDate => _buildBirthDatePage(),
    _Page.whyTaller => _buildWhyTallerPage(),
    _Page.triedApps => _buildTriedAppsPage(),
    _Page.triedAppsAnswer => _buildTriedAppsAnswerPage(),
    _Page.heightWeight => _buildHeightWeightPage(),
    _Page.parents => _buildParentsPage(),
    _Page.ethnicity => _buildEthnicityPage(),
    _Page.footSize => _buildFootSizePage(),
    _Page.pastHeights => _buildOnboardingPastHeightsPage(),
    _Page.dreamHeight => _buildDreamHeightPage(),
    _Page.blockers => _buildBlockersPage(),
    _Page.workout => _buildWorkoutPage(),
    _Page.sleep => _buildSleepPage(),
    _Page.bedtime => _buildBedtimePage(),
    _Page.workoutTime => _buildWorkoutTimePage(),
    _Page.meals => _buildMealsPage(),
    _Page.protein => _buildProteinPage(),
    _Page.calories => _buildCaloriesPage(),
    _Page.firstWhenTaller => _buildFirstWhenTallerPage(),
    _Page.builtForYou => _buildBuiltForYouPage(),
    _Page.notifications => _buildNotificationsPage(),
    // The analysis runs as an overlay on top of the flow.
    _Page.analyzing => const SizedBox(),
  };

  // ─────────────────────────────────────────────────────────────────────────────
  // Why, tried apps, blockers, first thing: the answers and their labels
  // ─────────────────────────────────────────────────────────────────────────────

  static const _whyIcons = <String, IconData>{
    'confidence': CupertinoIcons.sparkles,
    'impression': CupertinoIcons.hand_raised_fill,
    'sports': CupertinoIcons.sportscourt_fill,
    'clothes': CupertinoIcons.bag_fill,
    'photos': CupertinoIcons.camera_fill,
    'potential': CupertinoIcons.chart_bar_alt_fill,
  };

  static String _whyLabel(AppLocalizations l, String id) => switch (id) {
    'confidence' => l.obWhyConfidence,
    'impression' => l.obWhyImpression,
    'sports' => l.obWhySports,
    'clothes' => l.obWhyClothes,
    'photos' => l.obWhyPhotos,
    _ => l.obWhyPotential,
  };

  static const _triedIcons = <String, IconData>{
    'stopped': CupertinoIcons.pause_circle_fill,
    'still': CupertinoIcons.device_phone_portrait,
    'first': CupertinoIcons.star_fill,
  };

  static String _triedLabel(AppLocalizations l, String id) => switch (id) {
    'stopped' => l.obTriedStopped,
    'still' => l.obTriedStill,
    _ => l.obTriedFirst,
  };

  static const _blockerIcons = <String, IconData>{
    'forget': CupertinoIcons.bell_fill,
    'time': CupertinoIcons.timer_fill,
    'exercises': CupertinoIcons.play_rectangle_fill,
    'motivation': CupertinoIcons.flame_fill,
    'bedtime': CupertinoIcons.moon_fill,
    'meals': Icons.restaurant_rounded,
  };

  static String _blockerLabel(AppLocalizations l, String id) => switch (id) {
    'forget' => l.obBlockForget,
    'time' => l.obBlockTime,
    'exercises' => l.obBlockExercises,
    'motivation' => l.obBlockMotivation,
    'bedtime' => l.obBlockBedtime,
    _ => l.obBlockMeals,
  };

  /// How the app answers each blocker, with real features only.
  static String _blockerFix(AppLocalizations l, String id) => switch (id) {
    'forget' => l.obFixForget,
    'time' => l.obFixTime,
    'exercises' => l.obFixExercises,
    'motivation' => l.obFixMotivation,
    'bedtime' => l.obFixBedtime,
    _ => l.obFixMeals,
  };

  static const _firstIcons = <String, IconData>{
    'wardrobe': CupertinoIcons.bag_fill,
    'muscle': Icons.fitness_center_rounded,
    'photos': CupertinoIcons.camera_fill,
    'team': CupertinoIcons.sportscourt_fill,
    'feelGood': CupertinoIcons.smiley_fill,
  };

  static String _firstLabel(AppLocalizations l, String id) => switch (id) {
    'wardrobe' => l.obFirstWardrobe,
    'muscle' => l.obFirstMuscle,
    'photos' => l.obFirstPhotos,
    'team' => l.obFirstTeam,
    _ => l.obFirstFeelGood,
  };

  Widget _buildWhyTallerPage() {
    final l = AppLocalizations.of(context)!;
    return _OptionListPage(
      title: l.obWhyTitle,
      subtitle: l.obWhySubtitle,
      icon: CupertinoIcons.arrow_up_circle_fill,
      accent: AppColors.lime,
      multi: true,
      options: [
        for (final id in OnboardingIds.whyTaller)
          (id, _whyIcons[id]!, _whyLabel(l, id)),
      ],
      isSelected: _whyTaller.contains,
      onTap: (id) => _toggle(_whyTaller, id),
    );
  }

  Widget _buildTriedAppsPage() {
    final l = AppLocalizations.of(context)!;
    return _OptionListPage(
      title: l.obTriedTitle,
      subtitle: l.obTriedSubtitle,
      icon: CupertinoIcons.square_stack_3d_up_fill,
      accent: AppColors.primary,
      options: [
        for (final id in OnboardingIds.triedApps)
          (id, _triedIcons[id]!, _triedLabel(l, id)),
      ],
      isSelected: (id) => _triedApps == id,
      onTap: (id) => setState(() => _triedApps = id),
    );
  }

  /// One honest screen in answer to "tried other apps?". No numbers, no
  /// users, no reviews: only what the app actually does differently, shown
  /// rather than told. A muted card stands for the number other apps stop
  /// at; under it, a day of BeTaller ticks itself off with the real moves.
  Widget _buildTriedAppsAnswerPage() {
    final l = AppLocalizations.of(context)!;
    final (title, body) = switch (_triedApps) {
      'stopped' => (l.obTriedStoppedTitle, l.obTriedStoppedBody),
      'still' => (l.obTriedStillTitle, l.obTriedStillBody),
      _ => (l.obTriedFirstTitle, l.obTriedFirstBody),
    };
    // Soft lower edge: on a small phone the plan scrolls under the button
    // instead of being cut through a row.
    return _FadeBottom(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // No icon chip: the plan below is this page's picture, and the
            // room keeps the whole of it on screen on a large phone.
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: -1.0,
                height: 1.12,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              body,
              style: TextStyle(
                fontSize: 14.5,
                height: 1.42,
                color: Colors.white.withValues(alpha: 0.50),
              ),
            ),
            const SizedBox(height: 18),
            _MostAppsCard(
              label: l.obTriedMostApps,
              caption: l.obTriedThatsIt,
              // An example of the kind of number, in the unit this phone uses.
              // It is nobody's prediction, so it carries no label claiming one.
              value: _heightImperial ? "5'11\"" : '180',
              unit: _heightImperial ? '' : 'cm',
            ),
            const SizedBox(height: 10),
            _PlanShowcase(l: l),
            const SizedBox(height: 12),
            _FeatureChips(
              items: [
                (
                  CupertinoIcons.play_rectangle_fill,
                  AppColors.primaryLight,
                  l.obTriedFeatVideo,
                ),
                (
                  CupertinoIcons.bell_fill,
                  AppColors.primaryLight,
                  l.obTriedFeatReminders,
                ),
                (
                  CupertinoIcons.flame_fill,
                  AppColors.warning,
                  l.obTriedFeatStreaks,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlockersPage() {
    final l = AppLocalizations.of(context)!;
    return _OptionListPage(
      title: l.obBlockTitle,
      subtitle: l.obBlockSubtitle,
      icon: CupertinoIcons.exclamationmark_shield_fill,
      accent: AppColors.primaryLight,
      multi: true,
      options: [
        for (final id in OnboardingIds.blockers)
          (id, _blockerIcons[id]!, _blockerLabel(l, id)),
      ],
      isSelected: _blockers.contains,
      onTap: (id) => _toggle(_blockers, id),
    );
  }

  Widget _buildFirstWhenTallerPage() {
    final l = AppLocalizations.of(context)!;
    return _OptionListPage(
      title: l.obFirstTitle,
      subtitle: l.obFirstSubtitle,
      icon: CupertinoIcons.star_circle_fill,
      accent: AppColors.warning,
      options: [
        for (final id in OnboardingIds.firstWhenTaller)
          (id, _firstIcons[id]!, _firstLabel(l, id)),
      ],
      isSelected: (id) => _firstWhenTaller == id,
      onTap: (id) => setState(() => _firstWhenTaller = id),
    );
  }

  /// A height in the unit the user answered in.
  String _formatCm(num cm, {required bool imperial}) {
    if (!imperial) return '${cm.round()} cm';
    final totalIn = (cm / 2.54).round();
    return "${totalIn ~/ 12}'${totalIn % 12}\"";
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Built for you: the answers, echoed back
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildBuiltForYouPage() {
    final l = AppLocalizations.of(context)!;
    final reason = _whyTaller.isEmpty ? null : _whyTaller.first;
    // The top blocker leads; two more at most, so it stays a summary.
    final blockers = _blockers.take(3).toList();
    final goal = _dreamHeightCm.toDouble();
    final now = _selectedHeight.toDouble();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Pill(text: l.obBuiltChip.upperIn(context), color: AppColors.lime),
          const SizedBox(height: 14),
          Text(
            l.obBuiltTitle,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1.0,
              height: 1.12,
            ),
          ),
          const SizedBox(height: 18),

          // ── The hero: today, the goal, and why ─────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
            decoration: BoxDecoration(
              color: AppColors.cardFill,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.lime.withValues(alpha: 0.35)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.lime.withValues(alpha: 0.10),
                  blurRadius: 30,
                  spreadRadius: -8,
                ),
              ],
            ),
            child: Column(
              children: [
                if (goal > now)
                  HeightSilhouette(
                    current: now,
                    potential: goal,
                    female: _gender == 'female',
                    potentialLabel: l.obBuiltGoal.upperIn(context),
                    format: (cm) => _formatCm(cm, imperial: _heightImperial),
                    height: 150,
                  ),
                if (reason != null)
                  _EchoRow(
                    icon: _whyIcons[reason]!,
                    label: l.obBuiltReason,
                    value: _whyLabel(l, reason),
                    divider: goal > now,
                  ),
              ],
            ),
          ),

          // ── What gets in the way, and the answer to each ───────────────
          if (blockers.isNotEmpty) ...[
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
              decoration: BoxDecoration(
                color: AppColors.cardFill,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l.obBuiltBlockers.upperIn(context),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.0,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(height: 12),
                  for (final id in blockers)
                    _FixRow(
                      icon: _blockerIcons[id]!,
                      blocker: _blockerLabel(l, id),
                      fix: _blockerFix(l, id),
                    ),
                ],
              ),
            ),
          ],

          // ── And the picture they are working toward ────────────────────
          if (_firstWhenTaller.isNotEmpty) ...[
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.warning.withValues(alpha: 0.25),
                ),
              ),
              child: _EchoRow(
                icon: _firstIcons[_firstWhenTaller]!,
                label: l.obBuiltWhen,
                value: _firstLabel(l, _firstWhenTaller),
                color: AppColors.warning,
                divider: false,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Reminders: asked for here, and nowhere earlier
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildNotificationsPage() {
    final l = AppLocalizations.of(context)!;
    // Exactly the times the reminders will be set to once the profile is
    // saved (AppProvider.setProfile applies the same function).
    final planned = remindersForProfile(
      bedtime: _bedtime,
      workoutTime: _workoutTime,
      mealTimes: _mealTimes,
    );
    String at(String category) {
      final r = planned.firstWhere((r) => r.category == category);
      return _clock(r.hour, r.minute);
    }

    final meals = List.of(_mealTimes)..sort();
    final rows = <_ReminderLine>[
      _ReminderLine(
        time: at('exercise'),
        icon: CupertinoIcons.bolt_fill,
        color: AppColors.warning,
        title: l.obNotifWorkout,
        // A time the user did not give reads as a suggestion, not as their
        // answer said back to them.
        suggested: _workoutTimeUnknown,
        detail: _workoutTimeUnknown
            ? l.obNotifWorkoutDetailSuggested(_workoutTime)
            : l.obNotifWorkoutDetail(_workoutTime),
      ),
      if (meals.isNotEmpty)
        _ReminderLine(
          time: at('nutrition'),
          icon: Icons.restaurant_rounded,
          color: AppColors.orange,
          title: l.obNotifMeal,
          detail: l.obNotifMealDetail(at('nutrition')),
        ),
      _ReminderLine(
        time: at('water'),
        icon: CupertinoIcons.drop_fill,
        color: AppColors.cyan,
        title: l.obNotifWater,
        detail: l.obNotifWaterDetail,
      ),
      _ReminderLine(
        time: at('sleep'),
        icon: CupertinoIcons.moon_stars_fill,
        color: AppColors.sleep,
        title: l.obNotifSleep,
        suggested: _bedtimeUnknown,
        detail: _bedtimeUnknown
            ? l.obNotifSleepDetailSuggested(_bedtime)
            : l.obNotifSleepDetail(_bedtime),
      ),
    ]..sort((a, b) => a.time.compareTo(b.time));

    // The notification itself, in the words it will actually arrive with.
    final profile = _draftProfile();
    final targets = DailyTargets.forProfile(
      profile,
      weeklyWorkout: _weeklyWorkout,
      meals: profile.mealTimes.length,
    );
    final (previewTitle, previewBody) = _blockers.contains('meals')
        ? (
            l.nProteinTitle(targets.proteinG),
            l.nProteinBody(targets.proteinPerMealG),
          )
        : (
            l.nSleepTitle,
            l.nSleepBody(
              targets.sleepH.fixedL(targets.sleepH % 1 == 0 ? 0 : 1),
            ),
          );

    return Column(
      children: [
        Expanded(
          // A soft edge above the buttons, so content that scrolls under
          // them fades out instead of being cut through a line of text.
          child: ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (r) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [Colors.white, Colors.white, Colors.transparent],
              stops: [0, r.height <= 0 ? 1 : 1 - 28 / r.height, 1],
            ).createShader(r),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // No icon chip: the notification below is this page's
                  // picture, and the room keeps all four reminders on a
                  // 375 x 667 screen.
                  Text(
                    l.obNotifTitle,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -1.1,
                      height: 1.12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _NotificationPreview(
                    title: previewTitle,
                    body: previewBody,
                    when: l.obNotifNow,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cardFill,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.06),
                      ),
                    ),
                    child: Column(
                      children: [
                        for (var i = 0; i < rows.length; i++) ...[
                          if (i > 0)
                            Divider(
                              height: 1,
                              color: Colors.white.withValues(alpha: 0.06),
                            ),
                          rows[i],
                        ],
                      ],
                    ),
                  ),
                  // Under the list rather than under the title: the four
                  // reminders come first on a small screen.
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 10, 4, 0),
                    child: Text(
                      _bedtimeUnknown || _workoutTimeUnknown
                          ? l.obNotifSubtitleSuggested
                          : l.obNotifSubtitle,
                      style: TextStyle(
                        fontSize: 12.5,
                        height: 1.4,
                        color: Colors.white.withValues(alpha: 0.45),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 4, 24, 8),
          child: Column(
            children: [
              _TallerButton(
                label: l.obNotifAllow,
                enabled: !_askingNotifications,
                onTap: _allowReminders,
              ),
              const SizedBox(height: 4),
              TextButton(
                onPressed: _askingNotifications ? null : _skipReminders,
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  foregroundColor: Colors.white.withValues(alpha: 0.55),
                ),
                child: Text(
                  l.obNotifNotNow,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// The one place first run asks the system for notification permission.
  /// The reminders themselves are put on the clock when the profile is saved
  /// at the end of the analysis, which only schedules when this said yes.
  Future<void> _allowReminders() async {
    if (_askingNotifications) return;
    Haptics.tap();
    final l = AppLocalizations.of(context)!;
    setState(() => _askingNotifications = true);
    final service = NotificationService();
    var granted = false;
    try {
      granted = await service.requestPermission();
    } catch (_) {}
    try {
      // Reminders count as on only when the system will actually show them,
      // so the switch in Settings never claims otherwise.
      await service.setEnabled(granted, l, askPermission: false);
    } catch (_) {}
    if (!mounted) return;
    setState(() => _askingNotifications = false);
    if (granted) Haptics.success();
    _nextPage();
  }

  void _skipReminders() {
    Haptics.tap();
    _nextPage();
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Intro slides (premium Taller-style)
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildIntroPage() {
    return Stack(
      children: [
        _buildIntroContent(),
        Positioned(top: 8, right: 16, child: _buildLanguageButton(context)),
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
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.35),
                ),
              ),
              child: Text(
                l.journeyProgressLabel.upperIn(context),
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
  // Pain hook
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
              border: Border.all(
                color: const Color(0xFFEF4444).withValues(alpha: 0.30),
              ),
            ),
            child: Text(
              '\u26a0\ufe0f  ${l.criticalWindow}',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0,
                color: Color(0xFFEF4444),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            l.heightPotentialFading,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1.2,
              height: 1.05,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: l.fadingAway,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFEF4444),
                    letterSpacing: -1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l.painHookDesc,
            style: TextStyle(
              fontSize: 15.5,
              color: Colors.white.withValues(alpha: 0.65),
              height: 1.55,
            ),
          ),
          const SizedBox(height: 28),
          // Fact cards
          ...[
            (
              '🧬',
              const Color(0xFF8B5CF6),
              l.painGeneticTitle,
              l.painGeneticDesc,
              l.painGeneticTag,
            ),
            (
              '😴',
              const Color(0xFF6366F1),
              l.painSleepTitle,
              l.painSleepDesc,
              l.painSleepTag,
            ),
            (
              '🦴',
              const Color(0xFF00C6FF),
              l.painPostureTitle,
              l.painPostureDesc,
              l.painPostureTag,
            ),
            (
              '💪',
              const Color(0xFF22FF88),
              l.painExerciseTitle,
              l.painExerciseDesc,
              l.painExerciseTag,
            ),
            (
              '🥗',
              const Color(0xFFFF8A00),
              l.painNutritionTitle,
              l.painNutritionDesc,
              l.painNutritionTag,
            ),
            (
              '📈',
              const Color(0xFFFFD700),
              l.painTrackingTitle,
              l.painTrackingDesc,
              l.painTrackingTag,
            ),
          ].map(
            (item) => Container(
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.$3,
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: item.$2.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                item.$5,
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w800,
                                  color: item.$2,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item.$4,
                          style: TextStyle(
                            fontSize: 12.5,
                            color: Colors.white.withValues(alpha: 0.55),
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Bottom credibility
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.12),
                  AppColors.primary.withValues(alpha: 0.04),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withValues(alpha: 0.20),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/icon.png',
                      width: 44,
                      height: 44,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l.designedForYou,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        l.designedForYouDesc,
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.white.withValues(alpha: 0.60),
                          height: 1.4,
                        ),
                      ),
                    ],
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
  // Gender
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildGenderPage() {
    final l = AppLocalizations.of(context)!;
    return _RadioListPage(
      title: l.selectYourGender,
      subtitle: l.onboardingPredictSubtitle,
      icon: CupertinoIcons.person_2_fill,
      accent: AppColors.primary,
      options: [('male', l.male), ('female', l.female), ('other', l.other)],
      selected: _gender,
      onSelect: (v) => setState(() => _gender = v),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Birth date
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildBirthDatePage() {
    final l = AppLocalizations.of(context)!;
    return _ScrollPickerPage(
      title: l.whenWereYouBorn,
      subtitle: l.onboardingPredictSubtitle,
      icon: CupertinoIcons.calendar,
      accent: AppColors.cyan,
      child: _BirthDatePickers(
        initialDate: _birthDate,
        onChanged: (date) => setState(() => _birthDate = date),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Height & Weight
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildHeightWeightPage() {
    final l = AppLocalizations.of(context)!;
    final unitKey = _heightImperial ? 'imp' : 'met';
    return _ScrollPickerPage(
      title: l.heightAndWeight,
      subtitle: l.onboardingPredictSubtitle,
      icon: CupertinoIcons.arrow_up_right_circle_fill,
      accent: AppColors.lime,
      unitToggle: _UnitToggle(
        left: l.imperialShort,
        right: l.metricShort,
        isRight: !_heightImperial,
        onToggle: (isMetric) => setState(() {
          _heightImperial = !isMetric;
          if (_heightImperial) {
            _heightFt = _cmToFt(_selectedHeight);
            _heightIn = _cmToIn(_selectedHeight);
            _weightLbs = _kgToLbs(_selectedWeight);
          }
        }),
      ),
      headerRow: _pickerHeaders(
        _heightImperial
            ? [l.heightLabel, '', l.weightLabel]
            : [l.heightLabel, l.weightLabel],
        flex: _heightImperial ? [1, 1, 1] : [1, 1],
      ),
      child: _heightImperial
          ? Row(
              children: [
                Expanded(
                  child: _PickerBox(
                    accent: AppColors.lime,
                    key: ValueKey('hft_$unitKey'),
                    initialItem: (_heightFt - 3).clamp(0, 5),
                    items: List.generate(6, (i) => '${i + 3} ft'),
                    onChanged: (i) => setState(() {
                      _heightFt = i + 3;
                      _selectedHeight = _ftInToCm(_heightFt, _heightIn);
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _PickerBox(
                    accent: AppColors.lime,
                    key: ValueKey('hin_$unitKey'),
                    initialItem: _heightIn.clamp(0, 11),
                    items: List.generate(12, (i) => '$i in'),
                    onChanged: (i) => setState(() {
                      _heightIn = i;
                      _selectedHeight = _ftInToCm(_heightFt, _heightIn);
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _PickerBox(
                    accent: AppColors.lime,
                    key: ValueKey('wlbs_$unitKey'),
                    initialItem: (_weightLbs - 66).clamp(0, 264),
                    items: List.generate(265, (i) => '${i + 66} lb'),
                    onChanged: (i) => setState(() {
                      _weightLbs = i + 66;
                      _selectedWeight = _lbsToKg(_weightLbs);
                    }),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: _PickerBox(
                    accent: AppColors.lime,
                    key: ValueKey('hcm_$unitKey'),
                    initialItem: (_selectedHeight - 100).clamp(0, 120),
                    items: List.generate(121, (i) => '${i + 100} cm'),
                    onChanged: (i) => setState(() {
                      _selectedHeight = i + 100;
                      _heightFt = _cmToFt(_selectedHeight);
                      _heightIn = _cmToIn(_selectedHeight);
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _PickerBox(
                    accent: AppColors.lime,
                    key: ValueKey('wkg_$unitKey'),
                    initialItem: (_selectedWeight - 30).clamp(0, 120),
                    items: List.generate(121, (i) => '${i + 30} kg'),
                    onChanged: (i) => setState(() {
                      _selectedWeight = i + 30;
                      _weightLbs = _kgToLbs(_selectedWeight);
                    }),
                  ),
                ),
              ],
            ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Parents height
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildParentsPage() {
    final l = AppLocalizations.of(context)!;
    final unitKey = _heightImperial ? 'imp' : 'met';
    return _ScrollPickerPage(
      title: l.parentsHeight,
      subtitle: l.onboardingPredictSubtitle,
      icon: CupertinoIcons.person_2_square_stack_fill,
      accent: AppColors.pink,
      unitToggle: _UnitToggle(
        left: l.imperialShort,
        right: l.metricShort,
        isRight: !_heightImperial,
        onToggle: (isMetric) => setState(() => _heightImperial = !isMetric),
      ),
      headerRow: _pickerHeaders(
        _heightImperial
            ? [l.dadLabel, '', l.motherLabel, '']
            : [l.dadLabel, l.motherLabel],
        flex: _heightImperial ? [1, 1, 1, 1] : [1, 1],
      ),
      child: _heightImperial
          ? Row(
              children: [
                Expanded(
                  child: _PickerBox(
                    accent: AppColors.pink,
                    key: ValueKey('dft_$unitKey'),
                    initialItem: (_dadFt - 4).clamp(0, 4),
                    items: List.generate(5, (i) => '${i + 4} ft'),
                    onChanged: (i) => setState(() {
                      _dadFt = i + 4;
                      _selectedFatherHeight = _ftInToCm(_dadFt, _dadIn);
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _PickerBox(
                    accent: AppColors.pink,
                    key: ValueKey('din_$unitKey'),
                    initialItem: _dadIn.clamp(0, 11),
                    items: List.generate(12, (i) => '$i in'),
                    onChanged: (i) => setState(() {
                      _dadIn = i;
                      _selectedFatherHeight = _ftInToCm(_dadFt, _dadIn);
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _PickerBox(
                    accent: AppColors.pink,
                    key: ValueKey('mft_$unitKey'),
                    initialItem: (_momFt - 4).clamp(0, 4),
                    items: List.generate(5, (i) => '${i + 4} ft'),
                    onChanged: (i) => setState(() {
                      _momFt = i + 4;
                      _selectedMotherHeight = _ftInToCm(_momFt, _momIn);
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _PickerBox(
                    accent: AppColors.pink,
                    key: ValueKey('min_$unitKey'),
                    initialItem: _momIn.clamp(0, 11),
                    items: List.generate(12, (i) => '$i in'),
                    onChanged: (i) => setState(() {
                      _momIn = i;
                      _selectedMotherHeight = _ftInToCm(_momFt, _momIn);
                    }),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: _PickerBox(
                    accent: AppColors.pink,
                    key: ValueKey('dcm_$unitKey'),
                    initialItem: (_selectedFatherHeight - 100).clamp(0, 120),
                    items: List.generate(121, (i) => '${i + 100} cm'),
                    onChanged: (i) => setState(() {
                      _selectedFatherHeight = i + 100;
                      _dadFt = _cmToFt(_selectedFatherHeight);
                      _dadIn = _cmToIn(_selectedFatherHeight);
                    }),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _PickerBox(
                    accent: AppColors.pink,
                    key: ValueKey('mcm_$unitKey'),
                    initialItem: (_selectedMotherHeight - 100).clamp(0, 120),
                    items: List.generate(121, (i) => '${i + 100} cm'),
                    onChanged: (i) => setState(() {
                      _selectedMotherHeight = i + 100;
                      _momFt = _cmToFt(_selectedMotherHeight);
                      _momIn = _cmToIn(_selectedMotherHeight);
                    }),
                  ),
                ),
              ],
            ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Weekly workout
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildWorkoutPage() {
    final l = AppLocalizations.of(context)!;
    final options = [
      ('0-2', '0-2', l.workoutsPerWeek),
      ('3-5', '3-5', l.workoutsPerWeek),
      ('6+', '6+', l.workoutsPerWeek),
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _QuestionHeader(
            icon: CupertinoIcons.bolt_fill,
            accent: AppColors.warning,
            title: l.weeklyWorkout,
            subtitle: l.onboardingPredictSubtitle,
          ),
          const SizedBox(height: 22),
          ...options.map(
            (opt) => _ChoiceCard(
              accent: AppColors.warning,
              selected: _weeklyWorkout == opt.$1,
              title: opt.$2,
              subtitle: opt.$3,
              onTap: () => setState(() => _weeklyWorkout = opt.$1),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Ethnicity
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildEthnicityPage() {
    final l = AppLocalizations.of(context)!;
    return _RadioListPage(
      title: l.whatsYourEthnicity,
      subtitle: l.onboardingPredictSubtitle,
      icon: CupertinoIcons.globe,
      accent: AppColors.cyan,
      options: [
        ('white', l.whiteCaucasian),
        ('black', l.blackAfricanAmerican),
        ('hispanic', l.hispanicLatino),
        ('asian', l.asian),
        ('middle_eastern', l.middleEasternIndigenous),
        ('no_answer', l.dontWantToAnswer),
      ],
      selected: _ethnicity,
      onSelect: (v) => setState(() => _ethnicity = v),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Foot size
  // ─────────────────────────────────────────────────────────────────────────────

  Widget _buildFootSizePage() {
    final l = AppLocalizations.of(context)!;
    final unitKey = _footSizeEU ? 'eu' : 'us';
    final items = _footSizeEU
        ? List.generate(21, (i) => (36.0 + i).toStringAsFixed(0))
        : List.generate(21, (i) => (5.0 + i * 0.5).toStringAsFixed(1));
    final currentEU = _usToEU(_footSize);
    final initIdx = _footSizeEU
        ? (currentEU - 36).clamp(0, 20).round()
        : ((_footSize - 5.0) * 2).clamp(0, 20).round();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _QuestionHeader(
            icon: CupertinoIcons.printer_fill,
            accent: AppColors.orange,
            title: l.footSizeLabel,
            subtitle: l.onboardingPredictSubtitle,
          ),
          const SizedBox(height: 18),
          Text(
            l.selectYourSize,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: _PickerBox(
              accent: AppColors.orange,
              key: ValueKey('foot_$unitKey'),
              initialItem: initIdx,
              items: items,
              onChanged: (i) => setState(() {
                _footSize = _footSizeEU ? _euToUS(36.0 + i) : 5.0 + i * 0.5;
              }),
            ),
          ),
          const SizedBox(height: 16),
          _UnitToggle(
            left: 'US',
            right: 'EU',
            isRight: _footSizeEU,
            onToggle: (isEU) => setState(() => _footSizeEU = isEU),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Dream height
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
          Text(
            l.dreamHeightLabel,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: _dreamImperial
                ? Row(
                    children: [
                      Expanded(
                        child: _PickerBox(
                          accent: AppColors.lime,
                          key: ValueKey('dft_$unitKey'),
                          initialItem: (_dreamFt - 3).clamp(0, 5),
                          items: List.generate(6, (i) => '${i + 3} ft'),
                          onChanged: (i) => setState(() {
                            _dreamFt = i + 3;
                            _dreamHeightCm = _ftInToCm(_dreamFt, _dreamIn);
                          }),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _PickerBox(
                          accent: AppColors.lime,
                          key: ValueKey('din_$unitKey'),
                          initialItem: _dreamIn.clamp(0, 11),
                          items: List.generate(12, (i) => '$i in'),
                          onChanged: (i) => setState(() {
                            _dreamIn = i;
                            _dreamHeightCm = _ftInToCm(_dreamFt, _dreamIn);
                          }),
                        ),
                      ),
                    ],
                  )
                : _PickerBox(
                    accent: AppColors.lime,
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
          _UnitToggle(
            left: l.imperialShort,
            right: l.metricShort,
            isRight: !_dreamImperial,
            onToggle: (isMetric) => setState(() => _dreamImperial = !isMetric),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // Sleep (circular dial)
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
  // Geçmiş Boylar (onboarding picker)
  // ─────────────────────────────────────────────────────────────────────────────

  double _obDefaultHeightForAge(int age) {
    final ageRange = (_userAge - 10).clamp(1, 100);
    final fraction = ((age - 10) / ageRange).clamp(0.0, 1.0);
    return (120 + (_selectedHeight - 120) * fraction).roundToDouble();
  }

  int _obHeightToItem(double h) =>
      (h.round() - _kObMinH).clamp(0, _kObMaxH - _kObMinH);

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

  /// Past heights are optional context, not a required step — skip the
  /// whole section at once rather than clicking "Atla" through every age.
  void _obSkipAllAges() {
    for (final age in _obAges) {
      _obPastHeightValues.remove(age);
    }
    _nextPage();
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
                ? [
                    BoxShadow(
                      color: const Color(0xFF8B5CF6).withValues(alpha: 0.32),
                      blurRadius: 28,
                      offset: const Offset(0, 10),
                    ),
                  ]
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
                AppLocalizations.of(context)!.ageLabel,
                style: TextStyle(
                  fontSize: isSelected ? 11 : 9,
                  fontWeight: FontWeight.w700,
                  color: isSelected
                      ? const Color(0xFFB794F4)
                      : Colors.white.withValues(alpha: 0.28),
                  letterSpacing: 0.8,
                ),
              ),
              if (hasSaved && isSelected) ...[
                const SizedBox(height: 8),
                Container(
                  width: 22,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppColors.lime,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  // the daily rhythm the reminders are built on
  // ─────────────────────────────────────────────────────────────────────────────

  static String _clock(int h, int m) =>
      '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';

  /// Meal times worth suggesting for a given number of meals. The user can
  /// move any of them, but nobody should have to set five times by hand to get
  /// to a perfectly ordinary day.
  static const _mealDefaults = <int, List<String>>{
    2: ['10:00', '19:00'],
    3: ['08:00', '13:00', '19:00'],
    4: ['08:00', '12:00', '16:00', '20:00'],
    5: ['08:00', '11:00', '14:00', '17:00', '20:00'],
    6: ['07:30', '10:00', '13:00', '16:00', '19:00', '21:30'],
  };

  Widget _buildBedtimePage() {
    final l = AppLocalizations.of(context)!;
    return _ScrollPickerPage(
      title: l.obBedtimeTitle,
      subtitle: l.obBedtimeSubtitle,
      icon: CupertinoIcons.moon_stars_fill,
      accent: AppColors.sleep,
      child: _UnknownableTimeWheels(
        hour: _bedHour,
        minute: _bedMin,
        rev: _bedWheelsRev,
        accent: AppColors.sleep,
        unknown: _bedtimeUnknown,
        unknownLabel: l.obBedtimeUnknown,
        unknownHint: l.obBedtimeUnknownHint(_bedtime),
        onChanged: (h, m) => setState(() {
          _bedHour = h;
          _bedMin = m;
        }),
        onUnknownChanged: _setBedtimeUnknown,
      ),
    );
  }

  Widget _buildWorkoutTimePage() {
    final l = AppLocalizations.of(context)!;
    return _ScrollPickerPage(
      title: l.obWorkoutTimeTitle,
      subtitle: l.obWorkoutTimeSubtitle,
      icon: CupertinoIcons.bolt_fill,
      accent: AppColors.warning,
      child: _UnknownableTimeWheels(
        hour: _workoutHour,
        minute: _workoutMin,
        rev: _workoutWheelsRev,
        accent: AppColors.warning,
        unknown: _workoutTimeUnknown,
        unknownLabel: l.obWorkoutTimeUnknown,
        unknownHint: l.obWorkoutTimeUnknownHint(_workoutTime),
        onChanged: (h, m) => setState(() {
          _workoutHour = h;
          _workoutMin = m;
        }),
        onUnknownChanged: _setWorkoutTimeUnknown,
      ),
    );
  }

  Widget _buildMealsPage() {
    final l = AppLocalizations.of(context)!;
    const accent = AppColors.orange;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _QuestionHeader(
            icon: CupertinoIcons.leaf_arrow_circlepath,
            accent: accent,
            title: l.obMealsTitle,
            subtitle: l.obMealsSubtitle,
          ),
          const SizedBox(height: 20),

          // How many. Picking a number lays out a day's worth of times.
          Row(
            children: [
              for (final n in _mealDefaults.keys) ...[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() => _mealTimes = List.of(_mealDefaults[n]!));
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 52,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _mealTimes.length == n
                            ? accent.withValues(alpha: 0.18)
                            : const Color(0xFF141020),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: _mealTimes.length == n
                              ? accent.withValues(alpha: 0.75)
                              : Colors.white.withValues(alpha: 0.07),
                          width: _mealTimes.length == n ? 1.5 : 1,
                        ),
                      ),
                      child: Text(
                        '$n',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: _mealTimes.length == n
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.55),
                        ),
                      ),
                    ),
                  ),
                ),
                if (n != _mealDefaults.keys.last) const SizedBox(width: 8),
              ],
            ],
          ),
          const SizedBox(height: 10),
          Text(
            l.obMealsCount('${_mealTimes.length}'),
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: accent.withValues(alpha: 0.85),
            ),
          ),
          const SizedBox(height: 18),

          // And when. Each one opens a wheel.
          for (var i = 0; i < _mealTimes.length; i++)
            _MealTimeRow(
              accent: accent,
              label: l.obMealLabel('${i + 1}'),
              time: _mealTimes[i],
              onTap: () => _editMealTime(i, accent),
            ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Future<void> _editMealTime(int index, Color accent) async {
    final parsed = UserProfile.parseTime(_mealTimes[index]) ?? (8, 0);
    var h = parsed.$1;
    var m = parsed.$2;
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) => Container(
        padding: EdgeInsets.fromLTRB(
          20,
          16,
          20,
          20 + MediaQuery.of(sheetContext).viewPadding.bottom,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFF15111F),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 38,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 200,
              child: _TimeWheels(
                hour: h,
                minute: m,
                accent: accent,
                onChanged: (nh, nm) {
                  h = nh;
                  m = nm;
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: accent,
                borderRadius: BorderRadius.circular(16),
                onPressed: () => Navigator.pop(sheetContext),
                child: Text(
                  AppLocalizations.of(sheetContext)!.save,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    if (!mounted) return;
    setState(() {
      final next = List.of(_mealTimes);
      next[index] = _clock(h, m);
      // Meals read in order whatever order they were set in.
      next.sort();
      _mealTimes = next;
    });
  }

  Widget _buildProteinPage() {
    final l = AppLocalizations.of(context)!;
    const accent = AppColors.lime;
    // 40g to 250g covers everyone from "barely tracks it" to a heavy bulk.
    final items = List.generate(43, (i) => '${40 + i * 5} g');
    final index = ((_dailyProtein == 0 ? 90 : _dailyProtein) - 40) ~/ 5;
    return _ScrollPickerPage(
      title: l.obProteinTitle,
      subtitle: l.obProteinSubtitle,
      icon: CupertinoIcons.flame_fill,
      accent: accent,
      child: _UnknownableWheel(
        accent: accent,
        unknown: _proteinUnknown,
        unknownLabel: l.obNotSure,
        items: items,
        initialItem: index.clamp(0, items.length - 1),
        onChanged: (i) => setState(() => _dailyProtein = 40 + i * 5),
        onUnknownChanged: (v) => setState(() => _proteinUnknown = v),
      ),
    );
  }

  Widget _buildCaloriesPage() {
    final l = AppLocalizations.of(context)!;
    const accent = AppColors.orange;
    final items = List.generate(57, (i) => '${1200 + i * 50} kcal');
    final index = ((_dailyCalories == 0 ? 2200 : _dailyCalories) - 1200) ~/ 50;
    return _ScrollPickerPage(
      title: l.obCaloriesTitle,
      subtitle: l.obCaloriesSubtitle,
      icon: CupertinoIcons.chart_pie_fill,
      accent: accent,
      child: _UnknownableWheel(
        accent: accent,
        unknown: _caloriesUnknown,
        unknownLabel: l.obNotSure,
        items: items,
        initialItem: index.clamp(0, items.length - 1),
        onChanged: (i) => setState(() => _dailyCalories = 1200 + i * 50),
        onUnknownChanged: (v) => setState(() => _caloriesUnknown = v),
      ),
    );
  }

  Widget _buildOnboardingPastHeightsPage() {
    if (_obAges.isEmpty) return const SizedBox();

    final currentAge = _obAges[_obCurrentAgeIndex];
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Başlık. The title has the full width: next to the skip button a
        // 34 pt "Vergangene Größen" broke inside the word.
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l.obPastHeightsTitle,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -1.1,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          // No accuracy figure: there is no measured one.
                          TextSpan(text: l.obPastHeightsSubPart1),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withValues(alpha: 0.52),
                        height: 1.45,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: _obSkipAllAges,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l.obSkipAll,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(alpha: 0.60),
                            ),
                          ),
                          const SizedBox(width: 3),
                          Icon(
                            CupertinoIcons.chevron_right,
                            size: 12,
                            color: Colors.white.withValues(alpha: 0.60),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
            itemBuilder: (context, index) =>
                _buildObAgeSlot(_obAges[index], index == _obCurrentAgeIndex),
          ),
        ),
        const SizedBox(height: 14),

        // Soru metni
        Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, anim) =>
                FadeTransition(opacity: anim, child: child),
            child: Text(
              key: ValueKey(_obCurrentAgeIndex),
              l.obHowTallAtAge(currentAge.toString()),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white.withValues(alpha: 0.48),
                letterSpacing: -0.2,
              ),
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
                  Haptics.select();
                  _obPastHeightValues[currentAge] = (_kObMinH + index)
                      .toDouble();
                },
                selectionOverlay: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 44,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF7C3AED).withValues(alpha: 0.20),
                        const Color(0xFF4C1D95).withValues(alpha: 0.20),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF8B5CF6).withValues(alpha: 0.55),
                      width: 1.5,
                    ),
                  ),
                ),
                children: List.generate(
                  _kObMaxH - _kObMinH + 1,
                  (i) => Center(
                    child: Text(
                      // The wheel still steps through 1cm-wide slots — only
                      // the label is converted, so none of the index<->cm
                      // math elsewhere on this page needs to change.
                      provider.useImperial
                          ? provider.formatHeight((_kObMinH + i).toDouble())
                          : '${_kObMinH + i} cm',
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.8,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 100,
                child: IgnorePointer(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF09070F), Colors.transparent],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 100,
                child: IgnorePointer(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Color(0xFF09070F), Colors.transparent],
                      ),
                    ),
                  ),
                ),
              ),
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
                    width: 58,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.chevron_left,
                      color: Colors.white60,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
              GestureDetector(
                onTap: _obSkipAge,
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.07),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      l.obSkip,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.38),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: _obConfirmAndAdvance,
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFA78BFA), Color(0xFF7C3AED)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF8B5CF6,
                          ).withValues(alpha: 0.42),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _obCurrentAgeIndex == _obAges.length - 1
                            ? l.continueBtn
                            : l.obNext,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.3,
                        ),
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

  // Called by _AnalyzingPage when its animation finishes. The questionnaire is
  // over, so we save and hand straight over to the "step one done" screen.
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
  // Result (kept from original design)
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
              child: Text(
                labels[i],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// Reusable page scaffolds
// ═════════════════════════════════════════════════════════════════════════════

class _RadioListPage extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Color accent;
  final List<(String, String)> options;
  final String selected;
  final ValueChanged<String> onSelect;

  const _RadioListPage({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _QuestionHeader(
            icon: icon,
            accent: accent,
            title: title,
            subtitle: subtitle,
          ),
          const SizedBox(height: 22),
          ...options.map(
            (opt) => _ChoiceCard(
              accent: accent,
              selected: selected == opt.$1,
              title: opt.$2,
              onTap: () => onSelect(opt.$1),
            ),
          ),
        ],
      ),
    );
  }
}

/// The question, wearing its own colour and mark.
///
/// Every one of these pages used to open with the same 32pt line over the same
/// sentence, so five different questions arrived looking like one screen shown
/// five times. The chip gives each its own identity, and the accent carries
/// through to the options and the wheel below it.
class _QuestionHeader extends StatelessWidget {
  final IconData icon;
  final Color accent;
  final String title;
  final String subtitle;

  const _QuestionHeader({
    required this.icon,
    required this.accent,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                accent.withValues(alpha: 0.28),
                accent.withValues(alpha: 0.08),
              ],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: accent.withValues(alpha: 0.35)),
            boxShadow: [
              BoxShadow(
                color: accent.withValues(alpha: 0.25),
                blurRadius: 18,
                spreadRadius: -4,
              ),
            ],
          ),
          child: Icon(icon, color: accent, size: 21),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: -1.1,
            height: 1.12,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14.5,
            height: 1.45,
            color: Colors.white.withValues(alpha: 0.50),
          ),
        ),
      ],
    );
  }
}

/// One answer. Picking it lights the card in the question's colour and runs a
/// bar down its leading edge, so the choice reads at a glance rather than from
/// a single dot on the far right.
class _ChoiceCard extends StatelessWidget {
  final Color accent;
  final bool selected;
  final String title;

  /// The smaller line some questions carry under the answer.
  final String? subtitle;

  final VoidCallback onTap;

  /// A mark in front of the answer, tinted with the question's colour.
  final IconData? leading;

  /// Several answers may be picked: the mark on the right is a check box
  /// instead of a radio dot, so the page says so before anyone reads it.
  final bool multi;

  const _ChoiceCard({
    required this.accent,
    required this.selected,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.leading,
    this.multi = false,
  });

  @override
  Widget build(BuildContext context) {
    // Reduced motion: the card lands in its picked state at once.
    final speed = MediaQuery.of(context).disableAnimations
        ? Duration.zero
        : const Duration(milliseconds: 220);
    return GestureDetector(
      onTap: () {
        Haptics.select();
        onTap();
      },
      child: AnimatedContainer(
        duration: speed,
        curve: Curves.easeOutCubic,
        margin: const EdgeInsets.only(bottom: 11),
        decoration: BoxDecoration(
          gradient: selected
              ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    accent.withValues(alpha: 0.22),
                    accent.withValues(alpha: 0.05),
                  ],
                )
              : null,
          color: selected ? null : const Color(0xFF141020),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected
                ? accent.withValues(alpha: 0.75)
                : Colors.white.withValues(alpha: 0.07),
            width: selected ? 1.5 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.22),
                    blurRadius: 20,
                    spreadRadius: -6,
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            // The leading bar: the cue you catch without reading.
            AnimatedContainer(
              duration: speed,
              curve: Curves.easeOutCubic,
              margin: const EdgeInsets.symmetric(vertical: 16),
              width: 3,
              height: selected ? 30 : 0,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            if (leading != null)
              Padding(
                padding: EdgeInsets.only(left: selected ? 13 : 16),
                child: AnimatedContainer(
                  duration: speed,
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: selected ? 0.22 : 0.10),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(
                    leading,
                    size: 17,
                    color: selected ? accent : accent.withValues(alpha: 0.75),
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  leading != null ? 12 : (selected ? 15 : 18),
                  subtitle == null ? (leading != null ? 15 : 19) : 16,
                  14,
                  subtitle == null ? (leading != null ? 15 : 19) : 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: selected
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.82),
                        fontSize: subtitle == null ? 16 : 21,
                        fontWeight: selected || subtitle != null
                            ? FontWeight.w800
                            : FontWeight.w500,
                        letterSpacing: subtitle == null ? -0.1 : -0.5,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.48),
                          fontSize: 13.5,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: _RadioDot(
                selected: selected,
                accent: accent,
                square: multi,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A question answered by picking from a list, one answer or several.
class _OptionListPage extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Color accent;
  final List<(String id, IconData icon, String label)> options;
  final bool Function(String id) isSelected;
  final ValueChanged<String> onTap;
  final bool multi;

  const _OptionListPage({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.options,
    required this.isSelected,
    required this.onTap,
    this.multi = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _QuestionHeader(
            icon: icon,
            accent: accent,
            title: title,
            subtitle: subtitle,
          ),
          const SizedBox(height: 20),
          for (final (id, optionIcon, label) in options)
            _ChoiceCard(
              accent: accent,
              selected: isSelected(id),
              title: label,
              leading: optionIcon,
              multi: multi,
              onTap: () => onTap(id),
            ),
        ],
      ),
    );
  }
}

/// A small all-caps label on a tinted pill.
class _Pill extends StatelessWidget {
  final String text;
  final Color color;
  const _Pill({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.3,
          color: color,
        ),
      ),
    );
  }
}

/// What other apps stop at: a height and nothing to do with it. Muted on
/// purpose, so the plan under it is the one thing on the page that glows.
class _MostAppsCard extends StatelessWidget {
  final String label;
  final String caption;
  final String value;
  final String unit;
  const _MostAppsCard({
    required this.label,
    required this.caption,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 18, 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.025),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              CupertinoIcons.device_phone_portrait,
              size: 17,
              color: Colors.white.withValues(alpha: 0.35),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.upperIn(context),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.0,
                    color: Colors.white.withValues(alpha: 0.38),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  caption,
                  style: TextStyle(
                    fontSize: 13.5,
                    height: 1.25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1.2,
                    height: 1,
                    color: Colors.white.withValues(alpha: 0.30),
                  ),
                ),
                if (unit.isNotEmpty)
                  TextSpan(
                    text: ' $unit',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.22),
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

/// A day of BeTaller in miniature: three real moves with their stills, the
/// protein target and lights out, ticked off one after another so the screen
/// shows a plan getting done rather than describing one. The page's single
/// glowing element.
class _PlanShowcase extends StatelessWidget {
  final AppLocalizations l;
  const _PlanShowcase({required this.l});

  /// Moves from the real library, each with a bundled still. The doses are
  /// the library's own.
  static const moves = ['dead_hang_active', 'squats', 'plank'];

  String _dose(String id) {
    final row = kNewMoveText[id];
    if (row != null) {
      return (row[l.localeName.split('_').first] ?? row['en']!)[2];
    }
    // Squats live in the older table, whose dose is English only.
    return '3 x 20';
  }

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.of(context).disableAnimations;
    final rows = <(Widget thumb, String title, String subtitle)>[
      for (final id in moves)
        (
          _PosterThumb(routineId: id),
          localizedRoutine(l, id)['title']!,
          _dose(id),
        ),
      (
        const _IconThumb(
          icon: CupertinoIcons.flame_fill,
          color: AppColors.orange,
        ),
        l.obTriedItem2,
        l.obTriedProteinSub,
      ),
      (
        const _IconThumb(
          icon: CupertinoIcons.moon_fill,
          color: AppColors.sleepColor,
        ),
        l.obTriedItem3,
        l.obTriedSleepSub,
      ),
    ];

    // When each tick lands, as a share of the whole run.
    double doneAt(double t, int i) =>
        ((t - (0.12 + i * 0.16)) / 0.12).clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.lime.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: AppColors.lime.withValues(alpha: 0.12),
            blurRadius: 30,
            spreadRadius: -8,
          ),
        ],
      ),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: still ? 1 : 0, end: 1),
        duration: const Duration(milliseconds: 2600),
        builder: (context, t, _) {
          final done = [for (var i = 0; i < rows.length; i++) doneAt(t, i)];
          final count = done.where((d) => d >= 1).length;
          final progress = done.fold<double>(0, (a, b) => a + b) / rows.length;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.arrow_up_circle_fill,
                      size: 15,
                      color: AppColors.lime,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        l.obTriedPlanLabel.upperIn(context),
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.0,
                          color: AppColors.lime,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$count/${rows.length}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9),
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: SizedBox(
                  height: 4,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ColoredBox(
                          color: Colors.white.withValues(alpha: 0.07),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: progress,
                        heightFactor: 1,
                        child: const ColoredBox(color: AppColors.lime),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              for (var i = 0; i < rows.length; i++)
                _ShowcaseRow(
                  thumb: rows[i].$1,
                  title: rows[i].$2,
                  subtitle: rows[i].$3,
                  done: done[i],
                  divider: i > 0,
                ),
            ],
          );
        },
      ),
    );
  }
}

/// Fades the last few points of a scrolling page into the background, so
/// content running under the buttons below ends softly.
class _FadeBottom extends StatelessWidget {
  final Widget child;
  const _FadeBottom({required this.child});

  @override
  Widget build(BuildContext context) => ShaderMask(
    blendMode: BlendMode.dstIn,
    shaderCallback: (r) => LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: const [Colors.white, Colors.white, Colors.transparent],
      stops: [0, r.height <= 0 ? 1 : 1 - 24 / r.height, 1],
    ).createShader(r),
    child: child,
  );
}

/// A plan item with no still: its icon on a tile of its colour.
class _IconThumb extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _IconThumb({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) => Container(
    width: 42,
    height: 42,
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.14),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Icon(icon, size: 18, color: color),
  );
}

/// A move's still, upright like the plan's own thumbnails, with a small play
/// mark: every move in the app comes with a video.
class _PosterThumb extends StatelessWidget {
  final String routineId;
  const _PosterThumb({required this.routineId});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 42,
    height: 52,
    child: Stack(
      children: [
        MoveThumb(routineId: routineId, width: 42, height: 52),
        Positioned(
          right: 3,
          bottom: 3,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.55),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              CupertinoIcons.play_fill,
              size: 8,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

/// One line of the miniature plan; [done] runs from open (0) to ticked (1).
class _ShowcaseRow extends StatelessWidget {
  final Widget thumb;
  final String title;
  final String subtitle;
  final double done;
  final bool divider;
  const _ShowcaseRow({
    required this.thumb,
    required this.title,
    required this.subtitle,
    required this.done,
    required this.divider,
  });

  @override
  Widget build(BuildContext context) {
    final pop = 0.8 + 0.2 * Curves.easeOutBack.transform(done);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: divider
            ? Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
              )
            : null,
      ),
      child: Row(
        children: [
          thumb,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    height: 1.25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Transform.scale(
            scale: done == 0 ? 1 : pop,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: Color.lerp(Colors.transparent, AppColors.lime, done),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  color: Color.lerp(
                    Colors.white.withValues(alpha: 0.22),
                    AppColors.lime,
                    done,
                  )!,
                  width: 1.6,
                ),
              ),
              child: Opacity(
                opacity: done,
                child: const Icon(
                  Icons.check_rounded,
                  size: 17,
                  color: Color(0xFF07050F),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Three things the app does, each on its own small tile.
class _FeatureChips extends StatelessWidget {
  final List<(IconData, Color, String)> items;
  const _FeatureChips({required this.items});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 11),
                decoration: BoxDecoration(
                  color: AppColors.cardFill,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: items[i].$2.withValues(alpha: 0.13),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(items[i].$1, size: 15, color: items[i].$2),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      items[i].$3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.5,
                        height: 1.25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.75),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// One answer from the questionnaire, said back: a mark, what was asked, and
/// what the user picked.
class _EchoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  /// A hairline above, when something sits over the row in the same card.
  final bool divider;
  const _EchoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.color = AppColors.lime,
    this.divider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        border: divider
            ? Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
              )
            : null,
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, size: 17, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.25,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
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

/// A blocker the user named and what the app does about it.
class _FixRow extends StatelessWidget {
  final IconData icon;
  final String blocker;
  final String fix;
  const _FixRow({required this.icon, required this.blocker, required this.fix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, size: 17, color: AppColors.primaryLight),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blocker,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.check_rounded,
                        size: 15,
                        color: AppColors.lime,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        fix,
                        style: const TextStyle(
                          fontSize: 14.5,
                          height: 1.3,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// One reminder on the reminders page: when it goes off and why then.
class _ReminderLine extends StatelessWidget {
  final String time;
  final IconData icon;
  final Color color;
  final String title;
  final String detail;

  /// The time is a suggestion, because the user did not know theirs: it is
  /// marked as approximate rather than shown as their answer.
  final bool suggested;
  const _ReminderLine({
    required this.time,
    required this.icon,
    required this.color,
    required this.title,
    required this.detail,
    this.suggested = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 17, color: color),
          ),
          const SizedBox(width: 12),
          // The time sits on the title's line, so the reason under it has
          // the full width and stays on one line in most languages.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      suggested ? '≈ $time' : time,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.3,
                        color: suggested
                            ? Colors.white.withValues(alpha: 0.6)
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
                Text(
                  detail,
                  style: TextStyle(
                    fontSize: 12.5,
                    height: 1.3,
                    color: Colors.white.withValues(alpha: 0.5),
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

/// A notification as it will look on the lock screen, with the copy the app
/// really sends.
class _NotificationPreview extends StatelessWidget {
  final String title;
  final String body;
  final String when;
  const _NotificationPreview({
    required this.title,
    required this.body,
    required this.when,
  });

  @override
  Widget build(BuildContext context) {
    final still = MediaQuery.of(context).disableAnimations;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: still ? 1 : 0, end: 1),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: Transform.translate(
          offset: Offset(0, -12 * (1 - t)),
          child: child,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 14, 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.09),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.18),
              blurRadius: 26,
              spreadRadius: -6,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.asset(
                'assets/icon.png',
                width: 38,
                height: 38,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    Container(width: 38, height: 38, color: AppColors.primary),
              ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // The header a lock screen gives it: app, then when. The
                  // title gets the whole width under it, so "98 g" never
                  // breaks between the number and its unit.
                  Row(
                    children: [
                      Text(
                        'BeTaller',
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withValues(alpha: 0.55),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        when,
                        style: TextStyle(
                          fontSize: 11.5,
                          color: Colors.white.withValues(alpha: 0.45),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    body,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.3,
                      color: Colors.white.withValues(alpha: 0.75),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScrollPickerPage extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Color accent;
  final Widget child;
  final Widget? unitToggle;
  final Widget? headerRow;

  const _ScrollPickerPage({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
    required this.child,
    this.unitToggle,
    this.headerRow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _QuestionHeader(
            icon: icon,
            accent: accent,
            title: title,
            subtitle: subtitle,
          ),
          if (unitToggle != null) ...[const SizedBox(height: 18), unitToggle!],
          if (headerRow != null) ...[
            const SizedBox(height: 14),
            headerRow!,
          ] else
            const SizedBox(height: 14),
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
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      letterSpacing: -1.0,
      height: 1.15,
    ),
  );
}

class _PageSubtitle extends StatelessWidget {
  final String text;
  const _PageSubtitle(this.text);
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: 15,
      color: Colors.white.withValues(alpha: 0.55),
      height: 1.45,
    ),
  );
}

class _RadioDot extends StatelessWidget {
  final bool selected;
  final Color accent;

  /// A check box rather than a dot, for questions with several answers.
  final bool square;
  const _RadioDot({
    required this.selected,
    this.accent = AppColors.primary,
    this.square = false,
  });
  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      shape: square ? BoxShape.rectangle : BoxShape.circle,
      borderRadius: square ? BorderRadius.circular(7) : null,
      color: selected ? accent : Colors.transparent,
      border: Border.all(
        color: selected ? accent : Colors.white.withValues(alpha: 0.24),
        width: 1.5,
      ),
      boxShadow: selected
          ? [
              BoxShadow(
                color: accent.withValues(alpha: 0.45),
                blurRadius: 10,
                spreadRadius: -2,
              ),
            ]
          : null,
    ),
    child: selected
        ? const Icon(Icons.check_rounded, color: Colors.white, size: 15)
        : null,
  );
}

class _TallerButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback onTap;
  const _TallerButton({
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: enabled
              ? const LinearGradient(
                  colors: [Color(0xFF9E6CF8), Color(0xFF7B3CF6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: enabled ? null : Colors.white.withValues(alpha: 0.07),
          boxShadow: enabled
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.35),
                    blurRadius: 22,
                    offset: const Offset(0, 7),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
              color: enabled
                  ? Colors.white
                  : Colors.white.withValues(alpha: 0.35),
            ),
          ),
        ),
      ),
    );
  }
}

class _UnitToggle extends StatelessWidget {
  final String left, right;
  final bool isRight;
  final ValueChanged<bool> onToggle;
  const _UnitToggle({
    required this.left,
    required this.right,
    required this.isRight,
    required this.onToggle,
  });

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
            width: 52,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        _label(right, isRight),
      ],
    );
  }

  Widget _label(String text, bool active) => Text(
    text,
    style: TextStyle(
      color: active ? Colors.white : Colors.white.withValues(alpha: 0.38),
      fontSize: 15,
      fontWeight: active ? FontWeight.w700 : FontWeight.w400,
    ),
  );
}

/// An hour and a minute, side by side.
///
/// Minutes move in fives: nobody sets a bedtime reminder for 23:07, and a
/// sixty-item wheel makes the one they do want harder to reach.
class _TimeWheels extends StatelessWidget {
  final int hour;
  final int minute;
  final Color accent;
  final void Function(int hour, int minute) onChanged;

  /// A new value puts fresh wheels on [hour] and [minute]: how a time set
  /// from outside (a suggestion) reaches wheels that keep their own scroll.
  final int rev;

  const _TimeWheels({
    required this.hour,
    required this.minute,
    required this.accent,
    required this.onChanged,
    this.rev = 0,
  });

  @override
  Widget build(BuildContext context) {
    final minutes = List.generate(
      12,
      (i) => (i * 5).toString().padLeft(2, '0'),
    );
    return Row(
      children: [
        Expanded(
          child: _PickerBox(
            key: ValueKey('hour-$accent-$rev'),
            accent: accent,
            initialItem: hour.clamp(0, 23),
            items: List.generate(24, (i) => i.toString().padLeft(2, '0')),
            onChanged: (i) => onChanged(i, minute),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _PickerBox(
            key: ValueKey('minute-$accent-$rev'),
            accent: accent,
            initialItem: (minute ~/ 5).clamp(0, minutes.length - 1),
            items: minutes,
            onChanged: (i) => onChanged(hour, i * 5),
          ),
        ),
      ],
    );
  }
}

/// Time wheels with an honest way out, for a time that has no fixed answer.
///
/// Picking "I don't know" dims the wheels onto the suggested time and lets
/// them ignore scrolling; touching them again hands the choice back to the
/// wheels. The page owns the haptic, so both ways in feel the same.
class _UnknownableTimeWheels extends StatelessWidget {
  final int hour;
  final int minute;
  final int rev;
  final Color accent;
  final bool unknown;
  final String unknownLabel;

  /// What happens instead, shown under the label while it is picked.
  final String unknownHint;
  final void Function(int hour, int minute) onChanged;
  final ValueChanged<bool> onUnknownChanged;

  const _UnknownableTimeWheels({
    required this.hour,
    required this.minute,
    required this.rev,
    required this.accent,
    required this.unknown,
    required this.unknownLabel,
    required this.unknownHint,
    required this.onChanged,
    required this.onUnknownChanged,
  });

  @override
  Widget build(BuildContext context) {
    final speed = MediaQuery.of(context).disableAnimations
        ? Duration.zero
        : const Duration(milliseconds: 220);
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedOpacity(
                  duration: speed,
                  opacity: unknown ? 0.3 : 1,
                  child: IgnorePointer(
                    ignoring: unknown,
                    child: _TimeWheels(
                      hour: hour,
                      minute: minute,
                      rev: rev,
                      accent: accent,
                      onChanged: onChanged,
                    ),
                  ),
                ),
              ),
              if (unknown)
                Positioned.fill(
                  child: Listener(
                    key: const ValueKey('time-wheels-wake'),
                    behavior: HitTestBehavior.opaque,
                    onPointerDown: (_) => onUnknownChanged(false),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        GestureDetector(
          key: const ValueKey('time-unknown-chip'),
          onTap: () => onUnknownChanged(!unknown),
          child: AnimatedContainer(
            duration: speed,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(14, 12, 16, 12),
            decoration: BoxDecoration(
              color: unknown
                  ? accent.withValues(alpha: 0.16)
                  : Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: unknown
                    ? accent.withValues(alpha: 0.7)
                    : Colors.white.withValues(alpha: 0.08),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _RadioDot(selected: unknown, accent: accent),
                const SizedBox(width: 11),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          unknownLabel,
                          style: TextStyle(
                            fontSize: 14.5,
                            height: 1.25,
                            fontWeight: FontWeight.w700,
                            color: unknown
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                      ),
                      AnimatedSize(
                        duration: speed,
                        curve: Curves.easeOutCubic,
                        alignment: Alignment.topLeft,
                        child: unknown
                            ? Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  unknownHint,
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    height: 1.35,
                                    color: Colors.white.withValues(alpha: 0.6),
                                  ),
                                ),
                              )
                            : const SizedBox(width: double.infinity),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

/// One meal on the meals page: which meal it is, when it is, and a hint that
/// tapping changes it.
class _MealTimeRow extends StatelessWidget {
  final Color accent;
  final String label;
  final String time;
  final VoidCallback onTap;

  const _MealTimeRow({
    required this.accent,
    required this.label,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 9),
        padding: const EdgeInsets.fromLTRB(16, 14, 14, 14),
        decoration: BoxDecoration(
          color: const Color(0xFF141020),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Row(
          children: [
            Icon(CupertinoIcons.clock, size: 16, color: accent),
            const SizedBox(width: 11),
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.80),
                ),
              ),
            ),
            Text(
              time,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              CupertinoIcons.chevron_right,
              size: 14,
              color: Colors.white.withValues(alpha: 0.25),
            ),
          ],
        ),
      ),
    );
  }
}

/// A wheel with an honest way out.
///
/// Asking somebody how many grams of protein they eat and forcing a number
/// gets a made-up one, which is worse than nothing: the plan would be built on
/// it. Saying so is a valid answer.
class _UnknownableWheel extends StatelessWidget {
  final Color accent;
  final bool unknown;
  final String unknownLabel;
  final List<String> items;
  final int initialItem;
  final ValueChanged<int> onChanged;
  final ValueChanged<bool> onUnknownChanged;

  const _UnknownableWheel({
    required this.accent,
    required this.unknown,
    required this.unknownLabel,
    required this.items,
    required this.initialItem,
    required this.onChanged,
    required this.onUnknownChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: unknown ? 0.35 : 1,
            child: IgnorePointer(
              ignoring: unknown,
              child: _PickerBox(
                accent: accent,
                initialItem: initialItem,
                items: items,
                onChanged: onChanged,
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        GestureDetector(
          onTap: () {
            HapticFeedback.selectionClick();
            onUnknownChanged(!unknown);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: unknown
                  ? accent.withValues(alpha: 0.16)
                  : Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: unknown
                    ? accent.withValues(alpha: 0.7)
                    : Colors.white.withValues(alpha: 0.08),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _RadioDot(selected: unknown, accent: accent),
                const SizedBox(width: 10),
                Text(
                  unknownLabel,
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: unknown
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _PickerBox extends StatefulWidget {
  final int initialItem;
  final List<String> items;
  final ValueChanged<int> onChanged;

  /// The question's colour, so the selected row belongs to the page it is on.
  final Color accent;

  const _PickerBox({
    super.key,
    required this.initialItem,
    required this.items,
    required this.onChanged,
    this.accent = AppColors.primary,
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
    if (old.items.length != widget.items.length ||
        old.items.first != widget.items.first) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_ctrl.hasClients) {
          _ctrl.jumpToItem(
            widget.initialItem.clamp(0, widget.items.length - 1),
          );
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
    final accent = widget.accent;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF120E1C),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          CupertinoPicker(
            itemExtent: 50,
            scrollController: _ctrl,
            // A little curve and magnification, so the value you are on reads
            // as the one being chosen rather than the one that happens to be
            // in the middle.
            diameterRatio: 1.35,
            magnification: 1.12,
            squeeze: 1.05,
            selectionOverlay: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: accent.withValues(alpha: 0.45)),
                boxShadow: [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.20),
                    blurRadius: 16,
                    spreadRadius: -4,
                  ),
                ],
              ),
            ),
            onSelectedItemChanged: (i) {
              HapticFeedback.selectionClick();
              widget.onChanged(i);
            },
            children: widget.items
                .map(
                  (item) => Center(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),

          // The wheel used to end on a hard line at the top and bottom of its
          // box. It dissolves into the page instead.
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF120E1C),
                      const Color(0xFF120E1C).withValues(alpha: 0.0),
                      const Color(0xFF120E1C).withValues(alpha: 0.0),
                      const Color(0xFF120E1C),
                    ],
                    stops: const [0.0, 0.22, 0.78, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Birth date picker — fully isolated StatefulWidget so parent setState
//    never rebuilds these pickers and scrolls remain free ──────────────────────

// ═════════════════════════════════════════════════════════════════════════════
// Analyzing Page — fully isolated, runs its own animation timer
// ═════════════════════════════════════════════════════════════════════════════

enum _AnalyzePhase { received, analyzing, done }

class _AnalyzingPage extends StatefulWidget {
  final VoidCallback onComplete;
  const _AnalyzingPage({required this.onComplete});

  @override
  State<_AnalyzingPage> createState() => _AnalyzingPageState();
}

class _AnalyzingPageState extends State<_AnalyzingPage>
    with TickerProviderStateMixin {
  _AnalyzePhase _phase = _AnalyzePhase.received;

  // Vsync-driven, so the ring around the logo glides in one continuous
  // sweep. The old version advanced it by hand on a 30ms Future.delayed
  // loop with a pause between each of the 5 steps — off the display's
  // own frame clock, which is exactly what made the sweep visibly
  // "corner" at every step boundary instead of gliding smoothly.
  late final AnimationController _progressCtrl;
  late final AnimationController _haloCtrl;

  static const int _totalSteps = 5;

  @override
  void initState() {
    super.initState();
    _progressCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );
    _haloCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat();
    _runSequence();
  }

  @override
  void dispose() {
    _progressCtrl.dispose();
    _haloCtrl.dispose();
    super.dispose();
  }

  Future<void> _runSequence() async {
    // A short "your data has been received" beat before the checklist
    // starts, so the hand-off from the questionnaire feels acknowledged
    // rather than an abrupt jump into a spinner.
    await Future.delayed(const Duration(milliseconds: 950));
    if (!mounted) return;
    setState(() => _phase = _AnalyzePhase.analyzing);

    await _progressCtrl.forward();
    if (!mounted) return;
    setState(() => _phase = _AnalyzePhase.done);
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
      lr + s * (1 - lr),
      lg * inv,
      lb * inv,
      0,
      0,
      lr * inv,
      lg + s * (1 - lg),
      lb * inv,
      0,
      0,
      lr * inv,
      lg * inv,
      lb + s * (1 - lb),
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 460),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        // Force both the outgoing and incoming child into the exact same
        // full-size box (the default Stack only loosens the constraints,
        // so a child with no Expanded of its own — the "received" view —
        // could shrink-wrap to its content and render off-center/cropped
        // relative to the "analyzing" view crossfading in beside it).
        layoutBuilder: (currentChild, previousChildren) => Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [...previousChildren, ?currentChild],
        ),
        transitionBuilder: (child, anim) => FadeTransition(
          opacity: anim,
          child: ScaleTransition(
            scale: Tween(begin: 0.96, end: 1.0).animate(anim),
            child: child,
          ),
        ),
        child: _phase == _AnalyzePhase.received
            ? _buildReceivedView(l)
            : _buildAnalyzingView(l),
      ),
    );
  }

  // ── Phase 1: a calm confirmation that the questionnaire made it through ──
  Widget _buildReceivedView(AppLocalizations l) {
    return Column(
      key: const ValueKey('received'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        Container(
          width: 104,
          height: 104,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.lime, AppColors.lime.withValues(alpha: 0.72)],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.lime.withValues(alpha: 0.42),
                blurRadius: 36,
                spreadRadius: 4,
              ),
            ],
          ),
          child: const Icon(
            Icons.check_rounded,
            size: 50,
            color: Color(0xFF06210F),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          l.analysisDataReceivedTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: -0.8,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          l.analysisDataReceivedSubtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white.withValues(alpha: 0.55),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  // ── Phase 2/3: the checklist, with a ring around the logo standing in ──
  // for the old numeric progress bar.
  Widget _buildAnalyzingView(AppLocalizations l) {
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

    return AnimatedBuilder(
      key: const ValueKey('analyzing'),
      animation: Listenable.merge([_progressCtrl, _haloCtrl]),
      builder: (context, _) {
        final done = _phase == _AnalyzePhase.done;
        final progress = _progressCtrl.value;
        final step = (progress * _totalSteps).floor().clamp(0, _totalSteps - 1);

        return Column(
          children: [
            const SizedBox(height: 12),
            // Title
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 400),
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: done ? AppColors.primary : Colors.white,
                letterSpacing: -0.8,
              ),
              child: Text(done ? l.analysisComplete : l.analyzing),
            ),
            const SizedBox(height: 24),

            // App logo, ringed by a progress arc instead of a numeric bar —
            // the same visual language as the "step one done" hand-off screen.
            SizedBox(
              width: 210,
              height: 210,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(210, 210),
                    painter: _CompletionBadgePainter(
                      sweep: progress,
                      halo: _haloCtrl.value,
                      color: AppColors.primary,
                    ),
                  ),
                  // ── Glow halo behind the logo ──
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: progress * 0.32),
                          AppColors.primary.withValues(alpha: progress * 0.08),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                  // ── Logo: icon_2.png (proper transparent-bg version) ──
                  ColorFiltered(
                    colorFilter: ColorFilter.matrix(
                      _buildSaturationMatrix(progress),
                    ),
                    child: Image.asset(
                      'assets/icon_2.png',
                      width: 128,
                      height: 128,
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
            const SizedBox(height: 26),

            // Step checklist, wrapped in a soft card with a connector line
            // threading the steps together.
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.035),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.07),
                  ),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: steps.length,
                  itemBuilder: (_, i) {
                    final isDone = i < step || done;
                    final isCurrent = i == step && !done;
                    final isLast = i == steps.length - 1;
                    return Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 350),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: isDone
                                ? AppColors.primary.withValues(alpha: 0.12)
                                : isCurrent
                                ? Colors.white.withValues(alpha: 0.05)
                                : Colors.transparent,
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
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isDone
                                      ? AppColors.primary.withValues(
                                          alpha: 0.25,
                                        )
                                      : isCurrent
                                      ? AppColors.primary.withValues(
                                          alpha: 0.15,
                                        )
                                      : Colors.white.withValues(alpha: 0.06),
                                ),
                                child: Center(
                                  child: isDone
                                      ? const Icon(
                                          CupertinoIcons.checkmark,
                                          color: AppColors.primary,
                                          size: 15,
                                        )
                                      : isCurrent
                                      ? const SizedBox(
                                          width: 15,
                                          height: 15,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation(
                                              AppColors.primary,
                                            ),
                                          ),
                                        )
                                      : Icon(
                                          stepIcons[i],
                                          color: Colors.white.withValues(
                                            alpha: 0.20,
                                          ),
                                          size: 15,
                                        ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Text(
                                  steps[i],
                                  style: TextStyle(
                                    color: isDone
                                        ? Colors.white
                                        : isCurrent
                                        ? Colors.white.withValues(alpha: 0.90)
                                        : Colors.white.withValues(alpha: 0.30),
                                    fontSize: 14.5,
                                    fontWeight: (isDone || isCurrent)
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!isLast)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              children: [
                                const SizedBox(width: 31),
                                Container(
                                  width: 2,
                                  height: 14,
                                  color: isDone
                                      ? AppColors.primary.withValues(
                                          alpha: 0.45,
                                        )
                                      : Colors.white.withValues(alpha: 0.08),
                                ),
                              ],
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
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

/// Youngest and oldest birth years the picker offers.
///
/// 9 matches the App Store age rating the app already ships under, so nobody
/// the live version serves is locked out. Both bounds are derived from today,
/// so the list no longer goes stale the way a hardcoded "2024" did — that one
/// had drifted to offering 2-year-olds while capping the newest year in the
/// past.
const int kMinimumAge = 9;
const int kMaximumAge = 45;

class _BirthDatePickersState extends State<_BirthDatePickers> {
  static final _days = List.generate(31, (i) => '${i + 1}');
  static final int _newestYear = DateTime.now().year - kMinimumAge;
  static final _years = List.generate(
    kMaximumAge - kMinimumAge + 1,
    (i) => '${_newestYear - i}',
  );

  late FixedExtentScrollController _mCtrl;
  late FixedExtentScrollController _dCtrl;
  late FixedExtentScrollController _yCtrl;

  late int _month; // 1–12
  late int _day; // 1–31
  late int _year;

  @override
  void initState() {
    super.initState();
    _month = widget.initialDate.month;
    _day = widget.initialDate.day;
    _year = widget.initialDate.year;
    _mCtrl = FixedExtentScrollController(initialItem: _month - 1);
    _dCtrl = FixedExtentScrollController(initialItem: _day - 1);
    _yCtrl = FixedExtentScrollController(
      initialItem: (_newestYear - _year).clamp(0, _years.length - 1),
    );
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
    final months = List.generate(
      12,
      (i) => DateFormat('MMMM', locale).format(DateTime(2000, i + 1)),
    );
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _RawPicker(
            accent: AppColors.cyan,
            controller: _mCtrl,
            items: months,
            onChanged: (i) {
              _month = i + 1;
              _notify();
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: _RawPicker(
            accent: AppColors.cyan,
            controller: _dCtrl,
            items: _days,
            onChanged: (i) {
              _day = i + 1;
              _notify();
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: _RawPicker(
            accent: AppColors.cyan,
            controller: _yCtrl,
            items: _years,
            onChanged: (i) {
              _year = _newestYear - i;
              _notify();
            },
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

  /// The question's colour, so the selected row belongs to the page it is on.
  final Color accent;

  const _RawPicker({
    required this.controller,
    required this.items,
    required this.onChanged,
    this.accent = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF120E1C),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          CupertinoPicker(
            itemExtent: 50,
            scrollController: controller,
            diameterRatio: 1.35,
            magnification: 1.12,
            squeeze: 1.05,
            selectionOverlay: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: accent.withValues(alpha: 0.45)),
                boxShadow: [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.20),
                    blurRadius: 16,
                    spreadRadius: -4,
                  ),
                ],
              ),
            ),
            onSelectedItemChanged: (i) {
              HapticFeedback.selectionClick();
              onChanged(i);
            },
            children: items
                .map(
                  (item) => Center(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF120E1C),
                      const Color(0xFF120E1C).withValues(alpha: 0.0),
                      const Color(0xFF120E1C).withValues(alpha: 0.0),
                      const Color(0xFF120E1C),
                    ],
                    stops: const [0.0, 0.22, 0.78, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
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
    _anim =
        AnimationController(
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

    return LayoutBuilder(
      builder: (ctx, constraints) {
        // The dial shares the height with the 24 pt gap and the 56 pt
        // +/- buttons below it; sizing it to the full height overflowed the
        // page on a 320 x 568 phone.
        final size = math
            .min(constraints.maxWidth, constraints.maxHeight - 24 - 56)
            .clamp(0.0, 290.0);
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
      },
    );
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
          ? Color.lerp(
              AppColors.primary,
              AppColors.cyan,
              f,
            )!.withValues(alpha: 0.95)
          : Colors.white.withValues(alpha: 0.12);

      canvas.drawLine(
        Offset(
          center.dx + (r - len) * math.cos(a),
          center.dy + (r - len) * math.sin(a),
        ),
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
    canvas.drawCircle(
      knob,
      4.5 + grow * 0.4,
      Paint()..color = AppColors.primary,
    );
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
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.15),
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.3),
            width: 1.5,
          ),
        ),
        child: Icon(icon, color: AppColors.primary, size: 28),
      ),
    );
  }
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
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    );
    _halo = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat();

    _badge = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.0, 0.30, curve: Curves.easeOutBack),
    );
    _ring = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.10, 0.55, curve: Curves.easeOutCubic),
    );
    _headOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.25, 0.5, curve: Curves.easeOut),
      ),
    );
    _headSlide = Tween(begin: const Offset(0, 0.22), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.25, 0.55, curve: Curves.easeOutCubic),
      ),
    );
    _btnOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
      ),
    );
    _btnSlide = Tween(begin: const Offset(0, 0.35), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOutCubic),
      ),
    );
    _ctrl.forward();

    // The potential reveal lands as the count-up finishes.
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) Haptics.impact();
    });
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
    Haptics.success();
    // Straight into the app. The paywall no longer interrupts here: it opens
    // when the app tour finishes, once the user has seen what it unlocks.
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
                colors: [
                  Color(0xFF160B33),
                  Color(0xFF0A0718),
                  Color(0xFF07050F),
                ],
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
                                            AppColors.lime.withValues(
                                              alpha: 0.72,
                                            ),
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.lime.withValues(
                                              alpha: 0.45,
                                            ),
                                            blurRadius: 30,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.check_rounded,
                                        size: 40,
                                        color: Color(0xFF06210F),
                                      ),
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

                        const SizedBox(height: 24),

                        // ── What the questionnaire worked out ───────────
                        FadeTransition(
                          opacity: _headOpacity,
                          child: const _PredictionResultCard(),
                        ),

                        const SizedBox(height: 20),

                        // ── The journey, with step one ticking off ───────
                        Container(
                          padding: const EdgeInsets.fromLTRB(18, 22, 18, 22),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.035),
                            borderRadius: BorderRadius.circular(26),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.07),
                            ),
                          ),
                          child: JourneySteps(
                            completed: progress,
                            animateFrom: _from,
                          ),
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

/// The questionnaire's payoff, shown before the paywall asks for anything: the
/// predicted adult height, where the user stands among people their age, and
/// roughly how much growth the estimate leaves. The paywall used to arrive
/// after a screen that only said "we worked out your potential".
class _PredictionResultCard extends StatelessWidget {
  const _PredictionResultCard();

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final p = context.watch<AppProvider>();
    final profile = p.profile;
    if (profile == null) return const SizedBox.shrink();

    final prediction = Calculations.predictFinalHeight(
      profile,
      p.heightRecords,
    );
    // The same number the app shows later (AppProvider.peerPercentile).
    final percentile = p.peerPercentile;
    final potential = p.potentialHeight;
    final growthLeft = potential - profile.currentHeight;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.lime.withValues(alpha: 0.35)),
      ),
      child: Column(
        children: [
          Text(
            l.resultCardTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 4),
          // Counts up from today's height: the number arrives as a reveal.
          TweenAnimationBuilder<double>(
            tween: Tween(
              begin: MediaQuery.of(context).disableAnimations
                  ? potential
                  : profile.currentHeight,
              end: potential,
            ),
            duration: const Duration(milliseconds: 1600),
            curve: Curves.easeOutCubic,
            builder: (context, v, _) => Text(
              p.formatHeight(v),
              style: const TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: -1.2,
                height: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            l.resultRange(
              p.formatHeight(prediction.minHeight),
              p.formatHeight(prediction.maxHeight),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 16),
          HeightSilhouette(
            current: profile.currentHeight,
            potential: potential,
            dream: p.dreamHeight,
            format: p.formatHeight,
            height: 190,
          ),
          const SizedBox(height: 14),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              _ResultChip(
                icon: Icons.bar_chart_rounded,
                text: l.resultPercentile('$percentile'),
              ),
              if (growthLeft >= 0.5)
                _ResultChip(
                  icon: Icons.trending_up_rounded,
                  text: l.resultGrowthLeft(p.formatHeightDelta(growthLeft)),
                ),
            ],
          ),
          const SizedBox(height: 16),
          _PlanPreview(profile: profile, answers: p.onboardingAnswers),
          const SizedBox(height: 12),
          Text(
            l.resultFootnote,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.5,
              height: 1.4,
              color: Colors.white.withValues(alpha: 0.38),
            ),
          ),
        ],
      ),
    );
  }
}

/// "Your plan is ready": three concrete lines built from the answers just
/// given, so the paywall that follows is selling something the user has
/// already seen is theirs.
class _PlanPreview extends StatelessWidget {
  final UserProfile profile;
  final Map<String, dynamic> answers;
  const _PlanPreview({required this.profile, required this.answers});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final workout = answers['weeklyWorkout'] as String? ?? '';
    final t = DailyTargets.forProfile(
      profile,
      weeklyWorkout: workout,
      meals: profile.mealTimes.length,
    );
    final plan = WeeklyPlan.forAnswers(
      weeklyWorkout: workout,
      age: profile.age,
    );
    final sleep = t.sleepH.fixedL(t.sleepH % 1 == 0 ? 0 : 1);
    final lines = [
      (Icons.fitness_center_rounded, l.planPreviewTraining(plan.trainingDays)),
      (Icons.restaurant_rounded, l.planPreviewProtein(t.proteinG)),
      (Icons.bedtime_rounded, l.planPreviewSleep(sleep)),
    ];
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        color: AppColors.lime.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.planPreviewTitle,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: AppColors.lime,
            ),
          ),
          const SizedBox(height: 8),
          for (final (icon, text) in lines)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 16,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
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

class _ResultChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ResultChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.lime.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.lime),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
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
