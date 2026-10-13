import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_assets.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils/text_fmt.dart';
import '../../../common/utils/time_fmt.dart';
import '../../../common/widgets/app_scaffold.dart';
import '../../../common/models/server_client/user.pb.dart';
import '../../../common/widgets/app_image.dart';
import '../logic/visits_logic.dart';

/// Me → 访客：谁看过我的资料列表（`GET /user-relation/viewedBy`）。
class VisitsPage extends StatefulWidget {
  const VisitsPage({super.key});

  @override
  State<VisitsPage> createState() => _VisitsPageState();
}

class _VisitsPageState extends State<VisitsPage> {
  late final VisitsLogic logic;

  @override
  void initState() {
    super.initState();
    logic = Get.put(VisitsLogic());
  }

  @override
  void dispose() {
    if (Get.isRegistered<VisitsLogic>()) Get.delete<VisitsLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final items = logic.items.toList();
      final loading = logic.loading.value;
      final error = logic.error.value;
      return ChimoScaffold(
        title: 'Visits',
        loading: loading,
        titleStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
        body: RefreshIndicator(
          color: AppColors.primaryBright,
          onRefresh: logic.load,
          child: error != null && items.isEmpty
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 120),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Text(
                              error,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                            ),
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: () => unawaited(logic.load()),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : items.isEmpty && !loading
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    SizedBox(height: 140),
                    Center(
                      child: Text(
                        'No visitors yet',
                        style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 4, bottom: 24),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _VisitTile(
                      item: item,
                      onTap: () => unawaited(logic.open(item)),
                      onDelete: () => unawaited(logic.remove(item)),
                    );
                  },
                ),
        ),
      );
    });
  }
}

class _VisitTile extends StatelessWidget {
  const _VisitTile({required this.item, required this.onTap, required this.onDelete});

  final ViewedByItem item;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 74,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
            child: Row(
              children: [
                AppImage.avatar(item.avatar, fallbackAsset: AppAssets.avatarPlace, size: 50),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.nickname,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${TimeFmt.recentAgo(item.lastViewTimestamp.toInt())} visited you',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            width: 0.5,
                            height: 10,
                            color: AppColors.textGrayD5,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                          ),
                          Text(
                            TextFmt.times(item.viewCnt),
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                  icon: AppImage(AppAssets.msgDelete, width: 20, height: 20, fit: BoxFit.contain),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
