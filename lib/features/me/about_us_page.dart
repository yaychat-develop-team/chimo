import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/agreement_page.dart';

/// About Us: logo, version (version-check), website, agreement links.
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
      final api = NetworkBootstrap.api;
      final results = await Future.wait([
        api.versionCheck(version: widget.fallbackVersion),
        api.userConf(),
        api.appSettings(),
      ]);
      if (!mounted) return;

      var version = widget.fallbackVersion;
      var website = widget.fallbackWebsite;
      var hasUpdate = false;

      final versionRes = results[0];
      if (versionRes.success && versionRes.data is Map) {
        final data = Map<String, dynamic>.from(versionRes.data as Map);
        final remote =
            '${data['version'] ?? data['latestVersion'] ?? data['appVersion'] ?? ''}';
        if (remote.isNotEmpty) version = remote;
        hasUpdate = data['needUpdate'] == true ||
            data['forceUpdate'] == true ||
            data['hasUpdate'] == true;
        final url = '${data['downloadUrl'] ?? data['url'] ?? data['h5Url'] ?? ''}';
        if (url.startsWith('http')) website = url;
      }

      final conf = results[1];
      if (conf.success && conf.data is Map) {
        final data = Map<String, dynamic>.from(conf.data as Map);
        for (final key in [
          'website',
          'webUrl',
          'h5Url',
          'h5Domain',
          'officialWebsite',
          'gsGuideUrl',
        ]) {
          final v = '${data[key] ?? ''}';
          if (v.startsWith('http')) {
            website = v;
            break;
          }
        }
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

  void _openAgreement(String title) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => AgreementPage(title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
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
                    'About Us',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            if (_loading)
              const LinearProgressIndicator(
                minHeight: 2,
                color: AppColors.primaryBright,
                backgroundColor: Colors.transparent,
              ),
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
                      onTap: () =>
                          _openAgreement('User Service Agreement'),
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
                      onTap: () => _openAgreement('Privacy Agreement'),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 20 + bottom),
              child: const Text(
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
