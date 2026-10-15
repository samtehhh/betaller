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
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/models/user_profile.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/screens/main_screen.dart';
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
  // iPad Pro 13" (M4): 1032x1376 pt @2x = 2064x2752.
  'ipad': _Device('ipad', Size(1032, 1376), 2, 24, 20),
  // iPhone Duo, the two displays of the foldable. The store slots are
  // 1398x2034 (outer) and 2007x2853 (inner); the screens are rendered at
  // those displays' own logical size so the layout is the app's, not a
  // stretched phone, and compose.py frames them below the headline.
  'duo-outer': _Device('duo-outer', Size(466, 678), 3, 44, 20),
  'duo-inner': _Device('duo-inner', Size(669, 951), 3, 24, 20),
};

/// Screens the duo sets use (compose.py's frame plan); the rest are skipped.
const _duoShots = {
  'home', 'progress', 'today', 'analysis', 'program', 'nutrition', 'photos',
  'posture',
};

// ── Fonts ──────────────────────────────────────────────────────────────────

const _fallback = ['SegoeEmoji', 'Nirmala', 'MaterialIcons'];

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
}

// ── Demo user ──────────────────────────────────────────────────────────────

String _day(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

/// A 15 year old, 164 cm, eight weeks into the app, premium on so every
/// screen shows what is inside rather than its lock.
Future<AppProvider> _seed(String lang) async {
  // It is a test, just not under test/.
  // ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});
  var p = AppProvider();
  await p.loadData();
  final now = DateTime.now();
  p.setLocale(Locale(lang));
  p.setUseImperial(false);
  p.savePastHeights({11: 141, 12: 147, 13: 153, 14: 159});
  p.setOnboardingAnswers({'weeklyWorkout': '3-5', 'dreamHeight': 182});
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
  await prefs.setString('glowup_app_data', jsonEncode(data));
  p = AppProvider();
  await p.loadData();
  p.setLocale(Locale(lang));
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
          fontFamilyFallback: _fallback,
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
        locale: Locale(lang),
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
          child: DefaultTextStyle.merge(
            style: const TextStyle(fontFamilyFallback: _fallback),
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
  }, focus: ['_JourneyHeader', '_LevelWeek']),
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
  _Shot('weekly', (c, d) async => c.push(const WeeklyReportScreen())),
  _Shot('profile', (c, d) async => c.tab(4)),
];

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
    final f = find.byWidgetPredicate((w) => w.runtimeType.toString() == n);
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
    final r = rects.first;
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


// ── Tests ──────────────────────────────────────────────────────────────────

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final locales = _localesArg.split(',').where((s) => s.isNotEmpty).toList();
  final devices = _devicesArg.split(',').where((s) => s.isNotEmpty).toList();
  final only = _onlyArg.split(',').where((s) => s.isNotEmpty).toSet();

  late Directory docs;
  setUpAll(() async {
    await _loadFonts();
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

  const textOnly = bool.fromEnvironment('SHOT_TEXT_ONLY');
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
