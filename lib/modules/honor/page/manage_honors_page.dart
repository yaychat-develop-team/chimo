import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/honor.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/zodiac.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/honor_display.dart';
import '../logic/my_honor_logic.dart';

/// 勋章管理：勾选最多 [MyHonorLogic.maxWearCount] 个佩戴，Save 提交。
class ManageHonorsPage extends StatefulWidget {
  const ManageHonorsPage({super.key, required this.logic});

  final MyHonorLogic logic;

  static Future<void> open(MyHonorLogic logic) {
    return Get.to(() => ManageHonorsPage(logic: logic)) ?? Future.value();
  }

  @override
  State<ManageHonorsPage> createState() => _ManageHonorsPageState();
}

class _ManageHonorsPageState extends State<ManageHonorsPage> {
  late final Set<int> _selected;

  MyHonorLogic get logic => widget.logic;

  @override
  void initState() {
    super.initState();
    _selected = {
      for (final e in logic.activeList)
        if (e.wear) e.hid.toInt(),
    };
  }

  List<HonorItem> get _previewHonors {
    final map = {for (final e in logic.activeList) e.hid.toInt(): e};
    return [
      for (final hid in _selected)
        if (map[hid] != null) map[hid]!,
    ];
  }

  void _toggle(HonorItem item) {
    final hid = item.hid.toInt();
    setState(() {
      if (_selected.contains(hid)) {
        _selected.remove(hid);
        return;
      }
      if (_selected.length >= MyHonorLogic.maxWearCount) {
        AppToast.info('You can equip up to ${MyHonorLogic.maxWearCount} honors');
        return;
      }
      if (!HonorDisplay.isValid(item)) {
        AppToast.info('This honor has expired');
        return;
      }
      _selected.add(hid);
    });
  }

  Future<void> _save() async {
    final err = await logic.applyWearSelection(Set<int>.from(_selected));
    if (!mounted) return;
    if (err != null) {
      AppToast.error(err);
      return;
    }
    AppToast.success('Saved');
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppNavBar(
        title: 'Manage Honors',
        titleStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: AppColors.black,
      body: Obx(() {
        final items = logic.activeList.toList(growable: false);
        // 列表刷新后校正选中（卸下失败重载等）。
        logic.activeList.length;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: _PreviewCard(profile: logic.profile.value, honors: _previewHonors),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
              child: Text(
                'My Honors',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
            ),
            Expanded(
              child: items.isEmpty
                  ? const Center(
                      child: Text(
                        'No Honors Yet',
                        style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 15),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.82,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final selected = _selected.contains(item.hid.toInt());
                        return _ManageTile(
                          item: item,
                          selected: selected,
                          onTap: () => _toggle(item),
                        );
                      },
                    ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: Obx(() {
                  final busy = logic.wearing.value;
                  return SizedBox(
                    height: 52,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: busy
                            ? null
                            : const LinearGradient(
                                colors: [AppColors.green00F875, AppColors.green00FEA8],
                              ),
                        color: busy ? AppColors.green00FEA8.withValues(alpha: 0.4) : null,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: busy ? null : _save,
                          borderRadius: BorderRadius.circular(28),
                          child: Center(
                            child: busy
                                ? const SizedBox(
                                    width: 22,
                                    height: 22,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.black,
                                    ),
                                  )
                                : const Text(
                                    'Save',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _PreviewCard extends StatelessWidget {
  const _PreviewCard({required this.profile, required this.honors});

  final User? profile;
  final List<HonorItem> honors;

  Future<void> _copyId(BuildContext context, String id) async {
    await Clipboard.setData(ClipboardData(text: id));
    AppToast.info('Saved to the clipboard');
  }

  @override
  Widget build(BuildContext context) {
    final user = profile;
    final name = (user?.nickname.trim().isNotEmpty == true) ? user!.nickname : 'User';
    final avatar = user?.shownAvatar ?? '';
    final id = user?.uid ?? '';
    final zodiac = (user?.birthday.trim().isNotEmpty == true)
        ? Zodiac.fromBirthday(user!.birthday)
        : '';
    final zodiacLabel = Zodiac.chipLabel(zodiac);
    final bio = (user?.personalSignature.trim().isNotEmpty == true)
        ? user!.personalSignature.trim()
        : 'No personal signature yet.';
    final vipIcon = user?.vipSmallIcon;
    final vipLevel = user?.vipLevel ?? 0;
    final showGender = user?.genderKnown == true;
    final age = user?.age ?? 0;

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        image: Chimo.decorationImage(AppAssets.recordBg),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white18, width: 1.5),
                ),
                child: ClipOval(
                  child: Chimo.image(
                    avatar,
                    width: 52,
                    height: 52,
                    fit: BoxFit.cover,
                    fallbackAsset: AppAssets.avatarPlace,
                    fadeIn: Duration.zero,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: id.isEmpty ? null : () => _copyId(context, id),
                      behavior: HitTestBehavior.opaque,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ID:$id',
                            style: const TextStyle(
                              color: AppColors.gray9A9A9A,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          if (id.isNotEmpty) ...[
                            const SizedBox(width: 4),
                            Chimo.image(
                              AppAssets.mineCopy,
                              width: 10,
                              height: 10,
                              color: AppColors.gray9A9A9A,
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        if (zodiacLabel.isNotEmpty)
                          _Chip(
                            child: Text(
                              zodiacLabel,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                          ),
                        if (showGender)
                          _Chip(
                            height: 16,
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            background: (user?.male ?? true)
                                ? AppColors.blue0091FF
                                : AppColors.pinkFF5BA8,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Chimo.image(
                                  (user?.male ?? true)
                                      ? AppAssets.genderMan
                                      : AppAssets.genderWoman,
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  '$age',
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if ((vipIcon ?? '').trim().isNotEmpty)
                          Chimo.image(
                            vipIcon!.trim(),
                            height: 18,
                            fit: BoxFit.fitHeight,
                            fadeIn: Duration.zero,
                            error: const SizedBox.shrink(),
                          )
                        else if (vipLevel > 0)
                          _Chip(
                            background: const Color(0xFF5B3CC4),
                            child: Text(
                              'Lv.$vipLevel',
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                          ),
                        ...honors.map(
                          (honor) => Chimo.image(
                            honor.image.trim().isNotEmpty ? honor.image : honor.icon,
                            width: 22,
                            height: 22,
                            fit: BoxFit.contain,
                            fadeIn: Duration.zero,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.white12,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Preview',
                  style: TextStyle(
                    color: AppColors.gray9A9A9A,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            bio,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.child,
    this.height = 20,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.background = AppColors.white12,
  });

  final Widget child;
  final double height;
  final EdgeInsetsGeometry padding;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: height,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(20)),
        child: child,
      ),
    );
  }
}

class _ManageTile extends StatelessWidget {
  const _ManageTile({required this.item, required this.selected, required this.onTap});

  final HonorItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final image = item.image.trim().isNotEmpty ? item.image : item.icon;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? AppColors.green00FEA8.withValues(alpha: 0.14) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 160),
                        alignment: Alignment.center,
                        child: Chimo.image(
                          image,
                          width: 84,
                          height: 84,
                          fit: BoxFit.contain,
                          fadeIn: Duration.zero,
                        ),
                      ),

                      Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                  if (selected)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          color: AppColors.green00FEA8,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, size: 12, color: AppColors.black),
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
