import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_page_scaffold.dart';
import '../../core/widgets/app_settings_tile.dart';

/// Privacy switches backed by GET/POST `/app/settings`.
class PrivacySettingsPage extends StatefulWidget {
  const PrivacySettingsPage({super.key});

  @override
  State<PrivacySettingsPage> createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  bool _loading = true;
  bool _saving = false;
  bool _isHidden = false;
  bool _isInvisibleVisit = false;
  bool _isInvisibleUpMic = false;
  bool _blockStrangers = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_load());
    });
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final res = await AppApis.app.settings();
      if (!mounted) return;
      if (res.ok && res.data != null) {
        final data = res.data!;
        setState(() {
          _isHidden = data.isHidden;
          _isInvisibleVisit = data.isInvisibleVisit;
          _isInvisibleUpMic = data.isInvisibleUpMic;
          _blockStrangers = data.blockStrangers;
          _loading = false;
        });
      } else {
        setState(() => _loading = false);
        _toast(res.message.isEmpty ? 'Failed to load settings' : res.message);
      }
    } catch (error) {
      if (!mounted) return;
      setState(() => _loading = false);
      _toast('Failed to load settings: $error');
    }
  }

  Future<void> _set(String field, bool value, VoidCallback rollback) async {
    setState(() => _saving = true);
    try {
      final res = await AppApis.app.updateSettings({field: value});
      if (!mounted) return;
      if (!res.ok) {
        rollback();
        _toast(res.message.isEmpty ? 'Update failed' : res.message);
      }
    } catch (error) {
      if (!mounted) return;
      rollback();
      _toast('Update failed: $error');
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  void _toast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Privacy Setting',
      loading: _loading || _saving,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                AppSettingsTile(
                  title: 'Blacklist',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const BlacklistPage(),
                      ),
                    );
                  },
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFF2A2A2C),
                  indent: 16,
                  endIndent: 16,
                ),
                _SwitchRow(
                  title: 'Online status: Invisible',
                  value: _isHidden,
                  onChanged: (v) {
                    final prev = _isHidden;
                    setState(() => _isHidden = v);
                    unawaited(
                      _set(
                        'isHidden',
                        v,
                        () => setState(() => _isHidden = prev),
                      ),
                    );
                  },
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFF2A2A2C),
                  indent: 16,
                  endIndent: 16,
                ),
                _SwitchRow(
                  title: 'Your guest is in stealth mode',
                  value: _isInvisibleVisit,
                  onChanged: (v) {
                    final prev = _isInvisibleVisit;
                    setState(() => _isInvisibleVisit = v);
                    unawaited(
                      _set(
                        'isInvisibleVisit',
                        v,
                        () => setState(() => _isInvisibleVisit = prev),
                      ),
                    );
                  },
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFF2A2A2C),
                  indent: 16,
                  endIndent: 16,
                ),
                _SwitchRow(
                  title: 'Speak anonymously',
                  value: _isInvisibleUpMic,
                  onChanged: (v) {
                    final prev = _isInvisibleUpMic;
                    setState(() => _isInvisibleUpMic = v);
                    unawaited(
                      _set(
                        'isInvisibleUpMic',
                        v,
                        () => setState(() => _isInvisibleUpMic = prev),
                      ),
                    );
                  },
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFF2A2A2C),
                  indent: 16,
                  endIndent: 16,
                ),
                _SwitchRow(
                  title: 'Block messages from strangers',
                  value: _blockStrangers,
                  onChanged: (v) {
                    final prev = _blockStrangers;
                    setState(() => _blockStrangers = v);
                    unawaited(
                      _set(
                        'accessStrangerMessage',
                        !v,
                        () => setState(() => _blockStrangers = prev),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlacklistPage extends StatefulWidget {
  const BlacklistPage({super.key});

  @override
  State<BlacklistPage> createState() => _BlacklistPageState();
}

class _BlacklistPageState extends State<BlacklistPage> {
  bool _loading = true;
  List<BlacklistUser> _users = const [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_load());
    });
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final res = await AppApis.relation.blackList();
      if (!mounted) return;
      setState(() {
        _users = res.data ?? const [];
        _loading = false;
      });
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _unblock(BlacklistUser user) async {
    final res = await AppApis.relation.setBlackList(
      userId: user.id,
      isCancel: true,
    );
    if (!mounted) return;
    if (!res.ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.message.isEmpty ? 'Failed' : res.message),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    setState(() => _users = _users.where((u) => u.id != user.id).toList());
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Blacklist',
      loading: _loading,
      body: _users.isEmpty && !_loading
          ? const Center(
              child: Text(
                'No blocked users',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              itemCount: _users.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final user = _users[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: const Color(0xFF2A2A2C),
                        backgroundImage: user.avatarUrl.isEmpty
                            ? null
                            : NetworkImage(user.avatarUrl),
                        child: user.avatarUrl.isEmpty
                            ? const Icon(
                                Icons.person,
                                color: AppColors.textSecondary,
                              )
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          user.name,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _unblock(user),
                        child: const Text('Unblock'),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
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
