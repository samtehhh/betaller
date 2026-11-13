// Renders the real BeTaller screens for the App Store screenshot set.
//
// Run through tool/screenshots/run.py, which passes the options below as
// --dart-define values and then composes the marketing frames:
//
//   SHOT_OUT      folder the raw captures go to (raw/<device>/<locale>/)
//   SHOT_LOCALES  comma list, default all eight app languages
//   SHOT_DEVICES  comma list of iphone, ipad, duo-outer, duo-inner (screens
//                 and headline layers) and header, search (headline layers
//                 only; those creatives reuse the iphone screens). Names
//                 without a slot here, such as iphone63, are skipped.
//   SHOT_ONLY     comma list of shot names, default all
//   SHOT_TALL     "true" renders each screen 3000 pt tall, for picking crops
//
// Everything on screen is the app's own widget tree fed by the app's own demo
// seeding (AppProvider.seedDemoData). Nothing is drawn over the screens here;
// the device frame and headline are added later by compose.py.
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show Intl;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/models/user_profile.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/models/routine.dart';
import 'package:boyuzatma_app/screens/exercise_detail_screen.dart';
import 'package:boyuzatma_app/screens/exercise_library_screen.dart';
import 'package:boyuzatma_app/screens/main_screen.dart';
import 'package:boyuzatma_app/screens/measure_gate_screen.dart';
import 'package:boyuzatma_app/screens/posture_analysis_screen.dart';
import 'package:boyuzatma_app/screens/progress_photos_screen.dart';
import 'package:boyuzatma_app/screens/routines_screen.dart';
import 'package:boyuzatma_app/screens/weekly_report_screen.dart';
import 'package:boyuzatma_app/screens/workout_player_screen.dart';
import 'package:boyuzatma_app/utils/constants.dart';
import 'package:boyuzatma_app/utils/daily_targets.dart';
import 'package:boyuzatma_app/utils/text_case.dart';

const _out = String.fromEnvironment(
  'SHOT_OUT',
  defaultValue: 'outputs/BeTaller-v3',
);
const _localesArg = String.fromEnvironment(
  'SHOT_LOCALES',
  defaultValue: 'en,tr,de,fr,es,it,pt,hi',
);
const _devicesArg = String.fromEnvironment(
  'SHOT_DEVICES',
  defaultValue: 'iphone,ipad',
);
const _onlyArg = String.fromEnvironment('SHOT_ONLY');
const _tall = bool.fromEnvironment('SHOT_TALL');
const _selftest = bool.fromEnvironment('SHOT_SELFTEST');

/// The store slots. Logical size, scale and the safe area the real
/// device reserves, so SafeArea lays the app out exactly as it would there.
class _Device {
  final String name;
  final Size size;
  final double dpr;
  final double top;
  final double bottom;
  const _Device(this.name, this.size, this.dpr, this.top, this.bottom);
}

const _devices = {
  // iPhone 16/17 Pro Max: 440x956 pt @3x = 1320x2868.
  'iphone': _Device('iphone', Size(440, 956), 3, 62, 34),
  // The same screen as 'iphone' (440x956 pt, same safe areas) at 4x:
  // 1760x3824 px, for the three wide-creative shots that need the extra pixels.
  'iphone4x': _Device('iphone4x', Size(440, 956), 4, 62, 34),
  // The 13" slot (2064x2752) filled with the layout of a 10.2" iPad
  // (810x1080 pt, the same 3:4): a real iPad layout whose text is a
  // quarter larger in the store image than the 13" one's (1032x1376 pt).
  'ipad': _Device('ipad', Size(810, 1080), 2064 / 810, 24, 20),
  // iPhone Duo, the two displays of the foldable. The store slots are
  // 1398x2034 (outer) and 2007x2853 (inner); the screens are rendered at
  // those displays' own logical size so the layout is the app's, not a
  // stretched phone, and compose.py frames them below the headline.
  'duo-outer': _Device('duo-outer', Size(466, 678), 3, 44, 20),
  'duo-inner': _Device('duo-inner', Size(669, 951), 3, 24, 20),
};

/// Screens the duo sets use (compose.py's frame plan); the rest are skipped.
const _duoShots = {
  'home', 'progress', 'today', 'analysis', 'program', 'day', 'nutrition',
  'meals', 'photos', 'posture',
};

// ── Fonts ──────────────────────────────────────────────────────────────────

const _fallback = ['SegoeEmoji', 'Nirmala', 'MaterialIcons'];

/// Script fonts (regular + bold faces each). The CJK collections are
/// extracted to single faces in <out>/.fonts first (see _loadFonts).
const _scriptFonts = {
  'FbAr': ['SegoeUI-Regular.ttf', 'C:/Windows/Fonts/segoeui.ttf', 'SegoeUI-Bold.ttf', 'C:/Windows/Fonts/segoeuib.ttf'],
  'FbTh': ['C:/Windows/Fonts/LeelawUI.ttf', 'C:/Windows/Fonts/LeelaUIb.ttf'],
  'FbJa': ['YuGothic-Regular.ttf', 'YuGothic-Bold.ttf', 'C:/Windows/Fonts/YuGothR.ttc', 'C:/Windows/Fonts/YuGothB.ttc'],
  'FbKo': ['C:/Windows/Fonts/malgun.ttf', 'C:/Windows/Fonts/malgunbd.ttf'],
  'FbZh': ['YaHei-Regular.ttf', 'YaHei-Bold.ttf', 'C:/Windows/Fonts/msyh.ttc', 'C:/Windows/Fonts/msyhbd.ttc'],
  'FbZhHant': ['JhengHei-Regular.ttf', 'JhengHei-Bold.ttf', 'C:/Windows/Fonts/msjh.ttc', 'C:/Windows/Fonts/msjhbd.ttc'],
};

/// The script font a locale reads first, so Han characters get the right
/// glyph forms (Japanese, Simplified or Traditional).
String? _scriptFontFor(String lang) {
  if (lang.startsWith('zh')) {
    return lang.contains('Hant') ? 'FbZhHant' : 'FbZh';
  }
  return const {
    'ar': 'FbAr', 'th': 'FbTh', 'ja': 'FbJa', 'ko': 'FbKo',
  }[lang];
}

/// Fallback list for a locale: its own script font first, then emoji,
/// Devanagari, the other scripts (mixed text), icons last.
List<String> _fallbackFor(String lang) {
  final own = _scriptFontFor(lang);
  return [
    if (own != null) own,
    'SegoeEmoji',
    'Nirmala',
    for (final f in _scriptFonts.keys)
      if (f != own) f,
    'MaterialIcons',
  ];
}

/// The Locale the app uses for a harness name: zh_Hant is the script
/// subtag form (lib/utils/app_languages.dart), everything else a plain code.
Locale _loc(String name) => name == 'zh_Hant'
    ? const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
    : Locale(name);

Future<void> _font(String family, List<String> paths) async {
  final loader = FontLoader(family);
  var any = false;
  for (final p in paths) {
    final f = File(p);
    if (!f.existsSync()) continue;
    final bytes = f.readAsBytesSync();
    loader.addFont(Future.value(ByteData.view(bytes.buffer)));
    any = true;
  }
  if (!any) throw StateError('No font file for $family in $paths');
  await loader.load();
}

