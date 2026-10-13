/// 三个主底部导航目标。
enum MainTab {
  /// 首页 Tab。
  home,

  /// 会话 Tab。
  chats,

  /// 我的 Tab。
  me;

  /// Tab 文案（与设计一致）。
  String get label => switch (this) {
    MainTab.home => 'Home',
    MainTab.chats => 'Chats',
    MainTab.me => 'Me',
  };
}
