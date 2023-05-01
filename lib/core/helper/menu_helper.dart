import 'dart:async';

import 'package:flutter/material.dart';

showPositionedPopupMenu(
  BuildContext context,
  Offset position,
  List<PopupMenuItem> items,
) {
  final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

  unawaited(
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        position & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      items: items,
    ),
  );
}
