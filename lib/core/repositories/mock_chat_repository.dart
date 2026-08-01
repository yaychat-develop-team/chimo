import '../../features/chats/data/chats_mock_data.dart';
import '../../shared/models/chat_conversation.dart';
import 'repositories.dart';

class MockChatRepository implements ChatRepository {
  @override
  List<ChatConversation> seedConversations() =>
      List<ChatConversation>.of(ChatsMockData.conversations);
}
