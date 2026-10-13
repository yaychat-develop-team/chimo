import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:record/record.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/utils/app_audio_playback.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_input.dart';
import '../../../../common/theme/app_emoji.dart';
import '../../../../app/service/im_service.dart';
import '../../../../common/utils/app_log.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../../common/widgets/app_image.dart';
import '../../../../common/utils/media_picker.dart';
import '../../../../common/utils/time_fmt.dart';
import 'panels/emoji_panel.dart';
import 'panels/photo_panel.dart';
import 'panels/voice_panel.dart';

/// 私聊页要构造 [ChatStickerSource]（贴纸包的取数与发送），从这里转出去 ——
/// 和 `core/network/app_apis.dart` 一样的做法：调用方 import 输入栏一个文件就够。
export 'panels/emoji_panel.dart' show ChatStickerSource;

/// 底部功能面板。私聊 / 群聊共用一套（原 `_DmPanel` / `GroupChatPanel`）。
enum ChatPanelKind { none, voice, photo, emoji }

/// 输入栏上的图标按钮。位置由 [ChatInputBarStyle] 的三个列表决定：
/// [ChatInputBarStyle.leading]（文本框左侧）、[ChatInputBarStyle.trailing]
/// （文本框右侧）、[ChatInputBarStyle.toolRow]（输入框下面单独一行）。
enum ChatInputTool { voice, photo, emoji, gift }

/// 私聊 / 群聊输入栏的外观与按钮布局。
///
/// 两边的**行为**在这一步已经合成一份了（见 [ChatInputBarState]），剩下的全是
/// 视觉与按钮位置差异 —— 一条条列在这里，不要为了「统一好看」把某一列改成另一列：
/// 那是静默的视觉回归。
///
/// | 字段 | `.dm` | `.group` |
/// |---|---|---|
/// | `outerPadding` | `16,10,16` | `12,8,12` |
/// | `quoteAboveOuterPadding` | false（在外层 padding 里，`margin bottom 8`） | true（自带 `12,0,12,8`） |
/// | `quoteColor` | `textGrayF5` | `textGrayF0` |
/// | `pillHeight` / `pillMinHeight` | 54 / — | — / 48 |
/// | `pillPadding` | `h20` | `h10 v4` |
/// | `pillColor` / `pillRadius` | `textGrayF5` / 27 | `textGrayF0` / 24 |
/// | `textStyle` | 14 w400 | 15 w500 |
/// | `hintText` | `Send message...` | `Please type here...` |
/// | `hintStyle` | `textGrayAE` 14 w300 | `textSecondary` 15 w400 |
/// | `contentPadding` | `vertical 16` | `vertical 10` |
/// | `leading` | `[]` | `[voice]` |
/// | `trailing` | `[emoji]` | `[photo, emoji]` |
/// | `toolRow` | `[voice, photo, gift]` | null（没有第二行） |
/// | `leadingGap` / `trailingGap` / `sendGap` / `iconGap` | 0 / 12 / 12 / 0 | 4 / **0** / 4 / 6 |
/// | `inPillIconSize` | 24 | 22 |
/// | `iconFilter` | null | 置灰到 90/90/90 |
/// | `iconTapPadding` | `zero` | `all 4` |
/// | `sendButtonSize` | 30 | 32 |
/// | `sendButtonGradient` / `sendButtonColor` | `promoBannerGradient` / — | — / `accentNeon` |
/// | `sendIconColor` | `promoText` | `black` |
/// | `emojiIconWinsOverSend` | true | false |
/// | `voicePanel` / `emojiPanel` | 见 [ChatVoicePanelStyle.dm] / [ChatEmojiPanelStyle.dm] | 见 `.group` |
///
/// 面板本体的差异（计时文案的行高、emoji 字号、退格键长什么样）不摊在这张表里 ——
/// 那是 [ChatVoicePanelStyle] / [ChatEmojiPanelStyle] 各自的表，跟着面板放在
/// `panels/` 下面。这里只拿着它们往下传。相册面板两边一个字都不差，没有样式包。
///
/// 三个值得单独说一句的：
///
/// * **`trailingGap` 群聊是 0**：群聊「有字」那支是 `SizedBox(4) + 发送键`，
/// 「没字」那支是 `图片 + SizedBox(6) + 表情`，前面**没有**间隔 —— 图标自带
/// `iconTapPadding`（4）当边距了。所以发送键的间隔（`sendGap`）和图标组的
/// 间隔（`trailingGap`）必须是两个字段，不能共用一个。
/// * **`emojiIconWinsOverSend`**：私聊在表情面板打开时右侧**保持表情图标**
/// （再点一次收面板），哪怕输入框里已经有字了 —— 发送走面板右下角那个键。
/// 群聊没有这条，有字就是发送键。
/// * **`iconFilter`**：群聊的三个 webp 图标是彩色原图，靠 `ColorFilter.matrix`
/// 压成灰。私聊那套 svg 本身就是要的颜色，不能套滤镜。
class ChatInputBarStyle {
  const ChatInputBarStyle({
    required this.outerPadding,
    required this.quoteAboveOuterPadding,
    required this.quotePadding,
    required this.quoteColor,
    required this.pillHeight,
    required this.pillMinHeight,
    required this.pillPadding,
    required this.pillColor,
    required this.pillRadius,
    required this.textStyle,
    required this.hintText,
    required this.hintStyle,
    required this.contentPadding,
    required this.toolAssets,
    required this.leading,
    required this.trailing,
    required this.toolRow,
    required this.leadingGap,
    required this.trailingGap,
    required this.sendGap,
    required this.iconGap,
    required this.inPillIconSize,
    required this.toolRowIconSize,
    required this.toolRowGap,
    required this.toolRowPadding,
    required this.iconFilter,
    required this.iconTapPadding,
    required this.sendButtonSize,
    required this.sendButtonGradient,
    required this.sendButtonColor,
    required this.sendIconColor,
    required this.emojiIconWinsOverSend,
    required this.voicePanel,
    required this.emojiPanel,
  });

