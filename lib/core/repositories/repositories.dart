/// 认证持久化 / 凭证（本地会话文件）。
abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<void> markLoggedIn({String? method, String? phone});
  Future<void> clear();
  Future<String?> phone();
}
