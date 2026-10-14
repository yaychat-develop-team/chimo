import 'package:flutter/material.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/widgets/app_image.dart';
import '../../model/room_message.dart';

/// 座驾小图和昵称之间的身份标。
class RoomSenderTagsView extends StatelessWidget {
  const RoomSenderTagsView({super.key, required this.tags, required this.name, this.carIcon = ''});

  final RoomSenderTags tags;
  final String name;
  final String carIcon;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (!tags.secret && carIcon.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: AppImage(carIcon, width: 24, height: 14, fit: BoxFit.fill),
          ),
        if (!tags.secret) ...[
          _gender(tags.gender),
          _icon(tags.novaIcon),
          _icon(tags.vipIcon),
          _chip(tags.carLevel),
          _icon(tags.knightIcon),
          _chip(tags.jobLabel),
          if (tags.robot) _chip('Bot'),
          _chip(tags.newer),
          for (final icon in tags.tagIcons) _icon(icon),
          _relation(),
        ],
        _name(),
      ],
    );
  }

  Widget _gender(String gender) {
    final value = gender.trim().toLowerCase();
    if (value.isEmpty) return const SizedBox.shrink();
    final male = value == 'male';
    return Container(
      height: 16,
      margin: const EdgeInsets.only(right: 4, top: 3, bottom: 3),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: male ? AppColors.roomMale : AppColors.roomFemale,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(male ? Icons.male : Icons.female, size: 12, color: AppColors.textPrimary),
    );
  }

  Widget _icon(String url) {
    final src = url.trim();
    if (src.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: AppImage(src, height: 22, fit: BoxFit.fitHeight),
    );
  }

  Widget _chip(String label) {
    final text = label.trim();
    if (text.isEmpty) return const SizedBox.shrink();
    return Container(
      height: 22,
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.roomTag,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.textPrimary, fontSize: 10, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _relation() {
    final src = tags.relationIcon.trim();
    if (src.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: SizedBox(
        height: 22,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            AppImage(src, height: 22, fit: BoxFit.fitHeight),
            if (tags.relationName.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(left: tags.relationInset.toDouble()),
                child: SizedBox(
                  width: 30,
                  child: Text(
                    tags.relationName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _name() {
    final label = name.trim();
    if (label.isEmpty) return const SizedBox.shrink();
    final style = TextStyle(
      color: AppColors.textPrimary,
      fontSize: 12,
      height: 1.2,
      fontWeight: tags.nameColors.isEmpty ? FontWeight.w400 : FontWeight.w500,
    );
    final text = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 80),
      child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: style),
    );
    final colors = tags.nameColors.map(_parseColor).whereType<Color>().toList();
    if (colors.isEmpty) return text;
    if (colors.length == 1) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 80),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: style.copyWith(color: colors.first),
        ),
      );
    }
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(colors: colors).createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: text,
    );
  }

  Color? _parseColor(String raw) {
    var hex = raw.trim();
    if (hex.startsWith('#')) hex = hex.substring(1);
    if (hex.length == 6) hex = 'FF$hex';
    if (hex.length != 8) return null;
    final value = int.tryParse(hex, radix: 16);
    if (value == null) return null;
    return Color(value);
  }
}
