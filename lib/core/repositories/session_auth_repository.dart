import '../auth/auth_session.dart';
import 'repositories.dart';

/// [AuthRepository] backed by [AuthSession] (local JSON session).
class SessionAuthRepository implements AuthRepository {
  @override
  Future<bool> isLoggedIn() => AuthSession.isLoggedIn();

  @override
  Future<void> markLoggedIn({String? method, String? phone}) =>
      AuthSession.markLoggedIn(method: method, phone: phone);

  @override
  Future<void> clear() => AuthSession.clear();

  @override
  Future<String?> phone() => AuthSession.phone();
}
