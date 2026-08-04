import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/widgets/center_toast.dart';
import '../../wallet/wallet_page.dart';

Future<void> showGiftBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    builder: (_) => const GiftBottomSheet(),
  );
}

class GiftBottomSheet extends StatefulWidget {
  const GiftBottomSheet({super.key});

  @override
  State<GiftBottomSheet> createState() => _GiftBottomSheetState();
}

class _GiftItem {
  const _GiftItem({
    required this.name,
    required this.emoji,
    required this.cost,
  });

  final String name;
  final String emoji;
  final int cost;
}

class _GiftBottomSheetState extends State<GiftBottomSheet> {
  static const _green = Color(0xFF1CFF8A);
  static const _darkBg = Color(0xFF1A1A1D);
  static const _balance = 0;
  static const _qtyOptions = [1, 3, 10, 40, 100, 999];

  final List<_GiftItem> _gifts = const [
    _GiftItem(name: 'Sagittarius M...', emoji: '🔮', cost: 3000),
    _GiftItem(name: 'Rosee', emoji: '🌹', cost: 10),
    _GiftItem(name: 'Kisses', emoji: '💋', cost: 10),
    _GiftItem(name: 'Thanksgiving...', emoji: '🦃', cost: 40000),
    _GiftItem(name: 'Spellbook', emoji: '📕', cost: 60),
    _GiftItem(name: 'Fortune Cook...', emoji: '🍳', cost: 100),
    _GiftItem(name: 'Doughnut', emoji: '🍩', cost: 60),
    _GiftItem(name: 'Flutter', emoji: '🦋', cost: 120),
  ];

  int _selected = 0;
  int _qty = 1;

  void _showQtyPicker() {
    final box = context.findRenderObject()! as RenderBox;
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
    ).then((value) {
      if (value != null) {
        setState(() => _qty = value);
      }
    });
  }

  void _sendSelected() {
    final item = _gifts[_selected];
    final total = item.cost * _qty;
    if (_balance < total) {
      showCenterToast(context, message: 'Insufficient balance.');
      return;
    }
    Navigator.of(context).pop();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Send ${item.name} ×$_qty (cost: $total)'),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _gifts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final gift = _gifts[index];
                    final selected = index == _selected;
                    return GestureDetector(
                      onTap: () => setState(() => _selected = index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2A2A2D),
                                borderRadius: BorderRadius.circular(16),
                                border: selected
                                    ? Border.all(color: _green, width: 2)
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                gift.emoji,
                                style: const TextStyle(fontSize: 28),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            gift.name,
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
                                '${gift.cost}',
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
                  const Text(
                    '$_balance',
                    style: TextStyle(
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
                    onTap: _showQtyPicker,
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
                    onTap: _sendSelected,
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      decoration: BoxDecoration(
                        color: _green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
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
