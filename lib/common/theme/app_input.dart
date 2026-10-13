import 'package:flutter/material.dart';

/// 无边框输入框。提示色和内边距仍由调用方传入，避免把搜索框和表单刷成同一种字。
class AppInputDecoration extends InputDecoration {
  const AppInputDecoration({
    super.hintText,
    super.hintStyle,
    super.isDense,
    super.isCollapsed,
    super.counterText,
    super.contentPadding,
  }) : super(border: InputBorder.none);
}
