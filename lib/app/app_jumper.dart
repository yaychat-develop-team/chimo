import 'dart:async';
import 'dart:convert';

import 'package:chimo/app/session_info.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart' show AssetEntity;

import '../common/models/server_client/group/group.pb.dart';
import '../common/models/server_client/user.pb.dart';

import '../common/constants/app_assets.dart';
import '../common/theme/app_colors.dart';
import '../common/utils/app_toast.dart';
import '../common/widgets/app_webview_page.dart';
import '../modules/auth/page/almost_in_page.dart';
import '../modules/auth/page/login_page.dart';
import '../modules/auth/page/phone_login_page.dart';
import '../modules/auth/page/popular_tribes_page.dart';
import '../modules/auth/page/profile_setup_page.dart';
import '../modules/auth/page/verification_code_page.dart';
import '../modules/auth/page/welcome_brand_page.dart';
import '../modules/chat/page/chat_detail_page.dart';
import '../modules/chat/page/chats_page.dart';
import '../modules/chat/page/group_details_page.dart';
import '../modules/chat/page/joined_groups_page.dart';
import '../modules/chat/page/widgets/group/group_members_sheet.dart';
import '../modules/chat/logic/chats_list_logic.dart';
import '../modules/chat/page/im_search_page.dart';
import '../modules/chat/page/album_selection_preview_page.dart';
import '../modules/debug/page/debug_page.dart';
import '../modules/room/logic/room_logic.dart';
import '../modules/room/page/room_page.dart';
import '../modules/room/service/room_service.dart';
import '../modules/debug/page/proxy_config_page.dart';
import '../modules/friends/page/add_user_page.dart';
import '../modules/friends/page/friends_page.dart';
import '../modules/profile/page/chat_user_profile_page.dart';
import '../modules/home/page/home_search_page.dart';
import '../modules/me/page/level_page.dart';
import '../modules/me/page/about_us_page.dart';
import '../modules/me/page/account_cancel_result_page.dart';
import '../modules/me/page/account_cancellation_page.dart';
import '../modules/me/page/account_security_page.dart';
import '../modules/me/page/bind_email_page.dart';
import '../modules/me/page/help_page.dart';
import '../modules/me/page/joy_coins_help_page.dart';
import '../modules/me/page/levels_help_page.dart';
import '../modules/me/page/privacy_settings_page.dart';
import '../modules/me/page/settings_page.dart';
import '../modules/me/page/visits_page.dart';
import '../modules/profile/page/album_photo_viewer_page.dart';
import '../modules/profile/page/body_metric_page.dart';
import '../modules/profile/page/edit_profile_page.dart';
import '../modules/profile/page/my_picture_page.dart';
import '../modules/profile/page/my_tags_page.dart';
import '../modules/profile/page/nickname_page.dart';
import '../modules/profile/page/personal_signature_page.dart';
import '../modules/profile/page/voice_note_page.dart';
import '../modules/profile/page/personal_profile_page.dart';
import '../modules/report/page/report_page.dart';
import '../modules/shell/page/main_tab_shell.dart';
import '../modules/wallet/page/coins_details_page.dart';
import '../modules/wallet/page/wallet_page.dart';
import '../modules/chat/model/chat_conversation.dart';
import '../modules/friends/model/friends_tab.dart';
import '../modules/report/model/report_target.dart';

abstract class AppJumper {
  AppJumper._();

  // ---------------------------------------------------------------- 清栈跳转

  /// 退到登录页并清栈（退出登录 / token 失效）。
  static void toLoginAndClear() =>
      Get.offAll(() => const LoginPage(), transition: Transition.fadeIn);

  /// 进壳层并清栈（登录成功 / 引导结束）。
  static void toShellAndClear() =>
      Get.offAll(() => const MainTabShell(), transition: Transition.fadeIn);

  /// 进完善资料并清栈（登录成功但资料没齐）。
  static void toProfileSetupAndClear() =>
      Get.offAll(() => const ProfileSetupPage(), transition: Transition.fadeIn);

  /// 登录成功后的落地点：资料齐了进壳层，没齐进完善资料。
  static void toAfterAuth({required bool goHome}) =>
      goHome ? toShellAndClear() : toProfileSetupAndClear();

