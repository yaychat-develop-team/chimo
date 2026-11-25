import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/heart_link.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/chimo.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/widgets/voice_note_mark.dart';
import '../logic/edit_reveal_card_logic.dart';

/// Reveal Card 编辑页。对齐设计图 + joyride `UploadSecretCardPage`（暗色）。
class EditRevealCardPage extends StatefulWidget {
  const EditRevealCardPage({super.key});

  @override
  State<EditRevealCardPage> createState() => _EditRevealCardPageState();
}

class _EditRevealCardPageState extends State<EditRevealCardPage> {
  late final EditRevealCardLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(EditRevealCardLogic());
  }

  @override
  void dispose() {
    if (Get.isRegistered<EditRevealCardLogic>()) {
      Get.delete<EditRevealCardLogic>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.black0F0F0F,
      appBar: const AppNavBar(title: 'Reveal Card'),
      body: Obx(() {
        if (logic.loading.value) {
          return const Center(child: CircularProgressIndicator(color: AppColors.green00F875));
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Column(
                  children: [
                    _section(
                      title: 'Video',
                      child: _mediaSlot(
                        item: logic.video.value,
                        statusText: logic.video.value == null
                            ? ''
                            : logic.statusText(logic.video.value!.applyStatus),
                        showPlay: true,
                        onTap: logic.pickVideo,
                        onClear: logic.clearVideo,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _section(
                      title: 'Photo',
                      subtitle: 'For the best experience, please upload a vertical photo.',
                      child: Row(
                        children: [
                          for (var i = 0; i < 2; i++) ...[
                            if (i > 0) const SizedBox(width: 12),
                            _mediaSlot(
                              item: logic.photos[i],
                              statusText: logic.photos[i] == null
                                  ? ''
                                  : logic.statusText(logic.photos[i]!.applyStatus),
                              onTap: () => logic.pickPhoto(i),
                              onClear: () => logic.clearPhoto(i),
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (logic.hasReviewFailed) ...[
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.redFD4B4B.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          '⚠️ Media review failed. Please re-upload!',
                          style: TextStyle(color: AppColors.redFD4B4B, fontSize: 12),
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    _section(
                      title: 'Voice Note',
                      subtitle: 'Speak up — your voice is your vibe!',
                      child: _voiceRow(logic),
                    ),
                    const SizedBox(height: 12),
                    _section(
                      title: 'Info',
                      child: Column(
                        children: [
                          _infoRow('Status', logic.emotionalState.value, () => _pickStatus(logic)),
                          _infoRow(
                            'Job',
                            logic.occupation.value,
                            () => _pickText(
                              logic,
                              title: 'Job',
                              initial: logic.occupation.value,
                              onDone: logic.applyOccupation,
                            ),
                          ),
                          _infoRow(
                            'Telegram',
                            logic.telegram.value,
                            () => _pickText(
                              logic,
                              title: 'Telegram',
                              initial: logic.telegram.value,
                              onDone: logic.applyTelegram,
                            ),
                          ),
                          _infoRow('Hobbies', logic.hobbiesText, logic.pickHobbies),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: logic.busy.value ? null : logic.preview,
                        child: Container(
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: AppColors.green00F875),
                          ),
                          child: const Text(
                            'Preview',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: logic.busy.value ? null : logic.upload,
                        child: Container(
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.green00F875,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            logic.busy.value ? 'Uploading...' : 'Upload',
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _section({required String title, String subtitle = '', required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.black1C1C1E,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(subtitle, style: const TextStyle(color: AppColors.white50, fontSize: 12)),
          ],
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _mediaSlot({
    required MediaItem? item,
    required String statusText,
    required VoidCallback onTap,
    required VoidCallback onClear,
    bool showPlay = false,
  }) {
    final filled = item != null && item.url.isNotEmpty;
    // 视频必须用 cover；url 是 mp4，不能当图片。对齐 oumi `item.hasCover() ? cover : url`。
    final cover = !filled
        ? ''
        : (item.cover.trim().isNotEmpty ? item.cover : (showPlay ? '' : item.url));
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 90,
            height: 120,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.white8,
              borderRadius: BorderRadius.circular(12),
              border: filled
                  ? null
                  : Border.all(color: AppColors.white20, style: BorderStyle.solid),
            ),
            child: filled
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      if (cover.isNotEmpty)
                        Chimo.image(cover, fit: BoxFit.cover, fallbackAsset: AppAssets.avatarPlace)
                      else
                        const ColoredBox(color: AppColors.black2A2A2A),
                      if (statusText.isNotEmpty)
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: double.infinity,
                            height: 20,
                            color: AppColors.black60,
                            alignment: Alignment.center,
                            child: Text(
                              statusText,
                              style: TextStyle(
                                color: statusText == 'Review failed'
                                    ? AppColors.redFD4B4B
                                    : AppColors.yellowFDE42B,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      if (showPlay || (item.duration > 0))
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 22,
                            width: double.infinity,
                            padding: const EdgeInsets.only(right: 6),
                            alignment: Alignment.centerRight,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [AppColors.transparent, AppColors.black60],
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.play_arrow_rounded,
                                  size: 14,
                                  color: AppColors.white,
                                ),
                                if (item.duration > 0)
                                  Text(
                                    _fmt(item.duration),
                                    style: const TextStyle(color: AppColors.white, fontSize: 10),
                                  ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  )
                : const Center(child: Icon(Icons.add, size: 32, color: AppColors.white50)),
          ),
          if (filled)
            Positioned(
              right: -6,
              top: -6,
              child: GestureDetector(
                onTap: onClear,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: AppColors.redFD4B4B,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 12, color: AppColors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _voiceRow(EditRevealCardLogic logic) {
    final item = logic.audio.value;
    final filled = item != null && item.url.isNotEmpty;
    return GestureDetector(
      onTap: logic.recordVoice,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          if (filled) ...[
            VoiceNoteMark(
              duration: item.duration,
              height: 36,
              borderRadius: 18,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            const Spacer(),
          ] else
            const Expanded(
              child: Text(
                'Tap to record',
                style: TextStyle(color: AppColors.white50, fontSize: 13),
              ),
            ),
          const Icon(Icons.chevron_right, color: AppColors.white50),
        ],
      ),
    );
  }

  Widget _infoRow(String title, String value, VoidCallback onTap) {
    final empty = value.trim().isEmpty;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Text(title, style: const TextStyle(color: AppColors.white50, fontSize: 14)),
            const Spacer(),
            Text(
              empty ? 'To be filled' : value,
              style: TextStyle(
                color: empty ? AppColors.white36 : AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, color: AppColors.white50, size: 18),
          ],
        ),
      ),
    );
  }

  Future<void> _pickStatus(EditRevealCardLogic logic) async {
    final selected = await Get.bottomSheet<String>(
      SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.black1C1C1E,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Status',
                style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),
              for (final option in EditRevealCardLogic.statusOptions)
                ListTile(
                  title: Text(option, style: const TextStyle(color: AppColors.white)),
                  trailing: option == logic.emotionalState.value
                      ? const Icon(Icons.check, color: AppColors.green00F875)
                      : null,
                  onTap: () => Get.back(result: option),
                ),
            ],
          ),
        ),
      ),
    );
    if (selected != null) logic.applyStatus(selected);
  }

  Future<void> _pickText(
    EditRevealCardLogic logic, {
    required String title,
    required String initial,
    required Future<void> Function(String) onDone,
  }) async {
    final controller = TextEditingController(text: initial);
    final result = await Get.bottomSheet<String>(
      SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(Get.context!).bottom),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.black1C1C1E,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: controller,
                  autofocus: true,
                  style: const TextStyle(color: AppColors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white8,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => Get.back(result: controller.text),
                  child: Container(
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.green00F875,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
    );
    if (result != null) await onDone(result);
  }

  String _fmt(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}
