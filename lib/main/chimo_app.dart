import 'package:chimo/app/session_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app/service/iap_service.dart';
import '../common/constants/app_assets.dart';
import '../common/theme/app_theme.dart';
import '../common/widgets/app_image.dart';
import '../modules/auth/page/login_page.dart';
import '../modules/auth/page/profile_setup_page.dart';
import '../modules/shell/page/main_tab_shell.dart';
import 'main_init.dart';

/// Chimo 根组件：[GetMaterialApp] 一层。
///
/// app 级单例（`ChatsListLogic`）在 [main] 里 `Get.put(..., permanent: true)`；
/// 页面级 Controller 由页面自己 `Get.put` / `Get.delete`。

class ChimoApp extends StatefulWidget {
  const ChimoApp({super.key});

  @override
  State<ChimoApp> createState() => _ChimoAppState();
}

class _ChimoAppState extends State<ChimoApp> {
  bool loading = true;
  @override
  void initState() {
    super.initState();
    _launchLoading();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: GetMaterialApp(
          title: 'Chimo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark,
          scaffoldMessengerKey: IapService.scaffoldMessengerKey,
          home: _renderHome(),
          defaultTransition: Transition.native,
        ),
      ),
    );
  }

  Widget _renderHome() {
    final bottom = MediaQuery.paddingOf(context).bottom;
    if (loading) {
      return Column(
        children: [
          // Logo 与字标已在资源内；按宽度适配以保持在屏幕上方。
          AppImage(AppAssets.launchBg, width: Get.width, fit: BoxFit.fitWidth),
          const Spacer(),
          AppImage(AppAssets.splashSlogan, height: 15, fit: BoxFit.contain),
          SizedBox(height: 54 + bottom),
        ],
      );
    }
    if(SessionInfo.hasLogin) {
      if(SessionInfo.currentUser?.isRegister == true) {
        return MainTabShell();
      } else {
        return ProfileSetupPage();
      }
    }
    return LoginPage();
  }

  Future<void> _launchLoading() async {
    await MainInit.launchInit();
    loading = false;
    if(mounted) setState(() {});
  }
}
