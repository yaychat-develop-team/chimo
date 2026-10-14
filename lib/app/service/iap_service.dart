import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chimo/app/session_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

import '../chimo_api.dart';
import '../../common/models/server_client/cash.pb.dart';
import '../../common/models/server_client/common/pay.pbenum.dart';
import '../network/http/auth_request_headers.dart';
import '../../common/utils/app_log.dart';
import '../../common/utils/app_toast.dart';

/// 对齐 forya `JRIap`：商店购买 → 服务端验单。
abstract final class IapService {
  static const applePayType = 4; // PayItemType.APPLE_APP_STORE
  static const googlePayType = 13; // PayItemType.GOOGLE_PLAY

  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final StreamController<void> _recharged = StreamController<void>.broadcast();

  static StreamSubscription<List<PurchaseDetails>>? _sub;
  static bool _inited = false;
  static bool _paying = false;
  static int _retryCount = 0;
  static const _maxRetry = 3;
  static final Map<String, String> _orderBySku = {};
  static final Map<String, ProductDetails> _products = {};
  static List<CashChargeProductListItem> products = const [];

  static Stream<void> get rechargeCompleted => _recharged.stream;
  static bool get isPaying => _paying;

  static Future<void> init() async {
    if (_inited) return;
    _inited = true;
    if (Platform.isIOS) {
      final ios = InAppPurchase.instance
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await ios.setDelegate(_IosPaymentQueueDelegate());
    }
    _sub = InAppPurchase.instance.purchaseStream.listen(
      _onPurchases,
      onError: (Object error) {
        AppLog.e('IapService stream error', error: error);
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

  static Future<List<CashChargeProductListItem>> applyStorePrices(
    List<CashChargeProductListItem> list,
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
          item.deepCopy()..localPrice = _products[item.goodsId]?.price ?? item.localPrice,
      ];
    } catch (error) {
      AppLog.d('IapService queryProductDetails', error: error);
      return list;
    }
  }

  static Future<void> buy(CashChargeProductListItem? product) async {
    if (product == null) {
      _toast('Please select the amount.');
      return;
    }
    if (_paying) {
      _toast('Purchase in progress');
      return;
    }
    final sku = product.goodsId.trim();
    final rawId = product.id.toString();
    final bizId = rawId == '0' ? sku : rawId;
    if (sku.isEmpty || bizId.isEmpty) {
      _toast('Package SKU missing. Cannot start purchase.');
      return;
    }
    _paying = true;
    try {
      final available = await InAppPurchase.instance.isAvailable();
      if (!available) {
        _paying = false;
        _toast(
          Platform.isIOS
              ? 'App Store is unavailable on this device.'
              : 'Google Play Billing is unavailable on this device.',
        );
        return;
      }
      ProductDetails? details = _products[sku];
      details ??= await _queryOne(sku);
      if (details == null) {
        _paying = false;
        _toast('Store product not found: $sku');
        return;
      }
      AppLog.i('IapService createOrder bizId=$bizId sku=$sku');
      final payType = Platform.isIOS ? applePayType : googlePayType;
      final created = await ChimoApis.cash.createChargeOrder(
        productId: bizId,
        payItemType: payType,
      );
      final orderId = created.data?.orderId.toString() ?? '';
      if (orderId == '0') {
        _paying = false;
        _toast('Order creation failed');
        return;
      }
      if (!created.ok || orderId.isEmpty) {
        _paying = false;
        _toast(
          created.message.isEmpty
              ? 'Order creation failed'
              : 'Order creation failed: ${created.message}',
        );
        return;
      }
      _orderBySku[sku] = orderId;
      _products[sku] = details;
      AppLog.i('IapService buyConsumable orderId=$orderId');
      final started = await InAppPurchase.instance.buyConsumable(
        purchaseParam: PurchaseParam(
          productDetails: details,
          applicationUserName: SessionInfo.uid.toString(),
        ),
      );
      if (!started) {
        _paying = false;
        _toast('Unable to start the store purchase sheet.');
      }
    } on PlatformException catch (error) {
      AppLog.d('IapService buy', error: error);
      _paying = false;
      _toast(error.message ?? 'Purchase failed');
    } catch (error) {
      AppLog.d('IapService buy', error: error);
      _paying = false;
      _toast('Purchase failed: $error');
    }
  }

  static Future<ProductDetails?> _queryOne(String sku) async {
    try {
      final resp = await InAppPurchase.instance.queryProductDetails({sku});
      AppLog.d(
        'IapService query sku=$sku found=${resp.productDetails.map((e) => e.id).toList()} '
        'notFound=${resp.notFoundIDs}',
      );
      if (resp.productDetails.isEmpty) return null;
      final details = resp.productDetails.first;
      _products[details.id] = details;
      return details;
    } catch (error) {
      AppLog.d('IapService queryOne', error: error);
      return null;
    }
  }

  static Future<void> _onPurchases(List<PurchaseDetails> list) async {
    if (list.isEmpty) {
      _paying = false;
      return;
    }
    for (final purchase in list) {
      AppLog.d('IapService status=${purchase.status} sku=${purchase.productID}');
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

  static Future<void> _verifyOnce(PurchaseDetails purchase, String orderId) async {
    _paying = true;
    _toast('Verifying...');
    final uid = SessionInfo.currentUser?.id.toString().trim() ?? '';
    final extra = <String, dynamic>{
      'packageName': AuthRequestHeaders.commonParam['package_name'] ?? '',
      'productId': purchase.productID,
    };
    if (Platform.isIOS) {
      extra['transactionId'] = purchase.purchaseID;
      extra['receipt'] = purchase.verificationData.serverVerificationData;
    } else {
      extra['purchaseToken'] = purchase.verificationData.serverVerificationData;
    }
    try {
      final result = await ChimoApis.cash.verifyReceipt(
        orderId: orderId,
        userId: uid,
        extraJson: jsonEncode(extra),
      );
      if (result.ok && result.data != null && _payStatus(result.data!) == PayStatus.SUCCESS) {
        _toast('Charged');
        _orderBySku.remove(purchase.productID);
        await _consumeAndroid(purchase);
        await _finish(purchase);
        _paying = false;
        _recharged.add(null);
        return;
      }
      if (result.ok && result.data != null && _payStatus(result.data!) == PayStatus.PAYING) {
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
      _toast(result.message.isEmpty ? 'Charge failed' : result.message);
    } catch (error) {
      _toast('$error');
    } finally {
      _paying = false;
    }
  }

  static Future<void> _retryVerify(PurchaseDetails purchase, String orderId) async {
    _retryCount++;
    if (_retryCount > _maxRetry) {
      _paying = false;
      _toast('Error! Please try restoring the purchase or contact customer service.');
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
      AppLog.w('IapService consume', error: error);
    }
  }

  static Future<void> _finish(PurchaseDetails purchase) async {
    if (!purchase.pendingCompletePurchase && !Platform.isIOS) return;
    try {
      await InAppPurchase.instance.completePurchase(purchase);
    } catch (error) {
      AppLog.w('IapService completePurchase', error: error);
    }
  }

  static void _toast(String message) {
    AppLog.d('IapService toast: $message');
    AppToast.info(message);
  }

  static PayStatus _payStatus(CashChargeCheckRsp response) {
    if (response.item.isEmpty) return PayStatus.PayStatus_UNKNOWN;
    return response.item.first.payStatus;
  }

  static String _errorText(Object? error) {
    if (error is IAPError) {
      return iapErrorMap[error.code] ?? (error.message.isEmpty ? 'Purchase error' : error.message);
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
  'E_NETWORK_ERROR': 'Network connection error! Please check your network and try again',
};

class _IosPaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
    SKPaymentTransactionWrapper transaction,
    SKStorefrontWrapper storefront,
  ) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() => false;
}
