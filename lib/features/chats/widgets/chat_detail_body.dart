part of '../chat_detail_page.dart';

class _DmChatBody extends StatelessWidget {
  const _DmChatBody({
    required this.messages,
    required this.peerAvatar,
    required this.messagesScroll,
    required this.onHandleDragUpdate,
    required this.onHandleDragEnd,
    this.peerAvatarUrl,
    this.selfAvatarUrl,
    this.historyLoading = false,
    this.historyHasMore = false,
    this.onBlankTap,
    this.onFailedTap,
  });

  final List<_ChatLine> messages;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final ScrollController messagesScroll;
  final GestureDragUpdateCallback onHandleDragUpdate;
  final GestureDragEndCallback onHandleDragEnd;
  final bool historyLoading;
  final bool historyHasMore;
  final VoidCallback? onBlankTap;
  final ValueChanged<int>? onFailedTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragUpdate: onHandleDragUpdate,
            onVerticalDragEnd: onHandleDragEnd,
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: SizedBox(
                  width: 36,
                  height: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFD8D8D8),
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _DmMessagesFeed(
              messages: messages,
              peerAvatar: peerAvatar,
              peerAvatarUrl: peerAvatarUrl,
              selfAvatarUrl: selfAvatarUrl,
              scrollController: messagesScroll,
              historyLoading: historyLoading,
              historyHasMore: historyHasMore,
              onBlankTap: onBlankTap,
              onFailedTap: onFailedTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _DmMessagesFeed extends StatelessWidget {
  const _DmMessagesFeed({
    required this.messages,
    required this.peerAvatar,
    required this.scrollController,
    this.peerAvatarUrl,
    this.selfAvatarUrl,
    this.historyLoading = false,
    this.historyHasMore = false,
    this.onBlankTap,
    this.onFailedTap,
  });

  final List<_ChatLine> messages;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final ScrollController scrollController;
  final bool historyLoading;
  final bool historyHasMore;
  final VoidCallback? onBlankTap;
  final ValueChanged<int>? onFailedTap;

  bool _showAvatar(int index) {
    if (messages[index].kind == _ChatLineKind.tip) return false;
    // 回退跳过 tip 行，使头像分组保持正确。
    var prev = index - 1;
    while (prev >= 0 && messages[prev].kind == _ChatLineKind.tip) {
      prev--;
    }
    if (prev < 0) return true;
    return messages[index].side != messages[prev].side;
  }

  bool _isMedia(int index) {
    final k = messages[index].kind;
    return k == _ChatLineKind.image ||
        k == _ChatLineKind.voice ||
        k == _ChatLineKind.emote;
  }

  double _topGap(int index) {
    if (index == 0) return 0;
    final sameSide = messages[index].side == messages[index - 1].side;
    if (!sameSide) return _BubbleLayout.otherGap;
    // 媒体叠媒体 / 媒体叠语音时间距更紧。
    if (_isMedia(index) && _isMedia(index - 1)) {
      return _BubbleLayout.sameMediaGap;
    }
    return _BubbleLayout.sameGap;
  }

  bool _showTimeLabel(int index) {
    final t = messages[index].serverTimeMs;
    if (t <= 0) return index == 0;
    if (index == 0) return true;
    final prev = messages[index - 1].serverTimeMs;
    if (prev <= 0) return true;
    // 间隔 ≥ 5 分钟时显示（对齐常见 IM 节奏）。
    return (t - prev).abs() >= 5 * 60 * 1000;
  }

  String _formatTime(int ms) {
    final now = DateTime.now();
    final time = DateTime.fromMillisecondsSinceEpoch(ms);
    final clock = _formatClock(time);

    // 对齐 forya TimeAgo.timeForMsg(showTime: true)：
    // 同一自然日 → 时钟；24h 内的下一自然日 → yesterday；
    // 更早 → 月/日（需要时带年）。
    if (now.year != time.year) {
      return '${_monthAbbr(time.month)} ${time.day}, ${time.year} $clock';
    }
    final elapsed = now.difference(time);
    if (elapsed.inDays >= 1) {
      return '${_monthAbbr(time.month)} ${time.day} $clock';
    }
    if (now.day != time.day || now.month != time.month) {
      return 'yesterday $clock';
    }
    return clock;
  }

  String _formatClock(DateTime dt) {
    final h24 = dt.hour;
    final m = dt.minute.toString().padLeft(2, '0');
    final period = h24 >= 12 ? 'PM' : 'AM';
    final h12 = h24 % 12 == 0 ? 12 : h24 % 12;
    return '$h12:$m $period';
  }

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  String _monthAbbr(int month) =>
      _months[(month - 1).clamp(0, 11)];

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onBlankTap,
        child: const Center(
          child: Text(
            'No messages yet',
            style: TextStyle(
              color: Color(0xFFC9C9C9),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    final showTopLoader = historyLoading || historyHasMore;
    final itemCount = messages.length + (showTopLoader ? 1 : 0);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onBlankTap,
      child: ListView.builder(
        controller: scrollController,
        // 非 reverse：短会话从把手下方开始（无大块顶部空白）。
        // 进入时仍通过 jumpTo(maxScrollExtent) 钉到最新。
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 24),
        itemCount: itemCount,
        itemBuilder: (context, index) {
        if (showTopLoader && index == 0) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xFFB0B0B0),
                ),
              ),
            ),
          );
        }
        final msgIndex = showTopLoader ? index - 1 : index;
        final line = messages[msgIndex];
        final showAvatar = _showAvatar(msgIndex);
        final showTime = _showTimeLabel(msgIndex);
        final bubble = switch (line.kind) {
          _ChatLineKind.voice => _VoiceBubble(
            side: line.side,
            seconds: line.voiceSeconds,
            mediaSource: line.mediaSource,
            peerAvatar: peerAvatar,
            peerAvatarUrl: peerAvatarUrl,
            selfAvatarUrl: selfAvatarUrl,
            showAvatar: showAvatar,
            failed: line.failed,
            onFailedTap: line.failed ? () => onFailedTap?.call(msgIndex) : null,
          ),
          _ChatLineKind.image => _ImageBubble(
            side: line.side,
            source: line.displayMedia,
            locked: false,
            peerAvatar: peerAvatar,
            peerAvatarUrl: peerAvatarUrl,
            selfAvatarUrl: selfAvatarUrl,
            showAvatar: showAvatar,
            failed: line.failed,
            onFailedTap: line.failed ? () => onFailedTap?.call(msgIndex) : null,
            onTap: () {
              final paths = [
                for (final m in messages)
                  if (m.kind == _ChatLineKind.image &&
                      m.displayMedia.trim().isNotEmpty)
                    m.displayMedia.trim(),
              ];
              final src = line.displayMedia.trim();
              final initial = paths.indexOf(src);
              AlbumPhotoViewerPage.open(
                context,
                paths: paths,
                initialIndex: initial < 0 ? 0 : initial,
                showPageIndicator: false,
              );
            },
          ),
          _ChatLineKind.gift => _GiftMessageCard(
            side: line.side,
            giftId: line.giftId,
            qty: line.giftQty,
            emoji: line.giftEmoji,
            giftName: line.giftName,
            giftIconUrl: line.giftIconUrl,
            peerAvatar: peerAvatar,
            peerAvatarUrl: peerAvatarUrl,
            selfAvatarUrl: selfAvatarUrl,
            showAvatar: showAvatar,
          ),
          _ChatLineKind.emote => _EmoteBubble(
            side: line.side,
            source: line.displayMedia,
            peerAvatar: peerAvatar,
            peerAvatarUrl: peerAvatarUrl,
            selfAvatarUrl: selfAvatarUrl,
            showAvatar: showAvatar,
            failed: line.failed,
            onFailedTap: line.failed ? () => onFailedTap?.call(msgIndex) : null,
          ),
          _ChatLineKind.tip => Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Text(
                  line.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFAEAEAE),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
              ),
            ),
          _ChatLineKind.text => line.side == _ChatSide.self
              ? _SelfBubble(
                  text: line.text,
                  showAvatar: showAvatar,
                  avatarUrl: selfAvatarUrl,
                  failed: line.failed,
                  onFailedTap:
                      line.failed ? () => onFailedTap?.call(msgIndex) : null,
                )
              : _PeerBubble(
                  text: line.text,
                  avatarAsset: peerAvatar,
                  avatarUrl: peerAvatarUrl,
                  showAvatar: showAvatar,
                ),
        };

        return Padding(
          padding: EdgeInsets.only(top: showTime ? 12 : _topGap(msgIndex)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (showTime && line.serverTimeMs > 0) ...[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      _formatTime(line.serverTimeMs),
                      style: _BubbleLayout.timeStyle,
                    ),
                  ),
                ),
              ],
              bubble,
            ],
          ),
        );
      },
      ),
    );
  }
}

