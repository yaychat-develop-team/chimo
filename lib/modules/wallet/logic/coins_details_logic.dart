import '../../../app/chimo_api.dart';
import '../../../common/models/server_client/cash.pb.dart';
import '../../../common/state/paged_list_logic.dart';

/// 钱包 → Details：金币流水（对齐 forya `CashHistoryPage`）。
class CoinsDetailsLogic extends PagedListLogic<CashOpHistoryItem> {
  @override
  Future<ApiResult<List<CashOpHistoryItem>>> fetchPage({
    required int pageNum,
    required int pageSize,
  }) {
    return ChimoApis.cash.opHistory(pageNum: pageNum, pageSize: pageSize);
  }

  @override
  String get failMessage => 'Failed to load details';
}
