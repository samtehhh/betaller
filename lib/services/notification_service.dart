import 'push_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/foundation.dart';

import '../l10n/app_localizations.dart';
import '../models/reminder.dart';
import '../models/user_profile.dart';
import '../utils/daily_targets.dart';
import '../utils/num_format.dart';
import '../utils/units.dart';

/// What the reminders can say about this particular user. Built by the
/// caller from the provider, so the copy carries real numbers ("81 g of
/// protein today", "Strength, 30 min") instead of the same line every day.
class ReminderContext {
  final UserProfile profile;
  final String weeklyWorkout;
  final String potential; // already formatted in the user's unit
  final String height; // latest measurement, formatted
  final String habitGain; // the part of the prediction habits control

  const ReminderContext({
    required this.profile,
    required this.weeklyWorkout,
    required this.potential,
    required this.height,
    required this.habitGain,
  });

  /// The name the user gave, or null when onboarding's field was left empty.
  String? get name {
    final n = profile.name.trim();
    return n.isEmpty || n == 'User' ? null : n;
  }
}

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  factory NotificationService() => _instance;
  NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const String _prefsKey = 'betaller_notifications_enabled';

  Future<void> init() async {
    tz_data.initializeTimeZones();
    try {
      final timeZoneInfo = await FlutterTimezone.getLocalTimezone();
      final String timeZoneName = timeZoneInfo.identifier;
      tz.setLocalLocation(tz.getLocation(timeZoneName));
    } catch (_) {
      tz.setLocalLocation(tz.getLocation('Europe/Istanbul'));
    }

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    // Permission is NOT requested here. init() runs during app start-up, and
    // asking on the very first frame — before the user has seen what reminders
    // are for — is the fastest way to get a permanent "Don't allow".
    // requestPermission() does the asking, when the user turns reminders on.
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      settings: const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
      // A tap opens the screen the notification is about, not just the app.
      onDidReceiveNotificationResponse: (r) => tappedPayload.value = r.payload,
    );
    await _plugin.cancel(id: 7002); // retired "trial ends tomorrow" notice
    final launch = await _plugin.getNotificationAppLaunchDetails();
    if (launch?.didNotificationLaunchApp ?? false) {
      tappedPayload.value = launch!.notificationResponse?.payload;
    }
  }

  /// The payload of the notification the user last tapped ("tab:1"), for
  /// the main screen to act on.
  static final ValueNotifier<String?> tappedPayload = ValueNotifier(null);

  /// Ids 5000-5999 belong to the user's reminders; trial and streak notices
  /// use their own ranges and survive a reminder reschedule.
  Future<void> _cancelReminderIds() async {
    final pending = await _plugin.pendingNotificationRequests();
    for (final p in pending) {
      if (p.id >= 5000 && p.id < 6000) await _plugin.cancel(id: p.id);
    }
  }

  // ── Win-back ───────────────────────────────────────────────────

  // Day 3 was dropped (Nov 2026): its title named the centimetres the
  // estimate ties to habits, a figure the app works out and keeps for Pro.
  static const _winBackDays = [1, 2, 5, 7, 10, 14, 21, 30];

  /// Queues the "you've been away" series, counted from now. Called on every
  /// launch and resume, so someone using the app never receives one.
  Future<void> scheduleWinBack(ReminderContext c, AppLocalizations l) async {
    if (!await isEnabled()) return; // turning reminders off cancels all
    // Nine ids, not the list's length: an install that queued the old
    // nine-message series still has its last one to clear.
    for (var i = 0; i < 9; i++) {
      await _plugin.cancel(id: 6100 + i);
    }
    final now = tz.TZDateTime.now(tz.local);
    for (var i = 0; i < _winBackDays.length; i++) {
      final days = _winBackDays[i];
      final copy = _winBackCopy(days, c, l);
      final day = now.add(Duration(days: days));
      final at = tz.TZDateTime(tz.local, day.year, day.month, day.day, 19);
      _plugin.zonedSchedule(
        id: 6100 + i,
        title: copy.$1,
        body: copy.$2,
        scheduledDate: at,
        notificationDetails: _notifDetails('winback', copy.$1, copy.$2),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        payload: days == 5 || days >= 10 ? 'tab:2' : 'tab:1',
      );
    }
  }

  (String, String) _winBackCopy(
    int days,
    ReminderContext c,
    AppLocalizations l,
  ) {
    final name = c.name;
    return switch (days) {
      1 => (l.nWb1Title, l.nWb1Body(c.height)),
      2 => (l.nWb2Title, l.nWb2Body),
      5 => (name == null ? l.nWb5TitleNoName : l.nWb5Title(name), l.nWb5Body),
      7 => (l.nWb7Title, l.nWb7Body),
      10 => (l.nWb10Title, l.nWb10Body),
      14 => (l.nWb14Title(c.height), l.nWb14Body),
      21 => (l.nWb21Title, l.nWb21Body),
      _ => (
        name == null ? l.nWb30TitleNoName : l.nWb30Title(name),
        l.nWb30Body,
      ),
    };
  }

  Future<bool> requestPermission() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      final granted = await android.requestNotificationsPermission();
      return granted ?? false;
    }
    final ios = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    if (ios != null) {
      final granted = await ios.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      // With permission given, Apple issues the push token the console
      // campaigns need.
      if (granted ?? false) PushService.retry();
      return granted ?? false;
    }
    return true;
  }

  /// Whether reminders may carry the user's own numbers ("98 g protein
  /// today"). Those figures are part of Pro, so AppProvider keeps this equal
  /// to the entitlement. Everyone still gets the reminders themselves: a
  /// free user's simply say what to do without the personal figures.
  static bool personalNumbers = false;

  /// Schedules exactly what the user asked for and nothing else.
  ///
  /// Ids are derived from the reminder's position and weekday so a reminder
  /// can be rescheduled without leaving its old firings behind.
  Future<void> scheduleReminders(
    List<Reminder> reminders,
    AppLocalizations l, {
    ReminderContext? context,
  }) async {
    await _cancelReminderIds();
    if (!await isEnabled()) return;

    for (var i = 0; i < reminders.length; i++) {
      final r = reminders[i];
      if (!r.enabled) continue;

      final copy = _copyFor(r, l);
      final base = 5000 + i * 10;

      // The six everyday reminders (Nov 2026). A free user gets none of
      // them: their one-size lines ("Protein day!", "Good morning, time to
      // exercise") went out every day whatever the day held, and read as
      // noise. Free users are reached by the first-week series, the
      // win-back series and the streak notices instead. Pro gets them
      // rewritten around the user's own day, by name: the first meal, a
      // later meal with its protein and calcium, water, the small habits,
      // the workout half an hour ahead and bedtime. The evening "finish
      // your routines" nudge is gone for everyone; the streak notice at
      // 21:00 does that job on the days it matters.
      if (kEverydayCategories.contains(r.category)) {
        if (context == null || !personalNumbers || r.category == 'routine') {
          continue;
        }
        for (var day = DateTime.monday; day <= DateTime.sunday; day++) {
          final c = _personalCopy(r.category, day, context, l);
          _scheduleWeekly(
            id: base + day,
            weekday: day,
            hour: r.hour,
            minute: r.minute,
            title: c.$1,
            body: c.$2,
            channel: r.category,
            channelName: copy.$1,
            payload: _payloadFor(r.category),
          );
        }
        // The nutrition reminder sits on a later meal; the first meal of
        // the day gets its own, at its own hour.
        final first = _firstMeal(context);
        if (r.category == 'nutrition' &&
            first != null &&
            (first.$1 != r.hour || first.$2 != r.minute)) {
          final name = context.name;
          for (var day = DateTime.monday; day <= DateTime.sunday; day++) {
            _scheduleWeekly(
              id: 5900 + day,
              weekday: day,
              hour: first.$1,
              minute: first.$2,
              title: name == null
                  ? l.nPmFirstTitleNoName
                  : l.nPmFirstTitle(name),
              body: l.nPmFirstBody,
              channel: r.category,
              channelName: copy.$1,
              payload: _payloadFor(r.category),
            );
          }
        }
        continue;
      }

      // With a profile, daily reminders become seven weekly ones, each
      // saying what that weekday actually holds.
      if (r.isDaily &&
          context != null &&
          personalNumbers &&
          _personal(r.category)) {
        for (var day = DateTime.monday; day <= DateTime.sunday; day++) {
          final c = _personalCopy(r.category, day, context, l);
          _scheduleWeekly(
            id: base + day,
            weekday: day,
            hour: r.hour,
            minute: r.minute,
            title: c.$1,
            body: c.$2,
            channel: r.category,
            channelName: copy.$1,
            payload: _payloadFor(r.category),
          );
        }
        continue;
      }

      if (r.isDaily) {
        _scheduleDaily(
          id: base,
          hour: r.hour,
          minute: r.minute,
          title: copy.$1,
          body: copy.$2,
          channel: r.category,
          channelName: copy.$1,
          payload: _payloadFor(r.category),
        );
      } else {
        for (final day in r.weekdays) {
          _scheduleWeekly(
            id: base + day,
            weekday: day,
            hour: r.hour,
            minute: r.minute,
            title: copy.$1,
            body: r.category == 'measurement' && context != null
                ? l.nMeasureHookBody
                : copy.$2,
            channel: r.category,
            channelName: copy.$1,
            payload: _payloadFor(r.category),
          );
        }
      }
    }
    await _scheduleFirstWeek(l);
  }

  // ── The first week ─────────────────────────────────────────────

  static const _firstWeekKey = 'betaller_first_week_start';

  /// Marks today as the first day of the user's first week, once. The
  /// onboarding calls it as the profile is saved; a later call changes
  /// nothing, so the week is counted from the real start.
  Future<void> startFirstWeek() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(_firstWeekKey) != null) return;
    final now = DateTime.now();
    await prefs.setString(
      _firstWeekKey,
      DateTime(now.year, now.month, now.day).toIso8601String(),
    );
  }

  /// One notification a day for the seven days after the onboarding, each
  /// about something that day has and the day before did not: new moves,
  /// the first streak medal, a measurement, the posture check, the first
  /// photo, the weekly report. Unlike the win-back series it does not move
  /// when the app is opened: it is the week's own calendar, for someone who
  /// is using the app as much as for someone who is not.
  ///
  /// Ids 7101-7107, at 11:00: eight hours ahead of the 19:00 win-back, so the
  /// two series never land close together. Days already past are skipped, so calling it again (a
  /// launch, a language change, reminders switched back on) only refreshes
  /// what is still ahead. No personal figures in any of them.
  Future<void> _scheduleFirstWeek(AppLocalizations l) async {
    for (var day = 1; day <= 7; day++) {
      await _plugin.cancel(id: 7100 + day);
    }
    final prefs = await SharedPreferences.getInstance();
    final start = DateTime.tryParse(prefs.getString(_firstWeekKey) ?? '');
    if (start == null) return;
    final now = tz.TZDateTime.now(tz.local);
    for (var day = 1; day <= 7; day++) {
      final date = start.add(Duration(days: day));
      final at = tz.TZDateTime(
        tz.local,
        date.year,
        date.month,
        date.day,
        11,
      );
      if (!at.isAfter(now)) continue;
      final copy = firstWeekCopy(day, l);
      _plugin.zonedSchedule(
        id: 7100 + day,
        title: copy.$1,
        body: copy.$2,
        scheduledDate: at,
        notificationDetails: _notifDetails('firstweek', copy.$1, copy.$2),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        // The plan for the training days, Progress (measuring, posture,
        // photos, the report) for the rest.
        payload: day <= 2 || day == 6 ? 'tab:1' : 'tab:2',
      );
    }
  }

  /// Title and body for day [day] (1-7) of the first week.
  @visibleForTesting
  static (String, String) firstWeekCopy(int day, AppLocalizations l) =>
      switch (day) {
        1 => (l.nFw1Title, l.nFw1Body),
        2 => (l.nFw2Title, l.nFw2Body),
        3 => (l.nFw3Title, l.nFw3Body),
        4 => (l.nFw4Title, l.nFw4Body),
        5 => (l.nFw5Title, l.nFw5Body),
        6 => (l.nFw6Title, l.nFw6Body),
        _ => (l.nFw7Title, l.nFw7Body),
      };

  /// The reminders that used to go out every day to everyone.
  static const kEverydayCategories = {
    'exercise',
    'nutrition',
    'water',
    'posture',
    'routine',
    'sleep',
  };

  /// The hour and minute of the day's first meal, from the user's own meal
  /// times.
  static (int, int)? _firstMeal(ReminderContext c) {
    final times = List<String>.of(c.profile.mealTimes)..sort();
    if (times.isEmpty) return null;
    return UserProfile.parseTime(times.first);
  }

  /// Which meal of the day (1-based) the nutrition reminder falls on: the
  /// middle one, as [remindersForProfile] times it.
  static int _reminderMealNumber(ReminderContext c) {
    final count = c.profile.mealTimes.length;
    return count == 0 ? 1 : count ~/ 2 + 1;
  }

  static bool _personal(String category) =>
      const {'exercise', 'nutrition', 'water', 'sleep'}.contains(category);

  static String _payloadFor(String category) => switch (category) {
    'exercise' || 'routine' || 'posture' => 'tab:1',
    'measurement' => 'tab:2',
    _ => 'tab:0',
  };

  /// A Pro reminder's title and body for [category] on [weekday], for tests.
  @visibleForTesting
  (String, String) personalCopyFor(
    String category,
    int weekday,
    ReminderContext c,
    AppLocalizations l,
  ) => _personalCopy(category, weekday, c, l);

  (String, String) _personalCopy(
    String category,
    int weekday,
    ReminderContext c,
    AppLocalizations l,
  ) {
    final plan = WeeklyPlan.forAnswers(
      weeklyWorkout: c.weeklyWorkout,
      age: c.profile.age,
    );
    final day = plan.days[weekday - 1];
    final t = DailyTargets.forProfile(
      c.profile,
      weeklyWorkout: c.weeklyWorkout,
      meals: c.profile.mealTimes.length,
      trainingDay: day.kind != PlanDayKind.rest,
    );
    final name = c.name;
    switch (category) {
      case 'exercise':
        if (day.kind == PlanDayKind.rest) return (l.nRestTitle, l.nRestBody);
        return (
          l.nPmTrainTitle,
          l.nPmTrainBody(day.routineIds.length, day.minutes),
        );
      case 'nutrition':
        final meal = _reminderMealNumber(c);
        if (meal <= 1) {
          return (
            name == null ? l.nPmFirstTitleNoName : l.nPmFirstTitle(name),
            l.nPmFirstBody,
          );
        }
        // Calcium to the nearest 50 mg per meal: a share of the day's
        // target, not a measured dose.
        final meals = c.profile.mealTimes.length.clamp(1, 6);
        final calcium = ((t.calciumMg / meals) / 50).round() * 50;
        return (
          name == null
              ? l.nPmMealTitleNoName(meal)
              : l.nPmMealTitle(name, meal),
          l.nPmMealBody(t.proteinPerMealG, calcium),
        );
      case 'water':
        final liters = UnitPrefs.current.formatWaterTarget(t.waterL);
        return (
          l.nPmWaterTitle,
          name == null
              ? l.nPmWaterBodyNoName(liters)
              : l.nPmWaterBody(name, liters),
        );
      case 'posture':
        return (
          l.nPmHabitTitle,
          name == null ? l.nPmHabitBodyNoName : l.nPmHabitBody(name),
        );
      default: // sleep
        return (
          name == null ? l.nPmSleepTitleNoName : l.nPmSleepTitle(name),
          l.nSleepBody(t.sleepH.fixedL(t.sleepH % 1 == 0 ? 0 : 1)),
        );
    }
  }

  // ── Free trial ─────────────────────────────────────────────────

  /// The next day's plan for a running free trial, so the first full day
  /// gets used.
  Future<void> scheduleTrialNotices({
    required DateTime started,
    required AppLocalizations l,
    ReminderContext? context,
  }) async {
    if (!await isEnabled()) return;
    await cancelTrialNotices();
    final now = DateTime.now();
    final day1 = started.add(const Duration(hours: 20));
    if (day1.isAfter(now) && context != null) {
      final plan = WeeklyPlan.forAnswers(
        weeklyWorkout: context.weeklyWorkout,
        age: context.profile.age,
      );
      final d = plan.weekOf(day1)[day1.weekday - 1];
      final body = l.nTrialDay1Body(planKindLabel(l, d.kind), d.minutes);
      _plugin.zonedSchedule(
        id: 7001,
        title: l.nTrialDay1Title,
        body: body,
        scheduledDate: tz.TZDateTime.from(day1, tz.local),
        notificationDetails: _notifDetails('trial', l.nTrialDay1Title, body),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        payload: 'tab:1',
      );
    }
  }

  Future<void> cancelTrialNotices() async {
    await _plugin.cancel(id: 7001);
    await _plugin.cancel(id: 7002);
  }

  /// Title and body for a reminder. Custom ones speak in the user's own words.
  (String, String) _copyFor(Reminder r, AppLocalizations l) {
    switch (r.category) {
      case 'water':
        return (l.notifWaterTitle, l.notifWaterBody);
      case 'exercise':
        return (l.notifMorningTitle, l.notifMorningBody);
      case 'routine':
        return (l.notifRoutineTitle, l.notifRoutineBody);
      case 'sleep':
        return (l.notifSleepTitle, l.notifSleepBody);
      case 'posture':
        return (l.nPostureHookTitle, l.nPostureHookBody);
      case 'nutrition':
        return (l.notifProteinTitle, l.notifProteinBody);
      case 'measurement':
        return (l.nMeasureHookTitle, l.nMeasureHookBody);
      default:
        return (
          r.label.isEmpty ? l.reminderCustom : r.label,
          l.reminderCustomBody,
        );
    }
  }

  void _scheduleDaily({
    required int id,
    required int hour,
    required int minute,
    required String title,
    required String body,
    required String channel,
    required String channelName,
    String? payload,
  }) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    _plugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
      notificationDetails: _notifDetails(channel, channelName, body),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: payload,
    );
  }

  void _scheduleWeekly({
    required int id,
    required int weekday,
    required int hour,
    required int minute,
    required String title,
    required String body,
    required String channel,
    required String channelName,
    String? payload,
  }) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    while (scheduledDate.weekday != weekday || scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    _plugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
      notificationDetails: _notifDetails(channel, channelName, body),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      payload: payload,
    );
  }

  NotificationDetails _notifDetails(
    String channel,
    String channelName,
    String body,
  ) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channel,
        channelName,
        importance: Importance.high,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
        styleInformation: BigTextStyleInformation(body),
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
  }

  /// A message sent from the Firebase console while the app is open. In the
  /// background the system shows it by itself; in the foreground it has to be
  /// drawn here or it is silently dropped.
  Future<void> showRemote(String title, String body, {String? payload}) async {
    await _plugin.show(
      id: 8000 + DateTime.now().millisecondsSinceEpoch.remainder(1000),
      title: title,
      body: body,
      notificationDetails: _notifDetails('news', 'BeTaller', body),
      payload: payload,
    );
  }

  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }

  Future<bool> isEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_prefsKey) ?? false;
  }

  /// [askPermission] is false when the caller has just asked the system
  /// itself (the onboarding's reminders page), so the prompt is never shown
  /// twice in a row.
  Future<void> setEnabled(
    bool enabled,
    AppLocalizations l, {
    bool askPermission = true,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, enabled);
    if (enabled) {
      if (askPermission) await requestPermission();
      // the caller re-schedules from the user's reminders
    } else {
      await cancelAll();
    }
  }

  // ── Streak-based smart notifications ──────────────────────────

  /// Call this when streak updates. Sends contextual notification.
  /// Announces a badge the moment it is earned.
  Future<void> sendAchievementNotification(
    String title,
    String body,
    AppLocalizations l,
  ) async {
    if (!await isEnabled()) return;
    await _plugin.show(
      id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title: title,
      body: body,
      notificationDetails: _notifDetails('achievement', 'Başarımlar', body),
    );
  }

  Future<void> sendStreakNotification(int streak, AppLocalizations l) async {
    if (!await isEnabled()) return;

    // Milestone celebrations
    String? title;
    String? body;

    if (streak == 3) {
      title = l.notifStreak3Title;
      body = l.notifStreak3Body;
    } else if (streak == 7) {
      title = l.notifStreak7Title;
      body = l.notifStreak7Body;
    } else if (streak == 14) {
      title = l.notifStreak14Title;
      body = l.notifStreak14Body;
    } else if (streak == 30) {
      title = l.notifStreak30Title;
      body = l.notifStreak30Body;
    } else if (streak == 60) {
      title = l.notifStreak60Title;
      body = l.notifStreak60Body;
    } else if (streak == 100) {
      title = l.notifStreak100Title;
      body = l.notifStreak100Body;
    }

    if (title != null && body != null) {
      await _plugin.show(
        id: 900 + streak,
        title: title,
        body: body,
        notificationDetails: _notifDetails('milestone', 'Milestone', body),
      );
    }
  }

  /// Send streak-at-risk notification (call in the evening if routines not done)
  Future<void> scheduleStreakRiskNotification(
    int currentStreak,
    AppLocalizations l,
  ) async {
    if (!await isEnabled() || currentStreak < 2) return;

    // Schedule for 21:00 today
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      21,
      0,
    );
    if (scheduled.isBefore(now)) return; // already past 21:00

    final body = l.nStreakHookBody;
    _plugin.zonedSchedule(
      id: 950,
      title: l.nStreakHookTitle(currentStreak),
      body: body,
      scheduledDate: scheduled,
      notificationDetails: _notifDetails('streak_risk', 'Seri Uyarısı', body),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  /// Cancel streak risk notification (call when all routines completed)
  Future<void> cancelStreakRiskNotification() async {
    await _plugin.cancel(id: 950);
  }
}
