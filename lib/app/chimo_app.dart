import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/theme/app_theme.dart';
import '../features/chats/data/chats_list_controller.dart';
import 'app_providers.dart';
import 'app_router.dart';

/// Chimo root: DI + [MaterialApp.router].
class ChimoApp extends StatelessWidget {
  const ChimoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppProviders(
      child: _ChimoAppView(),
    );
  }
}

class _ChimoAppView extends StatefulWidget {
  const _ChimoAppView();

  @override
  State<_ChimoAppView> createState() => _ChimoAppViewState();
}

class _ChimoAppViewState extends State<_ChimoAppView> {
  GoRouter? _router;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _router ??= createAppRouter(
      chatsController: context.read<ChatsListController>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chimo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: _router!,
    );
  }
}
