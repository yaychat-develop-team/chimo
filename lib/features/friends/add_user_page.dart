import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_asset_image.dart';
import '../../core/widgets/app_nav_bar.dart';
import '../../core/widgets/app_page_scaffold.dart';

/// Add user page: search by User ID or nickname (messages search entry).
class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Auto-focus on entry to match design cursor state.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: 'Add',
      backIcon: AppNavBackIcon.backArrow,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFF3A3A3A),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  const AppAssetImage(
                    AppAssets.msgSearch,
                    width: 18,
                    height: 18,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                      ),
                      cursorColor: AppColors.primaryBright,
                      cursorWidth: 1.5,
                      textInputAction: TextInputAction.search,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(64),
                      ],
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Search by User ID or Nickname',
                        hintStyle: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
