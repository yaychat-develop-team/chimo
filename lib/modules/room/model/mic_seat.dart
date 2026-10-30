/// 一个麦位的展示数据。空位 [uid] 为 null。
class MicSeat {
  const MicSeat({
    required this.index,
    this.uid,
    this.name = '',
    this.avatar = '',
    this.micOpen = false,
    this.speaking = false,
    this.contribution = 0,
    this.frame = '',
    this.boss = false,
    this.downMicAt = 0,
  });

  final int index;
  final int? uid;
  final String name;
  final String avatar;
  final bool micOpen;
  final bool speaking;
  final int contribution;
  final String frame;
  final bool boss;

  /// 下麦截止时间（unix 秒）。0 表示不限时。
  final int downMicAt;

  bool get occupied => uid != null && uid! > 0;

  /// 剩余上麦秒数。≤0 表示已到期或不限时。
  int remainSeconds([DateTime? now]) {
    if (downMicAt <= 0) return 0;
    final seconds = now?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch;
    return downMicAt - seconds ~/ 1000;
  }

  MicSeat copyWith({bool? speaking, bool? micOpen, int? downMicAt}) {
    return MicSeat(
      index: index,
      uid: uid,
      name: name,
      avatar: avatar,
      micOpen: micOpen ?? this.micOpen,
      speaking: speaking ?? this.speaking,
      contribution: contribution,
      frame: frame,
      boss: boss,
      downMicAt: downMicAt ?? this.downMicAt,
    );
  }
}
