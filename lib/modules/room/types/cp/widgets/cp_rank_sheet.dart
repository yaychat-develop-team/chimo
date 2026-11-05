import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/app_jumper.dart';
import '../../../../../app/chimo_api.dart';
import '../../../../../common/constants/app_assets.dart';
import '../../../../../common/models/server_client/room_cp.pb.dart';
import '../../../../../common/theme/app_bottom_sheet.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/app_toast.dart';
import '../../../../../common/utils/chimo.dart';
import '../../../../../common/widgets/app_image.dart';
import '../../../../../common/widgets/app_pull_refresh.dart';

/// 心动榜 Heart Rank。布局对齐 Cosmic Lounge 设计图。
///
/// 顶部翅膀头图参考 [CpRelationSheet]；列表行为双头像叠心 + 双昵称。
class CpRankSheet extends StatefulWidget {
  const CpRankSheet({super.key});

  static Future<void> show() {
    return AppBottomSheet.show<void>(isScrollControlled: true, child: const CpRankSheet());
  }

  @override
  State<CpRankSheet> createState() => _CpRankSheetState();
}

class _CpRankSheetState extends State<CpRankSheet> {
  static double get _wingH => 150.w;
  static double get _avatarSize => 54.w;

  static const _nameTop = Color(0xFF8B69F6);
  static const _nameBottom = Color(0xFFEC6E96);
  static const _rankPink = Color(0xFFFF547E);
  static const _scoreBrown = Color(0xFFB25632);
  static const _rowBg = Color(0x33FFB6D0);

  List<CPHeartRankItem> _rankList = [];
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData({bool silent = false}) async {
    if (!silent) setState(() => _loading = true);
    final result = await ChimoApis.cp.heartRank();
    if (!mounted) return;
    setState(() {
      _loading = false;
      _rankList = result.ok ? result.data?.rankList.toList() ?? [] : [];
    });
    if (!result.ok) {
      AppToast.error(result.message.isEmpty ? 'Load failed' : result.message);
    }
  }

  /// 设计稿：≥1万用 `13.56w`，否则原值。
  String _heart(int value) {
    if (value >= 10000) return '${(value / 10000).toStringAsFixed(2)}w';
    return '$value';
  }

  String _nick(String name) {
    if (name.isEmpty) return ' ';
    return name.length <= 6 ? name : '${name.substring(0, 6)}…';
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.75;
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Container(
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(child: Chimo.image(AppAssets.cpHeartRankBg, fit: BoxFit.cover)),
          Column(
            children: [
              SizedBox(height: 16.w),
              Text(
                'Heart Rank',
                style: TextStyle(
                  color: AppColors.black111111,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    if (_rankList.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 8.w, 16.w, 0),
                        child: _rankNo1Card(_rankList.first),
                      ),
                    Expanded(
                      child: AppPullRefresh.list(
                        onRefresh: () => _loadData(silent: true),
                        accentColor: _rankPink,
                        padding: EdgeInsets.fromLTRB(16.w, 6.w, 16.w, 16.w + bottom),
                        itemCount: _rankList.skip(1).length,
                        empty: _loading
                            ? const Center(child: CupertinoActivityIndicator(color: _rankPink))
                            : Center(
                                child: TextButton(
                                  onPressed: _loadData,
                                  child: const Text(
                                    'No data\nRetry',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: _rankPink),
                                  ),
                                ),
                              ),
                        itemBuilder: (context, index) => _rankItem(index + 2, _rankList[index + 1]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// NO.1：翅膀 + 皇冠 + 双头像粉条昵称 + 金条心动值。
  Widget _rankNo1Card(CPHeartRankItem item) {
    return SizedBox(
      height: _wingH,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Chimo.image(
              AppAssets.cpWingCard,
              width: double.infinity,
              height: _wingH,
              fit: BoxFit.fitHeight,
            ),
          ),
          // 双头像（叠在翅膀中央心形上）
          Positioned(
            bottom: 30.w,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _topUser(item.from),
                  Chimo.gap(width: 4.w),
                  _topUser(item.to),
                ],
              ),
            ),
          ),
          // 冠军皇冠：贴在双头像上方缺口
          Positioned(
            top: 18.w,
            child: Chimo.image(AppAssets.cpRankNo1, height: 32.w, fit: BoxFit.fitHeight),
          ),
          // 金条心动值
          Positioned(
            top: _wingH - 28.w,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                _heart(item.heart.toInt()),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _scoreBrown,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  height: 1,
                  shadows: [Shadow(color: Colors.white.withValues(alpha: 0.55), blurRadius: 2)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topUser(RankUser user) {
    return GestureDetector(
      onTap: () => AppJumper.showUserProfileSheet(
        uid: '${user.id}',
        name: user.nickname,
        avatar: user.avatar,
      ),
      child: SizedBox(
        width: _avatarSize,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: _avatarSize,
              height: _avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFFFD56A), width: 2),
              ),
              child: AppImage.avatar(user.avatar, size: _avatarSize - 4.w),
            ),
            Transform.translate(
              offset: Offset(0, -8.w),
              child: Container(
                constraints: BoxConstraints(maxWidth: _avatarSize + 12.w),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: const LinearGradient(colors: [Color(0xFFFF7AB8), Color(0xFFFF4D9A)]),
                ),
                child: Text(
                  _nick(user.nickname),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 2+：排名 | 叠头像+心 | 双昵称 | 心动值
  Widget _rankItem(int rank, CPHeartRankItem item) {
    return Container(
      height: 64.w,
      margin: EdgeInsets.only(bottom: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(36.r), color: _rowBg),
      child: Row(
        children: [
          SizedBox(
            width: 28.w,
            child: Text(
              '$rank',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _rankPink,
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
                height: 1,
              ),
            ),
          ),
          SizedBox(width: 4.w),
          _pairAvatars(item.from, item.to),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _nameLine(item.from.nickname, _nameTop),
                SizedBox(height: 4.w),
                _nameLine(item.to.nickname, _nameBottom),
              ],
            ),
          ),
          Chimo.image(AppAssets.cpRankLoveIcon, width: 14, height: 12),
          SizedBox(width: 4.w),
          Text(
            _heart(item.heart.toInt()),
            style: TextStyle(
              color: _rankPink,
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _nameLine(String name, Color color) {
    return UnconstrainedBox(
      child: Container(
        height: 17.w,
        alignment: Alignment.center,
        child: Text(
          _nick(name),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: color,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            height: 1.15,
          ),
        ),
      ),
    );
  }

  Widget _pairAvatars(RankUser from, RankUser to) {
    final size = 42.w;
    return SizedBox(
      width: size * 2,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [_tapAvatar(from, size), _tapAvatar(to, size)],
          ),
          Positioned(
            bottom: 8.w,
            child: Chimo.image(AppAssets.cpRankLoveImg, height: 18.w, fit: BoxFit.fitHeight),
          ),
        ],
      ),
    );
  }

  Widget _tapAvatar(RankUser user, double size) {
    return GestureDetector(
      onTap: () => AppJumper.showUserProfileSheet(
        uid: '${user.id}',
        name: user.nickname,
        avatar: user.avatar,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white, width: 1.5),
        ),
        child: AppImage.avatar(user.avatar, size: size - 3.w),
      ),
    );
  }
}
