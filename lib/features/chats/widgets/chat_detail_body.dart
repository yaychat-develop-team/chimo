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
  });

  final List<_ChatLine> messages;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final ScrollController messagesScroll;
  final GestureDragUpdateCallback onHandleDragUpdate;
  final GestureDragEndCallback onHandleDragEnd;

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
  });

  final List<_ChatLine> messages;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final ScrollController scrollController;

  bool _showAvatar(int index) {
    if (index == 0) return true;
    return messages[index].side != messages[index - 1].side;
  }

  bool _isMedia(int index) {
    final k = messages[index].kind;
    return k == _ChatLineKind.image || k == _ChatLineKind.voice;
  }

  double _topGap(int index) {
    if (index == 0) return 0;
    final sameSide = messages[index].side == messages[index - 1].side;
    if (!sameSide) return _BubbleLayout.otherGap;
    // Tighter when stacking media → media / media → voice.
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
    // Show when gap ≥ 5 minutes (matches common IM rhythm).
    return (t - prev).abs() >= 5 * 60 * 1000;
  }

  String _formatTime(int ms) {
    final dt = DateTime.fromMillisecondsSinceEpoch(ms);
    final h24 = dt.hour;
    final m = dt.minute.toString().padLeft(2, '0');
    final period = h24 >= 12 ? 'PM' : 'AM';
    final h12 = h24 % 12 == 0 ? 12 : h24 % 12;
    return '$h12:$m $period';
  }

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return const Center(
        child: Text(
          'No messages yet',
          style: TextStyle(
            color: Color(0xFFC9C9C9),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 24),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final line = messages[index];
        final showAvatar = _showAvatar(index);
        final showTime = _showTimeLabel(index);
        final bubble = switch (line.kind) {
          _ChatLineKind.voice => _VoiceBubble(
            side: line.side,
            seconds: line.voiceSeconds,
            mediaSource: line.mediaSource,
            peerAvatar: peerAvatar,
            peerAvatarUrl: peerAvatarUrl,
            selfAvatarUrl: selfAvatarUrl,
            showAvatar: showAvatar,
          ),
          _ChatLineKind.image => _ImageBubble(
            side: line.side,
            source: line.displayMedia,
            locked: false,
            peerAvatar: peerAvatar,
            peerAvatarUrl: peerAvatarUrl,
            selfAvatarUrl: selfAvatarUrl,
            showAvatar: showAvatar,
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
          _ChatLineKind.text => line.side == _ChatSide.self
              ? _SelfBubble(
                  text: line.text,
                  showAvatar: showAvatar,
                  avatarUrl: selfAvatarUrl,
                )
              : _PeerBubble(
                  text: line.text,
                  avatarAsset: peerAvatar,
                  avatarUrl: peerAvatarUrl,
                  showAvatar: showAvatar,
                ),
        };

        return Padding(
          padding: EdgeInsets.only(top: showTime ? 12 : _topGap(index)),
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

/// Shared left/right row so text / image / voice share the same column rhythm.
class _ChatRow extends StatelessWidget {
  const _ChatRow({
    required this.isSelf,
    required this.showAvatar,
    required this.child,
    required this.peerAvatar,
    this.peerAvatarUrl,
    this.selfAvatarUrl,
  });

  final bool isSelf;
  final bool showAvatar;
  final Widget child;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;

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
              child: child,
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
    return _ChatRow(
      isSelf: false,
      showAvatar: showAvatar,
      peerAvatar: avatarAsset,
      peerAvatarUrl: avatarUrl,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _BubbleLayout.peerMax),
        child: Container(
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
          child: Text(text, style: _BubbleLayout.peerTextStyle),
        ),
      ),
    );
  }
}

class _SelfBubble extends StatelessWidget {
  const _SelfBubble({
    required this.text,
    required this.showAvatar,
    this.avatarUrl,
  });

  final String text;
  final bool showAvatar;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return _ChatRow(
      isSelf: true,
      showAvatar: showAvatar,
      peerAvatar: AppAssets.avatarPlace,
      selfAvatarUrl: avatarUrl,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _BubbleLayout.selfMax),
        child: Container(
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
          child: Text(text, style: _BubbleLayout.textStyle),
        ),
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
  });

  final _ChatSide side;
  final int seconds;
  final String mediaSource;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final bool showAvatar;

  @override
  State<_VoiceBubble> createState() => _VoiceBubbleState();
}

