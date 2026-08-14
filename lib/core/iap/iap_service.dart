import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

import '../auth/auth_session.dart';
import '../network/app_apis.dart';
import '../network/auth_request_headers.dart';

/// 对齐 forya `JRIap`：商店购买 → 服务端验单。
abstract final class IapService {
  static const applePayType = 'APPLE_APP_STORE';
  static const googlePayType = 'GOOGLE_PLAY';

  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final StreamController<void> _recharged =
      StreamController<void>.broadcast();

  static StreamSubscription<List<PurchaseDetails>>? _sub;
  static bool _inited = false;
  static bool _paying = false;
  static int _retryCount = 0;
  static const _maxRetry = 3;
  static final Map<String, String> _orderBySku = {};
  static final Map<String, ProductDetails> _products = {};
  static List<CashChargeProduct> products = const [];

  static Stream<void> get rechargeCompleted => _recharged.stream;
  static bool get isPaying => _paying;

  static Future<void> init() async {
    if (_inited) return;
    _inited = true;
    _sub = InAppPurchase.instance.purchaseStream.listen(
      _onPurchases,
      onError: (Object error) {
        debugPrint('IapService stream error: $error');
        _paying = false;
        _toast(_errorText(error));
      },
    );
  }

  static void dispose() {
    unawaited(_sub?.cancel() ?? Future<void>.value());
    _sub = null;
    _inited = false;
  }

  static Future<List<CashChargeProduct>> applyStorePrices(
    List<CashChargeProduct> list,
  ) async {
    products = list;
    final ids = list.map((e) => e.goodsId).where((e) => e.isNotEmpty).toSet();
    if (ids.isEmpty) return list;
    try {
      final available = await InAppPurchase.instance.isAvailable();
      if (!available) return list;
      final resp = await InAppPurchase.instance.queryProductDetails(ids);
      for (final p in resp.productDetails) {
        _products[p.id] = p;
      }
      return [
        for (final item in list)
          item.copyWith(localPrice: _products[item.goodsId]?.price),
      ];
    } catch (error) {
      debugPrint('IapService queryProductDetails: $error');
      return list;
    }
  }

  static Future<void> buy(CashChargeProduct? product) async {
    if (product == null) {
      _toast('Please select the amount.');
      return;
    }
    if (_paying) {
      _toast('Purchase in progress');
      return;
    }
    final sku = product.goodsId.trim();
    final bizId = product.productId.trim();
    if (sku.isEmpty || bizId.isEmpty) {
      _toast('Failed to load data.');
      return;
    }
    _paying = true;
    try {
      ProductDetails? details = _products[sku];
      details ??= await _queryOne(sku);
      if (details == null) {
        _toast('Failed to load data.');
        _paying = false;
        return;
      }
      _toast('Place an order');
      final payType = Platform.isIOS ? applePayType : googlePayType;
      final created = await AppApis.cash.createChargeOrder(
        productId: bizId,
        payItemType: payType,
      );
      final orderId = (created.data ?? '').trim();
      if (!created.ok || orderId.isEmpty) {
        _toast(
          created.message.isEmpty
              ? 'Order creation failed'
              : 'Order creation failed: ${created.message}',
        );
        _paying = false;
        return;
      }
      _orderBySku[sku] = orderId;
      _products[sku] = details;
      _toast('Payment in progress');
      final uid = (await AuthSession.userId())?.trim();
      await InAppPurchase.instance.buyConsumable(
        purchaseParam: PurchaseParam(
          productDetails: details,
          applicationUserName: (uid == null || uid.isEmpty) ? null : uid,
        ),
      );
    } on PlatformException catch (error) {
      debugPrint('IapService buy: $error');
      _paying = false;
      _toast(error.message ?? 'Purchase failed');
    } catch (error) {
      debugPrint('IapService buy: $error');
      _paying = false;
      _toast('Purchase failed');
    }
  }

  static Future<ProductDetails?> _queryOne(String sku) async {
    try {
      final resp = await InAppPurchase.instance.queryProductDetails({sku});
      if (resp.productDetails.isEmpty) return null;
      final details = resp.productDetails.first;
      _products[details.id] = details;
      return details;
    } catch (error) {
      debugPrint('IapService queryOne: $error');
      return null;
    }
  }

