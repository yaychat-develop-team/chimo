import 'package:flutter/material.dart';

import '../../../../common/constants/app_assets.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_empty_holder.dart';

/// 无会话时的空态：插图 + 提示文案。
class ChatsEmptyState extends StatelessWidget {
  const ChatsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppEmptyHolder.empty(
      message: "It's super quiet here...\nbreak the silence!",
      icon: AppAssets.msgEmpty,
      iconWidth: 160,
      messageStyle: TextStyle(
        color: AppColors.gray9A9A9A,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.45,
      ),
    );
  }
}
