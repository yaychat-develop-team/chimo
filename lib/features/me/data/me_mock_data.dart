import '../models/me_models.dart';
import '../../../core/constants/app_assets.dart';

/// Me page mock data (replace with API later).
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

  /// Social stats display list (formatted).
  static const List<MeStatItem> stats = [
    MeStatItem(label: 'Friends', value: '208'),
    MeStatItem(label: 'Fans', value: '88K'),
    MeStatItem(label: 'Follows', value: '22K'),
    MeStatItem(label: 'Visitors', value: '88K'),
  ];

  /// Quick Access menu items (6 per design).
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
    QuickAccessItem(id: 'help', label: 'Help', iconAsset: AppAssets.mineHelp),
    QuickAccessItem(
      id: 'about',
      label: 'About Us',
      iconAsset: AppAssets.mineAbout,
    ),
  ];
}
