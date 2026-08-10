import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/network/app_apis.dart';
import '../../core/widgets/app_page_scaffold.dart';
import '../../core/widgets/app_settings_tile.dart';
import 'joy_coins_help_page.dart';
import 'levels_help_page.dart';

/// 帮助入口：打开时加载配置；FAQ 正文仍用本地设计文案。
class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_prefetch());
    });
  }

  Future<void> _prefetch() async {
    try {
      await Future.wait([
        AppApis.user.conf(),
        AppApis.app.settings(),
      ]);
    } catch (_) {
      // 静态 FAQ 离线仍可用。
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Chimo',
      loading: _loading,
      body: Column(
        children: [
          AppSettingsTile(
            title: 'Joy Coins Recharge',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const JoyCoinsHelpPage(),
                ),
              );
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFF2A2A2C)),
          AppSettingsTile(
            title: 'Levels',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const LevelsHelpPage(),
                ),
              );
            },
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFF2A2A2C)),
        ],
      ),
    );
  }
}
