/// 房间礼物面板里可选的收礼人。
class RoomGiftReceiver {
  const RoomGiftReceiver({
    required this.uid,
    required this.name,
    this.avatar = '',
  });

  final String uid;
  final String name;
  final String avatar;
}
