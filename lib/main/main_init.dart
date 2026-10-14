import 'package:chimo/app/session_info.dart';

abstract class MainInit {
  /// true 表示已初始化，防止并发/重入
  static bool hasInit = false;

  ///启动初始化
  static Future launchInit() async {
    // 在方法入口立即设为 true，防止并发重入（分步异步间隙导致的重复执行）
    if (hasInit) return;
    hasInit = true;
    try {
      await SessionInfo.authLogin();
    } catch (e) {
      hasInit = false;
    }
  }

}