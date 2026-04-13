import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

/// RevenueCat purchase service — handles initialization, entitlement checks,
/// purchasing, and restore. Wraps the purchases_flutter SDK.
class PurchaseService {
  PurchaseService._();
  static final PurchaseService _instance = PurchaseService._();
  factory PurchaseService() => _instance;

  // ── RevenueCat API Keys ────────────────────────────────────────
  // Replace with your production keys from RevenueCat dashboard.
  static const _iosApiKey = 'appl_pFFwABbSJFcSbIQKDftWEIAMetk';
  static const _androidApiKey = 'appl_pFFwABbSJFcSbIQKDftWEIAMetk';

  // ── Entitlement & offering IDs (set these in RevenueCat dashboard) ──
  static const entitlementId = 'Premium';
  static const monthlyProductId = 'betaller.monthly';
  static const yearlyProductId = 'betaller_yearly';

  bool _initialized = false;

  // ── Initialize RevenueCat ──────────────────────────────────────
  Future<void> init() async {
    if (_initialized) return;

    late String apiKey;
    if (Platform.isIOS) {
      apiKey = _iosApiKey;
    } else if (Platform.isAndroid) {
      apiKey = _androidApiKey;
    } else {
      // Unsupported platform — skip initialization
      return;
    }

    await Purchases.configure(PurchasesConfiguration(apiKey));
    _initialized = true;

    if (kDebugMode) {
      await Purchases.setLogLevel(LogLevel.debug);
    }
  }

  // ── Check if user has premium entitlement ─────────────────────
  Future<bool> isPremium() async {
    if (!_initialized) return false;
    try {
      final info = await Purchases.getCustomerInfo();
      return info.entitlements.all[entitlementId]?.isActive ?? false;
    } catch (e) {
      debugPrint('PurchaseService.isPremium error: $e');
      return false;
    }
  }

  // ── Get available offerings (packages/prices) ─────────────────
  Future<Offerings?> getOfferings() async {
    if (!_initialized) return null;
    try {
      return await Purchases.getOfferings();
    } catch (e) {
      debugPrint('PurchaseService.getOfferings error: $e');
      return null;
    }
  }

  // ── Purchase a package ────────────────────────────────────────
  /// Returns true if the purchase was successful and entitlement is now active.
  Future<bool> purchasePackage(Package package) async {
    try {
      await Purchases.purchase(PurchaseParams.package(package));
      // After purchase, check entitlement
      final info = await Purchases.getCustomerInfo();
      return info.entitlements.all[entitlementId]?.isActive ?? false;
    } on PurchasesErrorCode catch (e) {
      if (e == PurchasesErrorCode.purchaseCancelledError) {
        return false;
      }
      debugPrint('PurchaseService.purchase error: $e');
      return false;
    } catch (e) {
      debugPrint('PurchaseService.purchase error: $e');
      return false;
    }
  }

  // ── Restore previous purchases ────────────────────────────────
  /// Returns true if premium entitlement was restored.
  Future<bool> restore() async {
    if (!_initialized) return false;
    try {
      final info = await Purchases.restorePurchases();
      return info.entitlements.all[entitlementId]?.isActive ?? false;
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
    return result == PaywallResult.purchased || result == PaywallResult.restored;
  }

  // ── Check entitlement (screenshot pattern) ────────────────────
  /// Checks active entitlements using the pattern from RevenueCat docs.
  Future<bool> checkEntitlement() async {
    if (!_initialized) return false;
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo.entitlements.active.containsKey(entitlementId);
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
