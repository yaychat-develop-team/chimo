import '../../../common/constants/app_assets.dart';
import '../../../app/app_config.dart';

/// Me 页快捷入口。静态 UI 配置，不是接口模型。
class QuickAccessItem {
  const QuickAccessItem({required this.id, required this.label, required this.iconAsset});

  final String id;
  final String label;
  final String iconAsset;
}

/// 统计行项（好友 / 粉丝等）。
class MeStatItem {
  const MeStatItem({required this.label, required this.value, this.badge = 0});

  final String label;
  final String value;

  /// 红点未读数。0 不展示。
  final int badge;
}

/// Me 页菜单与玩法入口（静态 UI 配置，非用户数据）。
abstract final class MeMenuData {
  /// 左上角菜单：设置类入口。正式包不展示 Debug。
  static List<QuickAccessItem> get menuItems {
    return List.unmodifiable([
      if (AppConfig.isDebug)
        const QuickAccessItem(id: 'debug', label: 'Debug Page', iconAsset: AppAssets.mineInfo),
      const QuickAccessItem(id: 'bind_email', label: 'Bind Email', iconAsset: AppAssets.mineBind),
      const QuickAccessItem(id: 'settings', label: 'Settings', iconAsset: AppAssets.mineSetting),
      const QuickAccessItem(id: 'help', label: 'Help', iconAsset: AppAssets.mineHelp),
      const QuickAccessItem(id: 'about', label: 'About Us', iconAsset: AppAssets.mineAbout),
    ]);
  }

  /// Featured Games。图标已导入，跳转按现有页面能接到的接。
  static const featuredGames = <QuickAccessItem>[
    QuickAccessItem(id: 'mount', label: 'Mount', iconAsset: AppAssets.mineMount),
    QuickAccessItem(id: 'frame', label: 'Frame', iconAsset: AppAssets.mineFrame),
    QuickAccessItem(id: 'market', label: 'Marketplace', iconAsset: AppAssets.mineMarket),
    QuickAccessItem(id: 'honor', label: 'Honor', iconAsset: AppAssets.mineMedal),
    QuickAccessItem(id: 'pet', label: 'Battle Pet', iconAsset: AppAssets.minePet),
    QuickAccessItem(id: 'echo', label: 'EchoHall', iconAsset: AppAssets.mineEchoHall),
    QuickAccessItem(id: 'charm', label: 'Charm Lv.', iconAsset: AppAssets.mineCharmLv),
    QuickAccessItem(id: 'couple', label: 'GoldCouple', iconAsset: AppAssets.mineGoldCouple),
  ];
}
