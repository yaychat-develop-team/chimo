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

  bool get occupied => uid != null && uid! > 0;

  MicSeat copyWith({bool? speaking, bool? micOpen}) {
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
    );
  }
}