class _ChatAvatar extends StatelessWidget {
  const _ChatAvatar({required this.asset, this.url});

  final String asset;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: NetworkOrAssetAvatar(
        asset: asset,
        url: url,
        width: _BubbleLayout.avatar,
        height: _BubbleLayout.avatar,
      ),
    );
  }
}

/// 共用左右行布局，使文本 / 图片 / 语音列节奏一致。
class _ChatRow extends StatelessWidget {
  const _ChatRow({
    required this.isSelf,
    required this.showAvatar,
    required this.child,
    required this.peerAvatar,
    this.peerAvatarUrl,
    this.selfAvatarUrl,
    this.failed = false,
    this.onFailedTap,
  });

  final bool isSelf;
  final bool showAvatar;
  final Widget child;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final bool failed;
  final VoidCallback? onFailedTap;

  @override
  Widget build(BuildContext context) {
    final avatar = showAvatar
        ? _ChatAvatar(
            asset: isSelf ? AppAssets.avatarPlace : peerAvatar,
            url: isSelf ? selfAvatarUrl : peerAvatarUrl,
          )
        : const SizedBox(width: _BubbleLayout.avatar);

    if (isSelf) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Align(
              alignment: Alignment.centerRight,
              // 失败感叹号紧贴气泡左侧，勿与 Flexible 并列否则会被撑到最左。
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (failed) ...[
                    GestureDetector(
                      onTap: onFailedTap,
                      behavior: HitTestBehavior.opaque,
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.error,
                          color: Color(0xFFFF3B30),
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                  ],
                  child,
                ],
              ),
            ),
          ),
          const SizedBox(width: _BubbleLayout.avatarGap),
          avatar,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar,
        const SizedBox(width: _BubbleLayout.avatarGap),
        Flexible(
          child: Align(
            alignment: Alignment.centerLeft,
            child: child,
          ),
        ),
      ],
    );
  }
}

