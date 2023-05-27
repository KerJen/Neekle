import 'package:flutter/material.dart';

import '../ui/colors.dart';

class PopupHelper {
  static Future<T?> show<T>(
    BuildContext context,
    Widget child, {
    Color? backgroundColor,
    EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 16),
    bool dismissable = true,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      barrierDismissible: dismissable,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: const BorderRadius.all(Radius.circular(16))),
        insetPadding: insetPadding,
        backgroundColor: backgroundColor ?? currentColorScheme(context).background,
        child: child,
      ),
    );
  }
}
