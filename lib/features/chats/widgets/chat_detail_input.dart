part of '../chat_detail_page.dart';

class _DmInputBar extends StatefulWidget {
  const _DmInputBar({
    required this.bottomInset,
    required this.controller,
    required this.onSend,
    required this.onSendVoice,
    required this.onSendImages,
    required this.onSendGift,
    this.receiverUid = '',
  });

  final double bottomInset;
  final TextEditingController controller;
  final ValueChanged<String?> onSend;
  /// (filePath, durationSeconds) — path empty means local-only mock failed.
  final void Function(String path, int seconds) onSendVoice;
  final ValueChanged<List<String>> onSendImages;
  final ValueChanged<_GiftSendResult> onSendGift;
  final String receiverUid;

  @override
  State<_DmInputBar> createState() => _DmInputBarState();
}

enum _ChatVoicePhase { idle, recording, preview }

enum _DmPanel { none, voice, photo, emoji }

class _DmInputBarState extends State<_DmInputBar> {
  static const int _maxVoiceSeconds = 60;
  static const int _albumPageSize = 80;

  /// Voice / photo panels share the same bottom area height (excl. safe inset).
  static const double _panelHeight = 290;

  final FocusNode _inputFocus = FocusNode();
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _previewPlayer = AudioPlayer();

  bool get _hasText => widget.controller.text.trim().isNotEmpty;
  _DmPanel _panel = _DmPanel.none;
  _ChatVoicePhase _voicePhase = _ChatVoicePhase.idle;
  int _voiceSeconds = 0;
  double _voiceProgress = 0;
  DateTime? _voiceStartedAt;
  Timer? _voiceTimer;
  String? _voicePath;

  /// Device album photos for the grid (excluding camera cell).
  List<AssetEntity> _albumPhotos = const [];
  bool _albumLoading = false;
  String? _albumError;

