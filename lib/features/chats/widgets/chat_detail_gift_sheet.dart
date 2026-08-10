part of '../chat_detail_page.dart';

class _GiftSheet extends StatefulWidget {
  const _GiftSheet({this.receiverUid = ''});

  final String receiverUid;

  @override
  State<_GiftSheet> createState() => _GiftSheetState();
}

class _GiftSheetState extends State<_GiftSheet> {
  static const _green = Color(0xFF00F875);
  static const _darkBg = Color(0xFF1A1A1D);
  static const _qtyOptions = [1, 3, 10, 40, 100, 999];

  int _balance = 0;
  bool _loading = true;
  bool _sending = false;
  String? _loadError;
  List<CashGiftItem> _gifts = const [];

  int _selected = 0;
  int _qty = 1;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _loadError = null;
    });
    try {
      final itemsFuture = AppApis.cash.giftItems();
      final balanceFuture = AppApis.cash.balance();
      final itemsRes = await itemsFuture;
      final balanceRes = await balanceFuture;
      if (!mounted) return;
      final items = (itemsRes.data ?? const [])
          .where((g) => g.canBuy)
          .toList(growable: false);
      final balance = balanceRes.data ?? 0;
      setState(() {
        _gifts = items;
        _balance = balance;
        _selected = items.isEmpty ? 0 : 0;
        _loading = false;
        if (items.isEmpty && !itemsRes.ok) {
          _loadError = itemsRes.message.isEmpty
              ? 'Failed to load gifts'
              : itemsRes.message;
        }
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _loadError = '$error';
      });
    }
  }

  void _showQtyPicker() {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;
    final btnOffset = box.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu<int>(
      context: context,
      color: const Color(0xFF2A2A2D),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      position: RelativeRect.fromLTRB(
        btnOffset.dx + box.size.width - 180,
        btnOffset.dy + box.size.height - 330,
        btnOffset.dx + box.size.width - 60,
        0,
      ),
      items: _qtyOptions
          .map(
            (q) => PopupMenuItem<int>(
              value: q,
              child: Center(
                child: Text(
                  '$q',
                  style: TextStyle(
                    color: q == _qty ? _green : Colors.white,
                    fontSize: 16,
                    fontWeight: q == _qty ? FontWeight.w900 : FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ).then((v) {
      if (v != null) setState(() => _qty = v);
    });
  }

  Future<void> _sendSelected() async {
    if (_sending || _gifts.isEmpty) return;
    final item = _gifts[_selected.clamp(0, _gifts.length - 1)];
    final total = item.price * _qty;
    if (_balance < total) {
      showCenterToast(context, message: 'Insufficient balance.');
      return;
    }

    final uid = widget.receiverUid.trim();
    if (uid.isEmpty) {
      showCenterToast(context, message: 'Invalid receiver.');
      return;
    }

    setState(() => _sending = true);
    try {
      final res = await AppApis.cash.sendGift(
        receiverIds: [uid],
        itemId: item.id,
        count: _qty,
      );
      if (!mounted) return;
      if (!res.ok) {
        setState(() => _sending = false);
        showCenterToast(
          context,
          message: res.message.isEmpty ? 'Gift failed' : res.message,
        );
        return;
      }

      // 成功消费后刷新余额。
      try {
        final bal = await AppApis.cash.balance();
        if (mounted) {
          setState(() => _balance = bal.data ?? _balance);
        }
      } catch (_) {}

      if (!mounted) return;
      Navigator.of(context).pop(
        _GiftSendResult(
          id: int.tryParse(item.id) ?? 0,
          name: item.name,
          qty: _qty,
          iconUrl: item.iconUrl,
          cost: item.price,
          emoji: '',
        ),
      );
    } catch (error) {
      if (!mounted) return;
      setState(() => _sending = false);
      showCenterToast(context, message: 'Gift failed: $error');
    }
  }

  Widget _giftIcon(CashGiftItem g) {
    if (g.iconUrl.isNotEmpty) {
      return Image.network(
        g.iconUrl,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => const Text('🎁', style: TextStyle(fontSize: 28)),
      );
    }
    return const Text('🎁', style: TextStyle(fontSize: 28));
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Container(
      padding: EdgeInsets.only(bottom: bottom),
      decoration: const BoxDecoration(
        color: _darkBg,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gift',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 300,
                child: _loading
                    ? const Center(
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.4,
                            color: _green,
                          ),
                        ),
                      )
                    : _loadError != null
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _loadError!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextButton(
                                  onPressed: () => unawaited(_load()),
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          )
                        : _gifts.isEmpty
                            ? const Center(
                                child: Text(
                                  'No gifts available',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            : GridView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: _gifts.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 14,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.72,
                                ),
                                itemBuilder: (context, index) {
                                  final g = _gifts[index];
                                  final sel = index == _selected;
                                  return GestureDetector(
                                    onTap: () =>
                                        setState(() => _selected = index),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF2A2A2D),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              border: sel
                                                  ? Border.all(
                                                      color: _green,
                                                      width: 2,
                                                    )
                                                  : null,
                                            ),
                                            alignment: Alignment.center,
                                            child: _giftIcon(g),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          g.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              AppAssets.coin,
                                              width: 12,
                                              height: 12,
                                            ),
                                            const SizedBox(width: 3),
                                            Text(
                                              '${g.price}',
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(AppAssets.coin, width: 16, height: 16),
                  const SizedBox(width: 6),
                  Text(
                    _loading ? '…' : '$_balance',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const WalletPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 28,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A3A2A),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Top-Up >',
                        style: TextStyle(
                          color: _green,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _gifts.isEmpty ? null : _showQtyPicker,
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: _green, width: 1.5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$_qty',
                            style: const TextStyle(
                              color: _green,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: _green,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: (_sending || _gifts.isEmpty)
                        ? null
                        : () => unawaited(_sendSelected()),
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      decoration: BoxDecoration(
                        color: _sending || _gifts.isEmpty
                            ? _green.withValues(alpha: 0.5)
                            : _green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: _sending
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.black,
                              ),
                            )
                          : const Text(
                              'Gift',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
