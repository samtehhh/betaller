import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/models/user_profile.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';

import 'package:boyuzatma_app/models/height_record.dart';
import 'package:boyuzatma_app/utils/betaller_score.dart';
import 'package:boyuzatma_app/utils/daily_plan.dart';
import 'package:boyuzatma_app/utils/daily_targets.dart';

/// A Wednesday, so the window holds both a rest day and training days.
final _now = DateTime(2026, 10, 14, 18);
String _k(int back) => BetallerScore.key(_now.subtract(Duration(days: back)));

const _training = {'squats', 'jumping', 'morning_stretch', 'cobra_stretch'};
const _nutrition = {'protein', 'calcium_vitamin_d', 'zinc_intake'};

ScoreInputs _inputs({
  DateTime? created,
  int age = 15,
  double latest = 165,
  double potential = 173,
  List<HeightRecord> records = const [],
  Map<String, List<String>> history = const {},
  List<String> today = const [],
  int streak = 0,
  Map<String, double> sleep = const {},
  Map<String, double> water = const {},
  List<Map<String, dynamic>> posture = const [],
}) => ScoreInputs(
  now: _now,
  accountCreated: created ?? _now.subtract(const Duration(days: 60)),
  age: age,
  gender: 'male',
  latestHeight: latest,
  potentialHeight: potential,
  records: records,
  routineHistory: history,
  completedToday: today,
  trainingIds: _training,
  nutritionIds: _nutrition,
  weeklyPlan: WeeklyPlan.forAnswers(weeklyWorkout: '3-5', age: age),
  streak: streak,
  sleepLog: sleep,
  waterLog: water,
  sleepTarget: 9,
  waterTarget: 2.0,
  postureChecks: posture,
);

