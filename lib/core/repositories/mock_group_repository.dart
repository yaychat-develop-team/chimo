import '../../features/home/data/group_members_mock_data.dart';
import '../../features/home/data/home_mock_data.dart';
import '../../shared/models/group_item.dart';
import 'repositories.dart';

class MockGroupRepository implements GroupRepository {
  @override
  List<PopularGroupItem> popularGroups() =>
      List<PopularGroupItem>.of(HomeMockData.popularGroups);

  @override
  List<MyGroupItem> myGroups() => HomeMockData.joinedGroups
      .map((g) => g.toMyGroupItem())
      .toList(growable: false);

  @override
  List<GroupMember> membersFor(String groupId) =>
      List<GroupMember>.of(GroupMembersMockData.members);
}