class _PeerBubble extends StatelessWidget {
  const _PeerBubble({
    required this.text,
    required this.avatarAsset,
    required this.showAvatar,
    this.avatarUrl,
  });

  final String text;
  final String avatarAsset;
  final String? avatarUrl;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    final pureEmoji = AppEmoji.isCustomEmojiOnly(text);
    final style = (pureEmoji
            ? _BubbleLayout.peerTextStyle.copyWith(
                fontSize: 28,
                height: 1.2,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              )
            : _BubbleLayout.peerTextStyle)
        .withAppEmoji;
    final child = pureEmoji
        ? Text(text, style: style)
        : Container(
            padding: const EdgeInsets.symmetric(
              horizontal: _BubbleLayout.padH,
              vertical: _BubbleLayout.padV,
            ),
            decoration: const BoxDecoration(
              color: _BubbleLayout.peerColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Text(text, style: style),
          );
    return _ChatRow(
      isSelf: false,
      showAvatar: showAvatar,
      peerAvatar: avatarAsset,
      peerAvatarUrl: avatarUrl,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _BubbleLayout.peerMax),
        child: child,
      ),
    );
  }
}

class _SelfBubble extends StatelessWidget {
  const _SelfBubble({
    required this.text,
    required this.showAvatar,
    this.avatarUrl,
    this.failed = false,
    this.onFailedTap,
  });

