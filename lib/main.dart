import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';

import 'app/chimo_app.dart';
import 'core/iap/iap_service.dart';
import 'core/network/api_config.dart';
import 'core/network/network_bootstrap.dart';
import 'core/utils/log.dart';

/// 应用入口：初始化 Flutter 绑定，然后运行 [ChimoApp]。
Future<void> main() async {
  // 确保插件与平台通道在 runApp 之前就绪。
  WidgetsFlutterBinding.ensureInitialized();
  initTalker();
  ApiConfig.bootstrapBuildFlags();
  await IapService.init();
  try {
    final ping = await NetworkBootstrap.initialize();
    logger.info('API ping success=${ping.success} code=${ping.code} message=${ping.message}');
  } catch (error, stack) {
    logger.error('API bootstrap failed', error, stack);
  }

  // 请求 App Tracking Transparency 授权（仅 iOS 14.5+）。
  // 苹果 Guideline 5.1.2(i)：收集用于追踪用户的数据前，必须通过
  // AppTrackingTransparency 框架获得用户许可。
  await _requestTrackingAuthorization();

  runApp(const ChimoApp());
}

/// 向用户请求广告追踪授权。
///
/// - 仅在 iOS 平台执行，Android 不受 ATT 限制。
/// - 若状态为 [TrackingStatus.notDetermined]，则弹出系统授权弹窗。
/// - 其他状态（已授权 / 已拒绝 / 受限）直接返回，不再重复弹窗。
Future<void> _requestTrackingAuthorization() async {
  if (!Platform.isIOS) return;

  try {
    final status =
        await AppTrackingTransparency.trackingAuthorizationStatus;
    logger.info('[ATT] current status: $status');

    if (status == TrackingStatus.notDetermined) {
      // 系统要求：必须在 runApp / UI 显示后才能弹窗，
      // 部分设备首次冷启动时平台通道尚未就绪，稍作延迟以确保可靠弹出。
      await Future<void>.delayed(const Duration(milliseconds: 2000));
      final result =
          await AppTrackingTransparency.requestTrackingAuthorization();
      logger.info('[ATT] user decision: $result');
    }
  } catch (e, stack) {
    // 非致命错误，不应阻塞启动。
    logger.error('[ATT] error', e, stack);
  }
}
