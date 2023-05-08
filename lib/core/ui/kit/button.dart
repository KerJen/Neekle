import 'package:flutter/material.dart';

import '../colors.dart';
import 'bouncing_gesture_detector.dart';

class AppButton extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  final Color? color;
  final Alignment? alignment;
  final Widget child;
  final VoidCallback? onTap;

  const AppButton({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.color,
    this.alignment,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingGestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: alignment,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color ?? currentColorScheme(context).secondaryContainer,
        ),
        child: child,
      ),
    );
  }
}
