import 'dart:async';

import 'package:chimo/app/session_info.dart';
import 'package:get/get.dart';

import 'package:fixnum/fixnum.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/storage/app_storage.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/extensions/wire_view.dart';
import '../../../common/models/server_client/base.pbenum.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/utils/zodiac.dart';
import '../../chat/logic/dm_entry.dart';
import '../../chat/model/chat_conversation.dart';
import '../model/search_user.dart';

/// 首页搜索（按 ID 搜人）的取数与历史记录。
///
/// **留在 View 的**：`TextEditingController` / `FocusNode`，以及「收起键盘」这个
/// 动作 —— 它要 `BuildContext`，所以走 [onUnfocus] 钩子回调到 View（同 的
/// `onScrollToBottom`）。收键盘的时机很讲究：ID 不合法那条分支是**不收**的。
class HomeSearchLogic extends GetxController {
  final RxList<String> history = <String>[].obs;
  final RxBool editingHistory = false.obs;
  final Rxn<SearchUser> result = Rxn<SearchUser>();
  final RxBool hasSearched = false.obs;
  final RxBool searching = false.obs;

  String? get selfUserId => SessionInfo.uid.toString();
  Timer? _searchDebounce;
  int _searchSeq = 0;

  /// 由 View 挂上：收起键盘（`FocusScope.of(context).unfocus()`）。
  void Function()? onUnfocus;

  /// 与 forya `searchHistoryKey` 一致。
  static const _historyKey = 'searchHistoryKey';
  static final RegExp _idPattern = RegExp(r'^\d{5,}$');

  @override
  void onReady() {
    super.onReady();
    loadHistory();
  }

  @override
  void onClose() {
    _searchDebounce?.cancel();
    onUnfocus = null;
    super.onClose();
  }

  void loadHistory() {
    final saved = AppStorage.settings?.get(_historyKey);
    if (saved is! List || saved.isEmpty || isClosed) return;
    history.assignAll(saved.whereType<String>());
  }

  Future<void> persistHistory() async {
    await AppStorage.settings?.put(_historyKey, List<String>.from(history));
  }

  void addHistory(String query) {
    history.remove(query);
    history.insert(0, query);
    if (history.length > 20) {
      history.removeRange(20, history.length);
    }
    unawaited(persistHistory());
  }


