import '../../../core/constants/app_assets.dart';
import '../../../core/network/api_config.dart';
import '../models/me_models.dart';

/// Me 页快捷入口菜单（静态 UI 配置，非用户数据）。
abstract final class MeMenuData {
  /// 正式包（`DEBUG_MODE=false`）不展示 Debug Page，对齐 forya。
  static List<QuickAccessItem> get quickAccess {
    return List.unmodifiable([
      if (ApiConfig.isDebug)
        const QuickAccessItem(
          id: 'debug',
          label: 'Debug Page',
          iconAsset: AppAssets.mineInfo,
        ),
      const QuickAccessItem(
        id: 'information',
        label: 'Information',
        iconAsset: AppAssets.mineInfo,
      ),
      const QuickAccessItem(
        id: 'bind_email',
        label: 'Bind Email',
        iconAsset: AppAssets.mineBind,
      ),
      const QuickAccessItem(
        id: 'settings',
        label: 'Settings',
        iconAsset: AppAssets.mineSetting,
      ),
      const QuickAccessItem(
        id: 'help',
        label: 'Help',
        iconAsset: AppAssets.mineHelp,
      ),
      const QuickAccessItem(
        id: 'about',
        label: 'About Us',
        iconAsset: AppAssets.mineAbout,
      ),
    ]);
  }
}
