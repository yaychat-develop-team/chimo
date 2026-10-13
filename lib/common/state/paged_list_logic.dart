import 'package:get/get.dart';

import '../../app/network/http/api_result.dart';
import 'async_list_logic.dart';

/// 分页列表（下拉刷新 + 滚到底加载下一页）。
///
/// 子类只实现 [fetchPage]；第一页由 [AsyncListLogic.load] 走，
/// 后续页走 [loadMore]。判断「还有没有下一页」用的是「这一页够不够 [pageSize] 条」，
abstract class PagedListLogic<T> extends AsyncListLogic<T> {
  int get pageSize => 20;

  /// 正在加载下一页 —— 列表尾部那个小转圈。
  final RxBool loadingMore = false.obs;

  /// 上一页拉满了，还可以再往下翻。
  final RxBool canLoadMore = true.obs;

  int _nextPage = 1;

  Future<ApiResult<List<T>>> fetchPage({
    required int pageNum,
    required int pageSize,
  });

  @override
  Future<ApiResult<List<T>>> fetch() async {
    canLoadMore.value = true;
    _nextPage = 1;
    final res = await fetchPage(pageNum: 1, pageSize: pageSize);
    if (res.ok) {
      final list = res.data ?? const [];
      _nextPage = 2;
      canLoadMore.value = list.length >= pageSize;
    }
    return res;
  }

  /// 滚到底时调。失败不弹错也不动列表，翻页失败只是停住。
  Future<void> loadMore() async {
    if (!canLoadMore.value || loadingMore.value || loading.value) return;
    loadingMore.value = true;
    try {
      final res = await fetchPage(pageNum: _nextPage, pageSize: pageSize);
      if (isClosed || !res.ok) return;
      final list = res.data ?? const [];
      items.addAll(list);
      _nextPage += 1;
      canLoadMore.value = list.length >= pageSize;
    } catch (_) {
      return;
    } finally {
      if (!isClosed) loadingMore.value = false;
    }
  }
}
