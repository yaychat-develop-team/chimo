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
    this.micEffect = '',
    this.boss = false,
    this.downMicAt = 0,
    this.counterAt = 0,
    this.heartLinkCardStatus = 0,
  });

  final int index;
  final int? uid;
  final String name;
  final String avatar;
  final bool micOpen;
  final bool speaking;
  final int contribution;
  final String frame;

  /// 说话时麦位光环（佩戴 MIC_EFFECT）。对齐 joyride `user.micEffect`。
  final String micEffect;
  final bool boss;

  /// 下麦截止时间（unix 秒）。0 表示不限时。
  final int downMicAt;

  /// Heart Link Boss 麦上计时截止（unix 秒）。
  final int counterAt;

  /// Heart Link 神秘卡状态：1 = 可展示。
  final int heartLinkCardStatus;

  bool get occupied => uid != null && uid! > 0;

  /// 剩余上麦秒数。≤0 表示已到期或不限时。
  int remainSeconds([DateTime? now]) {
    if (downMicAt <= 0) return 0;
    final seconds = now?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch;
    return downMicAt - seconds ~/ 1000;
  }

  MicSeat copyWith({
    bool? speaking,
    bool? micOpen,
    int? downMicAt,
    int? counterAt,
    int? heartLinkCardStatus,
  }) {
    return MicSeat(
      index: index,
      uid: uid,
      name: name,
      avatar: avatar,
      micOpen: micOpen ?? this.micOpen,
      speaking: speaking ?? this.speaking,
      contribution: contribution,
      frame: frame,
      micEffect: micEffect,
      boss: boss,
      downMicAt: downMicAt ?? this.downMicAt,
      counterAt: counterAt ?? this.counterAt,
      heartLinkCardStatus: heartLinkCardStatus ?? this.heartLinkCardStatus,
    );
  }
}
