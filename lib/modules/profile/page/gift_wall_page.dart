import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/models/server_client/gift_wall.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/chimo.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../logic/gift_wall_logic.dart';
import 'gift_wall_card_detail_page.dart';
import 'gift_wall_edit_page.dart';
import 'widgets/gift_wall_cells.dart';

/// 礼物墙详情。对齐 joyride `GiftWallPage`：等级头图 + Gift Wall / Cards 双 Tab。
class GiftWallPage extends StatefulWidget {
  const GiftWallPage({super.key, required this.targetId});

  final int targetId;

  @override
  State<GiftWallPage> createState() => _GiftWallPageState();
}

class _GiftWallPageState extends State<GiftWallPage> {
  late final GiftWallLogic logic;
  late final PageController _tabPages;
  PageController? _levelPages;
  var _levelInited = false;

  static const _diamond = LinearGradient(
    colors: [Color(0xFFFFEAD9), Color(0xFFFFFFFF), Color(0xFFC3E1FD), Color(0xFFC9C1FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  void initState() {
    super.initState();
    logic = GiftWallLogic.put(widget.targetId);
    _tabPages = PageController();
  }

  @override
  void dispose() {
    _tabPages.dispose();
    _levelPages?.dispose();
    GiftWallLogic.delete(widget.targetId);
    super.dispose();
  }

  void _ensureLevelPager() {
    if (_levelInited || logic.detail.value == null) return;
    _levelPages = PageController(initialPage: logic.levelIndex);
    _levelInited = true;
  }

  void _onTab(int index) {
    logic.tabIndex.value = index;
    if (_tabPages.hasClients) _tabPages.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final loaded = logic.loaded;
      _ensureLevelPager();
      return AppScaffold(
        extendBody: true,
        backgroundColor: loaded ? AppColors.transparent : AppColors.purple1D1045,
        appBar: const AppNavBar(title: 'Gift Wall', foregroundColor: AppColors.white),
        body: ColoredBox(
          color: AppColors.purple14102B,
          child: logic.loading.value && !loaded
              ? const Center(child: CircularProgressIndicator(color: AppColors.green29EEAA))
              : logic.error.value.isNotEmpty && !loaded
                  ? Center(
                      child: GestureDetector(
                        onTap: logic.load,
                        child: Text(
                          logic.error.value,
                          style: const TextStyle(color: AppColors.white60),
                        ),
                      ),
                    )
                  : _body(),
        ),
      );
    });
  }

  Widget _body() {
    final levels = logic.detail.value?.levelInfo ?? const <GiftWallLevel>[];
    final gifts = logic.detail.value?.itemList.toList() ?? const <GiftItem>[];
    final cards = logic.detail.value?.cardList.toList() ?? const <CardInfo>[];
    return Stack(
      children: [
        SizedBox(
          height: 300.w,
          child: levels.isEmpty || _levelPages == null
              ? const SizedBox.shrink()
              : PageView.builder(
                  controller: _levelPages,
                  itemCount: levels.length,
                  itemBuilder: (_, i) => _levelHeader(levels[i], i == levels.length - 1),
                ),
        ),
        Positioned.fill(
          child: Container(
            margin: EdgeInsets.only(top: 289.w),
            decoration: BoxDecoration(
              color: AppColors.purple1D1045,
              image: DecorationImage(
                image: AssetImage(AppAssets.giftWallBg),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 23.w),
                _tabs(),
                if (logic.tabIndex.value == 0)
                  Padding(
                    padding: EdgeInsets.fromLTRB(40.w, 8.w, 40.w, 0),
                    child: Text(
                      'Send gifts to light up the wall and climb levels together',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFD5C0FF).withValues(alpha: 0.5),
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                Expanded(
                  child: PageView(
                    controller: _tabPages,
                    onPageChanged: (i) => logic.tabIndex.value = i,
                    children: [
                      _giftGrid(gifts),
                      _cardGrid(cards),
                    ],
                  ),
                ),
                if (logic.isMe && logic.tabIndex.value == 0) _editBar(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabs() {
    final gifts = logic.tabIndex.value == 0;
    return Container(
      width: 203.w,
      height: 40.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(gifts ? AppAssets.giftWallTabGifts : AppAssets.giftWallTabCards),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => _onTab(0),
              child: SizedBox(height: 40.w),
            ),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => _onTab(1),
              child: SizedBox(height: 40.w),
            ),
          ),
        ],
      ),
    );
  }

  Widget _giftGrid(List<GiftItem> gifts) {
    if (gifts.isEmpty) {
      return Center(child: Chimo.image(AppAssets.giftWallEmpty, width: 160.w, height: 160.w));
    }
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(10.w, 2.w, 10.w, 20.w),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 3.w,
        crossAxisSpacing: 10.w,
        childAspectRatio: 112 / 162,
      ),
      itemCount: gifts.length,
      itemBuilder: (_, i) {
        final item = gifts[i];
        return GiftWallGiftCell(
          item: item,
          mode: GiftWallCellMode.wall,
          mine: logic.isMe,
          onSend: () => logic.sendGift(
            giftPrice: item.price.toInt(),
            giftId: item.id.toInt(),
          ),
        );
      },
    );
  }

  Widget _cardGrid(List<CardInfo> cards) {
    if (cards.isEmpty) {
      return const Center(
        child: Text('No cards yet', style: TextStyle(color: AppColors.white60)),
      );
    }
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(16.w, 20.w, 16.w, 20.w),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 10.w,
        childAspectRatio: 166 / 312,
      ),
      itemCount: cards.length,
      itemBuilder: (_, i) {
        final item = cards[i];
        return GiftWallCardCell(
          item: item,
          onTap: () => Get.to(
            () => GiftWallCardDetailPage(targetId: widget.targetId, cardId: item.id.toInt()),
          ),
        );
      },
    );
  }

