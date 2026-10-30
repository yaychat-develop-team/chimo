import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/settings_tile.dart';
import '../logic/privacy_settings_logic.dart';

/// 隐私开关，由 GET/POST `/app/settings` 驱动。
///
/// 状态与「乐观更新 + 失败回滚」都在 [PrivacySettingsLogic] 里；
/// 这里只负责渲染。失败由 logic toast。
class PrivacySettingsPage extends StatefulWidget {
  const PrivacySettingsPage({super.key});

  @override
  State<PrivacySettingsPage> createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  late final PrivacySettingsLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(PrivacySettingsLogic());
  }

  @override
  void dispose() {
    if (Get.isRegistered<PrivacySettingsLogic>()) {
      Get.delete<PrivacySettingsLogic>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffold(
        appBar: AppNavBar(title: 'Privacy Setting'),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.black1C1C1E,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  SettingsTile(
                    title: 'Blacklist',
                    onTap: AppJumper.toBlacklist,
                  ),
                  const _RowDivider(),
                  _SwitchRow(
                    title: 'Online status: Invisible',
                    value: logic.isHidden.value,
                    onChanged: logic.setHidden,
                  ),
                  const _RowDivider(),
                  _SwitchRow(
                    title: 'Your guest is in stealth mode',
                    value: logic.isInvisibleVisit.value,
                    onChanged: logic.setInvisibleVisit,
                  ),
                  const _RowDivider(),
                  _SwitchRow(
                    title: 'Speak anonymously',
                    value: logic.isInvisibleUpMic.value,
                    onChanged: logic.setInvisibleUpMic,
                  ),
                  const _RowDivider(),
                  _SwitchRow(
                    title: 'Block messages from strangers',
                    value: logic.blockStrangers.value,
                    onChanged: logic.setBlockStrangers,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 开关之间的分隔线（原来每处都手写一遍同样的 6 行）。
class _RowDivider extends StatelessWidget {
  const _RowDivider();

  @override
  Widget build(BuildContext context) => const Divider(
    height: 1,
    thickness: 1,
    color: AppColors.black2A2A2A,
    indent: 16,
    endIndent: 16,
  );
}

class _SwitchRow extends StatelessWidget {
  const _SwitchRow({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          CupertinoSwitch(
            value: value,
            activeTrackColor: AppColors.green1BBA77,
            onChanged: (value) => onChanged(value),
          ),
        ],
      ),
    );
  }
}
