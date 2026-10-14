import 'package:flutter/material.dart';

import '../../../app/app_config.dart';
import '../../../app/chimo_api.dart';
import '../../../app/network/config/api_store.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_input.dart';
import '../../../app/app_jumper.dart';
import '../../../common/utils/app_toast.dart';

/// 调试页：服务端环境 / 开关 / 代理与快捷入口。
class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  ApiEnvironment _env = AppConfig.environment;
  bool _http2 = true;
  bool _pb = true;
  bool _saving = false;
  final TextEditingController _midDomainController = TextEditingController();
  final TextEditingController _h5Controller = TextEditingController();

  @override
  void dispose() {
    _midDomainController.dispose();
    _h5Controller.dispose();
    super.dispose();
  }

  void _toast(String message) {
    AppToast.info(message);
  }

  Future<void> _saveAndRestart() async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      await ApiStore.save(_env);
      final ping = await ChimoApis.user.pingOpen(open: false);
      if (!mounted) return;
      _toast(
        'Saved → ${AppConfig.baseUrl}\n'
        '${ping.success ? 'OK' : ping.message} (${ping.code})',
      );
    } catch (error) {
      if (!mounted) return;
      _toast('Save failed: $error');
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!AppConfig.isDebug) {
      return ChimoScaffold(
        title: 'Debug page',
        backgroundColor: Colors.white,
        body: const Center(
          child: Text(
            'Not available in production build.',
            style: TextStyle(color: AppColors.textGray8E, fontSize: 14),
          ),
        ),
      );
    }

    return ChimoScaffold(
      title: 'Debug page',
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
            _SectionHeader(
              title: 'Server environment',
              actionLabel: _saving ? 'Saving…' : 'Save & restart',
              onAction: _saveAndRestart,
            ),
            const SizedBox(height: 8),
            if (!AppConfig.isDebug)
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Official build: environment is locked to Production.',
                  style: TextStyle(color: AppColors.textGray8E, fontSize: 13),
                ),
              ),
            _EnvOption(
              selected: _env == ApiEnvironment.production,
              title: 'Production',
              subtitle: 'api.echimo.com/api/v1',
              onTap: AppConfig.isDebug
                  ? () => setState(() => _env = ApiEnvironment.production)
                  : null,
            ),
            _EnvOption(
              selected: _env == ApiEnvironment.test,
              title: 'Test environment',
              subtitle: 'test-api.echimo.com/api/v1',
              onTap: AppConfig.isDebug ? () => setState(() => _env = ApiEnvironment.test) : null,
            ),
            _EnvOption(
              selected: _env == ApiEnvironment.local,
              title: 'Local host',
              subtitle: '127.0.0.1:8080/api/v1',
              subtitleMuted: true,
              onTap: AppConfig.isDebug ? () => setState(() => _env = ApiEnvironment.local) : null,
            ),
            const SizedBox(height: 6),
            _ToggleRow(label: 'http2', value: _http2, onChanged: (v) => setState(() => _http2 = v)),
            _ToggleRow(label: 'pb', value: _pb, onChanged: (v) => setState(() => _pb = v)),
            _NavRow(
              label: 'Proxy config',
              onTap: () {
                AppJumper.toDebugProxy();
              },
            ),
            _InputActionRow(
              label: 'Platform domain',
              controller: _midDomainController,
              action: _GreenCapsuleButton(label: 'Save & restart', onTap: _saveAndRestart),
            ),
            _InputActionRow(
              label: 'H5 jump',
              controller: _h5Controller,
              action: _GreenCircleButton(label: 'Jump', onTap: () => _toast('H5 jump')),
            ),
            _NavRow(
              label: 'Ping test API',
              onTap: () async {
                try {
                  final ping = await ChimoApis.user.pingOpen();
                  _toast(
                    '${AppConfig.baseUrl}\n'
                    '${ping.success ? 'OK' : ping.message} (${ping.code})',
                  );
                } catch (error) {
                  _toast('Ping failed: $error');
                }
              },
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
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.actionLabel, required this.onAction});

  final String title;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onAction,
          child: Text(
            actionLabel,
            style: const TextStyle(
              color: AppColors.accentNeon,
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
    this.onTap,
    this.subtitleMuted = false,
  });

  final bool selected;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
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
                      color: subtitleMuted ? AppColors.textGrayB0 : AppColors.textGray8A,
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
          color: selected ? AppColors.textGray8A : AppColors.textGrayC8,
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: selected
          ? Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(color: AppColors.textGray8A, shape: BoxShape.circle),
            )
          : null,
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({required this.label, required this.value, required this.onChanged});

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
            style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Switch.adaptive(
            value: value,
            activeThumbColor: Colors.white,
            activeTrackColor: AppColors.warningAmber,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: AppColors.textGrayE0,
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
            const Icon(Icons.chevron_right_rounded, color: AppColors.textGrayC0, size: 22),
          ],
        ),
      ),
    );
  }
}

class _InputActionRow extends StatelessWidget {
  const _InputActionRow({required this.label, required this.controller, required this.action});

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
                color: AppColors.textGrayF2,
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
                      decoration: const AppInputDecoration(
                        isDense: true,
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
          color: AppColors.accentNeon,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),
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
          color: AppColors.accentNeon,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
