import 'dart:async';

import 'package:get/get.dart';

import '../../app/network/http/api_result.dart';

/// 「拉一次列表，画出来」这类页面的公共壳。
/// 子类只回答一个问题：数据从哪个接口来。
///
/// ```dart
/// class VisitsLogic extends AsyncListLogic<VisitRecord> {
/// @override
/// Future<ApiResult<List<VisitRecord>>> fetch => AppApis.relation.viewedBy;
/// @override
/// String get failMessage => 'Failed to load visits';
/// }
/// ```
///
/// **为什么不是 get 自带的 `StateMixin` / `RxStatus`**：
/// `StateMixin` 的 `state` / `status` getter 走 `notifyChildrens`，那是
/// `SimpleBuilder` / `GetBuilder` 用的 `Notifier` 通道；本项目用的是 `Obx`，
/// 走 `RxNotifier`（`RxInterface.notifyChildren`）。
/// 两条通道不互通 —— 在 `Obx` 里读 `controller.status` **登记不到依赖，也就永远不重建**，
/// 而且不报错。用 `Rx` 字段可以让所有页面保持同一种订阅方式，少一个静默失败的坑。
///
/// 约定（和 `PrivacySettingsLogic` 一致）：
/// 页面主体的状态（列表 / 加载中 / 错误文案）留在 Controller，View 用 `Obx` 读；
/// 一次性的 toast 文案由方法 `return`，由 View 决定怎么提示 —— Controller
/// 不 import material。
abstract class AsyncListLogic<T> extends GetxController {
  final RxList<T> items = <T>[].obs;

  /// 初值 `true`：首帧就该是加载中，别先闪一下空列表。
  final RxBool loading = true.obs;

  /// 有值 = 这一次取数失败了，文案直接显示在页面主体上（可重试）。
  final RxnString error = RxnString();

  /// 子类实现：真正的接口调用。
  Future<ApiResult<List<T>>> fetch();

  /// 接口 `ok == false` 且没带 message 时的兜底文案。
  String get failMessage => 'Failed to load';

  String errorText(Object failure) => '$failure';

  /// [items] 刚被替换之后的钩子（默认什么都不做）。
  ///
  /// 「取回列表后再派生一点东西」的页面用它（比如按名字反查出选中的 id）。
  /// **别为这个覆盖 [load]** —— loading / error 那套三件套要保持一份。
  void onItemsChanged() {}

  /// 列表为空、且不是「还在加载」或「加载失败」—— View 用它决定要不要画空态。
  bool get isEmpty => items.isEmpty && !loading.value && error.value == null;

  @override
  void onReady() {
    super.onReady();
    // onReady = 首帧之后，等价于原来页面里的 addPostFrameCallback。
    unawaited(load());
  }

  /// 重新取一次。下拉刷新直接把它接给 `RefreshIndicator.onRefresh`。
  Future<void> load() async {
    loading.value = true;
    error.value = null;
    try {
      final res = await fetch();
      // isClosed：Controller 侧的 `mounted`。请求回来时页面可能已经退了。
      if (isClosed) return;
      if (!res.ok) {
        error.value = res.message.isEmpty ? failMessage : res.message;
        items.clear();
        return;
      }
      items.assignAll(res.data ?? const []);
      onItemsChanged();
    } catch (failure) {
      if (isClosed) return;
      // 刷新失败不该把列表清空）。
      error.value = errorText(failure);
    } finally {
      if (!isClosed) loading.value = false;
    }
  }
}