  /// 输入行外边距。底部那一格由键盘 / 安全区算出来，所以这里只给三边。
  final EdgeInsets outerPadding;

  /// 引用条画在 [outerPadding] **外面**（群聊）还是里面（私聊）。
  final bool quoteAboveOuterPadding;
  final EdgeInsets quotePadding;
  final Color quoteColor;

  /// 固定高度（私聊 54）。给 null 时用 [pillMinHeight] 撑。
  final double? pillHeight;
  final double? pillMinHeight;
  final EdgeInsets pillPadding;
  final Color pillColor;
  final double pillRadius;

  /// 正文样式。`.withAppEmoji` 在用的时候加 —— 那是个 extension getter，
  /// 不是 const，塞进 pack 就 const 不了了。
  final TextStyle textStyle;
  final String hintText;
  final TextStyle hintStyle;
  final EdgeInsets contentPadding;

  final Map<ChatInputTool, String> toolAssets;
  final List<ChatInputTool> leading;
  final List<ChatInputTool> trailing;

  /// 输入框下面单独一行工具（私聊）。null = 没有这一行。
  final List<ChatInputTool>? toolRow;

  final double leadingGap;
  final double trailingGap;
  final double sendGap;
  final double iconGap;
  final double inPillIconSize;
  final double toolRowIconSize;
  final double toolRowGap;
  final EdgeInsets toolRowPadding;
  final ColorFilter? iconFilter;
  final EdgeInsets iconTapPadding;
  final double sendButtonSize;
  final Gradient? sendButtonGradient;
  final Color? sendButtonColor;
  final Color sendIconColor;
  final bool emojiIconWinsOverSend;

  /// 面板本体的样式包。相册面板没有 —— 两边逐字相同（见 `ChatPhotoPanel` 的类注释）。
  final ChatVoicePanelStyle voicePanel;
  final ChatEmojiPanelStyle emojiPanel;

  static const ChatInputBarStyle dm = ChatInputBarStyle(
    outerPadding: EdgeInsets.fromLTRB(16, 10, 16, 0),
    quoteAboveOuterPadding: false,
    quotePadding: EdgeInsets.only(bottom: 8),
    quoteColor: AppColors.textGrayF5,
    pillHeight: 54,
    pillMinHeight: null,
    pillPadding: EdgeInsets.symmetric(horizontal: 20),
    pillColor: AppColors.textGrayF5,
    pillRadius: 27,
    textStyle: TextStyle(color: AppColors.surfaceDark, fontSize: 14, fontWeight: FontWeight.w400),
    hintText: 'Send message...',
    hintStyle: TextStyle(color: AppColors.textGrayAE, fontSize: 14, fontWeight: FontWeight.w300),
    contentPadding: EdgeInsets.symmetric(vertical: 16),
    toolAssets: {
      ChatInputTool.voice: AppAssets.chatVoice,
      ChatInputTool.photo: AppAssets.chatImg,
      ChatInputTool.emoji: AppAssets.chatDmEmoji,
      ChatInputTool.gift: AppAssets.chatGift,
    },
    leading: [],
    trailing: [ChatInputTool.emoji],
    toolRow: [ChatInputTool.voice, ChatInputTool.photo, ChatInputTool.gift],
    leadingGap: 0,
    trailingGap: 12,
    sendGap: 12,
    iconGap: 0,
    inPillIconSize: 24,
    toolRowIconSize: 30,
    toolRowGap: 12,
    toolRowPadding: EdgeInsets.symmetric(horizontal: 20),
    iconFilter: null,
    iconTapPadding: EdgeInsets.zero,
    sendButtonSize: 30,
    sendButtonGradient: AppColors.promoBannerGradient,
    sendButtonColor: null,
    sendIconColor: AppColors.promoText,
    emojiIconWinsOverSend: true,
    voicePanel: ChatVoicePanelStyle.dm,
    emojiPanel: ChatEmojiPanelStyle.dm,
  );