  /// 引导流程的欢迎页：清栈，避免用户退回上一步的资料表单。
  static void toWelcome() => Get.offAll(() => const WelcomeBrandPage());

  // ---------------------------------------------------------------- 前进跳转

  static Future toPhoneLogin() async => await Get.to(() => const PhoneLoginPage());

  static Future toVerify(String phone) async =>
      await Get.to(() => VerificationCodePage(phone: phone));

  static Future toAlmostIn() async => await Get.to(() => const AlmostInPage());

  /// 推荐部落；[typeList] 为所选行业（逗号分隔，空=全部）。
  static Future toTribes({String typeList = ''}) async =>
      await Get.to(() => PopularTribesPage(typeList: typeList));

  static Future toBindEmail({bool forLogin = false}) async =>
      await Get.to(() => BindEmailPage(forLogin: forLogin));

  /// 会话详情。[preview] 只作首帧预填，为 `null` 是正常路径（深链 / 冷启动）。
  static Future toChat(String id, {ChatConversation? preview}) async {
    if (!_requireAuth()) return;
    // 深链没带预填时按 id 从会话列表找，找不到拼空骨架，由 Controller 拉全。
    final seed = _chatSeed(id, preview);
    await Get.to(() => ChatDetailPage(conversation: seed));
  }

  /// 群详情。[preview] 同上，只预填；拿不到就只给 loading 占位
  /// （群详情不能像私聊那样按 id 拼骨架 —— 页面全程只读预填）。
  ///
  /// [onMembershipChanged] 把加入 / 退出同步回调用方列表（首页、已加入列表）。
  static Future toGroup(
    String id, {
    GroupInfo? preview,
    ValueChanged<bool>? onMembershipChanged,
  }) async {
    if (!_requireAuth()) return;
    final group = preview;
    if (group == null) {
      await Get.to(() => const _RouteLoadingPage());
      return;
    }
    await Get.to(() => GroupDetailsPage(group: group, onMembershipChanged: onMembershipChanged));
  }

  /// 已加入群组列表（首页「我的群组」更多）。
  static Future toJoinedGroups({
    required List<GroupInfo> groups,
    void Function(GroupInfo group, bool joined)? onMembershipChanged,
  }) async {
    if (!_requireAuth()) return;
    await Get.to(() => JoinedGroupsPage(groups: groups, onMembershipChanged: onMembershipChanged));
  }

  /// 群成员弹层。弹层不走路由栈，但仍然只从这里打开，页面不用自己 import 弹层。
  static Future<void> showGroupMembers({required String groupId, ValueChanged<User>? onMemberTap}) {
    return GroupMembersSheet.open(groupId: groupId, onMemberTap: onMemberTap);
  }

  /// 他人资料页。[preview] 同上，只预填；没有预填按 [id] 拼占位由页面重拉。
  static Future toProfile(String id, {User? preview}) async {
    if (!_requireAuth()) return;
    final seed = preview ?? (User()..id = Int64(int.tryParse(id) ?? 0));
    await Get.to(() => ChatUserProfilePage(seed: seed));
  }

  /// 通讯录；[initialTab] 决定落在好友 / 关注 / 粉丝哪个 Tab。
  static Future toFriends({FriendsTab initialTab = FriendsTab.friends}) async {
    if (!_requireAuth()) return;
    await Get.to(() => FriendsPage(initialTab: initialTab));
  }

  static Future toAddUser() async {
    if (!_requireAuth()) return;
    await Get.to(() => const AddUserPage());
  }

  static Future toSettings() async {
    if (!_requireAuth()) return;
    await Get.to(() => const SettingsPage());
  }

  /// 编辑资料；改动后回传新的 [User]（没改 / 直接返回则是 `null`）。
  static Future toEditProfile({User? profile}) async {
    if (!_requireAuth()) return;
    return Get.to(() => EditProfilePage(profile: profile));
  }

  /// 个人主页（自己的名片）。
  static Future<User?> toPersonalProfile({required User profile}) async {
    if (!_requireAuth()) return null;
    return await Get.to(() => PersonalProfilePage(profile: profile));
  }

  static Future toVisits() async {
    if (!_requireAuth()) return;
    await Get.to(() => const VisitsPage());
  }

