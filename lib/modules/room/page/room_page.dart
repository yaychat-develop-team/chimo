import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:forya_pag/pag.dart';

import '../../../app/app_gift.dart';
import '../../../app/app_jumper.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_dialog.dart';
import 'package:chimo/common/utils/chimo.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/mic_logic.dart';
import '../logic/room_logic.dart';
import '../logic/room_rank_logic.dart';
import '../model/room_fx.dart';
import '../service/room_service.dart';
import '../types/auction/logic/auction_logic.dart';
import '../types/auction/widgets/auction_bid_bar.dart';
import 'widgets/room_barrage_list.dart';
import 'widgets/room_bulletin_dialog.dart';
import 'widgets/room_gift_layer.dart';
import 'widgets/room_input_bar.dart';
import 'widgets/room_join_layer.dart';
import 'widgets/room_lyric_layer.dart';
import 'widgets/room_mic_grid.dart';
import 'widgets/room_mic_remain_dialog.dart';
import 'widgets/room_rank_sheet.dart';
import 'widgets/room_tools_sheet.dart';
import 'widgets/room_top_bar.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key, required this.rid});

  final int rid;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  late final RoomLogic logic;
  late final Worker _phaseWorker;
  Worker? _micAlertWorker;
  final _input = TextEditingController();
  final _password = TextEditingController();
  final _giftPagKey = GlobalKey();
  var _allowPop = false;
  var _askingPassword = false;
  var _showingInsufficient = false;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<RoomLogic>() && !Get.find<RoomLogic>().pageMounted) {
      RoomLogic.release();
    }
    logic = Get.put(RoomLogic(widget.rid));
    logic.pageMounted = true;
    _phaseWorker = ever(logic.phase, _onPhase);
  }

  @override
  void dispose() {
    _micAlertWorker?.dispose();
    _phaseWorker.dispose();
    _input.dispose();
    _password.dispose();
    RoomLogic.release();
    super.dispose();
  }

  void _onPhase(RoomPhase phase) {
    if (phase == RoomPhase.ready) {
      _bindMicAlert();
      // RoomGiftPag 在 Obx 外：进房完成后强制重建一次，确保订上 RoomEffectLogic。
      if (mounted) setState(() {});
    } else if (phase == RoomPhase.needPassword) {
      _askPassword();
    } else if (phase == RoomPhase.failed) {
      _pop();
    }
  }

  void _bindMicAlert() {
    _micAlertWorker?.dispose();
    if (!Get.isRegistered<MicLogic>()) return;
    final mic = Get.find<MicLogic>();
    _micAlertWorker = ever(mic.insufficientPrompt, (show) {
      if (show == true) unawaited(_insufficientMic());
    });
    if (mic.insufficientPrompt.value) unawaited(_insufficientMic());
  }

  /// 麦上剩余 ≤30 秒弹一次；点 Send Gift 打开礼物面板。
  Future<void> _insufficientMic() async {
    if (_showingInsufficient || !mounted) return;
    _showingInsufficient = true;
    final send = await showRoomMicRemainDialog();
    _showingInsufficient = false;
    if (send == true && mounted) await _gift();
  }

  Future<void> _askPassword() async {
    if (_askingPassword || !mounted) return;
    _askingPassword = true;
    final ok = await AppDialog.show(
      title: 'Room password',
      confirmLabel: 'Enter',
      cancelLabel: 'Cancel',
      buttons: DialogLoyoutStyle.horizontal,
      contentWidget: TextField(
        controller: _password,
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(hintText: 'Password'),
      ),
    );
    _askingPassword = false;
    if (!mounted) return;
    if (ok == true && _password.text.trim().isNotEmpty) {
      await logic.enter(password: _password.text.trim());
      return;
    }
    await logic.abandon();
    _pop();
  }

  void _minimize() {
    logic.minimize();
    _pop();
  }

  void _pop() {
    if (!mounted || _allowPop) return;
    setState(() => _allowPop = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) AppJumper.maybeBack();
    });
  }

  void _send() {
    final text = _input.text;
    _input.clear();
    logic.send(text);
  }

  void _bulletin(String notice) {
    RoomBulletinDialog.show(notice);
  }

  Future<void> _gift() => AppGift.show(context, scene: AppGiftScene.room);

  void _tools() {
    showRoomToolsSheet();
  }

  Widget _background(String url, RoomService? service) {
    final src = url.trim();
    final resolved = AppImage.resolve(src);
    final pag = roomIsPag(resolved);
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: AppColors.purple14081F),
        if (src.isNotEmpty)
          if (pag)
            // PAG 需要明确宽高；Chimo.image 的 infinity.w 会导致播不起来。
            LayoutBuilder(
              builder: (context, constraints) {
                final w = constraints.maxWidth;
                final h = constraints.maxHeight;
                return PAGView.network(
                  resolved,
                  width: w,
                  height: h,
                  autoPlay: true,
                  repeatCount: PAGView.REPEAT_COUNT_LOOP,
                );
              },
            )
          else
            Positioned.fill(
              child: AppImage.image(resolved, fit: BoxFit.cover),
            ),
        // 压暗静态底图；房型 PAG 叠在遮罩之上，避免动画被洗暗。
        const DecoratedBox(
          decoration: BoxDecoration(gradient: AppColors.roomBackdropScrim),
        ),
        ..._playBackdrops(context, service),
      ],
    );
  }

  Widget _micArea(BuildContext context, RoomService? service) {
    final plays = service?.plays ?? const [];
    for (final play in plays) {
      final area = play.buildMicArea(context);
      if (area != null) return area;
    }
    return RoomMicGrid(
      onTap: (seat) {
        if (!seat.occupied) {
          logic.toggleMic(position: seat.index);
          return;
        }
        // 与弹幕 / 榜单同一信息卡；自己底部为上/下麦。
        AppJumper.showUserProfileSheet(
          uid: '${seat.uid ?? 0}',
          name: seat.name,
          avatar: seat.avatar,
        );
      },
    );
  }

  List<Widget> _topPills(BuildContext context, RoomService? service) {
    final pills = <Widget>[];
    final plays = service?.plays ?? const [];
    for (final play in plays) {
      pills.addAll(play.buildTopPills(context));
    }
    return pills;
  }

  List<Widget> _playSlots(RoomService? service) {
    final slots = <Widget>[];
    final plays = service?.plays ?? const [];
    for (final play in plays) {
      slots.add(play.buildSlot());
    }
    return slots;
  }

  List<Widget> _playBackdrops(BuildContext context, RoomService? service) {
    final layers = <Widget>[];
    final plays = service?.plays ?? const [];
    for (final play in plays) {
      final backdrop = play.buildBackdrop(context);
      if (backdrop != null) layers.add(backdrop);
    }
    return layers;
  }

  List<Widget> _playOverlays(BuildContext context, RoomService? service) {
    final layers = <Widget>[];
    final plays = service?.plays ?? const [];
    for (final play in plays) {
      final overlay = play.buildOverlay(context);
      if (overlay != null) {
        layers.add(Positioned.fill(child: overlay));
      }
    }
    return layers;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _allowPop,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _minimize();
      },
      child: AppScaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.purple14081F,
        // 对齐 yaychat：飞麦挂房间 Stack，且放在 Obx 外，关 sheet / Obx 刷新都不拆播放层。
        body: Stack(
          fit: StackFit.expand,
          children: [
            Obx(() {
              final service = RoomService.findOrNull();
              final notice = service?.notice.value ?? '';
              final background = service?.background.value ?? '';
              final ready = logic.phase.value == RoomPhase.ready;
              // 订阅玩法列表，进拍卖房后才能挂上 BidBar。
              service?.plays.length;
              return Stack(
                fit: StackFit.expand,
                children: [
                  _background(background, service),
                  if (!ready)
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.green29EEAA,
                      ),
                    )
                  else
                    SafeArea(
                      child: Column(
                        children: [
                          RoomTopBar(
                            roomId: service?.rid ?? widget.rid,
                            onSave: logic.toggleSave,
                            onBulletin: () => _bulletin(notice),
                            onMoreRooms: AppJumper.showMoreRoomsDrawer,
                            onRank: () =>
                                RoomRankSheet.show(initial: RoomRankTab.givers),
                            onAudience: () => RoomRankSheet.show(
                              initial: RoomRankTab.members,
                            ),
                            onScale: _minimize,
                            extraPills: _topPills(context, service),
                          ),
                          _micArea(context, service),
                          ..._playSlots(service),
                          const Expanded(
                            child: Stack(
                              children: [
                                Positioned.fill(child: RoomBarrageList()),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: RoomJoinLayer(),
                                ),
                                Positioned(
                                  right: 8,
                                  bottom: 8,
                                  child: _GamesButton(),
                                ),
                              ],
                            ),
                          ),
                          // Bid 在底栏上方 Column 内，不被礼物全屏层盖住。
                          if (Get.isRegistered<AuctionLogic>())
                            const AuctionBidBar(),
                          RoomInputBar(
                            controller: _input,
                            onSend: _send,
                            onJoinMic: logic.toggleMic,
                            onToggleMic: logic.toggleLocalMic,
                            onGift: _gift,
                            onMessages: AppJumper.showChatsSheet,
                            onTools: _tools,
                          ),
                        ],
                      ),
                    ),
                  if (ready) ..._playOverlays(context, service),
                ],
              );
            }),
            // 歌词在上便于拖动；空态 shrink，不挡 PAG。礼物层保持可被 VisibilityDetector 看见。
            const Positioned.fill(child: RoomLyricLayer()),
            Positioned.fill(child: RoomGiftPag(key: _giftPagKey)),
          ],
        ),
      ),
    );
  }
}

class _GamesButton extends StatelessWidget {
  const _GamesButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppDialog.show(
          title: 'Games',
          content: 'No games in this room.',
          confirmLabel: 'OK',
        );
      },
      child: Chimo.image(AppAssets.roomGames, width: 64, fit: BoxFit.contain),
    );
  }
}
