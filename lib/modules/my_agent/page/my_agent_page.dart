import 'package:chimo/common/utils/chimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/auction.pb.dart';
import '../../../common/models/server_client/base.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/text_fmt.dart';
import '../../../common/utils/time_fmt.dart';
import '../../../common/widgets/app_empty_holder.dart';
import '../../../common/widgets/app_image.dart';
import '../../../common/widgets/app_pull_refresh.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/my_agent_logic.dart';

/// My Agent。UI 对齐设计稿；数据对齐 `/artist/getAgentInfo`。
class MyAgentPage extends StatefulWidget {
  const MyAgentPage({super.key});

  @override
  State<MyAgentPage> createState() => _MyAgentPageState();
}

class _MyAgentPageState extends State<MyAgentPage> {
  late final MyAgentLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.isRegistered<MyAgentLogic>()
        ? Get.find<MyAgentLogic>()
        : Get.put(MyAgentLogic());
  }

  @override
  void dispose() {
    if (Get.isRegistered<MyAgentLogic>()) {
      Get.delete<MyAgentLogic>(force: true);
    }
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
      appBar: const AppNavBar(title: 'My Agent'),
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
            _GiftSliver(logic: logic),
          ],
        );
      }),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.logic});

  final MyAgentLogic logic;

  @override
  Widget build(BuildContext context) {
    final info = logic.info.value;
    final artist = info?.artist;
    final hasAgent = logic.hasAgent;
    final showExpire = hasAgent || info?.hasExpiryDate() == true;
    final expireText = hasAgent
        ? 'Contract expires in ${info?.expiryDate ?? 0} days'
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
                          _Avatar(url: artist?.avatar, size: 54.w, borderColor: AppColors.white50),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _NameWithGender(user: artist, fontSize: 16),
                                SizedBox(height: 4.w),
                                _CoinValueRow(
                                  label: 'Talent Value:',
                                  value: TextFmt.toCommaValue(info?.value),
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
                _HolderBlock(hasAgent: hasAgent, agent: hasAgent ? info?.agent : null),
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

  final MyAgentLogic logic;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'A Gift from the Agent',
          style: TextStyle(color: AppColors.white, fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        Text(
          'Total',
          style: TextStyle(
            color: AppColors.yellowFDE42B,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 2.w),
        Chimo.image(AppAssets.auctionCoin, width: 12, height: 12),
        SizedBox(width: 2.w),
        Text(
          TextFmt.toCommaValue(logic.info.value?.totalCoin),
          style: TextStyle(
            color: AppColors.yellowFDE42B,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _GiftSliver extends StatelessWidget {
  const _GiftSliver({required this.logic});

  final MyAgentLogic logic;

  @override
  Widget build(BuildContext context) {
    final gifts = logic.gifts;
    if (gifts.isEmpty) {
      return const AppEmptyHolder.empty(
        message: 'No gifts yet',
        icon: AppAssets.friendsEmpty,
      ).asSliver;
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.w),
          child: _GiftCard(record: gifts[index]),
        );
      }, childCount: gifts.length),
    );
  }
}

class _GiftCard extends StatelessWidget {
  const _GiftCard({required this.record});

  final AgentGiftRecord record;

  @override
  Widget build(BuildContext context) {
    final item = record.item;
    final count = record.count <= 0 ? 1 : record.count;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
      decoration: BoxDecoration(
        color: AppColors.black1C1C1E,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: AppColors.black111111,
              borderRadius: BorderRadius.circular(12.w),
            ),
            alignment: Alignment.center,
            child: AppImage.image(item.icon, width: 36.w, height: 36.w, fit: BoxFit.contain),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${item.name}×$count',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.w),
                Text(
                  TimeFmt.monthDayYearClock(record.createTime.toInt()),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.gray9A9A9A,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Chimo.image(AppAssets.auctionCoin, width: 14, height: 14),
              SizedBox(width: 2.w),
              Text(
                '+${TextFmt.toCommaValue(record.coin)}',
                style: TextStyle(
                  color: AppColors.yellowFDE42B,
                  fontSize: 14.sp,
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
    this.valueColor = AppColors.yellowFDE42B,
  });

  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(color: AppColors.white50, fontSize: 12.sp, fontWeight: FontWeight.w400),
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
