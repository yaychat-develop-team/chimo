import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/models/server_client/cash.pb.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/utils/time_fmt.dart';
import '../logic/coins_details_logic.dart';

/// 钱包 → Details：金币流水（对齐 forya `CashHistoryPage`）。
class CoinsDetailsPage extends StatefulWidget {
  const CoinsDetailsPage({super.key});

  @override
  State<CoinsDetailsPage> createState() => _CoinsDetailsPageState();
}

class _CoinsDetailsPageState extends State<CoinsDetailsPage> {
  final _scroll = ScrollController();
  late final CoinsDetailsLogic logic;
  bool _ownsController = false;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<CoinsDetailsLogic>()) {
      logic = Get.find<CoinsDetailsLogic>();
    } else {
      logic = Get.put(CoinsDetailsLogic());
      _ownsController = true;
    }
    _scroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scroll
      ..removeListener(_onScroll)
      ..dispose();
    if (_ownsController && Get.isRegistered<CoinsDetailsLogic>()) {
      Get.delete<CoinsDetailsLogic>();
    }
    super.dispose();
  }

  void _onScroll() {
    if (!_scroll.hasClients) return;
    final pos = _scroll.position;
    // 「还能不能翻」「是不是正在翻」由 Controller 自己挡。
    if (pos.pixels >= pos.maxScrollExtent - 120) {
      unawaited(logic.loadMore());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChimoScaffold(
        title: 'Coins Details',
        loading: logic.loading.value,
        body: RefreshIndicator(
          color: AppColors.primaryBright,
          onRefresh: logic.load,
          child: _buildBody(),
        ),
      ),
    );
  }

  /// 在 `Obx` 的 builder 里同步调用，所以这里读 `_c.xxx` 登记得到依赖。
  Widget _buildBody() {
    final loading = logic.loading.value;
    final error = logic.error.value;
    // `.toList()`：itemBuilder 在 builder 之外跑。
    final items = logic.items.toList();

    if (error != null && items.isEmpty && !loading) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 120),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
          ),
        ],
      );
    }

    if (!loading && items.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          SizedBox(height: 120),
          Text(
            'No records yet',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
        ],
      );
    }

    final loadingMore = logic.loadingMore.value;
    return ListView.builder(
      controller: _scroll,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      itemCount: items.length + (loadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= items.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        return _HistoryTile(item: items[index]);
      },
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.item});

  final CashOpHistoryItem item;

  @override
  Widget build(BuildContext context) {
    final positive = (double.tryParse(item.coin.trim()) ?? 0) > 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 180),
                child: Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.field,
                ),
              ),
              Expanded(
                child: Text(
                  '${item.coin} Coins',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: positive ? AppColors.primaryBright : AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Text(
                  item.type,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                _formatTime(item.timestamp.toInt()),
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const ColoredBox(
            color: Colors.white10,
            child: SizedBox(height: 0.5, width: double.infinity),
          ),
        ],
      ),
    );
  }

  /// 对齐 forya `TimeAgo.timeForJMS`（秒时间戳）。
  static String _formatTime(int sec) => TimeFmt.dateTimeSeconds(sec);
}
