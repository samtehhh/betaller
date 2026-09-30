import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

/// How a purchase attempt ended.
///
/// Backing out of the store sheet is not a failure, and the three used to be
/// one bool: the paywall could not tell "you changed your mind" from "the
/// billing service is down", so it apologised for both.
enum PurchaseOutcome {
  /// Paid for, and the entitlement is active.
  success,

  /// The user dismissed the store sheet. Say nothing.
  cancelled,

  /// The store refused, or the entitlement did not arrive.
  failed,
}

/// RevenueCat purchase service — handles initialization, entitlement checks,
/// purchasing, and restore. Wraps the purchases_flutter SDK.
class PurchaseService {
  PurchaseService._();
  static final PurchaseService _instance = PurchaseService._();
  factory PurchaseService() => _instance;

  // ── RevenueCat API Keys ────────────────────────────────────────
  // Platform-specific by design: Apple keys start with `appl_`, Google Play
  // keys with `goog_`. They are not interchangeable — handing the SDK the
  // wrong one leaves the store connection dead, with no purchases and no
  // entitlements. Both can be overridden at build time, e.g.
  //   flutter build appbundle --dart-define=RC_ANDROID_KEY=goog_xxx
  static const _iosApiKey = String.fromEnvironment(
    'RC_IOS_KEY',
    defaultValue: 'appl_pFFwABbSJFcSbIQKDftWEIAMetk',
  );
  static const _androidApiKey = String.fromEnvironment(
    'RC_ANDROID_KEY',
    defaultValue: 'goog_REPLACE_WITH_YOUR_PLAY_KEY',
  );

  // ── Entitlement & offering IDs (set these in RevenueCat dashboard) ──
  static const entitlementId = 'Premium';
  static const monthlyProductId = 'betaller.monthly';
  static const yearlyProductId = 'betaller_yearly';
  static const weeklyProductId = 'betaller.weekly';

  static const _ownProductIds = {
    monthlyProductId,
    yearlyProductId,
    weeklyProductId,
  };

  /// Whether [info] unlocks premium.
  ///
  /// The entitlement is the rule; an active subscription to one of our own
  /// products is the backstop. A product the dashboard never attached to the
  /// entitlement — betaller.weekly shipped that way — otherwise charges the
  /// user and then reports the purchase as failed. Play reports ids as
  /// `product:base-plan`, hence the split.
  static bool hasPremium(CustomerInfo info) {
    if (info.entitlements.all[entitlementId]?.isActive ?? false) return true;
    return info.activeSubscriptions.any(
      (id) => _ownProductIds.contains(id.split(':').first),
    );
  }

  /// Whether [info] positively says premium has run out: the entitlement was
  /// active once and is not now. Absence says nothing — a fresh install, a
  /// promo, or a cache miss all look the same — so only this may downgrade.
  static bool hasLapsed(CustomerInfo info) {
    final e = info.entitlements.all[entitlementId];
    return e != null && !e.isActive && !hasPremium(info);
  }

  bool _initialized = false;

  /// True once the SDK is live. Everything below returns an inert answer when
  /// it is false, so a missing key degrades to "no premium" instead of
  /// throwing at the user.
  bool get isInitialized => _initialized;

  /// Whether [key] is the kind of key the running platform can actually use.
  static bool _keyMatchesPlatform(String key) =>
      Platform.isIOS ? key.startsWith('appl_') : key.startsWith('goog_');

  // ── Initialize RevenueCat ──────────────────────────────────────
  Future<void> init() async {
    if (_initialized) return;

    final String apiKey;
    if (Platform.isIOS) {
      apiKey = _iosApiKey;
    } else if (Platform.isAndroid) {
      apiKey = _androidApiKey;
    } else {
      // Unsupported platform — skip initialization
      return;
    }

    if (!_keyMatchesPlatform(apiKey)) {
      debugPrint(
        'PurchaseService: no valid RevenueCat key for this platform '
        '(got "${apiKey.split('_').first}_…"). Purchases stay disabled — set '
        'the key via --dart-define=RC_ANDROID_KEY / RC_IOS_KEY.',
      );
      return;
    }

    try {
      await Purchases.configure(PurchasesConfiguration(apiKey));
      _initialized = true;
    } catch (e) {
      debugPrint('PurchaseService.init error: $e');
      return;
    }
    // Verbose SDK logs are for development only; they leak purchase details
    // into logcat/Console on a shipped build.
    await Purchases.setLogLevel(kDebugMode ? LogLevel.debug : LogLevel.error);
  }

  // ── Check if user has premium entitlement ─────────────────────
  Future<bool> isPremium() async {
    if (!_initialized) return false;
    try {
      return hasPremium(await Purchases.getCustomerInfo());
    } catch (e) {
      debugPrint('PurchaseService.isPremium error: $e');
      return false;
    }
  }

  /// The customer as RevenueCat last saw them, or null when the SDK is off or
  /// unreachable — never a guess, so callers can tell "no" from "don't know".
  Future<CustomerInfo?> customerInfo() async {
    if (!_initialized) return null;
    try {
      return await Purchases.getCustomerInfo();
    } catch (e) {
      debugPrint('PurchaseService.customerInfo error: $e');
      return null;
    }
  }

