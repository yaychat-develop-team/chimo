
import 'package:get/get.dart';

import '../../../app/app_jumper.dart';
import '../../../app/chimo_api.dart';
import '../../../app/session_info.dart';
import '../../../common/models/server_client/auction.pb.dart';
import '../../../common/theme/app_dialog.dart';
import '../../../common/utils/app_toast.dart';

/// EchoHall。对齐 joyride `EchoHallPage`：签约头图 + 我的/他人艺人列表，续约余额不足走充值半屏。
class EchoHallLogic extends GetxController {
  EchoHallLogic(this.targetUid);

  static const balanceShortCode = 1001510100;

  final int targetUid;

  final loading = true.obs;
  final renewing = false.obs;
  final info = Rxn<ArtistContractInfo>();

  bool get isMine => targetUid > 0 && targetUid == SessionInfo.uid;

  Artist? get signed => info.value?.signedInfo;

  List<Artist> get artists => info.value?.artistList ?? const [];

  bool get hasAgent => (signed?.agent.id.toInt() ?? 0) > 0;

  int get teamValue => artists.fold(0, (sum, e) => sum + e.value.toInt());

  static EchoHallLogic put(int uid) {
    final tag = '$uid';
    if (Get.isRegistered<EchoHallLogic>(tag: tag)) {
      return Get.find<EchoHallLogic>(tag: tag);
    }
    return Get.put(EchoHallLogic(uid), tag: tag);
  }

  static void delete(int uid) {
    final tag = '$uid';
    if (Get.isRegistered<EchoHallLogic>(tag: tag)) {
      Get.delete<EchoHallLogic>(tag: tag, force: true);
    }
  }

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    loading.value = true;
    try {
      final res = await ChimoApis.auction.artists(targetUid);
      if (res.ok) {
        info.value = res.data;
      } else {
        info.value = null;
        AppToast.error(res.message.isEmpty ? 'Failed to load' : res.message);
      }
    } catch (e) {
      info.value = null;
      AppToast.error('$e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> renew(Artist artist) async {
    if (renewing.value) return;
    final isFree = artist.freeRenewCount > 0;
    if (!isFree) {
      final ok = await AppDialog.show(
        title: 'Contract Renewal',
        content:
            'Renewing your contract with ${artist.user.nickname} will cost ${artist.renewValue} coins.\nConfirm renewal?',
        confirmLabel: 'Confirm',
        cancelLabel: 'Cancel',
        buttons: DialogLoyoutStyle.horizontal,
      );
      if (ok != true) return;
    }

    renewing.value = true;
    AppDialog.blockingProgress();
    try {
      final res = await ChimoApis.auction.renew(artist.user.id.toInt());
      AppJumper.backIfPossible();
      if (res.ok) {
        var successText = 'Successfully renewed for ${artist.renewExtendDay} days!';
        if (isFree) {
          successText =
              '$successText You have ${artist.freeRenewCount - 1} free renewals left with ${artist.user.nickname}.';
        }
        await AppDialog.show(
          title: 'Renewal Successful!',
          content: successText,
          confirmLabel: 'OK',
        );
        await load();
        return;
      }
      if (res.code == balanceShortCode) {
        await AppJumper.showRechargeSheet(price: artist.renewValue.toInt());
        return;
      }
      AppToast.error(res.message.isEmpty ? 'Renew failed' : res.message);
    } catch (e) {
      AppJumper.backIfPossible();
      AppToast.error('$e');
    } finally {
      renewing.value = false;
    }
  }
}