  Widget _editBar() {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 10.w, 16.w, 10.w),
        child: GestureDetector(
          onTap: () async {
            await Get.to(() => const GiftWallEditPage());
            await logic.load();
          },
          child: Container(
            height: 48.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.w),
              gradient: AppColors.primaryGradient,
            ),
            child: Text(
              'Edit Showcase',
              style: TextStyle(
                color: AppColors.black1F2518,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _levelHeader(GiftWallLevel item, bool max) {
    final level = item.level.clamp(1, 5);
    final name = logic.targetUser.value?.nickname.trim().isNotEmpty == true
        ? logic.targetUser.value!.nickname
        : 'User';
    final avatar = logic.targetUser.value?.avatar ?? '';
    final total = item.currentLevelTotal.toInt();
    final remain = item.upgradeLevelExp.toInt();
    final progress = total <= 0 ? 0.0 : ((total - remain).toDouble() / total).clamp(0.0, 1.0);

    return Container(
      color: AppColors.purple14102B,
      alignment: Alignment.topCenter,
      child: Container(
        width: 375.w,
        height: 300.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.giftWallLevelBg(level)),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.fromLTRB(32.w, 135.w, 37.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 1.w),
                  ),
                  child: Chimo.image(
                    avatar,
                    width: 48.w,
                    height: 48.w,
                    circle: true,
                    fallbackAsset: AppAssets.avatarPlace,
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 38.w,
                            height: 12.w,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Chimo.image(
                                  AppAssets.giftWallLevelNumBg,
                                  width: 38.w,
                                  height: 12.w,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  'Lv.$level',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Flexible(
                            child: Text(
                              name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ShaderMask(
                        shaderCallback: (rect) => _diamond.createShader(rect),
                        child: Text(
                          item.levelName,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.w),
            if (item.status == 2)
              Text('Level locked', style: TextStyle(color: AppColors.white50, fontSize: 10.sp)),
            if (item.status == 0)
              Text(
                '$remain XP to unlock this level',
                style: TextStyle(color: AppColors.white50, fontSize: 10.sp),
              ),
            if (item.status == 1 && max)
              Text('Max level reached', style: TextStyle(color: AppColors.white50, fontSize: 10.sp)),
            if (item.status == 1 && !max) ...[
              Text(
                '$remain experience points to the next level',
                style: TextStyle(color: AppColors.white50, fontSize: 10.sp),
              ),
              SizedBox(height: 6.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(2.w),
                child: SizedBox(
                  height: 4.w,
                  child: Stack(
                    children: [
                      const ColoredBox(color: AppColors.white20, child: SizedBox.expand()),
                      FractionallySizedBox(
                        widthFactor: progress,
                        child: const DecoratedBox(
                          decoration: BoxDecoration(gradient: _diamond),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6.w),
              Row(
                children: [
                  _count(item.receiveGift.toInt(), item.totalGift.toInt(), 'Gifts'),
                  _count(item.unlockCard.toInt(), item.totalCard.toInt(), 'Cards'),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _count(int min, int max, String title) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$min/$max',
            style: TextStyle(color: AppColors.white, fontSize: 13.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(width: 3.w),
          Text(title, style: TextStyle(color: AppColors.white50, fontSize: 10.sp)),
        ],
      ),
    );
  }
}
