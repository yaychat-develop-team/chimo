import 'package:flutter/material.dart';

import 'app/chimo_app.dart';
import 'core/iap/iap_service.dart';
import 'core/network/network_bootstrap.dart';

/// 应用入口：初始化 Flutter 绑定，然后运行 [ChimoApp]。
Future<void> main() async {
  // 确保插件与平台通道在 runApp 之前就绪。
  WidgetsFlutterBinding.ensureInitialized();
  await IapService.init();
  try {
    final ping = await NetworkBootstrap.initialize();
    debugPrint(
      'API ping success=${ping.success} code=${ping.code} message=${ping.message}',
    );
  } catch (error, stack) {
    debugPrint('API bootstrap failed: $error\n$stack');
  }
  runApp(const ChimoApp());
}
