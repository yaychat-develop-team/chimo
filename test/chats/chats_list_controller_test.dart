import 'package:chimo/core/repositories/repositories.dart';
import 'package:chimo/features/chats/data/chats_list_controller.dart';
import 'package:chimo/shared/models/chat_conversation.dart';
import 'package:chimo/shared/models/group_item.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeChatRepository implements ChatRepository {
  @override
  List<ChatConversation> seedConversations() => [
        const ChatConversation(
          id: 'dm_a',
          title: 'Alice',
          avatarAsset: 'a.png',
          lastMessage: 'hi',
          timeLabel: 'Just',
          unreadCount: 2,
        ),
        const ChatConversation(
          id: 'dm_b',
          title: 'Bob',
          avatarAsset: 'b.png',
          lastMessage: 'yo',
          timeLabel: '1m',
          unreadCount: 3,
        ),
      ];
}

PopularGroupItem _group(String id) => PopularGroupItem(
      id: id,
      name: 'Group $id',
      category: 'Community',
      description: 'desc $id',
      avatarAsset: 'g.png',
      memberCount: 10,
      postCount: 1,
      level: 1,
    );

void main() {
  late ChatsListController controller;

  setUp(() {
    controller = ChatsListController(chatRepository: _FakeChatRepository());
  });

  tearDown(() {
    controller.dispose();
  });

  test('seeds conversations and totals unread', () {
    expect(controller.conversations, hasLength(2));
    expect(controller.totalUnread, 5);
  });

  test('togglePin moves conversation to pinned section', () {
    controller.togglePin('dm_b');
    expect(controller.pinnedIds, ['dm_b']);
    expect(controller.visibleConversations.first.id, 'dm_b');
    expect(controller.visibleConversations.first.isPinned, isTrue);

    controller.togglePin('dm_b');
    expect(controller.pinnedIds, isEmpty);
    expect(controller.visibleConversations.first.isPinned, isFalse);
  });

  test('delete removes conversation and unread without leaving group', () {
    controller.joinGroup(_group('g1'));
    expect(controller.isGroupJoined('g1'), isTrue);

    controller.delete('g1');
    expect(controller.conversations.any((c) => c.id == 'g1'), isFalse);
    expect(controller.isGroupJoined('g1'), isTrue);

    controller.delete('dm_a');
    expect(controller.totalUnread, 3);
  });

  test('joinGroup upserts conversation and records membership', () {
    controller.joinGroup(_group('g1'));
    expect(controller.isGroupJoined('g1'), isTrue);
    expect(controller.conversations.first.id, 'g1');
    expect(controller.conversations.first.badge, ChatBadgeType.group);

    controller.joinGroup(
      _group('g1').copyWith(description: 'updated'),
    );
    expect(controller.conversations.where((c) => c.id == 'g1'), hasLength(1));
    expect(
      controller.conversations.firstWhere((c) => c.id == 'g1').lastMessage,
      'updated',
    );
  });

  test('leaveGroup clears membership but keeps conversation row', () {
    controller.joinGroup(_group('g1'));
    controller.leaveGroup('g1');
    expect(controller.isGroupJoined('g1'), isFalse);
    expect(controller.conversations.any((c) => c.id == 'g1'), isTrue);
  });

  test('markRead clears unread for one conversation', () {
    expect(controller.totalUnread, 5);
    controller.markRead('dm_a');
    expect(
      controller.conversations.firstWhere((c) => c.id == 'dm_a').unreadCount,
      0,
    );
    expect(controller.totalUnread, 3);

    controller.markRead('dm_a');
    expect(controller.totalUnread, 3);
  });

  test('onNewMessage bumps unread and restores deleted rows', () {
    controller.delete('dm_a');
    controller.onNewMessage(
      id: 'dm_a',
      title: 'Alice',
      avatarAsset: 'a.png',
      lastMessage: 'back',
      unreadDelta: 1,
    );
    expect(controller.conversations.first.id, 'dm_a');
    expect(controller.conversations.first.unreadCount, 1);
    expect(controller.conversations.first.lastMessage, 'back');
  });
}
