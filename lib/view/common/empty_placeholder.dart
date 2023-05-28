import 'package:flutter/material.dart';

import '../../core/ui/colors.dart';
import '../../core/ui/text_styles.dart';

class EmptyPlaceholder extends StatelessWidget {
  final IconData icon;
  final String title;

  const EmptyPlaceholder({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 64,
          color: currentColorScheme(context).onSurface,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: larger.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
