import '../../../core/constants/app_assets.dart';
import '../../../core/network/api_client.dart';
import '../../../core/utils/zodiac.dart';
import '../../../shared/models/chat_user_profile.dart';
import '../models/me_models.dart';

/// Maps `/user/info` JSON into [MeProfile] / [ChatUserProfile].
abstract final class UserDto {
  static MeProfile? parseProfile(ApiResponse response) {
    final user = _userMap(response);
    if (user == null) return null;
    return fromUserMap(user);
  }

  static ChatUserProfile? parseChatProfile(ApiResponse response) {
    final user = _userMap(response);
    if (user == null) return null;
    return chatFromUserMap(user);
  }

  static Map<String, dynamic>? _userMap(ApiResponse response) {
    if (!response.success) return null;
    final data = response.data;
    if (data is! Map) return null;
    final user = data['user'];
    if (user is Map) return Map<String, dynamic>.from(user);
    if (data.containsKey('nickname') || data.containsKey('id')) {
      return Map<String, dynamic>.from(data);
    }
    return null;
  }

  static MeProfile fromUserMap(Map<String, dynamic> json) {
    final avatar = '${json['avatar'] ?? ''}';
    final genderRaw = '${json['gender'] ?? ''}'.toLowerCase();
    final gender = switch (genderRaw) {
      'female' || 'f' || '2' => 'Female',
      'male' || 'm' || '1' => 'Male',
      _ => genderRaw.isEmpty ? 'Male' : genderRaw,
    };

    final signature =
        '${json['personalSignature'] ?? json['signature'] ?? json['desc'] ?? ''}';

    return MeProfile(
      displayName: '${json['nickname'] ?? json['nickName'] ?? ''}',
      userId: '${json['id'] ?? ''}',
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: avatar.isEmpty ? null : avatar,
      friends: _asInt(json['friendNum']),
      fans: _asInt(json['fanNum']),
      follows: _asInt(json['followNum']),
      visitors: _asInt(json['viewNum']),
      gender: gender,
      birthday: '${json['birthday'] ?? '1995-01-01'}',
      signature: signature,
      height: _asIntOrNull(json['height']),
      weight: _asIntOrNull(json['weight']),
      tags: _parseTags(json['makeFriendsLabel']),
      vipLevel: _asInt(json['vipLevel'], fallback: 1),
      momentUrls: _parsePicUrls(json['picList']),
      voiceSeconds: _asIntOrNull(json['voiceDuration']),
    );
  }

  static ChatUserProfile chatFromUserMap(Map<String, dynamic> json) {
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
    final signature =
        '${json['personalSignature'] ?? json['signature'] ?? ''}';
    final relation = '${json['relationType'] ?? ''}'.toUpperCase();
    final isFollowing = json['isFollow'] == true ||
        relation.contains('FOLLOW') ||
        relation.contains('FRIEND');

    String? inParty;
    final channel = json['currentChannel'];
    if (channel is Map) {
      final name = '${channel['title'] ?? channel['name'] ?? ''}'.trim();
      if (name.isNotEmpty) inParty = name;
    }

    return ChatUserProfile(
      id: id,
      nickname: '${json['nickname'] ?? json['nickName'] ?? ''}',
      userId: id,
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: avatar.isEmpty ? null : avatar,
      isMale: isMale,
      age: age,
      zodiac: zodiacFromBirthday(birthday.isEmpty ? '1995-01-01' : birthday),
      level: _asInt(json['vipLevel'], fallback: 1),
      bio: signature,
      momentUrls: _parsePicUrls(json['picList']),
      tags: _parseTags(json['makeFriendsLabel']),
      isFollowing: isFollowing,
      inPartyName: inParty,
    );
  }

  static List<String> _parseTags(Object? raw) {
    if (raw is! List) return const [];
    return [
      for (final item in raw)
        if ('$item'.trim().isNotEmpty) '$item'.trim(),
    ];
  }

  static List<String> _parsePicUrls(Object? raw) {
    if (raw is! List) return const [];
    final urls = <String>[];
    for (final item in raw) {
      if (item is String && item.trim().isNotEmpty) {
        urls.add(item.trim());
        continue;
      }
      if (item is Map) {
        final content = '${item['content'] ?? item['url'] ?? ''}'.trim();
        final ok = item['ok'];
        if (content.isNotEmpty && ok != false) urls.add(content);
      }
    }
    return urls;
  }

  static int _asInt(Object? value, {int fallback = 0}) {
    if (value is int) return value;
    return int.tryParse('$value') ?? fallback;
  }

  static int? _asIntOrNull(Object? value) {
    if (value == null) return null;
    if (value is int) return value;
    return int.tryParse('$value');
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
