import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../common/theme/app_colors.dart';

/// 「某人加入了社区」那一行居中提示（对齐 forya `CustomGroupJoinItem`：
/// 青绿昵称 + 灰色 `joined the community`，点昵称与点头像一样弹资料层）。
///
/// 没有样式包：这一行两边**只有群聊有**，没有第二套设计值可对照。
class ChatJoinTip extends StatelessWidget {
  const ChatJoinTip({super.key, required this.name, this.onNameTap});

  /// 入群者昵称（`ChatLine.joinName`）。空串显示 `Someone`。
  final String name;

  /// 点昵称。为 null 时昵称不可点。
  final VoidCallback? onNameTap;

  static const _nameColor = AppColors.accentTeal;
  static const _restColor = AppColors.textGrayBC;

  @override
  Widget build(BuildContext context) {
    final display = name.trim().isEmpty ? 'Someone' : name.trim();
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: display,
                style: const TextStyle(
                  color: _nameColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
                recognizer: onNameTap == null
                    ? null
                    : (TapGestureRecognizer()..onTap = onNameTap),
              ),
              const TextSpan(
                text: '  joined the community',
                style: TextStyle(
                  color: _restColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
