import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/widgets/center_toast.dart';

enum _ServerEnv { prod, test, local }

/// Debug page: server environment / toggles / proxy and shortcuts.
class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  _ServerEnv _env = _ServerEnv.test;
  bool _http2 = true;
  bool _pb = true;
  final TextEditingController _midDomainController = TextEditingController();
  final TextEditingController _h5Controller = TextEditingController();

  @override
  void dispose() {
    _midDomainController.dispose();
    _h5Controller.dispose();
    super.dispose();
  }

  void _toast(String message) {
    showCenterToast(context, message: message);
  }

  void _saveAndRestart() {
    _toast('Saved. Restart to apply.');
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const _DebugAppBar(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 24 + bottom),
                  children: [
                    _SectionHeader(
                      title: 'Server environment',
                      actionLabel: 'Save & restart',
                      onAction: _saveAndRestart,
                    ),
                    const SizedBox(height: 8),
                    _EnvOption(
                      selected: _env == _ServerEnv.prod,
                      title: 'Production',
                      subtitle: 'api.yqdf.xyz/api/v1',
                      onTap: () => setState(() => _env = _ServerEnv.prod),
                    ),
                    _EnvOption(
                      selected: _env == _ServerEnv.test,
                      title: 'Test environment',
                      subtitle: 'test-api.yqdf.xyz/api/v1',
                      onTap: () => setState(() => _env = _ServerEnv.test),
                    ),
                    _EnvOption(
                      selected: _env == _ServerEnv.local,
                      title: 'Local host',
                      subtitle: 'Tap to configure',
                      subtitleMuted: true,
                      onTap: () {
                        setState(() => _env = _ServerEnv.local);
                        _toast('Local host settings');
                      },
                    ),
                    const SizedBox(height: 6),
                    _ToggleRow(
                      label: 'http2',
                      value: _http2,
                      onChanged: (v) => setState(() => _http2 = v),
                    ),
                    _ToggleRow(
                      label: 'pb',
                      value: _pb,
                      onChanged: (v) => setState(() => _pb = v),
                    ),
                    _NavRow(
                      label: 'Proxy config',
                      onTap: () => _toast('Proxy config'),
                    ),
                    _InputActionRow(
                      label: 'Platform domain',
                      controller: _midDomainController,
                      action: _GreenCapsuleButton(
                        label: 'Save & restart',
                        onTap: _saveAndRestart,
                      ),
                    ),
                    _InputActionRow(
                      label: 'H5 jump',
                      controller: _h5Controller,
                      action: _GreenCircleButton(
                        label: 'Jump',
                        onTap: () => _toast('H5 jump'),
                      ),
                    ),
                    _NavRow(label: 'Jump test', onTap: () => _toast('Jump test')),
                    _NavRow(label: 'Create chat group', onTap: () => _toast('Create chat group')),
                    _NavRow(label: 'Message push banner', onTap: () => _toast('Message push banner')),
                    _NavRow(label: 'Test push', onTap: () => _toast('Test push')),
                    _NavRow(label: 'Global popup', onTap: () => _toast('Global popup')),
                    _NavRow(label: 'Global floating banner', onTap: () => _toast('Global floating banner')),
                    _NavRow(label: 'Room entry banner', onTap: () => _toast('Room entry banner')),
                    _NavRow(label: 'Test log upload', onTap: () => _toast('Test log upload')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DebugAppBar extends StatelessWidget {
  const _DebugAppBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: SvgPicture.asset(
                AppAssets.chatBack,
                width: 17,
                height: 7,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const Text(
            'Debug page',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.actionLabel,
    required this.onAction,
  });

  final String title;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onAction,
          child: Text(
            actionLabel,
            style: const TextStyle(
              color: Color(0xFF1CFF8A),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _EnvOption extends StatelessWidget {
  const _EnvOption({
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.subtitleMuted = false,
  });

  final bool selected;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool subtitleMuted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: _RadioDot(selected: selected),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: subtitleMuted
                          ? const Color(0xFFB0B0B0)
                          : const Color(0xFF8A8A8A),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
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

class _RadioDot extends StatelessWidget {
  const _RadioDot({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? const Color(0xFF8A8A8A) : const Color(0xFFC8C8C8),
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: selected
          ? Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xFF8A8A8A),
                shape: BoxShape.circle,
              ),
            )
          : null,
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Switch.adaptive(
            value: value,
            activeThumbColor: Colors.white,
            activeTrackColor: const Color(0xFFFFD54F),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFE0E0E0),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _NavRow extends StatelessWidget {
  const _NavRow({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 48,
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFFC0C0C0),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}

class _InputActionRow extends StatelessWidget {
  const _InputActionRow({
    required this.label,
    required this.controller,
    required this.action,
  });

  final String label;
  final TextEditingController controller;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 78,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.only(left: 12, right: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  action,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GreenCapsuleButton extends StatelessWidget {
  const _GreenCapsuleButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF1CFF8A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _GreenCircleButton extends StatelessWidget {
  const _GreenCircleButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF1CFF8A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
