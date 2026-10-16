/// The metered free tier: what a free user may do before Pro, and how much.
///
/// Two kinds of allowance:
///
/// * **First day.** The action is free on the day metering started for this
///   user (the install day, or for someone who updated from a build without
///   metering, the day of the update) and Pro after that. The daily loop:
///   ticking the plan, the program day, water, sleep, the nutrition checklist.
/// * **Counted.** The action is free [FreeFeature.limit] times in all, then
///   Pro: a guided workout, a posture check, a photo comparison, a weekly
///   report, the score breakdown, an article.
///
/// Premium users are never metered. Viewing is never metered either: every
/// gate sits on an action, and the screen behind it stays readable.
///
/// The enum names are stored (as keys of AppProvider's `freeUses`), so they
/// must never be renamed.
enum FreeFeature {
  /// A guided workout played to the end in the workout player.
  workout,

  /// Ticking today's plan habits and moves (and custom routines).
  planTicks,

  /// Ticking and completing a day of the 70-day program.
  program,

  /// Logging water.
  water,

  /// Logging sleep.
  sleep,

  /// The nutrition checklist ticks, the meal plan's "eaten" ticks and the
  /// full weekly menu.
  nutrition,

  /// One posture self-check.
  posture,

  /// One before/after photo comparison.
  photoCompare,

  /// One weekly report.
  weeklyReport,

  /// One look at what builds the BeTaller Score.
  scoreBreakdown,

  /// One education article.
  article,
}

extension FreeFeatureRules on FreeFeature {
  /// Free on the first day only, rather than a number of times.
  bool get firstDayOnly => switch (this) {
    FreeFeature.planTicks ||
    FreeFeature.program ||
    FreeFeature.water ||
    FreeFeature.sleep ||
    FreeFeature.nutrition => true,
    _ => false,
  };

  /// How many free uses a counted feature gives. First-day features are not
  /// counted and report 1 (one free day).
  int get limit => 1;

  /// The key the "you've used your free ..." sheet is remembered under.
  /// First-day features share one: the first day ends for all of them at
  /// once, so one sheet says it.
  String get noticeKey => firstDayOnly ? 'firstDay' : name;
}

/// yyyy-MM-dd for [d], the format every stored date in the app uses.
String freeDateKey(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