  final String text;
  final bool showAvatar;
  final String? avatarUrl;
  final bool failed;
  final VoidCallback? onFailedTap;

  @override
  Widget build(BuildContext context) {
    final pureEmoji = AppEmoji.isCustomEmojiOnly(text);
    final style = (pureEmoji
            ? _BubbleLayout.textStyle.copyWith(
                fontSize: 28,
                height: 1.2,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              )
            : _BubbleLayout.textStyle)
        .withAppEmoji;
    final child = pureEmoji
        ? Text(text, style: style)
        : Container(
            padding: const EdgeInsets.symmetric(
              horizontal: _BubbleLayout.padH,
              vertical: _BubbleLayout.padV,
            ),
            decoration: const BoxDecoration(
              color: _BubbleLayout.selfColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Text(text, style: style),
          );
    return _ChatRow(
      isSelf: true,
      showAvatar: showAvatar,
      peerAvatar: AppAssets.avatarPlace,
      selfAvatarUrl: avatarUrl,
      failed: failed,
      onFailedTap: onFailedTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _BubbleLayout.selfMax),
        child: child,
      ),
    );
  }
}

class _VoiceBubble extends StatefulWidget {
  const _VoiceBubble({
    required this.side,
    required this.seconds,
    required this.peerAvatar,
    required this.showAvatar,
    this.mediaSource = '',
    this.peerAvatarUrl,
    this.selfAvatarUrl,
    this.failed = false,
    this.onFailedTap,
  });

  final _ChatSide side;
  final int seconds;
  final String mediaSource;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final bool showAvatar;
  final bool failed;
  final VoidCallback? onFailedTap;

  @override
  State<_VoiceBubble> createState() => _VoiceBubbleState();
}

class _VoiceBubbleState extends State<_VoiceBubble>
    with SingleTickerProviderStateMixin {
  static final AudioPlayer _player = AudioPlayer();

  bool _playing = false;
  int _remaining = 0;
  Timer? _playTimer;
  StreamSubscription<void>? _completeSub;
  late final AnimationController _waveController;

  bool get _isSelf => widget.side == _ChatSide.self;

  String get _source => widget.mediaSource.trim();

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  @override
  void dispose() {
    AppVoiceExclusive.release(_stopPlay);
    if (_playing) {
      unawaited(_player.stop());
    }
    _completeSub?.cancel();
    _playTimer?.cancel();
    _waveController.dispose();
    super.dispose();
  }

  void _stopPlay() {
    _playTimer?.cancel();
    _playTimer = null;
    unawaited(_completeSub?.cancel() ?? Future<void>.value());
    _completeSub = null;
    unawaited(_player.stop());
    _waveController.stop();
    _waveController.reset();
    AppVoiceExclusive.release(_stopPlay);
    if (!mounted) {
      _playing = false;
      _remaining = 0;
      return;
    }
    setState(() {
      _playing = false;
      _remaining = 0;
    });
  }

  Future<void> _togglePlay() async {
    if (widget.seconds <= 0 && _source.isEmpty) return;
    if (_playing) {
      _stopPlay();
      return;
    }
    AppVoiceExclusive.claim(_stopPlay);
    setState(() {
      _playing = true;
      _remaining = widget.seconds > 0 ? widget.seconds : 1;
    });
    _waveController.repeat();

    final src = _source;
    if (src.isNotEmpty) {
      try {
        await AppAudioPlayback.play(_player, src);
        await _completeSub?.cancel();
        _completeSub = _player.onPlayerComplete.listen((_) {
          if (mounted) _stopPlay();
        });
      } catch (error) {
        debugPrint('Voice play failed: $error');
      }
    }

    // 即使音频失败也做 UI 倒计时（保持波形条动画）。
    _playTimer?.cancel();
    if (widget.seconds > 0) {
      _playTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        if (_remaining <= 1) {
          timer.cancel();
          _playTimer = null;
          _stopPlay();
          return;
        }
        setState(() => _remaining -= 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final displaySeconds = _playing ? _remaining : widget.seconds;
    final expired = _source.isEmpty && widget.seconds <= 0;
    final secs = widget.seconds.clamp(1, 60);

    final bubble = GestureDetector(
      onTap: expired ? null : _togglePlay,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: expired
            ? 140
            : (80 + secs * (200 - 80) / 60).clamp(80.0, 200.0),
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: _isSelf ? _BubbleLayout.selfColor : _BubbleLayout.peerColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_isSelf ? 16 : 4),
            topRight: Radius.circular(_isSelf ? 4 : 16),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
          ),
        ),
        // 对齐 forya：波形在左，时长在右（spaceBetween）。
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (expired)
              const Expanded(
                child: Text(
                  'Voice expired',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            else ...[
              _VoiceBarsIcon(
                playing: _playing,
                animation: _waveController,
              ),
              Text(
                '${displaySeconds > 0 ? displaySeconds : widget.seconds}s',
                style: const TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );

    return _ChatRow(
      isSelf: _isSelf,
      showAvatar: widget.showAvatar,
      peerAvatar: widget.peerAvatar,
      peerAvatarUrl: widget.peerAvatarUrl,
      selfAvatarUrl: widget.selfAvatarUrl,
      failed: widget.failed,
      onFailedTap: widget.onFailedTap,
      child: bubble,
    );
  }
}

/// 设计：语音气泡左侧三条波形；播放时动画。
class _VoiceBarsIcon extends StatelessWidget {
  const _VoiceBarsIcon({
    this.playing = false,
    this.animation,
  });

  final bool playing;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    if (!playing || animation == null) {
      return const SizedBox(
        width: 16,
        height: 16,
        child: CustomPaint(painter: _VoiceBarsPainter()),
      );
    }
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, _) {
        return SizedBox(
          width: 16,
          height: 16,
          child: CustomPaint(
            painter: _VoiceBarsPainter(
              phase: animation!.value * 2 * math.pi,
              playing: true,
            ),
          ),
        );
      },
    );
  }
}

