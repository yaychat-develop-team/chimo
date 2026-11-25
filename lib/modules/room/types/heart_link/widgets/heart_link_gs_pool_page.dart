import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

import '../../../../../app/chimo_api.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/extensions/wire_view.dart';
import '../../../../../common/models/server_client/user.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/widgets/gender_age_chip.dart';

/// Host 嘉宾池编辑面板（嵌在 Host Control 底部弹层内）。对齐设计图 Expand My Guest Pool。
class HeartLinkGsPoolPanel extends StatefulWidget {
  const HeartLinkGsPoolPanel({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  State<HeartLinkGsPoolPanel> createState() => _HeartLinkGsPoolPanelState();
}

class _HeartLinkGsPoolPanelState extends State<HeartLinkGsPoolPanel> {
  final _selected = <Int64>{};
  final _search = TextEditingController();
  List<User> _pool = [];
  List<User> _searchList = [];
  var _loading = true;
  var _searching = false;
  var _saving = false;
  var _searchSeq = 0;
  Timer? _searchDebounce;

  bool get _isSearching => _search.text.trim().isNotEmpty;

  List<User> get _showList => _isSearching ? _searchList : _pool;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _search.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final common = await ChimoApis.heartLink.queryCommonGs();
    final mine = await ChimoApis.heartLink.listGsPool();
    if (!mounted) return;
    if (!mine.ok && !common.ok) {
      setState(() => _loading = false);
      AppToast.error(
        mine.message.isNotEmpty
            ? mine.message
            : (common.message.isEmpty ? 'Failed to load' : common.message),
      );
      return;
    }
    final users = <User>[];
    final seen = <int>{};
    if (mine.ok && mine.data != null) {
      for (final item in mine.data!.result) {
        if (!item.hasUser()) continue;
        final id = item.user.id.toInt();
        if (id <= 0 || seen.contains(id)) continue;
        seen.add(id);
        users.add(item.user);
        _selected.add(item.user.id);
      }
    }
    if (common.ok && common.data != null) {
      for (final item in common.data!.result) {
        if (!item.hasUser()) continue;
        final id = item.user.id.toInt();
        if (id <= 0 || seen.contains(id)) continue;
        seen.add(id);
        users.add(item.user);
      }
    }
    setState(() {
      _pool = users;
      _loading = false;
    });
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    if (value.trim().isEmpty) {
      setState(() {
        _searchList = [];
        _searching = false;
      });
      return;
    }
    _searchDebounce = Timer(const Duration(milliseconds: 350), () => _doSearch(value));
  }

  Future<void> _doSearch(String key) async {
    final text = key.trim();
    if (text.isEmpty) {
      setState(() {
        _searchList = [];
        _searching = false;
      });
      return;
    }
    final seq = ++_searchSeq;
    setState(() => _searching = true);
    final result = await ChimoApis.heartLink.searchGs(text);
    if (!mounted || seq != _searchSeq) return;
    if (!result.ok) {
      setState(() => _searching = false);
      AppToast.error(result.message.isEmpty ? 'Search failed' : result.message);
      return;
    }
    setState(() {
      _searching = false;
      _searchList = result.data?.userList ?? [];
    });
  }

  Future<void> _save() async {
    if (_saving) return;
    if (_selected.isEmpty) {
      AppToast.info('Select at least one guest');
      return;
    }
    setState(() => _saving = true);
    final result = await ChimoApis.heartLink.saveGsPool(_selected.toList());
    if (!mounted) return;
    setState(() => _saving = false);
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Save failed' : result.message);
      return;
    }
    AppToast.success('Saved');
    widget.onBack();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            IconButton(
              onPressed: widget.onBack,
              icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 18),
            ),
            const Expanded(
              child: Text(
                'Expand My Guest Pool',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 4, 24, 12),
          child: Text(
            "Add familiar hosts to your pool, and we'll prioritize notifying you when they're online.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 12, height: 1.35),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: _search,
            style: const TextStyle(color: AppColors.white, fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Search by User ID or Nickname',
              hintStyle: const TextStyle(color: AppColors.gray9A9A9A, fontSize: 13),
              filled: true,
              fillColor: AppColors.white8,
              prefixIcon: UnconstrainedBox(
                child: Chimo.image(
                  AppAssets.msgSearch,
                  width: 20,
                  height: 20,
                  color: AppColors.gray9A9A9A,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onSubmitted: _doSearch,
            onChanged: _onSearchChanged,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: _loading || _searching
              ? const Center(child: CircularProgressIndicator(color: AppColors.green00F875))
              : _showList.isEmpty
                  ? const Center(
                      child: Text('No guests', style: TextStyle(color: AppColors.gray9A9A9A)),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      itemCount: _showList.length,
                      itemBuilder: (_, i) => _row(_showList[i]),
                    ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: GestureDetector(
              onTap: _saving ? null : _save,
              child: Opacity(
                opacity: _saving ? 0.6 : 1,
                child: Container(
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: AppColors.primaryGradient,
                  ),
                  child: Text(
                    _saving ? 'Saving...' : 'Save',
                    style: const TextStyle(
                      color: AppColors.black1F2518,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _row(User user) {
    final selected = _selected.contains(user.id);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selected) {
            _selected.remove(user.id);
          } else {
            _selected.add(user.id);
            if (_isSearching && !_pool.any((e) => e.id == user.id)) {
              _pool = [user, ..._pool];
            }
          }
        });
      },
      child: Container(
        height: 68,
        margin: const EdgeInsets.only(bottom: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          gradient: selected
              ? LinearGradient(
                  colors: [
                    AppColors.green00F875.withValues(alpha: 0),
                    AppColors.green00F875.withValues(alpha: 0.12),
                  ],
                )
              : null,
        ),
        child: Row(
          children: [
            Chimo.image(
              user.avatar,
              width: 42,
              height: 42,
              circle: true,
              fallbackAsset: AppAssets.avatarPlace,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          user.nickname.trim().isEmpty ? 'Guest' : user.nickname,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (user.genderKnown) ...[
                        const SizedBox(width: 4),
                        GenderAgeChip(isMale: user.male, age: user.age),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ID: ${user.id}',
                    style: const TextStyle(color: AppColors.gray9A9A9A, fontSize: 11),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.check_circle : Icons.circle_outlined,
              color: selected ? AppColors.green00F875 : AppColors.white30,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
