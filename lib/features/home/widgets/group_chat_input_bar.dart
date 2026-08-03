import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/app_assets.dart';
import '../../profile/album_photo_viewer_page.dart';

enum GroupChatPanel { none, voice, photo, emoji }

enum _VoicePhase { idle, recording, preview }

/// Group chat composer: voice / image / emoji + text send.
class GroupChatInputBar extends StatefulWidget {
  const GroupChatInputBar({
    super.key,
    required this.bottomInset,
    required this.controller,
    required this.onSendText,
    required this.onSendVoice,
    required this.onSendImages,
  });

  final double bottomInset;
  final TextEditingController controller;
  final ValueChanged<String> onSendText;
  final ValueChanged<int> onSendVoice;
  final ValueChanged<List<String>> onSendImages;

  @override
  State<GroupChatInputBar> createState() => _GroupChatInputBarState();
}

class _GroupChatInputBarState extends State<GroupChatInputBar> {
  static const int _maxVoiceSeconds = 60;
  static const double _panelHeight = 290;

  static const List<String> _mockPhotos = [
    AppAssets.genderFemaleImg,
    AppAssets.genderMaleImg,
    AppAssets.personalBg,
    AppAssets.avatarPlace,
    AppAssets.homeRoomBg,
    AppAssets.launchBg,
    AppAssets.splashLogo,
    AppAssets.mineBg,
    AppAssets.genderFemaleSelected,
    AppAssets.genderMaleSelected,
    AppAssets.emptyAvatar,
    AppAssets.defaultAvatar,
  ];

  static const ColorFilter _iconFilter = ColorFilter.matrix(<double>[
    0, 0, 0, 0, 90,
    0, 0, 0, 0, 90,
    0, 0, 0, 0, 90,
    0.333, 0.333, 0.333, 0, 0,
  ]);

  final FocusNode _focus = FocusNode();
  GroupChatPanel _panel = GroupChatPanel.none;
  _VoicePhase _voicePhase = _VoicePhase.idle;
  int _voiceSeconds = 0;
  double _voiceProgress = 0;
  DateTime? _voiceStartedAt;
  Timer? _voiceTimer;
  final List<int> _selectedPhotos = [];
  bool _originalPhoto = true;

