import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/utils/app_toast.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../app/app_jumper.dart';
import '../logic/edit_profile_logic.dart';

/// 编辑个性签名页。
class PersonalSignaturePage extends StatefulWidget {
  const PersonalSignaturePage({super.key, this.initialText = ''});

  final String initialText;

  static const int maxLength = 60;

  @override
  State<PersonalSignaturePage> createState() => _PersonalSignaturePageState();
}

class _PersonalSignaturePageState extends State<PersonalSignaturePage> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    _focusNode = FocusNode();
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

  Future<void> _onConfirm() async {
    if (_saving) return;
    setState(() => _saving = true);
    final outcome = await Get.find<EditProfileLogic>().persistFields({
      'personalSignature': _controller.text.trim(),
    });
    if (!mounted) return;
    setState(() => _saving = false);
    if (!outcome.ok) {
      AppToast.error(outcome.message);
      return;
    }
    AppJumper.back(result: outcome);
  }

  @override
  Widget build(BuildContext context) {
    return ChimoScaffold(
      title: 'Personal Signature',
      loading: _saving,
      trailing: TextButton(
        onPressed: _saving ? null : () => unawaited(_onConfirm()),
        child: const Text(
          'Confirm',
          style: TextStyle(
            color: AppColors.primaryBright,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Container(
          constraints: const BoxConstraints(minHeight: 140),
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
          decoration: BoxDecoration(
            color: AppColors.surfaceSheet,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _controller,
                focusNode: _focusNode,
                maxLines: 5,
                minLines: 4,
                maxLength: PersonalSignaturePage.maxLength,
                buildCounter:
                    (
                      _, {
                      required currentLength,
                      required isFocused,
                      maxLength,
                    }) => const SizedBox.shrink(),
                onChanged: (_) => setState(() {}),
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
                cursorColor: AppColors.primaryBright,
                decoration: const AppInputDecoration(
                  isCollapsed: true,
                  hintText: "Don't be shy! Drop a fun line about yourself!",
                  hintStyle: TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
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
                    '${_controller.text.characters.length}/${PersonalSignaturePage.maxLength}',
                    style: const TextStyle(
                      color: AppColors.textTertiary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