  /// Which of [productIds] may still be offered their free trial.
  ///
  /// StoreKit hands every product its introductory offer whether or not this
  /// Apple ID already used it, so the paywall would promise "3 days free" to
  /// someone about to be charged on day one. Missing ids mean "unknown": the
  /// check failed or the platform cannot answer, and the store's own offer
  /// stands.
  Future<Map<String, bool>> trialEligibility(List<String> productIds) async {
    if (!_initialized) return const {};
    try {
      final result = await Purchases.checkTrialOrIntroductoryPriceEligibility(
        productIds,
      );
      return {
        for (final e in result.entries)
          if (e.value.status ==
              IntroEligibilityStatus.introEligibilityStatusEligible)
            e.key: true
          else if (e.value.status ==
                  IntroEligibilityStatus.introEligibilityStatusIneligible ||
              e.value.status ==
                  IntroEligibilityStatus.introEligibilityStatusNoIntroOfferExists)
            e.key: false,
      };
    } catch (e) {
      debugPrint('PurchaseService.trialEligibility error: $e');
      return const {};
    }
  }

  // ── Get available offerings (packages/prices) ─────────────────
  Future<Offerings?> getOfferings() async {
    if (!_initialized) return null;
    try {
      final offerings = await Purchases.getOfferings();
      debugPrint(
        'PurchaseService.getOfferings current: ${offerings.current?.identifier}',
      );
      debugPrint(
        'PurchaseService.getOfferings monthly: ${offerings.current?.monthly?.storeProduct.identifier}',
      );
      debugPrint(
        'PurchaseService.getOfferings annual: ${offerings.current?.annual?.storeProduct.identifier}',
      );
      return offerings;
    } catch (e) {
      debugPrint('PurchaseService.getOfferings error: $e');
      return null;
    }
  }

  // ── Fetch products directly from StoreKit (bypasses offerings) ─
  Future<List<StoreProduct>> getProducts() async {
    if (!_initialized) return [];
    try {
      final products = await Purchases.getProducts([
        monthlyProductId,
        yearlyProductId,
        weeklyProductId,
      ]);
      debugPrint(
        'PurchaseService.getProducts: ${products.map((p) => p.identifier).toList()}',
      );
      return products;
    } catch (e) {
      debugPrint('PurchaseService.getProducts error: $e');
      return [];
    }
  }

  // ── Purchase a StoreProduct directly ─────────────────────────
  Future<PurchaseOutcome> purchaseProduct(StoreProduct product) =>
      _buy(() => Purchases.purchase(PurchaseParams.storeProduct(product)));

  // ── Purchase a package ────────────────────────────────────────
  Future<PurchaseOutcome> purchasePackage(Package package) =>
      _buy(() => Purchases.purchase(PurchaseParams.package(package)));

  /// Runs a purchase and reports how it ended.
  ///
  /// The SDK reports a cancellation as a [PlatformException] carrying a
  /// RevenueCat code, not as a [PurchasesErrorCode] thrown on its own — an
  /// `on PurchasesErrorCode catch` clause never matches it, which is how
  /// backing out of the sheet used to land in the generic failure branch.
  Future<PurchaseOutcome> _buy(Future<void> Function() attempt) async {
    try {
      await attempt();
      final info = await Purchases.getCustomerInfo();
      return hasPremium(info) ? PurchaseOutcome.success : PurchaseOutcome.failed;
    } on PlatformException catch (e) {
      final code = PurchasesErrorHelper.getErrorCode(e);
      if (code == PurchasesErrorCode.purchaseCancelledError) {
        return PurchaseOutcome.cancelled;
      }
      debugPrint('PurchaseService purchase error: $code');
      return PurchaseOutcome.failed;
    } catch (e) {
      debugPrint('PurchaseService purchase error: $e');
      return PurchaseOutcome.failed;
    }
  }

  // ── Restore previous purchases ────────────────────────────────
  /// Returns true if premium entitlement was restored.
  Future<bool> restore() async {
    if (!_initialized) return false;
    try {
      return hasPremium(await Purchases.restorePurchases());
    } catch (e) {
      debugPrint('PurchaseService.restore error: $e');
      return false;
    }
  }

  // ── Present RevenueCat native paywall UI ───────────────────
  /// Shows RevenueCat's built-in paywall. Returns true if user purchased.
  /// Throws if paywall can't be shown (so caller can fallback).
  Future<bool> presentPaywall() async {
    if (!_initialized) throw Exception('RevenueCat not initialized');
    final result = await RevenueCatUI.presentPaywall();
    return result == PaywallResult.purchased ||
        result == PaywallResult.restored;
  }

  // ── Check entitlement (screenshot pattern) ────────────────────
  /// Checks active entitlements using the pattern from RevenueCat docs.
  Future<bool> checkEntitlement() async {
    if (!_initialized) return false;
    try {
      return hasPremium(await Purchases.getCustomerInfo());
    } catch (e) {
      debugPrint('PurchaseService.checkEntitlement error: $e');
      return false;
    }
  }

  // ── Listen for customer info updates (subscription changes) ───
  void addCustomerInfoListener(void Function(CustomerInfo) listener) {
    if (!_initialized) return;
    Purchases.addCustomerInfoUpdateListener(listener);
  }
}
