import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_page_scaffold.dart';

/// Interest tag selection page.
class MyTagsPage extends StatefulWidget {
  const MyTagsPage({super.key, this.initialSelected = const []});

  final List<String> initialSelected;

  static const List<String> allTags = [
    'Gaming Nerd',
    'Chats',
    'Sports',
    'Food',
    'Drinks',
    'Travel',
    'Movies',
    'Pub partner',
    'Hang out',
    'Music',
    'Photography',
    'Fitness',
    'Pets',
    'Reading',
    'Cooking',
    'Art',
    'Tech',
    'Fashion',
    'Night owl',
    'Early bird',
    'Coffee lover',
    'Board games',
    'K-pop',
    'Anime',
    'Outdoor',
    'Work hard play hard',
  ];

  @override
  State<MyTagsPage> createState() => _MyTagsPageState();
}

class _MyTagsPageState extends State<MyTagsPage> {
  static const int maxTags = 6;

  late final Set<String> _selected;
  OverlayEntry? _tipEntry;
  Timer? _tipTimer;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialSelected.take(maxTags).toSet();
  }

  @override
  void dispose() {
    _tipTimer?.cancel();
    _tipEntry?.remove();
    super.dispose();
  }

  void _toggle(String tag) {
    if (_selected.contains(tag)) {
      setState(() => _selected.remove(tag));
      return;
    }
    if (_selected.length >= maxTags) {
      _showMaxTip();
      return;
    }
    setState(() => _selected.add(tag));
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

  void _onConfirm() {
    Navigator.of(context).pop(_selected.toList());
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: AppPageScaffold(
        title: '',
        trailing: TextButton(
          onPressed: _onConfirm,
          child: const Text(
            'Confirm',
            style: TextStyle(
              color: AppColors.primaryBright,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: ListView(
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
                for (final tag in MyTagsPage.allTags)
                  _TagChip(
                    label: tag,
                    selected: _selected.contains(tag),
                    onTap: () => _toggle(tag),
                  ),
              ],
            ),
          ],
        ),
      ),
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