  static const ChatInputBarStyle group = ChatInputBarStyle(
    outerPadding: EdgeInsets.fromLTRB(12, 8, 12, 0),
    quoteAboveOuterPadding: true,
    quotePadding: EdgeInsets.fromLTRB(12, 0, 12, 8),
    quoteColor: AppColors.textGrayF0,
    pillHeight: null,
    pillMinHeight: 48,
    pillPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    pillColor: AppColors.textGrayF0,
    pillRadius: 24,
    textStyle: TextStyle(color: AppColors.surfaceDark, fontSize: 15, fontWeight: FontWeight.w500),
    hintText: 'Please type here...',
    hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: 15, fontWeight: FontWeight.w400),
    contentPadding: EdgeInsets.symmetric(vertical: 10),
    toolAssets: {
      ChatInputTool.voice: AppAssets.inputVoice,
      ChatInputTool.photo: AppAssets.inputImage,
      ChatInputTool.emoji: AppAssets.inputEmoji,
    },
    leading: [ChatInputTool.voice],
    trailing: [ChatInputTool.photo, ChatInputTool.emoji],
    toolRow: null,
    leadingGap: 4,
    trailingGap: 0,
    sendGap: 4,
    iconGap: 6,
    inPillIconSize: 22,
    toolRowIconSize: 22,
    toolRowGap: 0,
    toolRowPadding: EdgeInsets.zero,
    iconFilter: ColorFilter.matrix(<double>[
      0, 0, 0, 0, 90, //
      0, 0, 0, 0, 90, //
      0, 0, 0, 0, 90, //
      0.333, 0.333, 0.333, 0, 0, //
    ]),
    iconTapPadding: EdgeInsets.all(4),
    sendButtonSize: 32,
    sendButtonGradient: null,
    sendButtonColor: AppColors.accentNeon,
    sendIconColor: Colors.black,
    emojiIconWinsOverSend: false,
    voicePanel: ChatVoicePanelStyle.group,
    emojiPanel: ChatEmojiPanelStyle.group,
  );
}

/// 私聊 / 群聊共用的输入栏。
///
/// `group_chat_input_bar.dart` 的 `GroupChatInputBarState`（751 行）。两份的
/// 逻辑约 95% 逐字相同 —— 录音的四个相位、相册的选择顺序、面板与键盘互斥、
/// 临时文件清理，全都各写了一遍。这里是那一份。
///
/// **职责边界**：文本框、发送按钮、三个面板的切换入口、录音按钮的
/// 手势，加上三个面板的**数据与动作**（录音相位与计时、相册取数与选中顺序、
/// 插字 / 退格）。面板**怎么画**在 `panels/` 下面那三个公开组件里 —— 把两边
/// 各自的私有面板合了过来，这里直接 new， 留的三个 builder 缺口随之删掉。
///
/// 视觉与按钮位置差异走 [ChatInputBarStyle]，不为群聊单开一个类。
///
/// **不在这里的两样东西**：
/// 见 [quote] / [onClearQuote]。输入栏只负责画那一条和那个叉。
/// * 群聊「没加群」不是提示条而是整条输入栏换成 Join 按钮，那个 swap 留在
/// `group_details_page.dart`。
class ChatInputBar extends StatefulWidget {
  const ChatInputBar({
    super.key,
    required this.style,
    required this.bottomInset,
    required this.controller,
    required this.onSendText,
    required this.onSendVoice,
    required this.onSendImages,
    this.stickers,
    this.quote,
    this.onClearQuote,
    this.onGiftTap,
    this.onPanelChanged,
  });

  final ChatInputBarStyle style;

  /// 底部安全区。
  final double bottomInset;
  final TextEditingController controller;

  /// 已 trim 且非空 —— 空串在这里就被挡掉并弹提示了。
  final ValueChanged<String> onSendText;

  /// (filePath, durationSeconds)
  final void Function(String path, int seconds) onSendVoice;
  final ValueChanged<List<String>> onSendImages;

