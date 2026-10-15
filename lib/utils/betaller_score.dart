import 'dart:math' as math;

import '../models/height_record.dart';
import 'calculations.dart';
import 'daily_plan.dart';
import 'daily_targets.dart';

/// The signals the BeTaller Score is built from. Every one is worked out from
/// data the app already holds; none is a guess.
enum ScoreFactor {
  training,
  consistency,
  sleep,
  hydration,
  nutrition,
  posture,
  measuring,
  growth,
  headroom,
}

/// How much each signal counts, out of 100. The habits the user controls
/// carry most of it; the parts set by genes and age carry little.
const Map<ScoreFactor, int> kScoreWeights = {
  ScoreFactor.training: 20,
  ScoreFactor.consistency: 15,
  ScoreFactor.sleep: 15,
  ScoreFactor.nutrition: 10,
  ScoreFactor.hydration: 10,
  ScoreFactor.posture: 10,
  ScoreFactor.growth: 10,
  ScoreFactor.measuring: 5,
  ScoreFactor.headroom: 5,
};

enum ScoreTier { starting, building, rising, strong, peak }

/// Below this share of the counted weight the total is not shown: two easy
/// signals alone would put a brand-new account at the top tier.
const double kMinScoreCoverage = 0.4;

/// One signal: its 0-100 value (null when there is not enough data yet), and
/// the numbers behind it so the screen can say what it is based on.
class FactorResult {
  final ScoreFactor factor;
  final int? score;

  /// False when the signal does not apply to this user at all, e.g. growth
  /// speed once growth plates have closed. Such a signal never counts.
  final bool counted;
  final Map<String, num> facts;

  const FactorResult(
    this.factor,
    this.score, {
    this.counted = true,
    this.facts = const {},
  });

  int get weight => kScoreWeights[factor]!;
  bool get hasData => score != null;
}

/// Everything the score needs, read from AppProvider. Kept as plain data so
/// the maths can be tested without a provider.
class ScoreInputs {
  final DateTime now;

  /// When the account was made: days before it are never held against anyone.
  final DateTime accountCreated;
  final int age;
  final String gender;
  final double latestHeight;
  final double potentialHeight;

  /// Sorted by date, oldest first.
  final List<HeightRecord> records;

  /// yyyy-MM-dd -> routine ids finished that day.
  final Map<String, List<String>> routineHistory;

  /// Ids finished today (also in [routineHistory] once anything is ticked).
  final List<String> completedToday;

  /// Routine ids that count as training (exercise and posture work).
  final Set<String> trainingIds;

  /// Nutrition habits, without water, which has its own signal.
  final Set<String> nutritionIds;

  /// The week the user trains to.
  final WeeklyPlan weeklyPlan;
  final int streak;

  /// yyyy-MM-dd -> hours slept / litres drunk.
  final Map<String, double> sleepLog;
  final Map<String, double> waterLog;
  final double sleepTarget;
  final double waterTarget;

  /// AppProvider.postureAnalyses: {date, totalScore, ...}.
  final List<Map<String, dynamic>> postureChecks;

  const ScoreInputs({
    required this.now,
    required this.accountCreated,
    required this.age,
    required this.gender,
    required this.latestHeight,
    required this.potentialHeight,
    required this.records,
    required this.routineHistory,
    required this.completedToday,
    required this.trainingIds,
    required this.nutritionIds,
    required this.weeklyPlan,
    required this.streak,
    required this.sleepLog,
    required this.waterLog,
    required this.sleepTarget,
    required this.waterTarget,
    required this.postureChecks,
  });
}

class BetallerScore {
  /// 0-100, or null while less than [kMinScoreCoverage] of the counted
  /// weight has data.
  final int? total;
  final List<FactorResult> factors;

  /// Share of the counted weight that has data, 0-1.
  final double coverage;

  const BetallerScore({
    required this.total,
    required this.factors,
    required this.coverage,
  });

  ScoreTier? get tier => total == null ? null : tierFor(total!);

  int get signalsWithData =>
      factors.where((f) => f.counted && f.hasData).length;
  int get signalsCounted => factors.where((f) => f.counted).length;

  FactorResult factor(ScoreFactor f) =>
      factors.firstWhere((r) => r.factor == f);

  /// The scored signal where effort moves the total most: the biggest
  /// weighted gap to 100.
  FactorResult? get fastestWin {
    FactorResult? best;
    var bestGap = 0.0;
    for (final f in factors) {
      if (!f.counted || f.score == null) continue;
      final gap = (100 - f.score!) * f.weight / 100;
      if (gap > bestGap) {
        bestGap = gap;
        best = f;
      }
    }
    return best;
  }

  static ScoreTier tierFor(int score) {
    if (score >= 90) return ScoreTier.peak;
    if (score >= 75) return ScoreTier.strong;
    if (score >= 60) return ScoreTier.rising;
    if (score >= 40) return ScoreTier.building;
    return ScoreTier.starting;
  }

