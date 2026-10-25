import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/models/user_profile.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/screens/profile_screen.dart';
import 'package:boyuzatma_app/utils/calculations.dart';

import 'onboarding_v2_test.dart'
    show loadInter, mockNotificationsChannel, onboardingApp, walkOnboarding;

/// A 15-year-old boy, so the genetic part still moves the estimate.
UserProfile _boy({
  bool fatherUnknown = false,
  bool motherUnknown = false,
  String ethnicity = '',
}) {
  final now = DateTime.now();
  return UserProfile(
    name: 'Kerem',
    gender: 'male',
    birthDate: DateTime(now.year - 15, 1, 1).toIso8601String().substring(0, 10),
    currentHeight: 165,
    weight: 55,
    fatherHeight: 185,
    motherHeight: 168,
    fatherHeightUnknown: fatherUnknown,
    motherHeightUnknown: motherUnknown,
    ethnicity: ethnicity,
  );
}

double _width(UserProfile p) {
  final r = Calculations.predictFinalHeight(p, const []);
  return r.maxHeight - r.minHeight;
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    mockNotificationsChannel();
  });

  group('potential when a parent height is unknown', () {
    test('both parents known: the mid-parental formula, unchanged', () {
      final p = _boy(ethnicity: 'asian');
      // (185 + 168 + 13) / 2, the background plays no part
      expect(Calculations.geneticPotentialHeight(p), 183.0);
      final girl = UserProfile(
        name: 'Ece',
        gender: 'female',
        birthDate: p.birthDate,
        currentHeight: 155,
        weight: 45,
        fatherHeight: 180,
        motherHeight: 165,
      );
      expect(Calculations.geneticPotentialHeight(girl), 166.0);
      expect(Calculations.unknownParents(p), 0);
      expect(Calculations.targetRangeCm(p), 8.5);
    });

    test('an unknown father is the male average for the background', () {
      // 175.5 - 4.5 = 171
      final p = _boy(fatherUnknown: true, ethnicity: 'asian');
      expect(Calculations.effectiveFatherHeight(p), 171.0);
      expect(Calculations.geneticPotentialHeight(p), (171 + 168 + 13) / 2);
      // and the stored 185 is ignored
      expect(Calculations.effectiveMotherHeight(p), 168.0);
    });

    test('an unknown mother is the female average for the background', () {
      // 162.0 - 0.5 = 161.5
      final p = _boy(motherUnknown: true, ethnicity: 'middle_eastern');
      expect(Calculations.effectiveMotherHeight(p), 161.5);
      expect(Calculations.geneticPotentialHeight(p), (185 + 161.5 + 13) / 2);
    });

    test('both unknown with no background: the global averages', () {
      final p = _boy(fatherUnknown: true, motherUnknown: true);
      expect(Calculations.geneticPotentialHeight(p), (175.5 + 162.0 + 13) / 2);
      for (final e in const {
        'white': (178.0, 164.0),
        'black': (176.0, 162.5),
        'hispanic': (173.0, 160.0),
        'no_answer': (175.5, 162.0),
        'something-new': (175.5, 162.0),
      }.entries) {
        expect(
          Calculations.averageParentHeight(father: true, ethnicity: e.key),
          e.value.$1,
        );
        expect(
          Calculations.averageParentHeight(father: false, ethnicity: e.key),
          e.value.$2,
        );
      }
    });

    test('the range widens with each unknown parent', () {
      final known = _width(_boy());
      final one = _width(_boy(fatherUnknown: true));
      final both = _width(_boy(fatherUnknown: true, motherUnknown: true));
      expect(one, greaterThan(known));
      expect(both, greaterThan(one));
      expect(Calculations.targetRangeCm(_boy(motherUnknown: true)), 12.0);
      expect(
        Calculations.targetRangeCm(
          _boy(fatherUnknown: true, motherUnknown: true),
        ),
        15.0,
      );
    });

    test('past 20 the genetic part no longer moves it, nor the range', () {
      UserProfile adult(bool unknown) => _boy(fatherUnknown: unknown).copyWith(
        birthDate: DateTime(
          DateTime.now().year - 24,
          1,
          1,
        ).toIso8601String().substring(0, 10),
      );
      expect(_width(adult(true)), _width(adult(false)));
    });

    test('profiles saved before the flags existed read as known', () {
      final json = _boy().toJson()
        ..remove('fatherHeightUnknown')
        ..remove('motherHeightUnknown');
      final p = UserProfile.fromJson(json);
      expect(p.fatherHeightUnknown, isFalse);
      expect(p.motherHeightUnknown, isFalse);
      final round = UserProfile.fromJson(_boy(motherUnknown: true).toJson());
      expect(round.motherHeightUnknown, isTrue);
      expect(round.fatherHeightUnknown, isFalse);
    });
  });

  group('the onboarding', () {
    Future<void> settle(WidgetTester t) async {
      for (var i = 0; i < 4; i++) {
        await t.pump(const Duration(milliseconds: 150));
      }
    }

    testWidgets('both parents known: the background page is skipped both '
        'ways', (t) async {
      t.view.physicalSize = const Size(375, 667);
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.reset);
      await loadInter();
      final l = lookupAppLocalizations(const Locale('en'));
      final p = AppProvider();
      await t.pumpWidget(onboardingApp(p, 'en'));
      final pages = <String>[];
      await walkOnboarding(
        t,
        l,
        onPage: (name) async {
          pages.add(name);
          if (name == 'footSize') {
            // Straight from the parents to the feet...
            expect(find.text(l.whatsYourEthnicity).hitTestable(), findsNothing);
            expect(find.text(l.footSizeLabel).hitTestable(), findsOneWidget);
            // ...and back the same way.
            await t.tap(find.byIcon(CupertinoIcons.arrow_left));
            await settle(t);
            expect(find.text(l.parentsHeight).hitTestable(), findsOneWidget);
            await t.tap(find.text(l.continueBtn).last);
            await settle(t);
            expect(find.text(l.footSizeLabel).hitTestable(), findsOneWidget);
          }
        },
      );
      expect(pages, isNot(contains('ethnicity')));
      expect(p.profile!.ethnicity, '');
      expect(p.profile!.fatherHeightUnknown, isFalse);
      expect(p.profile!.motherHeightUnknown, isFalse);
      await t.pumpWidget(const SizedBox());
      for (var i = 0; i < 10; i++) {
        await t.pump(const Duration(seconds: 1));
      }
    });

    for (final size in const [Size(375, 667), Size(440, 956)]) {
      testWidgets('father unknown at ${size.width.toInt()}: the background is '
          'asked, the average used, the result says so', (t) async {
        t.view.physicalSize = size;
        t.view.devicePixelRatio = 1;
        addTearDown(t.view.reset);
        await loadInter();
        final l = lookupAppLocalizations(const Locale('de'));
        final p = AppProvider();
        final errors = <FlutterErrorDetails>[];
        final previous = FlutterError.onError;
        FlutterError.onError = errors.add;
        try {
          await t.pumpWidget(onboardingApp(p, 'de'));
          await walkOnboarding(
            t,
            l,
            unknownParents: {'father'},
            ethnicity: l.asian,
            onPage: (name) async {
              if (name == 'parents_answered') {
                expect(find.text(l.obParentUnknownHint), findsOneWidget);
                // The father's wheels are dimmed, the mother's are not.
                final fades = t
                    .widgetList<AnimatedOpacity>(
                      find.descendant(
                        of: find.byType(Row),
                        matching: find.byType(AnimatedOpacity),
                      ),
                    )
                    .map((w) => w.opacity)
                    .toList();
                expect(fades, containsAll([0.3, 1.0]));
              }
              if (name == 'ethnicity') {
                expect(find.text(l.obEthnicityWhy), findsOneWidget);
              }
            },
          );
          expect(errors, isEmpty, reason: errors.join('\n'));
        } finally {
          FlutterError.onError = previous;
        }
        final profile = p.profile!;
        expect(profile.fatherHeightUnknown, isTrue);
        expect(profile.motherHeightUnknown, isFalse);
        expect(profile.ethnicity, 'asian');
        // The average for an Asian man stands in for him.
        expect(profile.fatherHeight, 171.0);
        expect(
          find.byKey(const ValueKey('result-no-parents-note')),
          findsOneWidget,
        );
        expect(find.text(l.resultNoParentNote), findsOneWidget);
        expect(find.text(l.resultFootnoteEstimated), findsOneWidget);

        await t.pumpWidget(const SizedBox());
        for (var i = 0; i < 10; i++) {
          await t.pump(const Duration(seconds: 1));
        }
      });
    }

    testWidgets('touching the dimmed wheels gives the parent back', (t) async {
      t.view.physicalSize = const Size(440, 956);
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.reset);
      await loadInter();
      final l = lookupAppLocalizations(const Locale('en'));
      final p = AppProvider();
      await t.pumpWidget(onboardingApp(p, 'en'));
      await walkOnboarding(
        t,
        l,
        unknownParents: {'mother'},
        onPage: (name) async {
          if (name == 'parents_answered') {
            final wake = find.byKey(
              const ValueKey('parent-wheels-wake-mother'),
            );
            expect(wake, findsOneWidget);
            await t.tap(wake);
            await settle(t);
            expect(wake, findsNothing);
            expect(find.text(l.obParentUnknownHint), findsNothing);
            // and "I don't know" again, so the walk goes on as planned.
            await t.tap(find.byKey(const ValueKey('parent-unknown-mother')));
            await settle(t);
            expect(wake, findsOneWidget);
          }
        },
      );
      expect(p.profile!.motherHeightUnknown, isTrue);
      expect(p.profile!.motherHeight, 162.0);
      expect(p.profile!.ethnicity, 'no_answer');
      await t.pumpWidget(const SizedBox());
      for (var i = 0; i < 10; i++) {
        await t.pump(const Duration(seconds: 1));
      }
    });
  });

  testWidgets('the profile lets a parent left unknown be filled in', (t) async {
    t.view.physicalSize = const Size(440, 956);
    t.view.devicePixelRatio = 1;
    addTearDown(t.view.reset);
    await loadInter();
    final l = lookupAppLocalizations(const Locale('en'));
    final p = AppProvider();
    p.setUseImperial(false);
    p.setProfile(
      _boy(fatherUnknown: true, ethnicity: 'white').copyWith(fatherHeight: 178),
    );
    await t.pumpWidget(
      ChangeNotifierProvider.value(
        value: p,
        child: MaterialApp(
          theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Inter'),
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(body: ProfileScreen()),
        ),
      ),
    );
    await t.pump(const Duration(milliseconds: 500));
    final edit = find.text(l.editProfile);
    await t.scrollUntilVisible(
      edit,
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await t.tap(edit);
    for (var i = 0; i < 6; i++) {
      await t.pump(const Duration(milliseconds: 150));
    }

    final fatherSwitch = find.byKey(
      const ValueKey('profile-parent-unknown-father'),
    );
    expect(fatherSwitch, findsOneWidget);
    // The estimate is not shown as the father's height.
    final dadField = find.widgetWithText(TextField, '${l.dadLabel} (cm)');
    expect(t.widget<TextField>(dadField).controller!.text, isEmpty);

    // Off, and the real height typed in.
    await t.ensureVisible(fatherSwitch);
    await t.pump();
    await t.tap(fatherSwitch);
    await t.pump(const Duration(milliseconds: 300));
    await t.enterText(dadField, '181');
    await t.pump();
    final save = find.text(l.save);
    await t.ensureVisible(save);
    await t.pump();
    await t.tap(save);
    await t.pump(const Duration(milliseconds: 600));

    expect(p.profile!.fatherHeightUnknown, isFalse);
    expect(p.profile!.fatherHeight, 181.0);
    expect(p.profile!.motherHeightUnknown, isFalse);
    expect(
      Calculations.geneticPotentialHeight(p.profile!),
      (181 + 168 + 13) / 2,
    );
    await t.pumpWidget(const SizedBox());
    for (var i = 0; i < 5; i++) {
      await t.pump(const Duration(seconds: 1));
    }
  });
}
