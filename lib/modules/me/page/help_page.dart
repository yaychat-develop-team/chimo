import 'dart:async';

import 'package:flutter/material.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/settings_tile.dart';

/// 帮助入口。打开时预热配置，FAQ 正文仍用本地文案。
class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  void initState() {
    super.initState();
    unawaited(_prefetch());
  }

  Future<void> _prefetch() async {
    try {
      await Future.wait([ChimoApis.user.conf(), ChimoApis.app.settings()]);
    } catch (_) {
      // 静态 FAQ 离线仍可用。
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppNavBar(title: 'Chimo'),
      body: Column(
        children: [
          SettingsTile(title: 'Joy Coins Recharge', onTap: AppJumper.toJoyCoinsHelp),
          const Divider(height: 1, thickness: 1, color: AppColors.black2A2A2A),
          SettingsTile(title: 'Levels', onTap: AppJumper.toLevelsHelp),
          const Divider(height: 1, thickness: 1, color: AppColors.black2A2A2A),
        ],
      ),
    );
  }
}
