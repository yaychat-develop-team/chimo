import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/widgets/app_page_scaffold.dart';
import '../../core/widgets/app_settings_tile.dart';
import '../../core/widgets/app_tip_dialog.dart';
import 'bind_email_page.dart';
import 'privacy_settings_page.dart';

/// Settings: account security, privacy, clear cache, log out.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
    final confirmed = await AppTipDialog.show(
      context,
      message: 'Are you sure you want to log out?',
      confirmLabel: 'Log out',
    );
    if (!context.mounted || !confirmed) return;

    await NetworkBootstrap.clearSession();
    if (!context.mounted) return;
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
                          builder: (_) => const BindEmailPage(),
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
                onTap: () => _onLogout(context),
                borderRadius: BorderRadius.circular(16),
                child: const SizedBox(
                  height: 54,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        color: Color(0xFFE44E50),
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
