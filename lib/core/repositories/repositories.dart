/// Auth persistence / credentials (local session file).
abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<void> markLoggedIn({String? method, String? phone});
  Future<void> clear();
  Future<String?> phone();
}
