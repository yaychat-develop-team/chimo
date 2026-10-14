import 'package:chimo/app/session_info.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../app/chimo_api.dart';
import '../../../common/extensions/wire_view.dart';

/// 关于页：本地版本号、检查更新、官网链接带上用户 id。
class AboutUsLogic extends GetxController {
  AboutUsLogic({required this.fallbackVersion, required this.fallbackWebsite});

  final String fallbackVersion;
  final String fallbackWebsite;

  final RxString version = ''.obs;
  final RxBool checkingUpdate = false.obs;

  @override
  void onReady() {
    super.onReady();
    loadVersion();
  }

  Future<void> loadVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      if (!isClosed) version.value = info.version;
    } catch (_) {
      if (!isClosed) version.value = fallbackVersion;
    }
  }

  /// 检查更新后要展示的那一句。
  Future<String> checkUpdateMessage() async {
    if (checkingUpdate.value) return '';
    checkingUpdate.value = true;
    try {
      final current = version.value;
      final versionRes = await ChimoApis.app.versionCheck(
        version: current.isEmpty ? fallbackVersion : current,
      );
      final info = versionRes.data;
      if (versionRes.ok && info != null && versionHasUpdate(info.updateMod)) {
        final latest = info.latestVersion.isEmpty
            ? info.latestVersionNo.toString()
            : info.latestVersion;
        return 'Update available · $latest';
      }
      return 'You are already using the latest version.';
    } catch (_) {
      return 'Unable to check for updates';
    } finally {
      if (!isClosed) checkingUpdate.value = false;
    }
  }

  /// 官网地址附上当前用户 id，方便网页侧识别。
  String websiteUrl(String base) {
    final raw = base.trim().isEmpty ? fallbackWebsite : base.trim();
    final uid = SessionInfo.currentUser?.id.toString() ?? '';
    final uri = Uri.tryParse(raw);
    if (uri == null) return raw;
    return uri
        .replace(queryParameters: {...uri.queryParameters, if (uid.isNotEmpty) 'uid': uid})
        .toString();
  }
}
