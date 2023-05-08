import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';

import '../colors.dart';
import '../text_styles.dart';
import 'bouncing_gesture_detector.dart';

class AppTags extends StatelessWidget {
  final List<String> tags;
  final Function(int index)? onRemove;

  const AppTags({
    super.key,
    required this.tags,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Tags(
      itemCount: tags.length,
      alignment: WrapAlignment.start,
      runSpacing: 8,
      itemBuilder: (index) {
        return BouncingGestureDetector(
          onTap: () {
            onRemove?.call(index);
          },
          child: Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: currentColorScheme(context).secondaryContainer,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tags[index],
                  style: medium.copyWith(color: currentColorScheme(context).primary),
                ),
                if (onRemove != null) ...[
                  const SizedBox(width: 8),
                  Icon(
                    Icons.close,
                    size: 16,
                    color: currentColorScheme(context).onPrimary,
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