  /// 表情面板里的贴纸包 —— **私聊独有**，群聊给 null 就只剩 emoji 网格。
  /// 取数不在面板里，由 `DmChatLogic` 提供，见 [ChatStickerSource]。
  final ChatStickerSource? stickers;

  /// 当前引用的消息（`ChatBaseLogic.quote`）。null = 不画引用条。
  final ImQuoteMsg? quote;
  final VoidCallback? onClearQuote;

  /// 礼物入口（私聊独有）。面板与键盘已由输入栏收好再回调。
  final VoidCallback? onGiftTap;

  /// 面板开 / 关。群聊用它收起群简介腾纵向空间；私聊不需要，给 null。
  final ValueChanged<bool>? onPanelChanged;

  @override
  State<ChatInputBar> createState() => ChatInputBarState();
}

/// 页面通过 `GlobalKey<ChatInputBarState>` 拿到的公开动作只剩
/// [dismissComposer]（点消息空白区收键盘 + 面板）。
///
/// `ChatBaseLogic.quote` 之后，页面直接写 Controller，不再走 GlobalKey。
class ChatInputBarState extends State<ChatInputBar> {
  static const int _maxVoiceSeconds = 60;
  static const int _albumPageSize = 80;

  /// 语音 / 相册 / 表情面板共用同一高度（不含安全区）。
  static const double _panelHeight = 300;

  final FocusNode _inputFocus = FocusNode();
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _previewPlayer = AudioPlayer();

  ChatPanelKind _panel = ChatPanelKind.none;
  ChatVoicePhase _voicePhase = ChatVoicePhase.idle;
  int _voiceSeconds = 0;
  double _voiceProgress = 0;
  DateTime? _voiceStartedAt;
  Timer? _voiceTimer;
  String? _voicePath;

  /// 网格用的设备相册照片（不含相机格）。
  List<AssetEntity> _albumPhotos = const [];
  bool _albumLoading = false;
  String? _albumError;

  /// 选择顺序（[_albumPhotos] 中的照片下标）；空 = 未选。
  final List<int> _selectedPhotos = [];
  bool _originalPhoto = true;

