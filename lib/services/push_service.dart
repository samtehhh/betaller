import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

import '../firebase_options.dart';
import 'notification_service.dart';

/// Messages sent from the Firebase console (project betal-47b0d): "new
/// update", "your trial is back" and the like. Everything else the app says
/// is still scheduled on the phone by [NotificationService].
///
/// Audiences are topics, so a campaign can be aimed without a server:
///   all          every install
///   lang_en      app language (lang_tr, lang_de …)
///   free         not subscribed — the "trial is back" crowd
///   premium      subscribed
///
/// A message may carry a `payload` data field ("tab:1", "paywall") which is
/// handled exactly like a tap on a local reminder.
class PushService {
  PushService._();

  static bool _ready = false;
  static String? _lang;
  static bool? _premium;

  static Future<void> init({
    required String lang,
    required bool premium,
  }) async {
    try {
      await Firebase.initializeApp(options: firebaseOptions);
      final fm = FirebaseMessaging.instance;
      _ready = true;

      // Shown by the system only when the app is in the background; in the
      // foreground we draw it ourselves.
      FirebaseMessaging.onMessage.listen((m) {
        final n = m.notification;
        if (n == null) return;
        NotificationService().showRemote(
          n.title ?? 'BeTaller',
          n.body ?? '',
          payload: m.data['payload'] as String?,
        );
      });
      FirebaseMessaging.onMessageOpenedApp.listen(_open);
      final initial = await fm.getInitialMessage();
      if (initial != null) _open(initial);

      _wantLang = lang;
      _wantPremium = premium;
      await _subscribe();
    } catch (e) {
      // No Google Play services, no network, iOS without an APNs key yet:
      // the app works the same, it just can't be reached from the console.
      debugPrint('Push init failed: $e');
    }
  }

  static String? _wantLang;
  static bool? _wantPremium;
  static bool _subscribed = false;

  /// Topics need the phone's push token. On Android it is there at once;
  /// on iOS Apple hands it over only after the user has allowed
  /// notifications, which may be minutes or days after the first launch.
  /// So this is tried at launch and again whenever the app comes back or
  /// notifications are turned on ([retry]).
  static Future<void> _subscribe() async {
    if (!_ready) return;
    final fm = FirebaseMessaging.instance;
    if (Platform.isIOS) {
      String? apns;
      for (var i = 0; i < 5 && apns == null; i++) {
        apns = await fm.getAPNSToken();
        if (apns == null) {
          await Future<void>.delayed(const Duration(seconds: 1));
        }
      }
      if (apns == null) return;
    }
    try {
      if (!_subscribed) {
        await fm.subscribeToTopic('all');
        _subscribed = true;
      }
      final lang = _wantLang;
      if (lang != null && lang != _lang) {
        if (_lang != null) await fm.unsubscribeFromTopic('lang_$_lang');
        await fm.subscribeToTopic('lang_$lang');
        _lang = lang;
      }
      final premium = _wantPremium;
      if (premium != null && premium != _premium) {
        await fm.subscribeToTopic(premium ? 'premium' : 'free');
        await fm.unsubscribeFromTopic(premium ? 'free' : 'premium');
        _premium = premium;
      }
    } catch (e) {
      debugPrint('Push topic failed: $e');
    }
  }

  /// Call when the app returns to the foreground and right after the user
  /// allows notifications: on iOS that is when the token first exists.
  static Future<void> retry() => _subscribe();

  static void _open(RemoteMessage m) {
    final p = m.data['payload'] as String?;
    if (p != null && p.isNotEmpty) {
      NotificationService.tappedPayload.value = p;
    }
  }

  static Future<void> setLanguage(String lang) async {
    if (lang == _wantLang && lang == _lang) return;
    _wantLang = lang;
    await _subscribe();
  }

  static Future<void> setPremium(bool premium) async {
    if (premium == _wantPremium && premium == _premium) return;
    _wantPremium = premium;
    await _subscribe();
  }
}
