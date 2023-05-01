import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'loading_indicator.dart';

class AppImage extends StatelessWidget {
  final ImageProvider image;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  const AppImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ExtendedImage(
      image: image,
      height: height,
      width: width,
      borderRadius: borderRadius,
      fit: BoxFit.cover,
      loadStateChanged: (state) {
        Widget? content;
        if (state.extendedImageLoadState == LoadState.loading) {
          content = Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: currentColorScheme(context).surface,
            ),
            child: const LoadingIndicator(),
          );
        } else if (state.extendedImageLoadState == LoadState.failed) {
          content = Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: currentColorScheme(context).surface,
            ),
            child: Column(
              children: const [
                Icon(Icons.error),
              ],
            ),
          );
        } else {
          content = state.completedWidget;
        }

        return ClipRRect(
          borderRadius: borderRadius,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: content,
          ),
        );
      },
    );
  }
}
