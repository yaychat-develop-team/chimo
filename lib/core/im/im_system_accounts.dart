import '../../core/constants/app_assets.dart';

/// EaseMob 系统 / 官方会话 id（与 forya CusTomMessage 一致）。
abstract final class ImSystemAccounts {
  static const String official = 'man-official-account';
  static const String officialCmd = 'officical-account-cmd-push';
  static const String fleet = 'fleet-system-account';
  static const String risingStar = 'rs-system-account';
  static const String newFriends = 'new-friends-system-account';
  static const String gameCenter = 'game-official-account';

  static String _bareId(String? conversationId) {
    final id = conversationId?.trim() ?? '';
    if (id.startsWith('dm_')) return id.substring(3);
    if (id.startsWith('sys_')) return id.substring(4);
    return id;
  }

  /// 官方号：环信侧始终为私聊（Chat），不得当群聊处理。
  static bool isOfficialAccount(String? conversationId) {
    final id = _bareId(conversationId);
    if (id.isEmpty) return false;
    return id == official || id == officialCmd || id == gameCenter;
  }

  /// 暂时屏蔽的官方号（线上 / 测试都不进消息列表）。
  static bool isSuppressedOfficialChat(String? conversationId) {
    final id = _bareId(conversationId);
    if (id.isEmpty) return false;
    return id == official || id == officialCmd;
  }

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
      official || officialCmd => 'Official',
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