  /// 输入框内容变化（View 的 listener 里调）。
  void onInputChanged(String text) {
    final query = text.trim();
    _searchDebounce?.cancel();

    if (editingHistory.value) {
      exitEditHistory();
    }

    // Forya：输入节流搜索（约 500ms）。输入不完整 ID 时不弹 toast；
    // 仅当 ID 看起来完整时才自动搜索。
    if (query.isEmpty || !isValidId(query)) {
      result.value = null;
      hasSearched.value = false;
      searching.value = false;
      return;
    }

    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      unawaited(runSearch(query, unfocus: false, showInvalidToast: false));
    });
  }

  void enterEditHistory() {
    if (history.isEmpty) return;
    onUnfocus?.call();
    editingHistory.value = true;
    result.value = null;
    hasSearched.value = false;
  }

  void exitEditHistory() {
    editingHistory.value = false;
  }

  void clearAllHistory() {
    history.clear();
    editingHistory.value = false;
    unawaited(persistHistory());
  }

  void removeHistoryItem(String item) {
    history.remove(item);
    if (history.isEmpty) editingHistory.value = false;
    unawaited(persistHistory());
  }

  /// 清空输入：View 负责清 `TextEditingController` 与重新聚焦。
  void clearInput() {
    _searchDebounce?.cancel();
    result.value = null;
    hasSearched.value = false;
    editingHistory.value = false;
    searching.value = false;
  }

  bool isValidId(String query) => _idPattern.hasMatch(query);

  SearchUser fromUser(User u) {
    return SearchUser(
      id: 'dm_${u.uid}',
      nickname: u.nickname,
      userId: u.uid,
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: u.avatar.trim().isEmpty ? null : u.avatar,
      isMale: u.male,
      age: u.age,
      momentAssets: u.approvedPics,
      relation: u.following ? SearchRelation.following : SearchRelation.notFollowing,
      emUsername: u.emUsername,
      zodiac: u.birthday.trim().isEmpty ? '' : Zodiac.fromBirthday(u.birthday),
      bio: u.personalSignature,
      hasGender: u.genderKnown,
    );
  }

  SearchUser fromMsg(MsgListUserItem u) {
    final id = u.id.toString();
    return SearchUser(
      id: 'dm_$id',
      nickname: u.nickname,
      userId: id,
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: u.avatar.trim().isEmpty ? null : u.avatar,
      isMale: _male(u.gender),
      age: u.age,
      relation: u.isFollow ? SearchRelation.following : SearchRelation.notFollowing,
      emUsername: u.emUsername,
      zodiac: u.birthday.trim().isEmpty ? '' : Zodiac.fromBirthday(u.birthday),
      hasGender: _genderKnown(u.gender),
    );
  }

  bool _genderKnown(String gender) {
    switch (gender.toLowerCase()) {
      case 'female':
      case 'f':
      case '2':
      case 'male':
      case 'm':
      case '1':
        return true;
      default:
        return false;
    }
  }

  bool _male(String gender) {
    switch (gender.toLowerCase()) {
      case 'female':
      case 'f':
      case '2':
        return false;
      default:
        return true;
    }
  }

  Future<void> submit(String raw) async {
    _searchDebounce?.cancel();
    await runSearch(raw.trim(), unfocus: true, showInvalidToast: true);
  }

  Future<void> runSearch(
    String query, {
    required bool unfocus,
    required bool showInvalidToast,
  }) async {
    if (query.isEmpty) return;

    if (editingHistory.value) {
      exitEditHistory();
    }

    if (!isValidId(query)) {
      result.value = null;
      hasSearched.value = false;
      searching.value = false;
      if (showInvalidToast) {
        AppToast.info('Search by correct ID');
      }
      return;
    }

    // ⚠️ 收键盘必须在「ID 不合法」那条 return 之后 —— 原版就是这个顺序，
    // 提前收会把「边输边改」的输入法状态打断。
    if (unfocus) {
      onUnfocus?.call();
    }

    final seq = ++_searchSeq;
    searching.value = true;
    hasSearched.value = true;
    result.value = null;

    try {
      // forya：首页用 `/search?no=`；`searchUser` 搜自己会 System error。
      final homeRes = await ChimoApis.relation.homeSearch(query);
      if (isClosed || seq != _searchSeq) return;

      SearchUser? hit;
      if (homeRes.ok) {
        final users = homeRes.data ?? const <MsgListUserItem>[];
        for (final u in users) {
          if (u.id.toString() == query) {
            hit = fromMsg(u);
            break;
          }
        }
        hit ??= users.isEmpty ? null : fromMsg(users.first);
      } else {
        final legacy = await ChimoApis.relation.searchUsers(query);
        if (isClosed || seq != _searchSeq) return;
        if (legacy.ok) {
          final users = legacy.data ?? const <User>[];
          for (final u in users) {
            if (u.uid == query) {
              hit = fromUser(u);
              break;
            }
          }
          hit ??= users.isEmpty ? null : fromUser(users.first);
        } else if (selfUserId != query) {
          searching.value = false;
          AppToast.info(
            homeRes.message.isEmpty
                ? (legacy.message.isEmpty ? 'Search failed' : legacy.message)
                : homeRes.message,
          );
          return;
        }
      }

      if (hit != null && selfUserId != null && hit.userId == selfUserId) {
        hit = hit.copyWith(relation: SearchRelation.self);
      }

      // forya：仅在搜索有命中时写入历史。
      if (hit != null) {
        addHistory(query);
      }

      result.value = hit;
      searching.value = false;
    } catch (error) {
      if (isClosed || seq != _searchSeq) return;
      searching.value = false;
      AppToast.info('Search failed: $error');
    }
  }


  /// 点历史词。View 已把输入框文本改成 [item]（会触发 listener 的防抖），
  /// 所以这里要再取消一次再立即搜 —— 原版两次 `cancel()` 就是这个意思。
  void onHistoryTap(String item) {
    if (editingHistory.value) return;
    _searchDebounce?.cancel();
    unawaited(runSearch(item, unfocus: true, showInvalidToast: true));
  }

  /// 输入框文本被外部改写前先取消防抖（[onHistoryTap] 的前半段）。
  void cancelDebounce() => _searchDebounce?.cancel();

  Future<void> follow(SearchUser user) async {
    result.value = user.copyWith(relation: SearchRelation.following);
    try {
      final res = await ChimoApis.relation.follow(user.userId);
      if (isClosed) return;
      if (!res.ok) {
        result.value = user.copyWith(relation: SearchRelation.notFollowing);
        AppToast.info(res.message.isEmpty ? 'Follow failed' : res.message);
      }
    } catch (error) {
      if (isClosed) return;
      result.value = user.copyWith(relation: SearchRelation.notFollowing);
      AppToast.info('Follow failed: $error');
    }
  }

  void openProfile(SearchUser user) {
    onUnfocus?.call();
    final profile = User()
      ..id = Int64(int.tryParse(user.userId) ?? 0)
      ..nickname = user.nickname
      ..avatar = user.avatarUrl ?? ''
      ..gender = !user.hasGender ? '' : (user.isMale ? 'male' : 'female')
      ..age = user.age
      ..personalSignature = user.bio
      ..emUsername = user.emUsername
      ..relationType = user.relation == SearchRelation.following
          ? RelationType.FOLLOW
          : RelationType.NONE;
    AppJumper.toProfile(user.userId, preview: profile);
  }

  void openChat(SearchUser user) {
    onUnfocus?.call();
    final em = user.emUsername.trim();
    final conversation = ChatConversation(
      id: em.isNotEmpty ? 'dm_$em' : (user.id.startsWith('dm_') ? user.id : 'dm_${user.id}'),
      title: user.nickname,
      avatarAsset: user.avatarAsset,
      avatarUrl: user.avatarUrl,
      lastMessage: '',
      timeLabel: 'Just',
      isMale: user.isMale,
      isFollowing: true,
      momentAssets: user.momentAssets,
      emUserName: em,
      signature: user.bio,
      zodiac: user.zodiac,
    );
    DmEntry.open(conversation);
  }
}
