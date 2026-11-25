import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/session_info.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/auction.pb.dart';
import '../../../common/models/server_client/base.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/text_fmt.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/echo_hall_logic.dart';

/// EchoHall。UI 对齐设计稿；逻辑对齐 joyride `EchoHallPage`。
class EchoHallPage extends StatefulWidget {
  const EchoHallPage({super.key, int? targetUid}) : targetUid = targetUid ?? 0;

  final int targetUid;

  @override
  State<EchoHallPage> createState() => _EchoHallPageState();
}

class _EchoHallPageState extends State<EchoHallPage> {
  late final int _uid;
  late final EchoHallLogic logic;

  @override
  void initState() {
    super.initState();
    _uid = widget.targetUid > 0 ? widget.targetUid : SessionInfo.uid;
    logic = EchoHallLogic.put(_uid);
  }

  @override
  void dispose() {
    EchoHallLogic.delete(_uid);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backdrop: AppImage.image(
        AppAssets.homeTopBg,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
      appBar: AppNavBar(
        title: 'EchoHall',
        trailing: logic.isMine
            ? GestureDetector(
                onTap: AppJumper.toMyAgent,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.w),
                  child: Text(
                    'My Agent',
                    style: TextStyle(
                      color: AppColors.white70,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            : null,
      ),
      body: Obx(() {
        if (logic.loading.value && logic.info.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return AppPullRefresh(
          onRefresh: logic.load,
          padding: EdgeInsets.fromLTRB(16.w, 8.w, 16.w, 16.w),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderCard(logic: logic),
                  Chimo.gap(height: 20),
                  _SectionTitle(logic: logic),
                  Chimo.gap(height: 12),
                ],
              ),
            ),
            _TalentSliver(logic: logic),
          ],
        );
      }),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.logic});

  final EchoHallLogic logic;

  @override
  Widget build(BuildContext context) {
    final signed = logic.signed;
    final user = signed?.user;
    final hasAgent = logic.hasAgent;
    // 自己视角始终展示到期；他人无 Holder 时展示占位文案。
    final showExpire = logic.isMine || !hasAgent;
    final expireText = hasAgent
        ? 'Contract expires in ${signed?.expiryDate ?? 0} days'
        : "Who's the Lucky Holder?";

    return SizedBox(
      width: double.infinity,
      height: 108.w,
      child: Stack(
        children: [
          Positioned.fill(child: Chimo.image(AppAssets.echoHallHeaderCard, fit: BoxFit.fill)),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w, end: 20.w, top: 16.w, bottom: 12.w),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _Avatar(url: user?.avatar, size: 54.w, borderColor: AppColors.white50),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _NameWithGender(user: user, fontSize: 16),
                                SizedBox(height: 4.w),
                                _CoinValueRow(
                                  label: 'Talent Value:',
                                  value: TextFmt.toCommaValue(signed?.value),
                                  valueColor: AppColors.yellowFDE42B,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (showExpire) ...[
                        const Spacer(),
                        Row(
                          children: [
                            if (hasAgent) ...[
                              Chimo.image(AppAssets.auctionClock, width: 12, height: 12),
                              SizedBox(width: 4.w),
                            ],
                            Expanded(
                              child: Text(
                                expireText,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.white70,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                _HolderBlock(hasAgent: hasAgent, agent: hasAgent ? signed?.agent : null),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HolderBlock extends StatelessWidget {
  const _HolderBlock({required this.hasAgent, this.agent});

  final bool hasAgent;
  final CommonUser? agent;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 90.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 4.w),
                child: hasAgent
                    ? _Avatar(url: agent?.avatar, size: 42.w, borderColor: AppColors.white50)
                    : Chimo.image(AppAssets.roomSeatEmpty, width: 42, height: 42),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  gradient: LinearGradient(
                    colors: [AppColors.yellowFCDA42, AppColors.orangeFFAD02],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Text(
                  'My Holder',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.w),
          Text(
            hasAgent ? (agent?.nickname ?? '') : 'No Holder Yet',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: hasAgent ? AppColors.white : AppColors.white50,
              fontSize: hasAgent ? 12.sp : 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.logic});

  final EchoHallLogic logic;

  @override
  Widget build(BuildContext context) {
    final prefix = logic.isMine ? 'My' : 'His';
    return Row(
      children: [
        Text(
          '$prefix Talent',
          style: TextStyle(color: AppColors.white, fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(width: 6.w),
        Text(
          '· ${logic.artists.length}',
          style: TextStyle(
            color: AppColors.gray9A9A9A,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        if (!logic.isMine) ...[
          Text(
            'Team Value:',
            style: TextStyle(
              color: AppColors.gray9A9A9A,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 2.w),
          Chimo.image(AppAssets.auctionCoin, width: 12, height: 12),
          SizedBox(width: 2.w),
          Text(
            TextFmt.toCommaValue(logic.teamValue),
            style: TextStyle(
              color: AppColors.yellowFDE42B,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ],
    );
  }
}

class _TalentSliver extends StatelessWidget {
  const _TalentSliver({required this.logic});

  final EchoHallLogic logic;

  @override
  Widget build(BuildContext context) {
    final artists = logic.artists;
    if (artists.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            'No talent yet',
            style: TextStyle(color: AppColors.gray9A9A9A, fontSize: 14.sp),
          ),
        ),
      );
    }
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: logic.isMine ? 1 : 3,
        childAspectRatio: logic.isMine ? 343 / 135 : 108 / 160,
        mainAxisSpacing: 12.w,
        crossAxisSpacing: 9.w,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final artist = artists[index];
        return logic.isMine
            ? _MineTalentCard(artist: artist, onRenew: () => logic.renew(artist))
            : _OtherTalentCard(artist: artist);
      }, childCount: artists.length),
    );
  }
}

class _MineTalentCard extends StatelessWidget {
  const _MineTalentCard({required this.artist, required this.onRenew});

  final Artist artist;
  final VoidCallback onRenew;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 12.w),
      decoration: BoxDecoration(
        color: AppColors.black1C1C1E,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _Avatar(url: artist.user.avatar, size: 48.w),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      artist.user.nickname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2.w),
                    _CoinValueRow(
                      label: 'Talent Value:',
                      value: TextFmt.toCommaValue(artist.value),
                      labelColor: AppColors.gray9A9A9A,
                      valueColor: AppColors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Chimo.image(AppAssets.auctionCoin, width: 14, height: 14),
                      SizedBox(width: 2.w),
                      Text(
                        TextFmt.toCommaValue(artist.contribution),
                        style: TextStyle(
                          color: AppColors.yellowFDE42B,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.w),
                  Text(
                    'Contribution',
                    style: TextStyle(
                      color: AppColors.gray9A9A9A,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.w),
          Container(height: 1, color: AppColors.white.withValues(alpha: 0.12)),
          const Spacer(),
          Row(
            children: [
              Chimo.image(AppAssets.auctionClock, width: 12, height: 12),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  'Contract expires in ${artist.expiryDate} days',
                  style: TextStyle(
                    color: AppColors.gray9A9A9A,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onRenew,
                child: Container(
                  width: 72.w,
                  height: 28.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.green1CFF8A,
                    borderRadius: BorderRadius.circular(14.w),
                  ),
                  child: Text(
                    'Renew',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OtherTalentCard extends StatelessWidget {
  const _OtherTalentCard({required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 16.w, 12.w, 12.w),
      decoration: BoxDecoration(
        color: AppColors.black1C1C1E,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        children: [
          _Avatar(url: artist.user.avatar, size: 54.w),
          SizedBox(height: 10.w),
          Text(
            artist.user.nickname,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColors.white, fontSize: 14.sp, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Text(
            'Talent Value',
            maxLines: 1,
            style: TextStyle(
              color: AppColors.gray9A9A9A,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 2.w),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Chimo.image(AppAssets.auctionCoin, width: 14, height: 14),
              SizedBox(width: 2.w),
              Text(
                TextFmt.toCommaValue(artist.value),
                style: TextStyle(
                  color: AppColors.yellowFDE42B,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.url, required this.size, this.borderColor});

  final String? url;
  final double size;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final avatar = AppImage.avatar(url, size: size);
    if (borderColor == null) return avatar;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor!, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: AppImage.avatar(url, size: size - 2),
    );
  }
}

class _NameWithGender extends StatelessWidget {
  const _NameWithGender({required this.user, required this.fontSize});

  final CommonUser? user;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final gender = user?.gender.toLowerCase() ?? '';
    final genderAsset = gender == 'f' || gender == 'female' || gender == 'woman'
        ? AppAssets.roomFemale
        : gender == 'm' || gender == 'male' || gender == 'man'
        ? AppAssets.roomMale
        : null;
    return Row(
      children: [
        Flexible(
          child: Text(
            user?.nickname ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.white,
              fontSize: fontSize.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (genderAsset != null) ...[
          SizedBox(width: 4.w),
          Chimo.image(genderAsset, width: 12, height: 12),
        ],
      ],
    );
  }
}

class _CoinValueRow extends StatelessWidget {
  const _CoinValueRow({
    required this.label,
    required this.value,
    this.labelColor = AppColors.white50,
    this.valueColor = AppColors.yellowFDE42B,
  });

  final String label;
  final String value;
  final Color labelColor;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(color: labelColor, fontSize: 12.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 3.w),
        Chimo.image(AppAssets.auctionCoin, width: 12, height: 12),
        SizedBox(width: 2.w),
        Flexible(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: valueColor, fontSize: 12.sp, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
