import 'package:flutter/material.dart';

import '../colors.dart';

class DotSlider extends StatelessWidget {
  final int currentIndex;
  final int count;

  const DotSlider({
    super.key,
    this.currentIndex = 0,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: currentColorScheme(context).surface,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          count,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 8,
            width: 8,
            margin: EdgeInsets.only(right: index < count - 1 ? 8 : 0),
            decoration: BoxDecoration(
              color: index == currentIndex
                  ? currentColorScheme(context).onBackground
                  : currentColorScheme(context).onSurface,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