void main() {
  test('weights add up to 100', () {
    expect(kScoreWeights.values.reduce((a, b) => a + b), 100);
  });

  test('a brand-new account has no total, not a made-up one', () {
    final s = BetallerScore.compute(
      _inputs(
        created: _now,
        records: [HeightRecord(date: _k(0), height: 165)],
      ),
    );
    // Only measuring and headroom have data: far below the coverage bar.
    expect(s.total, isNull);
    expect(s.factor(ScoreFactor.training).hasData, isFalse);
    expect(s.factor(ScoreFactor.sleep).hasData, isFalse);
    expect(s.factor(ScoreFactor.measuring).score, 100);
  });

  test('missing signals are left out of the total, not counted as zero', () {
    final s = BetallerScore.compute(
      _inputs(
        sleep: {_k(0): 9, _k(1): 9},
        water: {_k(0): 2, _k(1): 2},
        history: {
          for (var b = 1; b <= 6; b++) _k(b): ['squats', 'protein'],
        },
        streak: 14,
        records: [HeightRecord(date: _k(2), height: 165)],
      ),
    );
    expect(s.factor(ScoreFactor.posture).hasData, isFalse);
    expect(s.factor(ScoreFactor.growth).hasData, isFalse);
    // Sleep and water on target, training every planned day.
    expect(s.factor(ScoreFactor.sleep).score, 100);
    expect(s.factor(ScoreFactor.hydration).score, 100);
    expect(s.factor(ScoreFactor.training).score, 100);
    expect(s.total, greaterThanOrEqualTo(80));
  });

  test('training counts trained days against the plan, today only adds', () {
    // Six past days, none trained: today in progress is not a missed day.
    final none = BetallerScore.compute(_inputs());
    final t = none.factor(ScoreFactor.training);
    expect(t.score, 0);
    expect(t.facts['done'], 0);
    // 3-5 a week: Sunday is the plan's rest day, so 5 of the 6 past days.
    expect(t.facts['planned'], 5);

    final some = BetallerScore.compute(
      _inputs(
        history: {
          _k(1): ['squats'],
          _k(2): ['jumping'],
        },
        today: ['morning_stretch'],
      ),
    );
    final f = some.factor(ScoreFactor.training);
    expect(f.facts['done'], 3);
    expect(f.facts['planned'], 6);
    expect(f.score, 50);
  });

  test('days before the account existed are not held against anyone', () {
    final s = BetallerScore.compute(
      _inputs(
        created: _now.subtract(const Duration(days: 1)),
        history: {
          _k(1): ['squats'],
        },
      ),
    );
    final f = s.factor(ScoreFactor.training);
    expect(f.facts['planned'], 1);
    expect(f.score, 100);
  });

  test('sleep and water average the logged days of the last week', () {
    final s = BetallerScore.compute(
      _inputs(
        sleep: {_k(0): 6, _k(1): 9, _k(10): 2},
        water: {_k(0): 1, _k(3): 2},
      ),
    );
    final sleep = s.factor(ScoreFactor.sleep);
    expect(sleep.facts['days'], 2); // the 10-days-ago night is outside
    expect(sleep.facts['avg'], 7.5);
    expect(sleep.score, (7.5 / 9 * 100).round());
    expect(s.factor(ScoreFactor.hydration).score, 75);
  });

  test('consistency mixes the streak with active days', () {
    final plan = dailyPlanIds(_now.subtract(const Duration(days: 1)));
    final s = BetallerScore.compute(
      _inputs(
        streak: 7,
        history: {
          _k(1): plan,
          _k(2): dailyPlanIds(_now.subtract(const Duration(days: 2))),
        },
      ),
    );
    final c = s.factor(ScoreFactor.consistency);
    expect(c.facts['active'], 2);
    expect(c.facts['days'], 6);
    expect(c.score, (50 * 7 / 14 + 50 * 2 / 6).round());
  });

  test('nutrition counts planned habits that were done', () {
    final s = BetallerScore.compute(
      _inputs(
        history: {
          for (var b = 1; b <= 6; b++) _k(b): ['protein'],
        },
      ),
    );
    final n = s.factor(ScoreFactor.nutrition);
    expect(n.facts['done'], 6);
    // The day's habits now come from the weekly plan, where protein is the
    // nutrition habit every day: six days done out of six planned.
    expect(n.facts['planned'], greaterThanOrEqualTo(6));
    expect(n.score, isNotNull);
  });

  test('posture uses the latest self-check, stretched to 0-100', () {
    final s = BetallerScore.compute(
      _inputs(
        posture: [
          {'date': _k(40), 'totalScore': 40},
          {'date': _k(3), 'totalScore': 90},
        ],
      ),
    );
    final p = s.factor(ScoreFactor.posture);
    expect(p.score, 100);
    expect(p.facts['daysAgo'], 3);
  });

  test('measuring steps down as the last measurement ages', () {
    int at(int back) => BetallerScore.compute(
      _inputs(records: [HeightRecord(date: _k(back), height: 165)]),
    ).factor(ScoreFactor.measuring).score!;
    expect(at(0), 100);
    expect(at(7), 100);
    expect(at(10), 70);
    expect(at(20), 40);
    expect(at(45), 15);
  });

  test('growth speed needs two measurements a month apart', () {
    final one = BetallerScore.compute(
      _inputs(records: [HeightRecord(date: _k(10), height: 165)]),
    ).factor(ScoreFactor.growth);
    expect(one.hasData, isFalse);
    expect(one.facts['wait'], 20);

    final two = BetallerScore.compute(
      _inputs(
        records: [
          HeightRecord(date: _k(365), height: 159),
          HeightRecord(date: _k(0), height: 165),
        ],
      ),
    ).factor(ScoreFactor.growth);
    // 6 cm in a year at 15, against a typical 6 cm.
    expect(two.score, 100);
  });

  test('growth speed is not counted for adults', () {
    final s = BetallerScore.compute(_inputs(age: 23));
    final g = s.factor(ScoreFactor.growth);
    expect(g.counted, isFalse);
    expect(s.signalsCounted, 8);
  });

  test('headroom compares what is left to what is realistic at that age', () {
    expect(
      BetallerScore.compute(
        _inputs(latest: 165, potential: 169),
      ).factor(ScoreFactor.headroom).score,
      50,
    );
    expect(
      BetallerScore.compute(
        _inputs(age: 25, latest: 180, potential: 180.5),
      ).factor(ScoreFactor.headroom).score,
      20,
    );
  });

  test('tiers and the next tier', () {
    expect(BetallerScore.tierFor(10), ScoreTier.starting);
    expect(BetallerScore.tierFor(40), ScoreTier.building);
    expect(BetallerScore.tierFor(60), ScoreTier.rising);
    expect(BetallerScore.tierFor(80), ScoreTier.strong);
    expect(BetallerScore.tierFor(95), ScoreTier.peak);
    expect(BetallerScore.nextTierAt(55), 60);
    expect(BetallerScore.nextTierAt(92), isNull);
  });

  test('the fastest win is the biggest weighted gap', () {
    final s = BetallerScore.compute(
      _inputs(
        sleep: {_k(0): 4.0}, // 44, weight 15: gap 8.4
        water: {_k(0): 1.8}, // 90, weight 10: gap 1
        history: {
          for (var b = 1; b <= 6; b++) _k(b): ['squats', 'protein'],
        },
        streak: 14,
      ),
    );
    expect(s.fastestWin?.factor, ScoreFactor.sleep);
  });

  test('same inputs, same score: no randomness', () {
    final a = BetallerScore.compute(_inputs(sleep: {_k(0): 8}, streak: 3));
    final b = BetallerScore.compute(_inputs(sleep: {_k(0): 8}, streak: 3));
    expect(a.total, b.total);
    expect(
      a.factors.map((f) => f.score).toList(),
      b.factors.map((f) => f.score).toList(),
    );
  });

  test('logs and the weekly snapshot survive a restart', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    final p = AppProvider();
    p.setProfile(
      UserProfile(
        name: 'A',
        gender: 'male',
        birthDate: '2011-03-01',
        currentHeight: 165,
        weight: 55,
        fatherHeight: 180,
        motherHeight: 166,
      ),
    );
    p.updateSleep(8.5);
    p.addWater(0.5);
    p.recordScoreSnapshot(64);
    await Future<void>.delayed(const Duration(milliseconds: 50));

    final q = AppProvider();
    await q.loadData();
    final today = BetallerScore.key(DateTime.now());
    expect(q.sleepLog[today], 8.5);
    expect(q.waterLog[today], 0.5);
    expect(q.scoreHistory[weekKey()], 64);
    expect(q.lastWeekScore, isNull);
    expect(q.betallerScore, isNotNull);
  });
}
