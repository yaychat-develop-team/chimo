import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/network/app_apis.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_page_scaffold.dart';
import '../../../core/widgets/center_toast.dart';

/// Tag picker page (forya FriendWishPage): load catalog, save by id.
class MyTagsPage extends StatefulWidget {
  const MyTagsPage({super.key, this.initialSelected = const []});

  /// Selected tag names from `/user/info` `makeFriendsLabel`.
  final List<String> initialSelected;

  @override
  State<MyTagsPage> createState() => _MyTagsPageState();
}

class _MyTagsPageState extends State<MyTagsPage> {
  static const int maxTags = 6;
  static const int minTags = 1;

  List<MakeFriendLabelItem> _catalog = const [];
  final Set<int> _selectedIds = {};
  bool _loading = true;
  bool _saving = false;
  String? _loadError;
  OverlayEntry? _tipEntry;
  Timer? _tipTimer;

  @override
  void initState() {
    super.initState();
    unawaited(_loadCatalog());
  }

  @override
  void dispose() {
    _tipTimer?.cancel();
    _tipEntry?.remove();
    super.dispose();
  }

  Future<void> _loadCatalog() async {
    setState(() {
      _loading = true;
      _loadError = null;
    });
    try {
      final res = await AppApis.user.makeFriendLabelList();
      if (!mounted) return;
      if (!res.ok) {
        setState(() {
          _loading = false;
          _loadError = res.message.isEmpty ? 'Load failed' : res.message;
        });
        return;
      }
      final list = res.data ?? const <MakeFriendLabelItem>[];
      final initNames = widget.initialSelected
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toSet();
      final selected = <int>{};
      for (final item in list) {
        final keyId = _labelIdFromRaw(item.name);
        if (initNames.contains(item.name) ||
            (keyId != null && keyId == item.id) ||
            initNames.any((name) => _labelIdFromRaw(name) == item.id)) {
          selected.add(item.id);
          if (selected.length >= maxTags) break;
        }
      }
      setState(() {
        _catalog = list;
        _selectedIds
          ..clear()
          ..addAll(selected);
        _loading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _loadError = 'Load failed: $error';
      });
    }
  }

  static int? _labelIdFromRaw(String raw) {
    final match = RegExp(r'tb_make_friends_label_name_(\d+)$').firstMatch(raw);
    return int.tryParse(match?.group(1) ?? '');
  }

  void _toggle(MakeFriendLabelItem item) {
    if (_selectedIds.contains(item.id)) {
      setState(() => _selectedIds.remove(item.id));
      return;
    }
    if (_selectedIds.length >= maxTags) {
      _showMaxTip();
      return;
    }
    setState(() => _selectedIds.add(item.id));
  }

  void _showMaxTip() {
    _tipTimer?.cancel();
    _tipEntry?.remove();
    _tipEntry = null;

    final overlay = Overlay.of(context);
    _tipEntry = OverlayEntry(
      builder: (_) => IgnorePointer(
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 48),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xE62A2A2A),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                'You can select up to 6 tags.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(_tipEntry!);
    _tipTimer = Timer(const Duration(seconds: 2), () {
      _tipEntry?.remove();
      _tipEntry = null;
    });
  }

  Future<void> _onConfirm() async {
    if (_saving) return;
    if (_selectedIds.length < minTags) {
      showCenterToast(
        context,
        message: 'You must select at least $minTags tags.',
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final ids = _selectedIds.toList(growable: false);
      final res = await AppApis.user.saveMakeFriendLabels(ids);
      if (!mounted) return;
      if (!res.ok) {
        showCenterToast(
          context,
          message: res.message.isEmpty ? 'Save failed' : res.message,
        );
        return;
      }
      final names = [
        for (final item in _catalog)
          if (_selectedIds.contains(item.id)) item.name,
      ];
      Navigator.of(context).pop(names);
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Save failed: $error');
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: AppPageScaffold(
        title: '',
        trailing: TextButton(
          onPressed: (_loading || _saving) ? null : _onConfirm,
          child: Text(
            _saving ? 'Saving…' : 'Confirm',
            style: TextStyle(
              color: (_loading || _saving)
                  ? AppColors.textTertiary
                  : AppColors.primaryBright,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primaryBright),
      );
    }
    if (_loadError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _loadError!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _loadCatalog,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      children: [
        const Text(
          'Build your own tag set',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w700,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Pick tags to find like-minded friends!',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final tag in _catalog)
              _TagChip(
                label: tag.name,
                selected: _selectedIds.contains(tag.id),
                onTap: () => _toggle(tag),
              ),
          ],
        ),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.white : const Color(0xFF2A2A2A),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.black : const Color(0xFFCFCFCF),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