  static Future<void> _onPurchases(List<PurchaseDetails> list) async {
    if (list.isEmpty) {
      _paying = false;
      return;
    }
    for (final purchase in list) {
      debugPrint('IapService status=${purchase.status} sku=${purchase.productID}');
      switch (purchase.status) {
        case PurchaseStatus.pending:
          _toast('Payment in progress');
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          await _verify(purchase);
        case PurchaseStatus.error:
          _paying = false;
          _toast(_errorText(purchase.error));
          await _finish(purchase);
        case PurchaseStatus.canceled:
          _paying = false;
          _toast('You have canceled the purchase.');
          await _finish(purchase);
      }
    }
  }

  static Future<void> _verify(PurchaseDetails purchase) async {
    final orderId = _orderBySku[purchase.productID] ?? '';
    final receipt = purchase.verificationData.serverVerificationData;
    final purchaseId = purchase.purchaseID ?? '';
    if (orderId.isEmpty || receipt.isEmpty || purchaseId.isEmpty) {
      _paying = false;
      return;
    }
    _retryCount = 0;
    await _verifyOnce(purchase, orderId);
  }

  static Future<void> _verifyOnce(
    PurchaseDetails purchase,
    String orderId,
  ) async {
    _paying = true;
    _toast('Verifying...');
    final uid = (await AuthSession.userId())?.trim() ?? '';
    final extra = <String, dynamic>{
      'packageName': AuthRequestHeaders.commonParam['package_name'] ?? '',
      'productId': purchase.productID,
    };
    if (Platform.isIOS) {
      extra['transactionId'] = purchase.purchaseID;
      extra['receipt'] = purchase.verificationData.serverVerificationData;
    } else {
      extra['purchaseToken'] =
          purchase.verificationData.serverVerificationData;
    }
    try {
      final result = await AppApis.cash.verifyReceipt(
        orderId: orderId,
        userId: uid,
        extraJson: jsonEncode(extra),
      );
      if (result.ok && result.data != null && result.data!.isSuccess) {
        _toast('Charged');
        _orderBySku.remove(purchase.productID);
        await _consumeAndroid(purchase);
        await _finish(purchase);
        _paying = false;
        _recharged.add(null);
        return;
      }
      if (result.ok && result.data != null && result.data!.isPaying) {
        await _retryVerify(purchase, orderId);
        return;
      }
      if (result.code == 1001510121) {
        await _retryVerify(purchase, orderId);
        return;
      }
      if (result.code == 1001510116 || result.code == 1001510117) {
        await _consumeAndroid(purchase);
        await _finish(purchase);
      }
      _toast(
        result.message.isEmpty ? 'Charge failed' : result.message,
      );
    } catch (error) {
      _toast('$error');
    } finally {
      _paying = false;
    }
  }

  static Future<void> _retryVerify(
    PurchaseDetails purchase,
    String orderId,
  ) async {
    _retryCount++;
    if (_retryCount > _maxRetry) {
      _paying = false;
      _toast(
        'Error! Please try restoring the purchase or contact customer service.',
      );
      return;
    }
    await Future<void>.delayed(Duration(milliseconds: 600 * _retryCount));
    await _verifyOnce(purchase, orderId);
  }

  static Future<void> _consumeAndroid(PurchaseDetails purchase) async {
    if (!Platform.isAndroid) return;
    try {
      final addition = InAppPurchase.instance
          .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      await addition.consumePurchase(purchase);
    } catch (error) {
      debugPrint('IapService consume: $error');
    }
  }

  static Future<void> _finish(PurchaseDetails purchase) async {
    if (!purchase.pendingCompletePurchase && !Platform.isIOS) return;
    try {
      await InAppPurchase.instance.completePurchase(purchase);
    } catch (error) {
      debugPrint('IapService completePurchase: $error');
    }
  }

  static void _toast(String message) {
    debugPrint('IapService: $message');
    final messenger = scaffoldMessengerKey.currentState;
    if (messenger == null) return;
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  static String _errorText(Object? error) {
    if (error is IAPError) {
      return iapErrorMap[error.code] ??
          (error.message.isEmpty ? 'Purchase error' : error.message);
    }
    if (error is PlatformException) {
      return iapErrorMap[error.code] ?? (error.message ?? 'Purchase error');
    }
    return 'Purchase error';
  }
}

const iapErrorMap = {
  'E_UNKNOWN': 'Unknown error, please retry.',
  'E_SERVICE_ERROR': 'Error! Please try again later.',
  'E_USER_CANCELLED': 'You have canceled the purchase.',
  'E_USER_ERROR': 'Payment failed',
  'E_ITEM_UNAVAILABLE': 'The item does not exist.',
  'E_REMOTE_ERROR': 'Error from a remote source',
  'E_NETWORK_ERROR':
      'Network connection error! Please check your network and try again',
};
