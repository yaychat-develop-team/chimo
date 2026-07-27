import '../models/me_models.dart';
import '../../../core/constants/app_assets.dart';

/// 个人中心 Mock 数据（后续可替换为接口）。
abstract final class MeMockData {
  static const MeProfile profile = MeProfile(
    displayName: 'Seraphina',
    userId: '4757119063',
    avatarAsset: AppAssets.avatarPlace,
    friends: 208,
    fans: 88000,
    follows: 22000,
    visitors: 88000,
  );

  /// 社交数据展示列表（已格式化）。
  static const List<MeStatItem> stats = [
    MeStatItem(label: 'Friends', value: '208'),
    MeStatItem(label: 'Fans', value: '88K'),
    MeStatItem(label: 'Follows', value: '22K'),
    MeStatItem(label: 'Visitors', value: '88K'),
  ];

  /// Quick Access 菜单项（对齐设计稿 6 项）。
  static const List<QuickAccessItem> quickAccess = [
    QuickAccessItem(
      id: 'debug',
      label: 'Debug Page',
      iconAsset: AppAssets.mineInfo,
    ),
    QuickAccessItem(
      id: 'information',
      label: 'Information',
      iconAsset: AppAssets.mineInfo,
    ),
    QuickAccessItem(
      id: 'bind_email',
      label: 'Bind Email',
      iconAsset: AppAssets.mineBind,
    ),
    QuickAccessItem(
      id: 'settings',
      label: 'Settings',
      iconAsset: AppAssets.mineSetting,
    ),
    QuickAccessItem(
      id: 'help',
      label: 'Help',
      iconAsset: AppAssets.mineHelp,
    ),
    QuickAccessItem(
      id: 'about',
      label: 'About Us',
      iconAsset: AppAssets.mineAbout,
    ),
  ];
}