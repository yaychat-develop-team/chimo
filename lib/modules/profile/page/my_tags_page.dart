import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/app_tag_chip.dart';
import '../logic/my_tags_logic.dart';

/// Tag picker page (forya FriendWishPage): load catalog, save by id.
class MyTagsPage extends StatefulWidget {
  const MyTagsPage({super.key, this.initialSelected = const []});

  /// 已选标签名（由 AppJumper 传入）；只作首帧预填，Controller 会再拉一次目录。
  final List<String> initialSelected;

  @override
  State<MyTagsPage> createState() => _MyTagsPageState();
}

class _MyTagsPageState extends State<MyTagsPage> {
  /// 页面自持 Controller：没有现成实例就自己 put、自己收。
  late final MyTagsLogic logic;
  bool _ownsController = false;

  OverlayEntry? _tipEntry;
  Timer? _tipTimer;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<MyTagsLogic>()) {
      logic = Get.find<MyTagsLogic>();
    } else {
      logic = Get.put(MyTagsLogic(initialSelected: widget.initialSelected));
      _ownsController = true;
    }
  }

  @override
  void dispose() {
    _tipTimer?.cancel();
    _tipEntry?.remove();
    if (_ownsController && Get.isRegistered<MyTagsLogic>()) {
      Get.delete<MyTagsLogic>();
    }
    super.dispose();
  }

  void _onTagTap(MakeFriendLabelRespEntry item) {
    if (!logic.toggle(item)) _showMaxTip();
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
                color: AppColors.toastBackground,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                'You can select up to 6 tags.',
                textAlign: TextAlign.center,
                style: AppText.label,
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

  @override
  Widget build(BuildContext context) {
    return ChimoScaffold(
      title: '',
      trailing: Obx(() {
        final busy = logic.loading.value || logic.saving.value;
        return TextButton(
          onPressed: busy ? null : logic.confirm,
          child: Text(
            logic.saving.value ? 'Saving…' : 'Confirm',
            style: TextStyle(
              color: busy ? AppColors.textTertiary : AppColors.primaryBright,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }),
      body: Obx(_buildBody),
    );
  }

  Widget _buildBody() {
    if (logic.loading.value) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primaryBright));
    }
    final error = logic.error.value;
    if (error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                error,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              TextButton(onPressed: () => unawaited(logic.load()), child: const Text('Retry')),
            ],
          ),
        ),
      );
    }
    final catalog = logic.items.toList();
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
        const Text('Pick tags to find like-minded friends!', style: AppText.body),
        const SizedBox(height: 28),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: catalog
              .map(
                (tag) => AppTagChip.selectable(
                  label: tag.name,
                  selected: logic.selectedIds.contains(tag.id.toInt()),
                  onTap: () => _onTagTap(tag),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
