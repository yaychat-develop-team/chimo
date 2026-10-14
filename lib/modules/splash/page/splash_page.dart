// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../app/app_jumper.dart';
// import '../../../app/auth/onboarding_state.dart';
// import '../../../common/constants/app_assets.dart';
// import '../../../common/theme/app_colors.dart';
// import '../../../common/utils/app_log.dart';
// import '../../../common/widgets/app_image.dart';
// import '../../../common/widgets/app_scaffold.dart';
//
// /// 启动页决策后的去向。测试用 [SplashPage.onNavigate] 接走它来断言出口，
// /// 生产路径不传 —— 默认落 [AppJumper] 的三条清栈跳转。
// enum SplashDestination { login, home, profileSetup }
//
// /// [SplashPage.onNavigate] 的类型。
// typedef SplashDestinationHandler = Future<void> Function(SplashDestination destination);
//
// /// 启动页：上方 launch_bg + 底部 slogan，并负责等冷启动引导出结果。
// ///
// /// `main()` 只点火 [NetworkBootstrap.start] 不 `await` —— 网络慢的时候 `await`
// /// 会把首帧一起拖住，用户看到的是白屏而不是启动页。等结果落在这里。
// ///
// /// **本地有登录态时，引导没出结果之前不跳转**：[NetworkBootstrap.initialize]
// /// 会刷新 / 清掉本地 token，抢在它前面读 [UserStore.currentUser] 会拿到过期的
// /// 登录态；而且那时 token 还没进内存，接着的 `userInfo` 会被当成未登录，
// /// 把老用户送进完善资料流程。
// /// 本地本来就没登录态的（新装 / 已登出）不用等：引导变不出一个 token 来。
// class SplashPage extends StatefulWidget {
//   const SplashPage({
//     super.key,
//     this.displayDuration = const Duration(milliseconds: 1800),
//     this.bootstrapTimeout = const Duration(seconds: 6),
//     this.bootstrap,
//     this.onNavigate,
//   });
//
//   /// 最短展示时长：到点前不跳转，也不显示转圈与失败态
//   /// （正常网络下引导比它快，用户只会看到干净的启动页）。
//   final Duration displayDuration;
//
//   /// 等引导的上限。Dio 自己的 connect / receive 超时是 15s / 20s 且会重试，
//   /// 靠它兜底等于让用户对着启动页发呆，所以这里单独再收一道。
//   final Duration bootstrapTimeout;
//
//   /// 要等的那次引导。生产路径不传 —— 由 [NetworkBootstrap.pending] 提供
//   /// `main()` 点火的那一个；测试用它把三条出口都走一遍，不打真实网络。
//   final Future<void>? bootstrap;
//
//   /// 测试替身：把「去哪」的决定接走，默认实现是 [AppJumper] 的三条出口。
//   /// 生产路径不传。
//   final SplashDestinationHandler? onNavigate;
//
//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }
//
// /// 启动页的四种相位；[showing] 只有启动图，其余三种在图上叠一块状态区。
// enum _SplashPhase { showing, busy, failed, timedOut }
//
// class _SplashPageState extends State<SplashPage> {
//   Timer? _minDisplayTimer;
//   Timer? _bootTimeoutTimer;
//
//   _SplashPhase _phase = _SplashPhase.showing;
//   bool _minDisplayDone = false;
//   bool _bootDone = false;
//   bool _bootFailed = false;
//   bool _timedOut = false;
//   bool _leaving = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _minDisplayTimer = Timer(widget.displayDuration, () {
//       _minDisplayDone = true;
//       _tick();
//     });
//     _watch(widget.bootstrap ?? NetworkBootstrap.pending);
//   }
//
//   @override
//   void dispose() {
//     // 两个 timer 都要收：widget test 里 pump 完就 dispose，
//     // 留下未 cancel 的 timer 会让测试报 "A Timer is still pending"。
//     _minDisplayTimer?.cancel();
//     _bootTimeoutTimer?.cancel();
//     super.dispose();
//   }
//
//   /// 盯住一次引导。[boot] 是 `null` 表示没人点火（直接 pump 本页的 widget
//   /// test）—— 这时不等网络，也不替 `main()` 点火。
//   void _watch(Future<void>? boot) {
//     if (boot == null) {
//       _bootDone = true;
//       return;
//     }
//     _bootTimeoutTimer?.cancel();
//     _bootTimeoutTimer = Timer(widget.bootstrapTimeout, () {
//       _timedOut = true;
//       _tick();
//     });
//     boot.then(
//       (_) {
//         _bootTimeoutTimer?.cancel();
//         _bootDone = true;
//         _tick();
//       },
//       onError: (Object error, StackTrace stack) {
//         // 引导失败不是可以静默的降级：token 没刷新、环信没连上。
//         // 这里必须留一行，否则线上只看得到「用户卡在启动页」。
//         AppLog.w('SplashPage bootstrap failed', error: error, stack: stack);
//         _bootTimeoutTimer?.cancel();
//         _bootDone = true;
//         _bootFailed = true;
//         _tick();
//       },
//     );
//   }
//
//   /// 相位由几个标志算出来，只在真的变了时 setState。
//   void _tick() {
//     if (!mounted || _leaving) return;
//     // 最短展示还没到：转圈与失败态都先不露脸，免得正常冷启动闪一下。
//     if (!_minDisplayDone) return;
//     // 本地没有登录态：引导只会刷新或清掉 token，变不出一个来 —— 去向已经定了。
//     // 新用户不该为了看一眼登录页先等一轮网络。
//     if (!UserStore.currentUser.isLoggedIn) {
//       _leave();
//       return;
//     }
//     // 引导成功就走 —— 包括超时提示已经显示、网络随后又通了的情况。
//     if (_bootDone && !_bootFailed) {
//       _leave();
//       return;
//     }
//     if (_bootFailed) {
//       _setPhase(_SplashPhase.failed);
//     } else if (_timedOut) {
//       _setPhase(_SplashPhase.timedOut);
//     } else {
//       _setPhase(_SplashPhase.busy);
//     }
//   }
//
//   void _setPhase(_SplashPhase phase) {
//     if (_phase == phase) return;
//     setState(() => _phase = phase);
//   }
//
//   /// 重试：丢掉上一次的失败结果，重新引导并重新计时。
//   void _retry() {
//     _bootDone = false;
//     _bootFailed = false;
//     _timedOut = false;
//     _setPhase(_SplashPhase.busy);
//     _watch(NetworkBootstrap.restart());
//   }
//
//   /// 失败 / 超时时的出口：带着本地登录态往下走，不把人留在启动页。
//   void _continueAnyway() {
//     if (_leaving) return;
//     _leave();
//   }
//
//   void _leave() {
//     _leaving = true;
//     unawaited(_goNext());
//   }
//
//   Future<void> _goNext() async {
//     if (!mounted) return;
//     final loggedIn = UserStore.currentUser.isLoggedIn;
//     if (!loggedIn) {
//       await _leaveTo(SplashDestination.login);
//       return;
//     }
//     bool goHome;
//     try {
//       // 走「继续」进来时网络本就有问题，这一步的 userInfo 同样可能挂住。
//       goHome = await OnboardingState.shouldEnterHome().timeout(widget.bootstrapTimeout);
//     } on TimeoutException {
//       // 问不到服务端就只能信本地标记：走完引导的老用户直接进壳层。
//       goHome = UserStore.currentUser.onboardingCompleted;
//     }
//     if (!mounted) return;
//     await _leaveTo(goHome ? SplashDestination.home : SplashDestination.profileSetup);
//   }
//
//   Future<void> _leaveTo(SplashDestination destination) async {
//     final handler = widget.onNavigate;
//     if (handler != null) {
//       await handler(destination);
//       return;
//     }
//     switch (destination) {
//       case SplashDestination.login:
//         AppJumper.toLoginAndClear();
//       case SplashDestination.home:
//         AppJumper.toShellAndClear();
//       case SplashDestination.profileSetup:
//         AppJumper.toProfileSetupAndClear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final bottom = MediaQuery.paddingOf(context).bottom;
//
//     return ChimoScaffold(
//       showNav: false,
//       safeArea: false,
//       backgroundColor: AppColors.surface,
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               // Logo 与字标已在资源内；按宽度适配以保持在屏幕上方。
//               AppImage(AppAssets.launchBg, width: Get.width, fit: BoxFit.fitWidth),
//               const Spacer(),
//               AppImage(AppAssets.splashSlogan, height: 15, fit: BoxFit.contain),
//               SizedBox(height: 54 + bottom),
//             ],
//           ),
//           // 状态区叠在 slogan 上方，而不是塞进上面那个 Column：
//           // 多出来的两行按钮会把启动图挤变形。
//           Positioned(left: 24, right: 24, bottom: 89 + bottom, child: _buildStatus()),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatus() {
//     switch (_phase) {
//       case _SplashPhase.showing:
//         return const SizedBox.shrink();
//       case _SplashPhase.busy:
//         return const Center(
//           child: SizedBox(
//             width: 22,
//             height: 22,
//             child: CircularProgressIndicator(strokeWidth: 2.2, color: AppColors.primaryBright),
//           ),
//         );
//       case _SplashPhase.failed:
//       case _SplashPhase.timedOut:
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               _phase == _SplashPhase.failed
//                   ? "Couldn't reach the server.\n"
//                         'Check your connection and try again.'
//                   : 'The network is slower than usual.',
//               textAlign: TextAlign.center,
//               style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.4),
//             ),
//             const SizedBox(height: 4),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextButton(onPressed: _retry, child: const Text('Retry')),
//                 TextButton(onPressed: _continueAnyway, child: const Text('Continue')),
//               ],
//             ),
//           ],
//         );
//     }
//   }
// }
