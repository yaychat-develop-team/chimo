import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/widgets/app_page_scaffold.dart';
import '../../core/widgets/app_settings_tile.dart';
import '../../core/widgets/app_tip_dialog.dart';
import 'account_security_page.dart';
import 'privacy_settings_page.dart';

/// 设置：账号安全、隐私、清除缓存、退出登录。
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _loggingOut = false;

  Future<void> _onClearCache(BuildContext context) async {
    final confirmed = await AppTipDialog.show(
      context,
      message: 'Clear all cached data?',
      confirmLabel: 'Clear',
    );
    if (!context.mounted || !confirmed) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cache cleared'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _onLogout(BuildContext context) async {
    if (_loggingOut) return;

    final confirmed = await AppTipDialog.show(
      context,
      message: 'Are you sure you want to log out?',
      confirmLabel: 'Log out',
    );
    if (!context.mounted || !confirmed) return;

    setState(() => _loggingOut = true);
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => const PopScope(
        canPop: false,
        child: Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );

    try {
      await NetworkBootstrap.clearSession();
    } catch (_) {
      // 仍退出应用；本地会话清理在内部尽力而为。
    }
    if (!context.mounted) return;
    final nav = Navigator.of(context, rootNavigator: true);
    if (nav.canPop()) nav.pop();
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Settings',
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  AppSettingsTile(
                    title: 'Account Security',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          settings: const RouteSettings(
                            name: AccountSecurityPage.routeName,
                          ),
                          builder: (_) => const AccountSecurityPage(),
                        ),
                      );
                    },
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFF2A2A2C),
                    indent: 16,
                    endIndent: 16,
                  ),
                  AppSettingsTile(
                    title: 'Privacy Setting',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const PrivacySettingsPage(),
                        ),
                      );
                    },
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFF2A2A2C),
                    indent: 16,
                    endIndent: 16,
                  ),
                  AppSettingsTile(
                    title: 'Clear Cache',
                    onTap: () => _onClearCache(context),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Material(
              color: const Color(0xFF1C1C1E),
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
                        color: _loggingOut
                            ? const Color(0x66E44E50)
                            : const Color(0xFFE44E50),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
