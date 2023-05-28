import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/const.dart';
import '../../core/ui/colors.dart';
import '../../core/ui/kit/bouncing_gesture_detector.dart';
import '../../core/ui/kit/image.dart';
import '../../core/ui/router/router.dart';
import '../../core/ui/text_styles.dart';
import '../../domain/assets/entity/asset_entity.dart';

class AssetItem extends StatelessWidget {
  final AssetEntity asset;

  const AssetItem({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingGestureDetector(
      onTap: () async {
        context.router.push(AssetRoute(assetId: asset.id));
      },
      child: Row(
        children: [
          AppImage(
            height: 56,
            width: 94,
            borderRadius: BorderRadius.circular(8),
            image: NetworkImage(asset.coverUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              asset.title,
              style: large.copyWith(color: currentColorScheme(context).onBackground),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            ethereumIcon,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            asset.price.toString(),
            style: large.copyWith(color: currentColorScheme(context).onBackground, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
