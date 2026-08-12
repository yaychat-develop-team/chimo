import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/network/app_apis.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_page_scaffold.dart';

/// 钱包 → Details：金币流水（对齐 forya `CashHistoryPage`）。
class CoinsDetailsPage extends StatefulWidget {
  const CoinsDetailsPage({super.key});

  @override
  State<CoinsDetailsPage> createState() => _CoinsDetailsPageState();
}

class _CoinsDetailsPageState extends State<CoinsDetailsPage> {
  static const _pageSize = 20;

  final _scroll = ScrollController();
  final List<CashOpHistoryItem> _items = [];
  int _pageNum = 1;
  bool _loading = true;
  bool _loadingMore = false;
  bool _canLoadMore = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_refresh());
    });
  }

  @override
  void dispose() {
    _scroll
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_canLoadMore || _loadingMore || _loading) return;
    if (!_scroll.hasClients) return;
    final pos = _scroll.position;
    if (pos.pixels >= pos.maxScrollExtent - 120) {
      unawaited(_loadMore());
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _loading = true;
      _error = null;
      _canLoadMore = true;
      _pageNum = 1;
    });
    try {
      final res = await AppApis.cash.opHistory(
        pageNum: 1,
        pageSize: _pageSize,
      );
      if (!mounted) return;
      if (!res.ok) {
        setState(() {
          _loading = false;
          _error = res.message.isEmpty ? 'Failed to load details' : res.message;
          _items.clear();
        });
        return;
      }
      final list = res.data ?? const <CashOpHistoryItem>[];
      setState(() {
        _items
          ..clear()
          ..addAll(list);
        _pageNum = 2;
        _canLoadMore = list.length >= _pageSize;
        _loading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = '$error';
      });
    }
  }

  Future<void> _loadMore() async {
    if (!_canLoadMore || _loadingMore) return;
    setState(() => _loadingMore = true);
    try {
      final res = await AppApis.cash.opHistory(
        pageNum: _pageNum,
        pageSize: _pageSize,
      );
      if (!mounted) return;
      if (!res.ok) {
        setState(() => _loadingMore = false);
        return;
      }
      final list = res.data ?? const <CashOpHistoryItem>[];
      setState(() {
        _items.addAll(list);
        _pageNum += 1;
        _canLoadMore = list.length >= _pageSize;
        _loadingMore = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingMore = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Coins Details',
      loading: _loading,
      body: RefreshIndicator(
        color: AppColors.primaryBright,
        onRefresh: _refresh,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_error != null && _items.isEmpty && !_loading) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 120),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              _error!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
        ],
      );
    }

    if (!_loading && _items.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          SizedBox(height: 120),
          Text(
            'No records yet',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      );
    }

    return ListView.builder(
      controller: _scroll,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      itemCount: _items.length + (_loadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= _items.length) {
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
        return _HistoryTile(item: _items[index]);
      },
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.item});

  final CashOpHistoryItem item;

  @override
  Widget build(BuildContext context) {
    final positive = item.coinValue > 0;
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
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '${item.coin} Coins',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: positive
                        ? AppColors.primaryBright
                        : AppColors.textPrimary,
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
                _formatTime(item.timestampSec),
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
  static String _formatTime(int sec) {
    if (sec <= 0) return '';
    final now = DateTime.now();
    final time = DateTime.fromMillisecondsSinceEpoch(sec * 1000);
    final diff = now.difference(time);
    final clock = _jms(time);

    if (now.year != time.year) {
      return '${_monthAbbr(time.month)} ${time.day}, ${time.year} $clock';
    }
    if (diff.inDays >= 1) {
      return '${_monthAbbr(time.month)} ${time.day} $clock';
    }
    if (now.day != time.day || now.month != time.month) {
      return 'yesterday $clock';
    }
    return clock;
  }

  static String _jms(DateTime dt) {
    final h24 = dt.hour;
    final m = dt.minute.toString().padLeft(2, '0');
    final s = dt.second.toString().padLeft(2, '0');
    final period = h24 >= 12 ? 'PM' : 'AM';
    final h12 = h24 % 12 == 0 ? 12 : h24 % 12;
    return '$h12:$m:$s $period';
  }

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  static String _monthAbbr(int month) =>
      _months[(month - 1).clamp(0, 11)];
}
