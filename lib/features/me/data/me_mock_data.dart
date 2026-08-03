import '../models/me_models.dart';
import '../../../core/constants/app_assets.dart';

/// Me page mock data (replace with API later).
abstract final class MeMockData {
  static const MeProfile profile = MeProfile(
    displayName: 'Seraphina',
    userId: '4757119063',
    avatarAsset: AppAssets.avatarPlace,
    friends: 5,
    fans: 8,
    follows: 7,
    visitors: 88000,
  );

  /// Social stats display list (legacy mock; Me page now uses [UserRepository]).
  static const List<MeStatItem> stats = [
    MeStatItem(label: 'Friends', value: '5'),
    MeStatItem(label: 'Fans', value: '8'),
    MeStatItem(label: 'Follows', value: '7'),
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
