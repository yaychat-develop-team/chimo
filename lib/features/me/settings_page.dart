import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 48,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: SvgPicture.asset(
                        AppAssets.chatBack,
                        width: 17,
                        height: 7,
                      ),
                    ),
                  ),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _SettingsTile(
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
                    _SettingsTile(
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
                    _SettingsTile(
                      title: 'Clear Cache',
                      onTap: () => _onClearCache(context),
                      showChevron: true,
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
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.title,
    required this.onTap,
    this.showChevron = true,
  });

  final String title;
  final VoidCallback onTap;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (showChevron)
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textSecondary,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