class _VoiceBarsPainter extends CustomPainter {
  const _VoiceBarsPainter({this.phase = 0, this.playing = false});

  final double phase;
  final bool playing;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF111111)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    const widths = 2.4;
    final base = [size.height * 0.45, size.height, size.height * 0.62];
    final gap = (size.width - widths * 3) / 2;
    for (var i = 0; i < 3; i++) {
      var h = base[i];
      if (playing) {
        final pulse = 0.55 + 0.45 * ((math.sin(phase + i * 1.7) + 1) / 2);
        h = size.height * (0.28 + 0.72 * pulse * (base[i] / size.height));
      }
      final x = i * (widths + gap);
      final y = (size.height - h) / 2;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, widths, h),
          const Radius.circular(1.2),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _VoiceBarsPainter oldDelegate) {
    return oldDelegate.phase != phase || oldDelegate.playing != playing;
  }
}

/// 图片消息：网络 / 文件 / 资源；可选锁定模糊 + Join to view。
class _ImageBubble extends StatelessWidget {
  const _ImageBubble({
    required this.side,
    required this.source,
    required this.locked,
    required this.peerAvatar,
    required this.showAvatar,
    this.peerAvatarUrl,
    this.selfAvatarUrl,
    this.onTap,
    this.failed = false,
    this.onFailedTap,
  });

  final _ChatSide side;
  final String source;
  final bool locked;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final bool showAvatar;
  final VoidCallback? onTap;
  final bool failed;
  final VoidCallback? onFailedTap;

  bool get _isSelf => side == _ChatSide.self;