  static Future toAccountCancellation() async {
    if (!_requireAuth()) return;
    await Get.to(() => const AccountCancellationPage());
  }

  static Future toAccountCancelResult() async {
    if (!_requireAuth()) return;
    await Get.to(() => const AccountCancelResultPage());
  }

  /// 注销成功页替换掉注销表单页（原 `Navigator.pushReplacement`）。
  static Future replaceWithAccountCancelResult() async {
    if (!_requireAuth()) return;
    await Get.off(() => const AccountCancelResultPage());
  }

  /// 发图前的相册预览。
  static Future toAlbumPreview({required List<AssetEntity> entities}) async {
    if (!_requireAuth()) return;
    await Get.to(() => AlbumSelectionPreviewPage(entities: entities));
  }

  /// 个性签名。接口成功后才返回结果，直接返回是 `null`。
  static Future toEditSignature({String initialText = ''}) async {
    if (!_requireAuth()) return;
    return Get.to(() => PersonalSignaturePage(initialText: initialText));
  }

  /// 昵称；确认后回传新昵称。
  static Future toEditNickname({String initialText = '', bool showRules = false}) async {
    if (!_requireAuth()) return;
    return Get.to(() => NicknamePage(initialText: initialText, showRules: showRules));
  }

  /// 语音签名；确认后回传录音路径与时长。
  static Future toEditVoiceNote() async {
    if (!_requireAuth()) return;
    return Get.to(() => const VoiceNotePage());
  }

  /// 交友标签；回传选中的标签名（页面自己已经存过一次，调用方通常只是刷新）。
  static Future toEditTags({List<String> initialSelected = const []}) async {
    if (!_requireAuth()) return;
    return Get.to(() => MyTagsPage(initialSelected: initialSelected));
  }

  /// 身高 / 体重数值输入；回传新数值。
  static Future toEditBodyMetric({
    required String title,
    required String unit,
    required String hint,
    required int min,
    required int max,
    int? initialValue,
  }) async {
    if (!_requireAuth()) return;
    return Get.to(
      () => BodyMetricPage(
        title: title,
        unit: unit,
        hint: hint,
        min: min,
        max: max,
        initialValue: initialValue,
      ),
    );
  }

  /// 头像；换过就回传新的远程 url，没换回传 `null`。
  static Future toEditPicture({required String avatarAsset, String? avatarUrl}) async {
    if (!_requireAuth()) return;
    return Get.to(() => MyPicturePage(avatarAsset: avatarAsset, avatarUrl: avatarUrl));
  }

  // ------------------------------------------------------ 登录前也能进的三条

  /// 应用内浏览器（用户协议 / banner 链接）。
  static Future toWeb({required String url, String? title}) async =>
      await Get.to(() => AppWebViewPage(url: url, title: title));

  static const _schemes = {'chimo', 'yqdf'};

  /// Banner / 外部入口：解析后直接跳，不等结果。
  static void openLink(String raw) {
    unawaited(handleScheme(raw));
  }

