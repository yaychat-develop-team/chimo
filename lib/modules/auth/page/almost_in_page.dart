import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // LengthLimitingTextInputFormatter
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../logic/almost_in_logic.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/theme/app_text.dart';
import '../../profile/page/widgets/photo_pick_sheet.dart';
import '../../../common/widgets/app_scaffold.dart';

/// 注册收尾：头像 + 昵称（Figma 完善资料 — You're almost in!）。
class AlmostInPage extends StatefulWidget {
  const AlmostInPage({super.key});

  @override
  State<AlmostInPage> createState() => _AlmostInPageState();
}

class _AlmostInPageState extends State<AlmostInPage> {
  late final TextEditingController _nickController;
  late final AlmostInLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(AlmostInLogic());
    _nickController = TextEditingController(text: logic.draftNickname);
  }

  @override
  void dispose() {
    _nickController.dispose();
    Get.delete<AlmostInLogic>();
    super.dispose();
  }

  Future<void> _pickAvatar() async {
    final action = await showPhotoPickSheet(context);
    if (!mounted || action == null) return;
    await logic.uploadAvatar(fromCamera: action == PhotoPickAction.takePhoto);
  }

  Widget _buildAvatar() {
    // 刚选完是本地路径，上传成功后换成远程地址；来源由 AppImage 判断，
    // 两者都为空或加载失败时统一落到 fallbackAsset。
    final local = logic.localAvatarPath.value?.trim() ?? '';
    final remote = logic.remoteAvatarUrl.value?.trim() ?? '';
    final Widget image = Chimo.image(
      local.isNotEmpty ? local : remote,
      width: 112,
      height: 112,
      fit: BoxFit.cover,
      fallbackAsset: AppAssets.defaultAvatar,
    );

    return SizedBox(
      width: 112,
      height: 112,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(child: image),
          if (logic.uploadingAvatar.value)
            const Positioned.fill(
              child: ColoredBox(
                color: AppColors.black40,
                child: Center(
                  child: SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
            ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Chimo.image(AppAssets.cameraIcon, width: 32, height: 32),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final keyboardOpen = MediaQuery.viewInsetsOf(context).bottom > 0;

    return AppScaffold(
      backgroundColor: AppColors.black111111,
      appBar: AppNavBar(
        title: "You're almost in!",
        trailing: Chimo.s.skipButton(enabled: !logic.busy, onPressed: logic.skip),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.fromLTRB(30, 16, 30, 16 + bottom),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 12),
                  const Text(
                    "You're almost in!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'A great profile picture and nickname help you stand out.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: keyboardOpen ? 20 : 40),
                  Center(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _pickAvatar,
                        customBorder: const CircleBorder(),
                        child: _buildAvatar(),
                      ),
                    ),
                  ),
                  SizedBox(height: keyboardOpen ? 20 : 36),
                  Container(
                    height: 54,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.black2A2A2A,
                      borderRadius: BorderRadius.circular(27),
                    ),
                    child: TextField(
                      controller: _nickController,
                      enabled: !logic.submitting.value,
                      textAlign: TextAlign.center,
                      style: AppText.field,
                      cursorColor: AppColors.green00F875,
                      inputFormatters: [LengthLimitingTextInputFormatter(20)],
                      decoration: const AppInputDecoration(
                        isCollapsed: true,
                        hintText: 'Enter a nickname',
                        hintStyle: TextStyle(color: AppColors.gray8A8A8A, fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(height: keyboardOpen ? 28 : 48),
                  Center(
                    child: Chimo.s.gradientButton(
                      label: logic.submitting.value ? 'Saving…' : "Let's Go!",
                      onTap: logic.submitting.value
                          ? null
                          : () => logic.letsGo(_nickController.text),
                      enabled: !logic.submitting.value,
                      width: 134,
                      labelStyle: TextStyle(
                        color: AppColors.black1C1C1E,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
