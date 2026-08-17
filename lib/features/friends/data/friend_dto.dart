import '../../../core/constants/app_assets.dart';
import '../../../core/network/api_client.dart';
import '../../../core/utils/zodiac.dart';
import '../../../shared/models/friend_user.dart';

/// 将 `/user-relation/search-*` JSON 映射为 [FriendUser]。
abstract final class FriendDto {
  static List<FriendUser> parseList(
    ApiResponse response, {
    required FriendRelation relation,
  }) {
    if (!response.success) return const [];
    final data = response.data;
    // 兼容 `{ userList: [...] }` 与裸列表。
    if (data is List) {
      return [
        for (final item in data)
          if (item is Map)
            fromUserMap(Map<String, dynamic>.from(item), relation: relation),
      ];
    }
    if (data is! Map) return const [];
    final list = data['userList'] ?? data['list'] ?? data['users'];
    if (list is! List) return const [];
    return [
      for (final item in list)
        if (item is Map)
          fromUserMap(Map<String, dynamic>.from(item), relation: relation),
    ];
  }

  /// `GET /search?no=` → `data.users`（兼兼容 `userList`）。
  static List<FriendUser> parseHomeSearch(ApiResponse response) {
    if (!response.success) return const [];
    final data = response.data;
    if (data is! Map) return const [];
    final map = Map<String, dynamic>.from(data);
    final list = map['users'] ?? map['userList'] ?? map['list'];
    if (list is! List) return const [];
    return [
      for (final item in list)
        if (item is Map)
          fromUserMap(
            Map<String, dynamic>.from(item),
            relation: FriendRelation.follower,
          ),
    ];
  }

  static FriendUser fromUserMap(
    Map<String, dynamic> json, {
    required FriendRelation relation,
  }) {
    final id = '${json['id'] ?? ''}';
    var avatar = '${json['avatar'] ?? ''}'.trim();
    if (avatar.isEmpty) {
      final picList = json['picList'];
      if (picList is List && picList.isNotEmpty) {
        final first = picList.first;
        if (first is Map) {
          avatar = '${first['content'] ?? first['url'] ?? ''}'.trim();
        } else if (first is String) {
          avatar = first.trim();
        }
      }
    }
    final genderRaw = '${json['gender'] ?? ''}'.trim().toLowerCase();
    final isMale = switch (genderRaw) {
      'female' || 'f' || '2' => false,
      'male' || 'm' || '1' => true,
      _ => true,
    };
    final hasGender = switch (genderRaw) {
      'female' || 'f' || '2' || 'male' || 'm' || '1' => true,
      _ => false,
    };
    final birthdayRaw = '${json['birthday'] ?? ''}'.trim();
    final birthday = (birthdayRaw.isEmpty ||
            birthdayRaw == 'null' ||
            birthdayRaw == '0')
        ? ''
        : birthdayRaw;
    final ageFromField = int.tryParse('${json['age'] ?? ''}');
    final age = hasGender
        ? (ageFromField ?? _ageFromBirthday(birthday))
        : 0;

    // 对齐 forya RelationType：FOLLOW=1 / FAN=2 / FRIEND=3。
    // 旧逻辑用 contains('FOLLOW') 会把 FAN/FOLLOWER 误判成「我已关注」，
    // 粉丝被标成 following 后从 Followers Tab 滤掉，出现「外面 1、里面空」。
    final resolved = _resolveRelation(json, fallback: relation);

    return FriendUser(
      id: id,
      nickname: '${json['nickname'] ?? json['nickName'] ?? ''}',
      userId: id,
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: avatar.isEmpty ? null : avatar,
      isMale: isMale,
      age: age,
      relation: resolved,
      zodiac: birthday.isEmpty ? '' : zodiacFromBirthday(birthday),
      bio: '${json['personalSignature'] ?? json['signature'] ?? ''}',
      emUsername:
          '${json['emUsername'] ?? json['emUserName'] ?? ''}'.trim(),
      hasGender: hasGender,
    );
  }

  /// 合并好友 / 关注 / 粉丝列表为带正确关系的一张图。
  static List<FriendUser> mergeGraphs({
    required List<FriendUser> friends,
    required List<FriendUser> following,
    required List<FriendUser> fans,
  }) {
    final byId = <String, FriendUser>{};

    for (final u in friends) {
      byId[u.id] = u.copyWith(relation: FriendRelation.mutual);
    }
    for (final u in following) {
      final existing = byId[u.id];
      if (existing == null) {
        byId[u.id] = u.copyWith(relation: FriendRelation.following);
      }
    }
    for (final u in fans) {
      final existing = byId[u.id];
      if (existing == null) {
        byId[u.id] = u.copyWith(relation: FriendRelation.follower);
      } else if (existing.relation == FriendRelation.following) {
        byId[u.id] = existing.copyWith(relation: FriendRelation.mutual);
      }
    }
    return byId.values.toList(growable: false);
  }

  static FriendRelation _resolveRelation(
    Map<String, dynamic> json, {
    required FriendRelation fallback,
  }) {
    final raw = json['relationType'];
    if (raw is int) {
      return switch (raw) {
        1 => FriendRelation.following,
        2 => FriendRelation.follower,
        3 => FriendRelation.mutual,
        _ => fallback,
      };
    }
    final name = '$raw'.toUpperCase().trim();
    if (name.isEmpty || name == 'NULL' || name == 'NONE' || name == '0') {
      return fallback;
    }
    // FRIEND / MUTUAL 优先于 FOLLOW 子串匹配。
    if (name == '3' ||
        name == 'FRIEND' ||
        name.endsWith('.FRIEND') ||
        name.contains('MUTUAL') ||
        name.contains('FRIEND')) {
      return FriendRelation.mutual;
    }
    // FAN 必须在 FOLLOW 之前：否则 "FOLLOWER"/"…FAN…" 会被误伤。
    if (name == '2' ||
        name == 'FAN' ||
        name.endsWith('.FAN') ||
        name == 'FOLLOWER' ||
        name.endsWith('.FOLLOWER')) {
      return FriendRelation.follower;
    }
    if (name == '1' ||
        name == 'FOLLOW' ||
        name.endsWith('.FOLLOW') ||
        name == 'FOLLOWING' ||
        name.endsWith('.FOLLOWING')) {
      return FriendRelation.following;
    }

    final followFlag = json['isFollow'] ?? json['follow'] ?? json['followed'];
    final iFollow = followFlag == true ||
        followFlag == 1 ||
        '$followFlag'.toLowerCase() == 'true';
    if (fallback == FriendRelation.follower && iFollow) {
      return FriendRelation.mutual;
    }
    if (fallback == FriendRelation.following && iFollow) {
      return FriendRelation.following;
    }
    return fallback;
  }

  static int _ageFromBirthday(String birthday) {
    final birth = parseBirthday(birthday);
    if (birth == null) return 0;
    final now = DateTime.now();
    var age = now.year - birth.year;
    if (now.month < birth.month ||
        (now.month == birth.month && now.day < birth.day)) {
      age -= 1;
    }
    return age.clamp(0, 120);
  }
}
