import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

import 'app_log.dart';

/// 相册权限的三态：调用方要能区分「这次拒了」和「以后都别问了」，
/// 才能决定是弹提示还是引导去设置页。
enum MediaPermission {
  granted,

  /// iOS「选中的照片」：能访问但只有用户挑过的那些。
  limited,

  /// 这次拒了，下次还能再问。
  denied,

  /// 永久拒绝 / 受家长控制：只能去设置页开。
  permanentlyDenied;

  bool get hasAccess => this == granted || this == limited;
}

/// 全项目唯一的拍照 / 选图 / 相册权限出口。
///
/// **工具不含业务**：这里不知道头像要裁方、聊天图要不要原图 ——
/// 那些由调用方传参。
abstract final class MediaPicker {
  /// 压缩策略统一在这里。`original` 为 true 时按原图发（用户勾了「原图」）。
  static const int _quality = 85;
  static const double _maxWidth = 1920;

  static const _albumPermissionOption = PermissionRequestOption(
    androidPermission: AndroidPermission(
      type: RequestType.image,
      mediaLocation: false,
    ),
    iosAccessLevel: IosAccessLevel.readWrite,
  );

  /// 拍照。
  static Future<XFile?> takePhoto({bool original = false}) =>
      _pickOne(ImageSource.camera, original: original);

  /// 系统相册单选。
  static Future<XFile?> pickImage({bool original = false}) =>
      _pickOne(ImageSource.gallery, original: original);

  static Future<XFile?> _pickOne(
    ImageSource source, {
    required bool original,
  }) async {
    return ImagePicker().pickImage(
      source: source,
      imageQuality: original ? 100 : _quality,
      maxWidth: _maxWidth,
    );
  }

  /// 系统相册多选。压缩参数与单选一致。
  static Future<List<XFile>> pickImages({bool original = false}) async {
    return ImagePicker().pickMultiImage(
      imageQuality: original ? 100 : _quality,
      maxWidth: _maxWidth,
    );
  }

  /// 申请相册权限（自建相册面板用）。
  static Future<MediaPermission> ensureAlbumPermission() async {
    final state = await PhotoManager.requestPermissionExtend(
      requestOption: _albumPermissionOption,
    );
    return switch (state) {
      PermissionState.authorized => MediaPermission.granted,
      PermissionState.limited => MediaPermission.limited,
      PermissionState.denied => MediaPermission.denied,
      PermissionState.restricted ||
      PermissionState.notDetermined => MediaPermission.permanentlyDenied,
    };
  }

  /// 跳系统设置页（权限被永久拒绝时）。
  static Future<void> openSystemSettings() => PhotoManager.openSetting();

  /// 相册分页读取（自建面板用）。返回空列表 = 相册里没有图。
  static Future<List<AssetEntity>> loadAlbumPage({
    int page = 0,
    int size = 60,
  }) async {
    final paths = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
      filterOption: FilterOptionGroup(
        imageOption: const FilterOption(
          sizeConstraint: SizeConstraint(ignoreSize: true),
        ),
        orders: [
          const OrderOption(type: OrderOptionType.createDate, asc: false),
        ],
      ),
    );
    if (paths.isEmpty) return const [];
    return paths.first.getAssetListPaged(page: page, size: size);
  }

  /// 把选中的文件立刻拷进沙盒，返回新路径；失败返回 `null`。
  ///
  /// **别省这一步**：iOS PHPicker 返回的文件在系统的
  /// 临时目录里，稍后再读可能已经被清掉 —— 表现是「选完图等几秒再发就失败」。
  /// 必须当场读字节写进 App 沙盒。
  static Future<String?> persistToSandbox(
    XFile file, {
    String folder = 'picked_photos',
  }) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final target = Directory('${dir.path}/$folder');
      if (!await target.exists()) await target.create(recursive: true);
      final destPath =
          '${target.path}/${DateTime.now().microsecondsSinceEpoch}.jpg';
      final bytes = await file.readAsBytes();
      if (bytes.isEmpty) return null;
      await File(destPath).writeAsBytes(bytes, flush: true);
      return destPath;
    } catch (error) {
      AppLog.w('MediaPicker persist to sandbox failed', error: error);
      return null;
    }
  }
}
