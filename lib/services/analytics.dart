import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

import '../utils/dev_tools.dart';

/// Anonymous product analytics (PostHog, EU Cloud).
///
/// What it answers: where people leave onboarding, how many reach the
/// paywall, which plan they pick and whether the purchase goes through. It
/// never identifies anyone: no name, email, birth date or heights are sent,
/// person profiles stay off, and session replay masks every text and image.
///
/// Builds with the developer switches (debug, TestFlight, local APKs) send
/// nothing, so test taps never pollute the numbers. Every call is a no-op
/// until [init] has succeeded, which also keeps widget tests silent.
class Analytics {
  Analytics._();

  /// Write-only client token; PostHog documents it as safe in public apps.
  static const _token = 'phc_kdqTYgXPrNs7ezZXJBzisxh3ZFqgiL5keA2ZUQYjZqDN';
  static const _host = 'https://eu.i.posthog.com';

  static bool _ready = false;

  /// Whether events are being sent; false in dev builds and before [init].
  static bool get enabled => _ready;

  static Future<void> init({required String appVersion}) async {
    if (kDevTools || _ready) return;
    try {
      final config = PostHogConfig(_token)
        ..host = _host
        ..captureApplicationLifecycleEvents = true
        ..personProfiles = PostHogPersonProfiles.never
        ..sessionReplay = true
        ..sessionReplayConfig.maskAllTexts = true
        ..sessionReplayConfig.maskAllImages = true;
      await Posthog().setup(config);
      _ready = true;
      await Posthog().register('app_version', appVersion);
      await Posthog().register('platform', Platform.operatingSystem);
    } catch (e) {
      debugPrint('Analytics init failed: $e');
    }
  }

  /// One event. Property values must be plain strings, numbers or bools.
  static void track(String event, [Map<String, Object>? properties]) {
    if (!_ready) return;
    Posthog().capture(eventName: event, properties: properties).catchError(
      (Object e) => debugPrint('Analytics $event failed: $e'),
    );
  }

  /// A property sent with every later event (language, region, units).
  static void setSuper(String key, Object value) {
    if (!_ready) return;
    Posthog().register(key, value).catchError(
      (Object e) => debugPrint('Analytics register $key failed: $e'),
    );
  }
}