  bool get _hasText => widget.controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onChanged);
    _focus.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _voiceTimer?.cancel();
    _focus.removeListener(_onFocusChanged);
    _focus.dispose();
    widget.controller.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() => setState(() {});

  void _onFocusChanged() {
    if (_focus.hasFocus) _closePanel();
  }

  void _dismissKeyboard() {
    _focus.unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _closePanel() {
    if (_panel == GroupChatPanel.none) return;
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    setState(() {
      _panel = GroupChatPanel.none;
      _voicePhase = _VoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _selectedPhotos.clear();
    });
  }

  void _toggleVoice() {
    if (_panel == GroupChatPanel.voice) {
      _closePanel();
      return;
    }
    _dismissKeyboard();
    _voiceTimer?.cancel();
    setState(() {
      _panel = GroupChatPanel.voice;
      _voicePhase = _VoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _selectedPhotos.clear();
    });
  }

  void _togglePhoto() {
    if (_panel == GroupChatPanel.photo) {
      setState(() {
        _panel = GroupChatPanel.none;
        _selectedPhotos.clear();
      });
      return;
    }
    _dismissKeyboard();
    _voiceTimer?.cancel();
    setState(() {
      _panel = GroupChatPanel.photo;
      _voicePhase = _VoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voiceStartedAt = null;
      _selectedPhotos.clear();
      _originalPhoto = true;
    });
  }

  void _toggleEmoji() {
    if (_panel == GroupChatPanel.emoji) {
      setState(() => _panel = GroupChatPanel.none);
      _focus.requestFocus();
      return;
    }
    _dismissKeyboard();
    _voiceTimer?.cancel();
    setState(() {
      _panel = GroupChatPanel.emoji;
      _voicePhase = _VoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _selectedPhotos.clear();
    });
  }

  void _togglePhotoAt(int index) {
    setState(() {
      final i = _selectedPhotos.indexOf(index);
      if (i >= 0) {
        _selectedPhotos.removeAt(i);
      } else {
        _selectedPhotos.add(index);
      }
    });
  }

  void _sendSelectedPhotos() {
    if (_selectedPhotos.isEmpty) return;
    final assets = [for (final i in _selectedPhotos) _mockPhotos[i]];
    setState(() {
      _panel = GroupChatPanel.none;
      _selectedPhotos.clear();
    });
    widget.onSendImages(assets);
  }

  void _previewSelected() {
    if (_selectedPhotos.isEmpty) return;
    final paths = [for (final i in _selectedPhotos) _mockPhotos[i]];
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => AlbumPhotoViewerPage(paths: paths),
      ),
    );
  }

  Future<void> _openCamera() async {
    final file = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
      maxWidth: 1920,
    );
    if (!mounted || file == null) return;
    setState(() {
      _panel = GroupChatPanel.none;
      _selectedPhotos.clear();
    });
    widget.onSendImages([file.path]);
  }

  Future<void> _openAlbum() async {
    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 1920,
    );
    if (!mounted || file == null) return;
    setState(() {
      _panel = GroupChatPanel.none;
      _selectedPhotos.clear();
    });
    widget.onSendImages([file.path]);
  }

  void _insertEmoji(String emoji) {
    final text = widget.controller.text;
    final selection = widget.controller.selection;
    final start = selection.isValid ? selection.start : text.length;
    final end = selection.isValid ? selection.end : text.length;
    final next = text.replaceRange(start, end, emoji);
    widget.controller.value = TextEditingValue(
      text: next,
      selection: TextSelection.collapsed(offset: start + emoji.length),
    );
  }

  void _emojiBackspace() {
    final text = widget.controller.text;
    if (text.isEmpty) return;
    final truncated = text.characters.skipLast(1).toString();
    widget.controller.value = TextEditingValue(
      text: truncated,
      selection: TextSelection.collapsed(offset: truncated.length),
    );
  }

  String get _voiceTimeLabel {
    final m = (_voiceSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (_voiceSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _startRecording() {
    _voiceTimer?.cancel();
    final started = DateTime.now();
    setState(() {
      _voicePhase = _VoicePhase.recording;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voiceStartedAt = started;
    });
    _voiceTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      if (!mounted || _voiceStartedAt == null) return;
      final elapsed =
          DateTime.now().difference(_voiceStartedAt!).inMilliseconds / 1000;
      if (elapsed >= _maxVoiceSeconds) {
        setState(() {
          _voiceSeconds = _maxVoiceSeconds;
          _voiceProgress = 1;
        });
        _finishRecording();
        return;
      }
      setState(() {
        _voiceSeconds = elapsed.floor();
        _voiceProgress = elapsed / _maxVoiceSeconds;
      });
    });
  }

  void _finishRecording() {
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    if (!mounted) return;
    setState(() {
      _voicePhase =
          _voiceSeconds > 0 ? _VoicePhase.preview : _VoicePhase.idle;
      if (_voicePhase == _VoicePhase.idle) _voiceProgress = 0;
    });
  }

  void _onVoiceMainTap() {
    switch (_voicePhase) {
      case _VoicePhase.idle:
        _startRecording();
      case _VoicePhase.recording:
        _finishRecording();
      case _VoicePhase.preview:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Playing…'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
          ),
        );
    }
  }

  void _resetVoice() {
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    setState(() {
      _voicePhase = _VoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
    });
  }

  void _confirmVoice() {
    final seconds = _voiceSeconds;
    _closePanel();
    if (seconds > 0) widget.onSendVoice(seconds);
  }

  void _submit() {
    final text = widget.controller.text.trim();
    if (text.isEmpty) return;
    widget.onSendText(text);
  }

  Widget _icon(String asset, {VoidCallback? onTap}) {
    final child = ColorFiltered(
      colorFilter: _iconFilter,
      child: Image.asset(asset, width: 22, height: 22, fit: BoxFit.contain),
    );
    if (onTap == null) return child;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final showPanel = _panel != GroupChatPanel.none;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    final bottomPad =
        showPanel ? widget.bottomInset : math.max(widget.bottomInset, keyboardInset);

    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 8, 12, showPanel ? 0 : 8 + bottomPad),
            child: Container(
              constraints: const BoxConstraints(minHeight: 48),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  _icon(AppAssets.inputVoice, onTap: _toggleVoice),
                  const SizedBox(width: 4),
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      focusNode: _focus,
                      minLines: 1,
                      maxLines: 4,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _submit(),
                      onTap: _closePanel,
                      style: const TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: 'Please type here...',
                        hintStyle: TextStyle(
                          color: Color(0xFF9A9A9A),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  if (_hasText) ...[
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: _submit,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1CFF8A),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_upward_rounded,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ] else ...[
                    _icon(AppAssets.inputImage, onTap: _togglePhoto),
                    const SizedBox(width: 6),
                    _icon(AppAssets.inputEmoji, onTap: _toggleEmoji),
                  ],
                ],
              ),
            ),
          ),
          if (showPanel)
            SizedBox(
              height: _panelHeight + widget.bottomInset,
              width: double.infinity,
              child: switch (_panel) {
                GroupChatPanel.voice => Padding(
                    padding: EdgeInsets.only(bottom: widget.bottomInset),
                    child: Center(
                      child: _VoicePanel(
                        timeLabel: _voiceTimeLabel,
                        phase: _voicePhase,
                        progress: _voiceProgress,
                        onMainTap: _onVoiceMainTap,
                        onReset: _resetVoice,
                        onConfirm: _confirmVoice,
                      ),
                    ),
                  ),
                GroupChatPanel.photo => _PhotoPanel(
                    photos: _mockPhotos,
                    selected: _selectedPhotos,
                    originalPhoto: _originalPhoto,
                    bottomInset: widget.bottomInset,
                    onTogglePhoto: _togglePhotoAt,
                    onCamera: _openCamera,
                    onPreview: _previewSelected,
                    onAlbum: _openAlbum,
                    onToggleOriginal: () {
                      setState(() => _originalPhoto = !_originalPhoto);
                    },
                    onSend: _sendSelectedPhotos,
                  ),
                GroupChatPanel.emoji => _EmojiPanel(
                    bottomInset: widget.bottomInset,
                    canSend: _hasText,
                    onEmojiTap: _insertEmoji,
                    onBackspace: _emojiBackspace,
                    onSend: _submit,
                  ),
                GroupChatPanel.none => const SizedBox.shrink(),
              },
            ),
        ],
      ),
    );
  }
}