String _cupertinoIconsFont() {
  final config = jsonDecode(
    File('.dart_tool/package_config.json').readAsStringSync(),
  ) as Map<String, dynamic>;
  for (final p in config['packages'] as List) {
    if (p['name'] == 'cupertino_icons') {
      final root = Uri.parse(p['rootUri'] as String);
      return '${root.toFilePath()}${Platform.pathSeparator}assets'
          '${Platform.pathSeparator}CupertinoIcons.ttf';
    }
  }
  throw StateError('cupertino_icons not in package_config.json');
}

Future<void> _loadFonts() async {
  await _font('Inter', [
    for (final w in ['Regular', 'Medium', 'SemiBold', 'Bold', 'ExtraBold', 'Black'])
      'assets/fonts/Inter-$w.ttf',
  ]);
  final flutterRoot = Platform.environment['FLUTTER_ROOT'] ?? 'C:/flutter';
  await _font('MaterialIcons', [
    '$flutterRoot/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf',
    'C:/flutter/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf',
  ]);
  // CupertinoIcons resolve to this package-qualified family name.
  await _font('packages/cupertino_icons/CupertinoIcons', [_cupertinoIconsFont()]);
  await _font('SegoeEmoji', ['C:/Windows/Fonts/seguiemj.ttf']);
  // run.py extracts the regular and bold faces from Nirmala.ttc; the
  // collection itself is the fallback (its first face is the regular one).
  await _font('Nirmala', [
    '$_out/.fonts/NirmalaUI-Regular.ttf',
    '$_out/.fonts/NirmalaUI-Bold.ttf',
    if (!File('$_out/.fonts/NirmalaUI-Regular.ttf').existsSync())
      'C:/Windows/Fonts/Nirmala.ttc',
  ]);
  // One family per script, regular and bold. A .ttc is a collection and
  // FontLoader takes its first face only, so the single faces written by
  // yazi-katmani/extract_fonts.py (bold) and uretim/extract_regular.py
  // (regular) into <out>/.fonts come first; the .ttc is the last resort.
  // A name without a drive letter is looked up in <out>/.fonts.
  bool single(String f) => !f.contains(':') && File('$_out/.fonts/$f').existsSync();
  for (final e in _scriptFonts.entries) {
    final paths = <String>[];
    final hasReg = e.value.any((f) => single(f) && f.contains('Regular'));
    final hasBold = e.value.any((f) => single(f) && f.contains('Bold'));
    for (final f in e.value) {
      final p = f.contains(':') ? f : '$_out/.fonts/$f';
      if (!File(p).existsSync()) continue;
      final lower = f.toLowerCase();
      if (lower.endsWith('.ttc')) {
        final bold = lower.endsWith('b.ttc') || lower.endsWith('bd.ttc');
        if (bold ? hasBold : hasReg) continue;
      }
      paths.add(p);
    }
    await _font(e.key, paths);
    // ignore: avoid_print
    print('font ${e.key} <- $paths');
  }
}

// ── Demo user ──────────────────────────────────────────────────────────────

String _day(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

/// The program day (1-based) the demo user is on: "Today's step".
const _stepDay = 43;

/// A 15 year old, 164 cm, eight weeks into the app, premium on so every
/// screen shows what is inside rather than its lock.
Future<AppProvider> _seed(String lang) async {
  // It is a test, just not under test/.
  // ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});
  var p = AppProvider();
  await p.loadData();
  final now = DateTime.now();
  p.setLocale(_loc(lang));
  p.setUseImperial(false);
  p.savePastHeights({11: 141, 12: 147, 13: 153, 14: 159});
  p.setOnboardingAnswers({'weeklyWorkout': '3-5', 'trainPlace': 'gym', 'dreamHeight': 182});
  p.setProfile(UserProfile(
    name: 'Alex',
    gender: 'male',
    birthDate: _day(DateTime(now.year - 15, 3, 10)),
    currentHeight: 164,
    weight: 54,
    fatherHeight: 181,
    motherHeight: 166,
  ));
  p.setPremium(true);
  await p.seedDemoData();

  // Two posture self-checks a month apart, pointing at the demo photo the
  // seeding already copied to disk. Written into the saved state and read
  // back, the same path the app takes on launch.
  final prefs = await SharedPreferences.getInstance();
  final data = jsonDecode(prefs.getString('glowup_app_data')!) as Map<String, dynamic>;
  final photos = (data['progressPhotos'] as List).cast<Map>();
  final photo = photos.isNotEmpty ? photos.last['path'] as String : '';
  data['postureAnalyses'] = [
    {
      'id': 'demo_posture_0',
      'date': _day(now.subtract(const Duration(days: 30))),
      'path': photo,
      // Answer scores the self-check sheet produces (90 / 65 / 40 and
      // 90 / 70 / 50), so each area card reads its advice, not a legacy note.
      'kyphosisScore': 65,
      'lordosisScore': 70,
      'headPosScore': 65,
      'totalScore': 67,
    },
    {
      'id': 'demo_posture_1',
      'date': _day(now.subtract(const Duration(days: 2))),
      'path': photo,
      'kyphosisScore': 65,
      'lordosisScore': 90,
      'headPosScore': 90,
      'totalScore': 82,
    },
  ];
  // Today's workout half done rather than finished: the first two moves
  // ticked, the rest still open, so the plan reads as something to do.
  final training = p.weeklyPlan.today.routineIds;
  if (training.length > 2) {
    final open = training.skip(2).toSet();
    data['completedRoutineIds'] = [
      for (final id in (data['completedRoutineIds'] as List).cast<String>())
        if (!open.contains(id)) id,
    ];
  }
  // Today's step is program day 43 (Monday of a week-A level-7 week: Squats,
  // Glute Bridge, Plank, Superman, Active Hang; all five are photographs
  // and none is a timed "session" move). The seeding leaves day 46 open,
  // so days 1..42 are marked done instead, and today's tick list, which
  // follows the program day, is rebuilt the way the seeding builds it.
  data['completedProgramDays'] = [for (var i = 0; i < _stepDay - 1; i++) i];
  data['completedRoutineIds'] = <String>[];
  await prefs.setString('glowup_app_data', jsonEncode(data));
  final probe = AppProvider();
  await probe.loadData();
  final plan = probe.todayRoutines.map((r) => r.id).toList();
  final openIds = p.weeklyPlan.today.routineIds.skip(2).toSet();
  data['completedRoutineIds'] = [
    for (final id in plan.take(plan.length - 1))
      if (!openIds.contains(id)) id,
  ];
  // Last week a little weaker than this one, so the weekly report's
  // "vs last week" reads as a gain: three days of last week half done.
  final history = (data['routineHistory'] as Map).cast<String, dynamic>();
  final today0 = DateTime(now.year, now.month, now.day);
  final lastMonday = today0.subtract(Duration(days: today0.weekday - 1 + 7));
  for (final i in const [1, 3, 5]) {
    final k = _day(lastMonday.add(Duration(days: i)));
    final ids = history[k] as List?;
    if (ids != null) history[k] = ids.take((ids.length / 2).floor()).toList();
  }
  data['routineHistory'] = history;
  await prefs.setString('glowup_app_data', jsonEncode(data));
  p = AppProvider();
  await p.loadData();
  p.setLocale(_loc(lang));
  return p;
}

// ── App shell ──────────────────────────────────────────────────────────────

/// The app's own theme from lib/main.dart, with Inter standing in for SF Pro
/// (not redistributable, and not on this machine) plus emoji and Devanagari
/// fallbacks so nothing renders as a box.
Widget _app(AppProvider p, String lang, Widget home, GlobalKey<NavigatorState> nav) =>
    ChangeNotifierProvider.value(
      value: p,
      child: MaterialApp(
        navigatorKey: nav,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.scaffold,
          colorScheme: const ColorScheme.dark(
            primary: AppColors.primary,
            secondary: AppColors.primaryLight,
            surface: AppColors.surfaceDark,
            error: AppColors.error,
          ),
          useMaterial3: true,
          fontFamily: 'Inter',
          fontFamilyFallback: _fallbackFor(lang),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            foregroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          splashColor: Colors.white10,
          highlightColor: Colors.white10,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _loc(lang),
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
          child: DefaultTextStyle.merge(
            style: TextStyle(fontFamilyFallback: _fallbackFor(lang)),
            child: child!,
          ),
        ),
        home: home,
      ),
    );

