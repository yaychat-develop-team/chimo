import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/auth/auth_session.dart';
import '../../core/constants/app_assets.dart';
import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_page_scaffold.dart';
import '../../core/widgets/app_webview_page.dart';

/// About Us — layout/behavior aligned with forya [AboutPage].
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
  String _version = '';
  late String _websiteUrl = widget.fallbackWebsite;
  bool _checkingUpdate = false;

  static const _userAgreementUrl =
      'https://www.chimoapp.com/agreements/yonghufuwu.html';
  static const _privacyAgreementUrl =
      'https://www.chimoapp.com/agreements/yinsi.html';
  static const _websiteGreen = Color(0xFFC7EF4C);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_loadVersion());
    });
  }

  Future<void> _loadVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      if (!mounted) return;
      setState(() => _version = info.version);
    } catch (_) {
      if (!mounted) return;
      setState(() => _version = widget.fallbackVersion);
    }
  }

  Future<void> _checkUpdate() async {
    if (_checkingUpdate) return;
    setState(() => _checkingUpdate = true);
    try {
      final versionRes = await AppApis.app.versionCheck(
        version: _version.isEmpty ? widget.fallbackVersion : _version,
        fallbackWebsite: widget.fallbackWebsite,
      );
      if (!mounted) return;
      final info = versionRes.data;
      if (versionRes.ok && info != null && info.hasUpdate) {
        _toast('Update available · ${info.version}');
      } else {
        _toast('You are already using the latest version.');
      }
    } catch (_) {
      if (!mounted) return;
      _toast('Unable to check for updates');
    } finally {
      if (mounted) setState(() => _checkingUpdate = false);
    }
  }

  void _toast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _openWebsite() async {
    final base = _websiteUrl.trim().isEmpty
        ? widget.fallbackWebsite
        : _websiteUrl.trim();
    final uid = await AuthSession.userId() ?? '';
    final uri = Uri.tryParse(base);
    final url = uri == null
        ? base
        : uri
            .replace(
              queryParameters: {
                ...uri.queryParameters,
                if (uid.isNotEmpty) 'uid': uid,
              },
            )
            .toString();
    if (!mounted) return;
    await AppWebViewPage.open(
      context,
      url: url,
      title: 'Official Website',
    );
  }

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
      body: Column(
        children: [
          const SizedBox(height: 103),
          Image.asset(
            AppAssets.aboutLogo,
            width: 72,
            height: 72,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 14),
          Image.asset(
            AppAssets.titleLogo,
            width: 82,
            height: 20,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Text(
              'Chimo',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (_version.isNotEmpty)
            GestureDetector(
              onTap: _checkUpdate,
              behavior: HitTestBehavior.opaque,
              child: Text(
                'Current version: $_version',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          const SizedBox(height: 36),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _AboutItem(
                  title: 'Official Website',
                  subDesc: _websiteUrl,
                  subDescColor: _websiteGreen,
                  onTap: _openWebsite,
                ),
                _AboutItem(
                  title: 'User ServiceAgreement',
                  onTap: () => _openAgreement(
                    title: 'User Service Agreement',
                    url: _userAgreementUrl,
                  ),
                ),
                _AboutItem(
                  title: 'Privacy Agreement',
                  onTap: () => _openAgreement(
                    title: 'Privacy Agreement',
                    url: _privacyAgreementUrl,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          Text(
            'Copyright ©2025 All rights reserved for Chimo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.54),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutItem extends StatelessWidget {
  const _AboutItem({
    required this.title,
    this.subDesc = '',
    this.subDescColor,
    this.onTap,
  });

  final String title;
  final String subDesc;
  final Color? subDescColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final hasLink = subDesc.isNotEmpty;
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 50),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: hasLink ? 8 : 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title fills left; may wrap. Link / arrow stay on the right.
              Expanded(
                child: Text(
                  title,
                  softWrap: true,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (!hasLink)
                SvgPicture.asset(
                  AppAssets.mineArrow,
                  width: 7,
                  height: 12,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withValues(alpha: 0.55),
                    BlendMode.srcIn,
                  ),
                )
              else
                Text(
                  subDesc,
                  softWrap: false,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: subDescColor ?? AppColors.primaryBright,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
