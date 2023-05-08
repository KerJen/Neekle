import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'bouncing_gesture_detector.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BouncingGestureDetector(
      onTap: () async {
        context.router.pop();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: (kToolbarHeight - 32) / 2),
        decoration: BoxDecoration(
          color: currentColorScheme(context).surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          Icons.arrow_back,
          color: currentColorScheme(context).onSurface,
        ),
      ),
    );
  }
}