// ── Shots ──────────────────────────────────────────────────────────────────

class _Ctx {
  final WidgetTester t;
  final AppProvider p;
  final GlobalKey<NavigatorState> nav;
  _Ctx(this.t, this.p, this.nav);

  Future<void> settle([int ms = 2400]) async {
    for (var i = 0; i < ms ~/ 200; i++) {
      await t.pump(const Duration(milliseconds: 200));
    }
  }

  Future<void> tab(int i) async {
    final bar = find.byWidgetPredicate((w) => w.runtimeType.toString() == '_NavItem');
    await t.tap(bar.at(i));
    await settle(1200);
  }

  Future<void> subTab(int i) async {
    t.state<RoutinesScreenState>(find.byType(RoutinesScreen)).goToSubTab(i);
    await settle(1200);
  }

  Future<void> push(Widget screen) async {
    nav.currentState!.push(CupertinoPageRoute<void>(builder: (_) => screen));
    await settle(1600);
  }

  List<Element> _laidOut(String type) => find
      .byWidgetPredicate((w) => w.runtimeType.toString() == type)
      .evaluate()
      .where((e) => e.renderObject is RenderBox && (e.renderObject! as RenderBox).hasSize)
      .toList();

  /// The vertical list the user would be scrolling: on screen, scrollable,
  /// and the biggest of those.
  ScrollableState? _mainList() {
    final states = find
        .byType(Scrollable)
        .evaluate()
        .map((e) => (e as StatefulElement).state as ScrollableState)
        .where((s) => s.position.axis == Axis.vertical && s.position.maxScrollExtent > 0)
        .toList()
      ..sort((a, b) {
        double area(ScrollableState s) {
          final box = s.context.findRenderObject() as RenderBox?;
          return box == null || !box.hasSize ? 0 : box.size.width * box.size.height;
        }
        return area(b).compareTo(area(a));
      });
    return states.isEmpty ? null : states.first;
  }

  /// Scrolls until the first widget of runtime type [type] has its top edge
  /// [top] points below the top of the screen. Lazily built lists are paged
  /// down until the widget exists.
  Future<void> revealAt(String type, double top) async {
    for (var i = 0; i < 30; i++) {
      final hits = _laidOut(type);
      if (hits.isNotEmpty) {
        final e = hits.first;
        final y = (e.renderObject! as RenderBox).localToGlobal(Offset.zero).dy;
        final pos = Scrollable.of(e).position;
        pos.jumpTo((pos.pixels + y - top).clamp(pos.minScrollExtent, pos.maxScrollExtent));
        await settle(800);
        return;
      }
      final list = _mainList();
      if (list == null) return;
      final pos = list.position;
      if (pos.pixels >= pos.maxScrollExtent) return;
      pos.jumpTo((pos.pixels + 300).clamp(0, pos.maxScrollExtent));
      await t.pump(const Duration(milliseconds: 100));
    }
  }
}

class _Shot {
  final String name;

  /// Called after the app is pumped on MainScreen.
  final Future<void> Function(_Ctx c, _Device d) go;

  /// runtimeType names whose on-screen rects are written to the sidecar
  /// JSON, so compose.py can lift a card out of the real pixels.
  final List<String> focus;
  const _Shot(this.name, this.go, {this.focus = const []});
}

/// The first program day the user has not finished, as the workout player
/// would open it from the Discipline tab.
List<MoveDose> _programMoves(AppProvider p) {
  final open = List.generate(70, (i) => i)
      .firstWhere((i) => !p.completedProgramDays.contains(i), orElse: () => 0);
  // A strength day shows a filmed move (squats) rather than a drawing.
  var day = p.weeklyPlan.programDay(open);
  for (var i = open; i < open + 7; i++) {
    final d = p.weeklyPlan.programDay(i);
    if (d.moves.isNotEmpty && d.moves.first.routineId == 'squats') {
      day = d;
      break;
    }
  }
  return day.moves;
}

