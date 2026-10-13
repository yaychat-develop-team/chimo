import 'dart:async';

import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/base.pbenum.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/zodiac.dart';
import '../model/friends_tab.dart';
import '../../chat/model/chat_conversation.dart';

/// 通讯录：好友（互关）/ 关注（我关注的）/ 粉丝（关注我的）。
///
/// **没有继承 `AsyncListLogic`**：这一页的取数带关键字，而且失败规则是特例
/// —— 无关键字时接口失败按空列表处理（对齐 forya `FanModel`，不弹
/// "System error."），`!ok` 时也照样把 `data` 铺上去。硬套那个壳反而要一路改写。
///
/// 搜索框的 `TextEditingController` 留在 View（widget 的东西），
/// 这里只收它给的文本：[onSearchChanged]。
class FriendsLogic extends GetxController {
  FriendsLogic({FriendsTab initialTab = FriendsTab.friends}) : tab = initialTab.obs;

  final Rx<FriendsTab> tab;
  final RxList<User> users = <User>[].obs;

  /// 本地过滤用的小写关键字（跟着输入实时变）。
  final RxString query = ''.obs;

  /// 首帧就是加载中（原页面 `bool _loading = true`）。
  final RxBool loading = true.obs;
  final RxnString error = RxnString();

  /// 发给接口的关键字（原样，不小写）。跟着输入框走 —— 和 [load] 的
  /// `keyword` 参数分开命名，免得一个遮住另一个。
  String searchKeyword = '';

  Timer? _searchDebounce;

  @override
  void onReady() {
    super.onReady();
    // onReady = 首帧之后，等价于原页面 initState 里的 addPostFrameCallback。
    unawaited(load());
  }

  @override
  void onClose() {
    _searchDebounce?.cancel();
    super.onClose();
  }

  String get emptyTitle => switch (tab.value) {
    FriendsTab.friends => 'No friends yet~',
    FriendsTab.follow => 'No follows yet~',
    FriendsTab.followers => 'No followers yet~',
  };

  String get searchHint => switch (tab.value) {
    FriendsTab.friends => 'Search for friends',
    FriendsTab.follow => 'Search for follows',
    FriendsTab.followers => 'Search for followers',
  };

  List<User> get filtered {
    final q = query.value;
    if (q.isEmpty) return users.toList(growable: false);
    return users
        .where((u) => u.nickname.toLowerCase().contains(q) || u.uid.contains(q))
        .toList(growable: false);
  }

  /// 输入框变化：本地过滤立刻生效，接口 350ms 防抖后再打。
  void onSearchChanged(String text) {
    searchKeyword = text.trim();
    query.value = searchKeyword.toLowerCase();
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      unawaited(load(keyword: searchKeyword));
    });
  }

  /// 下拉刷新：用输入框里现有的关键字重拉（原页面就是这么传的）。
  Future<void> reload() => load(keyword: searchKeyword);

  void selectTab(FriendsTab next) {
    if (next == tab.value) return;
    tab.value = next;
    unawaited(load(keyword: searchKeyword));
  }

  Future<void> load({String keyword = ''}) async {
    loading.value = true;
    error.value = null;
    try {
      // 对齐 forya：按 Tab 直拉对应接口，避免合并三张图时粉丝被滤空。
      final res = switch (tab.value) {
        FriendsTab.friends => ChimoApis.relation.searchFriends(keyword: keyword),
        FriendsTab.follow => ChimoApis.relation.searchFollowing(keyword: keyword),
        FriendsTab.followers => ChimoApis.relation.searchFans(keyword: keyword),
      };
      final result = await res;
      if (isClosed) return;

      users.assignAll(result.data ?? const []);
      loading.value = false;
      // 对齐 forya FanModel：无关键字时接口失败按空列表，不展示 "System error."。
      if (!result.ok && users.isEmpty && keyword.trim().isNotEmpty) {
        error.value = result.message.isEmpty ? 'Failed to load contacts' : result.message;
      }
    } catch (failure) {
      if (isClosed) return;
      loading.value = false;
      error.value = '$failure';
    }
  }

  /// 回关。返回 `null` = 成功（列表已就地改成互关），非 `null` = 要 toast 的文案。
  Future<String?> followBack(User user) async {
    try {
      final res = await ChimoApis.relation.follow(user.uid);
      if (isClosed) return null;
      if (!res.ok) {
        return res.message.isEmpty ? 'Follow failed' : res.message;
      }
      users.assignAll([
        for (final u in users)
          if (u.uid == user.uid) (u.deepCopy()..relationType = RelationType.FRIEND) else u,
      ]);
      return null;
    } catch (failure) {
      if (isClosed) return null;
      return 'Follow failed: $failure';
    }
  }

  Future<void> follow(User user) async {
    final message = await followBack(user);
    if (isClosed || message == null) return;
    AppToast.error(message);
  }

  // BuildContext，所以不必留在 View。

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
