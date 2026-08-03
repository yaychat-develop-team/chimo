import '../../features/friends/data/friends_mock_data.dart';
import '../../shared/models/friend_user.dart';
import 'repositories.dart';

class MockUserRepository implements UserRepository {
  @override
  List<FriendUser> friends() =>
      FriendsMockData.byRelation(FriendRelation.mutual);

  @override
  List<FriendUser> following() => FriendsMockData.all
      .where(
        (u) =>
            u.relation == FriendRelation.mutual ||
            u.relation == FriendRelation.following,
      )
      .toList(growable: false);

  @override
  List<FriendUser> followers() => FriendsMockData.all
      .where(
        (u) =>
            u.relation == FriendRelation.mutual ||
            u.relation == FriendRelation.follower,
      )
      .toList(growable: false);

  @override
  List<FriendUser> allRelations() => List<FriendUser>.of(FriendsMockData.all);
}
