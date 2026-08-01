import '../auth/auth_session.dart';
import 'repositories.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<bool> isLoggedIn() => AuthSession.isLoggedIn();

  @override
  Future<void> markLoggedIn({String method = 'phone', String? phone}) =>
      AuthSession.markLoggedIn(method: method, phone: phone);

  @override
  Future<void> clear() => AuthSession.clear();

  @override
  Future<String?> phone() => AuthSession.phone();
}
