import '../../../core/constants/app_assets.dart';
import '../models/me_models.dart';

/// Me page Quick Access menu (static UI config, not user data).
abstract final class MeMenuData {
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
