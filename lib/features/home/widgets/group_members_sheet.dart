import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_asset_image.dart';
import '../data/group_members_mock_data.dart';

/// Group members bottom sheet with fuzzy nickname search.
class GroupMembersSheet extends StatefulWidget {
  const GroupMembersSheet({
    super.key,
    this.members = GroupMembersMockData.members,
    this.onMemberTap,
  });

  final List<GroupMember> members;
  final ValueChanged<GroupMember>? onMemberTap;

  static Future<void> show(
    BuildContext context, {
    List<GroupMember>? members,
    ValueChanged<GroupMember>? onMemberTap,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (context) => GroupMembersSheet(
        members: members ?? GroupMembersMockData.members,
        onMemberTap: onMemberTap,
      ),
    );
  }

  @override
  State<GroupMembersSheet> createState() => _GroupMembersSheetState();
}

class _GroupMembersSheetState extends State<GroupMembersSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Fuzzy match: ignore case/spaces; supports substring contains.
  bool _matches(GroupMember member, String rawQuery) {
    final query = rawQuery.trim().toLowerCase().replaceAll(RegExp(r'\s+'), '');
    if (query.isEmpty) return true;
    final name = member.nickname.toLowerCase().replaceAll(RegExp(r'\s+'), '');
    if (name.contains(query)) return true;
    // Simple subsequence: query chars appear in order in nickname.
    var i = 0;
    for (final code in name.codeUnits) {
      if (code == query.codeUnitAt(i)) {
        i++;
        if (i >= query.length) return true;
      }
    }
    return false;
  }

  List<GroupMember> get _filtered => [
        for (final m in widget.members)
          if (_matches(m, _query)) m,
      ];

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final height = MediaQuery.sizeOf(context).height * 0.72;
    final filtered = _filtered;

    return Align(
      alignment: Alignment.bottomCenter,
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
                          onChanged: (v) => setState(() => _query = v),
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
              Expanded(
                child: filtered.isEmpty
                    ? const Center(
                        child: Text(
                          'No members found',
                          style: TextStyle(
                            color: AppColors.textTertiary,
                            fontSize: 14,
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 16 + bottom),
                        itemCount: filtered.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 18),
                        itemBuilder: (context, index) {
                          final member = filtered[index];
                          return _MemberRow(
                            member: member,
                            onTap: widget.onMemberTap == null
                                ? null
                                : () => widget.onMemberTap!(member),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
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
            child: Image.asset(
              member.avatarAsset,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
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
