import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../common/theme/app_text.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../app/app_jumper.dart';

/// 身高 / 体重数值输入页。
class BodyMetricPage extends StatefulWidget {
  const BodyMetricPage({
    super.key,
    required this.title,
    required this.unit,
    required this.hint,
    required this.min,
    required this.max,
    this.initialValue,
  });

  final String title;
  final String unit;
  final String hint;
  final int min;
  final int max;
  final int? initialValue;

  @override
  State<BodyMetricPage> createState() => _BodyMetricPageState();
}

class _BodyMetricPageState extends State<BodyMetricPage> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialValue?.toString() ?? '',
    );
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
    final value = int.tryParse(text);
    if (value == null || value < widget.min || value > widget.max) {
      setState(() {
        _error =
            'Please fill in the numbers between ${widget.min} and ${widget.max}';
      });
      return;
    }
    AppJumper.back(result: value);
  }

  @override
  Widget build(BuildContext context) {
    return ChimoScaffold(
      title: widget.title,
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
                color: AppColors.tagBackground,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      onChanged: (_) {
                        if (_error != null) setState(() => _error = null);
                      },
                      style: AppText.field,
                      cursorColor: AppColors.primaryBright,
                      decoration: AppInputDecoration(
                        isCollapsed: true,
                        hintText: widget.hint,
                        hintStyle: const TextStyle(
                          color: AppColors.textGray8A,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Text(widget.unit, style: AppText.field),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Text(
              _error ??
                  'Please fill in the numbers between ${widget.min} and ${widget.max}',
              style: TextStyle(
                color: _error != null ? AppColors.danger : Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
