import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/repositories/mock_auth_repository.dart';
import '../core/repositories/mock_chat_repository.dart';
import '../core/repositories/mock_group_repository.dart';
import '../core/repositories/mock_user_repository.dart';
import '../core/repositories/repositories.dart';
import '../features/chats/data/chats_list_controller.dart';

/// Root DI: repositories + shared [ChatsListController].
class AppProviders extends StatelessWidget {
  const AppProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final chatRepository = MockChatRepository();
    final authRepository = MockAuthRepository();
    final groupRepository = MockGroupRepository();
    final userRepository = MockUserRepository();

    return MultiProvider(
      providers: [
        Provider<AuthRepository>.value(value: authRepository),
        Provider<ChatRepository>.value(value: chatRepository),
        Provider<GroupRepository>.value(value: groupRepository),
        Provider<UserRepository>.value(value: userRepository),
        ChangeNotifierProvider<ChatsListController>(
          create: (_) => ChatsListController(chatRepository: chatRepository),
        ),
      ],
      child: child,
    );
  }
}
