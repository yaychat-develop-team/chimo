import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../logic/blacklist_logic.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/app_settings_tile.dart';
import '../logic/privacy_settings_logic.dart';
import '../../../common/utils/app_toast.dart';

/// 隐私开关，由 GET/POST `/app/settings` 驱动。
///
/// 状态与「乐观更新 + 失败回滚」都在 [PrivacySettingsLogic] 里；
/// 这里只负责渲染与提示（失败文案由 logic 的方法返回）。
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

  /// 每个开关都是「先拨过去 → 失败回滚 + 提示」。
  Future<void> _toggle(BuildContext context, Future<String?> Function() action) async {
    final error = await action();
    if (error == null || !context.mounted) return;
    AppToast.error(error);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChimoScaffold(
        title: 'Privacy Setting',
        loading: logic.loading.value || logic.saving.value,
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.surfaceSheet,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  AppSettingsTile(title: 'Blacklist', onTap: AppJumper.toBlacklist),
                  const _RowDivider(),
                  _SwitchRow(
                    title: 'Online status: Invisible',
                    value: logic.isHidden.value,
                    onChanged: (v) => unawaited(_toggle(context, () => logic.setHidden(v))),
                  ),
                  const _RowDivider(),
                  _SwitchRow(
                    title: 'Your guest is in stealth mode',
                    value: logic.isInvisibleVisit.value,
                    onChanged: (v) => unawaited(_toggle(context, () => logic.setInvisibleVisit(v))),
                  ),
                  const _RowDivider(),
                  _SwitchRow(
                    title: 'Speak anonymously',
                    value: logic.isInvisibleUpMic.value,
                    onChanged: (v) => unawaited(_toggle(context, () => logic.setInvisibleUpMic(v))),
                  ),
                  const _RowDivider(),
                  _SwitchRow(
                    title: 'Block messages from strangers',
                    value: logic.blockStrangers.value,
                    onChanged: (v) => unawaited(_toggle(context, () => logic.setBlockStrangers(v))),
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
  Widget build(BuildContext context) =>
      const Divider(height: 1, thickness: 1, color: AppColors.divider, indent: 16, endIndent: 16);
}

class BlacklistPage extends StatefulWidget {
  const BlacklistPage({super.key});

  @override
  State<BlacklistPage> createState() => _BlacklistPageState();
}

class _BlacklistPageState extends State<BlacklistPage> {
  late final BlacklistLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(BlacklistLogic());
  }

  @override
  void dispose() {
    Get.delete<BlacklistLogic>();
    super.dispose();
  }

  Future<void> _unblock(SimpleUser user) async {
    final failure = await logic.unblock(user.id.toString());
    if (!mounted) return;
    if (failure != null) AppToast.error(failure);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChimoScaffold(
        title: 'Blacklist',
        loading: logic.loading.value,
        body: logic.users.isEmpty && !logic.loading.value
            ? const Center(
                child: Text('No blocked users', style: TextStyle(color: AppColors.textSecondary)),
              )
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                itemCount: logic.users.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final user = logic.users[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceSheet,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: AppColors.divider,
                          backgroundImage: AppImage.providerOf(user.avatar),
                          child: user.avatar.isEmpty
                              ? const Icon(Icons.person, color: AppColors.textSecondary)
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            user.nickname,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        TextButton(onPressed: () => _unblock(user), child: const Text('Unblock')),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class _SwitchRow extends StatelessWidget {
  const _SwitchRow({required this.title, required this.value, required this.onChanged});

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
                color: AppColors.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Switch.adaptive(
            value: value,
            activeThumbColor: AppColors.primaryBright,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