class _VoicePanel extends StatelessWidget {
  const _VoicePanel({
    required this.timeLabel,
    required this.phase,
    required this.progress,
    required this.onMainTap,
    required this.onReset,
    required this.onConfirm,
  });

  final String timeLabel;
  final _VoicePhase phase;
  final double progress;
  final VoidCallback onMainTap;
  final VoidCallback onReset;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final isPreview = phase == _VoicePhase.preview;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          timeLabel,
          style: const TextStyle(
            color: Color(0xFFB0B0B0),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 44,
              height: 44,
              child: isPreview
                  ? _SideBtn(
                      onTap: onReset,
                      child: Image.asset(
                        AppAssets.audioRefreshIcon,
                        width: 22,
                        height: 22,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 24),
            _MainVoiceBtn(
              phase: phase,
              progress: progress,
              onTap: onMainTap,
            ),
            const SizedBox(width: 24),
            SizedBox(
              width: 44,
              height: 44,
              child: isPreview
                  ? _SideBtn(
                      onTap: onConfirm,
                      child: Image.asset(
                        AppAssets.audioFinishIcon,
                        width: 22,
                        height: 22,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          switch (phase) {
            _VoicePhase.idle => 'Click to record',
            _VoicePhase.recording => 'Recording',
            _VoicePhase.preview => 'Click to play',
          },
          style: const TextStyle(color: Color(0xFFB0B0B0), fontSize: 14),
        ),
      ],
    );
  }
}

class _SideBtn extends StatelessWidget {
  const _SideBtn({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF0F0F0),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(width: 44, height: 44, child: Center(child: child)),
      ),
    );
  }
}

