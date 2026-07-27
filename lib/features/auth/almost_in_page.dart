import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import 'welcome_brand_page.dart';

/// 注册收尾：头像 + 昵称。
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
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder<void>(
        pageBuilder: (_, _, _) => const WelcomeBrandPage(),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 420),
      ),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 16 + bottom),
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
                        width: 40,
                        height: 40,
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.backArrow,
                            width: 8,
                            height: 14,
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
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'A great profile picture and nickname help you stand out.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 48),
                Center(
                  child: SizedBox(
                    width: 128,
                    height: 128,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            AppAssets.defaultAvatar,
                            width: 128,
                            height: 128,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: -2,
                          bottom: -2,
                          child: Image.asset(
                            AppAssets.cameraIcon,
                            width: 36,
                            height: 36,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: _nickController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: AppColors.primaryBright,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isCollapsed: true,
                      hintText: 'Nickname',
                      hintStyle: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Material(
                  color: AppColors.primaryBright,
                  borderRadius: BorderRadius.circular(28),
                  child: InkWell(
                    onTap: _onLetsGo,
                    borderRadius: BorderRadius.circular(28),
                    child: const SizedBox(
                      height: 54,
                      child: Center(
                        child: Text(
                          "Let's Go!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
