import 'package:flutter/material.dart';

import '../ui/colors.dart';

class BottomSheetHelper {
  static Future<T?> show<T>(
    BuildContext context,
    Widget Function(BuildContext context, EdgeInsets padding) builder, {
    Color? backgroundColor,
    bool useRootNavigator = true,
    bool isScrollControlled = false,
    EdgeInsets padding = EdgeInsets.zero,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      backgroundColor: backgroundColor ?? currentColorScheme(context).background,
      enableDrag: enableDrag,
      barrierColor: currentColorScheme(context).shadow.withOpacity(0.4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  height: 36,
                  alignment: Alignment.center,
                  child: Container(
                    height: 6,
                    width: 32,
                    decoration: BoxDecoration(
                      color: currentColorScheme(context).onBackground.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: padding,
                child: builder(context, padding),
              ),
            ],
          ),
        );
      },
    );
  }
}
