import 'package:flutter/material.dart';

import 'app/chimo_app.dart';

/// 应用入口：初始化 Flutter 绑定后启动 [ChimoApp]。
void main() {
  // 确保插件、平台通道等在 runApp 前完成初始化。
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ChimoApp());
}
