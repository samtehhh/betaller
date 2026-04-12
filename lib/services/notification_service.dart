import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/app_localizations.dart';

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

  Future<void> scheduleAllNotifications(AppLocalizations l) async {
    await cancelAll();

    // ════════════════════════════════════════════════════════════
    // HER GÜN SABİT (3 bildirim)
    // ════════════════════════════════════════════════════════════

    // 1. Su hatırlatma - her gün 14:00
    _scheduleDaily(
      id: 100,
      hour: 14, minute: 0,
      title: l.notifWaterTitle,
      body: l.notifWaterBody,
      channel: 'water', channelName: 'Su Hatırlatması',
    );

    // 2. Egzersiz - her gün 07:30
    _scheduleDaily(
      id: 200,
      hour: 7, minute: 30,
      title: l.notifMorningTitle,
      body: l.notifMorningBody,
      channel: 'exercise', channelName: 'Egzersiz Hatırlatması',
    );

    // 3. Rutin kontrol - her gün 20:30
    _scheduleDaily(
      id: 400,
      hour: 20, minute: 30,
      title: l.notifRoutineTitle,
      body: l.notifRoutineBody,
      channel: 'routine', channelName: 'Rutin Hatırlatması',
    );

    // ════════════════════════════════════════════════════════════
    // GÜNE GÖRE DAĞITILAN BİLDİRİMLER (günde +1-2 ek)
    // ════════════════════════════════════════════════════════════

    // ── PAZARTESİ: Beslenme + Motivasyon ─────────────────────
    _scheduleWeekly(id: 700, weekday: DateTime.monday, hour: 12, minute: 0,
      title: l.notifProteinTitle,
      body: l.notifProteinBody,
      channel: 'nutrition', channelName: 'Beslenme Hatırlatması',
    );
    _scheduleWeekly(id: 800, weekday: DateTime.monday, hour: 9, minute: 0,
      title: l.notifNewWeekTitle,
      body: l.notifNewWeekBody,
      channel: 'motivation', channelName: 'Motivasyon',
    );

    // ── SALI: Uyku + Duruş ───────────────────────────────────
    _scheduleWeekly(id: 300, weekday: DateTime.tuesday, hour: 22, minute: 0,
      title: l.notifSleepTitle,
      body: l.notifSleepBody,
      channel: 'sleep', channelName: 'Uyku Hatırlatması',
    );
    _scheduleWeekly(id: 600, weekday: DateTime.tuesday, hour: 13, minute: 0,
      title: l.notifPostureTitle,
      body: l.notifPostureBody,
      channel: 'posture', channelName: 'Duruş Hatırlatması',
    );

    // ── ÇARŞAMBA: Beslenme + Motivasyon ──────────────────────
    _scheduleWeekly(id: 701, weekday: DateTime.wednesday, hour: 11, minute: 0,
      title: l.notifVitaminDTitle,
      body: l.notifVitaminDBody,
      channel: 'nutrition', channelName: 'Beslenme Hatırlatması',
    );
    _scheduleWeekly(id: 801, weekday: DateTime.wednesday, hour: 9, minute: 0,
      title: l.notifMidweekTitle,
      body: l.notifMidweekBody,
      channel: 'motivation', channelName: 'Motivasyon',
    );

    // ── PERŞEMBE: Uyku + Egzersiz ────────────────────────────
    _scheduleWeekly(id: 301, weekday: DateTime.thursday, hour: 21, minute: 30,
      title: l.notifScreenTitle,
      body: l.notifScreenBody,
      channel: 'sleep', channelName: 'Uyku Hatırlatması',
    );
    _scheduleWeekly(id: 201, weekday: DateTime.thursday, hour: 17, minute: 0,
      title: l.notifJumpTitle,
      body: l.notifJumpBody,
      channel: 'exercise', channelName: 'Egzersiz Hatırlatması',
    );

    // ── CUMA: Beslenme + Duruş ───────────────────────────────
    _scheduleWeekly(id: 702, weekday: DateTime.friday, hour: 15, minute: 30,
      title: l.notifCalciumTitle,
      body: l.notifCalciumBody,
      channel: 'nutrition', channelName: 'Beslenme Hatırlatması',
    );
    _scheduleWeekly(id: 601, weekday: DateTime.friday, hour: 14, minute: 0,
      title: l.notifPostureCheckTitle,
      body: l.notifPostureCheckBody,
      channel: 'posture', channelName: 'Duruş Hatırlatması',
    );

    // ── CUMARTESİ: Motivasyon + İlerleme ────────────────────
    _scheduleWeekly(id: 802, weekday: DateTime.saturday, hour: 10, minute: 0,
      title: l.notifWeekendTitle,
      body: l.notifWeekendBody,
      channel: 'motivation', channelName: 'Motivasyon',
    );
    _scheduleWeekly(id: 501, weekday: DateTime.saturday, hour: 19, minute: 0,
      title: l.notifWeeklyProgressTitle,
      body: l.notifWeeklyProgressBody,
      channel: 'measurement', channelName: 'Ölçüm Hatırlatması',
    );

    // ── PAZAR: Ölçüm (SABİT) + Uyku ─────────────────────────
    _scheduleWeekly(id: 500, weekday: DateTime.sunday, hour: 10, minute: 0,
      title: l.notifMeasureTitle,
      body: l.notifMeasureBody,
      channel: 'measurement', channelName: 'Ölçüm Hatırlatması',
    );
    _scheduleWeekly(id: 302, weekday: DateTime.sunday, hour: 22, minute: 0,
      title: l.notifEarlySleepTitle,
      body: l.notifEarlySleepBody,
      channel: 'sleep', channelName: 'Uyku Hatırlatması',
    );
  }

  // ── Scheduling helpers ────────────────────────────────────────

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
      await scheduleAllNotifications(l);
    } else {
      await cancelAll();
    }
  }

  // ── Streak-based smart notifications ──────────────────────────

  /// Call this when streak updates. Sends contextual notification.
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
