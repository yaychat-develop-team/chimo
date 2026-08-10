import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../features/chats/chat_detail_page.dart';
import '../../features/chats/data/chats_list_controller.dart';
import '../../features/chats/models/chat_conversation.dart';
import '../../features/home/chat_user_profile_page.dart';
import '../../features/home/models/chat_user_profile.dart';
import '../../features/wallet/wallet_page.dart';
import '../auth/auth_session.dart';
import '../constants/app_assets.dart';
import '../widgets/app_webview_page.dart';
import '../widgets/center_toast.dart' show showCenterToast;

/// 解析 banner / 深链 scheme（`chimo://`、`yqdf://`）以及 http(s) URL。
///
/// 对齐 forya [SchemeHelper] 中 Chimo 支持的子集。
/// 返回值（与 forya 约定一致）：
/// - `false` — 未处理
/// - `true` — 已处理（无 JS）
/// - `String` — 交给 `runJavaScript` 的 JS 片段（如 `get_user_info` 回调）
abstract final class AppSchemeHelper {
  static const _schemes = {'chimo', 'yqdf'};

  /// Banner / 外部入口：即发即弃导航。
  static void open(
    BuildContext context,
    String raw, {
    ChatsListController? chatsController,
  }) {
    unawaited(handle(context, raw, chatsController: chatsController));
  }

  /// WebView 桥接 / 导航拦截。
  static Future<Object?> handle(
    BuildContext context,
    String raw, {
    ChatsListController? chatsController,
  }) async {
    final link = raw.trim();
    if (link.isEmpty) return false;

    if (link.startsWith('http://') || link.startsWith('https://')) {
      if (!context.mounted) return false;
      await AppWebViewPage.open(context, url: link);
      return true;
    }

    final uri = Uri.tryParse(link);
    if (uri == null || !_schemes.contains(uri.scheme)) return false;

    final action =
        uri.host.isNotEmpty ? uri.host : uri.pathSegments.firstOrNull;
    if (action == null || action.isEmpty) return false;

    final params = uri.queryParameters;
    switch (action) {
      case 'web':
        final url = _decodeUrl(params['url']);
        if (url.isEmpty) return false;
        if (!context.mounted) return false;
        await AppWebViewPage.open(
          context,
          url: url,
          title: params['title'],
        );
        return true;
      case 'get_user_info':
        final cb = params['cb']?.trim() ?? '';
        if (cb.isEmpty) return true;
        final token = await AuthSession.token() ?? '';
        final uid = await AuthSession.userId() ?? '';
        final name = await AuthSession.nickname() ?? '';
        final avatar = await AuthSession.avatarUrl() ?? '';
        final emUser = await AuthSession.emUsername() ?? '';
        final emPwd = await AuthSession.emPassword() ?? '';
        final payload = <String, dynamic>{
          'name': name,
          'uid': int.tryParse(uid) ?? uid,
          'token': token,
          'emUser': emUser,
          'emPwd': emPwd,
          'avatar': avatar,
          'isLeader': false,
          'groupType': '',
          'version': '1.0.0',
          'hasBindFace': false,
        };
        return '$cb(${jsonEncode(payload)})';
      case 'go_recharge':
        if (!context.mounted) return false;
        final cb = params['cb']?.trim() ?? '';
        await Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const WalletPage()),
        );
        if (cb.isNotEmpty) return '$cb(true)';
        return true;
      case 'go_personal_home':
        final uid = params['uid']?.trim() ?? '';
        if (uid.isEmpty || uid == '0') return false;
        if (!context.mounted) return false;
        await Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ChatUserProfilePage(
              profile: ChatUserProfile(
                id: uid,
                nickname: 'User $uid',
                userId: uid,
                avatarAsset: AppAssets.defaultAvatar,
                isMale: true,
                age: 0,
                zodiac: '',
                level: 0,
                bio: '',
              ),
              chatsController: chatsController,
            ),
          ),
        );
        return true;
      case 'chat':
        final convId = params['conv_id']?.trim() ?? '';
        if (convId.isEmpty) return false;
        if (!context.mounted) return false;
        await Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => ChatDetailPage(
              conversation: ChatConversation(
                id: convId,
                title: convId,
                lastMessage: '',
                timeLabel: '',
                avatarAsset: AppAssets.defaultAvatar,
                unreadCount: 0,
              ),
              chatsController: chatsController,
            ),
          ),
        );
        return true;
      case 'pop_page':
        if (!context.mounted) return false;
        Navigator.of(context).maybePop();
        final next = params['url'];
        if (next != null && next.trim().isNotEmpty) {
          final decodeUrl = _decodeUrl(next);
          await Future<void>.delayed(const Duration(milliseconds: 300));
          if (context.mounted) {
            await handle(context, decodeUrl, chatsController: chatsController);
          }
        }
        return true;
      case 'show_toast':
        final message = params['message']?.trim() ?? '';
        if (message.isNotEmpty && context.mounted) {
          showCenterToast(context, message: message);
        }
        return true;
      case 'go_message_page':
        return true;
      default:
        return false;
    }
  }

  static String _decodeUrl(String? raw) {
    if (raw == null || raw.trim().isEmpty) return '';
    final trimmed = raw.trim();
    try {
      return Uri.decodeComponent(trimmed);
    } catch (_) {
      return trimmed;
    }
  }
}
