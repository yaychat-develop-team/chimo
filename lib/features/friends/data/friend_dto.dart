import '../../../core/constants/app_assets.dart';
import '../../../core/network/api_client.dart';
import '../../../core/utils/zodiac.dart';
import '../../../shared/models/friend_user.dart';

/// Maps `/user-relation/search-*` JSON into [FriendUser].
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

  static FriendUser fromUserMap(
    Map<String, dynamic> json, {
    required FriendRelation relation,
  }) {
    final id = '${json['id'] ?? ''}';
    final avatar = '${json['avatar'] ?? ''}';
    final genderRaw = '${json['gender'] ?? ''}'.toLowerCase();
    final isMale = switch (genderRaw) {
      'female' || 'f' || '2' => false,
      _ => true,
    };
    final birthday = '${json['birthday'] ?? ''}';
    final ageFromField = int.tryParse('${json['age'] ?? ''}');
    final age = ageFromField ?? _ageFromBirthday(birthday);

    final relationRaw = '${json['relationType'] ?? ''}'.toUpperCase();
    final isFollow = json['isFollow'] == true ||
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
      zodiac: zodiacFromBirthday(birthday.isEmpty ? '1995-01-01' : birthday),
      bio: '${json['personalSignature'] ?? json['signature'] ?? ''}',
    );
  }

  /// Merge friends / following / fans lists into one graph with correct relations.
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
