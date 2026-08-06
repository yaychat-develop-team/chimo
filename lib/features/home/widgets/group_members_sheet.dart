import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/app_router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/network/app_apis.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_asset_image.dart';
import '../../../core/widgets/network_or_asset_avatar.dart';
import '../../../shared/models/group_member.dart';

/// Group members bottom sheet with nickname search (API-backed).
class GroupMembersSheet extends StatefulWidget {
  const GroupMembersSheet({
    super.key,
    required this.groupId,
    this.onMemberTap,
  });

  final String groupId;
  final ValueChanged<GroupMember>? onMemberTap;

  static Future<void> show(
    BuildContext context, {
    required String groupId,
    ValueChanged<GroupMember>? onMemberTap,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (context) => GroupMembersSheet(
        groupId: groupId,
        onMemberTap: onMemberTap,
      ),
    );
  }

  @override
  State<GroupMembersSheet> createState() => _GroupMembersSheetState();
}

class _GroupMembersSheetState extends State<GroupMembersSheet> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  List<GroupMember> _members = const [];
  bool _loading = true;
  String? _error;
  bool _needsLogin = false;
  String _query = '';

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _load({String searchKey = ''}) async {
    setState(() {
      _loading = true;
      _error = null;
      _needsLogin = false;
    });
    try {
      final res = await AppApis.group.members(
        widget.groupId,
        searchKey: searchKey,
      );
      if (!mounted) return;
      if (!res.ok) {
        final notLogin = res.isNotLogin;
        setState(() {
          _loading = false;
          _members = const [];
          _needsLogin = notLogin;
          _error = notLogin
              ? 'Session expired. Please log in again.'
              : (res.message.isEmpty ? 'Failed to load members' : res.message);
        });
        return;
      }
      setState(() {
        _members = res.data ?? const [];
        _loading = false;
        _error = null;
        _needsLogin = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _members = const [];
        _error = '$error';
      });
    }
  }

  void _onQueryChanged(String value) {
    setState(() => _query = value);
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 320), () {
      unawaited(_load(searchKey: value.trim()));
    });
  }

  void _goLogin() {
    Navigator.of(context).pop();
    context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final height = MediaQuery.sizeOf(context).height * 0.72;

    // isScrollControlled sheets fill the screen; Align alone still hits the
    // transparent top and blocks barrier dismiss — tap empty area to close.
    return SizedBox.expand(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).maybePop(),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: height,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 18),
                    const Text(
                      'Group Members',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 44,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2C2C2E),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          children: [
                            const AppAssetImage(
                              AppAssets.msgSearch,
                              width: 18,
                              height: 18,
                              color: AppColors.textTertiary,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                onChanged: _onQueryChanged,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                cursorColor: AppColors.primaryBright,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: 'Enter a nickname to search',
                                  hintStyle: TextStyle(
                                    color: AppColors.textTertiary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(child: _buildBody(bottom)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(double bottom) {
    if (_loading) {
      return const Center(
        child: SizedBox(
          width: 28,
          height: 28,
          child: CircularProgressIndicator(strokeWidth: 2.4),
        ),
      );
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _error!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              if (_needsLogin)
                TextButton(
                  onPressed: _goLogin,
                  child: const Text('Log in'),
                )
              else
                TextButton(
                  onPressed: () =>
                      unawaited(_load(searchKey: _query.trim())),
                  child: const Text('Retry'),
                ),
            ],
          ),
        ),
      );
    }
    if (_members.isEmpty) {
      return Center(
        child: Text(
          _query.trim().isEmpty ? 'No members' : 'No members found',
          style: const TextStyle(
            color: AppColors.textTertiary,
            fontSize: 14,
          ),
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 16 + bottom),
      itemCount: _members.length,
      separatorBuilder: (_, _) => const SizedBox(height: 18),
      itemBuilder: (context, index) {
        final member = _members[index];
        return _MemberRow(
          member: member,
          onTap: widget.onMemberTap == null
              ? null
              : () => widget.onMemberTap!(member),
        );
      },
    );
  }
}

class _MemberRow extends StatelessWidget {
  const _MemberRow({required this.member, this.onTap});

  final GroupMember member;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          ClipOval(
            child: NetworkOrAssetAvatar(
              asset: member.avatarAsset,
              url: member.avatarUrl,
              width: 48,
              height: 48,
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              member.nickname,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            member.isMale ? AppAssets.genderMan : AppAssets.genderWoman,
            width: 18,
            height: 18,
          ),
        ],
      ),
    );
  }
}