  /// Lowest score of the tier above [score], or null at the top.
  static int? nextTierAt(int score) {
    for (final t in const [40, 60, 75, 90]) {
      if (score < t) return t;
    }
    return null;
  }

  static BetallerScore compute(ScoreInputs i) {
    final factors = <FactorResult>[
      _training(i),
      _consistency(i),
      _sleep(i),
      _hydration(i),
      _nutrition(i),
      _posture(i),
      _measuring(i),
      _growth(i),
      _headroom(i),
    ];

    var countedWeight = 0;
    var dataWeight = 0;
    var weighted = 0.0;
    for (final f in factors) {
      if (!f.counted) continue;
      countedWeight += f.weight;
      if (f.score == null) continue;
      dataWeight += f.weight;
      weighted += f.score! * f.weight;
    }
    final coverage = countedWeight == 0 ? 0.0 : dataWeight / countedWeight;
    final total = dataWeight == 0 || coverage < kMinScoreCoverage
        ? null
        : (weighted / dataWeight).round().clamp(0, 100);
    return BetallerScore(total: total, factors: factors, coverage: coverage);
  }

  // ── The window: the last seven days, never before the account existed ──

  static DateTime _day(DateTime d) => DateTime(d.year, d.month, d.day);

  static String key(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  /// Whole days before today that fall in the window, oldest first.
  static List<DateTime> _pastDays(ScoreInputs i) {
    final today = _day(i.now);
    final created = _day(i.accountCreated);
    return [
      for (var back = 6; back >= 1; back--)
        if (!today.subtract(Duration(days: back)).isBefore(created))
          today.subtract(Duration(days: back)),
    ];
  }

  static List<String> _doneOn(ScoreInputs i, DateTime d) {
    final k = key(d);
    if (k == key(i.now)) {
      return {...?i.routineHistory[k], ...i.completedToday}.toList();
    }
    return i.routineHistory[k] ?? const [];
  }

  /// Days trained against the plan's training days. Today only ever adds:
  /// a day still in progress is not a missed day.
  static FactorResult _training(ScoreInputs i) {
    var planned = 0;
    var done = 0;
    bool trained(DateTime d) {
      final planDay = i.weeklyPlan.days[d.weekday - 1];
      return _doneOn(i, d).any(
        (id) => i.trainingIds.contains(id) || planDay.routineIds.contains(id),
      );
    }

    for (final d in _pastDays(i)) {
      if (i.weeklyPlan.days[d.weekday - 1].kind != PlanDayKind.rest) planned++;
      if (trained(d)) done++;
    }
    final today = _day(i.now);
    if (trained(today)) {
      done++;
      if (i.weeklyPlan.days[today.weekday - 1].kind != PlanDayKind.rest) {
        planned++;
      }
    }
    if (planned == 0 && done == 0) {
      return const FactorResult(ScoreFactor.training, null);
    }
    final ratio = planned == 0 ? 1.0 : math.min(1.0, done / planned);
    return FactorResult(
      ScoreFactor.training,
      (ratio * 100).round(),
      facts: {'done': done, 'planned': planned},
    );
  }

  /// Half the streak (two weeks is full marks), half the share of days with
  /// at least half the plan done.
  static FactorResult _consistency(ScoreInputs i) {
    double ratio(DateTime d) {
      final plan = dailyPlanIds(d);
      if (plan.isEmpty) return 0;
      final done = _doneOn(i, d);
      return plan.where(done.contains).length / plan.length;
    }

    var days = 0;
    var active = 0;
    for (final d in _pastDays(i)) {
      days++;
      if (ratio(d) >= 0.5) active++;
    }
    if (ratio(_day(i.now)) >= 0.5) {
      days++;
      active++;
    }
    if (days == 0) return const FactorResult(ScoreFactor.consistency, null);
    final streakPart = math.min(i.streak, 14) / 14;
    final activePart = active / days;
    return FactorResult(
      ScoreFactor.consistency,
      (50 * streakPart + 50 * activePart).round(),
      facts: {'streak': i.streak, 'active': active, 'days': days},
    );
  }

  /// Average over the logged days of the last week, today included.
  static (double avg, int days)? _logAverage(
    ScoreInputs i,
    Map<String, double> log,
  ) {
    final keys = {
      for (final d in [..._pastDays(i), _day(i.now)]) key(d),
    };
    final values = [
      for (final e in log.entries)
        if (keys.contains(e.key) && e.value > 0) e.value,
    ];
    if (values.isEmpty) return null;
    return (values.reduce((a, b) => a + b) / values.length, values.length);
  }

  static FactorResult _sleep(ScoreInputs i) {
    final a = _logAverage(i, i.sleepLog);
    if (a == null || i.sleepTarget <= 0) {
      return const FactorResult(ScoreFactor.sleep, null);
    }
    return FactorResult(
      ScoreFactor.sleep,
      (math.min(1.0, a.$1 / i.sleepTarget) * 100).round(),
      facts: {'avg': a.$1, 'target': i.sleepTarget, 'days': a.$2},
    );
  }

  static FactorResult _hydration(ScoreInputs i) {
    final a = _logAverage(i, i.waterLog);
    if (a == null || i.waterTarget <= 0) {
      return const FactorResult(ScoreFactor.hydration, null);
    }
    final today = i.waterLog[key(i.now)] ?? 0;
    return FactorResult(
      ScoreFactor.hydration,
      (math.min(1.0, a.$1 / i.waterTarget) * 100).round(),
      facts: {
        'avg': a.$1,
        'target': i.waterTarget,
        'days': a.$2,
        'today': today,
      },
    );
  }

  /// Planned nutrition habits done. Like training, today only adds.
  static FactorResult _nutrition(ScoreInputs i) {
    var planned = 0;
    var done = 0;
    for (final d in _pastDays(i)) {
      final plan = dailyPlanIds(d).where(i.nutritionIds.contains).toList();
      final ids = _doneOn(i, d);
      planned += plan.length;
      done += plan.where(ids.contains).length;
    }
    final today = _day(i.now);
    final todayDone = dailyPlanIds(
      today,
    ).where(i.nutritionIds.contains).where(_doneOn(i, today).contains).length;
    planned += todayDone;
    done += todayDone;
    if (planned == 0) return const FactorResult(ScoreFactor.nutrition, null);
    return FactorResult(
      ScoreFactor.nutrition,
      (done / planned * 100).round(),
      facts: {'done': done, 'planned': planned},
    );
  }

  /// The latest wall self-check. Its answers score 40 (all three off) to 90
  /// (all three fine), stretched here to 0-100.
  static FactorResult _posture(ScoreInputs i) {
    Map<String, dynamic>? latest;
    for (final p in i.postureChecks) {
      final d = p['date'];
      if (d is! String || p['totalScore'] is! num) continue;
      if (latest == null || d.compareTo(latest['date'] as String) >= 0) {
        latest = p;
      }
    }
    if (latest == null) return const FactorResult(ScoreFactor.posture, null);
    final raw = (latest['totalScore'] as num).toInt();
    final date = DateTime.tryParse(latest['date'] as String);
    final ago = date == null ? 0 : _day(i.now).difference(_day(date)).inDays;
    return FactorResult(
      ScoreFactor.posture,
      ((raw - 40) / 50 * 100).round().clamp(0, 100),
      facts: {'raw': raw, 'daysAgo': math.max(0, ago)},
    );
  }

  static FactorResult _measuring(ScoreInputs i) {
    DateTime? last;
    for (final r in i.records) {
      final d = DateTime.tryParse(r.date);
      if (d != null && (last == null || d.isAfter(last))) last = d;
    }
    if (last == null) return const FactorResult(ScoreFactor.measuring, null);
    final ago = math.max(0, _day(i.now).difference(_day(last)).inDays);
    final score = ago <= 7
        ? 100
        : ago <= 14
        ? 70
        : ago <= 30
        ? 40
        : 15;
    return FactorResult(ScoreFactor.measuring, score, facts: {'daysAgo': ago});
  }

  /// Measured growth speed against what is typical at this age. Not counted
  /// from 21, when growth plates have usually closed.
  static FactorResult _growth(ScoreInputs i) {
    if (i.age >= 21) {
      return const FactorResult(ScoreFactor.growth, null, counted: false);
    }
    final v = Calculations.growthVelocity(i.records);
    final expected = Calculations.expectedGrowthVelocity(i.age, i.gender);
    if (v == null || expected <= 0) {
      // When the next measurement would make the 30-day span.
      var wait = 0;
      if (i.records.isNotEmpty) {
        final first = DateTime.tryParse(i.records.first.date);
        if (first != null) {
          wait = math.max(0, 30 - _day(i.now).difference(_day(first)).inDays);
        }
      }
      return FactorResult(ScoreFactor.growth, null, facts: {'wait': wait});
    }
    return FactorResult(
      ScoreFactor.growth,
      (math.min(1.0, v / expected) * 100).round(),
      facts: {'velocity': v, 'expected': expected},
    );
  }

  /// Centimetres still open between today and the potential, against the
  /// most that is realistic at this age.
  static FactorResult _headroom(ScoreInputs i) {
    final cm = math.max(0.0, i.potentialHeight - i.latestHeight);
    final full = i.age < 21 ? 8.0 : 2.5;
    return FactorResult(
      ScoreFactor.headroom,
      (math.min(1.0, cm / full) * 100).round(),
      facts: {'cm': cm},
    );
  }
}
