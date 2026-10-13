import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_scaffold.dart';
import '../logic/account_security_logic.dart';
import '../../../common/widgets/app_settings_tile.dart';
import '../../../common/theme/app_colors.dart';

/// 账号安全入口（对齐 forya AccountSecurityPage）。
class AccountSecurityPage extends StatefulWidget {
  const AccountSecurityPage({super.key});

  @override
  State<AccountSecurityPage> createState() => _AccountSecurityPageState();
}

class _AccountSecurityPageState extends State<AccountSecurityPage> {
  late final AccountSecurityLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(AccountSecurityLogic());
  }

  @override
  void dispose() {
    Get.delete<AccountSecurityLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChimoScaffold(
        title: 'Account Security',
        body: logic.loading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.surfaceSheet,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: AppSettingsTile(
                        title: 'Cancel Account',
                        onTap: logic.openCancelAccount,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
