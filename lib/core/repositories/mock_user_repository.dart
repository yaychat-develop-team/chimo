import '../../features/friends/data/friends_mock_data.dart';
import '../../shared/models/friend_user.dart';
import 'repositories.dart';

class MockUserRepository implements UserRepository {
  @override
  List<FriendUser> friends() => List<FriendUser>.of(FriendsMockData.all);
}
