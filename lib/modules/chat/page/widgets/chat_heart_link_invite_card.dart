import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/im/im_custom_payload.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/app_toast.dart';
import '../../../heart_link/widgets/heart_link_invite_notice.dart';

/// Heart Link IM 邀请气泡。对齐 oumi `CustomHtInviteItem` / `CustomHtInviteGsItem`。
class ChatHeartLinkInviteCard extends StatelessWidget {
  const ChatHeartLinkInviteCard({
    super.key,
    required this.payload,
    required this.isSelf,
  });

  final ImHeartLinkInvitePayload payload;
  final bool isSelf;

  Future<void> _join() async {
    final info = payload.info;
    if (HeartLinkInviteNotice.isExpired(info)) {
      AppToast.info('This invitation has expired');
      return;
    }
    await HeartLinkInviteNotice.joinRoom(info);
  }

  @override
  Widget build(BuildContext context) {
    if (payload.forGs) return _gsCard();
    return _userCard();
  }

  Widget _userCard() {
    return Container(
      width: 247.w,
      height: 155.w,
      padding: EdgeInsetsDirectional.only(top: 12.w, start: 16.w, end: 16.w, bottom: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage(AppAssets.htInfoBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Match Found!',
            style: TextStyle(color: AppColors.white, fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.w),
          HeartLinkInviteMatchPair(info: payload.info, small: true),
          const Spacer(),
          HeartLinkInviteActionBtn(
            label: 'Chat Now',
            width: 215.w,
            height: 28.w,
            fontSize: 13,
            onTap: _join,
          ),
        ],
      ),
    );
  }

  Widget _gsCard() {
    return Container(
      width: 247.w,
      height: 130.w,
      padding: EdgeInsetsDirectional.only(top: 20.w, start: 10.w, end: 10.w, bottom: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage(AppAssets.htInfoBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Text(
            'The host invites you to join the Heartlink Room. Join now to interact with the audience!',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.white, fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          HeartLinkInviteActionBtn(
            label: 'Chat Now',
            width: 215.w,
            height: 28.w,
            fontSize: 13,
            onTap: _join,
          ),
        ],
      ),
    );
  }
}
