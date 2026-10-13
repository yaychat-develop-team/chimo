import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app/service/iap_service.dart';
import '../common/theme/app_theme.dart';
import '../modules/splash/page/splash_page.dart';

/// Chimo 根组件：[GetMaterialApp] 一层。
///
/// app 级单例（`ChatsListLogic`）在 [main] 里 `Get.put(..., permanent: true)`；
/// 页面级 Controller 由页面自己 `Get.put` / `Get.delete`。
class ChimoApp extends StatelessWidget {
  const ChimoApp({super.key});

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
          home: const SplashPage(),
          defaultTransition: Transition.native,
        ),
      ),
    );
  }
}
