import 'package:flutter/material.dart';

import '../colors.dart';
import 'bouncing_gesture_detector.dart';

class AppButton extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final Color? color;
  final Widget child;
  final VoidCallback? onTap;

  const AppButton({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.color,
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
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color ?? currentColorScheme(context).secondaryContainer,
        ),
        child: child,
      ),
    );
  }
}
