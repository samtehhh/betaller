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
import '../utils/localized_data.dart';
import '../utils/num_format.dart';
import '../utils/units.dart';

/// What the reminders can say about this particular user. Built by the
/// caller from the provider, so the copy carries real numbers ("81 g of
/// protein today", "Strength, 30 min") instead of the same line every day.
class ReminderContext {
  final UserProfile profile;
  final String weeklyWorkout;
  final String potential; // already formatted in the user's unit

  const ReminderContext({
    required this.profile,
    required this.weeklyWorkout,
    required this.potential,
  });
}

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  factory NotificationService() => _instance;
  NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

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

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
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
      settings: const InitializationSettings(android: androidSettings, iOS: iosSettings),
      // A tap opens the screen the notification is about, not just the app.
      onDidReceiveNotificationResponse: (r) => tappedPayload.value = r.payload,
    );
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

  Future<bool> requestPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      final granted = await android.requestNotificationsPermission();
      return granted ?? false;
    }
    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      final granted = await ios.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }
    return true;
  }

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

      // With a profile, daily reminders become seven weekly ones, each
      // saying what that weekday actually holds.
      if (r.isDaily && context != null && _personal(r.category)) {
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
                ? l.nMeasureBody(context.potential)
                : copy.$2,
            channel: r.category,
            channelName: copy.$1,
            payload: _payloadFor(r.category),
          );
        }
      }
    }
  }

  static bool _personal(String category) => const {
        'exercise',
        'nutrition',
        'water',
        'sleep',
      }.contains(category);

  static String _payloadFor(String category) => switch (category) {
        'exercise' || 'routine' || 'posture' => 'tab:1',
        'measurement' => 'tab:2',
        _ => 'tab:0',
      };

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
    switch (category) {
      case 'exercise':
        if (day.kind == PlanDayKind.rest) return (l.nRestTitle, l.nRestBody);
        final names = day.routineIds
            .take(3)
            .map((id) => localizedRoutine(l, id)['title'] ?? id)
            .join(', ');
        return (
          l.nTrainTitle(planKindLabel(l, day.kind), day.minutes),
          names,
        );
      case 'nutrition':
        return (
          l.nProteinTitle(t.proteinG),
          l.nProteinBody(t.proteinPerMealG),
        );
      case 'water':
        return (
          l.nWaterTitle(UnitPrefs.current.formatWaterTarget(t.waterL)),
          l.nWaterBody,
        );
      default: // sleep
        return (
          l.nSleepTitle,
          l.nSleepBody(t.sleepH.fixedL(t.sleepH % 1 == 0 ? 0 : 1)),
        );
    }
  }

  // ── Free trial ─────────────────────────────────────────────────

  /// Two honest notices for a running free trial: the next day's plan, so
  /// the first full day gets used, and a heads-up the day before it turns
  /// paid. Telling people before they are charged costs a few
  /// cancellations and saves refunds and one-star reviews.
  Future<void> scheduleTrialNotices({
    required DateTime started,
    required DateTime expires,
    required String priceAfter,
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
      final d = plan.days[day1.weekday - 1];
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
    final heads = expires.subtract(const Duration(hours: 24));
    if (heads.isAfter(now)) {
      final body = l.nTrialEndBody(priceAfter);
      _plugin.zonedSchedule(
        id: 7002,
        title: l.nTrialEndTitle,
        body: body,
        scheduledDate: tz.TZDateTime.from(heads, tz.local),
        notificationDetails: _notifDetails('trial', l.nTrialEndTitle, body),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        payload: 'tab:2',
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
        return (
          l.notifPostureTitle,
          UnitPrefs.current.imperialHeight
              ? l.notifPostureBodyIn
              : l.notifPostureBody,
        );
      case 'nutrition':
        return (l.notifProteinTitle, l.notifProteinBody);
      case 'measurement':
        return (l.notifMeasureTitle, l.notifMeasureBody);
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
    var scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
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
    var scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
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

  NotificationDetails _notifDetails(String channel, String channelName, String body) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channel, channelName,
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
  Future<void> scheduleStreakRiskNotification(int currentStreak, AppLocalizations l) async {
    if (!await isEnabled() || currentStreak < 2) return;

    // Schedule for 21:00 today
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, 21, 0);
    if (scheduled.isBefore(now)) return; // already past 21:00

    final body = l.notifStreakRiskBody(currentStreak);
    _plugin.zonedSchedule(
      id: 950,
      title: l.notifStreakRiskTitle,
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