final _shots = <_Shot>[
  // Scrolled so the hero sits under the status bar area and the cards
  // below it end above the tab bar instead of peeking out under it.
  _Shot('home', (c, d) async {
    if (d.name == 'iphone' || d.name == 'duo-outer') {
      await c.revealAt('_PotentialHero', d.top + 6);
    }
  }, focus: ['_PotentialHero']),
  _Shot('progress', (c, d) async {
    await c.tab(2);
    // The outer duo display is short: unscrolled, the chart runs under the
    // tab bar. Scrolled up, it sits whole above it.
    if (d.name == 'duo-outer') await c.revealAt('PotentialChart', d.top + 190);
  }, focus: ['PotentialChart']),
  _Shot('today', (c, d) async {
    await c.tab(1);
    await c.subTab(0);
  }, focus: ['_TodayHero']),
  _Shot('player', (c, d) async {
    await c.push(WorkoutPlayerScreen(
      moves: _programMoves(c.p),
      title: 'Day',
      onMoveDone: (_) {},
    ));
  }),
  _Shot('analysis', (c, d) async => c.tab(3), focus: ['_ScoreHero']),
  _Shot('program', (c, d) async {
    await c.tab(1);
    await c.subTab(1);
  }, focus: ['ProgramJourneyHeader', '_LevelWeek']),
  // Today's step on the Discipline tab, scrolled up under the tabs.
  _Shot('day', (c, d) async {
    await c.tab(1);
    await c.subTab(1);
    await c.revealAt('_ProgramDayCard', d.top + 150);
  }, focus: ['_ProgramDayCard']),
  _Shot('nutrition', (c, d) async {
    await c.tab(1);
    await c.subTab(2);
  }, focus: ['NutritionTargetsHeader']),
  _Shot('meals', (c, d) async {
    await c.tab(1);
    await c.subTab(2);
    await c.revealAt('MealCard', d.top + 200);
  }, focus: ['MealCard']),
  _Shot('photos', (c, d) async => c.push(const ProgressPhotosScreen())),
  _Shot('posture', (c, d) async => c.push(const PostureAnalysisScreen()),
      focus: ['_ScoreCard']),
  _Shot('weekly', (c, d) async => c.push(const WeeklyReportScreen()),
      focus: ['_RecapHero', '_DaysCard', '_HeightCard']),
  _Shot('measure', (c, d) async => c.push(const MeasureGateScreen()),
      focus: ['TextField']),
  // A hanging move with two stills and numbered steps.
  _Shot('guide', (c, d) async {
    final json = defaultRoutines.firstWhere((r) => r['id'] == 'hanging_knee_raise');
    await c.push(ExerciseDetailScreen(routine: Routine.fromJson(json)));
  }, focus: ['_StillsPager', '_GuideStep']),
  // One guide shot per hanging, jumping or stretching move with stills, the
  // pager scrolled near the top so the steps below stay above the bottom bar.
  // A focus name ending in '*' records the union of all hits.
  for (final id in const [
    'pull_ups', 'hanging_knee_raise', 'scapular_pull',
    'jump_squats', 'tuck_jumps', 'single_leg_hops',
    'childs_pose', 'seated_forward_fold',
  ])
    _Shot('guide_$id', (c, d) async {
      final json = defaultRoutines.firstWhere((r) => r['id'] == id);
      await c.push(ExerciseDetailScreen(routine: Routine.fromJson(json)));
      await c.revealAt('_StillsPager', d.top + 110);
    }, focus: ['_StillsPager', '_GuideStep*']),
  _Shot('posture_areas', (c, d) async {
    await c.push(const PostureAnalysisScreen());
    await c.revealAt('_AreaCard', d.top + 130);
  }, focus: ['_AreaCard']),
  _Shot('posture_history', (c, d) async {
    await c.push(const PostureAnalysisScreen());
    await c.revealAt('_HistoryCard', d.top + 130);
  }, focus: ['_HistoryCard']),
  _Shot('library', (c, d) async => c.push(const ExerciseLibraryScreen()),
      focus: ['_MoveRow']),
  for (var i = 1; i <= 5; i++)
    _Shot('library_$i', (c, d) async {
      await c.push(const ExerciseLibraryScreen());
      // The chip row is a lazy horizontal list: far chips are not built until
      // the row is scrolled to the end.
      final row = find.byType(Scrollable).evaluate().map((e) => (e as StatefulElement).state as ScrollableState).firstWhere((s) => s.position.axis == Axis.horizontal);
      if (i >= 3) row.position.jumpTo(row.position.maxScrollExtent);
      await c.settle(400);
      final chips = find.byWidgetPredicate((w) => w.runtimeType.toString() == '_GroupChip');
      final chip = i >= 3 ? chips.at(chips.evaluate().length - (6 - i)) : chips.at(i);
      await c.t.tap(chip);
      await c.settle(1200);
    }, focus: ['_MoveRow']),
  _Shot('profile', (c, d) async => c.tab(4)),
];

// ── Text-defect detector ───────────────────────────────────────────────────

/// Every paragraph on screen whose text does not fit: more lines than its
/// maxLines allows (kind 'maxLines'), or a one-line softWrap:false text wider
/// than its box with an overflow other than visible (kind 'width'). Walks
/// the semantics-visible render tree, so offstage tabs, covered routes and
/// scrolled-away list items are not counted. Rects are in physical pixels.
List<Map<String, dynamic>> _truncatedText(WidgetTester t, Size viewLogical, double dpr) {
  final out = <Map<String, dynamic>>[];
  final view = Offset.zero & viewLogical;
  void visit(RenderObject o) {
    if (o is RenderParagraph && o.hasSize && o.attached) {
      String? kind;
      if (o.didExceedMaxLines) {
        kind = 'maxLines';
      } else if (!o.softWrap &&
          o.overflow != TextOverflow.visible &&
          o.getMaxIntrinsicWidth(double.infinity) > o.size.width + 0.5) {
        kind = 'width';
      }
      if (kind != null) {
        final r = MatrixUtils.transformRect(o.getTransformTo(null), o.paintBounds);
        final vis = r.intersect(view);
        if (vis.width > 0 && vis.height > 0) {
          final text = o.text.toPlainText().replaceAll('\n', ' ');
          out.add({
            'kind': kind,
            'text': text.length > 60 ? text.substring(0, 60) : text,
            'rect': [r.left * dpr, r.top * dpr, r.right * dpr, r.bottom * dpr],
          });
        }
      }
    }
    o.visitChildrenForSemantics(visit);
  }

  visit(t.binding.renderViews.first);
  return out;
}

// ── Capture ────────────────────────────────────────────────────────────────

/// Decodes every image on screen for real. Image decoding is real I/O, which
/// the fake clock of a widget test never lets finish: an image first resolved
/// inside the fake zone stays pending forever. So the screen is built once,
/// its image providers are collected, the cache is emptied and each provider
/// is decoded again under runAsync. The caller then rebuilds the screen,
/// which now finds every image already decoded.
Future<int> _warmImages(WidgetTester t) async {
  final images = find.byType(Image, skipOffstage: false).evaluate().toList();
  if (images.isEmpty) return 0;
  var ok = 0;
  await t.runAsync(() async {
    imageCache.clear();
    imageCache.clearLiveImages();
    for (final e in images) {
      final w = e.widget as Image;
      try {
        await precacheImage(w.image, e).timeout(const Duration(seconds: 15));
        ok++;
      } catch (_) {}
    }
  });
  return ok;
}

Future<void> _capture(WidgetTester t, _Device d, String path, Map<String, dynamic> meta) async {
  await t.pump(const Duration(milliseconds: 300));
  final root = find.byType(MaterialApp).evaluate().single;
  await t.runAsync(() async {
    final image = await captureImage(root);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    final file = File(path)..createSync(recursive: true);
    file.writeAsBytesSync(bytes!.buffer.asUint8List());
    meta['width'] = image.width;
    meta['height'] = image.height;
    File(path.replaceAll('.png', '.json')).writeAsStringSync(
      const JsonEncoder.withIndent('  ').convert(meta),
    );
    image.dispose();
  });
}

Map<String, dynamic> _focusRects(WidgetTester t, _Device d, List<String> names) {
  final out = <String, dynamic>{};
  for (final n in names) {
    // A trailing '*' asks for the union of every on-screen hit, stored under
    // the name as given (including the star).
    final union = n.endsWith('*');
    final type = union ? n.substring(0, n.length - 1) : n;
    final f = find.byWidgetPredicate((w) => w.runtimeType.toString() == type);
    final hits = f.evaluate().where((e) => e.renderObject is RenderBox).toList();
    if (hits.isEmpty) continue;
    // The topmost hit on screen (an IndexedStack keeps other tabs offstage).
    final rects = <Rect>[];
    for (final e in hits) {
      final box = e.renderObject! as RenderBox;
      if (!box.hasSize || !box.attached) continue;
      final r = box.localToGlobal(Offset.zero) & box.size;
      if (r.right <= 0 || r.left >= d.size.width) continue;
      rects.add(r);
    }
    if (rects.isEmpty) continue;
    var r = rects.first;
    if (union) {
      for (final o in rects.skip(1)) {
        r = r.expandToInclude(o);
      }
    }
    out[n] = [r.left * d.dpr, r.top * d.dpr, r.right * d.dpr, r.bottom * d.dpr];
  }
  return out;
}

// ── Headline layers ────────────────────────────────────────────────────────
//
// The headline and subline are set by Flutter's own text engine rather than
// Pillow: Pillow here has no complex-script shaping (no raqm), which breaks
// Devanagari, and no letter-spacing. Each layer is a transparent PNG the
// width of the centre 80% of the canvas; compose.py places it.

