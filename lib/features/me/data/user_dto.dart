import '../../../core/constants/app_assets.dart';
import '../../../core/network/api_client.dart';
import '../../../core/utils/zodiac.dart';
import '../../../shared/models/chat_user_profile.dart';
import '../models/me_models.dart';

/// 将 `/user/info` JSON 映射为 [MeProfile] / [ChatUserProfile]。
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
    final genderRaw = '${json['gender'] ?? ''}'.trim().toLowerCase();
    // 未设置 / 未知不要默认成 Male（跳过引导后会误显示假资料）。
    final gender = switch (genderRaw) {
      'female' || 'f' || '2' => 'Female',
      'male' || 'm' || '1' => 'Male',
      '0' || 'unknown' || 'null' || '' => '',
      _ => '',
    };

    final signature =
        '${json['personalSignature'] ?? json['signature'] ?? json['desc'] ?? ''}';

    final email = '${json['email'] ?? ''}'.trim();
    final birthdayRaw = '${json['birthday'] ?? ''}'.trim();
    final birthday = (birthdayRaw.isEmpty ||
            birthdayRaw == 'null' ||
            birthdayRaw == '0')
        ? ''
        : birthdayRaw;

    return MeProfile(
      displayName: '${json['nickname'] ?? json['nickName'] ?? ''}',
      userId: '${json['id'] ?? ''}',
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: avatar.isEmpty ? null : avatar,
      email: email,
      friends: _asInt(json['friendNum']),
      fans: _asInt(json['fanNum']),
      follows: _asInt(json['followNum']),
      visitors: _asInt(json['viewNum']),
      gender: gender,
      birthday: birthday,
      signature: signature,
      height: _asIntOrNull(json['height']),
      weight: _asIntOrNull(json['weight']),
      tags: _parseTags(json['makeFriendsLabel']),
      vipLevel: _asInt(json['vipLevel']),
      experience: _asInt(json['experience'] ?? json['exp']),
      moreExpForNextLevel: _asInt(
        json['moreExpForNextLevel'] ?? json['moreExp'],
      ),
      totalExperience: _asInt(
        json['totalExperience'] ?? json['totalExp'],
      ),
      momentUrls: _parsePicUrls(json['picList']),
      voiceSeconds: _asIntOrNull(json['voiceDuration']),
      voiceUrl: () {
        final v = '${json['voice'] ?? ''}'.trim();
        return v.isEmpty ? null : v;
      }(),
      vipIconUrl: _parseVipSmallIcon(json),
      cardDynamicResource:
          '${json['cardDynamicResource'] ?? json['card_dynamic_resource'] ?? ''}'
              .trim(),
    );
  }

  static ChatUserProfile chatFromUserMap(Map<String, dynamic> json) {
    final id = '${json['id'] ?? ''}';
    final avatar = '${json['avatar'] ?? ''}';
    final genderRaw = '${json['gender'] ?? ''}'.toLowerCase();
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

    final onlineStatus = _asInt(json['onlineStatus']);
    final isHidden = json['isHidden'] == true ||
        json['isHidden'] == 1 ||
        '${json['isHidden'] ?? ''}' == 'true';

    return ChatUserProfile(
      id: id,
      nickname: '${json['nickname'] ?? json['nickName'] ?? ''}',
      userId: id,
      avatarAsset: AppAssets.avatarPlace,
      avatarUrl: avatar.isEmpty ? null : avatar,
      isMale: isMale,
      age: hasGender ? age : 0,
      zodiac: birthday.isEmpty ? '' : zodiacFromBirthday(birthday),
      level: _asInt(json['vipLevel'], fallback: 1),
      bio: signature,
      heightInches: _asInt(json['height']),
      weightLb: _asInt(json['weight']),
      voiceSeconds: _asIntOrNull(json['voiceDuration']),
      voiceUrl: () {
        final v = '${json['voice'] ?? ''}'.trim();
        return v.isEmpty ? null : v;
      }(),
      vipIconUrl: _parseVipSmallIcon(json),
      momentUrls: _parsePicUrls(json['picList']),
      tags: _parseTags(json['makeFriendsLabel']),
      isFollowing: isFollowing,
      inPartyName: inParty,
      isOnline: onlineStatus == 1 && !isHidden,
      emUsername: '${json['emUsername'] ?? json['emUserName'] ?? ''}'.trim(),
      cardDynamicResource:
          '${json['cardDynamicResource'] ?? json['card_dynamic_resource'] ?? ''}'
              .trim(),
      hasGender: hasGender,
    );
  }

  /// Forya UserLevWidget：仅当 `icons.smallIcon` 非空时展示。
  static String? _parseVipSmallIcon(Map<String, dynamic> json) {
    final icons = json['icons'] ?? json['vipIcons'];
    if (icons is Map) {
      final small = '${icons['smallIcon'] ?? icons['small_icon'] ?? ''}'.trim();
      if (small.isNotEmpty) return small;
    }
    final flat = '${json['vipLevelIcon'] ?? json['smallIcon'] ?? ''}'.trim();
    return flat.isEmpty ? null : flat;
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
        // AuditItem: { content, ok, ... } — 待审核项（ok:false）也展示。
        final content =
            '${item['content'] ?? item['url'] ?? item['value'] ?? ''}'.trim();
        if (content.isNotEmpty) urls.add(content);
      }
    }
    // 去重并保持顺序
    final seen = <String>{};
    return [
      for (final u in urls)
        if (seen.add(u)) u,
    ];
  }

  static int _asInt(Object? value, {int fallback = 0}) {
    if (value is int) return value;
    return int.tryParse('$value') ?? fallback;
  }

  static int? _asIntOrNull(Object? value) {
    if (value == null) return null;
    final n = value is int ? value : int.tryParse('$value');
    // 服务端 0 表示未设置（对齐 forya height/weight 空态）。
    if (n == null || n == 0) return null;
    return n;
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