  /// Selection order (photo indices into [_albumPhotos]); empty = none selected.
  final List<int> _selectedPhotos = [];
  bool _originalPhoto = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onChanged);
    _inputFocus.addListener(_onInputFocusChanged);
  }

  @override
  void dispose() {
    _voiceTimer?.cancel();
    unawaited(_recorder.dispose());
    unawaited(_previewPlayer.dispose());
    _inputFocus.removeListener(_onInputFocusChanged);
    _inputFocus.dispose();
    widget.controller.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() => setState(() {});

  void _onInputFocusChanged() {
    if (_inputFocus.hasFocus) {
      _closeFunctionPanel();
    }
  }

  /// Dismiss keyboard before opening bottom function panel.
  void _dismissKeyboard() {
    _inputFocus.unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// Close voice/photo panel when input is focused.
  void _closeFunctionPanel() {
    if (_panel == _DmPanel.none) return;
    unawaited(_stopRecorderIfNeeded(deleteFile: true));
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    unawaited(_previewPlayer.stop());
    setState(() {
      _panel = _DmPanel.none;
      _voicePhase = _ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voicePath = null;
      _selectedPhotos.clear();
    });
  }

  String get _voiceTimeLabel {
    final m = (_voiceSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (_voiceSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _toggleEmojiPanel() {
    if (_panel == _DmPanel.emoji) {
      setState(() => _panel = _DmPanel.none);
      _inputFocus.requestFocus();
      return;
    }
    _dismissKeyboard();
    unawaited(_stopRecorderIfNeeded(deleteFile: true));
    _voiceTimer?.cancel();
    setState(() {
      _panel = _DmPanel.emoji;
      _voicePhase = _ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voiceStartedAt = null;
      _voicePath = null;
      _selectedPhotos.clear();
    });
  }

  void _insertEmoji(String emoji) {
    final text = widget.controller.text;
    final selection = widget.controller.selection;
    final start = selection.isValid ? selection.start : text.length;
    final end = selection.isValid ? selection.end : text.length;
    final next = text.replaceRange(start, end, emoji);
    final cursor = start + emoji.length;
    widget.controller.value = TextEditingValue(
      text: next,
      selection: TextSelection.collapsed(offset: cursor),
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

  void _sendFromEmojiPanel() {
    if (!_hasText) return;
    widget.onSend(null);
  }

  void _toggleVoicePanel() {
    if (_panel == _DmPanel.voice) {
      unawaited(_closeVoicePanel());
      return;
    }
    _dismissKeyboard();
    unawaited(_stopRecorderIfNeeded(deleteFile: true));
    _voiceTimer?.cancel();
    setState(() {
      _panel = _DmPanel.voice;
      _voicePhase = _ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voicePath = null;
      _selectedPhotos.clear();
    });
  }

  void _togglePhotoPanel() {
    if (_panel == _DmPanel.photo) {
      setState(() {
        _panel = _DmPanel.none;
        _selectedPhotos.clear();
      });
      return;
    }
    _dismissKeyboard();
    unawaited(_stopRecorderIfNeeded(deleteFile: true));
    _voiceTimer?.cancel();
    setState(() {
      _panel = _DmPanel.photo;
      _voicePhase = _ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voiceStartedAt = null;
      _voicePath = null;
      _selectedPhotos.clear();
      _originalPhoto = true;
      _albumError = null;
    });
    unawaited(_loadAlbumPhotos());
  }

  /// Image-only: default RequestType.common also asks for VIDEO and fails
  /// when READ_MEDIA_IMAGES is granted but READ_MEDIA_VIDEO is not.
  static const _albumPermissionOption = PermissionRequestOption(
    androidPermission: AndroidPermission(
      type: RequestType.image,
      mediaLocation: false,
    ),
  );

  Future<void> _loadAlbumPhotos({bool openSettingsIfDenied = false}) async {
    setState(() {
      _albumLoading = true;
      _albumError = null;
    });
    try {
      final permission = await PhotoManager.requestPermissionExtend(
        requestOption: _albumPermissionOption,
      );
      if (!permission.hasAccess) {
        if (openSettingsIfDenied) {
          await PhotoManager.openSetting();
        }
        if (!mounted) return;
        setState(() {
          _albumLoading = false;
          _albumPhotos = const [];
          _albumError = 'Photo permission denied';
        });
        return;
      }

      final paths = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        onlyAll: true,
        filterOption: FilterOptionGroup(
          imageOption: const FilterOption(
            sizeConstraint: SizeConstraint(ignoreSize: true),
          ),
          orders: [
            const OrderOption(type: OrderOptionType.createDate, asc: false),
          ],
        ),
      );
      if (paths.isEmpty) {
        if (!mounted) return;
        setState(() {
          _albumLoading = false;
          _albumPhotos = const [];
          _albumError = 'No photos in album';
        });
        return;
      }

      final assets = await paths.first.getAssetListPaged(
        page: 0,
        size: _albumPageSize,
      );
      if (!mounted) return;
      setState(() {
        _albumPhotos = assets;
        _albumLoading = false;
        _albumError = assets.isEmpty ? 'No photos in album' : null;
      });
    } catch (error) {
      debugPrint('Load album failed: $error');
      if (!mounted) return;
      setState(() {
        _albumLoading = false;
        _albumPhotos = const [];
        _albumError = 'Failed to load album';
      });
    }
  }

  Future<void> _closeVoicePanel({bool deleteFile = true}) async {
    await _stopRecorderIfNeeded(deleteFile: deleteFile);
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    await _previewPlayer.stop();
    if (!mounted) return;
    setState(() {
      if (_panel == _DmPanel.voice) _panel = _DmPanel.none;
      _voicePhase = _ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      if (deleteFile) _voicePath = null;
    });
  }

  Future<void> _stopRecorderIfNeeded({required bool deleteFile}) async {
    try {
      if (await _recorder.isRecording()) {
        final path = await _recorder.stop();
        if (path != null && path.isNotEmpty) {
          _voicePath = path;
        }
      }
    } catch (_) {}
    if (deleteFile) {
      _deleteVoiceFile(_voicePath);
      _voicePath = null;
    }
  }

  void _deleteVoiceFile(String? path) {
    final p = path?.trim() ?? '';
    if (p.isEmpty) return;
    try {
      final f = File(p);
      if (f.existsSync()) f.deleteSync();
    } catch (_) {}
  }

  Future<void> _startRecording() async {
    try {
      final ok = await _recorder.hasPermission();
      if (!ok) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Microphone permission is required for voice messages'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      await _stopRecorderIfNeeded(deleteFile: true);
      await _previewPlayer.stop();
      final dir = await getTemporaryDirectory();
      final path =
          '${dir.path}/chimo_voice_${DateTime.now().millisecondsSinceEpoch}.m4a';
      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
          numChannels: 1,
        ),
        path: path,
      );
      _voicePath = path;
      _voiceTimer?.cancel();
      final started = DateTime.now();
      if (!mounted) return;
      setState(() {
        _voicePhase = _ChatVoicePhase.recording;
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
          unawaited(_finishRecording());
          return;
        }
        setState(() {
          _voiceSeconds = elapsed.floor();
          _voiceProgress = elapsed / _maxVoiceSeconds;
        });
      });
    } catch (error) {
      debugPrint('Start voice record failed: $error');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not start recording: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _finishRecording() async {
    _voiceTimer?.cancel();
    _voiceTimer = null;
    final started = _voiceStartedAt;
    _voiceStartedAt = null;
    try {
      if (await _recorder.isRecording()) {
        final path = await _recorder.stop();
        if (path != null && path.isNotEmpty) {
          _voicePath = path;
        }
      }
    } catch (error) {
      debugPrint('Stop voice record failed: $error');
    }
    if (!mounted) return;
    final secs = started == null
        ? _voiceSeconds
        : DateTime.now().difference(started).inMilliseconds / 1000;
    final duration = secs.floor().clamp(0, _maxVoiceSeconds);
    setState(() {
      _voiceSeconds = duration;
      _voiceProgress = duration / _maxVoiceSeconds;
      _voicePhase = duration > 0 && (_voicePath?.isNotEmpty ?? false)
          ? _ChatVoicePhase.preview
          : _ChatVoicePhase.idle;
      if (_voicePhase == _ChatVoicePhase.idle) {
        _deleteVoiceFile(_voicePath);
        _voicePath = null;
        _voiceProgress = 0;
      }
    });
  }

  Future<void> _onVoiceMainTap() async {
    switch (_voicePhase) {
      case _ChatVoicePhase.idle:
        await _startRecording();
      case _ChatVoicePhase.recording:
        await _finishRecording();
      case _ChatVoicePhase.preview:
        final path = _voicePath;
        if (path == null || path.isEmpty) return;
        try {
          await _previewPlayer.stop();
          await _previewPlayer.play(DeviceFileSource(path));
        } catch (error) {
          debugPrint('Preview voice failed: $error');
        }
    }
  }

  Future<void> _resetVoice() async {
    await _stopRecorderIfNeeded(deleteFile: true);
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    await _previewPlayer.stop();
    if (!mounted) return;
    setState(() {
      _voicePhase = _ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voicePath = null;
    });
  }

  Future<void> _confirmVoice() async {
    if (_voicePhase == _ChatVoicePhase.recording) {
      await _finishRecording();
    }
    final seconds = _voiceSeconds;
    final path = _voicePath?.trim() ?? '';
    if (seconds < 1 || path.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please record at least 1 second'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    // Keep file for send/play; panel closes without deleting.
    await _closeVoicePanel(deleteFile: false);
    widget.onSendVoice(path, seconds);
  }

  void _togglePhotoAt(int index) {
    if (index < 0 || index >= _albumPhotos.length) return;
    setState(() {
      final i = _selectedPhotos.indexOf(index);
      if (i >= 0) {
        _selectedPhotos.removeAt(i);
      } else {
        _selectedPhotos.add(index);
      }
    });
  }

  Future<void> _previewSelectedPhotos() async {
    if (_selectedPhotos.isEmpty) return;
    final entities = <AssetEntity>[
      for (final i in _selectedPhotos)
        if (i >= 0 && i < _albumPhotos.length) _albumPhotos[i],
    ];
    if (entities.isEmpty || !mounted) return;
    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => AlbumSelectionPreviewPage(entities: entities),
      ),
    );
  }

  Future<void> _sendSelectedPhotos() async {
    if (_selectedPhotos.isEmpty) return;
    final entities = [
      for (final i in _selectedPhotos)
        if (i >= 0 && i < _albumPhotos.length) _albumPhotos[i],
    ];
    setState(() {
      _panel = _DmPanel.none;
      _selectedPhotos.clear();
    });

    final paths = <String>[];
    for (final entity in entities) {
      try {
        final file = _originalPhoto
            ? await entity.originFile
            : await entity.file;
        final path = file?.path.trim() ?? '';
        if (path.isNotEmpty) paths.add(path);
      } catch (error) {
        debugPrint('Resolve album file failed: $error');
      }
    }
    if (!mounted) return;
    if (paths.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not read selected photos'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    widget.onSendImages(paths);
  }

  Future<void> _pickFromAlbum() async {
    // System multi-picker as fallback / full album.
    try {
      final files = await ImagePicker().pickMultiImage(
        imageQuality: _originalPhoto ? 100 : 85,
      );
      if (files.isEmpty) return;
      setState(() {
        _panel = _DmPanel.none;
        _selectedPhotos.clear();
      });
      widget.onSendImages([for (final f in files) f.path]);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pick image failed: $error'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _pickFromCamera() async {
    try {
      // Close photo panel first so camera activity is not covered.
      if (_panel != _DmPanel.none) {
        setState(() => _panel = _DmPanel.none);
      }
      final file = await ImagePicker().pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
        imageQuality: _originalPhoto ? 100 : 85,
        maxWidth: 1920,
      );
      if (!mounted) return;
      if (file == null) {
        // User cancelled or no camera activity available.
        return;
      }
      widget.onSendImages([file.path]);
    } catch (error) {
      debugPrint('Camera pick failed: $error');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Camera unavailable: $error\n'
            'On emulator: enable virtual camera, or use Album.',
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Widget _toolIconFromAsset(String asset, {double size = 30}) {
    return AppAssetImage(asset, width: size, height: size, fit: BoxFit.contain);
  }

  Widget _giftToolIcon() {
    return const AppAssetImage(
      AppAssets.chatGift,
      width: 30,
      height: 30,
      fit: BoxFit.contain,
    );
  }

  Future<void> _showGiftSheet() async {
    _dismissKeyboard();
    if (_panel != _DmPanel.none) {
      setState(() => _panel = _DmPanel.none);
    }
    final result = await showModalBottomSheet<_GiftSendResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (_) => _GiftSheet(receiverUid: widget.receiverUid),
    );
    if (!mounted || result == null) return;
    widget.onSendGift(result);
  }

  void _showPlaceholder(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    final showPanel = _panel != _DmPanel.none;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    // Panel open: safe area only; keyboard open (no panel): pad by keyboard height.
    final bottomPad =
        showPanel ? widget.bottomInset : math.max(widget.bottomInset, keyboardInset);

    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              10,
              16,
              showPanel ? 0 : 8 + bottomPad,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: widget.controller,
                          focusNode: _inputFocus,
                          minLines: 1,
                          maxLines: 4,
                          textInputAction: TextInputAction.send,
                          onSubmitted: widget.onSend,
                          onTap: _closeFunctionPanel,
                          style: const TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            hintText: 'Send message...',
                            hintStyle: TextStyle(
                              color: Color(0xFFAEAEAE),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (_panel == _DmPanel.emoji)
                        GestureDetector(
                          onTap: _toggleEmojiPanel,
                          child: _toolIconFromAsset(
                            AppAssets.chatDmEmoji,
                            size: 24,
                          ),
                        )
                      else if (_hasText)
                        GestureDetector(
                          onTap: () => widget.onSend(null),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              gradient: AppColors.promoBannerGradient,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_upward_rounded,
                              size: 18,
                              color: Color(0xFF232518),
                            ),
                          ),
                        )
                      else
                        GestureDetector(
                          onTap: _toggleEmojiPanel,
                          child: _toolIconFromAsset(
                            AppAssets.chatDmEmoji,
                            size: 24,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: _toggleVoicePanel,
                        child: _toolIconFromAsset(
                          AppAssets.chatVoice,
                          size: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: _togglePhotoPanel,
                        child: _toolIconFromAsset(AppAssets.chatImg, size: 30),
                      ),
                      GestureDetector(
                        onTap: _showGiftSheet,
                        child: _giftToolIcon(),
                      ),
                      GestureDetector(
                        onTap: () => _showPlaceholder('Wish coming soon'),
                        child: _toolIconFromAsset(AppAssets.chatWish, size: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (showPanel)
            SizedBox(
              height: _panelHeight + widget.bottomInset,
              width: double.infinity,
              child: switch (_panel) {
                _DmPanel.voice => Padding(
                  padding: EdgeInsets.only(bottom: widget.bottomInset),
                  child: Center(
                    child: _ChatVoicePanel(
                      timeLabel: _voiceTimeLabel,
                      phase: _voicePhase,
                      progress: _voiceProgress,
                      onMainTap: _onVoiceMainTap,
                      onReset: _resetVoice,
                      onConfirm: _confirmVoice,
                    ),
                  ),
                ),
                _DmPanel.photo => _ChatPhotoPanel(
                  photos: _albumPhotos,
                  selected: _selectedPhotos,
                  originalPhoto: _originalPhoto,
                  loading: _albumLoading,
                  error: _albumError,
                  bottomInset: widget.bottomInset,
                  onTogglePhoto: _togglePhotoAt,
                  onCamera: () => unawaited(_pickFromCamera()),
                  onPreview: () => unawaited(_previewSelectedPhotos()),
                  onAlbum: () => unawaited(_pickFromAlbum()),
                  onToggleOriginal: () {
                    setState(() => _originalPhoto = !_originalPhoto);
                  },
                  onSend: () => unawaited(_sendSelectedPhotos()),
                  onRetry: () => unawaited(
                    _loadAlbumPhotos(openSettingsIfDenied: true),
                  ),
                ),
                _DmPanel.emoji => _ChatEmojiPanel(
                  bottomInset: widget.bottomInset,
                  canSend: _hasText,
                  onEmojiTap: _insertEmoji,
                  onBackspace: _emojiBackspace,
                  onSend: _sendFromEmojiPanel,
                ),
                _DmPanel.none => const SizedBox.shrink(),
              },
            ),
        ],
      ),
    );
  }
}

class _ChatEmojiPanel extends StatelessWidget {
  const _ChatEmojiPanel({
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

  static const Color _green = Color(0xFF00F875);

  static const List<String> _emojis = [
    '😀', '😁', '😂', '🤣', '😃', '😄', '😅', '😆',
    '😉', '😊', '😋', '😎', '😍', '😘', '🥰', '😗',
    '😙', '😚', '🙂', '🤗', '🤩', '🤔', '🤨', '😐',
    '😑', '😶', '🙄', '😏', '😣', '😥', '😮', '🤐',
    '😯', '😪', '😫', '🥱', '😴', '😌', '😛', '😜',
    '😝', '🤤', '😒', '😓', '😔', '😕', '🙃', '🤑',
    '😲', '☹️', '🙁', '😖', '😞', '😟', '😤', '😢',
    '😭', '😦', '😧', '😨', '😩', '🤯', '😬', '😰',
    '😱', '🥵', '🥶', '😳', '🤪', '😵', '😡', '😠',
    '🤬', '😷', '🤒', '🤕', '🤢', '🤮', '🤧', '😇',
    '🥳', '🥺', '🤠', '🤡', '🤥', '🤫', '🤭', '🧐',
    '🤓', '😈', '👿', '👹', '👺', '💀', '👻', '👽',
    '🤖', '💩', '😺', '😸', '😹', '😻', '😼', '😽',
    '🙀', '😿', '😾', '👍', '👎', '👏', '🙏', '💪',
    '❤️', '🧡', '💛', '💚', '💙', '💜', '🖤', '💔',
    '💕', '💞', '💓', '💗', '💖', '💘', '💝', '✨',
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFF7F7F7),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Column(
          children: [
            SizedBox(
              height: 44,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: const Text('😊', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
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
                        color: canSend ? _green : const Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        'Send',
                        style: TextStyle(
                          color: canSend ? Colors.black : const Color(0xFF999999),
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

class _ChatPhotoPanel extends StatelessWidget {
  const _ChatPhotoPanel({
    required this.photos,
    required this.selected,
    required this.originalPhoto,
    required this.loading,
    required this.error,
    required this.bottomInset,
    required this.onTogglePhoto,
    required this.onCamera,
    required this.onPreview,
    required this.onAlbum,
    required this.onToggleOriginal,
    required this.onSend,
    required this.onRetry,
  });

  final List<AssetEntity> photos;
  final List<int> selected;
  final bool originalPhoto;
  final bool loading;
  final String? error;
  final double bottomInset;
  final ValueChanged<int> onTogglePhoto;
  final VoidCallback onCamera;
  final VoidCallback onPreview;
  final VoidCallback onAlbum;
  final VoidCallback onToggleOriginal;
  final VoidCallback onSend;
  final VoidCallback onRetry;

  static const Color _green = Color(0xFF00F875);

  @override
  Widget build(BuildContext context) {
    final hasSelection = selected.isNotEmpty;
    // Camera cell + album photos.
    final itemCount = photos.length + 1;

    return Column(
      children: [
        Expanded(
          child: loading
              ? const Center(
                  child: SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : error != null && photos.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              error!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: onRetry,
                              child: const Text('Retry'),
                            ),
                            TextButton(
                              onPressed: onAlbum,
                              child: const Text('Open system album'),
                            ),
                          ],
                        ),
                      ),
                    )
                  : GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                        return _AlbumPhotoCell(
                          entity: photos[photoIndex],
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
    return Material(
      color: const Color(0xFFF5F5F5),
      child: InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD8D8D8)),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.photo_camera_outlined,
                size: 28,
                color: Color(0xFF666666),
              ),
              SizedBox(height: 4),
              Text(
                'Camera',
                style: TextStyle(
                  color: Color(0xFF888888),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlbumPhotoCell extends StatelessWidget {
  const _AlbumPhotoCell({
    required this.entity,
    required this.order,
    required this.onTap,
  });

  final AssetEntity entity;
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
          FutureBuilder<Uint8List?>(
            future: entity.thumbnailDataWithSize(
              const ThumbnailSize.square(200),
              quality: 80,
            ),
            builder: (context, snapshot) {
              final bytes = snapshot.data;
              if (bytes == null || bytes.isEmpty) {
                return const ColoredBox(
                  color: Color(0xFFE8E8E8),
                  child: Center(
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 1.5),
                    ),
                  ),
                );
              }
              return Image.memory(
                bytes,
                fit: BoxFit.cover,
                gaplessPlayback: true,
              );
            },
          ),
          if (selected) const ColoredBox(color: Color(0x3300F875)),
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

class _ChatVoicePanel extends StatelessWidget {
  const _ChatVoicePanel({
    required this.timeLabel,
    required this.phase,
    required this.progress,
    required this.onMainTap,
    required this.onReset,
    required this.onConfirm,
  });

  final String timeLabel;
  final _ChatVoicePhase phase;
  final double progress;
  final VoidCallback onMainTap;
  final VoidCallback onReset;
  final VoidCallback onConfirm;

  static const _labelStyle = TextStyle(
    color: Color(0xFFB0B0B0),
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 18 / 14,
  );

  @override
  Widget build(BuildContext context) {
    final isPreview = phase == _ChatVoicePhase.preview;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Design: 33×18 timer text
        Text(
          timeLabel,
          style: const TextStyle(
            color: Color(0xFFB0B0B0),
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 18 / 15,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Design: 44×44 side actions (preview only)
            SizedBox(
              width: 44,
              height: 44,
              child: isPreview
                  ? _ChatVoiceSideButton(
                      onTap: onReset,
                      child: Image.asset(
                        AppAssets.audioRefreshIcon,
                        width: 22,
                        height: 22,
                        fit: BoxFit.contain,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 24),
            _ChatVoiceMainButton(
              phase: phase,
              progress: progress,
              onTap: onMainTap,
            ),
            const SizedBox(width: 24),
            SizedBox(
              width: 44,
              height: 44,
              child: isPreview
                  ? _ChatVoiceSideButton(
                      onTap: onConfirm,
                      child: Image.asset(
                        AppAssets.audioFinishIcon,
                        width: 22,
                        height: 22,
                        fit: BoxFit.contain,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(switch (phase) {
          _ChatVoicePhase.idle => 'Click to record',
          _ChatVoicePhase.recording => 'Recording',
          _ChatVoicePhase.preview => 'Click to play',
        }, style: _labelStyle),
      ],
    );
  }
}

class _ChatVoiceMainButton extends StatelessWidget {
  const _ChatVoiceMainButton({
    required this.phase,
    required this.progress,
    required this.onTap,
  });

  final _ChatVoicePhase phase;
  final double progress;
  final VoidCallback onTap;

  /// Design outer size for the main control (86×86).
  static const double _outer = 86;

  /// Inset yellow fill so the ring around it stays visible.
  static const double _fill = 78;

  @override
  Widget build(BuildContext context) {
    final isIdle = phase == _ChatVoicePhase.idle;
    final isRecording = phase == _ChatVoicePhase.recording;
    final fillSize = isIdle ? _outer : _fill;

    return SizedBox(
      width: _outer,
      height: _outer,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isRecording)
            CustomPaint(
              size: const Size(_outer, _outer),
              painter: _ChatVoiceProgressPainter(progress: progress),
            )
          else if (phase == _ChatVoicePhase.preview)
            CustomPaint(
              size: const Size(_outer, _outer),
              // Preview: light track ring only (design white/grey border).
              painter: const _ChatVoiceProgressPainter(progress: 0),
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
                  child: switch (phase) {
                    // Design: mic 42×42
                    _ChatVoicePhase.idle ||
                    _ChatVoicePhase.recording => Image.asset(
                      AppAssets.audioRecordIcon,
                      width: 42,
                      height: 42,
                      fit: BoxFit.contain,
                    ),
                    // Design: waveform
                    _ChatVoicePhase.preview => Image.asset(
                      AppAssets.audioPlayingIcon,
                      width: 36,
                      height: 28,
                      fit: BoxFit.contain,
                    ),
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatVoiceProgressPainter extends CustomPainter {
  const _ChatVoiceProgressPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const stroke = 3.0;
    final radius = size.width / 2 - stroke / 2;
    final track = Paint()
      ..color = const Color(0xFFE8E8E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
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
  bool shouldRepaint(covariant _ChatVoiceProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _ChatVoiceSideButton extends StatelessWidget {
  const _ChatVoiceSideButton({required this.onTap, required this.child});

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

