import '../network/api_client.dart';
import '../network/group_dto.dart';
import '../network/network_bootstrap.dart';
import '../../shared/models/group_item.dart';
import '../../shared/models/group_member.dart';
import 'repositories.dart';

/// Loads groups from echimo `/chat/group/*` APIs.
class RemoteGroupRepository implements GroupRepository {
  RemoteGroupRepository({this.pageSize = 20});

  final int pageSize;

  List<PopularGroupItem> _popular = const [];
  List<MyGroupItem> _mine = const [];
  bool _loaded = false;

  Future<void> refresh() async {
    final api = NetworkBootstrap.api;
    final popularRes = await api.groupList(pageNum: 1, pageSize: pageSize);
    final mineRes = await api.myGroups();

    _popular = GroupDto.parseList(popularRes);
    final minePopular = GroupDto.parseList(mineRes);
    // myGroups may return the same envelope, or a bare list under data.
    if (minePopular.isEmpty && mineRes.success) {
      _mine = _parseMyGroupsFallback(mineRes);
    } else {
      _mine = [for (final g in minePopular) g.toMyGroupItem()];
    }

    // Prefer API join flags; also mark mine as joined in popular.
    final mineIds = {for (final g in _mine) g.id};
    _popular = [
      for (final g in _popular)
        g.copyWith(isJoined: g.isJoined || mineIds.contains(g.id)),
    ];
    _loaded = true;
  }

  List<MyGroupItem> _parseMyGroupsFallback(ApiResponse response) {
    final data = response.data;
    if (data is! Map) return const [];
    final list = data['groupList'] ?? data['myGroups'] ?? data['list'];
    if (list is! List) return const [];
    return [
      for (final item in list)
        if (item is Map)
          GroupDto.fromMap(Map<String, dynamic>.from(item)).toMyGroupItem(),
    ];
  }

  @override
  List<PopularGroupItem> popularGroups() {
    if (!_loaded) return const [];
    return List.unmodifiable(_popular);
  }

  @override
  List<MyGroupItem> myGroups() {
    if (!_loaded) return const [];
    return List.unmodifiable(_mine);
  }

  @override
  List<GroupMember> membersFor(String groupId) => const [];
}
