import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/app_localizations.dart';
import '../models/reminder.dart';

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
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _plugin.initialize(
      settings: const InitializationSettings(android: androidSettings, iOS: iosSettings),
    );
  }

  Future<bool> requestPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      final granted = await android.requestNotificationsPermission();
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
    AppLocalizations l,
  ) async {
    await cancelAll();
    if (!await isEnabled()) return;

    for (var i = 0; i < reminders.length; i++) {
      final r = reminders[i];
      if (!r.enabled) continue;

      final copy = _copyFor(r, l);
      final base = 5000 + i * 10;

      if (r.isDaily) {
        _scheduleDaily(
          id: base,
          hour: r.hour,
          minute: r.minute,
          title: copy.$1,
          body: copy.$2,
          channel: r.category,
          channelName: copy.$1,
        );
      } else {
        for (final day in r.weekdays) {
          _scheduleWeekly(
            id: base + day,
            weekday: day,
            hour: r.hour,
            minute: r.minute,
            title: copy.$1,
            body: copy.$2,
            channel: r.category,
            channelName: copy.$1,
          );
        }
      }
    }
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
        return (l.notifPostureTitle, l.notifPostureBody);
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

  Future<void> setEnabled(bool enabled, AppLocalizations l) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, enabled);
    if (enabled) {
      await requestPermission();
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