  /// 解析 banner / 深链（`chimo://`、`yqdf://`）以及 http(s)。
  ///
  /// 返回值给 WebView 桥接：
  /// - `false` — 未处理
  /// - `true` — 已处理
  /// - `String` — 交给 `runJavaScript` 的片段（如 `get_user_info`）
  static Future<Object?> handleScheme(String raw) async {
    final link = raw.trim();
    if (link.isEmpty) return false;

    if (link.startsWith('http://') || link.startsWith('https://')) {
      await toWeb(url: link);
      return true;
    }

    final uri = Uri.tryParse(link);
    if (uri == null || !_schemes.contains(uri.scheme)) return false;

    final action = uri.host.isNotEmpty ? uri.host : uri.pathSegments.firstOrNull;
    if (action == null || action.isEmpty) return false;

    final params = uri.queryParameters;
    switch (action) {
      case 'web':
        final url = _decodeUrl(params['url']);
        if (url.isEmpty) return false;
        await toWeb(url: url, title: params['title']);
        return true;
      case 'get_user_info':
        final cb = params['cb']?.trim() ?? '';
        if (cb.isEmpty) return true;
        final payload = <String, dynamic>{
          'name': SessionInfo.currentUser?.nickname ?? '',
          'uid': SessionInfo.currentUser?.id.toString() ?? '',
          'token': SessionInfo.token ?? '',
          'emUser': SessionInfo.currentUser?.emUsername ?? '',
          'emPwd': SessionInfo.currentUser?.emPwd ?? '',
          'avatar': SessionInfo.currentUser?.avatar ?? '',
          'isLeader': false,
          'groupType': '',
          'version': '1.0.0',
          'hasBindFace': false,
        };
        return '$cb(${jsonEncode(payload)})';
      case 'go_recharge':
        final cb = params['cb']?.trim() ?? '';
        await toWallet();
        if (cb.isNotEmpty) return '$cb(true)';
        return true;
      case 'go_personal_home':
        final uid = params['uid']?.trim() ?? '';
        if (uid.isEmpty || uid == '0') return false;
        await toProfile(uid);
        return true;
      case 'chat':
        final convId = params['conv_id']?.trim() ?? '';
        if (convId.isEmpty) return false;
        await toChat(convId);
        return true;
      case 'pop_page':
        maybeBack();
        final next = params['url'];
        if (next != null && next.trim().isNotEmpty) {
          await Future<void>.delayed(const Duration(milliseconds: 300));
          await handleScheme(_decodeUrl(next));
        }
        return true;
      case 'show_toast':
        final message = params['message']?.trim() ?? '';
        if (message.isNotEmpty) AppToast.info(message);
        return true;
      case 'go_message_page':
        return true;
      default:
        return false;
    }
  }

  static Future<void> toChats() async {
    if (!_requireAuth()) return;
    await Get.to(() => const ChatsPage());
  }

  static Future<void> toRoom(int rid) async {
    if (!_requireAuth() || rid <= 0) return;
    final service = RoomService.findOrNull();
    final showing =
        Get.isRegistered<RoomLogic>() && Get.find<RoomLogic>().pageMounted && Get.find<RoomLogic>().rid == rid;
    if (service != null && service.inRoom.value && service.rid == rid) {
      service.restore();
      if (showing) return;
    }
    if (Get.isRegistered<RoomLogic>() && !showing) RoomLogic.release();
    await Get.to(() => RoomPage(rid: rid));
  }

  static Future toDebug() async => await Get.to(() => const DebugPage());

  static Future toDebugProxy() async => await Get.to(() => const ProxyConfigPage());

  // -------------------------------------------------------------- 钱包与等级

  static Future toWallet() async {
    if (!_requireAuth()) return;
    await Get.to(() => const WalletPage());
  }

  static Future toCoinsDetails() async {
    if (!_requireAuth()) return;
    await Get.to(() => const CoinsDetailsPage());
  }

  /// 等级页；四个初始值只作首帧预填，页面自己会再拉一次。
  static Future toLevel({
    int level = 0,
    int experience = 0,
    int moreExpForNextLevel = 0,
    int totalExperience = 0,
  }) async {
    if (!_requireAuth()) return;
    await Get.to(
      () => LevelPage(
        level: level,
        experience: experience,
        moreExpForNextLevel: moreExpForNextLevel,
        totalExperience: totalExperience,
      ),
    );
  }

  static Future toLevelsHelp() async {
    if (!_requireAuth()) return;
    await Get.to(() => const LevelsHelpPage());
  }

  static Future toHelp() async {
    if (!_requireAuth()) return;
    await Get.to(() => const HelpPage());
  }

  static Future toJoyCoinsHelp() async {
    if (!_requireAuth()) return;
    await Get.to(() => const JoyCoinsHelpPage());
  }

  static Future toAboutUs() async {
    if (!_requireAuth()) return;
    await Get.to(() => const AboutUsPage());
  }

  // ---------------------------------------------------------- 搜索 / 举报 / 设置

  static Future toHomeSearch() async {
    if (!_requireAuth()) return;
    await Get.to(() => const HomeSearchPage());
  }

  /// 消息搜索；[scopeConversation] 非空表示只搜这一个会话。
  static Future toImSearch({ChatConversation? scopeConversation}) async {
    if (!_requireAuth()) return;
    await Get.to(() => ImSearchPage(scopeConversation: scopeConversation));
  }

