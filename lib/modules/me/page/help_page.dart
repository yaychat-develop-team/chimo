import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_scaffold.dart';
import '../logic/help_logic.dart';
import '../../../common/widgets/app_settings_tile.dart';
import '../../../common/theme/app_colors.dart';
import '../../../app/app_jumper.dart';

/// 帮助入口：打开时加载配置；FAQ 正文仍用本地设计文案。
class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  late final HelpLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(HelpLogic());
  }

  @override
  void dispose() {
    Get.delete<HelpLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChimoScaffold(
        title: 'Chimo',
        loading: logic.loading.value,
        body: Column(
          children: [
            AppSettingsTile(
              title: 'Joy Coins Recharge',
              onTap: () {
                AppJumper.toJoyCoinsHelp();
              },
            ),
            const Divider(height: 1, thickness: 1, color: AppColors.divider),
            AppSettingsTile(
              title: 'Levels',
              onTap: () {
                AppJumper.toLevelsHelp();
              },
            ),
            const Divider(height: 1, thickness: 1, color: AppColors.divider),
          ],
        ),
      ),
    );
  }
}
