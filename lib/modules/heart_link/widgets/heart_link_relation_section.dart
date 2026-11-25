import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/session_info.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/heart_link.pb.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/chimo.dart';
import '../../chat/logic/chats_list_logic.dart';
import '../../chat/model/conversation_model.dart';

/// 个人主页 Hearties 关系区。对齐 joyride `HeartLinkRelationWidget`。
class HeartLinkRelationSection extends StatelessWidget {
  const HeartLinkRelationSection({super.key, required this.uid, required this.data});

  final int uid;
  final HeartiesQueryRsp? data;

  bool get _isMine => uid > 0 && uid == SessionInfo.uid;

  bool get _hasData {
    final rsp = data;
    if (rsp == null) return false;
    if (_isMine) return rsp.hearties.isNotEmpty;
    return rsp.hasYourHearties();
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasData) return const SizedBox.shrink();
    return Container(
      height: 116,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.pinkFC5CC6.withValues(alpha: 0.35),
            AppColors.auctionActorScore.colors.last.withValues(alpha: 0.25),
          ],
        ),
        border: Border.all(color: AppColors.pinkFC5CC6.withValues(alpha: 0.4)),
      ),
      child: Column(
        children: [
          Container(
            height: 32,
            alignment: Alignment.center,
            color: AppColors.pinkFC5CC6.withValues(alpha: 0.3),
            child: Text(
              _isMine ? 'My Hearties' : 'Heartie',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(child: _isMine ? _mine() : _other()),
        ],
      ),
    );
  }

  Widget _mine() {
    final list = data!.hearties;
    return ListView.builder(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 8),
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final user = list[index].user;
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 20),
          child: _item(avatar: user.avatar, name: user.nickname, uid: user.id.toInt()),
        );
      },
    );
  }

  Widget _other() {
    final peer = data!.yourHearties.user;
    final me = SessionInfo.currentUser;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _item(avatar: me?.avatar ?? '', name: me?.nickname ?? '', uid: SessionInfo.uid),
          const Icon(Icons.favorite, color: AppColors.pinkFC5CC6, size: 28),
          _item(avatar: peer.avatar, name: peer.nickname, uid: peer.id.toInt()),
        ],
      ),
    );
  }

  Widget _item({required String avatar, required String name, required int uid}) {
    return GestureDetector(
      onTap: () {
        if (uid <= 0) return;
        AppJumper.toProfile('$uid');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Chimo.image(
              avatar,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              fallbackAsset: AppAssets.avatarPlace,
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            width: 54,
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

/// 会话列表顶部 My Heartie 横滑。对齐产品 §10.1（含未读气泡）。
class HeartLinkChatsStrip extends StatefulWidget {
  const HeartLinkChatsStrip({super.key});

  @override
  State<HeartLinkChatsStrip> createState() => _HeartLinkChatsStripState();
}

class _HeartLinkChatsStripState extends State<HeartLinkChatsStrip> {
  List<HeartiesInfo> _list = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final uid = SessionInfo.uid;
    if (uid <= 0) return;
    final result = await ChimoApis.heartLink.getHearties(uid);
    if (!mounted || !result.ok || result.data == null) return;
    setState(() => _list = result.data!.hearties.toList());
  }

  int _unreadOf(User user) {
    if (!Get.isRegistered<ConversationListLogic>()) return 0;
    final chats = Get.find<ConversationListLogic>();
    final em = user.emUsername.trim();
    final uid = '${user.id.toInt()}';
    for (final c in chats.conversations) {
      if (em.isNotEmpty && c.emUserName.trim() == em) return c.unreadCount;
      if (uid != '0' && c.appUid.trim() == uid) return c.unreadCount;
      if (em.isNotEmpty && c.id == 'dm_$em') return c.unreadCount;
      if (uid != '0' && c.id == 'dm_$uid') return c.unreadCount;
    }
    return 0;
  }

  void _openChat(User user) {
    final em = user.emUsername.trim();
    final conversation = ConversationModel(
      id: em.isNotEmpty ? 'dm_$em' : 'dm_${user.uid}',
      title: user.nickname,
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: '',
      timeLabel: 'Just',
      isMale: user.male,
      avatarUrl: user.avatar.trim().isEmpty ? null : user.avatar,
      emUserName: em,
      appUid: '${user.id.toInt()}',
    );
    if (Get.isRegistered<ConversationListLogic>()) {
      Get.find<ConversationListLogic>().upsertPrivateChat(conversation);
    }
    AppJumper.toChat(conversation.id, preview: conversation);
  }

  @override
  Widget build(BuildContext context) {
    if (_list.isEmpty) return const SizedBox.shrink();
    return GetBuilder<ConversationListLogic>(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 6),
              child: Text(
                'My Heartie',
                style: TextStyle(color: AppColors.white, fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 78,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  final user = _list[index].user;
                  final unread = _unreadOf(user);
                  return GestureDetector(
                    onTap: () => _openChat(user),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.pinkFC5CC6, width: 1.5),
                                ),
                                child: ClipOval(
                                  child: Chimo.image(
                                    user.avatar,
                                    width: 48,
                                    height: 48,
                                    fit: BoxFit.cover,
                                    fallbackAsset: AppAssets.avatarPlace,
                                  ),
                                ),
                              ),
                              if (unread > 0)
                                Positioned(
                                  right: -2,
                                  top: -2,
                                  child: Container(
                                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.redFD4B4B,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      unread > 99 ? '99+' : '$unread',
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: 56,
                            child: Text(
                              user.nickname,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: AppColors.white70, fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
