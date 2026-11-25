import 'package:chimo/common/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/session_info.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/heart_link.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/chimo.dart';
import '../../../common/utils/zodiac.dart';
import '../../../common/widgets/gender_age_chip.dart';
import '../widgets/reveal_card_cd_player.dart';
import 'video_preview_page.dart';

/// Reveal Card 详情 / 预览。对齐 Cosmic 设计图 + oumi `SecretCardPage` 分区。
class RevealCardPreviewPage extends StatelessWidget {
  const RevealCardPreviewPage({super.key, required this.data});

  final HeartLinkCard data;

  User get _user {
    if (data.hasUser() && data.user.id.toInt() > 0) return data.user;
    return SessionInfo.currentUser ?? User();
  }

  String get _heroUrl {
    // 对齐 oumi：头图用 photo.first，详情区用 photo.last，避免同一张重复展示。
    if (data.photo.isNotEmpty) {
      final url = data.photo.first.url.trim();
      if (url.isNotEmpty) return url;
    }
    if (data.hasVideo()) {
      final cover = data.video.cover.trim();
      return cover.isNotEmpty ? cover : data.video.url;
    }
    return _user.avatar;
  }

  /// 详情「Her photo」只展示最后一张（第二张），与头图区分。
  String get _detailPhotoUrl {
    if (data.photo.isEmpty) return '';
    final url = data.photo.last.url.trim();
    if (url.isNotEmpty) return url;
    return data.photo.last.cover.trim();
  }

  /// 顶部缩略图用第二张（有则），与弹层 photo thumb 一致。
  String get _thumbPhotoUrl {
    if (data.photo.length > 1) {
      final url = data.photo[1].url.trim();
      if (url.isNotEmpty) return url;
    }
    return _detailPhotoUrl;
  }

  String get _videoCover {
    if (!data.hasVideo()) return '';
    final cover = data.video.cover.trim();
    return cover.isNotEmpty ? cover : data.video.url;
  }

