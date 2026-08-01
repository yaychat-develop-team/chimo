part of '../chat_detail_page.dart';

class _DmChatBody extends StatelessWidget {
  const _DmChatBody({
    required this.messages,
    required this.peerAvatar,
    required this.messagesScroll,
    required this.onHandleDragUpdate,
    required this.onHandleDragEnd,
  });

  final List<_ChatLine> messages;
  final String peerAvatar;
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
  });

  final List<_ChatLine> messages;
  final String peerAvatar;
  final ScrollController scrollController;

  bool _showAvatar(int index) {
    if (index == 0) return true;
    return messages[index].side != messages[index - 1].side;
  }

  double _topGap(int index) {
    if (index == 0) return 0;
    return messages[index].side == messages[index - 1].side
        ? _BubbleLayout.sameGap
        : _BubbleLayout.otherGap;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
      itemCount: messages.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Center(
              child: Text(
                '18:07',
                style: TextStyle(
                  color: Color(0xFFC9C9C9),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }
        final msgIndex = index - 1;
        final line = messages[msgIndex];
        final showAvatar = _showAvatar(msgIndex);
        return Padding(
          padding: EdgeInsets.only(top: _topGap(msgIndex)),
          child: switch (line.kind) {
            _ChatLineKind.voice => _VoiceBubble(
              side: line.side,
              seconds: line.voiceSeconds,
              peerAvatar: peerAvatar,
              showAvatar: showAvatar,
            ),
            _ChatLineKind.image => _ImageBubble(
              side: line.side,
              asset: line.imageAssets.first,
              locked: false,
              peerAvatar: peerAvatar,
              showAvatar: showAvatar,
            ),
            _ChatLineKind.text =>
              line.side == _ChatSide.self
                  ? _SelfBubble(text: line.text, showAvatar: showAvatar)
                  : _PeerBubble(
                      text: line.text,
                      avatarAsset: peerAvatar,
                      showAvatar: showAvatar,
                    ),
          },
        );
      },
    );
  }
}

class _ChatAvatar extends StatelessWidget {
  const _ChatAvatar({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        asset,
        width: _BubbleLayout.avatar,
        height: _BubbleLayout.avatar,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _PeerBubble extends StatelessWidget {
  const _PeerBubble({
    required this.text,
    required this.avatarAsset,
    required this.showAvatar,
  });

  final String text;
  final String avatarAsset;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showAvatar)
          _ChatAvatar(asset: avatarAsset)
        else
          const SizedBox(width: _BubbleLayout.avatar),
        const SizedBox(width: _BubbleLayout.avatarGap),
        ConstrainedBox(
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
      ],
    );
  }
}

class _SelfBubble extends StatelessWidget {
  const _SelfBubble({required this.text, required this.showAvatar});

  final String text;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
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
        const SizedBox(width: _BubbleLayout.avatarGap),
        if (showAvatar)
          const _ChatAvatar(asset: AppAssets.avatarPlace)
        else
          const SizedBox(width: _BubbleLayout.avatar),
      ],
    );
  }
}

class _VoiceBubble extends StatefulWidget {
  const _VoiceBubble({
    required this.side,
    required this.seconds,
    required this.peerAvatar,
    required this.showAvatar,
  });

  final _ChatSide side;
  final int seconds;
  final String peerAvatar;
  final bool showAvatar;

  @override
  State<_VoiceBubble> createState() => _VoiceBubbleState();
}

class _VoiceBubbleState extends State<_VoiceBubble>
    with SingleTickerProviderStateMixin {
  /// Only one voice message may play at a time.
  static VoidCallback? _activeStop;

  bool _playing = false;
  int _remaining = 0;
  Timer? _playTimer;
  late final AnimationController _waveController;

  bool get _isSelf => widget.side == _ChatSide.self;

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
    }
    _playTimer?.cancel();
    _waveController.dispose();
    super.dispose();
  }

  void _stopPlay() {
    _playTimer?.cancel();
    _playTimer = null;
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

  void _togglePlay() {
    if (widget.seconds <= 0) return;
    if (_playing) {
      _stopPlay();
      return;
    }
    _activeStop?.call();
    _activeStop = _stopPlay;
    setState(() {
      _playing = true;
      _remaining = widget.seconds;
    });
    _waveController.repeat();
    _playTimer?.cancel();
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

  @override
  Widget build(BuildContext context) {
    final displaySeconds = _playing ? _remaining : widget.seconds;

    final bubble = GestureDetector(
      onTap: _togglePlay,
      behavior: HitTestBehavior.opaque,
      child: Container(
        constraints: BoxConstraints(
          minWidth: 88,
          maxWidth: 88 + (widget.seconds.clamp(1, 60) * 1.6),
        ),
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: _isSelf ? _BubbleLayout.selfColor : _BubbleLayout.peerColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_isSelf ? 18 : 4),
            topRight: Radius.circular(_isSelf ? 4 : 18),
            bottomLeft: const Radius.circular(18),
            bottomRight: const Radius.circular(18),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _VoiceBarsIcon(
              playing: _playing,
              animation: _waveController,
            ),
            const SizedBox(width: 10),
            Text(
              '${displaySeconds}s',
              style: const TextStyle(
                color: Color(0xFF111111),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );

    final avatar = widget.showAvatar
        ? _ChatAvatar(
            asset: _isSelf ? AppAssets.avatarPlace : widget.peerAvatar,
          )
        : const SizedBox(width: _BubbleLayout.avatar);

    if (_isSelf) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bubble,
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
        bubble,
      ],
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

/// Image message: clear image / locked blur + Join to view.
class _ImageBubble extends StatelessWidget {
  const _ImageBubble({
    required this.side,
    required this.asset,
    required this.locked,
    required this.peerAvatar,
    required this.showAvatar,
  });

  final _ChatSide side;
  final String asset;
  final bool locked;
  final String peerAvatar;
  final bool showAvatar;

  static const double _size = 180;

  bool get _isSelf => side == _ChatSide.self;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.only(
      topLeft: Radius.circular(_isSelf ? 16 : 4),
      topRight: Radius.circular(_isSelf ? 4 : 16),
      bottomLeft: const Radius.circular(16),
      bottomRight: const Radius.circular(16),
    );

    final bubble = ClipRRect(
      borderRadius: radius,
      child: SizedBox(
        width: _size,
        height: _size,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (locked)
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                child: Transform.scale(
                  scale: 1.08,
                  child: Image.asset(asset, fit: BoxFit.cover),
                ),
              )
            else
              Image.asset(asset, fit: BoxFit.cover),
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
    );

    final avatar = showAvatar
        ? _ChatAvatar(asset: _isSelf ? AppAssets.avatarPlace : peerAvatar)
        : const SizedBox(width: _BubbleLayout.avatar);

    if (_isSelf) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bubble,
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
        bubble,
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

