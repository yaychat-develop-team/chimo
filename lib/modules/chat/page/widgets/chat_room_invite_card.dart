import 'package:flutter/material.dart';

import '../../../../app/app_jumper.dart';
import '../../../../common/constants/app_assets.dart';
import '../../../../common/im/im_custom_payload.dart';
import '../../../../common/theme/app_colors.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 房间邀请卡片。UI 对齐 Cosmic Lounge 聊天设计稿（淡黄底 + Join）。
class ChatRoomInviteCard extends StatelessWidget {
  const ChatRoomInviteCard({super.key, required this.payload, required this.isSelf});

  final ImRoomInvitePayload payload;
  final bool isSelf;

  static const double _width = 240;
  static const double _coverSize = 56;
  static const double _radius = 18;
  static const double _tailRadius = 4;

  void _openRoom() {
    if (payload.rid <= 0) return;
    AppJumper.toRoom(payload.rid);
  }

  BorderRadius _cardRadius(BuildContext context) => BorderRadiusDirectional.only(
    topStart: Radius.circular(isSelf ? _radius : _tailRadius),
    topEnd: Radius.circular(isSelf ? _tailRadius : _radius),
    bottomStart: const Radius.circular(_radius),
    bottomEnd: const Radius.circular(_radius),
  ).resolve(Directionality.of(context));

  String get _cover {
    if (payload.isGameRoom) {
      if (payload.gameIconSmall.isNotEmpty) return payload.gameIconSmall;
      if (payload.gameIconBig.isNotEmpty) return payload.gameIconBig;
    }
    return payload.roomIcon;
  }

  String get _title {
    if (payload.isGameRoom && payload.gameName.isNotEmpty) {
      return payload.gameName;
    }
    return payload.title.isEmpty ? 'Room' : payload.title;
  }

  String get _desc {
    if (payload.desc.isNotEmpty) return payload.desc;
    if (payload.isGameRoom && payload.gameName.isNotEmpty) {
      return "Let's play ${payload.gameName} together!";
    }
    return 'Come hang out!';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openRoom,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: _width,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        decoration: BoxDecoration(
          color: AppColors.yellowFFF9C4,
          borderRadius: _cardRadius(context),
          border: Border.all(color: AppColors.yellowFDE08D, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _coverThumb(),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.black1C1C1E,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _desc,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.gray9A9A9A,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _joinButton(),
          ],
        ),
      ),
    );
  }

  Widget _coverThumb() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: _coverSize,
        height: _coverSize,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Chimo.image(
              _cover,
              width: _coverSize,
              height: _coverSize,
              fit: BoxFit.cover,
              fallbackAsset: AppAssets.avatarPlace,
            ),
            // 设计稿封面中心的 live 波形标（与房间浮层同资源，着白色）。
            Center(
              child: Image.asset(
                AppAssets.roomFloatWave,
                width: 18,
                fit: BoxFit.fitWidth,
                color: AppColors.white,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _joinButton() {
    return Material(
      color: AppColors.black1C1C1E,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: _openRoom,
        borderRadius: BorderRadius.circular(22),
        child: const SizedBox(
          height: 36,
          child: Center(
            child: Text(
              'Join',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
