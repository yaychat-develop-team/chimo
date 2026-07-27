/// 主壳底部导航的三个目的地。
enum MainTab {
  /// 首页
  home,

  /// 聊天
  chats,

  /// 我的
  me;

  /// Tab 展示文案（与设计稿一致）。
  String get label => switch (this) {
    MainTab.home => 'Home',
    MainTab.chats => 'Chats',
    MainTab.me => 'Me',
  };
}
