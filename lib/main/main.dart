import 'dart:async';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:chimo/common/utils/cache_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/network/config/api_store.dart';
import '../app/network/config/proxy_store.dart';
import '../app/network/http/auth_request_headers.dart';
import 'chimo_app.dart';
import '../modules/chat/logic/chats_list_logic.dart';
import '../app/service/iap_service.dart';
import '../app/app_config.dart';
import '../app/network/http/media_upload.dart';
import '../app/storage/app_storage.dart';
import '../common/utils/app_log.dart';
import '../common/utils/log.dart';
import '../common/widgets/app_image.dart';

/// 应用入口：初始化 Flutter 绑定，然后运行 [ChimoApp]。
Future<void> main() async {
  // 确保插件与平台通道在 runApp 之前就绪。
  final binding = WidgetsFlutterBinding.ensureInitialized();
  initTalker();
  AppConfig.init();
  ApiStore.load();
  ProxyStore.load();
  await AuthRequestHeaders.initialize();
  // 本地存储必须早于任何读缓存的初始化（NetworkBootstrap 会读 token /
  // 环境 / 代理），否则那些读会拿到 null 并静默降级。
  await AppStorage.init();
  // 接口返回的图片多为不带域名的相对 key，注入 CDN 域名后
  // AppImage 拿到 `/upload/xxx.jpg` 也能直接加载。
  AppImage.configure(cdnBase: MediaUpload.cdnDomain);
  await IapService.init();
  await CacheUtil.init();
  binding.addPostFrameCallback((_) {
    unawaited(_requestTrackingAuthorization());
  });

  runApp(const ChimoApp());
}

/// 向用户请求广告追踪授权。
///
/// - 仅在 iOS 平台执行，Android 不受 ATT 限制。
/// - 若状态为 [TrackingStatus.notDetermined]，则弹出系统授权弹窗。
/// - 其他状态（已授权 / 已拒绝 / 受限）直接返回，不再重复弹窗。
/// - 由 `main()` 在首帧回调里 fire-and-forget 调用，不阻塞启动。
Future<void> _requestTrackingAuthorization() async {
  if (!Platform.isIOS) return;

  try {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    AppLog.d('main ATT current status=$status');

    if (status == TrackingStatus.notDetermined) {
      // 系统要求：必须在 UI 显示后才能弹窗。首帧回调已满足这一点，
      // 但部分设备首次冷启动时平台通道仍未就绪，稍作延迟以确保可靠弹出。
      await Future<void>.delayed(const Duration(milliseconds: 2000));
      final result = await AppTrackingTransparency.requestTrackingAuthorization();
      AppLog.i('main ATT user decision=$result');
    }
  } catch (e, stack) {
    // 非致命错误，不应阻塞启动。
    AppLog.w('main ATT request failed', error: e, stack: stack);
  }
}
