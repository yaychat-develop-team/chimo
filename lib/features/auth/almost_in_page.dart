import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_router.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';

/// Registration finale: avatar + nickname (Figma 完善资料 — You're almost in!).
class AlmostInPage extends StatefulWidget {
  const AlmostInPage({super.key});

  @override
  State<AlmostInPage> createState() => _AlmostInPageState();
}

class _AlmostInPageState extends State<AlmostInPage> {
  late final TextEditingController _nickController;

  @override
  void initState() {
    super.initState();
    final id = 1000000 + Random().nextInt(9000000);
    _nickController = TextEditingController(text: 's·$id');
  }

  @override
  void dispose() {
    _nickController.dispose();
    super.dispose();
  }

  void _onLetsGo() {
    final nick = _nickController.text.trim();
    if (nick.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a nickname'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    context.go(AppRoutes.welcomeBrand);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0A14),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 16, 30, 16 + bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Material(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: 36,
                        height: 36,
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.backArrow,
                            width: 7,
                            height: 12,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  "You're almost in!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'A great profile picture and nickname help you stand out.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: 112,
                    height: 112,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            AppAssets.defaultAvatar,
                            width: 112,
                            height: 112,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Image.asset(
                              AppAssets.friendsEmpty,
                              width: 112,
                              height: 112,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Image.asset(
                            AppAssets.cameraIcon,
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                Container(
                  height: 54,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: TextField(
                    controller: _nickController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: AppColors.accentLime,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                      hintText: 'Enter a nickname',
                      hintStyle: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 110),
                Center(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _onLetsGo,
                      borderRadius: BorderRadius.circular(27),
                      child: Ink(
                        width: 134,
                        height: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          gradient: AppColors.promoBannerGradient,
                        ),
                        child: const Center(
                          child: Text(
                            "Let's Go!",
                            style: TextStyle(
                              color: AppColors.promoText,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
