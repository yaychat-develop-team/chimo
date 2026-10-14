/// [RoomService.join] 的结果。密码房停在页面上，由页面弹输入框。
class RoomJoinResult {
  const RoomJoinResult._({required this.ok, this.needPassword = false, this.message = ''});

  const RoomJoinResult.ok() : this._(ok: true);

  const RoomJoinResult.password() : this._(ok: false, needPassword: true);

  const RoomJoinResult.fail(String message) : this._(ok: false, message: message);

  final bool ok;
  final bool needPassword;
  final String message;
}
