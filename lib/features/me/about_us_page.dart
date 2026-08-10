import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_page_scaffold.dart';
import '../../core/widgets/app_webview_page.dart';

/// 关于我们：Logo、版本（version-check）、官网、协议链接。
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({
    super.key,
    this.fallbackVersion = '1.0.0',
    this.fallbackWebsite = 'https://test-h5.chimoapp.com',
  });

  final String fallbackVersion;
  final String fallbackWebsite;

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  late String _version = widget.fallbackVersion;
  late String _websiteUrl = widget.fallbackWebsite;
  bool _loading = true;
  bool _hasUpdate = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_load());
    });
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final versionFuture = AppApis.app.versionCheck(
        version: widget.fallbackVersion,
        fallbackWebsite: widget.fallbackWebsite,
      );
      final confFuture = AppApis.user.conf();
      final settingsFuture = AppApis.app.settings();
      final versionRes = await versionFuture;
      final conf = await confFuture;
      await settingsFuture;
      if (!mounted) return;

      var version = widget.fallbackVersion;
      var website = widget.fallbackWebsite;
      var hasUpdate = false;

      final info = versionRes.data;
      if (versionRes.ok && info != null) {
        version = info.version;
        hasUpdate = info.hasUpdate;
        if (info.websiteUrl.isNotEmpty) website = info.websiteUrl;
      }

      if (conf.ok) {
        final fromConf = UserConfDto.parseWebsite(conf.data);
        if (fromConf != null) website = fromConf;
      }

      setState(() {
        _version = version;
        _websiteUrl = website;
        _hasUpdate = hasUpdate;
        _loading = false;
      });
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _copyWebsite() async {
    await Clipboard.setData(ClipboardData(text: _websiteUrl));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Website link copied'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
      ),
    );
  }

  static const _userAgreementUrl =
      'https://www.chimoapp.com/agreements/yonghufuwu.html';
  static const _privacyAgreementUrl =
      'https://www.chimoapp.com/agreements/yinsi.html';

  Future<void> _openAgreement({
    required String title,
    required String url,
  }) {
    return AppWebViewPage.open(context, url: url, title: title);
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'About Us',
      loading: _loading,
      body: Column(
        children: [
          const SizedBox(height: 48),
          Image.asset(
            AppAssets.aboutLogo,
            width: 88,
            height: 88,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          const Text(
            'Chimo',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _hasUpdate
                ? 'Update available · $_version'
                : 'Current version: $_version',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _AboutRow(
                    label: 'Official Website',
                    trailing: Text(
                      _websiteUrl,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.primaryBright,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: _copyWebsite,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFF2A2A2C),
                    indent: 16,
                    endIndent: 16,
                  ),
                  _AboutRow(
                    label: 'User ServiceAgreement',
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.textSecondary,
                      size: 20,
                    ),
                    onTap: () => _openAgreement(
                      title: 'User Service Agreement',
                      url: _userAgreementUrl,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFF2A2A2C),
                    indent: 16,
                    endIndent: 16,
                  ),
                  _AboutRow(
                    label: 'Privacy Agreement',
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.textSecondary,
                      size: 20,
                    ),
                    onTap: () => _openAgreement(
                      title: 'Privacy Agreement',
                      url: _privacyAgreementUrl,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Copyright ©2025 All rights reserved for Chimo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textTertiary,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutRow extends StatelessWidget {
  const _AboutRow({
    required this.label,
    required this.trailing,
    required this.onTap,
  });

  final String label;
  final Widget trailing;
  final VoidCallback onTap;

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
                label,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Flexible(child: trailing),
          ],
        ),
      ),
    );
  }
}
