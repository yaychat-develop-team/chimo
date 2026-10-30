import 'package:chimo/modules/chat/page/message_list_page.dart';
import 'package:chimo/modules/home/page/home_page.dart';
import 'package:chimo/modules/home/page/room_list_page.dart';
import 'package:chimo/modules/me/page/me_page.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../model/root_tab_model.dart';

/// 壳层：Tab 配置与当前下标。列表顺序即 [IndexedStack] 下标。
class RootTabLogic extends GetxController {
  static const tabs = <RootTabModel>[
    RootTabModel(label: 'Home', icon: AppAssets.tabRoom, selectedIcon: AppAssets.tabRoomSelected),
    RootTabModel(label: 'Room', icon: AppAssets.tabRoom, selectedIcon: AppAssets.tabRoomSelected),
    RootTabModel(
      label: 'Chats',
      icon: AppAssets.tabChats,
      selectedIcon: AppAssets.tabChatsSelected,
      showsUnread: true,
    ),
    RootTabModel(label: 'Me', icon: AppAssets.tabMe, selectedIcon: AppAssets.tabMeSelected),
  ];

  static const tabPages = [HomePage(), RoomListPage(), MessageListPage(), MePage()];

  final RxInt index = 0.obs;

  void select(int next) {
    if (index.value == next) return;
    index.value = next;
  }
}
