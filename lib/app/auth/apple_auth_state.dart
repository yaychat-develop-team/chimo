import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../common/utils/event_center.dart';
import '../../common/utils/event_constant.dart';
import '../app_jumper.dart';
import '../chimo_api.dart';
import '../../common/utils/app_log.dart';
import 'onboarding_state.dart';
import '../../common/utils/app_toast.dart';

/// iOS Sign in with Apple，对齐 forya [AppleLoginPlatform]。
abstract final class AppleAuthState {
  /// 仅 iOS 可用；其它平台返回 false。
  static bool get isSupportedPlatform {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// 调起系统 Apple 授权 → `/auth/apple-auth` → 会话 + 引导跳转。
  /// 用户取消授权时静默返回；其它错误 toast。
  static Future<void> signIn(BuildContext context) async {
    if (!isSupportedPlatform) {
      AppToast.info('Apple Sign-In is only available on iOS');
      return;
    }

    try {
      final available = await SignInWithApple.isAvailable();
      if (!available) {
        if (context.mounted) {
          AppToast.info('Apple Sign-In is not available');
        }
        return;
      }

      final rawNonce = _generateNonce();
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
        nonce: _sha256ofString(rawNonce),
      );

      final idToken = credential.identityToken?.trim() ?? '';
      if (idToken.isEmpty) {
        if (context.mounted) {
          AppToast.info('Apple Sign-In failed: empty token');
        }
        return;
      }

      final nickname = [
        credential.givenName,
        credential.familyName,
      ].whereType<String>().map((e) => e.trim()).where((e) => e.isNotEmpty).join(' ');

      if (!context.mounted) return;
      await _completeLogin(context, idToken: idToken, nickname: nickname);
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) return;
      if (context.mounted) {
        AppToast.info(e.message.isNotEmpty ? e.message : 'Apple Sign-In failed');
      }
    } catch (error) {
      AppLog.w('Apple Sign-In failed', error: error);
      if (context.mounted) {
        AppToast.info('Apple Sign-In failed: $error');
      }
    }
  }

  static Future<void> _completeLogin(
    BuildContext context, {
    required String idToken,
    required String nickname,
  }) async {
    final res = await ChimoApis.auth.appleAuth(idToken: idToken, nickname: nickname);
    if (!context.mounted) return;
    if (!res.ok || res.data == null) {
      AppToast.info(res.message.isEmpty ? 'Apple Sign-In failed' : res.message);
      return;
    }
    if(res.ok) {
      eventCenter.emit(Event(EventConstant.loginGetAuthRsp,data: res.data));
    } else {
      AppToast.success(res.message);
    }
  }

  static String _generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  static String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    return sha256.convert(bytes).toString();
  }
}
