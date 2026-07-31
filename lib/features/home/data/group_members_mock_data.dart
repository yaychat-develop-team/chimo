import '../../../core/constants/app_assets.dart';

/// A group member entry.
class GroupMember {
  const GroupMember({
    required this.id,
    required this.nickname,
    required this.avatarAsset,
    required this.isMale,
  });

  final String id;
  final String nickname;
  final String avatarAsset;
  final bool isMale;
}

/// Mock list of group members.
abstract final class GroupMembersMockData {
  static const List<GroupMember> members = [
    GroupMember(
      id: '1',
      nickname: 'CandyPop',
      avatarAsset: AppAssets.avatarPlace,
      isMale: false,
    ),
    GroupMember(
      id: '2',
      nickname: 'Priya',
      avatarAsset: AppAssets.avatarPlace,
      isMale: true,
    ),
    GroupMember(
      id: '3',
      nickname: 'MarcusReed',
      avatarAsset: AppAssets.avatarPlace,
      isMale: true,
    ),
    GroupMember(
      id: '4',
      nickname: 'Leo',
      avatarAsset: AppAssets.avatarPlace,
      isMale: false,
    ),
    GroupMember(
      id: '5',
      nickname: 'AlexTheExplorer',
      avatarAsset: AppAssets.avatarPlace,
      isMale: true,
    ),
    GroupMember(
      id: '6',
      nickname: 'Emily Johnson',
      avatarAsset: AppAssets.avatarPlace,
      isMale: false,
    ),
    GroupMember(
      id: '7',
      nickname: 'Amanda Taylor',
      avatarAsset: AppAssets.avatarPlace,
      isMale: false,
    ),
    GroupMember(
      id: '8',
      nickname: 'Matthew Davis',
      avatarAsset: AppAssets.avatarPlace,
      isMale: true,
    ),
    GroupMember(
      id: '9',
      nickname: 'Sofia Chen',
      avatarAsset: AppAssets.avatarPlace,
      isMale: false,
    ),
    GroupMember(
      id: '10',
      nickname: 'Noah Park',
      avatarAsset: AppAssets.avatarPlace,
      isMale: true,
    ),
  ];
}
