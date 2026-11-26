import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forya_pag/pag.dart';
import 'package:get/get.dart';

import '../../../../../app/chimo_api.dart';
import '../../../../../common/models/server_client/blind_box.pb.dart';
import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/utils/app_toast.dart';
import 'package:chimo/common/utils/chimo.dart';

/// 背包盲盒开启结果。对齐 joyride `BlindBoxResultDialog`。
class RoomGiftBlindBoxDialog extends StatefulWidget {
  const RoomGiftBlindBoxDialog({super.key, required this.grantRecordId});

  final Int64 grantRecordId;

  static Future<bool> show(Int64 grantRecordId) async {
    final opened = await Get.dialog<bool>(
      RoomGiftBlindBoxDialog(grantRecordId: grantRecordId),
      barrierColor: Colors.black54,
      barrierDismissible: true,
    );
    return opened == true;
  }

  @override
  State<RoomGiftBlindBoxDialog> createState() => _RoomGiftBlindBoxDialogState();
}

class _RoomGiftBlindBoxDialogState extends State<RoomGiftBlindBoxDialog> {
  BlindBoxOpenData? _data;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _open();
  }

  Future<void> _open() async {
    final res = await ChimoApis.commodity.openBlindBox(widget.grantRecordId);
    if (!mounted) return;
    if (!res.ok || res.data == null) {
      AppToast.info(res.message.isEmpty ? 'Open failed' : res.message);
      Get.back(result: false);
      return;
    }
    setState(() {
      _data = res.data;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading || _data == null) {
      return const Center(child: CupertinoActivityIndicator(color: AppColors.white));
    }
    final data = _data!;
    final pag = data.openDynamicResource.trim();
    return GestureDetector(
      onTap: () => Get.back(result: true),
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: pag.isNotEmpty
            ? PAGView.network(
                pag,
                repeatCount: 1,
                autoPlay: true,
                texts: ["You've got ${data.itemName}", '${data.period} Days'],
                imgs: [data.itemIcon],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Chimo.image(data.itemIcon, width: 120, height: 120, fit: BoxFit.contain),
                  const SizedBox(height: 16),
                  Text(
                    "You've got ${data.itemName}",
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${data.period} Days',
                    style: const TextStyle(color: AppColors.white70, fontSize: 13),
                  ),
                ],
              ),
      ),
    );
  }
}