class _TextSpec {
  final double width, headMax, headMin, sub, gap;

  /// Headline lines to fit before shrinking the size; past [headMin] the
  /// text may still wrap.
  final int lines;
  const _TextSpec(this.width, this.headMax, this.headMin, this.sub, this.gap,
      [this.lines = 2]);
}

const _textSpecs = {
  'iphone': _TextSpec(1030, 128, 84, 52, 34),
  'ipad': _TextSpec(1610, 150, 104, 62, 40),
  'duo-outer': _TextSpec(1090, 112, 76, 46, 28),
  'duo-inner': _TextSpec(1560, 146, 100, 60, 38),
  // The 21:9 product page header: the box stays inside the centre half of
  // the 3840 px canvas, the part every crop keeps.
  'header': _TextSpec(1720, 150, 108, 60, 30),
  // The 3:2 search result image, 3840 px wide: one line, so the three
  // screens below keep the same size in every language.
  'search': _TextSpec(3300, 196, 136, 80, 40, 1),
};

/// The creatives with one headline each, read from copy.json's entry of
/// the same name instead of the frame list.
const _creatives = {'header', 'search'};

/// Upper case that knows Turkish: i -> İ and ı -> I, never the plain
/// toUpperCase (which turns "takip" into "TAKIP"). The brand keeps its casing.
String _headlineCase(String s, String lang, String mode) {
  if (mode != 'upper') return s;
  const brand = 'BeTaller';
  // The app's own helper (lib/utils/text_case.dart), so the frames and the
  // app case Turkish the same way.
  return s.split(brand).map((part) => upperFor(part, lang)).join(brand);
}

/// Tight tracking suits Inter; Devanagari joins its letters along the
/// headline bar, and negative spacing breaks those joins.
double _tracking(String lang, double em) => lang == 'hi' ? 0 : em;

TextStyle _headStyle(double size, String lang) => TextStyle(
      fontFamily: 'Inter',
      fontFamilyFallback: _fallback,
      fontWeight: FontWeight.w900,
      fontSize: size,
      height: lang == 'hi' ? 1.18 : 1.06,
      letterSpacing: _tracking(lang, -0.035) * size,
      color: Colors.white,
    );

TextStyle _subStyle(double size, String lang) => TextStyle(
      fontFamily: 'Inter',
      fontFamilyFallback: _fallback,
      fontWeight: FontWeight.w500,
      fontSize: size,
      height: 1.28,
      letterSpacing: _tracking(lang, -0.01) * size,
      color: Colors.white.withValues(alpha: 0.72),
    );

TextPainter _layout(String text, TextStyle style, double width) => TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: width);

bool _fits(String text, TextStyle style, double width, int maxLines) {
  if (_layout(text, style, width).computeLineMetrics().length > maxLines) {
    return false;
  }
  // No word may be wider than the box, or it would be split mid-word.
  return text
      .split(' ')
      .every((w) => _layout(w, style, double.infinity).width <= width);
}

/// The narrowest width that keeps the same number of lines, so a two-line
/// headline splits into two even lines instead of a long one and a stub.
double _balanced(String text, TextStyle style, double width) {
  final lines = _layout(text, style, width).computeLineMetrics().length;
  if (lines < 2) return width;
  var lo = width * 0.4, hi = width;
  for (var i = 0; i < 18; i++) {
    final mid = (lo + hi) / 2;
    if (_fits(text, style, mid, lines)) {
      hi = mid;
    } else {
      lo = mid;
    }
  }
  return hi + 2;
}

