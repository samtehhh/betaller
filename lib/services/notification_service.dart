import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  factory NotificationService() => _instance;
  NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  static const String _prefsKey = 'betaller_notifications_enabled';

  Future<void> init() async {
    tz_data.initializeTimeZones();
    try {
      final String timeZoneName = await FlutterTimezone.getLocalTimezone();
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

  Future<void> scheduleAllNotifications() async {
    await cancelAll();

    // ════════════════════════════════════════════════════════════
    // HER GÜN SABİT (3 bildirim)
    // ════════════════════════════════════════════════════════════

    // 1. Su hatırlatma - her gün 14:00
    _scheduleDaily(
      id: 100,
      hour: 14, minute: 0,
      title: '💧 Su İçmeyi Unutma!',
      body: 'Günlük su hedefine ulaştın mı? Bir bardak daha iç, metabolizmanı hızlandır!',
      channel: 'water', channelName: 'Su Hatırlatması',
    );

    // 2. Egzersiz - her gün 07:30
    _scheduleDaily(
      id: 200,
      hour: 7, minute: 30,
      title: '🌅 Günaydın! Egzersiz Vakti',
      body: 'Sabah germe egzersizini yap! 10 dakika omurga ve bacak kaslarını esnet.',
      channel: 'exercise', channelName: 'Egzersiz Hatırlatması',
    );

    // 3. Rutin kontrol - her gün 20:30
    _scheduleDaily(
      id: 400,
      hour: 20, minute: 30,
      title: '🔥 Rutinlerini Tamamla!',
      body: 'Gün bitmeden rutinlerini kontrol et. Seri yapmak = disiplin skoru artışı!',
      channel: 'routine', channelName: 'Rutin Hatırlatması',
    );

    // ════════════════════════════════════════════════════════════
    // GÜNE GÖRE DAĞITILAN BİLDİRİMLER (günde +1-2 ek)
    // ════════════════════════════════════════════════════════════

    // ── PAZARTESİ: Beslenme + Motivasyon ─────────────────────
    _scheduleWeekly(id: 700, weekday: DateTime.monday, hour: 12, minute: 0,
      title: '🥚 Protein Günü!',
      body: 'Haftaya güçlü başla! Her öğünde protein al. Yumurta, tavuk, balık, süt ürünleri.',
      channel: 'nutrition', channelName: 'Beslenme Hatırlatması',
    );
    _scheduleWeekly(id: 800, weekday: DateTime.monday, hour: 9, minute: 0,
      title: '✨ Yeni Hafta, Yeni Hedefler!',
      body: 'Bu hafta rutinlerini aksatma. Küçük adımlar büyük farklar yaratır!',
      channel: 'motivation', channelName: 'Motivasyon',
    );

    // ── SALI: Uyku + Duruş ───────────────────────────────────
    _scheduleWeekly(id: 300, weekday: DateTime.tuesday, hour: 22, minute: 0,
      title: '😴 Uyku Zamanı!',
      body: 'Büyüme hormonu 22:00-02:00 arası en yüksek. Telefonunu bırak ve uyu!',
      channel: 'sleep', channelName: 'Uyku Hatırlatması',
    );
    _scheduleWeekly(id: 600, weekday: DateTime.tuesday, hour: 13, minute: 0,
      title: '🧍 Duruş Kontrolü!',
      body: 'Sırtını dik tut, omuzlarını geri çek. Doğru duruş = 2-3 cm fark yaratır!',
      channel: 'posture', channelName: 'Duruş Hatırlatması',
    );

    // ── ÇARŞAMBA: Beslenme + Motivasyon ──────────────────────
    _scheduleWeekly(id: 701, weekday: DateTime.wednesday, hour: 11, minute: 0,
      title: '☀️ D Vitamini Zamanı!',
      body: '15 dakika güneşlen! D vitamini kalsiyum emilimini artırır, kemik gelişimini hızlandırır.',
      channel: 'nutrition', channelName: 'Beslenme Hatırlatması',
    );
    _scheduleWeekly(id: 801, weekday: DateTime.wednesday, hour: 9, minute: 0,
      title: '✨ Yarı Yoldayız!',
      body: 'Haftanın ortası. Büyüme sabır ister ama düzenli olan kazanır. Devam et!',
      channel: 'motivation', channelName: 'Motivasyon',
    );

    // ── PERŞEMBE: Uyku + Egzersiz ────────────────────────────
    _scheduleWeekly(id: 301, weekday: DateTime.thursday, hour: 21, minute: 30,
      title: '📵 Ekranları Kapat!',
      body: 'Yatmadan 1 saat önce ekranlardan uzaklaş. Mavi ışık melatonin üretimini engeller!',
      channel: 'sleep', channelName: 'Uyku Hatırlatması',
    );
    _scheduleWeekly(id: 201, weekday: DateTime.thursday, hour: 17, minute: 0,
      title: '🦘 Zıplama Vakti!',
      body: 'Zıplama egzersizleri büyüme plakalarını uyarır. 3 set x 20 tekrar dene!',
      channel: 'exercise', channelName: 'Egzersiz Hatırlatması',
    );

    // ── CUMA: Beslenme + Duruş ───────────────────────────────
    _scheduleWeekly(id: 702, weekday: DateTime.friday, hour: 15, minute: 30,
      title: '🥛 Kalsiyum Zamanı!',
      body: 'Bir bardak süt veya yoğurt tüket. Kalsiyum kemik gelişimi için kritik!',
      channel: 'nutrition', channelName: 'Beslenme Hatırlatması',
    );
    _scheduleWeekly(id: 601, weekday: DateTime.friday, hour: 14, minute: 0,
      title: '🧍 Duruş Kontrolü!',
      body: 'Telefona bakarken boynunu eğme! Omurgana dikkat, dik otur dik yürü.',
      channel: 'posture', channelName: 'Duruş Hatırlatması',
    );

    // ── CUMARTESİ: Motivasyon + İlerleme ────────────────────
    _scheduleWeekly(id: 802, weekday: DateTime.saturday, hour: 10, minute: 0,
      title: '✨ Hafta Sonu Motivasyonu',
      body: 'Hafta sonu da rutinlerini aksatma! Disiplin her gün geçerli. Sen yapabilirsin!',
      channel: 'motivation', channelName: 'Motivasyon',
    );
    _scheduleWeekly(id: 501, weekday: DateTime.saturday, hour: 19, minute: 0,
      title: '📊 Haftalık İlerleme',
      body: 'Bu haftayı nasıl geçirdin? İlerleme sayfandan büyüme grafiğini kontrol et!',
      channel: 'measurement', channelName: 'Ölçüm Hatırlatması',
    );

    // ── PAZAR: Ölçüm (SABİT) + Uyku ─────────────────────────
    _scheduleWeekly(id: 500, weekday: DateTime.sunday, hour: 10, minute: 0,
      title: '📏 Haftalık Boy Ölçümü!',
      body: 'Boyunu ölç ve kaydet! Sabah ölçümü en doğru sonucu verir. Seni bekliyoruz!',
      channel: 'measurement', channelName: 'Ölçüm Hatırlatması',
    );
    _scheduleWeekly(id: 302, weekday: DateTime.sunday, hour: 22, minute: 0,
      title: '😴 Erken Yat, Erken Kalk!',
      body: 'Yarın pazartesi! İyi bir uykuyla haftaya güçlü başla. Hedefin en az 8 saat.',
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

  Future<void> setEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, enabled);
    if (enabled) {
      await requestPermission();
      await scheduleAllNotifications();
    } else {
      await cancelAll();
    }
  }
}
