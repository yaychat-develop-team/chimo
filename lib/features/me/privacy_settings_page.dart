import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/network/network_bootstrap.dart';
import '../../core/theme/app_colors.dart';

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
      final res = await NetworkBootstrap.api.appSettings();
      if (!mounted) return;
      if (res.success && res.data is Map) {
        final data = Map<String, dynamic>.from(res.data as Map);
        setState(() {
          _isHidden = data['isHidden'] == true;
          _isInvisibleVisit = data['isInvisibleVisit'] == true;
          _isInvisibleUpMic = data['isInvisibleUpMic'] == true;
          final access = data['accessStrangerMessage'];
          _blockStrangers = access == false;
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
      final res = await NetworkBootstrap.api.updateAppSettings({field: value});
      if (!mounted) return;
      if (!res.success) {
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 48,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: SvgPicture.asset(
                        AppAssets.chatBack,
                        width: 17,
                        height: 7,
                      ),
                    ),
                  ),
                  const Text(
                    'Privacy Setting',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            if (_loading || _saving)
              const LinearProgressIndicator(
                minHeight: 2,
                color: AppColors.primaryBright,
                backgroundColor: Colors.transparent,
              ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        _NavRow(
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
            ),
          ],
        ),
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
  List<_BlackUser> _users = const [];

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
      final res = await NetworkBootstrap.api.getBlackList();
      if (!mounted) return;
      final users = <_BlackUser>[];
      if (res.success && res.data is Map) {
        final data = Map<String, dynamic>.from(res.data as Map);
        final list = data['userList'] ?? data['list'] ?? data['blackList'];
        if (list is List) {
          for (final item in list) {
            if (item is! Map) continue;
            final id = '${item['id'] ?? item['userId'] ?? ''}';
            final name =
                '${item['nickname'] ?? item['nickName'] ?? item['name'] ?? id}';
            final avatar = '${item['avatar'] ?? item['avatarUrl'] ?? ''}';
            if (id.isEmpty) continue;
            users.add(_BlackUser(id: id, name: name, avatarUrl: avatar));
          }
        }
      }
      setState(() {
        _users = users;
        _loading = false;
      });
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _unblock(_BlackUser user) async {
    final res = await NetworkBootstrap.api.setBlackList(
      userId: user.id,
      isCancel: true,
    );
    if (!mounted) return;
    if (!res.success) {
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: SvgPicture.asset(
                        AppAssets.chatBack,
                        width: 17,
                        height: 7,
                      ),
                    ),
                  ),
                  const Text(
                    'Blacklist',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            if (_loading)
              const LinearProgressIndicator(
                minHeight: 2,
                color: AppColors.primaryBright,
                backgroundColor: Colors.transparent,
              ),
            Expanded(
              child: _users.isEmpty && !_loading
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
            ),
          ],
        ),
      ),
    );
  }
}

class _BlackUser {
  const _BlackUser({
    required this.id,
    required this.name,
    required this.avatarUrl,
  });

  final String id;
  final String name;
  final String avatarUrl;
}

class _NavRow extends StatelessWidget {
  const _NavRow({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondary,
              size: 22,
            ),
          ],
        ),
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
