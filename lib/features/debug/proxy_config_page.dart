import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/network/network_bootstrap.dart';
import '../../core/network/proxy_config_store.dart';
import '../../core/widgets/center_toast.dart';

/// 本地代理配置（对齐 forya `BindConfigureAgentPage`）。
class ProxyConfigPage extends StatefulWidget {
  const ProxyConfigPage({super.key});

  @override
  State<ProxyConfigPage> createState() => _ProxyConfigPageState();
}

class _ProxyConfigPageState extends State<ProxyConfigPage> {
  late final TextEditingController _ipController;
  late final TextEditingController _portController;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _ipController = TextEditingController(text: ProxyConfigStore.ip);
    _portController = TextEditingController(text: ProxyConfigStore.port);
  }

  @override
  void dispose() {
    _ipController.dispose();
    _portController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await ProxyConfigStore.save(
        ip: _ipController.text,
        port: _portController.text,
      );
      await NetworkBootstrap.rebuildHttpClient();
      if (!mounted) return;
      showCenterToast(context, message: 'Proxy saved');
      Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Save failed: $error');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _clear() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await ProxyConfigStore.clear();
      await NetworkBootstrap.rebuildHttpClient();
      if (!mounted) return;
      showCenterToast(context, message: 'Proxy cleared');
      Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;
      showCenterToast(context, message: 'Clear failed: $error');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(48, 24, 48, 24),
            children: [
              const Text(
                'Local proxy config',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Configure IP and port separately',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              const SizedBox(height: 65),
              _Field(
                controller: _ipController,
                hint: 'Enter IP',
                enabled: !_busy,
              ),
              const SizedBox(height: 24),
              _Field(
                controller: _portController,
                hint: 'Enter port',
                enabled: !_busy,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              _ActionButton(
                label: _busy ? 'Please wait…' : 'Save',
                onTap: _busy ? null : _save,
              ),
              const SizedBox(height: 24),
              _ActionButton(
                label: 'Clear proxy data',
                onTap: _busy ? null : _clear,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.hint,
    this.enabled = true,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hint;
  final bool enabled;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType ?? TextInputType.text,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFB0B0B0)),
        filled: true,
        fillColor: const Color(0xFFF2F2F2),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: Material(
        color: const Color(0xFF1CFF8A),
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
