import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/models/user_profile.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';
import 'package:boyuzatma_app/utils/calculations.dart';
import 'package:boyuzatma_app/utils/height_reference.dart';

UserProfile _profile({
  required String gender,
  required String birthDate,
  required double height,
}) =>
    UserProfile(
      name: 'Test',
      gender: gender,
      birthDate: birthDate,
      currentHeight: height,
      weight: 60,
      fatherHeight: 178,
      motherHeight: 164,
    );

void main() {
  group('CDC 2000 stature-for-age', () {
    test('medians at 186 months match the CDC tables', () {
      expect(HeightReference.getMean(15, true, ageMonths: 186),
          closeTo(171.9, 0.2));
      expect(HeightReference.getMean(15, false, ageMonths: 186),
          closeTo(162.2, 0.2));
    });

    test('a whole age reads the middle of that year', () {
      expect(HeightReference.monthsForAge(15), 186);
      expect(HeightReference.getMean(15, true),
          HeightReference.getMean(15, true, ageMonths: 186));
    });

    test('the CSV row values come back exactly at a row age', () {
      // statage.csv, Sex 1, Agemos 186.5: M 172.1562865, P90 181.6236202.
      expect(HeightReference.getMean(15, true, ageMonths: 186.5),
          closeTo(172.156, 0.001));
      expect(HeightReference.heightAtPercentile(90, 186.5, true),
          closeTo(181.624, 0.02));
      // Sex 2, Agemos 186.5: P10 154.0082162.
      expect(HeightReference.heightAtPercentile(10, 186.5, false),
          closeTo(154.008, 0.02));
    });

    test('the median is the 50th percentile', () {
      for (final isMale in [true, false]) {
        for (var m = 24.0; m <= 240; m += 7) {
          final median = HeightReference.getMean(0, isMale, ageMonths: m);
          final p = HeightReference.percentile(
              heightCm: median, age: 0, isMale: isMale, ageMonths: m);
          expect(p, closeTo(50, 1), reason: 'month $m');
        }
      }
    });

    test('percentiles rise with height, and z round-trips', () {
      for (final isMale in [true, false]) {
        for (final months in [30.0, 120.0, 168.0, 186.0, 216.0, 240.0]) {
          var last = -1.0;
          for (var h = 80.0; h <= 210; h += 0.5) {
            final p = HeightReference.percentile(
                heightCm: h, age: 0, isMale: isMale, ageMonths: months);
            expect(p, greaterThanOrEqualTo(last));
            last = p;
          }
          for (final z in [-2.0, -1.0, 0.0, 1.0, 2.0]) {
            final h = HeightReference.heightAtZ(z, months, isMale);
            expect(HeightReference.zScore(h, months, isMale), closeTo(z, 1e-6));
          }
          final refs = HeightReference.referenceHeights(0, isMale,
              ageMonths: months);
          expect(refs['p5']! < refs['p25']!, isTrue);
          expect(refs['p25']! < refs['p50']!, isTrue);
          expect(refs['p50']! < refs['p75']!, isTrue);
          expect(refs['p75']! < refs['p95']!, isTrue);
        }
      }
    });

    test('adults use the 240 month row', () {
      expect(HeightReference.getMean(25, true), closeTo(176.85, 0.01));
      expect(HeightReference.getMean(40, false), closeTo(163.34, 0.01));
      expect(HeightReference.getMean(20, true, ageMonths: 400),
          HeightReference.getMean(30, true));
    });

    test('an average US 15-year-old is near the middle, not the top', () {
      // 15y 6m boy at the CDC median.
      expect(
        Calculations.calculatePercentile(172, 15, 'male', ageMonths: 186),
        inInclusiveRange(48, 53),
      );
      expect(
        Calculations.calculatePercentile(162, 15, 'female', ageMonths: 186),
        inInclusiveRange(45, 52),
      );
    });

    test('exact age in months from the birth date', () {
      final now = DateTime(2026, 10, 25);
      expect(
        HeightReference.ageMonthsFromBirthDate('2011-04-25', now: now),
        closeTo(186, 0.1),
      );
    });
  });

  group('one percentile everywhere', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    for (final (gender, height) in [
      ('male', 172.0),
      ('male', 158.0),
      ('female', 162.0),
      ('female', 171.0),
    ]) {
      test('onboarding and the app agree: $gender $height cm', () async {
        final now = DateTime.now();
        final birth = DateTime(now.year - 15, now.month, 1)
            .toIso8601String()
            .substring(0, 10);
        final profile =
            _profile(gender: gender, birthDate: birth, height: height);

        final p = AppProvider();
        await p.loadData();
        p.setProfile(profile);

        // Onboarding's result chip shows p.peerPercentile; the leaderboard
        // hero computes it from HeightReference at the same exact age.
        final onboarding = Calculations.calculatePercentile(
          height,
          profile.age,
          gender,
          ageMonths: profile.ageInMonths,
        );
        final hero = HeightReference.percentile(
          heightCm: height,
          age: profile.age,
          isMale: gender == 'male',
          ageMonths: profile.ageInMonths,
        ).round().clamp(1, 99);

        expect(p.peerPercentile, onboarding);
        expect(hero, onboarding);
      });
    }
  });
}
