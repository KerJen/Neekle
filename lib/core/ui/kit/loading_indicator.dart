import 'package:flutter/material.dart';

import '../colors.dart';

class LoadingIndicator extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;

  const LoadingIndicator({
    super.key,
    this.height = 24,
    this.width = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: color ?? currentColorScheme(context).onSurface,
        ),
      ),
    );
  }
}
