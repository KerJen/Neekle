import 'package:flutter/material.dart';

import '../colors.dart';

class LoadingIndicator extends StatelessWidget {
  final double height;
  final double width;

  const LoadingIndicator({
    super.key,
    this.height = 24,
    this.width = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: currentColorScheme(context).onSurface,
        ),
      ),
    );
  }
}
