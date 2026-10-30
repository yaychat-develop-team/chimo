import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/base.pbenum.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/zodiac.dart';
import '../../chat/model/chat_conversation.dart';

/// 通讯录顶部 Tab：好友、关注、粉丝。
typedef FriendTab = ({String label, String emptyTitle, String searchHint});

/// 通讯录：好友（互关）/ 关注（我关注的）/ 粉丝（关注我的）。
class FriendsLogic extends GetxController {
  FriendsLogic({int initialTab = 0}) : tabIndex = initialTab.obs;

  /// 顺序即顶部从左到右。下标给跳转用：0 好友、1 关注、2 粉丝。
  static const tabs = <FriendTab>[
    (label: 'Friends', emptyTitle: 'No friends yet~', searchHint: 'Search for friends'),
    (label: 'Follow', emptyTitle: 'No follows yet~', searchHint: 'Search for follows'),
    (label: 'Followers', emptyTitle: 'No followers yet~', searchHint: 'Search for followers'),
  ];

  final RxInt tabIndex;
  final TextEditingController input = TextEditingController();
  final RxList<User> users = <User>[].obs;
  final RxBool loading = true.obs;
  final RxnString error = RxnString();

  Timer? _searchDebounce;

  @override
  void onInit() {
    super.onInit();
    input.addListener(_onInputChanged);
  }

  @override
  void onReady() {
    super.onReady();
    unawaited(load());
  }

  @override
  void onClose() {
    _searchDebounce?.cancel();
    input.removeListener(_onInputChanged);
    input.dispose();
    super.onClose();
  }

  void _onInputChanged() {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 350), () => unawaited(load()));
  }

  void selectTab(int next) {
    if (next == tabIndex.value) return;
    tabIndex.value = next;
    unawaited(load());
  }

  /// 按当前 Tab 和输入框关键字拉列表。下拉刷新、重试、切 Tab、搜索都走这里。
  Future<void> load() async {
    final keyword = input.text.trim();
    loading.value = true;
    error.value = null;
    try {
      final result = await switch (tabIndex.value) {
        1 => ChimoApis.relation.searchFollowing(keyword: keyword),
        2 => ChimoApis.relation.searchFans(keyword: keyword),
        _ => ChimoApis.relation.searchFriends(keyword: keyword),
      };
      users.assignAll(result.data ?? const []);
      if (!result.ok && users.isEmpty) {
        error.value = result.message.isEmpty ? 'Failed to load contacts' : result.message;
      }
    } catch (failure) {
      error.value = '$failure';
    } finally {
      loading.value = false;
    }
  }

  Future<void> follow(User user) async {
    try {
      final res = await ChimoApis.relation.follow(user.uid);
      if (!res.ok) {
        AppToast.error(res.message.isEmpty ? 'Follow failed' : res.message);
        return;
      }
      users.assignAll([
        for (final u in users)
          if (u.uid == user.uid) (u.deepCopy()..relationType = RelationType.FRIEND) else u,
      ]);
    } catch (failure) {
      AppToast.error('Follow failed: $failure');
    }
  }

  void openProfile(User user) {
    unawaited(AppJumper.toProfile(user.uid, preview: user));
  }

  void openChat(User user) {
    final em = user.emUsername.trim();
    final conversation = ChatConversation(
      id: em.isNotEmpty ? 'dm_$em' : 'dm_${user.uid}',
      title: user.nickname,
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: '',
      timeLabel: 'Just',
      isMale: user.male,
      signature: user.personalSignature,
      zodiac: user.birthday.trim().isEmpty ? '' : Zodiac.fromBirthday(user.birthday),
      isFollowing: user.following,
      momentAssets: user.approvedPics,
      avatarUrl: user.avatar.trim().isEmpty ? null : user.avatar,
      emUserName: em,
    );
    unawaited(AppJumper.toChat(conversation.id, preview: conversation));
  }
}
