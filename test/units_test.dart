// Display units: half-inch heights, fl oz water, stones, region defaults and
// the migration from the old single useImperial flag.
//
// Everything is stored metric (cm, kg, litres); these tests pin what a user
// in each region reads and that an upgrading user keeps the unit they had.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/utils/units.dart';
import 'package:boyuzatma_app/widgets/measure_fields.dart';
import 'package:boyuzatma_app/widgets/water_sheet.dart';

import 'onboarding_v2_test.dart' show loadInter;

const _us = UnitPrefs(HeightUnit.ftIn, WeightUnit.lb, VolumeUnit.flOz);
const _uk = UnitPrefs(HeightUnit.ftIn, WeightUnit.stLb, VolumeUnit.ml);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Every provider here starts from a known region, not the test host's.
  setUp(() => AppProvider.debugCountryOverride = 'US');
  tearDown(() {
    AppProvider.debugCountryOverride = null;
    UnitPrefs.current = UnitPrefs.metric;
  });

  group('height in ft-in', () {
    test('shows half inches, so growth under an inch is visible', () {
      expect(_us.formatHeight(172.72), "5'8\""); // 68.0 in
      expect(_us.formatHeight(174.0), "5'8½\""); // 68.5 in
      expect(_us.formatHeight(173.4), "5'8½\""); // 68.27 in
      expect(_us.formatHeight(172.9), "5'8\""); // 68.07 in
      expect(_us.formatHeight(175.26), "5'9\""); // 69.0 in
    });

    test('carries a rounded-up 12 inches into the next foot', () {
      expect(_us.formatHeight(182.6), "6'0\""); // 71.89 in
      expect(_us.formatHeightCompact(182.0), "6'0\""); // 71.65 in
      expect(_us.formatHeight(152.4), "5'0\"");
      expect(_us.formatHeight(153.67), "5'0½\"");
    });

    test('compact and axis labels keep whole inches', () {
      expect(_us.formatHeightCompact(174.0), "5'9\"");
      expect(_us.formatHeightAxis(170.0), "5'7\"");
      expect(UnitPrefs.metric.formatHeightAxis(170.4), '170');
      expect(UnitPrefs.metric.formatHeightCompact(170.6), '171 cm');
    });

    test('metric keeps one decimal of cm', () {
      expect(UnitPrefs.metric.formatHeight(173.4), '173.4 cm');
    });

    test('growth amounts read in inches with one decimal', () {
      expect(_us.formatHeightAmount(6.1), '2.4 in');
      expect(_us.formatHeightAmount(1.27, signed: true), '+0.5 in');
      expect(UnitPrefs.metric.formatHeightAmount(2.5, signed: true), '+2.5 cm');
    });

    test('AppProvider.formatHeight follows the height setting', () async {
      SharedPreferences.setMockInitialValues({});
      final p = AppProvider();
      await p.loadData();
      p.setHeightUnit(HeightUnit.ftIn);
      expect(p.formatHeight(174.0), "5'8½\"");
      expect(p.useImperial, isTrue);
      p.setHeightUnit(HeightUnit.cm);
      expect(p.formatHeight(174.0), '174.0 cm');
      expect(p.useImperial, isFalse);
    });
  });

  group('water in fl oz', () {
    test('converts litres and ounces both ways', () {
      expect(UnitPrefs.litresToFlOz(1), closeTo(33.814, 0.001));
      expect(UnitPrefs.flOzToLitres(8), closeTo(0.236588, 0.000001));
      expect(UnitPrefs.flOzToLitres(UnitPrefs.litresToFlOz(2.5)),
          closeTo(2.5, 1e-9));
    });

    test('logged amounts round to whole ounces', () {
      expect(UnitPrefs.flOzRounded(1.2), 41); // 40.58
      expect(_us.formatWater(1.2), '41 fl oz');
      expect(_us.waterValue(0.237), '8');
    });

    test('targets round to the nearest 4 oz', () {
      expect(UnitPrefs.flOzTarget(2.5), 84); // 84.5
      expect(UnitPrefs.flOzTarget(2.6), 88); // 87.9
      expect(UnitPrefs.flOzTarget(2.0), 68); // 67.6
      expect(_us.formatWaterTarget(2.5), '84 fl oz');
      expect(_us.waterProgress(1.2, 2.5), '41/84 fl oz');
    });

    test('the goal is the number on screen, back in litres', () {
      expect(_us.snapWaterTarget(2.5), closeTo(84 * 0.0295735, 1e-9));
      expect(UnitPrefs.metric.snapWaterTarget(2.5), 2.5);
    });

    test('quick amounts are 8, 12, 16 and 32 fl oz', () {
      expect(
        [for (final l in _us.waterQuickAmounts) _us.waterValue(l)],
        ['8', '12', '16', '32'],
      );
      expect(UnitPrefs.metric.waterQuickAmounts, [0.2, 0.3, 0.5, 1.0]);
      expect(UnitPrefs.metric.formatWater(1.2), '1.2 L');
    });

    test('logging fl oz cups reaches the goal shown on screen', () async {
      SharedPreferences.setMockInitialValues({});
      final p = AppProvider();
      await p.loadData();
      p.setVolumeUnit(VolumeUnit.flOz);
      // No profile: the 2.5 L fallback goal, shown as 84 fl oz.
      expect(p.formatWaterTarget(p.waterGoal), '84 fl oz');
      for (final oz in [32, 32, 12, 8]) {
        p.addWater(UnitPrefs.flOzToLitres(oz.toDouble()));
      }
      expect(p.formatWater(p.todayWater), '84 fl oz');
      expect(p.todayWater, greaterThanOrEqualTo(p.waterGoal - 0.003));
    });
  });

  group('weight', () {
    test('stones and pounds round to the pound', () {
      expect(UnitPrefs.stonesPounds(52.4), '8 st 4 lb'); // 115.5 lb
      expect(UnitPrefs.stonesPounds(63.5), '10 st 0 lb'); // 140.0 lb
      expect(_uk.formatWeight(70), '11 st 0 lb'); // 154.3 lb
    });

    test('pounds and kilograms keep one decimal', () {
      expect(_us.formatWeight(52.4), '115.5 lb');
      expect(UnitPrefs.metric.formatWeight(52.4), '52.4 kg');
    });
  });

  group('defaults by region', () {
    test('US reads ft-in, lb and fl oz', () {
      final u = UnitPrefs.forRegion('US');
      expect([u.height, u.weight, u.volume],
          [HeightUnit.ftIn, WeightUnit.lb, VolumeUnit.flOz]);
    });

    test('Canada reads ft-in and lb but ml', () {
      final u = UnitPrefs.forRegion('CA');
      expect([u.height, u.weight, u.volume],
          [HeightUnit.ftIn, WeightUnit.lb, VolumeUnit.ml]);
    });

    test('the UK and Ireland read ft-in, stones and ml', () {
      for (final c in ['GB', 'IE']) {
        final u = UnitPrefs.forRegion(c);
        expect([u.height, u.weight, u.volume],
            [HeightUnit.ftIn, WeightUnit.stLb, VolumeUnit.ml]);
      }
    });

    test('Germany, Turkey and an unknown region are metric', () {
      for (final c in ['DE', 'TR', null]) {
        final u = UnitPrefs.forRegion(c);
        expect([u.height, u.weight, u.volume],
            [HeightUnit.cm, WeightUnit.kg, VolumeUnit.ml]);
      }
    });

    test('a fresh install takes the device region', () async {
      AppProvider.debugCountryOverride = 'GB';
      SharedPreferences.setMockInitialValues({});
      final p = AppProvider();
      await p.loadData();
      expect(p.units.weight, WeightUnit.stLb);
      expect(p.formatWeight(63.5), '10 st 0 lb');
      expect(p.units.volume, VolumeUnit.ml);
    });
  });

  group('migration from the single useImperial flag', () {
    test('imperial maps to ft-in and lb, fl oz only in the US', () {
      final us = UnitPrefs.fromLegacy(true, 'US');
      expect([us.height, us.weight, us.volume],
          [HeightUnit.ftIn, WeightUnit.lb, VolumeUnit.flOz]);
      final ca = UnitPrefs.fromLegacy(true, 'CA');
      expect([ca.height, ca.weight, ca.volume],
          [HeightUnit.ftIn, WeightUnit.lb, VolumeUnit.ml]);
      final gb = UnitPrefs.fromLegacy(true, 'GB');
      expect(gb.weight, WeightUnit.lb);
    });

    test('metric stays metric, even in the US', () {
      final u = UnitPrefs.fromLegacy(false, 'US');
      expect([u.height, u.weight, u.volume],
          [HeightUnit.cm, WeightUnit.kg, VolumeUnit.ml]);
    });

    Future<AppProvider> load(Map<String, dynamic> blob, String country) async {
      AppProvider.debugCountryOverride = country;
      SharedPreferences.setMockInitialValues({
        'glowup_app_data': jsonEncode(blob),
      });
      final p = AppProvider();
      await p.loadData();
      return p;
    }

    test('an old US save with useImperial true gets fl oz', () async {
      final p = await load({'useImperial': true}, 'US');
      expect(p.units.height, HeightUnit.ftIn);
      expect(p.units.weight, WeightUnit.lb);
      expect(p.units.volume, VolumeUnit.flOz);
    });

    test('an old UK save with useImperial false stays metric', () async {
      final p = await load({'useImperial': false}, 'GB');
      expect(p.units.height, HeightUnit.cm);
      expect(p.units.weight, WeightUnit.kg);
      expect(p.useImperial, isFalse);
    });

    test('the three settings survive a save and reload', () async {
      AppProvider.debugCountryOverride = 'DE';
      SharedPreferences.setMockInitialValues({});
      final p = AppProvider();
      await p.loadData();
      p.setHeightUnit(HeightUnit.ftIn);
      p.setWeightUnit(WeightUnit.stLb);
      p.setVolumeUnit(VolumeUnit.flOz);
      await Future<void>.delayed(Duration.zero);

      final prefs = await SharedPreferences.getInstance();
      final saved = jsonDecode(prefs.getString('glowup_app_data')!) as Map;
      expect(saved['heightUnitPref'], 'ftIn');
      expect(saved['weightUnitPref'], 'stLb');
      expect(saved['volumeUnitPref'], 'flOz');
      // Kept for an older build reading the same save.
      expect(saved['useImperial'], isTrue);

      final again = AppProvider();
      await again.loadData();
      expect(again.units.weight, WeightUnit.stLb);
      expect(again.units.volume, VolumeUnit.flOz);
    });

    test('the onboarding toggle keeps a UK user in stones', () async {
      final p = await load({}, 'GB');
      p.setUseImperial(true);
      expect(p.units.weight, WeightUnit.stLb);
      p.setUseImperial(false);
      expect([p.units.height, p.units.weight, p.units.volume],
          [HeightUnit.cm, WeightUnit.kg, VolumeUnit.ml]);
    });
  });

  group('ft + in and st + lb fields', () {
    test('an untouched field gives back the exact stored value', () {
      final f = MeasureFields.height(_us, 173.4);
      expect(f.controllers.map((c) => c.text), ['5', '8.3']);
      expect(f.value, 173.4);
      f.dispose();
    });

    test('typed feet and inches become cm', () {
      final f = MeasureFields.height(_us, 173.4);
      f.controllers[1].text = '8.5';
      expect(f.value, closeTo(68.5 * 2.54, 1e-9));
      f.controllers[1].text = '';
      expect(f.value, closeTo(60 * 2.54, 1e-9));
      f.controllers[0].text = 'x';
      expect(f.value, isNull);
      f.dispose();
    });

    test('stones and pounds become kg', () {
      final f = MeasureFields.weight(_uk, 63.5);
      expect(f.suffixes, ['st', 'lb']);
      f.controllers[0].text = '9';
      f.controllers[1].text = '7';
      expect(f.value, closeTo(133 / UnitPrefs.lbPerKg, 1e-9));
      f.dispose();
    });

    test('metric is one field', () {
      final f = MeasureFields.height(UnitPrefs.metric, 173.4);
      expect(f.split, isFalse);
      expect(f.controllers.single.text, '173.4');
      f.controllers.single.text = '174,2';
      expect(f.value, closeTo(174.2, 1e-9));
      f.dispose();
    });
  });

  group('water sheet in fl oz', () {
    setUpAll(loadInter);

    for (final size in const [Size(320, 568), Size(375, 667)]) {
      for (final lang in const ['en', 'de', 'hi']) {
        testWidgets('fits ${size.width.toInt()} wide in $lang', (tester) async {
          tester.view.physicalSize = size;
          tester.view.devicePixelRatio = 1;
          addTearDown(tester.view.reset);
          SharedPreferences.setMockInitialValues({});
          final p = AppProvider();
          await p.loadData();
          p.setVolumeUnit(VolumeUnit.flOz);
          p.addWater(UnitPrefs.flOzToLitres(12));

          await tester.pumpWidget(
            ChangeNotifierProvider.value(
              value: p,
              child: MaterialApp(
                locale: Locale(lang),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                theme: ThemeData(fontFamily: 'Inter'),
                home: Builder(
                  builder: (c) => Scaffold(
                    body: Center(
                      child: TextButton(
                        onPressed: () => showWaterSheet(c, p, 2.5),
                        child: const Text('open'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
          await tester.tap(find.text('open'));
          await tester.pump(const Duration(milliseconds: 600));

          expect(tester.takeException(), isNull);
          expect(find.text('12'), findsOneWidget);
          expect(find.text('/ 84 fl oz'), findsOneWidget);
          expect(find.text('+32 fl oz', findRichText: true), findsOneWidget);
          expect(find.textContaining('72 fl oz'), findsOneWidget);
        });
      }
    }
  });
}
