import '../../shared/models/chat_conversation.dart';
import '../../shared/models/friend_user.dart';
import '../../shared/models/group_item.dart';
import '../../shared/models/group_member.dart';

/// Auth persistence / credentials (local for now).
abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<void> markLoggedIn({String? method, String? phone});
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
  /// Mutual follows only — Friends tab.
  List<FriendUser> friends();

  /// Everyone I follow (mutual + one-way) — Follow tab.
  List<FriendUser> following();

  /// Everyone who follows me (mutual + one-way) — Followers tab.
  List<FriendUser> followers();

  /// Full graph for the contacts screen (all three relations).
  List<FriendUser> allRelations();
}
