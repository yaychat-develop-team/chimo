import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_page_scaffold.dart';

/// 编辑昵称页。
class NicknamePage extends StatefulWidget {
  const NicknamePage({
    super.key,
    this.initialText = '',
    this.showRules = false,
  });

  final String initialText;

  /// 曾编辑过一次后再次进入时展示规则。
  final bool showRules;

  static const int maxLength = 20;

  static const String rulesText =
      'The number of times you can modify your nickname each calendar '
      'month is calculated based on your current account status in '
      'real-time. Your nickname must comply with relevant laws, '
      'regulations, and rules. It will be effective only after passing '
      'the review, and the review result will be delivered through '
      'system messages. Once it becomes effective, your modification '
      'opportunity will be deducted. If your modified nickname is found '
      'to violate the rules during administrator\'s review, it will be '
      'reset. Please be cautious when making changes.';


  @override
  State<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _focusNode.requestFocus();
      _controller.selection = TextSelection.collapsed(
        offset: _controller.text.length,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onConfirm() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a nickname'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    Navigator.of(context).pop(text);
  }

  @override
  Widget build(BuildContext context) {
    final length = _controller.text.characters.length;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: AppPageScaffold(
        title: 'Nickname',
        trailing: TextButton(
          onPressed: _onConfirm,
          child: const Text(
            'Confirm',
            style: TextStyle(
              color: AppColors.primaryBright,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        maxLength: NicknamePage.maxLength,
                        buildCounter: (
                          _, {
                          required currentLength,
                          required isFocused,
                          maxLength,
                        }) =>
                            const SizedBox.shrink(),
                        onChanged: (_) => setState(() {}),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorColor: AppColors.primaryBright,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isCollapsed: true,
                          hintText: 'Enter nickname',
                          hintStyle: TextStyle(
                            color: Color(0xFF8A8A8A),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    if (_controller.text.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          _controller.clear();
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          AppAssets.closeCircle,
                          width: 18,
                          height: 18,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'It will be displayed after review.',
                      style: TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    '$length/${NicknamePage.maxLength}',
                    style: const TextStyle(
                      color: AppColors.textTertiary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.showRules)
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 28, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nickname Modification Rules:',
                      style: TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      NicknamePage.rulesText,
                      style: TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
