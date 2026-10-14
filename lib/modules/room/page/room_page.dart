import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../common/theme/app_bottom_sheet.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_dialog.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../chat/page/widgets/gift_sheet.dart';
import '../logic/mic_logic.dart';
import '../logic/room_logic.dart';
import '../model/mic_seat.dart';
import '../service/room_service.dart';
import 'widgets/room_barrage_list.dart';
import 'widgets/room_gift_layer.dart';
import 'widgets/room_input_bar.dart';
import 'widgets/room_join_layer.dart';
import 'widgets/room_lyric_layer.dart';
import 'widgets/room_mic_grid.dart';
import 'widgets/room_rank_sheet.dart';
import 'widgets/room_top_bar.dart';
import 'widgets/room_user_sheet.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key, required this.rid});

  final int rid;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  late final RoomLogic logic;
  late final Worker _phaseWorker;
  final _input = TextEditingController();
  final _password = TextEditingController();
  var _allowPop = false;
  var _askingPassword = false;

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
    _phaseWorker.dispose();
    _input.dispose();
    _password.dispose();
    RoomLogic.release();
    super.dispose();
  }

  void _onPhase(RoomPhase phase) {
    if (phase == RoomPhase.needPassword) {
      _askPassword();
    } else if (phase == RoomPhase.failed) {
      _pop();
    }
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

  Future<void> _close() async {
    final onMic = Get.isRegistered<MicLogic>() && Get.find<MicLogic>().onMic;
    if (onMic) {
      final ok = await AppDialog.show(
        title: 'Leave the room?',
        content: 'You are on the mic.',
        confirmLabel: 'Leave',
        cancelLabel: 'Stay',
        buttons: DialogLoyoutStyle.horizontal,
      );
      if (ok != true || !mounted) return;
    }
    await logic.leave();
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
    final text = notice.trim();
    AppDialog.show(
      title: 'Room Bulletin',
      content: text.isEmpty ? 'No bulletin yet' : text,
      confirmLabel: 'OK',
    );
  }

  void _emoji() {
    showRoomEmojiSheet(context, (glyph) {
      final text = _input.text;
      final selection = _input.selection;
      final start = selection.start < 0 ? text.length : selection.start;
      final end = selection.end < 0 ? text.length : selection.end;
      final next = text.replaceRange(start, end, glyph);
      _input.value = TextEditingValue(
        text: next,
        selection: TextSelection.collapsed(offset: start + glyph.length),
      );
    });
  }

  Future<void> _gift() async {
    if (!Get.isRegistered<MicLogic>()) return;
    final people = Get.find<MicLogic>().seats.where((seat) => seat.occupied).toList();
    if (people.isEmpty) {
      AppToast.info('No one on the mic');
      return;
    }
    final picked = people.length == 1 ? people.first : await _pickReceiver(people);
    if (picked == null || !mounted) return;
    await _giftTo(picked);
  }

  Future<void> _giftTo(MicSeat seat) {
    return showGiftBottomSheet(
      context,
      receiverUid: '${seat.uid}',
      channelId: '${widget.rid}',
      rid: widget.rid,
    );
  }

  Future<MicSeat?> _pickReceiver(List<MicSeat> people) {
    return showModalBottomSheet<MicSeat>(
      context: context,
      backgroundColor: AppColors.rankSheet,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final seat in people)
                ListTile(
                  leading: ClipOval(
                    child: seat.avatar.trim().isEmpty
                        ? const ColoredBox(
                            color: AppColors.roomEmptySeat,
                            child: SizedBox(width: 36, height: 36),
                          )
                        : AppImage(seat.avatar, width: 36, height: 36, fit: BoxFit.cover),
                  ),
                  title: Text(seat.name, style: const TextStyle(color: AppColors.textPrimary)),
                  onTap: () => AppJumper.back(result: seat),
                ),
            ],
          ),
        );
      },
    );
  }

  void _tools() {
    final service = RoomService.findOrNull();
    AppBottomSheet.actions(
      buildItems: () => [
        AppSheetAction(
          label: (service?.saved.value ?? false) ? 'Unsave' : 'Save',
          onTap: () {
            AppJumper.back();
            logic.toggleSave();
          },
        ),
        AppSheetAction(
          label: 'Bulletin',
          onTap: () {
            AppJumper.back();
            _bulletin(service?.notice.value ?? '');
          },
        ),
        AppSheetAction(
          label: 'Leave room',
          destructive: true,
          onTap: () {
            AppJumper.back();
            _close();
          },
        ),
      ],
    );
  }

  Widget _background(String url) {
    final src = url.trim();
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: AppColors.roomBackdrop),
        if (src.isNotEmpty)
          AppImage(src, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
        const DecoratedBox(decoration: BoxDecoration(gradient: AppColors.roomBackdropScrim)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _allowPop,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _minimize();
      },
      child: ChimoScaffold(
        showNav: false,
        safeArea: false,
        backgroundColor: AppColors.roomBackdrop,
        body: Obx(() {
          final service = RoomService.findOrNull();
          return Stack(
            fit: StackFit.expand,
            children: [
              _background(service?.background.value ?? ''),
              if (logic.phase.value != RoomPhase.ready)
                const Center(child: CircularProgressIndicator(color: AppColors.roomSave))
              else
                SafeArea(
                  child: Column(
                    children: [
                      RoomTopBar(
                        title: service?.title.value ?? '',
                        roomId: service?.rid ?? widget.rid,
                        cover: service?.cover.value ?? '',
                        saved: service?.saved.value ?? false,
                        online: service?.online.value ?? 0,
                        hot: service?.hot.value ?? 0,
                        avatars: service?.audience.toList() ?? const [],
                        onSave: logic.toggleSave,
                        onBulletin: () => _bulletin(service?.notice.value ?? ''),
                        onMoreRooms: _minimize,
                        onAudience: () => RoomRankSheet.show(context),
                        onScale: _minimize,
                      ),
                      RoomMicGrid(
                        onTap: (seat) {
                          if (!seat.occupied) {
                            logic.toggleMic(position: seat.index);
                            return;
                          }
                          RoomUserSheet.show(
                            context,
                            seat: seat,
                            mine: seat.uid == service?.myUid,
                            onLeave: logic.toggleMic,
                            onGift: () => _giftTo(seat),
                          );
                        },
                      ),
                      for (final play in service?.plays ?? const []) play.buildSlot(),
                      const Expanded(
                        child: Stack(
                          children: [
                            Positioned.fill(child: RoomBarrageList()),
                            Positioned(top: 0, left: 0, right: 0, child: RoomJoinLayer()),
                            Positioned(top: 0, left: 0, right: 0, child: RoomGiftBanner()),
                            Positioned(right: 8, bottom: 8, child: _GamesButton()),
                          ],
                        ),
                      ),
                      RoomInputBar(
                        controller: _input,
                        onSend: _send,
                        onJoinMic: logic.toggleMic,
                        onToggleMic: logic.toggleLocalMic,
                        onEmoji: _emoji,
                        onGift: _gift,
                        onMessages: AppJumper.toChats,
                        onTools: _tools,
                      ),
                    ],
                  ),
                ),
              const Positioned.fill(child: RoomGiftPag()),
              const Positioned.fill(child: RoomLyricLayer()),
            ],
          );
        }),
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
        AppDialog.show(title: 'Games', content: 'No games in this room.', confirmLabel: 'OK');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.roomGlass,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.roomId),
            ),
            child: const Icon(Icons.sports_esports_rounded, color: AppColors.textPrimary, size: 28),
          ),
          const SizedBox(height: 2),
          const Text(
            'Games',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
