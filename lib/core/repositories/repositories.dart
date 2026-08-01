import '../../shared/models/chat_conversation.dart';
import '../../shared/models/friend_user.dart';
import '../../shared/models/group_item.dart';
import '../../shared/models/group_member.dart';

/// Auth persistence / credentials (local for now).
abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<void> markLoggedIn({String method = 'phone', String? phone});
  Future<void> clear();
  Future<String?> phone();
}

/// Conversation list and membership.
abstract class ChatRepository {
  List<ChatConversation> seedConversations();
}

/// Groups catalog / members.
abstract class GroupRepository {
  List<PopularGroupItem> popularGroups();
  List<MyGroupItem> myGroups();
  List<GroupMember> membersFor(String groupId);
}

/// Social graph (friends / follows).
abstract class UserRepository {
  List<FriendUser> friends();
}