  /// 举报用户 / 群。[reportedId] 是用户 id 或群（环信）id。
  static Future toReport({
    required String reportedId,
    ReportTargetKind kind = ReportTargetKind.user,
  }) async {
    if (!_requireAuth()) return;
    await Get.to(() => ReportPage(reportedId: reportedId, targetKind: kind));
  }

  static Future toPrivacySettings() async {
    if (!_requireAuth()) return;
    await Get.to(() => const PrivacySettingsPage());
  }

  static Future toBlacklist() async {
    if (!_requireAuth()) return;
    await Get.to(() => const BlacklistPage());
  }

  static Future toAccountSecurity() async {
    if (!_requireAuth()) return;
    await Get.to(() => const AccountSecurityPage());
  }

  /// 全屏照片查看器；[paths] 已过滤空串、[initialIndex] 已 clamp 的责任在调用方
  /// （[AlbumPhotoViewerPage.open] 里做）。
  static Future toAlbumViewer({
    required List<String> paths,
    int initialIndex = 0,
    bool showPageIndicator = true,
  }) async {
    if (!_requireAuth()) return;
    await Get.to(
      () => AlbumPhotoViewerPage(
        paths: paths,
        initialIndex: initialIndex,
        showPageIndicator: showPageIndicator,
      ),
    );
  }

  // -------------------------------------------------------------------- 返回

  /// 返回上一页，可带结果（原 `Navigator.pop(context, result)`）。
  ///
  /// 弹层 / 对话框的关闭也走这里：全项目只有一个 navigator，
  /// `Get.back()` 弹的就是栈顶那一层。
  static void back({dynamic result}) => Get.back(result: result);

  /// 能退才退。清栈前先关掉可能存在的弹层时用 —— 栈里只剩一页时
  /// 直接 `back()` 会把 navigator 弹空（黑屏 / Android 退出应用）。
  static void backIfPossible() {
    if (Get.key.currentState?.canPop() ?? false) Get.back();
  }

  /// 询问式返回：先问过 `PopScope` 再退，栈底时什么都不做
  /// （原 `Navigator.of(context).maybePop()`）。
  ///
  /// **UI 返回按钮用这个，不要用 [back]** —— [back] 是 `Navigator.pop()` 的
  /// 语义（代码主动退、绕过 `PopScope`）。三个 `PopScope(canPop: false)` 的
  /// 页面正是靠「手势被拦住 → 代码带结果退」这个组合工作的。
  static void maybeBack() {
    unawaited(Get.key.currentState?.maybePop() ?? Future.value());
  }

  // -------------------------------------------------------------------- 私有

  static String _decodeUrl(String? raw) {
    if (raw == null || raw.trim().isEmpty) return '';
    final trimmed = raw.trim();
    try {
      return Uri.decodeComponent(trimmed);
    } catch (_) {
      return trimmed;
    }
  }

  /// 未登录时清栈回登录页并返回 `false`，调用方直接 return。
  static bool _requireAuth() {
    if (SessionInfo.hasLogin) return true;
    toLoginAndClear();
    return false;
  }

  /// 会话行种子：优先预填，其次会话列表里已有的同 id 行，
  /// 都没有就只按 id 拼一个**空骨架** —— 页面 `initState` 会按 id 拉对端资料
  /// 并把标题换成真实昵称（`DmChatLogic.loadFromApi`），
  /// 所以深链进来看到的是「空 → 真实」，不是伪造的「Chat」。
  static ChatConversation _chatSeed(String id, ChatConversation? preview) {
    if (preview != null) return preview;
    for (final c in Get.find<ChatsListLogic>().conversations) {
      if (c.id == id) return c;
    }
    return ChatConversation(
      id: id,
      title: '',
      avatarAsset: AppAssets.avatarPlace,
      lastMessage: '',
      timeLabel: '',
    );
  }
}

/// 没有预填就渲不出来的目标页的过渡占位（群详情等缺参数连骨架都拼不出）。
/// 保留返回按钮 —— 转圈转到底也得让人退得出去。
class _RouteLoadingPage extends StatelessWidget {
  const _RouteLoadingPage();

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.surface,
    appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
    body: const Center(
      child: SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(strokeWidth: 2.2, color: AppColors.primaryBright),
      ),
    ),
  );
}
