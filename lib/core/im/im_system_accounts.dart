import '../../core/constants/app_assets.dart';

/// EaseMob 系统 / 官方会话 id（与 forya CusTomMessage 一致）。
abstract final class ImSystemAccounts {
  static const String official = 'man-official-account';
  static const String officialCmd = 'officical-account-cmd-push';
  static const String fleet = 'fleet-system-account';
  static const String risingStar = 'rs-system-account';
  static const String newFriends = 'new-friends-system-account';
  static const String gameCenter = 'game-official-account';

  static bool isSystemAccount(String? conversationId) {
    final id = conversationId?.trim() ?? '';
    if (id.isEmpty) return false;
    return id == official ||
        id == officialCmd ||
        id == fleet ||
        id == risingStar ||
        id == newFriends ||
        id == gameCenter;
  }

  static String displayName(String conversationId) {
    return switch (conversationId) {
      gameCenter => 'Game Center',
      fleet => 'Fleet notification',
      risingStar => 'Rising Star',
      newFriends => 'New Friends',
      _ => 'System Message',
    };
  }

  /// 系统会话行的本地头像资源。
  static String avatarAsset(String conversationId) {
    // 专用图标尚未纳入资源包，暂复用系统图标。
    return AppAssets.sysIcon;
  }

  static bool isNewFriends(String? conversationId) =>
      conversationId?.trim() == newFriends;
}
