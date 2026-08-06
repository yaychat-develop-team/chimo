import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/repositories/repositories.dart';
import '../features/auth/almost_in_page.dart';
import '../features/auth/login_page.dart';
import '../features/auth/phone_login_page.dart';
import '../features/auth/popular_tribes_page.dart';
import '../features/auth/profile_setup_page.dart';
import '../features/auth/verification_code_page.dart';
import '../features/auth/welcome_brand_page.dart';
import '../features/chats/chat_detail_page.dart';
import '../features/chats/data/chats_list_controller.dart';
import '../features/friends/add_user_page.dart';
import '../features/friends/friends_page.dart';
import '../features/home/chat_user_profile_page.dart';
import '../features/home/group_details_page.dart';
import '../features/me/bind_email_page.dart';
import '../features/me/models/me_models.dart';
import '../features/me/settings_page.dart';
import '../features/profile/edit_profile_page.dart';
import '../core/constants/app_assets.dart';
import '../features/shell/main_tab_shell.dart';
import '../features/splash/splash_page.dart';
import '../shared/models/chat_conversation.dart';
import '../shared/models/chat_user_profile.dart';
import '../shared/models/group_item.dart';

/// Central app routes.
abstract final class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const phoneLogin = '/login/phone';
  static const verify = '/login/verify';
  static const profileSetup = '/onboarding/profile';
  static const almostIn = '/onboarding/almost-in';
  static const welcomeBrand = '/onboarding/welcome';
  static const tribes = '/onboarding/tribes';
  static const shell = '/app';
  static const chat = '/app/chat/:id';
  static const group = '/app/group/:id';
  static const profile = '/app/profile/:id';
  static const friends = '/app/friends';
  static const addUser = '/app/add-user';
  static const settings = '/app/settings';
  static const editProfile = '/app/edit-profile';
  /// Outside `/app` so email login works before auth redirect.
  static const bindEmail = '/bind-email';

  static String chatPath(String id) => '/app/chat/$id';
  static String groupPath(String id) => '/app/group/$id';
  static String profilePath(String id) => '/app/profile/$id';
  static String verifyPath(String phone) =>
      '/login/verify?phone=${Uri.encodeQueryComponent(phone)}';
  static const bindEmailLogin = '/bind-email?login=1';
}

GoRouter createAppRouter({required ChatsListController chatsController}) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (context, state) async {
      final loc = state.matchedLocation;
      // Splash decides after its own delay.
      if (loc == AppRoutes.splash) return null;

      final loggedIn = await context.read<AuthRepository>().isLoggedIn();
      final goingToApp = loc.startsWith('/app');

      if (!loggedIn && goingToApp) return AppRoutes.login;
      // Allow onboarding while already marked logged-in (post-OTP).
      if (loggedIn && loc == AppRoutes.login) return AppRoutes.shell;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (_, _) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (_, _) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.phoneLogin,
        builder: (_, _) => const PhoneLoginPage(),
      ),
      GoRoute(
        path: AppRoutes.verify,
        builder: (_, state) {
          final phone = state.uri.queryParameters['phone'] ?? '';
          return VerificationCodePage(phone: phone);
        },
      ),
      GoRoute(
        path: AppRoutes.profileSetup,
        builder: (_, _) => const ProfileSetupPage(),
      ),
      GoRoute(
        path: AppRoutes.almostIn,
        builder: (_, _) => const AlmostInPage(),
      ),
      GoRoute(
        path: AppRoutes.welcomeBrand,
        builder: (_, _) => const WelcomeBrandPage(),
      ),
      GoRoute(
        path: AppRoutes.tribes,
        builder: (_, _) => const PopularTribesPage(),
      ),
      GoRoute(
        path: AppRoutes.shell,
        builder: (_, _) => const MainTabShell(),
      ),
      GoRoute(
        path: AppRoutes.chat,
        builder: (_, state) {
          final id = state.pathParameters['id']!;
          final extra = state.extra;
          ChatConversation? conversation;
          if (extra is ChatConversation) {
            conversation = extra;
          } else {
            for (final c in chatsController.conversations) {
              if (c.id == id) {
                conversation = c;
                break;
              }
            }
          }
          conversation ??= ChatConversation(
            id: id,
            title: 'Chat',
            avatarAsset: AppAssets.avatarPlace,
            lastMessage: '',
            timeLabel: 'Just',
          );
          return ChatDetailPage(
            conversation: conversation,
            chatsController: chatsController,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.group,
        builder: (_, state) {
          final id = state.pathParameters['id']!;
          final extra = state.extra;
          final group = extra is PopularGroupItem
              ? extra
              : PopularGroupItem(
                  id: id,
                  name: 'Group',
                  category: 'Community',
                  description: '',
                  avatarAsset: AppAssets.avatarPlace,
                  memberCount: 0,
                  postCount: 0,
                  level: 1,
                  isJoined: chatsController.isGroupJoined(id),
                );
          return GroupDetailsPage(
            group: group,
            chatsController: chatsController,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (_, state) {
          final profile = state.extra is ChatUserProfile
              ? state.extra! as ChatUserProfile
              : ChatUserProfile.placeholder(
                  id: state.pathParameters['id'] ?? '',
                );
          return ChatUserProfilePage(
            profile: profile,
            chatsController: chatsController,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.friends,
        builder: (_, _) => const FriendsPage(),
      ),
      GoRoute(
        path: AppRoutes.addUser,
        builder: (_, _) => const AddUserPage(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (_, _) => const SettingsPage(),
      ),
      GoRoute(
        path: AppRoutes.editProfile,
        builder: (_, _) => const EditProfilePage(profile: MeProfile.empty),
      ),
      GoRoute(
        path: AppRoutes.bindEmail,
        builder: (_, state) {
          final forLogin = state.uri.queryParameters['login'] == '1';
          return BindEmailPage(forLogin: forLogin);
        },
      ),
    ],
  );
}