  String get _bio {
    final job = data.occupation.trim();
    final status = data.emotionalState.trim();
    if (job.isEmpty && status.isEmpty) return '';
    if (job.isEmpty) return status;
    if (status.isEmpty) return job;
    return '$job | $status';
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.black0F0F0F,
      extendBody: true,
      appBar: const AppNavBar(title: 'Her Reveal Card'),
      body: ListView(
        padding: EdgeInsets.only(bottom: 32 + MediaQuery.paddingOf(context).bottom),
        children: [
          _buildHero(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.rgba(17, 17, 29, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (data.hasVideo() && data.video.url.isNotEmpty) ...[
                  _sectionTitle('Her video'),
                  _videoCard(),
                ],
                if (_detailPhotoUrl.isNotEmpty) ...[_sectionTitle('Her photo'), _photoCard()],
                if (data.hasAudio() && data.audio.url.isNotEmpty) ...[
                  _sectionTitle('Her voice'),
                  RevealCardCdPlayer(
                    url: data.audio.url,
                    seconds: data.audio.duration,
                    avatar: _user.avatar,
                  ),
                ],
                _sectionTitle('About her'),
                _aboutTags(),
                if (data.interest.isNotEmpty) ...[
                  _sectionTitle('Hobbies and Interests'),
                  _hobbyTags(),
                ],
                if (data.telegram.trim().isNotEmpty) ...[
                  _sectionTitle('Telegram'),
                  _telegramChip(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero() {
    final name = _user.nickname.trim().isEmpty ? 'User' : _user.nickname.trim();
    final age = _user.age > 0 ? _user.age : Zodiac.age(_user.birthday);
    return SizedBox(
      height: 520.w,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Chimo.image(_heroUrl, fit: BoxFit.cover, fallbackAsset: AppAssets.avatarPlace),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.transparent, AppColors.black60, AppColors.black0F0F0F],
                stops: [0.35, 0.72, 1],
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (age > 0) ...[
                      const SizedBox(width: 6),
                      GenderAgeChip(isMale: _user.male, age: age),
                    ],
                  ],
                ),
                if (_bio.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(_bio, style: const TextStyle(color: AppColors.white70, fontSize: 13)),
                ],
                if (data.telegram.trim().isNotEmpty) ...[
                  const SizedBox(height: 10),
                  _telegramChip(compact: true),
                ],
                const SizedBox(height: 14),
                _miniThumbs(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniThumbs() {
    final items = <Widget>[];
    if (data.hasVideo() && data.video.url.isNotEmpty) {
      items.add(
        _miniThumb(
          url: _videoCover,
          onTap: () => Get.to(() => VideoPreviewPage(url: data.video.url)),
          badge: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.play_arrow_rounded, size: 10, color: AppColors.white),
              const SizedBox(width: 2),
              Text(
                _fmt(data.video.duration),
                style: const TextStyle(color: AppColors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      );
    }
    if (_thumbPhotoUrl.isNotEmpty) {
      items.add(_miniThumb(url: _thumbPhotoUrl));
    }
    if (data.hasAudio() && data.audio.url.isNotEmpty) {
      items.add(RevealCardAudioCd(avatar: _user.avatar, compact: true));
    }
    if (items.isEmpty) return const SizedBox.shrink();
    final children = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      if (i > 0) children.add(const SizedBox(width: 8));
      children.add(items[i]);
    }
    return Row(children: children);
  }

  Widget _miniThumb({required String url, VoidCallback? onTap, Widget? badge, Widget? overlay}) {
    final child = ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 72.w,
        height: 72.w,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Chimo.image(url, fit: BoxFit.cover, fallbackAsset: AppAssets.avatarPlace),
            ?overlay,
            if (badge != null) Positioned(right: 4, bottom: 4, child: badge),
          ],
        ),
      ),
    );
    if (onTap == null) return child;
    return GestureDetector(onTap: onTap, child: child);
  }

  Widget _sectionTitle(String title) {
    return Container(
      padding: EdgeInsets.only(top: 28.w, bottom: 16.w),
      child: Text(
        title,
        style: const TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _videoCard() {
    return GestureDetector(
      onTap: () => Get.to(() => VideoPreviewPage(url: data.video.url)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: 343 / 609,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Chimo.image(_videoCover, fit: BoxFit.cover, fallbackAsset: AppAssets.avatarPlace),
              Center(
                child: Chimo.image(
                  AppAssets.roundPlayIcon,
                  width: 48.w,
                  height: 48.w,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _photoCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 343 / 609,
        child: Chimo.image(
          _detailPhotoUrl,
          fit: BoxFit.cover,
          fallbackAsset: AppAssets.avatarPlace,
        ),
      ),
    );
  }

  Widget _aboutTags() {
    final zodiac = Zodiac.fromBirthday(_user.birthday);
    final tags = <Widget>[];
    if (zodiac.isNotEmpty) {
      tags.add(_aboutChip(zodiac, AppAssets.tagZodiac, const Color(0x33F9EDFF)));
    }
    if (_user.height > 0) {
      tags.add(_aboutChip('${_user.height} inch', AppAssets.tagHeight, const Color(0x33FFF3E0)));
    }
    if (_user.weight > 0) {
      tags.add(_aboutChip('${_user.weight} lb', AppAssets.tagWeight, const Color(0x33E8FFE9)));
    }
    if (tags.isEmpty) {
      return Text('-', style: TextStyle(color: AppColors.white50, fontSize: 13));
    }
    return Wrap(spacing: 10, runSpacing: 8, children: tags);
  }

  Widget _aboutChip(String text, String icon, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(shape: const StadiumBorder(), color: bg),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chimo.image(icon, width: 16, height: 16),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: AppColors.white, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _hobbyTags() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: data.interest
          .map(
            (item) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const ShapeDecoration(shape: StadiumBorder(), color: AppColors.white12),
              child: Text(item, style: const TextStyle(color: AppColors.white, fontSize: 12)),
            ),
          )
          .toList(),
    );
  }

  Widget _telegramChip({bool compact = false}) {
    final text = data.telegram.trim();
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(0, 0, compact ? 0 : 16, compact ? 0 : 28),
      child: UnconstrainedBox(
        child: Container(
          height: 28,
          padding: const EdgeInsets.only(right: 12),
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: AppColors.white.withValues(alpha: 0.1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Chimo.image(AppAssets.telegramIcon, height: 28, fit: BoxFit.fitHeight),
              const SizedBox(width: 6),
              if (!compact)
                const Text('Telegram: ', style: TextStyle(color: AppColors.white70, fontSize: 12)),
              Text(
                text,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: text));
                  AppToast.success('Copied');
                },
                child: Chimo.image(
                  AppAssets.mineCopy,
                  width: 12,
                  height: 12,
                  color: AppColors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _fmt(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}
