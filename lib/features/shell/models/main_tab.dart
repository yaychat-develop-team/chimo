/// The three main bottom-nav destinations.
enum MainTab {
  /// Home tab.
  home,

  /// Chats tab.
  chats,

  /// Me tab.
  me;

  /// Tab label (matches design).
  String get label => switch (this) {
    MainTab.home => 'Home',
    MainTab.chats => 'Chats',
    MainTab.me => 'Me',
  };
}