  bool get _hasText => widget.controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onChanged);
    _inputFocus.addListener(_onInputFocusChanged);
  }

  @override
  void didUpdateWidget(ChatInputBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 引用条从 Controller 来，聚焦这件事只有 widget 干得了：
    // `requestFocus`。`ImQuoteMsg` 没重载 `==`，同一条重建不会误触。
    if (widget.quote != null && widget.quote != oldWidget.quote) {
      _inputFocus.requestFocus();
    }
  }

  @override
  void dispose() {
    AppVoiceExclusive.release(_stopPreviewExclusive);
    _voiceTimer?.cancel();
    unawaited(_recorder.dispose());
    unawaited(_previewPlayer.dispose());
    _inputFocus.removeListener(_onInputFocusChanged);
    _inputFocus.dispose();
    widget.controller.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() => setState(() {});

  void _notifyPanel(bool open) => widget.onPanelChanged?.call(open);

  // 键盘与面板互斥
  //
  // 逐条比过之后差别只有一个：群聊每次开关面板都要 `onPanelChanged`
  // 通知页面收起群简介。私聊传 null，等于什么都不做，所以合成一份是等价的。
  //
  // 规则就两条：
  // 1. 输入框获焦（点输入框 / 键盘弹出）→ 收面板；
  // 2. 开任何面板 → 先收键盘。

  void _onInputFocusChanged() {
    if (_inputFocus.hasFocus) _closeFunctionPanel();
  }

  /// 打开底部功能面板前收起键盘。
  void _dismissKeyboard() {
    _inputFocus.unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// 输入框获焦时关闭语音 / 相册 / 表情面板。
  void _closeFunctionPanel() {
    if (_panel == ChatPanelKind.none) return;
    AppVoiceExclusive.release(_stopPreviewExclusive);
    unawaited(_stopRecorderIfNeeded(deleteFile: true));
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    unawaited(_previewPlayer.stop());
    setState(() {
      _panel = ChatPanelKind.none;
      _voicePhase = ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voicePath = null;
      _selectedPhotos.clear();
    });
    _notifyPanel(false);
  }

  /// 点击消息空白区：收起键盘 + 功能面板。
  void dismissComposer() {
    _dismissKeyboard();
    _closeFunctionPanel();
  }

  /// 三个 toggle 的公共前半段：收键盘、停录音、清相位。
  void _openPanel(ChatPanelKind kind, {VoidCallback? extra}) {
    _dismissKeyboard();
    unawaited(_stopRecorderIfNeeded(deleteFile: true));
    _voiceTimer?.cancel();
    setState(() {
      _panel = kind;
      _voicePhase = ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voiceStartedAt = null;
      _voicePath = null;
      _selectedPhotos.clear();
      extra?.call();
    });
    _notifyPanel(true);
  }

  void _toggleEmojiPanel() {
    if (_panel == ChatPanelKind.emoji) {
      setState(() => _panel = ChatPanelKind.none);
      _notifyPanel(false);
      // 表情面板收起来是「回到打字」，所以把键盘叫回来；
      // 语音 / 相册面板收起来不叫（见下面两个）。
      _inputFocus.requestFocus();
      return;
    }
    _openPanel(ChatPanelKind.emoji);
  }

  void _toggleVoicePanel() {
    if (_panel == ChatPanelKind.voice) {
      unawaited(_closeVoicePanel());
      return;
    }
    _openPanel(ChatPanelKind.voice);
  }

  void _togglePhotoPanel() {
    if (_panel == ChatPanelKind.photo) {
      setState(() {
        _panel = ChatPanelKind.none;
        _selectedPhotos.clear();
      });
      _notifyPanel(false);
      return;
    }
    _openPanel(
      ChatPanelKind.photo,
      extra: () {
        _originalPhoto = true;
        _albumError = null;
      },
    );
    unawaited(_loadAlbumPhotos());
  }

  // ------------------------------------------------------------ 文本发送

  /// 文案一模一样（`The message cannot be empty!`）。
  void _submit() {
    final text = widget.controller.text.trim();
    if (text.isEmpty) {
      AppToast.info('The message cannot be empty!');
      return;
    }
    widget.onSendText(text);
  }

  void _onGiftTap() {
    _dismissKeyboard();
    // 礼物会把面板关掉，但录音机留在跑（麦克风不释放）、计时器不停、相册的选中
    // 一致」，不能顺手改行为）—— 就是这里，换成和其它出口同一条收尾路径。
    _closeFunctionPanel();
    widget.onGiftTap?.call();
  }

  // ------------------------------------------------------------ 表情输入

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
    // 按**字素簇**退格：emoji 是多个 code unit，按字符退会退出半个来。
    final truncated = text.characters.skipLast(1).toString();
    widget.controller.value = TextEditingValue(
      text: truncated,
      selection: TextSelection.collapsed(offset: truncated.length),
    );
  }

  // ---------------------------------------------------------------- 录音
  //
  // 四个相位的流转：idle --开录--> recording --停录--> preview --确认--> 发出。
  // 任何一步中断（收面板 / 点输入框 / 切别的面板）都要 ① 停录音机
  // ② 撤掉定时器 ③ 删临时文件 —— 少一样就是麦克风不释放或垃圾文件常驻。

  String get _voiceTimeLabel => TimeFmt.duration(_voiceSeconds);

  Future<void> _closeVoicePanel({bool deleteFile = true}) async {
    AppVoiceExclusive.release(_stopPreviewExclusive);
    await _stopRecorderIfNeeded(deleteFile: deleteFile);
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    await _previewPlayer.stop();
    if (!mounted) return;
    final wasOpen = _panel == ChatPanelKind.voice;
    setState(() {
      if (wasOpen) _panel = ChatPanelKind.none;
      _voicePhase = ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      if (deleteFile) _voicePath = null;
    });
    if (wasOpen) _notifyPanel(false);
  }

  Future<void> _stopRecorderIfNeeded({required bool deleteFile}) async {
    try {
      if (await _recorder.isRecording()) {
        final path = await _recorder.stop();
        if (path != null && path.isNotEmpty) {
          _voicePath = path;
        }
      }
    } catch (error, stack) {
      // 停止录音失败 = 这条语音发不出去；UI 已经回到 idle 相位，
      // 但线上不留一行就完全查不到原因。
      AppLog.w('ChatInputBar stop record failed', error: error, stack: stack);
    }
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
    } catch (_) {
      // 录音临时文件删不掉不影响发送。
    }
  }

  Future<void> _startRecording() async {
    try {
      AppVoiceExclusive.stopActive();
      final ok = await _recorder.hasPermission();
      if (!ok) {
        if (!mounted) return;
        AppToast.error('Microphone permission is required for voice messages');
        return;
      }
      await _stopRecorderIfNeeded(deleteFile: true);
      await _previewPlayer.stop();
      final dir = await getTemporaryDirectory();
      final path = '${dir.path}/chimo_voice_${DateTime.now().millisecondsSinceEpoch}.m4a';
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
        _voicePhase = ChatVoicePhase.recording;
        _voiceSeconds = 0;
        _voiceProgress = 0;
        _voiceStartedAt = started;
      });
      // 50ms 一跳是给进度环用的；秒数取整后才上屏。
      _voiceTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
        if (!mounted || _voiceStartedAt == null) return;
        final elapsed = DateTime.now().difference(_voiceStartedAt!).inMilliseconds / 1000;
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
      AppLog.w('ChatInputBar start record failed', error: error);
      if (!mounted) return;
      AppToast.error('Could not start recording: $error');
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
      AppLog.w('ChatInputBar finish record failed', error: error);
    }
    if (!mounted) return;
    // 秒数按**开录时刻**算而不是累加定时器 —— 后台挂起时定时器会掉跳。
    final secs = started == null
        ? _voiceSeconds
        : DateTime.now().difference(started).inMilliseconds / 1000;
    final duration = secs.floor().clamp(0, _maxVoiceSeconds);
    setState(() {
      _voiceSeconds = duration;
      _voiceProgress = duration / _maxVoiceSeconds;
      _voicePhase = duration > 0 && (_voicePath?.isNotEmpty ?? false)
          ? ChatVoicePhase.preview
          : ChatVoicePhase.idle;
      if (_voicePhase == ChatVoicePhase.idle) {
        _deleteVoiceFile(_voicePath);
        _voicePath = null;
        _voiceProgress = 0;
      }
    });
  }

  Future<void> _onVoiceMainTap() async {
    switch (_voicePhase) {
      case ChatVoicePhase.idle:
        await _startRecording();
      case ChatVoicePhase.recording:
        await _finishRecording();
      case ChatVoicePhase.preview:
        final path = _voicePath;
        if (path == null || path.isEmpty) return;
        try {
          AppVoiceExclusive.claim(_stopPreviewExclusive);
          await _previewPlayer.stop();
          await AppAudioPlayback.play(_previewPlayer, path);
        } catch (error) {
          AppLog.w('Preview voice failed', error: error);
          AppVoiceExclusive.release(_stopPreviewExclusive);
        }
    }
  }

  void _stopPreviewExclusive() {
    unawaited(_previewPlayer.stop());
  }

  Future<void> _resetVoice() async {
    AppVoiceExclusive.release(_stopPreviewExclusive);
    await _stopRecorderIfNeeded(deleteFile: true);
    _voiceTimer?.cancel();
    _voiceTimer = null;
    _voiceStartedAt = null;
    await _previewPlayer.stop();
    if (!mounted) return;
    setState(() {
      _voicePhase = ChatVoicePhase.idle;
      _voiceSeconds = 0;
      _voiceProgress = 0;
      _voicePath = null;
    });
  }

  Future<void> _confirmVoice() async {
    if (_voicePhase == ChatVoicePhase.recording) {
      await _finishRecording();
    }
    final seconds = _voiceSeconds;
    final path = _voicePath?.trim() ?? '';
    if (seconds < 1 || path.isEmpty) {
      if (!mounted) return;
      AppToast.error('Please record at least 1 second');
      return;
    }
    // 保留文件供发送 / 播放；关闭面板时不删除。
    await _closeVoicePanel(deleteFile: false);
    widget.onSendVoice(path, seconds);
  }

  // ---------------------------------------------------------------- 相册

  /// 仅图片：默认 `RequestType.common` 也会申请 VIDEO，在已授权
  /// READ_MEDIA_IMAGES 但未授权 READ_MEDIA_VIDEO 时会失败。
  Future<void> _loadAlbumPhotos({bool openSettingsIfDenied = false}) async {
    setState(() {
      _albumLoading = true;
      _albumError = null;
    });
    try {
      final permission = await MediaPicker.ensureAlbumPermission();
      if (!permission.hasAccess) {
        if (openSettingsIfDenied) {
          await MediaPicker.openSystemSettings();
        }
        if (!mounted) return;
        setState(() {
          _albumLoading = false;
          _albumPhotos = const [];
          _albumError = 'Photo permission denied';
        });
        return;
      }

      // 相册读取（含「没有相册」的情况）统一在 MediaPicker 里。
      final assets = await MediaPicker.loadAlbumPage(size: _albumPageSize);
      if (!mounted) return;
      setState(() {
        _albumPhotos = assets;
        _albumLoading = false;
        _albumError = assets.isEmpty ? 'No photos in album' : null;
      });
    } catch (error) {
      AppLog.w('ChatInputBar load album failed', error: error);
      if (!mounted) return;
      setState(() {
        _albumLoading = false;
        _albumPhotos = const [];
        _albumError = 'Failed to load album';
      });
    }
  }

  void _togglePhotoAt(int index) {
    if (index < 0 || index >= _albumPhotos.length) return;
    setState(() {
      final i = _selectedPhotos.indexOf(index);
      if (i >= 0) {
        _selectedPhotos.removeAt(i);
      } else {
        // 追加而不是排序：网格上的角标是**点选顺序**，也是发送顺序。
        _selectedPhotos.add(index);
      }
    });
  }

  List<AssetEntity> _selectedEntities() => [
    for (final i in _selectedPhotos)
      if (i >= 0 && i < _albumPhotos.length) _albumPhotos[i],
  ];

  Future<void> _previewSelectedPhotos() async {
    if (_selectedPhotos.isEmpty) return;
    final entities = _selectedEntities();
    if (entities.isEmpty || !mounted) return;
    await AppJumper.toAlbumPreview(entities: entities);
  }

  Future<void> _sendSelectedPhotos() async {
    if (_selectedPhotos.isEmpty) return;
    final entities = _selectedEntities();
    setState(() {
      _panel = ChatPanelKind.none;
      _selectedPhotos.clear();
    });
    _notifyPanel(false);

    final paths = <String>[];
    for (final entity in entities) {
      try {
        final file = _originalPhoto ? await entity.originFile : await entity.file;
        final path = file?.path.trim() ?? '';
        if (path.isNotEmpty) paths.add(path);
      } catch (error) {
        AppLog.w('ChatInputBar resolve album file failed', error: error);
      }
    }
    if (!mounted) return;
    if (paths.isEmpty) {
      AppToast.error('Could not read selected photos');
      return;
    }
    widget.onSendImages(paths);
  }

  Future<void> _pickFromAlbum() async {
    // 系统多选作为回退 / 完整相册。
    try {
      final files = await MediaPicker.pickImages(original: _originalPhoto);
      if (files.isEmpty) return;
      setState(() {
        _panel = ChatPanelKind.none;
        _selectedPhotos.clear();
      });
      _notifyPanel(false);
      widget.onSendImages([for (final f in files) f.path]);
    } catch (error) {
      if (!mounted) return;
      AppToast.error('Pick image failed: $error');
    }
  }

  Future<void> _pickFromCamera() async {
    try {
      // 先关闭相册面板，避免挡住相机界面。
      if (_panel != ChatPanelKind.none) {
        setState(() => _panel = ChatPanelKind.none);
        _notifyPanel(false);
      }
      final file = await MediaPicker.takePhoto(original: _originalPhoto);
      if (!mounted) return;
      // 用户取消或无可用相机界面。
      if (file == null) return;
      widget.onSendImages([file.path]);
    } catch (error) {
      AppLog.w('ChatInputBar camera pick failed', error: error);
      if (!mounted) return;
      AppToast.error(
        'Camera unavailable: $error\n'
        'On emulator: enable virtual camera, or use Album.',
      );
    }
  }

  // ---------------------------------------------------------------- 绘制

  VoidCallback? _toolTap(ChatInputTool tool) => switch (tool) {
    ChatInputTool.voice => _toggleVoicePanel,
    ChatInputTool.photo => _togglePhotoPanel,
    ChatInputTool.emoji => _toggleEmojiPanel,
    ChatInputTool.gift => widget.onGiftTap == null ? null : _onGiftTap,
  };

  Widget _toolIcon(ChatInputTool tool, {required double size}) {
    final asset = widget.style.toolAssets[tool];
    // 某一边没有这个图标（比如群聊没有礼物）就画不出来 —— 但 style 的三个
    // 列表本来就不该出现没配资源的工具，所以这里只是兜底。
    if (asset == null) return const SizedBox.shrink();
    Widget child = AppImage(asset, width: size, height: size, fit: BoxFit.contain);
    final filter = widget.style.iconFilter;
    if (filter != null) {
      child = ColorFiltered(colorFilter: filter, child: child);
    }
    final onTap = _toolTap(tool);
    if (onTap == null) return child;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: widget.style.iconTapPadding == EdgeInsets.zero
          ? child
          : Padding(padding: widget.style.iconTapPadding, child: child),
    );
  }

  /// 图标之间垫 [ChatInputBarStyle.iconGap]。
  List<Widget> _iconRun(List<ChatInputTool> tools, {required double size}) {
    final out = <Widget>[];
    for (final tool in tools) {
      if (out.isNotEmpty && widget.style.iconGap > 0) {
        out.add(SizedBox(width: widget.style.iconGap));
      }
      out.add(_toolIcon(tool, size: size));
    }
    return out;
  }

  Widget _quoteCard(ImQuoteMsg quote) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: widget.style.quoteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              quote.showContent,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textGray99,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
          ),
          GestureDetector(
            onTap: widget.onClearQuote,
            child: Container(
              width: 16,
              height: 16,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: AppColors.textGray99, shape: BoxShape.circle),
              child: const Icon(Icons.close_rounded, size: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sendButton() {
    final style = widget.style;
    return GestureDetector(
      onTap: _submit,
      child: Container(
        width: style.sendButtonSize,
        height: style.sendButtonSize,
        decoration: BoxDecoration(
          gradient: style.sendButtonGradient,
          color: style.sendButtonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.arrow_upward_rounded, size: 18, color: style.sendIconColor),
      ),
    );
  }

  Widget _pill() {
    final style = widget.style;
    // 表情面板打开时私聊保持表情图标（再点一次收面板），发送走面板里那个键。
    final showSend = _hasText && !(style.emojiIconWinsOverSend && _panel == ChatPanelKind.emoji);
    return Container(
      height: style.pillHeight,
      constraints: style.pillMinHeight == null
          ? null
          : BoxConstraints(minHeight: style.pillMinHeight!),
      padding: style.pillPadding,
      decoration: BoxDecoration(
        color: style.pillColor,
        borderRadius: BorderRadius.circular(style.pillRadius),
      ),
      child: Row(
        children: [
          ..._iconRun(style.leading, size: style.inPillIconSize),
          if (style.leading.isNotEmpty && style.leadingGap > 0) SizedBox(width: style.leadingGap),
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: _inputFocus,
              minLines: 1,
              maxLines: 4,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _submit(),
              onTap: _closeFunctionPanel,
              style: style.textStyle.withAppEmoji,
              decoration: AppInputDecoration(
                isDense: true,
                hintText: style.hintText,
                hintStyle: style.hintStyle,
                contentPadding: style.contentPadding,
              ),
            ),
          ),
          if (showSend) ...[
            SizedBox(width: style.sendGap),
            _sendButton(),
          ] else ...[
            if (style.trailingGap > 0) SizedBox(width: style.trailingGap),
            ..._iconRun(style.trailing, size: style.inPillIconSize),
          ],
        ],
      ),
    );
  }

  Widget _panelBody() {
    final style = widget.style;
    switch (_panel) {
      case ChatPanelKind.none:
        return const SizedBox.shrink();
      case ChatPanelKind.voice:
        // 这层 Padding + Center 两边一模一样，留在骨架里。
        return Padding(
          padding: EdgeInsets.only(bottom: widget.bottomInset),
          child: Center(
            child: ChatVoicePanel(
              style: style.voicePanel,
              timeLabel: _voiceTimeLabel,
              phase: _voicePhase,
              progress: _voiceProgress,
              onMainTap: () => unawaited(_onVoiceMainTap()),
              onReset: () => unawaited(_resetVoice()),
              onConfirm: () => unawaited(_confirmVoice()),
            ),
          ),
        );
      case ChatPanelKind.photo:
        return ChatPhotoPanel(
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
          onRetry: () => unawaited(_loadAlbumPhotos(openSettingsIfDenied: true)),
        );
      case ChatPanelKind.emoji:
        return ChatEmojiPanel(
          style: style.emojiPanel,
          bottomInset: widget.bottomInset,
          canSend: _hasText,
          onEmojiTap: _insertEmoji,
          onBackspace: _emojiBackspace,
          onSend: _submit,
          stickers: widget.stickers,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style;
    final quote = widget.quote;
    final showPanel = _panel != ChatPanelKind.none;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    // 面板打开：仅安全区；键盘打开（无面板）：按键盘高度垫底。
    final bottomPad = showPanel ? widget.bottomInset : math.max(widget.bottomInset, keyboardInset);

    final rows = <Widget>[
      if (quote != null && !style.quoteAboveOuterPadding)
        Padding(padding: style.quotePadding, child: _quoteCard(quote)),
      _pill(),
      if (style.toolRow case final tools?) ...[
        SizedBox(height: style.toolRowGap),
        Padding(
          padding: style.toolRowPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tools.map((tool) => _toolIcon(tool, size: style.toolRowIconSize)).toList(),
          ),
        ),
      ],
    ];

    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (quote != null && style.quoteAboveOuterPadding)
            Padding(padding: style.quotePadding, child: _quoteCard(quote)),
          Padding(
            padding: style.outerPadding.copyWith(bottom: showPanel ? 0 : 8 + bottomPad),
            // 逐层一致的 widget 树。
            child: rows.length == 1
                ? rows.single
                : Column(mainAxisSize: MainAxisSize.min, children: rows),
          ),
          if (showPanel)
            SizedBox(
              height: _panelHeight + widget.bottomInset,
              width: double.infinity,
              child: _panelBody(),
            ),
        ],
      ),
    );
  }
}
