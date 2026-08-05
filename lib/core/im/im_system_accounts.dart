import '../../core/constants/app_assets.dart';

/// EaseMob system / official conversation ids (match forya CusTomMessage).
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

  /// Local avatar asset for system rows.
  static String avatarAsset(String conversationId) {
    // Dedicated icons not vendored yet; reuse system icon.
    return AppAssets.sysIcon;
  }

  static bool isNewFriends(String? conversationId) =>
      conversationId?.trim() == newFriends;
}
