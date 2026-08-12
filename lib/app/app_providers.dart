import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/network/network_bootstrap.dart';
import '../core/repositories/repositories.dart';
import '../core/repositories/session_auth_repository.dart';
import '../features/chats/data/chats_list_controller.dart';

/// 根级依赖注入：认证会话 + 共享的 [ChatsListController]。
class AppProviders extends StatelessWidget {
  const AppProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepository>.value(value: SessionAuthRepository()),
        ChangeNotifierProvider<ChatsListController>(
          create: (_) {
            final controller = ChatsListController();
            NetworkBootstrap.onSessionCleared =
                () => controller.clearLocalState();
            return controller;
          },
        ),
      ],
      child: child,
    );
  }
}