class _MainVoiceBtn extends StatelessWidget {
  const _MainVoiceBtn({
    required this.phase,
    required this.progress,
    required this.onTap,
  });

  final _VoicePhase phase;
  final double progress;
  final VoidCallback onTap;

  static const double _outer = 86;
  static const double _fill = 78;

  @override
  Widget build(BuildContext context) {
    final isIdle = phase == _VoicePhase.idle;
    final isRecording = phase == _VoicePhase.recording;
    final fillSize = isIdle ? _outer : _fill;

    return SizedBox(
      width: _outer,
      height: _outer,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isRecording || phase == _VoicePhase.preview)
            CustomPaint(
              size: const Size(_outer, _outer),
              painter: _ProgressPainter(
                progress: isRecording ? progress : 0,
              ),
            ),
          Material(
            color: const Color(0xFFFFE74F),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onTap,
              child: SizedBox(
                width: fillSize,
                height: fillSize,
                child: Center(
                  child: Image.asset(
                    phase == _VoicePhase.preview
                        ? AppAssets.audioPlayingIcon
                        : AppAssets.audioRecordIcon,
                    width: phase == _VoicePhase.preview ? 36 : 42,
                    height: phase == _VoicePhase.preview ? 28 : 42,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  const _ProgressPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const stroke = 3.0;
    final radius = size.width / 2 - stroke / 2;
    final track = Paint()
      ..color = const Color(0xFFE8E8E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;
    final active = Paint()
      ..color = const Color(0xFFFFE74F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, track);
    final sweep = 2 * math.pi * progress.clamp(0.0, 1.0);
    if (sweep > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        sweep,
        false,
        active,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ProgressPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class _PhotoPanel extends StatelessWidget {
  const _PhotoPanel({
    required this.photos,
    required this.selected,
    required this.originalPhoto,
    required this.bottomInset,
    required this.onTogglePhoto,
    required this.onCamera,
    required this.onPreview,
    required this.onAlbum,
    required this.onToggleOriginal,
    required this.onSend,
  });

  final List<String> photos;
  final List<int> selected;
  final bool originalPhoto;
  final double bottomInset;
  final ValueChanged<int> onTogglePhoto;
  final VoidCallback onCamera;
  final VoidCallback onPreview;
  final VoidCallback onAlbum;
  final VoidCallback onToggleOriginal;
  final VoidCallback onSend;

  static const Color _green = Color(0xFF00F875);

  @override
  Widget build(BuildContext context) {
    final hasSelection = selected.isNotEmpty;
    final itemCount = photos.length + 1;

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _CameraCell(onTap: onCamera);
              }
              final photoIndex = index - 1;
              final order = selected.indexOf(photoIndex);
              return _PhotoCell(
                asset: photos[photoIndex],
                order: order < 0 ? null : order + 1,
                onTap: () => onTogglePhoto(photoIndex),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 8 + bottomInset),
          child: SizedBox(
            height: 44,
            child: Row(
              children: [
                GestureDetector(
                  onTap: hasSelection ? onPreview : null,
                  child: Text(
                    'Preview',
                    style: TextStyle(
                      color: hasSelection
                          ? const Color(0xFF111111)
                          : const Color(0xFFB0B0B0),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(width: 1, height: 14, color: const Color(0xFFD8D8D8)),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: onAlbum,
                  child: const Text(
                    'Album',
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onToggleOriginal,
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: originalPhoto ? _green : Colors.transparent,
                          border: originalPhoto
                              ? null
                              : Border.all(
                                  color: const Color(0xFFC8C8C8),
                                  width: 1.5,
                                ),
                        ),
                        child: originalPhoto
                            ? const Icon(
                                Icons.check_rounded,
                                size: 13,
                                color: Colors.white,
                              )
                            : null,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'Original Photo',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: hasSelection ? onSend : null,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    opacity: hasSelection ? 1 : 0.45,
                    child: Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _green,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        hasSelection ? 'Send (${selected.length})' : 'Send',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
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
  }
}

class _CameraCell extends StatelessWidget {
  const _CameraCell({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: const _DashedRectPainter(color: Color(0xFFD0D0D0), radius: 4),
        child: ColoredBox(
          color: const Color(0xFFF5F5F5),
          child: Center(
            child: Image.asset(
              AppAssets.cameraIcon,
              width: 28,
              height: 28,
              fit: BoxFit.contain,
              color: const Color(0xFFB0B0B0),
              colorBlendMode: BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _PhotoCell extends StatelessWidget {
  const _PhotoCell({
    required this.asset,
    required this.order,
    required this.onTap,
  });

  final String asset;
  final int? order;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final selected = order != null;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            asset,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) =>
                const ColoredBox(color: Color(0xFFE8E8E8)),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              width: 22,
              height: 22,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected
                    ? const Color(0xFF00F875)
                    : Colors.black.withValues(alpha: 0.15),
                border: Border.all(
                  color: selected ? const Color(0xFF00F875) : Colors.white,
                  width: 1.5,
                ),
              ),
              child: selected
                  ? Text(
                      '$order',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  const _DashedRectPainter({required this.color, this.radius = 4});

  final Color color;
  final double radius;
  static const double _strokeWidth = 1.2;
  static const double _dash = 4;
  static const double _gap = 3;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        _strokeWidth / 2,
        _strokeWidth / 2,
        size.width - _strokeWidth,
        size.height - _strokeWidth,
      ),
      Radius.circular(radius),
    );
    final path = Path()..addRRect(rect);
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = math.min(distance + _dash, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance = next + _gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRectPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.radius != radius;
  }
}

class _EmojiPanel extends StatelessWidget {
  const _EmojiPanel({
    required this.bottomInset,
    required this.canSend,
    required this.onEmojiTap,
    required this.onBackspace,
    required this.onSend,
  });

  final double bottomInset;
  final bool canSend;
  final ValueChanged<String> onEmojiTap;
  final VoidCallback onBackspace;
  final VoidCallback onSend;

  static const _emojis = [
    '😀', '😁', '😂', '🤣', '😃', '😄', '😅', '😆',
    '😉', '😊', '😋', '😎', '😍', '😘', '🥰', '😗',
    '😙', '😚', '🙂', '🤗', '🤩', '🤔', '🤨', '😐',
    '😑', '😶', '🙄', '😏', '😣', '😥', '😮', '🤐',
    '😯', '😪', '😫', '🥱', '😴', '😌', '😛', '😜',
    '😝', '🤤', '😒', '😓', '😔', '😕', '🙃', '🤑',
    '😲', '☹️', '🙁', '😖', '😞', '😟', '😤', '😢',
    '😭', '😦', '😧', '😨', '😩', '🤯', '😬', '😰',
    '😱', '🥵', '🥶', '😳', '🤪', '😵', '😡', '😠',
    '👍', '👎', '👏', '🙏', '💪', '❤️', '🧡', '💛',
    '💚', '💙', '💜', '🖤', '💔', '💕', '✨', '🔥',
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFF7F7F7),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemCount: _emojis.length,
                itemBuilder: (context, index) {
                  final emoji = _emojis[index];
                  return GestureDetector(
                    onTap: () => onEmojiTap(emoji),
                    behavior: HitTestBehavior.opaque,
                    child: Center(
                      child: Text(emoji, style: const TextStyle(fontSize: 26)),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: onBackspace,
                    child: Container(
                      width: 44,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFE5E5E5)),
                      ),
                      child: const Icon(
                        Icons.backspace_outlined,
                        size: 20,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: canSend ? onSend : null,
                    child: Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: canSend
                            ? const Color(0xFF00F875)
                            : const Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        'Send',
                        style: TextStyle(
                          color: canSend
                              ? Colors.black
                              : const Color(0xFF999999),
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
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
