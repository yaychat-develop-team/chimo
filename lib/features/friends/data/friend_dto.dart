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

    final relationRaw = '${json['relationType'] ?? ''}'.toUpperCase();
    final followFlag = json['isFollow'] ?? json['follow'] ?? json['followed'];
    final isFollow = followFlag == true ||
        followFlag == 1 ||
        '$followFlag'.toLowerCase() == 'true' ||
        relationRaw.contains('FOLLOW') ||
        relationRaw.contains('FRIEND') ||
        relationRaw.contains('MUTUAL');
    final resolved = switch (relation) {
      FriendRelation.mutual => FriendRelation.mutual,
      FriendRelation.following => FriendRelation.following,
      FriendRelation.follower =>
        isFollow ? FriendRelation.following : FriendRelation.follower,
    };

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

  static int _ageFromBirthday(String birthday) {
    final birth = DateTime.tryParse(birthday);
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
