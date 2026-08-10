import 'package:flutter/material.dart';

import '../../core/network/app_apis.dart';
import '../../core/widgets/app_page_scaffold.dart';
import '../../core/widgets/app_settings_tile.dart';
import 'account_cancel_result_page.dart';
import 'account_cancellation_page.dart';

/// 账号安全入口（对齐 forya AccountSecurityPage）。
class AccountSecurityPage extends StatefulWidget {
  const AccountSecurityPage({super.key});

  static const routeName = 'AccountSecurityPage';

  @override
  State<AccountSecurityPage> createState() => _AccountSecurityPageState();
}

class _AccountSecurityPageState extends State<AccountSecurityPage> {
  bool _loading = true;
  bool _hasApplyForCancel = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final res = await AppApis.user.hasApplyForCancel();
      if (!mounted) return;
      setState(() {
        _hasApplyForCancel = res.ok && res.data == true;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  Future<void> _openCancelAccount() async {
    if (_hasApplyForCancel) {
      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => const AccountCancelResultPage(),
        ),
      );
    } else {
      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => const AccountCancellationPage(),
        ),
      );
    }
    if (mounted) await _load();
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Account Security',
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: AppSettingsTile(
                      title: 'Cancel Account',
                      onTap: _openCancelAccount,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
