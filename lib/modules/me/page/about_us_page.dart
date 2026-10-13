import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/constants/app_links.dart';
import '../logic/about_us_logic.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/app_webview_page.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/utils/app_toast.dart';

/// About Us — layout/behavior aligned with forya [AboutPage].
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({
    super.key,
    this.fallbackVersion = '1.0.0',
    this.fallbackWebsite = AppLinks.officialWebsite,
  });

  final String fallbackVersion;
  final String fallbackWebsite;

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  late final AboutUsLogic logic;
  late final String _websiteUrl;

  static const _websiteGreen = AppColors.accentLimeDim;

  @override
  void initState() {
    super.initState();
    _websiteUrl = widget.fallbackWebsite;
    logic = Get.put(
      AboutUsLogic(
        fallbackVersion: widget.fallbackVersion,
        fallbackWebsite: widget.fallbackWebsite,
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<AboutUsLogic>();
    super.dispose();
  }

  Future<void> _checkUpdate() async {
    final message = await logic.checkUpdateMessage();
    if (!mounted || message.isEmpty) return;
    _toast(message);
  }

  void _toast(String message) {
    AppToast.error(message);
  }

  Future<void> _openWebsite() async {
    final url = logic.websiteUrl(_websiteUrl);
    if (!mounted) return;
    await AppWebViewPage.open(context, url: url, title: 'Official Website');
  }

  Future<void> _openAgreement({required String title, required String url}) {
    return AppWebViewPage.open(context, url: url, title: title);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChimoScaffold(
        title: 'About Us',
        body: Column(
          children: [
            const SizedBox(height: 103),
            AppImage(AppAssets.aboutLogo, width: 72, height: 72, fit: BoxFit.contain),
            const SizedBox(height: 14),
            AppImage(
              AppAssets.titleLogo,
              width: 82,
              height: 20,
              fit: BoxFit.contain,
              error: const Text(
                'Chimo',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (logic.version.value.isNotEmpty)
              GestureDetector(
                onTap: _checkUpdate,
                behavior: HitTestBehavior.opaque,
                child: Text(
                  'Current version: ${logic.version.value}',
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
                      url: AppLinks.userAgreement,
                    ),
                  ),
                  _AboutItem(
                    title: 'Privacy Agreement',
                    onTap: () =>
                        _openAgreement(title: 'Privacy Agreement', url: AppLinks.privacyAgreement),
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
      ),
    );
  }
}

class _AboutItem extends StatelessWidget {
  const _AboutItem({required this.title, this.subDesc = '', this.subDescColor, this.onTap});

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
                AppImage(
                  AppAssets.mineArrow,
                  width: 7,
                  height: 12,
                  color: Colors.white.withValues(alpha: 0.55),
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