void _textTests(List<String> devices, List<String> locales) {
  final copy = jsonDecode(File('tool/screenshots/copy.json').readAsStringSync())
      as Map<String, dynamic>;
  final mode = copy['headlineCase'] as String? ?? 'sentence';
  final allFrames = (copy['frames'] as List).cast<Map<String, dynamic>>();
  for (final dn in devices) {
    final spec = _textSpecs[dn];
    if (spec == null) continue;
    final frames = _creatives.contains(dn)
        ? [
            {'slug': dn, ...(copy[dn] as Map<String, dynamic>)}
          ]
        : allFrames;
    for (final lang in locales) {
      testWidgets('text $dn $lang', (t) async {
        t.view.physicalSize = Size(spec.width + 80, 1400);
        t.view.devicePixelRatio = 1;
        for (final f in frames) {
          final pair = (f[lang] ?? f['en']) as List;
          // A word joiner after each hyphen keeps "self-check" or "माता-पिता"
          // on one line; the box is the centre 80% of the canvas, less a margin
          // for glyph overhang.
          String keep(String s) => s.replaceAll('-', '-⁠');
          final head = keep(_headlineCase(pair[0] as String, lang, mode));
          final sub = keep(pair[1] as String);
          var size = spec.headMax;
          while (size > spec.headMin &&
              !_fits(head, _headStyle(size, lang), spec.width, spec.lines)) {
            size -= 2;
          }
          final hs = _headStyle(size, lang);
          final headWidth = _balanced(head, hs, spec.width);
          var subSize = spec.sub;
          while (subSize > spec.sub * 0.8 &&
              !_fits(sub, _subStyle(subSize, lang), spec.width * 0.92, 2)) {
            subSize -= 1;
          }
          final ss = _subStyle(subSize, lang);
          final subWidth = _balanced(sub, ss, spec.width * 0.92);
          final key = GlobalKey();
          await t.pumpWidget(
            Directionality(
              textDirection: TextDirection.ltr,
              child: Align(
                alignment: Alignment.topCenter,
                child: RepaintBoundary(
                  key: key,
                  child: SizedBox(
                    width: spec.width + 40,
                    child: Padding(
                      // Room above and below for accents and descenders,
                      // trimmed again by compose.py.
                      padding: EdgeInsets.symmetric(vertical: size * 0.3),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: headWidth,
                            child: Text(head,
                                textAlign: TextAlign.center, style: hs),
                          ),
                          SizedBox(height: spec.gap),
                          SizedBox(
                            width: subWidth,
                            child: Text(sub,
                                textAlign: TextAlign.center, style: ss),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
          await t.pump();
          final headLines =
              _layout(head, hs, headWidth).computeLineMetrics().length;
          final subLines =
              _layout(sub, ss, subWidth).computeLineMetrics().length;
          await t.runAsync(() async {
            final image = await captureImage(key.currentContext! as Element);
            final bytes =
                await image.toByteData(format: ui.ImageByteFormat.png);
            final path = '$_out/text/$dn/$lang/${f['slug']}.png';
            File(path)
              ..createSync(recursive: true)
              ..writeAsBytesSync(bytes!.buffer.asUint8List());
            File(path.replaceAll('.png', '.json')).writeAsStringSync(
              jsonEncode({
                'headline': head,
                'subline': sub,
                'headlineSize': size,
                'headlineLines': headLines,
                'sublineSize': subSize,
                'sublineLines': subLines,
              }),
            );
            image.dispose();
          });
        }
        t.view.reset();
      });
    }
  }
}


// ── v4 headline layers ─────────────────────────────────────────────────────
//
// compose_v4.py draws its headline with Pillow, which cannot shape Hindi,
// Arabic or Thai and has no CJK font. These tests draw the same block with
// Flutter: --dart-define=SHOT_TEXT_V4=true (runs only these, no screens).
//
//   <out>/text_v4/<slot>/<locale>/<slug>.png   transparent, exactly [box] wide
//   <out>/text_v4/<slot>/<locale>/<slug>.json  metrics for the composer
//
// SHOT_COPY=<path> reads another copy file (default tool/screenshots/copy_v4.json).
// Extract the Windows faces first:
//   python tool/screenshots/yazi-katmani/extract_fonts.py <out>

const _v4Text = bool.fromEnvironment('SHOT_TEXT_V4');
const _v4CopyPath = String.fromEnvironment(
  'SHOT_COPY',
  defaultValue: 'tool/screenshots/copy_v4.json',
);

class _V4Slot {
  final double box, headMax, headMin, sub, gap, wrap, indent;
  final bool left;
  const _V4Slot(this.box, this.headMax, this.headMin, this.sub, this.gap,
      {this.left = false, double? wrap, this.indent = 0})
      : wrap = wrap ?? box;
}

const _v4Slots = {
  'iphone': _V4Slot(1162, 196, 120, 56, 44),
  'ipad': _V4Slot(1630, 250, 150, 74, 56),
  'search': _V4Slot(1710, 380, 230, 118, 70, left: true, wrap: 1560, indent: 8),
  'header': _V4Slot(990, 250, 134, 70, 46, left: true, wrap: 900, indent: 6),
};

// Inter's hhea metrics (1984 / -494 over 2048), which Pillow's getmetrics uses.
const _interAsc = 1984 / 2048, _interDesc = 494 / 2048;
const _v4Pitch = 1.17, _v4SubPitch = 1.26;

/// Line pitch (em) per script: Devanagari, Thai and Arabic carry marks above
/// and below the line, so they get more room; everything else keeps 1.17.
double _v4PitchFor(String locale) {
  switch (locale.split('_').first) {
    case 'hi':
      return 1.36;
    case 'th':
    case 'ar':
      return 1.28;
  }
  return _v4Pitch;
}

/// Where the pill starts, as a fraction of the ascent below the line top.
double _v4PillTopFor(String locale) {
  switch (locale.split('_').first) {
    case 'hi':
      return 0.02;
    case 'th':
    case 'ar':
      return 0.08;
    case 'ja':
    case 'ko':
    case 'zh':
      return 0.05;
  }
  return 0.17;
}
const _v4Pill = Color(0xFF22FF88), _v4PillInk = Color(0xFF0B0A14);
const _v4Sub = Color(0xFFE4D9FF);
// Word space is a fixed 0.24 em, as compose_v4.py sets it (Inter's own space
// is 0.2 em, narrower once tracked).
const _v4Space = 0.24;
// Pillow rounds each advance up, so its -0.04 em tracking comes out about
// 0.013 em looser than Flutter's exact one. This puts it back so the layers
// size and look like the Pillow frames; 0 gives the pure -0.04 em.
const _v4Loosen = 0.013;

/// Font family -> candidate files: the face extract_fonts.py wrote, then the
/// Windows file itself.
const _v4FontFiles = {
  'V4Hi': ['NirmalaUI-Bold.ttf', 'C:/Windows/Fonts/Nirmala.ttc'],
  'V4Ar': ['SegoeUI-Bold.ttf', 'C:/Windows/Fonts/segoeuib.ttf'],
  'V4Th': ['Leelawadee-Bold.ttf', 'C:/Windows/Fonts/LeelaUIb.ttf'],
  'V4Ja': ['YuGothic-Bold.ttf', 'C:/Windows/Fonts/YuGothB.ttc'],
  'V4Ko': ['Malgun-Bold.ttf', 'C:/Windows/Fonts/malgunbd.ttf'],
  'V4Zh': ['YaHei-Bold.ttf', 'C:/Windows/Fonts/msyhbd.ttc'],
  'V4ZhHant': ['JhengHei-Bold.ttf', 'C:/Windows/Fonts/msjhbd.ttc'],
};

/// 'zh_Hant' / 'zh_TW' -> V4ZhHant, 'ja' -> V4Ja, 'en_US' / 'ru' -> none
/// (Inter has Latin and Cyrillic).
String? _v4Family(String locale) {
  final base = locale.split('_').first;
  if (base == 'zh') {
    return locale.contains('Hant') || locale.endsWith('TW') || locale.endsWith('HK')
        ? 'V4ZhHant'
        : 'V4Zh';
  }
  return const {
    'hi': 'V4Hi',
    'ar': 'V4Ar',
    'th': 'V4Th',
    'ja': 'V4Ja',
    'ko': 'V4Ko',
  }[base];
}

/// Negative tracking breaks joined scripts and means nothing for CJK.
bool _v4Tracks(String locale) =>
    !const {'hi', 'ar', 'th', 'ja', 'ko', 'zh'}.contains(locale.split('_').first);

Future<void> _loadV4Fonts(List<String> locales) async {
  final need = <String>{
    for (final l in locales)
      if (_v4Family(l) != null) _v4Family(l)!
  };
  for (final fam in need) {
    final files = _v4FontFiles[fam]!;
    String? path;
    for (final f in files) {
      final p = f.contains(':') ? f : '$_out/.fonts/$f';
      if (File(p).existsSync()) {
        path = p;
        break;
      }
    }
    if (path == null) throw StateError('No font file for $fam in $files');
    await _font(fam, [path]);
    // ignore: avoid_print
    print('V4 font $fam <- $path');
  }
}

class _V4Piece {
  final String text;
  final bool marked;
  final List<String> words;
  _V4Piece(this.text, this.marked) : words = text.split(RegExp(r'\s+'));
}

/// 'will you *get?*' -> [plain 'will you', pill 'get?'].
List<_V4Piece> _v4Parse(String line) {
  final pieces = <_V4Piece>[];
  var marked = false;
  for (final part in line.split('*')) {
    final t = part.trim();
    if (t.isNotEmpty) pieces.add(_V4Piece(t, marked));
    marked = !marked;
  }
  return pieces;
}

String _v4Plain(String line) => line.replaceAll('*', '').trim();

class _V4Style {
  final String locale;
  final double size;
  _V4Style(this.locale, this.size);

  List<String> get fallback {
    final f = _v4Family(locale);
    return f == null ? const [] : [f];
  }

  TextStyle head([Color color = Colors.white]) => TextStyle(
        fontFamily: 'Inter',
        fontFamilyFallback: fallback,
        fontWeight: FontWeight.w900,
        fontSize: size,
        height: _v4PitchFor(locale),
        leadingDistribution: TextLeadingDistribution.even,
        letterSpacing: _v4Tracks(locale) ? (-0.04 + _v4Loosen) * size : 0,
        color: color,
      );

  StrutStyle strut() => StrutStyle(
        fontFamily: 'Inter',
        fontFamilyFallback: fallback,
        fontWeight: FontWeight.w900,
        fontSize: size,
        height: _v4PitchFor(locale),
        leadingDistribution: TextLeadingDistribution.even,
        forceStrutHeight: true,
      );
}

double _v4TextWidth(String text, TextStyle st, TextDirection dir) =>
    (TextPainter(
      text: TextSpan(text: text, style: st),
      textDirection: dir,
    )..layout())
        .width;

double _v4LineWidth(
    List<_V4Piece> ps, double size, TextStyle st, TextDirection dir) {
  var w = 0.0;
  for (final p in ps) {
    for (final word in p.words) {
      w += _v4TextWidth(word, st, dir);
    }
    w += _v4Space * size * (p.words.length - 1) + (p.marked ? 0.28 * size : 0);
  }
  return w + 0.26 * size * (ps.length - 1);
}

/// Baseline of the first line of a forced-strut paragraph, from its top.
double _v4Baseline(TextStyle st, StrutStyle strut) => (TextPainter(
      text: TextSpan(text: 'H', style: st),
      textDirection: TextDirection.ltr,
      strutStyle: strut,
    )..layout())
        .computeLineMetrics()
        .first
        .baseline;

void _textTestsV4(List<String> slots, List<String> locales) {
  final copy = jsonDecode(File(_v4CopyPath).readAsStringSync())
      as Map<String, dynamic>;
  final frames = (copy['frames'] as List).cast<Map<String, dynamic>>();
  for (final name in slots) {
    final slot = _v4Slots[name];
    if (slot == null) continue;
    final entries = name == 'iphone' || name == 'ipad'
        ? frames
        : [
            {'slug': name, ...(copy[name] as Map<String, dynamic>)}
          ];
    for (final lang in locales) {
      testWidgets('text_v4 $name $lang', (t) async {
        final dir = lang.split('_').first == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr;
        for (final f in entries) {
          final pair = (f[lang] ?? f['en']) as List;
          final rawLines = (pair[0] as String).split('|');
          final parsed = [for (final l in rawLines) _v4Parse(l)];

          // Largest size at which every line, pill padding included, fits.
          var size = slot.headMax;
          double widest(double s) {
            final st = _V4Style(lang, s).head();
            return parsed
                .map((p) => _v4LineWidth(p, s, st, dir))
                .reduce((a, b) => a > b ? a : b);
          }

          while (size > slot.headMin && widest(size) > slot.box) {
            size -= 2;
          }
          final overflow = widest(size) > slot.box;
          final style = _V4Style(lang, size);
          final hs = style.head();
          final strut = style.strut();
          final lineWidths = [
            for (final p in parsed) _v4LineWidth(p, size, hs, dir)
          ];
          final pngW = overflow
              ? lineWidths.reduce((a, b) => a > b ? a : b).ceilToDouble()
              : slot.box;

          final pitch = size * _v4PitchFor(lang);
          final asc = (_interAsc * size).ceilToDouble();
          final desc = (_interDesc * size).ceilToDouble();
          final bl = _v4Baseline(hs, strut);
          // Tall marks (Devanagari, Thai, Arabic) need room above line one.
          final base = lang.split('_').first;
          final padTop = base == 'hi'
              ? (size * 0.10).ceilToDouble()
              : const {'th', 'ar'}.contains(base)
                  ? (size * 0.12).ceilToDouble()
                  : 0.0;
          final firstLineTop = padTop + bl - asc; // where Pillow's y would be
          final n = parsed.length;

          // Subline: at most two lines, balanced when centred.
          String keep(String s) => s.replaceAll('-', '-\u2060');
          final sub = keep(pair[1] as String);
          var subSize = slot.sub;
          TextStyle subStyle(double s) => TextStyle(
                fontFamily: 'Inter',
                fontFamilyFallback: _V4Style(lang, s).fallback,
                fontWeight: FontWeight.w600,
                fontSize: s,
                height: _v4SubPitch,
                leadingDistribution: TextLeadingDistribution.even,
                color: _v4Sub,
              );
          StrutStyle subStrut(double s) => StrutStyle(
                fontFamily: 'Inter',
                fontFamilyFallback: _V4Style(lang, s).fallback,
                fontWeight: FontWeight.w600,
                fontSize: s,
                height: _v4SubPitch,
                leadingDistribution: TextLeadingDistribution.even,
                forceStrutHeight: true,
              );
          int subLinesAt(double s, double w) => (TextPainter(
                text: TextSpan(text: sub, style: subStyle(s)),
                textDirection: dir,
                strutStyle: subStrut(s),
              )..layout(maxWidth: w))
                  .computeLineMetrics()
                  .length;
          // Left slots wrap greedily like compose's text_left (no shrink).
          while (sub.isNotEmpty &&
              !slot.left &&
              subSize > slot.sub * 0.8 &&
              subLinesAt(subSize, slot.wrap) > 2) {
            subSize -= 1;
          }
          final subLines = sub.isEmpty ? 0 : subLinesAt(subSize, slot.wrap);
          final subWidth = slot.left || sub.isEmpty
              ? slot.wrap
              : _balanced(sub, subStyle(subSize), slot.wrap);
          final subAsc = (_interAsc * subSize).ceilToDouble();
          final subBl = _v4Baseline(subStyle(subSize), subStrut(subSize));
          // Pillow: sub top = last line top + pitch + 0.06 em + gap.
          final subPillowTop =
              firstLineTop + n * pitch + size * 0.06 + slot.gap;
          final subBlockTop = subPillowTop + subAsc - subBl;
          final headBottom = padTop + n * pitch;
          final gapBox = sub.isEmpty
              ? size * 0.06
              : (subBlockTop - headBottom).clamp(0.0, double.infinity);

          final rootKey = GlobalKey();
          final pillKeys = <(int, GlobalKey)>[];
          final align = slot.left
              ? AlignmentDirectional.centerStart
              : Alignment.center;
          final pTop = bl - asc + _v4PillTopFor(lang) * asc;
          final pH = (bl + 1.02 * desc) - pTop;

          Widget piece(int li, _V4Piece p) {
            Widget words(TextStyle st) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < p.words.length; i++) ...[
                      if (i > 0) SizedBox(width: _v4Space * size),
                      Text(p.words[i],
                          style: st,
                          strutStyle: strut,
                          softWrap: false,
                          maxLines: 1),
                    ],
                  ],
                );
            if (!p.marked) return words(hs);
            final k = GlobalKey();
            pillKeys.add((li, k));
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: pTop,
                  height: pH,
                  child: DecoratedBox(
                    key: k,
                    decoration: BoxDecoration(
                      color: _v4Pill,
                      borderRadius: BorderRadius.circular(0.2 * size),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.14 * size),
                  child: words(style.head(_v4PillInk)),
                ),
              ],
            );
          }

          Widget line(int li) {
            final ps = parsed[li];
            return SizedBox(
              height: pitch,
              child: OverflowBox(
                minWidth: 0,
                maxWidth: double.infinity,
                alignment: align,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < ps.length; i++) ...[
                      if (i > 0) SizedBox(width: 0.26 * size),
                      piece(li, ps[i]),
                    ],
                  ],
                ),
              ),
            );
          }

          final totalGuess = headBottom + gapBox + 5 * subSize * _v4SubPitch;
          t.view.physicalSize = Size(pngW + 100, totalGuess + 200);
          t.view.devicePixelRatio = 1;
          await t.pumpWidget(
            Directionality(
              textDirection: dir,
              child: Align(
                alignment: Alignment.topLeft,
                child: RepaintBoundary(
                  key: rootKey,
                  child: SizedBox(
                    width: pngW,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: slot.left
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: padTop),
                        for (var i = 0; i < n; i++) line(i),
                        SizedBox(height: gapBox),
                        if (sub.isNotEmpty)
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: slot.left ? slot.indent : 0),
                            child: SizedBox(
                              width: subWidth,
                              child: Text(sub,
                                  textAlign: slot.left
                                      ? TextAlign.start
                                      : TextAlign.center,
                                  style: subStyle(subSize),
                                  strutStyle: subStrut(subSize)),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
          await t.pump();
          final root = rootKey.currentContext!.findRenderObject() as RenderBox;
          final pills = [
            for (final (li, k) in pillKeys)
              () {
                final b = k.currentContext!.findRenderObject() as RenderBox;
                final o = b.localToGlobal(Offset.zero, ancestor: root);
                return {
                  'line': li,
                  'x': o.dx,
                  'y': o.dy,
                  'w': b.size.width,
                  'h': b.size.height,
                };
              }()
          ];
          final path = '$_out/text_v4/$name/$lang/${f['slug']}.png';
          await t.runAsync(() async {
            final image = await captureImage(rootKey.currentContext! as Element);
            final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
            File(path)
              ..createSync(recursive: true)
              ..writeAsBytesSync(bytes!.buffer.asUint8List());
            File(path.replaceAll('.png', '.json')).writeAsStringSync(
              const JsonEncoder.withIndent(' ').convert({
                'slot': name,
                'locale': lang,
                'slug': f['slug'],
                'headline': [for (final l in rawLines) _v4Plain(l)].join(' '),
                'lines': [for (final l in rawLines) _v4Plain(l)],
                'headlineSize': size,
                'overflow': overflow,
                'lineWidths': lineWidths,
                'box': slot.box,
                'width': image.width,
                'height': image.height,
                'align': slot.left ? 'left' : 'center',
                'rtl': dir == TextDirection.rtl,
                // Pillow's d.text((x, y)) y of line one, in PNG pixels (can
                // be slightly negative: the glyphs are still inside).
                'firstLineTop': firstLineTop,
                'padTop': padTop,
                'linePitch': pitch,
                'baseline': padTop + bl,
                'pillPadX': 0.14 * size,
                'pills': pills,
                'pill': pills.isEmpty ? null : pills.first,
                'subline': sub.replaceAll('\u2060', ''),
                'sublineSize': subSize,
                'sublineLines': subLines,
                'sublineWidth': subWidth,
                'sublineIndent': slot.left ? slot.indent : 0,
                'sublineTop': subBlockTop,
                'sublinePitch': subSize * _v4SubPitch,
                'headlineBottomPad': size * 0.06,
                'gap': slot.gap,
                'fontFamily': _v4Family(lang),
              }),
            );
            image.dispose();
          });
        }
        t.view.reset();
      });
    }
  }
}

// ── Tests ──────────────────────────────────────────────────────────────────

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final locales = _localesArg.split(',').where((s) => s.isNotEmpty).toList();
  final devices = _devicesArg.split(',').where((s) => s.isNotEmpty).toList();
  final only = _onlyArg.split(',').where((s) => s.isNotEmpty).toSet();

  late Directory docs;
  setUpAll(() async {
    await _loadFonts();
    if (_v4Text) await _loadV4Fonts(locales);
    await initializeDateFormatting();
  });

  setUp(() {
    docs = Directory.systemTemp.createTempSync('betaller_shots');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (call) async => docs.path,
    );
  });
  tearDown(() {
    try {
      docs.deleteSync(recursive: true);
    } catch (_) {}
  });

  if (_v4Text) {
    _textTestsV4(devices, locales);
    return;
  }
  const textOnly = bool.fromEnvironment('SHOT_TEXT_ONLY');
  if (_selftest) {
    // Positive and negative control for _truncatedText.
    testWidgets('selftest truncated-text detector', (t) async {
      t.view.physicalSize = const Size(400, 400);
      t.view.devicePixelRatio = 1;
      Future<List<Map<String, dynamic>>> run(double w, String text) async {
        await t.pumpWidget(Directionality(
          textDirection: TextDirection.ltr,
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: w,
              child: Text(text, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
        ));
        await t.pump();
        return _truncatedText(t, const Size(400, 400), 1);
      }

      final hit = await run(40, 'A long text that cannot fit into forty pixels');
      // ignore: avoid_print
      print('SELFTEST positive control found ${hit.length}: $hit');
      final miss = await run(300, 'short');
      // ignore: avoid_print
      print('SELFTEST negative control found ${miss.length}');
      t.view.reset();
      expect(hit.length, 1);
      expect(miss, isEmpty);
    });
    return;
  }
  _textTests(devices, locales);
  if (textOnly) return;

  for (final dn in devices) {
    final d = _devices[dn];
    if (d == null) continue;
    for (final lang in locales) {
      for (final shot in _shots) {
        if (only.isNotEmpty && !only.contains(shot.name)) continue;
        if (dn.startsWith('duo-') && !_duoShots.contains(shot.name)) continue;
        testWidgets('$dn $lang ${shot.name}', (t) async {
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final size = _tall ? Size(d.size.width, 3000) : d.size;
          t.view.physicalSize = size * d.dpr;
          t.view.devicePixelRatio = d.dpr;
          t.view.padding = FakeViewPadding(top: d.top * d.dpr, bottom: d.bottom * d.dpr);
          t.view.viewPadding = FakeViewPadding(top: d.top * d.dpr, bottom: d.bottom * d.dpr);
          // Animations collapse to their end state (the app honours this),
          // so every run captures the same frame.
          t.platformDispatcher.accessibilityFeaturesTestValue =
              const FakeAccessibilityFeatures(disableAnimations: true);

          final p = (await t.runAsync(() => _seed(lang)))!;
          // The app's MaterialApp builder does this; this harness has its own.
          Intl.defaultLocale = lang; // 'zh_Hant' as is; intl falls back to zh
          imageCache.maximumSizeBytes = 1 << 30;

          Future<void> build() async {
            final nav = GlobalKey<NavigatorState>();
            await t.pumpWidget(_app(p, lang, MainScreen(key: UniqueKey()), nav));
            final c = _Ctx(t, p, nav);
            await c.settle(2600);
            await shot.go(c, d);
            await c.settle(600);
          }

          // Pass one finds the images, pass two is the one captured.
          await build();
          final warmed = await _warmImages(t);
          await t.pumpWidget(const SizedBox());
          await t.pump(const Duration(seconds: 3));
          while (t.takeException() != null) {}
          await build();

          final truncated = _truncatedText(t, d.size, d.dpr);
          final errors = <String>[];
          Object? ex;
          while ((ex = t.takeException()) != null) {
            errors.add(ex.toString().split('\n').first);
          }
          final meta = <String, dynamic>{
            'shot': shot.name,
            'device': dn,
            'locale': lang,
            'dpr': d.dpr,
            'safeTop': d.top * d.dpr,
            'safeBottom': d.bottom * d.dpr,
            'focus': _focusRects(t, d, shot.focus),
            'truncated': truncated,
            'errors': errors,
            'imagesWarmed': warmed,
          };
          final dir = _tall ? 'raw-tall' : 'raw';
          await _capture(t, d, '$_out/$dir/$dn/$lang/${shot.name}.png', meta);

          // Tear down inside the test so no timer outlives it.
          await t.pumpWidget(const SizedBox());
          await t.pump(const Duration(seconds: 3));
          t.platformDispatcher.clearAccessibilityFeaturesTestValue();
          t.view.reset();
          debugDefaultTargetPlatformOverride = null;
          expect(errors, isEmpty, reason: errors.join('\n'));
        });
      }
    }
  }
}
