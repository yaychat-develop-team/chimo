import 'package:chimo/features/chats/data/chats_list_controller.dart';
import 'package:chimo/shared/models/chat_conversation.dart';
import 'package:chimo/shared/models/group_item.dart';
import 'package:flutter_test/flutter_test.dart';

/// Fixture helpers for unit tests only (not app mock data).
ChatConversation _dm(String id, {int unread = 0, String last = 'hi'}) {
  return ChatConversation(
    id: id,
    title: id,
    avatarAsset: 'a.png',
    lastMessage: last,
    timeLabel: 'Just',
    unreadCount: unread,
  );
}

PopularGroupItem _group(String id, {String description = ''}) =>
    PopularGroupItem(
      id: id,
      name: 'Group $id',
      category: 'Community',
      description: description.isEmpty ? 'desc $id' : description,
      avatarAsset: 'g.png',
      memberCount: 10,
      postCount: 1,
      level: 1,
    );

void main() {
  late ChatsListController controller;

  setUp(() {
    controller = ChatsListController();
    // Seed via public APIs — list starts empty (no repository seed).
    controller.upsertPrivateChat(_dm('user_a', unread: 2, last: 'hi'));
    controller.upsertPrivateChat(_dm('user_b', unread: 3, last: 'yo'));
  });

  tearDown(() {
    controller.dispose();
  });

  test('starts empty until rows are upserted', () {
    final empty = ChatsListController();
    addTearDown(empty.dispose);
    expect(empty.conversations, isEmpty);
    expect(empty.totalUnread, 0);
  });

  test('upserted conversations total unread', () {
    expect(controller.conversations, hasLength(2));
    expect(controller.totalUnread, 5);
  });

  test('togglePin moves conversation to pinned section', () {
    controller.togglePin('user_b');
    expect(controller.pinnedIds, ['user_b']);
    expect(controller.visibleConversations.first.id, 'user_b');
    expect(controller.visibleConversations.first.isPinned, isTrue);

    controller.togglePin('user_b');
    expect(controller.pinnedIds, isEmpty);
    expect(controller.visibleConversations.first.isPinned, isFalse);
  });

  test('delete removes conversation and unread without leaving group', () {
    controller.joinGroup(_group('g1'));
    expect(controller.isGroupJoined('g1'), isTrue);

    controller.delete('g1');
    expect(controller.conversations.any((c) => c.id == 'g1'), isFalse);
    expect(controller.isGroupJoined('g1'), isTrue);

    controller.delete('user_a');
    expect(controller.totalUnread, 3);
  });

  test('deleted rows stay hidden until a new message restores them', () {
    controller.joinGroup(_group('g1'));
    controller.delete('g1');
    controller.delete('user_a');

    // Simulates refresh re-upserting a joined group (must stay hidden).
    controller.upsertJoinedGroup(_group('g1'));
    expect(controller.conversations.any((c) => c.id == 'g1'), isFalse);
    expect(controller.isGroupJoined('g1'), isTrue);

    controller.onNewMessage(
      id: 'g1',
      title: 'Group g1',
      avatarAsset: 'g.png',
      lastMessage: 'hello group',
      badge: ChatBadgeType.group,
      unreadDelta: 1,
    );
    expect(controller.conversations.any((c) => c.id == 'g1'), isTrue);
  });

  test('joinGroup upserts conversation and records membership', () {
    controller.joinGroup(_group('g1'));
    expect(controller.isGroupJoined('g1'), isTrue);
    expect(controller.conversations.first.id, 'g1');
    expect(controller.conversations.first.badge, ChatBadgeType.group);

    controller.joinGroup(_group('g1', description: 'updated'));
    expect(controller.conversations.where((c) => c.id == 'g1'), hasLength(1));
    expect(
      controller.conversations
          .firstWhere((c) => c.id == 'g1')
          .groupDescription,
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
    controller.markRead('user_a');
    expect(
      controller.conversations.firstWhere((c) => c.id == 'user_a').unreadCount,
      0,
    );
    expect(controller.totalUnread, 3);

    controller.markRead('user_a');
    expect(controller.totalUnread, 3);
  });

  test('onNewMessage bumps unread and restores deleted rows', () {
    controller.delete('user_a');
    controller.onNewMessage(
      id: 'user_a',
      title: 'Alice',
      avatarAsset: 'a.png',
      lastMessage: 'back',
      unreadDelta: 1,
    );
    expect(controller.conversations.first.id, 'user_a');
    expect(controller.conversations.first.unreadCount, 1);
    expect(controller.conversations.first.lastMessage, 'back');
  });
}
