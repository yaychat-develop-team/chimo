import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_page_scaffold.dart';

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
    Navigator.of(context).pop(value);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: AppPageScaffold(
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
                  color: const Color(0xFF2A2A2A),
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorColor: AppColors.primaryBright,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isCollapsed: true,
                          hintText: widget.hint,
                          hintStyle: const TextStyle(
                            color: Color(0xFF8A8A8A),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.unit,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
                  color: _error != null
                      ? const Color(0xFFE44E50)
                      : Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
