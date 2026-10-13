import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/state/async_list_logic.dart';
import '../../../common/utils/app_toast.dart';

/// 交友标签页（forya `FriendWishPage`）：拉目录、按 id 保存。
///
/// 目录取数走 [AsyncListLogic] 那套三件套；这一层只加「选中态」和保存。
/// 「最多 6 个」的提示要插 `Overlay`，那是 View 的事 —— [toggle] 用返回值
/// 告诉页面「这次点没选上」，页面自己弹提示。
class MyTagsLogic extends AsyncListLogic<MakeFriendLabelRespEntry> {
  MyTagsLogic({this.initialSelected = const []});

  static const int maxTags = 6;
  static const int minTags = 1;

  /// 来自 `/user/info` 的 `makeFriendsLabel`（标签名，不是 id）。
  final List<String> initialSelected;

  final RxSet<int> selectedIds = <int>{}.obs;
  final RxBool saving = false.obs;

  @override
  Future<ApiResult<List<MakeFriendLabelRespEntry>>> fetch() => ChimoApis.user.makeFriendLabelList();

  @override
  String get failMessage => 'Load failed';

  @override
  String errorText(Object failure) => 'Load failed: $failure';

  /// 目录回来后按名字反查选中的 id（原页面在 `_loadCatalog` 尾部做这件事）。
  @override
  void onItemsChanged() {
    final initNames = initialSelected.map((e) => e.trim()).where((e) => e.isNotEmpty).toSet();
    final selected = <int>{};
    for (final item in items) {
      final keyId = labelIdFromRaw(item.name);
      final id = item.id.toInt();
      if (initNames.contains(item.name) ||
          (keyId != null && keyId == id) ||
          initNames.any((name) => labelIdFromRaw(name) == id)) {
        selected.add(id);
        if (selected.length >= maxTags) break;
      }
    }
    selectedIds
      ..clear()
      ..addAll(selected);
  }

  /// `tb_make_friends_label_name_12` → 12。后端有时回资源 key 而不是名字。
  static int? labelIdFromRaw(String raw) {
    final match = RegExp(r'tb_make_friends_label_name_(\d+)$').firstMatch(raw);
    return int.tryParse(match?.group(1) ?? '');
  }

  /// 选中的标签名，保存成功后回传给上一页。
  List<String> get selectedNames => [
    for (final item in items)
      if (selectedIds.contains(item.id.toInt())) item.name,
  ];

  /// 切换一个标签。返回 `false` = 已经选满 6 个，页面该弹「最多 6 个」提示。
  bool toggle(MakeFriendLabelRespEntry item) {
    final id = item.id.toInt();
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
      return true;
    }
    if (selectedIds.length >= maxTags) return false;
    selectedIds.add(id);
    return true;
  }

  Future<void> confirm() async {
    final message = await save();
    if (isClosed || message == null) return;
    AppToast.info(message);
  }

  /// 保存。返回 `null` = 成功（已经 `AppJumper.back` 回传标签名），
  /// 非 `null` = 要 toast 的文案。
  Future<String?> save() async {
    if (saving.value) return null;
    if (selectedIds.length < minTags) {
      return 'You must select at least $minTags tags.';
    }
    saving.value = true;
    try {
      final ids = selectedIds.toList(growable: false);
      final res = await ChimoApis.user.saveMakeFriendLabels(ids);
      if (isClosed) return null;
      if (!res.ok) {
        return res.message.isEmpty ? 'Save failed' : res.message;
      }
      // 名字要在 pop 之前取：pop 之后 Controller 就被回收了。
      final names = selectedNames;
      AppJumper.back(result: names);
      return null;
    } catch (failure) {
      if (isClosed) return null;
      return 'Save failed: $failure';
    } finally {
      if (!isClosed) saving.value = false;
    }
  }
}