  Widget _imageChild() {
    final src = source.trim();
    if (src.isEmpty) {
      return Container(
        color: const Color(0xFF262624),
        alignment: Alignment.center,
        child: const Text(
          'Picture expired',
          style: TextStyle(
            color: Color(0xFF666666),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
    if (src.startsWith('http://') || src.startsWith('https://')) {
      return AppNetworkImage(
        src,
        fit: BoxFit.cover,
        memCacheWidth: 720,
        placeholder: (_, _) => const ColoredBox(
          color: Color(0xFFF3F3F3),
          child: Center(
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
        errorWidget: (_, _, _) => Container(
          color: const Color(0xFF262624),
          alignment: Alignment.center,
          child: const Text(
            'Picture expired',
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
    if (src.startsWith('assets/') || !src.contains(RegExp(r'[/\\]'))) {
      return Image.asset(
        src,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => Container(
          color: const Color(0xFFE8E8E8),
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image_outlined, color: Color(0xFF999999)),
        ),
      );
    }
    final file = File(src);
    if (file.existsSync()) {
      return Image.file(file, fit: BoxFit.cover);
    }
    return Container(
      color: const Color(0xFF262624),
      alignment: Alignment.center,
      child: const Text(
        'Picture expired',
        style: TextStyle(
          color: Color(0xFF666666),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(_BubbleLayout.imageRadius);

    final bubble = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: SizedBox(
          width: _BubbleLayout.imageW,
          height: _BubbleLayout.imageH,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (locked)
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                  child: Transform.scale(
                    scale: 1.08,
                    child: _imageChild(),
                  ),
                )
              else
                _imageChild(),
              if (locked)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ColoredBox(
                    color: Colors.black.withValues(alpha: 0.48),
                    child: const SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _LockIcon(),
                          SizedBox(width: 6),
                          Text(
                            'Join to view',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );

    return _ChatRow(
      isSelf: _isSelf,
      showAvatar: showAvatar,
      peerAvatar: peerAvatar,
      peerAvatarUrl: peerAvatarUrl,
      selfAvatarUrl: selfAvatarUrl,
      failed: failed,
      onFailedTap: onFailedTap,
      child: locked || onTap == null
          ? bubble
          : GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: bubble,
            ),
    );
  }
}

/// 贴纸消息：网络 URL，contain 适配（不像照片那样裁切）。
class _EmoteBubble extends StatelessWidget {
  const _EmoteBubble({
    required this.side,
    required this.source,
    required this.peerAvatar,
    required this.showAvatar,
    this.peerAvatarUrl,
    this.selfAvatarUrl,
    this.failed = false,
    this.onFailedTap,
  });

  final _ChatSide side;
  final String source;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final bool showAvatar;
  final bool failed;
  final VoidCallback? onFailedTap;

  bool get _isSelf => side == _ChatSide.self;

  Widget _sticker() {
    final src = source.trim();
    // 对齐 forya `_EmoteItem`：固定宽 65，fitWidth（无 cover 裁切）。
    const size = _BubbleLayout.emoteSize;
    if (src.isEmpty) {
      return const SizedBox(
        width: size,
        height: size,
        child: ColoredBox(
          color: Color(0xFFF0F0F0),
          child: Icon(Icons.broken_image_outlined, color: Color(0xFF999999)),
        ),
      );
    }

    final Widget image;
    if (src.startsWith('http://') || src.startsWith('https://')) {
      image = AppNetworkImage(
        src,
        width: size,
        fit: BoxFit.fitWidth,
        filterQuality: FilterQuality.medium,
        placeholder: (_, _) => const SizedBox(
          width: size,
          height: size,
          child: ColoredBox(
            color: Color(0xFFF5F5F5),
            child: Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
        ),
        errorWidget: (_, _, _) => const SizedBox(
          width: size,
          height: size,
          child: ColoredBox(
            color: Color(0xFFF0F0F0),
            child: Icon(Icons.broken_image_outlined, color: Color(0xFF999999)),
          ),
        ),
      );
    } else {
      final file = File(src);
      if (file.existsSync()) {
        image = Image.file(file, width: size, fit: BoxFit.fitWidth);
      } else {
        image = const SizedBox(
          width: size,
          height: size,
          child: ColoredBox(
            color: Color(0xFFF0F0F0),
            child: Icon(Icons.broken_image_outlined, color: Color(0xFF999999)),
          ),
        );
      }
    }

    return SizedBox(
      width: size,
      child: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _ChatRow(
      isSelf: _isSelf,
      showAvatar: showAvatar,
      peerAvatar: peerAvatar,
      peerAvatarUrl: peerAvatarUrl,
      selfAvatarUrl: selfAvatarUrl,
      failed: failed,
      onFailedTap: onFailedTap,
      child: _sticker(),
    );
  }
}

class _GiftMessageCard extends StatelessWidget {
  const _GiftMessageCard({
    required this.side,
    required this.giftId,
    required this.qty,
    required this.emoji,
    required this.peerAvatar,
    required this.showAvatar,
    this.giftName = '',
    this.giftIconUrl = '',
    this.peerAvatarUrl,
    this.selfAvatarUrl,
  });

  final _ChatSide side;
  final int giftId;
  final int qty;
  final String emoji;
  final String giftName;
  final String giftIconUrl;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final bool showAvatar;

  /// 对齐 forya GiftItemV2：padding 16，图标 56，间距 16，字号 14。
  static const _qtyYellow = Color(0xFFFDF652);
  static const _labelStyle = TextStyle(
    color: Color(0xFF1A1A1A),
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  Widget _giftIcon() {
    if (giftIconUrl.isNotEmpty) {
      return AppNetworkImage(
        giftIconUrl,
        width: 56,
        height: 56,
        fit: BoxFit.contain,
        errorWidget: (_, _, _) => Text(
          emoji.isEmpty ? '🎁' : emoji,
          style: const TextStyle(fontSize: 36, height: 1),
        ),
      );
    }
    return Text(
      emoji.isEmpty ? '🎁' : emoji,
      style: const TextStyle(fontSize: 36, height: 1),
    );
  }

  Widget _content({required bool isSelf}) {
    final name = giftName.isNotEmpty
        ? giftName
        : (giftId > 0 ? '$giftId' : 'Gift');
    return LimitedBox(
      maxWidth: 200,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: isSelf ? 'You sent\n' : 'Gift to you\n',
              style: _labelStyle,
            ),
            TextSpan(text: '$name ', style: _labelStyle),
            TextSpan(
              text: 'x $qty',
              style: const TextStyle(
                color: _qtyYellow,
                fontSize: 14,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                height: 1.25,
                shadows: [
                  Shadow(
                    color: Color(0x80333333),
                    blurRadius: 1,
                    offset: Offset(0, 0.5),
                  ),
                ],
              ),
            ),
          ],
        ),
        maxLines: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSelf = side == _ChatSide.self;
    final avatar = showAvatar
        ? _ChatAvatar(
            asset: isSelf ? AppAssets.avatarPlace : peerAvatar,
            url: isSelf ? selfAvatarUrl : peerAvatarUrl,
          )
        : const SizedBox(width: _BubbleLayout.avatar);

    final card = Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isSelf
                  ? const [Color(0x33FE8F19), Color(0x33FC1192)]
                  : const [Color(0x33FC1192), Color(0x33FE8F19)],
            ),
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(isSelf ? 16 : 0),
              topEnd: Radius.circular(isSelf ? 0 : 16),
              bottomStart: const Radius.circular(16),
              bottomEnd: const Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSelf) ...[
                _content(isSelf: true),
                const SizedBox(width: 16),
                _giftIcon(),
              ] else ...[
                _giftIcon(),
                const SizedBox(width: 16),
                _content(isSelf: false),
              ],
            ],
          ),
        ),
        // 对齐 forya 礼物气泡角上的 box-item 徽章。
        const PositionedDirectional(
          end: -8,
          bottom: -8,
          child: _GiftBoxBadge(),
        ),
      ],
    );

    if (isSelf) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          card,
          const SizedBox(width: _BubbleLayout.avatarGap),
          avatar,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar,
        const SizedBox(width: _BubbleLayout.avatarGap),
        card,
      ],
    );
  }
}

class _GiftBoxBadge extends StatelessWidget {
  const _GiftBoxBadge();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.giftIcon,
      width: 28,
      height: 28,
      fit: BoxFit.contain,
    );
  }
}

class _LockIcon extends StatelessWidget {
  const _LockIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.lockIcon, width: 13, height: 14);
  }
}