class _VoiceBubbleState extends State<_VoiceBubble>
    with SingleTickerProviderStateMixin {
  /// Only one voice message may play at a time.
  static VoidCallback? _activeStop;
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
    if (_activeStop == _stopPlay) {
      _activeStop = null;
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
    if (_activeStop == _stopPlay) {
      _activeStop = null;
    }
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
    _activeStop?.call();
    _activeStop = _stopPlay;
    setState(() {
      _playing = true;
      _remaining = widget.seconds > 0 ? widget.seconds : 1;
    });
    _waveController.repeat();

    final src = _source;
    if (src.isNotEmpty) {
      try {
        if (src.startsWith('http://') || src.startsWith('https://')) {
          await _player.play(UrlSource(src));
        } else if (File(src).existsSync()) {
          await _player.play(DeviceFileSource(src));
        } else {
          // Unknown path — fall through to tick timer only.
        }
        await _completeSub?.cancel();
        _completeSub = _player.onPlayerComplete.listen((_) {
          if (mounted) _stopPlay();
        });
      } catch (error) {
        debugPrint('Voice play failed: $error');
      }
    }

    // UI countdown even if audio fails (keeps bars animating).
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
        // Match forya: waveform left, duration right (spaceBetween).
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
      child: bubble,
    );
  }
}

/// Design: three waveform bars left of voice bubble; animate while playing.
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

/// Image message: network / file / asset; optional locked blur + Join to view.
class _ImageBubble extends StatelessWidget {
  const _ImageBubble({
    required this.side,
    required this.source,
    required this.locked,
    required this.peerAvatar,
    required this.showAvatar,
    this.peerAvatarUrl,
    this.selfAvatarUrl,
  });

  final _ChatSide side;
  final String source;
  final bool locked;
  final String peerAvatar;
  final String? peerAvatarUrl;
  final String? selfAvatarUrl;
  final bool showAvatar;

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
      return Image.network(
        src,
        fit: BoxFit.cover,
        gaplessPlayback: true,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const ColoredBox(
            color: Color(0xFFF3F3F3),
            child: Center(
              child: SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        },
        errorBuilder: (_, _, _) => Container(
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
      child: bubble,
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

  /// Design: pink→peach gift strip with corner chest badge.
  static const _cardHeight = 82.0;
  static const _cardMax = 268.0;
  static const _qtyYellow = Color(0xFFE8FF00);

  @override
  Widget build(BuildContext context) {
    final isSelf = side == _ChatSide.self;
    final avatar = showAvatar
        ? _ChatAvatar(
            asset: isSelf ? AppAssets.avatarPlace : peerAvatar,
            url: isSelf ? selfAvatarUrl : peerAvatarUrl,
          )
        : const SizedBox(width: _BubbleLayout.avatar);

    final card = ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: _cardMax,
        minWidth: 220,
      ),
      child: SizedBox(
        height: _cardHeight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFFFD0E4),
                      Color(0xFFFFE4C4),
                      Color(0xFFFFF3C8),
                    ],
                    stops: [0.0, 0.55, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF8AB8).withValues(alpha: 0.18),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 66,
                        height: 66,
                        child: Center(
                          child: giftIconUrl.isNotEmpty
                              ? Image.network(
                                  giftIconUrl,
                                  width: 52,
                                  height: 52,
                                  fit: BoxFit.contain,
                                  errorBuilder: (_, _, _) => Text(
                                    emoji.isEmpty ? '🎁' : emoji,
                                    style: const TextStyle(
                                      fontSize: 44,
                                      height: 1,
                                    ),
                                  ),
                                )
                              : Text(
                                  emoji.isEmpty ? '🎁' : emoji,
                                  style: const TextStyle(fontSize: 44, height: 1),
                                ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isSelf ? 'You sent' : 'Gift to you',
                              style: const TextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                height: 1.15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: Text(
                                    giftName.isNotEmpty
                                        ? giftName
                                        : (giftId > 0 ? '$giftId' : 'Gift'),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xFF1A1A1A),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                      height: 1.1,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                // Neon yellow qty with light outline for cream bg.
                                Stack(
                                  children: [
                                    Text(
                                      'x $qty',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                        height: 1,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 2.2
                                          ..color = const Color(0xFF3A2A00),
                                      ),
                                    ),
                                    Text(
                                      'x $qty',
                                      style: const TextStyle(
                                        color: _qtyYellow,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                        height: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: -4,
              bottom: -8,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFB020).withValues(alpha: 0.55),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.giftIcon,
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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

class _LockIcon extends StatelessWidget {
  const _LockIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.lockIcon, width: 13, height: 14);
  }
}

