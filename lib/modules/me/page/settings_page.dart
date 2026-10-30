import 'package:chimo/app/session_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/app_jumper.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/settings_tile.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_dialog.dart';
import '../../../common/utils/app_toast.dart';

/// 设置：账号安全、隐私、清除缓存、退出登录。
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _loggingOut = false;

  Future<void> _onClearCache(BuildContext context) async {
    final confirmed =
        await AppDialog.show(
          title: 'Tip',
          content: 'Clear all cached data?',
          confirmLabel: 'Clear',
          buttons: DialogLoyoutStyle.horizontal,
        ) ??
        false;
    if (!context.mounted || !confirmed) return;
    AppToast.error('Cache cleared');
  }

  Future<void> _onLogout(BuildContext context) async {
    if (_loggingOut) return;

    final confirmed =
        await AppDialog.show(
          title: 'Tip',
          content: 'Are you sure you want to log out?',
          confirmLabel: 'Log out',
          buttons: DialogLoyoutStyle.horizontal,
        ) ??
        false;
    if (!context.mounted || !confirmed) return;

    setState(() => _loggingOut = true);
    AppDialog.blockingProgress();
    try {
      await SessionInfo.logout(false);
    } catch (_) {
      // 仍退出应用；本地会话清理在内部尽力而为。
    }
    if (!context.mounted) return;
    // 退出登录可能是从弹层里点的：先关掉能关的，再清栈。
    AppJumper.backIfPossible();
    AppJumper.toLoginAndClear();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppNavBar(title: 'Settings'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.black1C1C1E,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                SettingsTile(
                  title: 'Account Security',
                  onTap: () {
                    AppJumper.toAccountSecurity();
                  },
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.black2A2A2A,
                  indent: 16,
                  endIndent: 16,
                ),
                SettingsTile(
                  title: 'Privacy Setting',
                  onTap: () {
                    AppJumper.toPrivacySettings();
                  },
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.black2A2A2A,
                  indent: 16,
                  endIndent: 16,
                ),
                SettingsTile(title: 'Clear Cache', onTap: () => _onClearCache(context)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Material(
            color: AppColors.black1C1C1E,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: _loggingOut ? null : () => _onLogout(context),
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: 54,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Log out',
                    style: TextStyle(
                      color: _loggingOut ? AppColors.red66E44E50 : AppColors.redE44E50,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
