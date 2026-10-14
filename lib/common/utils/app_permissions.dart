import 'package:permission_handler/permission_handler.dart';

import '../theme/app_dialog.dart';

/// 一次权限申请的结果。
///
/// [explained] 为 true 时，工具已经用弹窗告诉用户怎么开，调用方不必再 Toast。
class AppPermissionOutcome {
  const AppPermissionOutcome({required this.granted, required this.explained});

  final bool granted;
  final bool explained;

  static const ok = AppPermissionOutcome(granted: true, explained: false);
}

/// 系统权限申请。业务只问能不能用，系统弹窗和「去设置」都在这里。
abstract final class AppPermissions {
  /// 麦克风。上麦、语音消息都走这一处。
  static Future<AppPermissionOutcome> microphone({
    String settingsTitle = 'Microphone',
    String settingsBody = 'Allow microphone access to join the mic.',
  }) {
    return _ensure(
      Permission.microphone,
      settingsTitle: settingsTitle,
      settingsBody: settingsBody,
    );
  }

  static Future<AppPermissionOutcome> _ensure(
    Permission permission, {
    required String settingsTitle,
    required String settingsBody,
  }) async {
    var status = await permission.status;
    if (_allowed(status)) return AppPermissionOutcome.ok;

    if (status.isDenied) {
      status = await permission.request();
      if (_allowed(status)) return AppPermissionOutcome.ok;
    }

    if (!status.isPermanentlyDenied && !status.isRestricted) {
      return const AppPermissionOutcome(granted: false, explained: false);
    }

    final open = await AppDialog.show(
      title: settingsTitle,
      content: settingsBody,
      confirmLabel: 'Settings',
      cancelLabel: 'Cancel',
      buttons: DialogLoyoutStyle.horizontal,
    );
    if (open == true) {
      await openAppSettings();
    }
    return const AppPermissionOutcome(granted: false, explained: true);
  }

  static bool _allowed(PermissionStatus status) => status.isGranted || status.isLimited;
}
